@interface HKSampleTypeCountDataSource
- (BOOL)supportsChartQueryDataGeneration;
- (id)_chartPointsWithCounts:(id)a3 blockStart:(id)a4 blockEnd:(id)a5 sourceTimeZone:(id)a6;
- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4;
- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5;
- (id)queriesForRequest:(id)a3 completionHandler:(id)a4;
- (id)queryDescription;
- (id)userInfoCreationBlock;
- (void)setUserInfoCreationBlock:(id)a3;
@end

@implementation HKSampleTypeCountDataSource

- (id)queryDescription
{
  v2 = NSString;
  v3 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  v4 = [v3 localization];
  v5 = [v4 displayName];
  v6 = [v2 stringWithFormat:@"HKSampleTypeCount(%@)", v5];

  return v6;
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  v9 = [v8 sampleType];

  v10 = (void *)MEMORY[0x1E4F2B958];
  v11 = [v7 startDate];
  v12 = [v7 endDate];
  v13 = [v7 statisticsInterval];

  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __67__HKSampleTypeCountDataSource_queriesForRequest_completionHandler___block_invoke;
  v22 = &unk_1E6D53038;
  id v23 = v9;
  id v24 = v6;
  id v14 = v6;
  id v15 = v9;
  v16 = [v10 countStatisticsQueryWithSampleType:v15 startDate:v11 endDate:v12 intervalComponents:v13 predicate:0 completion:&v19];

  objc_msgSend(v16, "setDebugIdentifier:", @"charting (sample count)", v19, v20, v21, v22);
  v25[0] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];

  return v17;
}

void __67__HKSampleTypeCountDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    int v8 = objc_msgSend(v6, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E4F29FB0];
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __68__HKHandwashingEventDataSource_queriesForRequest_completionHandler___block_invoke_cold_1();
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __68__HKHandwashingEventDataSource_queriesForRequest_completionHandler___block_invoke_cold_2();
    }
  }
  v10 = objc_alloc_init(HKCodableChartSampleTypeCountDataQueryData);
  v11 = [v5 allKeys];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__HKSampleTypeCountDataSource_queriesForRequest_completionHandler___block_invoke_282;
  v15[3] = &unk_1E6D56648;
  id v16 = v5;
  id v12 = v5;
  v13 = objc_msgSend(v11, "hk_map:", v15);
  id v14 = (void *)[v13 mutableCopy];
  [(HKCodableChartSampleTypeCountDataQueryData *)v10 setTimePeriodToCounts:v14];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

HKCodableSampleTypeCountData *__67__HKSampleTypeCountDataSource_queriesForRequest_completionHandler___block_invoke_282(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(HKCodableSampleTypeCountData);
  id v5 = [v3 startDate];
  [v5 timeIntervalSinceReferenceDate];
  -[HKCodableSampleTypeCountData setStartDate:](v4, "setStartDate:");

  id v6 = [v3 endDate];
  [v6 timeIntervalSinceReferenceDate];
  -[HKCodableSampleTypeCountData setEndDate:](v4, "setEndDate:");

  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];

  -[HKCodableSampleTypeCountData setCount:](v4, "setCount:", [v7 integerValue]);
  return v4;
}

- (id)_chartPointsWithCounts:(id)a3 blockStart:(id)a4 blockEnd:(id)a5 sourceTimeZone:(id)a6
{
  id v8 = a6;
  v9 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v10 = a3;
  id v11 = objc_alloc_init(v9);
  id v12 = [(HKSampleTypeCountDataSource *)self userInfoCreationBlock];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __89__HKSampleTypeCountDataSource__chartPointsWithCounts_blockStart_blockEnd_sourceTimeZone___block_invoke;
  v18[3] = &unk_1E6D56670;
  id v20 = v11;
  id v21 = v12;
  id v19 = v8;
  id v13 = v11;
  id v14 = v8;
  id v15 = v12;
  [v10 enumerateKeysAndObjectsUsingBlock:v18];

  [v13 sortUsingComparator:&__block_literal_global_80];
  id v16 = objc_alloc_init(HKGraphSeriesDataBlock);
  [(HKGraphSeriesDataBlock *)v16 setChartPoints:v13];

  return v16;
}

void __89__HKSampleTypeCountDataSource__chartPointsWithCounts_blockStart_blockEnd_sourceTimeZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    id v7 = (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
  else
  {
    id v7 = 0;
  }
  id v8 = [v15 startDate];
  v9 = objc_msgSend(v8, "hk_dateFromSourceTimeZone:", *(void *)(a1 + 32));

  id v10 = [v15 endDate];
  id v11 = objc_msgSend(v10, "hk_dateFromSourceTimeZone:", *(void *)(a1 + 32));

  id v12 = [HKNumericChartPoint alloc];
  id v13 = HKUIMidDate(v9, v11);
  id v14 = [(HKNumericChartPoint *)v12 initWithXValue:v13 yValue:v5 userInfo:v7];

  [*(id *)(a1 + 40) addObject:v14];
}

uint64_t __89__HKSampleTypeCountDataSource__chartPointsWithCounts_blockStart_blockEnd_sourceTimeZone___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 xValueAsGenericType];
  uint64_t v6 = [v4 xValueAsGenericType];

  uint64_t v7 = [v5 compare:v6];
  return v7;
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
  void v25[2] = __97__HKSampleTypeCountDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v25[3] = &unk_1E6D566B8;
  id v26 = v8;
  v27 = self;
  id v28 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = [(HKSampleTypeCountDataSource *)self queriesForRequest:v12 completionHandler:v25];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __97__HKSampleTypeCountDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_296;
  v23[3] = &unk_1E6D525F0;
  id v14 = v9;
  id v24 = v14;
  [v13 enumerateObjectsUsingBlock:v23];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __97__HKSampleTypeCountDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2;
  v20[3] = &unk_1E6D513B0;
  id v21 = v13;
  id v22 = v14;
  id v15 = v14;
  id v16 = v13;
  v17 = _Block_copy(v20);
  v18 = _Block_copy(v17);

  return v18;
}

void __97__HKSampleTypeCountDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
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
        id v12 = [*(id *)(a1 + 40) displayType];
        id v13 = [v12 objectType];
        id v14 = [v13 identifier];
        id v15 = [v7 localizedDescription];
        int v23 = 138412802;
        id v24 = v11;
        __int16 v25 = 2112;
        id v26 = v14;
        __int16 v27 = 2112;
        id v28 = v15;
        _os_log_impl(&dword_1E0B26000, v10, OS_LOG_TYPE_INFO, "[RemoteCharting]_%@_%@: query returned successfully with error: %@", (uint8_t *)&v23, 0x20u);
      }
    }
    id v16 = *(void **)(a1 + 40);
    v17 = [*(id *)(a1 + 32) startDate];
    v18 = [*(id *)(a1 + 32) endDate];
    id v19 = [*(id *)(a1 + 32) statisticsInterval];
    id v20 = [v5 data];
    id v21 = [v16 codableQueryDataWithType:2 startDate:v17 endDate:v18 statisticsInterval:v19 queryDataObject:v20];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    id v22 = (void *)*MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __97__HKSampleTypeCountDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v22, v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __97__HKSampleTypeCountDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_296(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) executeQuery:a2];
}

void __97__HKSampleTypeCountDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __97__HKSampleTypeCountDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3;
  v2[3] = &unk_1E6D525F0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObjectsUsingBlock:v2];
}

uint64_t __97__HKSampleTypeCountDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) stopQuery:a2];
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 hasTimeZoneName])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CAF0]);
    id v6 = [v4 timeZoneName];
    v31 = (void *)[v5 initWithName:v6];
  }
  else
  {
    v31 = 0;
  }
  uint64_t v7 = [HKCodableChartSampleTypeCountDataQueryData alloc];
  v33 = v4;
  id v8 = [v4 queryDataObject];
  id v9 = [(HKCodableChartSampleTypeCountDataQueryData *)v7 initWithData:v8];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v30 = v9;
  id obj = [(HKCodableChartSampleTypeCountDataQueryData *)v9 timePeriodToCounts];
  uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v16 = objc_alloc(MEMORY[0x1E4F28C18]);
        v17 = (void *)MEMORY[0x1E4F1C9C8];
        [v15 startDate];
        v18 = objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");
        id v19 = (void *)MEMORY[0x1E4F1C9C8];
        [v15 endDate];
        id v20 = objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
        id v21 = (void *)[v16 initWithStartDate:v18 endDate:v20];

        id v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "count"));
        [v10 setObject:v22 forKeyedSubscript:v21];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v12);
  }

  int v23 = (void *)MEMORY[0x1E4F1C9C8];
  [v33 startDate];
  id v24 = objc_msgSend(v23, "dateWithTimeIntervalSinceReferenceDate:");
  __int16 v25 = (void *)MEMORY[0x1E4F1C9C8];
  [v33 endDate];
  id v26 = objc_msgSend(v25, "dateWithTimeIntervalSinceReferenceDate:");
  __int16 v27 = (void *)[v10 copy];
  id v28 = [(HKSampleTypeCountDataSource *)self _chartPointsWithCounts:v27 blockStart:v24 blockEnd:v26 sourceTimeZone:v31];

  return v28;
}

- (id)userInfoCreationBlock
{
  return self->_userInfoCreationBlock;
}

- (void)setUserInfoCreationBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

void __97__HKSampleTypeCountDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = HKStringForChartDataSourceQueryRequestAudience([v5 audience]);
  id v8 = [*(id *)(a1 + 40) displayType];
  id v9 = [v8 objectType];
  id v10 = [v9 identifier];
  uint64_t v11 = [a3 localizedDescription];
  int v12 = 138412802;
  uint64_t v13 = v7;
  __int16 v14 = 2112;
  id v15 = v10;
  __int16 v16 = 2112;
  v17 = v11;
  _os_log_error_impl(&dword_1E0B26000, v6, OS_LOG_TYPE_ERROR, "[RemoteCharting]_%@_%@: unable to fetch results from query with error: %@", (uint8_t *)&v12, 0x20u);
}

@end