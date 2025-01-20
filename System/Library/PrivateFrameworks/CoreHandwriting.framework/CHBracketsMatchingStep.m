@interface CHBracketsMatchingStep
- (CHBracketsMatchingStep)initWithCodemap:(id)a3;
- (id).cxx_construct;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHBracketsMatchingStep

- (CHBracketsMatchingStep)initWithCodemap:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CHBracketsMatchingStep;
  v9 = [(CHBracketsMatchingStep *)&v26 init];
  if (v9)
  {
    objc_msgSend_createLatexHelperFromMathCodemap_(CHMathPostProcessingManager, v5, (uint64_t)v4, v6, v7, v8);
    uint64_t value = (uint64_t)v9->latexHelper.__ptr_.__value_;
    v9->latexHelper.__ptr_.__value_ = v25;
    if (value)
    {
      uint64_t v15 = sub_1C494A3D8(value);
      MEMORY[0x1C8786460](v15, 0x10A0C409F3568C5);
    }
    v16 = (void *)MEMORY[0x1E4F1CAD0];
    v17 = objc_msgSend_componentsSeparatedByString_(@"() \\lfloor \\rfloor \\lceil \\rceil |", v10, @" ", v11, v12, v13);
    uint64_t v22 = objc_msgSend_setWithArray_(v16, v18, (uint64_t)v17, v19, v20, v21);
    bracketSymbols = v9->_bracketSymbols;
    v9->_bracketSymbols = (NSSet *)v22;
  }
  return v9;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v198 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v147 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  id v158 = v6;
  uint64_t v7 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v7, OS_LOG_TYPE_DEBUG, "CHBracketsMatchingStep is running", buf, 2u);
  }

  v157 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10, v11, v12);
  unint64_t v18 = 0;
  v155 = v193;
  v156 = &v192;
  v153 = v185;
  v154 = &v184;
  v151 = v179;
  v152 = &v178;
  v149 = v173;
  v150 = &v172;
  v148 = v164;
  while (1)
  {
    uint64_t v19 = objc_msgSend_result(v158, v13, v14, v15, v16, v17, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156);
    v25 = objc_msgSend_transcriptionPaths(v19, v20, v21, v22, v23, v24);
    BOOL v31 = v18 < objc_msgSend_count(v25, v26, v27, v28, v29, v30);

    if (!v31) {
      break;
    }
    v37 = objc_msgSend_result(v158, v32, v33, v34, v35, v36);
    v43 = objc_msgSend_transcriptionPaths(v37, v38, v39, v40, v41, v42);
    v48 = objc_msgSend_objectAtIndexedSubscript_(v43, v44, v18, v45, v46, v47);

    v54 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v49, v50, v51, v52, v53);
    *(void *)buf = 0;
    v190 = buf;
    uint64_t v191 = 0x6012000000;
    v192 = sub_1C4938234;
    v193[0] = sub_1C4938274;
    v193[1] = &unk_1C4CB5C62;
    long long v194 = 0u;
    long long v195 = 0u;
    long long v196 = 0u;
    v183[0] = 0;
    v183[1] = v183;
    v183[2] = 0x6012000000;
    v184 = sub_1C4938234;
    v185[0] = sub_1C4938274;
    v185[1] = &unk_1C4CB5C62;
    long long v186 = 0u;
    long long v187 = 0u;
    long long v188 = 0u;
    v177[0] = 0;
    v177[1] = v177;
    v177[2] = 0x6012000000;
    v178 = sub_1C4938234;
    v179[0] = sub_1C4938274;
    v179[1] = &unk_1C4CB5C62;
    long long v180 = 0u;
    long long v181 = 0u;
    long long v182 = 0u;
    v171[0] = 0;
    v171[1] = v171;
    v171[2] = 0x6012000000;
    v172 = sub_1C4938234;
    v173[0] = sub_1C4938274;
    v173[1] = &unk_1C4CB5C62;
    long long __p = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    v60 = objc_msgSend_result(v158, v55, v56, v57, v58, v59);
    v66 = objc_msgSend_result(v158, v61, v62, v63, v64, v65);
    uint64_t v72 = objc_msgSend_tokenColumnCount(v66, v67, v68, v69, v70, v71);
    v163[0] = MEMORY[0x1E4F143A8];
    v163[1] = 3221225472;
    v164[0] = sub_1C493827C;
    v164[1] = &unk_1E64E0DE8;
    id v73 = v54;
    v166 = self;
    v167 = v183;
    v168 = v177;
    v169 = v171;
    v170 = buf;
    id v165 = v73;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v60, v74, (uint64_t)v48, 0, v72, (uint64_t)v163);

    objc_msgSend_addObject_(v157, v75, (uint64_t)v73, v76, v77, v78);
    _Block_object_dispose(v171, 8);
    v79 = (void **)*((void *)&__p + 1);
    v80 = (void **)v175;
    *((void *)&v176 + 1) = 0;
    unint64_t v81 = v175 - *((void *)&__p + 1);
    if ((void)v175 - *((void *)&__p + 1) >= 0x11uLL)
    {
      do
      {
        operator delete(*v79);
        v80 = (void **)v175;
        v79 = (void **)(*((void *)&__p + 1) + 8);
        *((void *)&__p + 1) = v79;
        unint64_t v81 = v175 - (void)v79;
      }
      while ((void)v175 - (void)v79 > 0x10uLL);
    }
    unint64_t v82 = v81 >> 3;
    if (v82 == 1)
    {
      uint64_t v83 = 256;
      goto LABEL_13;
    }
    if (v82 == 2)
    {
      uint64_t v83 = 512;
LABEL_13:
      *(void *)&long long v176 = v83;
    }
    if (v79 != v80)
    {
      do
      {
        v84 = *v79++;
        operator delete(v84);
      }
      while (v79 != v80);
      if ((void)v175 != *((void *)&__p + 1)) {
        *(void *)&long long v175 = v175 + ((*((void *)&__p + 1) - v175 + 7) & 0xFFFFFFFFFFFFFFF8);
      }
    }
    if ((void)__p) {
      operator delete((void *)__p);
    }
    _Block_object_dispose(v177, 8);
    v85 = (void **)*((void *)&v180 + 1);
    v86 = (void **)v181;
    *((void *)&v182 + 1) = 0;
    unint64_t v87 = v181 - *((void *)&v180 + 1);
    if ((void)v181 - *((void *)&v180 + 1) >= 0x11uLL)
    {
      do
      {
        operator delete(*v85);
        v86 = (void **)v181;
        v85 = (void **)(*((void *)&v180 + 1) + 8);
        *((void *)&v180 + 1) = v85;
        unint64_t v87 = v181 - (void)v85;
      }
      while ((void)v181 - (void)v85 > 0x10uLL);
    }
    unint64_t v88 = v87 >> 3;
    if (v88 == 1)
    {
      uint64_t v89 = 256;
      goto LABEL_26;
    }
    if (v88 == 2)
    {
      uint64_t v89 = 512;
LABEL_26:
      *(void *)&long long v182 = v89;
    }
    if (v85 != v86)
    {
      do
      {
        v90 = *v85++;
        operator delete(v90);
      }
      while (v85 != v86);
      if ((void)v181 != *((void *)&v180 + 1)) {
        *(void *)&long long v181 = v181 + ((*((void *)&v180 + 1) - v181 + 7) & 0xFFFFFFFFFFFFFFF8);
      }
    }
    if ((void)v180) {
      operator delete((void *)v180);
    }
    _Block_object_dispose(v183, 8);
    v91 = (void **)*((void *)&v186 + 1);
    v92 = (void **)v187;
    *((void *)&v188 + 1) = 0;
    unint64_t v93 = v187 - *((void *)&v186 + 1);
    if ((void)v187 - *((void *)&v186 + 1) >= 0x11uLL)
    {
      do
      {
        operator delete(*v91);
        v92 = (void **)v187;
        v91 = (void **)(*((void *)&v186 + 1) + 8);
        *((void *)&v186 + 1) = v91;
        unint64_t v93 = v187 - (void)v91;
      }
      while ((void)v187 - (void)v91 > 0x10uLL);
    }
    unint64_t v94 = v93 >> 3;
    if (v94 == 1)
    {
      uint64_t v95 = 256;
      goto LABEL_39;
    }
    if (v94 == 2)
    {
      uint64_t v95 = 512;
LABEL_39:
      *(void *)&long long v188 = v95;
    }
    if (v91 != v92)
    {
      do
      {
        v96 = *v91++;
        operator delete(v96);
      }
      while (v91 != v92);
      if ((void)v187 != *((void *)&v186 + 1)) {
        *(void *)&long long v187 = v187 + ((*((void *)&v186 + 1) - v187 + 7) & 0xFFFFFFFFFFFFFFF8);
      }
    }
    if ((void)v186) {
      operator delete((void *)v186);
    }
    _Block_object_dispose(buf, 8);
    v97 = (void **)*((void *)&v194 + 1);
    v98 = (void **)v195;
    *((void *)&v196 + 1) = 0;
    unint64_t v99 = v195 - *((void *)&v194 + 1);
    if ((void)v195 - *((void *)&v194 + 1) >= 0x11uLL)
    {
      do
      {
        operator delete(*v97);
        v98 = (void **)v195;
        v97 = (void **)(*((void *)&v194 + 1) + 8);
        *((void *)&v194 + 1) = v97;
        unint64_t v99 = v195 - (void)v97;
      }
      while ((void)v195 - (void)v97 > 0x10uLL);
    }
    unint64_t v100 = v99 >> 3;
    if (v100 == 1)
    {
      uint64_t v101 = 256;
      goto LABEL_52;
    }
    if (v100 == 2)
    {
      uint64_t v101 = 512;
LABEL_52:
      *(void *)&long long v196 = v101;
    }
    if (v97 != v98)
    {
      do
      {
        v102 = *v97++;
        operator delete(v102);
      }
      while (v97 != v98);
      if ((void)v195 != *((void *)&v194 + 1)) {
        *(void *)&long long v195 = v195 + ((*((void *)&v194 + 1) - v195 + 7) & 0xFFFFFFFFFFFFFFF8);
      }
    }
    if ((void)v194) {
      operator delete((void *)v194);
    }

    ++v18;
  }
  v103 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v32, v33, v34, v35, v36);
  uint64_t v114 = objc_msgSend_count(v157, v104, v105, v106, v107, v108) - 1;
  if (v114 >= 0)
  {
    do
    {
      if (v114 || objc_msgSend_count(v103, v109, v110, v111, v112, v113))
      {
        long long v161 = 0u;
        long long v162 = 0u;
        long long v159 = 0u;
        long long v160 = 0u;
        v115 = objc_msgSend_objectAtIndexedSubscript_(v157, v109, v114, v111, v112, v113);
        uint64_t v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v116, (uint64_t)&v159, (uint64_t)v197, 16, v117);
        if (v123)
        {
          uint64_t v124 = *(void *)v160;
LABEL_65:
          uint64_t v125 = 0;
          while (1)
          {
            if (*(void *)v160 != v124) {
              objc_enumerationMutation(v115);
            }
            bracketSymbols = self->_bracketSymbols;
            v127 = objc_msgSend_string(*(void **)(*((void *)&v159 + 1) + 8 * v125), v118, v119, v120, v121, v122);
            LOBYTE(bracketSymbols) = objc_msgSend_containsObject_(bracketSymbols, v128, (uint64_t)v127, v129, v130, v131);

            if (bracketSymbols) {
              goto LABEL_73;
            }
            if (v123 == ++v125)
            {
              uint64_t v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v118, (uint64_t)&v159, (uint64_t)v197, 16, v122);
              if (v123) {
                goto LABEL_65;
              }
              break;
            }
          }
        }
      }
      v115 = objc_msgSend_objectAtIndexedSubscript_(v157, v109, v114, v111, v112, v113);
      objc_msgSend_insertObject_atIndex_(v103, v132, (uint64_t)v115, 0, v133, v134);
LABEL_73:
    }
    while (v114-- > 0);
  }
  v136 = [CHTokenizedMathResult alloc];
  v141 = objc_msgSend_initWithBestPathTokens_(v136, v137, (uint64_t)v103, v138, v139, v140);
  objc_msgSend_setResult_(v158, v142, (uint64_t)v141, v143, v144, v145);

  return v158;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bracketSymbols, 0);
  uint64_t value = self->latexHelper.__ptr_.__value_;
  self->latexHelper.__ptr_.__value_ = 0;
  if (value)
  {
    sub_1C494A3D8((uint64_t)value);
    JUMPOUT(0x1C8786460);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end