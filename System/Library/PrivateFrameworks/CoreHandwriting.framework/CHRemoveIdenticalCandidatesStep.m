@interface CHRemoveIdenticalCandidatesStep
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHRemoveIdenticalCandidatesStep

- (id)process:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v202 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v6 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEBUG, "CHRemoveIdenticalCandidatesStep is running", buf, 2u);
  }

  v12 = objc_msgSend_result(v5, v7, v8, v9, v10, v11);
  v18 = objc_msgSend_transcriptionPaths(v12, v13, v14, v15, v16, v17);
  unint64_t v24 = objc_msgSend_count(v18, v19, v20, v21, v22, v23);

  if (v24 >= 2)
  {
    v35 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v25, v26, v27, v28, v29);
    for (uint64_t i = 0; ; ++i)
    {
      v37 = objc_msgSend_result(v5, v30, v31, v32, v33, v34);
      uint64_t v43 = objc_msgSend_tokenColumnCount(v37, v38, v39, v40, v41, v42);

      if (i >= v43) {
        break;
      }
      v49 = objc_msgSend_result(v5, v44, v45, v46, v47, v48);
      v54 = objc_msgSend_renderableLatexCandidatesForColumnIndex_(v49, v50, i, v51, v52, v53);

      if ((unint64_t)objc_msgSend_count(v54, v55, v56, v57, v58, v59) >= 2)
      {
        v204 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v60, v61, v62, v63, v64);
        for (unint64_t j = 0; j < objc_msgSend_count(v54, v65, v66, v67, v68, v69); ++j)
        {
          v75 = objc_msgSend_objectAtIndexedSubscript_(v54, v71, j, v72, v73, v74);
          int v80 = objc_msgSend_containsObject_(v204, v76, (uint64_t)v75, v77, v78, v79);

          if (v80)
          {
            for (unint64_t k = 0; ; ++k)
            {
              v87 = objc_msgSend_result(v5, v81, v82, v83, v84, v85);
              v93 = objc_msgSend_transcriptionPaths(v87, v88, v89, v90, v91, v92);
              unint64_t v99 = objc_msgSend_count(v93, v94, v95, v96, v97, v98);

              if (k >= v99) {
                break;
              }
              v100 = objc_msgSend_result(v5, v65, v66, v67, v68, v69);
              v106 = objc_msgSend_transcriptionPaths(v100, v101, v102, v103, v104, v105);
              v111 = objc_msgSend_objectAtIndexedSubscript_(v106, v107, k, v108, v109, v110);
              uint64_t v116 = objc_msgSend_indexAtPosition_(v111, v112, i, v113, v114, v115);

              if (v116 == j) {
                objc_msgSend_addIndex_(v35, v81, k, v83, v84, v85);
              }
            }
          }
          else
          {
            v117 = objc_msgSend_objectAtIndexedSubscript_(v54, v81, j, v83, v84, v85);
            objc_msgSend_addObject_(v204, v118, (uint64_t)v117, v119, v120, v121);
          }
        }
      }
    }
    if (objc_msgSend_count(v35, v44, v45, v46, v47, v48))
    {
      v205 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v122, v123, v124, v125, v126);
      for (unint64_t m = 0; ; ++m)
      {
        v133 = objc_msgSend_result(v5, v127, v128, v129, v130, v131);
        v139 = objc_msgSend_transcriptionPaths(v133, v134, v135, v136, v137, v138);
        unint64_t v145 = objc_msgSend_count(v139, v140, v141, v142, v143, v144);

        if (m >= v145) {
          break;
        }
        if ((objc_msgSend_containsIndex_(v35, v146, m, v147, v148, v149) & 1) == 0)
        {
          v203 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v127, v128, v129, v130, v131);
          v155 = objc_msgSend_result(v5, v150, v151, v152, v153, v154);
          v161 = objc_msgSend_result(v5, v156, v157, v158, v159, v160);
          v167 = objc_msgSend_transcriptionPaths(v161, v162, v163, v164, v165, v166);
          v172 = objc_msgSend_objectAtIndexedSubscript_(v167, v168, m, v169, v170, v171);
          v178 = objc_msgSend_result(v5, v173, v174, v175, v176, v177);
          uint64_t v184 = objc_msgSend_tokenColumnCount(v178, v179, v180, v181, v182, v183);
          v206[0] = MEMORY[0x1E4F143A8];
          v206[1] = 3221225472;
          v206[2] = sub_1C4944824;
          v206[3] = &unk_1E64E0CD8;
          id v185 = v203;
          id v207 = v185;
          objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v155, v186, (uint64_t)v172, 0, v184, (uint64_t)v206);

          objc_msgSend_addObject_(v205, v187, (uint64_t)v185, v188, v189, v190);
        }
      }
      v191 = [CHTokenizedMathResult alloc];
      v196 = objc_msgSend_initWithBestPathTokens_(v191, v192, (uint64_t)v205, v193, v194, v195);
      objc_msgSend_setResult_(v5, v197, (uint64_t)v196, v198, v199, v200);
    }
  }

  return v5;
}

@end