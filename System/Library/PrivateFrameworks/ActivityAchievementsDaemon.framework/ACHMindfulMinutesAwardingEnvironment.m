@interface ACHMindfulMinutesAwardingEnvironment
- (ACHAwardsWorkoutClient)workoutClient;
- (ACHMindfulMinutesAwardingEnvironment)initWithHealthStore:(id)a3 workoutClient:(id)a4 calendar:(id)a5 currentDate:(id)a6;
- (HKHealthStore)healthStore;
- (NSCalendar)calendar;
- (NSDate)currentDate;
- (double)numberOfMindfulMinutesInCurrentMonth;
- (double)todayMindfulMinutesValue;
- (id)_dayDateIntervalForCurrentDate;
- (id)_monthDateIntervalForCurrentDate;
- (void)logValues;
- (void)setCalendar:(id)a3;
- (void)setCurrentDate:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setWorkoutClient:(id)a3;
@end

@implementation ACHMindfulMinutesAwardingEnvironment

- (ACHMindfulMinutesAwardingEnvironment)initWithHealthStore:(id)a3 workoutClient:(id)a4 calendar:(id)a5 currentDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)ACHMindfulMinutesAwardingEnvironment;
  v14 = [(ACHMindfulMinutesAwardingEnvironment *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_calendar, a5);
    objc_storeWeak((id *)&v15->_healthStore, v10);
    objc_storeStrong((id *)&v15->_currentDate, a6);
    objc_storeWeak((id *)&v15->_workoutClient, v11);
  }

  return v15;
}

- (double)todayMindfulMinutesValue
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [(ACHMindfulMinutesAwardingEnvironment *)self _dayDateIntervalForCurrentDate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workoutClient);
  id v13 = 0;
  v5 = [WeakRetained mindfulMinutesForForDateInterval:v3 error:&v13];
  id v6 = v13;

  if (v6)
  {
    v7 = ACHLogAwardEngine();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [v6 description];
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "[ACHMindfulMinutesAwardingEnvironment] Failed to compute todayMindfulMinutesValue: %@", buf, 0xCu);
    }
  }
  v9 = [MEMORY[0x263F0A830] minuteUnit];
  [v5 doubleValueForUnit:v9];
  double v11 = v10;

  return v11;
}

- (double)numberOfMindfulMinutesInCurrentMonth
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [(ACHMindfulMinutesAwardingEnvironment *)self _monthDateIntervalForCurrentDate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workoutClient);
  id v13 = 0;
  v5 = [WeakRetained mindfulMinutesForForDateInterval:v3 error:&v13];
  id v6 = v13;

  if (v6)
  {
    v7 = ACHLogAwardEngine();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [v6 description];
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "[ACHMindfulMinutesAwardingEnvironment] Failed to compute numberOfMindfulMinutesInCurrentMonth: %@", buf, 0xCu);
    }
  }
  v9 = [MEMORY[0x263F0A830] minuteUnit];
  [v5 doubleValueForUnit:v9];
  double v11 = v10;

  return v11;
}

- (void)logValues
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = ACHLogAwardEngine();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    currentDate = self->_currentDate;
    [(ACHMindfulMinutesAwardingEnvironment *)self todayMindfulMinutesValue];
    uint64_t v6 = v5;
    [(ACHMindfulMinutesAwardingEnvironment *)self numberOfMindfulMinutesInCurrentMonth];
    int v8 = 138412802;
    v9 = currentDate;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    _os_log_impl(&dword_21F5DA000, v3, OS_LOG_TYPE_DEFAULT, "[ACHMindfulMinutesAwardingEnvironment] currentDate: %@, todayMindfulMinutesValue: %f, numberOfMindfulMinutesInCurrentMonth: %f", (uint8_t *)&v8, 0x20u);
  }
}

- (id)_dayDateIntervalForCurrentDate
{
  v3 = [(NSCalendar *)self->_calendar components:28 fromDate:self->_currentDate];
  v4 = [(NSCalendar *)self->_calendar dateFromComponents:v3];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v4 endDate:self->_currentDate];

  return v5;
}

- (id)_monthDateIntervalForCurrentDate
{
  v3 = [(NSCalendar *)self->_calendar components:28 fromDate:self->_currentDate];
  [v3 year];
  [v3 month];
  v4 = ACHDateComponentsForYearMonthDay();
  uint64_t v5 = [(NSCalendar *)self->_calendar dateFromComponents:v4];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v5 endDate:self->_currentDate];

  return v6;
}

- (HKHealthStore)healthStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_healthStore);
  return (HKHealthStore *)WeakRetained;
}

- (void)setHealthStore:(id)a3
{
}

- (ACHAwardsWorkoutClient)workoutClient
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workoutClient);
  return (ACHAwardsWorkoutClient *)WeakRetained;
}

- (void)setWorkoutClient:(id)a3
{
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (NSDate)currentDate
{
  return self->_currentDate;
}

- (void)setCurrentDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_destroyWeak((id *)&self->_workoutClient);
  objc_destroyWeak((id *)&self->_healthStore);
}

@end