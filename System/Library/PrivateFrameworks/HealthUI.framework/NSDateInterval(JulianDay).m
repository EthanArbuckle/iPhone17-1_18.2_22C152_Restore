@interface NSDateInterval(JulianDay)
+ (id)hk_julianDayDateIntervalFromOpenUpperBoundDateInterval:()JulianDay sourceCalendar:localCalendar:;
@end

@implementation NSDateInterval(JulianDay)

+ (id)hk_julianDayDateIntervalFromOpenUpperBoundDateInterval:()JulianDay sourceCalendar:localCalendar:
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [v9 startDate];
  uint64_t v11 = objc_msgSend(v10, "hk_dayIndexWithCalendar:", v8);

  v12 = [v9 endDate];

  uint64_t v13 = objc_msgSend(v12, "hk_dayIndexWithCalendar:", v8);
  if (v11 == v13)
  {
    v14 = 0;
  }
  else
  {
    v15 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_dateOnDayIndex:atHour:calendar:", v11, 0, v7);
    v16 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_dateOnDayIndex:atHour:calendar:", v13, 0, v7);
    v17 = [v7 dateByAddingUnit:128 value:-1 toDate:v16 options:0];
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v15 endDate:v17];
  }
  return v14;
}

@end