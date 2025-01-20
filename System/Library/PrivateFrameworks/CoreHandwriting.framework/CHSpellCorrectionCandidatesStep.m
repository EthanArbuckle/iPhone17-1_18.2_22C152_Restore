@interface CHSpellCorrectionCandidatesStep
- (CHSpellCorrectionCandidatesStep)initWithLocale:(id)a3 spellChecker:(id)a4 staticLexicon:(_LXLexicon *)a5 customLexicon:(_LXLexicon *)a6;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHSpellCorrectionCandidatesStep

- (CHSpellCorrectionCandidatesStep)initWithLocale:(id)a3 spellChecker:(id)a4 staticLexicon:(_LXLexicon *)a5 customLexicon:(_LXLexicon *)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CHSpellCorrectionCandidatesStep;
  v13 = [(CHSpellCorrectionCandidatesStep *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_locale, a3);
    objc_storeStrong((id *)&v14->_spellChecker, a4);
    v14->_staticLexicon = a5;
    v14->_customLexicon = a6;
  }

  return v14;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v551 = *MEMORY[0x1E4F143B8];
  v5 = (id *)a3;
  id v507 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v511 = v5;
  v6 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEBUG, "CHSpellCorrectionCandidatesStep is running", buf, 2u);
  }

  v509 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9, v10, v11);
  v510 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v12, v13, v14, v15, v16);
  v515 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v17, v18, v19, v20, v21);
  v525 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v22, v23, v24, v25, v26);
  v32 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v27, v28, v29, v30, v31);
  objc_msgSend_addObject_(v525, v33, (uint64_t)v32, v34, v35, v36);

  v42 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v37, v38, v39, v40, v41);
  objc_msgSend_addObject_(v525, v43, (uint64_t)v42, v44, v45, v46);

  for (unint64_t i = 0; ; ++i)
  {
    v52 = objc_msgSend_result(v511, v47, v48, v49, v50, v51);
    BOOL v58 = i < objc_msgSend_tokenColumnCount(v52, v53, v54, v55, v56, v57);

    if (!v58) {
      break;
    }
    v64 = objc_msgSend_result(v511, v59, v60, v61, v62, v63);
    v70 = objc_msgSend_result(v511, v65, v66, v67, v68, v69);
    v76 = objc_msgSend_transcriptionPaths(v70, v71, v72, v73, v74, v75);
    v81 = objc_msgSend_objectAtIndexedSubscript_(v76, v77, 0, v78, v79, v80);
    v85 = objc_msgSend_tokensInTranscriptionPath_atColumnIndex_(v64, v82, (uint64_t)v81, i, v83, v84);

    long long v546 = 0u;
    long long v547 = 0u;
    long long v544 = 0u;
    long long v545 = 0u;
    id obj = v85;
    uint64_t v514 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v86, (uint64_t)&v544, (uint64_t)v550, 16, v87);
    if (v514)
    {
      uint64_t v513 = *(void *)v545;
      do
      {
        for (uint64_t j = 0; j != v514; ++j)
        {
          if (*(void *)v545 != v513) {
            objc_enumerationMutation(obj);
          }
          v92 = *(void **)(*((void *)&v544 + 1) + 8 * j);
          objc_msgSend_addObject_(v515, v88, (uint64_t)v92, v89, v90, v91);
          locale = self->_locale;
          v99 = objc_msgSend_string(v92, v94, v95, v96, v97, v98);
          v526 = objc_msgSend_spellCheckingLocaleForRecognitionLocale_string_(CHRecognizerConfiguration, v100, (uint64_t)locale, (uint64_t)v99, v101, v102);

          v529 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v103, v104, v105, v106, v107);
          if (objc_msgSend_count(obj, v108, v109, v110, v111, v112) == 1
            && (objc_msgSend_properties(v92, v113, v114, v115, v116, v117) & 4) == 0)
          {
            spellChecker = self->_spellChecker;
            v124 = objc_msgSend_string(v92, v118, v119, v120, v121, v122);
            v126 = objc_msgSend_topCorrectionsForRecognition_contextBeforeToken_contextSeparator_shouldUseErrorModel_forLocale_minScore_(spellChecker, v125, (uint64_t)v124, (uint64_t)&stru_1F20141C8, (uint64_t)&stru_1F20141C8, 1, v526, -0.351);

            objc_msgSend_addObjectsFromArray_(v529, v127, (uint64_t)v126, v128, v129, v130);
          }
          id v131 = v92;
          v141 = v131;
          if (objc_msgSend_count(v529, v132, v133, v134, v135, v136))
          {
            v142 = objc_msgSend_objectAtIndexedSubscript_(v529, v137, 0, v138, v139, v140);
            uint64_t v151 = objc_msgSend_tokenIDForString_withLexicon_(CHLanguageUtilities, v143, (uint64_t)v142, (uint64_t)self->_customLexicon, v144, v145);
            if (!v151) {
              uint64_t v151 = objc_msgSend_tokenIDForString_withLexicon_(CHLanguageUtilities, v146, (uint64_t)v142, (uint64_t)self->_staticLexicon, v149, v150);
            }
            uint64_t v152 = objc_msgSend_properties(v131, v146, v147, v148, v149, v150);
            buf[0] = 0;
            if ((objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v153, (uint64_t)v142, (uint64_t)self->_staticLexicon, (uint64_t)buf, v154) & 1) != 0|| objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v155, (uint64_t)v142, (uint64_t)self->_customLexicon, (uint64_t)buf, v156))
            {
              uint64_t v157 = 260;
              if (!buf[0]) {
                uint64_t v157 = 4;
              }
              unint64_t v158 = v157 | v152;
            }
            else
            {
              unint64_t v158 = v152 & 0xFFFFFFFFFFFFFEFBLL;
            }
            v159 = [CHTokenizedTextResultToken alloc];
            v165 = objc_msgSend_strokeIndexes(v131, v160, v161, v162, v163, v164);
            objc_msgSend_modelScore(v131, v166, v167, v168, v169, v170);
            double v172 = v171;
            objc_msgSend_recognitionScore(v131, v173, v174, v175, v176, v177);
            double v179 = v178;
            objc_msgSend_combinedScore(v131, v180, v181, v182, v183, v184);
            double v186 = v185;
            objc_msgSend_alignmentScore(v131, v187, v188, v189, v190, v191);
            double v193 = v192;
            v199 = objc_msgSend_recognizerSourceLocale(v131, v194, v195, v196, v197, v198);
            double v520 = v193;
            double v522 = v172;
            uint64_t v205 = objc_msgSend_inputSources(v131, v200, v201, v202, v203, v204);
            uint64_t v211 = objc_msgSend_substrokeCount(v131, v206, v207, v208, v209, v210);
            objc_msgSend_bounds(v131, v212, v213, v214, v215, v216);
            double v516 = v218;
            double v518 = v217;
            double v220 = v219;
            double v222 = v221;
            objc_msgSend_originalBounds(v131, v223, v224, v225, v226, v227);
            uint64_t v234 = v233;
            uint64_t v236 = v235;
            uint64_t v238 = v237;
            uint64_t v240 = v239;
            if (v92)
            {
              objc_msgSend_principalLines(v131, v228, v229, v230, v231, v232);
            }
            else
            {
              long long v542 = 0u;
              long long v543 = 0u;
              long long v540 = 0u;
              long long v541 = 0u;
              long long v538 = 0u;
              long long v539 = 0u;
              long long v536 = 0u;
              long long v537 = 0u;
            }
            v141 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v159, v228, (uint64_t)v142, (uint64_t)v165, v151, v158, v199, v205 | 0x20, v522, v179 * 0.5, v186 * 0.5, v520, v518, v516, v220, v222, v211, v234, v236,
                             v238,
                             v240,
                             &v536);
          }
          v241 = objc_msgSend_objectAtIndexedSubscript_(v525, v137, 0, v138, v139, v140);
          objc_msgSend_addObject_(v241, v242, (uint64_t)v141, v243, v244, v245);

          id v246 = v131;
          if ((unint64_t)objc_msgSend_count(v529, v247, v248, v249, v250, v251) >= 2)
          {
            v256 = objc_msgSend_objectAtIndexedSubscript_(v529, v252, 1, v253, v254, v255);
            v523 = v92;
            uint64_t v265 = objc_msgSend_tokenIDForString_withLexicon_(CHLanguageUtilities, v257, (uint64_t)v256, (uint64_t)self->_customLexicon, v258, v259);
            if (!v265) {
              uint64_t v265 = objc_msgSend_tokenIDForString_withLexicon_(CHLanguageUtilities, v260, (uint64_t)v256, (uint64_t)self->_staticLexicon, v263, v264);
            }
            uint64_t v266 = objc_msgSend_properties(v246, v260, v261, v262, v263, v264);
            buf[0] = 0;
            if (objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v267, (uint64_t)v256, (uint64_t)self->_staticLexicon, (uint64_t)buf, v268) & 1) != 0|| (objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v269, (uint64_t)v256, (uint64_t)self->_customLexicon, (uint64_t)buf, v270))
            {
              uint64_t v271 = 260;
              if (!buf[0]) {
                uint64_t v271 = 4;
              }
              unint64_t v272 = v271 | v266;
            }
            else
            {
              unint64_t v272 = v266 & 0xFFFFFFFFFFFFFEFBLL;
            }
            v273 = [CHTokenizedTextResultToken alloc];
            v279 = objc_msgSend_strokeIndexes(v246, v274, v275, v276, v277, v278);
            objc_msgSend_modelScore(v246, v280, v281, v282, v283, v284);
            double v286 = v285;
            objc_msgSend_recognitionScore(v246, v287, v288, v289, v290, v291);
            double v293 = v292;
            objc_msgSend_combinedScore(v246, v294, v295, v296, v297, v298);
            double v300 = v299;
            objc_msgSend_alignmentScore(v246, v301, v302, v303, v304, v305);
            double v307 = v306;
            v313 = objc_msgSend_recognizerSourceLocale(v246, v308, v309, v310, v311, v312);
            double v519 = v307;
            double v521 = v286;
            uint64_t v319 = objc_msgSend_inputSources(v246, v314, v315, v316, v317, v318);
            uint64_t v325 = objc_msgSend_substrokeCount(v246, v320, v321, v322, v323, v324);
            objc_msgSend_bounds(v246, v326, v327, v328, v329, v330);
            double v517 = v331;
            double v512 = v332;
            double v334 = v333;
            double v336 = v335;
            objc_msgSend_originalBounds(v246, v337, v338, v339, v340, v341);
            uint64_t v348 = v347;
            uint64_t v350 = v349;
            uint64_t v352 = v351;
            uint64_t v354 = v353;
            if (v523)
            {
              objc_msgSend_principalLines(v246, v342, v343, v344, v345, v346);
            }
            else
            {
              long long v542 = 0u;
              long long v543 = 0u;
              long long v540 = 0u;
              long long v541 = 0u;
              long long v538 = 0u;
              long long v539 = 0u;
              long long v536 = 0u;
              long long v537 = 0u;
            }
            uint64_t v355 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v273, v342, (uint64_t)v256, (uint64_t)v279, v265, v272, v313, v319 | 0x20, v521, v293 * 0.5, v300 * 0.5, v519, v334, v517, v512, v336, v325, v348, v350,
                     v352,
                     v354,
                     &v536);

            id v246 = (id)v355;
          }
          v356 = objc_msgSend_objectAtIndexedSubscript_(v525, v252, 1, v253, v254, v255);
          objc_msgSend_addObject_(v356, v357, (uint64_t)v246, v358, v359, v360);
        }
        uint64_t v514 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v88, (uint64_t)&v544, (uint64_t)v550, 16, v91);
      }
      while (v514);
    }
  }
  objc_msgSend_addObject_(v509, v59, (uint64_t)v515, v61, v62, v63);
  v366 = objc_msgSend_result(v511, v361, v362, v363, v364, v365);
  v372 = objc_msgSend_transcriptionPathScores(v366, v367, v368, v369, v370, v371);
  v377 = objc_msgSend_objectAtIndexedSubscript_(v372, v373, 0, v374, v375, v376);
  objc_msgSend_addObject_(v510, v378, (uint64_t)v377, v379, v380, v381);

  long long v534 = 0u;
  long long v535 = 0u;
  long long v532 = 0u;
  long long v533 = 0u;
  id v382 = v525;
  uint64_t v389 = objc_msgSend_countByEnumeratingWithState_objects_count_(v382, v383, (uint64_t)&v532, (uint64_t)v549, 16, v384);
  if (v389)
  {
    uint64_t v390 = *(void *)v533;
    do
    {
      for (uint64_t k = 0; k != v389; ++k)
      {
        if (*(void *)v533 != v390) {
          objc_enumerationMutation(v382);
        }
        v392 = *(void **)(*((void *)&v532 + 1) + 8 * k);
        if ((objc_msgSend_isEqual_(v392, v385, (uint64_t)v515, v386, v387, v388) & 1) == 0)
        {
          objc_msgSend_addObject_(v509, v385, (uint64_t)v392, v386, v387, v388);
          v398 = objc_msgSend_result(v511, v393, v394, v395, v396, v397);
          v404 = objc_msgSend_transcriptionPathScores(v398, v399, v400, v401, v402, v403);
          v409 = objc_msgSend_objectAtIndexedSubscript_(v404, v405, 0, v406, v407, v408);
          objc_msgSend_addObject_(v510, v410, (uint64_t)v409, v411, v412, v413);
        }
      }
      uint64_t v389 = objc_msgSend_countByEnumeratingWithState_objects_count_(v382, v385, (uint64_t)&v532, (uint64_t)v549, 16, v388);
    }
    while (v389);
  }

  for (unint64_t m = 1; ; ++m)
  {
    v420 = objc_msgSend_result(v511, v414, v415, v416, v417, v418);
    v426 = objc_msgSend_transcriptionPaths(v420, v421, v422, v423, v424, v425);
    BOOL v432 = m < objc_msgSend_count(v426, v427, v428, v429, v430, v431);

    if (!v432) {
      break;
    }
    v438 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v433, v434, v435, v436, v437);
    v444 = objc_msgSend_result(v511, v439, v440, v441, v442, v443);
    v450 = objc_msgSend_result(v511, v445, v446, v447, v448, v449);
    v456 = objc_msgSend_transcriptionPaths(v450, v451, v452, v453, v454, v455);
    v461 = objc_msgSend_objectAtIndexedSubscript_(v456, v457, m, v458, v459, v460);
    v467 = objc_msgSend_result(v511, v462, v463, v464, v465, v466);
    uint64_t v473 = objc_msgSend_tokenColumnCount(v467, v468, v469, v470, v471, v472);
    v530[0] = MEMORY[0x1E4F143A8];
    v530[1] = 3221225472;
    v530[2] = sub_1C4C0CA60;
    v530[3] = &unk_1E64E3150;
    id v474 = v438;
    id v531 = v474;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v444, v475, (uint64_t)v461, 0, v473, (uint64_t)v530);

    objc_msgSend_addObject_(v509, v476, (uint64_t)v474, v477, v478, v479);
    v485 = objc_msgSend_result(v511, v480, v481, v482, v483, v484);
    v491 = objc_msgSend_transcriptionPathScores(v485, v486, v487, v488, v489, v490);
    v496 = objc_msgSend_objectAtIndexedSubscript_(v491, v492, m, v493, v494, v495);
    objc_msgSend_addObject_(v510, v497, (uint64_t)v496, v498, v499, v500);
  }
  v501 = objc_msgSend_result(v511, v433, v434, v435, v436, v437);
  v505 = objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v501, v502, (uint64_t)v509, (uint64_t)v510, v503, v504);
  if (v511) {
    objc_storeStrong(v511 + 3, v505);
  }

  return v511;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spellChecker, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end