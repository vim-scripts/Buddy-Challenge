" +-----------------------------------------------------------------------------+
" | BUDDY CHALLENGE SCRIPT /win                                                 |
" +-----------------------------------------------------------------------------+
" | Inspired by #php in EFNET who is full of thick idiots who think they are    |
" | the business and enforce this by telling you how clever they are by         |
" | throwing names around and using witty one liners.  To use it install it in  |
" | your plugin folder, restart vim and cursor over to a word you are not sure  |
" | of and press Alt-i.  Make it personal by adding a line in your _vimrc to    |
" | set the buddyChallenge_yourname var e.g                                     |
" | let buddyChallenge_yourname = "Paul"                                        |
" +-----------------------------------------------------------------------------+
" | TUE  22ND JUL 2014:  1.8                                                    |
" |                      First version with comment headers.                    |
" +-----------------------------------------------------------------------------+

let lastRandom = localtime()

function! RandomHelper()
let rnd = localtime() % 0x10000
let rnd = (rnd * 31421 + 6927) % 0x10000
return rnd
endfunction

function! Random(max)
if localtime() == g:lastRandom
	exe "sleep ".((RandomHelper()%16)+10)."m"
endif
let rnd = RandomHelper()
let rnd = rnd % a:max
let g:lastRandom = localtime()
return rnd
endfun

function RandomUnique(prev, max)
	let result = a:prev
	let result += Random(a:max-1)
	if result>(a:max-1)
		let result -= (a:max-1)
	endif
	return result
endfunction

" witty one word close
let wittyOneWordCloseMax      = 11
let thisWittyOneWordClose     = Random(wittyOneWordCloseMax)

" praise worthy term
let praiseWorthyTermMax       = 15
let thisPraiseworthyTerm      = Random(praiseWorthyTermMax)

" cool alternative term
let coolAlternativeTermMax    = 15
let thisCoolAlternativeTerm   = Random(coolAlternativeTermMax)

" good person term
let goodPersonTermMax         = 27
let thisGoodPersonTerm        = Random(goodPersonTermMax)

" term meaning better
let termMeaningBetterMax      = 11
let thisTermMeaningBetter     = Random(termMeaningBetterMax)

" insult term
let insultTermMax             = 18
let thisInsultTerm            = Random(insultTermMax)

" term meaning suck
let termMeaningSuckMax        = 3
let thisTermMeaningSuck       = Random(termMeaningSuckMax)

" term meaning super suck
let termMeaningSuperSuckMax   = 3
let thisTermMeaningSuperSuck  = Random(termMeaningSuperSuckMax)

" intelligent put down
let intelligentPutDownMax     = 29
let thisIntelligentPutDown    = Random(intelligentPutDownMax)

" term meaning you
let termMeaningYouMax	      = 29
let thisTermMeaningYou	      = Random(termMeaningYouMax)

" big town
let bigTownMax                = 38
let thisBigTown	              = Random(bigTownMax)

" credible academic
let credibleAcademicMax       = 11
let thisCredibleAcademic      = Random(credibleAcademicMax)

" credible name
let credibleNameMax           = 23
let thisCredibleName          = Random(credibleNameMax)

" company name
let companyNameMax            = 26
let thisCompanyName           = Random(companyNameMax)

" credible skill
let credibleSkillMax          = 35
let thisCredibleSkill         = Random(credibleSkillMax)

" insult
let insultMax                 = 25
let thisInsult                = Random(insultMax)

" insult cap
let insultCount               = 0

function SetPersonalName()
	" make it extra personal, choose your own
	if exists("g:buddyChallenge_yourname")
		let g:insertYourNameHere = g:buddyChallenge_yourname
	else
		let g:insertYourNameHere = "pls add: let buddyChallenge_yourname = '{your name}' to your _vimrc"
	endif
endfunction

function NextWittyOneWordClose()
	if g:thisWittyOneWordClose == 0
		let result = "wtf"
	endif
	if g:thisWittyOneWordClose == 1
		let result = "rofl"
	endif
	if g:thisWittyOneWordClose == 2
		let result = "lmao"
	endif
	if g:thisWittyOneWordClose == 3
		let result = "zomg"
	endif
	if g:thisWittyOneWordClose == 4
		let result = "zomfg"
	endif
	if g:thisWittyOneWordClose == 5
		let result = "LOL"
	endif
	if g:thisWittyOneWordClose == 6
		let result = "lol lol lol"
	endif
	if g:thisWittyOneWordClose == 7
		let result = "sheeeee-eeeeet"
	endif
	if g:thisWittyOneWordClose == 8
		let result = "???"
	endif
	if g:thisWittyOneWordClose == 9
		let result = "lol"
	endif
	if g:thisWittyOneWordClose == 10
		let result = "srsly"
	endif
	let g:thisWittyOneWordClose = RandomUnique(g:thisWittyOneWordClose, g:wittyOneWordCloseMax)
	return result
endfunction

function NextPraiseWorthyTerm()
	if g:thisPraiseworthyTerm == 0
		let result = "quite cool"
	endif
	if g:thisPraiseworthyTerm == 1
		let result = "cooler"
	endif
	if g:thisPraiseworthyTerm == 2
		let result = "kind of the thing"
	endif
	if g:thisPraiseworthyTerm == 3
		let result = "seen as professional"
	endif
	if g:thisPraiseworthyTerm == 4
		let result = "where it's at"
	endif
	if g:thisPraiseworthyTerm == 5
		let result = "cool"
	endif
	if g:thisPraiseworthyTerm == 6
		let result = "more respectable"
	endif
	if g:thisPraiseworthyTerm == 7
		let result = "the thing"
	endif
	if g:thisPraiseworthyTerm == 8
		let result = "something"
	endif
	if g:thisPraiseworthyTerm == 9
		let result = "something new"
	endif
	if g:thisPraiseworthyTerm == 10
		let result = "the way to go"
	endif
	if g:thisPraiseworthyTerm == 11
		let result = "unbelieveable"
	endif
	if g:thisPraiseworthyTerm == 12
		let result = "the dog's"
	endif
	if g:thisPraiseworthyTerm == 13
		let result = "the bollox"
	endif
	if g:thisPraiseworthyTerm == 14
		let result = "improves your skills as a professional"
	endif
	let g:thisPraiseworthyTerm = RandomUnique(g:thisPraiseworthyTerm, g:praiseWorthyTermMax)
	return result
endfunction

function NextCoolAlternative(theItem)
	if g:thisCoolAlternativeTerm == 0
		let result = a:theItem." 2"
	endif
	if g:thisCoolAlternativeTerm == 1
		let result = a:theItem." 'Corba Objects'"
	endif
	if g:thisCoolAlternativeTerm == 2
		let result = a:theItem." 3.0"
	endif
	if g:thisCoolAlternativeTerm == 3
		let result = a:theItem." 6.0"
	endif
	if g:thisCoolAlternativeTerm == 4
		let result = a:theItem." 7.0" 
	endif
	if g:thisCoolAlternativeTerm == 5
		let result = a:theItem." 7.0.1"
	endif
	if g:thisCoolAlternativeTerm == 6
		let result = a:theItem." 9.0"
	endif
	if g:thisCoolAlternativeTerm == 7
		let result = a:theItem." 'Executive Pro Edition'"
	endif
	if g:thisCoolAlternativeTerm == 8
		let result = a:theItem." SE"
	endif
	if g:thisCoolAlternativeTerm == 9
		let result = a:theItem." 'Enterprise Server'"
	endif
	if g:thisCoolAlternativeTerm == 10
		let result = a:theItem." 'Enterprise Objects'"
	endif
	if g:thisCoolAlternativeTerm == 11
		let result = a:theItem." 'Red Sky Sierra'"
	endif
	if g:thisCoolAlternativeTerm == 12
		let result = a:theItem." 'Lilac Lashes'"
	endif
	if g:thisCoolAlternativeTerm == 13
		let result = a:theItem." 'Redundant Array'"
	endif
	if g:thisCoolAlternativeTerm == 14
		let result = a:theItem." with ".NextCredibleSkill()
	endif
	let g:thisCoolAlternativeTerm = RandomUnique(g:thisCoolAlternativeTerm, g:coolAlternativeTermMax)
	return result
endfunction

function NextGoodPersonTerm()
	if g:thisGoodPersonTerm == 0
		let result = "good"
	endif
	if g:thisGoodPersonTerm == 1
		let result = "great"
	endif
	if g:thisGoodPersonTerm == 2
		let result = "pretty good"
	endif
	if g:thisGoodPersonTerm == 3
		let result = "awesome"
	endif
	if g:thisGoodPersonTerm == 4
		let result = "pretty awesome"
	endif
	if g:thisGoodPersonTerm == 5
		let result = "shit hot"
	endif
	if g:thisGoodPersonTerm == 6
		let result = "pretty clever"
	endif
	if g:thisGoodPersonTerm == 7
		let result = "the shit"
	endif
	if g:thisGoodPersonTerm == 8
		let result = "the dons"
	endif
	if g:thisGoodPersonTerm == 9
		let result = "the dog's"
	endif
	if g:thisGoodPersonTerm == 10
		let result = "very intelligent"
	endif
	if g:thisGoodPersonTerm == 11
		let result = "very clever"
	endif
	if g:thisGoodPersonTerm == 12
		let result = "quite ".NextPraiseWorthyTerm()
	endif
	if g:thisGoodPersonTerm == 13
		let result = "a bit ".NextPraiseWorthyTerm()." you know"
	endif
	if g:thisGoodPersonTerm == 14
		let result = "a bit ".NextPraiseWorthyTerm()
	endif
	if g:thisGoodPersonTerm == 15
		let result = "the man"
	endif
	if g:thisGoodPersonTerm == 16
		let result = "a very ".NextPraiseWorthyTerm()." man"
	endif
	if g:thisGoodPersonTerm == 17
		let result = "an ".NextPraiseWorthyTerm()." man"
	endif
	if g:thisGoodPersonTerm == 18
		let result = "damned ".NextPraiseWorthyTerm()
	endif
	if g:thisGoodPersonTerm == 19
		let result = "rock hard"
	endif
	if g:thisGoodPersonTerm == 20
		let result = "the best"
	endif
	if g:thisGoodPersonTerm == 21
		let result = "among the top 10 in the coutry"
	endif
	if g:thisGoodPersonTerm == 22
		let result = "one of the best in the country"
	endif
	if g:thisGoodPersonTerm == 23
		let result = "definitely one of the best"
	endif
	if g:thisGoodPersonTerm == 24
		let result = "considered one of the greatest"
	endif
	if g:thisGoodPersonTerm == 25
		let result = "the if not definitely at least one of the best"
	endif
	if g:thisGoodPersonTerm == 26
		let result = "considered the best"
	endif
	let g:thisGoodPersonTerm = RandomUnique(g:thisGoodPersonTerm, g:goodPersonTermMax)
	return result
endfunction

function NextTermMeaningBetter()
	if g:thisTermMeaningBetter == 0
		let result = "better"
	endif
	if g:thisTermMeaningBetter == 1
		let result = "stronger"
	endif
	if g:thisTermMeaningBetter == 2
		let result = "sharper"
	endif
	if g:thisTermMeaningBetter == 3
		let result = "cooler"
	endif
	if g:thisTermMeaningBetter == 4
		let result = "more tuned in"
	endif
	if g:thisTermMeaningBetter == 5
		let result = "more tuned"
	endif
	if g:thisTermMeaningBetter == 6
		let result = "more focussed"
	endif
	if g:thisTermMeaningBetter == 7
		let result = "more in touch"
	endif
	if g:thisTermMeaningBetter == 8
		let result = "more developed"
	endif
	if g:thisTermMeaningBetter == 9
		let result = "superior"
	endif
	if g:thisTermMeaningBetter == 10
		let result = "far superior"
	endif
	let g:thisTermMeaningBetter = RandomUnique(g:thisTermMeaningBetter, g:termMeaningBetterMax)
	return result
endfunction

function NextInsultTerm()
	let g:insultCount = g:insultCount + 1
	if g:insultCount > 4
		let g:thisInsultTerm = RandomUnique(g:thisInsultTerm, g:insultTermMax)
		return "#!@***"
	endif
	if g:thisInsultTerm == 0
		let result = "crap"
	endif
	if g:thisInsultTerm == 1
		let result = "shit"
	endif
	if g:thisInsultTerm == 2
		let result = "shite"
	endif
	if g:thisInsultTerm == 3
		let result = "trite"
	endif
	if g:thisInsultTerm == 4
		let result = "faff"
	endif
	if g:thisInsultTerm == 5
		let result = "shite"
	endif
	if g:thisInsultTerm == 6
		let result = "bollox"
	endif
	if g:thisInsultTerm == 7
		let result = "trash"
	endif
	if g:thisInsultTerm == 8
		let result = "rubbish"
	endif
	if g:thisInsultTerm == 9
		let result = "bullshit"
	endif
	if g:thisInsultTerm == 10
		let result = "bull"
	endif
	if g:thisInsultTerm > 10
		let g:thisInsultTerm = RandomUnique(g:thisInsultTerm, g:insultTermMax)
		let resultA = NextInsultTerm()
		let g:thisInsultTerm = RandomUnique(g:thisInsultTerm, g:insultTermMax)
		let resultB = NextInsultTerm()
		let result = resultA." ".resultB
	endif
	let g:thisInsultTerm = RandomUnique(g:thisInsultTerm, g:insultTermMax)
	return result
endfunction


function NextTermMeaningSuck()
	if g:thisTermMeaningSuck == 0
		let result = "suck"
	endif
	if g:thisTermMeaningSuck == 1
		let result = "fail"
	endif
	if g:thisTermMeaningSuck == 2
		let result = "blow"
	endif
	let g:thisTermMeaningSuck = RandomUnique(g:thisTermMeaningSuck, g:termMeaningSuckMax)
	return result
endfunction

function NextTermMeaningSuperSuck()
	if g:thisTermMeaningSuperSuck == 0
		let result = "seriously ".NextTermMeaningSuck()
	endif
	if g:thisTermMeaningSuperSuck == 1
		let result = NextTermMeaningSuck()." hard"
	endif
	if g:thisTermMeaningSuperSuck == 2
		let result = NextTermMeaningSuck()." so much"
	endif
	let g:thisTermMeaningSuperSuck = RandomUnique(g:thisTermMeaningSuperSuck, g:termMeaningSuperSuckMax)
	return result
endfunction

function NextIntelligentPutDown()
	if g:thisIntelligentPutDown == 0
		let result = "frowned-upon"
	endif
	if g:thisIntelligentPutDown == 1
		let result = "hardly recommended"
	endif
	if g:thisIntelligentPutDown == 1
		let result = "not aproved of"
	endif
	if g:thisIntelligentPutDown == 2
		let result = "considered down-market"
	endif
	if g:thisIntelligentPutDown == 3
		let result = "wrong"
	endif
	if g:thisIntelligentPutDown == 4
		let result = "believed to be wrong"
	endif
	if g:thisIntelligentPutDown == 5
		let result = "believed inappropriate"
	endif
	if g:thisIntelligentPutDown == 6
		let result = "believed indecent"
	endif
	if g:thisIntelligentPutDown == 7
		let result = "believed unsavoury"
	endif
	if g:thisIntelligentPutDown == 8
		let result = "believed unhealthy"
	endif
	if g:thisIntelligentPutDown == 9
		let result = "believed unfriendly"
	endif
	if g:thisIntelligentPutDown == 10
		let result = "believed unfair"
	endif
	if g:thisIntelligentPutDown == 11
		let result = "not thought of in a good way"
	endif
	if g:thisIntelligentPutDown == 12
		let result = "thought of in a bad way"
	endif
	if g:thisIntelligentPutDown == 13
		let result = "believed anti-social"
	endif
	if g:thisIntelligentPutDown == 14
		let result = "believed depressing"
	endif
	if g:thisIntelligentPutDown == 15
		let result = "believed un-people friendly"
	endif
	if g:thisIntelligentPutDown == 16
		let result = "seen as non-PC"
	endif
	if g:thisIntelligentPutDown == 17
		let result = "believed incorrect"
	endif
	if g:thisIntelligentPutDown == 18
		let result = "so 2005"
	endif
	if g:thisIntelligentPutDown == 19
		let result = "so 2009"
	endif
	if g:thisIntelligentPutDown == 20
		let result = "so 2010"
	endif
	if g:thisIntelligentPutDown == 21
		let result = "so 2000"
	endif
	if g:thisIntelligentPutDown == 22
		let result = "so 2003"
	endif
	if g:thisIntelligentPutDown == 23
		let result = "just ...not good"
	endif
	if g:thisIntelligentPutDown == 24
		let result = "not good ".NextTermMeaningYou()." trust me"
	endif
	if g:thisIntelligentPutDown == 25
		let result = "not really good is it"
	endif
	if g:thisIntelligentPutDown == 26
		let result = "not really good is it ".NextTermMeaningYou()
	endif
	if g:thisIntelligentPutDown == 27
		let result = "not good"
	endif
	if g:thisIntelligentPutDown == 28
		let result = "not that good to be honest"
	endif
	let g:thisIntelligentPutDown = RandomUnique(g:thisIntelligentPutDown, g:intelligentPutDownMax)
	return result
endfunction

function NextTermMeaningYou()
	call SetPersonalName()
	if g:thisTermMeaningYou == 0
		let result = g:insertYourNameHere
	endif
	if g:thisTermMeaningYou == 1
		let result = g:insertYourNameHere." dude"
	endif
	if g:thisTermMeaningYou == 2
		let result = g:insertYourNameHere." man"
	endif
	if g:thisTermMeaningYou == 3
		let result = g:insertYourNameHere." kid"
	endif
	if g:thisTermMeaningYou == 4
		let result = g:insertYourNameHere." big man"
	endif
	if g:thisTermMeaningYou == 5
		let result = "big man ".g:insertYourNameHere
	endif
	if g:thisTermMeaningYou == 6
		let result = g:insertYourNameHere." mate"
	endif
	if g:thisTermMeaningYou == 7
		let result = g:insertYourNameHere." matey"
	endif
	if g:thisTermMeaningYou == 8
		let result = g:insertYourNameHere." son"
	endif
	if g:thisTermMeaningYou == 9
		let result = "dude"
	endif
	if g:thisTermMeaningYou == 10
		let result = "buddy"
	endif
	if g:thisTermMeaningYou == 11
		let result = "man"
	endif
	if g:thisTermMeaningYou == 12
		let result = "boss"
	endif
	if g:thisTermMeaningYou == 13
		let result = "big man"
	endif
	if g:thisTermMeaningYou == 14
		let result = "mate"
	endif
	if g:thisTermMeaningYou == 15
		let result = "fella"
	endif
	if g:thisTermMeaningYou == 16
		let result = "young man"
	endif
	if g:thisTermMeaningYou == 17
		let result = "kid"
	endif
	if g:thisTermMeaningYou == 18
		let result = "matey"
	endif
	if g:thisTermMeaningYou == 19
		let result = "matey boy"
	endif
	if g:thisTermMeaningYou == 20
		let result = "geezer"
	endif
	if g:thisTermMeaningYou == 21
		let result = "bloke"
	endif
	if g:thisTermMeaningYou == 22
		let result = "feller"
	endif
	if g:thisTermMeaningYou == 23
		let result = "fellar"
	endif
	if g:thisTermMeaningYou == 24
		let result = "boy"
	endif
	if g:thisTermMeaningYou == 25
		let result = "son"
	endif
	if g:thisTermMeaningYou == 26
		let result = "brother"
	endif
	if g:thisTermMeaningYou == 27
		let result = "matey boy"
	endif
	if g:thisTermMeaningYou == 28
		let result = "chum"
	endif
	let g:thisTermMeaningYou = RandomUnique(g:thisTermMeaningYou, g:termMeaningYouMax)
	return result
endfunction

function NextBigTown()
	if g:thisBigTown == 0
		let result = "Uxbridge"
	endif
	if g:thisBigTown == 1
		let result = "New York"
	endif
	if g:thisBigTown == 2
		let result = "Langbridge"
	endif
	if g:thisBigTown == 3
		let result = "Thames Ditton"
	endif
	if g:thisBigTown == 4
		let result = "Ditton Fields"
	endif
	if g:thisBigTown == 5
		let result = "Sheffield"
	endif
	if g:thisBigTown == 6
		let result = "Nottingham"
	endif
	if g:thisBigTown == 7
		let result = "Luton"
	endif
	if g:thisBigTown == 8
		let result = "Dover"
	endif
	if g:thisBigTown == 9
		let result = "Cardiff"
	endif
	if g:thisBigTown == 10
		let result = "Ramsgate"
	endif
	if g:thisBigTown == 11
		let result = "London"
	endif
	if g:thisBigTown == 12
		let result = "Oxford"
	endif
	if g:thisBigTown == 13
		let result = "St. Ives"
	endif
	if g:thisBigTown == 14
		let result = "Peterborough"
	endif
	if g:thisBigTown == 15
		let result = "Cambridge"
	endif
	if g:thisBigTown == 16
		let result = "Duxford"
	endif
	if g:thisBigTown == 17
		let result = "Royston"
	endif
	if g:thisBigTown == 18
		let result = "Reading"
	endif
	if g:thisBigTown == 19
		let result = "Chelmsford"
	endif
	if g:thisBigTown == 20
		let result = "Sussex"
	endif
	if g:thisBigTown == 21
		let result = "West Crawley"
	endif
	if g:thisBigTown == 22
		let result = "Croydon"
	endif
	if g:thisBigTown == 23
		let result = "East Grimstead"
	endif
	if g:thisBigTown == 24
		let result = "Wolverhampton"
	endif
	if g:thisBigTown == 25
		let result = "Derby"
	endif
	if g:thisBigTown == 26
		let result = "Scarborough"
	endif
	if g:thisBigTown == 27
		let result = "Harvard"
	endif
	if g:thisBigTown == 28
		let result = "Stanford"
	endif
	if g:thisBigTown == 29
		let result = "East Sussex"
	endif
	if g:thisBigTown == 30
		let result = "West Sussex"
	endif
	if g:thisBigTown == 31
		let result = "Westminster"
	endif
	if g:thisBigTown == 32
		let result = "Westbourne"
	endif
	if g:thisBigTown == 33
		let result = "Gillingham"
	endif
	if g:thisBigTown == 34
		let result = "Colchester"
	endif
	if g:thisBigTown == 35
		let result = "Bath"
	endif
	if g:thisBigTown == 36
		let result = "Leeds"
	endif
	if g:thisBigTown == 37
		let result = "Oxford"
	endif
	let g:thisBigTown = RandomUnique(g:thisBigTown, g:bigTownMax)
	return result
endfunction

function NextCredibleAcademic(theItem)
	if g:thisCredibleAcademic == 0
		let result = NextBigTown()." University"
	endif
	if g:thisCredibleAcademic == 1
		let result = NextBigTown()." College"
	endif
	if g:thisCredibleAcademic == 2
		let result = NextBigTown()." Further Education College"
	endif
	if g:thisCredibleAcademic == 3
		let result = NextBigTown()." Technical College"
	endif
	if g:thisCredibleAcademic == 4
		let result = NextBigTown()." Arts Academy"
	endif
	if g:thisCredibleAcademic == 5
		let result = NextBigTown()." Institute of Further Education"
	endif
	if g:thisCredibleAcademic == 6
		let result = NextBigTown()." ".a:theItem." Academy"
	endif
	if g:thisCredibleAcademic == 7
		let result = NextBigTown()." ".a:theItem." College"
	endif
	if g:thisCredibleAcademic == 8
		let result = NextBigTown()." College of ".a:theItem
	endif
	if g:thisCredibleAcademic == 9
		let result = a:theItem." College in ".NextBigTown()
	endif
	if g:thisCredibleAcademic == 10
		let result = a:theItem." Technical College"
	endif
	let g:thisCredibleAcademic = RandomUnique(g:thisCredibleAcademic, g:credibleAcademicMax)
	return result
endfunction

function NextCredibleName()
	if g:thisCredibleName == 0
		let result = "Forbes"
	endif
	if g:thisCredibleName == 1
		let result = "Computer Weekly"
	endif
	if g:thisCredibleName == 2
		let result = "The Prince's Trust"
	endif
	if g:thisCredibleName == 3
		let result = "The BCS"
	endif
	if g:thisCredibleName == 4
		let result = "The Times Weekly 100"
	endif
	if g:thisCredibleName == 5
		let result = "The ".NextBigTown()." Top 100 Upcoming New Talent"
	endif
	if g:thisCredibleName == 6
		let result = "The ".NextBigTown()." Chartered Institute of IT Professionals"
	endif
	if g:thisCredibleName == 7
		let result = "The ".NextBigTown()." Academy of IT Professionals"
	endif
	if g:thisCredibleName == 8
		let result = "edSurge"
	endif
	if g:thisCredibleName == 9
		let result = "Pandodaily"
	endif
	if g:thisCredibleName == 10
		let result = "WSJ"
	endif
	if g:thisCredibleName == 11
		let result = "VB"
	endif
	if g:thisCredibleName == 12
		let result = "Smart Planet"
	endif
	if g:thisCredibleName == 13
		let result = "Hachinger Report"
	endif
	if g:thisCredibleName == 14
		let result = "Re/code"
	endif
	if g:thisCredibleName == 15
		let result = "EdTech Digest"
	endif
	if g:thisCredibleName == 16
		let result = "MNdaily"
	endif
	if g:thisCredibleName == 17
		let result = "Daily Campus"
	endif
	if g:thisCredibleName == 18
		let result = "Readwrite"
	endif
	if g:thisCredibleName == 19
		let result = "KState Collegian"
	endif
	if g:thisCredibleName == 20
		let result = "Edudemic"
	endif
	if g:thisCredibleName == 21
		let result = "Mashable"
	endif
	if g:thisCredibleName == 22
		let result = "Slashdot"
	endif
	let g:thisCredibleName = RandomUnique(g:thisCredibleName, g:credibleNameMax)
	return result
endfunction

function NextCompanyName()
	if g:thisCompanyName == 0
		let result = "Halpington IPA"
	endif
	if g:thisCompanyName == 1
		let result = "Rutherford IT"
	endif
	if g:thisCompanyName == 2
		let result = "Friston IT"
	endif
	if g:thisCompanyName == 3
		let result = "Settrington IT"
	endif
	if g:thisCompanyName == 4
		let result = "Lenthorn IT"
	endif
	if g:thisCompanyName == 5
		let result = "Halpington Miranda"
	endif
	if g:thisCompanyName == 6
		let result = "Rosedew IT"
	endif
	if g:thisCompanyName == 7
		let result = "Kelwood Imagina"
	endif
	if g:thisCompanyName == 8
		let result = "Reading IT"
	endif
	if g:thisCompanyName == 9
		let result = "Letterstone IT"
	endif
	if g:thisCompanyName == 10
		let result = "Lesbury IT"
	endif
	if g:thisCompanyName == 11
		let result = "Mitchellson IT"
	endif
	if g:thisCompanyName == 12
		let result = "Penywern IT"
	endif
	if g:thisCompanyName == 13
		let result = "Fernshaw IT"
	endif
	if g:thisCompanyName == 14
		let result = "VUE Entertainment"
	endif
	if g:thisCompanyName == 15
		let result = "Alfred McAlpine IT"
	endif
	if g:thisCompanyName == 16
		let result = "Axiom Cobradej"
	endif
	if g:thisCompanyName == 17
		let result = "Sedlescombe IT"
	endif
	if g:thisCompanyName == 18
		let result = "Gwyn IT"
	endif
	if g:thisCompanyName == 19
		let result = "IT Basements"
	endif
	if g:thisCompanyName == 20
		let result = "Blitz Games Studios"
	endif
	if g:thisCompanyName == 21
		let result = "Radiant Worlds"
	endif
	if g:thisCompanyName == 22
		let result = "Chesilton IT"
	endif
	if g:thisCompanyName == 23
		let result = "Colwith IT"
	endif
	if g:thisCompanyName == 24
		let result = "Silverton IT"
	endif
	if g:thisCompanyName == 25
		let result = "Ongar IT"
	endif
	let g:thisCompanyName = RandomUnique(g:thisCompanyName, g:companyNameMax)
	return result
endfunction

function NextCredibleSkill()
	if g:thisCredibleSkill == 0
		let result = "Kidderminster API Resource Kit"
	endif
	if g:thisCredibleSkill == 1
		let result = "Xcode"
	endif
	if g:thisCredibleSkill == 2
		let result = "Cocoa"
	endif
	if g:thisCredibleSkill == 3
		let result = "Cocoa Frameworks"
	endif
	if g:thisCredibleSkill == 4
		let result = "Objective-C"
	endif
	if g:thisCredibleSkill == 5
		let result = "Model-View-Controller"
	endif
	if g:thisCredibleSkill == 6
		let result = "Controllers and Interface Builder"
	endif
	if g:thisCredibleSkill == 7
		let result = "AV Kit"
	endif
	if g:thisCredibleSkill == 8
		let result = "AV Foundation"
	endif
	if g:thisCredibleSkill == 9
		let result = "Core Video"
	endif
	if g:thisCredibleSkill == 10
		let result = "Core Audio"
	endif
	if g:thisCredibleSkill == 11
		let result = "Audio Units"
	endif
	if g:thisCredibleSkill == 12
		let result = "Core Animation"
	endif
	if g:thisCredibleSkill == 13
		let result = "Core Image"
	endif
	if g:thisCredibleSkill == 14
		let result = "Open GL"
	endif
	if g:thisCredibleSkill == 15
		let result = "Scene Kits"
	endif
	if g:thisCredibleSkill == 16
		let result = "Sprite Kit"
	endif
	if g:thisCredibleSkill == 17
		let result = "Quartz"
	endif
	if g:thisCredibleSkill == 18
		let result = "Swift"
	endif
	if g:thisCredibleSkill == 19
		let result = "Named Parameters"
	endif
	if g:thisCredibleSkill == 20
		let result = "Inferred Types"
	endif
	if g:thisCredibleSkill == 21
		let result = "Namespaces"
	endif
	if g:thisCredibleSkill == 22
		let result = "Swift Programming Language"
	endif
	if g:thisCredibleSkill == 22
		let result = "C#"
	endif
	if g:thisCredibleSkill == 23
		let result = "ASP.NET"
	endif
	if g:thisCredibleSkill == 24
		let result = "AJAX"
	endif
	if g:thisCredibleSkill == 25
		let result = "JavaScript"
	endif
	if g:thisCredibleSkill == 26
		let result = "MVC"
	endif
	if g:thisCredibleSkill == 27
		let result = "HTML"
	endif
	if g:thisCredibleSkill == 28
		let result = ".NET Developer Algorithms"
	endif
	if g:thisCredibleSkill == 28
		let result = "WCF"
	endif
	if g:thisCredibleSkill == 29
		let result = "WPF"
	endif
	if g:thisCredibleSkill == 30
		let result = "Agile"
	endif
	if g:thisCredibleSkill == 31
		let result = "HTML 5"
	endif
	if g:thisCredibleSkill == 32
		let result = "Ext JS"
	endif
	if g:thisCredibleSkill == 33
		let result = "CSS3"
	endif
	if g:thisCredibleSkill == 34
		let result = "jQuery"
	endif
	let g:thisCredibleSkill = RandomUnique(g:thisCredibleSkill, g:credibleSkillMax)
	return result
endfunction

function NextInsult(theItem)
	let g:insultCount = 0
	if g:thisInsult == 0
		echohl Cursor
		echon a:theItem
		echohl Comment
		echon " ".NextWittyOneWordClose()
		echon " ".NextInsultTerm()."!!"
	endif
	if g:thisInsult == 1 
		echohl Question
		echon NextTermMeaningYou()
		echohl None
		echon " "
		echohl Cursor
		echon a:theItem
		echohl Comment
		echon " is ".NextInsultTerm()
	endif
	if g:thisInsult == 2
		echohl Comment
		echon "so why is "
		echohl Cursor
		echon a:theItem
		echohl Comment
		echon " \"".NextPraiseWorthyTerm()."\" "
		echohl Question
		echon NextTermMeaningYou()
		echohl Comment
		echon "?"
	endif
	if g:thisInsult == 3
		echohl Comment
		echon "why do you think "
		echohl Cursor
		echon a:theItem
		echohl Comment
		echon " is ".NextTermMeaningBetter()." "
		echohl Question
		echon NextTermMeaningYou()
		echohl Comment
		echon "?"
	endif
	if g:thisInsult == 4
		echohl Question
		echon NextTermMeaningYou()
		echohl Comment
		echon " what do you mean by \""
		echohl Cursor
		echon a:theItem
		echohl Comment
		echon "\"?"
	endif
	if g:thisInsult == 5
		echohl Comment
		echon "what's all that \""
		echohl Cursor
		echon a:theItem
		echohl Comment
		echon "\" ".NextInsultTerm()." "
		echohl Question
		echon NextTermMeaningYou()
		echohl Comment
		echon "?"
	endif
	if g:thisInsult == 6
		echohl Question
		echon NextTermMeaningYou()." "
		echohl Cursor
		echon a:theItem
		echohl Comment
		echon " is considered ".NextInsultTerm()
	endif
	if g:thisInsult == 7
		echohl Comment
		echon "are you sure "
		echohl Cursor
		echon a:theItem
		echohl Comment
		echon " is \"".NextPraiseWorthyTerm()."\" "
		echohl Question
		echon NextTermMeaningYou()
		echohl Comment
		echon "?"
	endif
	if g:thisInsult == 8
		echohl Question
		echon NextTermMeaningYou()
		echohl None
		echon " "
		echohl Cursor
		echon a:theItem
		echohl Comment
		echon " is ".NextInsultTerm().", "
		echon "\""
		echohl Identifier
		echon NextCoolAlternative(a:theItem)
		echohl Comment
		echon "\" is "
		echon NextPraiseWorthyTerm()." now"
	endif
	if g:thisInsult == 9
		echohl Question
		echon NextTermMeaningYou()
		echohl Comment
		echon " I am "
		echohl Identifier
		echon NextGoodPersonTerm()
		echohl Comment
		echon " at "
		echohl Cursor
		echon a:theItem
	endif
	if g:thisInsult == 10
		echohl Comment
		echon "I gotta tell you "
		echohl Question
		echon NextTermMeaningYou()
		echohl Comment
		echon " I am "
		echohl Identifier
		echon NextTermMeaningBetter()
		echohl Comment
		echon " with "
		echohl Cursor
		echon a:theItem
	endif
	if g:thisInsult == 11
		echohl Question
		echon NextTermMeaningYou()
		echohl Comment
		echon " I gotta tell you I am "
		echohl Identifier
		echon NextPraiseWorthyTerm()
		echohl Comment
		echon " at "
		echohl Cursor
		echon a:theItem
	endif
	if g:thisInsult == 12
		echohl Question
		echon NextTermMeaningYou()
		echohl Comment
		echon " I was voted best overall "
		echohl Cursor
		echon a:theItem
		echohl Comment
		echon " by "
		echohl Identifier
		echon NextCredibleName()
		echohl Comment
		echon " last year"
	endif
	if g:thisInsult == 13
		echohl Question
		echon NextTermMeaningYou()
		echohl Comment
		echon " I came top ".(1+(Random(14)))."% "
		echohl Cursor
		echon a:theItem
		echohl Comment
		echon " "
		echohl Identifier
		echon NextCredibleName()
		echohl Comment
		echon " rewiew last year"
	endif
	if g:thisInsult == 14
		echohl Cursor
		echon a:theItem
		echohl Comment
		echon " "
		echon NextWittyOneWordClose()
	endif
	if g:thisInsult == 15
		echohl Comment
		echon "Sorry "
		echohl Question
		echon NextTermMeaningYou()
		echohl Comment
		echon " you ".NextTermMeaningSuck()." at "
		echohl Cursor
		echon a:theItem
	endif
	if g:thisInsult == 16
		echohl Question
		echon NextTermMeaningYou()
		echohl Comment
		echon " you "
		echon NextTermMeaningSuperSuck()
		echon " at "
		echohl Cursor
		echon a:theItem
	endif
	if g:thisInsult == 17
		echohl Question
		echon NextTermMeaningYou()
		echohl Comment
		echon " you ".NextTermMeaningSuck()." at "
		echohl Cursor
		echon a:theItem
	endif
	if g:thisInsult == 18
		echohl Comment
		echon "I'd think about telling people you're "
		echohl Cursor
		echon a:theItem
		echohl Comment
		echon " "
		echohl Question
		echon NextTermMeaningYou()
	endif
	if g:thisInsult == 19
		echohl Question
		echon NextTermMeaningYou()
		echohl Comment
		echon " if you tell people you're "
		echohl Cursor
		echon a:theItem
		echohl Comment
		echon " it could be trouble for you"

	endif
	if g:thisInsult == 20
		echohl Comment
		echon "I was working at "
		echohl Identifier
		echon NextCompanyName()
		echohl Comment
		echon " for ".((Random(5))+2)." years on "
		echohl Cursor
		echon a:theItem
	endif
	if g:thisInsult == 21
		echohl Comment
		echon "when I was at "
		echohl Identifier
		echon NextCredibleAcademic(a:theItem)
		echohl Comment
		echon " I studied "
		echohl Cursor
		echon a:theItem
		echohl Comment
		echon " for ".((Random(3))+2)." years"
	endif
	if g:thisInsult == 22
		echohl Comment
		echon "I wrote "
		echohl Cursor
		echon a:theItem
		echohl Comment
		echon " using "
		echohl Identifier
		echon NextCredibleSkill()
		echohl Comment
		echon " while at "
		echohl Identifier
		echon NextCompanyName()
	endif
	if g:thisInsult == 23
		echohl Cursor
		echon a:theItem
		echohl Comment
		echon " ".NextWittyOneWordClose()." what happened "
		echohl Question
		echon NextTermMeaningYou()
		echohl Comment
		echon "?"
	endif
	if g:thisInsult == 24
		echohl Comment
		echon "I studied "
		echohl Cursor
		echon a:theItem
		echohl Comment
		echon " at "
		echohl Identifier
		echon NextCredibleAcademic(a:theItem)
		echohl Comment
		echon " ".((Random(3))+2)." years ago"
	endif
	let g:thisInsult = RandomUnique(g:thisInsult, g:insultMax)
	" return result
endfunction

" silly function
function CentreOnWord()
	exe "set virtualedit=all"
	exe "normal lb"
	let begincolumn = col(".")
	exe "normal el"
	let endcolumn = col(".")
	let difference = endcolumn - begincolumn
	call cursor(0, begincolumn + (difference / 2) )
	" a bit fancy
	let theLine = getline(".")
	let theWord = strpart(theLine, begincolumn-1, difference)
	echohl lCursor
	echon ">"
	call NextInsult(theWord)
	exe "set virtualedit="
	" echon insult 
	echohl None
endfunction

" map this
map <A-i> :call CentreOnWord()<CR>
