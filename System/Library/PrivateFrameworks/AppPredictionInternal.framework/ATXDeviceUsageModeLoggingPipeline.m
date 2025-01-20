@interface ATXDeviceUsageModeLoggingPipeline
- (ATXDeviceUsageModeLoggingPipeline)init;
- (ATXDeviceUsageModeLoggingPipeline)initWithModeTransitionPublisher:(id)a3 displayIntervalPublisher:(id)a4 lastEventTimestamp:(double)a5 lastActivityType:(unint64_t)a6;
- (BOOL)_shouldCoalesceOnInterval:(id)a3 nextInterval:(id)a4;
- (BPSPublisher)displayIntervalPublisher;
- (BPSPublisher)modeTransitionPublisher;
- (double)lastPipelineRunTimestampFromStore;
- (id)_coalesceAndFilterDisplayOnIntervals:(id)a3;
- (id)displayIntervalsFromStartDate:(id)a3 endDate:(id)a4;
- (id)timeMergedPublisherFromEventPublishers:(id)a3 modeTransitionPublisher:(id)a4;
- (unint64_t)lastKnownActivityFromStore;
- (void)logDeviceUsage;
- (void)logDeviceUsageWithXPCActivity:(id)a3;
- (void)persistState;
@end

@implementation ATXDeviceUsageModeLoggingPipeline

- (ATXDeviceUsageModeLoggingPipeline)initWithModeTransitionPublisher:(id)a3 displayIntervalPublisher:(id)a4 lastEventTimestamp:(double)a5 lastActivityType:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXDeviceUsageModeLoggingPipeline;
  v13 = [(ATXDeviceUsageModeLoggingPipeline *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_modeTransitionPublisher, a3);
    objc_storeStrong((id *)&v14->_displayIntervalPublisher, a4);
    v14->_lastEventTimestamp = a5;
    v14->_lastActivityType = a6;
  }

  return v14;
}

- (ATXDeviceUsageModeLoggingPipeline)init
{
  [(ATXDeviceUsageModeLoggingPipeline *)self lastPipelineRunTimestampFromStore];
  double v4 = v3;
  unint64_t v5 = [(ATXDeviceUsageModeLoggingPipeline *)self lastKnownActivityFromStore];
  v6 = objc_opt_new();
  v7 = [v6 transitionPublisherFromStartTime:v4];

  v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v4];
  v9 = [MEMORY[0x1E4F1C9C8] now];
  v10 = [(ATXDeviceUsageModeLoggingPipeline *)self displayIntervalsFromStartDate:v8 endDate:v9];

  id v11 = [(ATXDeviceUsageModeLoggingPipeline *)self initWithModeTransitionPublisher:v7 displayIntervalPublisher:v10 lastEventTimestamp:v5 lastActivityType:v4];
  return v11;
}

- (double)lastPipelineRunTimestampFromStore
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  double v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  [v3 doubleForKey:@"modeDeviceUsagePipelineLastRunTimestampKey"];
  double v5 = v4;

  return v5;
}

- (unint64_t)lastKnownActivityFromStore
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  double v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  double v4 = [v3 objectForKey:@"modeDeviceUsagePipelineLastKnownModeKey"];
  if (!v4)
  {
LABEL_7:
    unint64_t v5 = 14;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ATXAppSessionModeLoggingPipeline lastKnownActivityFromStore]();
    }

    goto LABEL_7;
  }
  unint64_t v5 = [v4 unsignedIntegerValue];
LABEL_8:

  return v5;
}

- (id)displayIntervalsFromStartDate:(id)a3 endDate:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v6 timeIntervalSinceReferenceDate];
    uint64_t v12 = v11;
    [v7 timeIntervalSinceReferenceDate];
    int v19 = 138412802;
    v20 = v10;
    __int16 v21 = 2048;
    uint64_t v22 = v12;
    __int16 v23 = 2048;
    uint64_t v24 = v13;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_INFO, "%@ - Retrieving display on intervals between timestamps %f and %f", (uint8_t *)&v19, 0x20u);
  }
  v14 = +[ATXDeviceBacklightHelper getScreenOnIntervalsBetweenStartDate:v6 endDate:v7];
  v15 = objc_msgSend(v14, "_pas_mappedArrayWithTransform:", &__block_literal_global_208);

  objc_super v16 = [(ATXDeviceUsageModeLoggingPipeline *)self _coalesceAndFilterDisplayOnIntervals:v15];
  v17 = [v16 bpsPublisher];

  return v17;
}

_ATXDisplayOnInterval *__75__ATXDeviceUsageModeLoggingPipeline_displayIntervalsFromStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = [[_ATXDisplayOnInterval alloc] initWithOnInterval:v2];

  return v3;
}

- (id)_coalesceAndFilterDisplayOnIntervals:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v24 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
  id obj = v5;
  if (!v6) {
    goto LABEL_15;
  }
  uint64_t v7 = v6;
  id v5 = 0;
  uint64_t v8 = *(void *)v28;
  do
  {
    uint64_t v9 = 0;
    uint64_t v25 = v7;
    do
    {
      if (*(void *)v28 != v8) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v27 + 1) + 8 * v9);
      if (v5)
      {
        if ([(ATXDeviceUsageModeLoggingPipeline *)self _shouldCoalesceOnInterval:v5 nextInterval:*(void *)(*((void *)&v27 + 1) + 8 * v9)])
        {
          uint64_t v11 = v8;
          uint64_t v12 = self;
          uint64_t v13 = [_ATXDisplayOnInterval alloc];
          id v14 = objc_alloc(MEMORY[0x1E4F28C18]);
          v15 = [v5 onInterval];
          objc_super v16 = [v15 startDate];
          v17 = [v10 onInterval];
          v18 = [v17 endDate];
          int v19 = (void *)[v14 initWithStartDate:v16 endDate:v18];
          uint64_t v20 = [(_ATXDisplayOnInterval *)v13 initWithOnInterval:v19];

          id v5 = (id)v20;
          self = v12;
          uint64_t v8 = v11;
          uint64_t v7 = v25;
        }
        else
        {
          [v24 addObject:v5];
          id v21 = v10;

          id v5 = v21;
        }
      }
      else
      {
        id v5 = v10;
      }
      ++v9;
    }
    while (v7 != v9);
    uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v7);

  if (v5)
  {
    [v24 addObject:v5];
LABEL_15:
  }
  uint64_t v22 = objc_msgSend(v24, "_pas_filteredArrayWithTest:", &__block_literal_global_26_1);

  return v22;
}

BOOL __74__ATXDeviceUsageModeLoggingPipeline__coalesceAndFilterDisplayOnIntervals___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 onInterval];
  [v2 duration];
  BOOL v4 = v3 >= 3.0;

  return v4;
}

- (BOOL)_shouldCoalesceOnInterval:(id)a3 nextInterval:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 onInterval];
  uint64_t v8 = [v7 endDate];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;
  uint64_t v11 = [v5 onInterval];
  uint64_t v12 = [v11 startDate];
  [v12 timeIntervalSinceReferenceDate];
  double v14 = v13;

  if (v10 <= v14)
  {
    BOOL v20 = 0;
  }
  else
  {
    v15 = [v6 onInterval];
    objc_super v16 = [v15 startDate];
    v17 = [v5 onInterval];
    v18 = [v17 endDate];
    [v16 timeIntervalSinceDate:v18];
    BOOL v20 = v19 < 2.0;
  }
  return v20;
}

- (void)logDeviceUsage
{
}

- (void)logDeviceUsageWithXPCActivity:(id)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v41[0] = self->_displayIntervalPublisher;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  char v34 = 0;
  uint64_t v29 = 0;
  long long v30 = &v29;
  double lastEventTimestamp = self->_lastEventTimestamp;
  uint64_t v31 = 0x2020000000;
  double v32 = lastEventTimestamp;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = self->_lastActivityType;
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = [(ATXDeviceUsageModeLoggingPipeline *)self timeMergedPublisherFromEventPublishers:v5 modeTransitionPublisher:self->_modeTransitionPublisher];
  double v9 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    double v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = v30[3];
    double v13 = ATXActivityTypeToString();
    *(_DWORD *)buf = 138412802;
    id v36 = v11;
    __int16 v37 = 2048;
    uint64_t v38 = v12;
    __int16 v39 = 2112;
    v40 = v13;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "%@ - Logging Device Usage starting from timestamp %f with most recent transition %@", buf, 0x20u);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __67__ATXDeviceUsageModeLoggingPipeline_logDeviceUsageWithXPCActivity___block_invoke;
  v23[3] = &unk_1E68AD2F0;
  v23[4] = self;
  uint64_t v25 = v33;
  id v24 = v7;
  v26 = &v29;
  long long v27 = v28;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__ATXDeviceUsageModeLoggingPipeline_logDeviceUsageWithXPCActivity___block_invoke_30;
  v17[3] = &unk_1E68AD318;
  v17[4] = self;
  BOOL v20 = &v29;
  id v21 = v28;
  id v14 = v24;
  id v18 = v14;
  id v15 = v4;
  id v19 = v15;
  uint64_t v22 = v33;
  id v16 = (id)[v8 sinkWithCompletion:v23 shouldContinue:v17];

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v33, 8);
}

void __67__ATXDeviceUsageModeLoggingPipeline_logDeviceUsageWithXPCActivity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    id v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke_cold_1(a1, v3);
    }
  }
  else
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      id v6 = __atxlog_handle_metrics();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = (objc_class *)objc_opt_class();
        uint64_t v8 = NSStringFromClass(v7);
        int v9 = 138412290;
        double v10 = v8;
        _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "%@ - Terminating due to XPC deferral", (uint8_t *)&v9, 0xCu);
      }
    }
    [*(id *)(a1 + 40) logToCoreAnalytics];
    *(void *)(*(void *)(a1 + 32) + 8) = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *(void *)(*(void *)(a1 + 32) + 16) = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    [*(id *)(a1 + 32) persistState];
  }
}

uint64_t __67__ATXDeviceUsageModeLoggingPipeline_logDeviceUsageWithXPCActivity___block_invoke_30(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 eventTime];
    [v5 timeIntervalSinceReferenceDate];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v4 activityTypeAfterTransition];
      uint64_t v7 = [ATXModeDimensionSet alloc];
      uint64_t v8 = ATXActivityTypeToString();
      int v9 = [(ATXModeDimensionSet *)v7 initWithMode:v8];

      double v10 = *(void **)(a1 + 40);
      uint64_t v11 = [v4 eventTime];
      [v10 handleModeDimensionSetChange:v9 changeTime:v11];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v4;
        id v15 = [ATXModeDimensionSet alloc];
        id v16 = ATXActivityTypeToString();
        int v9 = [(ATXModeDimensionSet *)v15 initWithMode:v16];

        [*(id *)(a1 + 40) handleNextOnInterval:v14 dimensionSet:v9];
      }
      else
      {
        int v9 = __atxlog_handle_metrics();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke_24_cold_2();
        }
      }
    }

    uint64_t v13 = 1;
    if ([*(id *)(a1 + 48) didDefer])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v12 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke_24_cold_1(a1, v12);
    }

    uint64_t v13 = 1;
  }

  return v13;
}

- (id)timeMergedPublisherFromEventPublishers:(id)a3 modeTransitionPublisher:(id)a4
{
  return (id)[a4 orderedMergeWithOthers:a3 comparator:&__block_literal_global_36];
}

uint64_t __100__ATXDeviceUsageModeLoggingPipeline_timeMergedPublisherFromEventPublishers_modeTransitionPublisher___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 eventTime];
  uint64_t v6 = [v4 eventTime];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)persistState
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v5 = (id)[v3 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  [v5 setDouble:@"modeDeviceUsagePipelineLastRunTimestampKey" forKey:self->_lastEventTimestamp];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_lastActivityType];
  [v5 setObject:v4 forKey:@"modeDeviceUsagePipelineLastKnownModeKey"];
}

- (BPSPublisher)modeTransitionPublisher
{
  return self->_modeTransitionPublisher;
}

- (BPSPublisher)displayIntervalPublisher
{
  return self->_displayIntervalPublisher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayIntervalPublisher, 0);
  objc_storeStrong((id *)&self->_modeTransitionPublisher, 0);
}

@end