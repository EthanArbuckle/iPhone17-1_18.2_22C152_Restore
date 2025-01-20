@interface HKHorizontalSingleLineDataSource
- (BOOL)supportsChartQueryDataGeneration;
- (HKSampleType)sampleType;
- (id)_chartPointsWithSamples:(id)a3 blockStart:(id)a4 blockEnd:(id)a5 sourceTimeZone:(id)a6;
- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4;
- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5;
- (id)queriesForRequest:(id)a3 completionHandler:(id)a4;
- (id)queryDescription;
- (id)userInfoCreationBlock;
- (void)setSampleType:(id)a3;
- (void)setUserInfoCreationBlock:(id)a3;
@end

@implementation HKHorizontalSingleLineDataSource

- (id)queryDescription
{
  v2 = NSString;
  v3 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  v4 = [v3 localization];
  v5 = [v4 displayName];
  v6 = [v2 stringWithFormat:@"HKHorizontalSingleLine(%@)", v5];

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

  v11 = [v7 predicateForSamplesWithStartDate:v9 endDate:v10 options:0];

  v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*MEMORY[0x1E4F2A9B8] ascending:1];
  id v13 = objc_alloc(MEMORY[0x1E4F2B440]);
  sampleType = self->_sampleType;
  v23[0] = v12;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__HKHorizontalSingleLineDataSource_queriesForRequest_completionHandler___block_invoke;
  v20[3] = &unk_1E6D525A0;
  v20[4] = self;
  id v21 = v6;
  id v16 = v6;
  v17 = (void *)[v13 initWithSampleType:sampleType predicate:v11 limit:0 sortDescriptors:v15 resultsHandler:v20];

  [v17 setDebugIdentifier:@"charting (horizontal single line)"];
  v22 = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];

  return v18;
}

void __72__HKHorizontalSingleLineDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
  v14 = objc_alloc_init(HKCodableSampleDataSourceQueryData);
  v15 = objc_msgSend(v8, "hk_map:", &__block_literal_global_18);
  id v16 = (void *)[v15 mutableCopy];
  [(HKCodableSampleDataSourceQueryData *)v14 setSamples:v16];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __72__HKHorizontalSingleLineDataSource_queriesForRequest_completionHandler___block_invoke_285(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 metadata];
  v4 = objc_msgSend(v3, "hk_filter:", &__block_literal_global_289);
  [v2 _setMetadata:v4];

  v5 = [v2 codableSampleChartData];

  return v5;
}

uint64_t __72__HKHorizontalSingleLineDataSource_queriesForRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqual:*MEMORY[0x1E4F2A1A8]];
}

- (id)_chartPointsWithSamples:(id)a3 blockStart:(id)a4 blockEnd:(id)a5 sourceTimeZone:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v33 = a6;
  v31 = self;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = [(HKHorizontalSingleLineDataSource *)self userInfoCreationBlock];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v8;
  uint64_t v34 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v34)
  {
    id v10 = 0;
    uint64_t v30 = *(void *)v36;
    uint64_t v29 = *MEMORY[0x1E4F2A1A8];
    do
    {
      uint64_t v11 = 0;
      v12 = v10;
      do
      {
        if (*(void *)v36 != v30) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v35 + 1) + 8 * v11);
        v14 = objc_alloc_init(HKHorizontalSingleLineChartPoint);
        v15 = [v13 startDate];
        id v16 = objc_msgSend(v15, "hk_dateFromSourceTimeZone:", v33);

        v17 = [v13 endDate];
        v18 = objc_msgSend(v17, "hk_dateFromSourceTimeZone:", v33);

        v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "hk_integerValue"));
        if (v12)
        {
          [v16 timeIntervalSinceDate:v12];
          BOOL v21 = v20 < 172800.0;
        }
        else
        {
          BOOL v21 = 0;
        }
        id v10 = v16;

        [(HKHorizontalSingleLineChartPoint *)v14 setXValue:v10];
        [(HKHorizontalSingleLineChartPoint *)v14 setYValue:v19];
        [(HKHorizontalSingleLineChartPoint *)v14 setGroupToPrevious:v21];
        if (v9)
        {
          v22 = [v13 metadata];
          v23 = [v22 valueForKey:v29];
          unsigned int v24 = [v23 BOOLValue];

          v25 = ((void (**)(void, uint64_t, id, void *, void))v9)[2](v9, [v19 integerValue], v10, v18, v24);
          [(HKHorizontalSingleLineChartPoint *)v14 setUserInfo:v25];
        }
        [(HKHorizontalSingleLineChartPoint *)v14 setMarkStyle:0];
        [(HKHorizontalSingleLineDataSource *)v31 applyMarkStyleToPoint:v14 sample:v13];
        [v32 addObject:v14];

        ++v11;
        v12 = v10;
      }
      while (v34 != v11);
      uint64_t v34 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v34);
  }
  v26 = objc_alloc_init(HKGraphSeriesDataBlock);
  [(HKGraphSeriesDataBlock *)v26 setChartPoints:v32];

  return v26;
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
  v25[2] = __102__HKHorizontalSingleLineDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v25[3] = &unk_1E6D525C8;
  id v26 = v8;
  v27 = self;
  id v28 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = [(HKHorizontalSingleLineDataSource *)self queriesForRequest:v12 completionHandler:v25];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __102__HKHorizontalSingleLineDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_299;
  v23[3] = &unk_1E6D525F0;
  id v14 = v9;
  id v24 = v14;
  [v13 enumerateObjectsUsingBlock:v23];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __102__HKHorizontalSingleLineDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2;
  v20[3] = &unk_1E6D513B0;
  id v21 = v13;
  id v22 = v14;
  id v15 = v14;
  id v16 = v13;
  v17 = _Block_copy(v20);
  v18 = _Block_copy(v17);

  return v18;
}

void __102__HKHorizontalSingleLineDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
        id v13 = [v7 localizedDescription];
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
    v17 = [*(id *)(a1 + 32) statisticsInterval];
    v18 = [v5 data];
    v19 = [v14 codableQueryDataWithType:8 startDate:v15 endDate:v16 statisticsInterval:v17 queryDataObject:v18];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    double v20 = (void *)*MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __102__HKHorizontalSingleLineDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v20, v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __102__HKHorizontalSingleLineDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_299(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) executeQuery:a2];
}

void __102__HKHorizontalSingleLineDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __102__HKHorizontalSingleLineDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3;
  v2[3] = &unk_1E6D525F0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObjectsUsingBlock:v2];
}

uint64_t __102__HKHorizontalSingleLineDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
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
  id v9 = [HKCodableSampleDataSourceQueryData alloc];
  id v10 = [v5 queryDataObject];
  id v11 = [(HKCodableSampleDataSourceQueryData *)v9 initWithData:v10];

  id v12 = [(HKCodableSampleDataSourceQueryData *)v11 samples];
  id v13 = objc_msgSend(v12, "hk_map:", &__block_literal_global_305);
  id v14 = (void *)[v13 copy];

  id v15 = (void *)MEMORY[0x1E4F1C9C8];
  [v5 startDate];
  id v16 = objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
  v17 = (void *)MEMORY[0x1E4F1C9C8];
  [v5 endDate];
  v18 = objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");
  v19 = [(HKHorizontalSingleLineDataSource *)self _chartPointsWithSamples:v14 blockStart:v16 blockEnd:v18 sourceTimeZone:v8];

  return v19;
}

uint64_t __84__HKHorizontalSingleLineDataSource_chartPointsFromQueryData_dataIsFromRemoteSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F2B420] createWithCodableChartData:a2];
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfoCreationBlock, 0);
  objc_storeStrong((id *)&self->_sampleType, 0);
}

void __72__HKHorizontalSingleLineDataSource_queriesForRequest_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 sampleType];
  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(&dword_1E0B26000, v3, OS_LOG_TYPE_DEBUG, "Encountered error querying for %{public}@: %{public}@", v5, 0x16u);
}

void __72__HKHorizontalSingleLineDataSource_queriesForRequest_completionHandler___block_invoke_cold_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 sampleType];
  OUTLINED_FUNCTION_0_4();
  _os_log_error_impl(&dword_1E0B26000, v3, OS_LOG_TYPE_ERROR, "Encountered error querying for %{public}@: %{public}@", v5, 0x16u);
}

void __102__HKHorizontalSingleLineDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = a2;
  id v7 = HKStringForChartDataSourceQueryRequestAudience([v5 audience]);
  id v8 = [*(id *)(*(void *)(a1 + 40) + 48) identifier];
  id v9 = [a3 localizedDescription];
  int v10 = 138412802;
  id v11 = v7;
  __int16 v12 = 2112;
  id v13 = v8;
  __int16 v14 = 2112;
  id v15 = v9;
  _os_log_error_impl(&dword_1E0B26000, v6, OS_LOG_TYPE_ERROR, "[RemoteCharting]_%@_%@: unable to fetch results from query with error: %@", (uint8_t *)&v10, 0x20u);
}

@end