@interface BMResourceContainerAvailabilityMonitor
+ (id)sharedMonitor;
- (BMResourceContainerAvailabilityMonitor)initWithQueue:(id)a3;
- (NSHashTable)observers;
- (void)addObserver:(id)a3 forContainerType:(unsigned __int8)a4;
- (void)removeObserver:(id)a3 forContainerType:(unsigned __int8)a4;
- (void)setObservers:(id)a3;
@end

@implementation BMResourceContainerAvailabilityMonitor

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken != -1) {
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedMonitor_sharedMonitor;
  return v2;
}

void __55__BMResourceContainerAvailabilityMonitor_sharedMonitor__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.BMResourceContainerAvailabilityMonitor.queue", v0);

  v1 = [[BMResourceContainerAvailabilityMonitor alloc] initWithQueue:v3];
  v2 = (void *)sharedMonitor_sharedMonitor;
  sharedMonitor_sharedMonitor = (uint64_t)v1;
}

- (BMResourceContainerAvailabilityMonitor)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BMResourceContainerAvailabilityMonitor;
  v6 = [(BMResourceContainerAvailabilityMonitor *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;
  }
  return v7;
}

- (void)addObserver:(id)a3 forContainerType:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = a3;
  if (v4 == 3)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    uint64_t v8 = [(BMResourceContainerAvailabilityMonitor *)self observers];
    v9 = [v8 allObjects];
    uint64_t v10 = [v9 count];

    if (!v10)
    {
      objc_super v11 = __biome_log_for_category(6);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1B30A0000, v11, OS_LOG_TYPE_DEFAULT, "First observer is connecting, starting UserVault monitoring session", v14, 2u);
      }

      [(BMResourceContainerAvailabilityMonitor *)self _startUserVaultMonitoringSession];
    }
    v12 = [(BMResourceContainerAvailabilityMonitor *)self observers];
    [v12 addObject:v6];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v13 = __biome_log_for_category(6);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[BMResourceContainerAvailabilityMonitor addObserver:forContainerType:](v13);
    }
  }
}

- (void)removeObserver:(id)a3 forContainerType:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = a3;
  if (v4 == 3)
  {
    os_unfair_lock_lock(&self->_lock);
    v7 = [(BMResourceContainerAvailabilityMonitor *)self observers];
    [v7 removeObject:v6];

    uint64_t v8 = [(BMResourceContainerAvailabilityMonitor *)self observers];
    v9 = [v8 allObjects];
    uint64_t v10 = [v9 count];

    if (!v10)
    {
      objc_super v11 = __biome_log_for_category(6);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1B30A0000, v11, OS_LOG_TYPE_DEFAULT, "Last observer is unsubscribing, cancelling UserVault monitoring session", v13, 2u);
      }

      [(BMResourceContainerAvailabilityMonitor *)self _stopUserVaultMonitoringSession];
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v12 = __biome_log_for_category(6);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[BMResourceContainerAvailabilityMonitor addObserver:forContainerType:](v12);
    }
  }
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
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)addObserver:(os_log_t)log forContainerType:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B30A0000, log, OS_LOG_TYPE_ERROR, "Attempting to monitor container availability for non-UserVault container, which is not supported", v1, 2u);
}

@end