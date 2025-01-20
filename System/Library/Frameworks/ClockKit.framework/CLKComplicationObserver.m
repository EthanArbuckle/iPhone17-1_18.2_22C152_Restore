@interface CLKComplicationObserver
+ (id)sharedObserver;
- (CLKClockComplicationCountSet)homeScreenComplicationCountSet;
- (CLKComplicationObserver)init;
- (void)addObserver:(id)a3;
- (void)addWakeSessionObserver:(id)a3;
- (void)complicationListDidChange;
- (void)reloadOrExtendForBundleID:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeWakeSessionObserver:(id)a3;
- (void)setHomeScreenComplicationCountSet:(id)a3;
- (void)wakeSessionWillBeginForBundleID:(id)a3;
- (void)wakeSessionWillEndForBundleID:(id)a3;
@end

@implementation CLKComplicationObserver

+ (id)sharedObserver
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__CLKComplicationObserver_sharedObserver__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedObserver_onceToken != -1) {
    dispatch_once(&sharedObserver_onceToken, block);
  }
  v2 = (void *)sharedObserver___observer;

  return v2;
}

uint64_t __41__CLKComplicationObserver_sharedObserver__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedObserver___observer;
  sharedObserver___observer = (uint64_t)v1;

  return MEMORY[0x270F9A758](v1, v2);
}

- (CLKComplicationObserver)init
{
  v8.receiver = self;
  v8.super_class = (Class)CLKComplicationObserver;
  uint64_t v2 = [(CLKComplicationObserver *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    wakeSessionObservers = v2->_wakeSessionObservers;
    v2->_wakeSessionObservers = (NSHashTable *)v3;

    uint64_t v5 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;
  }
  return v2;
}

- (void)addWakeSessionObserver:(id)a3
{
}

- (void)removeWakeSessionObserver:(id)a3
{
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)wakeSessionWillBeginForBundleID:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSHashTable *)self->_wakeSessionObservers allObjects];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v9++) complicationWillBeginWakeSessionForBundleIdentifier:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }
  v10 = [(NSHashTable *)self->_observers allObjects];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v16, "complicationWillBeginWakeSessionForBundleIdentifier:", v4, (void)v17);
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }
}

- (void)wakeSessionWillEndForBundleID:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSHashTable *)self->_wakeSessionObservers allObjects];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v9++) complicationWillEndWakeSessionForBundleIdentifier:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }
  v10 = [(NSHashTable *)self->_observers allObjects];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v16, "complicationWillEndWakeSessionForBundleIdentifier:", v4, (void)v17);
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }
}

- (void)reloadOrExtendForBundleID:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSHashTable *)self->_observers allObjects];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 complicationDidReloadOrExtendForBundleIdentifier:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)complicationListDidChange
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__CLKComplicationObserver_complicationListDidChange__block_invoke;
  block[3] = &unk_26440E580;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __52__CLKComplicationObserver_complicationListDidChange__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v1 = [*(id *)(*(void *)(a1 + 32) + 16) allObjects];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        if (objc_opt_respondsToSelector()) {
          [v6 complicationListDidChange];
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)setHomeScreenComplicationCountSet:(id)a3
{
  uint64_t v4 = (CLKClockComplicationCountSet *)[a3 copy];
  homeScreenComplicationCountSet = self->_homeScreenComplicationCountSet;
  self->_homeScreenComplicationCountSet = v4;

  [(CLKComplicationObserver *)self complicationListDidChange];
}

- (CLKClockComplicationCountSet)homeScreenComplicationCountSet
{
  return self->_homeScreenComplicationCountSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenComplicationCountSet, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_wakeSessionObservers, 0);
}

@end