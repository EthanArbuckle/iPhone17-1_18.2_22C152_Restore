@interface HKQuantityTypeDataSource
- (BOOL)requiresPointRealignmentToMidnightForStatisticsInterval:(id)a3;
- (BOOL)supportsChartQueryDataGeneration;
- (HKQuantityType)quantityType;
- (HKQuantityTypeDataSource)initWithUnitController:(id)a3 options:(unint64_t)a4 displayType:(id)a5 healthStore:(id)a6;
- (HKUnitPreferenceController)unitController;
- (id)_averageByInterval:(id)a3 startDate:(id)a4 statistics:(id)a5;
- (id)_createMappingFunction:(id)a3;
- (id)_dailyAverageQueriesWithStartDate:(id)a3 endDate:(id)a4 statisticsInterval:(id)a5 completion:(id)a6;
- (id)_defaultQueriesForStartDate:(id)a3 endDate:(id)a4 statisticsInterval:(id)a5 completionHandler:(id)a6;
- (id)_unshiftedDateIntervalIfNecessaryForStatisticsInterval:(id)a3 startDate:(id)a4 endDate:(id)a5 gregorianCalendar:(id)a6;
- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4;
- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5;
- (id)mappingFunctionForContext:(id)a3;
- (id)preprocessingHandler;
- (id)queriesForRequest:(id)a3 completionHandler:(id)a4;
- (id)queryDescription;
- (id)userInfoCreationBlock;
- (unint64_t)statisticsOptions;
- (void)setPreprocessingHandler:(id)a3;
- (void)setUserInfoCreationBlock:(id)a3;
@end

@implementation HKQuantityTypeDataSource

- (HKQuantityTypeDataSource)initWithUnitController:(id)a3 options:(unint64_t)a4 displayType:(id)a5 healthStore:(id)a6
{
  id v11 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HKQuantityTypeDataSource;
  v12 = [(HKHealthQueryChartCacheDataSource *)&v19 initWithDisplayType:a5 healthStore:a6];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_unitController, a3);
    v13->_statisticsOptions = a4;
    v14 = [[_HKQuantityTypeDataSourceMapping alloc] initWithQuantityTypeDataSource:v13];
    mappingState = v13->_mappingState;
    v13->_mappingState = v14;

    uint64_t v16 = [(HKQuantityTypeDataSource *)v13 _createMappingFunction:v13->_mappingState];
    id mappingFunction = v13->_mappingFunction;
    v13->_id mappingFunction = (id)v16;
  }
  return v13;
}

- (HKQuantityType)quantityType
{
  v2 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  v3 = [v2 sampleType];

  return (HKQuantityType *)v3;
}

- (id)mappingFunctionForContext:(id)a3
{
  v3 = _Block_copy(self->_mappingFunction);
  return v3;
}

- (id)_createMappingFunction:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__HKQuantityTypeDataSource__createMappingFunction___block_invoke;
  aBlock[3] = &unk_1E6D54860;
  id v8 = v3;
  id v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

uint64_t __51__HKQuantityTypeDataSource__createMappingFunction___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) map:a2];
}

- (id)queryDescription
{
  v2 = NSString;
  id v3 = [(HKQuantityTypeDataSource *)self quantityType];
  id v4 = objc_msgSend(v3, "hk_localizedName");
  v5 = [v2 stringWithFormat:@"HKQuantityType(%@)", v4];

  return v5;
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F2B958];
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 statisticsInterval];
  v10 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  id v11 = [v10 sampleType];
  int v12 = [v6 shouldUseDailyAverageWithDateComponents:v9 sampleType:v11];

  v13 = [v8 startDate];
  v14 = [v8 endDate];
  v15 = [v8 statisticsInterval];

  if (v12) {
    [(HKQuantityTypeDataSource *)self _dailyAverageQueriesWithStartDate:v13 endDate:v14 statisticsInterval:v15 completion:v7];
  }
  else {
  uint64_t v16 = [(HKQuantityTypeDataSource *)self _defaultQueriesForStartDate:v13 endDate:v14 statisticsInterval:v15 completionHandler:v7];
  }

  return v16;
}

- (id)_dailyAverageQueriesWithStartDate:(id)a3 endDate:(id)a4 statisticsInterval:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)MEMORY[0x1E4F1C9D8];
  id v14 = a4;
  v15 = objc_msgSend(v13, "hk_oneDay");
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __100__HKQuantityTypeDataSource__dailyAverageQueriesWithStartDate_endDate_statisticsInterval_completion___block_invoke;
  v21[3] = &unk_1E6D54888;
  v21[4] = self;
  id v22 = v11;
  id v23 = v10;
  id v24 = v12;
  id v16 = v10;
  id v17 = v11;
  id v18 = v12;
  objc_super v19 = [(HKQuantityTypeDataSource *)self _defaultQueriesForStartDate:v16 endDate:v14 statisticsInterval:v15 completionHandler:v21];

  return v19;
}

void __100__HKQuantityTypeDataSource__dailyAverageQueriesWithStartDate_endDate_statisticsInterval_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v6 = a1[7];
  id v8 = a3;
  id v9 = [v4 _averageByInterval:v5 startDate:v7 statistics:a2];
  (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v9, v8);
}

- (id)_averageByInterval:(id)a3 startDate:(id)a4 statistics:(id)a5
{
  id v8 = a3;
  unitController = self->_unitController;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  v13 = [(HKUnitPreferenceController *)unitController unitForDisplayType:v12];

  id v14 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  v15 = [v14 sampleType];

  id v16 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v17 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithLocalTimeZone");
  id v18 = (void *)MEMORY[0x1E4F2B958];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __68__HKQuantityTypeDataSource__averageByInterval_startDate_statistics___block_invoke;
  v25[3] = &unk_1E6D548B0;
  id v26 = v13;
  v27 = self;
  id v28 = v8;
  id v29 = v17;
  id v30 = v15;
  id v19 = v15;
  id v20 = v17;
  id v21 = v8;
  id v22 = v13;
  id v23 = [v18 arrayByCoalescingObjects:v10 startDate:v11 intervalComponents:v21 calendar:v16 combiningBlock:v25];

  return v23;
}

HKQuantityTypeDataSourceValue *__68__HKQuantityTypeDataSource__averageByInterval_startDate_statistics___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v31 + 1) + 8 * i) sumQuantity];
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v13);
  }

  id v17 = [MEMORY[0x1E4F2B958] averageSumFromQuantities:v10 unit:*(void *)(a1 + 32)];
  id v18 = [MEMORY[0x1E4F2B958] minimumFromQuantities:v10 unit:*(void *)(a1 + 32)];
  uint64_t v19 = [MEMORY[0x1E4F2B958] maximumFromQuantities:v10 unit:*(void *)(a1 + 32)];
  id v20 = (void *)v19;
  id v21 = 0;
  if (v17 && v18 && v19)
  {
    id v21 = objc_alloc_init(HKQuantityTypeDataSourceValue);
    [*(id *)(a1 + 40) _unshiftedDateIntervalIfNecessaryForStatisticsInterval:*(void *)(a1 + 48) startDate:v8 endDate:v9 gregorianCalendar:*(void *)(a1 + 56)];
    id v30 = v9;
    v23 = id v22 = v8;
    id v24 = [v23 startDate];
    [(HKQuantityTypeDataSourceValue *)v21 setStartDate:v24];

    v25 = [v23 endDate];
    [(HKQuantityTypeDataSourceValue *)v21 setEndDate:v25];

    [(HKQuantityTypeDataSourceValue *)v21 setQuantityType:*(void *)(a1 + 64)];
    [(HKQuantityTypeDataSourceValue *)v21 setSumQuantity:v17];
    [(HKQuantityTypeDataSourceValue *)v21 setMinQuantity:v18];
    [(HKQuantityTypeDataSourceValue *)v21 setMaxQuantity:v20];
    -[HKQuantityTypeDataSourceValue setRecordCount:](v21, "setRecordCount:", [v11 count]);
    id v26 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_oneDay");
    [(HKQuantityTypeDataSourceValue *)v21 setStatisticsInterval:v26];

    id v8 = v22;
    id v9 = v30;
  }
  v27 = [v11 lastObject];
  id v28 = [v27 mostRecentQuantity];

  if (v28) {
    [(HKQuantityTypeDataSourceValue *)v21 setMostRecentQuantity:v28];
  }

  return v21;
}

- (id)_defaultQueriesForStartDate:(id)a3 endDate:(id)a4 statisticsInterval:(id)a5 completionHandler:(id)a6
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [MEMORY[0x1E4F2B3C0] predicateForSamplesWithStartDate:v10 endDate:v11 options:0];
  id v15 = objc_alloc(MEMORY[0x1E4F2B5C8]);
  id v16 = [(HKQuantityTypeDataSource *)self quantityType];
  id v17 = (void *)[v15 initWithQuantityType:v16 quantitySamplePredicate:v14 options:self->_statisticsOptions anchorDate:v10 intervalComponents:v12];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __101__HKQuantityTypeDataSource__defaultQueriesForStartDate_endDate_statisticsInterval_completionHandler___block_invoke;
  v24[3] = &unk_1E6D54900;
  id v25 = v10;
  id v26 = v11;
  v27 = self;
  id v28 = v12;
  id v29 = v13;
  id v18 = v13;
  id v19 = v12;
  id v20 = v11;
  id v21 = v10;
  [v17 setInitialResultsHandler:v24];
  [v17 setDebugIdentifier:@"charting (quantity)"];
  v30[0] = v17;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];

  return v22;
}

void __101__HKQuantityTypeDataSource__defaultQueriesForStartDate_endDate_statisticsInterval_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  uint64_t v10 = v9;
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  uint64_t v12 = v11;
  id v13 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithLocalTimeZone");
  uint64_t v14 = [v7 statistics];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __101__HKQuantityTypeDataSource__defaultQueriesForStartDate_endDate_statisticsInterval_completionHandler___block_invoke_2;
  v19[3] = &unk_1E6D548D8;
  uint64_t v23 = v10;
  uint64_t v24 = v12;
  id v15 = *(void **)(a1 + 56);
  v19[4] = *(void *)(a1 + 48);
  id v20 = v15;
  id v16 = v13;
  id v21 = v16;
  id v17 = v8;
  id v22 = v17;
  [v14 enumerateObjectsUsingBlock:v19];

  uint64_t v18 = *(void *)(a1 + 64);
  if (v18) {
    (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v17, v6);
  }
}

void __101__HKQuantityTypeDataSource__defaultQueriesForStartDate_endDate_statisticsInterval_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v28 = a2;
  id v3 = [v28 startDate];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;
  double v6 = *(double *)(a1 + 64);

  id v7 = [v28 endDate];
  [v7 timeIntervalSinceReferenceDate];
  double v9 = v8;
  double v10 = *(double *)(a1 + 72);

  if (v5 >= v6 && v9 <= v10)
  {
    uint64_t v12 = objc_alloc_init(HKQuantityTypeDataSourceValue);
    id v13 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = [v28 startDate];
    id v16 = [v28 endDate];
    id v17 = [v13 _unshiftedDateIntervalIfNecessaryForStatisticsInterval:v14 startDate:v15 endDate:v16 gregorianCalendar:*(void *)(a1 + 48)];

    uint64_t v18 = [v17 startDate];
    [(HKQuantityTypeDataSourceValue *)v12 setStartDate:v18];

    id v19 = [v17 endDate];
    [(HKQuantityTypeDataSourceValue *)v12 setEndDate:v19];

    id v20 = [v28 quantityType];
    [(HKQuantityTypeDataSourceValue *)v12 setQuantityType:v20];

    id v21 = [v28 averageQuantity];
    [(HKQuantityTypeDataSourceValue *)v12 setAverageQuantity:v21];

    id v22 = [v28 duration];
    [(HKQuantityTypeDataSourceValue *)v12 setDurationQuantity:v22];

    uint64_t v23 = [v28 sumQuantity];
    [(HKQuantityTypeDataSourceValue *)v12 setSumQuantity:v23];

    uint64_t v24 = [v28 minimumQuantity];
    [(HKQuantityTypeDataSourceValue *)v12 setMinQuantity:v24];

    id v25 = [v28 maximumQuantity];
    [(HKQuantityTypeDataSourceValue *)v12 setMaxQuantity:v25];

    id v26 = [v28 mostRecentQuantity];
    [(HKQuantityTypeDataSourceValue *)v12 setMostRecentQuantity:v26];

    -[HKQuantityTypeDataSourceValue setRecordCount:](v12, "setRecordCount:", [v28 dataCount]);
    [(HKQuantityTypeDataSourceValue *)v12 setStatisticsInterval:*(void *)(a1 + 40)];
    v27 = [v28 baselineRelativeValueState];
    [(HKQuantityTypeDataSourceValue *)v12 setBaselineRelativeValueState:v27];

    [*(id *)(a1 + 56) addObject:v12];
  }
}

- (BOOL)requiresPointRealignmentToMidnightForStatisticsInterval:(id)a3
{
  id v4 = a3;
  if ([(HKHealthQueryChartCacheDataSource *)self queryAlignment] == 1)
  {
    objc_msgSend(v4, "hk_approximateDuration");
    double v6 = v5;
    id v7 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_oneDay");
    objc_msgSend(v7, "hk_approximateDuration");
    BOOL v9 = v6 >= v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_unshiftedDateIntervalIfNecessaryForStatisticsInterval:(id)a3 startDate:(id)a4 endDate:(id)a5 gregorianCalendar:(id)a6
{
  id v10 = a6;
  uint64_t v11 = (objc_class *)MEMORY[0x1E4F28C18];
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = (void *)[[v11 alloc] initWithStartDate:v13 endDate:v12];

  LODWORD(v13) = [(HKQuantityTypeDataSource *)self requiresPointRealignmentToMidnightForStatisticsInterval:v14];
  if (v13)
  {
    objc_msgSend(v15, "hk_dateIntervalUnshiftedFromQueryAlignment:calendar:", 1, v10);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v16 = v15;
  }
  id v17 = v16;

  return v17;
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
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __94__HKQuantityTypeDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v23[3] = &unk_1E6D52918;
  id v24 = v8;
  id v25 = self;
  id v26 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = [(HKQuantityTypeDataSource *)self queriesForRequest:v12 completionHandler:v23];
  id v14 = [v13 firstObject];
  [v9 executeQuery:v14];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__HKQuantityTypeDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6D513B0;
  id v21 = v9;
  id v22 = v13;
  id v15 = v13;
  id v16 = v9;
  id v17 = _Block_copy(aBlock);
  uint64_t v18 = _Block_copy(v17);

  return v18;
}

void __94__HKQuantityTypeDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
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
        id v12 = [*(id *)(a1 + 40) quantityType];
        id v13 = [v12 identifier];
        id v14 = [v7 localizedDescription];
        *(_DWORD *)buf = 138412802;
        id v24 = v11;
        __int16 v25 = 2112;
        id v26 = v13;
        __int16 v27 = 2112;
        id v28 = v14;
        _os_log_impl(&dword_1E0B26000, v10, OS_LOG_TYPE_INFO, "[RemoteCharting]_%@_%@: query returned successfully with error: %@", buf, 0x20u);
      }
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __94__HKQuantityTypeDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_380;
    aBlock[3] = &unk_1E6D54928;
    int8x16_t v19 = *(int8x16_t *)(a1 + 32);
    id v15 = (id)v19.i64[0];
    int8x16_t v21 = vextq_s8(v19, v19, 8uLL);
    id v22 = *(id *)(a1 + 48);
    id v16 = (void (**)(void *, id))_Block_copy(aBlock);
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 88);
    if (v17) {
      (*(void (**)(uint64_t, id, void (**)(void *, id)))(v17 + 16))(v17, v5, v16);
    }
    else {
      v16[2](v16, v5);
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v18 = (void *)*MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __94__HKQuantityTypeDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v18, v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __94__HKQuantityTypeDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_380(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "hk_map:", &__block_literal_global_60);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = objc_alloc_init(HKCodableChartQuantityDataSourceQueryData);
  id v4 = objc_alloc_init(HKCodableStatisticsCollection);
  [(HKCodableChartQuantityDataSourceQueryData *)v3 setStatisticsCollection:v4];

  id v5 = (void *)[v13 mutableCopy];
  id v6 = [(HKCodableChartQuantityDataSourceQueryData *)v3 statisticsCollection];
  [v6 setStatistics:v5];

  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) startDate];
  id v9 = [*(id *)(a1 + 40) endDate];
  id v10 = [*(id *)(a1 + 40) statisticsInterval];
  id v11 = [(HKCodableChartQuantityDataSourceQueryData *)v3 data];
  id v12 = [v7 codableQueryDataWithType:0 startDate:v8 endDate:v9 statisticsInterval:v10 queryDataObject:v11];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __94__HKQuantityTypeDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 codableStatistics];
}

void __94__HKQuantityTypeDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) firstObject];
  [v1 stopQuery:v2];
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v4 = a3;
  if ([v4 hasTimeZoneName])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CAF0]);
    id v6 = [v4 timeZoneName];
    id v7 = (void *)[v5 initWithName:v6];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = [HKCodableChartQuantityDataSourceQueryData alloc];
  id v9 = [v4 queryDataObject];
  id v10 = [(HKCodableChartQuantityDataSourceQueryData *)v8 initWithData:v9];

  id v11 = objc_alloc_init(HKGraphSeriesDataBlock);
  id v12 = [(HKCodableChartQuantityDataSourceQueryData *)v10 statisticsCollection];
  id v13 = [v12 statistics];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__HKQuantityTypeDataSource_chartPointsFromQueryData_dataIsFromRemoteSource___block_invoke;
  v17[3] = &unk_1E6D52478;
  id v18 = v7;
  id v14 = v7;
  id v15 = objc_msgSend(v13, "hk_map:", v17);
  [(HKGraphSeriesDataBlock *)v11 setChartPoints:v15];

  return v11;
}

HKQuantityTypeDataSourceValue *__76__HKQuantityTypeDataSource_chartPointsFromQueryData_dataIsFromRemoteSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKQuantityTypeDataSourceValue quantityTypeDataSourceValueWithCodableStatistics:a2 sourceTimeZone:*(void *)(a1 + 32)];
}

- (unint64_t)statisticsOptions
{
  return self->_statisticsOptions;
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (id)userInfoCreationBlock
{
  return self->_userInfoCreationBlock;
}

- (void)setUserInfoCreationBlock:(id)a3
{
}

- (id)preprocessingHandler
{
  return self->_preprocessingHandler;
}

- (void)setPreprocessingHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_preprocessingHandler, 0);
  objc_storeStrong(&self->_userInfoCreationBlock, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong(&self->_mappingFunction, 0);
  objc_storeStrong((id *)&self->_mappingState, 0);
}

void __94__HKQuantityTypeDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = HKStringForChartDataSourceQueryRequestAudience([v5 audience]);
  id v8 = [*(id *)(a1 + 40) quantityType];
  id v9 = [v8 identifier];
  id v10 = [a3 localizedDescription];
  int v11 = 138412802;
  id v12 = v7;
  __int16 v13 = 2112;
  id v14 = v9;
  __int16 v15 = 2112;
  id v16 = v10;
  _os_log_error_impl(&dword_1E0B26000, v6, OS_LOG_TYPE_ERROR, "[RemoteCharting]_%@_%@: unable to fetch results from query with error: %@", (uint8_t *)&v11, 0x20u);
}

@end