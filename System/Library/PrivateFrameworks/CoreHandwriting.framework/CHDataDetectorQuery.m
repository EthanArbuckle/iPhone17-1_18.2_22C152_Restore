@interface CHDataDetectorQuery
- (BOOL)q_doesQueryResultDependOnDeclaredVariables;
- (BOOL)q_resultWantedForCompleteness:(int64_t)a3;
- (CHDataDetectorQuery)initWithRecognitionSession:(id)a3;
- (NSArray)foundItems;
- (id)debugName;
- (void)q_updateQueryResult;
@end

@implementation CHDataDetectorQuery

- (CHDataDetectorQuery)initWithRecognitionSession:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CHDataDetectorQuery;
  v5 = [(CHQuery *)&v19 initWithRecognitionSession:v4];
  if (v5)
  {
    v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    foundItems = v5->_foundItems;
    v5->_foundItems = v6;

    id v8 = objc_alloc(MEMORY[0x1E4F5F160]);
    uint64_t v12 = objc_msgSend_initWithScannerType_passiveIntent_(v8, v9, 0, 1, v10, v11);
    dataDetectorConfiguration = v5->_dataDetectorConfiguration;
    v5->_dataDetectorConfiguration = (DDScannerServiceConfiguration *)v12;

    objc_msgSend_setSpotlightSuggestionsEnabled_(v5->_dataDetectorConfiguration, v14, 1, v15, v16, v17);
  }

  return v5;
}

- (void)q_updateQueryResult
{
  uint64_t v553 = *MEMORY[0x1E4F143B8];
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v2 = (id)qword_1EA3C9FC8;
  os_signpost_id_t spid = os_signpost_id_generate(v2);

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v3 = (id)qword_1EA3C9FC8;
  id v4 = v3;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CHDataDetectorQuery_update", "", (uint8_t *)&buf, 2u);
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v5 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1C492D000, v5, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHDataDetectorQuery_update\"", (uint8_t *)&buf, 2u);
  }

  v505.receiver = self;
  v505.super_class = (Class)CHDataDetectorQuery;
  [(CHQuery *)&v505 q_updateQueryResult];
  objc_msgSend_q_sessionResult(self, v6, v7, v8, v9, v10);
  id v486 = (id)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v11 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1C492D000, v11, OS_LOG_TYPE_DEFAULT, "CHDataDetectorQuery._dataDetectorResultsForSessionResult: start", (uint8_t *)&buf, 2u);
    }

    v476 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v12, v13, v14, v15, v16);
    v22 = objc_msgSend_strokeGroupingResult(v486, v17, v18, v19, v20, v21);
    v28 = objc_msgSend_textStrokeGroupClusters(v22, v23, v24, v25, v26, v27);

    long long v516 = 0u;
    long long v517 = 0u;
    long long v515 = 0u;
    long long v514 = 0u;
    obuint64_t j = v28;
    unint64_t v31 = 0x1E4F1C000uLL;
    uint64_t v469 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v514, (uint64_t)v540, 16, v30);
    if (v469)
    {
      uint64_t v473 = *(void *)v515;
      *(void *)&long long v37 = 138412290;
      long long v465 = v37;
      do
      {
        uint64_t v479 = 0;
        do
        {
          if (*(void *)v515 != v473) {
            objc_enumerationMutation(obj);
          }
          v38 = *(void **)(*((void *)&v514 + 1) + 8 * v479);
          v484 = objc_msgSend_array(*(void **)(v31 + 2632), v32, v33, v34, v35, v36, v465);
          v485 = objc_msgSend_array(*(void **)(v31 + 2632), v39, v40, v41, v42, v43);
          unint64_t v49 = 0;
          BOOL v497 = 0;
          v489 = 0;
          uint64_t v499 = -1;
          while (v49 < objc_msgSend_count(v38, v44, v45, v46, v47, v48))
          {
            v54 = objc_msgSend_objectAtIndexedSubscript_(v38, v50, v49, v51, v52, v53);
            uint64_t v60 = objc_msgSend_uniqueIdentifier(v54, v55, v56, v57, v58, v59);
            v65 = objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v486, v61, v60, v62, v63, v64);
            v501 = v54;
            v503 = objc_msgSend_preferredLocale(v65, v66, v67, v68, v69, v70);
            v71 = objc_opt_class();
            v77 = objc_msgSend_recognitionResultsByLocale(v65, v72, v73, v74, v75, v76);
            v83 = objc_msgSend_locales(v486, v78, v79, v80, v81, v82);
            v89 = objc_msgSend_languageFitnessByLocale(v65, v84, v85, v86, v87, v88);
            v91 = objc_msgSend_filteredResultsByLocale_orderedLocales_usingLanguageFitness_outSortedLocales_(v71, v90, (uint64_t)v77, (uint64_t)v83, (uint64_t)v89, 0);

            v100 = objc_msgSend_objectForKeyedSubscript_(v91, v92, (uint64_t)v503, v93, v94, v95);
            if (!v100)
            {
              id v121 = v489;
              goto LABEL_42;
            }
            objc_msgSend_addObject_(v484, v96, (uint64_t)v54, v97, v98, v99);
            v106 = objc_msgSend_languageCode(v503, v101, v102, v103, v104, v105);
            if (objc_msgSend_isEqualToString_(v106, v107, @"zh", v108, v109, v110))
            {
            }
            else
            {
              v122 = objc_msgSend_languageCode(v503, v111, v112, v113, v114, v115);
              int isEqualToString = objc_msgSend_isEqualToString_(v122, v123, @"yue", v124, v125, v126);

              v128 = @"\n";
              if (!isEqualToString) {
                goto LABEL_32;
              }
            }
            *(void *)&long long buf = 0;
            *((void *)&buf + 1) = &buf;
            uint64_t v544 = 0x2020000000;
            int v545 = 103;
            v129 = objc_msgSend_topTranscription(v100, v116, v117, v118, v119, v120);
            v135 = objc_msgSend_topTranscription(v100, v130, v131, v132, v133, v134);
            uint64_t v141 = objc_msgSend_length(v135, v136, v137, v138, v139, v140);
            v513[0] = MEMORY[0x1E4F143A8];
            v513[1] = 3221225472;
            v513[2] = sub_1C4B251B4;
            v513[3] = &unk_1E64E1140;
            v513[4] = &buf;
            objc_msgSend_enumerateCodepointsInRange_reverse_usingBlock_(v129, v142, 0, v141, 1, (uint64_t)v513);

            int v143 = *(_DWORD *)(*((void *)&buf + 1) + 24);
            _Block_object_dispose(&buf, 8);
            if (v143 == 17) {
              v128 = 0;
            }
            else {
              v128 = @"\n";
            }
LABEL_32:
            v144 = objc_msgSend_mathResult(v65, v116, v117, v118, v119, v120);
            BOOL v145 = v144 != 0;

            v151 = objc_msgSend_lastObject(v485, v146, v147, v148, v149, v150);
            BOOL v152 = v144 != 0;
            if (v151) {
              BOOL v153 = v49 == v499 + 1;
            }
            else {
              BOOL v153 = 0;
            }
            char v154 = !v153;

            if (!(v154 & 1 | !((v489 != 0) & (v497 ^ v152))))
            {
              v155 = objc_opt_class();
              if (objc_msgSend_isStrokeGroup_inlineWithNextGroup_(v155, v156, (uint64_t)v501, (uint64_t)v489, v157, v158))
              {
                v164 = objc_msgSend_lastObject(v485, v159, v160, v161, v162, v163);
                objc_msgSend_setTerminatingSpecialCharacter_(v164, v165, @" ", v166, v167, v168);
              }
            }
            id v121 = v501;

            v169 = [CHContextualTextResult alloc];
            v172 = objc_msgSend_initWithTextResult_terminatingSpecialCharacter_strokeGroup_(v169, v170, (uint64_t)v100, (uint64_t)v128, (uint64_t)v121, v171);
            objc_msgSend_addObject_(v485, v173, (uint64_t)v172, v174, v175, v176);

            uint64_t v499 = v49;
            BOOL v497 = v145;
LABEL_42:

            ++v49;
            v489 = v121;
          }
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          v177 = (id)qword_1EA3C9F90[0];
          if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v183 = objc_msgSend_count(v485, v178, v179, v180, v181, v182);
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v183;
            _os_log_impl(&dword_1C492D000, v177, OS_LOG_TYPE_DEFAULT, "CHDataDetectorQuery._dataDetectorResultsForSessionResult: contextualTextResults.count = %lu", (uint8_t *)&buf, 0xCu);
          }

          if (objc_msgSend_count(v485, v184, v185, v186, v187, v188))
          {
            v189 = [CHContextualTextResults alloc];
            v194 = objc_msgSend_initWithTextResults_(v189, v190, (uint64_t)v485, v191, v192, v193);
            v506[0] = MEMORY[0x1E4F143A8];
            v506[1] = 3221225472;
            v507 = sub_1C4B25218;
            v508 = &unk_1E64E3E08;
            id v509 = v484;
            id v510 = v486;
            v511 = self;
            id v512 = v476;
            id v195 = v194;
            v466 = v506;
            v480 = v195;
            objc_msgSend_topTranscription(v195, v196, v197, v198, v199, v200);
            unint64_t v201 = 0x1E4F1C000uLL;
            v202 = (NSString *)objc_claimAutoreleasedReturnValue();
            v203 = (void *)MEMORY[0x1E4F5F158];
            v467 = v202;
            uint64_t v209 = objc_msgSend_length(v202, v204, v205, v206, v207, v208);
            objc_msgSend_scanString_range_configuration_(v203, v210, (uint64_t)v202, 0, v209, (uint64_t)self->_dataDetectorConfiguration);
            id v481 = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_count(v481, v211, v212, v213, v214, v215)
              || !isUndetectableAddressCandidate(v202, v216, v217, v218, v219, v220))
            {
              int v475 = 0;
              id v471 = 0;
            }
            else
            {
              id v531 = 0;
              v225 = reformatToBetterAddressMatching(v202, (char *)&v531, v221, v222, v223, v224);
              id v471 = v531;
              v226 = (void *)MEMORY[0x1E4F5F158];
              uint64_t v232 = objc_msgSend_length(v225, v227, v228, v229, v230, v231);
              uint64_t v234 = objc_msgSend_scanString_range_configuration_(v226, v233, (uint64_t)v225, 0, v232, (uint64_t)self->_dataDetectorConfiguration);

              int v475 = 1;
              id v481 = (id)v234;
            }
            long long v529 = 0u;
            long long v530 = 0u;
            long long v527 = 0u;
            long long v528 = 0u;
            id v482 = v481;
            uint64_t v468 = objc_msgSend_countByEnumeratingWithState_objects_count_(v482, v235, (uint64_t)&v527, (uint64_t)&buf, 16, v236);
            if (v468)
            {
              uint64_t v472 = *(void *)v528;
              do
              {
                uint64_t v478 = 0;
                do
                {
                  if (*(void *)v528 != v472) {
                    objc_enumerationMutation(v482);
                  }
                  v470 = *(void **)(*((void *)&v527 + 1) + 8 * v478);
                  uint64_t v242 = objc_msgSend_urlificationRange(v470, v237, v238, v239, v240, v241);
                  uint64_t v247 = v242;
                  uint64_t v248 = (uint64_t)v243;
                  if (v475)
                  {
                    uint64_t v536 = 0;
                    v537 = &v536;
                    uint64_t v538 = 0x2020000000;
                    uint64_t v539 = 0;
                    uint64_t v532 = 0;
                    v533 = &v532;
                    uint64_t v534 = 0x2020000000;
                    uint64_t v535 = 0;
                    *(void *)&long long v546 = MEMORY[0x1E4F143A8];
                    *((void *)&v546 + 1) = 3221225472;
                    v547 = sub_1C4A43C80;
                    v548 = &unk_1E64E2B50;
                    uint64_t v551 = v242;
                    v552 = v243;
                    v549 = &v536;
                    v550 = &v532;
                    objc_msgSend_enumerateIndexesUsingBlock_(v471, v243, (uint64_t)&v546, v244, v245, v246);
                    v247 -= v537[3];
                    v248 -= v533[3];
                    _Block_object_dispose(&v532, 8);
                    _Block_object_dispose(&v536, 8);
                  }
                  id v526 = 0;
                  v494 = objc_msgSend_textResultToIndexMappingFromTopTranscriptionWithCharacterRange_intersectionRanges_(v480, v243, v247, v248, (uint64_t)&v526, v246);
                  id v491 = v526;
                  v492 = objc_msgSend_array(*(void **)(v201 + 2632), v249, v250, v251, v252, v253);
                  v504 = objc_msgSend_array(*(void **)(v201 + 2632), v254, v255, v256, v257, v258);
                  v498 = objc_msgSend_array(*(void **)(v201 + 2632), v259, v260, v261, v262, v263);
                  v488 = objc_msgSend_array(*(void **)(v201 + 2632), v264, v265, v266, v267, v268);
                  v487 = objc_msgSend_array(*(void **)(v201 + 2632), v269, v270, v271, v272, v273);
                  long long v524 = 0u;
                  long long v525 = 0u;
                  long long v522 = 0u;
                  long long v523 = 0u;
                  objc_msgSend_textResults(v480, v274, v275, v276, v277, v278);
                  id v490 = (id)objc_claimAutoreleasedReturnValue();
                  uint64_t v281 = objc_msgSend_countByEnumeratingWithState_objects_count_(v490, v279, (uint64_t)&v522, (uint64_t)v542, 16, v280);
                  unint64_t v287 = 0;
                  if (v281)
                  {
                    uint64_t v493 = *(void *)v523;
                    do
                    {
                      uint64_t v495 = v281;
                      for (uint64_t i = 0; i != v495; ++i)
                      {
                        if (*(void *)v523 != v493) {
                          objc_enumerationMutation(v490);
                        }
                        v289 = *(void **)(*((void *)&v522 + 1) + 8 * i);
                        v290 = objc_msgSend_textResult(v289, v282, v283, v284, v285, v286);
                        v300 = objc_msgSend_objectForKeyedSubscript_(v494, v291, (uint64_t)v290, v292, v293, v294);
                        if (v300)
                        {
                          v496 = v289;
                          v301 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v295, v296, v297, v298, v299);
                          uint64_t v500 = (uint64_t)v300;
                          v306 = objc_msgSend_objectForKey_(v491, v302, (uint64_t)v300, v303, v304, v305);
                          uint64_t v312 = objc_msgSend_rangeValue(v306, v307, v308, v309, v310, v311);
                          uint64_t v314 = v313;

                          v320 = objc_msgSend_transcriptionPaths(v290, v315, v316, v317, v318, v319);
                          v326 = objc_msgSend_firstObject(v320, v321, v322, v323, v324, v325);
                          v502 = objc_msgSend_tokensFromTranscriptionPath_characterRange_(v290, v327, (uint64_t)v326, v312, v314, v328);

                          objc_msgSend_addObjectsFromArray_(v492, v329, (uint64_t)v502, v330, v331, v332);
                          long long v520 = 0u;
                          long long v521 = 0u;
                          long long v518 = 0u;
                          long long v519 = 0u;
                          id v333 = v502;
                          uint64_t v338 = objc_msgSend_countByEnumeratingWithState_objects_count_(v333, v334, (uint64_t)&v518, (uint64_t)v541, 16, v335);
                          if (v338)
                          {
                            uint64_t v339 = *(void *)v519;
                            do
                            {
                              for (uint64_t j = 0; j != v338; ++j)
                              {
                                if (*(void *)v519 != v339) {
                                  objc_enumerationMutation(v333);
                                }
                                v341 = *(void **)(*((void *)&v518 + 1) + 8 * j);
                                unsigned int shouldPerformStrictFiltering = objc_msgSend_shouldFilterOutStringForToken_isGibberish_shouldPerformStrictFiltering_(v290, v336, (uint64_t)v341, 0, 0, v337);
                                v348 = objc_msgSend_strokeIndexes(v341, v343, v344, v345, v346, v347);
                                objc_msgSend_addIndexes_(v301, v349, (uint64_t)v348, v350, v351, v352);

                                v287 += shouldPerformStrictFiltering;
                              }
                              uint64_t v338 = objc_msgSend_countByEnumeratingWithState_objects_count_(v333, v336, (uint64_t)&v518, (uint64_t)v541, 16, v337);
                            }
                            while (v338);
                          }

                          objc_msgSend_addObject_(v504, v353, v500, v354, v355, v356);
                          objc_msgSend_addObject_(v498, v357, (uint64_t)v301, v358, v359, v360);
                          v366 = objc_msgSend_terminatingSpecialCharacter(v496, v361, v362, v363, v364, v365);
                          char v371 = objc_msgSend_isEqualToString_(v366, v367, @" ", v368, v369, v370);

                          if (v371)
                          {
                            uint64_t v377 = (uint64_t)v504;
                          }
                          else
                          {
                            v378 = objc_msgSend_copy(v504, v372, v373, v374, v375, v376);
                            objc_msgSend_addObject_(v488, v379, (uint64_t)v378, v380, v381, v382);

                            v388 = objc_msgSend_copy(v498, v383, v384, v385, v386, v387);
                            objc_msgSend_addObject_(v487, v389, (uint64_t)v388, v390, v391, v392);

                            uint64_t v377 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v393, v394, v395, v396, v397);

                            uint64_t v403 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v398, v399, v400, v401, v402);

                            v498 = (void *)v403;
                          }

                          v504 = (void *)v377;
                          v300 = (void *)v500;
                        }
                      }
                      uint64_t v281 = objc_msgSend_countByEnumeratingWithState_objects_count_(v490, v282, (uint64_t)&v522, (uint64_t)v542, 16, v286);
                    }
                    while (v281);
                  }

                  if (objc_msgSend_count(v504, v404, v405, v406, v407, v408))
                  {
                    v414 = objc_msgSend_copy(v504, v409, v410, v411, v412, v413);
                    objc_msgSend_addObject_(v488, v415, (uint64_t)v414, v416, v417, v418);

                    v424 = objc_msgSend_copy(v498, v419, v420, v421, v422, v423);
                    objc_msgSend_addObject_(v487, v425, (uint64_t)v424, v426, v427, v428);
                  }
                  if (v287 < objc_msgSend_count(v492, v409, v410, v411, v412, v413))
                  {
                    if (!objc_msgSend_count(v488, v429, v430, v431, v432, v433))
                    {
                      if (qword_1EA3CA000 != -1) {
                        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                      }
                      v434 = (id)qword_1EA3C9F90[0];
                      if (os_log_type_enabled(v434, OS_LOG_TYPE_FAULT))
                      {
                        v440 = objc_msgSend_matchedString(v470, v435, v436, v437, v438, v439);
                        LODWORD(v546) = v465;
                        *(void *)((char *)&v546 + 4) = v440;
                        _os_log_impl(&dword_1C492D000, v434, OS_LOG_TYPE_FAULT, "The stroke indexes matching data detected content should be non-empty [%@]", (uint8_t *)&v546, 0xCu);
                      }
                    }
                    v507((uint64_t)v466, v488, v487, v470);
                  }

                  ++v478;
                  unint64_t v201 = 0x1E4F1C000;
                }
                while (v478 != v468);
                uint64_t v468 = objc_msgSend_countByEnumeratingWithState_objects_count_(v482, v237, (uint64_t)&v527, (uint64_t)&buf, 16, v241);
              }
              while (v468);
            }
          }
          ++v479;
          unint64_t v31 = 0x1E4F1C000;
        }
        while (v479 != v469);
        uint64_t v469 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v514, (uint64_t)v540, 16, v36);
      }
      while (v469);
    }

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v441 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v441, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v447 = objc_msgSend_count(v476, v442, v443, v444, v445, v446);
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v447;
      _os_log_impl(&dword_1C492D000, v441, OS_LOG_TYPE_DEFAULT, "CHDataDetectorQuery._dataDetectorResultsForSessionResult: found %lu items", (uint8_t *)&buf, 0xCu);
    }

    v448 = v476;
    v454 = v448;
    if (self->_foundItems != v448)
    {
      v455 = (NSArray *)objc_msgSend_copy(v448, v449, v450, v451, v452, v453);
      foundItems = self->_foundItems;
      self->_foundItems = v455;

      objc_msgSend_q_queryResultDidChange(self, v457, v458, v459, v460, v461);
    }
  }
  else
  {

    v454 = 0;
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v462 = (id)qword_1EA3C9FC8;
  v463 = v462;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v462))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v463, OS_SIGNPOST_INTERVAL_END, spid, "CHDataDetectorQuery_update", "", (uint8_t *)&buf, 2u);
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v464 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v464, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1C492D000, v464, OS_LOG_TYPE_DEFAULT, "END \"CHDataDetectorQuery_update\"", (uint8_t *)&buf, 2u);
  }
}

- (NSArray)foundItems
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_1C4B2655C;
  uint64_t v15 = sub_1C4B2656C;
  id v16 = 0;
  uint64_t v7 = objc_msgSend_processingQueue(self, a2, v2, v3, v4, v5);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4B26574;
  v10[3] = &unk_1E64E1168;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v7, v10);

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v8;
}

- (BOOL)q_resultWantedForCompleteness:(int64_t)a3
{
  return a3 == 2;
}

- (BOOL)q_doesQueryResultDependOnDeclaredVariables
{
  return 0;
}

- (id)debugName
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"Data Detector Query %p", v2, v3, v4, self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundItems, 0);
  objc_storeStrong((id *)&self->_dataDetectorConfiguration, 0);
}

@end