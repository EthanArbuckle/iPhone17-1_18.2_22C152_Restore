@interface ATXAppSessionInterruptionsProvider
- (ATXAppSessionInterruptionsProvider)initWithLastNDays:(unint64_t)a3;
- (unint64_t)appInterruptionsCountWithAccumulator:(id)a3 suggestedBundleIds:(id)a4;
- (unint64_t)globalInterruptedAppSessionsCountWithinLast1Day;
- (unint64_t)globalInterruptedAppSessionsCountWithinLastNDays;
- (unint64_t)modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode:(unint64_t)a3;
- (unint64_t)modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode:(unint64_t)a3;
- (unint64_t)modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode:(unint64_t)a3;
- (unint64_t)modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode:(unint64_t)a3;
- (unint64_t)modeInterruptedAppSessionsCountWithinLast1DayForMode:(unint64_t)a3;
- (unint64_t)modeInterruptedAppSessionsCountWithinLastNDaysForMode:(unint64_t)a3;
- (void)cacheGlobalAppSessionInterruptionsCalculatorIfNecessary;
- (void)cacheModeAppSessionInterruptionsCalculatorIfNecessary;
- (void)cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary;
- (void)cacheRecommendedAndCandidateAppsInDenyListForAllModesIfNecessary;
@end

@implementation ATXAppSessionInterruptionsProvider

- (ATXAppSessionInterruptionsProvider)initWithLastNDays:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ATXAppSessionInterruptionsProvider;
  v4 = [(ATXAppSessionInterruptionsProvider *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)(-86400 * a3)];
    thresholdDateLastNDays = v4->_thresholdDateLastNDays;
    v4->_thresholdDateLastNDays = (NSDate *)v5;
  }
  return v4;
}

- (void)cacheGlobalAppSessionInterruptionsCalculatorIfNecessary
{
}

uint64_t __93__ATXAppSessionInterruptionsProvider_cacheGlobalAppSessionInterruptionsCalculatorIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 eventTime];
  v6 = [v4 eventTime];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __93__ATXAppSessionInterruptionsProvider_cacheGlobalAppSessionInterruptionsCalculatorIfNecessary__block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 error];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

void __93__ATXAppSessionInterruptionsProvider_cacheGlobalAppSessionInterruptionsCalculatorIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v15 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) handleNotificationEvent:v15];
    uint64_t v3 = [v15 eventTime];
    [v3 timeIntervalSinceReferenceDate];
    double v5 = v4;
    double v6 = *(double *)(a1 + 48);

    if (v5 > v6) {
      [*(id *)(a1 + 40) handleNotificationEvent:v15];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = *(void **)(a1 + 32);
      objc_super v8 = objc_opt_new();
      [v7 handleNextAppLaunch:v15 dimensionSet:v8];

      v9 = [v15 eventTime];
      [v9 timeIntervalSinceReferenceDate];
      double v11 = v10;
      double v12 = *(double *)(a1 + 48);

      if (v11 > v12)
      {
        v13 = *(void **)(a1 + 40);
        v14 = objc_opt_new();
        [v13 handleNextAppLaunch:v15 dimensionSet:v14];
      }
    }
  }
}

- (void)cacheModeAppSessionInterruptionsCalculatorIfNecessary
{
}

uint64_t __91__ATXAppSessionInterruptionsProvider_cacheModeAppSessionInterruptionsCalculatorIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  double v5 = [a2 eventTime];
  double v6 = [v4 eventTime];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __91__ATXAppSessionInterruptionsProvider_cacheModeAppSessionInterruptionsCalculatorIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 error];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

void __91__ATXAppSessionInterruptionsProvider_cacheModeAppSessionInterruptionsCalculatorIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  id v24 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v24 eventBody];
    if ([(ATXModeDimensionSet *)v3 modeType] == 2)
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = 0;
LABEL_14:

      goto LABEL_15;
    }
    [(ATXModeDimensionSet *)v3 modeType];
    BMUserFocusInferredModeTypeToActivity();
    ATXModeFromActivityType();
    double v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v11)
    {
      double v12 = ATXModeToString();
      int v13 = [v11 isEqualToString:v12];

      if (!v13) {
        goto LABEL_15;
      }
      if (([(ATXModeDimensionSet *)v3 isStart] & 1) == 0)
      {
        uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
        id v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = 0;
      }
    }
    if ([(ATXModeDimensionSet *)v3 isStart])
    {
      uint64_t v16 = ATXModeToString();
      uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v5 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      double v6 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
      [v6 handleNotificationEvent:v24];

      uint64_t v7 = [v24 eventTime];
      [v7 timeIntervalSinceReferenceDate];
      double v9 = v8;
      double v10 = *(double *)(a1 + 56);

      if (v9 > v10)
      {
        uint64_t v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
        [(ATXModeDimensionSet *)v3 handleNotificationEvent:v24];
        goto LABEL_15;
      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v3 = [[ATXModeDimensionSet alloc] initWithMode:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      v18 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [v18 handleNextAppLaunch:v24 dimensionSet:v3];

      v19 = [v24 eventTime];
      [v19 timeIntervalSinceReferenceDate];
      double v21 = v20;
      double v22 = *(double *)(a1 + 56);

      if (v21 > v22)
      {
        v23 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
        [v23 handleNextAppLaunch:v24 dimensionSet:v3];
      }
      goto LABEL_15;
    }
  }
LABEL_16:
}

- (void)cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary
{
  v18 = self;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = (NSDictionary *)objc_opt_new();
  uint64_t v3 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  allModesForTraining();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v7), "unsignedIntegerValue", v18);
        double v9 = objc_opt_new();
        double v10 = ATXModeToString();
        [(NSDictionary *)v2 setObject:v9 forKeyedSubscript:v10];

        double v11 = objc_opt_new();
        dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __103__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary__block_invoke;
        v20[3] = &unk_1E68AC100;
        int v13 = v12;
        double v21 = v13;
        id v22 = v11;
        v23 = v2;
        uint64_t v24 = v8;
        id v14 = v11;
        [v3 recommendedAndCandidateAllowedAppsForMode:v8 reply:v20];
        id v15 = v13;
        dispatch_time_t v16 = dispatch_time(0, 5000000000);
        dispatch_semaphore_wait(v15, v16);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v5);
  }

  cachedRecommendedAndCandidateAllowedApps = v18->_cachedRecommendedAndCandidateAllowedApps;
  v18->_cachedRecommendedAndCandidateAllowedApps = v2;
}

void __103__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __103__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary__block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    id v14 = [v5 recommendedApps];

    if (v14)
    {
      id v15 = [v5 recommendedApps];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __103__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary__block_invoke_27;
      v22[3] = &unk_1E68AC0D8;
      id v23 = *(id *)(a1 + 40);
      [v15 enumerateObjectsUsingBlock:v22];
    }
    dispatch_time_t v16 = [v5 candidateApps];

    if (v16)
    {
      uint64_t v17 = [v5 candidateApps];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __103__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary__block_invoke_2;
      v20[3] = &unk_1E68AC0D8;
      id v21 = *(id *)(a1 + 40);
      [v17 enumerateObjectsUsingBlock:v20];
    }
    uint64_t v19 = *(void *)(a1 + 40);
    v18 = *(void **)(a1 + 48);
    uint64_t v7 = ATXModeToString();
    [v18 setObject:v19 forKey:v7];
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __103__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary__block_invoke_27(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 bundleId];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v6 bundleId];
    [v4 addObject:v5];
  }
}

void __103__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 bundleId];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v6 bundleId];
    [v4 addObject:v5];
  }
}

- (void)cacheRecommendedAndCandidateAppsInDenyListForAllModesIfNecessary
{
  v18 = self;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = (NSDictionary *)objc_opt_new();
  uint64_t v3 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  allModesForTraining();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v7), "unsignedIntegerValue", v18);
        uint64_t v9 = objc_opt_new();
        uint64_t v10 = ATXModeToString();
        [(NSDictionary *)v2 setObject:v9 forKeyedSubscript:v10];

        uint64_t v11 = objc_opt_new();
        dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __102__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInDenyListForAllModesIfNecessary__block_invoke;
        v20[3] = &unk_1E68AC100;
        uint64_t v13 = v12;
        id v21 = v13;
        id v22 = v11;
        id v23 = v2;
        uint64_t v24 = v8;
        id v14 = v11;
        [v3 recommendedAndCandidateDeniedAppsForMode:v8 reply:v20];
        id v15 = v13;
        dispatch_time_t v16 = dispatch_time(0, 5000000000);
        dispatch_semaphore_wait(v15, v16);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v5);
  }

  cachedRecommendedAndCandidateDeniedApps = v18->_cachedRecommendedAndCandidateDeniedApps;
  v18->_cachedRecommendedAndCandidateDeniedApps = v2;
}

void __102__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInDenyListForAllModesIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __103__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary__block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    id v14 = [v5 recommendedApps];

    if (v14)
    {
      id v15 = [v5 recommendedApps];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __102__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInDenyListForAllModesIfNecessary__block_invoke_30;
      v22[3] = &unk_1E68AC0D8;
      id v23 = *(id *)(a1 + 40);
      [v15 enumerateObjectsUsingBlock:v22];
    }
    dispatch_time_t v16 = [v5 candidateApps];

    if (v16)
    {
      uint64_t v17 = [v5 candidateApps];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __102__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInDenyListForAllModesIfNecessary__block_invoke_2;
      v20[3] = &unk_1E68AC0D8;
      id v21 = *(id *)(a1 + 40);
      [v17 enumerateObjectsUsingBlock:v20];
    }
    uint64_t v19 = *(void *)(a1 + 40);
    v18 = *(void **)(a1 + 48);
    uint64_t v7 = ATXModeToString();
    [v18 setObject:v19 forKey:v7];
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __102__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInDenyListForAllModesIfNecessary__block_invoke_30(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 bundleId];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v6 bundleId];
    [v4 addObject:v5];
  }
}

void __102__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInDenyListForAllModesIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 bundleId];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v6 bundleId];
    [v4 addObject:v5];
  }
}

- (unint64_t)globalInterruptedAppSessionsCountWithinLastNDays
{
  [(ATXAppSessionInterruptionsProvider *)self cacheGlobalAppSessionInterruptionsCalculatorIfNecessary];
  cachedGlobalInterruptedAppSessionsAccumulatorForLastNDays = self->_cachedGlobalInterruptedAppSessionsAccumulatorForLastNDays;
  return [(ATXInterruptedAppSessionAccumulator *)cachedGlobalInterruptedAppSessionsAccumulatorForLastNDays numberOfInterruptingAppSessions];
}

- (unint64_t)globalInterruptedAppSessionsCountWithinLast1Day
{
  [(ATXAppSessionInterruptionsProvider *)self cacheGlobalAppSessionInterruptionsCalculatorIfNecessary];
  cachedGlobalInterruptedAppSessionsAccumulatorForLast1Day = self->_cachedGlobalInterruptedAppSessionsAccumulatorForLast1Day;
  return [(ATXInterruptedAppSessionAccumulator *)cachedGlobalInterruptedAppSessionsAccumulatorForLast1Day numberOfInterruptingAppSessions];
}

- (unint64_t)modeInterruptedAppSessionsCountWithinLastNDaysForMode:(unint64_t)a3
{
  [(ATXAppSessionInterruptionsProvider *)self cacheModeAppSessionInterruptionsCalculatorIfNecessary];
  uint64_t v4 = ATXModeToString();
  id v5 = [(NSDictionary *)self->_cachedAccumulatorsPerATXModeForLastNDays objectForKeyedSubscript:v4];
  unint64_t v6 = [v5 numberOfInterruptingAppSessions];

  return v6;
}

- (unint64_t)modeInterruptedAppSessionsCountWithinLast1DayForMode:(unint64_t)a3
{
  [(ATXAppSessionInterruptionsProvider *)self cacheModeAppSessionInterruptionsCalculatorIfNecessary];
  uint64_t v4 = ATXModeToString();
  id v5 = [(NSDictionary *)self->_cachedAccumulatorsPerATXModeForLast1Day objectForKeyedSubscript:v4];
  unint64_t v6 = [v5 numberOfInterruptingAppSessions];

  return v6;
}

- (unint64_t)modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode:(unint64_t)a3
{
  [(ATXAppSessionInterruptionsProvider *)self cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary];
  [(ATXAppSessionInterruptionsProvider *)self cacheModeAppSessionInterruptionsCalculatorIfNecessary];
  uint64_t v4 = ATXModeToString();
  id v5 = [(NSDictionary *)self->_cachedAccumulatorsPerATXModeForLastNDays objectForKeyedSubscript:v4];
  unint64_t v6 = [(NSDictionary *)self->_cachedRecommendedAndCandidateAllowedApps objectForKey:v4];
  unint64_t v7 = [(ATXAppSessionInterruptionsProvider *)self appInterruptionsCountWithAccumulator:v5 suggestedBundleIds:v6];

  return v7;
}

- (unint64_t)modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode:(unint64_t)a3
{
  [(ATXAppSessionInterruptionsProvider *)self cacheRecommendedAndCandidateAppsInDenyListForAllModesIfNecessary];
  [(ATXAppSessionInterruptionsProvider *)self cacheModeAppSessionInterruptionsCalculatorIfNecessary];
  uint64_t v4 = ATXModeToString();
  id v5 = [(NSDictionary *)self->_cachedAccumulatorsPerATXModeForLastNDays objectForKeyedSubscript:v4];
  unint64_t v6 = [(NSDictionary *)self->_cachedRecommendedAndCandidateDeniedApps objectForKey:v4];
  unint64_t v7 = [(ATXAppSessionInterruptionsProvider *)self appInterruptionsCountWithAccumulator:v5 suggestedBundleIds:v6];

  return v7;
}

- (unint64_t)modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode:(unint64_t)a3
{
  [(ATXAppSessionInterruptionsProvider *)self cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary];
  [(ATXAppSessionInterruptionsProvider *)self cacheModeAppSessionInterruptionsCalculatorIfNecessary];
  uint64_t v4 = ATXModeToString();
  id v5 = [(NSDictionary *)self->_cachedAccumulatorsPerATXModeForLast1Day objectForKeyedSubscript:v4];
  unint64_t v6 = [(NSDictionary *)self->_cachedRecommendedAndCandidateAllowedApps objectForKey:v4];
  unint64_t v7 = [(ATXAppSessionInterruptionsProvider *)self appInterruptionsCountWithAccumulator:v5 suggestedBundleIds:v6];

  return v7;
}

- (unint64_t)modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode:(unint64_t)a3
{
  [(ATXAppSessionInterruptionsProvider *)self cacheRecommendedAndCandidateAppsInDenyListForAllModesIfNecessary];
  [(ATXAppSessionInterruptionsProvider *)self cacheModeAppSessionInterruptionsCalculatorIfNecessary];
  uint64_t v4 = ATXModeToString();
  id v5 = [(NSDictionary *)self->_cachedAccumulatorsPerATXModeForLast1Day objectForKeyedSubscript:v4];
  unint64_t v6 = [(NSDictionary *)self->_cachedRecommendedAndCandidateDeniedApps objectForKey:v4];
  unint64_t v7 = [(ATXAppSessionInterruptionsProvider *)self appInterruptionsCountWithAccumulator:v5 suggestedBundleIds:v6];

  return v7;
}

- (unint64_t)appInterruptionsCountWithAccumulator:(id)a3 suggestedBundleIds:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 countedSetContainingInterruptingAppBundleIds];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if ([v6 containsObject:v13])
        {
          id v14 = [v5 countedSetContainingInterruptingAppBundleIds];
          v10 += [v14 countForObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRecommendedAndCandidateDeniedApps, 0);
  objc_storeStrong((id *)&self->_cachedRecommendedAndCandidateAllowedApps, 0);
  objc_storeStrong((id *)&self->_cachedAccumulatorsPerATXModeForLast1Day, 0);
  objc_storeStrong((id *)&self->_cachedAccumulatorsPerATXModeForLastNDays, 0);
  objc_storeStrong((id *)&self->_cachedGlobalInterruptedAppSessionsAccumulatorForLast1Day, 0);
  objc_storeStrong((id *)&self->_cachedGlobalInterruptedAppSessionsAccumulatorForLastNDays, 0);
  objc_storeStrong((id *)&self->_thresholdDateLastNDays, 0);
}

void __103__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end