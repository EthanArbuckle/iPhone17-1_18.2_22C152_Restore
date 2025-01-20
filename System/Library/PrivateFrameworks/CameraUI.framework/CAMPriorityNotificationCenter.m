@interface CAMPriorityNotificationCenter
+ (id)defaultCenter;
- (CAMPriorityNotificationCenter)init;
- (NSMutableDictionary)_observersByNameHighPriority;
- (NSMutableDictionary)_observersByNameNormalPriority;
- (NSNotificationCenter)_notificationCenter;
- (OS_dispatch_queue)_mutexQueue;
- (id)_allSubscriptions;
- (id)_entriesByName:(id)a3 forPriority:(unint64_t)a4 creatingEmptyIfNeeded:(BOOL)a5;
- (id)_observersForPriority:(unint64_t)a3;
- (void)_mutexQueue_addObserver:(id)a3 priority:(unint64_t)a4 selector:(SEL)a5 name:(id)a6 object:(id)a7;
- (void)_mutexQueue_removeObserver:(id)a3;
- (void)_notificationReceiver:(id)a3;
- (void)_postNotification:(id)a3 forEntries:(id)a4;
- (void)_removeObserver:(id)a3 fromObserversByName:(id)a4;
- (void)addObserver:(id)a3 priority:(unint64_t)a4 selector:(SEL)a5 name:(id)a6 object:(id)a7;
- (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5 object:(id)a6;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation CAMPriorityNotificationCenter

+ (id)defaultCenter
{
  if (defaultCenter_onceToken != -1) {
    dispatch_once(&defaultCenter_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)defaultCenter_defaultCenter;
  return v2;
}

uint64_t __46__CAMPriorityNotificationCenter_defaultCenter__block_invoke()
{
  defaultCenter_defaultCenter = objc_alloc_init(CAMPriorityNotificationCenter);
  return MEMORY[0x270F9A758]();
}

- (CAMPriorityNotificationCenter)init
{
  v13.receiver = self;
  v13.super_class = (Class)CAMPriorityNotificationCenter;
  v2 = [(CAMPriorityNotificationCenter *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
    notificationCenter = v2->__notificationCenter;
    v2->__notificationCenter = (NSNotificationCenter *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    observersByNameHighPriority = v2->__observersByNameHighPriority;
    v2->__observersByNameHighPriority = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    observersByNameNormalPriority = v2->__observersByNameNormalPriority;
    v2->__observersByNameNormalPriority = v7;

    v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.camera.priority-notification-center.mutex-queue", v9);
    mutexQueue = v2->__mutexQueue;
    v2->__mutexQueue = (OS_dispatch_queue *)v10;
  }
  return v2;
}

- (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5 object:(id)a6
{
}

- (void)addObserver:(id)a3 priority:(unint64_t)a4 selector:(SEL)a5 name:(id)a6 object:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v15 = [(CAMPriorityNotificationCenter *)self _mutexQueue];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __75__CAMPriorityNotificationCenter_addObserver_priority_selector_name_object___block_invoke;
  v19[3] = &unk_263FA2CA8;
  v19[4] = self;
  id v20 = v12;
  unint64_t v23 = a4;
  SEL v24 = a5;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_sync(v15, v19);
}

- (NSMutableDictionary)_observersByNameHighPriority
{
  return self->__observersByNameHighPriority;
}

- (NSMutableDictionary)_observersByNameNormalPriority
{
  return self->__observersByNameNormalPriority;
}

- (id)_entriesByName:(id)a3 forPriority:(unint64_t)a4 creatingEmptyIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = [(CAMPriorityNotificationCenter *)self _mutexQueue];
  dispatch_assert_queue_V2(v9);

  dispatch_queue_t v10 = [(CAMPriorityNotificationCenter *)self _observersForPriority:a4];
  id v11 = [v10 objectForKey:v8];
  if (!v11 && v5)
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v10 setValue:v11 forKey:v8];
  }

  return v11;
}

- (id)_observersForPriority:(unint64_t)a3
{
  BOOL v5 = [(CAMPriorityNotificationCenter *)self _mutexQueue];
  dispatch_assert_queue_V2(v5);

  if (a3 == 1)
  {
    v6 = [(CAMPriorityNotificationCenter *)self _observersByNameNormalPriority];
  }
  else if (!a3)
  {
    v6 = [(CAMPriorityNotificationCenter *)self _observersByNameHighPriority];
  }
  return v6;
}

- (NSNotificationCenter)_notificationCenter
{
  return self->__notificationCenter;
}

- (void)_notificationReceiver:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x21050BCA0]();
  v6 = [v4 name];
  v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CAMPriorityNotificationCenter _notificationReceiver:](v4, v7);
  }

  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__7;
  v30 = __Block_byref_object_dispose__7;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  unint64_t v23 = __Block_byref_object_copy__7;
  SEL v24 = __Block_byref_object_dispose__7;
  id v25 = 0;
  id v8 = [(CAMPriorityNotificationCenter *)self _mutexQueue];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __55__CAMPriorityNotificationCenter__notificationReceiver___block_invoke;
  v15 = &unk_263FA2C80;
  id v18 = &v26;
  id v16 = self;
  id v9 = v6;
  id v17 = v9;
  v19 = &v20;
  dispatch_sync(v8, &v12);

  if (objc_msgSend((id)v27[5], "count", v12, v13, v14, v15, v16))
  {
    dispatch_queue_t v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[CAMPriorityNotificationCenter _notificationReceiver:](v10);
    }

    [(CAMPriorityNotificationCenter *)self _postNotification:v4 forEntries:v27[5]];
  }
  if ([(id)v21[5] count])
  {
    id v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CAMPriorityNotificationCenter _notificationReceiver:](v11);
    }

    [(CAMPriorityNotificationCenter *)self _postNotification:v4 forEntries:v21[5]];
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
}

- (void)_postNotification:(id)a3 forEntries:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v39 = a3;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = a4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v55 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v42;
    *(void *)&long long v6 = 138544130;
    long long v35 = v6;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        dispatch_queue_t v10 = objc_msgSend(v9, "observer", v35);
        objc_initWeak(&location, v10);

        uint64_t v11 = [v9 selector];
        uint64_t v12 = [v9 object];
        if (!v12
          || ([v39 object],
              uint64_t v13 = objc_claimAutoreleasedReturnValue(),
              BOOL v14 = v12 == v13,
              v13,
              v14))
        {
          id v21 = objc_loadWeakRetained(&location);
          char v22 = objc_opt_respondsToSelector();

          if (v22)
          {
            id v23 = objc_loadWeakRetained(&location);
            SEL v24 = (void (*)(NSObject *, uint64_t, id))[v23 methodForSelector:v11];

            v15 = os_log_create("com.apple.camera", "Camera");
            BOOL v25 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
            if (v24)
            {
              if (v25)
              {
                id v37 = [v39 name];
                id v29 = objc_loadWeakRetained(&location);
                v30 = objc_opt_class();
                id v36 = v30;
                id v31 = objc_loadWeakRetained(&location);
                *(_DWORD *)buf = v35;
                id v46 = v37;
                __int16 v47 = 2114;
                id v48 = v30;
                __int16 v49 = 2048;
                id v50 = v31;
                __int16 v51 = 2048;
                v52 = v12;
                _os_log_debug_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEBUG, "Forwarding notification %{public}@ to <%{public}@: %p>/%p", buf, 0x2Au);
              }
              v15 = objc_loadWeakRetained(&location);
              v24(v15, v11, v39);
            }
            else if (v25)
            {
              id v32 = objc_loadWeakRetained(&location);
              id v33 = (id)objc_opt_class();
              v34 = [v39 name];
              *(_DWORD *)buf = 138543618;
              id v46 = v33;
              __int16 v47 = 2114;
              id v48 = v34;
              _os_log_debug_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEBUG, "Observer %{public}@ has an invalid selector for receiving notifications for %{public}@!", buf, 0x16u);
            }
          }
          else
          {
            v15 = os_log_create("com.apple.camera", "Camera");
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              id v26 = objc_loadWeakRetained(&location);
              id v27 = (id)objc_opt_class();
              uint64_t v28 = [v39 name];
              *(_DWORD *)buf = 138543618;
              id v46 = v27;
              __int16 v47 = 2114;
              id v48 = v28;
              _os_log_debug_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEBUG, "Observer %{public}@ does not have a compatible selector for receiving notifications for %{public}@!", buf, 0x16u);
            }
          }
        }
        else
        {
          v15 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            id v16 = [v39 name];
            id v17 = objc_loadWeakRetained(&location);
            id v18 = (id)objc_opt_class();
            id v19 = objc_loadWeakRetained(&location);
            uint64_t v20 = [v39 object];
            *(_DWORD *)buf = 138544386;
            id v46 = v16;
            __int16 v47 = 2114;
            id v48 = v18;
            __int16 v49 = 2048;
            id v50 = v19;
            __int16 v51 = 2048;
            v52 = v12;
            __int16 v53 = 2048;
            v54 = v20;
            _os_log_debug_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEBUG, "Not forwarding notification %{public}@ to <%{public}@: %p>/%p because notification object %p did not match", buf, 0x34u);
          }
        }

        objc_destroyWeak(&location);
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v55 count:16];
    }
    while (v5);
  }
}

- (void)dealloc
{
  [(NSNotificationCenter *)self->__notificationCenter removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)CAMPriorityNotificationCenter;
  [(CAMPriorityNotificationCenter *)&v3 dealloc];
}

void __55__CAMPriorityNotificationCenter__notificationReceiver___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _entriesByName:*(void *)(a1 + 40) forPriority:0 creatingEmptyIfNeeded:0];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v9 = [*(id *)(a1 + 32) _entriesByName:*(void *)(a1 + 40) forPriority:1 creatingEmptyIfNeeded:0];
  uint64_t v6 = [v9 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

uint64_t __75__CAMPriorityNotificationCenter_addObserver_priority_selector_name_object___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mutexQueue_addObserver:priority:selector:name:object:", *(void *)(a1 + 40), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)_mutexQueue_addObserver:(id)a3 priority:(unint64_t)a4 selector:(SEL)a5 name:(id)a6 object:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  id v14 = a3;
  v15 = [(CAMPriorityNotificationCenter *)self _mutexQueue];
  dispatch_assert_queue_V2(v15);

  id v16 = [(CAMPriorityNotificationCenter *)self _observersByNameHighPriority];
  id v17 = [v16 objectForKey:v12];
  if (v17)
  {
    BOOL v18 = 0;
  }
  else
  {
    id v19 = [(CAMPriorityNotificationCenter *)self _observersByNameNormalPriority];
    uint64_t v20 = [v19 objectForKey:v12];
    BOOL v18 = v20 == 0;
  }
  id v21 = [(CAMPriorityNotificationCenter *)self _entriesByName:v12 forPriority:a4 creatingEmptyIfNeeded:1];
  char v22 = [[CAMPriorityNotificationCenterEntry alloc] initWithObserver:v14 selector:a5 object:v13];

  [v21 addObject:v22];
  if (v18)
  {
    id v23 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[CAMPriorityNotificationCenter _mutexQueue_addObserver:priority:selector:name:object:]((uint64_t)v12, v23);
    }

    SEL v24 = [(CAMPriorityNotificationCenter *)self _notificationCenter];
    [v24 addObserver:self selector:sel__notificationReceiver_ name:v12 object:0];
  }
}

- (void)_removeObserver:(id)a3 fromObserversByName:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CAMPriorityNotificationCenter *)self _mutexQueue];
  dispatch_assert_queue_V2(v8);

  id v23 = v7;
  [v7 allKeys];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v11 = [v23 objectForKey:v10];
        id v12 = objc_alloc_init(MEMORY[0x263F089C8]);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v13 = v11;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = 0;
          uint64_t v17 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v25 != v17) {
                objc_enumerationMutation(v13);
              }
              id v19 = [*(id *)(*((void *)&v24 + 1) + 8 * j) observer];

              if (v19 == v6) {
                [v12 addIndex:v16 + j];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
            v16 += j;
          }
          while (v15);
        }

        [v13 removeObjectsAtIndexes:v12];
        if (![v13 count]) {
          [v23 removeObjectForKey:v10];
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v22);
  }
}

- (id)_allSubscriptions
{
  uint64_t v3 = [(CAMPriorityNotificationCenter *)self _mutexQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(CAMPriorityNotificationCenter *)self _observersByNameHighPriority];
  uint64_t v5 = [v4 allKeys];

  id v6 = [(CAMPriorityNotificationCenter *)self _observersByNameNormalPriority];
  id v7 = [v6 allKeys];

  id v8 = [MEMORY[0x263EFF9C0] setWithArray:v5];
  id v9 = [MEMORY[0x263EFF9C0] setWithArray:v7];
  id v10 = v8;
  [v10 unionSet:v9];

  return v10;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAMPriorityNotificationCenter *)self _mutexQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__CAMPriorityNotificationCenter_removeObserver___block_invoke;
  v7[3] = &unk_263FA0408;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __48__CAMPriorityNotificationCenter_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mutexQueue_removeObserver:", *(void *)(a1 + 40));
}

- (void)_mutexQueue_removeObserver:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(CAMPriorityNotificationCenter *)self _mutexQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CAMPriorityNotificationCenter *)self _allSubscriptions];
  id v7 = [(CAMPriorityNotificationCenter *)self _observersByNameHighPriority];
  [(CAMPriorityNotificationCenter *)self _removeObserver:v4 fromObserversByName:v7];

  id v8 = [(CAMPriorityNotificationCenter *)self _observersByNameNormalPriority];
  BOOL v18 = v4;
  [(CAMPriorityNotificationCenter *)self _removeObserver:v4 fromObserversByName:v8];

  uint64_t v17 = [(CAMPriorityNotificationCenter *)self _allSubscriptions];
  objc_msgSend(v6, "minusSet:");
  id v9 = v6;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
        uint64_t v15 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v24 = v14;
          _os_log_debug_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEBUG, "Unsubscribing from notification %{public}@", buf, 0xCu);
        }

        uint64_t v16 = [(CAMPriorityNotificationCenter *)self _notificationCenter];
        [v16 removeObserver:self name:v14 object:0];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v11);
  }
}

- (OS_dispatch_queue)_mutexQueue
{
  return self->__mutexQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__mutexQueue, 0);
  objc_storeStrong((id *)&self->__observersByNameNormalPriority, 0);
  objc_storeStrong((id *)&self->__observersByNameHighPriority, 0);
  objc_storeStrong((id *)&self->__notificationCenter, 0);
}

- (void)_notificationReceiver:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2099F8000, log, OS_LOG_TYPE_DEBUG, "Forwarding notification to normal priority receivers...", v1, 2u);
}

- (void)_notificationReceiver:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2099F8000, log, OS_LOG_TYPE_DEBUG, "Forwarding notification to high priority receivers...", v1, 2u);
}

- (void)_notificationReceiver:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 name];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_2099F8000, a2, OS_LOG_TYPE_DEBUG, "Received notification: %{public}@", (uint8_t *)&v4, 0xCu);
}

- (void)_mutexQueue_addObserver:(uint64_t)a1 priority:(NSObject *)a2 selector:name:object:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2099F8000, a2, OS_LOG_TYPE_DEBUG, "Subscribing to notification %{public}@", (uint8_t *)&v2, 0xCu);
}

@end