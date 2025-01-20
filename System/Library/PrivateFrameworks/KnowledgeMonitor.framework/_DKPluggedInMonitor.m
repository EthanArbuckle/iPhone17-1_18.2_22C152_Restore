@interface _DKPluggedInMonitor
+ (BOOL)shouldMergeUnchangedEvents;
+ (id)_BMEventWithState:(BOOL)a3 adapterType:(int64_t)a4 isWireless:(BOOL)a5;
+ (id)_eventWithState:(BOOL)a3 adapterType:(int64_t)a4 isWireless:(BOOL)a5;
+ (id)entitlements;
+ (id)eventStream;
+ (void)setIsPluggedIn:(BOOL)a3;
- (BOOL)enabled;
- (int)pluggedInToken;
- (void)deactivate;
- (void)dealloc;
- (void)setCurrentState;
- (void)setEnabled:(BOOL)a3;
- (void)setPluggedInToken:(int)a3;
- (void)start;
- (void)stop;
- (void)synchronouslyReflectCurrentValue;
@end

@implementation _DKPluggedInMonitor

- (void)dealloc
{
  [(_DKPluggedInMonitor *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKPluggedInMonitor;
  [(_DKMonitor *)&v3 dealloc];
}

+ (id)eventStream
{
  return @"ChargerPluggedInState";
}

+ (id)entitlements
{
  return 0;
}

+ (BOOL)shouldMergeUnchangedEvents
{
  return 1;
}

+ (void)setIsPluggedIn:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  v4 = _DKPluggedInMonitorLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [NSNumber numberWithBool:v3];
    int v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_225002000, v4, OS_LOG_TYPE_INFO, "Updating context store with plug in state: %@", (uint8_t *)&v9, 0xCu);
  }
  v6 = [NSNumber numberWithBool:v3];
  v7 = [MEMORY[0x263F351B8] userContext];
  v8 = [MEMORY[0x263F351D0] keyPathForPluginStatus];
  [v7 setObject:v6 forKeyedSubscript:v8];
}

+ (id)_eventWithState:(BOOL)a3 adapterType:(int64_t)a4 isWireless:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = a3;
  v21[2] = *MEMORY[0x263EF8340];
  if (a3) {
    [MEMORY[0x263F35050] yes];
  }
  else {
  v8 = [MEMORY[0x263F35050] no];
  }
  +[_DKPluggedInMonitor setIsPluggedIn:v7];
  if (a4)
  {
    int v9 = [MEMORY[0x263F35078] adapterType];
    v20[0] = v9;
    v10 = [NSNumber numberWithInteger:a4];
    v21[0] = v10;
    uint64_t v11 = [MEMORY[0x263F35078] adapterIsWireless];
    v20[1] = v11;
    v12 = [NSNumber numberWithBool:v5];
    v21[1] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  }
  else
  {
    v13 = 0;
  }
  v14 = (void *)MEMORY[0x263F35088];
  v15 = [MEMORY[0x263F35148] deviceIsPluggedInStream];
  v16 = [MEMORY[0x263EFF910] date];
  v17 = [MEMORY[0x263EFF910] distantFuture];
  v18 = [v14 eventWithStream:v15 startDate:v16 endDate:v17 value:v8 metadata:v13];

  return v18;
}

+ (id)_BMEventWithState:(BOOL)a3 adapterType:(int64_t)a4 isWireless:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = a3;
  id v8 = objc_alloc(MEMORY[0x263F2A0A8]);
  int v9 = [NSNumber numberWithBool:v7];
  v10 = [NSNumber numberWithBool:v5];
  uint64_t v11 = [NSNumber numberWithInteger:a4];
  v12 = (void *)[v8 initWithStarting:v9 wireless:v10 adapterType:v11];

  return v12;
}

- (void)setCurrentState
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v3 = (uint64_t)IOPSCopyPowerSourcesInfo();
  if (v3)
  {
    CFBooleanRef v4 = (const __CFBoolean *)IOPSPowerSourceSupported();
    int Value = CFBooleanGetValue(v4);
    CFRelease((CFTypeRef)v3);
    if (Value)
    {
      CFDictionaryRef v6 = IOPSCopyExternalPowerAdapterDetails();
      if (v6)
      {
        uint64_t v3 = IOPSDrawingUnlimitedPower();
        BOOL v7 = [(__CFDictionary *)v6 objectForKeyedSubscript:@"FamilyCode"];
        uint64_t v8 = [v7 integerValue];

        int v9 = [(__CFDictionary *)v6 objectForKeyedSubscript:@"IsWireless"];
        uint64_t v10 = [v9 BOOLValue];
      }
      else
      {
        uint64_t v10 = 0;
        uint64_t v8 = 0;
        uint64_t v3 = 0;
      }
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v8 = 0;
      uint64_t v3 = 1;
    }
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v11 = _DKPluggedInMonitorLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = [NSNumber numberWithBool:v3];
    v13 = [NSNumber numberWithInteger:v8];
    v14 = [NSNumber numberWithBool:v10];
    int v19 = 138412802;
    v20 = v12;
    __int16 v21 = 2112;
    v22 = v13;
    __int16 v23 = 2112;
    v24 = v14;
    _os_log_impl(&dword_225002000, v11, OS_LOG_TYPE_INFO, "Setting current state plugin:%@, adapterType:%@, wireless:%@, ", (uint8_t *)&v19, 0x20u);
  }
  v15 = [(_DKMonitor *)self currentEvent];
  v16 = +[_DKPluggedInMonitor _eventWithState:v3 adapterType:v8 isWireless:v10];
  if ([(_DKMonitor *)self historicalStateHasChanged:v16])
  {
    v17 = [(id)objc_opt_class() _BMEventWithState:v3 adapterType:v8 isWireless:v10];
    [(BMSource *)self->_source sendEvent:v17];
  }
  [(_DKMonitor *)self setCurrentEvent:v16 inferHistoricalState:1];
  v18 = _DKPluggedInMonitorLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    v20 = v16;
    __int16 v21 = 2112;
    v22 = v15;
    _os_log_impl(&dword_225002000, v18, OS_LOG_TYPE_DEFAULT, "Setting current event: %@, previousEvent: %@", (uint8_t *)&v19, 0x16u);
  }
}

- (void)start
{
  v12.receiver = self;
  v12.super_class = (Class)_DKPluggedInMonitor;
  if ([(_DKMonitor *)&v12 instantMonitorNeedsActivation])
  {
    uint64_t v3 = BiomeLibrary();
    CFBooleanRef v4 = [v3 Device];
    BOOL v5 = [v4 Power];
    CFDictionaryRef v6 = [v5 PluggedIn];
    BOOL v7 = [v6 source];
    source = self->_source;
    self->_source = v7;

    self->_enabled = 1;
    int v9 = (const char *)[@"com.apple.system.powermanagement.poweradapter" UTF8String];
    uint64_t v10 = [(_DKMonitor *)self queue];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __28___DKPluggedInMonitor_start__block_invoke;
    handler[3] = &unk_264714B68;
    handler[4] = self;
    notify_register_dispatch(v9, &self->_pluggedInToken, v10, handler);

    [(_DKPluggedInMonitor *)self setCurrentState];
  }
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)_DKPluggedInMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation]) {
    [(_DKPluggedInMonitor *)self deactivate];
  }
}

- (void)deactivate
{
  self->_enabled = 0;
  int pluggedInToken = self->_pluggedInToken;
  if (pluggedInToken)
  {
    notify_cancel(pluggedInToken);
    self->_int pluggedInToken = 0;
  }
}

- (void)synchronouslyReflectCurrentValue
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = [(_DKMonitor *)self currentEvent];

  if (!v2)
  {
    uint64_t v3 = (uint64_t)IOPSCopyPowerSourcesInfo();
    if (v3)
    {
      CFBooleanRef v4 = (const __CFBoolean *)IOPSPowerSourceSupported();
      int Value = CFBooleanGetValue(v4);
      CFRelease((CFTypeRef)v3);
      if (Value) {
        uint64_t v3 = IOPSDrawingUnlimitedPower();
      }
      else {
        uint64_t v3 = 1;
      }
    }
    CFDictionaryRef v6 = _DKPluggedInMonitorLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = [NSNumber numberWithBool:v3];
      int v8 = 138412290;
      int v9 = v7;
      _os_log_impl(&dword_225002000, v6, OS_LOG_TYPE_DEFAULT, "Synchronously reflecting current plug in status: %@", (uint8_t *)&v8, 0xCu);
    }
    +[_DKPluggedInMonitor setIsPluggedIn:v3];
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

- (int)pluggedInToken
{
  return self->_pluggedInToken;
}

- (void)setPluggedInToken:(int)a3
{
  self->_int pluggedInToken = a3;
}

- (void).cxx_destruct
{
}

@end