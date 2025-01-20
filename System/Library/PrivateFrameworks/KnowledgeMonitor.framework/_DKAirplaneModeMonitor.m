@interface _DKAirplaneModeMonitor
+ (id)_BMEventWithState:(BOOL)a3;
+ (id)_eventWithState:(BOOL)a3;
+ (id)eventStream;
- (NSNumber)airplaneModeStatus;
- (__SCPreferences)radioPrefs;
- (void)deactivate;
- (void)dealloc;
- (void)setAirplaneModeStatus:(id)a3;
- (void)setRadioPrefs:(__SCPreferences *)a3;
- (void)start;
- (void)stop;
- (void)updateAirplaneModeStatus;
@end

@implementation _DKAirplaneModeMonitor

+ (id)_eventWithState:(BOOL)a3
{
  if (a3) {
    [MEMORY[0x263F35050] yes];
  }
  else {
  v3 = [MEMORY[0x263F35050] no];
  }
  v4 = (void *)MEMORY[0x263F35088];
  v5 = [MEMORY[0x263F35148] airplaneModeStream];
  v6 = [MEMORY[0x263EFF910] date];
  v7 = [MEMORY[0x263EFF910] distantFuture];
  v8 = [v4 eventWithStream:v5 startDate:v6 endDate:v7 value:v3];

  return v8;
}

+ (id)_BMEventWithState:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F2A048]);
  v5 = [NSNumber numberWithBool:v3];
  v6 = (void *)[v4 initWithStarting:v5];

  return v6;
}

+ (id)eventStream
{
  return @"AirplaneMode";
}

- (void)dealloc
{
  [(_DKAirplaneModeMonitor *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKAirplaneModeMonitor;
  [(_DKMonitor *)&v3 dealloc];
}

- (void)start
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = SCError();
  SCErrorString(v2);
  v3[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_225002000, a1, OS_LOG_TYPE_DEBUG, "%s: SCPreferencesSetDispatchQueue() %s", (uint8_t *)v3, 0x16u);
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)_DKAirplaneModeMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation]) {
    [(_DKAirplaneModeMonitor *)self deactivate];
  }
}

- (void)deactivate
{
}

- (void)updateAirplaneModeStatus
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  objc_super v3 = "-[_DKAirplaneModeMonitor updateAirplaneModeStatus]";
  __int16 v4 = 1024;
  int v5 = a1 & 1;
  _os_log_debug_impl(&dword_225002000, a2, OS_LOG_TYPE_DEBUG, "%s: Current AirplaneMode Status:%d", (uint8_t *)&v2, 0x12u);
}

- (NSNumber)airplaneModeStatus
{
  return self->_airplaneModeStatus;
}

- (void)setAirplaneModeStatus:(id)a3
{
}

- (__SCPreferences)radioPrefs
{
  return self->_radioPrefs;
}

- (void)setRadioPrefs:(__SCPreferences *)a3
{
  self->_radioPrefs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airplaneModeStatus, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end