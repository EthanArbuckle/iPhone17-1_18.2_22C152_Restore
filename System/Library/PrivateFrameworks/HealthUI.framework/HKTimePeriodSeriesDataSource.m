@interface HKTimePeriodSeriesDataSource
- (BOOL)supportsChartQueryDataGeneration;
- (HKSampleType)sampleType;
- (NSPredicate)queryPredicate;
- (id)_calculateTotalDurationFromSamples:(id)a3 startDate:(id)a4 endDate:(id)a5 interval:(id)a6 intervalOut:(id *)a7 intervalCountsOut:(id *)a8;
- (id)_chartPointsWithStatisticsInterval:(id)a3 dateIntervalsToTotals:(id)a4 intervalCounts:(id)a5 sourceTimeZone:(id)a6;
- (id)_codableDataWithSamples:(id)a3 blockStart:(id)a4 blockEnd:(id)a5 intervalComponents:(id)a6;
- (id)_codableTimePeriodDataWithDictionary:(id)a3;
- (id)_startOfDayTransform;
- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4;
- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5;
- (id)queriesForRequest:(id)a3 completionHandler:(id)a4;
- (id)queryDescription;
- (id)userInfoCreationBlock;
- (void)setQueryPredicate:(id)a3;
- (void)setSampleType:(id)a3;
- (void)setUserInfoCreationBlock:(id)a3;
@end

@implementation HKTimePeriodSeriesDataSource

- (id)_startOfDayTransform
{
  v2 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  v3 = objc_msgSend(v2, "hk_startOfDayTransform");

  return v3;
}

- (id)queryDescription
{
  v2 = NSString;
  v3 = [(HKTimePeriodSeriesDataSource *)self sampleType];
  v4 = objc_msgSend(v3, "hk_localizedName");
  v5 = [v2 stringWithFormat:@"HKTimePeriodSeries(%@)", v4];

  return v5;
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v27 = a4;
  v7 = [v6 startDate];
  v8 = [v6 endDate];
  v9 = [(HKTimePeriodSeriesDataSource *)self _startOfDayTransform];
  if (v9)
  {
    v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v11 = [v6 startDate];
    uint64_t v12 = ((void (**)(void, void *, void *))v9)[2](v9, v10, v11);

    v13 = [v6 endDate];
    uint64_t v14 = ((void (**)(void, void *, void *))v9)[2](v9, v10, v13);

    v8 = (void *)v14;
    v7 = (void *)v12;
  }
  v15 = objc_msgSend(MEMORY[0x1E4F2B3C0], "predicateForSamplesWithStartDate:endDate:options:", v7, v8, 0, v8);
  v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*MEMORY[0x1E4F2A9B8] ascending:1];
  id v17 = objc_alloc(MEMORY[0x1E4F2B440]);
  v18 = [(HKTimePeriodSeriesDataSource *)self sampleType];
  v19 = HKUIPredicateMatchingPredicates(v15, self->_queryPredicate);
  v32[0] = v16;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __68__HKTimePeriodSeriesDataSource_queriesForRequest_completionHandler___block_invoke;
  v28[3] = &unk_1E6D51368;
  v28[4] = self;
  id v29 = v6;
  id v30 = v27;
  id v21 = v27;
  id v22 = v6;
  v23 = (void *)[v17 initWithSampleType:v18 predicate:v19 limit:0 sortDescriptors:v20 resultsHandler:v28];

  [v23 setDebugIdentifier:@"charting (time period)"];
  v31 = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];

  return v24;
}

void __68__HKTimePeriodSeriesDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v9)
  {
    int v11 = objc_msgSend(v9, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    uint64_t v12 = (void *)*MEMORY[0x1E4F29FB0];
    v13 = *MEMORY[0x1E4F29FB0];
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
  uint64_t v14 = *(void **)(a1 + 32);
  v15 = [*(id *)(a1 + 40) startDate];
  v16 = [*(id *)(a1 + 40) endDate];
  id v17 = [*(id *)(a1 + 40) statisticsInterval];
  v18 = [v14 _codableDataWithSamples:v8 blockStart:v15 blockEnd:v16 intervalComponents:v17];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)_chartPointsWithStatisticsInterval:(id)a3 dateIntervalsToTotals:(id)a4 intervalCounts:(id)a5 sourceTimeZone:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v14 = a4;
  id v15 = objc_alloc_init(v13);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __119__HKTimePeriodSeriesDataSource__chartPointsWithStatisticsInterval_dateIntervalsToTotals_intervalCounts_sourceTimeZone___block_invoke;
  v22[3] = &unk_1E6D53B98;
  id v23 = v12;
  v24 = self;
  id v25 = v11;
  id v26 = v10;
  id v27 = v15;
  id v16 = v15;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  [v14 enumerateKeysAndObjectsUsingBlock:v22];

  [v16 sortUsingComparator:&__block_literal_global_41];
  v20 = objc_alloc_init(HKGraphSeriesDataBlock);
  [(HKGraphSeriesDataBlock *)v20 setChartPoints:v16];

  return v20;
}

void __119__HKTimePeriodSeriesDataSource__chartPointsWithStatisticsInterval_dateIntervalsToTotals_intervalCounts_sourceTimeZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  id v6 = objc_alloc_init(_HKTimePeriodChartPoint);
  id v7 = [v15 startDate];
  id v8 = objc_msgSend(v7, "hk_dateFromSourceTimeZone:", *(void *)(a1 + 32));

  id v9 = [v15 endDate];
  id v10 = objc_msgSend(v9, "hk_dateFromSourceTimeZone:", *(void *)(a1 + 32));

  id v11 = HKUIMidDate(v8, v10);
  [(_HKTimePeriodChartPoint *)v6 setXValue:v11];
  [(_HKTimePeriodChartPoint *)v6 setYValue:v5];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 64);
  if (v12)
  {
    v13 = [*(id *)(a1 + 48) objectForKeyedSubscript:v15];
    id v14 = (*(void (**)(uint64_t, id, uint64_t, void))(v12 + 16))(v12, v5, [v13 integerValue], *(void *)(a1 + 56));
    [(_HKTimePeriodChartPoint *)v6 setUserInfo:v14];
  }
  [*(id *)(a1 + 64) addObject:v6];
}

uint64_t __119__HKTimePeriodSeriesDataSource__chartPointsWithStatisticsInterval_dateIntervalsToTotals_intervalCounts_sourceTimeZone___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 xValue];
  id v6 = [v4 xValue];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_calculateTotalDurationFromSamples:(id)a3 startDate:(id)a4 endDate:(id)a5 interval:(id)a6 intervalOut:(id *)a7 intervalCountsOut:(id *)a8
{
  id v13 = a6;
  id v14 = (void *)MEMORY[0x1E4F2B958];
  id v15 = a5;
  id v16 = a4;
  id v17 = [v14 coalesceTimePeriodsFromSamples:a3 strictStartDate:v16 strictEndDate:v15];
  id v18 = (void *)MEMORY[0x1E4F2B958];
  id v19 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  v20 = [v19 sampleType];
  LODWORD(v18) = [v18 shouldUseDailyAverageWithDateComponents:v13 sampleType:v20];

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_oneDay");
    id v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v21 = v13;
  }
  id v22 = v21;
  id v23 = (void *)MEMORY[0x1E4F2B958];
  v24 = [(HKTimePeriodSeriesDataSource *)self _startOfDayTransform];
  id v25 = [v23 calculateTotalDurationsWithTimePeriods:v17 startDate:v16 endDate:v15 intervalComponents:v22 startOfDayTransform:v24];

  if (a7) {
    *a7 = v22;
  }
  id v26 = [MEMORY[0x1E4F2B958] coalesceTotalDurations:v25 startDate:v16 intervalComponents:v13 intervalRecordCountsOut:a8];

  return v26;
}

- (id)_codableDataWithSamples:(id)a3 blockStart:(id)a4 blockEnd:(id)a5 intervalComponents:(id)a6
{
  id v17 = 0;
  id v18 = 0;
  uint64_t v7 = [(HKTimePeriodSeriesDataSource *)self _calculateTotalDurationFromSamples:a3 startDate:a4 endDate:a5 interval:a6 intervalOut:&v18 intervalCountsOut:&v17];
  id v8 = v18;
  id v9 = v17;
  id v10 = objc_alloc_init(HKCodableChartTimePeriodSeriesDataSourceData);
  id v11 = objc_msgSend(v8, "hkui_codableDateComponents");
  [(HKCodableChartTimePeriodSeriesDataSourceData *)v10 setStatisticsInterval:v11];

  uint64_t v12 = [(HKTimePeriodSeriesDataSource *)self _codableTimePeriodDataWithDictionary:v7];
  id v13 = (void *)[v12 mutableCopy];
  [(HKCodableChartTimePeriodSeriesDataSourceData *)v10 setDateIntervalsToTotals:v13];

  id v14 = [(HKTimePeriodSeriesDataSource *)self _codableTimePeriodDataWithDictionary:v9];

  id v15 = (void *)[v14 mutableCopy];
  [(HKCodableChartTimePeriodSeriesDataSourceData *)v10 setIntervalCounts:v15];

  return v10;
}

- (id)_codableTimePeriodDataWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 allKeys];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__HKTimePeriodSeriesDataSource__codableTimePeriodDataWithDictionary___block_invoke;
  v9[3] = &unk_1E6D53BE0;
  id v10 = v4;
  id v11 = self;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "hk_map:", v9);

  return v7;
}

HKCodableTimePeriodData *__69__HKTimePeriodSeriesDataSource__codableTimePeriodDataWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(HKCodableTimePeriodData);
  id v5 = objc_alloc_init(HKCodableDateInterval);
  [(HKCodableTimePeriodData *)v4 setDateInterval:v5];

  id v6 = [v3 startDate];
  double v7 = HKEncodeValueForDate();
  id v8 = [(HKCodableTimePeriodData *)v4 dateInterval];
  [v8 setStartDate:v7];

  id v9 = [v3 endDate];
  double v10 = HKEncodeValueForDate();
  id v11 = [(HKCodableTimePeriodData *)v4 dateInterval];
  [v11 setEndDate:v10];

  uint64_t v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];

  id v13 = [*(id *)(a1 + 40) displayType];
  uint64_t v14 = [v13 roundingMode];

  if (v14 == 1)
  {
    uint64_t v15 = [v12 integerValue];
  }
  else
  {
    [v12 doubleValue];
    uint64_t v15 = llround(v16);
  }
  [(HKCodableTimePeriodData *)v4 setTotal:v15];

  return v4;
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
  v25[2] = __98__HKTimePeriodSeriesDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v25[3] = &unk_1E6D53C08;
  id v26 = v8;
  id v27 = self;
  id v28 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = [(HKTimePeriodSeriesDataSource *)self queriesForRequest:v12 completionHandler:v25];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __98__HKTimePeriodSeriesDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_301;
  v23[3] = &unk_1E6D525F0;
  id v14 = v9;
  id v24 = v14;
  [v13 enumerateObjectsUsingBlock:v23];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __98__HKTimePeriodSeriesDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2;
  v20[3] = &unk_1E6D513B0;
  id v21 = v13;
  id v22 = v14;
  id v15 = v14;
  id v16 = v13;
  id v17 = _Block_copy(v20);
  id v18 = _Block_copy(v17);

  return v18;
}

void __98__HKTimePeriodSeriesDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = v6;
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
    id v17 = [*(id *)(a1 + 32) statisticsInterval];
    id v18 = [v5 data];
    id v19 = [v14 codableQueryDataWithType:7 startDate:v15 endDate:v16 statisticsInterval:v17 queryDataObject:v18];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __98__HKTimePeriodSeriesDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v20, v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __98__HKTimePeriodSeriesDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_301(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) executeQuery:a2];
}

void __98__HKTimePeriodSeriesDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __98__HKTimePeriodSeriesDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3;
  v2[3] = &unk_1E6D525F0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObjectsUsingBlock:v2];
}

uint64_t __98__HKTimePeriodSeriesDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) stopQuery:a2];
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v5 = a3;
  if ([v5 hasTimeZoneName])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAF0]);
    double v7 = [v5 timeZoneName];
    id v8 = (void *)[v6 initWithName:v7];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [HKCodableChartTimePeriodSeriesDataSourceData alloc];
  id v10 = [v5 queryDataObject];
  id v11 = [(HKCodableChartTimePeriodSeriesDataSourceData *)v9 initWithData:v10];

  id v12 = (void *)MEMORY[0x1E4F1C9D8];
  id v13 = [(HKCodableChartTimePeriodSeriesDataSourceData *)v11 statisticsInterval];
  id v14 = objc_msgSend(v12, "hkui_dateComponentsWithCodableDateComponents:", v13);

  id v15 = [(HKCodableChartTimePeriodSeriesDataSourceData *)v11 dateIntervalsToTotals];
  id v16 = +[HKCodableTimePeriodData timePeriodDataWithCodableData:v15];

  id v17 = [(HKCodableChartTimePeriodSeriesDataSourceData *)v11 intervalCounts];
  id v18 = +[HKCodableTimePeriodData timePeriodDataWithCodableData:v17];

  id v19 = [(HKTimePeriodSeriesDataSource *)self _chartPointsWithStatisticsInterval:v14 dateIntervalsToTotals:v16 intervalCounts:v18 sourceTimeZone:v8];

  return v19;
}

- (HKSampleType)sampleType
{
  return self->_sampleType;
}

- (void)setSampleType:(id)a3
{
}

- (NSPredicate)queryPredicate
{
  return self->_queryPredicate;
}

- (void)setQueryPredicate:(id)a3
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
  objc_storeStrong((id *)&self->_queryPredicate, 0);
  objc_storeStrong((id *)&self->_sampleType, 0);
}

void __98__HKTimePeriodSeriesDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  double v7 = HKStringForChartDataSourceQueryRequestAudience([v5 audience]);
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