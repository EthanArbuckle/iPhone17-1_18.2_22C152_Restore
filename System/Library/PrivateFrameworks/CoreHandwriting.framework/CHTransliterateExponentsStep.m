@interface CHTransliterateExponentsStep
- (CHTransliterateExponentsStep)init;
- (id).cxx_construct;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHTransliterateExponentsStep

- (CHTransliterateExponentsStep)init
{
  v6.receiver = self;
  v6.super_class = (Class)CHTransliterateExponentsStep;
  v2 = [(CHTransliterateExponentsStep *)&v6 init];
  v3 = v2;
  if (v2)
  {
    exponentTransliterations = v2->_exponentTransliterations;
    v2->_exponentTransliterations = (NSDictionary *)&unk_1F203CE28;
  }
  return v3;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v111 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  id v114 = v5;
  objc_super v6 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEBUG, "CHTransliterateExponentsStep is running", buf, 2u);
  }

  v113 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9, v10, v11);
  for (unint64_t i = 0; ; ++i)
  {
    v18 = objc_msgSend_result(v114, v12, v13, v14, v15, v16);
    v24 = objc_msgSend_transcriptionPaths(v18, v19, v20, v21, v22, v23);
    BOOL v30 = i < objc_msgSend_count(v24, v25, v26, v27, v28, v29);

    if (!v30) {
      break;
    }
    v36 = objc_msgSend_result(v114, v31, v32, v33, v34, v35);
    v42 = objc_msgSend_transcriptionPaths(v36, v37, v38, v39, v40, v41);
    v47 = objc_msgSend_objectAtIndexedSubscript_(v42, v43, i, v44, v45, v46);

    v53 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v48, v49, v50, v51, v52);
    *(void *)buf = 0;
    v131 = buf;
    uint64_t v132 = 0x6012000000;
    v133 = sub_1C493C4A4;
    v134 = sub_1C493C4E4;
    v135 = &unk_1C4CB5C62;
    memset(v136, 0, sizeof(v136));
    v128[0] = 0;
    v128[1] = v128;
    v128[2] = 0x6012000000;
    v128[3] = sub_1C493C4EC;
    v128[4] = sub_1C493C52C;
    v128[5] = &unk_1C4CB5C62;
    memset(v129, 0, sizeof(v129));
    v126[0] = 0;
    v126[1] = v126;
    v126[2] = 0x6012000000;
    v126[3] = sub_1C493C534;
    v126[4] = sub_1C493C574;
    v126[5] = &unk_1C4CB5C62;
    memset(v127, 0, sizeof(v127));
    v122[0] = 0;
    v122[1] = v122;
    v122[2] = 0x6012000000;
    v122[3] = sub_1C4938234;
    v122[4] = sub_1C4938274;
    v122[5] = &unk_1C4CB5C62;
    long long __p = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    v59 = objc_msgSend_result(v114, v54, v55, v56, v57, v58);
    v65 = objc_msgSend_result(v114, v60, v61, v62, v63, v64);
    uint64_t v71 = objc_msgSend_tokenColumnCount(v65, v66, v67, v68, v69, v70);
    v115[0] = MEMORY[0x1E4F143A8];
    v115[1] = 3221225472;
    v115[2] = sub_1C493C57C;
    v115[3] = &unk_1E64E0DE8;
    v118 = buf;
    v119 = v128;
    v120 = v126;
    v121 = v122;
    id v72 = v53;
    id v116 = v72;
    v117 = self;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v59, v73, (uint64_t)v47, 0, v71, (uint64_t)v115);

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v74 = (id)qword_1EA3C9F98;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v75 = *((void *)v131 + 11);
      *(_DWORD *)v137 = 134217984;
      uint64_t v138 = v75;
      _os_log_impl(&dword_1C492D000, v74, OS_LOG_TYPE_DEBUG, "CHTransliterateExponentsStep warning: %lu open exponents after enumerating all the tokens in the path ", v137, 0xCu);
    }

    while (1)
    {
      v80 = v131;
      uint64_t v81 = *((void *)v131 + 11);
      if (!v81) {
        break;
      }
      v82 = v131 + 80;
      id v83 = objc_retain(*(id *)(*(void *)(*((void *)v131 + 7)
                                          + (((unint64_t)(v81 + *((void *)v131 + 10) - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                              + 8 * ((v81 + *((void *)v131 + 10) - 1) & 0x1FF)));
      unint64_t v84 = *((void *)v80 + 11) + *((void *)v80 + 10) - 1;

      uint64_t v89 = *((void *)v80 + 8);
      uint64_t v90 = ((v89 - *((void *)v80 + 7)) << 6) - 1;
      uint64_t v91 = *((void *)v80 + 11);
      if (v89 == *((void *)v80 + 7)) {
        uint64_t v90 = 0;
      }
      *((void *)v80 + 11) = v91 - 1;
      if ((unint64_t)(v90 - (v91 + *v82) + 1) >= 0x400)
      {
        operator delete(*(void **)(v89 - 8));
        *((void *)v80 + 8) -= 8;
      }
      uint64_t v92 = *((void *)v131 + 11);
      v93 = v72;
      if (v92) {
        v93 = *(void **)(*(void *)(*((void *)v131 + 7)
      }
                                   + (((unint64_t)(v92 + *((void *)v131 + 10) - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                       + 8 * ((v92 + *((void *)v131 + 10) - 1) & 0x1FF));
      objc_msgSend_addObjectsFromArray_(v93, v85, (uint64_t)v83, v86, v87, v88);
    }
    objc_msgSend_addObject_(v113, v76, (uint64_t)v72, v77, v78, v79);

    _Block_object_dispose(v122, 8);
    v94 = (void **)*((void *)&__p + 1);
    v95 = (void **)v124;
    *((void *)&v125 + 1) = 0;
    unint64_t v96 = v124 - *((void *)&__p + 1);
    if ((void)v124 - *((void *)&__p + 1) >= 0x11uLL)
    {
      do
      {
        operator delete(*v94);
        v95 = (void **)v124;
        v94 = (void **)(*((void *)&__p + 1) + 8);
        *((void *)&__p + 1) = v94;
        unint64_t v96 = v124 - (void)v94;
      }
      while ((void)v124 - (void)v94 > 0x10uLL);
    }
    unint64_t v97 = v96 >> 3;
    if (v97 == 1)
    {
      uint64_t v98 = 256;
      goto LABEL_26;
    }
    if (v97 == 2)
    {
      uint64_t v98 = 512;
LABEL_26:
      *(void *)&long long v125 = v98;
    }
    if (v94 != v95)
    {
      do
      {
        v99 = *v94++;
        operator delete(v99);
      }
      while (v94 != v95);
      if ((void)v124 != *((void *)&__p + 1)) {
        *(void *)&long long v124 = v124 + ((*((void *)&__p + 1) - v124 + 7) & 0xFFFFFFFFFFFFFFF8);
      }
    }
    if ((void)__p) {
      operator delete((void *)__p);
    }
    _Block_object_dispose(v126, 8);
    sub_1C494685C((uint64_t)v127);
    _Block_object_dispose(v128, 8);
    sub_1C494685C((uint64_t)v129);
    _Block_object_dispose(buf, 8);
    sub_1C494685C((uint64_t)v136);
  }
  v100 = [CHTokenizedMathResult alloc];
  v105 = objc_msgSend_initWithBestPathTokens_(v100, v101, (uint64_t)v113, v102, v103, v104);
  objc_msgSend_setResult_(v114, v106, (uint64_t)v105, v107, v108, v109);

  return v114;
}

- (void).cxx_destruct
{
  sub_1C4947180((uint64_t)&self->_tokenPropertiesHelper);
  objc_storeStrong((id *)&self->_exponentTransliterations, 0);
}

- (id).cxx_construct
{
  return self;
}

@end