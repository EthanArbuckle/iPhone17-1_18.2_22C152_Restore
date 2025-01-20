@interface SGWordBoundaryQuickTypeInference
+ (BOOL)_probablePriorPredictionInContext:(id)a3 predictedLabel:(int64_t)a4;
+ (id)quickTypeTriggerForContext:(id)a3 localeIdentifier:(id)a4 modelConfigPath:(id)a5 espressoBinFilePath:(id)a6;
+ (id)quickTypeTriggerForContext:(id)a3 localeIdentifier:(id)a4 modelConfigPath:(id)a5 espressoBinFilePath:(id)a6 useContactNames:(BOOL)a7;
@end

@implementation SGWordBoundaryQuickTypeInference

+ (BOOL)_probablePriorPredictionInContext:(id)a3 predictedLabel:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__1490;
  v12[4] = __Block_byref_object_dispose__1491;
  id v13 = 0;
  id v13 = +[SGDataDetectorMatch detectionsInPlainText:v5 baseDate:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__SGWordBoundaryQuickTypeInference__probablePriorPredictionInContext_predictedLabel___block_invoke;
  v11[3] = &unk_1E65B5678;
  v11[4] = v12;
  uint64_t v6 = MEMORY[0x1CB79B4C0](v11);
  v7 = (void *)v6;
  if ((unint64_t)(a4 - 1) >= 6)
  {
    v9 = sgQuicktypeLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v15 = a4;
      _os_log_fault_impl(&dword_1CA650000, v9, OS_LOG_TYPE_FAULT, "SGWordBoundaryQuickTypeInference - Unexpected label %ld", buf, 0xCu);
    }

    char v8 = 1;
  }
  else
  {
    char v8 = (*(uint64_t (**)(uint64_t, void))(v6 + 16))(v6, dword_1CA8CB588[a4 - 1]);
  }

  _Block_object_dispose(v12, 8);
  return v8;
}

uint64_t __85__SGWordBoundaryQuickTypeInference__probablePriorPredictionInContext_predictedLabel___block_invoke(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "matchType", (void)v10) == a2)
        {
          uint64_t v8 = 1;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 0;
LABEL_11:

  return v8;
}

+ (id)quickTypeTriggerForContext:(id)a3 localeIdentifier:(id)a4 modelConfigPath:(id)a5 espressoBinFilePath:(id)a6 useContactNames:(BOOL)a7
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [MEMORY[0x1E4F5DFA0] languageForLocaleIdentifier:v12];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithContentsOfFile:v13];
  v17 = v16;
  if (v16)
  {
    v18 = [v16 objectForKeyedSubscript:@"PREDICTION_PARAMETERS"];

    if (v18)
    {
      v19 = [v17 objectForKeyedSubscript:@"PREDICTION_PARAMETERS"];
      v20 = [v19 objectForKeyedSubscript:@"TARGET_LANGUAGE"];
      v21 = v20;
      if (v20)
      {
        char v22 = [v20 isEqualToString:v15];

        if (v22)
        {
          v23 = [v17 objectForKeyedSubscript:@"PREDICTION_PARAMETERS"];
          v54 = [v23 objectForKeyedSubscript:@"CONFIDENCE_THRESHOLDS"];

          if (!v54 || [v54 count] != 7)
          {
            v35 = sgQuicktypeLogHandle();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              uint64_t v38 = (uint64_t)v54;
              if (v54) {
                uint64_t v38 = [v54 count];
              }
              *(_DWORD *)v76 = 134218240;
              *(void *)&v76[4] = v38;
              *(_WORD *)&v76[12] = 2048;
              *(void *)&v76[14] = 7;
              _os_log_error_impl(&dword_1CA650000, v35, OS_LOG_TYPE_ERROR, "SGWordBoundaryQuickTypeInference - Unexpected number of confidence thresholds (%ld rather than %ld)", v76, 0x16u);
            }

            v33 = 0;
            goto LABEL_31;
          }
          if (quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames__onceToken != -1) {
            dispatch_once(&quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames__onceToken, &__block_literal_global_1499);
          }
          *(void *)v76 = 0;
          *(void *)&v76[8] = v76;
          *(void *)&v76[16] = 0x3032000000;
          v77 = __Block_byref_object_copy__1490;
          v78 = __Block_byref_object_dispose__1491;
          v79 = &stru_1F24EEF20;
          uint64_t v62 = 0;
          v63 = &v62;
          uint64_t v64 = 0x3032000000;
          v65 = __Block_byref_object_copy__1490;
          v66 = __Block_byref_object_dispose__1491;
          id v67 = 0;
          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __132__SGWordBoundaryQuickTypeInference_quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames___block_invoke_25;
          v56[3] = &unk_1E65B5650;
          v59 = &v62;
          v60 = v76;
          BOOL v61 = a7;
          id v57 = v15;
          id v24 = v55;
          id v58 = v24;
          v50 = (void (**)(void))MEMORY[0x1CB79B4C0](v56);
          v74[0] = @"INPUT_TEXT";
          v74[1] = @"NEGATIVE_SAMPLE_CHOPLESS";
          v75[0] = v24;
          v75[1] = MEMORY[0x1E4F1CC38];
          v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:2];
          v25 = +[SGEspressoModel modelWithConfigPath:v13 binPath:v14];
          v49 = v25;
          if (!v25)
          {
            log = sgQuicktypeLogHandle();
            if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v69 = (uint64_t)v13;
              __int16 v70 = 2112;
              int64_t v71 = (int64_t)v14;
              _os_log_fault_impl(&dword_1CA650000, log, OS_LOG_TYPE_FAULT, "SGWordBoundaryQuickTypeInference - Could not initialize model with config path: %@, bin path: %@", buf, 0x16u);
            }
            v33 = 0;
            goto LABEL_30;
          }
          log = [v25 predictForInput:v53];
          int64_t v51 = +[SGContactSharingModel labelForProbabilities:](SGContactSharingModel, "labelForProbabilities:");
          if (!v51)
          {
            v31 = sgQuicktypeLogHandle();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              v45 = [log objectAtIndexedSubscript:0];
              *(_DWORD *)buf = 138412290;
              uint64_t v69 = (uint64_t)v45;
              _os_log_debug_impl(&dword_1CA650000, v31, OS_LOG_TYPE_DEBUG, "SGWordBoundaryQuickTypeInference - Irrelevant Label predicted with score: %@", buf, 0xCu);
            }
            goto LABEL_28;
          }
          v26 = -[NSObject objectAtIndexedSubscript:](log, "objectAtIndexedSubscript:");
          [v26 doubleValue];
          double v28 = v27;
          v29 = [v54 objectAtIndexedSubscript:v51];
          [v29 doubleValue];
          BOOL v47 = v28 < v30;

          if (v47)
          {
            v31 = sgQuicktypeLogHandle();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              v48 = [log objectAtIndexedSubscript:v51];
              v32 = [v54 objectAtIndexedSubscript:v51];
              *(_DWORD *)buf = 134218498;
              uint64_t v69 = v51;
              __int16 v70 = 2112;
              int64_t v71 = (int64_t)v48;
              __int16 v72 = 2112;
              v73 = v32;
              _os_log_debug_impl(&dword_1CA650000, v31, OS_LOG_TYPE_DEBUG, "SGWordBoundaryQuickTypeInference - Predicted label (%ld) confidence (%@), falls below confidence threshold (%@)!", buf, 0x20u);
            }
          }
          else
          {
            if (![a1 _probablePriorPredictionInContext:v24 predictedLabel:v51])
            {
              v39 = sgQuicktypeLogHandle();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
              {
                v46 = [log objectAtIndexedSubscript:v51];
                *(_DWORD *)buf = 134218498;
                uint64_t v69 = 4;
                __int16 v70 = 2048;
                int64_t v71 = v51;
                __int16 v72 = 2112;
                v73 = v46;
                _os_log_debug_impl(&dword_1CA650000, v39, OS_LOG_TYPE_DEBUG, "SGWordBoundaryQuickTypeInference - objective: %lu, prediction: %ld, score: %@", buf, 0x20u);
              }
              v40 = (void *)quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames__triggerForLabel;
              v41 = [NSNumber numberWithInteger:v51];
              v31 = [v40 objectForKeyedSubscript:v41];

              if ((unint64_t)(v51 - 4) > 2)
              {
                v43 = v31;
                v31 = v43;
              }
              else
              {
                v50[2]();
                v42 = (void *)v63[5];
                if (v42 == *(void **)(*(void *)&v76[8] + 40))
                {
                  v44 = sgQuicktypeLogHandle();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 134217984;
                    uint64_t v69 = v51;
                    _os_log_debug_impl(&dword_1CA650000, v44, OS_LOG_TYPE_DEBUG, "SGWordBoundaryQuickTypeInference - No name found for thirdparty objective: %ld", buf, 0xCu);
                  }

                  goto LABEL_28;
                }
                v43 = __132__SGWordBoundaryQuickTypeInference_quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames___block_invoke_2(v31, v42);
              }
              v33 = v43;
              goto LABEL_29;
            }
            v31 = sgQuicktypeLogHandle();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              v37 = [log objectAtIndexedSubscript:v51];
              *(_DWORD *)buf = 134218242;
              uint64_t v69 = v51;
              __int16 v70 = 2112;
              int64_t v71 = (int64_t)v37;
              _os_log_impl(&dword_1CA650000, v31, OS_LOG_TYPE_DEFAULT, "SGWordBoundaryQuickTypeInference - probable prior prediction of label %ld (score: %@) detected.", buf, 0x16u);
            }
          }
LABEL_28:
          v33 = 0;
LABEL_29:

LABEL_30:
          _Block_object_dispose(&v62, 8);

          _Block_object_dispose(v76, 8);
LABEL_31:
          v34 = v54;
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {
      }
      v34 = sgQuicktypeLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v76 = 138412802;
        *(void *)&v76[4] = v12;
        *(_WORD *)&v76[12] = 2112;
        *(void *)&v76[14] = v15;
        *(_WORD *)&v76[22] = 2112;
        v77 = (uint64_t (*)(uint64_t, uint64_t))v21;
        _os_log_error_impl(&dword_1CA650000, v34, OS_LOG_TYPE_ERROR, "SGWordBoundaryQuickTypeInference - localeIdentifier/language (%@/%@) do not match configured target language (%@)", v76, 0x20u);
      }
      v33 = 0;
      goto LABEL_32;
    }
  }
  v21 = sgQuicktypeLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v76 = 0;
    _os_log_error_impl(&dword_1CA650000, v21, OS_LOG_TYPE_ERROR, "SGWordBoundaryQuickTypeInference - Invalid model config!", v76, 2u);
  }
  v33 = 0;
LABEL_33:

  return v33;
}

void __132__SGWordBoundaryQuickTypeInference_quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames___block_invoke_25(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v2 + 40);
  id v3 = (id *)(v2 + 40);
  if (!v4)
  {
    objc_storeStrong(v3, *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    uint64_t v5 = 2 * (*(unsigned char *)(a1 + 64) == 0);
    uint64_t v6 = [[SGNameDetector alloc] initWithLanguage:*(void *)(a1 + 32)];
    id v14 = [(SGNameDetector *)v6 detectNames:*(void *)(a1 + 40) algorithm:v5];

    if ([v14 count] == 1)
    {
      uint64_t v7 = [v14 firstObject];
      uint64_t v8 = *(void **)(a1 + 40);
      uint64_t v9 = [v7 range];
      uint64_t v11 = objc_msgSend(v8, "substringWithRange:", v9, v10);
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
  }
}

id __132__SGWordBoundaryQuickTypeInference_quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames___block_invoke_2(void *a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)[a1 mutableCopy];
  uint64_t v7 = quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames__givenNameQualifier;
  v8[0] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 setObject:v5 forKey:quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames__qualifiersKey];

  return v4;
}

void __132__SGWordBoundaryQuickTypeInference_quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames___block_invoke()
{
  v42[6] = *MEMORY[0x1E4F143B8];
  v0 = (void *)*MEMORY[0x1E4F721D0];
  v1 = (void *)*MEMORY[0x1E4F722C8];
  uint64_t v2 = (void *)*MEMORY[0x1E4F72200];
  id v3 = (void *)*MEMORY[0x1E4F721B0];
  uint64_t v4 = (void *)*MEMORY[0x1E4F72330];
  uint64_t v5 = (void *)*MEMORY[0x1E4F722C0];
  uint64_t v6 = (void *)*MEMORY[0x1E4F72308];
  uint64_t v7 = (void *)*MEMORY[0x1E4F72228];
  uint64_t v8 = (void *)*MEMORY[0x1E4F72320];
  id v9 = (id)*MEMORY[0x1E4F722D8];
  uint64_t v10 = (void *)quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames__qualifiersKey;
  quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames__qualifiersKey = (uint64_t)v9;
  id v27 = v8;
  id v11 = v7;
  id v12 = v6;
  id v13 = v5;
  id v14 = v4;
  id v15 = v3;
  id v16 = v2;
  id v17 = v1;
  id v18 = v0;

  objc_storeStrong((id *)&quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames__givenNameQualifier, (id)*MEMORY[0x1E4F72248]);
  v40[2] = v11;
  v41[0] = &unk_1F2535610;
  v39[0] = v18;
  v39[1] = v14;
  v40[0] = v17;
  v40[1] = v13;
  v39[2] = v12;
  double v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
  v42[0] = v28;
  v41[1] = &unk_1F2535628;
  v37[0] = v18;
  v37[1] = v14;
  v38[0] = v16;
  v38[1] = v13;
  v37[2] = v12;
  v38[2] = v11;
  v26 = v11;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
  v42[1] = v25;
  v41[2] = &unk_1F2535640;
  v35[0] = v18;
  v35[1] = v14;
  v36[0] = v15;
  v36[1] = v13;
  v35[2] = v12;
  v36[2] = v11;
  id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];
  v42[2] = v24;
  v41[3] = &unk_1F2535658;
  v33[0] = v18;
  v33[1] = v14;
  v34[0] = v17;
  v34[1] = v13;
  v33[2] = v12;
  v34[2] = v27;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
  v42[3] = v19;
  v41[4] = &unk_1F2535670;
  v31[0] = v18;
  v31[1] = v14;
  v32[0] = v16;
  v32[1] = v13;
  v31[2] = v12;
  v32[2] = v27;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
  v42[4] = v20;
  v41[5] = &unk_1F2535688;
  v29[0] = v18;
  v29[1] = v14;
  v30[0] = v15;
  v30[1] = v13;
  v29[2] = v12;
  v30[2] = v27;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
  v42[5] = v21;
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:6];
  v23 = (void *)quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames__triggerForLabel;
  quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames__triggerForLabel = v22;
}

+ (id)quickTypeTriggerForContext:(id)a3 localeIdentifier:(id)a4 modelConfigPath:(id)a5 espressoBinFilePath:(id)a6
{
  return +[SGWordBoundaryQuickTypeInference quickTypeTriggerForContext:a3 localeIdentifier:a4 modelConfigPath:a5 espressoBinFilePath:a6 useContactNames:1];
}

@end