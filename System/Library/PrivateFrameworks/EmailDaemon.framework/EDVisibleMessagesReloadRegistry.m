@interface EDVisibleMessagesReloadRegistry
+ (id)log;
- (EDVisibleMessagesReloadRegistry)init;
- (id)addVisibleMessagesObserver:(id)a3;
- (void)_reloadVisibleMessages;
- (void)_scheduleVisibleMessageReload;
- (void)dealloc;
@end

@implementation EDVisibleMessagesReloadRegistry

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__EDVisibleMessagesReloadRegistry_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_102 != -1) {
    dispatch_once(&log_onceToken_102, block);
  }
  v2 = (void *)log_log_102;

  return v2;
}

void __38__EDVisibleMessagesReloadRegistry_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_102;
  log_log_102 = (uint64_t)v1;
}

- (EDVisibleMessagesReloadRegistry)init
{
  v22.receiver = self;
  v22.super_class = (Class)EDVisibleMessagesReloadRegistry;
  v2 = [(EDVisibleMessagesReloadRegistry *)&v22 init];
  id v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
    v8 = dispatch_queue_create("com.apple.EDVisibleMessagesReloadRegistry.notify", v7);

    uint64_t v9 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.EDVisibleMessagesReloadRegistry.observation"];
    observationScheduler = v3->_observationScheduler;
    v3->_observationScheduler = (EFAssertableScheduler *)v9;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v3);
    v11 = (const char *)[(id)*MEMORY[0x1E4F73A38] UTF8String];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __39__EDVisibleMessagesReloadRegistry_init__block_invoke;
    handler[3] = &unk_1E6C07B08;
    objc_copyWeak(&v20, &location);
    notify_register_dispatch(v11, &v3->_notifyToken, v8, handler);
    id v12 = objc_alloc(MEMORY[0x1E4F60D50]);
    v13 = v3->_observationScheduler;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __39__EDVisibleMessagesReloadRegistry_init__block_invoke_2;
    v17[3] = &unk_1E6C05218;
    objc_copyWeak(&v18, &location);
    uint64_t v14 = [v12 initWithTimeInterval:v13 scheduler:0 startAfter:v17 block:30.0];
    reloadDebouncer = v3->_reloadDebouncer;
    v3->_reloadDebouncer = (EFDebouncer *)v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __39__EDVisibleMessagesReloadRegistry_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _scheduleVisibleMessageReload];
}

void __39__EDVisibleMessagesReloadRegistry_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadVisibleMessages];
}

- (void)dealloc
{
  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)EDVisibleMessagesReloadRegistry;
  [(EDVisibleMessagesReloadRegistry *)&v3 dealloc];
}

- (id)addVisibleMessagesObserver:(id)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, a3);
  id v4 = objc_alloc_init(MEMORY[0x1E4F60D40]);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, self);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __62__EDVisibleMessagesReloadRegistry_addVisibleMessagesObserver___block_invoke;
  id v12 = &unk_1E6C03410;
  objc_copyWeak(&v13, &from);
  objc_copyWeak(&v14, &location);
  [v4 addCancelationBlock:&v9];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  observers = self->_observers;
  id v7 = objc_loadWeakRetained(&location);
  -[NSHashTable addObject:](observers, "addObject:", v7, v9, v10, v11, v12);

  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v4;
}

void __62__EDVisibleMessagesReloadRegistry_addVisibleMessagesObserver___block_invoke(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_super v3 = WeakRetained + 2;
    v6 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 2);
    id v4 = *(void **)&v6[4]._os_unfair_lock_opaque;
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    [v4 removeObject:v5];

    os_unfair_lock_unlock(v3);
    id WeakRetained = v6;
  }
}

- (void)_scheduleVisibleMessageReload
{
}

- (void)_reloadVisibleMessages
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSHashTable *)self->_observers allObjects];
  os_unfair_lock_unlock(p_lock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "reload", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadDebouncer, 0);
  objc_storeStrong((id *)&self->_observationScheduler, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end