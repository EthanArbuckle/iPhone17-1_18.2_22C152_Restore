@interface DBDisclosureMonitor
- (BOOL)active;
- (BOOL)markedSafe;
- (DBDisclosureMonitor)init;
- (NSHashTable)observers;
- (OS_dispatch_queue)callbackQueue;
- (void)_observersDisclosureMonitorDidChange;
- (void)addObserver:(id)a3;
- (void)markSafe;
- (void)removeObserver:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setMarkedSafe:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)turnFeaturesOff;
@end

@implementation DBDisclosureMonitor

- (DBDisclosureMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)DBDisclosureMonitor;
  v2 = [(DBDisclosureMonitor *)&v8 init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)Serial;

    uint64_t v5 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    v2->_markedSafe = [MEMORY[0x263F30E28] qaModeLockout];
  }
  return v2;
}

- (BOOL)active
{
  return 0;
}

- (void)turnFeaturesOff
{
  [(DBDisclosureMonitor *)self setMarkedSafe:1];
  [MEMORY[0x263F30E28] setConfirmedSafe:0];
  [(DBDisclosureMonitor *)self _observersDisclosureMonitorDidChange];
}

- (void)markSafe
{
  [(DBDisclosureMonitor *)self setMarkedSafe:1];
  [MEMORY[0x263F30E28] setConfirmedSafe:1];
  [(DBDisclosureMonitor *)self _observersDisclosureMonitorDidChange];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBDisclosureMonitor *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBDisclosureMonitor *)self observers];
  [v5 removeObject:v4];
}

- (void)_observersDisclosureMonitorDidChange
{
  v3 = [(DBDisclosureMonitor *)self callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__DBDisclosureMonitor__observersDisclosureMonitorDidChange__block_invoke;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_async(v3, block);
}

void __59__DBDisclosureMonitor__observersDisclosureMonitorDidChange__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  v3 = (void *)[v2 copy];

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
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) disclosureMonitorDidChangeActive:*(void *)(a1 + 32)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
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

- (BOOL)markedSafe
{
  return self->_markedSafe;
}

- (void)setMarkedSafe:(BOOL)a3
{
  self->_markedSafe = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end