@interface HMIThermalPressureMonitor
+ (id)sharedInstance;
+ (id)shortDescription;
- (HMIThermalPressureMonitor)init;
- (int64_t)thermalPressureLevel;
- (void)_updateThermalPressureLevel;
- (void)dealloc;
@end

@implementation HMIThermalPressureMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_165 != -1) {
    dispatch_once(&sharedInstance_onceToken_165, &__block_literal_global_167);
  }
  v2 = (void *)sharedInstance_sharedInstance_164;
  return v2;
}

uint64_t __43__HMIThermalPressureMonitor_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_164 = objc_alloc_init(HMIThermalPressureMonitor);
  return MEMORY[0x270F9A758]();
}

- (HMIThermalPressureMonitor)init
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)HMIThermalPressureMonitor;
  v2 = [(HMIThermalPressureMonitor *)&v17 init];
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
      _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Registering for Thermal Pressure Notifications", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v10);
    v13 = v3->_notificationQueue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __33__HMIThermalPressureMonitor_init__block_invoke;
    handler[3] = &unk_26477BB78;
    objc_copyWeak(&v16, (id *)buf);
    notify_register_dispatch((const char *)*MEMORY[0x263EF8920], v10 + 4, v13, handler);
    [v10 _updateThermalPressureLevel];
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  return v3;
}

void __33__HMIThermalPressureMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateThermalPressureLevel];
}

- (void)_updateThermalPressureLevel
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int out_token = 0;
  uint64_t v11 = 0;
  notify_register_check((const char *)*MEMORY[0x263EF8920], &out_token);
  notify_get_state(out_token, &v11);
  notify_cancel(out_token);
  self->_unint64_t thermalPressureLevel = _mapOSThermalLevelToHMIThermalLevel(v11);
  v3 = (void *)MEMORY[0x22A641C70]();
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    dispatch_queue_t v7 = (void *)v6;
    unint64_t thermalPressureLevel = self->_thermalPressureLevel;
    if (thermalPressureLevel > 6) {
      v9 = @"HMIThermalPressureLevelNominal";
    }
    else {
      v9 = off_26477BBB8[thermalPressureLevel];
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl(&dword_225DC6000, v5, OS_LOG_TYPE_INFO, "%{public}@Thermal Pressure Level is now: %@", buf, 0x16u);
  }
  v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 postNotificationName:@"HMIThermalPressureLevelDidChangeNotification" object:v4];
}

- (void)dealloc
{
  notify_cancel(self->_osThermalPressureLevelNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)HMIThermalPressureMonitor;
  [(HMIThermalPressureMonitor *)&v3 dealloc];
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)thermalPressureLevel
{
  return self->_thermalPressureLevel;
}

- (void).cxx_destruct
{
}

@end