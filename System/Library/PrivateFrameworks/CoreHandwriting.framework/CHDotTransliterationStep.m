@interface CHDotTransliterationStep
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHDotTransliterationStep

- (id)process:(id)a3 options:(id)a4
{
  id v199 = a3;
  id v194 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v5 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v5, OS_LOG_TYPE_DEBUG, "CHDotTransliterationStep is running", buf, 2u);
  }

  v196 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v6, v7, v8, v9, v10);
  unint64_t v200 = 0;
  v195 = v204;
LABEL_6:
  v16 = objc_msgSend_result(v199, v11, v12, v13, v14, v15, v194, v195);
  v22 = objc_msgSend_transcriptionPaths(v16, v17, v18, v19, v20, v21);
  unint64_t v28 = objc_msgSend_count(v22, v23, v24, v25, v26, v27);

  if (v200 < v28)
  {
    v34 = objc_msgSend_result(v199, v29, v30, v31, v32, v33);
    v40 = objc_msgSend_transcriptionPaths(v34, v35, v36, v37, v38, v39);
    v198 = objc_msgSend_objectAtIndexedSubscript_(v40, v41, v200, v42, v43, v44);

    v197 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v45, v46, v47, v48, v49);
    v55 = objc_msgSend_result(v199, v50, v51, v52, v53, v54);
    v61 = objc_msgSend_result(v199, v56, v57, v58, v59, v60);
    uint64_t v67 = objc_msgSend_tokenColumnCount(v61, v62, v63, v64, v65, v66);
    v203[0] = MEMORY[0x1E4F143A8];
    v203[1] = 3221225472;
    v204[0] = sub_1C493FADC;
    v204[1] = &unk_1E64E0CD8;
    id v68 = v197;
    id v205 = v68;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v55, v69, (uint64_t)v198, 0, v67, (uint64_t)v203);
    for (uint64_t i = -1; ; ++i)
    {

      if (i + 2 >= (unint64_t)(objc_msgSend_count(v68, v71, v72, v73, v74, v75) - 1))
      {
        objc_msgSend_addObject_(v196, v76, (uint64_t)v68, v77, v78, v79);

        ++v200;
        goto LABEL_6;
      }
      v55 = objc_msgSend_objectAtIndexedSubscript_(v68, v76, i + 2, v77, v78, v79);
      v61 = objc_msgSend_objectAtIndexedSubscript_(v68, v80, i + 1, v81, v82, v83);
      v88 = objc_msgSend_objectAtIndexedSubscript_(v68, v84, i + 3, v85, v86, v87);
      v94 = objc_msgSend_string(v55, v89, v90, v91, v92, v93);
      int isEqualToString = objc_msgSend_isEqualToString_(v94, v95, @".", v96, v97, v98);

      if (isEqualToString)
      {
        unsigned int v201 = objc_msgSend_properties(v61, v100, v101, v102, v103, v104);
        if ((objc_msgSend_properties(v61, v105, v106, v107, v108, v109) & 8) != 0
          || (objc_msgSend_properties(v61, v110, v111, v112, v113, v114) & 0x800) != 0
          || (objc_msgSend_properties(v61, v110, v111, v112, v113, v114) & 0x100) != 0)
        {
          LOBYTE(v202) = 1;
        }
        else if (objc_msgSend_properties(v61, v110, v111, v112, v113, v114))
        {
          v178 = objc_msgSend_string(v61, v110, v111, v112, v113, v114);
          LODWORD(v202) = objc_msgSend_isEqualToString_(v178, v179, @"}", v180, v181, v182) ^ 1;
        }
        else
        {
          LOBYTE(v202) = 0;
        }
        unint64_t v115 = objc_msgSend_properties(v88, v110, v111, v112, v113, v114);
        if ((objc_msgSend_properties(v88, v116, v117, v118, v119, v120) & 8) != 0
          || (objc_msgSend_properties(v88, v121, v122, v123, v124, v125) & 0x1000) != 0
          || (objc_msgSend_properties(v88, v121, v122, v123, v124, v125) & 0x2000) != 0
          || (objc_msgSend_properties(v88, v121, v122, v123, v124, v125) & 0x40) != 0)
        {
          char v131 = 1;
        }
        else
        {
          v126 = objc_msgSend_string(v88, v121, v122, v123, v124, v125);
          char v131 = objc_msgSend_isEqualToString_(v126, v127, @"}", v128, v129, v130);
        }
        v132 = objc_msgSend_string(v61, v121, v122, v123, v124, v125);
        char v137 = objc_msgSend_isEqualToString_(v132, v133, @"}", v134, v135, v136);

        char v142 = v137 ^ 1;
        if ((unint64_t)(i + 2) < 2) {
          char v142 = 1;
        }
        if ((v142 & 1) == 0)
        {
          if (v202) {
            goto LABEL_8;
          }
          v143 = objc_msgSend_objectAtIndexedSubscript_(v68, v138, i, v139, v140, v141);
          unint64_t v202 = ((unint64_t)objc_msgSend_properties(v143, v144, v145, v146, v147, v148) >> 8) & 1;
        }
        if (!((v115 >> 1) & 1 & (v201 >> 1) | (v202 | v131) & 1))
        {
          v149 = [CHTokenizedMathResultToken alloc];
          v155 = objc_msgSend_strokeIndexes(v55, v150, v151, v152, v153, v154);
          objc_msgSend_score(v55, v156, v157, v158, v159, v160);
          double v162 = v161;
          objc_msgSend_bounds(v55, v163, v164, v165, v166, v167);
          v174 = objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v149, v168, @"\\cdot", (uint64_t)v155, 8, v169, v162, v170, v171, v172, v173);

          objc_msgSend_setObject_atIndexedSubscript_(v68, v175, (uint64_t)v174, i + 2, v176, v177);
        }
      }
LABEL_8:
    }
  }
  v183 = [CHTokenizedMathResult alloc];
  v188 = objc_msgSend_initWithBestPathTokens_(v183, v184, (uint64_t)v196, v185, v186, v187);
  objc_msgSend_setResult_(v199, v189, (uint64_t)v188, v190, v191, v192);

  return v199;
}

@end