@interface NSDateInterval(HKChartQueryCalendarDayAlignment)
- (id)hk_dateIntervalShiftedToQueryAlignment:()HKChartQueryCalendarDayAlignment calendar:;
- (id)hk_dateIntervalUnshiftedFromQueryAlignment:()HKChartQueryCalendarDayAlignment calendar:;
@end

@implementation NSDateInterval(HKChartQueryCalendarDayAlignment)

- (id)hk_dateIntervalShiftedToQueryAlignment:()HKChartQueryCalendarDayAlignment calendar:
{
  if (a3 == 1)
  {
    id v5 = a4;
    v6 = [a1 startDate];
    v7 = objc_msgSend(v6, "hk_sleepDayStartWithCalendar:", v5);

    v8 = [a1 endDate];
    v9 = objc_msgSend(v8, "hk_sleepDayStartWithCalendar:", v5);

    id v10 = (id)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 endDate:v9];
  }
  else
  {
    id v10 = a1;
  }
  return v10;
}

- (id)hk_dateIntervalUnshiftedFromQueryAlignment:()HKChartQueryCalendarDayAlignment calendar:
{
  if (a3 == 1)
  {
    id v5 = a4;
    v6 = [a1 startDate];
    v7 = [v5 dateByAddingUnit:16 value:1 toDate:v6 options:0];
    v8 = [v5 startOfDayForDate:v7];

    v9 = [a1 endDate];
    id v10 = [v5 dateByAddingUnit:16 value:1 toDate:v9 options:0];
    v11 = [v5 startOfDayForDate:v10];

    id v12 = (id)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v11];
  }
  else
  {
    id v12 = a1;
  }
  return v12;
}

@end