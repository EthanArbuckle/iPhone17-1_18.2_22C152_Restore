@interface HMDDeviceNotificationHandlerDefaultDataSource
- (HMDDeviceNotificationHandlerDefaultDataSource)initWithHome:(id)a3;
- (HMDHome)home;
- (id)timerWithType:(unsigned __int8)a3;
- (void)setHome:(id)a3;
@end

@implementation HMDDeviceNotificationHandlerDefaultDataSource

- (void).cxx_destruct
{
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (id)timerWithType:(unsigned __int8)a3
{
  int v3 = a3;
  v4 = [(HMDDeviceNotificationHandlerDefaultDataSource *)self home];
  int v5 = [v4 isCurrentDeviceAvailableResident];
  if (v3 == 1)
  {
    if (v5) {
      uint64_t v6 = pendingResponseTickPeriod;
    }
    else {
      uint64_t v6 = delayNotificationsPeriod;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if (!v3) {
      uint64_t v6 = coalesceNotificationsPeriod;
    }
  }
  v7 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:1 options:*(double *)&v6];

  return v7;
}

- (HMDDeviceNotificationHandlerDefaultDataSource)initWithHome:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDDeviceNotificationHandlerDefaultDataSource;
  int v5 = [(HMDDeviceNotificationHandlerDefaultDataSource *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_home, v4);
  }

  return v6;
}

@end