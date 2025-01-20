@interface CHRemoveInvalidExpressionCandidatesStep
- (BOOL)isTranscriptionValidExpression:(id)a3 transcriptionPath:(id)a4 limitToCurrentLocale:(BOOL)a5;
- (CHRemoveInvalidExpressionCandidatesStep)initWithCodemap:(id)a3;
- (id).cxx_construct;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHRemoveInvalidExpressionCandidatesStep

- (CHRemoveInvalidExpressionCandidatesStep)initWithCodemap:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CHRemoveInvalidExpressionCandidatesStep;
  v9 = [(CHRemoveInvalidExpressionCandidatesStep *)&v14 init];
  if (v9)
  {
    objc_msgSend_createLatexHelperFromMathCodemap_(CHMathPostProcessingManager, v5, (uint64_t)v4, v6, v7, v8);
    uint64_t value = (uint64_t)v9->_latexSyntaxHelper.__ptr_.__value_;
    v9->_latexSyntaxHelper.__ptr_.__value_ = v13;
    if (value)
    {
      uint64_t v11 = sub_1C494A3D8(value);
      MEMORY[0x1C8786460](v11, 0x10A0C409F3568C5);
    }
  }

  return v9;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v167 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v148 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v7 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v7, OS_LOG_TYPE_DEBUG, "CHRemoveInvalidExpressionCandidatesStep is running", buf, 2u);
  }

  v16 = objc_msgSend_objectForKeyedSubscript_(v148, v8, (uint64_t)CHMathPostProcessingOptionForceLocaleNumberFormat, v9, v10, v11);
  v153 = v6;
  if (v16)
  {
    v17 = objc_msgSend_objectForKeyedSubscript_(v148, v12, (uint64_t)CHMathPostProcessingOptionForceLocaleNumberFormat, v13, v14, v15);
    uint64_t v23 = objc_msgSend_BOOLValue(v17, v18, v19, v20, v21, v22);
  }
  else
  {
    uint64_t v23 = 1;
  }

  v24 = (void *)MEMORY[0x1E4F1CA48];
  v30 = objc_msgSend_result(v6, v25, v26, v27, v28, v29);
  v36 = objc_msgSend_transcriptionPaths(v30, v31, v32, v33, v34, v35);
  uint64_t v42 = objc_msgSend_count(v36, v37, v38, v39, v40, v41);
  v150 = objc_msgSend_arrayWithCapacity_(v24, v43, v42, v44, v45, v46);

  long long v162 = 0u;
  long long v163 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  v52 = objc_msgSend_result(v6, v47, v48, v49, v50, v51);
  v58 = objc_msgSend_transcriptionPaths(v52, v53, v54, v55, v56, v57);

  uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v59, (uint64_t)&v160, (uint64_t)v166, 16, v60);
  if (v66)
  {
    uint64_t v67 = *(void *)v161;
    do
    {
      for (uint64_t i = 0; i != v66; ++i)
      {
        if (*(void *)v161 != v67) {
          objc_enumerationMutation(v58);
        }
        uint64_t v69 = *(void *)(*((void *)&v160 + 1) + 8 * i);
        v70 = objc_msgSend_result(v6, v61, v62, v63, v64, v65, v148);
        int isTranscriptionValidExpression_transcriptionPath_limitToCurrentLocale = objc_msgSend_isTranscriptionValidExpression_transcriptionPath_limitToCurrentLocale_(self, v71, (uint64_t)v70, v69, v23, v72);

        if (isTranscriptionValidExpression_transcriptionPath_limitToCurrentLocale) {
          objc_msgSend_addObject_(v150, v61, v69, v63, v64, v65);
        }
      }
      uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v61, (uint64_t)&v160, (uint64_t)v166, 16, v65);
    }
    while (v66);
  }

  if (!objc_msgSend_count(v150, v74, v75, v76, v77, v78))
  {
    v84 = objc_msgSend_result(v6, v79, v80, v81, v82, v83);
    v90 = objc_msgSend_transcriptionPaths(v84, v85, v86, v87, v88, v89);
    v96 = objc_msgSend_firstObject(v90, v91, v92, v93, v94, v95);
    objc_msgSend_addObject_(v150, v97, (uint64_t)v96, v98, v99, v100);
  }
  v152 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v79, v80, v81, v82, v83, v148);
  long long v158 = 0u;
  long long v159 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  obuint64_t j = v150;
  uint64_t v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v101, (uint64_t)&v156, (uint64_t)v165, 16, v102);
  if (v108)
  {
    uint64_t v109 = *(void *)v157;
    do
    {
      for (uint64_t j = 0; j != v108; ++j)
      {
        if (*(void *)v157 != v109) {
          objc_enumerationMutation(obj);
        }
        uint64_t v111 = *(void *)(*((void *)&v156 + 1) + 8 * j);
        v112 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v103, v104, v105, v106, v107);
        v118 = objc_msgSend_result(v153, v113, v114, v115, v116, v117);
        v124 = objc_msgSend_result(v153, v119, v120, v121, v122, v123);
        uint64_t v130 = objc_msgSend_tokenColumnCount(v124, v125, v126, v127, v128, v129);
        v154[0] = MEMORY[0x1E4F143A8];
        v154[1] = 3221225472;
        v154[2] = sub_1C494245C;
        v154[3] = &unk_1E64E0CD8;
        id v131 = v112;
        id v155 = v131;
        objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v118, v132, v111, 0, v130, (uint64_t)v154);

        id v6 = v153;
        objc_msgSend_addObject_(v152, v133, (uint64_t)v131, v134, v135, v136);
      }
      uint64_t v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v103, (uint64_t)&v156, (uint64_t)v165, 16, v107);
    }
    while (v108);
  }

  v137 = [CHTokenizedMathResult alloc];
  v142 = objc_msgSend_initWithBestPathTokens_(v137, v138, (uint64_t)v152, v139, v140, v141);
  objc_msgSend_setResult_(v6, v143, (uint64_t)v142, v144, v145, v146);

  return v6;
}

- (BOOL)isTranscriptionValidExpression:(id)a3 transcriptionPath:(id)a4 limitToCurrentLocale:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v15 = objc_msgSend_tokenColumnCount(v8, v10, v11, v12, v13, v14);
  v18 = objc_msgSend_transcriptionWithPath_columnRange_(v8, v16, (uint64_t)v9, 0, v15, v17);
  uint64_t value = self->_latexSyntaxHelper.__ptr_.__value_;
  id v20 = v18;
  uint64_t v26 = (const char *)objc_msgSend_UTF8String(v20, v21, v22, v23, v24, v25);
  size_t v27 = strlen(v26);
  if (v27 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1C4949B7C();
  }
  uint64_t v28 = (void *)v27;
  if (v27 >= 0x17)
  {
    uint64_t v30 = (v27 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v27 | 7) != 0x17) {
      uint64_t v30 = v27 | 7;
    }
    uint64_t v31 = v30 + 1;
    uint64_t v29 = operator new(v30 + 1);
    __p[1] = v28;
    unint64_t v44 = v31 | 0x8000000000000000;
    __p[0] = v29;
    goto LABEL_8;
  }
  HIBYTE(v44) = v27;
  uint64_t v29 = __p;
  if (v27) {
LABEL_8:
  }
    memmove(v29, v26, (size_t)v28);
  *((unsigned char *)v28 + (void)v29) = 0;
  sub_1C4B17C20((CoreHandwriting::LaTeXSyntaxHelper *)value, (uint64_t *)__p, &v45);
  if ((SHIBYTE(v44) & 0x80000000) == 0)
  {
    if (v47 == 1) {
      goto LABEL_13;
    }
LABEL_24:
    char isTranscriptionValidExpression_transcriptionPath_limitToCurrentLocale = 0;
    goto LABEL_25;
  }
  operator delete(__p[0]);
  if (v47 != 1) {
    goto LABEL_24;
  }
LABEL_13:
  uint64_t v34 = v46;
  if (!v46) {
    goto LABEL_24;
  }
  uint64_t v35 = &v46;
  do
  {
    v36 = v34;
    v37 = v35;
    int v38 = *((_DWORD *)v34 + 8);
    uint64_t v39 = v34 + 1;
    if (v38 >= 2)
    {
      uint64_t v39 = v36;
      uint64_t v35 = (void **)v36;
    }
    uint64_t v34 = (void *)*v39;
  }
  while (v34);
  if (v35 == &v46) {
    goto LABEL_24;
  }
  uint64_t v40 = (int *)(v38 >= 2 ? v36 : v37);
  if (v40[8] > 2) {
    goto LABEL_24;
  }
  char isTranscriptionValidExpression_transcriptionPath_limitToCurrentLocale = objc_msgSend_isTranscriptionValidExpression_transcriptionPath_limitToCurrentLocale_(CHTokenizedMathResult, v32, (uint64_t)v8, (uint64_t)v9, v5, v33);
LABEL_25:
  sub_1C494AC4C((uint64_t)&v45, v46);

  return isTranscriptionValidExpression_transcriptionPath_limitToCurrentLocale;
}

- (void).cxx_destruct
{
  uint64_t value = self->_latexSyntaxHelper.__ptr_.__value_;
  self->_latexSyntaxHelper.__ptr_.__value_ = 0;
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