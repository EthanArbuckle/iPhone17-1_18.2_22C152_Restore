@interface CHVerticalUndersegmentationSplittingStep
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHVerticalUndersegmentationSplittingStep

- (id)process:(id)a3 options:(id)a4
{
  v625[14] = *MEMORY[0x1E4F143B8];
  v5 = a3;
  id v585 = a4;
  long long v615 = 0u;
  long long v616 = 0u;
  long long v617 = 0u;
  long long v618 = 0u;
  if (v5) {
    v11 = (void *)v5[9];
  }
  else {
    v11 = 0;
  }
  id v600 = v5;
  v12 = objc_msgSend_copy(v11, v6, v7, v8, v9, v10);
  id v595 = v12;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v615, (uint64_t)v623, 16, v14);
  if (v20)
  {
    uint64_t v596 = *(void *)v616;
    if (self)
    {
      v582 = v625;
      while (1)
      {
        uint64_t v590 = 0;
        uint64_t v587 = v20;
        do
        {
          if (*(void *)v616 != v596) {
            objc_enumerationMutation(v12);
          }
          if (v600) {
            v21 = (void *)*((void *)v600 + 10);
          }
          else {
            v21 = 0;
          }
          v22 = *(void **)(*((void *)&v615 + 1) + 8 * v590);
          id v23 = v21;
          v24 = NSNumber;
          uint64_t v30 = objc_msgSend_uniqueIdentifier(v22, v25, v26, v27, v28, v29);
          v35 = objc_msgSend_numberWithInteger_(v24, v31, v30, v32, v33, v34);
          v601 = objc_msgSend_objectForKeyedSubscript_(v23, v36, (uint64_t)v35, v37, v38, v39);

          objc_msgSend_mathResult(v601, v40, v41, v42, v43, v44);
          id v45 = (id)objc_claimAutoreleasedReturnValue();
          id v591 = v22;
          if (!v45) {
            goto LABEL_50;
          }
          v51 = objc_msgSend_strokeIndexes(v45, v46, v47, v48, v49, v50);
          uint64_t v57 = objc_msgSend_count(v51, v52, v53, v54, v55, v56);
          v63 = objc_msgSend_strokeIdentifiers(v591, v58, v59, v60, v61, v62);
          LOBYTE(v57) = v57 == objc_msgSend_count(v63, v64, v65, v66, v67, v68);

          if ((v57 & 1) == 0)
          {
LABEL_50:

            goto LABEL_51;
          }
          v74 = objc_msgSend_topTranscription(v45, v69, v70, v71, v72, v73);
          v79 = objc_msgSend_componentsSeparatedByString_(v74, v75, @"\\\\"", v76, v77, v78);
          uint64_t v85 = objc_msgSend_count(v79, v80, v81, v82, v83, v84);

          v91 = objc_msgSend_topTranscription(v45, v86, v87, v88, v89, v90);
          v96 = objc_msgSend_componentsSeparatedByString_(v91, v92, @"\\\\ \\hline", v93, v94, v95);
          uint64_t v102 = objc_msgSend_count(v96, v97, v98, v99, v100, v101);

          BOOL v104 = v85 > 1 && v85 != v102;
          if (v104)
          {
            objc_msgSend_mathResult(v601, v105, v106, v107, v108, v109);
            id v610 = (id)objc_claimAutoreleasedReturnValue();
            v115 = objc_msgSend_transcriptionPaths(v610, v110, v111, v112, v113, v114);
            v607 = objc_msgSend_firstObject(v115, v116, v117, v118, v119, v120);

            v126 = 0;
            v597 = 0;
            v127 = 0;
            uint64_t v604 = 0;
            for (uint64_t i = 0; ; ++i)
            {
              if (i >= objc_msgSend_tokenColumnCount(v610, v121, v122, v123, v124, v125))
              {
                v614 = v127;
                v613 = v126;
                if (v604 >= objc_msgSend_tokenColumnCount(v610, v129, v130, v131, v132, v133)) {
                  goto LABEL_70;
                }
                uint64_t v221 = objc_msgSend_tokenColumnCount(v610, v216, v217, v218, v219, v220) - v604;
                v222 = v127;
                if (v127 < v597)
                {
                  uint64_t *v127 = v604;
                  v127[1] = v221;
                  v223 = v127 + 2;
                  goto LABEL_69;
                }
                uint64_t v224 = ((char *)v127 - (char *)v126) >> 4;
                unint64_t v225 = v224 + 1;
                if ((unint64_t)(v224 + 1) >> 60) {
                  sub_1C494A220();
                }
                if (v597 - v126 > v225) {
                  unint64_t v225 = v597 - v126;
                }
                if ((unint64_t)((char *)v597 - (char *)v126) >= 0x7FFFFFFFFFFFFFF0) {
                  unint64_t v226 = 0xFFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v226 = v225;
                }
                if (v226)
                {
                  if (v226 >> 60) {
                    sub_1C4949AA8();
                  }
                  v227 = (uint64_t *)((char *)operator new(16 * v226) + 16 * v224);
                  uint64_t *v227 = v604;
                  v227[1] = v221;
                  if (v127 != v126)
                  {
LABEL_65:
                    v228 = v227;
                    do
                    {
                      v229 = v228 - 2;
                      *((_OWORD *)v228 - 1) = *((_OWORD *)v222 - 1);
                      v222 -= 2;
                      v228 -= 2;
                    }
                    while (v222 != v126);
                    v223 = v227 + 2;
                    v613 = v229;
                    if (v126) {
LABEL_68:
                    }
                      operator delete(v126);
LABEL_69:
                    v614 = v223;
LABEL_70:

                    v583 = objc_msgSend_mathResult(v601, v230, v231, v232, v233, v234);
                    int64_t v235 = (char *)v614 - (char *)v613;
                    if (v614 == v613)
                    {
                      v586 = 0;
                      __p = 0;
                    }
                    else
                    {
                      if (v235 < 0) {
                        sub_1C494A220();
                      }
                      v236 = (unint64_t *)operator new((char *)v614 - (char *)v613);
                      v237 = &v236[2 * (v235 >> 4)];
                      __p = v236;
                      memcpy(v236, v613, v235);
                      v586 = v237;
                    }
                    id v605 = v583;
                    v588 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v238, v239, v240, v241, v242);
                    for (j = __p; j != v586; j += 2)
                    {
                      v248 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v243, v244, v245, v246, v247);
                      long long v621 = 0u;
                      long long v622 = 0u;
                      long long v619 = 0u;
                      long long v620 = 0u;
                      objc_msgSend_transcriptionPaths(v605, v249, v250, v251, v252, v253);
                      id obj = (id)objc_claimAutoreleasedReturnValue();
                      uint64_t v594 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v254, (uint64_t)&v619, (uint64_t)v624, 16, v255);
                      if (v594)
                      {
                        uint64_t v261 = 0;
                        uint64_t v593 = *(void *)v620;
                        do
                        {
                          for (uint64_t k = 0; k != v594; ++k)
                          {
                            if (*(void *)v620 != v593) {
                              objc_enumerationMutation(obj);
                            }
                            uint64_t v608 = *(void *)(*((void *)&v619 + 1) + 8 * k);
                            v262 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v256, v257, v258, v259, v260);
                            objc_msgSend_addObject_(v248, v263, (uint64_t)v262, v264, v265, v266);

                            for (unint64_t m = *j; m < j[1] + *j; ++m)
                            {
                              v273 = objc_msgSend_tokensInTranscriptionPath_atColumnIndex_(v605, v256, v608, m, v259, v260);
                              for (unint64_t n = 0; n < objc_msgSend_count(v273, v268, v269, v270, v271, v272); ++n)
                              {
                                v279 = objc_msgSend_objectAtIndexedSubscript_(v273, v275, n, v276, v277, v278);
                                v285 = objc_msgSend_string(v279, v280, v281, v282, v283, v284);
                                char isEqualToString = objc_msgSend_isEqualToString_(v285, v286, @"\\\\"", v287, v288, v289);

                                if ((isEqualToString & 1) == 0
                                  || n < objc_msgSend_count(v273, v291, v292, v293, v294, v295) - 1
                                  && (objc_msgSend_objectAtIndexedSubscript_(v273, v296, n + 1, v297, v298, v299),
                                      v300 = objc_claimAutoreleasedReturnValue(),
                                      objc_msgSend_string(v300, v301, v302, v303, v304, v305),
                                      v306 = objc_claimAutoreleasedReturnValue(),
                                      int v311 = objc_msgSend_isEqualToString_(v306, v307, @"\\hline", v308, v309, v310), v306, v300, v311))
                                {
                                  v312 = objc_msgSend_objectAtIndexedSubscript_(v248, v291, v261, v293, v294, v295);
                                  objc_msgSend_addObject_(v312, v313, (uint64_t)v279, v314, v315, v316);
                                }
                              }
                            }
                            ++v261;
                          }
                          uint64_t v594 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v256, (uint64_t)&v619, (uint64_t)v624, 16, v260);
                        }
                        while (v594);
                      }

                      v317 = [CHTokenizedMathResult alloc];
                      v322 = objc_msgSend_initWithBestPathTokens_(v317, v318, (uint64_t)v248, v319, v320, v321);
                      objc_msgSend_addObject_(v588, v323, (uint64_t)v322, v324, v325, v326);
                    }
                    if (__p) {
                      operator delete(__p);
                    }

                    v332 = objc_msgSend_mathResult(v601, v327, v328, v329, v330, v331);
                    v606 = objc_msgSend_updateStrokeIndexOffsetForSubResults_fromResult_(CHTokenizedMathResult, v333, (uint64_t)v588, (uint64_t)v332, v334, v335);

                    int64_t v341 = (char *)v614 - (char *)v613;
                    if (v614 == v613)
                    {
                      v343 = 0;
                      v342 = 0;
                    }
                    else
                    {
                      if (v341 < 0) {
                        sub_1C494A220();
                      }
                      v342 = (uint64_t *)operator new((char *)v614 - (char *)v613);
                      v343 = &v342[2 * (v341 >> 4)];
                      memcpy(v342, v613, v341);
                    }
                    objc_msgSend_mathResult(v601, v336, v337, v338, v339, v340);
                    id v344 = (id)objc_claimAutoreleasedReturnValue();
                    *(void *)&long long v619 = 0;
                    *((void *)&v619 + 1) = &v619;
                    *(void *)&long long v620 = 0x2020000000;
                    BYTE8(v620) = 1;
                    v624[0] = MEMORY[0x1E4F143A8];
                    v624[1] = 3221225472;
                    v625[0] = sub_1C4B6037C;
                    v625[1] = &unk_1E64E4348;
                    v625[2] = &v619;
                    objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v344, v345, (uint64_t)v624, v346, v347, v348);
                    if (*(unsigned char *)(*((void *)&v619 + 1) + 24))
                    {
                      uint64_t v352 = (char *)v343 - (char *)v342;
                      if (v343 != v342)
                      {
                        uint64_t v353 = 0;
                        unint64_t v354 = v352 >> 4;
                        v355 = v342 + 1;
                        while (1)
                        {
                          v356 = objc_msgSend_strokeIndexesForColumnsInRange_(v344, v349, *(v355 - 1), *v355, v350, v351);
                          if (!objc_msgSend_count(v356, v357, v358, v359, v360, v361)) {
                            break;
                          }

                          v355 += 2;
                          if (++v353 >= v354) {
                            goto LABEL_109;
                          }
                        }
                        *(unsigned char *)(*((void *)&v619 + 1) + 24) = 0;
                      }
LABEL_109:
                      BOOL v362 = *(unsigned char *)(*((void *)&v619 + 1) + 24) != 0;
                    }
                    else
                    {
                      BOOL v362 = 0;
                    }
                    _Block_object_dispose(&v619, 8);

                    if (v342) {
                      operator delete(v342);
                    }
                    if (v362)
                    {
                      v599 = objc_msgSend_inputStrokeIdentifiers(v601, v363, v364, v365, v366, v367);
                      for (iuint64_t i = 0; ii < objc_msgSend_count(v588, v368, v369, v370, v371, v372); ++ii)
                      {
                        v378 = objc_msgSend_objectAtIndexedSubscript_(v588, v374, ii, v375, v376, v377);
                        v609 = objc_msgSend_strokeIndexes(v378, v379, v380, v381, v382, v383);
                        v388 = objc_msgSend_objectsAtIndexes_(v599, v384, (uint64_t)v609, v385, v386, v387);
                        v394 = objc_msgSend_firstObject(v388, v389, v390, v391, v392, v393);
                        v612 = objc_msgSend_lastObject(v388, v395, v396, v397, v398, v399);
                        objc_msgSend_bounds(v378, v400, v401, v402, v403, v404);
                        v410 = objc_msgSend_groupingManager(self, v405, v406, v407, v408, v409);
                        v416 = objc_msgSend_strokeProvider(v410, v411, v412, v413, v414, v415);
                        BOOL v417 = v416 == 0;

                        if (!v417)
                        {
                          v423 = objc_msgSend_groupingManager(self, v418, v419, v420, v421, v422);
                          v429 = objc_msgSend_strokeProvider(v423, v424, v425, v426, v427, v428);
                          v433 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v430, (uint64_t)v394, (uint64_t)v429, v431, v432);
                          objc_msgSend_bounds(v433, v434, v435, v436, v437, v438);
                        }
                        v439 = [CHStrokeGroup alloc];
                        uint64_t v445 = objc_msgSend_ancestorIdentifier(v591, v440, v441, v442, v443, v444);
                        v450 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v446, (uint64_t)v388, v447, v448, v449);
                        objc_msgSend_bounds(v378, v451, v452, v453, v454, v455);
                        StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigiunint64_t n = objc_msgSend_initWithAncestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v439, v456, v445, (uint64_t)v450, (uint64_t)v394, (uint64_t)v612, 3, @"CHGroupingPostProcessingManager");

                        if (v600) {
                          v458 = (void *)*((void *)v600 + 9);
                        }
                        else {
                          v458 = 0;
                        }
                        id v459 = v458;
                        objc_msgSend_addObject_(v459, v460, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v461, v462, v463);

                        if (!objc_msgSend_saveInputDrawings(self, v464, v465, v466, v467, v468)
                          || (objc_msgSend_groupingManager(self, v469, v470, v471, v472, v473),
                              v474 = objc_claimAutoreleasedReturnValue(),
                              BOOL v475 = v474 == 0,
                              v474,
                              v475))
                        {
                          v483 = 0;
                        }
                        else
                        {
                          v481 = objc_msgSend_groupingManager(self, v476, v477, v478, v479, v480);
                          v483 = objc_msgSend_recognizableDrawingForStrokeGroup_translationVector_originalDrawing_orderedStrokesIDs_rescalingFactor_replacementStrokeGroup_(v481, v482, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, 0, 0, 0, 0, 0.0, 0.0);
                        }
                        v484 = [CHStrokeGroupRecognitionResult alloc];
                        v489 = objc_msgSend_objectAtIndexedSubscript_(v606, v485, ii, v486, v487, v488);
                        v491 = objc_msgSend_initWithOrderedLocales_resultsByLocale_errorsByLocale_languageFitnessByLocale_mathResult_inputStrokeIdentifiers_inputDrawing_inputDrawingCutPoints_(v484, v490, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CC08], MEMORY[0x1E4F1CC08], MEMORY[0x1E4F1CC08], v489, v388, v483, 0, v582);

                        if (v600) {
                          v492 = (void *)*((void *)v600 + 10);
                        }
                        else {
                          v492 = 0;
                        }
                        id v493 = v492;
                        v494 = NSNumber;
                        uint64_t v500 = objc_msgSend_uniqueIdentifier(StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v495, v496, v497, v498, v499);
                        v505 = objc_msgSend_numberWithInteger_(v494, v501, v500, v502, v503, v504);
                        objc_msgSend_setObject_forKey_(v493, v506, (uint64_t)v491, (uint64_t)v505, v507, v508);
                      }
                      if (v600) {
                        v509 = (void *)*((void *)v600 + 9);
                      }
                      else {
                        v509 = 0;
                      }
                      id v510 = v509;
                      objc_msgSend_removeObject_(v510, v511, (uint64_t)v591, v512, v513, v514);

                      if (v600) {
                        v515 = (void *)*((void *)v600 + 10);
                      }
                      else {
                        v515 = 0;
                      }
                      id v516 = v515;
                      v517 = NSNumber;
                      uint64_t v523 = objc_msgSend_uniqueIdentifier(v591, v518, v519, v520, v521, v522);
                      v528 = objc_msgSend_numberWithInteger_(v517, v524, v523, v525, v526, v527);
                      objc_msgSend_removeObjectForKey_(v516, v529, (uint64_t)v528, v530, v531, v532);
                    }
                    if (v613) {
                      operator delete(v613);
                    }
                    goto LABEL_51;
                  }
                }
                else
                {
                  v227 = (uint64_t *)(16 * v224);
                  uint64_t *v227 = v604;
                  v227[1] = v221;
                  if (v127 != v126) {
                    goto LABEL_65;
                  }
                }
                v223 = v227 + 2;
                v613 = v227;
                if (v126) {
                  goto LABEL_68;
                }
                goto LABEL_69;
              }
              v134 = objc_msgSend_tokenRowsAtColumnIndex_(v610, v129, i, v131, v132, v133);
              uint64_t v139 = objc_msgSend_indexAtPosition_(v607, v135, i, v136, v137, v138);
              v144 = objc_msgSend_objectAtIndexedSubscript_(v134, v140, v139, v141, v142, v143);
              v149 = objc_msgSend_objectAtIndexedSubscript_(v144, v145, 0, v146, v147, v148);
              v155 = objc_msgSend_string(v149, v150, v151, v152, v153, v154);
              int v160 = objc_msgSend_isEqualToString_(v155, v156, @"\\\\"", v157, v158, v159);

              if (v160) {
                break;
              }
LABEL_46:
            }
            if ((unint64_t)objc_msgSend_count(v144, v161, v162, v163, v164, v165) < 2)
            {
              if (i < objc_msgSend_tokenColumnCount(v610, v166, v167, v168, v169, v170) - 1)
              {
                uint64_t v187 = objc_msgSend_indexAtPosition_(v607, v183, i + 1, v184, v185, v186);
                v171 = objc_msgSend_objectAtIndexedSubscript_(v134, v188, v187, v189, v190, v191);
                v177 = objc_msgSend_objectAtIndexedSubscript_(v171, v192, 0, v193, v194, v195);
                v201 = objc_msgSend_string(v177, v196, v197, v198, v199, v200);
                char v182 = objc_msgSend_isEqualToString_(v201, v202, @"\\hline", v203, v204, v205);

                goto LABEL_27;
              }
            }
            else
            {
              v171 = objc_msgSend_objectAtIndexedSubscript_(v144, v166, 1, v168, v169, v170);
              v177 = objc_msgSend_string(v171, v172, v173, v174, v175, v176);
              char v182 = objc_msgSend_isEqualToString_(v177, v178, @"\\hline", v179, v180, v181);
LABEL_27:

              if (v182) {
                goto LABEL_46;
              }
            }
            uint64_t v206 = i - v604;
            if (i - v604 < 1) {
              goto LABEL_46;
            }
            if (v127 < v597)
            {
              uint64_t *v127 = v604;
              v127[1] = v206;
              v127 += 2;
LABEL_45:
              uint64_t v604 = i;
              goto LABEL_46;
            }
            uint64_t v207 = ((char *)v127 - (char *)v126) >> 4;
            unint64_t v208 = v207 + 1;
            if ((unint64_t)(v207 + 1) >> 60) {
              sub_1C494A220();
            }
            if (v597 - v126 > v208) {
              unint64_t v208 = v597 - v126;
            }
            if ((unint64_t)((char *)v597 - (char *)v126) >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v209 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v209 = v208;
            }
            if (v209)
            {
              if (v209 >> 60) {
                sub_1C4949AA8();
              }
              v210 = (char *)operator new(16 * v209);
              v211 = (uint64_t *)&v210[16 * v207];
              uint64_t *v211 = v604;
              v211[1] = v206;
              if (v127 != v126)
              {
LABEL_40:
                v212 = v211;
                do
                {
                  v213 = v212 - 2;
                  *((_OWORD *)v212 - 1) = *((_OWORD *)v127 - 1);
                  v127 -= 2;
                  v212 -= 2;
                }
                while (v127 != v126);
                v597 = (uint64_t *)&v210[16 * v209];
                v127 = v211 + 2;
                if (v126) {
LABEL_43:
                }
                  operator delete(v126);
LABEL_44:
                v126 = v213;
                goto LABEL_45;
              }
            }
            else
            {
              v210 = 0;
              v211 = (uint64_t *)(16 * v207);
              uint64_t *v211 = v604;
              v211[1] = v206;
              if (v127 != v126) {
                goto LABEL_40;
              }
            }
            v213 = v211;
            v597 = (uint64_t *)&v210[16 * v209];
            v127 = v211 + 2;
            if (v126) {
              goto LABEL_43;
            }
            goto LABEL_44;
          }
LABEL_51:

          ++v590;
          v12 = v595;
        }
        while (v590 != v587);
        uint64_t v533 = objc_msgSend_countByEnumeratingWithState_objects_count_(v595, v214, (uint64_t)&v615, (uint64_t)v623, 16, v215);
        uint64_t v20 = v533;
        if (!v533) {
          goto LABEL_146;
        }
      }
    }
    if (v600)
    {
      do
      {
        uint64_t v534 = v20;
        for (uint64_t jj = 0; jj != v534; ++jj)
        {
          if (*(void *)v616 != v596) {
            objc_enumerationMutation(v595);
          }
          v536 = *(void **)(*((void *)&v615 + 1) + 8 * jj);
          id v537 = *((id *)v600 + 10);
          v538 = NSNumber;
          uint64_t v544 = objc_msgSend_uniqueIdentifier(v536, v539, v540, v541, v542, v543);
          v549 = objc_msgSend_numberWithInteger_(v538, v545, v544, v546, v547, v548);
          v602 = objc_msgSend_objectForKeyedSubscript_(v537, v550, (uint64_t)v549, v551, v552, v553);

          objc_msgSend_mathResult(v602, v554, v555, v556, v557, v558);
          id v559 = (id)objc_claimAutoreleasedReturnValue();
        }
        v12 = v595;
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v595, v560, (uint64_t)&v615, (uint64_t)v623, 16, v561);
      }
      while (v20);
    }
    else
    {
      do
      {
        for (uint64_t kk = 0; kk != v20; ++kk)
        {
          if (*(void *)v616 != v596) {
            objc_enumerationMutation(v595);
          }
          v564 = *(void **)(*((void *)&v615 + 1) + 8 * kk);
          v565 = NSNumber;
          uint64_t v566 = objc_msgSend_uniqueIdentifier(v564, v15, v16, v17, v18, v19);
          v571 = objc_msgSend_numberWithInteger_(v565, v567, v566, v568, v569, v570);
          v603 = objc_msgSend_objectForKeyedSubscript_(0, v572, (uint64_t)v571, v573, v574, v575);

          objc_msgSend_mathResult(v603, v576, v577, v578, v579, v580);
          id v581 = (id)objc_claimAutoreleasedReturnValue();
        }
        v12 = v595;
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v595, v15, (uint64_t)&v615, (uint64_t)v623, 16, v19);
      }
      while (v20);
    }
  }
LABEL_146:

  return v600;
}

@end