@interface _EMActivityRegistryObserverWrapper
- (EMActivityObserver)observer;
- (EMActivityRegistry)registry;
- (EMRemoteConnection)connection;
- (NSArray)activities;
- (_EMActivityRegistryObserverWrapper)initWithConnection:(id)a3 registry:(id)a4 observer:(id)a5;
- (id)activityWithObjectID:(id)a3;
- (void)_resetWithCancelable:(id)a3;
- (void)_startObservingIfNecessary;
- (void)activityWithID:(id)a3 finishedWithError:(id)a4;
- (void)activityWithID:(id)a3 setCompletedCount:(id)a4 totalCount:(id)a5;
- (void)activityWithID:(id)a3 setUserInfoObject:(id)a4 forKey:(id)a5;
- (void)cancel;
- (void)dealloc;
- (void)removedActivityWithID:(id)a3;
- (void)setActivities:(id)a3;
- (void)setConnection:(id)a3;
- (void)setObserver:(id)a3;
- (void)setRegistry:(id)a3;
- (void)startedActivity:(id)a3;
@end

@implementation _EMActivityRegistryObserverWrapper

- (void)setActivities:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  v34 = [(_EMActivityRegistryObserverWrapper *)self registry];
  v33 = [(_EMActivityRegistryObserverWrapper *)self observer];
  if (v34 && v33)
  {
    os_unfair_lock_lock(&self->_lock);
    v4 = self->_trackedActivities;
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    trackedActivities = self->_trackedActivities;
    self->_trackedActivities = v5;

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v7 = v32;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v44 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          v12 = self->_trackedActivities;
          v13 = [v11 objectID];
          v14 = [(NSMutableDictionary *)v12 objectForKeyedSubscript:v13];
          LODWORD(v12) = v14 == 0;

          if (v12)
          {
            v15 = self->_trackedActivities;
            v16 = [v11 objectID];
            [(NSMutableDictionary *)v15 setObject:v11 forKeyedSubscript:v16];
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v8);
    }

    os_unfair_lock_unlock(&self->_lock);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v17 = v7;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v40 != v19) {
            objc_enumerationMutation(v17);
          }
          v21 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          v22 = [v21 objectID];
          v23 = [(NSMutableDictionary *)v4 objectForKeyedSubscript:v22];

          if (v23)
          {
            v24 = [v21 progress];
            v25 = [v21 error];
            if (v24) {
              objc_msgSend(v23, "setCompletedCount:totalCount:", objc_msgSend(v24, "completedUnitCount"), objc_msgSend(v24, "totalUnitCount"));
            }
            v26 = [v21 finished];

            if (v26) {
              [v23 finishWithError:v25];
            }
            v27 = [v21 objectID];
            [(NSMutableDictionary *)v4 setObject:0 forKeyedSubscript:v27];
          }
          else
          {
            [v33 activityRegistry:v34 startedActivity:v21];
          }
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v18);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v28 = [(NSMutableDictionary *)v4 allValues];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v36;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v36 != v30) {
            objc_enumerationMutation(v28);
          }
          [*(id *)(*((void *)&v35 + 1) + 8 * k) finishWithError:0];
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v35 objects:v47 count:16];
      }
      while (v29);
    }
  }
}

- (EMActivityRegistry)registry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);
  return (EMActivityRegistry *)WeakRetained;
}

- (EMActivityObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (EMActivityObserver *)WeakRetained;
}

- (void)_startObservingIfNecessary
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_observerCancelable)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F60D40]);
    objc_storeStrong((id *)&self->_observerCancelable, v4);
    v5 = [(EMRemoteConnection *)self->_connection remoteObjectProxy];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64___EMActivityRegistryObserverWrapper__startObservingIfNecessary__block_invoke;
    v7[3] = &unk_1E63E2820;
    id v6 = v4;
    id v8 = v6;
    uint64_t v9 = self;
    [v5 registerActivityObserver:self completion:v7];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  [(EFCancelable *)self->_observerCancelable cancel];
  v3.receiver = self;
  v3.super_class = (Class)_EMActivityRegistryObserverWrapper;
  [(_EMActivityRegistryObserverWrapper *)&v3 dealloc];
}

- (void)cancel
{
}

- (void)_resetWithCancelable:(id)a3
{
  id v7 = (EFCancelable *)a3;
  os_unfair_lock_lock(&self->_lock);
  observerCancelable = self->_observerCancelable;
  if (!v7 || (BOOL v5 = observerCancelable == v7, observerCancelable = v7, v5))
  {
    [(EFCancelable *)observerCancelable cancel];
    id v6 = self->_observerCancelable;
    self->_observerCancelable = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_destroyWeak((id *)&self->_registry);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_trackedActivities, 0);
  objc_storeStrong((id *)&self->_observerCancelable, 0);
}

- (_EMActivityRegistryObserverWrapper)initWithConnection:(id)a3 registry:(id)a4 observer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)_EMActivityRegistryObserverWrapper;
  v12 = [(_EMActivityRegistryObserverWrapper *)&v24 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    objc_storeWeak((id *)&v13->_registry, v10);
    objc_storeWeak((id *)&v13->_observer, v11);
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    trackedActivities = v13->_trackedActivities;
    v13->_trackedActivities = v14;

    v13->_lock._os_unfair_lock_opaque = 0;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v13);
    connection = v13->_connection;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __75___EMActivityRegistryObserverWrapper_initWithConnection_registry_observer___block_invoke;
    v21[3] = &unk_1E63E2688;
    objc_copyWeak(&v22, &location);
    [(EMRemoteConnection *)connection addResetHandler:v21];
    id v17 = v13->_connection;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __75___EMActivityRegistryObserverWrapper_initWithConnection_registry_observer___block_invoke_2;
    v19[3] = &unk_1E63E2688;
    objc_copyWeak(&v20, &location);
    [(EMRemoteConnection *)v17 addRecoveryHandler:v19];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (NSArray)activities
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableDictionary *)self->_trackedActivities allValues];
  os_unfair_lock_unlock(p_lock);
  if (v4) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = v5;

  return v6;
}

- (id)activityWithObjectID:(id)a3
{
  id v4 = a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NSMutableDictionary *)self->_trackedActivities objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)startedActivity:(id)a3
{
  id v8 = a3;
  id v4 = [(_EMActivityRegistryObserverWrapper *)self registry];
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    trackedActivities = self->_trackedActivities;
    id v6 = [v8 objectID];
    [(NSMutableDictionary *)trackedActivities setObject:v8 forKeyedSubscript:v6];

    os_unfair_lock_unlock(&self->_lock);
    id v7 = [(_EMActivityRegistryObserverWrapper *)self observer];
    [v7 activityRegistry:v4 startedActivity:v8];
  }
}

- (void)activityWithID:(id)a3 setUserInfoObject:(id)a4 forKey:(id)a5
{
  id v10 = a4;
  id v8 = a5;
  id v9 = [(_EMActivityRegistryObserverWrapper *)self activityWithObjectID:a3];
  [v9 setUserInfoObject:v10 forKey:v8];
}

- (void)activityWithID:(id)a3 setCompletedCount:(id)a4 totalCount:(id)a5
{
  id v10 = a4;
  id v8 = a5;
  id v9 = [(_EMActivityRegistryObserverWrapper *)self activityWithObjectID:a3];
  objc_msgSend(v9, "setCompletedCount:totalCount:", objc_msgSend(v10, "integerValue"), objc_msgSend(v8, "integerValue"));
}

- (void)activityWithID:(id)a3 finishedWithError:(id)a4
{
  id v7 = a4;
  id v6 = [(_EMActivityRegistryObserverWrapper *)self activityWithObjectID:a3];
  [v6 finishWithError:v7];
}

- (void)removedActivityWithID:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableDictionary *)self->_trackedActivities setObject:0 forKeyedSubscript:v5];

  os_unfair_lock_unlock(p_lock);
}

- (EMRemoteConnection)connection
{
  return (EMRemoteConnection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConnection:(id)a3
{
}

- (void)setRegistry:(id)a3
{
}

- (void)setObserver:(id)a3
{
}

@end