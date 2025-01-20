@interface _DKDeviceActivityLevelMonitor
+ (BOOL)shouldMergeUnchangedEvents;
+ (id)_eventWithState:(unint64_t)a3;
+ (id)entitlements;
+ (id)eventStream;
+ (void)initialize;
- (BOOL)enabled;
- (BOOL)initialized;
- (BOOL)limitsImposed;
- (BOOL)limitsInitialized;
- (NSDate)lastSetActiveDate;
- (OS_dispatch_source)debounceTimer;
- (_CDContextualKeyPath)inUseStatus;
- (_CDContextualKeyPath)keyPathForDeviceToppingOff;
- (_CDContextualKeyPath)keyPathForReducedPerfStateStatus;
- (_CDContextualKeyPath)lastUseDate;
- (_CDLocalContext)context;
- (int)siriToken;
- (unint64_t)currentInUseStatus;
- (unint64_t)lastInUseStatus;
- (unint64_t)userActivityNotificationHandle;
- (void)deactivate;
- (void)dealloc;
- (void)handleUserActivity:(int)a3;
- (void)setContext:(id)a3;
- (void)setCurrentInUseStatus:(unint64_t)a3;
- (void)setDebounceTimer:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setInUseStatus:(id)a3;
- (void)setInitialized:(BOOL)a3;
- (void)setKeyPathForDeviceToppingOff:(id)a3;
- (void)setKeyPathForReducedPerfStateStatus:(id)a3;
- (void)setLastActivityDate:(id)a3;
- (void)setLastInUseStatus:(unint64_t)a3;
- (void)setLastSetActiveDate:(id)a3;
- (void)setLastUseDate:(id)a3;
- (void)setLimitsImposed:(BOOL)a3;
- (void)setLimitsInitialized:(BOOL)a3;
- (void)setSiriToken:(int)a3;
- (void)setUserActivityNotificationHandle:(unint64_t)a3;
- (void)start;
- (void)stop;
- (void)updateActivityDateAndInUseState:(unint64_t)a3;
- (void)updateActivityInUseState:(unint64_t)a3;
- (void)updatePerformanceThrottleStatusWithLevel:(unint64_t)a3;
@end

@implementation _DKDeviceActivityLevelMonitor

- (void)updatePerformanceThrottleStatusWithLevel:(unint64_t)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  context = self->_context;
  v6 = [MEMORY[0x263F351D0] keyPathForBatteryStateDataDictionary];
  v7 = [(_CDLocalContext *)context objectForKeyedSubscript:v6];

  v8 = [MEMORY[0x263F351D0] batteryExternalConnectedKey];
  v9 = [v7 objectForKeyedSubscript:v8];
  int v10 = [v9 BOOLValue];

  if (!v10)
  {
LABEL_5:
    int v17 = 0;
    goto LABEL_7;
  }
  v11 = [MEMORY[0x263F351D0] batteryAdapterIsWirelessKey];
  v12 = [v7 objectForKeyedSubscript:v11];
  int v13 = [v12 BOOLValue];

  v14 = [(_CDLocalContext *)self->_context objectForKeyedSubscript:self->_keyPathForDeviceToppingOff];
  uint64_t v15 = [v14 unsignedIntegerValue];

  if ((unint64_t)(v15 - 5) <= 1)
  {
    v16 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30[0]) = 0;
      _os_log_impl(&dword_225002000, v16, OS_LOG_TYPE_INFO, "Device Topping Off. Reduce perf", (uint8_t *)v30, 2u);
    }
    goto LABEL_5;
  }
  int v17 = v13 ^ 1;
LABEL_7:
  v18 = self->_context;
  v19 = [MEMORY[0x263F351D0] keyPathForBacklightOnStatus];
  v20 = [(_CDLocalContext *)v18 objectForKeyedSubscript:v19];
  int v21 = [v20 BOOLValue];

  v22 = self->_context;
  v23 = [MEMORY[0x263F351D0] keyPathForCarplayConnectedStatus];
  v24 = [(_CDLocalContext *)v22 objectForKeyedSubscript:v23];
  int v25 = [v24 BOOLValue];

  if (a3) {
    int v26 = 1;
  }
  else {
    int v26 = v17;
  }
  uint64_t v27 = (v26 | v21 | v25) ^ 1u;
  v28 = _log;
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
  {
    v30[0] = 67110144;
    v30[1] = a3 != 0;
    __int16 v31 = 1024;
    int v32 = v17;
    __int16 v33 = 1024;
    int v34 = v21;
    __int16 v35 = 1024;
    int v36 = v25;
    __int16 v37 = 1024;
    int v38 = v27;
    _os_log_impl(&dword_225002000, v28, OS_LOG_TYPE_INFO, "Active: %u | Plugged In : %u | Screen On: %u | CarPlay Active: %u | LIMITS IMPOSED: %u", (uint8_t *)v30, 0x20u);
  }
  if (!self->_limitsInitialized || self->_limitsImposed != v27)
  {
    v29 = [NSNumber numberWithBool:v27];
    [(_CDLocalContext *)self->_context setObject:v29 forKeyedSubscript:self->_keyPathForReducedPerfStateStatus];

    self->_limitsImposed = v27;
    self->_limitsInitialized = 1;
  }
}

- (unint64_t)lastInUseStatus
{
  return self->_lastInUseStatus;
}

+ (void)initialize
{
  _log = (uint64_t)os_log_create("com.apple.duetknowledged", "deviceactivitymonitor");
  MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  [(_DKDeviceActivityLevelMonitor *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKDeviceActivityLevelMonitor;
  [(_DKMonitor *)&v3 dealloc];
}

+ (id)eventStream
{
  return @"DeviceActivityLevel";
}

+ (id)entitlements
{
  return 0;
}

+ (BOOL)shouldMergeUnchangedEvents
{
  return 1;
}

+ (id)_eventWithState:(unint64_t)a3
{
  objc_super v3 = [MEMORY[0x263F34FF8] withValue:a3];
  v4 = (void *)MEMORY[0x263F35088];
  v5 = [MEMORY[0x263F35148] deviceActivityLevelStream];
  v6 = [MEMORY[0x263EFF910] date];
  v7 = [MEMORY[0x263EFF910] distantFuture];
  v8 = [v4 eventWithStream:v5 startDate:v6 endDate:v7 value:v3];

  return v8;
}

- (void)setLastActivityDate:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [MEMORY[0x263EFF910] date];
  [v5 timeIntervalSinceDate:v6];
  if (v7 <= 0.0)
  {
    v9 = self->_lastSetActiveDate;
    int v10 = v9;
    if (!v9 || ([(NSDate *)v9 timeIntervalSinceDate:v6], v11 > 0.0))
    {
      uint64_t v12 = [MEMORY[0x263EFF910] distantPast];

      int v10 = (void *)v12;
    }
    [v10 timeIntervalSinceDate:v5];
    if (v13 <= 0.0)
    {
      uint64_t v15 = [(_CDLocalContext *)self->_context objectForKeyedSubscript:self->_lastUseDate];
      v16 = v15;
      if (!v15 || ([v15 timeIntervalSinceDate:v6], v17 > 0.0))
      {
        uint64_t v18 = [MEMORY[0x263EFF910] distantPast];

        v16 = (void *)v18;
      }
      [v16 timeIntervalSinceDate:v5];
      if (v19 >= 0.01)
      {
        v20 = _log;
        if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEBUG)) {
          [(_DKDeviceActivityLevelMonitor *)(uint64_t)v5 setLastActivityDate:v20];
        }
      }
      else
      {
        [(_CDLocalContext *)self->_context setObject:v5 forKeyedSubscript:self->_lastUseDate];
        objc_storeStrong((id *)&self->_lastSetActiveDate, a3);
      }
    }
    else
    {
      v14 = _log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412546;
        id v22 = v5;
        __int16 v23 = 2112;
        v24 = v10;
        _os_log_impl(&dword_225002000, v14, OS_LOG_TYPE_DEFAULT, "New last-set date (%@) is earlier than the previous set date (%@). Keeping newer date.", (uint8_t *)&v21, 0x16u);
      }
    }
  }
  else
  {
    v8 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v5;
      _os_log_impl(&dword_225002000, v8, OS_LOG_TYPE_DEFAULT, "New active date (%@) is in the future. Ignoring.", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (void)start
{
  v46[4] = *MEMORY[0x263EF8340];
  v45.receiver = self;
  v45.super_class = (Class)_DKDeviceActivityLevelMonitor;
  if ([(_DKMonitor *)&v45 instantMonitorNeedsActivation])
  {
    self->_enabled = 1;
    objc_super v3 = [MEMORY[0x263F351D0] keyPathForLastUseDate];
    lastUseDate = self->_lastUseDate;
    self->_lastUseDate = v3;

    id v5 = [MEMORY[0x263F351D0] keyPathForInUseStatus];
    inUseStatus = self->_inUseStatus;
    self->_inUseStatus = v5;

    double v7 = [MEMORY[0x263F351B8] userContext];
    context = self->_context;
    self->_context = v7;

    v9 = [(_CDLocalContext *)self->_context objectForKeyedSubscript:self->_lastUseDate];
    int v10 = v9;
    if (!v9)
    {
      int v10 = [MEMORY[0x263EFF910] distantPast];
    }
    objc_storeStrong((id *)&self->_lastSetActiveDate, v10);
    if (!v9) {

    }
    double v11 = [(_CDLocalContext *)self->_context objectForKeyedSubscript:self->_inUseStatus];
    unint64_t v12 = [v11 unsignedIntegerValue];
    if (v12 <= 1) {
      unint64_t v13 = 1;
    }
    else {
      unint64_t v13 = v12;
    }
    self->_lastInUseStatus = v13;

    self->_currentInUseStatus = self->_lastInUseStatus;
    v14 = [MEMORY[0x263F351F0] keyPathWithKey:@"/charging/topOffCheckpoint"];
    keyPathForDeviceToppingOff = self->_keyPathForDeviceToppingOff;
    self->_keyPathForDeviceToppingOff = v14;

    v16 = [MEMORY[0x263F351F0] keyPathWithKey:@"/system/powerLimitsImposed"];
    keyPathForReducedPerfStateStatus = self->_keyPathForReducedPerfStateStatus;
    self->_keyPathForReducedPerfStateStatus = v16;

    uint64_t v18 = (void *)MEMORY[0x263F351F8];
    double v19 = [MEMORY[0x263F351D0] keyPathForBacklightOnStatus];
    v46[0] = v19;
    v20 = [MEMORY[0x263F351D0] keyPathForBatteryStateDataDictionary];
    v46[1] = v20;
    int v21 = [MEMORY[0x263F351D0] keyPathForCarplayConnectedStatus];
    id v22 = self->_keyPathForDeviceToppingOff;
    v46[2] = v21;
    v46[3] = v22;
    __int16 v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:4];
    v24 = [v18 predicateForChangeAtKeyPaths:v23];

    uint64_t v25 = self->_context;
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __38___DKDeviceActivityLevelMonitor_start__block_invoke;
    v44[3] = &unk_264714FE0;
    v44[4] = self;
    int v26 = [MEMORY[0x263F351E8] localNonWakingRegistrationWithIdentifier:@"com.apple.dkc.reducedPerf" contextualPredicate:v24 callback:v44];
    [(_CDLocalContext *)v25 registerCallback:v26];

    block[6] = 0;
    uint64_t v43 = 0;
    if (!IOPMGetUserActivityLevel())
    {
      uint64_t v27 = [(_DKMonitor *)self queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __38___DKDeviceActivityLevelMonitor_start__block_invoke_3;
      block[3] = &unk_264714CE8;
      block[4] = self;
      block[5] = v43;
      dispatch_sync(v27, block);
    }
    v28 = [(_DKMonitor *)self queue];
    v29 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v28);
    debounceTimer = self->_debounceTimer;
    self->_debounceTimer = v29;

    dispatch_source_set_timer((dispatch_source_t)self->_debounceTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    __int16 v31 = self->_debounceTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __38___DKDeviceActivityLevelMonitor_start__block_invoke_4;
    handler[3] = &unk_264714788;
    handler[4] = self;
    dispatch_source_set_event_handler(v31, handler);
    dispatch_resume((dispatch_object_t)self->_debounceTimer);
    int v32 = (const char *)[@"com.apple.coreaudio.borealisTrigger" UTF8String];
    __int16 v33 = [(_DKMonitor *)self queue];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __38___DKDeviceActivityLevelMonitor_start__block_invoke_5;
    v40[3] = &unk_264714B68;
    v40[4] = self;
    notify_register_dispatch(v32, &self->_siriToken, v33, v40);

    int v34 = [(_DKMonitor *)self queue];
    self->_userActivityNotificationHandle = IOPMScheduleUserActivityLevelNotificationWithTimeout();

    __int16 v35 = BiomeLibrary();
    int v36 = [v35 Activity];
    __int16 v37 = [v36 Level];
    int v38 = [v37 source];
    bmSource = self->_bmSource;
    self->_bmSource = v38;
  }
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)_DKDeviceActivityLevelMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation]) {
    [(_DKDeviceActivityLevelMonitor *)self deactivate];
  }
}

- (void)deactivate
{
  if (self->_userActivityNotificationHandle)
  {
    IOPMUnregisterNotification();
    self->_userActivityNotificationHandle = 0;
  }
  int siriToken = self->_siriToken;
  if (siriToken)
  {
    notify_cancel(siriToken);
    self->_int siriToken = 0;
  }
  self->_enabled = 0;
  self->_initialized = 0;
}

- (void)handleUserActivity:(int)a3
{
  uint64_t state64 = 0;
  if (!notify_get_state(a3, &state64))
  {
    [(_DKDeviceActivityLevelMonitor *)self updateActivityInUseState:state64 == 0];
    v4 = [MEMORY[0x263EFF910] date];
    [(_DKDeviceActivityLevelMonitor *)self setLastActivityDate:v4];
  }
}

- (void)updateActivityInUseState:(unint64_t)a3
{
  if (self->_enabled && (!self->_initialized || self->_lastInUseStatus != a3))
  {
    id v5 = [NSNumber numberWithUnsignedLongLong:a3];
    [(_CDLocalContext *)self->_context setObject:v5 forKeyedSubscript:self->_inUseStatus];

    self->_lastInUseStatus = a3;
    self->_initialized = 1;
    v6 = +[_DKDeviceActivityLevelMonitor _eventWithState:a3];
    [(_DKMonitor *)self setCurrentEvent:v6 inferHistoricalState:1];

    id v7 = objc_alloc(MEMORY[0x263F29F80]);
    v8 = [NSNumber numberWithUnsignedLongLong:a3];
    id v9 = (id)[v7 initWithInUseStatus:v8];

    [(BMSource *)self->_bmSource sendEvent:v9];
  }
}

- (void)updateActivityDateAndInUseState:(unint64_t)a3
{
  char v3 = a3;
  -[_DKDeviceActivityLevelMonitor updateActivityInUseState:](self, "updateActivityInUseState:");
  [(_DKDeviceActivityLevelMonitor *)self updatePerformanceThrottleStatusWithLevel:self->_lastInUseStatus];
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  id v9 = (id)v5;
  if ((v3 & 0xC) != 0)
  {
    [(_DKDeviceActivityLevelMonitor *)self setLastActivityDate:v5];
  }
  else
  {
    double v6 = CACurrentMediaTime();
    BKSHIDServicesLastUserEventTime();
    v8 = [v9 dateByAddingTimeInterval:-(v6 - v7)];
    [(_DKDeviceActivityLevelMonitor *)self setLastActivityDate:v8];
  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (void)setLastInUseStatus:(unint64_t)a3
{
  self->_lastInUseStatus = a3;
}

- (unint64_t)currentInUseStatus
{
  return self->_currentInUseStatus;
}

- (void)setCurrentInUseStatus:(unint64_t)a3
{
  self->_currentInUseStatus = a3;
}

- (NSDate)lastSetActiveDate
{
  return self->_lastSetActiveDate;
}

- (void)setLastSetActiveDate:(id)a3
{
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (_CDContextualKeyPath)lastUseDate
{
  return self->_lastUseDate;
}

- (void)setLastUseDate:(id)a3
{
}

- (_CDContextualKeyPath)inUseStatus
{
  return self->_inUseStatus;
}

- (void)setInUseStatus:(id)a3
{
}

- (OS_dispatch_source)debounceTimer
{
  return self->_debounceTimer;
}

- (void)setDebounceTimer:(id)a3
{
}

- (unint64_t)userActivityNotificationHandle
{
  return self->_userActivityNotificationHandle;
}

- (void)setUserActivityNotificationHandle:(unint64_t)a3
{
  self->_userActivityNotificationHandle = a3;
}

- (int)siriToken
{
  return self->_siriToken;
}

- (void)setSiriToken:(int)a3
{
  self->_int siriToken = a3;
}

- (BOOL)limitsImposed
{
  return self->_limitsImposed;
}

- (void)setLimitsImposed:(BOOL)a3
{
  self->_limitsImposed = a3;
}

- (BOOL)limitsInitialized
{
  return self->_limitsInitialized;
}

- (void)setLimitsInitialized:(BOOL)a3
{
  self->_limitsInitialized = a3;
}

- (_CDContextualKeyPath)keyPathForReducedPerfStateStatus
{
  return self->_keyPathForReducedPerfStateStatus;
}

- (void)setKeyPathForReducedPerfStateStatus:(id)a3
{
}

- (_CDContextualKeyPath)keyPathForDeviceToppingOff
{
  return self->_keyPathForDeviceToppingOff;
}

- (void)setKeyPathForDeviceToppingOff:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPathForDeviceToppingOff, 0);
  objc_storeStrong((id *)&self->_keyPathForReducedPerfStateStatus, 0);
  objc_storeStrong((id *)&self->_debounceTimer, 0);
  objc_storeStrong((id *)&self->_inUseStatus, 0);
  objc_storeStrong((id *)&self->_lastUseDate, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_lastSetActiveDate, 0);
  objc_storeStrong((id *)&self->_bmSource, 0);
}

- (void)setLastActivityDate:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_225002000, log, OS_LOG_TYPE_DEBUG, "New active date (%@) is not sufficiently newer than the previous date (%@).", (uint8_t *)&v3, 0x16u);
}

@end