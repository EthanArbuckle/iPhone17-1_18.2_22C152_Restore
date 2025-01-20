@interface NSDate(DBAnalytics)
- (uint64_t)DBSecondsToDate:()DBAnalytics;
@end

@implementation NSDate(DBAnalytics)

- (uint64_t)DBSecondsToDate:()DBAnalytics
{
  return [a3 timeIntervalSinceDate:a1];
}

@end