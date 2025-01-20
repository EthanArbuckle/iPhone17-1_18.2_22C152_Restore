@interface INSAnalytics
+ (id)sharedAnalytics;
- (INSAnalyticsDataSource)dataSource;
- (NSHashTable)observers;
- (id)_init;
- (id)contextDictionaryForCommand:(id)a3;
- (id)contextDictionaryForError:(id)a3;
- (void)addObserver:(id)a3;
- (void)logEventWithType:(int64_t)a3 context:(id)a4 contextNoCopy:(BOOL)a5;
- (void)removeObserver:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation INSAnalytics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_dataSource);

  objc_storeStrong((id *)&self->_observerQueue, 0);
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setDataSource:(id)a3
{
}

- (INSAnalyticsDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (INSAnalyticsDataSource *)WeakRetained;
}

- (id)contextDictionaryForError:(id)a3
{
  id v4 = a3;
  v5 = [(INSAnalytics *)self dataSource];
  v6 = [v5 analytics:self contextDictionaryForError:v4];

  return v6;
}

- (id)contextDictionaryForCommand:(id)a3
{
  id v4 = a3;
  v5 = [(INSAnalytics *)self dataSource];
  v6 = [v5 analytics:self contextDictionaryForCommand:v4];

  return v6;
}

- (void)logEventWithType:(int64_t)a3 context:(id)a4 contextNoCopy:(BOOL)a5
{
  id v8 = a4;
  observerQueue = self->_observerQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__INSAnalytics_logEventWithType_context_contextNoCopy___block_invoke;
  v11[3] = &unk_26427E070;
  id v12 = v8;
  int64_t v13 = a3;
  v11[4] = self;
  BOOL v14 = a5;
  id v10 = v8;
  dispatch_async(observerQueue, v11);
}

void __55__INSAnalytics_logEventWithType_context_contextNoCopy___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) analytics:*(void *)(a1 + 32) needsToLogEventWithType:*(void *)(a1 + 48) context:*(void *)(a1 + 40) contextNoCopy:*(unsigned __int8 *)(a1 + 56)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__INSAnalytics_removeObserver___block_invoke;
  v7[3] = &unk_26427E2D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

void __31__INSAnalytics_removeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28__INSAnalytics_addObserver___block_invoke;
  v7[3] = &unk_26427E2D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

void __28__INSAnalytics_addObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)INSAnalytics;
  id v2 = [(INSAnalytics *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] hashTableWithWeakObjects];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("INSAnalyticsObserversQueue", 0);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (id)sharedAnalytics
{
  if (sharedAnalytics_onceToken != -1) {
    dispatch_once(&sharedAnalytics_onceToken, &__block_literal_global);
  }
  id v2 = (void *)sharedAnalytics_analytics;

  return v2;
}

uint64_t __31__INSAnalytics_sharedAnalytics__block_invoke()
{
  sharedAnalytics_analytics = [[INSAnalytics alloc] _init];

  return MEMORY[0x270F9A758]();
}

@end