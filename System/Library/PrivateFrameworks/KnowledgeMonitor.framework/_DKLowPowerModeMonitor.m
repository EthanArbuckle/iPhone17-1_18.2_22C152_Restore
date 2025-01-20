@interface _DKLowPowerModeMonitor
+ (BOOL)shouldMergeUnchangedEvents;
+ (id)_BMEventWithLowPowerModeState:(BOOL)a3;
+ (id)_eventWithLowPowerModeState:(BOOL)a3;
+ (id)eventStream;
+ (void)setLowPowerMode:(BOOL)a3;
- (NSNumber)lowPowerModeStatus;
- (void)setLowPowerModeStatus:(id)a3;
- (void)start;
- (void)stop;
- (void)synchronouslyReflectCurrentValue;
- (void)updateLowPowerMode;
@end

@implementation _DKLowPowerModeMonitor

+ (id)eventStream
{
  return @"LowPowerMode";
}

+ (BOOL)shouldMergeUnchangedEvents
{
  return 1;
}

+ (id)_eventWithLowPowerModeState:(BOOL)a3
{
  if (a3) {
    [MEMORY[0x263F35050] on];
  }
  else {
  v3 = [MEMORY[0x263F35050] off];
  }
  v4 = (void *)MEMORY[0x263F35088];
  v5 = [MEMORY[0x263F35148] deviceLowPowerModeStream];
  v6 = [MEMORY[0x263EFF910] date];
  v7 = [MEMORY[0x263EFF910] distantFuture];
  v8 = [v4 eventWithStream:v5 startDate:v6 endDate:v7 value:v3];

  return v8;
}

+ (id)_BMEventWithLowPowerModeState:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F2A090]);
  v5 = [NSNumber numberWithBool:v3];
  v6 = (void *)[v4 initWithStarting:v5];

  return v6;
}

+ (void)setLowPowerMode:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  BOOL v3 = [MEMORY[0x263F351B8] userContext];
  id v4 = [MEMORY[0x263F351D0] keyPathForLowPowerModeStatus];
  [v3 setObject:v5 forKeyedSubscript:v4];
}

- (void)start
{
  v15.receiver = self;
  v15.super_class = (Class)_DKLowPowerModeMonitor;
  if ([(_DKMonitor *)&v15 instantMonitorNeedsActivation])
  {
    BOOL v3 = BiomeLibrary();
    id v4 = [v3 Device];
    id v5 = [v4 Power];
    v6 = [v5 LowPowerMode];
    v7 = [v6 source];
    source = self->_source;
    self->_source = v7;

    v9 = [MEMORY[0x263F351B8] userContext];
    v10 = [MEMORY[0x263F351D0] keyPathForLowPowerModeStatus];
    v11 = [v9 objectForKeyedSubscript:v10];
    [(_DKLowPowerModeMonitor *)self setLowPowerModeStatus:v11];

    v12 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v13 = *MEMORY[0x263F08450];
    v14 = [MEMORY[0x263F08AB0] processInfo];
    [v12 addObserver:self selector:sel_lowPowerModeStateChanged_ name:v13 object:v14];

    [(_DKLowPowerModeMonitor *)self updateLowPowerMode];
  }
}

- (void)stop
{
  v6.receiver = self;
  v6.super_class = (Class)_DKLowPowerModeMonitor;
  if ([(_DKMonitor *)&v6 instantMonitorNeedsDeactivation])
  {
    BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v4 = *MEMORY[0x263F08450];
    id v5 = [MEMORY[0x263F08AB0] processInfo];
    [v3 removeObserver:self name:v4 object:v5];
  }
}

- (void)synchronouslyReflectCurrentValue
{
  BOOL v3 = [(_DKMonitor *)self currentEvent];

  if (!v3)
  {
    [(_DKLowPowerModeMonitor *)self updateLowPowerMode];
  }
}

- (void)updateLowPowerMode
{
  BOOL v3 = [(_DKMonitor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44___DKLowPowerModeMonitor_updateLowPowerMode__block_invoke;
  block[3] = &unk_264714788;
  block[4] = self;
  dispatch_async(v3, block);
}

- (NSNumber)lowPowerModeStatus
{
  return self->_lowPowerModeStatus;
}

- (void)setLowPowerModeStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowPowerModeStatus, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end