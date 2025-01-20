@interface NSCalendar(BaseBoard)
- (uint64_t)bs_dayPeriodForDate:()BaseBoard inLocale:;
@end

@implementation NSCalendar(BaseBoard)

- (uint64_t)bs_dayPeriodForDate:()BaseBoard inLocale:
{
  id v6 = a3;
  v7 = [a4 localeIdentifier];
  v8 = [a1 components:96 fromDate:v6];
  [v8 hour];
  [v8 minute];
  id v9 = v7;
  [v9 UTF8String];
  unsigned int DayPeriod = uacal_getDayPeriod();
  uint64_t v11 = 10;
  if (DayPeriod < 0xA) {
    uint64_t v11 = qword_18AB4C1D0[DayPeriod];
  }

  return v11;
}

@end