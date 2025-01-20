@interface _ActivityRemoteDataGatherer
- (HKActivitySummaryDataProvider)activitySummaryProvider;
- (NSArray)monthActivitySummaries;
- (NSArray)sixMonthActivitySummaries;
- (NSDateInterval)monthDateInterval;
- (NSDateInterval)sixMonthDateInterval;
- (_ActivityRemoteDataGatherer)initWithActivitySummaryDataProvider:(id)a3 monthDateInterval:(id)a4 sixMonthDateInterval:(id)a5 completion:(id)a6;
- (id)_chartDataSourceQueryDataFromSummaries:(id)a3;
- (id)_dateRangeFromInterval:(id)a3;
- (id)completion;
- (void)dealloc;
- (void)gatherData;
- (void)setActivitySummaryProvider:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setMonthActivitySummaries:(id)a3;
- (void)setMonthDateInterval:(id)a3;
- (void)setSixMonthActivitySummaries:(id)a3;
- (void)setSixMonthDateInterval:(id)a3;
@end

@implementation _ActivityRemoteDataGatherer

- (_ActivityRemoteDataGatherer)initWithActivitySummaryDataProvider:(id)a3 monthDateInterval:(id)a4 sixMonthDateInterval:(id)a5 completion:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)_ActivityRemoteDataGatherer;
  v15 = [(_ActivityRemoteDataGatherer *)&v23 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_monthDateInterval, a4);
    objc_storeStrong((id *)&v16->_sixMonthDateInterval, a5);
    uint64_t v17 = [v14 copy];
    id completion = v16->_completion;
    v16->_id completion = (id)v17;

    objc_storeStrong((id *)&v16->_activitySummaryProvider, a3);
    [(HKActivitySummaryDataProvider *)v16->_activitySummaryProvider addObserver:v16];
    monthActivitySummaries = v16->_monthActivitySummaries;
    v16->_monthActivitySummaries = 0;

    sixMonthActivitySummaries = v16->_sixMonthActivitySummaries;
    v16->_sixMonthActivitySummaries = 0;
  }
  _HKInitializeLogging();
  v21 = *MEMORY[0x1E4F29FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v25 = v16;
    _os_log_impl(&dword_1E0B26000, v21, OS_LOG_TYPE_INFO, "[_ActivityRemoteDataGatherer:%p] init", buf, 0xCu);
  }

  return v16;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E4F29FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_1E0B26000, v3, OS_LOG_TYPE_INFO, "[_ActivityRemoteDataGatherer:%p] dealloc", buf, 0xCu);
  }
  [(HKActivitySummaryDataProvider *)self->_activitySummaryProvider removeObserver:self];
  v4.receiver = self;
  v4.super_class = (Class)_ActivityRemoteDataGatherer;
  [(_ActivityRemoteDataGatherer *)&v4 dealloc];
}

- (void)gatherData
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"HKInteractiveChartActivityController.m" lineNumber:2657 description:@"Gathering remote data must be done from the main thread due to restrictions imposed by HKActivitySummaryDataProvider"];
  }
  _HKInitializeLogging();
  objc_super v4 = (os_log_t *)MEMORY[0x1E4F29FB0];
  v5 = *MEMORY[0x1E4F29FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_INFO))
  {
    int v37 = 134217984;
    v38 = self;
    _os_log_impl(&dword_1E0B26000, v5, OS_LOG_TYPE_INFO, "[_ActivityRemoteDataGatherer:%p] gatherData called", (uint8_t *)&v37, 0xCu);
  }
  v6 = self;
  uint64_t v7 = [(_ActivityRemoteDataGatherer *)v6 monthActivitySummaries];

  if (!v7)
  {
    _HKInitializeLogging();
    v8 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
    {
      int v37 = 134217984;
      v38 = v6;
      _os_log_impl(&dword_1E0B26000, v8, OS_LOG_TYPE_INFO, "[_ActivityRemoteDataGatherer:%p] gatherData monthActivitySummaries", (uint8_t *)&v37, 0xCu);
    }
    v9 = [(_ActivityRemoteDataGatherer *)v6 activitySummaryProvider];
    v10 = [(_ActivityRemoteDataGatherer *)v6 monthDateInterval];
    id v11 = [(_ActivityRemoteDataGatherer *)v6 _dateRangeFromInterval:v10];
    id v12 = [v9 activitySummariesForDateRange:v11 timeScope:4];
    [(_ActivityRemoteDataGatherer *)v6 setMonthActivitySummaries:v12];
  }
  id v13 = [(_ActivityRemoteDataGatherer *)v6 sixMonthActivitySummaries];

  if (!v13)
  {
    _HKInitializeLogging();
    id v14 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
    {
      int v37 = 134217984;
      v38 = v6;
      _os_log_impl(&dword_1E0B26000, v14, OS_LOG_TYPE_INFO, "[_ActivityRemoteDataGatherer:%p] gatherData sixMonthActivitySummaries", (uint8_t *)&v37, 0xCu);
    }
    v15 = [(_ActivityRemoteDataGatherer *)v6 activitySummaryProvider];
    v16 = [(_ActivityRemoteDataGatherer *)v6 sixMonthDateInterval];
    uint64_t v17 = [(_ActivityRemoteDataGatherer *)v6 _dateRangeFromInterval:v16];
    v18 = [v15 activitySummariesForDateRange:v17 timeScope:3];
    [(_ActivityRemoteDataGatherer *)v6 setSixMonthActivitySummaries:v18];
  }
  uint64_t v19 = [(_ActivityRemoteDataGatherer *)v6 monthActivitySummaries];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_ActivityRemoteDataGatherer *)v6 sixMonthActivitySummaries];

    if (v21)
    {
      _HKInitializeLogging();
      v22 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
      {
        int v37 = 134217984;
        v38 = v6;
        _os_log_impl(&dword_1E0B26000, v22, OS_LOG_TYPE_INFO, "[_ActivityRemoteDataGatherer:%p] gatherData sixMonthActivitySummaries && monthActivitySummaries", (uint8_t *)&v37, 0xCu);
      }
      [(HKActivitySummaryDataProvider *)v6->_activitySummaryProvider removeObserver:v6];
      objc_super v23 = objc_alloc_init(HKCodableChartSharableModel);
      v24 = [(_ActivityRemoteDataGatherer *)v6 monthDateInterval];
      v25 = objc_msgSend(v24, "hk_codableDateInterval");
      [(HKCodableChartSharableModel *)v23 setMonthDateInterval:v25];

      uint64_t v26 = [(_ActivityRemoteDataGatherer *)v6 monthActivitySummaries];
      v27 = [(_ActivityRemoteDataGatherer *)v6 _chartDataSourceQueryDataFromSummaries:v26];
      [(HKCodableChartSharableModel *)v23 setMonthData:v27];

      v28 = [(_ActivityRemoteDataGatherer *)v6 sixMonthDateInterval];
      v29 = objc_msgSend(v28, "hk_codableDateInterval");
      [(HKCodableChartSharableModel *)v23 setSixMonthDateInterval:v29];

      v30 = [(_ActivityRemoteDataGatherer *)v6 sixMonthActivitySummaries];
      v31 = [(_ActivityRemoteDataGatherer *)v6 _chartDataSourceQueryDataFromSummaries:v30];
      [(HKCodableChartSharableModel *)v23 setSixMonthData:v31];

      v32 = [(_ActivityRemoteDataGatherer *)v6 completion];
      v33 = (void (**)(void, void, void))[v32 copy];

      [(_ActivityRemoteDataGatherer *)v6 setCompletion:0];
      if (v33)
      {
        _HKInitializeLogging();
        v34 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
        {
          int v37 = 134217984;
          v38 = v6;
          _os_log_impl(&dword_1E0B26000, v34, OS_LOG_TYPE_INFO, "[%p] gatherData calling completion", (uint8_t *)&v37, 0xCu);
        }
        ((void (**)(void, HKCodableChartSharableModel *, void))v33)[2](v33, v23, 0);
      }
    }
  }
  _HKInitializeLogging();
  v35 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
  {
    int v37 = 134217984;
    v38 = v6;
    _os_log_impl(&dword_1E0B26000, v35, OS_LOG_TYPE_INFO, "[_ActivityRemoteDataGatherer:%p] finishing", (uint8_t *)&v37, 0xCu);
  }
}

- (id)_dateRangeFromInterval:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 startDate];
  v5 = [v3 endDate];

  v6 = +[HKValueRange valueRangeWithMinValue:v4 maxValue:v5];

  return v6;
}

- (id)_chartDataSourceQueryDataFromSummaries:(id)a3
{
  id v3 = +[HKInteractiveChartActivityController _codableActivitySummaryDataFromSummaries:a3];
  objc_super v4 = objc_alloc_init(HKCodableChartDataSourceQueryData);
  v5 = [v3 data];
  [(HKCodableChartDataSourceQueryData *)v4 setQueryDataObject:v5];

  [(HKCodableChartDataSourceQueryData *)v4 setType:10];
  v6 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  uint64_t v7 = [v6 name];
  [(HKCodableChartDataSourceQueryData *)v4 setTimeZoneName:v7];

  v8 = [MEMORY[0x1E4F1CA20] currentLocale];
  v9 = [v8 objectForKey:*MEMORY[0x1E4F1C3E0]];

  if (v9) {
    -[HKCodableChartDataSourceQueryData setFirstWeekday:](v4, "setFirstWeekday:", [v9 firstWeekday]);
  }

  return v4;
}

- (NSDateInterval)monthDateInterval
{
  return self->_monthDateInterval;
}

- (void)setMonthDateInterval:(id)a3
{
}

- (NSDateInterval)sixMonthDateInterval
{
  return self->_sixMonthDateInterval;
}

- (void)setSixMonthDateInterval:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (HKActivitySummaryDataProvider)activitySummaryProvider
{
  return self->_activitySummaryProvider;
}

- (void)setActivitySummaryProvider:(id)a3
{
}

- (NSArray)monthActivitySummaries
{
  return self->_monthActivitySummaries;
}

- (void)setMonthActivitySummaries:(id)a3
{
}

- (NSArray)sixMonthActivitySummaries
{
  return self->_sixMonthActivitySummaries;
}

- (void)setSixMonthActivitySummaries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sixMonthActivitySummaries, 0);
  objc_storeStrong((id *)&self->_monthActivitySummaries, 0);
  objc_storeStrong((id *)&self->_activitySummaryProvider, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_sixMonthDateInterval, 0);
  objc_storeStrong((id *)&self->_monthDateInterval, 0);
}

@end