@interface _DKNotificationWatchNearbyMonitor
+ (BOOL)shouldMergeUnchangedEvents;
+ (id)_eventWithNearbyDeviceCount:(unint64_t)a3;
+ (id)entitlements;
+ (id)eventStream;
+ (void)setIsWatchNearby:(BOOL)a3;
- (void)deactivate;
- (void)dealloc;
- (void)receiveNotificationEvent:(id)a3;
- (void)setWatchIsNearby;
- (void)start;
- (void)stop;
- (void)synchronouslyReflectCurrentValue;
@end

@implementation _DKNotificationWatchNearbyMonitor

- (void)receiveNotificationEvent:(id)a3
{
  id v4 = a3;
  v5 = (void *)os_transaction_create();
  v6 = (void *)MEMORY[0x22A629AA0]();
  if (self->_enabled)
  {
    v7 = [v4 objectForKeyedSubscript:@"Notification"];
    int v8 = [v7 isEqual:@"com.apple.coreduetd.nearbydeviceschanged"];

    if (v8)
    {
      v9 = [MEMORY[0x263F34FB8] contextChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_225002000, v9, OS_LOG_TYPE_DEFAULT, "Received notification event for nearby devices changed!", v12, 2u);
      }

      v10 = [v4 objectForKeyedSubscript:@"_State"];
      v11 = +[_DKNotificationWatchNearbyMonitor _eventWithNearbyDeviceCount:](_DKNotificationWatchNearbyMonitor, "_eventWithNearbyDeviceCount:", [v10 unsignedIntegerValue]);
      [(_DKMonitor *)self setCurrentEvent:v11 inferHistoricalState:1];
    }
  }
}

- (void)dealloc
{
  [(_DKNotificationWatchNearbyMonitor *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKNotificationWatchNearbyMonitor;
  [(_DKMonitor *)&v3 dealloc];
}

+ (id)eventStream
{
  return @"WatchNearby";
}

+ (id)entitlements
{
  return 0;
}

+ (BOOL)shouldMergeUnchangedEvents
{
  return 1;
}

+ (void)setIsWatchNearby:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = [MEMORY[0x263F34FB8] contextChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_225002000, v4, OS_LOG_TYPE_DEFAULT, "Watch Nearby Status: %u", (uint8_t *)v8, 8u);
  }

  v5 = [NSNumber numberWithBool:v3];
  v6 = [MEMORY[0x263F351B8] userContext];
  v7 = [MEMORY[0x263F351D0] keyPathForDefaultPairedDeviceNearbyStatus];
  [v6 setObject:v5 forKeyedSubscript:v7];
}

+ (id)_eventWithNearbyDeviceCount:(unint64_t)a3
{
  if (a3) {
    [MEMORY[0x263F35050] yes];
  }
  else {
  id v4 = [MEMORY[0x263F35050] no];
  }
  +[_DKNotificationWatchNearbyMonitor setIsWatchNearby:a3 != 0];
  v5 = (void *)MEMORY[0x263F35088];
  v6 = [MEMORY[0x263F35148] watchNearbyStream];
  v7 = [MEMORY[0x263EFF910] date];
  int v8 = [MEMORY[0x263EFF910] distantFuture];
  uint64_t v9 = [v5 eventWithStream:v6 startDate:v7 endDate:v8 value:v4];

  return v9;
}

- (void)setWatchIsNearby
{
  int out_token = 0;
  BOOL v3 = (const char *)[@"com.apple.coreduetd.nearbydeviceschanged" UTF8String];
  id v4 = [(_DKMonitor *)self queue];
  notify_register_dispatch(v3, &out_token, v4, &__block_literal_global_155);

  uint64_t v5 = 0;
  if (!notify_get_state(out_token, &v5)) {
    +[_DKNotificationWatchNearbyMonitor setIsWatchNearby:v5 != 0];
  }
  notify_cancel(out_token);
}

- (void)start
{
  v6.receiver = self;
  v6.super_class = (Class)_DKNotificationWatchNearbyMonitor;
  if ([(_DKMonitor *)&v6 instantMonitorNeedsActivation])
  {
    self->_enabled = 1;
    p_token = &self->_token;
    self->_token = -1;
    [(_DKNotificationWatchNearbyMonitor *)self setWatchIsNearby];
    id v4 = (const char *)[@"com.apple.coreduetd.nearbydeviceschanged" UTF8String];
    uint64_t v5 = [(_DKMonitor *)self queue];
    notify_register_dispatch(v4, p_token, v5, &__block_literal_global_157);
  }
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)_DKNotificationWatchNearbyMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation]) {
    [(_DKNotificationWatchNearbyMonitor *)self deactivate];
  }
}

- (void)deactivate
{
  self->_enabled = 0;
  int token = self->_token;
  if (token != -1) {
    notify_cancel(token);
  }
}

- (void)synchronouslyReflectCurrentValue
{
  if (!self->_enabled) {
    [(_DKNotificationWatchNearbyMonitor *)self setWatchIsNearby];
  }
}

@end