@interface HDAssertionManager
+ (id)_sharedBudgetTimerQueue;
- (BOOL)hasActiveAssertion:(id)a3;
- (BOOL)hasActiveAssertionForIdentifier:(id)a3;
- (BOOL)takeAssertion:(id)a3;
- (BOOL)takeAssertion:(id)a3 preNotificationBlock:(id)a4;
- (HDAssertionManager)init;
- (OS_dispatch_queue)budgetTimerQueue;
- (id)activeAssertionsForIdentifier:(id)a3;
- (id)allAssertionsForIdentifier:(id)a3;
- (id)ownerIdentifiersForAssertionIdentifier:(id)a3;
- (void)_budgetConsumptionTimerDidFire;
- (void)_lock_consumeBudgetsThenResetTimerWithIntermediateBlock:(uint64_t)a1;
- (void)_lock_consumeBudgetsThroughTime:(uint64_t)a1;
- (void)_lock_enumerateActiveAssertionsWithIdentifier:(void *)a3 handler:;
- (void)_lock_releaseAssertion:(uint64_t)a1;
- (void)_lock_resumeBudgetConsumption;
- (void)_lock_setBudgetConsumptionTimerWithStartTime:(uint64_t)a1;
- (void)_lock_suspendBudgetConsumption;
- (void)_postNotification:(void *)a3 forAssertion:;
- (void)_releaseAssertion:(id)a3;
- (void)addObserver:(id)a3 forAssertionIdentifier:(id)a4 queue:(id)a5;
- (void)dealloc;
- (void)invalidate;
- (void)removeObserver:(id)a3;
- (void)removeObserver:(id)a3 forAssertionIdentifier:(id)a4;
- (void)resumeBudgetConsumption;
- (void)suspendBudgetConsumption;
@end

@implementation HDAssertionManager

- (void)_releaseAssertion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDAssertionManager _lock_releaseAssertion:]((uint64_t)self, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_releaseAssertion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    if (!*(unsigned char *)(a1 + 40))
    {
      v4 = [v3 assertionIdentifier];
      uint64_t v5 = [*(id *)(a1 + 24) objectForKeyedSubscript:v4];
      if (v5)
      {
        v6 = (void *)v5;
        id v7 = *(id *)(v5 + 16);
        uint64_t v8 = [v7 count];
        [v7 removeObject:v3];
        uint64_t v9 = [v7 count];
        if (v9 == v8)
        {
          _HKInitializeLogging();
          v10 = HKLogAssertions();
          BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

          if (v11)
          {
            v12 = HKLogAssertions();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
              [(HDAssertionManager *)(uint64_t)v4 _lock_releaseAssertion:v12];
            }
          }
        }
        if (!v9)
        {
          [*(id *)(a1 + 24) removeObjectForKey:v4];
          if (![*(id *)(a1 + 24) count])
          {
            v13 = *(void **)(a1 + 24);
            *(void *)(a1 + 24) = 0;
          }
        }
        v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __45__HDAssertionManager__lock_releaseAssertion___block_invoke;
        v15[3] = &unk_2643D4818;
        v15[4] = a1;
        id v16 = v3;
        [v14 notifyObservers:v15];

        -[HDAssertionManager _postNotification:forAssertion:](a1, @"HDAssertionManagerAssertionReturnedNotification", v4);
      }
    }
  }
}

- (BOOL)takeAssertion:(id)a3 preNotificationBlock:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    if (!self->_assertionRecordsByIdentifier)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      assertionRecordsByIdentifier = self->_assertionRecordsByIdentifier;
      self->_assertionRecordsByIdentifier = v10;
    }
    v12 = [v6 assertionIdentifier];
    uint64_t v13 = [v6 _takeWithManager:self];
    BOOL v9 = v13 == 2;
    if (v13 != 2)
    {
      uint64_t v23 = v13;
      _HKInitializeLogging();
      v24 = HKLogAssertions();
      v25 = v24;
      if (v23 == 3)
      {
        BOOL v26 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);

        if (!v26)
        {
LABEL_27:
          os_unfair_lock_unlock(p_lock);
LABEL_28:

          goto LABEL_29;
        }
        v25 = HKLogAssertions();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          v38 = v12;
          __int16 v39 = 2114;
          id v40 = v6;
          _os_log_impl(&dword_21BFB4000, v25, OS_LOG_TYPE_INFO, "%{public}@: Cannot retake invalidated assertion %{public}@", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v38 = v12;
        __int16 v39 = 2114;
        id v40 = v6;
        __int16 v41 = 2048;
        uint64_t v42 = v23;
        _os_log_error_impl(&dword_21BFB4000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Unexpected state for assertion %{public}@: %ld", buf, 0x20u);
      }

      goto LABEL_27;
    }
    v14 = [(NSMutableDictionary *)self->_assertionRecordsByIdentifier objectForKeyedSubscript:v12];
    if (v14
      || (v14 = -[_HDAssertionRecord initWithAssertionIdentifier:]([_HDAssertionRecord alloc], v12),
          v15 = self->_assertionRecordsByIdentifier,
          [v6 assertionIdentifier],
          id v16 = objc_claimAutoreleasedReturnValue(),
          [(NSMutableDictionary *)v15 setObject:v14 forKeyedSubscript:v16],
          v16,
          v14))
    {
      v17 = (void *)v14[2];
    }
    else
    {
      v17 = 0;
    }
    int v18 = [v17 containsObject:v6];
    char v19 = v18;
    v30 = v12;
    if (v18)
    {
      _HKInitializeLogging();
      v20 = HKLogAssertions();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);

      if (!v21) {
        goto LABEL_20;
      }
      v22 = HKLogAssertions();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v38 = v30;
        __int16 v39 = 2114;
        id v40 = v6;
        _os_log_impl(&dword_21BFB4000, v22, OS_LOG_TYPE_INFO, "%{public}@: Assertion %{public}@ already taken", buf, 0x16u);
      }
    }
    else
    {
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __57__HDAssertionManager_takeAssertion_preNotificationBlock___block_invoke;
      v34[3] = &unk_2643D45C8;
      v35 = v14;
      id v27 = v6;
      id v36 = v27;
      -[HDAssertionManager _lock_consumeBudgetsThenResetTimerWithIntermediateBlock:]((uint64_t)self, v34);
      v28 = [(NSMutableDictionary *)self->_observerSetsByAssertionIdentifier objectForKeyedSubscript:v12];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __57__HDAssertionManager_takeAssertion_preNotificationBlock___block_invoke_2;
      v31[3] = &unk_2643D47F0;
      v33 = sel_assertionManager_assertionTaken_;
      v31[4] = self;
      id v32 = v27;
      [v28 notifyObservers:v31];

      v22 = v35;
    }

LABEL_20:
    os_unfair_lock_unlock(&self->_lock);
    v12 = v30;
    if ((v19 & 1) == 0)
    {
      if (v7) {
        v7[2](v7);
      }
      -[HDAssertionManager _postNotification:forAssertion:]((uint64_t)self, @"HDAssertionManagerAssertionTakenNotification", v30);
    }
    goto LABEL_28;
  }
  os_unfair_lock_unlock(&self->_lock);
  BOOL v9 = 0;
LABEL_29:

  return v9;
}

- (BOOL)hasActiveAssertion:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = [v4 assertionIdentifier];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__HDAssertionManager_hasActiveAssertion___block_invoke;
  v8[3] = &unk_2643D47A0;
  id v6 = v4;
  id v9 = v6;
  v10 = &v11;
  -[HDAssertionManager _lock_enumerateActiveAssertionsWithIdentifier:handler:]((uint64_t)self, v5, v8);

  os_unfair_lock_unlock(&self->_lock);
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

- (void)_lock_enumerateActiveAssertionsWithIdentifier:(void *)a3 handler:
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    id v7 = [*(id *)(a1 + 24) objectForKeyedSubscript:v5];
    uint64_t v8 = v7;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    if (v7) {
      id v7 = (void *)v7[2];
    }
    id v9 = [v7 objectEnumerator];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
LABEL_6:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        char v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        if ([v14 state] == 2)
        {
          char v15 = 0;
          v6[2](v6, v14, &v15);
          if (v15) {
            break;
          }
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v11) {
            goto LABEL_6;
          }
          break;
        }
      }
    }
  }
}

void __41__HDAssertionManager_hasActiveAssertion___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v14 = a2;
  id v5 = [*(id *)(a1 + 32) ownerIdentifier];
  uint64_t v6 = [v14 ownerIdentifier];
  if (v5 == (void *)v6)
  {

    uint64_t v13 = v14;
    goto LABEL_6;
  }
  id v7 = (void *)v6;
  uint64_t v8 = [v14 ownerIdentifier];
  if (!v8)
  {

    uint64_t v13 = v14;
    goto LABEL_8;
  }
  id v9 = (void *)v8;
  uint64_t v10 = [*(id *)(a1 + 32) ownerIdentifier];
  uint64_t v11 = [v14 ownerIdentifier];
  int v12 = [v10 isEqualToString:v11];

  uint64_t v13 = v14;
  if (v12)
  {
LABEL_6:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
LABEL_8:
}

- (void)_postNotification:(void *)a3 forAssertion:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__HDAssertionManager__postNotification_forAssertion___block_invoke;
    block[3] = &unk_2643D4680;
    id v9 = v5;
    uint64_t v10 = a1;
    id v11 = v6;
    dispatch_async(v7, block);
  }
}

- (void)_lock_consumeBudgetsThenResetTimerWithIntermediateBlock:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v7 = v3;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    HKMachAbsoluteTimeGetCurrent();
    double v5 = v4;
    int v6 = *(unsigned __int8 *)(a1 + 41);
    if (*(unsigned char *)(a1 + 41)) {
      -[HDAssertionManager _lock_consumeBudgetsThroughTime:](a1, v4);
    }
    id v3 = v7;
    if (v7)
    {
      (*((void (**)(id))v7 + 2))(v7);
      id v3 = v7;
    }
    if (v6)
    {
      -[HDAssertionManager _lock_setBudgetConsumptionTimerWithStartTime:](a1, v5);
      id v3 = v7;
    }
  }
}

uint64_t __57__HDAssertionManager_takeAssertion_preNotificationBlock___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    v1 = (void *)v1[2];
  }
  return [v1 addObject:*(void *)(a1 + 40)];
}

- (BOOL)takeAssertion:(id)a3
{
  return [(HDAssertionManager *)self takeAssertion:a3 preNotificationBlock:0];
}

void __53__HDAssertionManager__postNotification_forAssertion___block_invoke(void *a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v7 = @"HDAssertionManagerAssertionKey";
  v8[0] = v5;
  int v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v2 postNotificationName:v3 object:v4 userInfo:v6];
}

uint64_t __45__HDAssertionManager__lock_releaseAssertion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assertionManager:*(void *)(a1 + 32) assertionInvalidated:*(void *)(a1 + 40)];
}

void __57__HDAssertionManager_takeAssertion_preNotificationBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assertionManager:*(void *)(a1 + 32) assertionTaken:*(void *)(a1 + 40)];
  }
}

- (HDAssertionManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)HDAssertionManager;
  v2 = [(HDAssertionManager *)&v11 init];
  id v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = HKCreateSerialDispatchQueue();
    notificationQueue = v3->_notificationQueue;
    v3->_notificationQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = +[HDAssertionManager _sharedBudgetTimerQueue]();
    budgetTimerQueue = v3->_budgetTimerQueue;
    v3->_budgetTimerQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    observerSetsByAssertionIdentifier = v3->_observerSetsByAssertionIdentifier;
    v3->_observerSetsByAssertionIdentifier = v8;

    v3->_consumeBudgets = 0;
  }
  return v3;
}

+ (id)_sharedBudgetTimerQueue
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__HDAssertionManager__sharedBudgetTimerQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = v0;
  if (_sharedBudgetTimerQueue_onceToken != -1) {
    dispatch_once(&_sharedBudgetTimerQueue_onceToken, block);
  }
  v1 = (void *)_sharedBudgetTimerQueue_queue;

  return v1;
}

- (void)dealloc
{
  [(HDAssertionManager *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HDAssertionManager;
  [(HDAssertionManager *)&v3 dealloc];
}

uint64_t __45__HDAssertionManager__sharedBudgetTimerQueue__block_invoke()
{
  _sharedBudgetTimerQueue_queue = HKCreateSerialDispatchQueue();

  return MEMORY[0x270F9A758]();
}

- (BOOL)hasActiveAssertionForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  os_unfair_lock_lock(&self->_lock);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__HDAssertionManager_hasActiveAssertionForIdentifier___block_invoke;
  v7[3] = &unk_2643D4778;
  v7[4] = &v8;
  -[HDAssertionManager _lock_enumerateActiveAssertionsWithIdentifier:handler:]((uint64_t)self, v4, v7);
  os_unfair_lock_unlock(&self->_lock);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __54__HDAssertionManager_hasActiveAssertionForIdentifier___block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

- (id)activeAssertionsForIdentifier:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  os_unfair_lock_lock(&self->_lock);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__HDAssertionManager_activeAssertionsForIdentifier___block_invoke;
  v10[3] = &unk_2643D47C8;
  id v11 = v6;
  id v7 = v6;
  -[HDAssertionManager _lock_enumerateActiveAssertionsWithIdentifier:handler:]((uint64_t)self, v5, v10);

  os_unfair_lock_unlock(&self->_lock);
  uint64_t v8 = (void *)[v7 copy];

  return v8;
}

uint64_t __52__HDAssertionManager_activeAssertionsForIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)allAssertionsForIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(NSMutableDictionary *)self->_assertionRecordsByIdentifier objectForKeyedSubscript:v5];

  if (v6) {
    id v7 = (void *)v6[2];
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  id v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = [v8 allObjects];

  id v11 = [v9 setWithArray:v10];

  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (id)ownerIdentifiersForAssertionIdentifier:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  id v6 = [v4 set];
  os_unfair_lock_lock(&self->_lock);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__HDAssertionManager_ownerIdentifiersForAssertionIdentifier___block_invoke;
  v10[3] = &unk_2643D47C8;
  id v11 = v6;
  id v7 = v6;
  -[HDAssertionManager _lock_enumerateActiveAssertionsWithIdentifier:handler:]((uint64_t)self, v5, v10);

  os_unfair_lock_unlock(&self->_lock);
  id v8 = (void *)[v7 copy];

  return v8;
}

void __61__HDAssertionManager_ownerIdentifiersForAssertionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 ownerIdentifier];
  [v2 addObject:v3];
}

- (void)resumeBudgetConsumption
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDAssertionManager _lock_resumeBudgetConsumption]((uint64_t)self);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_resumeBudgetConsumption
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    if (!*(unsigned char *)(a1 + 41))
    {
      *(unsigned char *)(a1 + 41) = 1;
      HKMachAbsoluteTimeGetCurrent();
      -[HDAssertionManager _lock_setBudgetConsumptionTimerWithStartTime:](a1, v2);
    }
  }
}

- (void)suspendBudgetConsumption
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDAssertionManager _lock_suspendBudgetConsumption]((uint64_t)self);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_suspendBudgetConsumption
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    if (*(unsigned char *)(a1 + 41))
    {
      *(unsigned char *)(a1 + 41) = 0;
      HKMachAbsoluteTimeGetCurrent();
      -[HDAssertionManager _lock_consumeBudgetsThroughTime:](a1, v2);
    }
  }
}

- (void)addObserver:(id)a3 forAssertionIdentifier:(id)a4 queue:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    uint64_t v10 = [(NSMutableDictionary *)self->_observerSetsByAssertionIdentifier objectForKeyedSubscript:v8];
    if (!v10)
    {
      id v11 = objc_alloc(MEMORY[0x263F0A5A8]);
      int v12 = HKLogAssertions();
      uint64_t v10 = (void *)[v11 initWithName:v8 loggingCategory:v12];

      [(NSMutableDictionary *)self->_observerSetsByAssertionIdentifier setObject:v10 forKeyedSubscript:v8];
    }
    [v10 registerObserver:v13 queue:v9];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeObserver:(id)a3 forAssertionIdentifier:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  id v9 = [(NSMutableDictionary *)self->_observerSetsByAssertionIdentifier objectForKeyedSubscript:v7];

  [v9 unregisterObserver:v8];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_observerSetsByAssertionIdentifier;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        uint64_t v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_observerSetsByAssertionIdentifier, "objectForKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * v9), (void)v11);
        [v10 unregisterObserver:v4];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)invalidate
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v5 = [(NSMutableDictionary *)self->_assertionRecordsByIdentifier allValues];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v36;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v36 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v35 + 1) + 8 * v9);
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          if (v10) {
            long long v11 = *(void **)(v10 + 16);
          }
          else {
            long long v11 = 0;
          }
          long long v12 = [v11 objectEnumerator];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v40 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v32;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v32 != v15) {
                  objc_enumerationMutation(v12);
                }
                [v3 addObject:*(void *)(*((void *)&v31 + 1) + 8 * i)];
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v40 count:16];
            }
            while (v14);
          }

          ++v9;
        }
        while (v9 != v7);
        uint64_t v17 = [v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
        uint64_t v7 = v17;
      }
      while (v17);
    }

    assertionRecordsByIdentifier = self->_assertionRecordsByIdentifier;
    self->_assertionRecordsByIdentifier = 0;

    observerSetsByAssertionIdentifier = self->_observerSetsByAssertionIdentifier;
    self->_observerSetsByAssertionIdentifier = 0;

    budgetConsumptionTimer = self->_budgetConsumptionTimer;
    p_lock = &self->_lock;
    if (budgetConsumptionTimer)
    {
      dispatch_source_cancel(budgetConsumptionTimer);
      uint64_t v21 = self->_budgetConsumptionTimer;
      self->_budgetConsumptionTimer = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v22 = v3;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * j) _invalidateAndRelease:0];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v24);
  }
}

- (void)_budgetConsumptionTimerDidFire
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a1)
  {
    double v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    _HKInitializeLogging();
    id v3 = HKLogAssertions();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);

    if (v4)
    {
      id v5 = HKLogAssertions();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v6 = 138543362;
        uint64_t v7 = a1;
        _os_log_impl(&dword_21BFB4000, v5, OS_LOG_TYPE_INFO, "%{public}@: Budget Consumption timer fired.", (uint8_t *)&v6, 0xCu);
      }
    }
    -[HDAssertionManager _lock_consumeBudgetsThenResetTimerWithIntermediateBlock:](a1, 0);
    os_unfair_lock_unlock(v2);
  }
}

- (void)_lock_setBudgetConsumptionTimerWithStartTime:(uint64_t)a1
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    BOOL v4 = [*(id *)(a1 + 24) allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v34;
      double v8 = 1.79769313e308;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v34 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v33 + 1) + 8 * v9);
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          if (v10) {
            long long v11 = *(void **)(v10 + 16);
          }
          else {
            long long v11 = 0;
          }
          long long v12 = [v11 objectEnumerator];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v30;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v30 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
                [v17 remainingBudget];
                if (v8 >= v18) {
                  double v8 = v18;
                }
                [v17 _setBudgetIntervalStartTime:a2];
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
            }
            while (v14);
          }

          ++v9;
        }
        while (v9 != v6);
        uint64_t v19 = [v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
        uint64_t v6 = v19;
      }
      while (v19);

      if (v8 < 1.79769313e308)
      {
        v20 = *(NSObject **)(a1 + 48);
        if (v20)
        {
          dispatch_source_cancel(v20);
          uint64_t v21 = *(void **)(a1 + 48);
          *(void *)(a1 + 48) = 0;
        }
        dispatch_time_t v22 = dispatch_time(0, (unint64_t)(v8 * 1000000000.0));
        dispatch_source_t v23 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(a1 + 56));
        uint64_t v24 = *(void **)(a1 + 48);
        *(void *)(a1 + 48) = v23;

        dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 48), v22, 0xFFFFFFFFFFFFFFFFLL, 0);
        objc_initWeak(&location, (id)a1);
        uint64_t v25 = *(NSObject **)(a1 + 48);
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __67__HDAssertionManager__lock_setBudgetConsumptionTimerWithStartTime___block_invoke;
        v26[3] = &unk_2643D4840;
        objc_copyWeak(&v27, &location);
        dispatch_source_set_event_handler(v25, v26);
        dispatch_activate(*(dispatch_object_t *)(a1 + 48));
        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }
    }
    else
    {
    }
  }
}

- (void)_lock_consumeBudgetsThroughTime:(uint64_t)a1
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v24 = a1;
    obuint64_t j = [*(id *)(a1 + 24) allValues];
    uint64_t v4 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      id v6 = 0;
      uint64_t v7 = *(void *)v35;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v35 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v34 + 1) + 8 * v8);
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          if (v9) {
            uint64_t v10 = *(void **)(v9 + 16);
          }
          else {
            uint64_t v10 = 0;
          }
          long long v11 = [v10 objectEnumerator];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v39 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v31;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v31 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
                if ([v16 _consumeFromBudgetThroughTime:a2])
                {
                  if (!v6) {
                    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
                  }
                  [v6 addObject:v16];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v39 count:16];
            }
            while (v13);
          }

          ++v8;
        }
        while (v8 != v5);
        uint64_t v17 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
        uint64_t v5 = v17;
      }
      while (v17);
    }
    else
    {
      id v6 = 0;
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v18 = v6;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v38 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          dispatch_source_t v23 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          [v23 _invalidateAndRelease:0];
          -[HDAssertionManager _lock_releaseAssertion:](v24, v23);
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v38 count:16];
      }
      while (v20);
    }
  }
}

void __67__HDAssertionManager__lock_setBudgetConsumptionTimerWithStartTime___block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  -[HDAssertionManager _budgetConsumptionTimerDidFire](WeakRetained);
}

- (OS_dispatch_queue)budgetTimerQueue
{
  return self->_budgetTimerQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_budgetTimerQueue, 0);
  objc_storeStrong((id *)&self->_budgetConsumptionTimer, 0);
  objc_storeStrong((id *)&self->_observerSetsByAssertionIdentifier, 0);
  objc_storeStrong((id *)&self->_assertionRecordsByIdentifier, 0);

  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

- (void)_lock_releaseAssertion:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_21BFB4000, log, OS_LOG_TYPE_DEBUG, "%{public}@: Released %{public}@ was not found", (uint8_t *)&v3, 0x16u);
}

@end