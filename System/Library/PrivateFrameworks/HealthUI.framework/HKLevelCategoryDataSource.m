@interface HKLevelCategoryDataSource
- (BOOL)supportsChartQueryDataGeneration;
- (HKSampleType)sampleType;
- (NSArray)valueOrder;
- (id)_chartPointsWithSamples:(id)a3 sourceTimeZone:(id)a4;
- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4;
- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5;
- (id)pointStyleBlock;
- (id)queriesForRequest:(id)a3 completionHandler:(id)a4;
- (id)queryDescription;
- (id)userInfoCreationBlock;
- (void)setPointStyleBlock:(id)a3;
- (void)setSampleType:(id)a3;
- (void)setUserInfoCreationBlock:(id)a3;
- (void)setValueOrder:(id)a3;
@end

@implementation HKLevelCategoryDataSource

- (id)queryDescription
{
  v2 = NSString;
  v3 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  v4 = [v3 localization];
  v5 = [v4 displayName];
  v6 = [v2 stringWithFormat:@"HKLevelCategory(%@)", v5];

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
  v20[2] = __65__HKLevelCategoryDataSource_queriesForRequest_completionHandler___block_invoke;
  v20[3] = &unk_1E6D525A0;
  v20[4] = self;
  id v21 = v6;
  id v16 = v6;
  v17 = (void *)[v13 initWithSampleType:sampleType predicate:v11 limit:0 sortDescriptors:v15 resultsHandler:v20];

  [v17 setDebugIdentifier:@"charting (level category)"];
  v22 = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];

  return v18;
}

void __65__HKLevelCategoryDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_alloc_init(HKCodableSampleDataSourceQueryData);
    v9 = objc_msgSend(v6, "hk_map:", &__block_literal_global_81);
    v10 = (void *)[v9 mutableCopy];
    [(HKCodableSampleDataSourceQueryData *)v8 setSamples:v10];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR)) {
      __65__HKLevelCategoryDataSource_queriesForRequest_completionHandler___block_invoke_cold_1(a1, v11, (uint64_t)v7);
    }
  }
}

id __65__HKLevelCategoryDataSource_queriesForRequest_completionHandler___block_invoke_285(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 metadata];
  v4 = objc_msgSend(v3, "hk_filter:", &__block_literal_global_289_0);
  [v2 _setMetadata:v4];

  v5 = [v2 codableSampleChartData];

  return v5;
}

uint64_t __65__HKLevelCategoryDataSource_queriesForRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqual:*MEMORY[0x1E4F2A1A8]];
}

- (id)_chartPointsWithSamples:(id)a3 sourceTimeZone:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v38 = *(void *)v41;
    uint64_t v37 = *MEMORY[0x1E4F2A1A8];
    unint64_t v10 = 0x1E4F28000uLL;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v41 != v38) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v13 = objc_alloc_init(HKLevelCategoryChartPoint);
        uint64_t v14 = objc_msgSend(v12, "hk_integerValue");
        v15 = [v12 startDate];
        id v16 = objc_msgSend(v15, "hk_dateFromSourceTimeZone:", v7);
        [(HKLevelCategoryChartPoint *)v13 setStartDate:v16];

        v17 = [v12 endDate];
        v18 = objc_msgSend(v17, "hk_dateFromSourceTimeZone:", v7);
        [(HKLevelCategoryChartPoint *)v13 setEndDate:v18];

        v19 = [(HKLevelCategoryDataSource *)self valueOrder];

        v20 = *(void **)(v10 + 3792);
        if (v19)
        {
          id v21 = [(HKLevelCategoryDataSource *)self valueOrder];
          v22 = [*(id *)(v10 + 3792) numberWithInteger:v14];
          v23 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "indexOfObject:", v22));
          [(HKLevelCategoryChartPoint *)v13 setYValue:v23];
        }
        else
        {
          id v21 = [*(id *)(v10 + 3792) numberWithInteger:v14];
          [(HKLevelCategoryChartPoint *)v13 setYValue:v21];
        }

        [(HKLevelCategoryChartPoint *)v13 setPointStyle:0];
        v24 = [(HKLevelCategoryDataSource *)self pointStyleBlock];

        if (v24)
        {
          v25 = [(HKLevelCategoryDataSource *)self pointStyleBlock];
          [(HKLevelCategoryChartPoint *)v13 setPointStyle:((uint64_t (**)(void, void *))v25)[2](v25, v12)];
        }
        v26 = [v12 metadata];
        v27 = [v26 valueForKey:v37];
        unsigned int v28 = [v27 BOOLValue];

        uint64_t v29 = v28;
        v30 = [(HKLevelCategoryDataSource *)self userInfoCreationBlock];
        v31 = [v12 startDate];
        v32 = [v12 endDate];
        v33 = ((void (**)(void, uint64_t, void *, void *, uint64_t))v30)[2](v30, v14, v31, v32, v29);
        [(HKLevelCategoryChartPoint *)v13 setUserInfo:v33];

        [v39 addObject:v13];
        unint64_t v10 = 0x1E4F28000;
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v9);
  }

  v34 = objc_alloc_init(HKGraphSeriesDataBlock);
  [(HKGraphSeriesDataBlock *)v34 setChartPoints:v39];

  return v34;
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
  v25[2] = __95__HKLevelCategoryDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v25[3] = &unk_1E6D525C8;
  id v26 = v8;
  v27 = self;
  id v28 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = [(HKLevelCategoryDataSource *)self queriesForRequest:v12 completionHandler:v25];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __95__HKLevelCategoryDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_299;
  v23[3] = &unk_1E6D525F0;
  id v14 = v9;
  id v24 = v14;
  [v13 enumerateObjectsUsingBlock:v23];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __95__HKLevelCategoryDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2;
  v20[3] = &unk_1E6D513B0;
  id v21 = v13;
  id v22 = v14;
  id v15 = v14;
  id v16 = v13;
  v17 = _Block_copy(v20);
  v18 = _Block_copy(v17);

  return v18;
}

void __95__HKLevelCategoryDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v20 = (void *)*MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __95__HKLevelCategoryDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v20, v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __95__HKLevelCategoryDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_299(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) executeQuery:a2];
}

void __95__HKLevelCategoryDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __95__HKLevelCategoryDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3;
  v2[3] = &unk_1E6D525F0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObjectsUsingBlock:v2];
}

uint64_t __95__HKLevelCategoryDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
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
  id v13 = objc_msgSend(v12, "hk_map:", &__block_literal_global_305_0);
  id v14 = (void *)[v13 copy];

  id v15 = [(HKLevelCategoryDataSource *)self _chartPointsWithSamples:v14 sourceTimeZone:v8];

  return v15;
}

uint64_t __77__HKLevelCategoryDataSource_chartPointsFromQueryData_dataIsFromRemoteSource___block_invoke(uint64_t a1, uint64_t a2)
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

- (id)pointStyleBlock
{
  return self->_pointStyleBlock;
}

- (void)setPointStyleBlock:(id)a3
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
  objc_storeStrong(&self->_pointStyleBlock, 0);
  objc_storeStrong(&self->_userInfoCreationBlock, 0);
  objc_storeStrong((id *)&self->_sampleType, 0);
}

void __65__HKLevelCategoryDataSource_queriesForRequest_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 sampleType];
  int v7 = 138412546;
  id v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_1E0B26000, v5, OS_LOG_TYPE_ERROR, "Query failed for %@: %@", (uint8_t *)&v7, 0x16u);
}

void __95__HKLevelCategoryDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  int v7 = HKStringForChartDataSourceQueryRequestAudience([v5 audience]);
  id v8 = [*(id *)(*(void *)(a1 + 40) + 48) identifier];
  __int16 v9 = [a3 localizedDescription];
  int v10 = 138412802;
  uint64_t v11 = v7;
  __int16 v12 = 2112;
  id v13 = v8;
  __int16 v14 = 2112;
  id v15 = v9;
  _os_log_error_impl(&dword_1E0B26000, v6, OS_LOG_TYPE_ERROR, "[RemoteCharting]_%@_%@: unable to fetch results from query with error: %@", (uint8_t *)&v10, 0x20u);
}

@end