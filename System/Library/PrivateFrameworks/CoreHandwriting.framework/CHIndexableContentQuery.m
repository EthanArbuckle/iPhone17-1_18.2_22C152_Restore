@interface CHIndexableContentQuery
- (BOOL)needsForegroundRecognition;
- (CHIndexableContentQuery)initWithRecognitionSession:(id)a3;
- (CHRecognitionSessionIndexableContent)indexableContent;
- (id)debugName;
- (void)q_updateQueryResult;
@end

@implementation CHIndexableContentQuery

- (CHIndexableContentQuery)initWithRecognitionSession:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CHIndexableContentQuery;
  v3 = [(CHQuery *)&v11 initWithRecognitionSession:a3];
  v9 = v3;
  if (v3) {
    objc_msgSend_setPreferredUpdatesInterval_(v3, v4, v5, v6, v7, v8, 2.0);
  }
  return v9;
}

- (void)q_updateQueryResult
{
  uint64_t v242 = *MEMORY[0x1E4F143B8];
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v3 = (id)qword_1EA3C9FC8;
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  if (qword_1EA3CA000 == -1)
  {
    uint64_t v5 = (id)qword_1EA3C9FC8;
    unint64_t v6 = v4 - 1;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    uint64_t v5 = (id)qword_1EA3C9FC8;
    unint64_t v6 = v4 - 1;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CHIndexableContentQuery", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v7 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v7, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHIndexableContentQuery\"", buf, 2u);
  }

  v235.receiver = self;
  v235.super_class = (Class)CHIndexableContentQuery;
  [(CHQuery *)&v235 q_updateQueryResult];
  v217 = objc_msgSend_q_sessionResult(self, v8, v9, v10, v11, v12);
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  os_signpost_id_t spid = v4;
  unint64_t v211 = v6;
  v13 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v19 = objc_msgSend_debugName(self, v14, v15, v16, v17, v18);
    v25 = objc_msgSend_strokeProviderVersion(v217, v20, v21, v22, v23, v24);
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v19;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v25;
    _os_log_impl(&dword_1C492D000, v13, OS_LOG_TYPE_DEBUG, "%@: beginning update for result version %@.", buf, 0x16u);
  }
  v31 = objc_msgSend_string(MEMORY[0x1E4F28E78], v26, v27, v28, v29, v30);
  v214 = objc_msgSend_string(MEMORY[0x1E4F28E78], v32, v33, v34, v35, v36);
  v42 = objc_msgSend_strokeGroupingResult(v217, v37, v38, v39, v40, v41);
  v213 = self;
  v48 = objc_msgSend_recognitionSession(self, v43, v44, v45, v46, v47);
  uint64_t v54 = objc_msgSend_strokeGroupOrdering(v48, v49, v50, v51, v52, v53);
  v58 = objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v42, v55, v54, 1, v56, v57);

  long long v233 = 0u;
  long long v234 = 0u;
  long long v231 = 0u;
  long long v232 = 0u;
  obuint64_t j = v58;
  uint64_t v216 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v59, (uint64_t)&v231, (uint64_t)v241, 16, v60);
  if (v216)
  {
    uint64_t v215 = *(void *)v232;
    do
    {
      uint64_t v66 = 0;
      do
      {
        if (*(void *)v232 != v215) {
          objc_enumerationMutation(obj);
        }
        v218 = *(void **)(*((void *)&v231 + 1) + 8 * v66);
        uint64_t v219 = v66;
        uint64_t v71 = objc_msgSend_uniqueIdentifier(v218, v61, v62, v63, v64, v65);
        v222 = objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v217, v72, v71, v73, v74, v75);
        long long v227 = 0u;
        long long v228 = 0u;
        long long v229 = 0u;
        long long v230 = 0u;
        objc_msgSend_locales(v217, v76, v77, v78, v79, v80);
        id v220 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v83 = objc_msgSend_countByEnumeratingWithState_objects_count_(v220, v81, (uint64_t)&v227, (uint64_t)v240, 16, v82);
        if (v83)
        {
          uint64_t v89 = v83;
          uint64_t v221 = *(void *)v228;
          do
          {
            for (uint64_t i = 0; i != v89; ++i)
            {
              if (*(void *)v228 != v221) {
                objc_enumerationMutation(v220);
              }
              uint64_t v91 = *(void *)(*((void *)&v227 + 1) + 8 * i);
              v92 = objc_msgSend_recognitionResultsByLocale(v222, v84, v85, v86, v87, v88);
              v97 = objc_msgSend_objectForKeyedSubscript_(v92, v93, v91, v94, v95, v96);

              long long v225 = 0u;
              long long v226 = 0u;
              long long v223 = 0u;
              long long v224 = 0u;
              v103 = objc_msgSend_transcriptionPaths(v97, v98, v99, v100, v101, v102);
              uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v104, (uint64_t)&v223, (uint64_t)v239, 16, v105);
              if (v106)
              {
                uint64_t v112 = v106;
                uint64_t v113 = *(void *)v224;
                do
                {
                  for (uint64_t j = 0; j != v112; ++j)
                  {
                    if (*(void *)v224 != v113) {
                      objc_enumerationMutation(v103);
                    }
                    v115 = *(void **)(*((void *)&v223 + 1) + 8 * j);
                    uint64_t v116 = objc_msgSend_length(v115, v107, v108, v109, v110, v111);
                    v118 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v97, v117, (uint64_t)v115, 0, v116, 0);
                    objc_msgSend_appendFormat_(v31, v119, @"%@\n", v120, v121, v122, v118, spid);
                  }
                  uint64_t v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v107, (uint64_t)&v223, (uint64_t)v239, 16, v111);
                }
                while (v112);
              }
            }
            uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v220, v84, (uint64_t)&v227, (uint64_t)v240, 16, v88);
          }
          while (v89);
        }

        v128 = objc_msgSend_mathResult(v222, v123, v124, v125, v126, v127);

        if (v128)
        {
          v133 = objc_msgSend_recognitionSession(v213, v67, v129, v130, v131, v132);
          v136 = objc_msgSend_mathTranscriptionWithEvaluationResultForStrokeGroup_outStrokeIdentifiers_outStrokes_(v133, v134, (uint64_t)v218, 0, 0, v135);

          v141 = objc_msgSend_textTranscriptionForLatex_(CHTokenizedMathResult, v137, (uint64_t)v136, v138, v139, v140);
          v146 = objc_msgSend_simplifiedTextTranscriptionForLatex_(CHTokenizedMathResult, v142, (uint64_t)v136, v143, v144, v145);
          objc_msgSend_appendFormat_(v31, v147, @"%@\n", v148, v149, v150, v136);
          objc_msgSend_appendFormat_(v31, v151, @"%@\n", v152, v153, v154, v141);
          if ((objc_msgSend_isEqualToString_(v146, v155, (uint64_t)v141, v156, v157, v158) & 1) == 0) {
            objc_msgSend_appendFormat_(v31, v159, @"%@\n", v160, v161, v162, v146);
          }

          if (v141) {
            goto LABEL_20;
          }
        }
        v141 = objc_msgSend_highConfidenceTextForSessionResult_averageTokenScore_rejectionRate_doesContainUnfilteredMultiLocaleResults_isNonTextCandidateResult_(v222, v67, (uint64_t)v217, 0, 0, 0, 0);
        if (v141) {
LABEL_20:
        }
          objc_msgSend_appendFormat_(v214, v67, @"%@\n", v68, v69, v70, v141);

        uint64_t v66 = v219 + 1;
      }
      while (v219 + 1 != v216);
      uint64_t v216 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v61, (uint64_t)&v231, (uint64_t)v241, 16, v65);
    }
    while (v216);
  }

  v163 = [CHRecognitionSessionIndexableContent alloc];
  id v164 = v31;
  id v165 = v214;
  v166 = v165;
  if (!v163)
  {

    p_isa = (id *)&v213->super.super.isa;
    if (qword_1EA3CA000 == -1) {
      goto LABEL_47;
    }
    goto LABEL_65;
  }
  *(void *)buf = v163;
  *(void *)&buf[8] = CHRecognitionSessionIndexableContent;
  v163 = (CHRecognitionSessionIndexableContent *)objc_msgSendSuper2((objc_super *)buf, sel_init);
  if (v163)
  {
    uint64_t v172 = objc_msgSend_copy(v164, v167, v168, v169, v170, v171);
    indexableTextRepresentation = v163->_indexableTextRepresentation;
    v163->_indexableTextRepresentation = (NSString *)v172;

    uint64_t v179 = objc_msgSend_copy(v166, v174, v175, v176, v177, v178);
    presentableTextRepresentation = v163->_presentableTextRepresentation;
    v163->_presentableTextRepresentation = (NSString *)v179;
  }
  p_isa = (id *)&v213->super.super.isa;
  if (qword_1EA3CA000 != -1) {
LABEL_65:
  }
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
LABEL_47:
  v182 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
  {
    v188 = objc_msgSend_debugName(p_isa, v183, v184, v185, v186, v187);
    v194 = objc_msgSend_recognitionSession(p_isa, v189, v190, v191, v192, v193);
    uint64_t v200 = objc_msgSend_length(v164, v195, v196, v197, v198, v199);
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v188;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v194;
    __int16 v237 = 2048;
    uint64_t v238 = v200;
    _os_log_impl(&dword_1C492D000, v182, OS_LOG_TYPE_DEFAULT, "%@: finished update for session %p. indexableContent length: %ld", buf, 0x20u);
  }
  v201 = v163;
  if (p_isa && p_isa[9] != v201)
  {
    objc_storeStrong(p_isa + 9, v163);
    objc_msgSend_q_queryResultDidChange(p_isa, v202, v203, v204, v205, v206);
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v207 = (id)qword_1EA3C9FC8;
  v208 = v207;
  if (v211 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v207))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v208, OS_SIGNPOST_INTERVAL_END, spid, "CHIndexableContentQuery", "", buf, 2u);
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v209 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v209, OS_LOG_TYPE_DEFAULT, "END \"CHIndexableContentQuery\"", buf, 2u);
  }
}

- (CHRecognitionSessionIndexableContent)indexableContent
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_1C4BF7324;
  uint64_t v15 = sub_1C4BF7334;
  id v16 = 0;
  uint64_t v7 = objc_msgSend_processingQueue(self, a2, v2, v3, v4, v5);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4BF733C;
  v10[3] = &unk_1E64E1048;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v7, v10);

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (CHRecognitionSessionIndexableContent *)v8;
}

- (id)debugName
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"IndexableContent Query %p", v2, v3, v4, self);
}

- (BOOL)needsForegroundRecognition
{
  return 0;
}

- (void).cxx_destruct
{
}

@end