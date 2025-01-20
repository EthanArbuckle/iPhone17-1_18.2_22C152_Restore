@interface _DKOrientationMonitor
+ (id)_BMEventWithValue:(int64_t)a3;
+ (id)_eventWithValue:(int64_t)a3;
+ (id)entitlements;
+ (id)eventStream;
- (void)deactivate;
- (void)dealloc;
- (void)start;
@end

@implementation _DKOrientationMonitor

+ (id)_eventWithValue:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v3 = [MEMORY[0x263F35158] landscape];
  }
  else
  {
    if (a3) {
      [MEMORY[0x263F35158] unknown];
    }
    else {
    uint64_t v3 = [MEMORY[0x263F35158] portriat];
    }
  }
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x263F35088];
  v6 = [MEMORY[0x263F35148] displayOrientationStream];
  v7 = [MEMORY[0x263EFF910] date];
  v8 = [MEMORY[0x263EFF910] distantFuture];
  v9 = [v5 eventWithStream:v6 startDate:v7 endDate:v8 value:v4];

  return v9;
}

- (void)dealloc
{
  [(_DKOrientationMonitor *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKOrientationMonitor;
  [(_DKMonitor *)&v3 dealloc];
}

+ (id)eventStream
{
  return @"DeviceOrientation";
}

+ (id)entitlements
{
  return &unk_26D86D788;
}

+ (id)_BMEventWithValue:(int64_t)a3
{
  if (a3) {
    uint64_t v3 = 2 * (a3 == 1);
  }
  else {
    uint64_t v3 = 1;
  }
  v4 = (void *)[objc_alloc(MEMORY[0x263F2A080]) initWithCategory:v3];
  return v4;
}

- (void)start
{
  uint64_t v3 = BiomeLibrary();
  v4 = [v3 Device];
  v5 = [v4 Display];
  v6 = [v5 InterfaceOrientation];
  v7 = [v6 source];
  source = self->_source;
  self->_source = v7;

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __30___DKOrientationMonitor_start__block_invoke;
  v13[3] = &unk_264714D58;
  v13[4] = self;
  v9 = (void *)MEMORY[0x22A629CE0](v13);
  v10 = [MEMORY[0x263F3F738] configurationForDefaultMainDisplayMonitor];
  [v10 setNeedsUserInteractivePriority:0];
  [v10 setTransitionHandler:v9];
  v11 = [MEMORY[0x263F3F728] monitorWithConfiguration:v10];
  monitor = self->_monitor;
  self->_monitor = v11;
}

- (void)deactivate
{
  [(FBSDisplayLayoutMonitor *)self->_monitor invalidate];
  monitor = self->_monitor;
  self->_monitor = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end