@interface ITIdleTimerStateModel
- (BOOL)handleIdleEvent:(unint64_t)a3 usingConfigurationWithIdentifier:(id)a4;
- (BOOL)isIdleTimerServiceAvailable;
- (ITIdleTimerStateModel)init;
- (id)_access_newIdleTimerAssertionWithConfiguration:(id)a3 forReason:(id)a4 error:(id *)a5;
- (id)newIdleTimerAssertionWithConfiguration:(id)a3 forReason:(id)a4 error:(id *)a5;
- (void)_addStateCaptureHandler;
- (void)dealloc;
- (void)resendIdleTimerAssertions;
@end

@implementation ITIdleTimerStateModel

- (id)newIdleTimerAssertionWithConfiguration:(id)a3 forReason:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"ITIdleTimerStateModel.m", 58, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  v11 = [(ITIdleTimerStateModel *)self _access_newIdleTimerAssertionWithConfiguration:v9 forReason:v10 error:a5];
  os_unfair_lock_unlock(&self->_accessLock);

  return v11;
}

- (id)_access_newIdleTimerAssertionWithConfiguration:(id)a3 forReason:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"ITIdleTimerStateModel.m", 116, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  os_unfair_lock_assert_owner(&self->_accessLock);
  v11 = self->_requestHandler;
  v12 = [v9 _uniquedReason:v10];
  v13 = ITLogIdleTimer();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138543618;
    v31 = v15;
    __int16 v32 = 2114;
    v33 = v12;
    _os_log_impl(&dword_210665000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ - Adding IdleTimer assertion for reason: %{public}@.", buf, 0x16u);
  }
  id v29 = 0;
  [(ITIdleTimerStateRequestHandling *)v11 addIdleTimerConfiguration:v9 forReason:v12 error:&v29];
  id v16 = v29;
  v17 = v16;
  if (v16)
  {
    id v18 = 0;
    if (a5) {
      *a5 = v16;
    }
  }
  else
  {
    v19 = self;
    v20 = [ITIdleTimerAssertion alloc];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __88__ITIdleTimerStateModel__access_newIdleTimerAssertionWithConfiguration_forReason_error___block_invoke;
    v26[3] = &unk_264133300;
    v27 = v19;
    v28 = v11;
    v21 = v19;
    id v18 = [(ITIdleTimerAssertion *)v20 _initWithConfiguration:v9 forReason:v10 invalidationBlock:v26];
    access_idleTimerAssertionsByConfigIdentifier = v21->_access_idleTimerAssertionsByConfigIdentifier;
    v23 = [v9 _identifier];
    [(NSMutableDictionary *)access_idleTimerAssertionsByConfigIdentifier setObject:v18 forKey:v23];
  }
  return v18;
}

- (ITIdleTimerStateModel)init
{
  v9.receiver = self;
  v9.super_class = (Class)ITIdleTimerStateModel;
  v2 = [(ITIdleTimerStateModel *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    access_idleTimerAssertionsByConfigIdentifier = v3->_access_idleTimerAssertionsByConfigIdentifier;
    v3->_access_idleTimerAssertionsByConfigIdentifier = v4;

    uint64_t v6 = +[ITIdleTimerServiceProvider makeRequestHandlerWithDelegate:v3];
    requestHandler = v3->_requestHandler;
    v3->_requestHandler = (ITIdleTimerStateRequestHandling *)v6;

    [(ITIdleTimerStateModel *)v3 _addStateCaptureHandler];
  }
  return v3;
}

- (void)dealloc
{
  stateCaptureAssertion = self->_stateCaptureAssertion;
  if (stateCaptureAssertion)
  {
    [(BSInvalidatable *)stateCaptureAssertion invalidate];
    v4 = self->_stateCaptureAssertion;
    self->_stateCaptureAssertion = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)ITIdleTimerStateModel;
  [(ITIdleTimerStateModel *)&v5 dealloc];
}

- (BOOL)isIdleTimerServiceAvailable
{
  return [(ITIdleTimerStateRequestHandling *)self->_requestHandler isIdleTimerServiceAvailable];
}

- (void)resendIdleTimerAssertions
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = ITLogIdleTimer();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210665000, v3, OS_LOG_TYPE_DEFAULT, "[ITIdleTimerStateModel resendIdleTimerAssertions]", buf, 2u);
  }

  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [(NSMutableDictionary *)self->_access_idleTimerAssertionsByConfigIdentifier allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = [v9 configuration];
        v11 = [v9 _uniqueReason];
        requestHandler = self->_requestHandler;
        id v15 = 0;
        [(ITIdleTimerStateRequestHandling *)requestHandler addIdleTimerConfiguration:v10 forReason:v11 error:&v15];
        id v13 = v15;
        if (v13)
        {
          v14 = ITLogIdleTimer();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v21 = v13;
            _os_log_error_impl(&dword_210665000, v14, OS_LOG_TYPE_ERROR, "Encountered error resending idle timer assertions: %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_accessLock);
}

- (BOOL)handleIdleEvent:(unint64_t)a3 usingConfigurationWithIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = ITLogIdleTimer();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134218242;
    unint64_t v17 = a3;
    __int16 v18 = 2114;
    id v19 = v6;
    _os_log_impl(&dword_210665000, v7, OS_LOG_TYPE_DEFAULT, "[ITIdleTimerStateModel handleIdleEvent: %lu usingConfigurationWithIdentifier: %{public}@]", (uint8_t *)&v16, 0x16u);
  }

  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  objc_super v9 = [(NSMutableDictionary *)self->_access_idleTimerAssertionsByConfigIdentifier objectForKey:v6];
  id v10 = v9;
  if (v9)
  {
    v11 = [v9 configuration];
    uint64_t v12 = [v11 _idleEventHandlerBlock];
    id v13 = (void *)v12;
    if (v12) {
      char v14 = (*(uint64_t (**)(uint64_t, unint64_t))(v12 + 16))(v12, a3);
    }
    else {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }
  os_unfair_lock_unlock(p_accessLock);

  return v14;
}

void __88__ITIdleTimerStateModel__access_newIdleTimerAssertionWithConfiguration_forReason_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (const os_unfair_lock *)*(id *)(a1 + 32);
  uint64_t v5 = (os_unfair_lock *)v4;
  if (v4)
  {
    os_unfair_lock_assert_not_owner(v4 + 2);
    os_unfair_lock_lock(v5 + 2);
    id v6 = [v3 _uniqueReason];
    uint64_t v7 = ITLogIdleTimer();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      objc_super v9 = NSStringFromClass(v8);
      int v12 = 138543618;
      id v13 = v9;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl(&dword_210665000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - Removing IdleTimer assertion for reason: %{public}@.", (uint8_t *)&v12, 0x16u);
    }
    id v10 = [v3 configuration];
    [*(id *)(a1 + 40) removeIdleTimerConfiguration:v10 forReason:v6];
    v11 = [v10 _identifier];
    [*(id *)&v5[4]._os_unfair_lock_opaque removeObjectForKey:v11];
    os_unfair_lock_unlock(v5 + 2);
  }
}

- (void)_addStateCaptureHandler
{
  objc_initWeak(&location, self);
  id v3 = MEMORY[0x263EF83A0];
  objc_copyWeak(&v6, &location);
  BSLogAddStateCaptureBlockWithTitle();
  v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  stateCaptureAssertion = self->_stateCaptureAssertion;
  self->_stateCaptureAssertion = v4;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

__CFString *__48__ITIdleTimerStateModel__addStateCaptureHandler__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (os_unfair_lock_s *)(WeakRetained + 8);
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)WeakRetained + 2);
  if (WeakRetained)
  {
    os_unfair_lock_lock(v2);
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = objc_msgSend(*((id *)WeakRetained + 2), "allValues", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_super v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) description];
          [v3 addObject:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    os_unfair_lock_unlock(v2);
    id v10 = [v3 description];
  }
  else
  {
    id v10 = &stru_26C28D3A8;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_requestHandler, 0);
  objc_storeStrong((id *)&self->_access_idleTimerAssertionsByConfigIdentifier, 0);
}

@end