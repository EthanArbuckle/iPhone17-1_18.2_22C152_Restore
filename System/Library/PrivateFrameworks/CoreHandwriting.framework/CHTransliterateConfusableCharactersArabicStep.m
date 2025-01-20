@interface CHTransliterateConfusableCharactersArabicStep
- (CHTransliterateConfusableCharactersArabicStep)init;
- (id).cxx_construct;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHTransliterateConfusableCharactersArabicStep

- (CHTransliterateConfusableCharactersArabicStep)init
{
  v8.receiver = self;
  v8.super_class = (Class)CHTransliterateConfusableCharactersArabicStep;
  id v2 = [(CHTransliterateConfusableCharactersArabicStep *)&v8 init];
  id v3 = v2;
  if (!v2) {
    return (CHTransliterateConfusableCharactersArabicStep *)v3;
  }
  char v6 = 2;
  strcpy((char *)__p, "و");
  uint64_t v7 = 0x3FF0000000000000;
  sub_1C4C25DBC((uint64_t **)v2 + 1, "9", (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  char v6 = 2;
  strcpy((char *)__p, "و");
  uint64_t v7 = 0x3FF0000000000000;
  sub_1C4C25DBC((uint64_t **)v3 + 1, "g", (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  char v6 = 2;
  strcpy((char *)__p, "ز");
  uint64_t v7 = 0x3FF0000000000000;
  sub_1C4C25DBC((uint64_t **)v3 + 1, "j", (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  char v6 = 2;
  strcpy((char *)__p, "ل");
  uint64_t v7 = 0x3FF0000000000000;
  sub_1C4C25DBC((uint64_t **)v3 + 1, "J", (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  char v6 = 2;
  strcpy((char *)__p, "ه");
  uint64_t v7 = 0x3FF0000000000000;
  sub_1C4C25DBC((uint64_t **)v3 + 1, "o", (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  char v6 = 2;
  strcpy((char *)__p, "٥");
  uint64_t v7 = 0x3FF0000000000000;
  sub_1C4C25DBC((uint64_t **)v3 + 4, "o", (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  char v6 = 2;
  strcpy((char *)__p, "٥");
  uint64_t v7 = 0x3FF0000000000000;
  sub_1C4C25DBC((uint64_t **)v3 + 4, "0", (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  char v6 = 2;
  strcpy((char *)__p, "١");
  uint64_t v7 = 0x3FF0000000000000;
  sub_1C4C25DBC((uint64_t **)v3 + 4, "1", (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  char v6 = 2;
  strcpy((char *)__p, "٦");
  uint64_t v7 = 0x3FF0000000000000;
  sub_1C4C25DBC((uint64_t **)v3 + 4, "7", (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  char v6 = 2;
  strcpy((char *)__p, "٩");
  uint64_t v7 = 0x3FF0000000000000;
  sub_1C4C25DBC((uint64_t **)v3 + 4, "9", (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  char v6 = 2;
  strcpy((char *)__p, "٩");
  uint64_t v7 = 0x3FF0000000000000;
  sub_1C4C25DBC((uint64_t **)v3 + 4, "q", (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  char v6 = 2;
  strcpy((char *)__p, "٧");
  uint64_t v7 = 0x3FF0000000000000;
  sub_1C4C25DBC((uint64_t **)v3 + 4, "v", (uint64_t)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  char v6 = 2;
  strcpy((char *)__p, "٧");
  uint64_t v7 = 0x3FF0000000000000;
  sub_1C4C25DBC((uint64_t **)v3 + 4, "V", (uint64_t)__p);
  if ((v6 & 0x80000000) == 0) {
    return (CHTransliterateConfusableCharactersArabicStep *)v3;
  }
  operator delete(__p[0]);
  return (CHTransliterateConfusableCharactersArabicStep *)v3;
}

- (id)process:(id)a3 options:(id)a4
{
  v192 = (id *)a3;
  id v190 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v5 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v5, OS_LOG_TYPE_DEBUG, "CHTransliterateConfusableCharactersArabicStep is running", buf, 2u);
  }

  char v6 = (void *)MEMORY[0x1E4F1CA48];
  v12 = objc_msgSend_result(v192, v7, v8, v9, v10, v11);
  v18 = objc_msgSend_transcriptionPaths(v12, v13, v14, v15, v16, v17);
  uint64_t v24 = objc_msgSend_count(v18, v19, v20, v21, v22, v23);
  v189 = objc_msgSend_arrayWithCapacity_(v6, v25, v24, v26, v27, v28);

  v29 = (void *)MEMORY[0x1E4F1CA48];
  v35 = objc_msgSend_result(v192, v30, v31, v32, v33, v34);
  v41 = objc_msgSend_transcriptionPaths(v35, v36, v37, v38, v39, v40);
  uint64_t v47 = objc_msgSend_count(v41, v42, v43, v44, v45, v46);
  v188 = objc_msgSend_arrayWithCapacity_(v29, v48, v47, v49, v50, v51);

  if (qword_1EA3C9F80 != -1) {
    dispatch_once(&qword_1EA3C9F80, &unk_1F2013CC8);
  }
  for (unint64_t i = 0; ; ++i)
  {
    v58 = objc_msgSend_result(v192, v52, v53, v54, v55, v56);
    v64 = objc_msgSend_transcriptionPaths(v58, v59, v60, v61, v62, v63);
    unint64_t v70 = objc_msgSend_count(v64, v65, v66, v67, v68, v69);

    if (i >= v70) {
      break;
    }
    v76 = objc_msgSend_result(v192, v71, v72, v73, v74, v75);
    v82 = objc_msgSend_transcriptionPaths(v76, v77, v78, v79, v80, v81);
    v87 = objc_msgSend_objectAtIndexedSubscript_(v82, v83, i, v84, v85, v86);

    v191 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v88, v89, v90, v91, v92);
    v98 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v93, v94, v95, v96, v97);
    v104 = objc_msgSend_result(v192, v99, v100, v101, v102, v103);
    v110 = objc_msgSend_result(v192, v105, v106, v107, v108, v109);
    uint64_t v116 = objc_msgSend_tokenColumnCount(v110, v111, v112, v113, v114, v115);
    v193[0] = MEMORY[0x1E4F143A8];
    v193[1] = 3221225472;
    v193[2] = sub_1C4C1BA68;
    v193[3] = &unk_1E64E52A0;
    unint64_t v199 = i;
    v117 = v192;
    v194 = v117;
    v195 = self;
    id v196 = v190;
    id v118 = v191;
    id v197 = v118;
    id v119 = v98;
    id v198 = v119;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v104, v120, (uint64_t)v87, 0, v116, (uint64_t)v193);

    if (objc_msgSend_count(v118, v121, v122, v123, v124, v125))
    {
      objc_msgSend_addObject_(v189, v126, (uint64_t)v118, v128, v129, v130);
      v136 = objc_msgSend_result(v117, v131, v132, v133, v134, v135);
      v142 = objc_msgSend_transcriptionPathScores(v136, v137, v138, v139, v140, v141);
      v147 = objc_msgSend_objectAtIndexedSubscript_(v142, v143, i, v144, v145, v146);
      objc_msgSend_addObject_(v188, v148, (uint64_t)v147, v149, v150, v151);
    }
    if (objc_msgSend_count(v119, v126, v127, v128, v129, v130))
    {
      if ((objc_msgSend_isEqual_(v119, v152, (uint64_t)v118, v153, v154, v155) & 1) == 0)
      {
        objc_msgSend_addObject_(v189, v156, (uint64_t)v119, v157, v158, v159);
        v165 = objc_msgSend_result(v117, v160, v161, v162, v163, v164);
        v171 = objc_msgSend_transcriptionPathScores(v165, v166, v167, v168, v169, v170);
        v176 = objc_msgSend_objectAtIndexedSubscript_(v171, v172, i, v173, v174, v175);
        objc_msgSend_addObject_(v188, v177, (uint64_t)v176, v178, v179, v180);
      }
    }
  }
  v181 = objc_msgSend_result(v192, v71, v72, v73, v74, v75);
  v185 = objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v181, v182, (uint64_t)v189, (uint64_t)v188, v183, v184);
  if (v192) {
    objc_storeStrong(v192 + 3, v185);
  }

  return v192;
}

- (void).cxx_destruct
{
  sub_1C4C260A0((uint64_t)self->_transliterationMapArabicNumbers.__tree_.__pair1_.__value_.__left_);
  left = self->_transliterationMapArabicLetters.__tree_.__pair1_.__value_.__left_;
  sub_1C4C260A0((uint64_t)left);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  *((void *)self + 6) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 4) = (char *)self + 40;
  return self;
}

@end