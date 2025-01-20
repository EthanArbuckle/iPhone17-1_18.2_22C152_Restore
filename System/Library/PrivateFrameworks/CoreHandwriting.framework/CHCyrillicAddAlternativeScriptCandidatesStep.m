@interface CHCyrillicAddAlternativeScriptCandidatesStep
- (CHCyrillicAddAlternativeScriptCandidatesStep)initWithStaticLexicon:(_LXLexicon *)a3 customLexicon:(_LXLexicon *)a4;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHCyrillicAddAlternativeScriptCandidatesStep

- (CHCyrillicAddAlternativeScriptCandidatesStep)initWithStaticLexicon:(_LXLexicon *)a3 customLexicon:(_LXLexicon *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CHCyrillicAddAlternativeScriptCandidatesStep;
  result = [(CHCyrillicAddAlternativeScriptCandidatesStep *)&v7 init];
  if (result)
  {
    result->_staticLexicon = a3;
    result->_customLexicon = a4;
  }
  return result;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v651 = *MEMORY[0x1E4F143B8];
  v606 = (id *)a3;
  id v600 = a4;
  v601 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v5, v6, v7, v8, v9);
  v602 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v10, v11, v12, v13, v14);
  v607 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v15, v16, v17, v18, v19);
  v613 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v20, v21, v22, v23, v24);
  v30 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v25, v26, v27, v28, v29);
  objc_msgSend_addObject_(v613, v31, (uint64_t)v30, v32, v33, v34);

  v40 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v35, v36, v37, v38, v39);
  objc_msgSend_addObject_(v613, v41, (uint64_t)v40, v42, v43, v44);

  for (unint64_t i = 0; ; ++i)
  {
    v50 = objc_msgSend_result(v606, v45, v46, v47, v48, v49);
    BOOL v56 = i < objc_msgSend_tokenColumnCount(v50, v51, v52, v53, v54, v55);

    if (!v56) {
      break;
    }
    v62 = objc_msgSend_result(v606, v57, v58, v59, v60, v61);
    v68 = objc_msgSend_result(v606, v63, v64, v65, v66, v67);
    v74 = objc_msgSend_transcriptionPaths(v68, v69, v70, v71, v72, v73);
    v79 = objc_msgSend_objectAtIndexedSubscript_(v74, v75, 0, v76, v77, v78);
    v83 = objc_msgSend_tokensInTranscriptionPath_atColumnIndex_(v62, v80, (uint64_t)v79, i, v81, v82);

    long long v646 = 0u;
    long long v647 = 0u;
    long long v644 = 0u;
    long long v645 = 0u;
    id obj = v83;
    uint64_t v605 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v84, (uint64_t)&v644, (uint64_t)v650, 16, v85);
    if (v605)
    {
      uint64_t v603 = *(void *)v645;
      do
      {
        for (uint64_t j = 0; j != v605; ++j)
        {
          if (*(void *)v645 != v603) {
            objc_enumerationMutation(obj);
          }
          v90 = *(void **)(*((void *)&v644 + 1) + 8 * j);
          objc_msgSend_addObject_(v607, v86, (uint64_t)v90, v87, v88, v89);
          v616 = v90;
          v96 = objc_msgSend_string(v90, v91, v92, v93, v94, v95);
          v102 = objc_msgSend_ch_basicAlphabeticCharacterSet(MEMORY[0x1E4F28B88], v97, v98, v99, v100, v101);
          uint64_t v620 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v96, v103, (uint64_t)v102, 1, v104, v105);

          v111 = objc_msgSend_string(v90, v106, v107, v108, v109, v110);
          v117 = objc_msgSend_ch_basicCyrillicCharacterSet(MEMORY[0x1E4F28B88], v112, v113, v114, v115, v116);
          uint64_t v617 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v111, v118, (uint64_t)v117, 1, v119, v120);

          long long v642 = 0u;
          long long v643 = 0u;
          long long v640 = 0u;
          long long v641 = 0u;
          v126 = objc_msgSend_result(v606, v121, v122, v123, v124, v125);
          v132 = objc_msgSend_tokenColumns(v126, v127, v128, v129, v130, v131);
          v137 = objc_msgSend_objectAtIndexedSubscript_(v132, v133, i, v134, v135, v136);
          objc_msgSend_textTokenRows(v137, v138, v139, v140, v141, v142);
          id v623 = (id)objc_claimAutoreleasedReturnValue();

          uint64_t v150 = objc_msgSend_countByEnumeratingWithState_objects_count_(v623, v143, (uint64_t)&v640, (uint64_t)v649, 16, v144);
          if (v150)
          {
            uint64_t v151 = *(void *)v641;
LABEL_10:
            uint64_t v152 = 0;
            while (1)
            {
              if (*(void *)v641 != v151) {
                objc_enumerationMutation(v623);
              }
              v153 = *(void **)(*((void *)&v640 + 1) + 8 * v152);
              if (objc_msgSend_count(v153, v145, v146, v147, v148, v149) == 1)
              {
                v154 = objc_msgSend_objectAtIndexedSubscript_(v153, v145, 0, v147, v148, v149);
                v160 = objc_msgSend_string(v154, v155, v156, v157, v158, v159);
                v166 = objc_msgSend_ch_basicAlphabeticCharacterSet(MEMORY[0x1E4F28B88], v161, v162, v163, v164, v165);
                uint64_t v170 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v160, v167, (uint64_t)v166, 1, v168, v169);

                v175 = objc_msgSend_objectAtIndexedSubscript_(v153, v171, 0, v172, v173, v174);
                v181 = objc_msgSend_string(v175, v176, v177, v178, v179, v180);
                v187 = objc_msgSend_ch_basicCyrillicCharacterSet(MEMORY[0x1E4F28B88], v182, v183, v184, v185, v186);
                uint64_t v191 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v181, v188, (uint64_t)v187, 1, v189, v190);
                BOOL v192 = v170 > 0;

                int v193 = 0;
                BOOL v194 = v191 > 0 && v620 > 0;
                if (v194 || v617 > 0 && v192) {
                  break;
                }
              }
              if (v150 == ++v152)
              {
                uint64_t v150 = objc_msgSend_countByEnumeratingWithState_objects_count_(v623, v145, (uint64_t)&v640, (uint64_t)v649, 16, v149);
                if (v150) {
                  goto LABEL_10;
                }
                goto LABEL_22;
              }
            }
          }
          else
          {
LABEL_22:
            int v193 = 1;
          }

          if (objc_msgSend_count(obj, v195, v196, v197, v198, v199) == 1
            && ((objc_msgSend_string(v616, v200, v201, v202, v203, v204),
                 v205 = objc_claimAutoreleasedReturnValue(),
                 (unint64_t)objc_msgSend_length(v205, v206, v207, v208, v209, v210) < 4)
              ? (int v211 = (v620 > 0) ^ (v617 > 0))
              : (int v211 = 0),
                v205,
                (v193 & v211) != 0))
          {
            v221 = objc_msgSend_string(v616, v212, v213, v214, v215, v216);
            if (v620 < 1) {
              objc_msgSend_transformCyrillicToLatin_(CHLanguageUtilities, v217, (uint64_t)v221, v218, v219, v220);
            }
            else {
            uint64_t v223 = objc_msgSend_transformLatinToCyrillic_(CHLanguageUtilities, v217, (uint64_t)v221, v218, v219, v220);
            }

            v222 = (void *)v223;
          }
          else
          {
            v222 = 0;
          }
          id v224 = v616;
          id v624 = v222;
          v234 = v224;
          if (objc_msgSend_count(v222, v225, v226, v227, v228, v229))
          {
            v235 = objc_msgSend_objectAtIndexedSubscript_(v222, v230, 0, v231, v232, v233);
            uint64_t v244 = objc_msgSend_tokenIDForString_withLexicon_(CHLanguageUtilities, v236, (uint64_t)v235, (uint64_t)self->_customLexicon, v237, v238);
            if (!v244) {
              uint64_t v244 = objc_msgSend_tokenIDForString_withLexicon_(CHLanguageUtilities, v239, (uint64_t)v235, (uint64_t)self->_staticLexicon, v242, v243);
            }
            uint64_t v245 = objc_msgSend_properties(v224, v239, v240, v241, v242, v243);
            char v639 = 0;
            if ((objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v246, (uint64_t)v235, (uint64_t)self->_staticLexicon, (uint64_t)&v639, v247) & 1) != 0|| objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v248, (uint64_t)v235, (uint64_t)self->_customLexicon, (uint64_t)&v639, v249))
            {
              uint64_t v250 = 260;
              if (!v639) {
                uint64_t v250 = 4;
              }
              unint64_t v251 = v250 | v245;
            }
            else
            {
              unint64_t v251 = v245 & 0xFFFFFFFFFFFFFEFBLL;
            }
            v252 = [CHTokenizedTextResultToken alloc];
            v258 = objc_msgSend_strokeIndexes(v224, v253, v254, v255, v256, v257);
            objc_msgSend_modelScore(v224, v259, v260, v261, v262, v263);
            double v265 = v264;
            objc_msgSend_recognitionScore(v224, v266, v267, v268, v269, v270);
            double v272 = v271;
            objc_msgSend_combinedScore(v224, v273, v274, v275, v276, v277);
            double v279 = v278;
            objc_msgSend_alignmentScore(v224, v280, v281, v282, v283, v284);
            double v286 = v285;
            v292 = objc_msgSend_recognizerSourceLocale(v224, v287, v288, v289, v290, v291);
            double v618 = v286;
            double v621 = v265;
            uint64_t v298 = objc_msgSend_inputSources(v224, v293, v294, v295, v296, v297);
            uint64_t v304 = objc_msgSend_substrokeCount(v224, v299, v300, v301, v302, v303);
            objc_msgSend_bounds(v224, v305, v306, v307, v308, v309);
            double v608 = v311;
            double v610 = v310;
            double v313 = v312;
            double v315 = v314;
            objc_msgSend_originalBounds(v224, v316, v317, v318, v319, v320);
            uint64_t v327 = v326;
            uint64_t v329 = v328;
            uint64_t v331 = v330;
            uint64_t v333 = v332;
            if (v616)
            {
              objc_msgSend_principalLines(v224, v321, v322, v323, v324, v325);
            }
            else
            {
              long long v637 = 0u;
              long long v638 = 0u;
              long long v635 = 0u;
              long long v636 = 0u;
              long long v633 = 0u;
              long long v634 = 0u;
              long long v631 = 0u;
              long long v632 = 0u;
            }
            v234 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v252, v321, (uint64_t)v235, (uint64_t)v258, v244, v251, v292, v298 | 8, v621, v272 * 0.5, v279 * 0.5, v618, v610, v608, v313, v315, v304, v327, v329,
                             v331,
                             v333,
                             &v631);
          }
          v334 = objc_msgSend_objectAtIndexedSubscript_(v613, v230, 0, v231, v232, v233);
          objc_msgSend_addObject_(v334, v335, (uint64_t)v234, v336, v337, v338);

          id v339 = v224;
          if ((unint64_t)objc_msgSend_count(v624, v340, v341, v342, v343, v344) >= 2)
          {
            v349 = objc_msgSend_objectAtIndexedSubscript_(v624, v345, 1, v346, v347, v348);
            uint64_t v358 = objc_msgSend_tokenIDForString_withLexicon_(CHLanguageUtilities, v350, (uint64_t)v349, (uint64_t)self->_customLexicon, v351, v352);
            if (!v358) {
              uint64_t v358 = objc_msgSend_tokenIDForString_withLexicon_(CHLanguageUtilities, v353, (uint64_t)v349, (uint64_t)self->_staticLexicon, v356, v357);
            }
            uint64_t v359 = objc_msgSend_properties(v339, v353, v354, v355, v356, v357);
            char v639 = 0;
            if (objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v360, (uint64_t)v349, (uint64_t)self->_staticLexicon, (uint64_t)&v639, v361) & 1) != 0|| (objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v362, (uint64_t)v349, (uint64_t)self->_customLexicon, (uint64_t)&v639, v363))
            {
              uint64_t v364 = 260;
              if (!v639) {
                uint64_t v364 = 4;
              }
              unint64_t v365 = v364 | v359;
            }
            else
            {
              unint64_t v365 = v359 & 0xFFFFFFFFFFFFFEFBLL;
            }
            v366 = [CHTokenizedTextResultToken alloc];
            v372 = objc_msgSend_strokeIndexes(v339, v367, v368, v369, v370, v371);
            objc_msgSend_modelScore(v339, v373, v374, v375, v376, v377);
            double v379 = v378;
            objc_msgSend_recognitionScore(v339, v380, v381, v382, v383, v384);
            double v386 = v385;
            objc_msgSend_combinedScore(v339, v387, v388, v389, v390, v391);
            double v393 = v392;
            objc_msgSend_alignmentScore(v339, v394, v395, v396, v397, v398);
            double v400 = v399;
            v406 = objc_msgSend_recognizerSourceLocale(v339, v401, v402, v403, v404, v405);
            double v619 = v400;
            double v622 = v379;
            uint64_t v412 = objc_msgSend_inputSources(v339, v407, v408, v409, v410, v411);
            uint64_t v418 = objc_msgSend_substrokeCount(v339, v413, v414, v415, v416, v417);
            objc_msgSend_bounds(v339, v419, v420, v421, v422, v423);
            double v609 = v425;
            double v611 = v424;
            double v427 = v426;
            double v429 = v428;
            objc_msgSend_originalBounds(v339, v430, v431, v432, v433, v434);
            uint64_t v441 = v440;
            uint64_t v443 = v442;
            uint64_t v445 = v444;
            uint64_t v447 = v446;
            if (v616)
            {
              objc_msgSend_principalLines(v339, v435, v436, v437, v438, v439);
            }
            else
            {
              long long v637 = 0u;
              long long v638 = 0u;
              long long v635 = 0u;
              long long v636 = 0u;
              long long v633 = 0u;
              long long v634 = 0u;
              long long v631 = 0u;
              long long v632 = 0u;
            }
            uint64_t v448 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v366, v435, (uint64_t)v349, (uint64_t)v372, v358, v365, v406, v412 | 8, v622, v386 * 0.5, v393 * 0.5, v619, v611, v609, v427, v429, v418, v441, v443,
                     v445,
                     v447,
                     &v631);

            id v339 = (id)v448;
          }
          v449 = objc_msgSend_objectAtIndexedSubscript_(v613, v345, 1, v346, v347, v348);
          objc_msgSend_addObject_(v449, v450, (uint64_t)v339, v451, v452, v453);
        }
        uint64_t v605 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v86, (uint64_t)&v644, (uint64_t)v650, 16, v89);
      }
      while (v605);
    }
  }
  objc_msgSend_addObject_(v601, v57, (uint64_t)v607, v59, v60, v61);
  v459 = objc_msgSend_result(v606, v454, v455, v456, v457, v458);
  v465 = objc_msgSend_transcriptionPathScores(v459, v460, v461, v462, v463, v464);
  v470 = objc_msgSend_objectAtIndexedSubscript_(v465, v466, 0, v467, v468, v469);
  objc_msgSend_addObject_(v602, v471, (uint64_t)v470, v472, v473, v474);

  long long v629 = 0u;
  long long v630 = 0u;
  long long v627 = 0u;
  long long v628 = 0u;
  id v475 = v613;
  uint64_t v482 = objc_msgSend_countByEnumeratingWithState_objects_count_(v475, v476, (uint64_t)&v627, (uint64_t)v648, 16, v477);
  if (v482)
  {
    uint64_t v483 = *(void *)v628;
    do
    {
      for (uint64_t k = 0; k != v482; ++k)
      {
        if (*(void *)v628 != v483) {
          objc_enumerationMutation(v475);
        }
        v485 = *(void **)(*((void *)&v627 + 1) + 8 * k);
        if ((objc_msgSend_isEqual_(v485, v478, (uint64_t)v607, v479, v480, v481) & 1) == 0)
        {
          objc_msgSend_addObject_(v601, v478, (uint64_t)v485, v479, v480, v481);
          v491 = objc_msgSend_result(v606, v486, v487, v488, v489, v490);
          v497 = objc_msgSend_transcriptionPathScores(v491, v492, v493, v494, v495, v496);
          v502 = objc_msgSend_objectAtIndexedSubscript_(v497, v498, 0, v499, v500, v501);
          objc_msgSend_addObject_(v602, v503, (uint64_t)v502, v504, v505, v506);
        }
      }
      uint64_t v482 = objc_msgSend_countByEnumeratingWithState_objects_count_(v475, v478, (uint64_t)&v627, (uint64_t)v648, 16, v481);
    }
    while (v482);
  }

  for (unint64_t m = 1; ; ++m)
  {
    v513 = objc_msgSend_result(v606, v507, v508, v509, v510, v511);
    v519 = objc_msgSend_transcriptionPaths(v513, v514, v515, v516, v517, v518);
    BOOL v525 = m < objc_msgSend_count(v519, v520, v521, v522, v523, v524);

    if (!v525) {
      break;
    }
    v531 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v526, v527, v528, v529, v530);
    v537 = objc_msgSend_result(v606, v532, v533, v534, v535, v536);
    v543 = objc_msgSend_result(v606, v538, v539, v540, v541, v542);
    v549 = objc_msgSend_transcriptionPaths(v543, v544, v545, v546, v547, v548);
    v554 = objc_msgSend_objectAtIndexedSubscript_(v549, v550, m, v551, v552, v553);
    v560 = objc_msgSend_result(v606, v555, v556, v557, v558, v559);
    uint64_t v566 = objc_msgSend_tokenColumnCount(v560, v561, v562, v563, v564, v565);
    v625[0] = MEMORY[0x1E4F143A8];
    v625[1] = 3221225472;
    v625[2] = sub_1C4C24154;
    v625[3] = &unk_1E64E3150;
    id v567 = v531;
    id v626 = v567;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v537, v568, (uint64_t)v554, 0, v566, (uint64_t)v625);

    objc_msgSend_addObject_(v601, v569, (uint64_t)v567, v570, v571, v572);
    v578 = objc_msgSend_result(v606, v573, v574, v575, v576, v577);
    v584 = objc_msgSend_transcriptionPathScores(v578, v579, v580, v581, v582, v583);
    v589 = objc_msgSend_objectAtIndexedSubscript_(v584, v585, m, v586, v587, v588);
    objc_msgSend_addObject_(v602, v590, (uint64_t)v589, v591, v592, v593);
  }
  v594 = objc_msgSend_result(v606, v526, v527, v528, v529, v530);
  v598 = objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v594, v595, (uint64_t)v601, (uint64_t)v602, v596, v597);
  if (v606) {
    objc_storeStrong(v606 + 3, v598);
  }

  return v606;
}

@end