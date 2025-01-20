@interface AMSTimeoutDefaultClockSource
- (double)currentTimestampWithOffset:(double)a3;
@end

@implementation AMSTimeoutDefaultClockSource

- (double)currentTimestampWithOffset:(double)a3
{
  return (double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 1000000000.0 + a3;
}

@end