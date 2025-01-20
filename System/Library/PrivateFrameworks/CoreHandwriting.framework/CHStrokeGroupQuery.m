@interface CHStrokeGroupQuery
- (BOOL)needsForegroundRecognition;
- (NSArray)strokeGroupItems;
- (id)debugName;
- (id)q_strokeGroupItemsFromSessionResult:(id)a3;
- (id)tokenStrokeIdentifiersWithCoveringStroke:(id)a3 completion:(id)a4 shouldCancel:(id)a5;
- (id)tokenizedStrokeResultForInitialStrokes:(id)a3 point:(CGPoint)a4 tokenizationLevel:(int64_t)a5;
- (id)tokenizedStrokeResultForInitialStrokes:(id)a3 point:(CGPoint)a4 tokenizationLevel:(int64_t)a5 completion:(id)a6 shouldCancel:(id)a7;
- (void)q_updateQueryResult;
@end

@implementation CHStrokeGroupQuery

- (void)q_updateQueryResult
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
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
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CHStrokeGroupQuery", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v7 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v7, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHStrokeGroupQuery\"", buf, 2u);
  }

  v107.receiver = self;
  v107.super_class = (Class)CHStrokeGroupQuery;
  [(CHQuery *)&v107 q_updateQueryResult];
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
    v113 = v20;
    __int16 v114 = 2112;
    v115 = v26;
    _os_log_impl(&dword_1C492D000, v14, OS_LOG_TYPE_DEBUG, "%@: beginning update for result version %@.", buf, 0x16u);
  }
  v31 = objc_msgSend_q_strokeGroupItemsFromSessionResult_(self, v27, (uint64_t)v13, v28, v29, v30);
  unint64_t v105 = v6;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v106 = v13;
  v32 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v38 = objc_msgSend_debugName(self, v33, v34, v35, v36, v37);
    v44 = objc_msgSend_recognitionSession(self, v39, v40, v41, v42, v43);
    uint64_t v50 = objc_msgSend_count(v31, v45, v46, v47, v48, v49);
    *(_DWORD *)buf = 138412802;
    v113 = v38;
    __int16 v114 = 2048;
    v115 = v44;
    __int16 v116 = 2048;
    uint64_t v117 = v50;
    _os_log_impl(&dword_1C492D000, v32, OS_LOG_TYPE_DEFAULT, "%@: finished update for session %p. %ld item(s) available.", buf, 0x20u);
  }
  v51 = v31;
  v57 = v51;
  if (self && self->_strokeGroupItems != v51)
  {
    os_signpost_id_t v58 = v4;
    v59 = (NSArray *)objc_msgSend_copy(v51, v52, v53, v54, v55, v56);
    strokeGroupItems = self->_strokeGroupItems;
    self->_strokeGroupItems = v59;

    v61 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v67 = objc_msgSend_count(self->_strokeGroupItems, v62, v63, v64, v65, v66);
    v72 = objc_msgSend_dictionaryWithCapacity_(v61, v68, v67, v69, v70, v71);
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    v73 = self->_strokeGroupItems;
    uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v74, (uint64_t)&v108, (uint64_t)buf, 16, v75);
    if (v76)
    {
      uint64_t v82 = v76;
      uint64_t v83 = *(void *)v109;
      do
      {
        for (uint64_t i = 0; i != v82; ++i)
        {
          if (*(void *)v109 != v83) {
            objc_enumerationMutation(v73);
          }
          v85 = *(void **)(*((void *)&v108 + 1) + 8 * i);
          v86 = objc_msgSend_strokeGroupIdentifier(v85, v77, v78, v79, v80, v81, v105, v106);
          objc_msgSend_setObject_forKeyedSubscript_(v72, v87, (uint64_t)v85, (uint64_t)v86, v88, v89);
        }
        uint64_t v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v77, (uint64_t)&v108, (uint64_t)buf, 16, v81);
      }
      while (v82);
    }

    v95 = (NSDictionary *)objc_msgSend_copy(v72, v90, v91, v92, v93, v94);
    strokeGroupItemsByID = self->_strokeGroupItemsByID;
    self->_strokeGroupItemsByID = v95;

    objc_msgSend_q_queryResultDidChange(self, v97, v98, v99, v100, v101);
    os_signpost_id_t v4 = v58;
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v102 = (id)qword_1EA3C9FC8;
  v103 = v102;
  if (v105 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v102))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v103, OS_SIGNPOST_INTERVAL_END, v4, "CHStrokeGroupQuery", "", buf, 2u);
  }

  if (qword_1EA3CA000 != -1)
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    v104 = (id)qword_1EA3C9F90[0];
    if (!os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  v104 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
  {
LABEL_36:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v104, OS_LOG_TYPE_DEFAULT, "END \"CHStrokeGroupQuery\"", buf, 2u);
  }
LABEL_37:
}

- (id)q_strokeGroupItemsFromSessionResult:(id)a3
{
  uint64_t v257 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v10 = objc_msgSend_strokeGroupingResult(v4, v5, v6, v7, v8, v9);
  v244 = objc_msgSend_locales(v4, v11, v12, v13, v14, v15);
  uint64_t v16 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v22 = objc_msgSend_strokeGroups(v10, v17, v18, v19, v20, v21);
  uint64_t v28 = objc_msgSend_count(v22, v23, v24, v25, v26, v27);
  objc_msgSend_arrayWithCapacity_(v16, v29, v28, v30, v31, v32);
  id v248 = (id)objc_claimAutoreleasedReturnValue();

  long long v254 = 0u;
  long long v255 = 0u;
  long long v252 = 0u;
  long long v253 = 0u;
  v251 = self;
  v38 = objc_msgSend_recognitionSession(self, v33, v34, v35, v36, v37);
  uint64_t v44 = objc_msgSend_strokeGroupOrdering(v38, v39, v40, v41, v42, v43);
  v238 = v10;
  uint64_t v48 = objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v10, v45, v44, 0, v46, v47);

  id obj = v48;
  uint64_t v249 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v252, (uint64_t)v256, 16, v50);
  if (v249)
  {
    uint64_t v56 = *(void *)v253;
    id v242 = v4;
    uint64_t v243 = *(void *)v253;
    do
    {
      for (uint64_t i = 0; i != v249; ++i)
      {
        if (*(void *)v253 != v56) {
          objc_enumerationMutation(obj);
        }
        os_signpost_id_t v58 = *(void **)(*((void *)&v252 + 1) + 8 * i);
        v59 = NSNumber;
        uint64_t v60 = objc_msgSend_uniqueIdentifier(v58, v51, v52, v53, v54, v55);
        uint64_t v65 = objc_msgSend_numberWithInteger_(v59, v61, v60, v62, v63, v64);
        uint64_t v70 = objc_msgSend_objectForKeyedSubscript_(v251->_strokeGroupItemsByID, v66, (uint64_t)v65, v67, v68, v69);
        uint64_t v76 = objc_msgSend_mathResult(v70, v71, v72, v73, v74, v75);
        uint64_t v82 = objc_msgSend_uniqueIdentifier(v58, v77, v78, v79, v80, v81);
        v87 = objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v4, v83, v82, v84, v85, v86);
        uint64_t v93 = objc_msgSend_mathResult(v87, v88, v89, v90, v91, v92);
        char isEqualToTokenizedMathResult = objc_msgSend_isEqualToTokenizedMathResult_(v76, v94, (uint64_t)v93, v95, v96, v97);

        if (v70 && (isEqualToTokenizedMathResult & 1) != 0)
        {
LABEL_5:
          objc_msgSend_addObject_(v248, v99, (uint64_t)v70, v101, v102, v103);

          goto LABEL_6;
        }
        uint64_t v104 = objc_msgSend_uniqueIdentifier(v58, v99, v100, v101, v102, v103);
        long long v109 = objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v4, v105, v104, v106, v107, v108);
        v115 = objc_msgSend_inputStrokeIdentifiers(v109, v110, v111, v112, v113, v114);
        v121 = objc_msgSend_recognitionResultsByLocale(v109, v116, v117, v118, v119, v120);
        v127 = objc_msgSend_errorsByLocale(v109, v122, v123, v124, v125, v126);
        v128 = NSNumber;
        uint64_t v134 = objc_msgSend_ancestorIdentifier(v58, v129, v130, v131, v132, v133);
        v250 = objc_msgSend_numberWithInteger_(v128, v135, v134, v136, v137, v138);
        v143 = objc_msgSend_localesSortedByCombinedLanguageFitness_(v109, v139, (uint64_t)v244, v140, v141, v142);
        uint64_t v149 = objc_msgSend_firstObject(v143, v144, v145, v146, v147, v148);
        v155 = (void *)v149;
        if (v115)
        {
          v246 = (void *)v149;
          v247 = v127;
          v156 = objc_msgSend_mathResult(v109, v150, v151, v152, v153, v154);

          if (v156)
          {
            v162 = objc_msgSend_recognitionSession(v251, v157, v158, v159, v160, v161);
            v168 = objc_msgSend_latestStrokeProvider(v162, v163, v164, v165, v166, v167);
            objc_msgSend_strokeIdentifiersForData_withStrokeProvider_(CHStrokeUtilities, v169, (uint64_t)v115, (uint64_t)v168, v170, v171);
            id v172 = (id)objc_claimAutoreleasedReturnValue();

            if (v172)
            {
              v173 = [CHStrokeGroupQueryItem alloc];
              v179 = objc_msgSend_mathResult(v109, v174, v175, v176, v177, v178);
              v180 = sub_1C4958BC0(v173, v65, v250, v172, 3, 1, 0, MEMORY[0x1E4F1CC08], v179, v247);
              goto LABEL_26;
            }
          }
          else
          {
            v155 = v246;
            if (!v246 || !v121)
            {
              v127 = v247;
              goto LABEL_29;
            }
            v181 = objc_msgSend_objectForKeyedSubscript_(v121, v157, (uint64_t)v246, v159, v160, v161);
            id v182 = v58;
            id v172 = v181;
            v240 = v121;
            v241 = v182;
            if ((unint64_t)(objc_msgSend_classification(v182, v183, v184, v185, v186, v187) - 1) > 3)
            {
              BOOL v239 = 0;
            }
            else
            {
              v193 = objc_msgSend_transcriptionPaths(v172, v188, v189, v190, v191, v192);
              v199 = objc_msgSend_firstObject(v193, v194, v195, v196, v197, v198);

              if (v199)
              {
                uint64_t v205 = objc_msgSend_length(v199, v200, v201, v202, v203, v204);
                v207 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_excludeGibberish_rejectionRate_tokenProcessingBlock_(v172, v206, (uint64_t)v199, 0, v205, 0, 1, 0, 0);
                BOOL v239 = objc_msgSend_length(v207, v208, v209, v210, v211, v212) != 0;
              }
              else
              {
                BOOL v239 = 0;
              }

              id v182 = v241;
            }

            v218 = objc_msgSend_recognitionSession(v251, v213, v214, v215, v216, v217);
            v224 = objc_msgSend_latestStrokeProvider(v218, v219, v220, v221, v222, v223);
            v179 = objc_msgSend_strokeIdentifiersForData_withStrokeProvider_(CHStrokeUtilities, v225, (uint64_t)v115, (uint64_t)v224, v226, v227);

            if (v179)
            {
              v228 = [CHStrokeGroupQueryItem alloc];
              uint64_t v234 = objc_msgSend_classification(v241, v229, v230, v231, v232, v233);
              v235 = v228;
              v121 = v240;
              v180 = sub_1C4958BC0(v235, v65, v250, v179, v234, v239, v246, v240, 0, v247);
LABEL_26:
              v236 = v180;

              uint64_t v70 = v236;
            }
            else
            {
              v121 = v240;
            }
          }
          id v4 = v242;

          v155 = v246;
          v127 = v247;
        }
LABEL_29:

        uint64_t v56 = v243;
        if (v70) {
          goto LABEL_5;
        }
LABEL_6:
      }
      uint64_t v249 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v51, (uint64_t)&v252, (uint64_t)v256, 16, v55);
    }
    while (v249);
  }

  return v248;
}

- (id)tokenizedStrokeResultForInitialStrokes:(id)a3 point:(CGPoint)a4 tokenizationLevel:(int64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1C4958EB0;
  uint64_t v23 = sub_1C4958EC0;
  id v24 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4958EC8;
  v16[3] = &unk_1E64E0FD0;
  uint64_t v18 = &v19;
  uint64_t v11 = v10;
  uint64_t v17 = v11;
  id v13 = (id)objc_msgSend_tokenizedStrokeResultForInitialStrokes_point_tokenizationLevel_completion_shouldCancel_(self, v12, (uint64_t)v9, a5, (uint64_t)v16, 0, x, y);
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  id v14 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v14;
}

- (id)tokenizedStrokeResultForInitialStrokes:(id)a3 point:(CGPoint)a4 tokenizationLevel:(int64_t)a5 completion:(id)a6 shouldCancel:(id)a7
{
  double y = a4.y;
  double x = a4.x;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v16 = (id)qword_1EA3C9FC8;
  os_signpost_id_t v17 = os_signpost_id_generate(v16);

  if (qword_1EA3CA000 == -1)
  {
    uint64_t v18 = (id)qword_1EA3C9FC8;
    if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    uint64_t v18 = (id)qword_1EA3C9FC8;
    if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v17, "CHStrokeGroupQuery_resultsForInitialStrokes", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v19 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v19, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHStrokeGroupQuery_resultsForInitialStrokes\"", buf, 2u);
  }

  uint64_t v25 = objc_msgSend_recognitionSession(self, v20, v21, v22, v23, v24);
  uint64_t v31 = objc_msgSend_latestStrokeProvider(v25, v26, v27, v28, v29, v30);
  uint64_t v35 = objc_msgSend_encodedStrokeIdentifiers_withStrokeProvider_(CHStrokeUtilities, v32, (uint64_t)v15, (uint64_t)v31, v33, v34);

  uint64_t v41 = objc_msgSend_recognitionSession(self, v36, v37, v38, v39, v40);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = sub_1C49591E8;
  v46[3] = &unk_1E64E0FF8;
  id v47 = v13;
  os_signpost_id_t v48 = v17;
  id v42 = v13;
  uint64_t v44 = objc_msgSend_tokenStrokeIdentifiersForContextStrokes_point_tokenizationLevel_completion_shouldCancel_(v41, v43, (uint64_t)v35, a5, (uint64_t)v46, (uint64_t)v14, x, y);

  return v44;
}

- (id)tokenStrokeIdentifiersWithCoveringStroke:(id)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v11 = (id)qword_1EA3C9FC8;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  if (qword_1EA3CA000 == -1)
  {
    id v13 = (id)qword_1EA3C9FC8;
    if (v12 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    id v13 = (id)qword_1EA3C9FC8;
    if (v12 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CHStrokeGroupQuery_strokesCoveredByStroke", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  id v14 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHStrokeGroupQuery_strokesCoveredByStroke\"", buf, 2u);
  }

  uint64_t v20 = objc_msgSend_recognitionSession(self, v15, v16, v17, v18, v19);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1C4959588;
  v26[3] = &unk_1E64E1020;
  id v27 = v8;
  os_signpost_id_t v28 = v12;
  id v21 = v8;
  uint64_t v24 = objc_msgSend_tokenStrokeIdentifiersWithCoveringStroke_completion_shouldCancel_(v20, v22, (uint64_t)v10, (uint64_t)v26, (uint64_t)v9, v23);

  return v24;
}

- (NSArray)strokeGroupItems
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1C4958EB0;
  uint64_t v16 = sub_1C4958EC0;
  id v17 = 0;
  uint64_t v7 = objc_msgSend_processingQueue(self, a2, v2, v3, v4, v5);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1C4959820;
  v11[3] = &unk_1E64E1048;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(v7, v11);

  id v8 = (void *)v13[5];
  if (!v8)
  {
    v13[5] = MEMORY[0x1E4F1CBF0];
    id v8 = (void *)v13[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v12, 8);

  return (NSArray *)v9;
}

- (id)debugName
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"Stroke Group Query %p", v2, v3, v4, self);
}

- (BOOL)needsForegroundRecognition
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeGroupItemsByID, 0);
  objc_storeStrong((id *)&self->_strokeGroupItems, 0);
}

@end