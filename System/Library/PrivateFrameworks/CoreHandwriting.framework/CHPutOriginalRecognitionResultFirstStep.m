@interface CHPutOriginalRecognitionResultFirstStep
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHPutOriginalRecognitionResultFirstStep

- (id)process:(id)a3 options:(id)a4
{
  v5 = (id *)a3;
  id v208 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v6 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEBUG, "CHPutOriginalRecognitionResultFirstStep is running", buf, 2u);
  }

  v209 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9, v10, v11);
  for (unint64_t i = 0; ; ++i)
  {
    v18 = objc_msgSend_result(v5, v12, v13, v14, v15, v16);
    v24 = objc_msgSend_transcriptionPaths(v18, v19, v20, v21, v22, v23);
    unint64_t v30 = objc_msgSend_count(v24, v25, v26, v27, v28, v29);

    if (i >= v30) {
      break;
    }
    *(void *)buf = 0;
    v212 = buf;
    uint64_t v213 = 0x2020000000;
    char v214 = 1;
    v36 = objc_msgSend_result(v5, v31, v32, v33, v34, v35);
    v42 = objc_msgSend_result(v5, v37, v38, v39, v40, v41);
    v48 = objc_msgSend_transcriptionPaths(v42, v43, v44, v45, v46, v47);
    v53 = objc_msgSend_objectAtIndexedSubscript_(v48, v49, i, v50, v51, v52);
    v59 = objc_msgSend_result(v5, v54, v55, v56, v57, v58);
    v65 = objc_msgSend_transcriptionPaths(v59, v60, v61, v62, v63, v64);
    v70 = objc_msgSend_objectAtIndexedSubscript_(v65, v66, i, v67, v68, v69);
    uint64_t v76 = objc_msgSend_length(v70, v71, v72, v73, v74, v75);
    v210[0] = MEMORY[0x1E4F143A8];
    v210[1] = 3221225472;
    v210[2] = sub_1C4C25D84;
    v210[3] = &unk_1E64E31B8;
    v210[4] = buf;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v36, v77, (uint64_t)v53, 0, v76, (uint64_t)v210);

    if (v212[24])
    {
      v83 = objc_msgSend_result(v5, v78, v79, v80, v81, v82);
      v89 = objc_msgSend_transcriptionPaths(v83, v84, v85, v86, v87, v88);
      v94 = objc_msgSend_objectAtIndexedSubscript_(v89, v90, i, v91, v92, v93);
      objc_msgSend_insertObject_atIndex_(v209, v95, (uint64_t)v94, 0, v96, v97);
    }
    else
    {
      v83 = objc_msgSend_result(v5, v78, v79, v80, v81, v82);
      v89 = objc_msgSend_transcriptionPaths(v83, v98, v99, v100, v101, v102);
      v94 = objc_msgSend_objectAtIndexedSubscript_(v89, v103, i, v104, v105, v106);
      objc_msgSend_addObject_(v209, v107, (uint64_t)v94, v108, v109, v110);
    }

    _Block_object_dispose(buf, 8);
  }
  v111 = objc_msgSend_result(v5, v31, v32, v33, v34, v35);
  uint64_t v207 = objc_msgSend_baseWritingDirection(v111, v112, v113, v114, v115, v116);

  v122 = objc_msgSend_result(v5, v117, v118, v119, v120, v121);
  v128 = objc_msgSend_originalTokens(v122, v123, v124, v125, v126, v127);
  v134 = objc_msgSend_copy(v128, v129, v130, v131, v132, v133);

  v135 = [CHMutableTokenizedTextResult alloc];
  v141 = objc_msgSend_result(v5, v136, v137, v138, v139, v140);
  v147 = objc_msgSend_tokenColumns(v141, v142, v143, v144, v145, v146);
  v153 = objc_msgSend_result(v5, v148, v149, v150, v151, v152);
  v159 = objc_msgSend_transcriptionPathScores(v153, v154, v155, v156, v157, v158);
  v165 = objc_msgSend_result(v5, v160, v161, v162, v163, v164);
  v171 = objc_msgSend_trailingSeparator(v165, v166, v167, v168, v169, v170);
  v177 = objc_msgSend_result(v5, v172, v173, v174, v175, v176);
  uint64_t v183 = objc_msgSend_recognizerGenerationIdentifier(v177, v178, v179, v180, v181, v182);
  v185 = objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_(v135, v184, (uint64_t)v147, (uint64_t)v209, (uint64_t)v159, (uint64_t)v171, v183);
  if (v5) {
    objc_storeStrong(v5 + 3, v185);
  }

  v191 = objc_msgSend_result(v5, v186, v187, v188, v189, v190);
  objc_msgSend_setBaseWritingDirection_(v191, v192, v207, v193, v194, v195);

  v201 = objc_msgSend_result(v5, v196, v197, v198, v199, v200);
  objc_msgSend_setOriginalTokens_(v201, v202, (uint64_t)v134, v203, v204, v205);

  return v5;
}

@end