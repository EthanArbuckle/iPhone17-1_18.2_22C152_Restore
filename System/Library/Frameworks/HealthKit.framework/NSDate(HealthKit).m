@interface NSDate(HealthKit)
+ (uint64_t)hk_dateWithNanosecondsSince1970:()HealthKit;
+ (uint64_t)hk_mostRecentDate:()HealthKit;
- (BOOL)hk_isAfterDate:()HealthKit;
- (BOOL)hk_isBeforeDate:()HealthKit;
- (id)hk_nearestDate:()HealthKit;
- (id)hk_truncateToDay;
- (id)hk_utcDateAdjustedToCalendar:()HealthKit;
- (uint64_t)hk_isAfterOrEqualToDate:()HealthKit;
- (uint64_t)hk_isBeforeOrEqualToDate:()HealthKit;
- (uint64_t)hk_nanosecondsSince1970;
- (uint64_t)hk_rfc3339String;
@end

@implementation NSDate(HealthKit)

- (uint64_t)hk_isBeforeOrEqualToDate:()HealthKit
{
  return objc_msgSend(a1, "hk_isAfterDate:") ^ 1;
}

- (BOOL)hk_isAfterDate:()HealthKit
{
  return objc_msgSend(a1, "compare:") == 1;
}

- (BOOL)hk_isBeforeDate:()HealthKit
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (uint64_t)hk_isAfterOrEqualToDate:()HealthKit
{
  return objc_msgSend(a1, "hk_isBeforeDate:") ^ 1;
}

- (uint64_t)hk_rfc3339String
{
  if (hk_rfc3339String_onceToken != -1) {
    dispatch_once(&hk_rfc3339String_onceToken, &__block_literal_global_44);
  }
  v2 = (void *)hk_rfc3339String_dateFormatter;

  return [v2 stringFromDate:a1];
}

- (id)hk_nearestDate:()HealthKit
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__NSDate_HealthKit__hk_nearestDate___block_invoke;
  v5[3] = &unk_1E58C20E0;
  v5[4] = a1;
  v3 = objc_msgSend(a3, "hk_firstObjectWithMinimumValueUsingEvaluationBlock:", v5);

  return v3;
}

+ (uint64_t)hk_mostRecentDate:()HealthKit
{
  return objc_msgSend(a3, "hk_firstObjectWithMaximumValueUsingEvaluationBlock:", &__block_literal_global_6);
}

- (id)hk_truncateToDay
{
  [a1 timeIntervalSinceReferenceDate];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:floor(v1 / 86400.0) * 86400.0];

  return v2;
}

+ (uint64_t)hk_dateWithNanosecondsSince1970:()HealthKit
{
  return [a1 dateWithTimeIntervalSince1970:(double)(a3 / 0x3B9ACA00)];
}

- (uint64_t)hk_nanosecondsSince1970
{
  [a1 timeIntervalSince1970];
  return 1000000000 * (uint64_t)v1;
}

- (id)hk_utcDateAdjustedToCalendar:()HealthKit
{
  v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  v6 = objc_msgSend(v4, "hk_gregorianCalendarWithUTCTimeZone");
  v7 = [v6 components:254 fromDate:a1];
  v8 = [v5 dateFromComponents:v7];

  return v8;
}

@end