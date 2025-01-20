@interface HDXPCPeriodicActivity
+ (void)registerDisabledPeriodicActivityWithName:(id)a3 loggingCategory:(id)a4;
- (BOOL)isWaiting;
- (BOOL)shouldDefer;
- (BOOL)xpcActivity_setCompletionStatus:(int64_t)a3 activity:(id)a4;
- (BOOL)xpcActivity_setState:(int64_t)a3 activity:(id)a4;
- (BOOL)xpcActivity_shouldDefer:(id)a3;
- (HDXPCPeriodicActivity)initWithName:(id)a3 baseInterval:(double)a4 criteria:(id)a5 loggingCategory:(id)a6 handler:(id)a7;
- (NSDate)earliestRunDate;
- (NSDate)lastSuccessfulRunDate;
- (NSString)name;
- (OS_os_log)loggingCategory;
- (OS_xpc_object)criteria;
- (OS_xpc_object)currentActivity;
- (OS_xpc_object)currentCriteria;
- (const)_lock_errorCount;
- (double)_lock_modifiedIntervalForCurrentState;
- (double)baseInterval;
- (double)modifiedIntervalForCurrentState;
- (id)_dateForDefaultsKey:(uint64_t)a1;
- (id)description;
- (id)xpcActivity_copyCriteria:(id)a3;
- (int64_t)errorCount;
- (int64_t)xpcActivity_getState:(id)a3;
- (void)_handleXPCActivityCallback:(uint64_t)a1;
- (void)_lock_activityFinishedWithResult:(void *)a3 minimumRetryInterval:(void *)a4 activityStartDate:(double)a5 error:;
- (void)_lock_incrementErrorCount;
- (void)_lock_setCriteria:(uint64_t)a1;
- (void)_lock_setLastSuccessfulRunDate:(uint64_t)a1;
- (void)_performActivity:(uint64_t)a1;
- (void)_performCurrentActivityWithCompletion:(uint64_t)a1;
- (void)_updateStateForFinishedActivity:(uint64_t)a3 result:;
- (void)dealloc;
- (void)didPerformActivityWithResult:(int64_t)a3 minimumRetryInterval:(double)a4 activityStartDate:(id)a5 error:(id)a6;
- (void)externalConditionsChanged;
- (void)registerActivity;
- (void)resetIntervalWithCriteria:(id)a3;
- (void)setCriteria:(id)a3;
- (void)unitTest_reset;
- (void)unitTest_setActivityShim:(id)a3;
- (void)unitTest_synthesizeActivityFireWithCompletion:(id)a3;
- (void)unregisterActivity;
- (void)updateCriteriaForModifiedIntervalForCurrentState;
- (void)xpcActivity_register:(const char *)a3 criteria:(id)a4 handler:(id)a5;
- (void)xpcActivity_setCriteria:(id)a3 activity:(id)a4;
- (void)xpcActivity_unregister:(const char *)a3;
@end

@implementation HDXPCPeriodicActivity

- (HDXPCPeriodicActivity)initWithName:(id)a3 baseInterval:(double)a4 criteria:(id)a5 loggingCategory:(id)a6 handler:(id)a7
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v30.receiver = self;
  v30.super_class = (Class)HDXPCPeriodicActivity;
  v16 = [(HDXPCPeriodicActivity *)&v30 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    name = v16->_name;
    v16->_name = (NSString *)v17;

    v16->_baseInterval = a4;
    v19 = (OS_xpc_object *)xpc_copy(v13);
    criteria = v16->_criteria;
    v16->_criteria = v19;

    uint64_t v21 = [v15 copy];
    id handler = v16->_handler;
    v16->_id handler = (id)v21;

    objc_storeStrong((id *)&v16->_loggingCategory, a6);
    v16->_lock._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock(&v16->_lock);
    _HKInitializeLogging();
    loggingCategory = v16->_loggingCategory;
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v16->_name;
      v25 = loggingCategory;
      v26 = _HDXPCPeriodicActivityLastSuccessfulRunUserDefaultsKey(v24);
      v27 = -[HDXPCPeriodicActivity _dateForDefaultsKey:]((uint64_t)v16, v26);
      v28 = -[HDXPCPeriodicActivity _lock_errorCount]((const os_unfair_lock *)v16);
      *(_DWORD *)buf = 138543874;
      id v32 = v12;
      __int16 v33 = 2112;
      v34 = v27;
      __int16 v35 = 2048;
      v36 = v28;
      _os_log_impl(&dword_21BFB4000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Initialized; Last Success: %@ (%ld errors since)",
        buf,
        0x20u);
    }
    os_unfair_lock_unlock(&v16->_lock);
    objc_storeWeak((id *)&v16->_activityShim, v16);
  }

  return v16;
}

- (id)_dateForDefaultsKey:(uint64_t)a1
{
  if (a1)
  {
    v2 = (void *)MEMORY[0x263EFFA40];
    id v3 = a2;
    v4 = [v2 standardUserDefaults];
    v5 = [v4 objectForKey:v3];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (const)_lock_errorCount
{
  if (result)
  {
    v1 = result;
    os_unfair_lock_assert_owner(result + 2);
    v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v3 = _HDXPCPeriodicActivityErrorCountUserDefaultsKey(*(void **)&v1[16]._os_unfair_lock_opaque);
    uint64_t v4 = [v2 integerForKey:v3];

    return (const os_unfair_lock *)v4;
  }
  return result;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_21BFB4000, v0, OS_LOG_TYPE_FAULT, "[%{public}@]: Client bug: Dealloc before unregistration.", v1, 0xCu);
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  name = self->_name;
  v8 = @"idle";
  v9 = name;
  switch(self->_state)
  {
    case 0:
      break;
    case 1:
      v8 = @"starting";
      goto LABEL_6;
    case 2:
      v8 = @"running";
      goto LABEL_6;
    case 3:
      v8 = @"waiting";
LABEL_6:
      v9 = self->_name;
      break;
    default:
      objc_msgSend(cfstr_ColumnNullabil.isa, "stringWithFormat:", @"unknown(%ld)", self->_state);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = self->_name;
      break;
  }
  v10 = _HDXPCPeriodicActivityLastSuccessfulRunUserDefaultsKey(v9);
  v11 = -[HDXPCPeriodicActivity _dateForDefaultsKey:]((uint64_t)self, v10);
  id v12 = [v4 stringWithFormat:@"<%@:%p %@: %@ Last Success: %@ (%ld errors since) Interval: %0.2lfs>", v6, self, name, v8, v11, -[HDXPCPeriodicActivity _lock_errorCount]((const os_unfair_lock *)self), *(void *)&self->_baseInterval];

  os_unfair_lock_unlock(p_lock);

  return v12;
}

+ (void)registerDisabledPeriodicActivityWithName:(id)a3 loggingCategory:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ((HDIsUnitTesting() & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v5;
      _os_log_impl(&dword_21BFB4000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Registering DISABLED.", buf, 0xCu);
    }
    id v7 = v5;
    v8 = (const char *)[v7 UTF8String];
    v9 = (void *)*MEMORY[0x263EF8188];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __82__HDXPCPeriodicActivity_registerDisabledPeriodicActivityWithName_loggingCategory___block_invoke;
    v10[3] = &unk_2643D4418;
    v11 = v6;
    id v12 = v7;
    xpc_activity_register(v8, v9, v10);
  }
}

void __82__HDXPCPeriodicActivity_registerDisabledPeriodicActivityWithName_loggingCategory___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x21D49F400]();
  if (xpc_activity_get_state(v3))
  {
    if (!xpc_activity_set_state(v3, 5))
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR)) {
        __82__HDXPCPeriodicActivity_registerDisabledPeriodicActivityWithName_loggingCategory___block_invoke_cold_1();
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v5 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_21BFB4000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Checked in DISABLED.", (uint8_t *)&v7, 0xCu);
    }
    xpc_activity_unregister((const char *)[*(id *)(a1 + 40) UTF8String]);
  }
}

- (void)registerActivity
{
  char v2 = 0;
  uint64_t v13 = *MEMORY[0x263EF8340];
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_registered, (unsigned __int8 *)&v2, 1u);
  if (!v2)
  {
    _HKInitializeLogging();
    loggingCategory = self->_loggingCategory;
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      *(_DWORD *)buf = 138543362;
      id v12 = name;
      _os_log_impl(&dword_21BFB4000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Registering.", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_activityShim);
    int v7 = [(NSString *)self->_name UTF8String];
    criteria = self->_criteria;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __41__HDXPCPeriodicActivity_registerActivity__block_invoke;
    v9[3] = &unk_2643D4440;
    objc_copyWeak(&v10, (id *)buf);
    objc_msgSend(WeakRetained, "xpcActivity_register:criteria:handler:", v7, criteria, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

void __41__HDXPCPeriodicActivity_registerActivity__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = (void *)MEMORY[0x21D49F400]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDXPCPeriodicActivity _handleXPCActivityCallback:]((uint64_t)WeakRetained, v5);
}

- (void)_handleXPCActivityCallback:(uint64_t)a1
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v5 = objc_msgSend(WeakRetained, "xpcActivity_getState:", v3);

    _HKInitializeLogging();
    uint64_t v6 = *(NSObject **)(a1 + 72);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        uint64_t v8 = *(void *)(a1 + 64);
        int v10 = 138543362;
        uint64_t v11 = v8;
        _os_log_impl(&dword_21BFB4000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Fired.", (uint8_t *)&v10, 0xCu);
      }
      -[HDXPCPeriodicActivity _performActivity:](a1, v3);
    }
    else if (v7)
    {
      uint64_t v9 = *(void *)(a1 + 64);
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_21BFB4000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Checked in.", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)unregisterActivity
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = 1;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_registered, (unsigned __int8 *)&v2, 0);
  if (v2 == 1)
  {
    _HKInitializeLogging();
    loggingCategory = self->_loggingCategory;
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      int v7 = 138543362;
      uint64_t v8 = name;
      _os_log_impl(&dword_21BFB4000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Unregistering.", (uint8_t *)&v7, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_activityShim);
    objc_msgSend(WeakRetained, "xpcActivity_unregister:", -[NSString UTF8String](self->_name, "UTF8String"));
  }
}

- (OS_xpc_object)criteria
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  xpc_object_t v4 = xpc_copy(self->_criteria);
  os_unfair_lock_unlock(p_lock);

  return (OS_xpc_object *)v4;
}

- (void)setCriteria:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDXPCPeriodicActivity _lock_setCriteria:]((uint64_t)self, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_setCriteria:(uint64_t)a1
{
  xpc_object_t object2 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    if (!xpc_equal(*(xpc_object_t *)(a1 + 16), object2))
    {
      xpc_object_t v3 = xpc_copy(object2);
      xpc_object_t v4 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v3;

      if (*(void *)(a1 + 24))
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
        objc_msgSend(WeakRetained, "xpcActivity_setCriteria:activity:", object2, *(void *)(a1 + 24));
      }
      else
      {
        [(id)a1 unregisterActivity];
        [(id)a1 registerActivity];
      }
    }
  }
}

- (OS_xpc_object)currentActivity
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  xpc_object_t v4 = self->_currentActivity;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)didPerformActivityWithResult:(int64_t)a3 minimumRetryInterval:(double)a4 activityStartDate:(id)a5 error:(id)a6
{
  p_lock = &self->_lock;
  id v11 = a6;
  id v12 = a5;
  os_unfair_lock_lock(p_lock);
  -[HDXPCPeriodicActivity _lock_activityFinishedWithResult:minimumRetryInterval:activityStartDate:error:]((uint64_t)self, a3, v12, v11, a4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_activityFinishedWithResult:(void *)a3 minimumRetryInterval:(void *)a4 activityStartDate:(double)a5 error:
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    double v11 = fmax(a5, 0.0);
    id v12 = [MEMORY[0x263EFFA40] standardUserDefaults];
    if (v11 <= 0.0)
    {
      uint64_t v13 = _HDXPCPeriodicActivityEarliestNextRunUserDefaultsKey(*(void **)(a1 + 64));
      [v12 removeObjectForKey:v13];
    }
    else
    {
      uint64_t v13 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:v11];
      id v14 = _HDXPCPeriodicActivityEarliestNextRunUserDefaultsKey(*(void **)(a1 + 64));
      [v12 setObject:v13 forKey:v14];
    }
    switch(a2)
    {
      case 0:
        _HKInitializeLogging();
        uint64_t v15 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = *(void *)(a1 + 64);
          int v23 = 138543618;
          uint64_t v24 = v16;
          __int16 v25 = 2048;
          double v26 = v11;
          _os_log_impl(&dword_21BFB4000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@]: succeeded with minimum retry interval: %lfs", (uint8_t *)&v23, 0x16u);
        }
        -[HDXPCPeriodicActivity _lock_setLastSuccessfulRunDate:](a1, v9);
        break;
      case 1:
        _HKInitializeLogging();
        uint64_t v17 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = *(void *)(a1 + 64);
          int v23 = 138543362;
          uint64_t v24 = v18;
          _os_log_impl(&dword_21BFB4000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]: waiting for external conditions to change", (uint8_t *)&v23, 0xCu);
        }
        goto LABEL_11;
      case 2:
LABEL_11:
        _HKInitializeLogging();
        v19 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = *(void *)(a1 + 64);
          int v23 = 138543874;
          uint64_t v24 = v20;
          __int16 v25 = 2048;
          double v26 = v11;
          __int16 v27 = 2114;
          id v28 = v10;
          _os_log_error_impl(&dword_21BFB4000, v19, OS_LOG_TYPE_ERROR, "[%{public}@]: failed but will retry on the normal schedule with minimum interval %0.2lfs: %{public}@.", (uint8_t *)&v23, 0x20u);
        }
        break;
      case 3:
        _HKInitializeLogging();
        uint64_t v21 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = *(void *)(a1 + 64);
          int v23 = 138543874;
          uint64_t v24 = v22;
          __int16 v25 = 2048;
          double v26 = v11;
          __int16 v27 = 2114;
          id v28 = v10;
          _os_log_error_impl(&dword_21BFB4000, v21, OS_LOG_TYPE_ERROR, "[%{public}@]: failed and will retry after minimum interval %0.2lfs: %{public}@.", (uint8_t *)&v23, 0x20u);
        }
        -[HDXPCPeriodicActivity _lock_incrementErrorCount](a1);
        break;
      case 4:
        _HKInitializeLogging();
        if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
          -[HDXPCPeriodicActivity _lock_activityFinishedWithResult:minimumRetryInterval:activityStartDate:error:]();
        }
        break;
      default:
        break;
    }
  }
}

- (int64_t)errorCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  xpc_object_t v4 = -[HDXPCPeriodicActivity _lock_errorCount]((const os_unfair_lock *)self);
  os_unfair_lock_unlock(p_lock);
  return (int64_t)v4;
}

- (BOOL)shouldDefer
{
  xpc_object_t v3 = [(HDXPCPeriodicActivity *)self currentActivity];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_activityShim);
    char v5 = objc_msgSend(WeakRetained, "xpcActivity_shouldDefer:", v3);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (NSDate)lastSuccessfulRunDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  xpc_object_t v4 = _HDXPCPeriodicActivityLastSuccessfulRunUserDefaultsKey(self->_name);
  char v5 = -[HDXPCPeriodicActivity _dateForDefaultsKey:]((uint64_t)self, v4);

  os_unfair_lock_unlock(p_lock);

  return (NSDate *)v5;
}

- (NSDate)earliestRunDate
{
  xpc_object_t v3 = _HDXPCPeriodicActivityEarliestNextRunUserDefaultsKey(self->_name);
  xpc_object_t v4 = -[HDXPCPeriodicActivity _dateForDefaultsKey:]((uint64_t)self, v3);

  return (NSDate *)v4;
}

- (BOOL)isWaiting
{
  int v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_state == 3;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (OS_xpc_object)currentCriteria
{
  xpc_object_t v3 = [(HDXPCPeriodicActivity *)self currentActivity];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_activityShim);
    char v5 = objc_msgSend(WeakRetained, "xpcActivity_copyCriteria:", v3);
  }
  else
  {
    char v5 = 0;
  }

  return (OS_xpc_object *)v5;
}

- (void)externalConditionsChanged
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t state = self->_state;
  if (state == 3)
  {
    _HKInitializeLogging();
    loggingCategory = self->_loggingCategory;
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      int v9 = 138543362;
      id v10 = name;
      _os_log_impl(&dword_21BFB4000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Conditions changed while waiting; kicking off a run.",
        (uint8_t *)&v9,
        0xCu);
    }
    os_unfair_lock_unlock(p_lock);
    -[HDXPCPeriodicActivity _performCurrentActivityWithCompletion:]((uint64_t)self, &__block_literal_global);
  }
  else
  {
    if (state == 2)
    {
      _HKInitializeLogging();
      char v5 = self->_loggingCategory;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = self->_name;
        int v9 = 138543362;
        id v10 = v6;
        _os_log_impl(&dword_21BFB4000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Conditions changed while running; recording for immediate reconsideration.",
          (uint8_t *)&v9,
          0xCu);
      }
      self->_conditionsChanged = 1;
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)_performCurrentActivityWithCompletion:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if ((*(void *)(a1 + 32) & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      *(void *)(a1 + 32) = 2;
      id v4 = *(id *)(a1 + 24);
      *(unsigned char *)(a1 + 40) = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      char v5 = [MEMORY[0x263F0A2B0] transactionWithOwner:a1 activityName:*(void *)(a1 + 64)];
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      _HKInitializeLogging();
      int v7 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 138543362;
        uint64_t v31 = v8;
        _os_log_impl(&dword_21BFB4000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Calling out to client handler", buf, 0xCu);
      }
      int v9 = _HKLogPersistedSignposts();
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, (const void *)a1);

      _HKInitializeLogging();
      uint64_t v11 = _HKLogPersistedSignposts();
      BOOL v12 = os_signpost_enabled(v11);

      if (v12)
      {
        uint64_t v13 = _HKLogPersistedSignposts();
        id v14 = v13;
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
        {
          uint64_t v15 = *(void *)(a1 + 64);
          *(_DWORD *)buf = 138543362;
          uint64_t v31 = v15;
          _os_signpost_emit_with_name_impl(&dword_21BFB4000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "HDXPCPeriodicActivity", "name=%{public}@", buf, 0xCu);
        }
      }
      uint64_t v16 = *(void *)(a1 + 48);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __63__HDXPCPeriodicActivity__performCurrentActivityWithCompletion___block_invoke;
      v24[3] = &unk_2643D4488;
      v24[4] = a1;
      CFAbsoluteTime v28 = Current;
      os_signpost_id_t v29 = v10;
      id v26 = v4;
      id v27 = v3;
      id v25 = v5;
      uint64_t v17 = *(void (**)(uint64_t, uint64_t, void *))(v16 + 16);
      id v18 = v4;
      id v19 = v5;
      v17(v16, a1, v24);
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      _HKInitializeLogging();
      uint64_t v20 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = *(void *)(a1 + 64);
        uint64_t v22 = v20;
        int v23 = NSStringFromSelector(sel__performCurrentActivityWithCompletion_);
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v21;
        __int16 v32 = 2114;
        __int16 v33 = v23;
        _os_log_impl(&dword_21BFB4000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ called while not starting or waiting.", buf, 0x16u);
      }
    }
  }
}

- (double)modifiedIntervalForCurrentState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v4 = -[HDXPCPeriodicActivity _lock_modifiedIntervalForCurrentState]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (double)_lock_modifiedIntervalForCurrentState
{
  if (!a1) {
    return 0.0;
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  double v2 = *(double *)(a1 + 80);
  int64_t v3 = (int64_t)-[HDXPCPeriodicActivity _lock_errorCount]((const os_unfair_lock *)a1);
  if (v3 >= 1)
  {
    unint64_t v4 = 20;
    if (v3 < 20) {
      unint64_t v4 = v3;
    }
    double v2 = *(double *)(a1 + 80);
    double v5 = 0.0;
    BOOL v6 = v4 >= 2;
    uint64_t v7 = v4 - 2;
    if (v6) {
      double v5 = exp2((double)v7) * (v2 * 0.025);
    }
    if (v5 < v2) {
      double v2 = v5;
    }
  }
  uint64_t v8 = _HDXPCPeriodicActivityEarliestNextRunUserDefaultsKey(*(void **)(a1 + 64));
  int v9 = -[HDXPCPeriodicActivity _dateForDefaultsKey:](a1, v8);

  if (v9) {
    [v9 timeIntervalSinceNow];
  }
  else {
    double v10 = 0.0;
  }
  if (v2 < v10) {
    double v2 = v10;
  }

  return v2;
}

- (void)updateCriteriaForModifiedIntervalForCurrentState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v4 = -[HDXPCPeriodicActivity _lock_modifiedIntervalForCurrentState]((uint64_t)self);
  xpc_dictionary_set_int64(self->_criteria, (const char *)*MEMORY[0x263EF81D8], (uint64_t)v4);
  -[HDXPCPeriodicActivity _lock_setCriteria:]((uint64_t)self, self->_criteria);

  os_unfair_lock_unlock(p_lock);
}

- (void)resetIntervalWithCriteria:(id)a3
{
  [(HDXPCPeriodicActivity *)self setCriteria:a3];
  [(HDXPCPeriodicActivity *)self unregisterActivity];

  [(HDXPCPeriodicActivity *)self registerActivity];
}

- (void)_performActivity:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    char v6 = objc_msgSend(WeakRetained, "xpcActivity_setState:activity:", 4, v4);

    if (v6)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
      if (*(void *)(a1 + 32))
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        _HKInitializeLogging();
        uint64_t v7 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = *(void *)(a1 + 64);
          int v13 = 138543362;
          uint64_t v14 = v8;
          _os_log_impl(&dword_21BFB4000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Fired while already in progress; finishing activity immediately.",
            (uint8_t *)&v13,
            0xCu);
        }
        id v9 = objc_loadWeakRetained((id *)(a1 + 56));
        char v10 = objc_msgSend(v9, "xpcActivity_setState:activity:", 5, v4);

        if ((v10 & 1) == 0)
        {
          _HKInitializeLogging();
          if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
            -[HDXPCPeriodicActivity _performActivity:]();
          }
        }
      }
      else
      {
        *(void *)(a1 + 32) = 1;
        objc_storeStrong((id *)(a1 + 24), a2);
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        -[HDXPCPeriodicActivity _performCurrentActivityWithCompletion:](a1, &__block_literal_global_285);
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v11 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 64);
        int v13 = 138543362;
        uint64_t v14 = v12;
        _os_log_impl(&dword_21BFB4000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Failed to continue activity.", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

void __63__HDXPCPeriodicActivity__performCurrentActivityWithCompletion___block_invoke(uint64_t a1, unint64_t a2, void *a3, double a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = *(void *)(a1 + 32);
  char v10 = *(void **)(v8 + 64);
  id v9 = *(void **)(v8 + 72);
  double Current = CFAbsoluteTimeGetCurrent();
  double v12 = *(double *)(a1 + 64);
  int v13 = v9;
  id v14 = v10;
  id v15 = v7;
  double v16 = Current - v12;
  switch(a2)
  {
    case 0uLL:
      _HKInitializeLogging();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v31 = 138543618;
        *(void *)&v31[4] = v14;
        *(_WORD *)&v31[12] = 2048;
        *(double *)&v31[14] = v16;
        uint64_t v17 = "[%{public}@]: Completed successfully in %0.3lfs.";
        goto LABEL_6;
      }
      break;
    case 1uLL:
      _HKInitializeLogging();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v31 = 138543618;
        *(void *)&v31[4] = v14;
        *(_WORD *)&v31[12] = 2048;
        *(double *)&v31[14] = v16;
        uint64_t v17 = "[%{public}@]: Requested wait after %0.3lfs.";
LABEL_6:
        _os_log_impl(&dword_21BFB4000, v13, OS_LOG_TYPE_DEFAULT, v17, v31, 0x16u);
      }
      break;
    case 2uLL:
      _HKInitializeLogging();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v31 = 138543874;
        *(void *)&v31[4] = v14;
        *(_WORD *)&v31[12] = 2048;
        *(double *)&v31[14] = v16;
        *(_WORD *)&v31[22] = 2114;
        id v32 = v15;
        id v18 = "[%{public}@]: Failed with an ignorable error after %0.3lfs: %{public}@";
        goto LABEL_23;
      }
      break;
    case 3uLL:
      _HKInitializeLogging();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v31 = 138543874;
        *(void *)&v31[4] = v14;
        *(_WORD *)&v31[12] = 2048;
        *(double *)&v31[14] = v16;
        *(_WORD *)&v31[22] = 2114;
        id v32 = v15;
        id v18 = "[%{public}@]: Failed with an error after %0.3lfs and will be retried: %{public}@";
        goto LABEL_23;
      }
      break;
    case 4uLL:
      _HKInitializeLogging();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v31 = 138543874;
        *(void *)&v31[4] = v14;
        *(_WORD *)&v31[12] = 2048;
        *(double *)&v31[14] = v16;
        *(_WORD *)&v31[22] = 2114;
        id v32 = v15;
        id v18 = "[%{public}@]: Failed with a deferrable error after %0.3lfs: %{public}@";
LABEL_23:
        _os_log_error_impl(&dword_21BFB4000, v13, OS_LOG_TYPE_ERROR, v18, v31, 0x20u);
      }
      break;
    default:
      break;
  }

  _HKInitializeLogging();
  id v19 = _HKLogPersistedSignposts();
  BOOL v20 = os_signpost_enabled(v19);

  if (v20)
  {
    uint64_t v21 = _HKLogPersistedSignposts();
    uint64_t v22 = v21;
    os_signpost_id_t v23 = *(void *)(a1 + 72);
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 64);
      id v25 = HDStringFromXPCPeriodicActivityResult(a2);
      *(_DWORD *)uint64_t v31 = 138543618;
      *(void *)&v31[4] = v24;
      *(_WORD *)&v31[12] = 2114;
      *(void *)&v31[14] = v25;
      _os_signpost_emit_with_name_impl(&dword_21BFB4000, v22, OS_SIGNPOST_INTERVAL_END, v23, "HDXPCPeriodicActivity", "name=%{public}@, result=%{public}@", v31, 0x16u);
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v26 = *(void *)(a1 + 32);
  if (a2 == 1)
  {
    int v27 = *(unsigned __int8 *)(v26 + 40);
    *(void *)(v26 + 32) = 3;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    if (v27) {
      -[HDXPCPeriodicActivity _performCurrentActivityWithCompletion:](*(void *)(a1 + 32), &__block_literal_global_291);
    }
  }
  else
  {
    CFAbsoluteTime v28 = *(void **)(v26 + 24);
    *(void *)(v26 + 24) = 0;

    *(void *)(*(void *)(a1 + 32) + 32) = 0;
    uint64_t v29 = *(void *)(a1 + 32);
    objc_super v30 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:*(double *)(a1 + 64)];
    -[HDXPCPeriodicActivity _lock_activityFinishedWithResult:minimumRetryInterval:activityStartDate:error:](v29, a2, v30, v15, a4);

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    -[HDXPCPeriodicActivity _updateStateForFinishedActivity:result:](*(void *)(a1 + 32), *(void **)(a1 + 48), a2);
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  objc_msgSend(*(id *)(a1 + 40), "invalidate", *(_OWORD *)v31, *(void *)&v31[16], v32);
}

- (void)_updateStateForFinishedActivity:(uint64_t)a3 result:
{
  id v5 = a2;
  char v6 = v5;
  if (a1 && v5)
  {
    switch(a3)
    {
      case 0:
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
        char v12 = objc_msgSend(WeakRetained, "xpcActivity_setCompletionStatus:activity:", 0, v6);

        if ((v12 & 1) == 0)
        {
          _HKInitializeLogging();
          if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
            -[HDXPCPeriodicActivity _updateStateForFinishedActivity:result:].cold.4();
          }
        }
        break;
      case 1:
        _HKInitializeLogging();
        if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_FAULT)) {
          -[HDXPCPeriodicActivity _updateStateForFinishedActivity:result:]();
        }
        break;
      case 2:
      case 3:
        id v7 = objc_loadWeakRetained((id *)(a1 + 56));
        char v8 = objc_msgSend(v7, "xpcActivity_setCompletionStatus:activity:", 3, v6);

        if ((v8 & 1) == 0)
        {
          _HKInitializeLogging();
          if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
            goto LABEL_25;
          }
        }
        break;
      case 4:
        id v13 = objc_loadWeakRetained((id *)(a1 + 56));
        int v14 = objc_msgSend(v13, "xpcActivity_shouldDefer:", v6);

        if (v14)
        {
          id v15 = objc_loadWeakRetained((id *)(a1 + 56));
          char v16 = objc_msgSend(v15, "xpcActivity_setState:activity:", 3, v6);

          if ((v16 & 1) == 0)
          {
            _HKInitializeLogging();
            if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
              -[HDXPCPeriodicActivity _updateStateForFinishedActivity:result:].cold.5();
            }
          }
        }
        else
        {
          _HKInitializeLogging();
          if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
            -[HDXPCPeriodicActivity _updateStateForFinishedActivity:result:].cold.7();
          }
          os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
          -[HDXPCPeriodicActivity _lock_incrementErrorCount](a1);
          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
          id v17 = objc_loadWeakRetained((id *)(a1 + 56));
          char v18 = objc_msgSend(v17, "xpcActivity_setCompletionStatus:activity:", 1, v6);

          if ((v18 & 1) == 0)
          {
            _HKInitializeLogging();
            if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
              goto LABEL_25;
            }
          }
        }
        break;
      default:
        _HKInitializeLogging();
        if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
          -[HDXPCPeriodicActivity _updateStateForFinishedActivity:result:]();
        }
        id v9 = objc_loadWeakRetained((id *)(a1 + 56));
        char v10 = objc_msgSend(v9, "xpcActivity_setCompletionStatus:activity:", 0, v6);

        if ((v10 & 1) == 0)
        {
          _HKInitializeLogging();
          if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
LABEL_25:
          }
            -[HDXPCPeriodicActivity _updateStateForFinishedActivity:result:]();
        }
        break;
    }
  }
}

- (void)_lock_incrementErrorCount
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    double v2 = -[HDXPCPeriodicActivity _lock_errorCount]((const os_unfair_lock *)a1);
    id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int64_t v3 = _HDXPCPeriodicActivityErrorCountUserDefaultsKey(*(void **)(a1 + 64));
    [v4 setInteger:(char *)&v2->_os_unfair_lock_opaque + 1 forKey:v3];
  }
}

- (void)_lock_setLastSuccessfulRunDate:(uint64_t)a1
{
  id v7 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    if (v7)
    {
      int64_t v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
      id v4 = _HDXPCPeriodicActivityLastSuccessfulRunUserDefaultsKey(*(void **)(a1 + 64));
      [v3 setObject:v7 forKey:v4];
    }
    id v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
    char v6 = _HDXPCPeriodicActivityErrorCountUserDefaultsKey(*(void **)(a1 + 64));
    [v5 setInteger:0 forKey:v6];
  }
}

- (void)xpcActivity_register:(const char *)a3 criteria:(id)a4 handler:(id)a5
{
  xpc_object_t criteria = a4;
  id v7 = a5;
  if ((HDIsUnitTesting() & 1) == 0) {
    xpc_activity_register(a3, criteria, v7);
  }
}

- (void)xpcActivity_unregister:(const char *)a3
{
  if ((HDIsUnitTesting() & 1) == 0)
  {
    xpc_activity_unregister(a3);
  }
}

- (BOOL)xpcActivity_shouldDefer:(id)a3
{
  return xpc_activity_should_defer((xpc_activity_t)a3);
}

- (void)xpcActivity_setCriteria:(id)a3 activity:(id)a4
{
}

- (id)xpcActivity_copyCriteria:(id)a3
{
  xpc_object_t v3 = xpc_activity_copy_criteria((xpc_activity_t)a3);

  return v3;
}

- (int64_t)xpcActivity_getState:(id)a3
{
  return xpc_activity_get_state((xpc_activity_t)a3);
}

- (BOOL)xpcActivity_setState:(int64_t)a3 activity:(id)a4
{
  return xpc_activity_set_state((xpc_activity_t)a4, a3);
}

- (BOOL)xpcActivity_setCompletionStatus:(int64_t)a3 activity:(id)a4
{
  return MEMORY[0x270EDBCD8](a4, a3);
}

- (void)unitTest_setActivityShim:(id)a3
{
  id v5 = (HDXPCPeriodicActivity *)a3;
  os_unfair_lock_lock(&self->_lock);
  id v4 = v5;
  if (!v5) {
    id v4 = self;
  }
  objc_storeWeak((id *)&self->_activityShim, v4);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)unitTest_reset
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDXPCPeriodicActivity _lock_setLastSuccessfulRunDate:]((uint64_t)self, 0);
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v5 = _HDXPCPeriodicActivityErrorCountUserDefaultsKey(self->_name);
  [v4 setInteger:0 forKey:v5];

  char v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v7 = _HDXPCPeriodicActivityEarliestNextRunUserDefaultsKey(self->_name);
  [v6 removeObjectForKey:v7];

  os_unfair_lock_unlock(p_lock);
}

- (void)unitTest_synthesizeActivityFireWithCompletion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[HDXPCPeriodicActivity _lock_setLastSuccessfulRunDate:]((uint64_t)self, 0);
  self->_int64_t state = 1;
  os_unfair_lock_unlock(&self->_lock);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__HDXPCPeriodicActivity_unitTest_synthesizeActivityFireWithCompletion___block_invoke;
  v6[3] = &unk_2643D44B0;
  id v7 = v4;
  id v5 = v4;
  -[HDXPCPeriodicActivity _performCurrentActivityWithCompletion:]((uint64_t)self, v6);
}

uint64_t __71__HDXPCPeriodicActivity_unitTest_synthesizeActivityFireWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)name
{
  return self->_name;
}

- (OS_os_log)loggingCategory
{
  return self->_loggingCategory;
}

- (double)baseInterval
{
  return self->_baseInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_activityShim);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);

  objc_storeStrong((id *)&self->_criteria, 0);
}

void __82__HDXPCPeriodicActivity_registerDisabledPeriodicActivityWithName_loggingCategory___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21BFB4000, v0, v1, "[%{public}@]: Failed to set state as 'done' after firing while disabled.", v2, v3, v4, v5, v6);
}

- (void)_lock_activityFinishedWithResult:minimumRetryInterval:activityStartDate:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_21BFB4000, v0, v1, "[%{public}@]: failed with a deferrable error: %{public}@");
}

- (void)_performActivity:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21BFB4000, v0, v1, "[%{public}@]: Failed to set activity state during unexpected fire event.", v2, v3, v4, v5, v6);
}

- (void)_updateStateForFinishedActivity:result:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21BFB4000, v0, v1, "[%{public}@]: Failed to finish activity", v2, v3, v4, v5, v6);
}

- (void)_updateStateForFinishedActivity:result:.cold.2()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_21BFB4000, v0, v1, "[%{public}@]: Invalid activity result %ld; assuming done.");
}

- (void)_updateStateForFinishedActivity:result:.cold.3()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_21BFB4000, v0, OS_LOG_TYPE_FAULT, "[%{public}@]: Attempting to finish activity, but client requested waiting.", v1, 0xCu);
}

- (void)_updateStateForFinishedActivity:result:.cold.4()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21BFB4000, v0, v1, "[%{public}@]: Failed to set completion status after activity finish", v2, v3, v4, v5, v6);
}

- (void)_updateStateForFinishedActivity:result:.cold.5()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21BFB4000, v0, v1, "[%{public}@]: Failed to defer activity", v2, v3, v4, v5, v6);
}

- (void)_updateStateForFinishedActivity:result:.cold.7()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21BFB4000, v0, v1, "[%{public}@]: Activity completed requesting deferral, but should not be deferred", v2, v3, v4, v5, v6);
}

@end