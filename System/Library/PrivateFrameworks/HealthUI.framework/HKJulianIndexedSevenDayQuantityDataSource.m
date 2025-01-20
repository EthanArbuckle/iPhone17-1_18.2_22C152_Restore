@interface HKJulianIndexedSevenDayQuantityDataSource
- (BOOL)supportsChartQueryDataGeneration;
- (HKCalendarCache)calendarCache;
- (HKJulianIndexedSevenDayQuantityDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4 quantityType:(id)a5 unitController:(id)a6 intervalUserInfoCreationBlock:(id)a7;
- (HKJulianIndexedSevenDayQuantityDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4 quantityType:(id)a5 unitController:(id)a6 singlePointUserInfoCreationBlock:(id)a7;
- (HKQuantityType)quantityType;
- (HKUnitPreferenceController)unitController;
- (id)_createIntervalChartPointFromDateInterval:(id)a3 timeZoneName:(id)a4 yValue:(id)a5 metadata:(id)a6;
- (id)_createSinglePointChartPointFromDateInterval:(id)a3 statisticsInterval:(id)a4 timeZoneName:(id)a5 yValue:(id)a6 metadata:(id)a7;
- (id)_intervalChartPointsWithSamples:(id)a3;
- (id)_singlePointChartPointsWithSamples:(id)a3 statisticsInterval:(id)a4;
- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4;
- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5;
- (id)intervalUserInfoCreationBlock;
- (id)queriesForRequest:(id)a3 completionHandler:(id)a4;
- (id)queryDescription;
- (id)singlePointUserInfoCreationBlock;
- (int64_t)dataSourceType;
- (void)setCalendarCache:(id)a3;
- (void)setDataSourceType:(int64_t)a3;
@end

@implementation HKJulianIndexedSevenDayQuantityDataSource

- (HKJulianIndexedSevenDayQuantityDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4 quantityType:(id)a5 unitController:(id)a6 intervalUserInfoCreationBlock:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)HKJulianIndexedSevenDayQuantityDataSource;
  v16 = [(HKHealthQueryChartCacheDataSource *)&v24 initWithDisplayType:a3 healthStore:a4];
  v17 = v16;
  if (v16)
  {
    v16->_dataSourceType = 1;
    objc_storeStrong((id *)&v16->_unitController, a6);
    objc_storeStrong((id *)&v17->_quantityType, a5);
    v18 = _Block_copy(v15);
    id intervalUserInfoCreationBlock = v17->_intervalUserInfoCreationBlock;
    v17->_id intervalUserInfoCreationBlock = v18;

    id singlePointUserInfoCreationBlock = v17->_singlePointUserInfoCreationBlock;
    v17->_id singlePointUserInfoCreationBlock = 0;

    v21 = (HKCalendarCache *)objc_alloc_init(MEMORY[0x1E4F2AC98]);
    calendarCache = v17->_calendarCache;
    v17->_calendarCache = v21;
  }
  return v17;
}

- (HKJulianIndexedSevenDayQuantityDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4 quantityType:(id)a5 unitController:(id)a6 singlePointUserInfoCreationBlock:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)HKJulianIndexedSevenDayQuantityDataSource;
  v16 = [(HKHealthQueryChartCacheDataSource *)&v24 initWithDisplayType:a3 healthStore:a4];
  v17 = v16;
  if (v16)
  {
    v16->_dataSourceType = 0;
    objc_storeStrong((id *)&v16->_unitController, a6);
    objc_storeStrong((id *)&v17->_quantityType, a5);
    id intervalUserInfoCreationBlock = v17->_intervalUserInfoCreationBlock;
    v17->_id intervalUserInfoCreationBlock = 0;

    v19 = _Block_copy(v15);
    id singlePointUserInfoCreationBlock = v17->_singlePointUserInfoCreationBlock;
    v17->_id singlePointUserInfoCreationBlock = v19;

    v21 = (HKCalendarCache *)objc_alloc_init(MEMORY[0x1E4F2AC98]);
    calendarCache = v17->_calendarCache;
    v17->_calendarCache = v21;
  }
  return v17;
}

- (id)queryDescription
{
  v2 = NSString;
  v3 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  v4 = [v3 localization];
  v5 = [v4 displayName];
  v6 = [v2 stringWithFormat:@"HKJulianIndexedSevenDayQuantity(%@)", v5];

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
  id v14 = [(HKJulianIndexedSevenDayQuantityDataSource *)self quantityType];
  v23[0] = v12;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __81__HKJulianIndexedSevenDayQuantityDataSource_queriesForRequest_completionHandler___block_invoke;
  v20[3] = &unk_1E6D525A0;
  v20[4] = self;
  id v21 = v6;
  id v16 = v6;
  v17 = (void *)[v13 initWithSampleType:v14 predicate:v11 limit:0 sortDescriptors:v15 resultsHandler:v20];

  [v17 setDebugIdentifier:@"charting (7-day julian)"];
  [v17 setIncludeAutomaticTimeZones:1];
  v22 = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];

  return v18;
}

void __81__HKJulianIndexedSevenDayQuantityDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
        __81__HKJulianIndexedSevenDayQuantityDataSource_queriesForRequest_completionHandler___block_invoke_cold_1(a1, v12);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __81__HKJulianIndexedSevenDayQuantityDataSource_queriesForRequest_completionHandler___block_invoke_cold_2(a1, v12);
    }
  }
  id v14 = objc_alloc_init(HKCodableSampleDataSourceQueryData);
  id v15 = objc_msgSend(v8, "hk_map:", &__block_literal_global_73);
  id v16 = (void *)[v15 mutableCopy];
  [(HKCodableSampleDataSourceQueryData *)v14 setSamples:v16];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __81__HKJulianIndexedSevenDayQuantityDataSource_queriesForRequest_completionHandler___block_invoke_286(uint64_t a1, void *a2)
{
  return [a2 codableSampleChartData];
}

- (id)_createSinglePointChartPointFromDateInterval:(id)a3 statisticsInterval:(id)a4 timeZoneName:(id)a5 yValue:(id)a6 metadata:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v48 = a6;
  id v47 = a7;
  id v15 = [(HKJulianIndexedSevenDayQuantityDataSource *)self calendarCache];
  id v16 = v15;
  if (v14)
  {
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CAF0]) initWithName:v14];
    uint64_t v18 = [v16 calendarForTimeZone:v17];
  }
  else
  {
    uint64_t v18 = [v15 currentCalendar];
  }

  v19 = [(HKJulianIndexedSevenDayQuantityDataSource *)self calendarCache];
  uint64_t v20 = [v19 currentCalendar];

  id v21 = objc_alloc(MEMORY[0x1E4F28C18]);
  v22 = [v12 startDate];
  v23 = [v12 endDate];
  uint64_t v24 = [v21 initWithStartDate:v22 endDate:v23];

  v44 = (void *)v24;
  v45 = (void *)v20;
  v46 = (void *)v18;
  v25 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_julianDayDateIntervalFromOpenUpperBoundDateInterval:sourceCalendar:localCalendar:", v24, v18, v20);
  v26 = v25;
  if (v25)
  {
    id v41 = v14;
    id v43 = v12;
    v27 = [v25 startDate];
    v28 = [v26 endDate];
    v29 = objc_alloc_init(HKQuantityTypeDataSourceValue);
    [(HKQuantityTypeDataSourceValue *)v29 setStartDate:v27];
    [(HKQuantityTypeDataSourceValue *)v29 setEndDate:v28];
    v30 = [(HKJulianIndexedSevenDayQuantityDataSource *)self quantityType];
    [(HKQuantityTypeDataSourceValue *)v29 setQuantityType:v30];

    [(HKQuantityTypeDataSourceValue *)v29 setAverageQuantity:v48];
    [(HKQuantityTypeDataSourceValue *)v29 setRecordCount:1];
    id v42 = v13;
    [(HKQuantityTypeDataSourceValue *)v29 setStatisticsInterval:v13];
    v31 = [(HKJulianIndexedSevenDayQuantityDataSource *)self singlePointUserInfoCreationBlock];
    v32 = [(HKHealthQueryChartCacheDataSource *)self displayType];
    v33 = [(HKJulianIndexedSevenDayQuantityDataSource *)self unitController];
    v34 = [v33 unitForDisplayType:v32];

    v35 = [HKHealthChartPoint alloc];
    v36 = [(HKHealthQueryChartCacheDataSource *)self displayType];
    v37 = [(HKHealthChartPoint *)v35 initWithDataSourceValue:v29 options:2 unit:v34 displayType:v36];

    if (v31)
    {
      v38 = ((void (**)(void, HKQuantityTypeDataSourceValue *, id))v31)[2](v31, v29, v47);
      [(HKHealthChartPoint *)v37 setUserInfo:v38];
    }
    id v13 = v42;
    id v12 = v43;
    id v14 = v41;
  }
  else
  {
    _HKInitializeLogging();
    v39 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_FAULT)) {
      -[HKJulianIndexedSevenDayQuantityDataSource _createSinglePointChartPointFromDateInterval:statisticsInterval:timeZoneName:yValue:metadata:](v39);
    }
    v37 = 0;
  }

  return v37;
}

- (id)_singlePointChartPointsWithSamples:(id)a3 statisticsInterval:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __99__HKJulianIndexedSevenDayQuantityDataSource__singlePointChartPointsWithSamples_statisticsInterval___block_invoke;
  v14[3] = &unk_1E6D55928;
  v14[4] = self;
  id v15 = v6;
  id v16 = v9;
  id v10 = v9;
  id v11 = v6;
  [v8 enumerateObjectsUsingBlock:v14];

  id v12 = objc_alloc_init(HKGraphSeriesDataBlock);
  [(HKGraphSeriesDataBlock *)v12 setChartPoints:v10];

  return v12;
}

void __99__HKJulianIndexedSevenDayQuantityDataSource__singlePointChartPointsWithSamples_statisticsInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v6 = [v4 startDate];
    id v7 = [v4 endDate];
    id v8 = (void *)[v5 initWithStartDate:v6 endDate:v7];

    id v9 = [v4 _timeZoneName];
    id v10 = objc_msgSend(v9, "hk_copyNonEmptyString");

    if (v10)
    {
      id v11 = *(void **)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      id v13 = [v4 quantity];
      id v14 = [v4 metadata];
      id v15 = [v11 _createSinglePointChartPointFromDateInterval:v8 statisticsInterval:v12 timeZoneName:v10 yValue:v13 metadata:v14];

      if (v15) {
        [*(id *)(a1 + 48) addObject:v15];
      }
    }
    else
    {
      _HKInitializeLogging();
      v17 = (void *)*MEMORY[0x1E4F29FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_FAULT)) {
        __99__HKJulianIndexedSevenDayQuantityDataSource__singlePointChartPointsWithSamples_statisticsInterval___block_invoke_cold_1(v17, v4);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v16 = (void *)*MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __99__HKJulianIndexedSevenDayQuantityDataSource__singlePointChartPointsWithSamples_statisticsInterval___block_invoke_cold_2(a1, v16);
    }
  }
}

- (id)_createIntervalChartPointFromDateInterval:(id)a3 timeZoneName:(id)a4 yValue:(id)a5 metadata:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v39 = a5;
  id v42 = a6;
  uint64_t v12 = [(HKJulianIndexedSevenDayQuantityDataSource *)self calendarCache];
  id v13 = v12;
  if (v11)
  {
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CAF0]) initWithName:v11];
    uint64_t v15 = [v13 calendarForTimeZone:v14];
  }
  else
  {
    uint64_t v15 = [v12 currentCalendar];
  }

  id v16 = [(HKJulianIndexedSevenDayQuantityDataSource *)self calendarCache];
  v17 = [v16 currentCalendar];

  id v18 = objc_alloc(MEMORY[0x1E4F28C18]);
  v19 = [v10 startDate];
  uint64_t v20 = [v10 endDate];
  id v21 = (void *)[v18 initWithStartDate:v19 endDate:v20];

  v40 = (void *)v15;
  v22 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_julianDayDateIntervalFromOpenUpperBoundDateInterval:sourceCalendar:localCalendar:", v21, v15, v17);
  v23 = v22;
  id v41 = v10;
  if (v22)
  {
    id v38 = v11;
    uint64_t v24 = [v22 startDate];
    v25 = [v23 endDate];
    v26 = [(HKJulianIndexedSevenDayQuantityDataSource *)self unitController];
    v27 = [(HKHealthQueryChartCacheDataSource *)self displayType];
    v28 = [v26 unitForDisplayType:v27];

    v29 = [HKJulianIndexedSevenDayQuantityChartPoint alloc];
    v30 = [(HKHealthQueryChartCacheDataSource *)self displayType];
    v31 = v39;
    v32 = [(HKJulianIndexedSevenDayQuantityChartPoint *)v29 initWithStartDate:v24 endDate:v25 displayType:v30 unit:v28 quantity:v39];

    uint64_t v33 = [(HKJulianIndexedSevenDayQuantityDataSource *)self intervalUserInfoCreationBlock];
    v34 = (void *)v33;
    if (v33)
    {
      v35 = (*(void (**)(uint64_t, id, id, void *, void *))(v33 + 16))(v33, v39, v42, v24, v25);
      [(HKJulianIndexedSevenDayQuantityChartPoint *)v32 setUserInfo:v35];
    }
    id v11 = v38;
  }
  else
  {
    _HKInitializeLogging();
    v36 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_FAULT)) {
      -[HKJulianIndexedSevenDayQuantityDataSource _createSinglePointChartPointFromDateInterval:statisticsInterval:timeZoneName:yValue:metadata:](v36);
    }
    v32 = 0;
    v31 = v39;
  }

  return v32;
}

- (id)_intervalChartPointsWithSamples:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __77__HKJulianIndexedSevenDayQuantityDataSource__intervalChartPointsWithSamples___block_invoke;
  id v13 = &unk_1E6D55950;
  id v14 = self;
  id v15 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:&v10];

  id v8 = objc_alloc_init(HKGraphSeriesDataBlock);
  -[HKGraphSeriesDataBlock setChartPoints:](v8, "setChartPoints:", v7, v10, v11, v12, v13, v14);

  return v8;
}

void __77__HKJulianIndexedSevenDayQuantityDataSource__intervalChartPointsWithSamples___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v6 = [v4 startDate];
    id v7 = [v4 endDate];
    id v8 = (void *)[v5 initWithStartDate:v6 endDate:v7];

    id v9 = [v4 _timeZoneName];
    uint64_t v10 = objc_msgSend(v9, "hk_copyNonEmptyString");

    if (v10)
    {
      uint64_t v11 = *(void **)(a1 + 32);
      uint64_t v12 = [v4 quantity];
      id v13 = [v4 metadata];
      id v14 = [v11 _createIntervalChartPointFromDateInterval:v8 timeZoneName:v10 yValue:v12 metadata:v13];

      if (v14) {
        [*(id *)(a1 + 40) addObject:v14];
      }
    }
    else
    {
      _HKInitializeLogging();
      id v16 = (void *)*MEMORY[0x1E4F29FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_FAULT)) {
        __99__HKJulianIndexedSevenDayQuantityDataSource__singlePointChartPointsWithSamples_statisticsInterval___block_invoke_cold_1(v16, v4);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v15 = (void *)*MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __99__HKJulianIndexedSevenDayQuantityDataSource__singlePointChartPointsWithSamples_statisticsInterval___block_invoke_cold_2(a1, v15);
    }
  }
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
  v25[2] = __111__HKJulianIndexedSevenDayQuantityDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v25[3] = &unk_1E6D525C8;
  id v26 = v8;
  v27 = self;
  id v28 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = [(HKJulianIndexedSevenDayQuantityDataSource *)self queriesForRequest:v12 completionHandler:v25];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __111__HKJulianIndexedSevenDayQuantityDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_302;
  v23[3] = &unk_1E6D525F0;
  id v14 = v9;
  id v24 = v14;
  [v13 enumerateObjectsUsingBlock:v23];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __111__HKJulianIndexedSevenDayQuantityDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2;
  v20[3] = &unk_1E6D513B0;
  id v21 = v13;
  id v22 = v14;
  id v15 = v14;
  id v16 = v13;
  v17 = _Block_copy(v20);
  id v18 = _Block_copy(v17);

  return v18;
}

void __111__HKJulianIndexedSevenDayQuantityDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
    id v18 = [v5 data];
    v19 = [v14 codableQueryDataWithType:8 startDate:v15 endDate:v16 statisticsInterval:v17 queryDataObject:v18];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v20 = (void *)*MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __111__HKJulianIndexedSevenDayQuantityDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1((void *)a1, v20);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __111__HKJulianIndexedSevenDayQuantityDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_302(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) executeQuery:a2];
}

void __111__HKJulianIndexedSevenDayQuantityDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __111__HKJulianIndexedSevenDayQuantityDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3;
  v2[3] = &unk_1E6D525F0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObjectsUsingBlock:v2];
}

uint64_t __111__HKJulianIndexedSevenDayQuantityDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) stopQuery:a2];
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v5 = a3;
  id v6 = [HKCodableSampleDataSourceQueryData alloc];
  id v7 = [v5 queryDataObject];
  id v8 = [(HKCodableSampleDataSourceQueryData *)v6 initWithData:v7];

  id v9 = [(HKCodableSampleDataSourceQueryData *)v8 samples];
  id v10 = objc_msgSend(v9, "hk_map:", &__block_literal_global_307_0);
  id v11 = (void *)[v10 copy];

  id v12 = (void *)MEMORY[0x1E4F1C9D8];
  id v13 = [v5 statisticsInterval];

  id v14 = objc_msgSend(v12, "hkui_dateComponentsWithCodableDateComponents:", v13);

  int64_t v15 = [(HKJulianIndexedSevenDayQuantityDataSource *)self dataSourceType];
  if (v15)
  {
    if (v15 != 1) {
      goto LABEL_6;
    }
    uint64_t v16 = [(HKJulianIndexedSevenDayQuantityDataSource *)self _intervalChartPointsWithSamples:v11];
  }
  else
  {
    uint64_t v16 = [(HKJulianIndexedSevenDayQuantityDataSource *)self _singlePointChartPointsWithSamples:v11 statisticsInterval:v14];
  }
  id v12 = (void *)v16;
LABEL_6:

  return v12;
}

uint64_t __93__HKJulianIndexedSevenDayQuantityDataSource_chartPointsFromQueryData_dataIsFromRemoteSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F2B420] createWithCodableChartData:a2];
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (id)intervalUserInfoCreationBlock
{
  return self->_intervalUserInfoCreationBlock;
}

- (id)singlePointUserInfoCreationBlock
{
  return self->_singlePointUserInfoCreationBlock;
}

- (HKCalendarCache)calendarCache
{
  return self->_calendarCache;
}

- (void)setCalendarCache:(id)a3
{
}

- (int64_t)dataSourceType
{
  return self->_dataSourceType;
}

- (void)setDataSourceType:(int64_t)a3
{
  self->_dataSourceType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong(&self->_singlePointUserInfoCreationBlock, 0);
  objc_storeStrong(&self->_intervalUserInfoCreationBlock, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
}

void __81__HKJulianIndexedSevenDayQuantityDataSource_queriesForRequest_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [(id)OUTLINED_FUNCTION_6_0() quantityType];
  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(&dword_1E0B26000, v2, OS_LOG_TYPE_DEBUG, "Encountered error querying for %{public}@: %{public}@", v5, 0x16u);
}

void __81__HKJulianIndexedSevenDayQuantityDataSource_queriesForRequest_completionHandler___block_invoke_cold_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [(id)OUTLINED_FUNCTION_6_0() quantityType];
  OUTLINED_FUNCTION_0_4();
  _os_log_error_impl(&dword_1E0B26000, v2, OS_LOG_TYPE_ERROR, "Encountered error querying for %{public}@: %{public}@", v5, 0x16u);
}

- (void)_createSinglePointChartPointFromDateInterval:(os_log_t)log statisticsInterval:timeZoneName:yValue:metadata:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1E0B26000, log, OS_LOG_TYPE_FAULT, "Sample with instantaneous duration detected", v1, 2u);
}

void __99__HKJulianIndexedSevenDayQuantityDataSource__singlePointChartPointsWithSamples_statisticsInterval___block_invoke_cold_1(void *a1, void *a2)
{
  id v4 = a1;
  [a2 UUID];
  objc_claimAutoreleasedReturnValue();
  id v5 = [(id)OUTLINED_FUNCTION_6_0() quantityType];
  uint64_t v6 = [v5 identifier];
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_4_1(&dword_1E0B26000, v7, v8, "TimeZone is missing for sample (uuid: %{public}@) in weekly report data source for quantity type %{public}@", v9, v10, v11, v12, v13);
}

void __99__HKJulianIndexedSevenDayQuantityDataSource__singlePointChartPointsWithSamples_statisticsInterval___block_invoke_cold_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 quantityType];
  OUTLINED_FUNCTION_3_1(&dword_1E0B26000, v5, v6, "Error enumerating over non-quantity %{public}@ in weekly report series", v7, v8, v9, v10, 2u);
}

void __111__HKJulianIndexedSevenDayQuantityDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = HKStringForChartDataSourceQueryRequestAudience([v3 audience]);
  [*(id *)(a1[5] + 48) identifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [(id)OUTLINED_FUNCTION_6_0() localizedDescription];
  int v7 = 138412802;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_1E0B26000, v4, OS_LOG_TYPE_ERROR, "[RemoteCharting]_%@_%@: unable to fetch results from query with error: %@", (uint8_t *)&v7, 0x20u);
}

@end