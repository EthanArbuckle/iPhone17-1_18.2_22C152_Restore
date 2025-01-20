@interface _DKBatteryMonitor
+ (id)_BMEventWithBatteryPercentage:(double)a3 isFullyCharged:(BOOL)a4;
+ (id)_eventWithBatteryPercentage:(double)a3 isFullyCharged:(BOOL)a4;
+ (id)entitlements;
+ (id)eventStream;
+ (void)setCurrentBatteryPercentage:(double)a3;
- (BOOL)adapterType:(id)a3 differsFrom:(id)a4;
- (BOOL)externalConnected:(id)a3 differsFrom:(id)a4;
- (BOOL)fullyCharged:(id)a3 differsFrom:(id)a4;
- (BOOL)fullyChargedFromPowerSourceDictionary:(id)a3;
- (BOOL)hasInternalBattery;
- (BOOL)isCharging:(id)a3 differsFrom:(id)a4;
- (BOOL)newBatteryState:(id)a3 differsSignificantlyFromState:(id)a4 currentBatteryPercentage:(double)a5 previousBatteryPercentage:(double)a6;
- (BOOL)percentage:(double)a3 differsFrom:(double)a4;
- (BOOL)previouslyFullyCharged;
- (BOOL)temperature:(id)a3 differsFrom:(id)a4;
- (BOOL)voltage:(id)a3 differsFrom:(id)a4;
- (NSDictionary)previousBatteryState;
- (double)batteryPercentageFromPowerSourceDictionary:(id)a3;
- (double)currentBatteryPercentage;
- (double)previousPercentage;
- (id)getBatteryProperties;
- (int)immediateShutdownThreshold;
- (void)_handleBatteryNotification;
- (void)batteryStateChangeHandler;
- (void)completeStart;
- (void)currentBatteryPercentage;
- (void)deactivate;
- (void)dealloc;
- (void)getBatteryProperties;
- (void)postImminentShutdownNotification:(double)a3;
- (void)setHasInternalBattery:(BOOL)a3;
- (void)setImmediateShutdownThreshold:(int)a3;
- (void)setPreviousBatteryState:(id)a3;
- (void)setPreviousPercentage:(double)a3;
- (void)setPreviouslyFullyCharged:(BOOL)a3;
- (void)start;
- (void)stop;
- (void)synchronouslyReflectCurrentValue;
- (void)updateBatteryStateDictionary:(id)a3 currentBatteryPercentage:(double)a4;
@end

@implementation _DKBatteryMonitor

- (void)_handleBatteryNotification
{
  id v4 = (id)os_transaction_create();
  v3 = (void *)MEMORY[0x22A629AA0]();
  [(_DKBatteryMonitor *)self _queue_handleNotification];
}

- (void)batteryStateChangeHandler
{
  id v10 = [(_DKBatteryMonitor *)self getBatteryProperties];
  -[_DKBatteryMonitor batteryPercentageFromPowerSourceDictionary:](self, "batteryPercentageFromPowerSourceDictionary:");
  double v4 = v3;
  if (v3 != -1.0)
  {
    BOOL v5 = [(_DKBatteryMonitor *)self fullyChargedFromPowerSourceDictionary:v10];
    [(_DKBatteryMonitor *)self updateBatteryStateDictionary:v10 currentBatteryPercentage:v4];
    if (vabdd_f64(self->_previousPercentage, v4) >= 1.0 || self->_previouslyFullyCharged != v5)
    {
      v6 = objc_opt_class();
      [v6 setCurrentBatteryPercentage:v4];
      v7 = [v6 _eventWithBatteryPercentage:v5 isFullyCharged:v4];
      [(_DKMonitor *)self setCurrentEvent:v7 inferHistoricalState:1];

      source = self->_source;
      v9 = [(id)objc_opt_class() _BMEventWithBatteryPercentage:v5 isFullyCharged:v4];
      [(BMSource *)source sendEvent:v9];

      self->_previousPercentage = v4;
      self->_previouslyFullyCharged = v5;
      [(_DKBatteryMonitor *)self postImminentShutdownNotification:v4];
    }
  }
}

- (id)getBatteryProperties
{
  kern_return_t v3;
  int v4;
  NSObject *v5;
  void *v6;
  CFMutableDictionaryRef properties;
  uint64_t vars8;

  io_registry_entry_t powerService = self->_powerService;
  if (powerService)
  {
    properties = 0;
    double v3 = IORegistryEntryCreateCFProperties(powerService, &properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (v3)
    {
      double v4 = v3;
      BOOL v5 = [MEMORY[0x263F34FB8] contextChannel];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        [(_DKBatteryMonitor *)v4 getBatteryProperties];
      }
      v6 = (void *)MEMORY[0x263EFFA78];
    }
    else
    {
      BOOL v5 = properties;
      v6 = (void *)[(__CFDictionary *)properties copy];
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x263EFFA78];
  }
  return v6;
}

- (BOOL)fullyChargedFromPowerSourceDictionary:(id)a3
{
  double v3 = [a3 objectForKeyedSubscript:@"FullyCharged"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (double)batteryPercentageFromPowerSourceDictionary:(id)a3
{
  id v3 = a3;
  char v4 = [v3 objectForKeyedSubscript:@"MaxCapacity"];

  if (v4)
  {
    BOOL v5 = [v3 objectForKeyedSubscript:@"CurrentCapacity"];
    [v5 doubleValue];
    double v7 = v6 * 100.0;
    v8 = [v3 objectForKeyedSubscript:@"MaxCapacity"];
    [v8 doubleValue];
    double v10 = v7 / v9;
  }
  else
  {
    v11 = [MEMORY[0x263F34FB8] contextChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[_DKBatteryMonitor batteryPercentageFromPowerSourceDictionary:]((uint64_t)v3, v11);
    }

    double v10 = -1.0;
  }

  return v10;
}

- (void)updateBatteryStateDictionary:(id)a3 currentBatteryPercentage:(double)a4
{
  id v64 = a3;
  double v6 = self;
  uint64_t v7 = objc_sync_enter(v6);
  context = (void *)MEMORY[0x22A629AA0](v7);
  v8 = [v64 objectForKeyedSubscript:@"ExternalConnected"];
  uint64_t v9 = [v8 BOOLValue];

  double v10 = [MEMORY[0x263EFF9A0] dictionary];
  if (a4 > 0.0)
  {
    v11 = [NSNumber numberWithDouble:a4];
    v12 = [MEMORY[0x263F351D0] batteryPercentageKey];
    [v10 setObject:v11 forKeyedSubscript:v12];
  }
  v13 = [v64 objectForKeyedSubscript:@"Voltage"];
  v14 = [MEMORY[0x263F351D0] batteryVoltageKey];
  [v10 setObject:v13 forKeyedSubscript:v14];

  v15 = [v64 objectForKeyedSubscript:@"Temperature"];
  v16 = [MEMORY[0x263F351D0] batteryTemperatureKey];
  [v10 setObject:v15 forKeyedSubscript:v16];

  v17 = [NSNumber numberWithBool:v9];
  v18 = [MEMORY[0x263F351D0] batteryExternalConnectedKey];
  [v10 setObject:v17 forKeyedSubscript:v18];

  v19 = [v64 objectForKeyedSubscript:@"AppleRawExternalConnected"];
  v20 = [MEMORY[0x263F351D0] batteryRawExternalConnectedKey];
  [v10 setObject:v19 forKeyedSubscript:v20];

  v21 = [v64 objectForKeyedSubscript:@"FullyCharged"];
  v22 = [MEMORY[0x263F351D0] batteryFullyChargedKey];
  [v10 setObject:v21 forKeyedSubscript:v22];

  v23 = [v64 objectForKeyedSubscript:@"IsCharging"];
  v24 = [MEMORY[0x263F351D0] batteryIsChargingKey];
  [v10 setObject:v23 forKeyedSubscript:v24];

  p_previousBatteryState = &v6->_previousBatteryState;
  previousBatteryState = v6->_previousBatteryState;
  v27 = [MEMORY[0x263F351D0] batteryExternalConnectedKey];
  v28 = [(NSDictionary *)previousBatteryState objectForKeyedSubscript:v27];

  if (v28
    && ([MEMORY[0x263F351D0] batteryExternalConnectedKey],
        v29 = objc_claimAutoreleasedReturnValue(),
        [v10 objectForKeyedSubscript:v29],
        v30 = objc_claimAutoreleasedReturnValue(),
        char v31 = [v30 isEqual:v28],
        v30,
        v29,
        (v31 & 1) != 0))
  {
    v32 = *p_previousBatteryState;
    v33 = [MEMORY[0x263F351D0] batteryExternalConnectedChangeDateKey];
    v34 = [(NSDictionary *)v32 objectForKeyedSubscript:v33];
    v35 = [MEMORY[0x263F351D0] batteryExternalConnectedChangeDateKey];
    [v10 setObject:v34 forKeyedSubscript:v35];
  }
  else
  {
    v33 = [MEMORY[0x263EFF910] date];
    v34 = [MEMORY[0x263F351D0] batteryExternalConnectedChangeDateKey];
    [v10 setObject:v33 forKeyedSubscript:v34];
  }

  v36 = *p_previousBatteryState;
  v37 = [MEMORY[0x263F351D0] batteryRawExternalConnectedKey];
  v38 = [(NSDictionary *)v36 objectForKeyedSubscript:v37];

  if (v38
    && ([MEMORY[0x263F351D0] batteryRawExternalConnectedKey],
        v39 = objc_claimAutoreleasedReturnValue(),
        [v10 objectForKeyedSubscript:v39],
        v40 = objc_claimAutoreleasedReturnValue(),
        char v41 = [v40 isEqual:v38],
        v40,
        v39,
        (v41 & 1) != 0))
  {
    v42 = *p_previousBatteryState;
    v43 = [MEMORY[0x263F351D0] batteryRawExternalConnectedChangeDateKey];
    v44 = [(NSDictionary *)v42 objectForKeyedSubscript:v43];
    v45 = [MEMORY[0x263F351D0] batteryRawExternalConnectedChangeDateKey];
    [v10 setObject:v44 forKeyedSubscript:v45];
  }
  else
  {
    v43 = [MEMORY[0x263EFF910] date];
    v44 = [MEMORY[0x263F351D0] batteryRawExternalConnectedChangeDateKey];
    [v10 setObject:v43 forKeyedSubscript:v44];
  }

  v46 = [v64 objectForKeyedSubscript:@"BatteryInstalled"];

  if (!v46)
  {
    v47 = [MEMORY[0x263F351D0] batteryPercentageKey];
    [v10 setObject:&unk_26D86D8D0 forKeyedSubscript:v47];

    v48 = [MEMORY[0x263F351D0] batteryExternalConnectedKey];
    [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v48];

    v49 = [MEMORY[0x263EFF910] distantPast];
    v50 = [MEMORY[0x263F351D0] batteryExternalConnectedChangeDateKey];
    [v10 setObject:v49 forKeyedSubscript:v50];

    v51 = [MEMORY[0x263F351D0] batteryRawExternalConnectedKey];
    [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v51];

    v52 = [MEMORY[0x263EFF910] distantPast];
    v53 = [MEMORY[0x263F351D0] batteryRawExternalConnectedChangeDateKey];
    [v10 setObject:v52 forKeyedSubscript:v53];

    v54 = [MEMORY[0x263F351D0] batteryFullyChargedKey];
    [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v54];
  }
  v55 = [v64 objectForKeyedSubscript:@"AdapterDetails"];
  v56 = [v55 objectForKeyedSubscript:@"FamilyCode"];
  v57 = [MEMORY[0x263F351D0] batteryAdapterTypeKey];
  [v10 setObject:v56 forKeyedSubscript:v57];

  v58 = [v55 objectForKeyedSubscript:@"IsWireless"];
  v59 = [MEMORY[0x263F351D0] batteryAdapterIsWirelessKey];
  [v10 setObject:v58 forKeyedSubscript:v59];

  if ([(_DKBatteryMonitor *)v6 newBatteryState:v10 differsSignificantlyFromState:*p_previousBatteryState currentBatteryPercentage:a4 previousBatteryPercentage:v6->_previousPercentage])
  {
    objc_storeStrong((id *)&v6->_previousBatteryState, v10);
    v60 = *p_previousBatteryState;
    v61 = [MEMORY[0x263F351B8] userContext];
    v62 = [MEMORY[0x263F351D0] keyPathForBatteryStateDataDictionary];
    [v61 setObject:v60 forKeyedSubscript:v62];
  }
  objc_sync_exit(v6);
}

- (BOOL)newBatteryState:(id)a3 differsSignificantlyFromState:(id)a4 currentBatteryPercentage:(double)a5 previousBatteryPercentage:(double)a6
{
  unint64_t v10 = (unint64_t)a3;
  unint64_t v11 = (unint64_t)a4;
  v12 = (void *)v11;
  if (v10 | v11)
  {
    char v13 = 1;
    if (v10 && v11)
    {
      BOOL v48 = [(_DKBatteryMonitor *)self percentage:a5 differsFrom:a6];
      v14 = [MEMORY[0x263F351D0] batteryTemperatureKey];
      v15 = [(id)v10 objectForKeyedSubscript:v14];
      v16 = [MEMORY[0x263F351D0] batteryTemperatureKey];
      v17 = [v12 objectForKeyedSubscript:v16];
      BOOL v47 = [(_DKBatteryMonitor *)self temperature:v15 differsFrom:v17];

      v18 = [MEMORY[0x263F351D0] batteryVoltageKey];
      v19 = [(id)v10 objectForKeyedSubscript:v18];
      v20 = [MEMORY[0x263F351D0] batteryVoltageKey];
      v21 = [v12 objectForKeyedSubscript:v20];
      BOOL v46 = [(_DKBatteryMonitor *)self voltage:v19 differsFrom:v21];

      v22 = [MEMORY[0x263F351D0] batteryFullyChargedKey];
      v23 = [(id)v10 objectForKeyedSubscript:v22];
      v24 = [MEMORY[0x263F351D0] batteryFullyChargedKey];
      v25 = [v12 objectForKeyedSubscript:v24];
      BOOL v45 = [(_DKBatteryMonitor *)self fullyCharged:v23 differsFrom:v25];

      v26 = [MEMORY[0x263F351D0] batteryIsChargingKey];
      uint64_t v27 = [(id)v10 objectForKeyedSubscript:v26];
      v28 = [MEMORY[0x263F351D0] batteryIsChargingKey];
      v29 = [v12 objectForKeyedSubscript:v28];
      BOOL v44 = [(_DKBatteryMonitor *)self isCharging:v27 differsFrom:v29];

      v30 = [MEMORY[0x263F351D0] batteryExternalConnectedKey];
      char v31 = [(id)v10 objectForKeyedSubscript:v30];
      uint64_t v32 = [MEMORY[0x263F351D0] batteryExternalConnectedKey];
      v33 = [v12 objectForKeyedSubscript:v32];
      LOBYTE(v27) = [(_DKBatteryMonitor *)self externalConnected:v31 differsFrom:v33];

      v34 = [MEMORY[0x263F351D0] batteryRawExternalConnectedKey];
      v35 = [(id)v10 objectForKeyedSubscript:v34];
      v36 = [MEMORY[0x263F351D0] batteryRawExternalConnectedKey];
      v37 = [v12 objectForKeyedSubscript:v36];
      LOBYTE(v32) = [(_DKBatteryMonitor *)self externalConnected:v35 differsFrom:v37];

      v38 = [MEMORY[0x263F351D0] batteryAdapterTypeKey];
      v39 = [(id)v10 objectForKeyedSubscript:v38];
      v40 = [MEMORY[0x263F351D0] batteryAdapterTypeKey];
      char v41 = [v12 objectForKeyedSubscript:v40];
      BOOL v42 = [(_DKBatteryMonitor *)self adapterType:v39 differsFrom:v41];

      char v13 = (v48 || v47 || v46 || v45) | v44 | v27 | v32 | v42;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13 & 1;
}

- (BOOL)externalConnected:(id)a3 differsFrom:(id)a4
{
  id v5 = a4;
  LOBYTE(a3) = [a3 BOOLValue];
  char v6 = [v5 BOOLValue];

  return a3 ^ v6;
}

- (BOOL)temperature:(id)a3 differsFrom:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  uint64_t v7 = (void *)v6;
  if (v5 | v6)
  {
    BOOL v8 = 1;
    if (v5 && v6)
    {
      if (__ROR8__(0x8F5C28F5C28F5C29 * [(id)v5 integerValue] + 0x51EB851EB851EB8, 2) > 0x28F5C28F5C28F5CuLL
        || __ROR8__(0x51EB851EB851EB8 - 0x70A3D70A3D70A3D7 * [v7 integerValue], 2) <= 0x28F5C28F5C28F5CuLL)
      {
        [(id)v5 doubleValue];
        double v10 = v9;
        [v7 doubleValue];
        double v12 = v10 - v11;
        if (v12 < 0.0) {
          double v12 = -v12;
        }
        BOOL v8 = v12 >= 50.0;
      }
      else
      {
        BOOL v8 = 1;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)percentage:(double)a3 differsFrom:(double)a4
{
  double v4 = a3 - a4;
  if (v4 < 0.0) {
    double v4 = -v4;
  }
  return v4 >= 1.0;
}

- (BOOL)isCharging:(id)a3 differsFrom:(id)a4
{
  id v5 = a4;
  LOBYTE(a3) = [a3 BOOLValue];
  char v6 = [v5 BOOLValue];

  return a3 ^ v6;
}

- (BOOL)fullyCharged:(id)a3 differsFrom:(id)a4
{
  id v5 = a4;
  LOBYTE(a3) = [a3 BOOLValue];
  char v6 = [v5 BOOLValue];

  return a3 ^ v6;
}

- (BOOL)adapterType:(id)a3 differsFrom:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 integerValue];
  uint64_t v7 = [v5 integerValue];

  return v6 != v7;
}

- (BOOL)voltage:(id)a3 differsFrom:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  uint64_t v7 = (void *)v6;
  if (v5 | v6)
  {
    BOOL v8 = 1;
    if (v5 && v6)
    {
      if (__ROR8__(0x8F5C28F5C28F5C29 * [(id)v5 integerValue] + 0x51EB851EB851EB8, 1) > 0x51EB851EB851EB8uLL
        || __ROR8__(0x8F5C28F5C28F5C29 * [v7 integerValue] + 0x51EB851EB851EB8, 1) <= 0x51EB851EB851EB8uLL)
      {
        uint64_t v9 = [(id)v5 integerValue];
        uint64_t v10 = [v7 integerValue];
        unint64_t v11 = v9 - v10;
        if (v9 - v10 < 0) {
          unint64_t v11 = v10 - v9;
        }
        BOOL v8 = v11 > 0x63;
      }
      else
      {
        BOOL v8 = 1;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (void)setCurrentBatteryPercentage:(double)a3
{
  id v5 = [NSNumber numberWithDouble:a3];
  id v3 = [MEMORY[0x263F351B8] userContext];
  double v4 = [MEMORY[0x263F351D0] keyPathForBatteryLevel];
  [v3 setObject:v5 forKeyedSubscript:v4];
}

- (void)synchronouslyReflectCurrentValue
{
  if (self->_hasInternalBattery)
  {
    id v3 = (void *)MEMORY[0x22A629AA0]();
    double v4 = [(_DKBatteryMonitor *)self getBatteryProperties];
    [(_DKBatteryMonitor *)self batteryPercentageFromPowerSourceDictionary:v4];
    double v6 = v5;
    if (v5 != -1.0)
    {
      [(_DKBatteryMonitor *)self updateBatteryStateDictionary:v4 currentBatteryPercentage:v5];
      +[_DKBatteryMonitor setCurrentBatteryPercentage:v6];
      [(_DKBatteryMonitor *)self postImminentShutdownNotification:v6];
      self->_previousPercentage = v6;
    }
  }
}

- (void)postImminentShutdownNotification:(double)a3
{
  if (double)self->_immediateShutdownThreshold <= a3 || (IOPSDrawingUnlimitedPower())
  {
    postImminentShutdownNotification__posted = 0;
  }
  else if ((postImminentShutdownNotification__posted & 1) == 0)
  {
    postImminentShutdownNotification__posted = 1;
    notify_post("com.apple.DuetHeuristic-BM.shutdowsoon");
  }
}

+ (id)_eventWithBatteryPercentage:(double)a3 isFullyCharged:(BOOL)a4
{
  BOOL v4 = a4;
  v16[1] = *MEMORY[0x263EF8340];
  double v5 = [MEMORY[0x263F35040] withBatteryPercentage:a3];
  if (v4)
  {
    double v6 = [MEMORY[0x263F35070] fullyCharged];
    v15 = v6;
    uint64_t v7 = [NSNumber numberWithBool:1];
    v16[0] = v7;
    BOOL v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  }
  else
  {
    BOOL v8 = 0;
  }
  uint64_t v9 = (void *)MEMORY[0x263F35088];
  uint64_t v10 = [MEMORY[0x263F35148] deviceBatteryPercentageStream];
  unint64_t v11 = [MEMORY[0x263EFF910] date];
  double v12 = [MEMORY[0x263EFF910] distantFuture];
  char v13 = [v9 eventWithStream:v10 startDate:v11 endDate:v12 value:v5 metadata:v8];

  return v13;
}

+ (id)_BMEventWithBatteryPercentage:(double)a3 isFullyCharged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = objc_alloc(MEMORY[0x263F2A060]);
  uint64_t v7 = [NSNumber numberWithDouble:a3];
  BOOL v8 = [NSNumber numberWithBool:v4];
  uint64_t v9 = (void *)[v6 initWithBatteryPercentage:v7 fullyCharged:v8];

  return v9;
}

- (void)dealloc
{
  [(_DKBatteryMonitor *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKBatteryMonitor;
  [(_DKMonitor *)&v3 dealloc];
}

+ (id)eventStream
{
  return @"BatteryLevel";
}

+ (id)entitlements
{
  return 0;
}

- (void)start
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_225002000, log, OS_LOG_TYPE_ERROR, "Unable to get power sources", v1, 2u);
}

- (void)completeStart
{
  int v3 = a1;
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a1 == 256)
  {
    BOOL v4 = @"unable to get power service or notify port";
  }
  else
  {
    BOOL v4 = [NSNumber numberWithInt:a1];
  }
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_225002000, log, OS_LOG_TYPE_ERROR, "Unable to register for battery notifications: %@", (uint8_t *)&v5, 0xCu);
  if (v3 != 256) {
}
  }

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)_DKBatteryMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation]) {
    [(_DKBatteryMonitor *)self deactivate];
  }
}

- (void)deactivate
{
  io_object_t batteryNotification = self->_batteryNotification;
  if (batteryNotification) {
    IOObjectRelease(batteryNotification);
  }
  notifyPort = self->_notifyPort;
  if (notifyPort) {
    IONotificationPortDestroy(notifyPort);
  }
  io_object_t powerService = self->_powerService;
  if (powerService)
  {
    IOObjectRelease(powerService);
  }
}

- (double)currentBatteryPercentage
{
  uint64_t v2 = IOPSGetPercentRemaining();
  if (!v2) {
    return (double)0;
  }
  uint64_t v3 = v2;
  BOOL v4 = [MEMORY[0x263F34FB8] contextChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    [(_DKBatteryMonitor *)v3 currentBatteryPercentage];
  }

  return -1.0;
}

- (int)immediateShutdownThreshold
{
  return self->_immediateShutdownThreshold;
}

- (void)setImmediateShutdownThreshold:(int)a3
{
  self->_immediateShutdownThreshold = a3;
}

- (BOOL)hasInternalBattery
{
  return self->_hasInternalBattery;
}

- (void)setHasInternalBattery:(BOOL)a3
{
  self->_hasInternalBattery = a3;
}

- (NSDictionary)previousBatteryState
{
  return self->_previousBatteryState;
}

- (void)setPreviousBatteryState:(id)a3
{
}

- (double)previousPercentage
{
  return self->_previousPercentage;
}

- (void)setPreviousPercentage:(double)a3
{
  self->_previousPercentage = a3;
}

- (BOOL)previouslyFullyCharged
{
  return self->_previouslyFullyCharged;
}

- (void)setPreviouslyFullyCharged:(BOOL)a3
{
  self->_previouslyFullyCharged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousBatteryState, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (void)getBatteryProperties
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_225002000, a2, OS_LOG_TYPE_ERROR, "Unable to get battery properties: %d", (uint8_t *)v2, 8u);
}

- (void)currentBatteryPercentage
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSNumber numberWithInt:a1];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl(&dword_225002000, a2, OS_LOG_TYPE_ERROR, "Unable to get valid battery level: %@", (uint8_t *)&v4, 0xCu);
}

- (void)batteryPercentageFromPowerSourceDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_225002000, a2, OS_LOG_TYPE_ERROR, "Unable to get valid battery level. %@", (uint8_t *)&v2, 0xCu);
}

@end