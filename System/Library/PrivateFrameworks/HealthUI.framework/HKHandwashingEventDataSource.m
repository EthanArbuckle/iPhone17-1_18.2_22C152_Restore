@interface HKHandwashingEventDataSource
+ (double)durationForCompleteSample;
- (BOOL)doesDurationMeetGoal:(double)a3;
- (BOOL)supportsChartQueryDataGeneration;
- (HKHandwashingEventDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4;
- (double)durationForObject:(id)a3;
- (id)_averageDurationChartModelForObjects:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (id)_dailyAverageChartModelForObjects:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (id)chartModelsForSamples:(id)a3 startDate:(id)a4 endDate:(id)a5 statisticsInterval:(id)a6;
- (id)chartPointsForSamples:(id)a3 startDate:(id)a4 endDate:(id)a5 statisticsInterval:(id)a6;
- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4;
- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5;
- (id)queriesForRequest:(id)a3 completionHandler:(id)a4;
- (id)queryDescription;
- (id)userInfoCreationBlock;
- (void)setUserInfoCreationBlock:(id)a3;
@end

@implementation HKHandwashingEventDataSource

- (HKHandwashingEventDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKHandwashingEventDataSource;
  v4 = [(HKHealthQueryChartCacheDataSource *)&v7 initWithDisplayType:a3 healthStore:a4];
  v5 = v4;
  if (v4) {
    [(HKHandwashingEventDataSource *)v4 setUserInfoCreationBlock:&__block_literal_global_66];
  }
  return v5;
}

HKInteractiveChartHandwashingEventData *__64__HKHandwashingEventDataSource_initWithDisplayType_healthStore___block_invoke(double a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8 = a4;
  v9 = [[HKInteractiveChartHandwashingEventData alloc] initWithTimePeriod:a3 meetsGoal:a1];
  [(HKInteractiveChartTimePeriodData *)v9 setStatisticsInterval:v8];

  [(HKInteractiveChartTimePeriodData *)v9 setRecordCount:a5];
  return v9;
}

+ (double)durationForCompleteSample
{
  return 20.0;
}

- (double)durationForObject:(id)a3
{
  id v3 = a3;
  v4 = [v3 endDate];
  [v4 timeIntervalSinceReferenceDate];
  double v6 = v5;
  objc_super v7 = [v3 startDate];

  [v7 timeIntervalSinceReferenceDate];
  double v9 = v6 - v8;

  return v9;
}

- (BOOL)doesDurationMeetGoal:(double)a3
{
  [(id)objc_opt_class() durationForCompleteSample];
  return v4 <= a3;
}

- (id)queryDescription
{
  return @"HKHandwashingEvent";
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  double v6 = (void *)MEMORY[0x1E4F2B3C0];
  id v7 = a3;
  double v8 = [v7 startDate];
  double v9 = [v7 endDate];

  v10 = [v6 predicateForSamplesWithStartDate:v8 endDate:v9 options:0];

  v11 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F297B8]];
  id v12 = objc_alloc(MEMORY[0x1E4F2B440]);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __68__HKHandwashingEventDataSource_queriesForRequest_completionHandler___block_invoke;
  v21 = &unk_1E6D525A0;
  id v22 = v11;
  id v23 = v5;
  id v13 = v5;
  id v14 = v11;
  v15 = (void *)[v12 initWithSampleType:v14 predicate:v10 limit:0 sortDescriptors:0 resultsHandler:&v18];
  objc_msgSend(v15, "setDebugIdentifier:", @"charting (handwashing)", v18, v19, v20, v21);
  v24[0] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];

  return v16;
}

void __68__HKHandwashingEventDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v9)
  {
    int v11 = objc_msgSend(v9, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    id v12 = *MEMORY[0x1E4F29FB0];
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __68__HKHandwashingEventDataSource_queriesForRequest_completionHandler___block_invoke_cold_1();
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __68__HKHandwashingEventDataSource_queriesForRequest_completionHandler___block_invoke_cold_2();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)chartPointsForSamples:(id)a3 startDate:(id)a4 endDate:(id)a5 statisticsInterval:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [(HKHandwashingEventDataSource *)self chartModelsForSamples:a3 startDate:v12 endDate:v11 statisticsInterval:v10];
  id v14 = [v13 data];
  v15 = [(HKHealthQueryChartCacheDataSource *)self codableQueryDataWithType:5 startDate:v12 endDate:v11 statisticsInterval:v10 queryDataObject:v14];

  v16 = [(HKHandwashingEventDataSource *)self chartPointsFromQueryData:v15 dataIsFromRemoteSource:0];
  v17 = [v16 chartPoints];

  return v17;
}

- (id)chartModelsForSamples:(id)a3 startDate:(id)a4 endDate:(id)a5 statisticsInterval:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  if ([v9 day] == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v9, "hour") == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = v22;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    id v13 = __91__HKHandwashingEventDataSource_chartModelsForSamples_startDate_endDate_statisticsInterval___block_invoke;
  }
  else
  {
    id v12 = v21;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    id v13 = __91__HKHandwashingEventDataSource_chartModelsForSamples_startDate_endDate_statisticsInterval___block_invoke_2;
  }
  v12[2] = v13;
  v12[3] = &unk_1E6D550B0;
  v12[4] = self;
  id v14 = _Block_copy(v12);
  v15 = (void *)MEMORY[0x1E4F2B958];
  v16 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v17 = [v15 arrayByCoalescingObjects:v11 startDate:v10 intervalComponents:v9 calendar:v16 combiningBlock:v14];

  uint64_t v18 = objc_alloc_init(HKCodableChartHandwashingEventDataSourceData);
  uint64_t v19 = (void *)[v17 mutableCopy];
  [(HKCodableChartHandwashingEventDataSourceData *)v18 setEvents:v19];

  return v18;
}

uint64_t __91__HKHandwashingEventDataSource_chartModelsForSamples_startDate_endDate_statisticsInterval___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _dailyAverageChartModelForObjects:a2 startDate:a3 endDate:a4];
}

uint64_t __91__HKHandwashingEventDataSource_chartModelsForSamples_startDate_endDate_statisticsInterval___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _averageDurationChartModelForObjects:a2 startDate:a3 endDate:a4];
}

- (id)_averageDurationChartModelForObjects:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v11 = objc_alloc_init(HKCodableHandwashingEvent);
    HKEncodeValueForDate(v9);
    -[HKCodableHandwashingEvent setStartDate:](v11, "setStartDate:");
    HKEncodeValueForDate(v10);
    -[HKCodableHandwashingEvent setEndDate:](v11, "setEndDate:");
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v26;
      double v16 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          -[HKHandwashingEventDataSource durationForObject:](self, "durationForObject:", *(void *)(*((void *)&v25 + 1) + 8 * i), (void)v25);
          double v16 = v16 + v18;
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v14);
    }
    else
    {
      double v16 = 0.0;
    }

    double v19 = v16 / (double)(unint64_t)[v12 count];
    v20 = (void *)MEMORY[0x1E4F2B370];
    v21 = [MEMORY[0x1E4F2B618] secondUnit];
    id v22 = [v20 quantityWithUnit:v21 doubleValue:v19];
    id v23 = [v22 codableRepresentation];
    [(HKCodableHandwashingEvent *)v11 setAverageDuration:v23];

    [(HKCodableHandwashingEvent *)v11 setMeetsGoal:[(HKHandwashingEventDataSource *)self doesDurationMeetGoal:v19]];
    -[HKCodableHandwashingEvent setCount:](v11, "setCount:", [v12 count]);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_dailyAverageChartModelForObjects:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v11 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_dateComponentsForCalendarUnit:", 16);
    id v12 = (void *)MEMORY[0x1E4F2B958];
    uint64_t v13 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __84__HKHandwashingEventDataSource__dailyAverageChartModelForObjects_startDate_endDate___block_invoke;
    v43[3] = &unk_1E6D550D8;
    v43[4] = self;
    uint64_t v14 = [v12 arrayByCoalescingObjects:v8 startDate:v9 intervalComponents:v11 calendar:v13 combiningBlock:v43];

    if ([v14 count])
    {
      uint64_t v15 = objc_alloc_init(HKCodableHandwashingEvent);
      HKEncodeValueForDate(v9);
      -[HKCodableHandwashingEvent setStartDate:](v15, "setStartDate:");
      HKEncodeValueForDate(v10);
      -[HKCodableHandwashingEvent setEndDate:](v15, "setEndDate:");
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v38 = v14;
      id v16 = v14;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        v35 = self;
        v36 = v11;
        id v37 = v10;
        uint64_t v19 = 0;
        uint64_t v20 = *(void *)v40;
        double v21 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v40 != v20) {
              objc_enumerationMutation(v16);
            }
            id v23 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            v24 = objc_msgSend(v23, "averageDuration", v35, v36, v37);
            [v24 value];
            double v21 = v21 + v25;

            v19 += [v23 count];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v18);
        float v26 = v21;
        float v27 = (float)v19;
        id v11 = v36;
        id v10 = v37;
        self = v35;
      }
      else
      {
        float v26 = 0.0;
        float v27 = 0.0;
      }

      float v28 = v26 / (float)(unint64_t)[v16 count];
      v29 = (void *)MEMORY[0x1E4F2B370];
      uint64_t v30 = [MEMORY[0x1E4F2B618] secondUnit];
      double v31 = v28;
      v32 = [v29 quantityWithUnit:v30 doubleValue:v31];
      v33 = [v32 codableRepresentation];
      [(HKCodableHandwashingEvent *)v15 setAverageDuration:v33];

      [(HKCodableHandwashingEvent *)v15 setMeetsGoal:[(HKHandwashingEventDataSource *)self doesDurationMeetGoal:v31]];
      -[HKCodableHandwashingEvent setCount:](v15, "setCount:", [v8 count]);
      -[HKCodableHandwashingEvent setAverageDailyCount:](v15, "setAverageDailyCount:", (uint64_t)(float)(v27 / (float)(unint64_t)[v16 count]));
      uint64_t v14 = v38;
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t __84__HKHandwashingEventDataSource__dailyAverageChartModelForObjects_startDate_endDate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _averageDurationChartModelForObjects:a2 startDate:a3 endDate:a4];
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
  v25[2] = __98__HKHandwashingEventDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v25[3] = &unk_1E6D53120;
  float v27 = self;
  id v28 = v10;
  id v26 = v8;
  id v11 = v10;
  id v12 = v8;
  uint64_t v13 = [(HKHandwashingEventDataSource *)self queriesForRequest:v12 completionHandler:v25];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __98__HKHandwashingEventDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_401;
  v23[3] = &unk_1E6D525F0;
  id v14 = v9;
  id v24 = v14;
  [v13 enumerateObjectsUsingBlock:v23];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __98__HKHandwashingEventDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2;
  v20[3] = &unk_1E6D513B0;
  id v21 = v13;
  id v22 = v14;
  id v15 = v14;
  id v16 = v13;
  uint64_t v17 = _Block_copy(v20);
  uint64_t v18 = _Block_copy(v17);

  return v18;
}

void __98__HKHandwashingEventDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
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
        uint64_t v12 = *MEMORY[0x1E4F297B8];
        uint64_t v13 = [v7 localizedDescription];
        int v26 = 138412802;
        float v27 = v11;
        __int16 v28 = 2112;
        uint64_t v29 = v12;
        __int16 v30 = 2112;
        double v31 = v13;
        _os_log_impl(&dword_1E0B26000, v10, OS_LOG_TYPE_INFO, "[RemoteCharting]_%@_%@: query returned successfully with error: %@", (uint8_t *)&v26, 0x20u);
      }
    }
    id v14 = *(void **)(a1 + 40);
    id v15 = [*(id *)(a1 + 32) startDate];
    id v16 = [*(id *)(a1 + 32) endDate];
    uint64_t v17 = [*(id *)(a1 + 32) statisticsInterval];
    uint64_t v18 = [v14 chartModelsForSamples:v5 startDate:v15 endDate:v16 statisticsInterval:v17];

    uint64_t v19 = *(void **)(a1 + 40);
    uint64_t v20 = [*(id *)(a1 + 32) startDate];
    id v21 = [*(id *)(a1 + 32) endDate];
    id v22 = [*(id *)(a1 + 32) statisticsInterval];
    id v23 = [v18 data];
    id v24 = [v19 codableQueryDataWithType:5 startDate:v20 endDate:v21 statisticsInterval:v22 queryDataObject:v23];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    double v25 = (void *)*MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __98__HKHandwashingEventDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v25, v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __98__HKHandwashingEventDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_401(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) executeQuery:a2];
}

void __98__HKHandwashingEventDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __98__HKHandwashingEventDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3;
  v2[3] = &unk_1E6D525F0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObjectsUsingBlock:v2];
}

uint64_t __98__HKHandwashingEventDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
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
  id v9 = objc_alloc_init(HKGraphSeriesDataBlock);
  id v10 = [HKCodableChartHandwashingEventDataSourceData alloc];
  id v11 = [v5 queryDataObject];
  uint64_t v12 = [(HKCodableChartHandwashingEventDataSourceData *)v10 initWithData:v11];

  uint64_t v13 = [(HKCodableChartHandwashingEventDataSourceData *)v12 events];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __80__HKHandwashingEventDataSource_chartPointsFromQueryData_dataIsFromRemoteSource___block_invoke;
  id v22 = &unk_1E6D55100;
  id v14 = v8;
  id v23 = v14;
  id v24 = self;
  id v15 = objc_msgSend(v13, "hk_map:", &v19);
  -[HKGraphSeriesDataBlock setChartPoints:](v9, "setChartPoints:", v15, v19, v20, v21, v22);

  id v16 = [(HKGraphSeriesDataBlock *)v9 chartPoints];

  if (!v16)
  {
    uint64_t v17 = [MEMORY[0x1E4F1C978] array];
    [(HKGraphSeriesDataBlock *)v9 setChartPoints:v17];
  }
  return v9;
}

HKHandwashingEventChartPoint *__80__HKHandwashingEventDataSource_chartPointsFromQueryData_dataIsFromRemoteSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 startDate];
  double v4 = HKDecodeDateForValue();
  id v5 = objc_msgSend(v4, "hk_dateFromSourceTimeZone:", *(void *)(a1 + 32));

  [v3 endDate];
  id v6 = HKDecodeDateForValue();
  id v7 = objc_msgSend(v6, "hk_dateFromSourceTimeZone:", *(void *)(a1 + 32));

  id v8 = [[HKHandwashingEventChartPoint alloc] initWithStartDate:v5 endDate:v7];
  id v9 = NSNumber;
  id v10 = [v3 averageDuration];
  [v10 value];
  id v11 = objc_msgSend(v9, "numberWithDouble:");
  [(HKHandwashingEventChartPoint *)v8 setAverageDuration:v11];

  -[HKHandwashingEventChartPoint setMeetsGoal:](v8, "setMeetsGoal:", [v3 meetsGoal]);
  if ([v3 hasAverageDailyCount])
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_dateComponentsForCalendarUnit:", 16);
  }
  else
  {
    uint64_t v12 = 0;
  }
  char v13 = [v3 hasAverageDailyCount];
  id v14 = NSNumber;
  if (v13) {
    uint64_t v15 = [v3 averageDailyCount];
  }
  else {
    uint64_t v15 = [v3 count];
  }
  id v16 = [v14 numberWithLongLong:v15];
  uint64_t v17 = [*(id *)(a1 + 40) userInfoCreationBlock];
  uint64_t v18 = [v3 averageDuration];
  [v18 value];
  uint64_t v20 = ((void (**)(void, uint64_t, void *, void, double))v17)[2](v17, [v3 meetsGoal], v12, (int)objc_msgSend(v16, "intValue"), v19);
  [(HKHandwashingEventChartPoint *)v8 setUserInfo:v20];

  return v8;
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

void __68__HKHandwashingEventDataSource_queriesForRequest_completionHandler___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_8();
  _os_log_debug_impl(&dword_1E0B26000, v0, OS_LOG_TYPE_DEBUG, "Encountered error querying for %{public}@: %{public}@", v1, 0x16u);
}

void __68__HKHandwashingEventDataSource_queriesForRequest_completionHandler___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_8();
  _os_log_error_impl(&dword_1E0B26000, v0, OS_LOG_TYPE_ERROR, "Encountered error querying for %{public}@: %{public}@", v1, 0x16u);
}

void __98__HKHandwashingEventDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = HKStringForChartDataSourceQueryRequestAudience([v4 audience]);
  uint64_t v7 = *MEMORY[0x1E4F297B8];
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