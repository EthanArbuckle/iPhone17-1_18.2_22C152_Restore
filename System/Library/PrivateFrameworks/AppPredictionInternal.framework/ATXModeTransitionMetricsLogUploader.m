@interface ATXModeTransitionMetricsLogUploader
- (ATXModeTransitionMetricsLogUploader)init;
- (ATXModeTransitionMetricsLogUploader)initWithComputedModeStream:(id)a3 inferredModeStream:(id)a4;
- (BOOL)_previousModeEndEvent:(id)a3 isContiguousWithModeStartEvent:(id)a4;
- (id)_modeTransitionBookmark;
- (id)_timeBasedMergedPublisher;
- (id)matchingInferredModeEvent:(id)a3 inferredModeEvents:(id)a4;
- (id)processInferredModeEvents:(id)a3 beforeTimestamp:(double)a4;
- (void)_logModeTransitionMetricWithPreviousModeStart:(id)a3 previousModeEnd:(id)a4 currentModeStart:(id)a5 matchingPreviousInferredModeEvent:(id)a6 matchingCurrentInferredModeEvent:(id)a7;
- (void)_logWithPreviousInferredModeEvent:(id)a3 currentInferredModeEvent:(id)a4 withDuration:(id)a5;
- (void)_populateInferredModeFieldsOnTheModeTransitionMetric:(id)a3 withPreviousInferredModeEvent:(id)a4 currentInferredModeEvent:(id)a5 duration:(id)a6;
- (void)uploadLogsToCoreAnalyticsWithXPCActivity:(id)a3;
@end

@implementation ATXModeTransitionMetricsLogUploader

- (ATXModeTransitionMetricsLogUploader)init
{
  v3 = BiomeLibrary();
  v4 = [v3 UserFocus];
  v5 = [v4 ComputedMode];
  v6 = BiomeLibrary();
  v7 = [v6 UserFocus];
  v8 = [v7 InferredMode];
  v9 = [(ATXModeTransitionMetricsLogUploader *)self initWithComputedModeStream:v5 inferredModeStream:v8];

  return v9;
}

- (ATXModeTransitionMetricsLogUploader)initWithComputedModeStream:(id)a3 inferredModeStream:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXModeTransitionMetricsLogUploader;
  v9 = [(ATXModeTransitionMetricsLogUploader *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_computedModeStream, a3);
    objc_storeStrong((id *)&v10->_inferredModeStream, a4);
    uint64_t v11 = [MEMORY[0x1E4F4AF78] sharedInstance];
    client = v10->_client;
    v10->_client = (ATXDNDModeConfigurationClient *)v11;

    uint64_t v13 = [(ATXDNDModeConfigurationClient *)v10->_client getAllModeConfigurationsWithoutCache];
    modeConfigurations = v10->_modeConfigurations;
    v10->_modeConfigurations = (NSDictionary *)v13;
  }
  return v10;
}

- (void)uploadLogsToCoreAnalyticsWithXPCActivity:(id)a3
{
  id v4 = a3;
  v5 = [(ATXModeTransitionMetricsLogUploader *)self _timeBasedMergedPublisher];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__2;
  v32 = __Block_byref_object_dispose__2;
  id v33 = (id)objc_opt_new();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__2;
  v26[4] = __Block_byref_object_dispose__2;
  id v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__2;
  v24[4] = __Block_byref_object_dispose__2;
  id v25 = 0;
  v6 = [(ATXModeTransitionMetricsLogUploader *)self _modeTransitionBookmark];
  id v7 = [v6 bookmark];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __80__ATXModeTransitionMetricsLogUploader_uploadLogsToCoreAnalyticsWithXPCActivity___block_invoke;
  v22[3] = &unk_1E68ABA68;
  id v8 = v6;
  id v23 = v8;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__ATXModeTransitionMetricsLogUploader_uploadLogsToCoreAnalyticsWithXPCActivity___block_invoke_2;
  v17[3] = &unk_1E68ABA90;
  v19 = v26;
  v20 = v24;
  v17[4] = self;
  v21 = &v28;
  id v9 = v4;
  id v18 = v9;
  id v10 = (id)[v5 drivableSinkWithBookmark:v7 completion:v22 shouldContinue:v17];

  uint64_t v11 = v29[5];
  v12 = [MEMORY[0x1E4F1C9C8] now];
  [v12 timeIntervalSinceReferenceDate];
  id v13 = -[ATXModeTransitionMetricsLogUploader processInferredModeEvents:beforeTimestamp:](self, "processInferredModeEvents:beforeTimestamp:", v11);

  id v16 = 0;
  [v8 saveBookmarkWithError:&v16];
  id v14 = v16;
  if (v14)
  {
    v15 = __atxlog_handle_modes();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ATXModeTransitionMetricsLogUploader uploadLogsToCoreAnalyticsWithXPCActivity:]((uint64_t)v14, v15);
    }
  }
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);
}

uint64_t __80__ATXModeTransitionMetricsLogUploader_uploadLogsToCoreAnalyticsWithXPCActivity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBookmark:");
}

uint64_t __80__ATXModeTransitionMetricsLogUploader_uploadLogsToCoreAnalyticsWithXPCActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  v5 = [v4 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v7 = [v4 eventBody];
  id v8 = v7;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    char v9 = objc_opt_isKindOfClass();

    if (v9) {
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v4];
    }
    goto LABEL_18;
  }
  if (!v7)
  {
LABEL_21:

    uint64_t v27 = 1;
    goto LABEL_22;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    goto LABEL_25;
  }
  char v10 = [v7 starting];
  uint64_t v11 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v10)
  {
LABEL_20:
    objc_storeStrong(v11, a2);
    goto LABEL_21;
  }
  if (*v11)
  {
LABEL_25:
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) || [v8 starting]) {
      goto LABEL_11;
    }
    uint64_t v11 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    goto LABEL_20;
  }
LABEL_11:
  v12 = objc_msgSend(*(id *)(a1 + 32), "matchingInferredModeEvent:inferredModeEvents:");
  if (v12) {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) removeObject:v12];
  }
  id v13 = (void *)MEMORY[0x1E4F1CA48];
  id v14 = *(void **)(a1 + 32);
  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) timestamp];
  id v16 = objc_msgSend(v14, "processInferredModeEvents:beforeTimestamp:", v15);
  uint64_t v17 = [v13 arrayWithArray:v16];
  uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
  v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    && *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    && [v8 starting])
  {
    v29 = [*(id *)(a1 + 32) matchingInferredModeEvent:v4 inferredModeEvents:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    v20 = *(void **)(a1 + 32);
    uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v23 = [v12 eventBody];
    v24 = [v29 eventBody];
    [v20 _logModeTransitionMetricWithPreviousModeStart:v21 previousModeEnd:v22 currentModeStart:v4 matchingPreviousInferredModeEvent:v23 matchingCurrentInferredModeEvent:v24];

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
    v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = 0;
  }
LABEL_18:
  uint64_t v27 = [*(id *)(a1 + 40) didDefer] ^ 1;
LABEL_22:

  return v27;
}

- (id)matchingInferredModeEvent:(id)a3 inferredModeEvents:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 eventBody];
  [v7 semanticType];
  int v8 = BMUserFocusInferredModeTypeFromBMUserFocusModeComputedSemanticType();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "eventBody", (void)v21);
        if ([v15 isStart])
        {
          if ([v15 modeType] == v8)
          {
            [v5 timestamp];
            double v17 = v16;
            [v14 timestamp];
            if (v17 - v18 <= 1.0 && [v7 updateReason] == 3)
            {
              id v19 = v14;

              goto LABEL_14;
            }
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v19 = 0;
LABEL_14:

  return v19;
}

- (id)processInferredModeEvents:(id)a3 beforeTimestamp:(double)a4
{
  id v6 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__2;
  v12[4] = __Block_byref_object_dispose__2;
  id v13 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__2;
  v10[4] = __Block_byref_object_dispose__2;
  id v11 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__ATXModeTransitionMetricsLogUploader_processInferredModeEvents_beforeTimestamp___block_invoke;
  v9[3] = &unk_1E68ABAB8;
  *(double *)&v9[7] = a4;
  v9[5] = v12;
  v9[6] = v10;
  v9[4] = self;
  id v7 = objc_msgSend(v6, "_pas_filteredArrayWithTest:", v9);
  _Block_object_dispose(v10, 8);

  _Block_object_dispose(v12, 8);
  return v7;
}

BOOL __81__ATXModeTransitionMetricsLogUploader_processInferredModeEvents_beforeTimestamp___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = [v4 eventBody];
  [v4 timestamp];
  double v7 = v6;
  double v8 = *(double *)(a1 + 56);
  if (v6 < v8)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      int v20 = [v5 isStart];
      uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
      if (v20)
      {
        id v22 = v4;
        double v17 = *(void **)(v21 + 40);
        *(void *)(v21 + 40) = v22;
        goto LABEL_16;
      }
      if (!*(void *)(v21 + 40)) {
        goto LABEL_17;
      }
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      if (([v5 isStart] & 1) == 0)
      {
        uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
        id v24 = v4;
        double v17 = *(void **)(v23 + 40);
        *(void *)(v23 + 40) = v24;
        goto LABEL_16;
      }
      if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
        goto LABEL_17;
      }
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      if ([v5 isStart])
      {
        id v9 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) eventBody];
        int v10 = [v9 modeType];
        id v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) eventBody];
        int v12 = [v11 modeType];

        if (v10 == v12)
        {
          id v13 = NSNumber;
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) timestamp];
          double v15 = v14;
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) timestamp];
          double v17 = [v13 numberWithDouble:v15 - v16];
          [*(id *)(a1 + 32) _logWithPreviousInferredModeEvent:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) currentInferredModeEvent:v4 withDuration:v17];
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
          uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
          id v19 = *(void **)(v18 + 40);
          *(void *)(v18 + 40) = 0;

LABEL_16:
        }
      }
    }
  }
LABEL_17:

  return v7 >= v8;
}

- (void)_logWithPreviousInferredModeEvent:(id)a3 currentInferredModeEvent:(id)a4 withDuration:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_opt_new();
  int v12 = [v10 eventBody];

  id v13 = [v9 eventBody];

  [(ATXModeTransitionMetricsLogUploader *)self _populateInferredModeFieldsOnTheModeTransitionMetric:v11 withPreviousInferredModeEvent:v12 currentInferredModeEvent:v13 duration:v8];
  double v14 = __atxlog_handle_modes();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = [v11 coreAnalyticsDictionary];
    int v16 = 138412290;
    double v17 = v15;
    _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "ATXModeTransitionMetricsLogUploader: Uploading inferred mode metric to CA: %@", (uint8_t *)&v16, 0xCu);
  }
  [v11 logToCoreAnalytics];
}

- (void)_populateInferredModeFieldsOnTheModeTransitionMetric:(id)a3 withPreviousInferredModeEvent:(id)a4 currentInferredModeEvent:(id)a5 duration:(id)a6
{
  id v9 = NSNumber;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [v12 confidenceScore];
  double v14 = objc_msgSend(v9, "numberWithDouble:");
  [v13 setInferredModeConfidenceScore:v14];

  [v13 setInferredModeDuration:v10];
  double v15 = [v12 originAnchorType];
  [v13 setInferredModeOriginAnchorType:v15];

  [v12 modeType];
  int v16 = BMUserFocusInferredModeTypeAsString();
  [v13 setInferredModeType:v16];

  double v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "uiLocation"));
  [v13 setInferredModeUILocation:v17];

  [v12 origin];
  uint64_t v18 = BMUserFocusInferredModeOriginAsString();
  [v13 setPreviousModeOrigin:v18];

  [v11 origin];
  BMUserFocusInferredModeOriginAsString();
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  [v13 setCurrentModeOrigin:v19];
}

- (id)_timeBasedMergedPublisher
{
  v3 = [(BMStream *)self->_inferredModeStream atx_publisherFromStartTime:0];
  id v4 = [(BMStream *)self->_computedModeStream atx_publisherFromStartTime:0];
  id v5 = [v4 orderedMergeWithOther:v3 comparator:&__block_literal_global_7];

  return v5;
}

uint64_t __64__ATXModeTransitionMetricsLogUploader__timeBasedMergedPublisher__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  double v6 = objc_msgSend(v4, "numberWithDouble:");
  double v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  id v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (void)_logModeTransitionMetricWithPreviousModeStart:(id)a3 previousModeEnd:(id)a4 currentModeStart:(id)a5 matchingPreviousInferredModeEvent:(id)a6 matchingCurrentInferredModeEvent:(id)a7
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v63 = a6;
  id v64 = a7;
  double v15 = [v13 eventBody];
  int v16 = [v14 eventBody];
  double v17 = [v15 modeSemanticTypeAsString];
  [v13 timestamp];
  double v19 = v18;
  v62 = v12;
  [v12 timestamp];
  double v21 = v19 - v20;
  int v22 = [v15 updateReason];
  uint64_t v23 = [v15 modeUpdateReasonAsString];
  v59 = v15;
  uint64_t v24 = [v15 modeUpdateSourceAsString];
  uint64_t v25 = [v16 modeSemanticTypeAsString];
  uint64_t v26 = [v16 modeUpdateReasonAsString];
  BOOL v52 = [(ATXModeTransitionMetricsLogUploader *)self _previousModeEndEvent:v13 isContiguousWithModeStartEvent:v14];
  v60 = v14;
  v61 = v13;
  if (!v52)
  {

    uint64_t v25 = @"No Mode";
    uint64_t v26 = @"Fallback";
  }
  v56 = v25;
  v54 = v26;
  v55 = (void *)v23;
  v57 = (void *)v24;
  uint64_t v27 = [[ATXModeTransitionMetric alloc] initWithPreviousModeSemanticType:v17 previousModeDuration:v22 == 2 previousModeHadScheduledExit:v23 exitReason:v26 enterReason:0 transitionDeviceType:v24 transitionSource:v21 nextModeSemanticType:v25];
  v53 = self;
  modeConfigurations = self->_modeConfigurations;
  v29 = [v16 semanticModeIdentifier];
  uint64_t v30 = [(NSDictionary *)modeConfigurations objectForKeyedSubscript:v29];

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v58 = v30;
  v31 = [v30 triggers];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v66 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v36 isEnabled])
        {
          [(ATXModeTransitionMetric *)v27 setLocationBasedSchedulingEnabled:1];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v36 isEnabled])
          {
            [(ATXModeTransitionMetric *)v27 setTimeBasedSchedulingEnabled:1];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v36 isEnabled])
            {
              [(ATXModeTransitionMetric *)v27 setAppBasedSchedulingEnabled:1];
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && [v36 isEnabled]) {
                [(ATXModeTransitionMetric *)v27 setSmartActivationEnabled:1];
              }
            }
          }
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (v33);
  }

  v37 = v63;
  [(ATXModeTransitionMetricsLogUploader *)v53 _populateInferredModeFieldsOnTheModeTransitionMetric:v27 withPreviousInferredModeEvent:v63 currentInferredModeEvent:v64 duration:0];
  v38 = __atxlog_handle_modes();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    v39 = [(ATXModeTransitionMetric *)v27 coreAnalyticsDictionary];
    *(_DWORD *)buf = 138412290;
    v70 = v39;
    _os_log_impl(&dword_1D0FA3000, v38, OS_LOG_TYPE_DEFAULT, "ATXModeTransitionMetricsLogUploader: Uploading mode transition metric to CA: %@", buf, 0xCu);
  }
  [(_ATXCoreAnalyticsMetric *)v27 logToCoreAnalytics];
  if (v52)
  {
    v40 = v27;
    v41 = v17;
    v42 = v57;
    v43 = v55;
    v44 = v56;
    v45 = v54;
  }
  else
  {

    [v60 timestamp];
    double v47 = v46;
    [v61 timestamp];
    double v49 = v47 - v48;
    v43 = [v16 modeUpdateReasonAsString];

    v45 = [v16 modeUpdateReasonAsString];

    v42 = [v16 modeUpdateSourceAsString];

    v44 = [v16 modeSemanticTypeAsString];

    v40 = [[ATXModeTransitionMetric alloc] initWithPreviousModeSemanticType:@"No Mode" previousModeDuration:0 previousModeHadScheduledExit:v43 exitReason:v45 enterReason:0 transitionDeviceType:v42 transitionSource:v49 nextModeSemanticType:v44];
    v50 = __atxlog_handle_modes();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = [(ATXModeTransitionMetric *)v40 coreAnalyticsDictionary];
      *(_DWORD *)buf = 138412290;
      v70 = v51;
      _os_log_impl(&dword_1D0FA3000, v50, OS_LOG_TYPE_DEFAULT, "ATXModeTransitionMetricsLogUploader: Uploading mode transition metric to CA: %@", buf, 0xCu);

      v37 = v63;
    }

    [(_ATXCoreAnalyticsMetric *)v40 logToCoreAnalytics];
    v41 = @"No Mode";
  }
}

- (BOOL)_previousModeEndEvent:(id)a3 isContiguousWithModeStartEvent:(id)a4
{
  id v5 = a3;
  [a4 timestamp];
  double v7 = v6;
  [v5 timestamp];
  double v9 = v8;

  return v7 - v9 < 10.0;
}

- (id)_modeTransitionBookmark
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB10]);
  v3 = [MEMORY[0x1E4F4B650] bookmarksPathFile:@"kModeTransitionMetricsBookmarkFile"];
  id v4 = (void *)[v2 initFileURLWithPath:v3];

  id v5 = [MEMORY[0x1E4F4B618] bookmarkFromURLPath:v4 maxFileSize:1000000 versionNumber:&unk_1F27EFFA0];
  if (!v5) {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F4B618]) initWithURLPath:v4 versionNumber:&unk_1F27EFFA0 bookmark:0 metadata:0];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeConfigurations, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_inferredModeStream, 0);
  objc_storeStrong((id *)&self->_computedModeStream, 0);
}

- (void)uploadLogsToCoreAnalyticsWithXPCActivity:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXModeTransitionMetricsLogUploader: Unable to save activity suggestion bookmark, error: %@", (uint8_t *)&v2, 0xCu);
}

@end