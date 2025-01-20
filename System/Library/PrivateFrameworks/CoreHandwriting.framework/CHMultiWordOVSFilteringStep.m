@interface CHMultiWordOVSFilteringStep
- (CHMultiWordOVSFilteringStep)initWithOVSStringChecker:(id)a3;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHMultiWordOVSFilteringStep

- (CHMultiWordOVSFilteringStep)initWithOVSStringChecker:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHMultiWordOVSFilteringStep;
  v6 = [(CHMultiWordOVSFilteringStep *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ovsStringChecker, a3);
  }

  return v7;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v613 = *MEMORY[0x1E4F143B8];
  id v5 = (id *)a3;
  id v565 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v568 = v5;
  v6 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEBUG, "CHMultiWordOVSFilteringStep is running", buf, 2u);
  }

  v593 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9, v10, v11);
  v572 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v12, v13, v14, v15, v16);
  unint64_t v573 = 0;
  objc_msgSend_result(v5, v17, v18, v19, v20, v21);
  while (1)
    v22 = {;
    v28 = objc_msgSend_transcriptionPaths(v22, v23, v24, v25, v26, v27);
    BOOL v34 = v573 < objc_msgSend_count(v28, v29, v30, v31, v32, v33);

    if (!v34) {
      break;
    }
    v40 = objc_msgSend_result(v568, v35, v36, v37, v38, v39);
    v46 = objc_msgSend_transcriptionPaths(v40, v41, v42, v43, v44, v45);
    v567 = objc_msgSend_objectAtIndexedSubscript_(v46, v47, v573, v48, v49, v50);

    v566 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v51, v52, v53, v54, v55);
    v61 = objc_msgSend_result(v568, v56, v57, v58, v59, v60);
    v67 = objc_msgSend_result(v568, v62, v63, v64, v65, v66);
    uint64_t v73 = objc_msgSend_tokenColumnCount(v67, v68, v69, v70, v71, v72);
    v607[0] = MEMORY[0x1E4F143A8];
    v607[1] = 3221225472;
    v607[2] = sub_1C4C1F5BC;
    v607[3] = &unk_1E64E3150;
    id v590 = v566;
    id v608 = v590;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v61, v74, (uint64_t)v567, 0, v73, (uint64_t)v607);

    for (unint64_t i = 0; i < objc_msgSend_count(v590, v75, v76, v77, v78, v79); ++i)
    {
      unint64_t v85 = objc_msgSend_count(v590, v80, v81, v82, v83, v84);
      v90 = &stru_1F20141C8;
      if (i <= 0xFFFFFFFFFFFFFFFCLL && i < v85)
      {
        v91 = objc_msgSend_objectAtIndexedSubscript_(v590, v86, i, v87, v88, v89);
        v97 = objc_msgSend_string(v91, v92, v93, v94, v95, v96);
        objc_msgSend_stringByAppendingString_(&stru_1F20141C8, v98, (uint64_t)v97, v99, v100, v101);
        v570 = (__CFString *)objc_claimAutoreleasedReturnValue();

        uint64_t isInappropriateString = objc_msgSend_isInappropriateString_(self->_ovsStringChecker, v102, (uint64_t)v570, v103, v104, v105);
        unint64_t v116 = i + 1;
        if (i + 1 < objc_msgSend_count(v590, v106, v107, v108, v109, v110))
        {
          v117 = objc_msgSend_result(v568, v111, v112, v113, v114, v115);
          v122 = objc_msgSend_objectAtIndexedSubscript_(v590, v118, v116, v119, v120, v121);
          v127 = objc_msgSend_precedingSeparatorForToken_(v117, v123, (uint64_t)v122, v124, v125, v126);
          v132 = objc_msgSend_stringByAppendingString_(v570, v128, (uint64_t)v127, v129, v130, v131);

          v137 = objc_msgSend_objectAtIndexedSubscript_(v590, v133, v116, v134, v135, v136);
          v143 = objc_msgSend_string(v137, v138, v139, v140, v141, v142);
          objc_msgSend_stringByAppendingString_(v132, v144, (uint64_t)v143, v145, v146, v147);
          v570 = (__CFString *)objc_claimAutoreleasedReturnValue();

          int v152 = objc_msgSend_isInappropriateString_(self->_ovsStringChecker, v148, (uint64_t)v570, v149, v150, v151);
          uint64_t v158 = isInappropriateString;
          if (v152) {
            uint64_t v158 = 2;
          }
          uint64_t isInappropriateString = v158;
          unint64_t v160 = i + 2;
          if (i + 2 < objc_msgSend_count(v590, v153, v154, v155, v156, v157))
          {
            unint64_t v161 = i + 3;
            if (v116 < i + 3)
            {
              v162 = objc_msgSend_result(v568, v111, v159, v113, v114, v115);
              v167 = objc_msgSend_objectAtIndexedSubscript_(v590, v163, v160, v164, v165, v166);
              v172 = objc_msgSend_precedingSeparatorForToken_(v162, v168, (uint64_t)v167, v169, v170, v171);
              v177 = objc_msgSend_stringByAppendingString_(v570, v173, (uint64_t)v172, v174, v175, v176);

              v182 = objc_msgSend_objectAtIndexedSubscript_(v590, v178, v160, v179, v180, v181);
              v188 = objc_msgSend_string(v182, v183, v184, v185, v186, v187);
              objc_msgSend_stringByAppendingString_(v177, v189, (uint64_t)v188, v190, v191, v192);
              v570 = (__CFString *)objc_claimAutoreleasedReturnValue();

              int v197 = objc_msgSend_isInappropriateString_(self->_ovsStringChecker, v193, (uint64_t)v570, v194, v195, v196);
              uint64_t v203 = isInappropriateString;
              if (v197) {
                uint64_t v203 = 3;
              }
              uint64_t isInappropriateString = v203;
              unint64_t v205 = i + 3;
              if (i + 3 < objc_msgSend_count(v590, v198, v199, v200, v201, v202) && v160 < v161)
              {
                v206 = objc_msgSend_result(v568, v111, v204, v113, v114, v115);
                v211 = objc_msgSend_objectAtIndexedSubscript_(v590, v207, v205, v208, v209, v210);
                v216 = objc_msgSend_precedingSeparatorForToken_(v206, v212, (uint64_t)v211, v213, v214, v215);
                v221 = objc_msgSend_stringByAppendingString_(v570, v217, (uint64_t)v216, v218, v219, v220);

                v226 = objc_msgSend_objectAtIndexedSubscript_(v590, v222, v205, v223, v224, v225);
                v232 = objc_msgSend_string(v226, v227, v228, v229, v230, v231);
                objc_msgSend_stringByAppendingString_(v221, v233, (uint64_t)v232, v234, v235, v236);
                v570 = (__CFString *)objc_claimAutoreleasedReturnValue();

                LODWORD(v221) = objc_msgSend_isInappropriateString_(self->_ovsStringChecker, v237, (uint64_t)v570, v238, v239, v240);
                unint64_t v246 = objc_msgSend_count(v590, v241, v242, v243, v244, v245);
                unint64_t v248 = i + 4;
                uint64_t v249 = isInappropriateString;
                if (v221) {
                  uint64_t v249 = 4;
                }
                uint64_t isInappropriateString = v249;
                if (v248 < v246 && v205 < v161)
                {
                  v529 = objc_msgSend_result(v568, v111, v247, v113, v114, v115);
                  v534 = objc_msgSend_objectAtIndexedSubscript_(v590, v530, v248, v531, v532, v533);
                  v539 = objc_msgSend_precedingSeparatorForToken_(v529, v535, (uint64_t)v534, v536, v537, v538);
                  v544 = objc_msgSend_stringByAppendingString_(v570, v540, (uint64_t)v539, v541, v542, v543);

                  v549 = objc_msgSend_objectAtIndexedSubscript_(v590, v545, v248, v546, v547, v548);
                  v555 = objc_msgSend_string(v549, v550, v551, v552, v553, v554);
                  uint64_t v571 = objc_msgSend_stringByAppendingString_(v544, v556, (uint64_t)v555, v557, v558, v559);

                  objc_msgSend_isInappropriateString_(self->_ovsStringChecker, v560, v571, v561, v562, v563);
                  __break(1u);
                }
              }
            }
          }
        }
        if (isInappropriateString)
        {
          for (uint64_t j = 0; j != isInappropriateString; ++j)
          {
            v256 = objc_msgSend_objectAtIndexedSubscript_(v590, v111, i + j, v113, v114, v115);
            if (!v573
              || (objc_msgSend_firstObject(v572, v251, v252, v253, v254, v255),
                  v257 = objc_claimAutoreleasedReturnValue(),
                  char v262 = objc_msgSend_containsObject_(v257, v258, (uint64_t)v256, v259, v260, v261),
                  v257,
                  (v262 & 1) == 0))
            {
              v263 = [CHTokenizedTextResultToken alloc];
              objc_msgSend_string(v256, v264, v265, v266, v267, v268);
              id v587 = (id)objc_claimAutoreleasedReturnValue();
              v274 = objc_msgSend_strokeIndexes(v256, v269, v270, v271, v272, v273);
              uint64_t v280 = objc_msgSend_wordID(v256, v275, v276, v277, v278, v279);
              objc_msgSend_modelScore(v256, v281, v282, v283, v284, v285);
              v287 = v286;
              objc_msgSend_recognitionScore(v256, v288, v289, v290, v291, v292);
              double v294 = v293;
              objc_msgSend_combinedScore(v256, v295, v296, v297, v298, v299);
              double v301 = v300;
              objc_msgSend_alignmentScore(v256, v302, v303, v304, v305, v306);
              double v308 = v307;
              uint64_t v314 = objc_msgSend_properties(v256, v309, v310, v311, v312, v313);
              v320 = objc_msgSend_recognizerSourceLocale(v256, v315, v316, v317, v318, v319);
              double v575 = v308;
              double v577 = v301;
              double v579 = v294;
              obuint64_t j = v287;
              uint64_t v326 = objc_msgSend_inputSources(v256, v321, v322, v323, v324, v325);
              uint64_t v332 = objc_msgSend_substrokeCount(v256, v327, v328, v329, v330, v331);
              objc_msgSend_bounds(v256, v333, v334, v335, v336, v337);
              double v339 = v338;
              double v341 = v340;
              double v343 = v342;
              double v345 = v344;
              objc_msgSend_originalBounds(v256, v346, v347, v348, v349, v350);
              uint64_t v357 = v356;
              uint64_t v359 = v358;
              uint64_t v361 = v360;
              uint64_t v363 = v362;
              if (v256) {
                objc_msgSend_principalLines(v256, v351, v352, v353, v354, v355);
              }
              else {
                memset(v606, 0, sizeof(v606));
              }
              v364 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v263, v351, (uint64_t)v587, (uint64_t)v274, v280, v314 | 0x10, v320, v326, *(double *)&obj, v579, v577, v575, v339, v341, v343, v345, v332, v357, v359,
                               v361,
                               v363,
                               v606);

              objc_msgSend_setObject_atIndexedSubscript_(v590, v365, (uint64_t)v364, i + j, v366, v367);
              objc_msgSend_setObject_forKeyedSubscript_(v593, v368, (uint64_t)v364, (uint64_t)v256, v369, v370);
            }
          }
        }
        v90 = v570;
      }
    }
    objc_msgSend_addObject_(v572, v80, (uint64_t)v590, v82, v83, v84);

    ++v573;
    objc_msgSend_result(v568, v371, v372, v373, v374, v375);
  }
  if (objc_msgSend_count(v593, v35, v36, v37, v38, v39))
  {
    v580 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v376, v377, v378, v379, v380);
    long long v604 = 0u;
    long long v605 = 0u;
    long long v602 = 0u;
    long long v603 = 0u;
    v386 = objc_msgSend_result(v568, v381, v382, v383, v384, v385);
    objc_msgSend_tokenColumns(v386, v387, v388, v389, v390, v391);
    id obja = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v576 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v392, (uint64_t)&v602, (uint64_t)v612, 16, v393);
    if (v576)
    {
      uint64_t v578 = *(void *)v603;
      do
      {
        for (uint64_t k = 0; k != v576; ++k)
        {
          if (*(void *)v603 != v578) {
            objc_enumerationMutation(obja);
          }
          v394 = *(void **)(*((void *)&v602 + 1) + 8 * k);
          v395 = [CHMutableTokenizedResultColumn alloc];
          uint64_t v400 = objc_msgSend_initWithTokenRows_(v395, v396, MEMORY[0x1E4F1CBF0], v397, v398, v399);
          long long v600 = 0u;
          long long v601 = 0u;
          long long v598 = 0u;
          long long v599 = 0u;
          v591 = (void *)v400;
          v406 = objc_msgSend_textTokenRows(v394, v401, v402, v403, v404, v405);
          id v588 = v406;
          uint64_t v414 = objc_msgSend_countByEnumeratingWithState_objects_count_(v406, v407, (uint64_t)&v598, (uint64_t)v611, 16, v408);
          if (v414)
          {
            uint64_t v415 = *(void *)v599;
            do
            {
              for (uint64_t m = 0; m != v414; ++m)
              {
                if (*(void *)v599 != v415) {
                  objc_enumerationMutation(v588);
                }
                v417 = *(void **)(*((void *)&v598 + 1) + 8 * m);
                v418 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v409, v410, v411, v412, v413);
                long long v596 = 0u;
                long long v597 = 0u;
                long long v594 = 0u;
                long long v595 = 0u;
                id v419 = v417;
                uint64_t v426 = objc_msgSend_countByEnumeratingWithState_objects_count_(v419, v420, (uint64_t)&v594, (uint64_t)v610, 16, v421);
                if (v426)
                {
                  uint64_t v427 = *(void *)v595;
                  do
                  {
                    for (uint64_t n = 0; n != v426; ++n)
                    {
                      if (*(void *)v595 != v427) {
                        objc_enumerationMutation(v419);
                      }
                      uint64_t v429 = *(void *)(*((void *)&v594 + 1) + 8 * n);
                      v434 = objc_msgSend_objectForKeyedSubscript_(v593, v422, v429, v423, v424, v425);
                      if (v434) {
                        objc_msgSend_addObject_(v418, v430, (uint64_t)v434, v431, v432, v433);
                      }
                      else {
                        objc_msgSend_addObject_(v418, v430, v429, v431, v432, v433);
                      }
                    }
                    uint64_t v426 = objc_msgSend_countByEnumeratingWithState_objects_count_(v419, v422, (uint64_t)&v594, (uint64_t)v610, 16, v425);
                  }
                  while (v426);
                }

                objc_msgSend_addTokenRowWithTokens_(v591, v435, (uint64_t)v418, v436, v437, v438);
              }
              v406 = v588;
              uint64_t v414 = objc_msgSend_countByEnumeratingWithState_objects_count_(v588, v409, (uint64_t)&v598, (uint64_t)v611, 16, v413);
            }
            while (v414);
          }

          objc_msgSend_addObject_(v580, v439, (uint64_t)v591, v440, v441, v442);
        }
        uint64_t v576 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v443, (uint64_t)&v602, (uint64_t)v612, 16, v444);
      }
      while (v576);
    }

    v450 = objc_msgSend_result(v568, v445, v446, v447, v448, v449);
    uint64_t v456 = objc_msgSend_baseWritingDirection(v450, v451, v452, v453, v454, v455);

    v457 = [CHMutableTokenizedTextResult alloc];
    v586 = objc_msgSend_result(v568, v458, v459, v460, v461, v462);
    v592 = objc_msgSend_transcriptionPaths(v586, v463, v464, v465, v466, v467);
    objc_msgSend_result(v568, v468, v469, v470, v471, v472);
    id objb = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPathScores(objb, v473, v474, v475, v476, v477);
    id v589 = (id)objc_claimAutoreleasedReturnValue();
    v483 = objc_msgSend_result(v568, v478, v479, v480, v481, v482);
    v489 = objc_msgSend_trailingSeparator(v483, v484, v485, v486, v487, v488);
    v495 = objc_msgSend_result(v568, v490, v491, v492, v493, v494);
    uint64_t v501 = objc_msgSend_recognizerGenerationIdentifier(v495, v496, v497, v498, v499, v500);
    v507 = objc_msgSend_result(v568, v502, v503, v504, v505, v506);
    uint64_t v513 = objc_msgSend_changeableTokenColumnCount(v507, v508, v509, v510, v511, v512);
    v519 = objc_msgSend_result(v568, v514, v515, v516, v517, v518);
    v525 = objc_msgSend_originalTokens(v519, v520, v521, v522, v523, v524);
    LOBYTE(v564) = 0;
    isMinimalDrawingResult_baseWritingDirection_originalTokens = objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_isMinimalDrawingResult_baseWritingDirection_originalTokens_(v457, v526, (uint64_t)v580, (uint64_t)v592, (uint64_t)v589, (uint64_t)v489, v501, v513, v564, v456, v525);
    if (v568) {
      objc_storeStrong(v568 + 3, isMinimalDrawingResult_baseWritingDirection_originalTokens);
    }
  }
  return v568;
}

- (void).cxx_destruct
{
}

@end