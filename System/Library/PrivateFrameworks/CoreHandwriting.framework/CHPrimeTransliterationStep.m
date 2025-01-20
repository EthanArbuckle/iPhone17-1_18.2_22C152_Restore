@interface CHPrimeTransliterationStep
- (id)process:(id)a3 options:(id)a4;
- (void)transliteratePrimeExponent:(id)a3 startIndex:(int64_t)a4 endIndex:(int64_t)a5;
@end

@implementation CHPrimeTransliterationStep

- (void)transliteratePrimeExponent:(id)a3 startIndex:(int64_t)a4 endIndex:(int64_t)a5
{
  id v85 = a3;
  if (a4 <= a5)
  {
    v11 = 0;
    v22 = 0;
    v12 = 0;
    char v84 = 0;
    while (1)
    {
      while (1)
      {
        v25 = objc_msgSend_objectAtIndexedSubscript_(v85, v7, a4, v8, v9, v10);
        v31 = objc_msgSend_string(v25, v26, v27, v28, v29, v30);
        int isEqualToString = objc_msgSend_isEqualToString_(v31, v32, @"\\prime", v33, v34, v35);

        if (isEqualToString) {
          break;
        }
        v48 = objc_msgSend_string(v25, v37, v38, v39, v40, v41);
        if (objc_msgSend_isEqualToString_(v48, v49, @"^", v50, v51, v52))
        {
          LOBYTE(v58) = 0;
        }
        else
        {
          v59 = objc_msgSend_string(v25, v53, v54, v55, v56, v57);
          if (objc_msgSend_isEqualToString_(v59, v60, @"{", v61, v62, v63))
          {
            LOBYTE(v58) = 0;
          }
          else
          {
            v69 = objc_msgSend_string(v25, v64, v65, v66, v67, v68);
            int v58 = objc_msgSend_isEqualToString_(v69, v70, @"}", v71, v72, v73) ^ 1;
          }
        }

        v84 |= v58;
        BOOL v24 = a4++ == a5;
        if (v24) {
          goto LABEL_3;
        }
      }
      if (v12 >= v22) {
        break;
      }
      *(void *)v12 = a4;
      uint64_t v23 = (uint64_t)(v12 + 8);
LABEL_14:
      v12 = (char *)v23;

      BOOL v24 = a4++ == a5;
      if (v24) {
        goto LABEL_3;
      }
    }
    uint64_t v42 = (v12 - v11) >> 3;
    unint64_t v43 = v42 + 1;
    if ((unint64_t)(v42 + 1) >> 61) {
      sub_1C494A220();
    }
    if ((v22 - v11) >> 2 > v43) {
      unint64_t v43 = (v22 - v11) >> 2;
    }
    if ((unint64_t)(v22 - v11) >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v44 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v44 = v43;
    }
    if (v44)
    {
      if (v44 >> 61) {
        sub_1C4949AA8();
      }
      v45 = operator new(8 * v44);
      v46 = (int64_t *)&v45[8 * v42];
      int64_t *v46 = a4;
      uint64_t v23 = (uint64_t)(v46 + 1);
      int64_t v47 = v12 - v11;
      if (v12 == v11) {
        goto LABEL_40;
      }
    }
    else
    {
      v45 = 0;
      v46 = (int64_t *)(8 * v42);
      *(void *)(8 * v42) = a4;
      uint64_t v23 = 8 * v42 + 8;
      int64_t v47 = v12 - v11;
      if (v12 == v11) {
        goto LABEL_40;
      }
    }
    unint64_t v74 = v47 - 8;
    if (v74 >= 0x168)
    {
      unint64_t v77 = (v12 - 8 - v11) & 0xFFFFFFFFFFFFFFF8;
      if (&v45[v12 - v11 - 8 - v77] > &v45[v12 - v11 - 8])
      {
        v75 = v12;
      }
      else if (&v12[-v77 - 8] > v12 - 8)
      {
        v75 = v12;
      }
      else if ((unint64_t)(v11 - v45) >= 0x20)
      {
        uint64_t v78 = (v74 >> 3) + 1;
        uint64_t v79 = 8 * (v78 & 0x3FFFFFFFFFFFFFFCLL);
        v75 = &v12[-v79];
        v46 = (int64_t *)((char *)v46 - v79);
        v80 = &v45[8 * v42 - 16];
        v81 = v12 - 16;
        uint64_t v82 = v78 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v83 = *(_OWORD *)v81;
          *(v80 - 1) = *((_OWORD *)v81 - 1);
          _OWORD *v80 = v83;
          v80 -= 2;
          v81 -= 32;
          v82 -= 4;
        }
        while (v82);
        if (v78 == (v78 & 0x3FFFFFFFFFFFFFFCLL)) {
          goto LABEL_40;
        }
      }
      else
      {
        v75 = v12;
      }
    }
    else
    {
      v75 = v12;
    }
    do
    {
      int64_t v76 = *((void *)v75 - 1);
      v75 -= 8;
      *--v46 = v76;
    }
    while (v75 != v11);
LABEL_40:
    v22 = &v45[8 * v44];
    if (v11) {
      operator delete(v11);
    }
    v11 = (char *)v46;
    goto LABEL_14;
  }
  v11 = 0;
  v12 = 0;
  char v84 = 0;
LABEL_3:
  if (v12 != v11 && (v12 == v11) | v84 & 1 | ((unint64_t)(((v12 - v11) >> 3) - 3) < 0xFFFFFFFFFFFFFFFELL))
  {
    v13 = (uint64_t *)v11;
    do
    {
      uint64_t v14 = *v13;
      v15 = objc_msgSend_objectAtIndexedSubscript_(v85, v7, *v13, v8, v9, v10);
      v18 = objc_msgSend_updatedToken_withString_withTokenProperty_(CHTokenizedMathResultToken, v16, (uint64_t)v15, @"1", 2, v17);
      objc_msgSend_setObject_atIndexedSubscript_(v85, v19, (uint64_t)v18, v14, v20, v21);

      ++v13;
    }
    while (v13 != (uint64_t *)v12);
  }
  if (v11) {
    operator delete(v11);
  }
}

- (id)process:(id)a3 options:(id)a4
{
  id v143 = a3;
  id v137 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v5 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v5, OS_LOG_TYPE_DEBUG, "CHPrimeTransliterationStep is running", buf, 2u);
  }

  v139 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v6, v7, v8, v9, v10);
  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v17 = objc_msgSend_result(v143, v11, v12, v13, v14, v15);
    uint64_t v23 = objc_msgSend_transcriptionPaths(v17, v18, v19, v20, v21, v22);
    unint64_t v29 = objc_msgSend_count(v23, v24, v25, v26, v27, v28);

    if (i >= v29) {
      break;
    }
    uint64_t v35 = objc_msgSend_result(v143, v30, v31, v32, v33, v34);
    uint64_t v41 = objc_msgSend_transcriptionPaths(v35, v36, v37, v38, v39, v40);
    v142 = objc_msgSend_objectAtIndexedSubscript_(v41, v42, i, v43, v44, v45);

    v141 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v46, v47, v48, v49, v50);
    uint64_t v151 = 0;
    v152 = &v151;
    uint64_t v153 = 0x2020000000;
    char v154 = 0;
    uint64_t v56 = objc_msgSend_result(v143, v51, v52, v53, v54, v55);
    uint64_t v62 = objc_msgSend_result(v143, v57, v58, v59, v60, v61);
    uint64_t v68 = objc_msgSend_tokenColumnCount(v62, v63, v64, v65, v66, v67);
    v148[0] = MEMORY[0x1E4F143A8];
    v148[1] = 3221225472;
    v148[2] = sub_1C49466C4;
    v148[3] = &unk_1E64E0EB0;
    id v69 = v141;
    id v149 = v69;
    v150 = &v151;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v56, v70, (uint64_t)v142, 0, v68, (uint64_t)v148);

    if (!*((unsigned char *)v152 + 24)) {
      goto LABEL_38;
    }
    unint64_t v140 = i;
    uint64_t v76 = 0;
    uint64_t v77 = 0;
    uint64_t v78 = 0;
    uint64_t v79 = 0;
    uint64_t v144 = 0;
    unint64_t v80 = 0;
    uint64_t v81 = 0;
    long long v146 = 0u;
    long long v147 = 0u;
    *(_OWORD *)buf = 0u;
    while (v80 < objc_msgSend_count(v69, v71, v72, v73, v74, v75))
    {
      uint64_t v82 = objc_msgSend_objectAtIndexedSubscript_(v69, v71, v80, v73, v74, v75);
      v88 = objc_msgSend_string(v82, v83, v84, v85, v86, v87);
      int isEqualToString = objc_msgSend_isEqualToString_(v88, v89, @"^", v90, v91, v92);

      if (isEqualToString)
      {
        if (v79 == v78) {
          uint64_t v99 = 0;
        }
        else {
          uint64_t v99 = (((char *)v79 - (char *)v78) << 6) - 1;
        }
        unint64_t v100 = v76 + v77;
        if (v99 == v76 + v77)
        {
          sub_1C494A570(buf);
          uint64_t v78 = *(void ***)&buf[8];
          uint64_t v79 = (void **)v146;
          uint64_t v76 = *((void *)&v147 + 1);
          uint64_t v77 = v147;
          unint64_t v100 = *((void *)&v147 + 1) + v147;
        }
        (*(void **)((char *)v78 + ((v100 >> 6) & 0x3FFFFFFFFFFFFF8)))[v100 & 0x1FF] = v80;
        *((void *)&v147 + 1) = ++v76;
LABEL_19:
        uint64_t v144 = v76;
        goto LABEL_10;
      }
      v101 = objc_msgSend_string(v82, v94, v95, v96, v97, v98);
      int v106 = objc_msgSend_isEqualToString_(v101, v102, @"{", v103, v104, v105);

      if (v106)
      {
        ++v81;
        goto LABEL_10;
      }
      v112 = objc_msgSend_string(v82, v107, v108, v109, v110, v111);
      int v117 = objc_msgSend_isEqualToString_(v112, v113, @"}", v114, v115, v116);

      if (v117)
      {
        if (!--v81)
        {
          if (v144)
          {
            uint64_t v120 = (((char *)v79 - (char *)v78) << 6) - 1;
            uint64_t v76 = v144 - 1;
            uint64_t v121 = (*(void **)((char *)v78 + (((unint64_t)(v77 + v144 - 1) >> 6) & 0x3FFFFFFFFFFFFF8)))[(v77 + v144 - 1) & 0x1FF];
            if (v79 == v78) {
              uint64_t v120 = 0;
            }
            *((void *)&v147 + 1) = v144 - 1;
            if ((unint64_t)(v120 - (v144 + v77) + 1) >= 0x400)
            {
              v122 = *--v79;
              operator delete(v122);
              *(void *)&long long v146 = v79;
            }
            objc_msgSend_transliteratePrimeExponent_startIndex_endIndex_(self, v118, (uint64_t)v69, v121, v80, v119);
            uint64_t v81 = 0;
            goto LABEL_19;
          }
          uint64_t v144 = 0;
          uint64_t v81 = 0;
        }
      }
LABEL_10:

      ++v80;
    }
    unint64_t v123 = (char *)v79 - (char *)v78;
    if ((unint64_t)((char *)v79 - (char *)v78) >= 0x11)
    {
      do
      {
        v124 = *v78++;
        operator delete(v124);
        *(void *)&buf[8] = v78;
        v123 -= 8;
      }
      while (v123 > 0x10);
    }
    while (v78 != v79)
    {
      v125 = *v78++;
      operator delete(v125);
    }
    if (*(void *)buf) {
      operator delete(*(void **)buf);
    }
    unint64_t i = v140;
LABEL_38:
    objc_msgSend_addObject_(v139, v71, (uint64_t)v69, v73, v74, v75);

    _Block_object_dispose(&v151, 8);
  }
  v126 = [CHTokenizedMathResult alloc];
  v131 = objc_msgSend_initWithBestPathTokens_(v126, v127, (uint64_t)v139, v128, v129, v130);
  objc_msgSend_setResult_(v143, v132, (uint64_t)v131, v133, v134, v135);

  return v143;
}

@end