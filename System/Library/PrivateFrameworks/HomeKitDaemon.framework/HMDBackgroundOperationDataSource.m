@interface HMDBackgroundOperationDataSource
- (double)timeIntervalSinceNowToDate:(id)a3;
- (id)currentDate;
- (id)dateWithTimeIntervalSinceNow:(double)a3;
@end

@implementation HMDBackgroundOperationDataSource

- (double)timeIntervalSinceNowToDate:(id)a3
{
  [a3 timeIntervalSinceNow];
  return result;
}

- (id)dateWithTimeIntervalSinceNow:(double)a3
{
  return (id)[MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:a3];
}

- (id)currentDate
{
  return (id)[MEMORY[0x263EFF910] now];
}

@end