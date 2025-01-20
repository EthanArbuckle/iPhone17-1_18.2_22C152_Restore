@interface ATXDisplayCacheLockscreenFilter
+ (BOOL)shouldPredictActionOnLockScreen:(id)a3;
+ (id)indicesOfLockScreenActionsForActionPredictions:(id)a3;
+ (id)indicesOfLockScreenActionsForActionPredictions:(id)a3 criteria:(id)a4;
+ (unint64_t)_getPredictionConfidenceForActions:(id)a3;
@end

@implementation ATXDisplayCacheLockscreenFilter

+ (BOOL)shouldPredictActionOnLockScreen:(id)a3
{
  v3 = [a3 criteria];
  char v4 = [v3 lockScreenEligible];

  return v4;
}

+ (id)indicesOfLockScreenActionsForActionPredictions:(id)a3 criteria:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = +[ATXLockscreenBlacklist sharedInstance];
  if (![v8 isPredictionGloballyDisabled])
  {
    v11 = +[ATXNotificationsLoggingServer sharedInstance];
    v12 = [v11 getLockscreenBundleIds];

    v22 = [v8 blacklist];
    v13 = objc_opt_new();
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __91__ATXDisplayCacheLockscreenFilter_indicesOfLockScreenActionsForActionPredictions_criteria___block_invoke;
    v23[3] = &unk_1E68AE330;
    id v28 = a1;
    id v14 = v22;
    id v24 = v14;
    id v15 = v12;
    id v25 = v15;
    id v27 = v7;
    id v16 = v13;
    id v26 = v16;
    [v6 enumerateObjectsUsingBlock:v23];
    uint64_t v17 = [v6 count];
    uint64_t v18 = [v16 count];
    v19 = __atxlog_handle_default();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      +[ATXDisplayCacheLockscreenFilter indicesOfLockScreenActionsForActionPredictions:criteria:](buf, v17 - v18, [v6 count], v19);
    }

    if ([v16 count])
    {
      v20 = [v6 objectsAtIndexes:v16];
      if ([a1 _getPredictionConfidenceForActions:v20] == 1)
      {
        v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndex:", objc_msgSend(v16, "firstIndex"));

LABEL_12:
        goto LABEL_13;
      }
    }
    v10 = objc_opt_new();
    goto LABEL_12;
  }
  v9 = __atxlog_handle_default();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    +[ATXDisplayCacheLockscreenFilter indicesOfLockScreenActionsForActionPredictions:criteria:](v9);
  }

  v10 = objc_opt_new();
LABEL_13:

  return v10;
}

void __91__ATXDisplayCacheLockscreenFilter_indicesOfLockScreenActionsForActionPredictions_criteria___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v18 = a2;
  v5 = [v18 predictedItem];
  id v6 = v5;
  if (v5)
  {
    if ([v5 isHeuristic])
    {
      int v7 = [*(id *)(a1 + 64) shouldPredictActionOnLockScreen:v6];
    }
    else
    {
      v8 = +[_ATXGlobals sharedInstance];
      int v7 = [v8 allowBehavioralPredictionsOnLockscreen];
    }
    v9 = [v6 intent];
    v10 = objc_msgSend(v9, "_intents_bundleIdForDisplay");
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [v6 bundleId];
    }
    v13 = v12;

    int v14 = [*(id *)(a1 + 32) containsObject:v13];
    int v15 = [*(id *)(a1 + 40) containsObject:v13];
    uint64_t v16 = *(void *)(a1 + 56);
    if (v16) {
      int v17 = (*(uint64_t (**)(uint64_t, id, uint64_t))(v16 + 16))(v16, v18, a3);
    }
    else {
      int v17 = 1;
    }
    if (((v7 ^ 1 | v15 | v14) & 1) == 0 && v17) {
      [*(id *)(a1 + 48) addIndex:a3];
    }
  }
}

+ (id)indicesOfLockScreenActionsForActionPredictions:(id)a3
{
  v3 = [a1 indicesOfLockScreenActionsForActionPredictions:a3 criteria:0];
  return v3;
}

+ (unint64_t)_getPredictionConfidenceForActions:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = +[_ATXGlobals sharedInstance];
  v5 = [v3 firstObject];
  id v6 = [v5 predictedItem];
  int v7 = [v6 actionKey];

  v8 = [v3 firstObject];
  v9 = [v8 predictedItem];
  int v10 = [v9 isHeuristic];

  if (!v10)
  {
    id v12 = +[_ATXAppLaunchHistogramManager sharedInstance];
    v13 = [v12 histogramForLaunchType:14];

    v32[0] = v7;
    int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    [v13 totalLaunchesForBundleIds:v14];
    double v16 = v15;

    int v17 = [v4 actionExperienceHighConfidenceAppActionCountThreshold];
    int v18 = [v4 actionExperienceMediumConfidenceAppActionCountThreshold];
    v19 = [v3 firstObject];
    [v19 score];
    float v21 = v20;
    [v4 actionExperienceHighConfidenceThreshold];
    double v23 = v22;
    [v4 actionExperienceMediumConfidenceThreshold];
    unint64_t v11 = ATXActionExperienceForActions(v21, v16, v23, v17, v24, v18);

LABEL_6:
    goto LABEL_7;
  }
  Boolean keyExistsAndHasValidFormat = 0;
  if (!CFPreferencesGetAppBooleanValue(@"ForceHeuristicHighConfidence", (CFStringRef)*MEMORY[0x1E4F4B688], &keyExistsAndHasValidFormat))
  {
    v13 = [v3 firstObject];
    [v13 score];
    float v26 = v25;
    [v4 heuristicActionExperienceHighConfidenceThreshold];
    double v28 = v27;
    [v4 heuristicActionExperienceMediumConfidenceThreshold];
    unint64_t v11 = ATXActionExperienceForActions(v26, 0.0, v28, 0, v29, 0);
    goto LABEL_6;
  }
  unint64_t v11 = 1;
LABEL_7:

  return v11;
}

+ (void)indicesOfLockScreenActionsForActionPredictions:(os_log_t)log criteria:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Suppressing all lockscreen actions due to user preference.", v1, 2u);
}

+ (void)indicesOfLockScreenActionsForActionPredictions:(uint64_t)a3 criteria:(os_log_t)log .cold.2(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Filtered %lu/%lu predictions due to lockscreen blacklist.", buf, 0x16u);
}

@end