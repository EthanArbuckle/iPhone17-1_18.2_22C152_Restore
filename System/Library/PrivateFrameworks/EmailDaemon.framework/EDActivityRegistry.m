@interface EDActivityRegistry
+ (OS_os_log)log;
- (EDActivityPersistence)activityPersistence;
- (EDActivityRegistry)initWithHookRegistry:(id)a3 activityPersistence:(id)a4;
- (EDPersistenceHookRegistry)hookRegistry;
- (void)activityWithID:(id)a3 finishedWithError:(id)a4;
- (void)activityWithID:(id)a3 setCompletedCount:(int64_t)a4 totalCount:(int64_t)a5;
- (void)activityWithID:(id)a3 setUserInfoObject:(id)a4 forKey:(id)a5;
- (void)registerActivityObserver:(id)a3 completion:(id)a4;
- (void)removedActivityWithID:(id)a3;
- (void)startedActivity:(id)a3;
@end

@implementation EDActivityRegistry

- (void)registerActivityObserver:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSMutableSet *)self->_observers containsObject:v6])
  {
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"Activity observer is already registered");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v8);
  }
  else
  {
    [(NSMutableSet *)self->_observers addObject:v6];
    os_unfair_lock_unlock(&self->_lock);
    id v8 = objc_alloc_init(MEMORY[0x1E4F60D40]);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__EDActivityRegistry_registerActivityObserver_completion___block_invoke;
    v10[3] = &unk_1E6BFF198;
    objc_copyWeak(&v12, &location);
    id v11 = v6;
    [v8 addCancelationBlock:v10];
    v9 = [(EDActivityPersistence *)self->_activityPersistence currentActivities];
    (*((void (**)(id, id, void *, void))v7 + 2))(v7, v8, v9, 0);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __58__EDActivityRegistry_registerActivityObserver_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 4);
  [*((id *)WeakRetained + 1) removeObject:*(void *)(a1 + 32)];
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 4);
}

- (EDActivityRegistry)initWithHookRegistry:(id)a3 activityPersistence:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EDActivityRegistry;
  v9 = [(EDActivityRegistry *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_hookRegistry, a3);
    [(EDPersistenceHookRegistry *)v10->_hookRegistry registerActivityHookResponder:v10];
    objc_storeStrong((id *)&v10->_activityPersistence, a4);
    id v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    observers = v10->_observers;
    v10->_observers = v11;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__EDActivityRegistry_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1) {
    dispatch_once(&log_onceToken_0, block);
  }
  v2 = (void *)log_log_0;

  return (OS_os_log *)v2;
}

void __25__EDActivityRegistry_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;
}

- (void)startedActivity:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = self->_observers;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "startedActivity:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)activityWithID:(id)a3 finishedWithError:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v9 = self->_observers;
  uint64_t v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "activityWithID:finishedWithError:", v6, v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)activityWithID:(id)a3 setUserInfoObject:(id)a4 forKey:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v12 = self->_observers;
  uint64_t v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "activityWithID:setUserInfoObject:forKey:", v8, v9, v10, (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)activityWithID:(id)a3 setCompletedCount:(int64_t)a4 totalCount:(int64_t)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v10 = [NSNumber numberWithLongLong:a4];
  uint64_t v11 = [NSNumber numberWithLongLong:a5];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v12 = self->_observers;
  uint64_t v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "activityWithID:setCompletedCount:totalCount:", v8, v10, v11, (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)removedActivityWithID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = self->_observers;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "removedActivityWithID:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
}

- (EDActivityPersistence)activityPersistence
{
  return self->_activityPersistence;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_activityPersistence, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end