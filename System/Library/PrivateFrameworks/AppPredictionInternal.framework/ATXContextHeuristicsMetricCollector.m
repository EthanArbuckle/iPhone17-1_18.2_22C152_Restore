@interface ATXContextHeuristicsMetricCollector
- (id)lifetimeEngagementMetricsWithBiomeConfig:(id)a3;
- (id)lifetimeEngagementMetricsWithPublisher:(id)a3;
- (id)recentsMetricsWithBiomeConfig:(id)a3;
- (id)saveableBookmarkDictionaryFromTracker:(id)a3;
- (id)spotlightUIBookmark;
- (id)trackerFromBookmarkDictionary:(id)a3;
- (void)fillWeeklyStatisticsMetricWithSpotlightUIStream:(id)a3 biomeConfig:(id)a4;
- (void)postLifetimeEngagementMetrics;
- (void)postRecentsMetrics;
- (void)postWeeklyMetrics;
- (void)postZkwMetrics;
@end

@implementation ATXContextHeuristicsMetricCollector

- (void)postZkwMetrics
{
  [(ATXContextHeuristicsMetricCollector *)self postWeeklyMetrics];
  [(ATXContextHeuristicsMetricCollector *)self postLifetimeEngagementMetrics];
  [(ATXContextHeuristicsMetricCollector *)self postRecentsMetrics];
}

- (void)postWeeklyMetrics
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = (void *)CFPreferencesCopyAppValue(@"SuggestionsSpotlightZKWRecentsEnabled", @"com.apple.suggestions");
  v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 BOOLValue];
  }
  else {
    uint64_t v6 = 1;
  }

  [v3 setAreSpotlightRecentsEnabled:v6];
  v7 = (void *)CFPreferencesCopyAppValue(@"SuggestionsSpotlightZKWEnabled", @"com.apple.suggestions");
  v8 = v7;
  if (v7) {
    uint64_t v9 = [v7 BOOLValue];
  }
  else {
    uint64_t v9 = 1;
  }

  [v3 setAreSpotlightSuggestionsEnabled:v9];
  [(ATXContextHeuristicsMetricCollector *)self fillWeeklyStatisticsMetricWithSpotlightUIStream:v3 biomeConfig:0];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.spotlightui"];
  int v11 = [v10 BOOLForKey:@"SpotlightZKWExpanded"];
  int v12 = [MEMORY[0x1E4F93B08] isiPad];
  uint64_t v13 = 4;
  if (v12) {
    uint64_t v13 = 6;
  }
  uint64_t v14 = 8;
  if (v12) {
    uint64_t v14 = 12;
  }
  if (v11) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = v13;
  }
  [v3 setNumAppSuggestionsVisibleInSpotlight:v15];
  v16 = [MEMORY[0x1E4F4B348] sharedInstance];
  v17 = [v16 trialTreatmentId];
  [v3 setTrialTreatmentId:v17];

  v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v16, "trialDeploymentId"));
  v19 = [v18 stringValue];
  [v3 setTrialDeploymentId:v19];

  v20 = [v16 trialExperimentId];
  [v3 setTrialExperimentId:v20];

  v21 = getTrialAssets();
  v22 = [v21 trialTreatmentId];
  [v3 setAtxTrialTreatmentId:v22];

  v23 = [v21 trialExperimentId];
  [v3 setAtxTrialExperimentId:v23];

  v24 = [v21 trialDeploymentId];
  [v3 setAtxTrialDeploymentId:v24];

  v25 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = [v3 coreAnalyticsDictionary];
    int v27 = 138412290;
    v28 = v26;
    _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, "ZKW: Weekly metrics dict - %@", (uint8_t *)&v27, 0xCu);
  }
  [v3 logToCoreAnalytics];
}

- (void)postLifetimeEngagementMetrics
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F4B348] sharedInstance];
  v4 = getTrialAssets();
  v5 = [(ATXContextHeuristicsMetricCollector *)self lifetimeEngagementMetricsWithBiomeConfig:0];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v23;
    *(void *)&long long v7 = 138412290;
    long long v21 = v7;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
        int v12 = objc_msgSend(v3, "trialTreatmentId", v21);
        [v11 setTrialTreatmentId:v12];

        uint64_t v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "trialDeploymentId"));
        uint64_t v14 = [v13 stringValue];
        [v11 setTrialDeploymentId:v14];

        uint64_t v15 = [v3 trialExperimentId];
        [v11 setTrialExperimentId:v15];

        v16 = [v4 trialTreatmentId];
        [v11 setAtxTrialTreatmentId:v16];

        v17 = [v4 trialExperimentId];
        [v11 setAtxTrialExperimentId:v17];

        v18 = [v4 trialDeploymentId];
        [v11 setAtxTrialDeploymentId:v18];

        v19 = __atxlog_handle_metrics();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = [v11 coreAnalyticsDictionary];
          *(_DWORD *)buf = v21;
          int v27 = v20;
          _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, "ZKW: Lifetime engagement metric dict - %@", buf, 0xCu);
        }
        [v11 logToCoreAnalytics];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v8);
  }
}

- (void)postRecentsMetrics
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F4B348] sharedInstance];
  v4 = getTrialAssets();
  v5 = [(ATXContextHeuristicsMetricCollector *)self recentsMetricsWithBiomeConfig:0];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v23;
    *(void *)&long long v7 = 138412290;
    long long v21 = v7;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
        int v12 = objc_msgSend(v3, "trialTreatmentId", v21);
        [v11 setTrialTreatmentId:v12];

        uint64_t v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "trialDeploymentId"));
        uint64_t v14 = [v13 stringValue];
        [v11 setTrialDeploymentId:v14];

        uint64_t v15 = [v3 trialExperimentId];
        [v11 setTrialExperimentId:v15];

        v16 = [v4 trialTreatmentId];
        [v11 setAtxTrialTreatmentId:v16];

        v17 = [v4 trialExperimentId];
        [v11 setAtxTrialExperimentId:v17];

        v18 = [v4 trialDeploymentId];
        [v11 setAtxTrialDeploymentId:v18];

        v19 = __atxlog_handle_metrics();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = [v11 coreAnalyticsDictionary];
          *(_DWORD *)buf = v21;
          int v27 = v20;
          _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, "ZKW: Recents metric dict - %@", buf, 0xCu);
        }
        [v11 logToCoreAnalytics];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v8);
  }
}

- (void)fillWeeklyStatisticsMetricWithSpotlightUIStream:(id)a3 biomeConfig:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F939A8];
  id v7 = a4;
  uint64_t v8 = (void *)[[v6 alloc] initWithStoreConfig:v7];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-604800.0];
  [v9 timeIntervalSinceReferenceDate];
  double v11 = v10;

  int v12 = [v8 publisherFromStartTime:v11];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __99__ATXContextHeuristicsMetricCollector_fillWeeklyStatisticsMetricWithSpotlightUIStream_biomeConfig___block_invoke_2;
  v15[3] = &unk_1E68ABB70;
  id v16 = v5;
  id v13 = v5;
  id v14 = (id)[v12 sinkWithCompletion:&__block_literal_global_151 receiveInput:v15];
}

void __99__ATXContextHeuristicsMetricCollector_fillWeeklyStatisticsMetricWithSpotlightUIStream_biomeConfig___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  if (!v3)
  {
    v4 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __99__ATXContextHeuristicsMetricCollector_fillWeeklyStatisticsMetricWithSpotlightUIStream_biomeConfig___block_invoke_2_cold_2();
    }
  }
  id v5 = [v3 suggestionType];
  switch([v3 eventType])
  {
    case 0:
      uint64_t v6 = __atxlog_handle_metrics();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __99__ATXContextHeuristicsMetricCollector_fillWeeklyStatisticsMetricWithSpotlightUIStream_biomeConfig___block_invoke_2_cold_1();
      }

      break;
    case 4:
      if ([v5 isEqualToString:@"app"])
      {
        objc_msgSend(*(id *)(a1 + 32), "setNumSpotlightAppSuggestionTaps:", objc_msgSend(*(id *)(a1 + 32), "numSpotlightAppSuggestionTaps") + 1);
      }
      else
      {
        uint64_t v9 = [v3 suggestionType];
        int v10 = [v9 isEqualToString:@"action"];

        if (v10)
        {
          objc_msgSend(*(id *)(a1 + 32), "setNumSpotlightActionSuggestionTaps:", objc_msgSend(*(id *)(a1 + 32), "numSpotlightActionSuggestionTaps") + 1);
        }
        else
        {
          double v11 = [v3 suggestionType];
          int v12 = [v11 isEqualToString:@"recent"];

          if (v12) {
            objc_msgSend(*(id *)(a1 + 32), "setNumRecentsTaps:", objc_msgSend(*(id *)(a1 + 32), "numRecentsTaps") + 1);
          }
        }
      }
      break;
    case 5:
      id v7 = [v3 suggestionType];
      int v8 = [v7 isEqualToString:@"app"];

      if (v8) {
        objc_msgSend(*(id *)(a1 + 32), "setNumSpotlightSearchAppTaps:", objc_msgSend(*(id *)(a1 + 32), "numSpotlightSearchAppTaps") + 1);
      }
      break;
    case 6:
      objc_msgSend(*(id *)(a1 + 32), "setNumSpotlightViews:", objc_msgSend(*(id *)(a1 + 32), "numSpotlightViews") + 1);
      break;
    default:
      break;
  }
}

- (id)lifetimeEngagementMetricsWithBiomeConfig:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F939A8];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithStoreConfig:v5];

  id v7 = [v6 publisherFromStartTime:0.0];
  int v8 = [(ATXContextHeuristicsMetricCollector *)self lifetimeEngagementMetricsWithPublisher:v7];

  return v8;
}

- (id)lifetimeEngagementMetricsWithPublisher:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x3032000000;
  int v27 = __Block_byref_object_copy__69;
  v28 = __Block_byref_object_dispose__69;
  id v29 = (id)objc_opt_new();
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__69;
  long long v22 = __Block_byref_object_dispose__69;
  id v23 = [(ATXContextHeuristicsMetricCollector *)self spotlightUIBookmark];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__69;
  v16[4] = __Block_byref_object_dispose__69;
  id v5 = [(id)v19[5] metadata];
  id v17 = [(ATXContextHeuristicsMetricCollector *)self trackerFromBookmarkDictionary:v5];

  uint64_t v6 = [(id)v19[5] bookmark];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke;
  v15[3] = &unk_1E68B3728;
  void v15[4] = self;
  v15[5] = &v18;
  v15[6] = v16;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2;
  v14[3] = &unk_1E68AE200;
  v14[4] = v16;
  v14[5] = &v24;
  id v7 = (id)[v4 sinkWithBookmark:v6 completion:v15 receiveInput:v14];

  int v8 = (void *)v19[5];
  id v13 = 0;
  [v8 saveBookmarkWithError:&v13];
  id v9 = v13;
  if (v9)
  {
    int v10 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXContextHeuristicsMetricCollector lifetimeEngagementMetricsWithPublisher:]();
    }
  }
  id v11 = (id)v25[5];

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v11;
}

void __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setBookmark:");
  id v2 = [*(id *)(a1 + 32) saveableBookmarkDictionaryFromTracker:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setMetadata:v2];
}

void __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  if (!v3)
  {
    id v4 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __99__ATXContextHeuristicsMetricCollector_fillWeeklyStatisticsMetricWithSpotlightUIStream_biomeConfig___block_invoke_2_cold_2();
    }
  }
  id v5 = [v3 suggestionType];
  int v6 = [v5 isEqualToString:@"action"];

  if (v6)
  {
    id v7 = [v3 suggestionUniqueId];
    if (v7)
    {
      switch([v3 eventType])
      {
        case 0:
        case 5:
        case 6:
          int v8 = __atxlog_handle_metrics();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_6(v3);
          }
          goto LABEL_12;
        case 1:
          id v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v7];

          if (v9)
          {
            int v10 = __atxlog_handle_metrics();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
              __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_2(v3, v10);
            }
          }
          id v11 = objc_opt_new();
          int v12 = [v3 suggestionSubtype];
          [v11 setActionId:v12];

          id v13 = [v3 suggestionContext];
          [v11 setContextType:v13];

          [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v11 forKeyedSubscript:v7];
          break;
        case 2:
          id v14 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v7];

          if (v14)
          {
            uint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            id v16 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v7];
            [v15 addObject:v16];
          }
          else
          {
            id v16 = __atxlog_handle_metrics();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_3();
            }
          }

          [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) removeObjectForKey:v7];
          break;
        case 3:
          id v17 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v7];

          if (v17)
          {
            int v8 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v7];
            [v8 setNumShown:[v8 numShown] + 1];
          }
          else
          {
            int v8 = __atxlog_handle_metrics();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
              __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_4();
            }
          }
          goto LABEL_12;
        case 4:
          uint64_t v18 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v7];

          if (v18)
          {
            int v8 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v7];
            [v8 setNumEngaged:[v8 numEngaged] + 1];
          }
          else
          {
            int v8 = __atxlog_handle_metrics();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
              __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_5();
            }
          }
          goto LABEL_12;
        default:
          break;
      }
    }
    else
    {
      int v8 = __atxlog_handle_metrics();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_1();
      }
LABEL_12:
    }
  }
}

- (id)spotlightUIBookmark
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB10]);
  v3 = [MEMORY[0x1E4F4B650] bookmarksPathFile:@"spotlightUILifetime"];
  id v4 = (void *)[v2 initFileURLWithPath:v3];

  id v5 = (void *)MEMORY[0x1E4F4B618];
  int v6 = [NSNumber numberWithUnsignedInt:1];
  id v7 = [v5 bookmarkFromURLPath:v4 maxFileSize:1000000 versionNumber:v6];

  if (!v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F4B618]);
    id v9 = [NSNumber numberWithUnsignedInt:1];
    id v7 = (void *)[v8 initWithURLPath:v4 versionNumber:v9 bookmark:0 metadata:0];
  }
  return v7;
}

- (id)saveableBookmarkDictionaryFromTracker:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v18 = (id)objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v9 = [v4 objectForKeyedSubscript:v8];
        int v10 = NSString;
        id v11 = [v9 actionId];
        int v12 = [v9 contextType];
        id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "numShown"));
        id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "numEngaged"));
        uint64_t v15 = [v10 stringWithFormat:@"%@:%@:%@:%@", v11, v12, v13, v14];
        [v18 setObject:v15 forKeyedSubscript:v8];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  return v18;
}

- (id)trackerFromBookmarkDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v11 = objc_msgSend(v5, "objectForKeyedSubscript:", v10, (void)v20);
        int v12 = [v11 componentsSeparatedByString:@":"];

        if ([v12 count] != 4)
        {
          id v18 = __atxlog_handle_metrics();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[ATXContextHeuristicsMetricCollector trackerFromBookmarkDictionary:](v12);
          }

          goto LABEL_13;
        }
        id v13 = objc_opt_new();
        id v14 = [v12 objectAtIndexedSubscript:0];
        [v13 setActionId:v14];

        uint64_t v15 = [v12 objectAtIndexedSubscript:1];
        [v13 setContextType:v15];

        id v16 = [v12 objectAtIndexedSubscript:2];
        objc_msgSend(v13, "setNumShown:", objc_msgSend(v16, "integerValue"));

        uint64_t v17 = [v12 objectAtIndexedSubscript:3];
        objc_msgSend(v13, "setNumEngaged:", objc_msgSend(v17, "integerValue"));

        [v4 setObject:v13 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v4;
}

- (id)recentsMetricsWithBiomeConfig:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F939A8]) initWithStoreConfig:v3];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-2419200.0];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__69;
  uint64_t v26 = __Block_byref_object_dispose__69;
  id v27 = (id)objc_opt_new();
  uint64_t v8 = [v4 publisherFromStartTime:v7];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__ATXContextHeuristicsMetricCollector_recentsMetricsWithBiomeConfig___block_invoke_2;
  v21[3] = &unk_1E68AC690;
  v21[4] = &v22;
  id v9 = (id)[v8 sinkWithCompletion:&__block_literal_global_51 receiveInput:v21];

  uint64_t v10 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = (id)v23[5];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = objc_msgSend((id)v23[5], "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        [v10 addObject:v15];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v28 count:16];
    }
    while (v12);
  }

  _Block_object_dispose(&v22, 8);
  return v10;
}

void __69__ATXContextHeuristicsMetricCollector_recentsMetricsWithBiomeConfig___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBody];
  if (!v4)
  {
    id v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __99__ATXContextHeuristicsMetricCollector_fillWeeklyStatisticsMetricWithSpotlightUIStream_biomeConfig___block_invoke_2_cold_2();
    }
  }
  double v6 = [v4 suggestionType];
  int v7 = [v6 isEqualToString:@"recent"];

  if (!v7) {
    goto LABEL_19;
  }
  uint64_t v8 = [v4 eventType];
  switch(v8)
  {
    case 4:
      id v9 = [v4 suggestionUniqueId];
      uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v9];

      if (!v10)
      {
        id v11 = objc_opt_new();
        uint64_t v12 = [v4 suggestionSubtype];
        [v11 setRecentType:v12];

        uint64_t v13 = [MEMORY[0x1E4F1C9C8] now];
        [v13 timeIntervalSinceReferenceDate];
        double v15 = v14;
        [v3 timestamp];
        [v11 setRecentAge:(unint64_t)((v15 - v16) / 604800.0 + 1.0)];

        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v11 forKeyedSubscript:v9];
      }
      long long v17 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v9];
      objc_msgSend(v17, "setNumEngaged:", objc_msgSend(v17, "numEngaged") + 1);
      goto LABEL_17;
    case 3:
      id v9 = [v4 suggestionUniqueId];
      long long v18 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v9];

      if (!v18)
      {
        long long v19 = objc_opt_new();
        long long v20 = [v4 suggestionSubtype];
        [v19 setRecentType:v20];

        long long v21 = [MEMORY[0x1E4F1C9C8] now];
        [v21 timeIntervalSinceReferenceDate];
        double v23 = v22;
        [v3 timestamp];
        [v19 setRecentAge:(unint64_t)((v23 - v24) / 604800.0 + 1.0)];

        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v19 forKeyedSubscript:v9];
      }
      long long v17 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v9];
      objc_msgSend(v17, "setNumSearched:", objc_msgSend(v17, "numSearched") + 1);
LABEL_17:

LABEL_18:
      break;
    case 0:
      id v9 = __atxlog_handle_metrics();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __99__ATXContextHeuristicsMetricCollector_fillWeeklyStatisticsMetricWithSpotlightUIStream_biomeConfig___block_invoke_2_cold_1();
      }
      goto LABEL_18;
  }
LABEL_19:
}

void __99__ATXContextHeuristicsMetricCollector_fillWeeklyStatisticsMetricWithSpotlightUIStream_biomeConfig___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Unknown UI event type received", v2, v3, v4, v5, v6);
}

void __99__ATXContextHeuristicsMetricCollector_fillWeeklyStatisticsMetricWithSpotlightUIStream_biomeConfig___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "ZKW: ui event is nil", v2, v3, v4, v5, v6);
}

- (void)lifetimeEngagementMetricsWithPublisher:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "ZKW: Unable to save Spotlight UI bookmark due to : %@", v1, 0xCu);
}

void __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ZKW: nil identifier received", v2, v3, v4, v5, v6);
}

void __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 suggestionSubtype];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "ZKW: Event with same identifier added to cache again. Action id: %@", v4, 0xCu);
}

void __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ZKW: Item removed from cache, but metrics event does not exist.", v2, v3, v4, v5, v6);
}

void __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ZKW: Item shown in zkw, but metrics event does not exist.", v2, v3, v4, v5, v6);
}

void __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ZKW: Item engaged in zkw, but metrics event does not exist.", v2, v3, v4, v5, v6);
}

void __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_6(void *a1)
{
  [a1 eventType];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v1, v2, "ZKW: Incorrect UI event type for actions: %lu", v3, v4, v5, v6, v7);
}

- (void)trackerFromBookmarkDictionary:(void *)a1 .cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v1, v2, "Incorrect size from bookmark dictionary: %lu", v3, v4, v5, v6, v7);
}

@end