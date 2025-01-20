@interface ATXAppLaunchProvider
- (ATXAppLaunchProvider)initWithLastNDays:(unint64_t)a3;
- (double)modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1DayForMode:(unint64_t)a3;
- (double)modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDaysForMode:(unint64_t)a3;
- (unint64_t)globalAppLaunchCountWithinLast1Day;
- (unint64_t)globalAppLaunchCountWithinLastNDays;
- (unint64_t)modeAppLaunchCountBasedOnGlobalPriorsWithinLast1DayForMode:(unint64_t)a3;
- (unint64_t)modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDaysForMode:(unint64_t)a3;
- (void)cacheAppLaunchStreamIfNecessary;
@end

@implementation ATXAppLaunchProvider

- (ATXAppLaunchProvider)initWithLastNDays:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ATXAppLaunchProvider;
  v4 = [(ATXAppLaunchProvider *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)(-86400 * a3)];
    thresholdDateLastNDays = v4->_thresholdDateLastNDays;
    v4->_thresholdDateLastNDays = (NSDate *)v5;
  }
  return v4;
}

- (void)cacheAppLaunchStreamIfNecessary
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXAppLaunchProvider: could not fetch app launch stream with error: %@", (uint8_t *)&v3, 0xCu);
}

uint64_t __55__ATXAppLaunchProvider_cacheAppLaunchStreamIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 error];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

void __55__ATXAppLaunchProvider_cacheAppLaunchStreamIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v40 = a2;
  uint64_t v3 = [v40 eventBody];
  if ([v3 starting])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 bundleID];
    LODWORD(v4) = [v4 containsObject:v5];

    if (v4)
    {
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      [v40 timestamp];
      if (v6 > *(double *)(a1 + 96)) {
        ++*(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      }
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v7 = allModesForTraining();
      uint64_t v8 = [v7 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        v10 = 0;
        id obj = v7;
        uint64_t v39 = *(void *)v42;
        double v11 = 0.0;
        char v12 = 1;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v42 != v39) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = [*(id *)(*((void *)&v41 + 1) + 8 * i) unsignedIntegerValue];
            v15 = ATXModeToString();
            v16 = *(void **)(a1 + 40);
            v17 = v3;
            v18 = [v3 bundleID];
            [v16 scoreForMode:v14 bundleId:v18 scalingFactor:1.0];
            double v20 = v19;

            if ((v12 & (v20 >= 0.0)) == 1)
            {
              id v21 = v15;

              char v12 = 0;
              double v11 = v20;
              v10 = v21;
            }
            v22 = NSNumber;
            v23 = [*(id *)(a1 + 48) objectForKeyedSubscript:v15];
            [v23 doubleValue];
            v25 = [v22 numberWithDouble:v20 + v24];
            [*(id *)(a1 + 48) setObject:v25 forKeyedSubscript:v15];

            [v40 timestamp];
            uint64_t v3 = v17;
            if (v26 > *(double *)(a1 + 96))
            {
              v27 = NSNumber;
              v28 = [*(id *)(a1 + 56) objectForKeyedSubscript:v15];
              [v28 doubleValue];
              v30 = [v27 numberWithDouble:v20 + v29];
              [*(id *)(a1 + 56) setObject:v30 forKeyedSubscript:v15];
            }
            if (v20 > v11)
            {
              id v31 = v15;

              double v11 = v20;
              v10 = v31;
            }
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v9);

        if (!v10) {
          goto LABEL_23;
        }
        v32 = NSNumber;
        v33 = [*(id *)(a1 + 64) objectForKeyedSubscript:v10];
        v34 = objc_msgSend(v32, "numberWithInt:", objc_msgSend(v33, "intValue") + 1);
        [*(id *)(a1 + 64) setObject:v34 forKeyedSubscript:v10];

        [v40 timestamp];
        if (v35 <= *(double *)(a1 + 96)) {
          goto LABEL_23;
        }
        v36 = NSNumber;
        v7 = [*(id *)(a1 + 72) objectForKeyedSubscript:v10];
        v37 = objc_msgSend(v36, "numberWithInt:", objc_msgSend(v7, "intValue") + 1);
        [*(id *)(a1 + 72) setObject:v37 forKeyedSubscript:v10];
      }
      else
      {
        v10 = 0;
      }

LABEL_23:
    }
  }
}

- (unint64_t)globalAppLaunchCountWithinLastNDays
{
  return self->_globalAppLaunchCountInLastNDays;
}

- (unint64_t)globalAppLaunchCountWithinLast1Day
{
  return self->_globalAppLaunchCountInLast1Day;
}

- (unint64_t)modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDaysForMode:(unint64_t)a3
{
  [(ATXAppLaunchProvider *)self cacheAppLaunchStreamIfNecessary];
  uint64_t v4 = ATXModeToString();
  uint64_t v5 = [(NSDictionary *)self->_modeAppLaunchCountBasedOnGlobalPriorsInLastNDays objectForKeyedSubscript:v4];
  unint64_t v6 = (int)[v5 intValue];

  return v6;
}

- (unint64_t)modeAppLaunchCountBasedOnGlobalPriorsWithinLast1DayForMode:(unint64_t)a3
{
  [(ATXAppLaunchProvider *)self cacheAppLaunchStreamIfNecessary];
  uint64_t v4 = ATXModeToString();
  uint64_t v5 = [(NSDictionary *)self->_modeAppLaunchCountBasedOnGlobalPriorsInLast1Day objectForKeyedSubscript:v4];
  unint64_t v6 = (int)[v5 intValue];

  return v6;
}

- (double)modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDaysForMode:(unint64_t)a3
{
  [(ATXAppLaunchProvider *)self cacheAppLaunchStreamIfNecessary];
  uint64_t v4 = ATXModeToString();
  uint64_t v5 = [(NSDictionary *)self->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsInLastNDays objectForKeyedSubscript:v4];
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (double)modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1DayForMode:(unint64_t)a3
{
  [(ATXAppLaunchProvider *)self cacheAppLaunchStreamIfNecessary];
  uint64_t v4 = ATXModeToString();
  uint64_t v5 = [(NSDictionary *)self->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsInLast1Day objectForKeyedSubscript:v4];
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsInLast1Day, 0);
  objc_storeStrong((id *)&self->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsInLastNDays, 0);
  objc_storeStrong((id *)&self->_modeAppLaunchCountBasedOnGlobalPriorsInLast1Day, 0);
  objc_storeStrong((id *)&self->_modeAppLaunchCountBasedOnGlobalPriorsInLastNDays, 0);
  objc_storeStrong((id *)&self->_thresholdDateLastNDays, 0);
}

@end