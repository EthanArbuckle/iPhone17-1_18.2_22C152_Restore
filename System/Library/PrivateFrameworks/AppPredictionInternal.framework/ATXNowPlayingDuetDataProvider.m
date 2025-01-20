@interface ATXNowPlayingDuetDataProvider
+ (Class)supportedDuetEventClass;
+ (int64_t)supportedCoreDuetStream;
- (id)convertNowPlayingEventsToAppLaunchEvents:(id)a3;
- (id)mostRecentPlayingNowPlayingEventWithMaxAgeInSeconds:(double)a3;
- (id)playbackEventsAfterSecondsOfInactivity:(double)a3 betweenStartDate:(id)a4 endDate:(id)a5;
@end

@implementation ATXNowPlayingDuetDataProvider

+ (Class)supportedDuetEventClass
{
  return (Class)objc_opt_class();
}

+ (int64_t)supportedCoreDuetStream
{
  return 5;
}

- (id)playbackEventsAfterSecondsOfInactivity:(double)a3 betweenStartDate:(id)a4 endDate:(id)a5
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F5B5D0];
  v11 = [MEMORY[0x1E4F5B5A0] playing];
  uint64_t v12 = [v10 predicateForObjectsWithMetadataKey:v11 andIntegerValue:1];

  v39 = (void *)v12;
  uint64_t v13 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v12];
  v32 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithMinimumDuration:a3];
  v33 = (void *)v13;
  v46[0] = v13;
  v46[1] = v32;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  v38 = self;
  v34 = v9;
  v35 = v8;
  v15 = [(ATXDuetDataProvider *)self fetchEventsBetweenStartDate:v8 andEndDate:v9 withPredicates:v14];

  v36 = objc_opt_new();
  v16 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithMinimumDuration:30.0];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v15;
  uint64_t v17 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v41 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v22 = (void *)MEMORY[0x1D25F6CC0]();
        v23 = [v21 endDate];
        id v24 = objc_alloc(MEMORY[0x1E4F1C9C8]);
        v25 = [v21 endDate];
        v26 = (void *)[v24 initWithTimeInterval:v25 sinceDate:60.0];
        v44[0] = v39;
        v44[1] = v16;
        v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
        v28 = [(ATXDuetDataProvider *)v38 fetchEventsBetweenStartDate:v23 andEndDate:v26 withPredicates:v27];

        if (v28 && [v28 count])
        {
          v29 = [v28 firstObject];
          [v36 addObject:v29];
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v18);
  }

  v30 = (void *)[v36 copy];
  return v30;
}

- (id)convertNowPlayingEventsToAppLaunchEvents:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1D25F6CC0]();
        v11 = [ATXAppLaunchDuetEvent alloc];
        uint64_t v12 = [v9 bundleId];
        uint64_t v13 = [v9 startDate];
        v14 = [v9 endDate];
        v15 = [(ATXAppLaunchDuetEvent *)v11 initWithBundleId:v12 startDate:v13 endDate:v14];

        [v4 addObject:v15];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  v16 = (void *)[v4 copy];
  return v16;
}

- (id)mostRecentPlayingNowPlayingEventWithMaxAgeInSeconds:(double)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-a3];
  uint64_t v5 = (void *)MEMORY[0x1E4F5B5D0];
  uint64_t v6 = [MEMORY[0x1E4F5B5A0] playing];
  uint64_t v7 = [v5 predicateForObjectsWithMetadataKey:v6 andIntegerValue:1];

  id v8 = objc_opt_new();
  v13[0] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v10 = [(ATXDuetDataProvider *)self fetchEventsBetweenStartDate:v4 andEndDate:v8 withPredicates:v9];

  v11 = [v10 lastObject];

  return v11;
}

@end