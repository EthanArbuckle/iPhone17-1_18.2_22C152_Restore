@interface _DKNotificationScreenLockMonitor
+ (BOOL)shouldMergeUnchangedEvents;
+ (id)_BMEventWithState:(id)a3;
+ (id)_eventWithState:(id)a3;
+ (id)entitlements;
+ (id)eventStream;
+ (void)setIsLocked:(BOOL)a3;
- (void)deactivate;
- (void)dealloc;
- (void)receiveNotificationEvent:(id)a3;
- (void)start;
- (void)stop;
- (void)synchronouslyReflectCurrentValue;
@end

@implementation _DKNotificationScreenLockMonitor

- (void)receiveNotificationEvent:(id)a3
{
  id v11 = a3;
  v4 = (void *)MEMORY[0x22A629AA0]();
  if (self->_enabled)
  {
    v5 = [v11 objectForKeyedSubscript:@"Notification"];
    int v6 = [v5 isEqual:@"com.apple.springboard.lockstate"];

    if (v6)
    {
      uint64_t v7 = [v11 objectForKeyedSubscript:@"_State"];
      if (v7)
      {
        v8 = (void *)v7;
        v9 = +[_DKNotificationScreenLockMonitor _eventWithState:v7];
        [(_DKMonitor *)self setCurrentEvent:v9 inferHistoricalState:1];

        v10 = +[_DKNotificationScreenLockMonitor _BMEventWithState:v8];
        [(BMSource *)self->_source sendEvent:v10];
      }
    }
  }
}

- (void)dealloc
{
  [(_DKNotificationScreenLockMonitor *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKNotificationScreenLockMonitor;
  [(_DKMonitor *)&v3 dealloc];
}

+ (id)eventStream
{
  return @"ScreenLockState";
}

+ (id)entitlements
{
  return 0;
}

+ (BOOL)shouldMergeUnchangedEvents
{
  return 1;
}

+ (void)setIsLocked:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  objc_super v3 = [MEMORY[0x263F351B8] userContext];
  v4 = [MEMORY[0x263F351D0] keyPathForDeviceLockStatus];
  [v3 setObject:v5 forKeyedSubscript:v4];
}

+ (id)_eventWithState:(id)a3
{
  id v3 = a3;
  if ([v3 BOOLValue]) {
    [MEMORY[0x263F35050] yes];
  }
  else {
  v4 = [MEMORY[0x263F35050] no];
  }
  uint64_t v5 = [v3 BOOLValue];

  +[_DKNotificationScreenLockMonitor setIsLocked:v5];
  int v6 = (void *)MEMORY[0x263F35088];
  uint64_t v7 = [MEMORY[0x263F35148] deviceIsLockedStream];
  v8 = [MEMORY[0x263EFF910] date];
  v9 = [MEMORY[0x263EFF910] distantFuture];
  v10 = [v6 eventWithStream:v7 startDate:v8 endDate:v9 value:v4];

  return v10;
}

+ (id)_BMEventWithState:(id)a3
{
  uint64_t v3 = [a3 BOOLValue];
  id v4 = objc_alloc(MEMORY[0x263F2A0B0]);
  uint64_t v5 = [NSNumber numberWithBool:v3];
  int v6 = (void *)[v4 initWithStarting:v5];

  return v6;
}

- (void)start
{
  v8.receiver = self;
  v8.super_class = (Class)_DKNotificationScreenLockMonitor;
  if ([(_DKMonitor *)&v8 instantMonitorNeedsActivation])
  {
    uint64_t v3 = BiomeLibrary();
    id v4 = [v3 Device];
    uint64_t v5 = [v4 ScreenLocked];
    int v6 = [v5 source];
    source = self->_source;
    self->_source = v6;

    self->_enabled = 1;
  }
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)_DKNotificationScreenLockMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation]) {
    [(_DKNotificationScreenLockMonitor *)self deactivate];
  }
}

- (void)deactivate
{
  self->_enabled = 0;
}

- (void)synchronouslyReflectCurrentValue
{
  objc_super v3 = [(_DKMonitor *)self currentEvent];

  if (!v3)
  {
    int out_token = 0;
    id v4 = (const char *)[@"com.apple.springboard.lockstate" UTF8String];
    uint64_t v5 = [(_DKMonitor *)self queue];
    notify_register_dispatch(v4, &out_token, v5, &__block_literal_global_3);

    uint64_t v6 = 0;
    if (!notify_get_state(out_token, &v6)) {
      +[_DKNotificationScreenLockMonitor setIsLocked:v6 != 0];
    }
    notify_cancel(out_token);
  }
}

- (void).cxx_destruct
{
}

@end