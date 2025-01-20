@interface HMIPeakPowerPressureMonitor
+ (id)sharedInstance;
+ (id)shortDescription;
- (HMIPeakPowerPressureMonitor)init;
- (int64_t)peakPowerPressureLevel;
- (void)_updatePeakPowerPressureLevel;
- (void)dealloc;
@end

@implementation HMIPeakPowerPressureMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_202 != -1) {
    dispatch_once(&sharedInstance_onceToken_202, &__block_literal_global_204);
  }
  v2 = (void *)sharedInstance_sharedInstance_201;
  return v2;
}

uint64_t __45__HMIPeakPowerPressureMonitor_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_201 = objc_alloc_init(HMIPeakPowerPressureMonitor);
  return MEMORY[0x270F9A758]();
}

- (HMIPeakPowerPressureMonitor)init
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)HMIPeakPowerPressureMonitor;
  v2 = [(HMIPeakPowerPressureMonitor *)&v17 init];
  v3 = v2;
  if (v2)
  {
    HMIDispatchQueueNameString(v2, 0);
    id v4 = objc_claimAutoreleasedReturnValue();
    v5 = (const char *)[v4 UTF8String];
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
    notificationQueue = v3->_notificationQueue;
    v3->_notificationQueue = (OS_dispatch_queue *)v7;

    v9 = (void *)MEMORY[0x22A641C70]();
    v10 = v3;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v19 = v12;
      _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Registering for Peak Power Pressure Notifications", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v10);
    v13 = v3->_notificationQueue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __35__HMIPeakPowerPressureMonitor_init__block_invoke;
    handler[3] = &unk_26477BB78;
    objc_copyWeak(&v16, (id *)buf);
    notify_register_dispatch("com.apple.system.peakpowerpressurelevel", v10 + 4, v13, handler);
    [v10 _updatePeakPowerPressureLevel];
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  return v3;
}

void __35__HMIPeakPowerPressureMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updatePeakPowerPressureLevel];
}

- (void)_updatePeakPowerPressureLevel
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int out_token = 0;
  int64_t v10 = 0;
  notify_register_check("com.apple.system.peakpowerpressurelevel", &out_token);
  notify_get_state(out_token, (uint64_t *)&v10);
  uint64_t v3 = notify_cancel(out_token);
  int64_t v4 = v10;
  if (v10 <= 19)
  {
    if (!v10) {
      goto LABEL_12;
    }
    if (v10 == 10)
    {
      int64_t v4 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    switch(v10)
    {
      case 20:
        int64_t v4 = 2;
        goto LABEL_12;
      case 30:
        int64_t v4 = 3;
        goto LABEL_12;
      case 40:
        int64_t v4 = 4;
        goto LABEL_12;
    }
  }
  int64_t v4 = -1;
LABEL_12:
  self->_int64_t peakPowerPressureLevel = v4;
  v5 = (void *)MEMORY[0x22A641C70](v3);
  v6 = self;
  dispatch_queue_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int64_t peakPowerPressureLevel = self->_peakPowerPressureLevel;
    *(_DWORD *)buf = 138543618;
    v13 = v8;
    __int16 v14 = 2048;
    int64_t v15 = peakPowerPressureLevel;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_INFO, "%{public}@Peak Power Pressure Level is now: %ld", buf, 0x16u);
  }
}

- (void)dealloc
{
  notify_cancel(self->_osPeakPowerPressureLevelNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)HMIPeakPowerPressureMonitor;
  [(HMIPeakPowerPressureMonitor *)&v3 dealloc];
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)peakPowerPressureLevel
{
  return self->_peakPowerPressureLevel;
}

- (void).cxx_destruct
{
}

@end