@interface NSDate
@end

@implementation NSDate

void __37__NSDate_HealthKit__hk_rfc3339String__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)hk_rfc3339String_dateFormatter;
  hk_rfc3339String_dateFormatter = (uint64_t)v0;

  [(id)hk_rfc3339String_dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
  id v2 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [(id)hk_rfc3339String_dateFormatter setTimeZone:v2];
}

double __36__NSDate_HealthKit__hk_nearestDate___block_invoke(uint64_t a1, void *a2)
{
  [a2 timeIntervalSinceDate:*(void *)(a1 + 32)];
  return fabs(v2);
}

uint64_t __39__NSDate_HealthKit__hk_mostRecentDate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 timeIntervalSinceReferenceDate];
}

@end