@interface ATXMemoryPressureMonitor
+ (id)sharedInstance;
- (ATXMemoryPressureMonitor)init;
- (unint64_t)_currentMemoryPressureType;
- (void)_currentMemoryPressureType;
- (void)_notifyObserversOfMemoryPressureType:(unint64_t)a3;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation ATXMemoryPressureMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_observer;
  return v2;
}

uint64_t __42__ATXMemoryPressureMonitor_sharedInstance__block_invoke()
{
  sharedInstance_observer = objc_alloc_init(ATXMemoryPressureMonitor);
  return MEMORY[0x1F41817F8]();
}

- (ATXMemoryPressureMonitor)init
{
  v15.receiver = self;
  v15.super_class = (Class)ATXMemoryPressureMonitor;
  id v2 = [(ATXMemoryPressureMonitor *)&v15 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ATXMemoryPressureMonitor.internalQueue", v3);
    v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    v7 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v6;

    dispatch_source_t v8 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 7uLL, *((dispatch_queue_t *)v2 + 1));
    v9 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v8;

    objc_initWeak(&location, v2);
    v10 = *((void *)v2 + 2);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __32__ATXMemoryPressureMonitor_init__block_invoke;
    v12[3] = &unk_1E68A30E8;
    objc_copyWeak(&v13, &location);
    dispatch_source_set_event_handler(v10, v12);
    dispatch_resume(*((dispatch_object_t *)v2 + 2));
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return (ATXMemoryPressureMonitor *)v2;
}

void __32__ATXMemoryPressureMonitor_init__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained _currentMemoryPressureType];

  id v4 = objc_loadWeakRetained(v1);
  [v4 _notifyObserversOfMemoryPressureType:v3];
}

- (void)dealloc
{
  dispatch_suspend((dispatch_object_t)self->_memoryMonitoringSource);
  v3.receiver = self;
  v3.super_class = (Class)ATXMemoryPressureMonitor;
  [(ATXMemoryPressureMonitor *)&v3 dealloc];
}

- (unint64_t)_currentMemoryPressureType
{
  uintptr_t data = dispatch_source_get_data((dispatch_source_t)self->_memoryMonitoringSource);
  if (data == 1) {
    return 0;
  }
  uint64_t v3 = data;
  if (data != 4)
  {
    if (data == 2) {
      return 1;
    }
    v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(ATXMemoryPressureMonitor *)v3 _currentMemoryPressureType];
    }
  }
  return 2;
}

- (void)_notifyObserversOfMemoryPressureType:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = ATXMemoryPressureTypeToString(a3);
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_1D0F2B000, v5, OS_LOG_TYPE_DEFAULT, "ATXMemoryPressureMonitor: received memory pressure warning of type: %@", buf, 0xCu);
  }
  v7 = self;
  objc_sync_enter(v7);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  dispatch_source_t v8 = v7->_observers;
  uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (a3 - 1 <= 1 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v12 handleMemoryPressure];
        }
        if (objc_opt_respondsToSelector()) {
          [v12 handleMemoryPressureOfType:a3];
        }
      }
      uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

- (void)registerObserver:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_observers addObject:v5];
  objc_sync_exit(v4);
}

- (void)unregisterObserver:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_observers removeObject:v5];
  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_memoryMonitoringSource, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (void)_currentMemoryPressureType
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D0F2B000, a2, OS_LOG_TYPE_FAULT, "ATXMemoryPressureMonitor could not convert %lu to ATXMemoryPressureType", (uint8_t *)&v2, 0xCu);
}

@end