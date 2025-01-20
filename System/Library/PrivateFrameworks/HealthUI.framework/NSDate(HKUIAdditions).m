@interface NSDate(HKUIAdditions)
+ (id)hk_minimumDateForBirthDateWithCalendar:()HKUIAdditions;
- (id)hk_dateFromSourceTimeZone:()HKUIAdditions;
- (id)hkui_dateNormalizedFromDateInterval:()HKUIAdditions toDateInterval:;
- (uint64_t)hk_dateWithTruncatedSecond;
@end

@implementation NSDate(HKUIAdditions)

- (uint64_t)hk_dateWithTruncatedSecond
{
  [a1 timeIntervalSinceReferenceDate];
  double v2 = floor(v1 / 60.0) * 60.0;
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  return [v3 dateWithTimeIntervalSinceReferenceDate:v2];
}

+ (id)hk_minimumDateForBirthDateWithCalendar:()HKUIAdditions
{
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  v5 = [v3 date];
  v6 = [v4 dateByAddingUnit:4 value:-130 toDate:v5 options:0];

  return v6;
}

- (id)hk_dateFromSourceTimeZone:()HKUIAdditions
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4F1CAF0];
    id v5 = a3;
    v6 = [v4 localTimeZone];
    uint64_t v7 = [v5 secondsFromGMTForDate:a1];

    objc_msgSend(a1, "dateByAddingTimeInterval:", (double)v7 - (double)objc_msgSend(v6, "secondsFromGMTForDate:", a1));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = a1;
  }
  return v8;
}

- (id)hkui_dateNormalizedFromDateInterval:()HKUIAdditions toDateInterval:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 startDate];
  [a1 timeIntervalSinceDate:v8];
  double v10 = v9;

  [v6 duration];
  double v12 = v11;
  [v7 duration];
  double v14 = v13;

  v15 = [v6 startDate];

  v16 = [v15 dateByAddingTimeInterval:v10 * (v12 / v14)];

  return v16;
}

@end