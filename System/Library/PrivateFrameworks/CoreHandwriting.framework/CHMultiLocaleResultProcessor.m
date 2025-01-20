@interface CHMultiLocaleResultProcessor
+ (id)combineMultiLocaleResults:(id)a3 locales:(id)a4 topLocaleIndex:(int64_t)a5 mergedResultPostprocessingBlock:(id)a6 changeableColumnCountBlock:(id)a7;
+ (void)updateMultiLocaleResultDictionary:(id)a3 locales:(id)a4;
@end

@implementation CHMultiLocaleResultProcessor

+ (void)updateMultiLocaleResultDictionary:(id)a3 locales:(id)a4
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v81 = a4;
  v6 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v12 = objc_msgSend_count(v5, v7, v8, v9, v10, v11);
  v82 = objc_msgSend_arrayWithCapacity_(v6, v13, v12, v14, v15, v16);
  v17 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v23 = objc_msgSend_count(v5, v18, v19, v20, v21, v22);
  v28 = objc_msgSend_arrayWithCapacity_(v17, v24, v23, v25, v26, v27);
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v29 = v81;
  uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v83, (uint64_t)v89, 16, v31);
  if (v36)
  {
    uint64_t v37 = *(void *)v84;
    do
    {
      uint64_t v38 = 0;
      do
      {
        if (*(void *)v84 != v37) {
          objc_enumerationMutation(v29);
        }
        uint64_t v39 = *(void *)(*((void *)&v83 + 1) + 8 * v38);
        v44 = objc_msgSend_objectForKey_(v5, v32, v39, v33, v34, v35);
        if (v44)
        {
          v45 = objc_msgSend_objectForKeyedSubscript_(v5, v40, v39, v41, v42, v43);
          v51 = objc_msgSend_copy(v45, v46, v47, v48, v49, v50);
          objc_msgSend_addObject_(v82, v52, (uint64_t)v51, v53, v54, v55);

          objc_msgSend_addObject_(v28, v56, v39, v57, v58, v59);
        }
        else
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          v60 = (id)qword_1EA3C9F90[0];
          if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v88 = v39;
            _os_log_impl(&dword_1C492D000, v60, OS_LOG_TYPE_FAULT, "results does not contain result for locale %@", buf, 0xCu);
          }
        }
        ++v38;
      }
      while (v36 != v38);
      uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v83, (uint64_t)v89, 16, v35);
    }
    while (v36);
  }

  for (unint64_t i = 0; i < objc_msgSend_count(v28, v61, v62, v63, v64, v65); ++i)
  {
    v67 = sub_1C4B023C8((uint64_t)CHMultiLocaleResultProcessor, v82, v28, i, 0, 0);
    v72 = objc_msgSend_objectAtIndexedSubscript_(v67, v68, i, v69, v70, v71);
    v77 = objc_msgSend_objectAtIndexedSubscript_(v28, v73, i, v74, v75, v76);
    objc_msgSend_setObject_forKeyedSubscript_(v5, v78, (uint64_t)v72, (uint64_t)v77, v79, v80);
  }
}

+ (id)combineMultiLocaleResults:(id)a3 locales:(id)a4 topLocaleIndex:(int64_t)a5 mergedResultPostprocessingBlock:(id)a6 changeableColumnCountBlock:(id)a7
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  v13 = (void (**)(id, uint64_t, void, void *))a6;
  uint64_t v63 = (void (**)(id, int64_t, id, void *))a7;
  BOOL v69 = 0;
  id v68 = 0;
  v61 = v12;
  uint64_t v62 = sub_1C4B023C8((uint64_t)CHMultiLocaleResultProcessor, v11, v12, a5, &v69, &v68);
  id v60 = v68;
  uint64_t shouldPerformStrictCandidateFiltering = objc_msgSend_shouldPerformStrictCandidateFiltering_(CHRecognizerConfiguration, v14, (uint64_t)v60, v15, v16, v17);
  int64_t v59 = a5;
  uint64_t v23 = objc_msgSend_objectAtIndexedSubscript_(v12, v19, a5, v20, v21, v22);
  uint64_t isSupportedCyrillicScriptLocale_withMode = objc_msgSend_isSupportedCyrillicScriptLocale_withMode_(CHRecognizerConfiguration, v24, (uint64_t)v23, 4, v25, v26);

  uint64_t v34 = objc_msgSend_tokenizedTextResultFromResults_shouldPerformStrictFiltering_doesTopLocaleRequireSpecialHandling_hasSwap_(CHTokenizedTextResult, v28, (uint64_t)v62, shouldPerformStrictCandidateFiltering, isSupportedCyrillicScriptLocale_withMode, v69);
  if (v13)
  {
    int v35 = (unint64_t)objc_msgSend_count(v11, v29, v30, v31, v32, v33) > 1
        ? 1
        : isSupportedCyrillicScriptLocale_withMode;
    if (v35 == 1)
    {
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v36 = v12;
      uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v64, (uint64_t)v70, 16, v38);
      if (v41)
      {
        uint64_t v42 = *(void *)v65;
        if (shouldPerformStrictCandidateFiltering)
        {
          uint64_t v43 = -1;
          do
          {
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v65 != v42) {
                objc_enumerationMutation(v36);
              }
              if (1 - v59 + v43 + i || v69)
              {
                uint64_t v45 = v13[2](v13, v43 + i + 1, *(void *)(*((void *)&v64 + 1) + 8 * i), v34);

                uint64_t v34 = (void *)v45;
              }
            }
            uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v64, (uint64_t)v70, 16, v40);
            v43 += i;
          }
          while (v41);
        }
        else
        {
          uint64_t v46 = -1;
          do
          {
            uint64_t v47 = 0;
            uint64_t v48 = v34;
            do
            {
              if (*(void *)v65 != v42) {
                objc_enumerationMutation(v36);
              }
              uint64_t v34 = v13[2](v13, v46 + v47 + 1, *(void *)(*((void *)&v64 + 1) + 8 * v47), v48);

              ++v47;
              uint64_t v48 = v34;
            }
            while (v41 != v47);
            uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v49, (uint64_t)&v64, (uint64_t)v70, 16, v50);
            v46 += v47;
          }
          while (v41);
        }
      }
    }
  }
  if (v63)
  {
    uint64_t v51 = objc_msgSend_changeableTokenColumnCount(v34, v29, v30, v31, v32, v33);
    if (v51 < objc_msgSend_tokenColumnCount(v34, v52, v53, v54, v55, v56))
    {
      uint64_t v57 = v63[2](v63, v59, v60, v34);

      uint64_t v34 = (void *)v57;
    }
  }

  return v34;
}

@end