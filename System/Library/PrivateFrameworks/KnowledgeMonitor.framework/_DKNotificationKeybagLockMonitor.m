@interface _DKNotificationKeybagLockMonitor
+ (BOOL)shouldMergeUnchangedEvents;
+ (id)_eventWithState:(id)a3;
+ (id)entitlements;
+ (id)eventStream;
+ (id)log;
+ (int)getCurrentLockState;
+ (void)getCurrentLockState;
+ (void)setIsLocked:(BOOL)a3;
- (void)_activate;
- (void)_deactivate;
- (void)_enqueueKeybagLockedUpdate:(int)a3 timestamp:(double)a4;
- (void)_receiveNotificationEvent:(id)a3;
- (void)_resume;
- (void)_updateWithKeybagLocked:(id)a3 timestamp:(double)a4;
- (void)receiveNotificationEvent:(id)a3;
- (void)start;
- (void)stop;
- (void)synchronouslyReflectCurrentValue;
@end

@implementation _DKNotificationKeybagLockMonitor

- (void)_receiveNotificationEvent:(id)a3
{
  id v4 = a3;
  v5 = [(_DKMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  if (self->_activated)
  {
    v6 = [v4 objectForKeyedSubscript:@"Notification"];
    v7 = [NSString stringWithUTF8String:*MEMORY[0x263F55A78]];
    int v8 = [v6 isEqual:v7];

    if (v8)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v10 = +[_DKNotificationKeybagLockMonitor getCurrentLockState];
      v11 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[_DKNotificationKeybagLockMonitor _receiveNotificationEvent:](v10, v11);
      }

      if (v10 != -1)
      {
        if (!v10)
        {
          v12 = [(_DKMonitor *)self currentEvent];

          if (!v12)
          {
            v13 = [(id)objc_opt_class() log];
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v25 = 0;
              _os_log_impl(&dword_225002000, v13, OS_LOG_TYPE_INFO, "Keybag unlocked but we don't have a previous lock event. Creating an initial (boot) lock state.", v25, 2u);
            }

            v14 = (void *)MEMORY[0x263EFF910];
            v15 = [MEMORY[0x263F08AB0] processInfo];
            [v15 systemUptime];
            v17 = [v14 dateWithTimeIntervalSinceNow:-v16];

            v18 = (void *)MEMORY[0x263F35088];
            v19 = [MEMORY[0x263F35148] keybagIsLockedStream];
            v20 = [MEMORY[0x263EFF910] distantFuture];
            v21 = [MEMORY[0x263F35050] yes];
            v22 = [v18 eventWithStream:v19 startDate:v17 endDate:v20 value:v21];

            [(_DKMonitor *)self setCurrentEvent:v22 inferHistoricalState:0];
          }
        }
        v23 = [NSNumber numberWithInt:v10];
        v24 = +[_DKNotificationKeybagLockMonitor _eventWithState:v23];
        [(_DKMonitor *)self setCurrentEvent:v24 inferHistoricalState:1];

        [(_DKNotificationKeybagLockMonitor *)self _enqueueKeybagLockedUpdate:v10 timestamp:Current];
      }
    }
  }
}

- (void)receiveNotificationEvent:(id)a3
{
  id v4 = a3;
  v5 = [(_DKMonitor *)self queue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61___DKNotificationKeybagLockMonitor_receiveNotificationEvent___block_invoke;
  v10[3] = &unk_2647147D8;
  v10[4] = self;
  id v11 = v4;
  v6 = v10;
  id v7 = v4;
  int v8 = (void *)os_transaction_create();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_0;
  block[3] = &unk_2647148A0;
  id v13 = v8;
  id v14 = v6;
  id v9 = v8;
  dispatch_async(v5, block);
}

+ (id)log
{
  if (log_onceToken_0 != -1) {
    dispatch_once(&log_onceToken_0, &__block_literal_global_0);
  }
  v2 = (void *)log_log_0;
  return v2;
}

+ (id)eventStream
{
  return @"KeybagLockState";
}

+ (id)entitlements
{
  return 0;
}

+ (BOOL)shouldMergeUnchangedEvents
{
  return 1;
}

+ (int)getCurrentLockState
{
  unsigned int v2 = MKBGetDeviceLockState();
  int v3 = v2;
  if (v2 < 4) {
    return dword_2250348B0[v2];
  }
  v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    +[_DKNotificationKeybagLockMonitor getCurrentLockState];
  }

  return -1;
}

+ (void)setIsLocked:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  int v3 = [MEMORY[0x263F351B8] userContext];
  id v4 = [MEMORY[0x263F351D0] keyPathForKeybagLockStatus];
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

  +[_DKNotificationKeybagLockMonitor setIsLocked:v5];
  v6 = (void *)MEMORY[0x263F35088];
  id v7 = [MEMORY[0x263F35148] keybagIsLockedStream];
  int v8 = [MEMORY[0x263EFF910] date];
  id v9 = [MEMORY[0x263EFF910] distantFuture];
  uint64_t v10 = [v6 eventWithStream:v7 startDate:v8 endDate:v9 value:v4];

  return v10;
}

- (void)start
{
  id v3 = [(_DKMonitor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41___DKNotificationKeybagLockMonitor_start__block_invoke;
  block[3] = &unk_264714788;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_activate
{
  id v3 = [(_DKMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225002000, v4, OS_LOG_TYPE_DEFAULT, "activate", buf, 2u);
  }

  uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = (OS_dispatch_queue *)dispatch_queue_create("_DKNotificationKeybagLockMonitor.donations", v5);
  donationQueue = self->_donationQueue;
  self->_donationQueue = v6;

  dispatch_suspend((dispatch_object_t)self->_donationQueue);
  self->_donationQueueResumed = 0;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v9 = +[_DKNotificationKeybagLockMonitor getCurrentLockState];
  id v10 = objc_alloc(MEMORY[0x263F2A088]);
  id v11 = [NSNumber numberWithInt:v9];
  v12 = (void *)[v10 initWithStarting:v11];

  id v13 = self->_donationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45___DKNotificationKeybagLockMonitor__activate__block_invoke;
  block[3] = &unk_264714A00;
  void block[4] = self;
  id v16 = v12;
  CFAbsoluteTime v17 = Current;
  id v14 = v12;
  dispatch_async(v13, block);
  self->_activated = 1;
  if (MKBDeviceUnlockedSinceBoot()) {
    [(_DKNotificationKeybagLockMonitor *)self _resume];
  }
}

- (void)stop
{
  id v3 = [(_DKMonitor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40___DKNotificationKeybagLockMonitor_stop__block_invoke;
  block[3] = &unk_264714788;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_deactivate
{
  id v3 = [(_DKMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  self->_activated = 0;
  if (!self->_donationQueueResumed) {
    dispatch_resume((dispatch_object_t)self->_donationQueue);
  }
  donationQueue = self->_donationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47___DKNotificationKeybagLockMonitor__deactivate__block_invoke;
  block[3] = &unk_264714788;
  void block[4] = self;
  dispatch_barrier_sync(donationQueue, block);
  uint64_t v5 = self->_donationQueue;
  self->_donationQueue = 0;
}

- (void)synchronouslyReflectCurrentValue
{
  unsigned int v2 = [(_DKMonitor *)self currentEvent];

  if (!v2)
  {
    uint64_t v3 = +[_DKNotificationKeybagLockMonitor getCurrentLockState];
    if (v3 != -1)
    {
      id v4 = [NSNumber numberWithInt:v3];
      +[_DKNotificationKeybagLockMonitor setIsLocked:](_DKNotificationKeybagLockMonitor, "setIsLocked:", [v4 BOOLValue]);
    }
  }
}

- (void)_updateWithKeybagLocked:(id)a3 timestamp:(double)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v6 = (BMDeviceKeybagLocked *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_donationQueue);
  id v7 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543618;
    id v16 = v6;
    __int16 v17 = 2048;
    double v18 = a4;
    _os_log_impl(&dword_225002000, v7, OS_LOG_TYPE_DEFAULT, "Writing keybagLocked event %{public}@ at %f", (uint8_t *)&v15, 0x16u);
  }

  source = self->_source;
  if (!source)
  {
    uint64_t v9 = BiomeLibrary();
    id v10 = [v9 Device];
    id v11 = [v10 KeybagLocked];
    v12 = [v11 source];
    id v13 = self->_source;
    self->_source = v12;

    source = self->_source;
  }
  [(BMSource *)source sendEvent:v6 timestamp:a4];
  lastEvent = self->_lastEvent;
  self->_lastEvent = v6;

  self->_lastUpdate = a4;
}

- (void)_enqueueKeybagLockedUpdate:(int)a3 timestamp:(double)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = [(_DKMonitor *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = objc_alloc(MEMORY[0x263F2A088]);
  uint64_t v9 = [NSNumber numberWithInt:v5];
  id v10 = (void *)[v8 initWithStarting:v9];

  donationQueue = self->_donationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73___DKNotificationKeybagLockMonitor__enqueueKeybagLockedUpdate_timestamp___block_invoke;
  block[3] = &unk_264714A00;
  double v15 = a4;
  void block[4] = self;
  id v14 = v10;
  id v12 = v10;
  dispatch_async(donationQueue, block);
  if (!v5) {
    [(_DKNotificationKeybagLockMonitor *)self _resume];
  }
}

- (void)_resume
{
  uint64_t v3 = [(_DKMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  if (self->_activated && !self->_donationQueueResumed)
  {
    dispatch_resume((dispatch_object_t)self->_donationQueue);
    self->_donationQueueResumed = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_lastEvent, 0);
  objc_storeStrong((id *)&self->_donationQueue, 0);
}

+ (void)getCurrentLockState
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_225002000, a2, OS_LOG_TYPE_FAULT, "Unexpected lock state %d", (uint8_t *)v2, 8u);
}

- (void)_receiveNotificationEvent:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_225002000, a2, OS_LOG_TYPE_DEBUG, "Keybag lock state: %d", (uint8_t *)v2, 8u);
}

@end