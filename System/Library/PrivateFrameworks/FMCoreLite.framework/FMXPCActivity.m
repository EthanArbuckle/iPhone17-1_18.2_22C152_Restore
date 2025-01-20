@interface FMXPCActivity
- (BOOL)checkedInAtLeastOnce;
- (BOOL)continue;
- (BOOL)defer;
- (BOOL)done;
- (BOOL)shouldDefer;
- (FMQueueSynchronizer)queueSynchronizer;
- (FMXPCActivity)initWithName:(id)a3 qos:(unsigned int)a4 criteriaBlock:(id)a5 handler:(id)a6;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)activity;
- (id)_getActivity;
- (id)criteriaBlock;
- (id)getCriteria;
- (id)handlerBlock;
- (id)registrationBlock;
- (int64_t)updateCriteriaForActivity:(id)a3;
- (void)activityHandler:(id)a3;
- (void)continue;
- (void)defer;
- (void)done;
- (void)getCriteria;
- (void)processCheckin:(id)a3;
- (void)register;
- (void)setActivity:(id)a3;
- (void)setCheckedInAtLeastOnce:(BOOL)a3;
- (void)setCriteriaBlock:(id)a3;
- (void)setHandlerBlock:(id)a3;
- (void)setName:(id)a3;
- (void)setQueue:(id)a3;
- (void)setQueueSynchronizer:(id)a3;
- (void)setRegistrationBlock:(id)a3;
- (void)shouldDefer;
- (void)unregister;
- (void)updateCriteria;
@end

@implementation FMXPCActivity

- (FMXPCActivity)initWithName:(id)a3 qos:(unsigned int)a4 criteriaBlock:(id)a5 handler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v27.receiver = self;
  v27.super_class = (Class)FMXPCActivity;
  v12 = [(FMXPCActivity *)&v27 init];
  if (v12)
  {
    id v13 = [NSString stringWithFormat:@"FMXPCActivity-%@", v9];
    v14 = (const char *)[v13 UTF8String];
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create(v14, v15);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v16;

    v18 = [[FMQueueSynchronizer alloc] initWithQueue:v12->_queue];
    queueSynchronizer = v12->_queueSynchronizer;
    v12->_queueSynchronizer = v18;

    v12->lock._os_unfair_lock_opaque = 0;
    uint64_t v20 = [v9 copy];
    name = v12->_name;
    v12->_name = (NSString *)v20;

    uint64_t v22 = MEMORY[0x1B3EB3F00](v10);
    id criteriaBlock = v12->_criteriaBlock;
    v12->_id criteriaBlock = (id)v22;

    uint64_t v24 = MEMORY[0x1B3EB3F00](v11);
    id handlerBlock = v12->_handlerBlock;
    v12->_id handlerBlock = (id)v24;

    [(FMXPCActivity *)v12 register];
  }

  return v12;
}

- (BOOL)shouldDefer
{
  v2 = [(FMXPCActivity *)self _getActivity];
  v3 = v2;
  if (v2)
  {
    BOOL should_defer = xpc_activity_should_defer(v2);
  }
  else
  {
    v5 = LogCategory_FMXPCActivity();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[FMXPCActivity shouldDefer]();
    }

    BOOL should_defer = 0;
  }

  return should_defer;
}

- (BOOL)defer
{
  v2 = [(FMXPCActivity *)self _getActivity];
  v3 = v2;
  if (v2)
  {
    BOOL v4 = xpc_activity_set_state(v2, 3);
  }
  else
  {
    v5 = LogCategory_FMXPCActivity();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[FMXPCActivity defer]();
    }

    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)continue
{
  v2 = [(FMXPCActivity *)self _getActivity];
  v3 = v2;
  if (v2)
  {
    BOOL v4 = xpc_activity_set_state(v2, 4);
  }
  else
  {
    v5 = LogCategory_FMXPCActivity();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[FMXPCActivity continue]();
    }

    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)done
{
  v2 = [(FMXPCActivity *)self _getActivity];
  v3 = v2;
  if (v2)
  {
    BOOL v4 = xpc_activity_set_state(v2, 5);
  }
  else
  {
    v5 = LogCategory_FMXPCActivity();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[FMXPCActivity done]();
    }

    BOOL v4 = 0;
  }

  return v4;
}

- (id)getCriteria
{
  v2 = [(FMXPCActivity *)self _getActivity];
  v3 = v2;
  if (v2)
  {
    BOOL v4 = (FMXPCActivityCriteria *)xpc_activity_copy_criteria(v2);
    v5 = v4;
    if (v4) {
      BOOL v4 = [[FMXPCActivityCriteria alloc] initWithXPCObject:v4];
    }
    v6 = v4;

    v7 = v6;
  }
  else
  {
    v6 = LogCategory_FMXPCActivity();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[FMXPCActivity getCriteria]();
    }
    v7 = 0;
  }

  return v7;
}

- (void)updateCriteria
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  BOOL v4 = LogCategory_FMXPCActivity();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    v12 = self;
    _os_log_impl(&dword_1B2FB9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: updateCriteria called on FMXPCActivity", (uint8_t *)&v11, 0xCu);
  }

  v5 = [(FMXPCActivity *)self _getActivity];
  if (v5)
  {
    [(FMXPCActivity *)self updateCriteriaForActivity:v5];
  }
  else
  {
    BOOL v6 = [(FMXPCActivity *)self checkedInAtLeastOnce];
    v7 = LogCategory_FMXPCActivity();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        id v9 = [(FMXPCActivity *)self name];
        int v11 = 138543618;
        v12 = self;
        __int16 v13 = 2114;
        v14 = v9;
        _os_log_impl(&dword_1B2FB9000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: No current activity -- re-registering: %{public}@", (uint8_t *)&v11, 0x16u);
      }
      [(FMXPCActivity *)self register];
    }
    else
    {
      if (v8)
      {
        id v10 = [(FMXPCActivity *)self name];
        int v11 = 138543618;
        v12 = self;
        __int16 v13 = 2114;
        v14 = v10;
        _os_log_impl(&dword_1B2FB9000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: No current activity -- hasn't checked in yet: %{public}@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)register
{
  v3 = [(FMXPCActivity *)self queueSynchronizer];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __25__FMXPCActivity_register__block_invoke;
  v4[3] = &unk_1E60193F0;
  v4[4] = self;
  [v3 conditionalSync:v4];
}

void __25__FMXPCActivity_register__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  v7 = __25__FMXPCActivity_register__block_invoke_2;
  BOOL v8 = &unk_1E6019B78;
  objc_copyWeak(&v9, &location);
  [*(id *)(a1 + 32) setRegistrationBlock:&v5];
  objc_msgSend(*(id *)(a1 + 32), "name", v5, v6, v7, v8);
  id v2 = objc_claimAutoreleasedReturnValue();
  v3 = (const char *)[v2 UTF8String];
  BOOL v4 = [*(id *)(a1 + 32) registrationBlock];
  xpc_activity_register(v3, (xpc_object_t)*MEMORY[0x1E4F14158], v4);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __25__FMXPCActivity_register__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained activityHandler:v3];
}

- (void)activityHandler:(id)a3
{
  v7 = (_xpc_activity_s *)a3;
  xpc_activity_state_t state = xpc_activity_get_state(v7);
  if (state)
  {
    xpc_activity_state_t v5 = state;
    uint64_t v6 = [(FMXPCActivity *)self handlerBlock];
    ((void (**)(void, FMXPCActivity *, xpc_activity_state_t))v6)[2](v6, self, v5);
  }
  else
  {
    [(FMXPCActivity *)self processCheckin:v7];
  }
}

- (void)processCheckin:(id)a3
{
  p_lock = &self->lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(FMXPCActivity *)self setActivity:v5];
  [(FMXPCActivity *)self setCheckedInAtLeastOnce:1];
  int64_t v6 = [(FMXPCActivity *)self updateCriteriaForActivity:v5];

  os_unfair_lock_unlock(p_lock);
  v7 = [(FMXPCActivity *)self handlerBlock];
  v7[2](v7, self, v6);
}

- (id)_getActivity
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__6;
  int v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  id v3 = [(FMXPCActivity *)self queueSynchronizer];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__FMXPCActivity__getActivity__block_invoke;
  v6[3] = &unk_1E60192D8;
  v6[4] = self;
  v6[5] = &v7;
  [v3 conditionalSync:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __29__FMXPCActivity__getActivity__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) activity];
  return MEMORY[0x1F41817F8]();
}

- (int64_t)updateCriteriaForActivity:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (_xpc_activity_s *)a3;
  xpc_object_t v5 = xpc_activity_copy_criteria(v4);
  if (v5) {
    int64_t v6 = [[FMXPCActivityCriteria alloc] initWithXPCObject:v5];
  }
  else {
    int64_t v6 = 0;
  }
  uint64_t v7 = [(FMXPCActivity *)self criteriaBlock];
  ((void (**)(void, FMXPCActivityCriteria *))v7)[2](v7, v6);
  BOOL v8 = (FMXPCActivityCriteria *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v8)
    {
      BOOL v9 = [(FMXPCActivityCriteria *)v6 isEqual:v8];
      id v10 = LogCategory_FMXPCActivity();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v11)
        {
          id v12 = [(FMXPCActivityCriteria *)v8 debugDescription];
          int v18 = 138543618;
          v19 = self;
          __int16 v20 = 2114;
          v21 = v12;
          _os_log_impl(&dword_1B2FB9000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Keeping existing criteria for: %{public}@", (uint8_t *)&v18, 0x16u);
        }
        goto LABEL_20;
      }
      if (v11)
      {
        int v18 = 138543618;
        v19 = self;
        __int16 v20 = 2114;
        v21 = v6;
        _os_log_impl(&dword_1B2FB9000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Existing criteria: %{public}@", (uint8_t *)&v18, 0x16u);
      }

      __int16 v13 = LogCategory_FMXPCActivity();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138543618;
        v19 = self;
        __int16 v20 = 2114;
        v21 = v8;
        v14 = "%{public}@: Registering updated criteria: %{public}@";
        goto LABEL_18;
      }
      goto LABEL_19;
    }
  }
  else if (v8)
  {
    __int16 v13 = LogCategory_FMXPCActivity();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543618;
      v19 = self;
      __int16 v20 = 2114;
      v21 = v8;
      v14 = "%{public}@: Registering new criteria: %{public}@";
LABEL_18:
      _os_log_impl(&dword_1B2FB9000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, 0x16u);
    }
LABEL_19:

    dispatch_queue_t v16 = [(FMXPCActivityCriteria *)v8 xpcDictionary];
    xpc_activity_set_criteria(v4, v16);

LABEL_20:
    int64_t v15 = 3;
    goto LABEL_21;
  }
  [(FMXPCActivity *)self unregister];
  int64_t v15 = 5;
LABEL_21:

  return v15;
}

- (void)unregister
{
  id v3 = [(FMXPCActivity *)self queueSynchronizer];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__FMXPCActivity_unregister__block_invoke;
  v4[3] = &unk_1E60193F0;
  v4[4] = self;
  [v3 conditionalSync:v4];
}

void __27__FMXPCActivity_unregister__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) name];
  xpc_activity_unregister((const char *)[v2 UTF8String]);

  [*(id *)(a1 + 32) setRegistrationBlock:0];
  [*(id *)(a1 + 32) setActivity:0];
  id v3 = LogCategory_FMXPCActivity();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1B2FB9000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Unregistered criteria", (uint8_t *)&v5, 0xCu);
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (FMQueueSynchronizer)queueSynchronizer
{
  return self->_queueSynchronizer;
}

- (void)setQueueSynchronizer:(id)a3
{
}

- (id)criteriaBlock
{
  return self->_criteriaBlock;
}

- (void)setCriteriaBlock:(id)a3
{
}

- (id)handlerBlock
{
  return self->_handlerBlock;
}

- (void)setHandlerBlock:(id)a3
{
}

- (OS_xpc_object)activity
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activity);
  return (OS_xpc_object *)WeakRetained;
}

- (void)setActivity:(id)a3
{
}

- (BOOL)checkedInAtLeastOnce
{
  return self->_checkedInAtLeastOnce;
}

- (void)setCheckedInAtLeastOnce:(BOOL)a3
{
  self->_checkedInAtLeastOnce = a3;
}

- (id)registrationBlock
{
  return self->_registrationBlock;
}

- (void)setRegistrationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_registrationBlock, 0);
  objc_destroyWeak((id *)&self->_activity);
  objc_storeStrong(&self->_handlerBlock, 0);
  objc_storeStrong(&self->_criteriaBlock, 0);
  objc_storeStrong((id *)&self->_queueSynchronizer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)shouldDefer
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FB9000, v0, v1, "%{public}@: shouldDefer called on invalidated FMXPCActivity", v2, v3, v4, v5, v6);
}

- (void)defer
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FB9000, v0, v1, "%{public}@: defer called on invalidated FMXPCActivity", v2, v3, v4, v5, v6);
}

- (void)continue
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FB9000, v0, v1, "%{public}@: continue called on invalidated FMXPCActivity", v2, v3, v4, v5, v6);
}

- (void)done
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FB9000, v0, v1, "%{public}@: done called on invalidated FMXPCActivity", v2, v3, v4, v5, v6);
}

- (void)getCriteria
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FB9000, v0, v1, "%{public}@: getCriteria called on invalidated FMXPCActivity", v2, v3, v4, v5, v6);
}

@end