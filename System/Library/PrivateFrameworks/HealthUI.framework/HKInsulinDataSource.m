@interface HKInsulinDataSource
- (BOOL)supportsChartQueryDataGeneration;
- (id)_chartPointsWithBasalInsulinValues:(id)a3 withTotalInsulinValues:(id)a4 filterInterval:(id)a5 sourceTimeZone:(id)a6;
- (id)_dailyAverageInsulinValuesFromStatistics:(id)a3 queryStartDate:(id)a4 statisticsInterval:(id)a5;
- (id)_insulinDataSourceQueryDataFromBasalStatisticsCollection:(id)a3 totalStatisticsCollection:(id)a4 queryStartDate:(id)a5 statisticsInterval:(id)a6;
- (id)_insulinValuesFromStatistics:(id)a3;
- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4;
- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5;
- (id)queriesForRequest:(id)a3 completionHandler:(id)a4;
- (id)queryDescription;
- (id)userInfoCreationBlock;
- (void)setUserInfoCreationBlock:(id)a3;
@end

@implementation HKInsulinDataSource

- (id)queryDescription
{
  return @"HKInsulin";
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  v60[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v35 = a4;
  v7 = (void *)MEMORY[0x1E4F2B958];
  v8 = [v6 statisticsInterval];
  v9 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  v10 = [v9 sampleType];
  LOBYTE(v7) = [v7 shouldUseDailyAverageWithDateComponents:v8 sampleType:v10];

  if (v7) {
    objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_oneDay");
  }
  else {
  v38 = [v6 statisticsInterval];
  }
  v11 = (void *)MEMORY[0x1E4F2B3C0];
  v12 = [v6 startDate];
  v13 = [v6 endDate];
  v14 = [v11 predicateForSamplesWithStartDate:v12 endDate:v13 options:0];

  v15 = [MEMORY[0x1E4F2B3C0] predicateForObjectsWithMetadataKey:*MEMORY[0x1E4F2A180] allowedValues:&unk_1F3C1FA20];
  v60[0] = v15;
  v60[1] = v14;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];

  v36 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v37];
  v16 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A848]];
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy__18;
  v57[4] = __Block_byref_object_dispose__18;
  id v58 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__18;
  v55[4] = __Block_byref_object_dispose__18;
  id v56 = 0;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__18;
  v53[4] = __Block_byref_object_dispose__18;
  id v54 = 0;
  v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  id v18 = objc_alloc(MEMORY[0x1E4F2B5C8]);
  v19 = [v6 startDate];
  v20 = (void *)[v18 initWithQuantityType:v16 quantitySamplePredicate:v36 options:16 anchorDate:v19 intervalComponents:v38];

  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __59__HKInsulinDataSource_queriesForRequest_completionHandler___block_invoke;
  v49[3] = &unk_1E6D552D0;
  v51 = v57;
  v52 = v53;
  v21 = v17;
  v50 = v21;
  [v20 setInitialResultsHandler:v49];
  v22 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  v23 = [v22 behavior];
  objc_msgSend(v20, "setMergeStrategy:", objc_msgSend(v23, "statisticsMergeStrategy"));

  [v20 setDebugIdentifier:@"charting (insulin basal)"];
  dispatch_group_enter(v21);
  id v24 = objc_alloc(MEMORY[0x1E4F2B5C8]);
  v25 = [v6 startDate];
  v26 = (void *)[v24 initWithQuantityType:v16 quantitySamplePredicate:v14 options:16 anchorDate:v25 intervalComponents:v38];

  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __59__HKInsulinDataSource_queriesForRequest_completionHandler___block_invoke_2;
  v45[3] = &unk_1E6D552D0;
  v47 = v55;
  v48 = v53;
  v27 = v21;
  v46 = v27;
  [v26 setInitialResultsHandler:v45];
  v28 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  v29 = [v28 behavior];
  objc_msgSend(v26, "setMergeStrategy:", objc_msgSend(v29, "statisticsMergeStrategy"));

  [v26 setDebugIdentifier:@"charting (insulin total)"];
  v30 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__HKInsulinDataSource_queriesForRequest_completionHandler___block_invoke_3;
  block[3] = &unk_1E6D552F8;
  v43 = v55;
  v42 = v57;
  block[4] = self;
  id v31 = v6;
  id v40 = v31;
  id v32 = v35;
  id v41 = v32;
  v44 = v53;
  dispatch_group_notify(v27, v30, block);
  v59[0] = v20;
  v59[1] = v26;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];

  _Block_object_dispose(v53, 8);
  _Block_object_dispose(v55, 8);

  _Block_object_dispose(v57, 8);
  return v33;
}

void __59__HKInsulinDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, int a2, id obj, void *a4)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v7 = obj;
  id v8 = a4;
  id v13 = v8;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v12 = *(void **)(v9 + 40);
  v10 = (id *)(v9 + 40);
  v11 = v12;
  if (v12) {
    id v8 = v11;
  }
  objc_storeStrong(v10, v8);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __59__HKInsulinDataSource_queriesForRequest_completionHandler___block_invoke_2(uint64_t a1, int a2, id obj, void *a4)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v7 = obj;
  id v8 = a4;
  id v13 = v8;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v12 = *(void **)(v9 + 40);
  v10 = (id *)(v9 + 40);
  v11 = v12;
  if (v12) {
    id v8 = v11;
  }
  objc_storeStrong(v10, v8);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __59__HKInsulinDataSource_queriesForRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v2 && (uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) != 0)
  {
    v4 = *(void **)(a1 + 32);
    v5 = [*(id *)(a1 + 40) startDate];
    id v6 = [*(id *)(a1 + 40) statisticsInterval];
    id v8 = [v4 _insulinDataSourceQueryDataFromBasalStatisticsCollection:v2 totalStatisticsCollection:v3 queryStartDate:v5 statisticsInterval:v6];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v7();
  }
}

- (id)_insulinDataSourceQueryDataFromBasalStatisticsCollection:(id)a3 totalStatisticsCollection:(id)a4 queryStartDate:(id)a5 statisticsInterval:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v12 = (void *)MEMORY[0x1E4F2B958];
  id v13 = a4;
  id v14 = a3;
  v15 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  v16 = [v15 sampleType];
  LODWORD(v12) = [v12 shouldUseDailyAverageWithDateComponents:v11 sampleType:v16];

  v17 = objc_alloc_init(HKCodableChartInsulinDataSourceQueryData);
  id v18 = [v14 statistics];

  if (v12)
  {
    v19 = [(HKInsulinDataSource *)self _dailyAverageInsulinValuesFromStatistics:v18 queryStartDate:v10 statisticsInterval:v11];
    [(HKCodableChartInsulinDataSourceQueryData *)v17 setBasalInsulinValues:v19];

    v20 = [v13 statistics];

    [(HKInsulinDataSource *)self _dailyAverageInsulinValuesFromStatistics:v20 queryStartDate:v10 statisticsInterval:v11];
  }
  else
  {
    v21 = [(HKInsulinDataSource *)self _insulinValuesFromStatistics:v18];
    [(HKCodableChartInsulinDataSourceQueryData *)v17 setBasalInsulinValues:v21];

    v20 = [v13 statistics];

    [(HKInsulinDataSource *)self _insulinValuesFromStatistics:v20];
  v22 = };
  [(HKCodableChartInsulinDataSourceQueryData *)v17 setTotalInsulinValues:v22];

  return v17;
}

- (id)_insulinValuesFromStatistics:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = objc_alloc_init(HKCodableChartInsulinValue);
        v12 = objc_msgSend(v10, "startDate", (void)v17);
        [v12 timeIntervalSinceReferenceDate];
        -[HKCodableChartInsulinValue setStartDate:](v11, "setStartDate:");

        id v13 = [v10 endDate];
        [v13 timeIntervalSinceReferenceDate];
        -[HKCodableChartInsulinValue setEndDate:](v11, "setEndDate:");

        id v14 = [v10 sumQuantity];
        v15 = [v14 codableRepresentation];
        [(HKCodableChartInsulinValue *)v11 setInsulinQuantity:v15];

        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_dailyAverageInsulinValuesFromStatistics:(id)a3 queryStartDate:(id)a4 statisticsInterval:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F2B618];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 internationalUnit];
  id v13 = [(HKHealthQueryChartCacheDataSource *)self calendarOverride];
  id v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  v16 = v15;

  long long v17 = (void *)MEMORY[0x1E4F2B958];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __98__HKInsulinDataSource__dailyAverageInsulinValuesFromStatistics_queryStartDate_statisticsInterval___block_invoke;
  v22[3] = &unk_1E6D550D8;
  id v23 = v12;
  id v18 = v12;
  long long v19 = [v17 arrayByCoalescingObjects:v11 startDate:v10 intervalComponents:v9 calendar:v16 combiningBlock:v22];

  long long v20 = [MEMORY[0x1E4F1CA48] arrayWithArray:v19];

  return v20;
}

HKCodableChartInsulinValue *__98__HKInsulinDataSource__dailyAverageInsulinValuesFromStatistics_queryStartDate_statisticsInterval___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v10) {
    goto LABEL_12;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v24;
  double v13 = 0.0;
  double v14 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v24 != v12) {
        objc_enumerationMutation(v7);
      }
      v16 = [*(id *)(*((void *)&v23 + 1) + 8 * i) sumQuantity];
      long long v17 = v16;
      if (v16)
      {
        [v16 doubleValueForUnit:*(void *)(a1 + 32)];
        double v14 = v14 + v18;
        double v13 = v13 + 1.0;
      }
    }
    uint64_t v11 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v11);
  if (v13 > 0.0)
  {
    long long v19 = [MEMORY[0x1E4F2B370] quantityWithUnit:*(void *)(a1 + 32) doubleValue:v14 / v13];
    long long v20 = objc_alloc_init(HKCodableChartInsulinValue);
    [v8 timeIntervalSinceReferenceDate];
    -[HKCodableChartInsulinValue setStartDate:](v20, "setStartDate:");
    [v9 timeIntervalSinceReferenceDate];
    -[HKCodableChartInsulinValue setEndDate:](v20, "setEndDate:");
    v21 = [v19 codableRepresentation];
    [(HKCodableChartInsulinValue *)v20 setInsulinQuantity:v21];
  }
  else
  {
LABEL_12:
    long long v20 = 0;
  }

  return v20;
}

- (id)_chartPointsWithBasalInsulinValues:(id)a3 withTotalInsulinValues:(id)a4 filterInterval:(id)a5 sourceTimeZone:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v54 = a6;
  id v58 = [MEMORY[0x1E4F1CA48] array];
  v59 = [MEMORY[0x1E4F2B618] internationalUnit];
  uint64_t v12 = [v9 count];
  uint64_t v13 = [v10 count];
  BOOL v14 = v12 != 0;
  BOOL v15 = v13 != 0;
  if (v12 | v13)
  {
    unint64_t v16 = 0;
    unint64_t v17 = 0;
    id v56 = v10;
    id v57 = v9;
    id v55 = v11;
    do
    {
      if (v14)
      {
        double v18 = (void *)MEMORY[0x1E4F1C9C8];
        long long v19 = [v9 objectAtIndexedSubscript:v16];
        [v19 startDate];
        long long v20 = objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:");
      }
      else
      {
        long long v20 = 0;
      }
      v61 = v20;
      if (v15)
      {
        v21 = (void *)MEMORY[0x1E4F1C9C8];
        uint64_t v22 = [v10 objectAtIndexedSubscript:v17];
        [v22 startDate];
        uint64_t v23 = objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:");

        v60 = (void *)v23;
        if (!v14 || [v20 compare:v23] == 1)
        {
          long long v24 = [v10 objectAtIndexedSubscript:v17];
          long long v25 = (void *)MEMORY[0x1E4F2B370];
          long long v26 = [v24 insulinQuantity];
          v27 = [v25 createWithCodableQuantity:v26];

          uint64_t v28 = NSNumber;
          [v27 doubleValueForUnit:v59];
          v29 = objc_msgSend(v28, "numberWithDouble:");
          unint64_t v30 = v17;
          id v31 = 0;
          unint64_t v62 = v30 + 1;
          goto LABEL_13;
        }
        unint64_t v62 = v17;
      }
      else
      {
        unint64_t v62 = v17;
        v60 = 0;
      }
      long long v24 = [v9 objectAtIndexedSubscript:v16];
      id v32 = (void *)MEMORY[0x1E4F2B370];
      v33 = [v24 insulinQuantity];
      v27 = [v32 createWithCodableQuantity:v33];

      v34 = NSNumber;
      [v27 doubleValueForUnit:v59];
      id v31 = objc_msgSend(v34, "numberWithDouble:");
      v29 = 0;
      ++v16;
LABEL_13:

      id v35 = (void *)MEMORY[0x1E4F1C9C8];
      [v24 startDate];
      v36 = objc_msgSend(v35, "dateWithTimeIntervalSinceReferenceDate:");
      v37 = (void *)MEMORY[0x1E4F1C9C8];
      [v24 endDate];
      v38 = objc_msgSend(v37, "dateWithTimeIntervalSinceReferenceDate:");
      if ([v11 containsDate:v36]
        && [v11 containsDate:v38])
      {
        v39 = [v58 lastObject];
        id v40 = v39;
        if (!v39
          || ([v39 startDate],
              id v41 = objc_claimAutoreleasedReturnValue(),
              uint64_t v42 = [v41 compare:v36],
              v41,
              v42 == -1))
        {
          v43 = [HKInsulinChartPoint alloc];
          v44 = objc_msgSend(v36, "hk_dateFromSourceTimeZone:", v54);
          v45 = objc_msgSend(v38, "hk_dateFromSourceTimeZone:", v54);
          uint64_t v46 = [(HKInsulinChartPoint *)v43 initWithStartDate:v44 endDate:v45];

          [v58 addObject:v46];
          id v40 = (void *)v46;
        }
        if (v31) {
          [v40 setBasalSum:v31];
        }
        else {
          [v40 setTotalSum:v29];
        }
        id v10 = v56;
        id v9 = v57;
        id v11 = v55;
      }
      unint64_t v47 = [v9 count];
      unint64_t v48 = [v10 count];
      unint64_t v17 = v62;
      BOOL v15 = v62 < v48;
      BOOL v14 = v16 < v47;
    }
    while (v16 < v47 || v62 < v48);
  }
  v49 = [(HKInsulinDataSource *)self userInfoCreationBlock];
  v50 = v49;
  if (v49)
  {
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __111__HKInsulinDataSource__chartPointsWithBasalInsulinValues_withTotalInsulinValues_filterInterval_sourceTimeZone___block_invoke;
    v63[3] = &unk_1E6D55320;
    id v64 = v49;
    [v58 enumerateObjectsUsingBlock:v63];
  }
  v51 = objc_alloc_init(HKGraphSeriesDataBlock);
  [(HKGraphSeriesDataBlock *)v51 setChartPoints:v58];

  return v51;
}

void __111__HKInsulinDataSource__chartPointsWithBasalInsulinValues_withTotalInsulinValues_filterInterval_sourceTimeZone___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v6 = [v3 basalSum];
  id v4 = [v3 totalSum];
  id v5 = (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v6, v4);
  [v3 setUserInfo:v5];
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
  v25[2] = __89__HKInsulinDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v25[3] = &unk_1E6D55348;
  v27 = self;
  id v28 = v10;
  id v26 = v8;
  id v11 = v10;
  id v12 = v8;
  uint64_t v13 = [(HKInsulinDataSource *)self queriesForRequest:v12 completionHandler:v25];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __89__HKInsulinDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_400;
  v23[3] = &unk_1E6D525F0;
  id v14 = v9;
  id v24 = v14;
  [v13 enumerateObjectsUsingBlock:v23];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __89__HKInsulinDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2;
  v20[3] = &unk_1E6D513B0;
  id v21 = v13;
  id v22 = v14;
  id v15 = v14;
  id v16 = v13;
  unint64_t v17 = _Block_copy(v20);
  double v18 = _Block_copy(v17);

  return v18;
}

void __89__HKInsulinDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
        uint64_t v12 = *MEMORY[0x1E4F2A848];
        uint64_t v13 = [v7 localizedDescription];
        int v21 = 138412802;
        id v22 = v11;
        __int16 v23 = 2112;
        uint64_t v24 = v12;
        __int16 v25 = 2112;
        id v26 = v13;
        _os_log_impl(&dword_1E0B26000, v10, OS_LOG_TYPE_INFO, "[RemoteCharting]_%@_%@: query returned successfully with error: %@", (uint8_t *)&v21, 0x20u);
      }
    }
    id v14 = *(void **)(a1 + 40);
    id v15 = [*(id *)(a1 + 32) startDate];
    id v16 = [*(id *)(a1 + 32) endDate];
    unint64_t v17 = [*(id *)(a1 + 32) statisticsInterval];
    double v18 = [v5 data];
    long long v19 = [v14 codableQueryDataWithType:4 startDate:v15 endDate:v16 statisticsInterval:v17 queryDataObject:v18];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    long long v20 = (void *)*MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __89__HKInsulinDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v20, v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __89__HKInsulinDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_400(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) executeQuery:a2];
}

void __89__HKInsulinDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __89__HKInsulinDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3;
  v2[3] = &unk_1E6D525F0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObjectsUsingBlock:v2];
}

uint64_t __89__HKInsulinDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
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
  id v9 = [HKCodableChartInsulinDataSourceQueryData alloc];
  id v10 = [v5 queryDataObject];
  id v11 = [(HKCodableChartInsulinDataSourceQueryData *)v9 initWithData:v10];

  uint64_t v12 = (void *)MEMORY[0x1E4F1C9C8];
  [v5 startDate];
  uint64_t v13 = objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
  id v14 = (void *)MEMORY[0x1E4F1C9C8];
  [v5 endDate];
  id v15 = objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v13 endDate:v15];
  unint64_t v17 = [(HKCodableChartInsulinDataSourceQueryData *)v11 basalInsulinValues];
  double v18 = [(HKCodableChartInsulinDataSourceQueryData *)v11 totalInsulinValues];
  long long v19 = [(HKInsulinDataSource *)self _chartPointsWithBasalInsulinValues:v17 withTotalInsulinValues:v18 filterInterval:v16 sourceTimeZone:v8];

  return v19;
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

void __89__HKInsulinDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = HKStringForChartDataSourceQueryRequestAudience([v4 audience]);
  uint64_t v7 = *MEMORY[0x1E4F2A848];
  id v8 = [a3 localizedDescription];
  int v9 = 138412802;
  id v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = v7;
  __int16 v13 = 2112;
  id v14 = v8;
  _os_log_error_impl(&dword_1E0B26000, v5, OS_LOG_TYPE_ERROR, "[RemoteCharting]_%@_%@: unable to fetch results from query with error: %@", (uint8_t *)&v9, 0x20u);
}

@end