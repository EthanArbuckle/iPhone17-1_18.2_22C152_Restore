@interface _DKBacklightMonitor
+ (BOOL)indicatesScreenOnWithNotificationState:(id)a3;
+ (BOOL)shouldMergeUnchangedEvents;
+ (id)_eventWithState:(id)a3;
+ (id)entitlements;
+ (id)eventStream;
+ (void)setIsBacklit:(BOOL)a3;
- (_DKBacklightMonitor)init;
- (id)shutdownHandler;
- (void)deactivate;
- (void)dealloc;
- (void)donateToBiome:(unint64_t)a3 startDate:(id)a4;
- (void)obtainCurrentValue;
- (void)setShutdownHandler:(id)a3;
- (void)start;
- (void)stop;
- (void)synchronouslyReflectCurrentValue;
@end

@implementation _DKBacklightMonitor

- (void)setShutdownHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42___DKBacklightMonitor_setShutdownHandler___block_invoke;
  v8[3] = &unk_2647148C8;
  id v5 = v4;
  id v9 = v5;
  objc_copyWeak(&v10, &location);
  v6 = (void *)[v8 copy];
  id shutdownHandler = self->_shutdownHandler;
  self->_id shutdownHandler = v6;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)shutdownHandler
{
  v2 = (void *)MEMORY[0x22A629CE0](self->_shutdownHandler, a2);
  return v2;
}

- (_DKBacklightMonitor)init
{
  v12.receiver = self;
  v12.super_class = (Class)_DKBacklightMonitor;
  v2 = [(_DKMonitor *)&v12 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F34FB8] knowledgeChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_225002000, v3, OS_LOG_TYPE_DEFAULT, "Enabling Backlight monitor", v11, 2u);
    }

    id v4 = BiomeLibrary();
    id v5 = [v4 Device];
    v6 = [v5 Display];
    v7 = [v6 Backlight];
    uint64_t v8 = [v7 source];
    source = v2->_source;
    v2->_source = (BMSource *)v8;
  }
  return v2;
}

- (void)dealloc
{
  [(_DKBacklightMonitor *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKBacklightMonitor;
  [(_DKMonitor *)&v3 dealloc];
}

+ (id)eventStream
{
  return @"Backlight";
}

+ (id)entitlements
{
  return 0;
}

+ (BOOL)shouldMergeUnchangedEvents
{
  return 1;
}

+ (BOOL)indicatesScreenOnWithNotificationState:(id)a3
{
  return [a3 BOOLValue];
}

+ (void)setIsBacklit:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = [MEMORY[0x263F351B8] userContext];
  objc_sync_enter(obj);
  id v4 = [NSNumber numberWithBool:v3];
  id v5 = [MEMORY[0x263F351B8] userContext];
  v6 = [MEMORY[0x263F351D0] keyPathForBacklightOnStatus];
  [v5 setObject:v4 forKeyedSubscript:v6];

  objc_sync_exit(obj);
}

+ (id)_eventWithState:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() indicatesScreenOnWithNotificationState:v3];

  if (v4) {
    [MEMORY[0x263F35050] yes];
  }
  else {
  id v5 = [MEMORY[0x263F35050] no];
  }
  +[_DKBacklightMonitor setIsBacklit:v4];
  v6 = (void *)MEMORY[0x263F35088];
  v7 = [MEMORY[0x263F35148] displayIsBacklit];
  uint64_t v8 = [MEMORY[0x263EFF910] date];
  id v9 = [MEMORY[0x263EFF910] distantFuture];
  id v10 = [v6 eventWithStream:v7 startDate:v8 endDate:v9 value:v5];

  return v10;
}

- (void)obtainCurrentValue
{
  id v3 = [(_DKMonitor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41___DKBacklightMonitor_obtainCurrentValue__block_invoke;
  block[3] = &unk_264714788;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)donateToBiome:(unint64_t)a3 startDate:(id)a4
{
  v6 = (objc_class *)MEMORY[0x263F2A050];
  id v7 = a4;
  id v8 = [v6 alloc];
  id v9 = [NSNumber numberWithUnsignedLongLong:a3];
  id v10 = (id)[v8 initWithAbsoluteTimestamp:v7 backlightLevel:v9];

  [(BMSource *)self->_source sendEvent:v10];
}

- (void)start
{
  v9.receiver = self;
  v9.super_class = (Class)_DKBacklightMonitor;
  if ([(_DKMonitor *)&v9 instantMonitorNeedsActivation])
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __28___DKBacklightMonitor_start__block_invoke;
    v6[3] = &unk_2647148F0;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    id v3 = (void *)MEMORY[0x22A629CE0](v6);
    uint64_t v4 = (const char *)[@"com.apple.iokit.hid.displayStatus" UTF8String];
    id v5 = [(_DKMonitor *)self queue];
    notify_register_dispatch(v4, &self->notifyToken, v5, v3);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  [(_DKBacklightMonitor *)self obtainCurrentValue];
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)_DKBacklightMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation]) {
    [(_DKBacklightMonitor *)self deactivate];
  }
}

- (void)deactivate
{
  int notifyToken = self->notifyToken;
  if (notifyToken)
  {
    notify_cancel(notifyToken);
    self->int notifyToken = 0;
  }
}

- (void)synchronouslyReflectCurrentValue
{
  objc_super v3 = [(_DKMonitor *)self currentEvent];

  if (!v3)
  {
    [(_DKBacklightMonitor *)self obtainCurrentValue];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shutdownHandler, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end