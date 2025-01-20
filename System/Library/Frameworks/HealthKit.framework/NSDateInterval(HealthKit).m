@interface NSDateInterval(HealthKit)
+ (id)hk_allTime;
+ (id)hk_dateIntervalForDayFromDate:()HealthKit calendar:;
+ (id)hk_dateIntervalWithAnchor:()HealthKit startOffset:endOffset:;
+ (id)hk_dateIntervalWithStart:()HealthKit end:;
+ (id)hk_instantaneousDateIntervalWithDate:()HealthKit;
- (BOOL)hk_containsTime:()HealthKit;
- (id)hk_prettyString;
- (uint64_t)hk_intersectsDateIntervalWithStartDate:()HealthKit endDate:;
@end

@implementation NSDateInterval(HealthKit)

+ (id)hk_allTime
{
  id v0 = objc_alloc(MEMORY[0x1E4F28C18]);
  v1 = [MEMORY[0x1E4F1C9C8] distantPast];
  v2 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v3 = (void *)[v0 initWithStartDate:v1 endDate:v2];

  return v3;
}

+ (id)hk_dateIntervalWithStart:()HealthKit end:
{
  id v4 = objc_alloc(MEMORY[0x1E4F28C18]);
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:a1];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:a2];
  v7 = (void *)[v4 initWithStartDate:v5 endDate:v6];

  return v7;
}

+ (id)hk_instantaneousDateIntervalWithDate:()HealthKit
{
  v3 = (objc_class *)MEMORY[0x1E4F28C18];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithStartDate:v4 duration:0.0];

  return v5;
}

+ (id)hk_dateIntervalWithAnchor:()HealthKit startOffset:endOffset:
{
  v7 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v8 = a5;
  v9 = (void *)[[v7 alloc] initWithTimeInterval:v8 sinceDate:a1];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v8 sinceDate:a2];

  v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v9 endDate:v10];

  return v11;
}

+ (id)hk_dateIntervalForDayFromDate:()HealthKit calendar:
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v5 dateByAddingUnit:16 value:1 toDate:v6 options:0];
  id v8 = [v5 startOfDayForDate:v6];

  v9 = [v5 startOfDayForDate:v7];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v9];

  return v10;
}

- (uint64_t)hk_intersectsDateIntervalWithStartDate:()HealthKit endDate:
{
  id v6 = (objc_class *)MEMORY[0x1E4F28C18];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithStartDate:v8 endDate:v7];

  uint64_t v10 = [a1 intersectsDateInterval:v9];
  return v10;
}

- (BOOL)hk_containsTime:()HealthKit
{
  id v4 = [a1 startDate];
  [v4 timeIntervalSinceReferenceDate];
  double v6 = v5;

  [a1 duration];
  BOOL v8 = v6 <= a2;
  if (v6 + v7 < a2) {
    BOOL v8 = 0;
  }
  if (v7 == 0.0) {
    return v6 == a2;
  }
  else {
    return v8;
  }
}

- (id)hk_prettyString
{
  v2 = NSString;
  v3 = [a1 startDate];
  id v4 = [a1 endDate];
  double v5 = [v2 stringWithFormat:@"<startDate: %@, endDate: %@>", v3, v4];

  return v5;
}

@end