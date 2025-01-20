@interface HKHorizontalTimePeriodDataSource
- (BOOL)supportsChartQueryDataGeneration;
- (HKSampleType)sampleType;
- (NSArray)valueOrder;
- (id)_chartPointsWithDateIntervalsByValue:(id)a3 sourceTimeZone:(id)a4;
- (id)_codableQueryDataWithSamples:(id)a3;
- (id)_dateIntervalsByValueWithCodableQueryData:(id)a3;
- (id)_organizeSamplesByValueAndDateInterval:(id)a3;
- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4;
- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5;
- (id)queriesForRequest:(id)a3 completionHandler:(id)a4;
- (id)queryDescription;
- (id)userInfoCreationBlock;
- (void)setSampleType:(id)a3;
- (void)setUserInfoCreationBlock:(id)a3;
- (void)setValueOrder:(id)a3;
@end

@implementation HKHorizontalTimePeriodDataSource

- (id)queryDescription
{
  v2 = NSString;
  v3 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  v4 = [v3 localization];
  v5 = [v4 displayName];
  v6 = [v2 stringWithFormat:@"HKHorizontalTimePeriod(%@)", v5];

  return v6;
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F2B3C0];
  id v8 = a3;
  v9 = [v8 startDate];
  v10 = [v8 endDate];

  v11 = [v7 predicateForSamplesWithStartDate:v9 endDate:v10 options:1];

  v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*MEMORY[0x1E4F2A9B8] ascending:1];
  id v13 = objc_alloc(MEMORY[0x1E4F2B440]);
  sampleType = self->_sampleType;
  v23[0] = v12;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__HKHorizontalTimePeriodDataSource_queriesForRequest_completionHandler___block_invoke;
  v20[3] = &unk_1E6D525A0;
  v20[4] = self;
  id v21 = v6;
  id v16 = v6;
  v17 = (void *)[v13 initWithSampleType:sampleType predicate:v11 limit:0 sortDescriptors:v15 resultsHandler:v20];

  [v17 setDebugIdentifier:@"charting (horizontal time period)"];
  v22 = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];

  return v18;
}

void __72__HKHorizontalTimePeriodDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v9)
  {
    int v11 = objc_msgSend(v9, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x1E4F29FB0];
    id v13 = *MEMORY[0x1E4F29FB0];
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __72__HKHorizontalSingleLineDataSource_queriesForRequest_completionHandler___block_invoke_cold_1(a1, v12);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __72__HKHorizontalSingleLineDataSource_queriesForRequest_completionHandler___block_invoke_cold_2(a1, v12);
    }
  }
  v14 = [*(id *)(a1 + 32) _codableQueryDataWithSamples:v8];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_chartPointsWithDateIntervalsByValue:(id)a3 sourceTimeZone:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = [(HKHorizontalTimePeriodDataSource *)self userInfoCreationBlock];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__HKHorizontalTimePeriodDataSource__chartPointsWithDateIntervalsByValue_sourceTimeZone___block_invoke;
  aBlock[3] = &unk_1E6D56248;
  id v10 = v7;
  id v49 = v10;
  id v11 = v9;
  id v50 = v11;
  v12 = _Block_copy(aBlock);
  id v13 = (void (**)(void, void, void, void))v12;
  valueOrder = self->_valueOrder;
  if (valueOrder)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v45 = 0u;
    long long v44 = 0u;
    v15 = valueOrder;
    uint64_t v33 = [(NSArray *)v15 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v33)
    {
      obj = v15;
      id v29 = v11;
      uint64_t v16 = 0;
      uint64_t v31 = *(void *)v45;
      id v32 = v6;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v45 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = v17;
          v18 = *(void **)(*((void *)&v44 + 1) + 8 * v17);
          v19 = [v6 objectForKeyedSubscript:v18];
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v35 = v19;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v51 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v41;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v41 != v22) {
                  objc_enumerationMutation(v35);
                }
                uint64_t v24 = *(void *)(*((void *)&v40 + 1) + 8 * i);
                v25 = [NSNumber numberWithInteger:v16];
                v26 = ((void (**)(void, uint64_t, void *, uint64_t))v13)[2](v13, v24, v25, [v18 integerValue]);

                [v8 addObject:v26];
              }
              uint64_t v21 = [v35 countByEnumeratingWithState:&v40 objects:v51 count:16];
            }
            while (v21);
          }
          ++v16;

          uint64_t v17 = v34 + 1;
          id v6 = v32;
        }
        while (v34 + 1 != v33);
        uint64_t v33 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v33);
      id v11 = v29;
      v15 = obj;
    }
  }
  else
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __88__HKHorizontalTimePeriodDataSource__chartPointsWithDateIntervalsByValue_sourceTimeZone___block_invoke_293;
    v36[3] = &unk_1E6D56270;
    v39 = v12;
    id v37 = &unk_1F3C22720;
    id v38 = v8;
    [v6 enumerateKeysAndObjectsUsingBlock:v36];

    v15 = v39;
  }

  v27 = objc_alloc_init(HKGraphSeriesDataBlock);
  [(HKGraphSeriesDataBlock *)v27 setChartPoints:v8];

  return v27;
}

HKHorizontalTimePeriodChartPoint *__88__HKHorizontalTimePeriodDataSource__chartPointsWithDateIntervalsByValue_sourceTimeZone___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  id v8 = a2;
  id v9 = objc_alloc_init(HKHorizontalTimePeriodChartPoint);
  id v10 = [v8 startDate];
  id v11 = objc_msgSend(v10, "hk_dateFromSourceTimeZone:", *(void *)(a1 + 32));

  v12 = [v8 endDate];

  id v13 = objc_msgSend(v12, "hk_dateFromSourceTimeZone:", *(void *)(a1 + 32));

  [(HKHorizontalTimePeriodChartPoint *)v9 setXStart:v11];
  [(HKHorizontalTimePeriodChartPoint *)v9 setXEnd:v13];
  [(HKHorizontalTimePeriodChartPoint *)v9 setYValue:v7];

  uint64_t v14 = *(void *)(a1 + 40);
  if (v14)
  {
    v15 = (*(void (**)(uint64_t, uint64_t, void *, void *))(v14 + 16))(v14, a4, v11, v13);
    [(HKHorizontalTimePeriodChartPoint *)v9 setUserInfo:v15];
  }
  return v9;
}

void __88__HKHorizontalTimePeriodDataSource__chartPointsWithDateIntervalsByValue_sourceTimeZone___block_invoke_293(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (*(void (**)(void, void, void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(*((void *)&v12 + 1) + 8 * v10), *(void *)(a1 + 32), [v5 integerValue]);
        [*(id *)(a1 + 40) addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (id)_organizeSamplesByValueAndDateInterval:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "hk_integerValue"));
        id v12 = [v4 objectForKeyedSubscript:v11];
        if (!v12)
        {
          id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v4 setObject:v12 forKeyedSubscript:v11];
        }
        [v12 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__HKHorizontalTimePeriodDataSource__organizeSamplesByValueAndDateInterval___block_invoke;
  v16[3] = &unk_1E6D56298;
  id v14 = v13;
  id v17 = v14;
  [v4 enumerateKeysAndObjectsUsingBlock:v16];

  return v14;
}

void __75__HKHorizontalTimePeriodDataSource__organizeSamplesByValueAndDateInterval___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x1E4F2B958];
  id v6 = a2;
  id v7 = [v5 coalesceTimePeriodsFromSamples:a3 strictStartDate:0 strictEndDate:0];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (id)_dateIntervalsByValueWithCodableQueryData:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v18 = v3;
  obuint64_t j = [v3 dateIntervalsByValues];
  uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "value"));
        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v10 = [v7 dateIntervals];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", *(void *)(*((void *)&v22 + 1) + 8 * j), 0);
              [v9 addObject:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v12);
        }

        uint64_t v16 = (void *)[v9 copy];
        [v21 setObject:v16 forKeyedSubscript:v8];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v5);
  }

  return v21;
}

- (id)_codableQueryDataWithSamples:(id)a3
{
  id v3 = [(HKHorizontalTimePeriodDataSource *)self _organizeSamplesByValueAndDateInterval:a3];
  uint64_t v4 = objc_alloc_init(HKCodableChartHorizontalTimePeriodDataSourceData);
  uint64_t v5 = [v3 allKeys];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__HKHorizontalTimePeriodDataSource__codableQueryDataWithSamples___block_invoke;
  v10[3] = &unk_1E6D562E0;
  id v11 = v3;
  id v6 = v3;
  id v7 = objc_msgSend(v5, "hk_map:", v10);
  uint64_t v8 = (void *)[v7 mutableCopy];
  [(HKCodableChartHorizontalTimePeriodDataSourceData *)v4 setDateIntervalsByValues:v8];

  return v4;
}

HKCodableHorizontalTimePeriodData *__65__HKHorizontalTimePeriodDataSource__codableQueryDataWithSamples___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(HKCodableHorizontalTimePeriodData);
  -[HKCodableHorizontalTimePeriodData setValue:](v4, "setValue:", [v3 integerValue]);
  uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];

  id v6 = objc_msgSend(v5, "hk_map:", &__block_literal_global_78);
  id v7 = (void *)[v6 mutableCopy];
  [(HKCodableHorizontalTimePeriodData *)v4 setDateIntervals:v7];

  return v4;
}

HKCodableDateInterval *__65__HKHorizontalTimePeriodDataSource__codableQueryDataWithSamples___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(HKCodableDateInterval);
  uint64_t v4 = [v2 startDate];
  HKEncodeValueForDate(v4);
  -[HKCodableDateInterval setStartDate:](v3, "setStartDate:");

  uint64_t v5 = [v2 endDate];

  HKEncodeValueForDate(v5);
  -[HKCodableDateInterval setEndDate:](v3, "setEndDate:");

  return v3;
}

- (BOOL)supportsChartQueryDataGeneration
{
  return 1;
}

- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __102__HKHorizontalTimePeriodDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v25[3] = &unk_1E6D56308;
  id v26 = v8;
  long long v27 = self;
  id v28 = v10;
  id v11 = v10;
  id v12 = v8;
  uint64_t v13 = [(HKHorizontalTimePeriodDataSource *)self queriesForRequest:v12 completionHandler:v25];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __102__HKHorizontalTimePeriodDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_305;
  v23[3] = &unk_1E6D525F0;
  id v14 = v9;
  id v24 = v14;
  [v13 enumerateObjectsUsingBlock:v23];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __102__HKHorizontalTimePeriodDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2;
  v20[3] = &unk_1E6D513B0;
  id v21 = v13;
  id v22 = v14;
  id v15 = v14;
  id v16 = v13;
  id v17 = _Block_copy(v20);
  long long v18 = _Block_copy(v17);

  return v18;
}

void __102__HKHorizontalTimePeriodDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    if (v6)
    {
      _HKInitializeLogging();
      id v8 = (void *)*MEMORY[0x1E4F29FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_INFO))
      {
        id v9 = *(void **)(a1 + 32);
        id v10 = v8;
        id v11 = HKStringForChartDataSourceQueryRequestAudience([v9 audience]);
        id v12 = [*(id *)(*(void *)(a1 + 40) + 48) identifier];
        uint64_t v13 = [v7 localizedDescription];
        int v21 = 138412802;
        id v22 = v11;
        __int16 v23 = 2112;
        id v24 = v12;
        __int16 v25 = 2112;
        id v26 = v13;
        _os_log_impl(&dword_1E0B26000, v10, OS_LOG_TYPE_INFO, "[RemoteCharting]_%@_%@: query returned successfully with error: %@", (uint8_t *)&v21, 0x20u);
      }
    }
    id v14 = *(void **)(a1 + 40);
    id v15 = [*(id *)(a1 + 32) startDate];
    id v16 = [*(id *)(a1 + 32) endDate];
    id v17 = [*(id *)(a1 + 32) statisticsInterval];
    long long v18 = [v5 data];
    long long v19 = [v14 codableQueryDataWithType:6 startDate:v15 endDate:v16 statisticsInterval:v17 queryDataObject:v18];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v20 = (void *)*MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __102__HKHorizontalTimePeriodDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v20, v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __102__HKHorizontalTimePeriodDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_305(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) executeQuery:a2];
}

void __102__HKHorizontalTimePeriodDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __102__HKHorizontalTimePeriodDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3;
  v2[3] = &unk_1E6D525F0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObjectsUsingBlock:v2];
}

uint64_t __102__HKHorizontalTimePeriodDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) stopQuery:a2];
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v5 = a3;
  if ([v5 hasTimeZoneName])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAF0]);
    id v7 = [v5 timeZoneName];
    id v8 = (void *)[v6 initWithName:v7];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [HKCodableChartHorizontalTimePeriodDataSourceData alloc];
  id v10 = [v5 queryDataObject];
  id v11 = [(HKCodableChartHorizontalTimePeriodDataSourceData *)v9 initWithData:v10];

  id v12 = [(HKHorizontalTimePeriodDataSource *)self _dateIntervalsByValueWithCodableQueryData:v11];
  uint64_t v13 = [(HKHorizontalTimePeriodDataSource *)self _chartPointsWithDateIntervalsByValue:v12 sourceTimeZone:v8];

  return v13;
}

- (HKSampleType)sampleType
{
  return self->_sampleType;
}

- (void)setSampleType:(id)a3
{
}

- (id)userInfoCreationBlock
{
  return self->_userInfoCreationBlock;
}

- (void)setUserInfoCreationBlock:(id)a3
{
}

- (NSArray)valueOrder
{
  return self->_valueOrder;
}

- (void)setValueOrder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueOrder, 0);
  objc_storeStrong(&self->_userInfoCreationBlock, 0);
  objc_storeStrong((id *)&self->_sampleType, 0);
}

void __102__HKHorizontalTimePeriodDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = HKStringForChartDataSourceQueryRequestAudience([v5 audience]);
  id v8 = [*(id *)(*(void *)(a1 + 40) + 48) identifier];
  id v9 = [a3 localizedDescription];
  int v10 = 138412802;
  id v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = v8;
  __int16 v14 = 2112;
  id v15 = v9;
  _os_log_error_impl(&dword_1E0B26000, v6, OS_LOG_TYPE_ERROR, "[RemoteCharting]_%@_%@: unable to fetch results from query with error: %@", (uint8_t *)&v10, 0x20u);
}

@end