@interface CHCombineAlternativesStep
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHCombineAlternativesStep

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v174 = *MEMORY[0x1E4F143B8];
  id v160 = a3;
  id v154 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v5 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v5, OS_LOG_TYPE_DEBUG, "CHCombineAlternativesStep is running", buf, 2u);
  }

  v6 = (void *)MEMORY[0x1E4F1CA70];
  v12 = objc_msgSend_result(v160, v7, v8, v9, v10, v11);
  v18 = objc_msgSend_transcriptionPaths(v12, v13, v14, v15, v16, v17);
  v155 = objc_msgSend_orderedSetWithArray_(v6, v19, (uint64_t)v18, v20, v21, v22);

  v33 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v23, v24, v25, v26, v27);
  uint64_t v34 = 0;
  for (i = 0; ; i = v96)
  {
    v35 = objc_msgSend_result(v160, v28, v29, v30, v31, v32, v154);
    BOOL v41 = v34 < objc_msgSend_tokenColumnCount(v35, v36, v37, v38, v39, v40);

    if (!v41) {
      break;
    }
    unint64_t v47 = 0;
    if (v34)
    {
      while (1)
      {
        v48 = objc_msgSend_result(v160, v42, v43, v44, v45, v46);
        v53 = objc_msgSend_tokenRowsAtColumnIndex_(v48, v49, v34, v50, v51, v52);
        BOOL v59 = v47 < objc_msgSend_count(v53, v54, v55, v56, v57, v58);

        if (!v59) {
          break;
        }
        long long v169 = 0u;
        long long v170 = 0u;
        long long v167 = 0u;
        long long v168 = 0u;
        id v60 = i;
        uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v61, (uint64_t)&v167, (uint64_t)v173, 16, v62);
        if (v67)
        {
          uint64_t v68 = *(void *)v168;
          do
          {
            for (uint64_t j = 0; j != v67; ++j)
            {
              if (*(void *)v168 != v68) {
                objc_enumerationMutation(v60);
              }
              v70 = objc_msgSend_indexPathByAddingIndex_(*(void **)(*((void *)&v167 + 1) + 8 * j), v63, v47, v64, v65, v66);
              objc_msgSend_addObject_(v33, v71, (uint64_t)v70, v72, v73, v74);
            }
            uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v63, (uint64_t)&v167, (uint64_t)v173, 16, v66);
          }
          while (v67);
        }

        ++v47;
      }
    }
    else
    {
      while (1)
      {
        v80 = objc_msgSend_result(v160, v42, v43, v44, v45, v46);
        v85 = objc_msgSend_tokenRowsAtColumnIndex_(v80, v81, 0, v82, v83, v84);
        BOOL v91 = v47 < objc_msgSend_count(v85, v86, v87, v88, v89, v90);

        if (!v91) {
          break;
        }
        v75 = objc_msgSend_indexPathWithIndex_(MEMORY[0x1E4F28D58], v92, v47, v93, v94, v95);
        objc_msgSend_addObject_(v33, v76, (uint64_t)v75, v77, v78, v79);

        ++v47;
      }
    }
    id v96 = v33;

    uint64_t v102 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v97, v98, v99, v100, v101);

    ++v34;
    v33 = (void *)v102;
  }
  objc_msgSend_addObjectsFromArray_(v155, v42, (uint64_t)i, v44, v45, v46);
  v158 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v103, v104, v105, v106, v107);
  long long v165 = 0u;
  long long v166 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  obuint64_t j = v155;
  uint64_t v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v108, (uint64_t)&v163, (uint64_t)v172, 16, v109);
  if (v115)
  {
    uint64_t v157 = *(void *)v164;
    do
    {
      for (uint64_t k = 0; k != v115; ++k)
      {
        if (*(void *)v164 != v157) {
          objc_enumerationMutation(obj);
        }
        uint64_t v117 = *(void *)(*((void *)&v163 + 1) + 8 * k);
        v118 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v110, v111, v112, v113, v114);
        v124 = objc_msgSend_result(v160, v119, v120, v121, v122, v123);
        v130 = objc_msgSend_result(v160, v125, v126, v127, v128, v129);
        uint64_t v136 = objc_msgSend_tokenColumnCount(v130, v131, v132, v133, v134, v135);
        v161[0] = MEMORY[0x1E4F143A8];
        v161[1] = 3221225472;
        v161[2] = sub_1C4941D64;
        v161[3] = &unk_1E64E0CD8;
        id v137 = v118;
        id v162 = v137;
        objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v124, v138, v117, 0, v136, (uint64_t)v161);

        objc_msgSend_addObject_(v158, v139, (uint64_t)v137, v140, v141, v142);
      }
      uint64_t v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v110, (uint64_t)&v163, (uint64_t)v172, 16, v114);
    }
    while (v115);
  }

  v143 = [CHTokenizedMathResult alloc];
  v148 = objc_msgSend_initWithBestPathTokens_(v143, v144, (uint64_t)v158, v145, v146, v147);
  objc_msgSend_setResult_(v160, v149, (uint64_t)v148, v150, v151, v152);

  return v160;
}

@end