@interface HKObserverBridge
- (BOOL)notifyObserversOfChangeForKey:(id)a3 newValue:(id)a4;
- (HKObserverBridge)init;
- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4;
- (void)dealloc;
- (void)registerObserver:(id)a3 forKey:(id)a4 newValueHandler:(id)a5;
- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4;
- (void)unregisterObserver:(id)a3 forKey:(id)a4;
@end

@implementation HKObserverBridge

- (HKObserverBridge)init
{
  v8.receiver = self;
  v8.super_class = (Class)HKObserverBridge;
  v2 = [(HKObserverBridge *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    observerBlocksByKeyByObserver = v2->_observerBlocksByKeyByObserver;
    v2->_observerBlocksByKeyByObserver = (NSMapTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    observersByKey = v2->_observersByKey;
    v2->_observersByKey = (NSMutableDictionary *)v5;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = self->_observersByKey;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v9 = [(NSMutableDictionary *)self->_observersByKey objectForKeyedSubscript:v8];
        v10 = [v9 bridgedObserver];
        [(HKObserverBridge *)self unregisterBridgedObserver:v10 forKey:v8];
      }
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  v11.receiver = self;
  v11.super_class = (Class)HKObserverBridge;
  [(HKObserverBridge *)&v11 dealloc];
}

- (void)registerObserver:(id)a3 forKey:(id)a4 newValueHandler:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v12 = [(NSMutableDictionary *)self->_observersByKey objectForKeyedSubscript:v9];

  if (!v12)
  {
    _HKInitializeLogging();
    long long v13 = HKLogInfrastructure();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);

    if (v14)
    {
      long long v15 = HKLogInfrastructure();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        id v42 = (id)objc_opt_class();
        __int16 v43 = 2114;
        id v44 = v9;
        id v16 = v42;
        _os_log_impl(&dword_19C023000, v15, OS_LOG_TYPE_INFO, "[%{public}@] Beginning observation for key %{public}@", buf, 0x16u);
      }
    }
    uint64_t v17 = [[HKObserverBridgeHandle alloc] initWithBridge:self];
    v18 = objc_alloc_init(_HKBridgedObserverSet);
    v19 = [(HKObserverBridge *)self makeAndRegisterBridgedObserverForKey:v9 handle:v17];
    [(_HKBridgedObserverSet *)v18 setBridgedObserver:v19];

    v20 = [NSString stringWithFormat:@"%@_%@", objc_opt_class(), v9];
    v21 = [HKObserverSet alloc];
    v22 = HKLogInfrastructure();
    v23 = [(HKObserverSet *)v21 initWithName:v20 loggingCategory:v22];
    [(_HKBridgedObserverSet *)v18 setObservers:v23];

    [(NSMutableDictionary *)self->_observersByKey setObject:v18 forKeyedSubscript:v9];
  }
  v24 = objc_alloc_init(_HKObservationBlock);
  objc_initWeak((id *)buf, v8);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __60__HKObserverBridge_registerObserver_forKey_newValueHandler___block_invoke;
  v38[3] = &unk_1E58C4330;
  objc_copyWeak(&v40, (id *)buf);
  id v25 = v10;
  id v39 = v25;
  [(_HKObservationBlock *)v24 setNewValueHandler:v38];
  v26 = [(NSMutableDictionary *)self->_observersByKey objectForKeyedSubscript:v9];
  v27 = [v26 observers];
  [v27 registerObserver:v24];

  v28 = [(NSMapTable *)self->_observerBlocksByKeyByObserver objectForKey:v8];
  LODWORD(v26) = v28 == 0;

  if (v26)
  {
    observerBlocksByKeyByObserver = self->_observerBlocksByKeyByObserver;
    v30 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMapTable *)observerBlocksByKeyByObserver setObject:v30 forKey:v8];
  }
  v31 = [(NSMapTable *)self->_observerBlocksByKeyByObserver objectForKey:v8];
  v32 = [v31 objectForKeyedSubscript:v9];
  BOOL v33 = v32 == 0;

  if (v33)
  {
    v34 = [MEMORY[0x1E4F1CA48] array];
    v35 = [(NSMapTable *)self->_observerBlocksByKeyByObserver objectForKey:v8];
    [v35 setObject:v34 forKeyedSubscript:v9];
  }
  v36 = [(NSMapTable *)self->_observerBlocksByKeyByObserver objectForKey:v8];
  v37 = [v36 objectForKeyedSubscript:v9];
  [v37 addObject:v24];

  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v40);
  objc_destroyWeak((id *)buf);
}

void __60__HKObserverBridge_registerObserver_forKey_newValueHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)unregisterObserver:(id)a3 forKey:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v9 = [(NSMapTable *)self->_observerBlocksByKeyByObserver objectForKey:v6];
  id v10 = [v9 objectForKeyedSubscript:v7];

  uint64_t v11 = [(NSMutableDictionary *)self->_observersByKey objectForKeyedSubscript:v7];
  long long v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    id v21 = v6;
    BOOL v14 = [(NSMapTable *)self->_observerBlocksByKeyByObserver objectForKey:v6];
    [v14 removeObjectForKey:v7];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v10;
    uint64_t v15 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v20 = [v12 observers];
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __46__HKObserverBridge_unregisterObserver_forKey___block_invoke;
          v23[3] = &unk_1E58BB9C8;
          v23[4] = self;
          id v24 = v7;
          id v25 = v12;
          [v20 unregisterObserver:v19 runIfLastObserver:v23];
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v16);
    }

    p_lock = &self->_lock;
    id v6 = v21;
  }
  os_unfair_lock_unlock(p_lock);
}

void __46__HKObserverBridge_unregisterObserver_forKey___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = HKLogInfrastructure();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);

  if (v3)
  {
    id v4 = HKLogInfrastructure();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)id v10 = 138543618;
      *(void *)&v10[4] = v5;
      *(_WORD *)&v10[12] = 2114;
      *(void *)&v10[14] = v6;
      id v7 = v5;
      _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_INFO, "[%{public}@] Ending observation for key %{public}@", v10, 0x16u);
    }
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "removeObjectForKey:", *(void *)(a1 + 40), *(_OWORD *)v10, *(void *)&v10[16], v11);
  id v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 48) bridgedObserver];
  [v8 unregisterBridgedObserver:v9 forKey:*(void *)(a1 + 40)];
}

- (BOOL)notifyObserversOfChangeForKey:(id)a3 newValue:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  id v8 = HKLogInfrastructure();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

  if (v9)
  {
    id v10 = HKLogInfrastructure();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v26 = (id)objc_opt_class();
      __int16 v27 = 2114;
      id v28 = v6;
      id v11 = v26;
      _os_log_impl(&dword_19C023000, v10, OS_LOG_TYPE_INFO, "[%{public}@] Observed change to %{public}@", buf, 0x16u);
    }
  }
  os_unfair_lock_lock(&self->_lock);
  long long v12 = [(NSMutableDictionary *)self->_observersByKey objectForKeyedSubscript:v6];
  BOOL v13 = [v12 observers];

  os_unfair_lock_unlock(&self->_lock);
  _HKInitializeLogging();
  BOOL v14 = HKLogInfrastructure();
  uint64_t v15 = v14;
  if (v13)
  {
    BOOL v16 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);

    if (v16)
    {
      uint64_t v17 = HKLogInfrastructure();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = objc_opt_class();
        uint64_t v19 = NSNumber;
        id v20 = v18;
        id v21 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
        *(_DWORD *)buf = 138543874;
        id v26 = v18;
        __int16 v27 = 2114;
        id v28 = v21;
        __int16 v29 = 2114;
        id v30 = v6;
        _os_log_impl(&dword_19C023000, v17, OS_LOG_TYPE_INFO, "[%{public}@] Notifying %{public}@ observers of key %{public}@", buf, 0x20u);
      }
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __59__HKObserverBridge_notifyObserversOfChangeForKey_newValue___block_invoke;
    v23[3] = &unk_1E58C4358;
    id v24 = v7;
    [v13 notifyObservers:v23];
    uint64_t v15 = v24;
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    -[HKObserverBridge notifyObserversOfChangeForKey:newValue:]((uint64_t)self, (uint64_t)v6, v15);
  }

  return v13 != 0;
}

void __59__HKObserverBridge_notifyObserversOfChangeForKey_newValue___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 newValueHandler];
  v3[2](v3, *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersByKey, 0);

  objc_storeStrong((id *)&self->_observerBlocksByKeyByObserver, 0);
}

- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4
{
  return 0;
}

- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)notifyObserversOfChangeForKey:(NSObject *)a3 newValue:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  id v5 = v7;
  _os_log_error_impl(&dword_19C023000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Found no observer set for key %{public}@", (uint8_t *)&v6, 0x16u);
}

@end