@interface HKQuantityDistributionDataSource
+ (id)bucketSizeForBloodGlucoseWithUnit:(id)a3;
+ (id)bucketSizeForDisplayType:(id)a3 preferredUnit:(id)a4;
+ (id)bucketSizeForQuantityType:(id)a3 preferredUnit:(id)a4;
- (BOOL)supportsChartQueryDataGeneration;
- (HKQuantityDistributionDataSource)initWithQuantityType:(id)a3 unitController:(id)a4 healthStore:(id)a5 contextStyle:(int64_t)a6 predicate:(id)a7 options:(unint64_t)a8 baseDisplayType:(id)a9 specificStartDate:(id)a10 specificEndDate:(id)a11 userInfoCreationBlock:(id)a12;
- (HKQuantityType)quantityType;
- (HKUnit)preferredUnit;
- (HKUnitPreferenceController)unitController;
- (NSDate)specificEndDate;
- (NSDate)specificStartDate;
- (NSPredicate)predicate;
- (double)bucketAnchor;
- (double)bucketSize;
- (id)_bucketDateForHistogramData:(id)a3;
- (id)_dataBlockFromHistograms:(id)a3;
- (id)_quickDate:(id)a3;
- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4;
- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5;
- (id)queriesForRequest:(id)a3 completionHandler:(id)a4;
- (id)queryDescription;
- (id)userInfoCreationBlock;
- (int64_t)contextStyle;
- (unint64_t)options;
@end

@implementation HKQuantityDistributionDataSource

- (HKQuantityDistributionDataSource)initWithQuantityType:(id)a3 unitController:(id)a4 healthStore:(id)a5 contextStyle:(int64_t)a6 predicate:(id)a7 options:(unint64_t)a8 baseDisplayType:(id)a9 specificStartDate:(id)a10 specificEndDate:(id)a11 userInfoCreationBlock:(id)a12
{
  id v35 = a3;
  id v17 = a4;
  id v34 = a7;
  id v18 = a9;
  id v33 = a10;
  id v32 = a11;
  id v19 = a12;
  v36.receiver = self;
  v36.super_class = (Class)HKQuantityDistributionDataSource;
  v20 = [(HKHealthQueryChartCacheDataSource *)&v36 initWithDisplayType:v18 healthStore:a5];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_quantityType, a3);
    objc_storeStrong((id *)&v21->_unitController, a4);
    v22 = [v17 unitForDisplayType:v18];
    v23 = +[HKQuantityDistributionDataSource bucketSizeForQuantityType:v35 preferredUnit:v22];
    [v23 doubleValue];
    v21->_bucketSize = v24;

    v21->_bucketAnchor = 0.0;
    v21->_contextStyle = a6;
    objc_storeStrong((id *)&v21->_predicate, a7);
    v21->_options = a8;
    objc_storeStrong((id *)&v21->_specificStartDate, a10);
    objc_storeStrong((id *)&v21->_specificEndDate, a11);
    preferredUnit = v21->_preferredUnit;
    v21->_preferredUnit = v22;
    v26 = v22;

    v27 = _Block_copy(v19);
    id userInfoCreationBlock = v21->_userInfoCreationBlock;
    v21->_id userInfoCreationBlock = v27;
  }
  return v21;
}

+ (id)bucketSizeForQuantityType:(id)a3 preferredUnit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 code] == 15) {
    [a1 bucketSizeForBloodGlucoseWithUnit:v7];
  }
  else {
  v8 = HKQuantityDistributionBucketSizeForQuantityType(v6);
  }

  return v8;
}

+ (id)bucketSizeForDisplayType:(id)a3 preferredUnit:(id)a4
{
  id v6 = a4;
  id v7 = [a3 objectType];
  v8 = [a1 bucketSizeForQuantityType:v7 preferredUnit:v6];

  return v8;
}

+ (id)bucketSizeForBloodGlucoseWithUnit:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F2B618] _milligramsPerDeciliterUnit];
  char v7 = [v5 isEqual:v6];

  double v8 = 4.0;
  if ((v7 & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F2B618] _millimolesBloodGlucosePerLiterUnit];
    char v10 = [v5 isEqual:v9];

    if (v10)
    {
      double v8 = 0.2;
    }
    else
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      v12 = [v5 unitString];
      [v11 handleFailureInMethod:a2, a1, @"HKQuantityDistributionDataSource.m", 113, @"Unsupported glucose unit: %@", v12 object file lineNumber description];

      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR)) {
        +[HKQuantityDistributionDataSource bucketSizeForBloodGlucoseWithUnit:](v13, v5);
      }
    }
  }
  v14 = [NSNumber numberWithDouble:v8];

  return v14;
}

- (id)_quickDate:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28C10];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateFormat:@"MM/dd/YYYY-HH:mm:ss"];
  id v6 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v5 setTimeZone:v6];

  char v7 = [v5 stringFromDate:v4];

  return v7;
}

- (id)queryDescription
{
  v2 = NSString;
  v3 = [(HKQuantityDistributionDataSource *)self quantityType];
  id v4 = objc_msgSend(v3, "hk_localizedName");
  id v5 = [v2 stringWithFormat:@"HKQuantityDistribution(%@)", v4];

  return v5;
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v35 = a4;
  specificStartDate = self->_specificStartDate;
  if (specificStartDate)
  {
    double v8 = specificStartDate;
  }
  else
  {
    double v8 = [v6 startDate];
  }
  v38 = v8;
  specificEndDate = self->_specificEndDate;
  if (specificEndDate)
  {
    char v10 = specificEndDate;
  }
  else
  {
    char v10 = [v6 endDate];
  }
  v37 = v10;
  v11 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  v12 = [v11 presentation];
  [v12 adjustedDoubleForClientDouble:self->_bucketSize];
  double v14 = v13;

  v15 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  v16 = [v15 presentation];
  [v16 adjustedDoubleForClientDouble:self->_bucketAnchor];
  double v18 = v17;

  id v19 = [(HKQuantityDistributionDataSource *)self unitController];
  v20 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  id v34 = [v19 unitForDisplayType:v20];

  v21 = [MEMORY[0x1E4F2B370] quantityWithUnit:v34 doubleValue:v14];
  v22 = [MEMORY[0x1E4F2B370] quantityWithUnit:v34 doubleValue:v18];
  id v23 = objc_alloc(MEMORY[0x1E4F2B950]);
  double v24 = [(HKQuantityDistributionDataSource *)self quantityType];
  int64_t contextStyle = self->_contextStyle;
  predicate = self->_predicate;
  v27 = [v6 startDate];
  [v6 statisticsInterval];
  v28 = id v33 = v6;
  unint64_t options = self->_options;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __72__HKQuantityDistributionDataSource_queriesForRequest_completionHandler___block_invoke;
  v39[3] = &unk_1E6D528D0;
  id v40 = v35;
  id v36 = v35;
  v30 = (void *)[v23 initWithQuantityType:v24 startDate:v38 endDate:v37 contextStyle:contextStyle predicate:predicate anchorDate:v27 intervalComponents:v28 histogramAnchor:v22 histogramBucketSize:v21 options:options completionHandler:v39];

  [v30 setDebugIdentifier:@"charting (distribution)"];
  v41[0] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];

  return v31;
}

uint64_t __72__HKQuantityDistributionDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_dataBlockFromHistograms:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(HKQuantityDistributionDataSource *)self unitController];
  char v7 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  double v8 = [v6 unitForDisplayType:v7];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v4;
  uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        double v14 = [HKQuantityDistributionChartPoint alloc];
        v15 = [(HKQuantityDistributionDataSource *)self _bucketDateForHistogramData:v13];
        double bucketSize = self->_bucketSize;
        double v17 = [(HKHealthQueryChartCacheDataSource *)self displayType];
        double v18 = [(HKQuantityDistributionChartPoint *)v14 initWithHistogramData:v13 bucketDate:v15 bucketIncrement:v8 unit:v17 displayType:bucketSize];

        id v19 = (*((void (**)(void))self->_userInfoCreationBlock + 2))();
        [(HKQuantityDistributionChartPoint *)v18 setUserInfo:v19];

        [v5 addObject:v18];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  v20 = objc_alloc_init(HKGraphSeriesDataBlock);
  [(HKGraphSeriesDataBlock *)v20 setChartPoints:v5];

  return v20;
}

- (id)_bucketDateForHistogramData:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28C18];
  id v5 = a3;
  id v6 = [v4 alloc];
  char v7 = [v5 startDate];
  double v8 = [v5 endDate];

  uint64_t v9 = (void *)[v6 initWithStartDate:v7 endDate:v8];
  if ([(HKHealthQueryChartCacheDataSource *)self queryAlignment] == 1)
  {
    [v9 duration];
    double v11 = v10;
    v12 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_oneDay");
    objc_msgSend(v12, "hk_approximateDuration");
    double v14 = v13;

    if (v11 >= v14)
    {
      v15 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
      uint64_t v16 = objc_msgSend(v9, "hk_dateIntervalUnshiftedFromQueryAlignment:calendar:", 1, v15);

      uint64_t v9 = (void *)v16;
    }
  }
  double v17 = [v9 startDate];
  double v18 = [v9 endDate];
  id v19 = HKUIMidDate(v17, v18);

  return v19;
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
  v25[2] = __102__HKQuantityDistributionDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v25[3] = &unk_1E6D52918;
  id v26 = v8;
  v27 = self;
  id v28 = v10;
  id v11 = v10;
  id v12 = v8;
  double v13 = [(HKQuantityDistributionDataSource *)self queriesForRequest:v12 completionHandler:v25];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __102__HKQuantityDistributionDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2;
  v23[3] = &unk_1E6D525F0;
  id v14 = v9;
  id v24 = v14;
  [v13 enumerateObjectsUsingBlock:v23];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __102__HKQuantityDistributionDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3;
  v20[3] = &unk_1E6D513B0;
  id v21 = v13;
  id v22 = v14;
  id v15 = v14;
  id v16 = v13;
  double v17 = _Block_copy(v20);
  double v18 = _Block_copy(v17);

  return v18;
}

void __102__HKQuantityDistributionDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  char v7 = v6;
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
        double v13 = [v7 localizedDescription];
        int v24 = 138412802;
        long long v25 = v11;
        __int16 v26 = 2112;
        v27 = v12;
        __int16 v28 = 2112;
        v29 = v13;
        _os_log_impl(&dword_1E0B26000, v10, OS_LOG_TYPE_INFO, "[RemoteCharting]_%@_%@: query returned successfully with error: %@", (uint8_t *)&v24, 0x20u);
      }
    }
    id v14 = objc_msgSend(v5, "hk_map:", &__block_literal_global_317_0);
    id v15 = objc_alloc_init(HKCodableChartQuantityDistributionDataSourceQueryData);
    id v16 = (void *)[v14 mutableCopy];
    [(HKCodableChartQuantityDistributionDataSourceQueryData *)v15 setQuantityDistributionDatas:v16];

    double v17 = *(void **)(a1 + 40);
    double v18 = [*(id *)(a1 + 32) startDate];
    id v19 = [*(id *)(a1 + 32) endDate];
    v20 = [*(id *)(a1 + 32) statisticsInterval];
    id v21 = [(HKCodableChartQuantityDistributionDataSourceQueryData *)v15 data];
    id v22 = [v17 codableQueryDataWithType:1 startDate:v18 endDate:v19 statisticsInterval:v20 queryDataObject:v21];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    long long v23 = (void *)*MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __102__HKQuantityDistributionDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v23, v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __102__HKQuantityDistributionDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_314(uint64_t a1, void *a2)
{
  return [a2 codableQuantityDistributionData];
}

uint64_t __102__HKQuantityDistributionDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) executeQuery:a2];
}

void __102__HKQuantityDistributionDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __102__HKQuantityDistributionDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_4;
  v2[3] = &unk_1E6D525F0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObjectsUsingBlock:v2];
}

uint64_t __102__HKQuantityDistributionDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) stopQuery:a2];
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v5 = a3;
  if ([v5 hasTimeZoneName])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAF0]);
    char v7 = [v5 timeZoneName];
    id v8 = (void *)[v6 initWithName:v7];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = self->_preferredUnit;
  id v10 = [HKCodableChartQuantityDistributionDataSourceQueryData alloc];
  id v11 = [v5 queryDataObject];
  id v12 = [(HKCodableChartQuantityDistributionDataSourceQueryData *)v10 initWithData:v11];
  double v13 = [(HKCodableChartQuantityDistributionDataSourceQueryData *)v12 quantityDistributionDatas];

  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __84__HKQuantityDistributionDataSource_chartPointsFromQueryData_dataIsFromRemoteSource___block_invoke;
  id v22 = &unk_1E6D52940;
  id v23 = v8;
  int v24 = v9;
  id v14 = v9;
  id v15 = v8;
  id v16 = objc_msgSend(v13, "hk_map:", &v19);
  double v17 = -[HKQuantityDistributionDataSource _dataBlockFromHistograms:](self, "_dataBlockFromHistograms:", v16, v19, v20, v21, v22);

  return v17;
}

uint64_t __84__HKQuantityDistributionDataSource_chartPointsFromQueryData_dataIsFromRemoteSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F2B948] quantityDistributionDataWithCodableQuantityDistributionData:a2 sourceTimeZone:*(void *)(a1 + 32) preferredUnit:*(void *)(a1 + 40)];
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (double)bucketSize
{
  return self->_bucketSize;
}

- (double)bucketAnchor
{
  return self->_bucketAnchor;
}

- (int64_t)contextStyle
{
  return self->_contextStyle;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSDate)specificStartDate
{
  return self->_specificStartDate;
}

- (NSDate)specificEndDate
{
  return self->_specificEndDate;
}

- (HKUnit)preferredUnit
{
  return self->_preferredUnit;
}

- (id)userInfoCreationBlock
{
  return self->_userInfoCreationBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfoCreationBlock, 0);
  objc_storeStrong((id *)&self->_preferredUnit, 0);
  objc_storeStrong((id *)&self->_specificEndDate, 0);
  objc_storeStrong((id *)&self->_specificStartDate, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
}

+ (void)bucketSizeForBloodGlucoseWithUnit:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = [a2 unitString];
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1E0B26000, v3, OS_LOG_TYPE_ERROR, "Unsupported glucose unit: %{public}@", (uint8_t *)&v5, 0xCu);
}

void __102__HKQuantityDistributionDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = HKStringForChartDataSourceQueryRequestAudience([v5 audience]);
  id v8 = [*(id *)(*(void *)(a1 + 40) + 48) identifier];
  id v9 = [a3 localizedDescription];
  int v10 = 138412802;
  id v11 = v7;
  __int16 v12 = 2112;
  double v13 = v8;
  __int16 v14 = 2112;
  id v15 = v9;
  _os_log_error_impl(&dword_1E0B26000, v6, OS_LOG_TYPE_ERROR, "[RemoteCharting]_%@_%@: unable to fetch results from query with error: %@", (uint8_t *)&v10, 0x20u);
}

@end