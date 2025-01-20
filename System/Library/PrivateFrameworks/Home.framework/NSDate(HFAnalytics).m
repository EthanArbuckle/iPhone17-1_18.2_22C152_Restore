@interface NSDate(HFAnalytics)
- (uint64_t)hf_analyticsTimestamp;
@end

@implementation NSDate(HFAnalytics)

- (uint64_t)hf_analyticsTimestamp
{
  [a1 timeIntervalSince1970];
  v2 = NSNumber;
  return [v2 numberWithUnsignedInteger:(unint64_t)(v1 * 1000.0)];
}

@end