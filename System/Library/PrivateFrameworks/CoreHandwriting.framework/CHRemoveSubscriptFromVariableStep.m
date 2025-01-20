@interface CHRemoveSubscriptFromVariableStep
- (BOOL)isAlphabetic:(id)a3;
- (id)_trimSubscriptTokens:(id)a3;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHRemoveSubscriptFromVariableStep

- (id)_trimSubscriptTokens:(id)a3
{
  id v3 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v10 = 0;
  while (v10 < objc_msgSend_count(v3, v4, v5, v6, v7, v8))
  {
    if (v10 >= objc_msgSend_count(v3, v11, v12, v13, v14, v15) - 1) {
      goto LABEL_9;
    }
    v16 = objc_msgSend_objectAtIndexedSubscript_(v3, v4, v10, v6, v7, v8);
    v22 = objc_msgSend_string(v16, v17, v18, v19, v20, v21);
    if (objc_msgSend_isEqualToString_(v22, v23, @"_", v24, v25, v26))
    {
      v31 = objc_msgSend_objectAtIndexedSubscript_(v3, v27, v10 + 1, v28, v29, v30);
      v37 = objc_msgSend_string(v31, v32, v33, v34, v35, v36);
      char isEqualToString = objc_msgSend_isEqualToString_(v37, v38, @"{", v39, v40, v41);

      if ((isEqualToString & 1) == 0) {
        goto LABEL_9;
      }
      v10 += 2;
    }
    else
    {

LABEL_9:
      v43 = objc_msgSend_objectAtIndex_(v3, v4, v10, v6, v7, v8);
      v49 = objc_msgSend_string(v43, v44, v45, v46, v47, v48);
      char v54 = objc_msgSend_isEqualToString_(v49, v50, @"}", v51, v52, v53);

      if ((v54 & 1) == 0)
      {
        v55 = objc_msgSend_objectAtIndex_(v3, v4, v10, v6, v7, v8);
        objc_msgSend_addObject_(v9, v56, (uint64_t)v55, v57, v58, v59);
      }
      ++v10;
    }
  }

  return v9;
}

- (BOOL)isAlphabetic:(id)a3
{
  id v3 = a3;
  id v9 = objc_msgSend_letterCharacterSet(MEMORY[0x1E4F28B88], v4, v5, v6, v7, v8);
  uint64_t v15 = objc_msgSend_invertedSet(v9, v10, v11, v12, v13, v14);

  LOBYTE(v9) = objc_msgSend_rangeOfCharacterFromSet_(v3, v16, (uint64_t)v15, v17, v18, v19) == 0x7FFFFFFFFFFFFFFFLL;
  return (char)v9;
}

- (id)process:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v144 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v6 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEBUG, "CHRemoveSubscriptFromVariableStep is running", buf, 2u);
  }

  uint64_t v12 = objc_msgSend_result(v5, v7, v8, v9, v10, v11);
  uint64_t v18 = objc_msgSend_transcriptionPaths(v12, v13, v14, v15, v16, v17);
  uint64_t v24 = objc_msgSend_count(v18, v19, v20, v21, v22, v23);

  if (v24)
  {
    v146 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v25, @"{}_", v26, v27, v28, v144);
    v147 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v29, v30, v31, v32, v33);
    for (unint64_t i = 0; ; ++i)
    {
      uint64_t v40 = objc_msgSend_result(v5, v34, v35, v36, v37, v38);
      uint64_t v46 = objc_msgSend_transcriptionPaths(v40, v41, v42, v43, v44, v45);
      unint64_t v52 = objc_msgSend_count(v46, v47, v48, v49, v50, v51);

      if (i >= v52)
      {
        v133 = [CHTokenizedMathResult alloc];
        v138 = objc_msgSend_initWithBestPathTokens_(v133, v134, (uint64_t)v147, v135, v136, v137);
        objc_msgSend_setResult_(v5, v139, (uint64_t)v138, v140, v141, v142);

        goto LABEL_23;
      }
      uint64_t v58 = objc_msgSend_result(v5, v53, v54, v55, v56, v57);
      v64 = objc_msgSend_transcriptionPaths(v58, v59, v60, v61, v62, v63);
      v69 = objc_msgSend_objectAtIndexedSubscript_(v64, v65, i, v66, v67, v68);

      v75 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v70, v71, v72, v73, v74);
      v81 = objc_msgSend_result(v5, v76, v77, v78, v79, v80);
      v87 = objc_msgSend_result(v5, v82, v83, v84, v85, v86);
      uint64_t v93 = objc_msgSend_tokenColumnCount(v87, v88, v89, v90, v91, v92);
      v179[0] = MEMORY[0x1E4F143A8];
      v179[1] = 3221225472;
      v179[2] = sub_1C4940700;
      v179[3] = &unk_1E64E0CD8;
      id v94 = v75;
      id v180 = v94;
      objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v81, v95, (uint64_t)v69, 0, v93, (uint64_t)v179);

      v101 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v96, v97, v98, v99, v100);
      *(void *)buf = 0;
      v173 = buf;
      uint64_t v174 = 0x6012000000;
      v175 = sub_1C493C4A4;
      v176 = sub_1C493C4E4;
      v177 = &unk_1C4CB5C62;
      memset(v178, 0, sizeof(v178));
      v170[0] = 0;
      v170[1] = v170;
      v170[2] = 0x6012000000;
      v170[3] = sub_1C493C4A4;
      v170[4] = sub_1C493C4E4;
      v170[5] = &unk_1C4CB5C62;
      memset(v171, 0, sizeof(v171));
      v168[0] = 0;
      v168[1] = v168;
      v168[2] = 0x6012000000;
      v168[3] = sub_1C493C534;
      v168[4] = sub_1C493C574;
      v168[5] = &unk_1C4CB5C62;
      memset(v169, 0, sizeof(v169));
      v166[0] = 0;
      v166[1] = v166;
      v166[2] = 0x6012000000;
      v166[3] = sub_1C493C534;
      v166[4] = sub_1C493C574;
      v166[5] = &unk_1C4CB5C62;
      memset(v167, 0, sizeof(v167));
      v162[0] = 0;
      v162[1] = v162;
      v162[2] = 0x6012000000;
      v162[3] = sub_1C4938234;
      v162[4] = sub_1C4938274;
      v162[5] = &unk_1C4CB5C62;
      long long __p = 0u;
      long long v164 = 0u;
      long long v165 = 0u;
      v160[0] = 0;
      v160[1] = v160;
      v160[2] = 0x3032000000;
      v160[3] = sub_1C494070C;
      v160[4] = sub_1C494071C;
      id v161 = 0;
      v107 = objc_msgSend_result(v5, v102, v103, v104, v105, v106);
      v113 = objc_msgSend_result(v5, v108, v109, v110, v111, v112);
      uint64_t v119 = objc_msgSend_tokenColumnCount(v113, v114, v115, v116, v117, v118);
      v148[0] = MEMORY[0x1E4F143A8];
      v148[1] = 3221225472;
      v148[2] = sub_1C4940724;
      v148[3] = &unk_1E64E0E60;
      v154 = v160;
      v155 = v170;
      id v120 = v94;
      id v149 = v120;
      v150 = self;
      v156 = buf;
      v157 = v168;
      v158 = v166;
      v159 = v162;
      id v151 = v146;
      id v152 = v5;
      id v121 = v101;
      id v153 = v121;
      objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v107, v122, (uint64_t)v69, 0, v119, (uint64_t)v148);

      objc_msgSend_addObject_(v147, v123, (uint64_t)v121, v124, v125, v126);
      _Block_object_dispose(v160, 8);

      _Block_object_dispose(v162, 8);
      v127 = (void **)*((void *)&__p + 1);
      v128 = (void **)v164;
      *((void *)&v165 + 1) = 0;
      unint64_t v129 = v164 - *((void *)&__p + 1);
      if ((void)v164 - *((void *)&__p + 1) >= 0x11uLL)
      {
        do
        {
          operator delete(*v127);
          v128 = (void **)v164;
          v127 = (void **)(*((void *)&__p + 1) + 8);
          *((void *)&__p + 1) = v127;
          unint64_t v129 = v164 - (void)v127;
        }
        while ((void)v164 - (void)v127 > 0x10uLL);
      }
      unint64_t v130 = v129 >> 3;
      if (v130 == 1) {
        break;
      }
      if (v130 == 2)
      {
        uint64_t v131 = 512;
LABEL_15:
        *(void *)&long long v165 = v131;
      }
      if (v127 != v128)
      {
        do
        {
          v132 = *v127++;
          operator delete(v132);
        }
        while (v127 != v128);
        if ((void)v164 != *((void *)&__p + 1)) {
          *(void *)&long long v164 = v164 + ((*((void *)&__p + 1) - v164 + 7) & 0xFFFFFFFFFFFFFFF8);
        }
      }
      if ((void)__p) {
        operator delete((void *)__p);
      }
      _Block_object_dispose(v166, 8);
      sub_1C494685C((uint64_t)v167);
      _Block_object_dispose(v168, 8);
      sub_1C494685C((uint64_t)v169);
      _Block_object_dispose(v170, 8);
      sub_1C494685C((uint64_t)v171);
      _Block_object_dispose(buf, 8);
      sub_1C494685C((uint64_t)v178);
    }
    uint64_t v131 = 256;
    goto LABEL_15;
  }
LABEL_23:

  return v5;
}

@end