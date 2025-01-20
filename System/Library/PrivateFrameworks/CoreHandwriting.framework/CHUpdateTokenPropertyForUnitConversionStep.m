@interface CHUpdateTokenPropertyForUnitConversionStep
- (id)process:(id)a3 options:(id)a4;
- (id)unitConversionKeywordsFromOptions:(id)a3;
@end

@implementation CHUpdateTokenPropertyForUnitConversionStep

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v189 = *MEMORY[0x1E4F143B8];
  id v165 = a3;
  id v159 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v6 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEBUG, "CHUpdateTokenPropertyForUnitConversionStep is running", buf, 2u);
  }

  v163 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9, v10, v11);
  v17 = objc_msgSend_result(v165, v12, v13, v14, v15, v16);
  v23 = objc_msgSend_topTranscription(v17, v18, v19, v20, v21, v22);
  v27 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v23, v24, @" ", (uint64_t)&stru_1F20141C8, v25, v26);

  v31 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v27, v28, @"\\$", @"$", v29, v30);

  v35 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v31, v32, @"\\,", @"\\"", v33, v34);

  uint64_t v41 = objc_msgSend_length(v35, v36, v37, v38, v39, v40);
  v46 = objc_msgSend_unitConversionKeywordsFromOptions_(self, v42, (uint64_t)v159, v43, v44, v45);
  long long v186 = 0u;
  long long v187 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  id obj = v46;
  uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v184, (uint64_t)v188, 16, v48);
  if (v50)
  {
    v166 = 0;
    uint64_t v161 = *(void *)v185;
    uint64_t v168 = 0x7FFFFFFFFFFFFFFFLL;
    v170 = 0;
LABEL_7:
    uint64_t v51 = 0;
    uint64_t v162 = v50;
    while (1)
    {
      if (*(void *)v185 != v161) {
        objc_enumerationMutation(obj);
      }
      unint64_t v52 = 0;
      uint64_t v164 = v51;
      uint64_t v53 = *(void *)(*((void *)&v184 + 1) + 8 * v51);
      uint64_t v167 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        unint64_t v54 = objc_msgSend_rangeOfString_options_range_(v35, v49, v53, 1, v52, v41, v159);
        unint64_t v59 = v54;
        if (v54 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        v60 = v49;
        unint64_t v52 = (unint64_t)&v49[v54];
        BOOL v61 = v54 >= 2 && v52 <= objc_msgSend_length(v35, v49, v55, v56, v57, v58) - 2;
        v62 = objc_msgSend_substringWithRange_(v35, v49, v59 - 1, 1, v57, v58);
        int isEqualToString = objc_msgSend_isEqualToString_(v62, v63, @"\\"", v64, v65, v66);

        v71 = objc_msgSend_substringWithRange_(v35, v68, v52, 1, v69, v70);
        int v76 = objc_msgSend_isEqualToString_(v71, v72, @"\\"", v73, v74, v75);

        if (v61 & isEqualToString & v76)
        {
          v166 = v60;
          uint64_t v167 = v59;
          break;
        }
        if (v61 & (isEqualToString | v76))
        {
          v166 = v60;
          uint64_t v167 = v59;
        }
        else
        {
          if (v61) {
            v77 = v60;
          }
          else {
            v77 = v170;
          }
          uint64_t v78 = v168;
          if (v61) {
            uint64_t v78 = v59;
          }
          uint64_t v168 = v78;
          v170 = v77;
        }
        uint64_t v41 = objc_msgSend_length(v35, v49, v55, v56, v57, v58) - v52;
      }
      while (v52 != 0x7FFFFFFFFFFFFFFFLL);
      if (v167 != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v41 = objc_msgSend_length(v35, v49, v55, v56, v57, v58);
      uint64_t v51 = v164 + 1;
      if (v164 + 1 == v162)
      {
        uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v49, (uint64_t)&v184, (uint64_t)v188, 16, v79);
        if (v50) {
          goto LABEL_7;
        }
        goto LABEL_32;
      }
    }
  }
  else
  {
    v166 = 0;
    uint64_t v168 = 0x7FFFFFFFFFFFFFFFLL;
    v170 = 0;
LABEL_32:
    uint64_t v167 = 0x7FFFFFFFFFFFFFFFLL;
  }

  unint64_t v85 = 0;
  if (v167 == 0x7FFFFFFFFFFFFFFFLL) {
    v86 = v170;
  }
  else {
    v86 = v166;
  }
  uint64_t v87 = v168;
  if (v167 != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v87 = v167;
  }
  uint64_t v169 = v87;
  v171 = v86;
  while (1)
  {
    v88 = objc_msgSend_result(v165, v80, v81, v82, v83, v84, v159);
    v94 = objc_msgSend_transcriptionPaths(v88, v89, v90, v91, v92, v93);
    BOOL v100 = v85 < objc_msgSend_count(v94, v95, v96, v97, v98, v99);

    if (!v100) {
      break;
    }
    v106 = objc_msgSend_result(v165, v101, v102, v103, v104, v105);
    v112 = objc_msgSend_transcriptionPaths(v106, v107, v108, v109, v110, v111);
    v117 = objc_msgSend_objectAtIndexedSubscript_(v112, v113, v85, v114, v115, v116);

    v123 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v118, v119, v120, v121, v122);
    *(void *)buf = 0;
    v181 = buf;
    uint64_t v182 = 0x2020000000;
    char v183 = 0;
    v178[0] = 0;
    v178[1] = v178;
    v178[2] = 0x2020000000;
    char v179 = 0;
    v129 = objc_msgSend_result(v165, v124, v125, v126, v127, v128);
    v135 = objc_msgSend_result(v165, v130, v131, v132, v133, v134);
    uint64_t v141 = objc_msgSend_tokenColumnCount(v135, v136, v137, v138, v139, v140);
    v172[0] = MEMORY[0x1E4F143A8];
    v172[1] = 3221225472;
    v172[2] = sub_1C493970C;
    v172[3] = &unk_1E64E0D20;
    id v142 = v123;
    id v173 = v142;
    v174 = v178;
    v175 = buf;
    uint64_t v176 = v169;
    v177 = v171;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v129, v143, (uint64_t)v117, 0, v141, (uint64_t)v172);

    objc_msgSend_addObject_(v163, v144, (uint64_t)v142, v145, v146, v147);
    _Block_object_dispose(v178, 8);
    _Block_object_dispose(buf, 8);

    ++v85;
  }
  v148 = [CHTokenizedMathResult alloc];
  v153 = objc_msgSend_initWithBestPathTokens_(v148, v149, (uint64_t)v163, v150, v151, v152);
  objc_msgSend_setResult_(v165, v154, (uint64_t)v153, v155, v156, v157);

  return v165;
}

- (id)unitConversionKeywordsFromOptions:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C49399FC;
  block[3] = &unk_1E64E0D48;
  id v9 = v3;
  uint64_t v4 = qword_1EA3C8FD8;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EA3C8FD8, block);
  }
  id v6 = (id)qword_1EA3C8FD0;

  return v6;
}

@end