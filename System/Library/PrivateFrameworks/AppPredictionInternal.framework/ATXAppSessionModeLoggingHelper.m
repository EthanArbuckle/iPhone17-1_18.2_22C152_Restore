@interface ATXAppSessionModeLoggingHelper
- (BOOL)shouldCoalesceLaunch:(id)a3 nextLaunch:(id)a4;
- (id)appLaunchesSinceDate:(id)a3;
- (id)coalesceAppLaunches:(id)a3;
- (id)stripStoreEvent:(id)a3;
@end

@implementation ATXAppSessionModeLoggingHelper

- (id)appLaunchesSinceDate:(id)a3
{
  id v4 = a3;
  v5 = +[_ATXDuetHelper sharedInstance];
  v6 = [MEMORY[0x1E4F1C9C8] now];
  v7 = [v5 getAppLaunchesFromUsageBetweenStartDate:v4 endDate:v6 limit:0];

  uint64_t v8 = [(ATXAppSessionModeLoggingHelper *)self coalesceAppLaunches:v7];
  v9 = (void *)v8;
  v10 = (void *)MEMORY[0x1E4F1CBF0];
  if (v8) {
    v10 = (void *)v8;
  }
  id v11 = v10;

  v12 = [v11 bpsPublisher];

  return v12;
}

- (id)coalesceAppLaunches:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v22 = (id)objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  id obj = v5;
  if (!v6) {
    goto LABEL_15;
  }
  uint64_t v7 = v6;
  id v5 = 0;
  uint64_t v8 = *(void *)v26;
  do
  {
    uint64_t v9 = 0;
    uint64_t v23 = v7;
    do
    {
      if (*(void *)v26 != v8) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
      if (v5)
      {
        if ([(ATXAppSessionModeLoggingHelper *)self shouldCoalesceLaunch:v5 nextLaunch:*(void *)(*((void *)&v25 + 1) + 8 * v9)])
        {
          id v11 = [_ATXAppLaunch alloc];
          [v5 bundleId];
          uint64_t v12 = v8;
          v14 = v13 = self;
          v15 = [v5 startDate];
          v16 = [v10 endDate];
          v17 = [v5 timeZone];
          v18 = [v5 reason];
          uint64_t v19 = [(_ATXAppLaunch *)v11 initWithBundleId:v14 startDate:v15 endDate:v16 timeZone:v17 reason:v18];

          self = v13;
          uint64_t v8 = v12;
          uint64_t v7 = v23;
          id v5 = (id)v19;
        }
        else
        {
          [v22 addObject:v5];
          id v20 = v10;

          id v5 = v20;
        }
      }
      else
      {
        id v5 = v10;
      }
      ++v9;
    }
    while (v7 != v9);
    uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v7);

  if (v5)
  {
    [v22 addObject:v5];
LABEL_15:
  }
  return v22;
}

- (BOOL)shouldCoalesceLaunch:(id)a3 nextLaunch:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 bundleId];
  uint64_t v8 = [v5 bundleId];
  char v9 = [v7 isEqualToString:v8];

  v10 = [v5 startDate];

  id v11 = [v6 endDate];

  [v10 timeIntervalSinceDate:v11];
  if (v12 < 10.0) {
    BOOL v13 = v9;
  }
  else {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)stripStoreEvent:(id)a3
{
  v3 = [a3 filterWithIsIncluded:&__block_literal_global_237];
  id v4 = [v3 mapWithTransform:&__block_literal_global_16_1];

  return v4;
}

BOOL __50__ATXAppSessionModeLoggingHelper_stripStoreEvent___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __50__ATXAppSessionModeLoggingHelper_stripStoreEvent___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 eventBody];
}

@end