@interface CSUCaptionPostProcessingHandler
- (CSUCaptionPostProcessingHandler)initWithRuntimeParameters:(id)a3;
- (CSUCaptionRuntimeParameters)runtimeParameters;
- (NSCharacterSet)trimSet;
- (id)_checkForBlockingTokens:(id)a3 blockingTokens:(id)a4;
- (id)_excludeGenderReplacements:(id)a3 genderOption:(int)a4 error:(id *)a5;
- (id)_excludeGenderTriggers:(id)a3 genderOption:(int)a4 error:(id *)a5;
- (id)_replacements:(id)a3 genderOption:(int)a4;
- (id)postProcessCaptions:(id)a3 genderOption:(int)a4 error:(id *)a5;
- (id)postProcessResults:(id)a3 genderOption:(int)a4 error:(id *)a5;
@end

@implementation CSUCaptionPostProcessingHandler

- (CSUCaptionPostProcessingHandler)initWithRuntimeParameters:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSUCaptionPostProcessingHandler;
  v5 = [(CSUCaptionPostProcessingHandler *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_runtimeParameters, v4);
    uint64_t v10 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x263F08708], v7, @" ", v8, v9);
    trimSet = v6->_trimSet;
    v6->_trimSet = (NSCharacterSet *)v10;
  }
  return v6;
}

- (id)postProcessCaptions:(id)a3 genderOption:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v19 = 0;
  uint64_t v8 = objc_msgSend__excludeGenderReplacements_genderOption_error_(self, a2, (uint64_t)a3, *(uint64_t *)&a4, (uint64_t)&v19);
  id v9 = v19;
  if (v9)
  {
    id v11 = v9;
    if (a5)
    {
      id v11 = v9;
      id v12 = 0;
      *a5 = v11;
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v18 = 0;
    objc_super v13 = objc_msgSend__excludeGenderTriggers_genderOption_error_(self, v10, (uint64_t)v8, v6, (uint64_t)&v18);
    id v11 = v18;

    if (v11)
    {
      if (a5)
      {
        id v11 = v11;
        id v12 = 0;
        *a5 = v11;
      }
      else
      {
        id v12 = 0;
      }
      uint64_t v8 = v13;
    }
    else
    {
      v16 = objc_msgSend__replacements_genderOption_(self, v14, (uint64_t)v13, v6, v15);

      id v12 = v16;
      id v11 = 0;
      uint64_t v8 = v12;
    }
  }

  return v12;
}

- (id)_excludeGenderReplacements:(id)a3 genderOption:(int)a4 error:(id *)a5
{
  uint64_t v175 = *MEMORY[0x263EF8340];
  id v147 = a3;
  v154 = self;
  id v11 = objc_msgSend_runtimeParameters(self, v7, v8, v9, v10);
  int v16 = objc_msgSend_genderOption(v11, v12, v13, v14, v15);

  if (a4 != 1 || v16)
  {
    v141 = v147;
    id v140 = v147;
  }
  else
  {
    v151 = objc_msgSend_array(MEMORY[0x263EFF980], v17, v18, v19, v20);
    long long v169 = 0u;
    long long v170 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    obuint64_t j = v147;
    uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v167, (uint64_t)v174, 16);
    if (v22)
    {
      uint64_t v150 = *(void *)v168;
      do
      {
        uint64_t v152 = v22;
        for (uint64_t i = 0; i != v152; ++i)
        {
          if (*(void *)v168 != v150) {
            objc_enumerationMutation(obj);
          }
          v27 = *(void **)(*((void *)&v167 + 1) + 8 * i);
          v28 = objc_msgSend_objectForKeyedSubscript_(v27, v23, (uint64_t)off_2697ED1A0, v24, v25);
          v33 = objc_msgSend_stringWithSpaceAtEnds(v28, v29, v30, v31, v32);

          long long v165 = 0u;
          long long v166 = 0u;
          long long v163 = 0u;
          long long v164 = 0u;
          v38 = objc_msgSend_runtimeParameters(v154, v34, v35, v36, v37);
          v43 = objc_msgSend_excludeGenderReplacements(v38, v39, v40, v41, v42);

          uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v163, (uint64_t)v173, 16);
          if (v49)
          {
            uint64_t v50 = *(void *)v164;
            do
            {
              uint64_t v51 = 0;
              v52 = v33;
              do
              {
                if (*(void *)v164 != v50) {
                  objc_enumerationMutation(v43);
                }
                v53 = *(void **)(*((void *)&v163 + 1) + 8 * v51);
                v54 = objc_msgSend_mutableCopy(v52, v45, v46, v47, v48);
                v59 = objc_msgSend_replacementKey(v53, v55, v56, v57, v58);
                v64 = objc_msgSend_replacementValue(v53, v60, v61, v62, v63);
                uint64_t v69 = objc_msgSend_length(v52, v65, v66, v67, v68);
                objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v54, v70, (uint64_t)v59, (uint64_t)v64, 0, 0, v69);

                v33 = objc_msgSend_copy(v54, v71, v72, v73, v74);
                ++v51;
                v52 = v33;
              }
              while (v49 != v51);
              uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v45, (uint64_t)&v163, (uint64_t)v173, 16);
            }
            while (v49);
          }

          v79 = objc_msgSend_mutableCopy(v27, v75, v76, v77, v78);
          v84 = objc_msgSend_trimSet(v154, v80, v81, v82, v83);
          v88 = objc_msgSend_stringByTrimmingCharactersInSet_(v33, v85, (uint64_t)v84, v86, v87);
          objc_msgSend_setObject_forKeyedSubscript_(v79, v89, (uint64_t)v88, (uint64_t)off_2697ED1A0, v90);

          v95 = objc_msgSend_copy(v79, v91, v92, v93, v94);
          objc_msgSend_addObject_(v151, v96, (uint64_t)v95, v97, v98);
        }
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v167, (uint64_t)v174, 16);
      }
      while (v22);
    }

    long long v161 = 0u;
    long long v162 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    id obja = v151;
    uint64_t v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v99, (uint64_t)&v159, (uint64_t)v172, 16);
    if (v103)
    {
      uint64_t v104 = *(void *)v160;
      v105 = (uint64_t *)&off_2697ED1A0;
      do
      {
        for (uint64_t j = 0; j != v103; ++j)
        {
          if (*(void *)v160 != v104) {
            objc_enumerationMutation(obja);
          }
          v107 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*((void *)&v159 + 1) + 8 * j), v100, *v105, v101, v102);
          v153 = objc_msgSend_stringWithSpaceAtEnds(v107, v108, v109, v110, v111);

          v116 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x263F08708], v112, v113, v114, v115);
          v120 = objc_msgSend_componentsSeparatedByCharactersInSet_(v153, v117, (uint64_t)v116, v118, v119);

          long long v157 = 0u;
          long long v158 = 0u;
          long long v155 = 0u;
          long long v156 = 0u;
          v125 = objc_msgSend_runtimeParameters(v154, v121, v122, v123, v124);
          v130 = objc_msgSend_genderedTokens(v125, v126, v127, v128, v129);

          v131 = v105;
          uint64_t v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(v130, v132, (uint64_t)&v155, (uint64_t)v171, 16);
          if (v136)
          {
            uint64_t v137 = *(void *)v156;
            while (2)
            {
              for (uint64_t k = 0; k != v136; ++k)
              {
                if (*(void *)v156 != v137) {
                  objc_enumerationMutation(v130);
                }
                if (objc_msgSend_indexOfObject_(v120, v133, *(void *)(*((void *)&v155 + 1) + 8 * k), v134, v135) != 0x7FFFFFFFFFFFFFFFLL)
                {

                  v142 = sub_24C69662C();
                  if (os_log_type_enabled(v142, OS_LOG_TYPE_DEBUG)) {
                    sub_24C72A8A0(v142);
                  }

                  if (a5)
                  {
                    objc_msgSend_errorWithCode_message_(CSUError, v143, 2, @"Found gender token, reporting error multiple-gender-words", v144);
                    *a5 = (id)objc_claimAutoreleasedReturnValue();
                  }

                  id v140 = 0;
                  v139 = obja;
                  goto LABEL_39;
                }
              }
              uint64_t v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(v130, v133, (uint64_t)&v155, (uint64_t)v171, 16);
              if (v136) {
                continue;
              }
              break;
            }
          }

          v105 = v131;
        }
        uint64_t v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v100, (uint64_t)&v159, (uint64_t)v172, 16);
      }
      while (v103);
    }

    v139 = obja;
    id v140 = obja;
LABEL_39:

    v141 = v147;
  }

  return v140;
}

- (id)_excludeGenderTriggers:(id)a3 genderOption:(int)a4 error:(id *)a5
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v89 = self;
  uint64_t v13 = objc_msgSend_runtimeParameters(self, v9, v10, v11, v12);
  int v18 = objc_msgSend_genderOption(v13, v14, v15, v16, v17);

  if (a4 == 1 && v18 == 1)
  {
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v19 = v8;
    v88 = v19;
    uint64_t v83 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v101, (uint64_t)v107, 16);
    if (v83)
    {
      id v86 = v8;
      uint64_t v87 = *(void *)v102;
      v85 = a5;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v102 != v87) {
            objc_enumerationMutation(v19);
          }
          uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*((void *)&v101 + 1) + 8 * v24), v21, (uint64_t)off_2697ED1A0, v22, v23, v83);
          uint64_t v84 = v24;
          uint64_t v90 = objc_msgSend_stringWithSpaceAtEnds(v25, v26, v27, v28, v29);

          v34 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x263F08708], v30, v31, v32, v33);
          v38 = objc_msgSend_componentsSeparatedByCharactersInSet_(v90, v35, (uint64_t)v34, v36, v37);

          long long v99 = 0u;
          long long v100 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          v43 = objc_msgSend_runtimeParameters(v89, v39, v40, v41, v42);
          uint64_t v48 = objc_msgSend_excludeGenderTriggers(v43, v44, v45, v46, v47);

          uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v97, (uint64_t)v106, 16);
          if (v54)
          {
            uint64_t v55 = *(void *)v98;
            while (2)
            {
              for (uint64_t i = 0; i != v54; ++i)
              {
                if (*(void *)v98 != v55) {
                  objc_enumerationMutation(v48);
                }
                uint64_t v57 = *(void **)(*((void *)&v97 + 1) + 8 * i);
                uint64_t v58 = objc_msgSend_triggerTokens(v57, v50, v51, v52, v53);
                BOOL v63 = objc_msgSend_count(v58, v59, v60, v61, v62) == 0;

                if (v63)
                {
                  uint64_t v68 = sub_24C69662C();
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
                    sub_24C72A8E4(&buf, v96, v68);
                  }
                }
                else
                {
                  long long v93 = 0u;
                  long long v94 = 0u;
                  long long v91 = 0u;
                  long long v92 = 0u;
                  uint64_t v68 = objc_msgSend_triggerTokens(v57, v64, v65, v66, v67);
                  uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v69, (uint64_t)&v91, (uint64_t)v105, 16);
                  if (!v73)
                  {
LABEL_31:

                    uint64_t v77 = sub_24C69662C();
                    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG)) {
                      sub_24C72A924(v77);
                    }

                    v80 = objc_msgSend_errorWithCode_message_(CSUError, v78, 2, @"Found trigger tokens, reporting error: Found-exclude-gender-trigger", v79);
                    uint64_t v81 = v80;
                    if (v85) {
                      id *v85 = v80;
                    }

                    id v76 = 0;
                    id v8 = v86;
                    goto LABEL_36;
                  }
                  uint64_t v74 = *(void *)v92;
LABEL_16:
                  uint64_t v75 = 0;
                  while (1)
                  {
                    if (*(void *)v92 != v74) {
                      objc_enumerationMutation(v68);
                    }
                    if (objc_msgSend_indexOfObject_(v38, v70, *(void *)(*((void *)&v91 + 1) + 8 * v75), v71, v72) == 0x7FFFFFFFFFFFFFFFLL) {
                      break;
                    }
                    if (v73 == ++v75)
                    {
                      uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v70, (uint64_t)&v91, (uint64_t)v105, 16);
                      if (v73) {
                        goto LABEL_16;
                      }
                      goto LABEL_31;
                    }
                  }
                }
              }
              uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v50, (uint64_t)&v97, (uint64_t)v106, 16);
              if (v54) {
                continue;
              }
              break;
            }
          }

          uint64_t v24 = v84 + 1;
          id v8 = v86;
          id v19 = v88;
        }
        while (v84 + 1 != v83);
        uint64_t v83 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v21, (uint64_t)&v101, (uint64_t)v107, 16);
      }
      while (v83);
    }
  }
  id v76 = v8;
LABEL_36:

  return v76;
}

- (id)_replacements:(id)a3 genderOption:(int)a4
{
  uint64_t v145 = *MEMORY[0x263EF8340];
  id v126 = a3;
  objc_msgSend_array(MEMORY[0x263EFF980], v5, v6, v7, v8);
  id v129 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v134 = objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x263F08968], v9, v10, v11, v12);
  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  obuint64_t j = v126;
  uint64_t v130 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v139, (uint64_t)v144, 16);
  if (v130)
  {
    uint64_t v128 = *(void *)v140;
    uint64_t v17 = a4;
    do
    {
      for (uint64_t i = 0; i != v130; ++i)
      {
        if (*(void *)v140 != v128) {
          objc_enumerationMutation(obj);
        }
        v131 = *(void **)(*((void *)&v139 + 1) + 8 * i);
        int v18 = objc_msgSend_objectForKeyedSubscript_(v131, v14, (uint64_t)off_2697ED1A0, v15, v16);
        uint64_t v23 = objc_msgSend_stringWithSpaceAtEnds(v18, v19, v20, v21, v22);

        long long v137 = 0u;
        long long v138 = 0u;
        long long v135 = 0u;
        long long v136 = 0u;
        uint64_t v28 = objc_msgSend_runtimeParameters(self, v24, v25, v26, v27);
        uint64_t v33 = objc_msgSend_replacements(v28, v29, v30, v31, v32);

        uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v135, (uint64_t)v143, 16);
        if (v39)
        {
          uint64_t v40 = *(void *)v136;
LABEL_8:
          uint64_t v41 = 0;
          while (1)
          {
            if (*(void *)v136 != v40) {
              objc_enumerationMutation(v33);
            }
            uint64_t v42 = *(void **)(*((void *)&v135 + 1) + 8 * v41);
            v43 = objc_msgSend_genderOption(v42, v35, v36, v37, v38);
            BOOL v44 = v43 == 0;

            if (!v44)
            {
              uint64_t v49 = objc_msgSend_genderOption(v42, v45, v46, v47, v48);
              BOOL v54 = objc_msgSend_unsignedIntegerValue(v49, v50, v51, v52, v53) == v17;

              if (!v54) {
                break;
              }
            }
            uint64_t v55 = objc_msgSend_replacementKey(v42, v45, v46, v47, v48);
            BOOL v59 = objc_msgSend_rangeOfString_(v23, v56, (uint64_t)v55, v57, v58) == 0x7FFFFFFFFFFFFFFFLL;

            if (!v59)
            {
              objc_msgSend_objectForKey_(v134, v35, (uint64_t)v42, v37, v38);
              id v64 = (id)objc_claimAutoreleasedReturnValue();
              if (!v64)
              {
                unsigned int v65 = objc_msgSend_length(v23, v60, v61, v62, v63);
                srand(v65);
                int v66 = rand();
                objc_msgSend_replacementProb(v42, v67, v68, v69, v70);
                uint64_t v72 = (void *)MEMORY[0x263EFFA80];
                if (v66 % 100 < (int)(v71 * 100.0)) {
                  uint64_t v72 = (void *)MEMORY[0x263EFFA88];
                }
                id v64 = v72;
                objc_msgSend_setObject_forKey_(v134, v73, (uint64_t)v64, (uint64_t)v42, v74);
              }
              if (objc_msgSend_BOOLValue(v64, v60, v61, v62, v63))
              {
                uint64_t v79 = objc_msgSend_mutableCopy(v23, v75, v76, v77, v78);
                uint64_t v84 = objc_msgSend_replacementKey(v42, v80, v81, v82, v83);
                v89 = objc_msgSend_replacementValue(v42, v85, v86, v87, v88);
                uint64_t v94 = objc_msgSend_length(v23, v90, v91, v92, v93);
                objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v79, v95, (uint64_t)v84, (uint64_t)v89, 0, 0, v94);

                uint64_t v100 = objc_msgSend_copy(v79, v96, v97, v98, v99);
                uint64_t v23 = (void *)v100;
              }
            }
            if (v39 == ++v41)
            {
              uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v35, (uint64_t)&v135, (uint64_t)v143, 16);
              if (v39) {
                goto LABEL_8;
              }
              break;
            }
          }
        }

        v105 = objc_msgSend_mutableCopy(v131, v101, v102, v103, v104);
        uint64_t v110 = objc_msgSend_trimSet(self, v106, v107, v108, v109);
        uint64_t v114 = objc_msgSend_stringByTrimmingCharactersInSet_(v23, v111, (uint64_t)v110, v112, v113);
        objc_msgSend_setObject_forKeyedSubscript_(v105, v115, (uint64_t)v114, (uint64_t)off_2697ED1A0, v116);

        v121 = objc_msgSend_copy(v105, v117, v118, v119, v120);
        objc_msgSend_addObject_(v129, v122, (uint64_t)v121, v123, v124);
      }
      uint64_t v130 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v139, (uint64_t)v144, 16);
    }
    while (v130);
  }

  return v129;
}

- (id)_checkForBlockingTokens:(id)a3 blockingTokens:(id)a4
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v53 = a3;
  id v57 = a4;
  if (objc_msgSend_count(v57, v5, v6, v7, v8))
  {
    BOOL v54 = objc_msgSend_array(MEMORY[0x263EFF980], v9, v10, v11, v12);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    obuint64_t j = v53;
    uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v71, (uint64_t)v79, 16);
    if (v58)
    {
      uint64_t v56 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v58; ++i)
        {
          if (*(void *)v72 != v56) {
            objc_enumerationMutation(obj);
          }
          BOOL v59 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v59, v14, (uint64_t)off_2697ED1A0, v15, v16);
          long long v69 = 0u;
          long long v70 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          id v62 = v57;
          uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v18, (uint64_t)&v67, (uint64_t)v78, 16);
          if (v19)
          {
            uint64_t v20 = *(void *)v68;
            while (2)
            {
              uint64_t v21 = 0;
              uint64_t v61 = v19;
              do
              {
                if (*(void *)v68 != v20) {
                  objc_enumerationMutation(v62);
                }
                uint64_t v22 = *(void *)(*((void *)&v67 + 1) + 8 * v21);
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  uint64_t v23 = (void *)v22;
                }
                else {
                  uint64_t v23 = 0;
                }
                id v24 = v23;
                if (v24)
                {
                  uint64_t v28 = v24;
                  if (objc_msgSend_rangeOfString_(v17, v25, v22, v26, v27) != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    uint64_t v45 = sub_24C69662C();
                    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)uint8_t buf = 138412290;
                      uint64_t v77 = v22;
                      _os_log_debug_impl(&dword_24C664000, v45, OS_LOG_TYPE_DEBUG, "Found %@ in the caption", buf, 0xCu);
                    }
LABEL_42:

                    goto LABEL_43;
                  }
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    uint64_t v29 = (void *)v22;
                  }
                  else {
                    uint64_t v29 = 0;
                  }
                  id v30 = v29;
                  uint64_t v28 = v30;
                  if (v30)
                  {
                    long long v65 = 0u;
                    long long v66 = 0u;
                    long long v63 = 0u;
                    long long v64 = 0u;
                    id v31 = v30;
                    uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v63, (uint64_t)v75, 16);
                    if (v36)
                    {
                      uint64_t v37 = *(void *)v64;
                      while (2)
                      {
                        for (uint64_t j = 0; j != v36; ++j)
                        {
                          if (*(void *)v64 != v37) {
                            objc_enumerationMutation(v31);
                          }
                          uint64_t v39 = *(void *)(*((void *)&v63 + 1) + 8 * j);
                          if (objc_msgSend_rangeOfString_(v17, v33, v39, v34, v35) == 0x7FFFFFFFFFFFFFFFLL)
                          {
                            uint64_t v40 = sub_24C69662C();
                            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                            {
                              *(_DWORD *)uint8_t buf = 138412290;
                              uint64_t v77 = v39;
                              _os_log_debug_impl(&dword_24C664000, v40, OS_LOG_TYPE_DEBUG, "Did not find %@ in the caption", buf, 0xCu);
                            }

                            uint64_t v19 = v61;
                            goto LABEL_34;
                          }
                        }
                        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v33, (uint64_t)&v63, (uint64_t)v75, 16);
                        if (v36) {
                          continue;
                        }
                        break;
                      }
                    }

                    uint64_t v45 = sub_24C69662C();
                    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)uint8_t buf = 138412290;
                      uint64_t v77 = (uint64_t)v31;
                      _os_log_debug_impl(&dword_24C664000, v45, OS_LOG_TYPE_DEBUG, "Found all tokens %@ in the caption", buf, 0xCu);
                    }
                    uint64_t v28 = v31;
                    goto LABEL_42;
                  }
                }
LABEL_34:

                ++v21;
              }
              while (v21 != v19);
              uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v41, (uint64_t)&v67, (uint64_t)v78, 16);
              if (v19) {
                continue;
              }
              break;
            }
          }

          objc_msgSend_addObject_(v54, v42, (uint64_t)v59, v43, v44);
LABEL_43:
        }
        uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v71, (uint64_t)v79, 16);
      }
      while (v58);
    }

    id v51 = (id)objc_msgSend_copy(v54, v47, v48, v49, v50);
  }
  else
  {
    id v51 = v53;
  }

  return v51;
}

- (id)postProcessResults:(id)a3 genderOption:(int)a4 error:(id *)a5
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v69 = a3;
  id v77 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  objc_msgSend_results(v69, v5, v6, v7, v8);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v83, (uint64_t)v90, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v84;
    uint64_t v16 = MEMORY[0x263EFFA80];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v84 != v15) {
          objc_enumerationMutation(obj);
        }
        int v18 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        v88[0] = off_2697ED1A0;
        uint64_t v19 = objc_msgSend_caption(v18, v10, v11, v12, v13, v69);
        v89[0] = v19;
        v88[1] = off_2697ED1A8;
        uint64_t v20 = NSNumber;
        objc_msgSend_score(v18, v21, v22, v23, v24);
        uint64_t v29 = objc_msgSend_numberWithFloat_(v20, v25, v26, v27, v28);
        v88[2] = off_2697ED1B0;
        v89[1] = v29;
        v89[2] = v16;
        id v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v30, (uint64_t)v89, (uint64_t)v88, 3);

        objc_msgSend_addObject_(v77, v32, (uint64_t)v31, v33, v34);
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v83, (uint64_t)v90, 16);
    }
    while (v14);
  }

  id v82 = 0;
  long long v74 = objc_msgSend_postProcessCaptions_genderOption_error_(self, v35, (uint64_t)v77, a4, (uint64_t)&v82);
  id v36 = v82;
  long long v71 = v36;
  if (v36)
  {
    uint64_t v37 = 0;
    if (a5) {
      *a5 = v36;
    }
  }
  else
  {
    uint64_t v38 = objc_opt_new();
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id obja = v74;
    uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v39, (uint64_t)&v78, (uint64_t)v87, 16);
    if (v40)
    {
      uint64_t v41 = *(void *)v79;
      do
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v79 != v41) {
            objc_enumerationMutation(obja);
          }
          uint64_t v43 = *(void **)(*((void *)&v78 + 1) + 8 * j);
          uint64_t v44 = [CSUCaptionResult alloc];
          uint64_t v48 = objc_msgSend_objectForKeyedSubscript_(v43, v45, (uint64_t)off_2697ED1A0, v46, v47);
          uint64_t v52 = objc_msgSend_objectForKeyedSubscript_(v43, v49, (uint64_t)off_2697ED1A8, v50, v51);
          objc_msgSend_floatValue(v52, v53, v54, v55, v56);
          uint64_t v60 = objc_msgSend_initWithCaption_score_(v44, v57, (uint64_t)v48, v58, v59);

          objc_msgSend_addObject_(v38, v61, (uint64_t)v60, v62, v63);
        }
        uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v64, (uint64_t)&v78, (uint64_t)v87, 16);
      }
      while (v40);
    }

    uint64_t v37 = objc_msgSend_createCaptionResultsWithResults_(CSUCaptionResults, v65, (uint64_t)v38, v66, v67);
  }
  return v37;
}

- (NSCharacterSet)trimSet
{
  return (NSCharacterSet *)objc_getProperty(self, a2, 8, 1);
}

- (CSUCaptionRuntimeParameters)runtimeParameters
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_runtimeParameters);
  return (CSUCaptionRuntimeParameters *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_runtimeParameters);
  objc_storeStrong((id *)&self->_trimSet, 0);
}

@end