@interface DBThermalMonitor
- (BOOL)isThermalBlocked;
- (DBThermalMonitor)init;
- (NSHashTable)observers;
- (NSNumber)suggestedFrameRateLimit;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)queue;
- (int)coldToken;
- (int)hotToken;
- (int64_t)level;
- (unint64_t)coldLevel;
- (unint64_t)hotLevel;
- (void)_queue_respondToCurrentThermalCondition;
- (void)_startListeningForThermalEvents;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setColdLevel:(unint64_t)a3;
- (void)setColdToken:(int)a3;
- (void)setHotLevel:(unint64_t)a3;
- (void)setHotToken:(int)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setThermalBlocked:(BOOL)a3;
@end

@implementation DBThermalMonitor

- (DBThermalMonitor)init
{
  v10.receiver = self;
  v10.super_class = (Class)DBThermalMonitor;
  v2 = [(DBThermalMonitor *)&v10 init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    v4 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = Serial;

    uint64_t v5 = BSDispatchQueueCreateSerial();
    v6 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v5;

    uint64_t v7 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    v8 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v7;

    *(void *)(v2 + 12) = -1;
    [v2 _startListeningForThermalEvents];
  }
  return (DBThermalMonitor *)v2;
}

- (void)dealloc
{
  if ([(DBThermalMonitor *)self hotToken] != -1) {
    notify_cancel([(DBThermalMonitor *)self hotToken]);
  }
  if ([(DBThermalMonitor *)self coldToken] != -1) {
    notify_cancel([(DBThermalMonitor *)self coldToken]);
  }
  v3.receiver = self;
  v3.super_class = (Class)DBThermalMonitor;
  [(DBThermalMonitor *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBThermalMonitor *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBThermalMonitor *)self observers];
  [v5 removeObject:v4];
}

- (NSNumber)suggestedFrameRateLimit
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  LOBYTE(v12) = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"FrameRateLimit", @"com.apple.carplay.internal", (Boolean *)&v12);
  if ((_BYTE)v12) {
    BOOL v4 = AppIntegerValue == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    int64_t v5 = [(DBThermalMonitor *)self level];
    if ((unint64_t)(v5 - 1) <= 2)
    {
      v6 = (void *)qword_2649B6D28[v5 - 1];
      goto LABEL_15;
    }
  }
  else
  {
    CFIndex v7 = AppIntegerValue;
    v8 = DBLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      CFIndex v13 = v7;
      _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "frameRateLimit preference is: %lu", (uint8_t *)&v12, 0xCu);
    }

    int64_t v10 = [(DBThermalMonitor *)self level];
    if (v10 == 3 || v10 == 2 || v10 == 1)
    {
      v6 = [NSNumber numberWithLong:v7];
      goto LABEL_15;
    }
  }
  v6 = 0;
LABEL_15:
  return (NSNumber *)v6;
}

- (void)_startListeningForThermalEvents
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_ERROR, "notify_register(hot) failed : status=%i", (uint8_t *)v2, 8u);
}

void __51__DBThermalMonitor__startListeningForThermalEvents__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = *((void *)WeakRetained + 4);
  notify_get_state(*((_DWORD *)WeakRetained + 3), (uint64_t *)WeakRetained + 4);
  if (v2 != *((void *)WeakRetained + 4))
  {
    uint64_t v3 = DBLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *((void *)WeakRetained + 4);
      int v5 = 134218240;
      uint64_t v6 = v2;
      __int16 v7 = 2048;
      uint64_t v8 = v4;
      _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "hot condition changed from %llu to %llu", (uint8_t *)&v5, 0x16u);
    }

    objc_msgSend(WeakRetained, "_queue_respondToCurrentThermalCondition");
  }
}

void __51__DBThermalMonitor__startListeningForThermalEvents__block_invoke_46(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = *((void *)WeakRetained + 5);
  notify_get_state(*((_DWORD *)WeakRetained + 4), (uint64_t *)WeakRetained + 5);
  if (v2 != *((void *)WeakRetained + 5))
  {
    uint64_t v3 = DBLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *((void *)WeakRetained + 5);
      int v5 = 134218240;
      uint64_t v6 = v2;
      __int16 v7 = 2048;
      uint64_t v8 = v4;
      _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "cold condition changed from %llu to %llu", (uint8_t *)&v5, 0x16u);
    }

    objc_msgSend(WeakRetained, "_queue_respondToCurrentThermalCondition");
  }
}

uint64_t __51__DBThermalMonitor__startListeningForThermalEvents__block_invoke_47(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_respondToCurrentThermalCondition");
}

- (void)_queue_respondToCurrentThermalCondition
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(DBThermalMonitor *)self queue];
  BSDispatchQueueAssert();

  int64_t level = self->_level;
  unint64_t hotLevel = self->_hotLevel;
  if (hotLevel <= 0x27)
  {
    if (hotLevel <= 0x1D)
    {
      if (hotLevel <= 0x13)
      {
        unint64_t coldLevel = self->_coldLevel;
        if (coldLevel <= 0x13) {
          uint64_t v8 = 0;
        }
        else {
          uint64_t v8 = -1;
        }
        if (coldLevel <= 0x1D) {
          int64_t v6 = v8;
        }
        else {
          int64_t v6 = -2;
        }
      }
      else
      {
        int64_t v6 = 1;
      }
    }
    else
    {
      int64_t v6 = 2;
    }
  }
  else
  {
    int64_t v6 = 3;
  }
  self->_int64_t level = v6;
  [(DBThermalMonitor *)self setThermalBlocked:hotLevel > 0x27];
  if (level != self->_level)
  {
    uint64_t v9 = DBLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v10 = NSStringFromDBThermalLevel(self->_level);
      int64_t v11 = self->_level;
      *(_DWORD *)buf = 138543618;
      v15 = v10;
      __int16 v16 = 1026;
      int v17 = v11;
      _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Thermal level changed to %{public}@ (%{public}d)", buf, 0x12u);
    }
    int v12 = [(DBThermalMonitor *)self callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__DBThermalMonitor__queue_respondToCurrentThermalCondition__block_invoke;
    block[3] = &unk_2649B3E90;
    block[4] = self;
    dispatch_async(v12, block);
  }
}

void __59__DBThermalMonitor__queue_respondToCurrentThermalCondition__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t v3 = (void *)[v2 copy];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) thermalMonitorLevelDidChange:*(void *)(a1 + 32)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (BOOL)isThermalBlocked
{
  return self->_thermalBlocked;
}

- (void)setThermalBlocked:(BOOL)a3
{
  self->_thermalBlocked = a3;
}

- (int64_t)level
{
  return self->_level;
}

- (int)hotToken
{
  return self->_hotToken;
}

- (void)setHotToken:(int)a3
{
  self->_hotToken = a3;
}

- (unint64_t)hotLevel
{
  return self->_hotLevel;
}

- (void)setHotLevel:(unint64_t)a3
{
  self->_unint64_t hotLevel = a3;
}

- (int)coldToken
{
  return self->_coldToken;
}

- (void)setColdToken:(int)a3
{
  self->_coldToken = a3;
}

- (unint64_t)coldLevel
{
  return self->_coldLevel;
}

- (void)setColdLevel:(unint64_t)a3
{
  self->_unint64_t coldLevel = a3;
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

- (NSHashTable)observers
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