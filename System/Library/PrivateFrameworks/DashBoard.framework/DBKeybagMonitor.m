@interface DBKeybagMonitor
- (BOOL)isBlocked;
- (BOOL)isLocked;
- (BOOL)permanentlyBlocked;
- (CARObserverHashTable)observers;
- (DBKeybagMonitor)init;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)queue;
- (double)backoffInterval;
- (int)lockStateNotificationToken;
- (int64_t)currentState;
- (int64_t)lockedState;
- (void)_handleKeybagStatusChanged;
- (void)_queue_updateLockedState;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setBackoffInterval:(double)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setLockStateNotificationToken:(int)a3;
- (void)setLockedState:(int64_t)a3;
- (void)setObservers:(id)a3;
- (void)setPermanentlyBlocked:(BOOL)a3;
- (void)setQueue:(id)a3;
@end

@implementation DBKeybagMonitor

- (DBKeybagMonitor)init
{
  v17.receiver = self;
  v17.super_class = (Class)DBKeybagMonitor;
  v2 = [(DBKeybagMonitor *)&v17 init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;

    uint64_t v5 = BSDispatchQueueCreateSerial();
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26E1E2C08 callbackQueue:v2->_callbackQueue];
    observers = v2->_observers;
    v2->_observers = (CARObserverHashTable *)v7;

    objc_initWeak(&location, v2);
    v2->_lockStateNotificationToken = -1;
    v9 = v2->_callbackQueue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __23__DBKeybagMonitor_init__block_invoke;
    handler[3] = &unk_2649B5288;
    objc_copyWeak(&v15, &location);
    notify_register_dispatch("com.apple.springboard.passcodeLockedOrBlocked", &v2->_lockStateNotificationToken, v9, handler);
    v10 = v2->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __23__DBKeybagMonitor_init__block_invoke_2;
    block[3] = &unk_2649B3E90;
    v13 = v2;
    dispatch_async(v10, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __23__DBKeybagMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleKeybagStatusChanged];
}

uint64_t __23__DBKeybagMonitor_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateLockedState");
}

- (void)dealloc
{
  notify_cancel([(DBKeybagMonitor *)self lockStateNotificationToken]);
  v3.receiver = self;
  v3.super_class = (Class)DBKeybagMonitor;
  [(DBKeybagMonitor *)&v3 dealloc];
}

- (BOOL)isLocked
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int64_t v2 = [(DBKeybagMonitor *)self currentState];
  int64_t v3 = v2;
  if (v2 != 3 && v2)
  {
    v4 = DBLogForCategory(0);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    int v8 = 134217984;
    int64_t v9 = v3;
    uint64_t v5 = "keybag is locked! state: %ld";
  }
  else
  {
    v4 = DBLogForCategory(0);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    int v8 = 134217984;
    int64_t v9 = v3;
    uint64_t v5 = "keybag is not locked! state: %ld";
  }
  _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, 0xCu);
LABEL_8:

  return v3 != 3 && v3 != 0;
}

- (int64_t)currentState
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  int64_t v3 = [(DBKeybagMonitor *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__DBKeybagMonitor_currentState__block_invoke;
  v6[3] = &unk_2649B52B0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __31__DBKeybagMonitor_currentState__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) lockedState];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isBlocked
{
  [(DBKeybagMonitor *)self backoffInterval];
  if (v3 > 0.0 || [(DBKeybagMonitor *)self permanentlyBlocked])
  {
    int64_t v4 = DBLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Device is blocked!", buf, 2u);
    }
    BOOL v5 = 1;
  }
  else
  {
    int64_t v4 = DBLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Device is not blocked.", v7, 2u);
    }
    BOOL v5 = 0;
  }

  return v5;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBKeybagMonitor *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBKeybagMonitor *)self observers];
  [v5 removeObserver:v4];
}

- (void)_handleKeybagStatusChanged
{
  double v3 = [(DBKeybagMonitor *)self callbackQueue];
  BSDispatchQueueAssert();

  id v4 = [(DBKeybagMonitor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__DBKeybagMonitor__handleKeybagStatusChanged__block_invoke;
  block[3] = &unk_2649B3E90;
  void block[4] = self;
  dispatch_sync(v4, block);

  id v5 = [(DBKeybagMonitor *)self observers];
  [v5 keybagMonitorLockStateDidChange:self];
}

uint64_t __45__DBKeybagMonitor__handleKeybagStatusChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateLockedState");
}

- (void)_queue_updateLockedState
{
  double v3 = [(DBKeybagMonitor *)self queue];
  BSDispatchQueueAssert();

  [(DBKeybagMonitor *)self setLockedState:(int)MKBGetDeviceLockState()];
  id v7 = (id)MKBGetDeviceLockStateInfo();
  id v4 = [v7 objectForKey:*MEMORY[0x263F55A40]];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v4 floatValue];
    [(DBKeybagMonitor *)self setBackoffInterval:v5];
  }
  v6 = [v7 objectForKey:*MEMORY[0x263F55A60]];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    -[DBKeybagMonitor setPermanentlyBlocked:](self, "setPermanentlyBlocked:", [v6 BOOLValue]);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (int)lockStateNotificationToken
{
  return self->_lockStateNotificationToken;
}

- (void)setLockStateNotificationToken:(int)a3
{
  self->_lockStateNotificationToken = a3;
}

- (int64_t)lockedState
{
  return self->_lockedState;
}

- (void)setLockedState:(int64_t)a3
{
  self->_lockedState = a3;
}

- (double)backoffInterval
{
  return self->_backoffInterval;
}

- (void)setBackoffInterval:(double)a3
{
  self->_backoffInterval = a3;
}

- (BOOL)permanentlyBlocked
{
  return self->_permanentlyBlocked;
}

- (void)setPermanentlyBlocked:(BOOL)a3
{
  self->_permanentlyBlocked = a3;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end