@interface CHSearchQuery
- (BOOL)caseMatchingOnly;
- (BOOL)fullWordsOnly;
- (CHSearchQuery)initWithRecognitionSession:(id)a3;
- (NSArray)foundItems;
- (NSString)queryString;
- (id)debugName;
- (id)q_foundItemsForSearchString:(id)a3 sessionResult:(id)a4;
- (void)q_updateQueryResult;
- (void)setCaseMatchingOnly:(BOOL)a3;
- (void)setFullWordsOnly:(BOOL)a3;
- (void)setQueryString:(id)a3;
- (void)stop;
@end

@implementation CHSearchQuery

- (CHSearchQuery)initWithRecognitionSession:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CHSearchQuery;
  v3 = [(CHQuery *)&v7 initWithRecognitionSession:a3];
  if (v3)
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    foundItems = v3->_foundItems;
    v3->_foundItems = v4;

    v3->_fullWordsOnly = 0;
    v3->_caseMatchingOnly = 0;
  }
  return v3;
}

- (void)stop
{
}

- (void)q_updateQueryResult
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v3 = (id)qword_1EA3C9FC8;
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  if (qword_1EA3CA000 == -1)
  {
    v5 = (id)qword_1EA3C9FC8;
    unint64_t v6 = v4 - 1;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    v5 = (id)qword_1EA3C9FC8;
    unint64_t v6 = v4 - 1;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CHSearchQuery", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  objc_super v7 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v7, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHSearchQuery\"", buf, 2u);
  }

  v65.receiver = self;
  v65.super_class = (Class)CHSearchQuery;
  [(CHQuery *)&v65 q_updateQueryResult];
  v13 = objc_msgSend_q_sessionResult(self, v8, v9, v10, v11, v12);
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v14 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v20 = objc_msgSend_debugName(self, v15, v16, v17, v18, v19);
    v26 = objc_msgSend_strokeProviderVersion(v13, v21, v22, v23, v24, v25);
    *(_DWORD *)buf = 138412546;
    v67 = v20;
    __int16 v68 = 2112;
    v69 = v26;
    _os_log_impl(&dword_1C492D000, v14, OS_LOG_TYPE_DEBUG, "%@: beginning update for result version %@.", buf, 0x16u);
  }
  v27 = self->_queryString;
  objc_msgSend_q_foundItemsForSearchString_sessionResult_(self, v28, (uint64_t)v27, (uint64_t)v13, v29, v30);
  v31 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (qword_1EA3CA000 == -1)
  {
    v32 = (id)qword_1EA3C9FA0;
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  v32 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
LABEL_17:
    v38 = objc_msgSend_debugName(self, v33, v34, v35, v36, v37);
    v44 = objc_msgSend_recognitionSession(self, v39, v40, v41, v42, v43);
    uint64_t v50 = objc_msgSend_count(v31, v45, v46, v47, v48, v49);
    *(_DWORD *)buf = 138412802;
    v67 = v38;
    __int16 v68 = 2048;
    v69 = v44;
    __int16 v70 = 2048;
    uint64_t v71 = v50;
    _os_log_impl(&dword_1C492D000, v32, OS_LOG_TYPE_DEFAULT, "%@: finished update for session %p. Found %ld item(s).", buf, 0x20u);
  }
LABEL_18:

  if (self->_foundItems != v31)
  {
    v56 = (NSArray *)objc_msgSend_copy(v31, v51, v52, v53, v54, v55);
    foundItems = self->_foundItems;
    self->_foundItems = v56;

    objc_msgSend_q_queryResultDidChange(self, v58, v59, v60, v61, v62);
  }
  if (qword_1EA3CA000 == -1)
  {
    v63 = (id)qword_1EA3C9FC8;
    if (v6 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_24;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    v63 = (id)qword_1EA3C9FC8;
    if (v6 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_24;
    }
  }
  if (os_signpost_enabled(v63))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v63, OS_SIGNPOST_INTERVAL_END, v4, "CHSearchQuery", "", buf, 2u);
  }
LABEL_24:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v64 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v64, OS_LOG_TYPE_DEFAULT, "END \"CHSearchQuery\"", buf, 2u);
  }
}

- (id)q_foundItemsForSearchString:(id)a3 sessionResult:(id)a4
{
  uint64_t v390 = *MEMORY[0x1E4F143B8];
  id v322 = a3;
  id v326 = a4;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v5, v6, v7, v8, v9);
  id v333 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_strokeGroupingResult(v326, v10, v11, v12, v13, v14);
  v21 = objc_msgSend_recognitionSession(self, v16, v17, v18, v19, v20);
  uint64_t v27 = objc_msgSend_strokeGroupOrdering(v21, v22, v23, v24, v25, v26);
  v31 = objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v15, v28, v27, 1, v29, v30);

  long long v368 = 0u;
  long long v369 = 0u;
  long long v366 = 0u;
  long long v367 = 0u;
  id obj = v31;
  uint64_t v323 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v366, (uint64_t)v384, 16, v33);
  if (v323)
  {
    uint64_t v317 = *(void *)v367;
    do
    {
      for (uint64_t i = 0; i != v323; ++i)
      {
        if (*(void *)v367 != v317) {
          objc_enumerationMutation(obj);
        }
        v39 = *(void **)(*((void *)&v366 + 1) + 8 * i);
        uint64_t v360 = 0;
        v361 = &v360;
        uint64_t v362 = 0x3032000000;
        v363 = sub_1C4A53C0C;
        v364 = sub_1C4A53C1C;
        id v365 = 0;
        uint64_t v316 = (uint64_t)v39;
        uint64_t v40 = objc_msgSend_uniqueIdentifier(v39, v34, v35, v36, v37, v38, v314);
        v45 = objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v326, v41, v40, v42, v43, v44);
        v356[0] = MEMORY[0x1E4F143A8];
        v356[1] = 3221225472;
        v357 = sub_1C4A53C24;
        v358 = &unk_1E64E2D68;
        v359 = &v360;
        id v328 = v45;
        id v334 = v322;
        v331 = v356;
        if (self && objc_msgSend_length(v334, v46, v47, v48, v49, v50))
        {
          v340 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v51, v52, v53, v54, v55);
          uint64_t v61 = objc_msgSend_orderedLocales(v328, v56, v57, v58, v59, v60);
          v66 = objc_msgSend_localesSortedByCombinedLanguageFitness_(v328, v62, (uint64_t)v61, v63, v64, v65);

          long long v378 = 0u;
          long long v379 = 0u;
          long long v376 = 0u;
          long long v377 = 0u;
          id v318 = v66;
          uint64_t v314 = objc_msgSend_countByEnumeratingWithState_objects_count_(v318, v67, (uint64_t)&v376, (uint64_t)buf, 16, v68);
          if (v314)
          {
            uint64_t v315 = *(void *)v377;
            do
            {
              for (uint64_t j = 0; j != v314; ++j)
              {
                if (*(void *)v377 != v315) {
                  objc_enumerationMutation(v318);
                }
                uint64_t v74 = *(void *)(*((void *)&v376 + 1) + 8 * j);
                v75 = objc_msgSend_recognitionResultsByLocale(v328, v69, v70, v71, v72, v73, v314);
                v338 = objc_msgSend_objectForKeyedSubscript_(v75, v76, v74, v77, v78, v79);

                uint64_t v324 = objc_msgSend_tokenColumnCount(v338, v80, v81, v82, v83, v84);
                if (v324 >= 1)
                {
                  uint64_t v89 = 0;
                  do
                  {
                    uint64_t v336 = v89;
                    v329 = objc_msgSend_tokenRowsAtColumnIndex_(v338, v85, v89, v86, v87, v88);
                    if (objc_msgSend_count(v329, v90, v91, v92, v93, v94))
                    {
                      unint64_t v99 = 0;
                      do
                      {
                        v100 = objc_msgSend_objectAtIndexedSubscript_(v329, v95, v99, v96, v97, v98);
                        if (objc_msgSend_count(v100, v101, v102, v103, v104, v105))
                        {
                          unint64_t v106 = 0;
                          do
                          {
                            id v375 = 0;
                            v374[0] = v336;
                            v374[1] = v99;
                            v374[2] = v106;
                            BOOL v107 = sub_1C4A53EBC((uint64_t)self, v338, v374, v334, 0, v340, &v375);
                            id v108 = v375;
                            v114 = v108;
                            if (v107 && objc_msgSend_count(v108, v109, v110, v111, v112, v113))
                            {
                              v120 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v115, v116, v117, v118, v119);
                              long long v372 = 0u;
                              long long v373 = 0u;
                              long long v370 = 0u;
                              long long v371 = 0u;
                              id v121 = v114;
                              uint64_t v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v122, (uint64_t)&v370, (uint64_t)v385, 16, v123);
                              if (v129)
                              {
                                uint64_t v130 = *(void *)v371;
                                do
                                {
                                  for (uint64_t k = 0; k != v129; ++k)
                                  {
                                    if (*(void *)v371 != v130) {
                                      objc_enumerationMutation(v121);
                                    }
                                    v132 = objc_msgSend_strokeIndexes(*(void **)(*((void *)&v370 + 1) + 8 * k), v124, v125, v126, v127, v128);
                                    objc_msgSend_addIndexes_(v120, v133, (uint64_t)v132, v134, v135, v136);
                                  }
                                  uint64_t v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v124, (uint64_t)&v370, (uint64_t)v385, 16, v128);
                                }
                                while (v129);
                              }

                              v357((uint64_t)v331, v120);
                              objc_msgSend_addIndexes_(v340, v137, (uint64_t)v120, v138, v139, v140);
                            }
                            ++v106;
                          }
                          while (v106 < objc_msgSend_count(v100, v141, v142, v143, v144, v145));
                        }

                        ++v99;
                      }
                      while (v99 < objc_msgSend_count(v329, v146, v147, v148, v149, v150));
                    }

                    uint64_t v89 = v336 + 1;
                  }
                  while (v336 + 1 != v324);
                }
              }
              uint64_t v314 = objc_msgSend_countByEnumeratingWithState_objects_count_(v318, v69, (uint64_t)&v376, (uint64_t)buf, 16, v73);
            }
            while (v314);
          }
        }
        v156 = objc_msgSend_inputStrokeIdentifiers(v328, v151, v152, v153, v154, v155);
        long long v354 = 0u;
        long long v355 = 0u;
        long long v352 = 0u;
        long long v353 = 0u;
        id v157 = (id)v361[5];
        uint64_t v165 = objc_msgSend_countByEnumeratingWithState_objects_count_(v157, v158, (uint64_t)&v352, (uint64_t)v383, 16, v159);
        if (v165)
        {
          uint64_t v166 = *(void *)v353;
          do
          {
            uint64_t v167 = 0;
            do
            {
              if (*(void *)v353 != v166) {
                objc_enumerationMutation(v157);
              }
              v168 = *(void **)(*((void *)&v352 + 1) + 8 * v167);
              unint64_t v169 = objc_msgSend_count(v156, v160, v161, v162, v163, v164, v314);
              if (v169 <= objc_msgSend_lastIndex(v168, v170, v171, v172, v173, v174))
              {
                if (qword_1EA3CA000 != -1) {
                  dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                }
                v179 = (id)qword_1EA3C9F90[0];
                if (os_log_type_enabled(v179, OS_LOG_TYPE_FAULT))
                {
                  uint64_t Index = objc_msgSend_lastIndex(v168, v180, v181, v182, v183, v184);
                  uint64_t v191 = objc_msgSend_count(v156, v186, v187, v188, v189, v190);
                  *(_DWORD *)buf = 134218240;
                  uint64_t v387 = Index;
                  __int16 v388 = 2048;
                  uint64_t v389 = v191;
                  _os_log_impl(&dword_1C492D000, v179, OS_LOG_TYPE_FAULT, "Stroke index %ld in search result out of group stroke count %ld.", buf, 0x16u);
                }
              }
              v192 = objc_msgSend_objectsAtIndexes_(v156, v175, (uint64_t)v168, v176, v177, v178);
              v198 = objc_msgSend_recognitionSession(self, v193, v194, v195, v196, v197);
              v204 = objc_msgSend_latestStrokeProvider(v198, v199, v200, v201, v202, v203);
              v208 = objc_msgSend_strokesForIdentifiers_inStrokeProvider_(CHStrokeUtilities, v205, (uint64_t)v192, (uint64_t)v204, v206, v207);

              if (v208)
              {
                v209 = sub_1C4A53CB8([CHSearchQueryItem alloc], v208);
                objc_msgSend_addObject_(v333, v210, (uint64_t)v209, v211, v212, v213);
              }
              ++v167;
            }
            while (v165 != v167);
            uint64_t v165 = objc_msgSend_countByEnumeratingWithState_objects_count_(v157, v160, (uint64_t)&v352, (uint64_t)v383, 16, v164);
          }
          while (v165);
        }

        v219 = objc_msgSend_preferredLocale(v328, v214, v215, v216, v217, v218);
        BOOL v220 = v219 == 0;

        if (v220)
        {
          v226 = objc_msgSend_recognitionSession(self, v221, v222, v223, v224, v225);
          id v351 = 0;
          v332 = objc_msgSend_mathTranscriptionWithEvaluationResultForStrokeGroup_outStrokeIdentifiers_outStrokes_(v226, v227, v316, 0, (uint64_t)&v351, v228);
          id v330 = v351;

          if (v332 && v330)
          {
            v325 = objc_msgSend_textTranscriptionForLatex_(CHTokenizedMathResult, v229, (uint64_t)v332, v230, v231, v232);
            v321 = objc_msgSend_simplifiedTextTranscriptionForLatex_(CHTokenizedMathResult, v233, (uint64_t)v332, v234, v235, v236);
            v337 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v334, v237, @" ", (uint64_t)&stru_1F20141C8, v238, v239);
            long long v349 = 0u;
            long long v350 = 0u;
            long long v347 = 0u;
            long long v348 = 0u;
            v381[0] = v332;
            v381[1] = v325;
            v381[2] = v321;
            v243 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v240, (uint64_t)v381, 3, v241, v242);
            uint64_t v249 = objc_msgSend_countByEnumeratingWithState_objects_count_(v243, v244, (uint64_t)&v347, (uint64_t)v382, 16, v245);
            if (v249)
            {
              uint64_t v250 = *(void *)v348;
              id v335 = v243;
              while (2)
              {
                for (uint64_t m = 0; m != v249; ++m)
                {
                  if (*(void *)v348 != v250) {
                    objc_enumerationMutation(v335);
                  }
                  v339 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(*(void **)(*((void *)&v347 + 1) + 8 * m), v246, @" ", (uint64_t)&stru_1F20141C8, v247, v248, v314);
                  if (objc_msgSend_rangeOfString_(v339, v252, (uint64_t)v337, v253, v254, v255) != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v341 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v256, v257, v258, v259, v260);
                    v266 = objc_msgSend_recognitionSession(self, v261, v262, v263, v264, v265);
                    v272 = objc_msgSend_latestStrokeProvider(v266, v267, v268, v269, v270, v271);
                    char v273 = objc_opt_respondsToSelector();

                    if (v273)
                    {
                      long long v345 = 0u;
                      long long v346 = 0u;
                      long long v343 = 0u;
                      long long v344 = 0u;
                      id v278 = v330;
                      uint64_t v286 = objc_msgSend_countByEnumeratingWithState_objects_count_(v278, v279, (uint64_t)&v343, (uint64_t)v380, 16, v280);
                      if (v286)
                      {
                        uint64_t v287 = *(void *)v344;
                        do
                        {
                          for (uint64_t n = 0; n != v286; ++n)
                          {
                            if (*(void *)v344 != v287) {
                              objc_enumerationMutation(v278);
                            }
                            v289 = *(void **)(*((void *)&v343 + 1) + 8 * n);
                            v290 = objc_msgSend_recognitionSession(self, v281, v282, v283, v284, v285);
                            v296 = objc_msgSend_latestStrokeProvider(v290, v291, v292, v293, v294, v295);
                            v302 = objc_msgSend_strokeIdentifier(v289, v297, v298, v299, v300, v301);
                            int isValidStrokeIdentifier = objc_msgSend_isValidStrokeIdentifier_(v296, v303, (uint64_t)v302, v304, v305, v306);

                            if (isValidStrokeIdentifier) {
                              objc_msgSend_addObject_(v341, v281, (uint64_t)v289, v283, v284, v285);
                            }
                          }
                          uint64_t v286 = objc_msgSend_countByEnumeratingWithState_objects_count_(v278, v281, (uint64_t)&v343, (uint64_t)v380, 16, v285);
                        }
                        while (v286);
                      }
                    }
                    else
                    {
                      objc_msgSend_addObjectsFromArray_(v341, v274, (uint64_t)v330, v275, v276, v277);
                    }
                    v308 = sub_1C4A53CB8([CHSearchQueryItem alloc], v341);
                    objc_msgSend_addObject_(v333, v309, (uint64_t)v308, v310, v311, v312);

                    v243 = v335;
                    goto LABEL_75;
                  }
                }
                v243 = v335;
                uint64_t v249 = objc_msgSend_countByEnumeratingWithState_objects_count_(v335, v246, (uint64_t)&v347, (uint64_t)v382, 16, v248);
                if (v249) {
                  continue;
                }
                break;
              }
            }
LABEL_75:
          }
        }

        _Block_object_dispose(&v360, 8);
      }
      uint64_t v323 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v366, (uint64_t)v384, 16, v38);
    }
    while (v323);
  }

  return v333;
}

- (void)setQueryString:(id)a3
{
  id v4 = a3;
  uint64_t v10 = objc_msgSend_processingQueue(self, v5, v6, v7, v8, v9);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1C4A54950;
  v12[3] = &unk_1E64E2C80;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_sync(v10, v12);
}

- (NSString)queryString
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_1C4A53C0C;
  v15 = sub_1C4A53C1C;
  id v16 = 0;
  uint64_t v7 = objc_msgSend_processingQueue(self, a2, v2, v3, v4, v5);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4A54AE4;
  v10[3] = &unk_1E64E1048;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v7, v10);

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSString *)v8;
}

- (NSArray)foundItems
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_1C4A53C0C;
  v15 = sub_1C4A53C1C;
  id v16 = 0;
  uint64_t v7 = objc_msgSend_processingQueue(self, a2, v2, v3, v4, v5);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4A54C1C;
  v10[3] = &unk_1E64E1048;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v7, v10);

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v8;
}

- (id)debugName
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"Search Query %p", v2, v3, v4, self);
}

- (BOOL)caseMatchingOnly
{
  return self->_caseMatchingOnly;
}

- (void)setCaseMatchingOnly:(BOOL)a3
{
  self->_caseMatchingOnly = a3;
}

- (BOOL)fullWordsOnly
{
  return self->_fullWordsOnly;
}

- (void)setFullWordsOnly:(BOOL)a3
{
  self->_fullWordsOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_foundItems, 0);
}

@end