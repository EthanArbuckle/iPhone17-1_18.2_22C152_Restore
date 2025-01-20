@interface HMIThermalMonitor
+ (id)sharedInstance;
- (BOOL)readMaxValue:(double *)a3;
- (BOOL)readValueFromSensor:(int)a3 value:(double *)a4;
- (HMIThermalMonitor)init;
- (NSMutableDictionary)services;
- (unint64_t)thermalLevel;
- (void)_updateThermalLevel;
- (void)dealloc;
@end

@implementation HMIThermalMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __35__HMIThermalMonitor_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(HMIThermalMonitor);
  return MEMORY[0x270F9A758]();
}

- (HMIThermalMonitor)init
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)HMIThermalMonitor;
  v2 = [(HMIThermalMonitor *)&v19 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_client = 0;
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    services = v3->_services;
    v3->_services = (NSMutableDictionary *)v4;

    v3->_thermalLevel = 0;
    HMIDispatchQueueNameString(v3, 0);
    id v6 = objc_claimAutoreleasedReturnValue();
    v7 = (const char *)[v6 UTF8String];
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create(v7, v8);
    notificationQueue = v3->_notificationQueue;
    v3->_notificationQueue = (OS_dispatch_queue *)v9;

    v11 = (void *)MEMORY[0x22A641C70]();
    v12 = v3;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v21 = v14;
      _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Registering for Thermal Level Notifications", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v12);
    v15 = v3->_notificationQueue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __25__HMIThermalMonitor_init__block_invoke;
    handler[3] = &unk_26477BB78;
    objc_copyWeak(&v18, (id *)buf);
    notify_register_dispatch((const char *)*MEMORY[0x263EF8918], v12 + 4, v15, handler);
    [v12 _updateThermalLevel];
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  return v3;
}

void __25__HMIThermalMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateThermalLevel];
}

- (BOOL)readValueFromSensor:(int)a3 value:(double *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v8 = [(HMIThermalMonitor *)self services];
  dispatch_queue_t v9 = [NSNumber numberWithInt:v5];
  client = [v8 objectForKey:v9];

  if (!client)
  {
    client = self->_client;
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (!client)
    {
      client = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
      self->_client = client;
      if (!client) {
        goto LABEL_23;
      }
    }
    int valuePtr = 65280;
    int v22 = v5;
    int v20 = 5;
    *(_OWORD *)keys = xmmword_26477BBA0;
    v27 = @"LocationID";
    values = CFNumberCreate(v11, kCFNumberSInt32Type, &valuePtr);
    CFTypeRef cf = CFNumberCreate(v11, kCFNumberSInt32Type, &v20);
    CFTypeRef v25 = CFNumberCreate(v11, kCFNumberSInt32Type, &v22);
    CFDictionaryRef v12 = CFDictionaryCreate(v11, (const void **)keys, (const void **)&values, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (!v12)
    {
      BOOL v18 = 0;
      client = 0;
      goto LABEL_22;
    }
    if (values) {
      CFRelease(values);
    }
    if (cf) {
      CFRelease(cf);
    }
    if (v25) {
      CFRelease(v25);
    }
    IOHIDEventSystemClientSetMatching();
    CFArrayRef v13 = IOHIDEventSystemClientCopyServices(client);
    CFArrayRef v14 = v13;
    if (v13)
    {
      client = CFArrayGetCount(v13) < 1 ? 0 : (__IOHIDEventSystemClient *)CFArrayGetValueAtIndex(v14, 0);
      CFRelease(v14);
    }
    else
    {
      client = 0;
    }
    CFRelease(v12);
    if (!client)
    {
LABEL_23:
      BOOL v18 = 0;
      goto LABEL_22;
    }
    client = [[HMIThermalMonitorService alloc] initWithService:client];
    v15 = [(HMIThermalMonitor *)self services];
    v16 = [NSNumber numberWithInt:v5];
    [v15 setObject:client forKey:v16];
  }
  if (a4)
  {
    [(__IOHIDEventSystemClient *)client readValue];
    *(void *)a4 = v17;
  }
  BOOL v18 = 1;
LABEL_22:

  os_unfair_lock_unlock(p_lock);
  return v18;
}

- (BOOL)readMaxValue:(double *)a3
{
  uint64_t v5 = 0;
  double v6 = 0.0;
  do
  {
    double v8 = 0.0;
    [(HMIThermalMonitor *)self readValueFromSensor:dword_225F2DD08[v5] value:&v8];
    if (v6 < v8) {
      double v6 = v8;
    }
    ++v5;
  }
  while (v5 != 8);
  if (a3) {
    *a3 = v6;
  }
  return 1;
}

- (void)_updateThermalLevel
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int out_token = 0;
  uint64_t v9 = 0;
  notify_register_check((const char *)*MEMORY[0x263EF8918], &out_token);
  notify_get_state(out_token, &v9);
  uint64_t v3 = notify_cancel(out_token);
  self->_unint64_t thermalLevel = v9;
  uint64_t v4 = (void *)MEMORY[0x22A641C70](v3);
  uint64_t v5 = self;
  double v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    unint64_t thermalLevel = self->_thermalLevel;
    *(_DWORD *)buf = 138543618;
    CFDictionaryRef v12 = v7;
    __int16 v13 = 2048;
    unint64_t v14 = thermalLevel;
    _os_log_impl(&dword_225DC6000, v6, OS_LOG_TYPE_INFO, "%{public}@Thermal Level is now: %lu", buf, 0x16u);
  }
}

- (void)dealloc
{
  notify_cancel(self->_thermalLevelNotificationToken);
  client = self->_client;
  if (client) {
    CFRelease(client);
  }
  v4.receiver = self;
  v4.super_class = (Class)HMIThermalMonitor;
  [(HMIThermalMonitor *)&v4 dealloc];
}

- (unint64_t)thermalLevel
{
  return self->_thermalLevel;
}

- (NSMutableDictionary)services
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

@end