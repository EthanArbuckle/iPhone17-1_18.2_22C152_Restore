@interface HMDTimer
- (HMDTimer)timerWithTimeInterval:(double)a3 options:(unint64_t)a4;
- (id)backoffTimerWithMinimumTimeInterval:(double)a3 maximumTimeInterval:(double)a4 exponentialFactor:(int64_t)a5 options:(unint64_t)a6;
@end

@implementation HMDTimer

- (id)backoffTimerWithMinimumTimeInterval:(double)a3 maximumTimeInterval:(double)a4 exponentialFactor:(int64_t)a5 options:(unint64_t)a6
{
  v6 = (void *)[objc_alloc(MEMORY[0x263F42528]) initWithMinimumTimeInterval:a5 maximumTimeInterval:a6 exponentialFactor:a3 options:a4];
  return v6;
}

- (HMDTimer)timerWithTimeInterval:(double)a3 options:(unint64_t)a4
{
  v4 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:a4 options:a3];
  return (HMDTimer *)v4;
}

@end