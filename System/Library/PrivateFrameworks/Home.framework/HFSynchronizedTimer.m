@interface HFSynchronizedTimer
+ (id)sharedInstance;
- (HFSynchronizedTimer)init;
- (NSMapTable)observers;
- (NSTimer)activeTimer;
- (void)_timerDidFire;
- (void)_updateTimerState;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setActiveTimer:(id)a3;
@end

@implementation HFSynchronizedTimer

+ (id)sharedInstance
{
  if (_MergedGlobals_331 != -1) {
    dispatch_once(&_MergedGlobals_331, &__block_literal_global_3_36);
  }
  v2 = (void *)qword_26AB2FF48;
  return v2;
}

uint64_t __37__HFSynchronizedTimer_sharedInstance__block_invoke_2()
{
  v0 = objc_alloc_init(HFSynchronizedTimer);
  uint64_t v1 = qword_26AB2FF48;
  qword_26AB2FF48 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFSynchronizedTimer)init
{
  v6.receiver = self;
  v6.super_class = (Class)HFSynchronizedTimer;
  v2 = [(HFSynchronizedTimer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    observers = v2->_observers;
    v2->_observers = (NSMapTable *)v3;
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = [(HFSynchronizedTimer *)self observers];
  objc_super v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    objc_initWeak(&location, self);
    id v7 = objc_alloc(MEMORY[0x263F58170]);
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __35__HFSynchronizedTimer_addObserver___block_invoke;
    v13 = &unk_264098F70;
    objc_copyWeak(&v14, &location);
    v8 = (void *)[v7 initWithTargetObject:v4 finalizer:&v10];
    v9 = [(HFSynchronizedTimer *)self observers];
    [v9 setObject:v8 forKey:v4];

    [(HFSynchronizedTimer *)self _updateTimerState];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __35__HFSynchronizedTimer_addObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained removeObserver:a2];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = [(HFSynchronizedTimer *)self observers];
  [v5 removeObjectForKey:v4];

  [(HFSynchronizedTimer *)self _updateTimerState];
}

- (void)_updateTimerState
{
  uint64_t v3 = [(HFSynchronizedTimer *)self observers];
  uint64_t v4 = [v3 count];

  v5 = [(HFSynchronizedTimer *)self activeTimer];
  objc_super v6 = v5;
  if (v4)
  {

    if (!v6)
    {
      objc_initWeak(&location, self);
      id v7 = (void *)MEMORY[0x263EFFA20];
      uint64_t v9 = MEMORY[0x263EF8330];
      uint64_t v10 = 3221225472;
      uint64_t v11 = __40__HFSynchronizedTimer__updateTimerState__block_invoke;
      v12 = &unk_264093C20;
      objc_copyWeak(&v13, &location);
      v8 = [v7 scheduledTimerWithTimeInterval:1 repeats:&v9 block:1.0];
      -[HFSynchronizedTimer setActiveTimer:](self, "setActiveTimer:", v8, v9, v10, v11, v12);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [v5 invalidate];

    [(HFSynchronizedTimer *)self setActiveTimer:0];
  }
}

void __40__HFSynchronizedTimer__updateTimerState__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _timerDidFire];
}

- (void)_timerDidFire
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(HFSynchronizedTimer *)self observers];
  uint64_t v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) countdownTimerDidFire:self];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSTimer)activeTimer
{
  return self->_activeTimer;
}

- (void)setActiveTimer:(id)a3
{
}

- (NSMapTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_activeTimer, 0);
}

@end