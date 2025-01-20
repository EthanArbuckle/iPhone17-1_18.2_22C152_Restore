@interface HMDAccessoryFirmwareUpdateSchedulerWingman
- (NSNotificationCenter)notificationCenter;
- (id)newBackgroundSchedulerWithIdentifier:(id)a3;
- (id)newInitialDelayTimerWithDelay:(double)a3 options:(unint64_t)a4;
- (id)policyForAccessory:(id)a3 sessionState:(unint64_t)a4 workQueue:(id)a5;
@end

@implementation HMDAccessoryFirmwareUpdateSchedulerWingman

- (id)newInitialDelayTimerWithDelay:(double)a3 options:(unint64_t)a4
{
  id v6 = objc_alloc(MEMORY[0x263F42658]);
  return (id)[v6 initWithTimeInterval:a4 options:a3];
}

- (id)policyForAccessory:(id)a3 sessionState:(unint64_t)a4 workQueue:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (a4 == 1)
  {
    uint64_t v10 = 0;
  }
  else
  {
    v9 = 0;
    if (a4 != 2) {
      goto LABEL_6;
    }
    uint64_t v10 = 1;
  }
  v9 = HMDFirmwareUpdatePolicyForAccessory(v7, v10, v8);
LABEL_6:

  return v9;
}

- (id)newBackgroundSchedulerWithIdentifier:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F086C0];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithIdentifier:v4];

  return v5;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)[MEMORY[0x263F08A00] defaultCenter];
}

@end