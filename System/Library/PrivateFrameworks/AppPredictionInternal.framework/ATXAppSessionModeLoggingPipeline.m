@interface ATXAppSessionModeLoggingPipeline
- (ATXAppSessionModeLoggingPipeline)init;
- (ATXAppSessionModeLoggingPipeline)initWithModeTransitionPublisher:(id)a3 appLaunchPublisher:(id)a4 notificationEventPublisher:(id)a5 lastEventTimestamp:(double)a6 lastActivityType:(unint64_t)a7;
- (BPSPublisher)appLaunchPublisher;
- (BPSPublisher)modeTransitionPublisher;
- (BPSPublisher)notificationEventPublisher;
- (NSString)bookmarkFilepath;
- (double)lastPipelineRunTimestampFromStore;
- (id)timeMergedPublisherFromEventPublishers:(id)a3 modeTransitionPublisher:(id)a4;
- (unint64_t)lastKnownActivityFromStore;
- (void)lastKnownActivityFromStore;
- (void)logAppSessionMetrics;
- (void)logAppSessionMetricsWithXPCActivity:(id)a3;
- (void)persistState;
@end

@implementation ATXAppSessionModeLoggingPipeline

- (ATXAppSessionModeLoggingPipeline)init
{
  [(ATXAppSessionModeLoggingPipeline *)self lastPipelineRunTimestampFromStore];
  double v4 = v3;
  unint64_t v5 = [(ATXAppSessionModeLoggingPipeline *)self lastKnownActivityFromStore];
  v6 = objc_opt_new();
  v7 = [v6 transitionPublisherFromStartTime:v4];

  v8 = objc_opt_new();
  v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v4];
  v10 = [v8 appLaunchesSinceDate:v9];

  v11 = objc_opt_new();
  v12 = objc_opt_new();
  v13 = [v12 publisherFromStartTime:v4];
  v14 = [v11 stripStoreEvent:v13];

  v15 = [(ATXAppSessionModeLoggingPipeline *)self initWithModeTransitionPublisher:v7 appLaunchPublisher:v10 notificationEventPublisher:v14 lastEventTimestamp:v5 lastActivityType:v4];
  return v15;
}

- (ATXAppSessionModeLoggingPipeline)initWithModeTransitionPublisher:(id)a3 appLaunchPublisher:(id)a4 notificationEventPublisher:(id)a5 lastEventTimestamp:(double)a6 lastActivityType:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXAppSessionModeLoggingPipeline;
  v16 = [(ATXAppSessionModeLoggingPipeline *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_modeTransitionPublisher, a3);
    objc_storeStrong((id *)&v17->_appLaunchPublisher, a4);
    objc_storeStrong((id *)&v17->_notificationEventPublisher, a5);
    v17->_lastEventTimestamp = a6;
    v17->_lastActivityType = a7;
  }

  return v17;
}

- (double)lastPipelineRunTimestampFromStore
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  double v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  [v3 doubleForKey:@"modeAppSessionPipelineLastRunTimestampKey"];
  double v5 = v4;

  return v5;
}

- (unint64_t)lastKnownActivityFromStore
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  double v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  double v4 = [v3 objectForKey:@"modeAppSessionPipelineLastKnownModeKey"];
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

- (void)logAppSessionMetricsWithXPCActivity:(id)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  notificationEventPublisher = self->_notificationEventPublisher;
  v29[0] = self->_appLaunchPublisher;
  v29[1] = notificationEventPublisher;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 0;
  v7 = objc_opt_new();
  v26[0] = 0;
  v26[1] = v26;
  double lastEventTimestamp = self->_lastEventTimestamp;
  v26[2] = 0x2020000000;
  *(double *)&v26[3] = lastEventTimestamp;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  modeTransitionPublisher = self->_modeTransitionPublisher;
  v25[3] = self->_lastActivityType;
  v10 = [(ATXAppSessionModeLoggingPipeline *)self timeMergedPublisherFromEventPublishers:v6 modeTransitionPublisher:modeTransitionPublisher];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke;
  v20[3] = &unk_1E68AD2F0;
  v20[4] = self;
  v22 = v27;
  id v21 = v7;
  v23 = v26;
  v24 = v25;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke_24;
  v14[3] = &unk_1E68AD318;
  v14[4] = self;
  v17 = v26;
  v18 = v25;
  id v11 = v21;
  id v15 = v11;
  id v12 = v4;
  id v16 = v12;
  objc_super v19 = v27;
  id v13 = (id)[v10 sinkWithCompletion:v20 shouldContinue:v14];

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v26, 8);

  _Block_object_dispose(v27, 8);
}

void __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    unint64_t v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke_cold_1(a1, v3);
    }
  }
  else
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      v6 = __atxlog_handle_metrics();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = (objc_class *)objc_opt_class();
        v8 = NSStringFromClass(v7);
        int v9 = 138412290;
        v10 = v8;
        _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "%@ - Terminating due to XPC deferral", (uint8_t *)&v9, 0xCu);
      }
    }
    [*(id *)(a1 + 40) logToCoreAnalytics];
    *(void *)(*(void *)(a1 + 32) + 8) = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *(void *)(*(void *)(a1 + 32) + 16) = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    [*(id *)(a1 + 32) persistState];
  }
}

uint64_t __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 eventTime];
    [v5 timeIntervalSinceReferenceDate];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v4 activityTypeAfterTransition];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [*(id *)(a1 + 40) handleNotificationEvent:v4];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v9 = [ATXModeDimensionSet alloc];
          v10 = ATXActivityTypeToString();
          uint64_t v11 = [(ATXModeDimensionSet *)v9 initWithMode:v10];

          [*(id *)(a1 + 40) handleNextAppLaunch:v4 dimensionSet:v11];
        }
        else
        {
          uint64_t v11 = __atxlog_handle_metrics();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke_24_cold_2();
          }
        }
      }
    }
    uint64_t v8 = 1;
    if ([*(id *)(a1 + 48) didDefer])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      uint64_t v8 = 0;
    }
  }
  else
  {
    v7 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke_24_cold_1(a1, v7);
    }

    uint64_t v8 = 1;
  }

  return v8;
}

- (void)logAppSessionMetrics
{
}

- (void)persistState
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v5 = (id)[v3 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  [v5 setDouble:@"modeAppSessionPipelineLastRunTimestampKey" forKey:self->_lastEventTimestamp];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_lastActivityType];
  [v5 setObject:v4 forKey:@"modeAppSessionPipelineLastKnownModeKey"];
}

- (id)timeMergedPublisherFromEventPublishers:(id)a3 modeTransitionPublisher:(id)a4
{
  return (id)[a4 orderedMergeWithOthers:a3 comparator:&__block_literal_global_27];
}

uint64_t __99__ATXAppSessionModeLoggingPipeline_timeMergedPublisherFromEventPublishers_modeTransitionPublisher___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 eventTime];
  uint64_t v6 = [v4 eventTime];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (BPSPublisher)modeTransitionPublisher
{
  return self->_modeTransitionPublisher;
}

- (BPSPublisher)appLaunchPublisher
{
  return self->_appLaunchPublisher;
}

- (BPSPublisher)notificationEventPublisher
{
  return self->_notificationEventPublisher;
}

- (NSString)bookmarkFilepath
{
  return self->_bookmarkFilepath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkFilepath, 0);
  objc_storeStrong((id *)&self->_notificationEventPublisher, 0);
  objc_storeStrong((id *)&self->_appLaunchPublisher, 0);
  objc_storeStrong((id *)&self->_modeTransitionPublisher, 0);
}

- (void)lastKnownActivityFromStore
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v4, v5, "%@ - Received unexpected saved mode type: %@", v6, v7, v8, v9, v10);
}

void __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = [a2 error];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v6, v7, "%@ - Completion had an error: %@", v8, v9, v10, v11, v12);
}

void __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke_24_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%@ - Received unexpected nil event", (uint8_t *)&v5, 0xCu);
}

void __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke_24_cold_2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v4, v5, "%@ - Received event of unexpected type %@", v6, v7, v8, v9, v10);
}

@end