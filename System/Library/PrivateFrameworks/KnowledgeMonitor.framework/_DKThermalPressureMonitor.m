@interface _DKThermalPressureMonitor
+ (id)entitlements;
+ (id)eventStream;
- (BOOL)initialized;
- (BOOL)peakPowerPressureLevel;
- (id)loadState;
- (int)lastThermalPressureLevel;
- (int)peakPowerPressureToken;
- (int)thermalPressureToken;
- (void)deactivate;
- (void)dealloc;
- (void)getPeakPowerPressureLevelWithToken:(int)a3;
- (void)getThermalPressureLevelWithToken:(int)a3;
- (void)setCurrentPeakPowerPressureLevel:(unsigned int)a3;
- (void)setCurrentThermalLevel:(int)a3;
- (void)setInitialized:(BOOL)a3;
- (void)setLastThermalPressureLevel:(int)a3;
- (void)setPeakPowerPressureLevel:(BOOL)a3;
- (void)setPeakPowerPressureToken:(int)a3;
- (void)setThermalPressureToken:(int)a3;
- (void)start;
- (void)stop;
- (void)synchronouslyReflectCurrentValue;
@end

@implementation _DKThermalPressureMonitor

- (void)dealloc
{
  [(_DKThermalPressureMonitor *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKThermalPressureMonitor;
  [(_DKMonitor *)&v3 dealloc];
}

+ (id)eventStream
{
  return @"ThermalPressureLevel";
}

+ (id)entitlements
{
  return 0;
}

- (id)loadState
{
  return 0;
}

- (void)setCurrentThermalLevel:(int)a3
{
  if (!self->_initialized || self->_lastThermalPressureLevel != a3)
  {
    v5 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
    v6 = [MEMORY[0x263F351B8] userContext];
    v7 = [MEMORY[0x263F351D0] keyPathForThermalPressureLevel];
    [v6 setObject:v5 forKeyedSubscript:v7];

    self->_lastThermalPressureLevel = a3;
    self->_initialized = 1;
  }
}

- (void)setCurrentPeakPowerPressureLevel:(unsigned int)a3
{
  if (self->_peakPowerPressureLevel != a3)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    v6 = [MEMORY[0x263F351B8] userContext];
    v7 = [MEMORY[0x263F351F0] ephemeralKeyPathWithKey:@"/system/peakPowerPressureLevel"];
    [v6 setObject:v5 forKeyedSubscript:v7];

    self->_peakPowerPressureLevel = a3 != 0;
  }
}

- (void)start
{
  v5.receiver = self;
  v5.super_class = (Class)_DKThermalPressureMonitor;
  if ([(_DKMonitor *)&v5 instantMonitorNeedsActivation])
  {
    self->_initialized = 0;
    objc_super v3 = [(_DKMonitor *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34___DKThermalPressureMonitor_start__block_invoke;
    block[3] = &unk_264714788;
    block[4] = self;
    dispatch_sync(v3, block);

    [(_DKThermalPressureMonitor *)self synchronouslyReflectCurrentValue];
  }
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)_DKThermalPressureMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation]) {
    [(_DKThermalPressureMonitor *)self deactivate];
  }
}

- (void)deactivate
{
  int thermalPressureToken = self->_thermalPressureToken;
  if (thermalPressureToken)
  {
    notify_cancel(thermalPressureToken);
    self->_int thermalPressureToken = 0;
  }
  int peakPowerPressureToken = self->_peakPowerPressureToken;
  if (peakPowerPressureToken)
  {
    notify_cancel(peakPowerPressureToken);
    self->_int peakPowerPressureToken = 0;
  }
  self->_initialized = 0;
}

- (void)getThermalPressureLevelWithToken:(int)a3
{
  uint64_t state64 = 0;
  if (notify_get_state(a3, &state64)) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = state64;
  }
  [(_DKThermalPressureMonitor *)self setCurrentThermalLevel:v4];
}

- (void)getPeakPowerPressureLevelWithToken:(int)a3
{
  uint64_t state64 = 0;
  if (notify_get_state(a3, &state64)) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = state64;
  }
  [(_DKThermalPressureMonitor *)self setCurrentPeakPowerPressureLevel:v4];
}

- (void)synchronouslyReflectCurrentValue
{
  [(_DKThermalPressureMonitor *)self getThermalPressureLevelWithToken:self->_thermalPressureToken];
  uint64_t peakPowerPressureToken = self->_peakPowerPressureToken;
  [(_DKThermalPressureMonitor *)self getPeakPowerPressureLevelWithToken:peakPowerPressureToken];
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (int)thermalPressureToken
{
  return self->_thermalPressureToken;
}

- (void)setThermalPressureToken:(int)a3
{
  self->_int thermalPressureToken = a3;
}

- (int)lastThermalPressureLevel
{
  return self->_lastThermalPressureLevel;
}

- (void)setLastThermalPressureLevel:(int)a3
{
  self->_lastThermalPressureLevel = a3;
}

- (int)peakPowerPressureToken
{
  return self->_peakPowerPressureToken;
}

- (void)setPeakPowerPressureToken:(int)a3
{
  self->_uint64_t peakPowerPressureToken = a3;
}

- (BOOL)peakPowerPressureLevel
{
  return self->_peakPowerPressureLevel;
}

- (void)setPeakPowerPressureLevel:(BOOL)a3
{
  self->_peakPowerPressureLevel = a3;
}

@end