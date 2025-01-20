@interface ATXMindlessCyclingUsageAccumulator
- (ATXMindlessCyclingUsageAccumulator)init;
- (ATXMindlessCyclingUsageAccumulator)initWithAppLaunchPublisher:(id)a3;
- (BOOL)accumulateMindlessCyclingEvents;
- (NSArray)mindlessCyclingEvents;
- (id)eventWithBundleID:(id)a3 launchReason:(id)a4 startTime:(id)a5 endTime:(id)a6 duration:(double)a7;
- (void)accumulateMindlessCyclingEvents;
- (void)recordAppLaunchEndEvent:(id)a3;
- (void)recordAppLaunchStartEvent:(id)a3;
@end

@implementation ATXMindlessCyclingUsageAccumulator

- (ATXMindlessCyclingUsageAccumulator)init
{
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
  v4 = BiomeLibrary();
  v5 = [v4 App];
  v6 = [v5 InFocus];
  v7 = objc_msgSend(v6, "atx_publisherFromStartDate:", v3);

  v8 = [(ATXMindlessCyclingUsageAccumulator *)self initWithAppLaunchPublisher:v7];
  return v8;
}

- (ATXMindlessCyclingUsageAccumulator)initWithAppLaunchPublisher:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ATXMindlessCyclingUsageAccumulator;
  v6 = [(ATXMindlessCyclingUsageAccumulator *)&v12 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    appInFocusStartingEvents = v6->_appInFocusStartingEvents;
    v6->_appInFocusStartingEvents = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    mindlessCyclingEventsAccumulator = v6->_mindlessCyclingEventsAccumulator;
    v6->_mindlessCyclingEventsAccumulator = (NSMutableArray *)v9;

    objc_storeStrong((id *)&v6->_appLaunchPublisher, a3);
  }

  return v6;
}

- (BOOL)accumulateMindlessCyclingEvents
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v4 = +[_ATXAppIconState sharedInstance];
  id v5 = [v4 allInstalledAppsKnownToSpringBoard];
  v6 = (void *)[v3 initWithArray:v5];

  uint64_t v18 = 0;
  v19[0] = &v18;
  v19[1] = 0x3032000000;
  v19[2] = __Block_byref_object_copy__12;
  v19[3] = __Block_byref_object_dispose__12;
  id v20 = 0;
  appLaunchPublisher = self->_appLaunchPublisher;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__ATXMindlessCyclingUsageAccumulator_accumulateMindlessCyclingEvents__block_invoke;
  v17[3] = &unk_1E68AC060;
  v17[4] = &v18;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__ATXMindlessCyclingUsageAccumulator_accumulateMindlessCyclingEvents__block_invoke_2;
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
      [(ATXMindlessCyclingUsageAccumulator *)(uint64_t)v19 accumulateMindlessCyclingEvents];
    }
  }
  else
  {
    objc_super v12 = self->_mindlessCyclingEventsAccumulator;
    p_super = &self->_mindlessCyclingEvents->super;
    self->_mindlessCyclingEvents = &v12->super;
  }

  _Block_object_dispose(&v18, 8);
  return v10 == 0;
}

uint64_t __69__ATXMindlessCyclingUsageAccumulator_accumulateMindlessCyclingEvents__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 error];
  return MEMORY[0x1F41817F8]();
}

void __69__ATXMindlessCyclingUsageAccumulator_accumulateMindlessCyclingEvents__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  v4 = *(void **)(a1 + 32);
  id v8 = v3;
  id v5 = [v3 bundleID];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    int v6 = [v8 starting];
    uint64_t v7 = *(void **)(a1 + 40);
    if (v6) {
      [v7 recordAppLaunchStartEvent:v8];
    }
    else {
      [v7 recordAppLaunchEndEvent:v8];
    }
  }
}

- (void)recordAppLaunchStartEvent:(id)a3
{
}

- (void)recordAppLaunchEndEvent:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[(NSMutableArray *)self->_appInFocusStartingEvents copy];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v37;
    location = (id *)&self->_stagedEventToAdd;
    id v31 = v4;
    uint64_t v32 = *(void *)v37;
    v30 = self;
    do
    {
      uint64_t v9 = 0;
      uint64_t v33 = v7;
      do
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v36 + 1) + 8 * v9);
        v11 = objc_msgSend(v4, "bundleID", v30);
        objc_super v12 = [v10 bundleID];
        int v13 = [v11 isEqualToString:v12];

        if (v13)
        {
          if (*location)
          {
            id v14 = *location;
          }
          else
          {
            id v14 = [(NSMutableArray *)self->_mindlessCyclingEventsAccumulator lastObject];
          }
          id v15 = v14;
          v16 = [v14 endTime];
          v17 = [v10 absoluteTimestamp];
          uint64_t v18 = [v4 absoluteTimestamp];
          [v17 timeIntervalSinceReferenceDate];
          double v20 = v19;
          [v18 timeIntervalSinceReferenceDate];
          if (v20 <= v21)
          {
            v22 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v17 endDate:v18];
            [v22 duration];
            if (v23 <= 30.0)
            {
              v24 = [v4 bundleID];
              [v10 launchReason];
              v26 = v25 = self;
              [v22 duration];
              v27 = -[ATXMindlessCyclingUsageAccumulator eventWithBundleID:launchReason:startTime:endTime:duration:](v25, "eventWithBundleID:launchReason:startTime:endTime:duration:", v24, v26, v17, v18);

              if (v16 && ([v17 timeIntervalSinceDate:v16], v28 <= 10.0))
              {
                self = v30;
                if (*location)
                {
                  -[NSMutableArray addObject:](v30->_mindlessCyclingEventsAccumulator, "addObject:");
                  stagedEventToAdd = v30->_stagedEventToAdd;
                  v30->_stagedEventToAdd = 0;
                }
                [(NSMutableArray *)v30->_mindlessCyclingEventsAccumulator addObject:v27];
                id v4 = v31;
              }
              else
              {
                objc_storeStrong(location, v27);
                self = v30;
                id v4 = v31;
              }
            }
            [(NSMutableArray *)self->_appInFocusStartingEvents removeObject:v10];
          }
          uint64_t v8 = v32;
          uint64_t v7 = v33;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v7);
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
  uint64_t v18 = [MEMORY[0x1E4F4B398] usageInsightsAppLaunchReasonFromBMAppInFocus:v13];

  double v19 = (void *)[v17 initWithBundleID:v14 category:v16 launchReason:v18 startTime:v12 endTime:v11 duration:a7];
  return v19;
}

- (NSArray)mindlessCyclingEvents
{
  return self->_mindlessCyclingEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mindlessCyclingEvents, 0);
  objc_storeStrong((id *)&self->_appLaunchPublisher, 0);
  objc_storeStrong((id *)&self->_stagedEventToAdd, 0);
  objc_storeStrong((id *)&self->_mindlessCyclingEventsAccumulator, 0);
  objc_storeStrong((id *)&self->_appInFocusStartingEvents, 0);
}

- (void)accumulateMindlessCyclingEvents
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 136315394;
  id v4 = "-[ATXMindlessCyclingUsageAccumulator accumulateMindlessCyclingEvents]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%s: Error with reading app launch stream: %@", (uint8_t *)&v3, 0x16u);
}

@end