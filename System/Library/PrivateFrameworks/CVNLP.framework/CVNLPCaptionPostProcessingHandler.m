@interface CVNLPCaptionPostProcessingHandler
- (BOOL)_checkAboveThreshold:(id)a3 observationConfidence:(double)a4 difference:(id *)a5;
- (CVNLPCaptionPostProcessingHandler)initWithOptions:(id)a3 runtimeParameters:(id)a4;
- (CVNLPCaptionRuntimeParameters)runtimeParameters;
- (NSCharacterSet)trimSet;
- (id)_checkForBlockingTokens:(id)a3 blockingTokens:(id)a4;
- (id)_checkForBlockingTokens:(id)a3 visionObservations:(id)a4;
- (id)_excludeGenderReplacements:(id)a3 genderOption:(int)a4 error:(id *)a5;
- (id)_excludeGenderTriggers:(id)a3 genderOption:(int)a4 error:(id *)a5;
- (id)_filterVisionObservations:(id)a3;
- (id)_replacements:(id)a3 genderOption:(int)a4;
- (id)postProcessCaptions:(id)a3 genderOption:(int)a4 error:(id *)a5;
- (id)postProcessCaptions:(id)a3 visionObservations:(id)a4;
@end

@implementation CVNLPCaptionPostProcessingHandler

- (CVNLPCaptionPostProcessingHandler)initWithOptions:(id)a3 runtimeParameters:(id)a4
{
  id v5 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CVNLPCaptionPostProcessingHandler;
  v6 = [(CVNLPCaptionPostProcessingHandler *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_runtimeParameters, v5);
    uint64_t v10 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v8, @" ", v9);
    trimSet = v7->_trimSet;
    v7->_trimSet = (NSCharacterSet *)v10;
  }
  return v7;
}

- (id)postProcessCaptions:(id)a3 genderOption:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  *a5 = 0;
  uint64_t v8 = objc_msgSend__excludeGenderReplacements_genderOption_error_(self, a2, (uint64_t)a3, *(uint64_t *)&a4);
  uint64_t v10 = (void *)v8;
  if (*a5)
  {
    id v11 = 0;
    v12 = (void *)v8;
  }
  else
  {
    v12 = objc_msgSend__excludeGenderTriggers_genderOption_error_(self, v9, v8, v6, a5);

    if (*a5)
    {
      id v11 = 0;
    }
    else
    {
      v14 = objc_msgSend__replacements_genderOption_(self, v13, (uint64_t)v12, v6);

      id v11 = v14;
      v12 = v11;
    }
  }

  return v11;
}

- (id)postProcessCaptions:(id)a3 visionObservations:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = objc_msgSend__checkForBlockingTokens_visionObservations_(self, v8, (uint64_t)v6, (uint64_t)v7);
  v12 = objc_msgSend__filterVisionObservations_(self, v10, (uint64_t)v7, v11);
  v16[0] = CVNLPCaptions;
  v16[1] = CVNLPImageClassificationIdentifiers;
  v17[0] = v9;
  v17[1] = v12;
  v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v17, (uint64_t)v16, 2);

  return v14;
}

- (id)_excludeGenderReplacements:(id)a3 genderOption:(int)a4 error:(id *)a5
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  id v120 = a3;
  v127 = self;
  uint64_t v10 = objc_msgSend_runtimeParameters(self, v7, v8, v9);
  int v14 = objc_msgSend_genderOption(v10, v11, v12, v13);

  if (a4 != 1 || v14)
  {
    v116 = v120;
    id v115 = v120;
  }
  else
  {
    v124 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v15, v16, v17);
    long long v142 = 0u;
    long long v143 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    obuint64_t j = v120;
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v140, (uint64_t)v147, 16);
    if (v19)
    {
      uint64_t v123 = *(void *)v141;
      do
      {
        uint64_t v125 = v19;
        for (uint64_t i = 0; i != v125; ++i)
        {
          if (*(void *)v141 != v123) {
            objc_enumerationMutation(obj);
          }
          v23 = *(void **)(*((void *)&v140 + 1) + 8 * i);
          v24 = objc_msgSend_objectForKeyedSubscript_(v23, v20, (uint64_t)CVNLPGeneratedCaption, v21);
          v28 = objc_msgSend_stringWithSpaceAtEnds(v24, v25, v26, v27);

          long long v138 = 0u;
          long long v139 = 0u;
          long long v136 = 0u;
          long long v137 = 0u;
          v32 = objc_msgSend_runtimeParameters(v127, v29, v30, v31);
          v36 = objc_msgSend_excludeGenderReplacements(v32, v33, v34, v35);

          uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v136, (uint64_t)v146, 16);
          if (v41)
          {
            uint64_t v42 = *(void *)v137;
            do
            {
              uint64_t v43 = 0;
              v44 = v28;
              do
              {
                if (*(void *)v137 != v42) {
                  objc_enumerationMutation(v36);
                }
                v45 = *(void **)(*((void *)&v136 + 1) + 8 * v43);
                v46 = objc_msgSend_mutableCopy(v44, v38, v39, v40);
                v50 = objc_msgSend_replacementKey(v45, v47, v48, v49);
                v54 = objc_msgSend_replacementValue(v45, v51, v52, v53);
                uint64_t v58 = objc_msgSend_length(v44, v55, v56, v57);
                objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v46, v59, (uint64_t)v50, (uint64_t)v54, 0, 0, v58);

                v28 = objc_msgSend_copy(v46, v60, v61, v62);
                ++v43;
                v44 = v28;
              }
              while (v41 != v43);
              uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v38, (uint64_t)&v136, (uint64_t)v146, 16);
            }
            while (v41);
          }

          v66 = objc_msgSend_mutableCopy(v23, v63, v64, v65);
          v70 = objc_msgSend_trimSet(v127, v67, v68, v69);
          v73 = objc_msgSend_stringByTrimmingCharactersInSet_(v28, v71, (uint64_t)v70, v72);
          objc_msgSend_setObject_forKeyedSubscript_(v66, v74, (uint64_t)v73, (uint64_t)CVNLPGeneratedCaption);

          v78 = objc_msgSend_copy(v66, v75, v76, v77);
          objc_msgSend_addObject_(v124, v79, (uint64_t)v78, v80);
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v140, (uint64_t)v147, 16);
      }
      while (v19);
    }

    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    id obja = v124;
    uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v81, (uint64_t)&v132, (uint64_t)v145, 16);
    if (v84)
    {
      uint64_t v85 = *(void *)v133;
      v86 = (uint64_t *)&CVNLPGeneratedCaption;
      do
      {
        for (uint64_t j = 0; j != v84; ++j)
        {
          if (*(void *)v133 != v85) {
            objc_enumerationMutation(obja);
          }
          v88 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*((void *)&v132 + 1) + 8 * j), v82, *v86, v83);
          v126 = objc_msgSend_stringWithSpaceAtEnds(v88, v89, v90, v91);

          v95 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v92, v93, v94);
          v98 = objc_msgSend_componentsSeparatedByCharactersInSet_(v126, v96, (uint64_t)v95, v97);

          long long v130 = 0u;
          long long v131 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          v102 = objc_msgSend_runtimeParameters(v127, v99, v100, v101);
          v106 = objc_msgSend_genderedTokens(v102, v103, v104, v105);

          v107 = v86;
          uint64_t v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(v106, v108, (uint64_t)&v128, (uint64_t)v144, 16);
          if (v111)
          {
            uint64_t v112 = *(void *)v129;
            while (2)
            {
              for (uint64_t k = 0; k != v111; ++k)
              {
                if (*(void *)v129 != v112) {
                  objc_enumerationMutation(v106);
                }
                if (objc_msgSend_indexOfObject_(v98, v109, *(void *)(*((void *)&v128 + 1) + 8 * k), v110) != 0x7FFFFFFFFFFFFFFFLL)
                {

                  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v117, (uint64_t)CVNLPCationErrorDomain, 1001, 0);
                  *a5 = (id)objc_claimAutoreleasedReturnValue();

                  id v115 = 0;
                  v114 = obja;
                  goto LABEL_35;
                }
              }
              uint64_t v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(v106, v109, (uint64_t)&v128, (uint64_t)v144, 16);
              if (v111) {
                continue;
              }
              break;
            }
          }

          v86 = v107;
        }
        uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v82, (uint64_t)&v132, (uint64_t)v145, 16);
      }
      while (v84);
    }

    v114 = obja;
    id v115 = obja;
LABEL_35:

    v116 = v120;
  }

  return v115;
}

- (id)_excludeGenderTriggers:(id)a3 genderOption:(int)a4 error:(id *)a5
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v71 = self;
  uint64_t v12 = objc_msgSend_runtimeParameters(self, v9, v10, v11);
  int v16 = objc_msgSend_genderOption(v12, v13, v14, v15);

  if (a4 == 1 && v16 == 1)
  {
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v17 = v8;
    v70 = v17;
    uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v81, (uint64_t)v87, 16);
    if (v67)
    {
      uint64_t v21 = *(void *)v82;
      id v69 = v8;
      uint64_t v65 = *(void *)v82;
      v66 = a5;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v82 != v21) {
            objc_enumerationMutation(v17);
          }
          v23 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*((void *)&v81 + 1) + 8 * v22), v19, (uint64_t)CVNLPGeneratedCaption, v20, v65);
          uint64_t v68 = v22;
          uint64_t v72 = objc_msgSend_stringWithSpaceAtEnds(v23, v24, v25, v26);

          uint64_t v30 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v27, v28, v29);
          v33 = objc_msgSend_componentsSeparatedByCharactersInSet_(v72, v31, (uint64_t)v30, v32);

          long long v79 = 0u;
          long long v80 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          v37 = objc_msgSend_runtimeParameters(v71, v34, v35, v36);
          uint64_t v41 = objc_msgSend_excludeGenderTriggers(v37, v38, v39, v40);

          uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v77, (uint64_t)v86, 16);
          if (v46)
          {
            uint64_t v47 = *(void *)v78;
            while (2)
            {
              for (uint64_t i = 0; i != v46; ++i)
              {
                if (*(void *)v78 != v47) {
                  objc_enumerationMutation(v41);
                }
                uint64_t v49 = *(void **)(*((void *)&v77 + 1) + 8 * i);
                v50 = objc_msgSend_triggerTokens(v49, v43, v44, v45);
                BOOL v54 = objc_msgSend_count(v50, v51, v52, v53) == 0;

                if (!v54)
                {
                  long long v75 = 0u;
                  long long v76 = 0u;
                  long long v73 = 0u;
                  long long v74 = 0u;
                  v55 = objc_msgSend_triggerTokens(v49, v43, v44, v45);
                  uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v73, (uint64_t)v85, 16);
                  if (v59)
                  {
                    uint64_t v60 = *(void *)v74;
                    do
                    {
                      for (uint64_t j = 0; j != v59; ++j)
                      {
                        if (*(void *)v74 != v60) {
                          objc_enumerationMutation(v55);
                        }
                        if (objc_msgSend_indexOfObject_(v33, v57, *(void *)(*((void *)&v73 + 1) + 8 * j), v58) == 0x7FFFFFFFFFFFFFFFLL)
                        {

                          goto LABEL_12;
                        }
                      }
                      uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v57, (uint64_t)&v73, (uint64_t)v85, 16);
                    }
                    while (v59);
                  }

                  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v63, (uint64_t)CVNLPCationErrorDomain, 1002, 0);
                  id *v66 = (id)objc_claimAutoreleasedReturnValue();

                  id v62 = 0;
                  id v8 = v69;
                  goto LABEL_31;
                }
LABEL_12:
                ;
              }
              uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v43, (uint64_t)&v77, (uint64_t)v86, 16);
              if (v46) {
                continue;
              }
              break;
            }
          }

          uint64_t v22 = v68 + 1;
          id v8 = v69;
          id v17 = v70;
          uint64_t v21 = v65;
        }
        while (v68 + 1 != v67);
        uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v19, (uint64_t)&v81, (uint64_t)v87, 16);
      }
      while (v67);
    }
  }
  id v62 = v8;
LABEL_31:

  return v62;
}

- (id)_replacements:(id)a3 genderOption:(int)a4
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v102 = a3;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v5, v6, v7);
  id v105 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v110 = objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v8, v9, v10);
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  obuint64_t j = v102;
  uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v115, (uint64_t)v120, 16);
  if (v106)
  {
    uint64_t v104 = *(void *)v116;
    uint64_t v14 = a4;
    do
    {
      for (uint64_t i = 0; i != v106; ++i)
      {
        if (*(void *)v116 != v104) {
          objc_enumerationMutation(obj);
        }
        v107 = *(void **)(*((void *)&v115 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v107, v12, (uint64_t)CVNLPGeneratedCaption, v13);
        uint64_t v19 = objc_msgSend_stringWithSpaceAtEnds(v15, v16, v17, v18);

        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        v23 = objc_msgSend_runtimeParameters(self, v20, v21, v22);
        uint64_t v27 = objc_msgSend_replacements(v23, v24, v25, v26);

        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v111, (uint64_t)v119, 16);
        if (v32)
        {
          uint64_t v33 = *(void *)v112;
LABEL_8:
          uint64_t v34 = 0;
          while (1)
          {
            if (*(void *)v112 != v33) {
              objc_enumerationMutation(v27);
            }
            uint64_t v35 = *(void **)(*((void *)&v111 + 1) + 8 * v34);
            uint64_t v36 = objc_msgSend_genderOption(v35, v29, v30, v31);
            BOOL v37 = v36 == 0;

            if (!v37)
            {
              uint64_t v41 = objc_msgSend_genderOption(v35, v38, v39, v40);
              BOOL v45 = objc_msgSend_unsignedIntegerValue(v41, v42, v43, v44) == v14;

              if (!v45) {
                break;
              }
            }
            uint64_t v46 = objc_msgSend_replacementKey(v35, v38, v39, v40);
            BOOL v49 = objc_msgSend_rangeOfString_(v19, v47, (uint64_t)v46, v48) == 0x7FFFFFFFFFFFFFFFLL;

            if (!v49)
            {
              objc_msgSend_objectForKey_(v110, v29, (uint64_t)v35, v31);
              id v53 = (id)objc_claimAutoreleasedReturnValue();
              if (!v53)
              {
                unsigned int v54 = objc_msgSend_length(v19, v50, v51, v52);
                srand(v54);
                int v55 = rand();
                objc_msgSend_replacementProb(v35, v56, v57, v58);
                uint64_t v60 = (void *)MEMORY[0x1E4F1CC28];
                if (v55 % 100 < (int)(v59 * 100.0)) {
                  uint64_t v60 = (void *)MEMORY[0x1E4F1CC38];
                }
                id v53 = v60;
                objc_msgSend_setObject_forKey_(v110, v61, (uint64_t)v53, (uint64_t)v35);
              }
              if (objc_msgSend_BOOLValue(v53, v50, v51, v52))
              {
                uint64_t v65 = objc_msgSend_mutableCopy(v19, v62, v63, v64);
                id v69 = objc_msgSend_replacementKey(v35, v66, v67, v68);
                long long v73 = objc_msgSend_replacementValue(v35, v70, v71, v72);
                uint64_t v77 = objc_msgSend_length(v19, v74, v75, v76);
                objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v65, v78, (uint64_t)v69, (uint64_t)v73, 0, 0, v77);

                uint64_t v82 = objc_msgSend_copy(v65, v79, v80, v81);
                uint64_t v19 = (void *)v82;
              }
            }
            if (v32 == ++v34)
            {
              uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v29, (uint64_t)&v111, (uint64_t)v119, 16);
              if (v32) {
                goto LABEL_8;
              }
              break;
            }
          }
        }

        v86 = objc_msgSend_mutableCopy(v107, v83, v84, v85);
        uint64_t v90 = objc_msgSend_trimSet(self, v87, v88, v89);
        uint64_t v93 = objc_msgSend_stringByTrimmingCharactersInSet_(v19, v91, (uint64_t)v90, v92);
        objc_msgSend_setObject_forKeyedSubscript_(v86, v94, (uint64_t)v93, (uint64_t)CVNLPGeneratedCaption);

        v98 = objc_msgSend_copy(v86, v95, v96, v97);
        objc_msgSend_addObject_(v105, v99, (uint64_t)v98, v100);
      }
      uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v115, (uint64_t)v120, 16);
    }
    while (v106);
  }

  return v105;
}

- (BOOL)_checkAboveThreshold:(id)a3 observationConfidence:(double)a4 difference:(id *)a5
{
  id v8 = a3;
  uint64_t v12 = objc_msgSend_runtimeParameters(self, v9, v10, v11);
  int v16 = objc_msgSend_sensitiveImageParameters(v12, v13, v14, v15);
  uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v16, v17, (uint64_t)v8, v18);

  if (v19 && (objc_msgSend_minConfidence(v19, v20, v21, v22), v26 < a4))
  {
    if (a5)
    {
      uint64_t v27 = NSNumber;
      objc_msgSend_minConfidence(v19, v23, v24, v25);
      objc_msgSend_numberWithDouble_(v27, v29, v30, v31, a4 - v28);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v32 = 1;
  }
  else
  {
    BOOL v32 = 0;
  }

  return v32;
}

- (id)_checkForBlockingTokens:(id)a3 blockingTokens:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v43 = a4;
  if (objc_msgSend_count(v43, v5, v6, v7))
  {
    uint64_t v40 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    obuint64_t j = v39;
    uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v56, (uint64_t)v62, 16);
    if (v44)
    {
      uint64_t v42 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v57 != v42) {
            objc_enumerationMutation(obj);
          }
          BOOL v45 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v45, v12, (uint64_t)CVNLPGeneratedCaption, v13);
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v47 = v43;
          uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v15, (uint64_t)&v52, (uint64_t)v61, 16);
          if (v16)
          {
            uint64_t v17 = *(void *)v53;
            while (2)
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v53 != v17) {
                  objc_enumerationMutation(v47);
                }
                id v20 = *(id *)(*((void *)&v52 + 1) + 8 * j);
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  uint64_t v21 = v20;
                }
                else {
                  uint64_t v21 = 0;
                }
                if (v21)
                {
                  if (objc_msgSend_rangeOfString_(v14, v22, (uint64_t)v20, v23) != 0x7FFFFFFFFFFFFFFFLL) {
                    goto LABEL_37;
                  }
LABEL_11:
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    uint64_t v24 = v20;
                  }
                  else {
                    uint64_t v24 = 0;
                  }
                  id v25 = v24;
                  if (v25)
                  {
                    long long v50 = 0u;
                    long long v51 = 0u;
                    long long v48 = 0u;
                    long long v49 = 0u;
                    id v20 = v25;
                    uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v26, (uint64_t)&v48, (uint64_t)v60, 16);
                    if (v29)
                    {
                      uint64_t v30 = *(void *)v49;
                      do
                      {
                        for (uint64_t k = 0; k != v29; ++k)
                        {
                          if (*(void *)v49 != v30) {
                            objc_enumerationMutation(v20);
                          }
                          if (objc_msgSend_rangeOfString_(v14, v27, *(void *)(*((void *)&v48 + 1) + 8 * k), v28) == 0x7FFFFFFFFFFFFFFFLL)
                          {

                            goto LABEL_11;
                          }
                        }
                        uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v27, (uint64_t)&v48, (uint64_t)v60, 16);
                      }
                      while (v29);
                    }

LABEL_37:
                    goto LABEL_38;
                  }
                }
              }
              uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v19, (uint64_t)&v52, (uint64_t)v61, 16);
              if (v16) {
                continue;
              }
              break;
            }
          }

          objc_msgSend_addObject_(v40, v32, (uint64_t)v45, v33);
LABEL_38:
        }
        uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v56, (uint64_t)v62, 16);
      }
      while (v44);
    }

    id v37 = (id)objc_msgSend_copy(v40, v34, v35, v36);
  }
  else
  {
    id v37 = v39;
  }

  return v37;
}

- (id)_checkForBlockingTokens:(id)a3 visionObservations:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v7 = a4;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v42, (uint64_t)v46, 16);
  if (v12)
  {
    uint64_t v13 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend_identifier(v15, v9, v10, v11, (void)v42);
        objc_msgSend_confidence(v15, v17, v18, v19);
        int v22 = objc_msgSend__checkAboveThreshold_observationConfidence_difference_(self, v21, (uint64_t)v16, 0, v20);

        if (v22)
        {
          uint64_t v23 = objc_msgSend_runtimeParameters(self, v9, v10, v11);
          uint64_t v27 = objc_msgSend_sensitiveImageParameters(v23, v24, v25, v26);
          uint64_t v31 = objc_msgSend_identifier(v15, v28, v29, v30);
          uint64_t v34 = objc_msgSend_objectForKeyedSubscript_(v27, v32, (uint64_t)v31, v33);

          v38 = objc_msgSend_blockingTokens(v34, v35, v36, v37);
          uint64_t v40 = objc_msgSend__checkForBlockingTokens_blockingTokens_(self, v39, (uint64_t)v6, (uint64_t)v38);

          id v6 = (id)v40;
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v42, (uint64_t)v46, 16);
    }
    while (v12);
  }

  return v6;
}

- (id)_filterVisionObservations:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  uint64_t v81 = 0;
  uint64_t v82 = 0;
  long long v83 = 0;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v4 = a3;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v77, (uint64_t)v84, 16);
  id v75 = v4;
  uint64_t v10 = 0;
  if (v9)
  {
    uint64_t v11 = *(void *)v78;
    while (1)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v78 != v11) {
          objc_enumerationMutation(v4);
        }
        uint64_t v13 = *(void **)(*((void *)&v77 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend_identifier(v13, v6, v7, v8, v75);
        objc_msgSend_confidence(v13, v15, v16, v17);
        id v76 = 0;
        int v20 = objc_msgSend__checkAboveThreshold_observationConfidence_difference_(self, v19, (uint64_t)v14, (uint64_t)&v76, v18);
        id v21 = v76;

        if (v20)
        {
          objc_msgSend_floatValue(v21, v22, v23, v24);
          int v26 = v25;
          uint64_t v30 = objc_msgSend_identifier(v13, v27, v28, v29);
          uint64_t v31 = v30;
          if (v10 >= v83)
          {
            uint64_t v33 = v81;
            uint64_t v34 = (v10 - v81) >> 4;
            unint64_t v35 = v34 + 1;
            if ((unint64_t)(v34 + 1) >> 60) {
              sub_1B4BB3244();
            }
            uint64_t v36 = v83 - v81;
            if ((v83 - v81) >> 3 > v35) {
              unint64_t v35 = v36 >> 3;
            }
            if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v37 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v37 = v35;
            }
            if (v37 >> 60) {
              sub_1B4BB2D38();
            }
            v38 = (char *)operator new(16 * v37);
            id v39 = &v38[16 * v34];
            uint64_t v40 = &v38[16 * v37];
            *(_DWORD *)id v39 = v26;
            *((void *)v39 + 1) = v31;
            BOOL v32 = (id *)(v39 + 16);
            if (v10 == v33)
            {
              uint64_t v81 = &v38[16 * v34];
              uint64_t v82 = (id *)(v39 + 16);
              long long v83 = &v38[16 * v37];
              id v4 = v75;
              if (!v10) {
                goto LABEL_23;
              }
            }
            else
            {
              uint64_t v41 = v10;
              id v4 = v75;
              do
              {
                int v42 = *((_DWORD *)v41 - 4);
                v41 -= 16;
                *((_DWORD *)v39 - 4) = v42;
                v39 -= 16;
                uint64_t v43 = *((void *)v41 + 1);
                *((void *)v41 + 1) = 0;
                *((void *)v39 + 1) = v43;
              }
              while (v41 != v33);
              uint64_t v81 = v39;
              uint64_t v82 = v32;
              long long v83 = v40;
              do
              {

                v10 -= 16;
              }
              while (v10 != v33);
              uint64_t v10 = v33;
              if (!v33) {
                goto LABEL_23;
              }
            }
            operator delete(v10);
          }
          else
          {
            *(_DWORD *)uint64_t v10 = v26;
            *((void *)v10 + 1) = v30;
            BOOL v32 = (id *)(v10 + 16);
          }
LABEL_23:
          uint64_t v82 = v32;
          uint64_t v10 = (char *)v32;
        }

        ++v12;
      }
      while (v12 != v9);
      uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v77, (uint64_t)v84, 16);
      uint64_t v9 = v44;
      if (!v44)
      {
        long long v45 = (id *)v81;
        goto LABEL_31;
      }
    }
  }
  long long v45 = 0;
LABEL_31:

  uint64_t v49 = v10 - (char *)v45;
  if (v10 - (char *)v45 >= 17)
  {
    uint64_t v50 = v49 >> 4;
    int64_t v51 = (unint64_t)((v49 >> 4) - 2) >> 1;
    int64_t v52 = v51;
    do
    {
      if (v51 >= v52)
      {
        uint64_t v55 = (2 * v52) | 1;
        long long v56 = (float *)&v45[2 * v55];
        if (2 * v52 + 2 < v50 && *v56 < v56[4])
        {
          v56 += 4;
          uint64_t v55 = 2 * v52 + 2;
        }
        long long v57 = (float *)&v45[2 * v52];
        float v58 = *v56;
        float v59 = *v57;
        if (*v56 >= *v57)
        {
          uint64_t v60 = &v45[2 * v52];
          id v61 = v60[1];
          v60[1] = 0;
          do
          {
            id v62 = v57;
            long long v57 = v56;
            *id v62 = v58;
            uint64_t v63 = *((void *)v56 + 1);
            *((void *)v57 + 1) = 0;
            uint64_t v64 = (void *)*((void *)v62 + 1);
            *((void *)v62 + 1) = v63;

            if (v51 < v55) {
              break;
            }
            uint64_t v65 = 2 * v55;
            uint64_t v55 = (2 * v55) | 1;
            long long v56 = (float *)&v45[2 * v55];
            uint64_t v66 = v65 + 2;
            if (v66 < v50 && *v56 < v56[4])
            {
              v56 += 4;
              uint64_t v55 = v66;
            }
            float v58 = *v56;
          }
          while (*v56 >= v59);
          *long long v57 = v59;
          long long v53 = (void *)*((void *)v57 + 1);
          *((void *)v57 + 1) = v61;
        }
      }
    }
    while (v52-- > 0);
  }
  v70 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v46, v47, v48, v75);
  uint64_t v71 = v82;
  if (v45 != v82)
  {
    uint64_t v72 = v45;
    do
    {
      objc_msgSend_addObject_(v70, v67, (uint64_t)v72[1], v69);
      v72 += 2;
    }
    while (v72 != v71);
  }
  long long v73 = objc_msgSend_copy(v70, v67, v68, v69);

  if (v45)
  {
    for (; v71 != v45; v71 -= 2)

    operator delete(v45);
  }

  return v73;
}

- (NSCharacterSet)trimSet
{
  return (NSCharacterSet *)objc_getProperty(self, a2, 8, 1);
}

- (CVNLPCaptionRuntimeParameters)runtimeParameters
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_runtimeParameters);
  return (CVNLPCaptionRuntimeParameters *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_runtimeParameters);
  objc_storeStrong((id *)&self->_trimSet, 0);
}

@end