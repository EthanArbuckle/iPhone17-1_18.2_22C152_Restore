@interface CHRemoveVariableCasingAlternativesStep
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHRemoveVariableCasingAlternativesStep

- (id)process:(id)a3 options:(id)a4
{
  id v186 = a3;
  id v182 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v6 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEBUG, "CHRemoveVariableCasingAlternativesStep is running", buf, 2u);
  }

  v12 = objc_msgSend_result(v186, v7, v8, v9, v10, v11);
  v18 = objc_msgSend_transcriptionPaths(v12, v13, v14, v15, v16, v17);
  uint64_t v24 = objc_msgSend_count(v18, v19, v20, v21, v22, v23);

  if (v24)
  {
    v183 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v25, v26, v27, v28, v29);
    v35 = objc_msgSend_result(v186, v30, v31, v32, v33, v34);
    v41 = objc_msgSend_transcriptionPaths(v35, v36, v37, v38, v39, v40);
    v47 = objc_msgSend_firstObject(v41, v42, v43, v44, v45, v46);

    v51 = objc_msgSend_retrievePathTokens_atPathIndex_(self, v48, (uint64_t)v186, 0, v49, v50);
    objc_msgSend_addObject_(v183, v52, (uint64_t)v51, v53, v54, v55);

    for (unint64_t i = 1; ; unint64_t i = v184 + 1)
    {
      v62 = objc_msgSend_result(v186, v56, v57, v58, v59, v60);
      v68 = objc_msgSend_transcriptionPaths(v62, v63, v64, v65, v66, v67);
      unint64_t v74 = objc_msgSend_count(v68, v69, v70, v71, v72, v73);

      if (i >= v74) {
        break;
      }
      v80 = objc_msgSend_result(v186, v75, v76, v77, v78, v79);
      v86 = objc_msgSend_transcriptionPaths(v80, v81, v82, v83, v84, v85);
      unint64_t v184 = i;
      v91 = objc_msgSend_objectAtIndexedSubscript_(v86, v87, i, v88, v89, v90);

      v185 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v92, v93, v94, v95, v96);
      for (uint64_t j = 0; ; ++j)
      {
        v103 = objc_msgSend_result(v186, v97, v98, v99, v100, v101);
        uint64_t v109 = objc_msgSend_tokenColumnCount(v103, v104, v105, v106, v107, v108);

        if (j >= v109) {
          break;
        }
        uint64_t v114 = objc_msgSend_indexAtPosition_(v91, v110, j, v111, v112, v113);
        if (v114 == objc_msgSend_indexAtPosition_(v47, v115, j, v116, v117, v118)) {
          goto LABEL_14;
        }
        v124 = objc_msgSend_result(v186, v119, v120, v121, v122, v123);
        v127 = objc_msgSend_transcriptionWithPath_columnRange_(v124, v125, (uint64_t)v91, j, 1, v126);
        v133 = objc_msgSend_lowercaseString(v127, v128, v129, v130, v131, v132);
        v139 = objc_msgSend_result(v186, v134, v135, v136, v137, v138);
        uint64_t v140 = (uint64_t)v47;
        v143 = objc_msgSend_transcriptionWithPath_columnRange_(v139, v141, (uint64_t)v47, j, 1, v142);
        v149 = objc_msgSend_lowercaseString(v143, v144, v145, v146, v147, v148);
        int isEqualToString = objc_msgSend_isEqualToString_(v133, v150, (uint64_t)v149, v151, v152, v153);

        v47 = (void *)v140;
        if (!isEqualToString)
        {
LABEL_14:
          v155 = objc_msgSend_result(v186, v119, v120, v121, v122, v123);
          v159 = objc_msgSend_tokensInTranscriptionPath_atColumnIndex_(v155, v164, (uint64_t)v91, j, v165, v166);
          objc_msgSend_addObjectsFromArray_(v185, v167, (uint64_t)v159, v168, v169, v170);
        }
        else
        {
          v155 = objc_msgSend_result(v186, v119, v120, v121, v122, v123);
          v159 = objc_msgSend_tokensInTranscriptionPath_atColumnIndex_(v155, v156, v140, j, v157, v158);
          objc_msgSend_addObjectsFromArray_(v185, v160, (uint64_t)v159, v161, v162, v163);
        }
      }
      objc_msgSend_addObject_(v183, v110, (uint64_t)v185, v111, v112, v113);
    }
    v171 = [CHTokenizedMathResult alloc];
    v176 = objc_msgSend_initWithBestPathTokens_(v171, v172, (uint64_t)v183, v173, v174, v175);
    objc_msgSend_setResult_(v186, v177, (uint64_t)v176, v178, v179, v180);
  }
  return v186;
}

@end