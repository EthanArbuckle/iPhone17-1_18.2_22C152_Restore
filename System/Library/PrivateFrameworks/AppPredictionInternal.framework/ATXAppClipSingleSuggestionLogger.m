@interface ATXAppClipSingleSuggestionLogger
- (ATXAppClipSingleSuggestionLogger)initWithTracker:(id)a3;
- (ATXPETEventTracker2Protocol)tracker;
- (NSMutableArray)negativeEventBuffer;
- (NSMutableArray)positiveEventBuffer;
- (id)_appClipEngagementMetricWithBundleId:(id)a3 urlHash:(id)a4 interactionType:(int)a5 consumerSubType:(id)a6;
- (void)_flushEventBuffer:(id)a3 numEventsToSample:(int64_t)a4 isNegative:(BOOL)a5;
- (void)_logAppClipEngagementMetric:(id)a3;
- (void)flushEventBuffers;
- (void)handleSingleSuggestion:(id)a3;
- (void)setNegativeEventBuffer:(id)a3;
- (void)setPositiveEventBuffer:(id)a3;
- (void)setTracker:(id)a3;
@end

@implementation ATXAppClipSingleSuggestionLogger

- (ATXAppClipSingleSuggestionLogger)initWithTracker:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXAppClipSingleSuggestionLogger;
  v6 = [(ATXAppClipSingleSuggestionLogger *)&v13 init];
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

- (id)_appClipEngagementMetricWithBundleId:(id)a3 urlHash:(id)a4 interactionType:(int)a5 consumerSubType:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_opt_new();
  [v12 setBundleId:v11];

  [v12 setUrlHash:v10];
  [v12 setInteractionType:v6];
  [v12 setConsumerSubType:v9];

  return v12;
}

- (void)_logAppClipEngagementMetric:(id)a3
{
  id v4 = a3;
  [(ATXPETEventTracker2Protocol *)self->_tracker trackScalarForMessage:v4];
  id v5 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(ATXAppClipSingleSuggestionLogger *)(uint64_t)self _logAppClipEngagementMetric:v5];
  }
}

- (void)handleSingleSuggestion:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v4 suggestion];
  id v9 = [v8 executableSpecification];
  id v10 = [v9 executable];
  id v54 = 0;
  id v11 = [v6 unarchivedObjectOfClass:v7 fromData:v10 error:&v54];
  v12 = (uint64_t (*)(uint64_t, uint64_t))v54;

  if (v12 || !v11)
  {
    v19 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v28 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v28);
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v29;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      *(_WORD *)&buf[22] = 2112;
      v56 = v12;
      _os_log_error_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_ERROR, "%@ - not logging because could not retrieve bundleId from completed session: %@. Unarchive error: %@", buf, 0x20u);
    }
  }
  else
  {
    objc_super v13 = [v11 bundleId];
    v14 = [v11 urlHash];
    [v11 latitudeAtPredictionTime];
    uint64_t v16 = v15;
    [v11 longitudeAtPredictionTime];
    uint64_t v18 = v17;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v56 = __Block_byref_object_copy__10;
    v57 = __Block_byref_object_dispose__10;
    id v58 = (id)MEMORY[0x1E4F1CC28];
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__10;
    v52 = __Block_byref_object_dispose__10;
    id v53 = (id)MEMORY[0x1E4F1CC28];
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    int v47 = 0;
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __59__ATXAppClipSingleSuggestionLogger_handleSingleSuggestion___block_invoke;
    v34 = &unk_1E68AD100;
    v39 = &v48;
    v40 = buf;
    v19 = v13;
    v35 = v19;
    id v20 = v14;
    uint64_t v42 = v16;
    uint64_t v43 = v18;
    id v36 = v20;
    v37 = self;
    id v21 = v11;
    id v38 = v21;
    v41 = &v44;
    [v4 enumerateShownAndEngagedSessionStatusesAndConsumerSubTypesWithBlock:&v31];
    if (objc_msgSend((id)v49[5], "isEqualToNumber:", MEMORY[0x1E4F1CC38], v31, v32, v33, v34))
    {
      v22 = [(ATXAppClipSingleSuggestionLogger *)self _appClipEngagementMetricWithBundleId:v19 urlHash:v20 interactionType:*((unsigned int *)v45 + 6) consumerSubType:@"SingleSuggestionAnyConsumerSubType"];
      [(ATXAppClipSingleSuggestionLogger *)self _logAppClipEngagementMetric:v22];
    }
    v23 = +[_ATXAppPredictor sharedInstance];
    v24 = [v23 cdnDownloaderTriggerManager];
    v25 = [v24 heroClipManager];
    v26 = [v25 feedback];

    if ([*(id *)(*(void *)&buf[8] + 40) isEqualToNumber:MEMORY[0x1E4F1CC38]])
    {
      LODWORD(v27) = 1.0;
      [v26 addConfirmForAppClipWithHeroAppPrediction:v21 weight:v27];
    }
    else if ([(id)v49[5] isEqualToNumber:MEMORY[0x1E4F1CC38]])
    {
      LODWORD(v30) = 1.0;
      [v26 addRejectForAppClipWithHeroAppPrediction:v21 weight:v30];
    }

    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v48, 8);

    _Block_object_dispose(buf, 8);
  }
}

void __59__ATXAppClipSingleSuggestionLogger_handleSingleSuggestion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 21)
  {
    uint64_t v6 = 2;
    if (a3) {
      goto LABEL_5;
    }
LABEL_25:
    v22 = __atxlog_handle_hero();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __59__ATXAppClipSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_2(v22);
    }
    goto LABEL_29;
  }
  if (a2 == 36 || a2 == 39)
  {
    uint64_t v6 = 3;
    if (a3)
    {
LABEL_5:
      uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      uint64_t v9 = MEMORY[0x1E4F1CC38];
      *(void *)(v7 + 40) = MEMORY[0x1E4F1CC38];

      if (a3 == 2)
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
        id v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;
      }
      if (!*(void *)(a1 + 32)
        || !*(void *)(a1 + 40)
        || *(double *)(a1 + 88) == *MEMORY[0x1E4F67E80]
        || *(double *)(a1 + 96) == *MEMORY[0x1E4F67E80])
      {
        v12 = __atxlog_handle_hero();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          __59__ATXAppClipSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_3(a1, v12);
        }
      }
      else
      {
        v12 = [[ATXAppOrClipLaunch alloc] initAppClipLaunchWithBundleId:*(void *)(a1 + 32) urlHash:*(void *)(a1 + 40) launchReason:v6 latitude:*(double *)(a1 + 88) longitude:*(double *)(a1 + 96)];
        id v13 = [[ATXHeroAndClipSessionLogSampledEvent alloc] initFromLaunch:v12];
        v14 = __atxlog_handle_hero();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          __59__ATXAppClipSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_4((uint64_t)v13, v14);
        }

        uint64_t v15 = 16;
        if (((a3 - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0) {
          uint64_t v15 = 24;
        }
        [*(id *)(*(void *)(a1 + 48) + v15) addObject:v13];
      }
      if (a3 == 2) {
        uint64_t v16 = 1;
      }
      else {
        uint64_t v16 = 2 * (a3 == 3);
      }
      uint64_t v17 = *(void *)(*(void *)(a1 + 80) + 8);
      if ((int)v16 > *(_DWORD *)(v17 + 24)) {
        *(_DWORD *)(v17 + 24) = v16;
      }
      uint64_t v19 = *(void *)(a1 + 40);
      uint64_t v18 = *(void **)(a1 + 48);
      uint64_t v20 = *(void *)(a1 + 32);
      id v21 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:a2];
      v22 = [v18 _appClipEngagementMetricWithBundleId:v20 urlHash:v19 interactionType:v16 consumerSubType:v21];

      [*(id *)(a1 + 48) _logAppClipEngagementMetric:v22];
      goto LABEL_29;
    }
    goto LABEL_25;
  }
  v22 = __atxlog_handle_hero();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    __59__ATXAppClipSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_1(a2, v22);
  }
LABEL_29:
}

- (void)_flushEventBuffer:(id)a3 numEventsToSample:(int64_t)a4 isNegative:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = +[ATXHeroAndClipEventSamplers defaultSampler];
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
        v14 = [*(id *)(*((void *)&v17 + 1) + 8 * v13) launch];
        +[ATXLaunchAndLocationHarvester logAppOrClipLaunch:v14 isNegativeSession:v5];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v11);
  }
  uint64_t v15 = __atxlog_handle_hero();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = [v9 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v22 = v16;
    _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_INFO, "Session logged %lu app clip launch events.", buf, 0xCu);
  }

  [v7 removeAllObjects];
}

- (void)flushEventBuffers
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Flushing app clip session log positive event buffer", v1, 2u);
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

- (void)_logAppClipEngagementMetric:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [a2 bundleId];
  uint64_t v8 = [a2 urlHash];
  uint64_t v9 = [a2 consumerSubType];
  uint64_t v10 = [a2 interactionType];
  if (v10 > 2)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v11 = off_1E68AD120[(int)v10];
  }
  *(_DWORD *)buf = 138413314;
  id v13 = v6;
  __int16 v14 = 2112;
  uint64_t v15 = v7;
  __int16 v16 = 2112;
  long long v17 = v8;
  __int16 v18 = 2112;
  long long v19 = v9;
  __int16 v20 = 2112;
  id v21 = v11;
  _os_log_debug_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBAppClipSessionEngagementTracker with bundleId: %@ urlHash: %@ consumerSubType: %@ interactionType: %@", buf, 0x34u);
}

void __59__ATXAppClipSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_1(unsigned __int8 a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:a1];
  int v4 = 138412290;
  BOOL v5 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Unknown consumer subtype for Location Based Dimsum received: %@", (uint8_t *)&v4, 0xCu);
}

void __59__ATXAppClipSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "App Clip Prediction that was not shown reached the feedback path.", v1, 2u);
}

void __59__ATXAppClipSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "BundleId or URL Hash or latitudeAtPredictionTime or longitudeAtPredictionTime missing while trying to log session for App Clip Prediction: %@", (uint8_t *)&v3, 0xCu);
}

void __59__ATXAppClipSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "Adding event %@ to the app clip session log buffer", (uint8_t *)&v2, 0xCu);
}

@end