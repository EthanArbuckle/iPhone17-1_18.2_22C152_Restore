@interface _DKNotificationScreenLockImputedMonitor
+ (BOOL)shouldMergeUnchangedEvents;
+ (id)_eventWithState:(id)a3;
+ (id)entitlements;
+ (id)eventStream;
+ (void)setIsLocked:(BOOL)a3;
- (id)fetchMostRecentScreenLockStateEventFromKnowledgeStore;
- (void)deactivate;
- (void)dealloc;
- (void)fetchMostRecentScreenLockStateEventFromKnowledgeStore;
- (void)receiveNotificationEvent:(id)a3;
- (void)setCurrentEventInInstantStateUsingLastKnowledgeStoreEvent;
- (void)start;
- (void)stop;
- (void)synchronouslyReflectCurrentValue;
@end

@implementation _DKNotificationScreenLockImputedMonitor

- (void)receiveNotificationEvent:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x22A629AA0]();
  if (self->_enabled)
  {
    v6 = [v4 objectForKeyedSubscript:@"Notification"];
    int v7 = [v6 isEqual:@"com.apple.springboard.lockstate"];

    if (v7)
    {
      v8 = [(_DKMonitor *)self queue];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __68___DKNotificationScreenLockImputedMonitor_receiveNotificationEvent___block_invoke;
      v14[3] = &unk_264714788;
      v14[4] = self;
      v9 = v14;
      v10 = (void *)os_transaction_create();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __cd_dispatch_async_capture_tx_block_invoke_2;
      block[3] = &unk_2647148A0;
      id v16 = v10;
      id v17 = v9;
      id v11 = v10;
      dispatch_async(v8, block);

      v12 = [v4 objectForKeyedSubscript:@"_State"];
      v13 = +[_DKNotificationScreenLockImputedMonitor _eventWithState:v12];
      [(_DKMonitor *)self setCurrentEvent:v13 inferHistoricalState:1];
    }
  }
}

- (void)dealloc
{
  [(_DKNotificationScreenLockImputedMonitor *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKNotificationScreenLockImputedMonitor;
  [(_DKMonitor *)&v3 dealloc];
}

+ (id)eventStream
{
  return @"ScreenLockStateImputed";
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
  id v4 = [MEMORY[0x263F351D0] keyPathForDeviceLockStatus];
  [v3 setObject:v5 forKeyedSubscript:v4];
}

+ (id)_eventWithState:(id)a3
{
  id v3 = a3;
  if ([v3 BOOLValue]) {
    [MEMORY[0x263F35050] yes];
  }
  else {
  id v4 = [MEMORY[0x263F35050] no];
  }
  uint64_t v5 = [v3 BOOLValue];

  +[_DKNotificationScreenLockImputedMonitor setIsLocked:v5];
  v6 = (void *)MEMORY[0x263F35088];
  int v7 = [MEMORY[0x263F35148] deviceIsLockedImputedStream];
  v8 = [MEMORY[0x263EFF910] date];
  v9 = [MEMORY[0x263EFF910] distantFuture];
  v10 = [v6 eventWithStream:v7 startDate:v8 endDate:v9 value:v4];

  return v10;
}

- (id)fetchMostRecentScreenLockStateEventFromKnowledgeStore
{
  v17[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"startDate" ascending:0];
  id v3 = (void *)MEMORY[0x263F35090];
  id v4 = [MEMORY[0x263F35148] deviceIsLockedImputedStream];
  v17[0] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  id v16 = v2;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
  int v7 = [v3 eventQueryWithPredicate:0 eventStreams:v5 offset:0 limit:1 sortDescriptors:v6];

  v8 = [MEMORY[0x263F350B8] knowledgeStore];
  id v15 = 0;
  v9 = [v8 executeQuery:v7 error:&v15];
  id v10 = v15;

  if (!v9)
  {
    id v11 = [MEMORY[0x263F34FB8] knowledgeChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(_DKNotificationScreenLockImputedMonitor *)(uint64_t)v10 fetchMostRecentScreenLockStateEventFromKnowledgeStore];
    }
  }
  v12 = [MEMORY[0x263F34FB8] knowledgeChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    [(_DKNotificationScreenLockImputedMonitor *)v9 fetchMostRecentScreenLockStateEventFromKnowledgeStore];
  }

  v13 = [v9 firstObject];

  return v13;
}

- (void)setCurrentEventInInstantStateUsingLastKnowledgeStoreEvent
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_225002000, log, OS_LOG_TYPE_DEBUG, "ScreenLockStateImputed: Unable to retrieve latest ScreenLockState event.", v1, 2u);
}

- (void)start
{
  v3.receiver = self;
  v3.super_class = (Class)_DKNotificationScreenLockImputedMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsActivation]) {
    self->_enabled = 1;
  }
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)_DKNotificationScreenLockImputedMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation]) {
    [(_DKNotificationScreenLockImputedMonitor *)self deactivate];
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
    notify_register_dispatch(v4, &out_token, v5, &__block_literal_global_141);

    uint64_t v6 = 0;
    if (!notify_get_state(out_token, &v6)) {
      +[_DKNotificationScreenLockImputedMonitor setIsLocked:v6 != 0];
    }
    notify_cancel(out_token);
  }
}

- (void)fetchMostRecentScreenLockStateEventFromKnowledgeStore
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_225002000, a2, OS_LOG_TYPE_ERROR, "ScreenLockStateImputed: Error querying Duet: %@", (uint8_t *)&v2, 0xCu);
}

@end