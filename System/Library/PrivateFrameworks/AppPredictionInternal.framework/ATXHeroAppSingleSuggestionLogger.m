@interface ATXHeroAppSingleSuggestionLogger
- (ATXHeroAppSingleSuggestionLogger)initWithTracker:(id)a3;
- (ATXPETEventTracker2Protocol)tracker;
- (NSMutableArray)negativeEventBuffer;
- (NSMutableArray)positiveEventBuffer;
- (id)_heroAppEngagementMetricWithBundleId:(id)a3 interactionType:(int)a4 consumerSubType:(id)a5;
- (void)_flushEventBuffer:(id)a3 numEventsToSample:(int64_t)a4 isNegative:(BOOL)a5;
- (void)_logHeroAppEngagementMetric:(id)a3;
- (void)flushEventBuffers;
- (void)handleSingleSuggestion:(id)a3;
- (void)setNegativeEventBuffer:(id)a3;
- (void)setPositiveEventBuffer:(id)a3;
- (void)setTracker:(id)a3;
@end

@implementation ATXHeroAppSingleSuggestionLogger

- (ATXHeroAppSingleSuggestionLogger)initWithTracker:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXHeroAppSingleSuggestionLogger;
  v6 = [(ATXHeroAppSingleSuggestionLogger *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tracker, a3);
    uint64_t v8 = objc_opt_new();
    positiveEventBuffer = v7->_positiveEventBuffer;
    v7->_positiveEventBuffer = (NSMutableArray *)v8;

    uint64_t v10 = objc_opt_new();
    negativeEventBuffer = v7->_negativeEventBuffer;
    v7->_negativeEventBuffer = (NSMutableArray *)v10;
  }
  return v7;
}

- (id)_heroAppEngagementMetricWithBundleId:(id)a3 interactionType:(int)a4 consumerSubType:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = a3;
  v9 = objc_opt_new();
  [v9 setBundleId:v8];

  [v9 setInteractionType:v5];
  [v9 setConsumerSubType:v7];

  return v9;
}

- (void)_logHeroAppEngagementMetric:(id)a3
{
  id v4 = a3;
  [(ATXPETEventTracker2Protocol *)self->_tracker trackScalarForMessage:v4];
  uint64_t v5 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(ATXHeroAppSingleSuggestionLogger *)(uint64_t)self _logHeroAppEngagementMetric:v5];
  }
}

- (void)handleSingleSuggestion:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 suggestion];
  v6 = [v5 bundleIdExecutableObject];

  if (v6
    && ([v4 feedbackMetadata], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    id v8 = (void *)MEMORY[0x1D25F6CC0]();
    v9 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v10 = objc_opt_class();
    v11 = [v4 feedbackMetadata];
    id v41 = 0;
    v12 = [v9 unarchivedObjectOfClass:v10 fromData:v11 error:&v41];
    objc_super v13 = v41;

    if (v13 || !v12)
    {
      v21 = __atxlog_handle_metrics();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v23 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v23);
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v4;
        *(_WORD *)&buf[22] = 2112;
        v43 = (uint64_t (*)(uint64_t, uint64_t))v13;
        _os_log_error_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_ERROR, "%@ - not logging because could not retrieve location from completed session: %@. Unarchive error: %@", buf, 0x20u);
      }
    }
    else
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v43 = __Block_byref_object_copy__28;
      v44 = __Block_byref_object_dispose__28;
      id v45 = (id)MEMORY[0x1E4F1CC28];
      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__28;
      v39 = __Block_byref_object_dispose__28;
      id v40 = (id)MEMORY[0x1E4F1CC28];
      uint64_t v31 = 0;
      v32 = &v31;
      uint64_t v33 = 0x2020000000;
      int v34 = 0;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __59__ATXHeroAppSingleSuggestionLogger_handleSingleSuggestion___block_invoke;
      v25[3] = &unk_1E68AE4B0;
      v29 = buf;
      v30 = &v31;
      v28 = &v35;
      v25[4] = self;
      id v14 = v6;
      id v26 = v14;
      id v27 = v12;
      [v4 enumerateShownAndEngagedSessionStatusesAndConsumerSubTypesWithBlock:v25];
      if ([(id)v36[5] isEqualToNumber:MEMORY[0x1E4F1CC38]])
      {
        v15 = [(ATXHeroAppSingleSuggestionLogger *)self _heroAppEngagementMetricWithBundleId:v14 interactionType:*((unsigned int *)v32 + 6) consumerSubType:@"SingleSuggestionAnyConsumerSubType"];
        [(ATXHeroAppSingleSuggestionLogger *)self _logHeroAppEngagementMetric:v15];
      }
      v16 = +[_ATXAppPredictor sharedInstance];
      v17 = [v16 cdnDownloaderTriggerManager];
      v18 = [v17 heroAppManager];
      v19 = [v18 heroFeedback];

      if ([*(id *)(*(void *)&buf[8] + 40) isEqualToNumber:MEMORY[0x1E4F1CC38]])
      {
        LODWORD(v20) = 1.0;
        [v19 addConfirmForHeroAppPredictionWithBundleId:v14 weight:v20];
      }
      else if ([(id)v36[5] isEqualToNumber:MEMORY[0x1E4F1CC38]])
      {
        LODWORD(v22) = 1.0;
        [v19 addRejectForHeroAppPredictionWithBundleId:v14 weight:v22];
      }

      _Block_object_dispose(&v31, 8);
      _Block_object_dispose(&v35, 8);

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    objc_super v13 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(ATXHeroAppSingleSuggestionLogger *)(uint64_t)self handleSingleSuggestion:v13];
    }
  }
}

void __59__ATXHeroAppSingleSuggestionLogger_handleSingleSuggestion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 == 2) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2 * (a3 == 3);
  }
  if (a3)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    uint64_t v9 = MEMORY[0x1E4F1CC38];
    *(void *)(v7 + 40) = MEMORY[0x1E4F1CC38];

    if (a3 == 2)
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
      v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
    if ((int)v3 > *(_DWORD *)(v12 + 24)) {
      *(_DWORD *)(v12 + 24) = v3;
    }
    objc_super v13 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    v15 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:a2];
    v16 = [v13 _heroAppEngagementMetricWithBundleId:v14 interactionType:v3 consumerSubType:v15];

    [*(id *)(a1 + 32) _logHeroAppEngagementMetric:v16];
    if (a2 <= 0x28)
    {
      if (((1 << a2) & 0x1B000000000) != 0)
      {
        uint64_t v17 = 3;
LABEL_16:
        v18 = [ATXAppOrClipLaunch alloc];
        uint64_t v19 = *(void *)(a1 + 40);
        [*(id *)(a1 + 48) coordinate];
        double v21 = v20;
        [*(id *)(a1 + 48) coordinate];
        double v22 = -[ATXAppOrClipLaunch initAppLaunchWithBundleId:launchReason:latitude:longitude:](v18, "initAppLaunchWithBundleId:launchReason:latitude:longitude:", v19, v17, v21);
        id v23 = [[ATXHeroAndClipSessionLogSampledEvent alloc] initFromLaunch:v22];
        v24 = __atxlog_handle_hero();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          __59__ATXHeroAppSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_3((uint64_t)v23, v24);
        }

        uint64_t v25 = 24;
        if (a3 == 2) {
          uint64_t v25 = 16;
        }
        [*(id *)(*(void *)(a1 + 32) + v25) addObject:v23];

LABEL_21:
        goto LABEL_22;
      }
      if (a2 == 9)
      {
        uint64_t v17 = 2;
        goto LABEL_16;
      }
    }
    double v22 = __atxlog_handle_hero();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __59__ATXHeroAppSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_2(a2, v22);
    }
    goto LABEL_21;
  }
  v16 = __atxlog_handle_hero();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    __59__ATXHeroAppSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_1(v16);
  }
LABEL_22:
}

- (void)_flushEventBuffer:(id)a3 numEventsToSample:(int64_t)a4 isNegative:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = +[ATXHeroAndClipEventSamplers defaultSampler];
  uint64_t v9 = [v8 sampleEvents:v7 numToSample:a4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v17 + 1) + 8 * v13) launch];
        +[ATXLaunchAndLocationHarvester logAppOrClipLaunch:v14 isNegativeSession:v5];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v11);
  }
  v15 = __atxlog_handle_hero();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = [v9 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v22 = v16;
    _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_INFO, "Session logged %lu hero app launch events.", buf, 0xCu);
  }

  [v7 removeAllObjects];
}

- (void)flushEventBuffers
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Flushing hero app session log positive event buffer", v1, 2u);
}

- (ATXPETEventTracker2Protocol)tracker
{
  return self->_tracker;
}

- (void)setTracker:(id)a3
{
}

- (NSMutableArray)positiveEventBuffer
{
  return self->_positiveEventBuffer;
}

- (void)setPositiveEventBuffer:(id)a3
{
}

- (NSMutableArray)negativeEventBuffer
{
  return self->_negativeEventBuffer;
}

- (void)setNegativeEventBuffer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeEventBuffer, 0);
  objc_storeStrong((id *)&self->_positiveEventBuffer, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
}

- (void)_logHeroAppEngagementMetric:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [a2 bundleId];
  id v8 = [a2 consumerSubType];
  uint64_t v9 = [a2 interactionType];
  if (v9 > 2)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v9);
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v10 = off_1E68AE4D0[(int)v9];
  }
  *(_DWORD *)buf = 138413058;
  id v12 = v6;
  __int16 v13 = 2112;
  uint64_t v14 = v7;
  __int16 v15 = 2112;
  uint64_t v16 = v8;
  __int16 v17 = 2112;
  long long v18 = v10;
  _os_log_debug_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBHeroAppEngagementTracker with bundleId: %@ consumerSubType: %@ interactionType: %@", buf, 0x2Au);
}

- (void)handleSingleSuggestion:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  id v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "%@ - not logging because invalid bundleId or invalid feedbackMetadata from completed session: %@", (uint8_t *)&v7, 0x16u);
}

void __59__ATXHeroAppSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Hero App Prediction that was not shown reached the feedback path.", v1, 2u);
}

void __59__ATXHeroAppSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_2(unsigned __int8 a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:a1];
  int v4 = 138412290;
  BOOL v5 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Unknown consumer subtype for Hero app received: %@", (uint8_t *)&v4, 0xCu);
}

void __59__ATXHeroAppSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "Adding event %@ to the hero app session log buffer", (uint8_t *)&v2, 0xCu);
}

@end