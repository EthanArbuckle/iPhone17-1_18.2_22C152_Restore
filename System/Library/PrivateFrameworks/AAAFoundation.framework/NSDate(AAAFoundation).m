@interface NSDate(AAAFoundation)
- (uint64_t)aaf_isRelative;
- (uint64_t)aaf_isToday;
- (uint64_t)aaf_isTodayWithCalendar:()AAAFoundation;
- (uint64_t)dayComponentsWithCalendar:()AAAFoundation;
@end

@implementation NSDate(AAAFoundation)

- (uint64_t)aaf_isRelative
{
  v2 = objc_msgSend(MEMORY[0x1E4F28C10], "aaf_standardFormatter");
  v3 = [v2 stringFromDate:a1];
  v4 = objc_msgSend(MEMORY[0x1E4F28C10], "aaf_standardFormatter");
  [v4 setDoesRelativeDateFormatting:0];
  v5 = [v4 stringFromDate:a1];
  uint64_t v6 = [v3 isEqualToString:v5] ^ 1;

  return v6;
}

- (uint64_t)aaf_isToday
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v3 = objc_msgSend(a1, "aaf_isTodayWithCalendar:", v2);

  return v3;
}

- (uint64_t)aaf_isTodayWithCalendar:()AAAFoundation
{
  id v4 = a3;
  v5 = [a1 dayComponentsWithCalendar:v4];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  v7 = [v6 dayComponentsWithCalendar:v4];

  uint64_t v8 = [v5 isEqual:v7];
  return v8;
}

- (uint64_t)dayComponentsWithCalendar:()AAAFoundation
{
  return [a3 components:30 fromDate:a1];
}

@end