@interface HMFTimerManagerDefaultDataSource
- (double)currentTime;
- (id)timerWithTimeInterval:(double)a3 options:(unint64_t)a4;
@end

@implementation HMFTimerManagerDefaultDataSource

- (double)currentTime
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return result;
}

- (id)timerWithTimeInterval:(double)a3 options:(unint64_t)a4
{
  v4 = [[HMFTimer alloc] initWithTimeInterval:a4 options:a3];
  return v4;
}

@end