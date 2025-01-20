@interface ATXModeSetupPredictionMetricsLogger
- (ATXModeSetupPredictionMetricsLogger)init;
- (id)appSessionInterruptionsCalculatorSinceDate:(id)a3 andForModeSemanticTypes:(id)a4;
- (id)fetchAllRelevantModeSemanticTypesInLastSevenDays:(id)a3;
- (id)getRecommendedAndCandidateAppsInAllowListForSemanticTypes:(id)a3;
- (id)getRecommendedAndCandidateAppsInDenyListForSemanticTypes:(id)a3;
- (id)globalAppSessionInterruptionsCalculatorSinceDate:(id)a3;
- (void)logMetrics;
@end

@implementation ATXModeSetupPredictionMetricsLogger

- (ATXModeSetupPredictionMetricsLogger)init
{
  v3.receiver = self;
  v3.super_class = (Class)ATXModeSetupPredictionMetricsLogger;
  return [(ATXModeSetupPredictionMetricsLogger *)&v3 init];
}

- (id)globalAppSessionInterruptionsCalculatorSinceDate:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = (void *)MEMORY[0x1E4F1C9C8];
  [v3 timeIntervalSinceReferenceDate];
  v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  v7 = [v4 appLaunchesSinceDate:v6];

  v8 = objc_opt_new();
  v9 = objc_opt_new();
  [v3 timeIntervalSinceReferenceDate];
  v10 = objc_msgSend(v9, "publisherFromStartTime:");
  v11 = [v8 stripStoreEvent:v10];

  v12 = [v11 orderedMergeWithOther:v7 comparator:&__block_literal_global_12];
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__4;
  v20[4] = __Block_byref_object_dispose__4;
  id v21 = 0;
  v13 = objc_opt_new();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __88__ATXModeSetupPredictionMetricsLogger_globalAppSessionInterruptionsCalculatorSinceDate___block_invoke_17;
  v19[3] = &unk_1E68AC060;
  v19[4] = v20;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __88__ATXModeSetupPredictionMetricsLogger_globalAppSessionInterruptionsCalculatorSinceDate___block_invoke_2;
  v17[3] = &unk_1E68AC088;
  id v14 = v13;
  id v18 = v14;
  id v15 = (id)[v12 sinkWithCompletion:v19 receiveInput:v17];

  _Block_object_dispose(v20, 8);
  return v14;
}

uint64_t __88__ATXModeSetupPredictionMetricsLogger_globalAppSessionInterruptionsCalculatorSinceDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 eventTime];
  v6 = [v4 eventTime];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __88__ATXModeSetupPredictionMetricsLogger_globalAppSessionInterruptionsCalculatorSinceDate___block_invoke_17(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 error];
  return MEMORY[0x1F41817F8]();
}

void __88__ATXModeSetupPredictionMetricsLogger_globalAppSessionInterruptionsCalculatorSinceDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) handleNotificationEvent:v5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = *(void **)(a1 + 32);
      id v4 = objc_opt_new();
      [v3 handleNextAppLaunch:v5 dimensionSet:v4];
    }
  }
}

- (id)appSessionInterruptionsCalculatorSinceDate:(id)a3 andForModeSemanticTypes:(id)a4
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v5 = a4;
  v6 = BiomeLibrary();
  uint64_t v7 = [v6 UserFocus];
  v31 = [v7 InferredMode];

  v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E8]) initWithStartDate:v32 endDate:0 maxEvents:0 lastN:0 reversed:0];
  v30 = objc_msgSend(v31, "publisherWithUseCase:options:", *MEMORY[0x1E4F4B5A0]);
  v8 = objc_opt_new();
  v9 = (void *)MEMORY[0x1E4F1C9C8];
  [v32 timeIntervalSinceReferenceDate];
  v10 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
  v29 = [v8 appLaunchesSinceDate:v10];

  v11 = objc_opt_new();
  v12 = objc_opt_new();
  [v32 timeIntervalSinceReferenceDate];
  v13 = objc_msgSend(v12, "publisherFromStartTime:");
  v28 = [v11 stripStoreEvent:v13];

  v46[0] = v28;
  v46[1] = v29;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  id v15 = [v30 orderedMergeWithOthers:v14 comparator:&__block_literal_global_26];

  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__4;
  v43[4] = __Block_byref_object_dispose__4;
  id v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__4;
  v41[4] = __Block_byref_object_dispose__4;
  id v42 = 0;
  v16 = objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v17 = v5;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = [*(id *)(*((void *)&v37 + 1) + 8 * i) integerValue];
        v22 = objc_opt_new();
        v23 = [NSNumber numberWithInteger:v21];
        [v16 setObject:v22 forKeyedSubscript:v23];
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v18);
  }

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __106__ATXModeSetupPredictionMetricsLogger_appSessionInterruptionsCalculatorSinceDate_andForModeSemanticTypes___block_invoke_2;
  v36[3] = &unk_1E68AC060;
  v36[4] = v41;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __106__ATXModeSetupPredictionMetricsLogger_appSessionInterruptionsCalculatorSinceDate_andForModeSemanticTypes___block_invoke_3;
  v33[3] = &unk_1E68AC0B0;
  v35 = v43;
  id v24 = v16;
  id v34 = v24;
  id v25 = (id)[v15 sinkWithCompletion:v36 receiveInput:v33];

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);

  return v24;
}

uint64_t __106__ATXModeSetupPredictionMetricsLogger_appSessionInterruptionsCalculatorSinceDate_andForModeSemanticTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 eventTime];
  v6 = [v4 eventTime];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __106__ATXModeSetupPredictionMetricsLogger_appSessionInterruptionsCalculatorSinceDate_andForModeSemanticTypes___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 error];
  return MEMORY[0x1F41817F8]();
}

void __106__ATXModeSetupPredictionMetricsLogger_appSessionInterruptionsCalculatorSinceDate_andForModeSemanticTypes___block_invoke_3(uint64_t a1, void *a2)
{
  id v15 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v15 eventBody];
    if ([v3 modeType] == 2)
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
      id v5 = *(ATXModeDimensionSet **)(v4 + 40);
      *(void *)(v4 + 40) = 0;
LABEL_18:

LABEL_19:
      goto LABEL_20;
    }
    [v3 modeType];
    BMUserFocusInferredModeTypeToActivity();
    ATXActivityTypeToModeSemanticType();
    id v5 = (ATXModeDimensionSet *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v6)
    {
      int v7 = [v6 isEqualToNumber:v5];
      int v8 = [v3 isStart];
      if (v7)
      {
        if (v8) {
          goto LABEL_18;
        }
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
        v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      int v8 = [v3 isStart];
    }
    if (!v8) {
      goto LABEL_18;
    }
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    id v14 = v5;
    v10 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v14;
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      goto LABEL_20;
    }
    id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
    [v3 handleNotificationEvent:v15];
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v11)
    {
      [v11 integerValue];
      DNDModeSemanticTypeToATXActivityType();
      ATXModeFromActivityType();
      id v3 = ATXModeToString();
      id v5 = [[ATXModeDimensionSet alloc] initWithMode:v3];
      v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      [v12 handleNextAppLaunch:v15 dimensionSet:v5];

      goto LABEL_18;
    }
  }
LABEL_20:
}

- (id)getRecommendedAndCandidateAppsInAllowListForSemanticTypes:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  id v5 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = [*(id *)(*((void *)&v26 + 1) + 8 * i) integerValue];
        v11 = objc_opt_new();
        v12 = DNDModeSemanticTypeToString();
        [v4 setObject:v11 forKeyedSubscript:v12];

        uint64_t v13 = objc_opt_new();
        dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __97__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInAllowListForSemanticTypes___block_invoke;
        v21[3] = &unk_1E68AC100;
        id v15 = v14;
        v22 = v15;
        id v23 = v13;
        id v24 = v4;
        uint64_t v25 = v10;
        id v16 = v13;
        [v5 recommendedAndCandidateAllowedAppsForDNDModeSemanticType:v10 reply:v21];
        id v17 = v15;
        dispatch_time_t v18 = dispatch_time(0, 5000000000);
        dispatch_semaphore_wait(v17, v18);
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }

  return v4;
}

void __97__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInAllowListForSemanticTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __97__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInAllowListForSemanticTypes___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v8 = [v5 recommendedApps];

    if (v8)
    {
      uint64_t v9 = [v5 recommendedApps];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __97__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInAllowListForSemanticTypes___block_invoke_32;
      v16[3] = &unk_1E68AC0D8;
      id v17 = *(id *)(a1 + 40);
      [v9 enumerateObjectsUsingBlock:v16];
    }
    uint64_t v10 = [v5 candidateApps];

    if (v10)
    {
      v11 = [v5 candidateApps];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __97__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInAllowListForSemanticTypes___block_invoke_2;
      v14[3] = &unk_1E68AC0D8;
      id v15 = *(id *)(a1 + 40);
      [v11 enumerateObjectsUsingBlock:v14];
    }
    uint64_t v13 = *(void *)(a1 + 40);
    v12 = *(void **)(a1 + 48);
    uint64_t v7 = DNDModeSemanticTypeToString();
    [v12 setObject:v13 forKey:v7];
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __97__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInAllowListForSemanticTypes___block_invoke_32(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 bundleId];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v6 bundleId];
    [v4 addObject:v5];
  }
}

void __97__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInAllowListForSemanticTypes___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 bundleId];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v6 bundleId];
    [v4 addObject:v5];
  }
}

- (id)getRecommendedAndCandidateAppsInDenyListForSemanticTypes:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  id v5 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = [*(id *)(*((void *)&v26 + 1) + 8 * i) integerValue];
        v11 = objc_opt_new();
        v12 = DNDModeSemanticTypeToString();
        [v4 setObject:v11 forKeyedSubscript:v12];

        uint64_t v13 = objc_opt_new();
        dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __96__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInDenyListForSemanticTypes___block_invoke;
        v21[3] = &unk_1E68AC100;
        id v15 = v14;
        v22 = v15;
        id v23 = v13;
        id v24 = v4;
        uint64_t v25 = v10;
        id v16 = v13;
        [v5 recommendedAndCandidateDeniedAppsForDNDModeSemanticType:v10 reply:v21];
        id v17 = v15;
        dispatch_time_t v18 = dispatch_time(0, 5000000000);
        dispatch_semaphore_wait(v17, v18);
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }

  return v4;
}

void __96__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInDenyListForSemanticTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __97__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInAllowListForSemanticTypes___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v8 = [v5 recommendedApps];

    if (v8)
    {
      uint64_t v9 = [v5 recommendedApps];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __96__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInDenyListForSemanticTypes___block_invoke_35;
      v16[3] = &unk_1E68AC0D8;
      id v17 = *(id *)(a1 + 40);
      [v9 enumerateObjectsUsingBlock:v16];
    }
    uint64_t v10 = [v5 candidateApps];

    if (v10)
    {
      v11 = [v5 candidateApps];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __96__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInDenyListForSemanticTypes___block_invoke_2;
      v14[3] = &unk_1E68AC0D8;
      id v15 = *(id *)(a1 + 40);
      [v11 enumerateObjectsUsingBlock:v14];
    }
    uint64_t v13 = *(void *)(a1 + 40);
    v12 = *(void **)(a1 + 48);
    uint64_t v7 = DNDModeSemanticTypeToString();
    [v12 setObject:v13 forKey:v7];
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __96__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInDenyListForSemanticTypes___block_invoke_35(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 bundleId];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v6 bundleId];
    [v4 addObject:v5];
  }
}

void __96__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInDenyListForSemanticTypes___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 bundleId];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v6 bundleId];
    [v4 addObject:v5];
  }
}

- (id)fetchAllRelevantModeSemanticTypesInLastSevenDays:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F4AF78] sharedInstance];
  id v5 = objc_opt_new();
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__4;
  v35 = __Block_byref_object_dispose__4;
  id v36 = 0;
  id v6 = BiomeLibrary();
  uint64_t v7 = [v6 UserFocus];
  uint64_t v8 = [v7 InferredMode];

  uint64_t v9 = BiomeLibrary();
  uint64_t v10 = [v9 UserFocus];
  v11 = [v10 ComputedMode];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F503E8]) initWithStartDate:v3 endDate:0 maxEvents:0 lastN:0 reversed:0];
  uint64_t v25 = v3;
  uint64_t v13 = *MEMORY[0x1E4F4B5A0];
  dispatch_semaphore_t v14 = [v8 publisherWithUseCase:*MEMORY[0x1E4F4B5A0] options:v12];
  id v15 = [v11 publisherWithUseCase:v13 options:v12];
  id v16 = [v14 orderedMergeWithOther:v15 comparator:&__block_literal_global_40];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __88__ATXModeSetupPredictionMetricsLogger_fetchAllRelevantModeSemanticTypesInLastSevenDays___block_invoke_2;
  v30[3] = &unk_1E68AC060;
  v30[4] = &v31;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __88__ATXModeSetupPredictionMetricsLogger_fetchAllRelevantModeSemanticTypesInLastSevenDays___block_invoke_3;
  v28[3] = &unk_1E68ABB70;
  id v17 = v5;
  id v29 = v17;
  id v18 = (id)[v16 sinkWithCompletion:v30 receiveInput:v28];
  if (v32[5])
  {
    uint64_t v19 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ATXModeSetupPredictionMetricsLogger fetchAllRelevantModeSemanticTypesInLastSevenDays:]();
    }
  }
  v20 = [v4 getAllModeConfigurationsWithoutCache];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __88__ATXModeSetupPredictionMetricsLogger_fetchAllRelevantModeSemanticTypesInLastSevenDays___block_invoke_44;
  v26[3] = &unk_1E68AC128;
  id v21 = v17;
  id v27 = v21;
  [v20 enumerateKeysAndObjectsUsingBlock:v26];
  v22 = v27;
  id v23 = v21;

  _Block_object_dispose(&v31, 8);
  return v23;
}

uint64_t __88__ATXModeSetupPredictionMetricsLogger_fetchAllRelevantModeSemanticTypesInLastSevenDays___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  uint64_t v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

uint64_t __88__ATXModeSetupPredictionMetricsLogger_fetchAllRelevantModeSemanticTypesInLastSevenDays___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 error];
  return MEMORY[0x1F41817F8]();
}

void __88__ATXModeSetupPredictionMetricsLogger_fetchAllRelevantModeSemanticTypesInLastSevenDays___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v6 = [v3 eventBody];
  uint64_t v7 = v6;
  if (isKindOfClass)
  {
    if (![v6 isStart] || objc_msgSend(v7, "modeType") == 2) {
      goto LABEL_10;
    }
    [v7 modeType];
    BMUserFocusInferredModeTypeToActivity();
    uint64_t v8 = ATXActivityTypeToModeSemanticType();
    if (!v8)
    {
      dispatch_semaphore_t v14 = __atxlog_handle_modes();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        __88__ATXModeSetupPredictionMetricsLogger_fetchAllRelevantModeSemanticTypesInLastSevenDays___block_invoke_3_cold_1(v7);
      }

      goto LABEL_10;
    }
    double v9 = (void *)v8;
    uint64_t v10 = *(void **)(a1 + 32);
    goto LABEL_9;
  }
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();

  if (v11)
  {
    uint64_t v7 = [v3 eventBody];
    if (![v7 starting])
    {
LABEL_10:

      goto LABEL_11;
    }
    uint64_t v12 = objc_msgSend(v7, "atx_dndModeSemanticType");
    uint64_t v13 = *(void **)(a1 + 32);
    double v9 = [NSNumber numberWithInteger:v12];
    uint64_t v10 = v13;
LABEL_9:
    [v10 addObject:v9];

    goto LABEL_10;
  }
LABEL_11:
}

void __88__ATXModeSetupPredictionMetricsLogger_fetchAllRelevantModeSemanticTypesInLastSevenDays___block_invoke_44(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 mode];
  uint64_t v6 = [v5 semanticType];

  uint64_t v7 = [v4 created];

  if (v7)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = [NSNumber numberWithInteger:v6];
    [v8 addObject:v9];
  }
}

- (void)logMetrics
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "ATXModeSetupPredictionMetricsLogger: could not fetch home page configurations with error: %@", v2, v3, v4, v5, v6);
}

uint64_t __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_53(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_56(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 mode];
  [v5 semanticType];
  uint8_t v6 = DNDModeSemanticTypeToString();

  uint64_t v7 = [v4 created];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
    [v8 setModeIsCreated:1];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = objc_msgSend(v4, "triggers", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          dispatch_semaphore_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v14 isEnabled])
          {
            id v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
            [v15 setModeHasSmartActivationEnabled:1];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }

    id v16 = [v4 created];
    [v16 timeIntervalSinceNow];
    double v18 = v17;

    if (v18 <= 0.0)
    {
      uint64_t v19 = [v4 created];
      [v19 timeIntervalSinceNow];
      double v21 = fabs(v20);

      if (v21 < 604800.0)
      {
        v22 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
        [v22 setModeWasCreatedWithin7Days:1];

        if (v21 < 86400.0)
        {
          id v23 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
          [v23 setModeWasCreatedToday:1];
        }
      }
    }
  }
}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_58(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 error];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint8_t v6 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    if (v6)
    {
      id v27 = [v6 eventBody];
      if ([v27 starting])
      {
        uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);

        if (!v7) {
          return;
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v9 = v8 - *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
        uint64_t v10 = NSNumber;
        uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
        [v11 doubleValue];
        uint64_t v13 = [v10 numberWithDouble:v9 + v12];
        [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];

        dispatch_semaphore_t v14 = NSNumber;
        id v15 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
        id v16 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "intValue") + 1);
        [*(id *)(a1 + 40) setObject:v16 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];

        [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) timestamp];
        if (v17 <= *(double *)(a1 + 96)) {
          return;
        }
        [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) timestamp];
        double v19 = v18 - *(double *)(a1 + 96);
        double v20 = NSNumber;
        double v21 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
        [v21 doubleValue];
        if (v9 >= v19) {
          double v23 = v19;
        }
        else {
          double v23 = v9;
        }
        long long v24 = [v20 numberWithDouble:v23 + v22];
        [*(id *)(a1 + 48) setObject:v24 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];

        long long v25 = NSNumber;
        id v27 = [*(id *)(a1 + 56) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
        long long v26 = objc_msgSend(v25, "numberWithInt:", objc_msgSend(v27, "intValue") + 1);
        [*(id *)(a1 + 56) setObject:v26 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
      }
    }
  }
}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_2(uint64_t a1, void *a2)
{
  id v52 = a2;
  uint64_t v4 = [v52 eventBody];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
  if (![v4 updateReason] || !objc_msgSend(v4, "updateSource")) {
    goto LABEL_21;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    if (![v4 starting]) {
      goto LABEL_21;
    }
LABEL_20:
    objc_msgSend(v4, "atx_dndModeSemanticType");
    uint64_t v48 = DNDModeSemanticTypeToString();
    uint64_t v49 = *(void *)(*(void *)(a1 + 72) + 8);
    v50 = *(void **)(v49 + 40);
    *(void *)(v49 + 40) = v48;

    [v52 timestamp];
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v51;
    goto LABEL_21;
  }
  [v52 timestamp];
  double v6 = v5 - *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  objc_msgSend(v4, "atx_dndModeSemanticType");
  double v8 = DNDModeSemanticTypeToString();
  LODWORD(v7) = [v7 isEqualToString:v8];

  int v9 = [v4 starting];
  if (!v7)
  {
    if (v9)
    {
      v30 = NSNumber;
      uint64_t v31 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
      [v31 doubleValue];
      uint64_t v33 = [v30 numberWithDouble:v6 + v32];
      [*(id *)(a1 + 32) setObject:v33 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

      id v34 = NSNumber;
      v35 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
      id v36 = objc_msgSend(v34, "numberWithInt:", objc_msgSend(v35, "intValue") + 1);
      [*(id *)(a1 + 40) setObject:v36 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

      [v52 timestamp];
      if (v37 > *(double *)(a1 + 88))
      {
        long long v38 = NSNumber;
        long long v39 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
        long long v40 = objc_msgSend(v38, "numberWithInt:", objc_msgSend(v39, "intValue") + 1);
        [*(id *)(a1 + 48) setObject:v40 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

        [v52 timestamp];
        double v42 = v41 - *(double *)(a1 + 88);
        v43 = NSNumber;
        id v44 = [*(id *)(a1 + 56) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
        [v44 doubleValue];
        if (v6 >= v42) {
          double v46 = v42;
        }
        else {
          double v46 = v6;
        }
        v47 = [v43 numberWithDouble:v46 + v45];
        [*(id *)(a1 + 56) setObject:v47 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
      }
    }
    goto LABEL_20;
  }
  if ((v9 & 1) == 0)
  {
    uint64_t v10 = NSNumber;
    uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
    [v11 doubleValue];
    uint64_t v13 = [v10 numberWithDouble:v6 + v12];
    [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

    dispatch_semaphore_t v14 = NSNumber;
    id v15 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
    id v16 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "intValue") + 1);
    [*(id *)(a1 + 40) setObject:v16 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

    [v52 timestamp];
    if (v17 > *(double *)(a1 + 88))
    {
      double v18 = NSNumber;
      double v19 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
      double v20 = objc_msgSend(v18, "numberWithInt:", objc_msgSend(v19, "intValue") + 1);
      [*(id *)(a1 + 48) setObject:v20 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

      [v52 timestamp];
      double v22 = v21 - *(double *)(a1 + 88);
      double v23 = NSNumber;
      long long v24 = [*(id *)(a1 + 56) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
      [v24 doubleValue];
      if (v6 >= v22) {
        double v26 = v22;
      }
      else {
        double v26 = v6;
      }
      id v27 = [v23 numberWithDouble:v26 + v25];
      [*(id *)(a1 + 56) setObject:v27 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
    }
  }
  uint64_t v28 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v29 = *(void **)(v28 + 40);
  *(void *)(v28 + 40) = 0;

LABEL_21:
}

uint64_t __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_59(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  double v6 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  uint64_t v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

uint64_t __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_2_62(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 error];
  return MEMORY[0x1F41817F8]();
}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 eventBody];
  if ([v3 usageType] == 17 || objc_msgSend(v3, "usageType") == 18)
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    [v7 timestamp];
    if (v4 <= *(double *)(a1 + 64)) {
      goto LABEL_9;
    }
    uint64_t v5 = *(void *)(a1 + 40);
    goto LABEL_5;
  }
  if ([v3 usageType] == 4)
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    [v7 timestamp];
    if (v6 > *(double *)(a1 + 64))
    {
      uint64_t v5 = *(void *)(a1 + 56);
LABEL_5:
      ++*(_DWORD *)(*(void *)(v5 + 8) + 24);
    }
  }
LABEL_9:
}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 error];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    double v6 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    if (v6)
    {
      if ([v6 isStart])
      {
        if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
        {
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          double v8 = v7 - *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
          double v9 = NSNumber;
          uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
          [v10 doubleValue];
          double v12 = [v9 numberWithDouble:v8 + v11];
          [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];

          uint64_t v13 = NSNumber;
          dispatch_semaphore_t v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
          id v15 = objc_msgSend(v13, "numberWithInt:", objc_msgSend(v14, "intValue") + 1);
          [*(id *)(a1 + 40) setObject:v15 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];

          id v16 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) absoluteTimestamp];
          [v16 timeIntervalSinceReferenceDate];
          double v18 = v17;
          double v19 = *(double *)(a1 + 96);

          if (v18 > v19)
          {
            double v20 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) absoluteTimestamp];
            [v20 timeIntervalSinceReferenceDate];
            double v22 = v21 - *(double *)(a1 + 96);

            double v23 = NSNumber;
            long long v24 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
            [v24 doubleValue];
            if (v8 >= v22) {
              double v26 = v22;
            }
            else {
              double v26 = v8;
            }
            id v27 = [v23 numberWithDouble:v26 + v25];
            [*(id *)(a1 + 48) setObject:v27 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];

            uint64_t v28 = NSNumber;
            id v30 = [*(id *)(a1 + 56) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
            uint64_t v29 = objc_msgSend(v28, "numberWithInt:", objc_msgSend(v30, "intValue") + 1);
            [*(id *)(a1 + 56) setObject:v29 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
          }
        }
      }
    }
  }
}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  double v6 = [v3 eventBody];
  if (isKindOfClass)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), v6);
    if ([v6 modeType] == 2)
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 104) + 8);
      double v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = 0;

LABEL_38:
      goto LABEL_39;
    }
    [v6 modeType];
    BMUserFocusInferredModeTypeToActivity();
    double v18 = ATXActivityTypeToModeSemanticType();
    double v19 = v18;
    if (!v18)
    {
      double v46 = __atxlog_handle_modes();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
        __88__ATXModeSetupPredictionMetricsLogger_fetchAllRelevantModeSemanticTypesInLastSevenDays___block_invoke_3_cold_1(v6);
      }

      goto LABEL_37;
    }
    [v18 integerValue];
    double v20 = DNDModeSemanticTypeToString();
    if (*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40))
    {
      [v3 timestamp];
      double v22 = v21 - *(double *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
      int v23 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) isEqualToString:v20];
      int v24 = [v6 isStart];
      if (v23)
      {
        if ((v24 & 1) == 0)
        {
          double v25 = NSNumber;
          double v26 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
          [v26 doubleValue];
          uint64_t v28 = [v25 numberWithDouble:v22 + v27];
          [*(id *)(a1 + 32) setObject:v28 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];

          uint64_t v29 = NSNumber;
          id v30 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
          uint64_t v31 = objc_msgSend(v29, "numberWithInt:", objc_msgSend(v30, "intValue") + 1);
          [*(id *)(a1 + 40) setObject:v31 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];

          [v3 timestamp];
          if (v32 > *(double *)(a1 + 120))
          {
            [v3 timestamp];
            double v34 = v33 - *(double *)(a1 + 120);
            v35 = NSNumber;
            id v36 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
            [v36 doubleValue];
            if (v22 >= v34) {
              double v38 = v34;
            }
            else {
              double v38 = v22;
            }
            long long v39 = [v35 numberWithDouble:v38 + v37];
            [*(id *)(a1 + 48) setObject:v39 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];

            long long v40 = NSNumber;
            double v41 = [*(id *)(a1 + 56) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
            double v42 = objc_msgSend(v40, "numberWithInt:", objc_msgSend(v41, "intValue") + 1);
            [*(id *)(a1 + 56) setObject:v42 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
          }
        }
        uint64_t v43 = *(void *)(*(void *)(a1 + 104) + 8);
        id v44 = *(void **)(v43 + 40);
        *(void *)(v43 + 40) = 0;

        goto LABEL_36;
      }
      if (v24)
      {
        v47 = NSNumber;
        uint64_t v48 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
        [v48 doubleValue];
        v50 = [v47 numberWithDouble:v22 + v49];
        [*(id *)(a1 + 32) setObject:v50 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];

        [v3 timestamp];
        if (v51 > *(double *)(a1 + 120))
        {
          [v3 timestamp];
          double v53 = v52 - *(double *)(a1 + 120);
          v54 = NSNumber;
          v55 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
          [v55 doubleValue];
          if (v22 >= v53) {
            double v57 = v53;
          }
          else {
            double v57 = v22;
          }
          v58 = [v54 numberWithDouble:v57 + v56];
          [*(id *)(a1 + 48) setObject:v58 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
        }
      }
    }
    else if (![v6 isStart])
    {
      goto LABEL_36;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), v20);
    [v3 timestamp];
    *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = v59;
LABEL_36:

LABEL_37:
    goto LABEL_38;
  }
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  if (v9)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40))
    {
      double v6 = [v3 eventBody];
      if ([v6 usageType] == 17 || objc_msgSend(v6, "usageType") == 18)
      {
        uint64_t v10 = NSNumber;
        double v11 = [*(id *)(a1 + 64) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
        double v12 = objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "intValue") + 1);
        [*(id *)(a1 + 64) setObject:v12 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];

        [v3 timestamp];
        if (v13 <= *(double *)(a1 + 120)) {
          goto LABEL_38;
        }
        dispatch_semaphore_t v14 = (id *)(a1 + 72);
      }
      else
      {
        if ([v6 usageType] != 4) {
          goto LABEL_38;
        }
        v60 = NSNumber;
        v61 = [*(id *)(a1 + 80) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
        v62 = objc_msgSend(v60, "numberWithInt:", objc_msgSend(v61, "intValue") + 1);
        [*(id *)(a1 + 80) setObject:v62 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];

        [v3 timestamp];
        if (v63 <= *(double *)(a1 + 120)) {
          goto LABEL_38;
        }
        dispatch_semaphore_t v14 = (id *)(a1 + 88);
      }
      id v15 = NSNumber;
      id v16 = [*v14 objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
      double v17 = objc_msgSend(v15, "numberWithInt:", objc_msgSend(v16, "intValue") + 1);
      [*v14 setObject:v17 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];

      goto LABEL_38;
    }
  }
  else
  {
    double v45 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_5_cold_2(v3, v45);
    }
  }
LABEL_39:
}

uint64_t __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_66(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 error];
  return MEMORY[0x1F41817F8]();
}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_2_67(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v41 = a2;
  id v3 = [v41 eventBody];
  if ([v3 starting])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 bundleID];
    LODWORD(v4) = [v4 containsObject:v5];

    if (v4)
    {
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
      [v41 timestamp];
      if (v6 > *(double *)(a1 + 112)) {
        ++*(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
      }
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v7 = *(id *)(a1 + 40);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = 0;
        id obj = v7;
        uint64_t v40 = *(void *)v43;
        double v11 = 0.0;
        char v12 = 1;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v43 != v40) {
              objc_enumerationMutation(obj);
            }
            dispatch_semaphore_t v14 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            [v14 integerValue];
            id v15 = DNDModeSemanticTypeToString();
            uint64_t v16 = objc_msgSend(*(id *)(a1 + 48), "atxModeForDNDSemanticType:", objc_msgSend(v14, "integerValue"));
            double v17 = *(void **)(a1 + 56);
            double v18 = v3;
            double v19 = [v3 bundleID];
            [v17 scoreForMode:v16 bundleId:v19 scalingFactor:1.0];
            double v21 = v20;

            if ((v12 & (v21 >= 0.0)) == 1)
            {
              id v22 = v15;

              char v12 = 0;
              double v11 = v21;
              uint64_t v10 = v22;
            }
            int v23 = NSNumber;
            int v24 = [*(id *)(a1 + 64) objectForKeyedSubscript:v15];
            [v24 doubleValue];
            double v26 = [v23 numberWithDouble:v21 + v25];
            [*(id *)(a1 + 64) setObject:v26 forKeyedSubscript:v15];

            [v41 timestamp];
            id v3 = v18;
            if (v27 > *(double *)(a1 + 112))
            {
              uint64_t v28 = NSNumber;
              uint64_t v29 = [*(id *)(a1 + 72) objectForKeyedSubscript:v15];
              [v29 doubleValue];
              uint64_t v31 = [v28 numberWithDouble:v21 + v30];
              [*(id *)(a1 + 72) setObject:v31 forKeyedSubscript:v15];
            }
            if (v21 > v11)
            {
              id v32 = v15;

              double v11 = v21;
              uint64_t v10 = v32;
            }
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
        }
        while (v9);

        if (!v10) {
          goto LABEL_23;
        }
        double v33 = NSNumber;
        double v34 = [*(id *)(a1 + 80) objectForKeyedSubscript:v10];
        v35 = objc_msgSend(v33, "numberWithInt:", objc_msgSend(v34, "intValue") + 1);
        [*(id *)(a1 + 80) setObject:v35 forKeyedSubscript:v10];

        [v41 timestamp];
        if (v36 <= *(double *)(a1 + 112)) {
          goto LABEL_23;
        }
        double v37 = NSNumber;
        id v7 = [*(id *)(a1 + 88) objectForKeyedSubscript:v10];
        double v38 = objc_msgSend(v37, "numberWithInt:", objc_msgSend(v7, "intValue") + 1);
        [*(id *)(a1 + 88) setObject:v38 forKeyedSubscript:v10];
      }
      else
      {
        uint64_t v10 = 0;
      }

LABEL_23:
    }
  }
}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_68(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [a2 integerValue];
  uint64_t v6 = DNDModeSemanticTypeToString();
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "numberOfInterruptingAppSessions"));
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  [v8 setModeAppInterruptionsCountInModeInferred7Days:v7];

  uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  uint64_t v10 = [v9 modeAppInterruptionsCountInModeInferred7Days];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v10 intValue];

  double v11 = [*(id *)(a1 + 40) objectForKey:v6];
  uint64_t v30 = a1;
  uint64_t v31 = (void *)v6;
  char v12 = [*(id *)(a1 + 48) objectForKey:v6];
  [v5 countedSetContainingInterruptingAppBundleIds];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        if ([v11 containsObject:v19])
        {
          double v20 = [v5 countedSetContainingInterruptingAppBundleIds];
          uint64_t v16 = v16 + [v20 countForObject:v19];
        }
        if ([v12 containsObject:v19])
        {
          double v21 = [v5 countedSetContainingInterruptingAppBundleIds];
          uint64_t v15 = v15 + [v21 countForObject:v19];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v14);
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  id v22 = [NSNumber numberWithInt:v16];
  int v23 = [*(id *)(v30 + 32) objectForKeyedSubscript:v31];
  [v23 setModeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days:v22];

  int v24 = [NSNumber numberWithInt:v15];
  double v25 = [*(id *)(v30 + 32) objectForKeyedSubscript:v31];
  [v25 setModeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days:v24];

  double v26 = [*(id *)(v30 + 32) objectForKeyedSubscript:v31];
  double v27 = [v26 modeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days];
  *(_DWORD *)(*(void *)(*(void *)(v30 + 64) + 8) + 24) += [v27 intValue];

  uint64_t v28 = [*(id *)(v30 + 32) objectForKeyedSubscript:v31];
  uint64_t v29 = [v28 modeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days];
  *(_DWORD *)(*(void *)(*(void *)(v30 + 72) + 8) + 24) += [v29 intValue];
}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_2_70(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [a2 integerValue];
  uint64_t v6 = DNDModeSemanticTypeToString();
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "numberOfInterruptingAppSessions"));
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  [v8 setModeAppInterruptionsCountInModeInferredToday:v7];

  uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  uint64_t v10 = [v9 modeAppInterruptionsCountInModeInferredToday];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v10 intValue];

  double v11 = [*(id *)(a1 + 40) objectForKey:v6];
  uint64_t v30 = a1;
  uint64_t v31 = (void *)v6;
  char v12 = [*(id *)(a1 + 48) objectForKey:v6];
  [v5 countedSetContainingInterruptingAppBundleIds];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        if ([v11 containsObject:v19])
        {
          double v20 = [v5 countedSetContainingInterruptingAppBundleIds];
          uint64_t v16 = v16 + [v20 countForObject:v19];
        }
        if ([v12 containsObject:v19])
        {
          double v21 = [v5 countedSetContainingInterruptingAppBundleIds];
          uint64_t v15 = v15 + [v21 countForObject:v19];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v14);
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  id v22 = [NSNumber numberWithInt:v16];
  int v23 = [*(id *)(v30 + 32) objectForKeyedSubscript:v31];
  [v23 setModeAppInterruptionsCountBasedOnAllowListOfInferredModeToday:v22];

  int v24 = [NSNumber numberWithInt:v15];
  double v25 = [*(id *)(v30 + 32) objectForKeyedSubscript:v31];
  [v25 setModeAppInterruptionsCountBasedOnDenyListOfInferredModeToday:v24];

  double v26 = [*(id *)(v30 + 32) objectForKeyedSubscript:v31];
  double v27 = [v26 modeAppInterruptionsCountBasedOnAllowListOfInferredModeToday];
  *(_DWORD *)(*(void *)(*(void *)(v30 + 64) + 8) + 24) += [v27 intValue];

  uint64_t v28 = [*(id *)(v30 + 32) objectForKeyedSubscript:v31];
  uint64_t v29 = [v28 modeAppInterruptionsCountBasedOnDenyListOfInferredModeToday];
  *(_DWORD *)(*(void *)(*(void *)(v30 + 72) + 8) + 24) += [v29 intValue];
}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_3_74(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 setModeName:a2];
  [v4 logToCoreAnalytics];
}

void __97__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInAllowListForSemanticTypes___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Could not get recommended and candidate allowed apps: %@", v2, v3, v4, v5, v6);
}

- (void)fetchAllRelevantModeSemanticTypesInLastSevenDays:.cold.1()
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "ATXModeSetupPredictionMetricsLogger: Could not fetch inferred mode and computed mode streams with error: %@", v2, v3, v4, v5, v6);
}

void __88__ATXModeSetupPredictionMetricsLogger_fetchAllRelevantModeSemanticTypesInLastSevenDays___block_invoke_3_cold_1(void *a1)
{
  [a1 modeType];
  OUTLINED_FUNCTION_4_0(&dword_1D0FA3000, v1, v2, "ATXModeSetupPredictionMetricsLogger: ATXActivityTypeToModeSemanticType returned nil for BMUserFocusInferredModeType %d", v3, v4, v5, v6, 0);
}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_5_cold_2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 eventBody];
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXModeSetupPredictionMetricsLogger: Got unexpected event type: %@", v4, 0xCu);
}

@end