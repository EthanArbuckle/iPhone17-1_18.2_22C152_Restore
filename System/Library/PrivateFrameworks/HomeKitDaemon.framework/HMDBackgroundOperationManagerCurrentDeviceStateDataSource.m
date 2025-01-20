@interface HMDBackgroundOperationManagerCurrentDeviceStateDataSource
- (id)currentDate;
- (id)timerWithTimeInterval:(double)a3 options:(unint64_t)a4 label:(id)a5;
@end

@implementation HMDBackgroundOperationManagerCurrentDeviceStateDataSource

- (id)timerWithTimeInterval:(double)a3 options:(unint64_t)a4 label:(id)a5
{
  v5 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:a4 options:a3];
  return v5;
}

- (id)currentDate
{
  return (id)[MEMORY[0x263EFF910] now];
}

@end