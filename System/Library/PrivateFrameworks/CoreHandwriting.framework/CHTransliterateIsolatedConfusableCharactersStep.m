@interface CHTransliterateIsolatedConfusableCharactersStep
- (CHTransliterateIsolatedConfusableCharactersStep)init;
- (id).cxx_construct;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHTransliterateIsolatedConfusableCharactersStep

- (CHTransliterateIsolatedConfusableCharactersStep)init
{
  v8.receiver = self;
  v8.super_class = (Class)CHTransliterateIsolatedConfusableCharactersStep;
  id v2 = [(CHTransliterateIsolatedConfusableCharactersStep *)&v8 init];
  id v3 = v2;
  if (!v2) {
    return (CHTransliterateIsolatedConfusableCharactersStep *)v3;
  }
  char v6 = 2;
  LOWORD(__p[0]) = -16446;
  BYTE2(__p[0]) = 0;
  uint64_t v7 = 0x3FEE666666666666;
  sub_1C4C25DBC((uint64_t **)v2 + 1, "j", (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  char v6 = 2;
  LOWORD(__p[0]) = -16446;
  BYTE2(__p[0]) = 0;
  uint64_t v7 = 0x3FEE666666666666;
  sub_1C4C25DBC((uint64_t **)v3 + 1, "d", (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  char v6 = 2;
  LOWORD(__p[0]) = -16446;
  BYTE2(__p[0]) = 0;
  uint64_t v7 = 0x3FE6666666666666;
  sub_1C4C25DBC((uint64_t **)v3 + 1, "q", (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  char v6 = 2;
  LOWORD(__p[0]) = -16446;
  BYTE2(__p[0]) = 0;
  uint64_t v7 = 0x3FE6666666666666;
  sub_1C4C25DBC((uint64_t **)v3 + 1, "c", (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  char v6 = 2;
  LOWORD(__p[0]) = -24126;
  BYTE2(__p[0]) = 0;
  uint64_t v7 = 0x3FEE666666666666;
  sub_1C4C25DBC((uint64_t **)v3 + 1, "i", (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  char v6 = 2;
  LOWORD(__p[0]) = -24126;
  BYTE2(__p[0]) = 0;
  uint64_t v7 = 0x3FEE666666666666;
  sub_1C4C25DBC((uint64_t **)v3 + 1, ";", (uint64_t)__p);
  if ((v6 & 0x80000000) == 0) {
    return (CHTransliterateIsolatedConfusableCharactersStep *)v3;
  }
  operator delete(__p[0]);
  return (CHTransliterateIsolatedConfusableCharactersStep *)v3;
}

- (id)process:(id)a3 options:(id)a4
{
  v163 = (id *)a3;
  id v156 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v5 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v5, OS_LOG_TYPE_DEBUG, "CHTransliterateIsolatedConfusableCharactersStep is running", buf, 2u);
  }

  v161 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v6, v7, v8, v9, v10);
  v160 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v11, v12, v13, v14, v15);
  unint64_t v16 = 0;
  objc_msgSend_result(v163, v17, v18, v19, v20, v21, v156, v165);
  while (1)
    v27 = {;
    v33 = objc_msgSend_transcriptionPaths(v27, v28, v29, v30, v31, v32);
    unint64_t v39 = objc_msgSend_count(v33, v34, v35, v36, v37, v38);

    if (v16 >= v39) {
      break;
    }
    v45 = objc_msgSend_result(v163, v40, v41, v42, v43, v44);
    v51 = objc_msgSend_transcriptionPaths(v45, v46, v47, v48, v49, v50);
    v56 = objc_msgSend_objectAtIndexedSubscript_(v51, v52, v16, v53, v54, v55);

    v162 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v57, v58, v59, v60, v61);
    v67 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v62, v63, v64, v65, v66);
    v73 = objc_msgSend_result(v163, v68, v69, v70, v71, v72);
    v79 = objc_msgSend_result(v163, v74, v75, v76, v77, v78);
    uint64_t v85 = objc_msgSend_tokenColumnCount(v79, v80, v81, v82, v83, v84);
    v164[0] = MEMORY[0x1E4F143A8];
    v164[1] = 3221225472;
    v165[0] = sub_1C4C1A980;
    v165[1] = &unk_1E64E5278;
    unint64_t v170 = v16;
    id v86 = v67;
    id v166 = v86;
    v87 = v163;
    v167 = v87;
    v168 = self;
    id v88 = v162;
    id v169 = v88;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v73, v89, (uint64_t)v56, 0, v85, (uint64_t)v164);

    if (objc_msgSend_count(v86, v90, v91, v92, v93, v94))
    {
      objc_msgSend_addObject_(v161, v95, (uint64_t)v86, v97, v98, v99);
      v105 = objc_msgSend_result(v87, v100, v101, v102, v103, v104);
      v111 = objc_msgSend_transcriptionPathScores(v105, v106, v107, v108, v109, v110);
      v116 = objc_msgSend_objectAtIndexedSubscript_(v111, v112, v16, v113, v114, v115);
      objc_msgSend_addObject_(v160, v117, (uint64_t)v116, v118, v119, v120);
    }
    if (objc_msgSend_count(v88, v95, v96, v97, v98, v99))
    {
      if ((objc_msgSend_isEqual_(v88, v121, (uint64_t)v86, v122, v123, v124) & 1) == 0)
      {
        objc_msgSend_addObject_(v161, v125, (uint64_t)v88, v126, v127, v128);
        v134 = objc_msgSend_result(v87, v129, v130, v131, v132, v133);
        v140 = objc_msgSend_transcriptionPathScores(v134, v135, v136, v137, v138, v139);
        v145 = objc_msgSend_objectAtIndexedSubscript_(v140, v141, v16, v142, v143, v144);
        objc_msgSend_addObject_(v160, v146, (uint64_t)v145, v147, v148, v149);
      }
    }

    ++v16;
    objc_msgSend_result(v163, v22, v23, v24, v25, v26, v157, v158);
  }
  v150 = objc_msgSend_result(v163, v40, v41, v42, v43, v44);
  v154 = objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v150, v151, (uint64_t)v161, (uint64_t)v160, v152, v153);
  if (v163) {
    objc_storeStrong(v163 + 3, v154);
  }

  return v163;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  return self;
}

@end