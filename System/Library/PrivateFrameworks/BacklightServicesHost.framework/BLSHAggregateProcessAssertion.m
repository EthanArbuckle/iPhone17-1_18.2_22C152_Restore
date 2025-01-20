@interface BLSHAggregateProcessAssertion
+ (id)classLock_aggregateForProcessIdentity:(id)a3 shouldCreate:(BOOL)a4;
+ (void)acquireAggregatedAssertion:(id)a3 completion:(id)a4;
+ (void)invalidateAggregatedAssertion:(id)a3;
- (BLSHAggregateProcessAssertion)initWithProcessIdentity:(id)a3;
- (BOOL)invalidateAggregatedAssertion:(id)a3;
- (BOOL)isCurrentRBSAssertion:(id)a3;
- (NSString)debugDescription;
- (RBSProcessIdentity)processIdentity;
- (os_state_data_s)stateDataWithHints:(os_state_hints_s *)a3;
- (void)acquireAggregatedAssertion:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation BLSHAggregateProcessAssertion

+ (void)acquireAggregatedAssertion:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_classLock_4);
  v8 = [v7 processIdentity];
  v9 = objc_msgSend(a1, "classLock_aggregateForProcessIdentity:shouldCreate:", v8, 1);

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__BLSHAggregateProcessAssertion_acquireAggregatedAssertion_completion___block_invoke;
  v11[3] = &unk_264534200;
  id v12 = v6;
  id v10 = v6;
  [v9 acquireAggregatedAssertion:v7 completion:v11];

  os_unfair_lock_unlock((os_unfair_lock_t)&_classLock_4);
}

void __71__BLSHAggregateProcessAssertion_acquireAggregatedAssertion_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __71__BLSHAggregateProcessAssertion_acquireAggregatedAssertion_completion___block_invoke_2;
    v4[3] = &unk_264533CD0;
    id v6 = *(id *)(a1 + 32);
    id v5 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v4);
  }
}

uint64_t __71__BLSHAggregateProcessAssertion_acquireAggregatedAssertion_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)invalidateAggregatedAssertion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_classLock_4);
  id v7 = [v4 processIdentity];
  id v5 = objc_msgSend(a1, "classLock_aggregateForProcessIdentity:shouldCreate:");
  char v6 = [v5 invalidateAggregatedAssertion:v4];

  if ((v6 & 1) == 0)
  {
    [v5 invalidate];
    [(id)_classLock_aggregates removeObjectForKey:v7];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_classLock_4);
}

+ (id)classLock_aggregateForProcessIdentity:(id)a3 shouldCreate:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v5)
  {
    char v6 = v5;
    os_unfair_lock_assert_owner((const os_unfair_lock *)&_classLock_4);
    id v7 = (void *)_classLock_aggregates;
    if (!_classLock_aggregates)
    {
      uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
      v9 = (void *)_classLock_aggregates;
      _classLock_aggregates = v8;

      id v7 = (void *)_classLock_aggregates;
    }
    id v10 = [v7 objectForKey:v6];
    if (v10) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = !v4;
    }
    if (!v11)
    {
      id v10 = [[BLSHAggregateProcessAssertion alloc] initWithProcessIdentity:v6];
      [(id)_classLock_aggregates setObject:v10 forKey:v6];
    }

    return v10;
  }
  else
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"processIdentity != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BLSHAggregateProcessAssertion classLock_aggregateForProcessIdentity:shouldCreate:]();
    }
    [v13 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BLSHAggregateProcessAssertion)initWithProcessIdentity:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BLSHAggregateProcessAssertion;
  char v6 = [(BLSHAggregateProcessAssertion *)&v13 init];
  if (v6)
  {
    if (initWithProcessIdentity__onceToken != -1) {
      dispatch_once(&initWithProcessIdentity__onceToken, &__block_literal_global_26);
    }
    BSContinuousMachTimeNow();
    v6->_initTimestamp = v7;
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_processIdentity, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:512 valueOptions:0 capacity:2];
    lock_aggregated = v6->_lock_aggregated;
    v6->_lock_aggregated = (NSMapTable *)v8;

    objc_initWeak(&location, v6);
    objc_copyWeak(&v11, &location);
    v6->_stateHandler = os_state_add_handler();
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v6;
}

uint64_t __57__BLSHAggregateProcessAssertion_initWithProcessIdentity___block_invoke()
{
  dispatch_workloop_t inactive = dispatch_workloop_create_inactive("BLSHAggregateProcessAssertion_rbs_acquisition");
  v1 = (void *)initWithProcessIdentity____workloop;
  initWithProcessIdentity____workloop = (uint64_t)inactive;

  dispatch_workloop_set_scheduler_priority();
  dispatch_activate((dispatch_object_t)initWithProcessIdentity____workloop);
  dispatch_queue_t v2 = dispatch_queue_create_with_target_V2("BLSHAggregateProcessAssertion_rbs_acquisition", 0, (dispatch_queue_t)initWithProcessIdentity____workloop);
  uint64_t v3 = __rbsAssertionAcquisitionQueue;
  __rbsAssertionAcquisitionQueue = (uint64_t)v2;

  return MEMORY[0x270F9A758](v2, v3);
}

uint64_t __57__BLSHAggregateProcessAssertion_initWithProcessIdentity___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained stateDataWithHints:a2];

  return v4;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)acquireAggregatedAssertion:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  uint8_t v9 = [(NSMapTable *)self->_lock_aggregated objectForKey:v7];

  if (v9)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_lock_aggregated objectForKey:assertion] == nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHAggregateProcessAssertion acquireAggregatedAssertion:completion:]();
    }
LABEL_15:
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD6B5F8);
  }
  if (self->_lock_invalidated)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_lock_invalidated == NO"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHAggregateProcessAssertion acquireAggregatedAssertion:completion:]();
    }
    goto LABEL_15;
  }
  [v7 duration];
  double v11 = v10;
  id v12 = [[BLSHDurationCalculator alloc] initWithDuration:v10];
  if (!self->_lock_rbsAssertion)
  {
    [(NSMapTable *)self->_lock_aggregated setObject:v12 forKey:v7];
    goto LABEL_8;
  }
  [(BLSHDurationCalculator *)self->_lock_durationCalculator remainingDuration];
  double v14 = v13;
  [(NSMapTable *)self->_lock_aggregated setObject:v12 forKey:v7];
  if (v14 < v11)
  {
LABEL_8:
    v15 = [v7 processIdentity];
    v16 = [v7 createRBSAssertion];
    objc_initWeak(&location, self);
    v17 = self->_lock_rbsAssertion;
    objc_storeStrong((id *)&self->_lock_rbsAssertion, v16);
    objc_storeStrong((id *)&self->_lock_acquiredAssertion, a3);
    objc_storeStrong((id *)&self->_lock_durationCalculator, v12);
    v18 = __rbsAssertionAcquisitionQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__BLSHAggregateProcessAssertion_acquireAggregatedAssertion_completion___block_invoke;
    block[3] = &unk_264534228;
    objc_copyWeak(&v29, &location);
    id v24 = v16;
    id v25 = v15;
    id v26 = v7;
    v27 = v17;
    id v28 = v8;
    v19 = v17;
    id v20 = v15;
    id v21 = v16;
    dispatch_async(v18, block);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_9;
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v8) {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
LABEL_9:
}

void __71__BLSHAggregateProcessAssertion_acquireAggregatedAssertion_completion___block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v3 = *(void **)(a1 + 32);
  id v45 = 0;
  char v4 = [v3 acquireWithError:&v45];
  id v5 = v45;
  int v6 = [WeakRetained isCurrentRBSAssertion:*(void *)(a1 + 32)];
  if (v5 || (v4 & 1) == 0)
  {
    double v11 = [v5 domain];
    uint64_t v12 = [v5 code];
    if ((v6 & 1) == 0
      && ([v11 isEqual:*MEMORY[0x263F64670]] ? (BOOL v13 = v12 == 1) : (BOOL v13 = 0), v13))
    {
      v17 = bls_scenes_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v32 = *(void **)(a1 + 32);
        uint64_t v33 = *(void *)(a1 + 40);
        v34 = [*(id *)(a1 + 48) explanation];
        *(_DWORD *)buf = 134218754;
        id v47 = WeakRetained;
        __int16 v48 = 2114;
        v49 = v32;
        __int16 v50 = 2114;
        uint64_t v51 = v33;
        __int16 v52 = 2114;
        *(void *)v53 = v34;
        _os_log_impl(&dword_21FCFC000, v17, OS_LOG_TYPE_INFO, "%p (already invalidated) did not acquire rb assertion:%{public}@ for process:%{public}@ explanation:%{public}@", buf, 0x2Au);
      }
    }
    else
    {
      uint64_t v39 = v12;
      double v14 = (void *)MEMORY[0x263F645E0];
      v15 = [MEMORY[0x263F645D8] predicateMatchingIdentity:*(void *)(a1 + 40)];
      id v44 = 0;
      v16 = [v14 statesForPredicate:v15 withDescriptor:0 error:&v44];
      v17 = v44;

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v18 = v16;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v58 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        int v21 = 0;
        uint64_t v22 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v41 != v22) {
              objc_enumerationMutation(v18);
            }
            v21 |= [*(id *)(*((void *)&v40 + 1) + 8 * i) isRunning];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v40 objects:v58 count:16];
        }
        while (v20);
      }
      else
      {
        LOBYTE(v21) = 0;
      }

      id v24 = bls_scenes_log();
      if (v21)
      {
        if ([*(id *)(a1 + 48) shouldFaultOnFailureToAcquire]) {
          os_log_type_t v25 = OS_LOG_TYPE_FAULT;
        }
        else {
          os_log_type_t v25 = OS_LOG_TYPE_ERROR;
        }
      }
      else
      {
        os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
      }
      os_log_type_t v26 = v25;
      if (os_log_type_enabled(v24, v25))
      {
        v27 = [v5 localizedDescription];
        v38 = v17;
        uint64_t v28 = *(void *)(a1 + 32);
        uint64_t v37 = *(void *)(a1 + 40);
        id v29 = [*(id *)(a1 + 48) explanation];
        *(_DWORD *)buf = 134219522;
        id v47 = WeakRetained;
        __int16 v48 = 2114;
        v49 = v11;
        __int16 v50 = 2048;
        uint64_t v51 = v39;
        __int16 v52 = 2114;
        *(void *)v53 = v27;
        *(_WORD *)&v53[8] = 2114;
        *(void *)&v53[10] = v28;
        v17 = v38;
        __int16 v54 = 2114;
        uint64_t v55 = v37;
        __int16 v56 = 2114;
        v57 = v29;
        _os_log_impl(&dword_21FCFC000, v24, v26, "%p error:%{public}@:%ld:\"%{public}@\" failed to acquire rb assertion:%{public}@ for process:%{public}@ explanation:%{public}@", buf, 0x48u);
      }
    }
  }
  else
  {
    id v7 = bls_scenes_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      double v10 = [*(id *)(a1 + 48) explanation];
      *(_DWORD *)buf = 134219010;
      id v47 = WeakRetained;
      __int16 v48 = 2114;
      v49 = v8;
      __int16 v50 = 2114;
      uint64_t v51 = v9;
      __int16 v52 = 1024;
      *(_DWORD *)v53 = v6;
      *(_WORD *)&v53[4] = 2114;
      *(void *)&v53[6] = v10;
      _os_log_impl(&dword_21FCFC000, v7, OS_LOG_TYPE_DEFAULT, "%p acquired rbs assertion:%{public}@ for process:%{public}@ current:%{BOOL}u explanation:%{public}@", buf, 0x30u);
    }
    if ((v6 & 1) == 0) {
      [*(id *)(a1 + 32) invalidate];
    }
  }
  if (*(void *)(a1 + 56))
  {
    v30 = bls_scenes_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v35 = [*(id *)(a1 + 56) explanation];
      uint64_t v36 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      id v47 = WeakRetained;
      __int16 v48 = 2114;
      v49 = v35;
      __int16 v50 = 2114;
      uint64_t v51 = v36;
      _os_log_debug_impl(&dword_21FCFC000, v30, OS_LOG_TYPE_DEBUG, "%p:acquireAggregatedAssertion: invalidating old RBS assertion \"%{public}@\" for process:%{public}@", buf, 0x20u);
    }
    [*(id *)(a1 + 56) invalidate];
  }
  uint64_t v31 = *(void *)(a1 + 64);
  if (v31) {
    (*(void (**)(uint64_t, id))(v31 + 16))(v31, v5);
  }
}

- (BOOL)isCurrentRBSAssertion:(id)a3
{
  uint64_t v3 = self;
  p_lock = &self->_lock;
  id v5 = (RBSAssertion *)a3;
  os_unfair_lock_lock(p_lock);
  LOBYTE(v3) = v3->_lock_rbsAssertion == v5;

  os_unfair_lock_unlock(p_lock);
  return (char)v3;
}

- (BOOL)invalidateAggregatedAssertion:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  char v4 = (BLSHAggregatedProcessAssertion *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  p_lock_aggregated = &self->_lock_aggregated;
  id v7 = [(NSMapTable *)self->_lock_aggregated objectForKey:v4];

  if (v7)
  {
    [(NSMapTable *)self->_lock_aggregated removeObjectForKey:v4];
    if (self->_lock_acquiredAssertion == v4)
    {
      self->_lock_acquiredAssertion = 0;

      id v8 = self->_lock_rbsAssertion;
      lock_rbsAssertion = self->_lock_rbsAssertion;
      self->_lock_rbsAssertion = 0;

      lock_durationCalculator = self->_lock_durationCalculator;
      self->_lock_durationCalculator = 0;

      if (![(NSMapTable *)self->_lock_aggregated count])
      {
        v15 = 0;
        double v14 = 0;
        if (v8)
        {
LABEL_27:
          v32 = bls_scenes_log();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
            [(BLSHAggregateProcessAssertion *)(uint64_t)self invalidateAggregatedAssertion:v32];
          }

          [(RBSAssertion *)v8 invalidate];
        }
LABEL_30:

        goto LABEL_31;
      }
      long long v43 = v8;
      id v44 = &self->_lock;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      double v11 = *p_lock_aggregated;
      uint64_t v12 = [(NSMapTable *)v11 countByEnumeratingWithState:&v46 objects:v58 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        p_lock_durationCalculator = (id *)&self->_lock_durationCalculator;
        id location = (id *)&self->_lock_acquiredAssertion;
        long long v41 = self;
        long long v42 = v4;
        double v14 = 0;
        v15 = 0;
        uint64_t v16 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v47 != v16) {
              objc_enumerationMutation(v11);
            }
            id v18 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            uint64_t v19 = [(NSMapTable *)*p_lock_aggregated objectForKey:v18];
            [v19 remainingDuration];
            double v21 = v20;
            [v14 remainingDuration];
            if (v21 > v22)
            {
              id v23 = v19;

              id v24 = v18;
              double v14 = v23;
              v15 = v24;
            }
          }
          uint64_t v13 = [(NSMapTable *)v11 countByEnumeratingWithState:&v46 objects:v58 count:16];
        }
        while (v13);

        if (!v15)
        {
          self = v41;
          char v4 = v42;
          goto LABEL_26;
        }
        os_log_type_t v25 = [v15 createRBSAssertion];
        id v45 = 0;
        char v26 = [v25 acquireWithError:&v45];
        id v27 = v45;
        uint64_t v28 = bls_scenes_log();
        id v29 = v28;
        self = v41;
        char v4 = v42;
        if (v27 || (v26 & 1) == 0)
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v27, "bls_loggingString");
            v37 = id v36 = v27;
            processIdentity = v41->_processIdentity;
            *(_DWORD *)buf = 134218754;
            uint64_t v51 = v41;
            __int16 v52 = 2114;
            v53 = v37;
            __int16 v54 = 2114;
            uint64_t v55 = (RBSProcessIdentity *)v25;
            __int16 v56 = 2114;
            v57 = processIdentity;
            _os_log_fault_impl(&dword_21FCFC000, v29, OS_LOG_TYPE_FAULT, "%p error:%{public}@ failed to reacquire rb assertion:%{public}@ for process:%{public}@", buf, 0x2Au);

            id v27 = v36;
          }
        }
        else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v30 = v41->_processIdentity;
          *(_DWORD *)buf = 134218498;
          uint64_t v51 = v41;
          __int16 v52 = 2114;
          v53 = v25;
          __int16 v54 = 2114;
          uint64_t v55 = v30;
          _os_log_impl(&dword_21FCFC000, v29, OS_LOG_TYPE_DEFAULT, "%p (reacquire) acquired rbs assertion:%{public}@ for process:%{public}@", buf, 0x20u);
        }

        objc_storeStrong(location, v15);
        uint64_t v31 = v41->_lock_rbsAssertion;
        v41->_lock_rbsAssertion = (RBSAssertion *)v25;
        double v11 = v25;

        objc_storeStrong(p_lock_durationCalculator, v14);
      }
      else
      {
        v15 = 0;
        double v14 = 0;
      }

LABEL_26:
      p_lock = v44;
      id v8 = v43;
      if (v43) {
        goto LABEL_27;
      }
      goto LABEL_30;
    }
  }
LABEL_31:
  lock_acquiredAssertion = self->_lock_acquiredAssertion;
  if (!lock_acquiredAssertion && [(NSMapTable *)*p_lock_aggregated count])
  {
    v34 = bls_scenes_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
      [(BLSHAggregateProcessAssertion *)(uint64_t)self invalidateAggregatedAssertion:v34];
    }
  }
  os_unfair_lock_unlock(p_lock);

  return lock_acquiredAssertion != 0;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_invalidated)
  {
    [(RBSAssertion *)self->_lock_rbsAssertion invalidate];
    lock_rbsAssertion = self->_lock_rbsAssertion;
    self->_lock_rbsAssertion = 0;

    self->_lock_invalidated = 1;
  }

  os_unfair_lock_unlock(p_lock);
}

- (os_state_data_s)stateDataWithHints:(os_state_hints_s *)a3
{
  uint64_t v3 = [(BLSHAggregateProcessAssertion *)self debugDescription];
  char v4 = (os_state_data_s *)BLSStateDataWithTitleDescriptionAndHints();

  return v4;
}

- (NSString)debugDescription
{
  uint64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = (id)[v3 appendBool:self->_lock_invalidated withName:@"invalidated" ifEqualTo:1];
  BSContinuousMachTimeNow();
  id v7 = (id)[v3 appendDouble:@"elapsed" withName:3 decimalPrecision:v6 - self->_initTimestamp];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __49__BLSHAggregateProcessAssertion_debugDescription__block_invoke;
  double v14 = &unk_2645322D0;
  id v15 = v3;
  uint64_t v16 = self;
  id v8 = v3;
  [v8 appendBodySectionWithName:0 multilinePrefix:0 block:&v11];
  os_unfair_lock_unlock(p_lock);
  uint64_t v9 = objc_msgSend(v8, "build", v11, v12, v13, v14);

  return (NSString *)v9;
}

void __49__BLSHAggregateProcessAssertion_debugDescription__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"RBSAssertion"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"acquiredAssertion"];
  char v4 = *(void **)(a1 + 32);
  id v6 = [*(id *)(*(void *)(a1 + 40) + 8) keyEnumerator];
  id v5 = [v6 allObjects];
  [v4 appendArraySection:v5 withName:@"aggregatedAssertions" skipIfEmpty:0];
}

- (RBSProcessIdentity)processIdentity
{
  return self->_processIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_lock_durationCalculator, 0);
  objc_storeStrong((id *)&self->_lock_acquiredAssertion, 0);
  objc_storeStrong((id *)&self->_lock_rbsAssertion, 0);

  objc_storeStrong((id *)&self->_lock_aggregated, 0);
}

+ (void)classLock_aggregateForProcessIdentity:shouldCreate:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)acquireAggregatedAssertion:completion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)acquireAggregatedAssertion:completion:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)invalidateAggregatedAssertion:(NSObject *)a3 .cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v6 = [*a2 count];
  id v7 = *a2;
  int v8 = 134218498;
  uint64_t v9 = a1;
  __int16 v10 = 1024;
  int v11 = v6;
  __int16 v12 = 2112;
  id v13 = v7;
  _os_log_fault_impl(&dword_21FCFC000, a3, OS_LOG_TYPE_FAULT, "%p shouldInvalidate but still has aggregated count:%d — %@", (uint8_t *)&v8, 0x1Cu);
}

- (void)invalidateAggregatedAssertion:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 explanation];
  int v6 = 134218242;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_21FCFC000, a3, OS_LOG_TYPE_DEBUG, "%p invalidateAggregatedAssertion: invalidating RBS assertion %{public}@", (uint8_t *)&v6, 0x16u);
}

@end