@interface HMDAccessoryFirmwareUpdateSessionWingman
- (id)newSchedulerWithAccessory:(id)a3 firmwareUpdateSession:(id)a4 workQueue:(id)a5;
- (unint64_t)initialSessionState;
@end

@implementation HMDAccessoryFirmwareUpdateSessionWingman

- (unint64_t)initialSessionState
{
  return 1;
}

- (id)newSchedulerWithAccessory:(id)a3 firmwareUpdateSession:(id)a4 workQueue:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[HMDAccessoryFirmwareUpdateScheduler alloc] initWithAccessory:v9 firmwareUpdateSession:v8 workQueue:v7];

  return v10;
}

@end