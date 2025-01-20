@interface SFSearchResult(VisualCat)
- (uint64_t)processVisualCATResultSynchronously;
- (void)processVisualCATResultSynchronouslyUsingPatternClass:()VisualCat;
@end

@implementation SFSearchResult(VisualCat)

- (void)processVisualCATResultSynchronouslyUsingPatternClass:()VisualCat
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = [a1 card];
    v5 = [v4 cardSections];
    if ([v5 count])
    {
    }
    else
    {
      v7 = [a1 inlineCard];
      v8 = [v7 cardSections];
      uint64_t v9 = [v8 count];

      if (!v9) {
        return;
      }
    }
    v10 = [a1 card];
    v11 = [v10 cardSections];
    v12 = v11;
    if (!v11)
    {
      v12 = [MEMORY[0x1E4F1C978] array];
    }
    v13 = [a1 inlineCard];
    v14 = [v13 cardSections];
    if (v14)
    {
      v15 = [v12 arrayByAddingObjectsFromArray:v14];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1C978] array];
      v15 = [v12 arrayByAddingObjectsFromArray:v16];
    }
    if (!v11) {

    }
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obj = v15;
    uint64_t v54 = [obj countByEnumeratingWithState:&v62 objects:v72 count:16];
    if (v54)
    {
      uint64_t v53 = *(void *)v63;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v63 != v53) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v62 + 1) + 8 * v17);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v55 = v18;
            ptr = objc_msgSend(v55, "pattern_model");
            uint64_t v19 = objc_msgSend(ptr, "pattern_template_directory");
            if (v19) {
              goto LABEL_31;
            }
            uint64_t v66 = 0;
            v67 = &v66;
            uint64_t v68 = 0x2050000000;
            v20 = (void *)getDEExecutorClass_softClass;
            uint64_t v69 = getDEExecutorClass_softClass;
            if (!getDEExecutorClass_softClass)
            {
              *(void *)&long long buf = MEMORY[0x1E4F143A8];
              *((void *)&buf + 1) = 3221225472;
              v74 = __getDEExecutorClass_block_invoke;
              v75 = &unk_1E5900180;
              v76 = &v66;
              __getDEExecutorClass_block_invoke((uint64_t)&buf);
              v20 = (void *)v67[3];
            }
            id v21 = v20;
            _Block_object_dispose(&v66, 8);
            v22 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/Assistant/FlowDelegatePlugins/InformationFlowPlugin.bundle"];
            if (PARLogHandleForCategory_onceToken_23 != -1) {
              dispatch_once(&PARLogHandleForCategory_onceToken_23, &__block_literal_global_24);
            }
            v23 = PARLogHandleForCategory_logHandles_4_25;
            if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_4_25, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v22;
              _os_log_debug_impl(&dword_19C7E7000, v23, OS_LOG_TYPE_DEBUG, "Falling back to default template path from bundle %@.", (uint8_t *)&buf, 0xCu);
            }
            uint64_t v19 = [v21 bundleTemplateDir:v22];
            if (v19)
            {

LABEL_31:
              v24 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v19 isDirectory:1];
              v25 = v24;
              if (v24)
              {
                id v51 = v24;
                if (PARLogHandleForCategory_onceToken_23 != -1) {
                  dispatch_once(&PARLogHandleForCategory_onceToken_23, &__block_literal_global_24);
                }
                v26 = PARLogHandleForCategory_logHandles_4_25;
                if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_4_25, OS_LOG_TYPE_DEBUG))
                {
                  LODWORD(buf) = 138412290;
                  *(void *)((char *)&buf + 4) = v19;
                  _os_log_debug_impl(&dword_19C7E7000, v26, OS_LOG_TYPE_DEBUG, "Processing response wrapper section with template path %@.", (uint8_t *)&buf, 0xCu);
                }
                v52 = objc_msgSend(ptr, "pattern_parameters");
                if (v52)
                {
                  id v61 = 0;
                  v27 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v52 options:0 error:&v61];
                  v28 = v61;
                  if (!v28 && v27)
                  {
                    v50 = v27;
                    goto LABEL_45;
                  }
                  if (PARLogHandleForCategory_onceToken_23 != -1) {
                    dispatch_once(&PARLogHandleForCategory_onceToken_23, &__block_literal_global_24);
                  }
                  v43 = (void *)PARLogHandleForCategory_logHandles_4_25;
                  if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_4_25, OS_LOG_TYPE_ERROR))
                  {
                    v45 = v43;
                    v46 = [v28 localizedDescription];
                    LODWORD(buf) = 138412290;
                    *(void *)((char *)&buf + 4) = v46;
                    _os_log_error_impl(&dword_19C7E7000, v45, OS_LOG_TYPE_ERROR, "Error decoding JSON params: %@", (uint8_t *)&buf, 0xCu);
                  }
                  v50 = (void *)MEMORY[0x1E4F1CC08];
                }
                else
                {
                  v50 = (void *)MEMORY[0x1E4F1CC08];
LABEL_45:
                  v30 = dispatch_group_create();
                  dispatch_group_enter(v30);
                  if (PARLogHandleForCategory_onceToken_23 != -1) {
                    dispatch_once(&PARLogHandleForCategory_onceToken_23, &__block_literal_global_24);
                  }
                  os_signpost_id_t v31 = os_signpost_id_make_with_pointer((os_log_t)PARLogHandleForCategory_logHandles_4_25, ptr);
                  if (PARLogHandleForCategory_onceToken_23 != -1) {
                    dispatch_once(&PARLogHandleForCategory_onceToken_23, &__block_literal_global_24);
                  }
                  v32 = (id)PARLogHandleForCategory_logHandles_4_25;
                  v33 = v32;
                  if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
                  {
                    LOWORD(buf) = 0;
                    _os_signpost_emit_with_name_impl(&dword_19C7E7000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "execute", "", (uint8_t *)&buf, 2u);
                  }

                  aBlock[0] = MEMORY[0x1E4F143A8];
                  aBlock[1] = 3221225472;
                  aBlock[2] = __82__SFSearchResult_VisualCat__processVisualCATResultSynchronouslyUsingPatternClass___block_invoke;
                  aBlock[3] = &unk_1E5900158;
                  os_signpost_id_t v60 = v31;
                  v28 = v30;
                  v58 = v28;
                  id v59 = v55;
                  v34 = _Block_copy(aBlock);
                  uint64_t v35 = objc_msgSend(ptr, "pattern_id");
                  v36 = (void *)v35;
                  if (v35) {
                    v37 = (__CFString *)v35;
                  }
                  else {
                    v37 = &stru_1EED51C28;
                  }
                  v70 = @"locale";
                  v38 = [MEMORY[0x1E4F1CA20] currentLocale];
                  v39 = [v38 languageCode];
                  v71 = v39;
                  v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
                  [a3 execute:0 templateDir:v51 patternId:v37 parameters:v50 globals:v40 options:0 completion:v34];

                  dispatch_time_t v41 = dispatch_time(0, 1000000000);
                  if (dispatch_group_wait(v28, v41))
                  {
                    if (PARLogHandleForCategory_onceToken_23 != -1) {
                      dispatch_once(&PARLogHandleForCategory_onceToken_23, &__block_literal_global_24);
                    }
                    v42 = PARLogHandleForCategory_logHandles_4_25;
                    if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_4_25, OS_LOG_TYPE_ERROR))
                    {
                      LOWORD(buf) = 0;
                      _os_log_error_impl(&dword_19C7E7000, v42, OS_LOG_TYPE_ERROR, "Timed out waiting for VisualCAT rendering to complete.", (uint8_t *)&buf, 2u);
                    }
                  }

                  v27 = v58;
                }
              }
              else
              {
                if (PARLogHandleForCategory_onceToken_23 != -1) {
                  dispatch_once(&PARLogHandleForCategory_onceToken_23, &__block_literal_global_24);
                }
                v29 = PARLogHandleForCategory_logHandles_4_25;
                if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_4_25, OS_LOG_TYPE_ERROR))
                {
                  LOWORD(buf) = 0;
                  _os_log_error_impl(&dword_19C7E7000, v29, OS_LOG_TYPE_ERROR, "Unable to locate template path.", (uint8_t *)&buf, 2u);
                }
              }

              v22 = (void *)v19;
            }
            else
            {
              if (PARLogHandleForCategory_onceToken_23 != -1) {
                dispatch_once(&PARLogHandleForCategory_onceToken_23, &__block_literal_global_24);
              }
              v44 = PARLogHandleForCategory_logHandles_4_25;
              if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_4_25, OS_LOG_TYPE_ERROR))
              {
                LOWORD(buf) = 0;
                _os_log_error_impl(&dword_19C7E7000, v44, OS_LOG_TYPE_ERROR, "Couldn't find path to fallback template.", (uint8_t *)&buf, 2u);
              }
            }
          }
          ++v17;
        }
        while (v54 != v17);
        uint64_t v47 = [obj countByEnumeratingWithState:&v62 objects:v72 count:16];
        uint64_t v54 = v47;
      }
      while (v47);
    }
  }
  else
  {
    if (PARLogHandleForCategory_onceToken_23 != -1) {
      dispatch_once(&PARLogHandleForCategory_onceToken_23, &__block_literal_global_24);
    }
    v6 = PARLogHandleForCategory_logHandles_4_25;
    if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_4_25, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_19C7E7000, v6, OS_LOG_TYPE_ERROR, "Failed to dynamically load the DialogEngine framework.", (uint8_t *)&buf, 2u);
    }
  }
}

- (uint64_t)processVisualCATResultSynchronously
{
  uint64_t result = _os_feature_enabled_impl();
  if (result)
  {
    uint64_t v6 = 0;
    v7 = &v6;
    uint64_t v8 = 0x2050000000;
    v3 = (void *)getCATPatternClass_softClass;
    uint64_t v9 = getCATPatternClass_softClass;
    if (!getCATPatternClass_softClass)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __getCATPatternClass_block_invoke;
      v5[3] = &unk_1E5900180;
      v5[4] = &v6;
      __getCATPatternClass_block_invoke((uint64_t)v5);
      v3 = (void *)v7[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v6, 8);
    return [a1 processVisualCATResultSynchronouslyUsingPatternClass:v4];
  }
  return result;
}

@end