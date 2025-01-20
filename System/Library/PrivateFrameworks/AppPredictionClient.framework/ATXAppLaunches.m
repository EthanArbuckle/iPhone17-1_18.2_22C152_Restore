@interface ATXAppLaunches
- (ATXAppLaunches)init;
- (ATXAppLaunches)initWithStream:(id)a3;
- (double)timesAppHasBeenLaunchedOverLast28Days:(id)a3;
- (double)uniqueAppsLaunchedOverLast28Days;
- (double)uniqueDaysAppHasBeenLaunchedOverLast28Days:(id)a3;
- (id)_rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysWithFilter:(id)a3;
- (id)rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps;
- (id)rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApp:(id)a3;
- (id)rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:(id)a3;
@end

@implementation ATXAppLaunches

- (ATXAppLaunches)init
{
  v3 = BiomeLibrary();
  v4 = [v3 App];
  v5 = [v4 InFocus];
  v6 = [(ATXAppLaunches *)self initWithStream:v5];

  return v6;
}

- (ATXAppLaunches)initWithStream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXAppLaunches;
  v6 = [(ATXAppLaunches *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_stream, a3);
  }

  return v7;
}

- (id)rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApp:(id)a3
{
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E4F1CAD0];
    id v5 = a3;
    v6 = [v4 setWithObject:v5];
    v7 = [(ATXAppLaunches *)self rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:v6];
    v8 = [v7 objectForKeyedSubscript:v5];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (double)uniqueDaysAppHasBeenLaunchedOverLast28Days:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v6 = [v4 setWithObject:v5];
  v7 = [(ATXAppLaunches *)self rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:v6];
  v8 = [v7 objectForKeyedSubscript:v5];

  double v9 = (double)(unint64_t)[v8 uniqueDaysLaunched];
  return v9;
}

- (double)timesAppHasBeenLaunchedOverLast28Days:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v6 = [v4 setWithObject:v5];
  v7 = [(ATXAppLaunches *)self rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:v6];
  v8 = [v7 objectForKeyedSubscript:v5];

  double v9 = (double)(unint64_t)[v8 rawLaunchCount];
  return v9;
}

- (id)rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps
{
  return [(ATXAppLaunches *)self _rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysWithFilter:&__block_literal_global_88];
}

uint64_t __79__ATXAppLaunches_rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps__block_invoke()
{
  return 1;
}

- (id)rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __77__ATXAppLaunches_rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps___block_invoke;
    v7[3] = &unk_1E5D060A8;
    id v8 = v4;
    id v5 = [(ATXAppLaunches *)self _rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysWithFilter:v7];
  }
  else
  {
    id v5 = objc_opt_new();
  }

  return v5;
}

uint64_t __77__ATXAppLaunches_rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (id)_rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysWithFilter:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x1AD0D3C30]();
  id v5 = objc_opt_new();
  v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v7 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v8 = [v6 dateByAddingUnit:16 value:-28 toDate:v7 options:0];

  v29 = (void *)v8;
  double v9 = [(BMStream *)self->_stream atx_publisherFromStartDate:v8];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __81__ATXAppLaunches__rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysWithFilter___block_invoke;
  v43[3] = &unk_1E5D0A368;
  id v28 = v4;
  id v44 = v28;
  v10 = [v9 filterWithIsIncluded:v43];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __81__ATXAppLaunches__rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysWithFilter___block_invoke_3;
  v40[3] = &unk_1E5D066E0;
  id v27 = v6;
  id v41 = v27;
  id v11 = v5;
  id v42 = v11;
  id v12 = (id)[v10 sinkWithCompletion:&__block_literal_global_12_2 receiveInput:v40];

  id v31 = (id)objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        v19 = [v13 objectForKeyedSubscript:v18];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v45 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = 0;
          uint64_t v23 = *(void *)v33;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v33 != v23) {
                objc_enumerationMutation(v19);
              }
              v22 += [v19 countForObject:*(void *)(*((void *)&v32 + 1) + 8 * j)];
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v45 count:16];
          }
          while (v21);
        }
        else
        {
          uint64_t v22 = 0;
        }
        v25 = -[ATXAggregatedAppLaunchData initWithRawLaunchCount:uniqueDaysLaunched:]([ATXAggregatedAppLaunchData alloc], "initWithRawLaunchCount:uniqueDaysLaunched:", v22, [v19 count]);
        [v31 setObject:v25 forKeyedSubscript:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v15);
  }

  return v31;
}

uint64_t __81__ATXAppLaunches__rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysWithFilter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBody];
  int v5 = [v4 starting];

  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = [v3 eventBody];
    uint64_t v8 = [v7 bundleID];
    uint64_t v9 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void __81__ATXAppLaunches__rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysWithFilter___block_invoke_3(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = (void *)MEMORY[0x1AD0D3C30]();
  id v4 = [v13 eventBody];
  int v5 = [v4 bundleID];

  id v6 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  [v13 timestamp];
  v7 = objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
  uint64_t v8 = [*(id *)(a1 + 32) ordinalityOfUnit:16 inUnit:4 forDate:v7];
  uint64_t v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];

  if (!v9)
  {
    v10 = objc_opt_new();
    [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v5];
  }
  id v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
  id v12 = [NSNumber numberWithUnsignedInteger:v8];
  [v11 addObject:v12];
}

- (double)uniqueAppsLaunchedOverLast28Days
{
  id v3 = objc_opt_new();
  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int v5 = [MEMORY[0x1E4F1C9C8] now];
  id v6 = [v4 dateByAddingUnit:16 value:-28 toDate:v5 options:0];

  v7 = [(BMStream *)self->_stream atx_publisherFromStartDate:v6];
  uint64_t v8 = [v7 filterWithIsIncluded:&__block_literal_global_19_0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__ATXAppLaunches_uniqueAppsLaunchedOverLast28Days__block_invoke_3;
  v13[3] = &unk_1E5D0A390;
  id v14 = v3;
  id v9 = v3;
  id v10 = (id)[v8 sinkWithCompletion:&__block_literal_global_21_4 receiveInput:v13];

  double v11 = (double)(unint64_t)[v9 count];
  return v11;
}

uint64_t __50__ATXAppLaunches_uniqueAppsLaunchedOverLast28Days__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  uint64_t v3 = [v2 starting];

  return v3;
}

void __50__ATXAppLaunches_uniqueAppsLaunchedOverLast28Days__block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 eventBody];
  id v4 = [v3 bundleID];

  if (v4)
  {
    int v5 = *(void **)(a1 + 32);
    id v6 = [v8 eventBody];
    v7 = [v6 bundleID];
    [v5 addObject:v7];
  }
}

- (void).cxx_destruct
{
}

@end