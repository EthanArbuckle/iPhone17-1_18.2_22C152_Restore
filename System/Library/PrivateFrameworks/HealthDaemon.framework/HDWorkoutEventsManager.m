@interface HDWorkoutEventsManager
- (HDWorkoutEventsManager)initWithProfile:(id)a3;
- (id)takeSessionAssertionWithOwnerIdentifier:(id)a3 activityType:(unint64_t)a4 sessionIdentifier:(id)a5 eventsDelegate:(id)a6;
- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4;
- (void)fakeActivityDetection:(id)a3 workoutActivity:(id)a4;
- (void)requestPendingEventsThroughDate:(id)a3 sessionIdentifier:(id)a4 completion:(id)a5;
- (void)unitTest_setCMWorkoutManager:(id)a3;
- (void)updateEventCollectorsForActivityType:(unint64_t)a3 activityIdentifier:(id)a4;
@end

@implementation HDWorkoutEventsManager

- (HDWorkoutEventsManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDWorkoutEventsManager;
  v5 = [(HDWorkoutEventsManager *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E4F65CD0]);
    assertionManager = v6->_assertionManager;
    v6->_assertionManager = v9;

    [(HDAssertionManager *)v6->_assertionManager addObserver:v6 forAssertionIdentifier:@"HDWorkoutSessionAssertionIdentifierEventCollection" queue:v6->_queue];
  }

  return v6;
}

- (id)takeSessionAssertionWithOwnerIdentifier:(id)a3 activityType:(unint64_t)a4 sessionIdentifier:(id)a5 eventsDelegate:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = [_HDEventsCollectionAssertion alloc];
  if (v13)
  {
    v27.receiver = v13;
    v27.super_class = (Class)_HDEventsCollectionAssertion;
    v14 = [(HDWorkoutEventsManager *)&v27 initWithAssertionIdentifier:@"HDWorkoutSessionAssertionIdentifierEventCollection" ownerIdentifier:v10];
  }
  else
  {
    v14 = 0;
  }
  objc_storeWeak((id *)&self->_eventsDelegate, v12);
  assertionManager = self->_assertionManager;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __112__HDWorkoutEventsManager_takeSessionAssertionWithOwnerIdentifier_activityType_sessionIdentifier_eventsDelegate___block_invoke;
  v22[3] = &unk_1E62F2ED0;
  v22[4] = self;
  v23 = v14;
  id v25 = v11;
  unint64_t v26 = a4;
  id v24 = v12;
  id v16 = v11;
  id v17 = v12;
  v18 = v14;
  if ([(HDAssertionManager *)assertionManager takeAssertion:v18 preNotificationBlock:v22])v19 = v18; {
  else
  }
    v19 = 0;
  v20 = v19;

  return v20;
}

void __112__HDWorkoutEventsManager_takeSessionAssertionWithOwnerIdentifier_activityType_sessionIdentifier_eventsDelegate___block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__HDWorkoutEventsManager_takeSessionAssertionWithOwnerIdentifier_activityType_sessionIdentifier_eventsDelegate___block_invoke_2;
  block[3] = &unk_1E62F2ED0;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  uint64_t v10 = *(void *)(a1 + 64);
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  dispatch_sync(v2, block);
}

void __112__HDWorkoutEventsManager_takeSessionAssertionWithOwnerIdentifier_activityType_sessionIdentifier_eventsDelegate___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 40);
  id v21 = *(id *)(a1 + 48);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v5 = _allEventCollectorClasses();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      id v9 = (id *)(v3 + 8);
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(objc_class **)(*((void *)&v26 + 1) + 8 * i);
          if ([(objc_class *)v11 isAvailableInCurrentHardware]
            && [(objc_class *)v11 supportsWorkoutActivityType:v2])
          {
            id v12 = [v11 alloc];
            id WeakRetained = objc_loadWeakRetained(v9);
            v14 = (void *)[v12 initWithProfile:WeakRetained delegate:v21];

            [v4 addObject:v14];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  -[_HDEventsCollectionAssertion setEventCollectors:](*(void *)(a1 + 32), v4);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v15 = *(void **)(a1 + 32);
  if (v15) {
    v15 = (void *)v15[10];
  }
  id v16 = v15;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * j) startWithSessionId:*(void *)(a1 + 56)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v18);
  }
}

- (void)requestPendingEventsThroughDate:(id)a3 sessionIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__HDWorkoutEventsManager_requestPendingEventsThroughDate_sessionIdentifier_completion___block_invoke;
  v15[3] = &unk_1E62F2F48;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

void __87__HDWorkoutEventsManager_requestPendingEventsThroughDate_sessionIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = dispatch_group_create();
  [*(id *)(*(void *)(a1 + 32) + 16) activeAssertionsForIdentifier:@"HDWorkoutSessionAssertionIdentifierEventCollection"];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v34;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v3;
        id v4 = *(void **)(*((void *)&v33 + 1) + 8 * v3);
        _HKInitializeLogging();
        v5 = *MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v39 = v6;
          __int16 v40 = 2114;
          v41 = v4;
          _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting post-stop events collection for active assertion %{public}@", buf, 0x16u);
        }
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        if (v4) {
          uint64_t v7 = (void *)v4[10];
        }
        else {
          uint64_t v7 = 0;
        }
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v30 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              id v14 = [v13 sessionId];
              v15 = *(void **)(a1 + 40);

              if (v14 == v15)
              {
                dispatch_group_enter(v2);
                _HKInitializeLogging();
                id v16 = *MEMORY[0x1E4F29FB8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v17 = *(void *)(a1 + 32);
                  *(_DWORD *)buf = 138543618;
                  uint64_t v39 = v17;
                  __int16 v40 = 2114;
                  v41 = v13;
                  _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting post-stop events collection for %{public}@", buf, 0x16u);
                }
                uint64_t v18 = *(void *)(a1 + 48);
                v27[0] = MEMORY[0x1E4F143A8];
                v27[1] = 3221225472;
                v27[2] = __87__HDWorkoutEventsManager_requestPendingEventsThroughDate_sessionIdentifier_completion___block_invoke_289;
                v27[3] = &unk_1E62F2EF8;
                v27[4] = *(void *)(a1 + 32);
                v27[5] = v13;
                long long v28 = v2;
                [v13 requestPendingEventsThroughDate:v18 completion:v27];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v10);
        }

        uint64_t v3 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v19 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
      uint64_t v23 = v19;
    }
    while (v19);
  }
  v20 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__HDWorkoutEventsManager_requestPendingEventsThroughDate_sessionIdentifier_completion___block_invoke_291;
  block[3] = &unk_1E62F2F20;
  id v26 = *(id *)(a1 + 56);
  dispatch_group_notify(v2, v20, block);
}

void __87__HDWorkoutEventsManager_requestPendingEventsThroughDate_sessionIdentifier_completion___block_invoke_289(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = *MEMORY[0x1E4F29FB8];
  uint64_t v7 = *MEMORY[0x1E4F29FB8];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v12 = 138543618;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully finished collecting post-stop events pending for %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = 138543874;
    uint64_t v13 = v10;
    __int16 v14 = 2114;
    uint64_t v15 = v11;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to collect post-stop pending events for %{public}@, error: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __87__HDWorkoutEventsManager_requestPendingEventsThroughDate_sessionIdentifier_completion___block_invoke_291(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateEventCollectorsForActivityType:(unint64_t)a3 activityIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  _HKInitializeLogging();
  uint64_t v7 = (os_log_t *)MEMORY[0x1E4F29FB8];
  uint64_t v8 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = self;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating event collectors", buf, 0xCu);
  }
  if (a3 != 83)
  {
    uint64_t v9 = [(HDAssertionManager *)self->_assertionManager activeAssertionsForIdentifier:@"HDWorkoutSessionAssertionIdentifierEventCollection"];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    if ([v9 count])
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __82__HDWorkoutEventsManager_updateEventCollectorsForActivityType_activityIdentifier___block_invoke;
      block[3] = &unk_1E62F2ED0;
      id v14 = v9;
      unint64_t v18 = a3;
      id v15 = v10;
      __int16 v16 = self;
      id v17 = v6;
      dispatch_sync(queue, block);
    }
    else
    {
      _HKInitializeLogging();
      int v12 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = self;
        _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: No active event collector assertions to update", buf, 0xCu);
      }
    }
  }
}

void __82__HDWorkoutEventsManager_updateEventCollectorsForActivityType_activityIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v27 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v40;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v40 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void *)(*((void *)&v39 + 1) + 8 * v2);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        uint64_t v28 = v3;
        uint64_t v29 = v2;
        if (v3) {
          id v4 = *(void **)(v3 + 80);
        }
        else {
          id v4 = 0;
        }
        id v5 = v4;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v48 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v36 != v8) {
                objc_enumerationMutation(v5);
              }
              id v10 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              if ([(id)objc_opt_class() supportsWorkoutActivityType:*(void *)(a1 + 64)]) {
                [*(id *)(a1 + 40) addObject:v10];
              }
              else {
                [v10 stop];
              }
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v35 objects:v48 count:16];
          }
          while (v7);
        }

        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v11 = _allEventCollectorClasses();
        uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v47 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v32;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v32 != v14) {
                objc_enumerationMutation(v11);
              }
              __int16 v16 = *(objc_class **)(*((void *)&v31 + 1) + 8 * j);
              if ([(objc_class *)v16 supportsWorkoutActivityType:*(void *)(a1 + 64)])
              {
                id v17 = *(void **)(a1 + 40);
                v30[0] = MEMORY[0x1E4F143A8];
                v30[1] = 3221225472;
                v30[2] = __82__HDWorkoutEventsManager_updateEventCollectorsForActivityType_activityIdentifier___block_invoke_2;
                v30[3] = &__block_descriptor_40_e33_B16__0__HDWorkoutEventCollector_8lu32l8;
                v30[4] = v16;
                if (objc_msgSend(v17, "hk_containsObjectPassingTest:", v30))
                {
                  _HKInitializeLogging();
                  unint64_t v18 = *MEMORY[0x1E4F29FB8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v19 = *(void *)(a1 + 48);
                    *(_DWORD *)buf = 138543618;
                    uint64_t v44 = v19;
                    __int16 v45 = 2114;
                    v46 = v16;
                    _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Event collector %{public}@, already exists", buf, 0x16u);
                  }
                }
                else
                {
                  id v20 = [v16 alloc];
                  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
                  id v22 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 40));
                  uint64_t v23 = (void *)[v20 initWithProfile:WeakRetained delegate:v22];

                  [*(id *)(a1 + 40) addObject:v23];
                  [v23 startWithSessionId:*(void *)(a1 + 56)];
                }
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v47 count:16];
          }
          while (v13);
        }

        -[_HDEventsCollectionAssertion setEventCollectors:](v28, *(void **)(a1 + 40));
        uint64_t v2 = v29 + 1;
      }
      while (v29 + 1 != v27);
      uint64_t v24 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
      uint64_t v27 = v24;
    }
    while (v24);
  }
}

uint64_t __82__HDWorkoutEventsManager_updateEventCollectorsForActivityType_activityIdentifier___block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

- (void)fakeActivityDetection:(id)a3 workoutActivity:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(HDAssertionManager *)self->_assertionManager activeAssertionsForIdentifier:@"HDWorkoutSessionAssertionIdentifierEventCollection"];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * v11);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        if (v12) {
          uint64_t v12 = (void *)v12[10];
        }
        uint64_t v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v20;
          do
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v20 != v16) {
                objc_enumerationMutation(v13);
              }
              [*(id *)(*((void *)&v19 + 1) + 8 * v17++) fakeActivityDetection:v6 workoutActivity:v7];
            }
            while (v15 != v17);
            uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v15);
        }

        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  if (v5) {
    id v6 = (void *)v5[10];
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "stop", (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)unitTest_setCMWorkoutManager:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_eventCollectors;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "unitTest_setCMWorkoutManager:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_eventsDelegate);
  objc_storeStrong((id *)&self->_eventCollectors, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end