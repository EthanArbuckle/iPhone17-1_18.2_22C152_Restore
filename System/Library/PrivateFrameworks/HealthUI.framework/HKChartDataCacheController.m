@interface HKChartDataCacheController
- (BOOL)_anySampleShouldInvalidateCache:(id)a3;
- (BOOL)_displayTypeIsActivity:(id)a3;
- (HKChartDataCacheController)initWithHealthStore:(id)a3 unitController:(id)a4 updateController:(id)a5;
- (HKHealthStore)healthStore;
- (HKSampleTypeUpdateController)updateController;
- (HKUnitPreferenceController)unitController;
- (id)_chartCacheForDisplayType:(id)a3 timeScope:(int64_t)a4 chartCachesByDisplayTypeIdentifier:(id)a5;
- (id)_chartCacheIdentifiersFromSamples:(id)a3;
- (id)_chartCacheIdentifiersFromStartDate:(id)a3 endDate:(id)a4;
- (id)_createAlternateCurrentValueDataProviderForDisplayType:(id)a3 healthStore:(id)a4 updateController:(id)a5 dateCache:(id)a6;
- (id)_createCurrentValueDataProviderForDisplayType:(id)a3 healthStore:(id)a4 updateController:(id)a5 dateCache:(id)a6;
- (id)_generateChartCacheForDisplayType:(id)a3 timeScope:(int64_t)a4;
- (id)_timeScopeBasedChartCacheForDisplayType:(id)a3 timeScope:(int64_t)a4;
- (id)activitySummaryDataProviderWithHealthStore:(id)a3 dateCache:(id)a4 displayTypeController:(id)a5 unitController:(id)a6;
- (id)allInteractiveChartsCaches;
- (id)alternateCurrentValueDataProviderForDisplayType:(id)a3 healthStore:(id)a4 updateController:(id)a5 dateCache:(id)a6;
- (id)currentValueDataProviderForDisplayType:(id)a3 healthStore:(id)a4 updateController:(id)a5 dateCache:(id)a6;
- (id)findCustomCachesForDisplayType:(id)a3;
- (id)interactiveChartsCacheForDisplayType:(id)a3 timeScope:(int64_t)a4;
- (void)_removeCustomCachesForDisplayTypeIdentifier:(int64_t)a3;
- (void)_subscribeForUpdatesForDisplayType:(id)a3;
- (void)addCustomChartCache:(id)a3 forDisplayType:(id)a4;
- (void)removeCachesForDisplayTypeIdentifier:(int64_t)a3;
- (void)setHealthStore:(id)a3;
- (void)setUnitController:(id)a3;
- (void)setUpdateController:(id)a3;
- (void)updateController:(id)a3 didReceiveHighFrequencyUpdateForType:(id)a4;
- (void)updateController:(id)a3 didReceiveUpdateForType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7;
@end

@implementation HKChartDataCacheController

- (HKChartDataCacheController)initWithHealthStore:(id)a3 unitController:(id)a4 updateController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)HKChartDataCacheController;
  v11 = [(HKChartDataCacheController *)&v29 init];
  v12 = v11;
  if (v11)
  {
    [(HKChartDataCacheController *)v11 setHealthStore:v8];
    [(HKChartDataCacheController *)v12 setUnitController:v9];
    [(HKChartDataCacheController *)v12 setUpdateController:v10];
    v13 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v14 = 8;
    do
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(NSArray *)v13 addObject:v15];

      --v14;
    }
    while (v14);
    chartCachesByTimeScopeAndDisplayTypeIdentifier = v12->_chartCachesByTimeScopeAndDisplayTypeIdentifier;
    v12->_chartCachesByTimeScopeAndDisplayTypeIdentifier = v13;
    v17 = v13;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    chartCachesByDisplayTypeIdentifier = v12->_chartCachesByDisplayTypeIdentifier;
    v12->_chartCachesByDisplayTypeIdentifier = v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    chartCachesByCustomDisplayType = v12->_chartCachesByCustomDisplayType;
    v12->_chartCachesByCustomDisplayType = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    currentValueDataProvidersByDisplayType = v12->_currentValueDataProvidersByDisplayType;
    v12->_currentValueDataProvidersByDisplayType = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    alternateCurrentValueDataProvidersByDisplayType = v12->_alternateCurrentValueDataProvidersByDisplayType;
    v12->_alternateCurrentValueDataProvidersByDisplayType = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    secondaryValueDataProviders = v12->_secondaryValueDataProviders;
    v12->_secondaryValueDataProviders = v26;
  }
  return v12;
}

- (void)setUpdateController:(id)a3
{
}

- (void)setUnitController:(id)a3
{
}

- (void)setHealthStore:(id)a3
{
}

- (id)interactiveChartsCacheForDisplayType:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  if (objc_msgSend(v6, "hk_healthQueryChartDataSourceDependsOnTimeScope")) {
    [(HKChartDataCacheController *)self _timeScopeBasedChartCacheForDisplayType:v6 timeScope:a4];
  }
  else {
  v7 = [(HKChartDataCacheController *)self _chartCacheForDisplayType:v6 timeScope:a4 chartCachesByDisplayTypeIdentifier:self->_chartCachesByDisplayTypeIdentifier];
  }

  return v7;
}

- (id)allInteractiveChartsCaches
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v4 = self->_chartCachesByTimeScopeAndDisplayTypeIdentifier;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v10 = [v9 allValues];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v45 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v36;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v36 != v13) {
                objc_enumerationMutation(v10);
              }
              [v3 addObject:*(void *)(*((void *)&v35 + 1) + 8 * j)];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v45 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v6);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v15 = [(NSMutableDictionary *)self->_chartCachesByDisplayTypeIdentifier allValues];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        [v3 addObject:*(void *)(*((void *)&v31 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v17);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v20 = self->_chartCachesByCustomDisplayType;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * m), "chartCache", (void)v27);
        [v3 addObject:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v43 count:16];
    }
    while (v22);
  }

  return v3;
}

- (id)_timeScopeBasedChartCacheForDisplayType:(id)a3 timeScope:(int64_t)a4
{
  chartCachesByTimeScopeAndDisplayTypeIdentifier = self->_chartCachesByTimeScopeAndDisplayTypeIdentifier;
  id v7 = a3;
  id v8 = [(NSArray *)chartCachesByTimeScopeAndDisplayTypeIdentifier objectAtIndexedSubscript:a4];
  id v9 = [(HKChartDataCacheController *)self _chartCacheForDisplayType:v7 timeScope:a4 chartCachesByDisplayTypeIdentifier:v8];

  return v9;
}

- (id)_chartCacheForDisplayType:(id)a3 timeScope:(int64_t)a4 chartCachesByDisplayTypeIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "displayTypeIdentifier"));
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];
  if (!v11)
  {
    uint64_t v11 = [(HKChartDataCacheController *)self _generateChartCacheForDisplayType:v8 timeScope:a4];
    [v11 setShouldBufferFetchOperations:1];
    [v9 setObject:v11 forKeyedSubscript:v10];
    [(HKChartDataCacheController *)self _subscribeForUpdatesForDisplayType:v8];
  }

  return v11;
}

- (id)_generateChartCacheForDisplayType:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(HKChartDataCacheController *)self healthStore];
  id v8 = [(HKChartDataCacheController *)self unitController];
  id v9 = objc_msgSend(v6, "hk_healthQueryChartCacheDataSourceForTimeScope:healthStore:unitController:", a4, v7, v8);

  id v10 = objc_alloc_init(HKChartCache);
  [(HKChartCache *)v10 setDataSource:v9];
  uint64_t v11 = +[HKOutstandingFetchOperationManager sharedOperationManager];
  [(HKChartCache *)v10 setOperationManager:v11];

  return v10;
}

- (void)updateController:(id)a3 didReceiveUpdateForType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  if ([a6 count])
  {
    uint64_t v11 = 0;
    int v12 = 1;
  }
  else
  {
    uint64_t v11 = 0;
    int v12 = 1;
    if (![(HKChartDataCacheController *)self _anySampleShouldInvalidateCache:v10]
      && !a7)
    {
      if ([v10 count])
      {
        uint64_t v11 = [(HKChartDataCacheController *)self _chartCacheIdentifiersFromSamples:v10];
        int v12 = 0;
      }
      else
      {
        int v12 = 0;
        uint64_t v11 = 0;
      }
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = [(HKChartDataCacheController *)self allInteractiveChartsCaches];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v18 setShouldBufferFetchOperations:0];
        if (v12)
        {
          [v18 invalidateCache];
        }
        else if (v11)
        {
          [v18 invalidateResultsForIdentifiers:v11];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }
}

- (BOOL)_anySampleShouldInvalidateCache:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2BA20]];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v6)
  {
    BOOL v11 = 0;
    goto LABEL_17;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v16;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v11 = 1;
        goto LABEL_17;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v12 = objc_msgSend(v10, "quantityType", (void)v15);
        BOOL v11 = v12 == v4;
LABEL_16:

        goto LABEL_17;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v12 = objc_msgSend(v10, "categoryType", (void)v15);
        uint64_t v13 = [MEMORY[0x1E4F2B2C0] categoryTypeForIdentifier:*MEMORY[0x1E4F29870]];
        BOOL v11 = v12 == v13;

        goto LABEL_16;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    BOOL v11 = 0;
    if (v7) {
      continue;
    }
    break;
  }
LABEL_17:

  return v11;
}

- (void)updateController:(id)a3 didReceiveHighFrequencyUpdateForType:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  objc_opt_class();
  double v7 = 1.0;
  if (objc_opt_isKindOfClass())
  {
    id v8 = v5;
    if ([v8 isMinimumDurationRestricted])
    {
      [v8 minimumAllowedDuration];
      double v7 = v9 + 1.0;
    }
  }
  id v10 = [v6 dateByAddingTimeInterval:-v7];
  BOOL v11 = [(HKChartDataCacheController *)self _chartCacheIdentifiersFromStartDate:v10 endDate:v6];
  int v12 = [v11 allObjects];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v13 = [(HKChartDataCacheController *)self allInteractiveChartsCaches];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v17++) invalidateResultsForIdentifiers:v12];
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

- (id)_chartCacheIdentifiersFromSamples:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v12 = objc_msgSend(v11, "hasUndeterminedDuration", (void)v18);
        uint64_t v13 = [v11 startDate];
        if (v12) {
          [MEMORY[0x1E4F1C9C8] now];
        }
        else {
        uint64_t v14 = [v11 endDate];
        }
        uint64_t v15 = [(HKChartDataCacheController *)self _chartCacheIdentifiersFromStartDate:v13 endDate:v14];
        [v5 unionSet:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  uint64_t v16 = [v5 allObjects];

  return v16;
}

- (id)_chartCacheIdentifiersFromStartDate:(id)a3 endDate:(id)a4
{
  id v20 = a3;
  id v19 = a4;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  for (uint64_t i = 0; i != 8; ++i)
  {
    uint64_t v7 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:i];
    [v7 approximateSeriesPointIntervalAtResolution:0];
    double v9 = v8;
    id v10 = [v20 dateByAddingTimeInterval:-v8];
    BOOL v11 = [v19 dateByAddingTimeInterval:v9];
    uint64_t v12 = 0;
    char v13 = 1;
    do
    {
      char v14 = v13;
      memset(v23, 0, sizeof(v23));
      HKGraphSeriesDataBlockPathContainingDate(v10, i, v12, v23);
      memset(v22, 0, sizeof(v22));
      HKGraphSeriesDataBlockPathContainingDate(v11, i, v12, v22);
      uint64_t v15 = v23[0];
      if (v23[0] <= v22[0])
      {
        do
        {
          v21[0] = v15;
          v21[1] = i;
          v21[2] = v12;
          uint64_t v16 = [MEMORY[0x1E4F29238] valueWithHKGraphSeriesDataBlockPath:v21];
          [v5 addObject:v16];
        }
        while (v15++ < v22[0]);
      }
      char v13 = 0;
      uint64_t v12 = 1;
    }
    while ((v14 & 1) != 0);
  }
  return v5;
}

- (void)_subscribeForUpdatesForDisplayType:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 displayTypeIdentifier] == 80)
  {
    id v5 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A620]];
    id v6 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A618]];
    [(HKSampleTypeUpdateController *)self->_updateController addObserver:self forType:v5];
    [(HKSampleTypeUpdateController *)self->_updateController addObserver:self forType:v6];

LABEL_13:
    goto LABEL_14;
  }
  if (![(HKChartDataCacheController *)self _displayTypeIsActivity:v4])
  {
    uint64_t v7 = [v4 sampleType];
    double v8 = [v7 identifier];
    double v9 = (void *)*MEMORY[0x1E4F2BA18];

    if (v8 == v9)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = objc_msgSend(MEMORY[0x1E4F2B448], "associatedBalanceMetricsTypes", 0);
      uint64_t v10 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v15;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v15 != v12) {
              objc_enumerationMutation(v5);
            }
            [(HKSampleTypeUpdateController *)self->_updateController addObserver:self forType:*(void *)(*((void *)&v14 + 1) + 8 * v13++)];
          }
          while (v11 != v13);
          uint64_t v11 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v11);
      }
    }
    else
    {
      id v5 = [v4 sampleType];
      [(HKSampleTypeUpdateController *)self->_updateController addObserver:self forType:v5];
    }
    goto LABEL_13;
  }
LABEL_14:
}

- (BOOL)_displayTypeIsActivity:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 baseDisplayType];
    char v5 = [v4 isActivitySummary];
  }
  else
  {
    char v5 = [v3 isActivitySummary];
  }

  return v5;
}

- (id)currentValueDataProviderForDisplayType:(id)a3 healthStore:(id)a4 updateController:(id)a5 dateCache:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = [(NSMutableDictionary *)self->_currentValueDataProvidersByDisplayType objectForKeyedSubscript:v10];
  if (!v14)
  {
    long long v14 = [(HKChartDataCacheController *)self _createCurrentValueDataProviderForDisplayType:v10 healthStore:v11 updateController:v12 dateCache:v13];
    if (v14) {
      [(NSMutableDictionary *)self->_currentValueDataProvidersByDisplayType setObject:v14 forKeyedSubscript:v10];
    }
  }

  return v14;
}

- (id)alternateCurrentValueDataProviderForDisplayType:(id)a3 healthStore:(id)a4 updateController:(id)a5 dateCache:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = [(NSMutableDictionary *)self->_alternateCurrentValueDataProvidersByDisplayType objectForKeyedSubscript:v10];
  if (!v14)
  {
    uint64_t v15 = [(HKChartDataCacheController *)self _createAlternateCurrentValueDataProviderForDisplayType:v10 healthStore:v11 updateController:v12 dateCache:v13];
    if (v15)
    {
      long long v14 = (void *)v15;
      [(NSMutableDictionary *)self->_alternateCurrentValueDataProvidersByDisplayType setObject:v15 forKeyedSubscript:v10];
    }
    else
    {
      long long v16 = [(HKChartDataCacheController *)self currentValueDataProviderForDisplayType:v10 healthStore:v11 updateController:v12 dateCache:v13];
      long long v14 = v16;
      if (v16) {
        [(NSMutableDictionary *)self->_alternateCurrentValueDataProvidersByDisplayType setObject:v16 forKeyedSubscript:v10];
      }
    }
  }

  return v14;
}

- (id)_createCurrentValueDataProviderForDisplayType:(id)a3 healthStore:(id)a4 updateController:(id)a5 dateCache:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v9 presentation];
  long long v14 = [v13 configurationForTimeScope:5];
  uint64_t v15 = [v14 currentValue];

  switch(v15)
  {
    case 1:
      long long v16 = HKMostRecentValueDataProvider;
      goto LABEL_6;
    case 2:
      long long v16 = HKCumulativeSumCurrentValueDataProvider;
      goto LABEL_6;
    case 3:
      long long v16 = HKMostRecentTimePeriodCurrentValueDataProvider;
LABEL_6:
      uint64_t v18 = [[v16 alloc] initWithHealthStore:v10 updateController:v11 dateCache:v12 displayType:v9];
      goto LABEL_10;
    case 4:
      uint64_t v19 = [HKCountCurrentValueDataProvider alloc];
      id v20 = v10;
      id v21 = v11;
      id v22 = v12;
      id v23 = v9;
      uint64_t v24 = 0;
      goto LABEL_9;
    case 5:
      uint64_t v19 = [HKCountCurrentValueDataProvider alloc];
      id v20 = v10;
      id v21 = v11;
      id v22 = v12;
      id v23 = v9;
      uint64_t v24 = 1;
LABEL_9:
      uint64_t v18 = [(HKCountCurrentValueDataProvider *)v19 initWithHealthStore:v20 updateController:v21 dateCache:v22 displayType:v23 countStyle:v24];
LABEL_10:
      long long v17 = (void *)v18;
      break;
    default:
      long long v17 = 0;
      break;
  }

  return v17;
}

- (id)_createAlternateCurrentValueDataProviderForDisplayType:(id)a3 healthStore:(id)a4 updateController:(id)a5 dateCache:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v9 presentation];
  long long v14 = [v13 configurationForTimeScope:5];
  uint64_t v15 = [v14 currentValue];

  if (v15 == 6) {
    long long v16 = [(HKValueDataProvider *)[HKLastUpdatedDayCurrentValueDataProvider alloc] initWithHealthStore:v10 updateController:v11 dateCache:v12 displayType:v9];
  }
  else {
    long long v16 = 0;
  }

  return v16;
}

- (id)activitySummaryDataProviderWithHealthStore:(id)a3 dateCache:(id)a4 displayTypeController:(id)a5 unitController:(id)a6
{
  activitySummaryDataProvider = self->_activitySummaryDataProvider;
  if (!activitySummaryDataProvider)
  {
    id v11 = a6;
    id v12 = a5;
    id v13 = a4;
    id v14 = a3;
    uint64_t v15 = [[HKActivitySummaryDataProvider alloc] initWithHealthStore:v14 dateCache:v13 displayTypeController:v12 unitController:v11];

    long long v16 = self->_activitySummaryDataProvider;
    self->_activitySummaryDataProvider = v15;

    activitySummaryDataProvider = self->_activitySummaryDataProvider;
  }
  return activitySummaryDataProvider;
}

- (void)addCustomChartCache:(id)a3 forDisplayType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [[_HKCustomCacheDisplayTypeTuple alloc] initWithCustomCache:v7 displayType:v6];

  [(NSMutableArray *)self->_chartCachesByCustomDisplayType addObject:v8];
  [(HKChartDataCacheController *)self _subscribeForUpdatesForDisplayType:v6];
}

- (void)_removeCustomCachesForDisplayTypeIdentifier:(int64_t)a3
{
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if ([(NSMutableArray *)self->_chartCachesByCustomDisplayType count])
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = [(NSMutableArray *)self->_chartCachesByCustomDisplayType objectAtIndexedSubscript:v5];
      id v7 = [v6 displayType];
      uint64_t v8 = [v7 displayTypeIdentifier];

      if (v8 == a3) {
        [v9 addIndex:v5];
      }

      ++v5;
    }
    while (v5 < [(NSMutableArray *)self->_chartCachesByCustomDisplayType count]);
  }
  [(NSMutableArray *)self->_chartCachesByCustomDisplayType removeObjectsAtIndexes:v9];
}

- (id)findCustomCachesForDisplayType:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = self->_chartCachesByCustomDisplayType;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "displayType", (void)v16);
        int v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v14 = [v11 chartCache];
          [v5 addObject:v14];
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)removeCachesForDisplayTypeIdentifier:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:");
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_chartCachesByTimeScopeAndDisplayTypeIdentifier;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "removeObjectForKey:", v5, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(NSMutableDictionary *)self->_chartCachesByDisplayTypeIdentifier removeObjectForKey:v5];
  [(HKChartDataCacheController *)self _removeCustomCachesForDisplayTypeIdentifier:a3];
}

- (HKSampleTypeUpdateController)updateController
{
  return self->_updateController;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_updateController, 0);
  objc_storeStrong((id *)&self->_activitySummaryDataProvider, 0);
  objc_storeStrong((id *)&self->_secondaryValueDataProviders, 0);
  objc_storeStrong((id *)&self->_alternateCurrentValueDataProvidersByDisplayType, 0);
  objc_storeStrong((id *)&self->_currentValueDataProvidersByDisplayType, 0);
  objc_storeStrong((id *)&self->_chartCachesByCustomDisplayType, 0);
  objc_storeStrong((id *)&self->_chartCachesByDisplayTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_chartCachesByTimeScopeAndDisplayTypeIdentifier, 0);
}

@end