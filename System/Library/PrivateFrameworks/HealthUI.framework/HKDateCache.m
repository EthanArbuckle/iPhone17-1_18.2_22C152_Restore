@interface HKDateCache
- (BOOL)isDateInThisCalendarMonth:(id)a3;
- (BOOL)isDateInThisCalendarYear:(id)a3;
- (BOOL)isDateInToday:(id)a3;
- (BOOL)isDateInTomorrow:(id)a3;
- (BOOL)isDateInYesterday:(id)a3;
- (BOOL)isDateWithinLastRollingMonth:(id)a3;
- (BOOL)isDateWithinLastRollingYear:(id)a3;
- (BOOL)isDayOfWeekNumberOnWeekend:(id)a3;
- (HKDateCache)init;
- (HKDateCache)initWithCalendar:(id)a3;
- (NSCalendar)calendar;
- (NSDate)endOfDayMidnight;
- (NSDate)endOfRollingMonthMidnight;
- (NSDate)endOfRollingWeekMidnight;
- (NSDate)endOfRollingYearMidnight;
- (NSDate)endOfTomorrowMidnight;
- (NSDate)endOfYesterdayMidnight;
- (NSDate)oneMinuteBeforeEndOfDayMidnight;
- (NSDate)oneSecondBeforeEndOfDayMidnight;
- (NSDate)startOfDayMidnight;
- (NSDate)startOfRollingMonthMidnight;
- (NSDate)startOfRollingWeekMidnight;
- (NSDate)startOfRollingYearMidnight;
- (NSDate)startOfTomorrowMidnight;
- (NSDate)startOfYesterdayMidnight;
- (id)_currentDate;
- (id)endOfRollingDay:(id)a3;
- (id)endOfRollingMonth:(id)a3;
- (id)endOfRollingWeek:(id)a3;
- (id)endOfRollingYear:(id)a3;
- (id)startOfRollingDay:(id)a3;
- (id)startOfRollingMonth:(id)a3;
- (id)startOfRollingWeek:(id)a3;
- (id)startOfRollingYear:(id)a3;
- (id)weekendDays;
- (void)_flushCacheAndNotifyObservers:(id)a3;
- (void)_notifyObserversDidUpdateOnNotification:(id)a3;
- (void)_setCurrentDate:(id)a3;
- (void)dealloc;
- (void)flushCache;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation HKDateCache

- (BOOL)isDateInToday:(id)a3
{
  id v4 = a3;
  v5 = [(HKDateCache *)self startOfDayMidnight];
  if (HKUIObjectIsLargerOrEqual(v4, (uint64_t)v5))
  {
    v6 = [(HKDateCache *)self startOfTomorrowMidnight];
    BOOL IsSmaller = HKUIObjectIsSmaller(v4, (uint64_t)v6);
  }
  else
  {
    BOOL IsSmaller = 0;
  }

  return IsSmaller;
}

- (NSDate)startOfTomorrowMidnight
{
  startOfTomorrowMidnight = self->_startOfTomorrowMidnight;
  if (!startOfTomorrowMidnight)
  {
    calendar = self->_calendar;
    v5 = [(HKDateCache *)self _currentDate];
    v6 = [(NSCalendar *)calendar dateByAddingUnit:16 value:1 toDate:v5 options:0];

    v7 = [(NSCalendar *)self->_calendar startOfDayForDate:v6];
    v8 = self->_startOfTomorrowMidnight;
    self->_startOfTomorrowMidnight = v7;

    startOfTomorrowMidnight = self->_startOfTomorrowMidnight;
  }
  return startOfTomorrowMidnight;
}

- (NSDate)startOfDayMidnight
{
  startOfDayMidnight = self->_startOfDayMidnight;
  if (!startOfDayMidnight)
  {
    calendar = self->_calendar;
    v5 = [(HKDateCache *)self _currentDate];
    v6 = [(NSCalendar *)calendar startOfDayForDate:v5];
    v7 = self->_startOfDayMidnight;
    self->_startOfDayMidnight = v6;

    startOfDayMidnight = self->_startOfDayMidnight;
  }
  return startOfDayMidnight;
}

- (id)_currentDate
{
  currentDate = self->_currentDate;
  if (currentDate)
  {
    v3 = currentDate;
  }
  else
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
  }
  return v3;
}

- (HKDateCache)initWithCalendar:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKDateCache;
  v6 = [(HKDateCache *)&v13 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    objc_storeStrong((id *)&v6->_calendar, a3);
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v6 selector:sel__flushCacheAndNotifyObservers_ name:*MEMORY[0x1E4FB2708] object:0];

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v6 selector:sel__flushCacheAndNotifyObservers_ name:*MEMORY[0x1E4F1C370] object:0];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v6 selector:sel__flushCacheAndNotifyObservers_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v6;
}

- (void)registerObserver:(id)a3
{
}

- (HKDateCache)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HKDateCache;
  [(HKDateCache *)&v4 dealloc];
}

- (void)_setCurrentDate:(id)a3
{
  objc_storeStrong((id *)&self->_currentDate, a3);
  [(HKDateCache *)self _flushCacheAndNotifyObservers:0];
}

- (NSDate)startOfYesterdayMidnight
{
  startOfYesterdayMidnight = self->_startOfYesterdayMidnight;
  if (!startOfYesterdayMidnight)
  {
    calendar = self->_calendar;
    id v5 = [(HKDateCache *)self _currentDate];
    v6 = [(NSCalendar *)calendar dateByAddingUnit:16 value:-1 toDate:v5 options:0];

    uint64_t v7 = [(NSCalendar *)self->_calendar startOfDayForDate:v6];
    v8 = self->_startOfYesterdayMidnight;
    self->_startOfYesterdayMidnight = v7;

    startOfYesterdayMidnight = self->_startOfYesterdayMidnight;
  }
  return startOfYesterdayMidnight;
}

- (NSDate)endOfDayMidnight
{
  endOfDayMidnight = self->_endOfDayMidnight;
  if (!endOfDayMidnight)
  {
    calendar = self->_calendar;
    id v5 = [(HKDateCache *)self startOfDayMidnight];
    v6 = [(NSCalendar *)calendar dateByAddingUnit:16 value:1 toDate:v5 options:0];
    uint64_t v7 = self->_endOfDayMidnight;
    self->_endOfDayMidnight = v6;

    endOfDayMidnight = self->_endOfDayMidnight;
  }
  return endOfDayMidnight;
}

- (NSDate)oneMinuteBeforeEndOfDayMidnight
{
  oneMinuteBeforeEndOfDayMidnight = self->_oneMinuteBeforeEndOfDayMidnight;
  if (!oneMinuteBeforeEndOfDayMidnight)
  {
    calendar = self->_calendar;
    id v5 = [(HKDateCache *)self endOfDayMidnight];
    v6 = [(NSCalendar *)calendar dateByAddingUnit:64 value:-1 toDate:v5 options:0];
    uint64_t v7 = self->_oneMinuteBeforeEndOfDayMidnight;
    self->_oneMinuteBeforeEndOfDayMidnight = v6;

    oneMinuteBeforeEndOfDayMidnight = self->_oneMinuteBeforeEndOfDayMidnight;
  }
  return oneMinuteBeforeEndOfDayMidnight;
}

- (NSDate)oneSecondBeforeEndOfDayMidnight
{
  oneSecondBeforeEndOfDayMidnight = self->_oneSecondBeforeEndOfDayMidnight;
  if (!oneSecondBeforeEndOfDayMidnight)
  {
    calendar = self->_calendar;
    id v5 = [(HKDateCache *)self endOfDayMidnight];
    v6 = [(NSCalendar *)calendar dateByAddingUnit:128 value:-1 toDate:v5 options:0];
    uint64_t v7 = self->_oneSecondBeforeEndOfDayMidnight;
    self->_oneSecondBeforeEndOfDayMidnight = v6;

    oneSecondBeforeEndOfDayMidnight = self->_oneSecondBeforeEndOfDayMidnight;
  }
  return oneSecondBeforeEndOfDayMidnight;
}

- (NSDate)endOfTomorrowMidnight
{
  endOfTomorrowMidnight = self->_endOfTomorrowMidnight;
  if (!endOfTomorrowMidnight)
  {
    calendar = self->_calendar;
    id v5 = [(HKDateCache *)self startOfTomorrowMidnight];
    v6 = [(NSCalendar *)calendar dateByAddingUnit:16 value:1 toDate:v5 options:0];
    uint64_t v7 = self->_endOfTomorrowMidnight;
    self->_endOfTomorrowMidnight = v6;

    endOfTomorrowMidnight = self->_endOfTomorrowMidnight;
  }
  return endOfTomorrowMidnight;
}

- (NSDate)startOfRollingWeekMidnight
{
  startOfRollingWeekMidnight = self->_startOfRollingWeekMidnight;
  if (!startOfRollingWeekMidnight)
  {
    objc_super v4 = [(HKDateCache *)self _currentDate];
    id v5 = HKCalendarDateTransformNone();
    HKStartOfRollingWeekForDate(v4, v5);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = self->_startOfRollingWeekMidnight;
    self->_startOfRollingWeekMidnight = v6;

    startOfRollingWeekMidnight = self->_startOfRollingWeekMidnight;
  }
  return startOfRollingWeekMidnight;
}

- (NSDate)endOfRollingWeekMidnight
{
  endOfRollingWeekMidnight = self->_endOfRollingWeekMidnight;
  if (!endOfRollingWeekMidnight)
  {
    objc_super v4 = [(HKDateCache *)self startOfRollingWeekMidnight];
    HKEndOfRollingWeekWithStart(v4);
    id v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v6 = self->_endOfRollingWeekMidnight;
    self->_endOfRollingWeekMidnight = v5;

    endOfRollingWeekMidnight = self->_endOfRollingWeekMidnight;
  }
  return endOfRollingWeekMidnight;
}

- (NSDate)startOfRollingMonthMidnight
{
  startOfRollingMonthMidnight = self->_startOfRollingMonthMidnight;
  if (!startOfRollingMonthMidnight)
  {
    objc_super v4 = [(HKDateCache *)self _currentDate];
    id v5 = HKCalendarDateTransformNone();
    HKStartOfRollingMonthForDate(v4, v5);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = self->_startOfRollingMonthMidnight;
    self->_startOfRollingMonthMidnight = v6;

    startOfRollingMonthMidnight = self->_startOfRollingMonthMidnight;
  }
  return startOfRollingMonthMidnight;
}

- (NSDate)endOfRollingMonthMidnight
{
  endOfRollingMonthMidnight = self->_endOfRollingMonthMidnight;
  if (!endOfRollingMonthMidnight)
  {
    objc_super v4 = [(HKDateCache *)self startOfRollingMonthMidnight];
    HKEndOfRollingMonthWithStart(v4);
    id v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v6 = self->_endOfRollingMonthMidnight;
    self->_endOfRollingMonthMidnight = v5;

    endOfRollingMonthMidnight = self->_endOfRollingMonthMidnight;
  }
  return endOfRollingMonthMidnight;
}

- (NSDate)startOfRollingYearMidnight
{
  startOfRollingYear = self->_startOfRollingYear;
  if (!startOfRollingYear)
  {
    objc_super v4 = [(HKDateCache *)self _currentDate];
    id v5 = HKCalendarDateTransformNone();
    HKStartOfRollingYearForDate(v4, v5);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = self->_startOfRollingYear;
    self->_startOfRollingYear = v6;

    startOfRollingYear = self->_startOfRollingYear;
  }
  return startOfRollingYear;
}

- (NSDate)endOfRollingYearMidnight
{
  endOfRollingYear = self->_endOfRollingYear;
  if (!endOfRollingYear)
  {
    objc_super v4 = [(HKDateCache *)self startOfRollingYearMidnight];
    HKEndOfRollingYearWithStart(v4);
    id v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v6 = self->_endOfRollingYear;
    self->_endOfRollingYear = v5;

    endOfRollingYear = self->_endOfRollingYear;
  }
  return endOfRollingYear;
}

- (id)startOfRollingDay:(id)a3
{
  calendar = self->_calendar;
  id v6 = a3;
  uint64_t v7 = [(HKDateCache *)self startOfDayMidnight];
  v8 = (*((void (**)(id, NSCalendar *, void *))a3 + 2))(v6, calendar, v7);

  return v8;
}

- (id)endOfRollingDay:(id)a3
{
  calendar = self->_calendar;
  id v6 = a3;
  uint64_t v7 = [(HKDateCache *)self endOfDayMidnight];
  v8 = (*((void (**)(id, NSCalendar *, void *))a3 + 2))(v6, calendar, v7);

  return v8;
}

- (id)startOfRollingWeek:(id)a3
{
  calendar = self->_calendar;
  id v6 = a3;
  uint64_t v7 = [(HKDateCache *)self startOfRollingWeekMidnight];
  v8 = (*((void (**)(id, NSCalendar *, void *))a3 + 2))(v6, calendar, v7);

  return v8;
}

- (id)endOfRollingWeek:(id)a3
{
  calendar = self->_calendar;
  id v6 = a3;
  uint64_t v7 = [(HKDateCache *)self endOfRollingWeekMidnight];
  v8 = (*((void (**)(id, NSCalendar *, void *))a3 + 2))(v6, calendar, v7);

  return v8;
}

- (id)startOfRollingMonth:(id)a3
{
  calendar = self->_calendar;
  id v6 = a3;
  uint64_t v7 = [(HKDateCache *)self startOfRollingMonthMidnight];
  v8 = (*((void (**)(id, NSCalendar *, void *))a3 + 2))(v6, calendar, v7);

  return v8;
}

- (id)endOfRollingMonth:(id)a3
{
  calendar = self->_calendar;
  id v6 = a3;
  uint64_t v7 = [(HKDateCache *)self endOfRollingMonthMidnight];
  v8 = (*((void (**)(id, NSCalendar *, void *))a3 + 2))(v6, calendar, v7);

  return v8;
}

- (id)startOfRollingYear:(id)a3
{
  calendar = self->_calendar;
  id v6 = a3;
  uint64_t v7 = [(HKDateCache *)self startOfRollingYearMidnight];
  v8 = (*((void (**)(id, NSCalendar *, void *))a3 + 2))(v6, calendar, v7);

  return v8;
}

- (id)endOfRollingYear:(id)a3
{
  calendar = self->_calendar;
  id v6 = a3;
  uint64_t v7 = [(HKDateCache *)self endOfRollingYearMidnight];
  v8 = (*((void (**)(id, NSCalendar *, void *))a3 + 2))(v6, calendar, v7);

  return v8;
}

- (void)unregisterObserver:(id)a3
{
}

- (void)_notifyObserversDidUpdateOnNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "dateCacheDidUpdate:onNotification:", self, v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)weekendDays
{
  weekendDays = self->_weekendDays;
  if (!weekendDays)
  {
    id v4 = [(NSCalendar *)self->_calendar hk_weekendDays];
    id v5 = self->_weekendDays;
    self->_weekendDays = v4;

    weekendDays = self->_weekendDays;
  }
  return weekendDays;
}

- (BOOL)isDateInYesterday:(id)a3
{
  id v4 = a3;
  id v5 = [(HKDateCache *)self startOfYesterdayMidnight];
  if (HKUIObjectIsLargerOrEqual(v4, (uint64_t)v5))
  {
    uint64_t v6 = [(HKDateCache *)self startOfDayMidnight];
    BOOL IsSmaller = HKUIObjectIsSmaller(v4, (uint64_t)v6);
  }
  else
  {
    BOOL IsSmaller = 0;
  }

  return IsSmaller;
}

- (BOOL)isDateInTomorrow:(id)a3
{
  id v4 = a3;
  id v5 = [(HKDateCache *)self startOfTomorrowMidnight];
  if (HKUIObjectIsLargerOrEqual(v4, (uint64_t)v5))
  {
    uint64_t v6 = [(HKDateCache *)self endOfTomorrowMidnight];
    BOOL IsSmaller = HKUIObjectIsSmaller(v4, (uint64_t)v6);
  }
  else
  {
    BOOL IsSmaller = 0;
  }

  return IsSmaller;
}

- (BOOL)isDateInThisCalendarMonth:(id)a3
{
  calendar = self->_calendar;
  id v5 = a3;
  uint64_t v6 = [(HKDateCache *)self _currentDate];
  uint64_t v7 = [(NSCalendar *)calendar compareDate:v5 toDate:v6 toUnitGranularity:8];

  return v7 == 0;
}

- (BOOL)isDateInThisCalendarYear:(id)a3
{
  calendar = self->_calendar;
  id v5 = a3;
  uint64_t v6 = [(HKDateCache *)self _currentDate];
  uint64_t v7 = [(NSCalendar *)calendar compareDate:v5 toDate:v6 toUnitGranularity:4];

  return v7 == 0;
}

- (BOOL)isDateWithinLastRollingMonth:(id)a3
{
  id v4 = a3;
  id v5 = [(HKDateCache *)self startOfRollingMonthMidnight];
  if (HKUIObjectIsLargerOrEqual(v4, (uint64_t)v5))
  {
    uint64_t v6 = [(HKDateCache *)self endOfRollingMonthMidnight];
    BOOL IsSmaller = HKUIObjectIsSmaller(v4, (uint64_t)v6);
  }
  else
  {
    BOOL IsSmaller = 0;
  }

  return IsSmaller;
}

- (BOOL)isDateWithinLastRollingYear:(id)a3
{
  id v4 = a3;
  id v5 = [(HKDateCache *)self startOfRollingYearMidnight];
  if (HKUIObjectIsLargerOrEqual(v4, (uint64_t)v5))
  {
    uint64_t v6 = [(HKDateCache *)self endOfRollingYearMidnight];
    BOOL IsSmaller = HKUIObjectIsSmaller(v4, (uint64_t)v6);
  }
  else
  {
    BOOL IsSmaller = 0;
  }

  return IsSmaller;
}

- (BOOL)isDayOfWeekNumberOnWeekend:(id)a3
{
  id v4 = a3;
  id v5 = [(HKDateCache *)self weekendDays];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (void)flushCache
{
  startOfYesterdayMidnight = self->_startOfYesterdayMidnight;
  self->_startOfYesterdayMidnight = 0;

  startOfDayMidnight = self->_startOfDayMidnight;
  self->_startOfDayMidnight = 0;

  endOfDayMidnight = self->_endOfDayMidnight;
  self->_endOfDayMidnight = 0;

  oneMinuteBeforeEndOfDayMidnight = self->_oneMinuteBeforeEndOfDayMidnight;
  self->_oneMinuteBeforeEndOfDayMidnight = 0;

  oneSecondBeforeEndOfDayMidnight = self->_oneSecondBeforeEndOfDayMidnight;
  self->_oneSecondBeforeEndOfDayMidnight = 0;

  startOfTomorrowMidnight = self->_startOfTomorrowMidnight;
  self->_startOfTomorrowMidnight = 0;

  endOfTomorrowMidnight = self->_endOfTomorrowMidnight;
  self->_endOfTomorrowMidnight = 0;

  startOfRollingWeekMidnight = self->_startOfRollingWeekMidnight;
  self->_startOfRollingWeekMidnight = 0;

  endOfRollingWeekMidnight = self->_endOfRollingWeekMidnight;
  self->_endOfRollingWeekMidnight = 0;

  startOfRollingMonthMidnight = self->_startOfRollingMonthMidnight;
  self->_startOfRollingMonthMidnight = 0;

  endOfRollingMonthMidnight = self->_endOfRollingMonthMidnight;
  self->_endOfRollingMonthMidnight = 0;

  startOfRollingYear = self->_startOfRollingYear;
  self->_startOfRollingYear = 0;

  endOfRollingYear = self->_endOfRollingYear;
  self->_endOfRollingYear = 0;

  weekendDays = self->_weekendDays;
  self->_weekendDays = 0;
}

- (void)_flushCacheAndNotifyObservers:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__HKDateCache__flushCacheAndNotifyObservers___block_invoke;
  v6[3] = &unk_1E6D513B0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __45__HKDateCache__flushCacheAndNotifyObservers___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) flushCache];
  [*(id *)(a1 + 32) _notifyObserversDidUpdateOnNotification:*(void *)(a1 + 40)];
  ResetLocaleDependentFormatters();
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSDate)endOfYesterdayMidnight
{
  return self->_endOfYesterdayMidnight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_weekendDays, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_endOfRollingYear, 0);
  objc_storeStrong((id *)&self->_startOfRollingYear, 0);
  objc_storeStrong((id *)&self->_endOfRollingMonthMidnight, 0);
  objc_storeStrong((id *)&self->_startOfRollingMonthMidnight, 0);
  objc_storeStrong((id *)&self->_endOfRollingWeekMidnight, 0);
  objc_storeStrong((id *)&self->_startOfRollingWeekMidnight, 0);
  objc_storeStrong((id *)&self->_endOfTomorrowMidnight, 0);
  objc_storeStrong((id *)&self->_startOfTomorrowMidnight, 0);
  objc_storeStrong((id *)&self->_oneSecondBeforeEndOfDayMidnight, 0);
  objc_storeStrong((id *)&self->_oneMinuteBeforeEndOfDayMidnight, 0);
  objc_storeStrong((id *)&self->_endOfDayMidnight, 0);
  objc_storeStrong((id *)&self->_startOfDayMidnight, 0);
  objc_storeStrong((id *)&self->_endOfYesterdayMidnight, 0);
  objc_storeStrong((id *)&self->_startOfYesterdayMidnight, 0);
}

@end