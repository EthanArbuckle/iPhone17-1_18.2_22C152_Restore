@interface ATXContinuousUsageAccumulator
- (ATXContinuousUsageAccumulator)init;
- (ATXContinuousUsageAccumulator)initWithAppLaunchPublisher:(id)a3;
- (BOOL)successfullyAccumulatedContinuousUseEvents;
- (NSArray)continuousUseSessions;
- (id)eventWithBundleID:(id)a3 launchReason:(id)a4 startTime:(id)a5 endTime:(id)a6 duration:(double)a7;
- (void)recordAppLaunchEndEvent:(id)a3;
- (void)recordAppLaunchStartEvent:(id)a3;
- (void)successfullyAccumulatedContinuousUseEvents;
@end

@implementation ATXContinuousUsageAccumulator

- (ATXContinuousUsageAccumulator)init
{
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
  v4 = BiomeLibrary();
  v5 = [v4 App];
  v6 = [v5 InFocus];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E8]) initWithStartDate:v3 endDate:0 maxEvents:0 lastN:0 reversed:0];
  v8 = [v6 publisherWithUseCase:*MEMORY[0x1E4F4B5A0] options:v7];
  v9 = [(ATXContinuousUsageAccumulator *)self initWithAppLaunchPublisher:v8];

  return v9;
}

- (ATXContinuousUsageAccumulator)initWithAppLaunchPublisher:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXContinuousUsageAccumulator;
  v6 = [(ATXContinuousUsageAccumulator *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_appLaunchPublisher, a3);
    uint64_t v8 = objc_opt_new();
    appInFocusStartingEvents = v7->_appInFocusStartingEvents;
    v7->_appInFocusStartingEvents = (NSMutableArray *)v8;

    uint64_t v10 = objc_opt_new();
    continuousUsageAccumulator = v7->_continuousUsageAccumulator;
    v7->_continuousUsageAccumulator = (NSMutableArray *)v10;
  }
  return v7;
}

- (BOOL)successfullyAccumulatedContinuousUseEvents
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v4 = +[_ATXAppIconState sharedInstance];
  id v5 = [v4 allInstalledAppsKnownToSpringBoard];
  v6 = (void *)[v3 initWithArray:v5];

  uint64_t v18 = 0;
  v19[0] = &v18;
  v19[1] = 0x3032000000;
  v19[2] = __Block_byref_object_copy__29;
  v19[3] = __Block_byref_object_dispose__29;
  id v20 = 0;
  appLaunchPublisher = self->_appLaunchPublisher;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__ATXContinuousUsageAccumulator_successfullyAccumulatedContinuousUseEvents__block_invoke;
  v17[3] = &unk_1E68AC060;
  v17[4] = &v18;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__ATXContinuousUsageAccumulator_successfullyAccumulatedContinuousUseEvents__block_invoke_2;
  v14[3] = &unk_1E68AD360;
  id v8 = v6;
  id v15 = v8;
  v16 = self;
  id v9 = (id)[(BPSPublisher *)appLaunchPublisher sinkWithCompletion:v17 receiveInput:v14];
  uint64_t v10 = *(void *)(v19[0] + 40);
  if (v10)
  {
    p_super = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      [(ATXContinuousUsageAccumulator *)(uint64_t)v19 successfullyAccumulatedContinuousUseEvents];
    }
  }
  else
  {
    v12 = self->_continuousUsageAccumulator;
    p_super = &self->_continuousUseSessions->super;
    self->_continuousUseSessions = &v12->super;
  }

  _Block_object_dispose(&v18, 8);
  return v10 == 0;
}

uint64_t __75__ATXContinuousUsageAccumulator_successfullyAccumulatedContinuousUseEvents__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 error];
  return MEMORY[0x1F41817F8]();
}

void __75__ATXContinuousUsageAccumulator_successfullyAccumulatedContinuousUseEvents__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  v4 = *(void **)(a1 + 32);
  id v6 = v3;
  id v5 = [v3 bundleID];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    if ([v6 starting])
    {
      [*(id *)(a1 + 40) recordAppLaunchStartEvent:v6];
    }
    else if (([v6 starting] & 1) == 0)
    {
      [*(id *)(a1 + 40) recordAppLaunchEndEvent:v6];
    }
  }
}

- (void)recordAppLaunchStartEvent:(id)a3
{
}

- (void)recordAppLaunchEndEvent:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[(NSMutableArray *)self->_appInFocusStartingEvents copy];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    uint64_t v28 = *(void *)v32;
    id v29 = v6;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v12 = [v4 bundleID];
        objc_super v13 = [v11 bundleID];
        int v14 = [v12 isEqualToString:v13];

        if (v14)
        {
          id v15 = [v11 absoluteTimestamp];
          v16 = [v4 absoluteTimestamp];
          uint64_t v17 = [v15 compare:v16];

          if (v17 == -1)
          {
            id v18 = objc_alloc(MEMORY[0x1E4F28C18]);
            v19 = [v11 absoluteTimestamp];
            id v20 = [v4 absoluteTimestamp];
            v21 = (void *)[v18 initWithStartDate:v19 endDate:v20];

            [v21 duration];
            if (v22 >= 60.0)
            {
              v30 = [v4 bundleID];
              v23 = [v11 launchReason];
              v24 = [v11 absoluteTimestamp];
              v25 = [v4 absoluteTimestamp];
              [v21 duration];
              -[ATXContinuousUsageAccumulator eventWithBundleID:launchReason:startTime:endTime:duration:](self, "eventWithBundleID:launchReason:startTime:endTime:duration:", v30, v23, v24, v25);
              v27 = v26 = self;

              uint64_t v9 = v28;
              id v6 = v29;

              [(NSMutableArray *)v26->_continuousUsageAccumulator addObject:v27];
              self = v26;
            }
            [(NSMutableArray *)self->_appInFocusStartingEvents removeObject:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v8);
  }
}

- (id)eventWithBundleID:(id)a3 launchReason:(id)a4 startTime:(id)a5 endTime:(id)a6 duration:(double)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = +[ATXSessionTaggingAppEntity genreIdForBundleId:v14];
  uint64_t v16 = [v15 unsignedIntegerValue];

  id v17 = objc_alloc(MEMORY[0x1E4F4B398]);
  id v18 = [MEMORY[0x1E4F4B398] usageInsightsAppLaunchReasonFromBMAppInFocus:v13];

  v19 = (void *)[v17 initWithBundleID:v14 category:v16 launchReason:v18 startTime:v12 endTime:v11 duration:a7];
  return v19;
}

- (NSArray)continuousUseSessions
{
  return self->_continuousUseSessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuousUseSessions, 0);
  objc_storeStrong((id *)&self->_appLaunchPublisher, 0);
  objc_storeStrong((id *)&self->_continuousUsageAccumulator, 0);
  objc_storeStrong((id *)&self->_appInFocusStartingEvents, 0);
}

- (void)successfullyAccumulatedContinuousUseEvents
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 136315394;
  id v4 = "-[ATXContinuousUsageAccumulator successfullyAccumulatedContinuousUseEvents]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%s: Error reading merged publishers: %@", (uint8_t *)&v3, 0x16u);
}

@end