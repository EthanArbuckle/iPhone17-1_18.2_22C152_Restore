@interface HKHealthQueryChartCacheDataSource
- (BOOL)supportsChartQueryDataGeneration;
- (HKDisplayType)displayType;
- (HKHealthQueryChartCacheDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4;
- (NSCalendar)calendarOverride;
- (id)_buildDescriptionFromStartDate:(id)a3 endDate:(id)a4 statisticsInterval:(id)a5;
- (id)_shiftedQueryIntervalIfNecessaryForStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5;
- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4;
- (id)codableQueryDataWithType:(int)a3 startDate:(id)a4 endDate:(id)a5 statisticsInterval:(id)a6 queryDataObject:(id)a7;
- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5;
- (id)mappingFunctionForContext:(id)a3;
- (id)operationForIdentifier:(id)a3 priorityDelegate:(id)a4 completion:(id)a5;
- (id)queriesForRequest:(id)a3 completionHandler:(id)a4;
- (id)queryCalendar;
- (id)queryDescription;
- (id)statisticsIntervalForTimeScope:(int64_t)a3 resolution:(int64_t)a4 displayType:(id)a5;
- (int64_t)queryAlignment;
- (unint64_t)calendarUnitForTimeScope:(int64_t)a3 displayType:(id)a4;
- (void)setCalendarOverride:(id)a3;
- (void)setQueryAlignment:(int64_t)a3;
@end

@implementation HKHealthQueryChartCacheDataSource

- (HKHealthQueryChartCacheDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKHealthQueryChartCacheDataSource;
  v9 = [(HKHealthQueryChartCacheDataSource *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayType, a3);
    objc_storeStrong((id *)&v10->_healthStore, a4);
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithFirstWeekdayFromRegion");
    calendar = v10->_calendar;
    v10->_calendar = (NSCalendar *)v11;

    calendarOverride = v10->_calendarOverride;
    v10->_calendarOverride = 0;

    v14 = [v7 behavior];
    v10->_queryAlignment = [v14 preferredCalendarDayAlignment];
  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarOverride, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (id)operationForIdentifier:(id)a3 priorityDelegate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v28 = a4;
  v29 = v8;
  id v30 = a5;
  long long v35 = 0uLL;
  uint64_t v36 = 0;
  if (v8)
  {
    [v8 HKGraphSeriesDataBlockPathValue];
    uint64_t v9 = *((void *)&v35 + 1);
  }
  else
  {
    uint64_t v9 = 0;
  }
  unint64_t v10 = [(HKHealthQueryChartCacheDataSource *)self calendarUnitForTimeScope:v9 displayType:self->_displayType];
  uint64_t v11 = [(HKHealthQueryChartCacheDataSource *)self queryCalendar];
  *(_OWORD *)location = v35;
  uint64_t v34 = v36;
  v12 = HKGraphSeriesDataBlockPathMinimumX((uint64_t *)location);
  v13 = objc_msgSend(v12, "hk_dateBeforeDateForCalendar:rangeUnit:", v11, v10);

  *(_OWORD *)location = v35;
  uint64_t v34 = v36;
  v14 = HKGraphSeriesDataBlockPathMaximumX((uint64_t)location);
  v15 = objc_msgSend(v14, "hk_dateBeforeDateForCalendar:rangeUnit:", v11, v10);

  objc_super v16 = [(HKHealthQueryChartCacheDataSource *)self _shiftedQueryIntervalIfNecessaryForStartDate:v13 endDate:v15 calendar:v11];
  v17 = [v16 startDate];

  v18 = [v16 endDate];

  uint64_t v19 = v36;
  v20 = [(HKHealthQueryChartCacheDataSource *)self statisticsIntervalForTimeScope:*((void *)&v35 + 1) resolution:v36 displayType:self->_displayType];
  if (!v20)
  {
    v21 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:*((void *)&v35 + 1)];
    v20 = [v21 seriesPointIntervalComponentsAtResolution:v19];
  }
  v22 = [(HKHealthQueryChartCacheDataSource *)self _buildDescriptionFromStartDate:v17 endDate:v18 statisticsInterval:v20];
  if ([(HKHealthQueryChartCacheDataSource *)self supportsChartQueryDataGeneration])
  {
    v23 = [[HKChartQueryDataGenerationOperation alloc] initWithHealthStore:self->_healthStore dataSource:self startDate:v17 endDate:v18 statisticsInterval:v20 operationDescription:v22 completion:v30];
  }
  else
  {
    v23 = [[HKHealthQueryFetchOperation alloc] initWithHealthStore:self->_healthStore operationDescription:v22 completion:v30];
    objc_initWeak(location, v23);
    v24 = [[HKHealthQueryChartCacheQueryRequest alloc] initWithStartDate:v17 endDate:v18 statisticsInterval:v20];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __88__HKHealthQueryChartCacheDataSource_operationForIdentifier_priorityDelegate_completion___block_invoke;
    v31[3] = &unk_1E6D54690;
    objc_copyWeak(&v32, location);
    v25 = [(HKHealthQueryChartCacheDataSource *)self queriesForRequest:v24 completionHandler:v31];
    [(HKChartQueryDataGenerationOperation *)v23 setQueries:v25];

    objc_destroyWeak(&v32);
    objc_destroyWeak(location);
  }
  if (v28)
  {
    v26 = +[HKValueRange valueRangeWithMinValue:v17 maxValue:v18];
    -[HKFetchOperation setHighPriority:](v23, "setHighPriority:", [v28 isRangeHighPriority:v26]);
  }
  return v23;
}

void __88__HKHealthQueryChartCacheDataSource_operationForIdentifier_priorityDelegate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__HKHealthQueryChartCacheDataSource_operationForIdentifier_priorityDelegate_completion___block_invoke_2;
  block[3] = &unk_1E6D54668;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(&v13);
}

void __88__HKHealthQueryChartCacheDataSource_operationForIdentifier_priorityDelegate_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained completedWithResults:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (id)_shiftedQueryIntervalIfNecessaryForStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int64_t v11 = [(HKHealthQueryChartCacheDataSource *)self queryAlignment];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v10 endDate:v9];

  if (v11 == 1)
  {
    uint64_t v13 = objc_msgSend(v12, "hk_dateIntervalShiftedToQueryAlignment:calendar:", 1, v8);

    id v12 = (void *)v13;
  }

  return v12;
}

- (id)mappingFunctionForContext:(id)a3
{
  return 0;
}

- (unint64_t)calendarUnitForTimeScope:(int64_t)a3 displayType:(id)a4
{
  unint64_t result = objc_msgSend(a4, "hk_chartCalendarUnitForTimeScope:", a3);
  if (!result) {
    return 32;
  }
  return result;
}

- (id)statisticsIntervalForTimeScope:(int64_t)a3 resolution:(int64_t)a4 displayType:(id)a5
{
  return (id)objc_msgSend(a5, "hk_customSeriesPointIntervalComponentsForTimeScope:resolution:", a3, a4);
}

- (id)queryCalendar
{
  calendarOverride = self->_calendarOverride;
  if (!calendarOverride) {
    calendarOverride = self->_calendar;
  }
  return calendarOverride;
}

- (BOOL)supportsChartQueryDataGeneration
{
  return 0;
}

- (id)_buildDescriptionFromStartDate:(id)a3 endDate:(id)a4 statisticsInterval:(id)a5
{
  id v8 = a5;
  id v9 = NSString;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(HKHealthQueryChartCacheDataSource *)self queryDescription];
  uint64_t v13 = _DateForDescription(v11);

  v14 = _DateForDescription(v10);

  id v15 = v8;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v15 year] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = objc_msgSend(NSString, "stringWithFormat:", @"%ldy", objc_msgSend(v15, "year"));
    [v16 addObject:v17];
  }
  if ([v15 month] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"%ldm", objc_msgSend(v15, "month"));
    [v16 addObject:v18];
  }
  if ([v15 day] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%ldd", objc_msgSend(v15, "day"));
    [v16 addObject:v19];
  }
  if ([v15 hour] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v20 = objc_msgSend(NSString, "stringWithFormat:", @"%ldh", objc_msgSend(v15, "hour"));
    [v16 addObject:v20];
  }
  if ([v15 minute] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v21 = objc_msgSend(NSString, "stringWithFormat:", @"%ldm", objc_msgSend(v15, "minute"));
    [v16 addObject:v21];
  }
  if ([v15 second] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v22 = objc_msgSend(NSString, "stringWithFormat:", @"%lds", objc_msgSend(v15, "second"));
    [v16 addObject:v22];
  }
  if ([v16 count])
  {
    v23 = [v16 componentsJoinedByString:@"_"];
  }
  else
  {
    v23 = @"NoDateComponents";
  }

  v24 = [v9 stringWithFormat:@"%@: %@ -> %@ interval %@", v12, v13, v14, v23];

  return v24;
}

- (id)codableQueryDataWithType:(int)a3 startDate:(id)a4 endDate:(id)a5 statisticsInterval:(id)a6 queryDataObject:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = objc_alloc_init(HKCodableChartDataSourceQueryData);
  [(HKCodableChartDataSourceQueryData *)v16 setType:v10];
  if (v12)
  {
    [v12 timeIntervalSinceReferenceDate];
    -[HKCodableChartDataSourceQueryData setStartDate:](v16, "setStartDate:");
  }
  if (v13)
  {
    [v13 timeIntervalSinceReferenceDate];
    -[HKCodableChartDataSourceQueryData setEndDate:](v16, "setEndDate:");
  }
  if (v14)
  {
    v17 = objc_msgSend(v14, "hkui_codableDateComponents");
    [(HKCodableChartDataSourceQueryData *)v16 setStatisticsInterval:v17];
  }
  [(HKCodableChartDataSourceQueryData *)v16 setQueryDataObject:v15];
  v18 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  uint64_t v19 = [v18 name];
  [(HKCodableChartDataSourceQueryData *)v16 setTimeZoneName:v19];

  v20 = [(HKHealthQueryChartCacheDataSource *)self queryCalendar];
  -[HKCodableChartDataSourceQueryData setFirstWeekday:](v16, "setFirstWeekday:", [v20 firstWeekday]);

  return v16;
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (NSCalendar)calendarOverride
{
  return self->_calendarOverride;
}

- (void)setCalendarOverride:(id)a3
{
}

- (int64_t)queryAlignment
{
  return self->_queryAlignment;
}

- (void)setQueryAlignment:(int64_t)a3
{
  self->_queryAlignment = a3;
}

- (id)queryDescription
{
  return @"UnknownQuery";
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5
{
  return 0;
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  return 0;
}

@end