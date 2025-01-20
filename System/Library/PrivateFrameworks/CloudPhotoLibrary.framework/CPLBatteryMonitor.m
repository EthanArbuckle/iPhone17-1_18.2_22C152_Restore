@interface CPLBatteryMonitor
+ (CPLBatteryMonitorDelegate)delegate;
+ (NSDictionary)powerStatusPlist;
+ (NSString)powerStatus;
+ (double)batteryLevel;
+ (void)_updateBatteryWithBatteryEntry:(unsigned int)a3;
+ (void)setDelegate:(id)a3;
+ (void)startMonitoringPowerEvents;
@end

@implementation CPLBatteryMonitor

+ (NSDictionary)powerStatusPlist
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__17849;
  v9 = __Block_byref_object_dispose__17850;
  id v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CPLBatteryMonitor_powerStatusPlist__block_invoke;
  block[3] = &unk_1E60A69C0;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)batteryQueue, block);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDictionary *)v2;
}

void __37__CPLBatteryMonitor_powerStatusPlist__block_invoke(uint64_t a1)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if (isExternalPowerConnected)
  {
    v14[0] = @"plugged";
    v13[0] = @"state";
    v13[1] = @"batteryLevel";
    id v2 = [NSNumber numberWithInt:(int)*(double *)&batteryLevel];
    v14[1] = v2;
    v3 = (void *)MEMORY[0x1E4F1C9E8];
    v4 = v14;
    uint64_t v5 = v13;
    uint64_t v6 = 2;
  }
  else
  {
    v11[0] = @"state";
    v11[1] = @"lowBattery";
    uint64_t v7 = &unk_1F0D91478;
    if (hasEnoughBattery) {
      uint64_t v7 = &unk_1F0D91460;
    }
    v12[0] = @"battery";
    v12[1] = v7;
    v11[2] = @"batteryLevel";
    id v2 = [NSNumber numberWithInt:(int)*(double *)&batteryLevel];
    v12[2] = v2;
    v3 = (void *)MEMORY[0x1E4F1C9E8];
    v4 = v12;
    uint64_t v5 = v11;
    uint64_t v6 = 3;
  }
  uint64_t v8 = [v3 dictionaryWithObjects:v4 forKeys:v5 count:v6];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

+ (double)batteryLevel
{
  uint64_t v5 = 0;
  uint64_t v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__CPLBatteryMonitor_batteryLevel__block_invoke;
  block[3] = &unk_1E60A69C0;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)batteryQueue, block);
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

double __33__CPLBatteryMonitor_batteryLevel__block_invoke(uint64_t a1)
{
  double result = *(double *)&batteryLevel;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = batteryLevel;
  return result;
}

+ (NSString)powerStatus
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__17849;
  uint64_t v9 = __Block_byref_object_dispose__17850;
  id v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__CPLBatteryMonitor_powerStatus__block_invoke;
  block[3] = &unk_1E60A69C0;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)batteryQueue, block);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

uint64_t __32__CPLBatteryMonitor_powerStatus__block_invoke(uint64_t a1)
{
  id v2 = @"high battery level";
  if (!hasEnoughBattery) {
    id v2 = @"low battery level";
  }
  if (isExternalPowerConnected) {
    v3 = @"connected to power";
  }
  else {
    v3 = v2;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v3);
  uint64_t v4 = [NSString stringWithFormat:@"%@ (battery level: %.0f%%)", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), batteryLevel];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void *)(v5 + 40);
  *(void *)(v5 + 40) = v4;
  return MEMORY[0x1F41817F8](v4, v6);
}

+ (void)startMonitoringPowerEvents
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CPLBatteryMonitor_startMonitoringPowerEvents__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (startMonitoringPowerEvents_onceToken != -1) {
    dispatch_once(&startMonitoringPowerEvents_onceToken, block);
  }
}

void __47__CPLBatteryMonitor_startMonitoringPowerEvents__block_invoke(uint64_t a1)
{
  kern_return_t v7;
  kern_return_t v8;
  NSObject *v9;
  void *v10;
  _DWORD v11[2];
  uint64_t v12;
  uint64_t vars8;

  v12 = *MEMORY[0x1E4F143B8];
  id v2 = CPLCopyDefaultSerialQueueAttributes();
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.cpl.powermonitor", v2);
  uint64_t v4 = (void *)batteryQueue;
  batteryQueue = (uint64_t)v3;

  LODWORD(v2) = *MEMORY[0x1E4F2EEF0];
  batteryIONotifyPort = (uint64_t)IONotificationPortCreate(*MEMORY[0x1E4F2EEF0]);
  IONotificationPortSetDispatchQueue((IONotificationPortRef)batteryIONotifyPort, (dispatch_queue_t)batteryQueue);
  CFDictionaryRef v5 = IOServiceMatching("IOPMPowerSource");
  uint64_t MatchingService = IOServiceGetMatchingService((mach_port_t)v2, v5);
  uint64_t v7 = IOServiceAddInterestNotification((IONotificationPortRef)batteryIONotifyPort, MatchingService, "IOGeneralInterest", (IOServiceInterestCallback)BatteryStateChanged, *(void **)(a1 + 32), batteryNotificationRef);
  if (v7)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v8 = v7;
      uint64_t v9 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11[0] = 67109120;
        v11[1] = v8;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Can't monitor power: %i", (uint8_t *)v11, 8u);
      }
    }
  }
  else
  {
    id v10 = *(void **)(a1 + 32);
    [v10 _updateBatteryWithBatteryEntry:MatchingService];
  }
}

+ (void)_updateBatteryWithBatteryEntry:(unsigned int)a3
{
  int v4 = (isExternalPowerConnected | hasEnoughBattery) != 0;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  id CFProperty = (id)IORegistryEntryCreateCFProperty(a3, @"MaxCapacity", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  uint64_t v6 = (void *)IORegistryEntryCreateCFProperty(a3, @"CurrentCapacity", v5, 0);
  uint64_t v7 = (void *)IORegistryEntryCreateCFProperty(a3, @"ExternalConnected", v5, 0);
  if (CFProperty) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    BOOL v13 = 0;
    double v12 = 0.0;
  }
  else
  {
    [v6 doubleValue];
    double v10 = v9;
    [CFProperty doubleValue];
    double v12 = v10 / v11 * 100.0;
    BOOL v13 = v12 >= 80.0;
  }
  batteryLevel = *(void *)&v12;
  hasEnoughBattery = v13;
  int v14 = [v7 BOOLValue];
  isExternalPowerConnected = v14;
  if (hasEnoughBattery) {
    int v15 = 1;
  }
  else {
    int v15 = v14;
  }
  if (v4 != v15) {
    +[CPLPowerAssertion setHasEnoughPower:](CPLPowerAssertion, "setHasEnoughPower:");
  }
  v16 = +[CPLBatteryMonitor delegate];
  [v16 batteryLevelDidChangeWithLevel:*(double *)&batteryLevel];
}

+ (CPLBatteryMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained(&_delegate);
  return (CPLBatteryMonitorDelegate *)WeakRetained;
}

+ (void)setDelegate:(id)a3
{
}

@end