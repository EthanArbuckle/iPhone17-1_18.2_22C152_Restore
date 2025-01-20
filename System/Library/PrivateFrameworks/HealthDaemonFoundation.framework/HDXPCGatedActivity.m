@interface HDXPCGatedActivity
- (BOOL)rescheduleWhileInProgress;
- (BOOL)shouldDefer;
- (BOOL)waitingForTrigger;
- (BOOL)xpcActivity_setCompletionStatus:(int64_t)a3 activity:(id)a4;
- (BOOL)xpcActivity_setState:(int64_t)a3 activity:(id)a4;
- (BOOL)xpcActivity_shouldDefer:(id)a3;
- (HDCoalescedTaskPoolQuota)quota;
- (HDXPCGatedActivity)initWithName:(id)a3 criteria:(id)a4 loggingCategory:(id)a5 handler:(id)a6;
- (NSString)name;
- (OS_os_log)loggingCategory;
- (OS_xpc_object)currentActivity;
- (id)description;
- (id)xpcActivity_copyCriteria:(id)a3;
- (int64_t)xpcActivity_getState:(id)a3;
- (void)_activityFinishedWithResult:(int64_t)a3 error:(id)a4;
- (void)_handleXPCActivityCallback:(id)a3;
- (void)_lock_resetNextActivityFireDate;
- (void)_lock_setNextScheduledFireDeadline:(double)a3;
- (void)_performActivity:(id)a3 completion:(id)a4;
- (void)_registerActivityWithCriteria:(id)a3;
- (void)_registerActivityWithCriteria:(id)a3 delay:(double)a4 gracePeriod:(double)a5;
- (void)_runRequestWithMaximumDelay:(double)a3 requiredDelay:(double)a4 completion:(id)a5;
- (void)requestRunWithMaximumDelay:(double)a3 completion:(id)a4;
- (void)runUngatedWithCompletion:(id)a3;
- (void)setCurrentActivity:(id)a3;
- (void)setQuota:(id)a3;
- (void)setRescheduleWhileInProgress:(BOOL)a3;
- (void)setWaitingForTrigger:(BOOL)a3;
- (void)unitTest_setActivityCompletion:(id)a3;
- (void)unitTest_setActivityShim:(id)a3;
- (void)xpcActivity_register:(const char *)a3 criteria:(id)a4 handler:(id)a5;
- (void)xpcActivity_setCriteria:(id)a3 activity:(id)a4;
- (void)xpcActivity_unregister:(const char *)a3;
@end

@implementation HDXPCGatedActivity

- (void)requestRunWithMaximumDelay:(double)a3 completion:(id)a4
{
  id v9 = a4;
  quota = self->_quota;
  if (quota)
  {
    [(HDCoalescedTaskPoolQuota *)quota timeUntilNextAvailableTrigger];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }
  [(HDXPCGatedActivity *)self _runRequestWithMaximumDelay:v9 requiredDelay:a3 completion:v8];
}

- (void)_runRequestWithMaximumDelay:(double)a3 requiredDelay:(double)a4 completion:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double nextScheduledFireDeadline = self->_nextScheduledFireDeadline;
  if (nextScheduledFireDeadline > 0.0)
  {
    if (self->_inProgress && self->_rescheduleWhileInProgress)
    {
      CFAbsoluteTime v11 = CFAbsoluteTimeGetCurrent() + a3;
      double nextFireTime = self->_nextFireTime;
      if (nextFireTime == 0.0 || v11 < nextFireTime) {
        self->_double nextFireTime = v11;
      }
      nextCompletions = self->_nextCompletions;
      if (!nextCompletions)
      {
        v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
        v16 = self->_nextCompletions;
        self->_nextCompletions = v15;

        nextCompletions = self->_nextCompletions;
      }
      v17 = objc_msgSend(v8, "copy", v11);
      v18 = (void *)MEMORY[0x21D49F640]();
      [(NSMutableArray *)nextCompletions addObject:v18];

      _HKInitializeLogging();
      loggingCategory = self->_loggingCategory;
      if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 138543362;
        v33 = self;
        _os_log_impl(&dword_21BFB4000, loggingCategory, OS_LOG_TYPE_DEFAULT, "%{public}@: Run requested delayed because activity is already in progress.", (uint8_t *)&v32, 0xCu);
      }
LABEL_23:
      os_unfair_lock_unlock(p_lock);
      goto LABEL_24;
    }
    double v20 = nextScheduledFireDeadline - CFAbsoluteTimeGetCurrent();
    if (v20 <= a3)
    {
      _HKInitializeLogging();
      v28 = self->_loggingCategory;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 138543874;
        v33 = self;
        __int16 v34 = 2048;
        double v35 = a3;
        __int16 v36 = 2048;
        double v37 = v20;
        _os_log_impl(&dword_21BFB4000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: Run requested with delay %lf, but next fire date is in  %lf, no need to re-register.", (uint8_t *)&v32, 0x20u);
      }
      pendingCompletions = self->_pendingCompletions;
      v30 = (void *)[v8 copy];
      v31 = (void *)MEMORY[0x21D49F640]();
      [(NSMutableArray *)pendingCompletions addObject:v31];

      goto LABEL_23;
    }
  }
  [(HDXPCGatedActivity *)self _lock_setNextScheduledFireDeadline:CFAbsoluteTimeGetCurrent() + a3];
  _HKInitializeLogging();
  v21 = self->_loggingCategory;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 138543874;
    v33 = self;
    __int16 v34 = 2048;
    double v35 = a3;
    __int16 v36 = 2048;
    double v37 = a4;
    _os_log_impl(&dword_21BFB4000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting run with maximum delay %lf, required delay %lf", (uint8_t *)&v32, 0x20u);
  }
  v22 = self->_pendingCompletions;
  if (!v22)
  {
    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v24 = self->_pendingCompletions;
    self->_pendingCompletions = v23;

    v22 = self->_pendingCompletions;
  }
  v25 = (void *)[v8 copy];
  v26 = (void *)MEMORY[0x21D49F640]();
  [(NSMutableArray *)v22 addObject:v26];

  xpc_object_t v27 = xpc_copy(self->_criteria);
  os_unfair_lock_unlock(&self->_lock);
  [(HDXPCGatedActivity *)self _registerActivityWithCriteria:v27 delay:a4 gracePeriod:a3];

LABEL_24:
}

- (HDXPCGatedActivity)initWithName:(id)a3 criteria:(id)a4 loggingCategory:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)HDXPCGatedActivity;
  v14 = [(HDXPCGatedActivity *)&v28 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    name = v14->_name;
    v14->_name = (NSString *)v15;

    v14->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v14->_loggingCategory, a5);
    uint64_t v17 = [v13 copy];
    id handler = v14->_handler;
    v14->_id handler = (id)v17;

    v19 = (OS_xpc_object *)xpc_copy(v11);
    p_criteria = &v14->_criteria;
    criteria = v14->_criteria;
    v14->_criteria = v19;

    objc_storeWeak((id *)&v14->_activityShim, v14);
    v22 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v22 doubleForKey:v14->_name];
    double v24 = v23;

    if (v24 <= 0.0)
    {
      p_criteria = (OS_xpc_object **)MEMORY[0x263EF8188];
    }
    else
    {
      v14->_double nextScheduledFireDeadline = v24;
      double v25 = v24 - CFAbsoluteTimeGetCurrent();
      if (v25 <= 0.0) {
        int64_t v26 = 1;
      }
      else {
        int64_t v26 = (uint64_t)v25;
      }
      xpc_dictionary_set_int64(v14->_criteria, (const char *)*MEMORY[0x263EF81A0], v26);
      xpc_dictionary_set_int64(v14->_criteria, (const char *)*MEMORY[0x263EF81C0], 0);
      xpc_dictionary_set_BOOL(v14->_criteria, (const char *)*MEMORY[0x263EF82A0], 0);
    }
    [(HDXPCGatedActivity *)v14 _registerActivityWithCriteria:*p_criteria];
  }

  return v14;
}

- (void)_registerActivityWithCriteria:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityShim);
  v6 = [(NSString *)self->_name UTF8String];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__HDXPCGatedActivity__registerActivityWithCriteria___block_invoke;
  v7[3] = &unk_2643D4440;
  objc_copyWeak(&v8, &location);
  objc_msgSend(WeakRetained, "xpcActivity_register:criteria:handler:", v6, v4, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)xpcActivity_register:(const char *)a3 criteria:(id)a4 handler:(id)a5
{
  xpc_object_t criteria = a4;
  id v7 = a5;
  if ((HDIsUnitTesting() & 1) == 0) {
    xpc_activity_register(a3, criteria, v7);
  }
}

void __52__HDXPCGatedActivity__registerActivityWithCriteria___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = (void *)MEMORY[0x21D49F400]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleXPCActivityCallback:v5];
}

- (void)_handleXPCActivityCallback:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityShim);
  uint64_t v6 = objc_msgSend(WeakRetained, "xpcActivity_getState:", v4);

  if (v6)
  {
    BOOL v7 = [(HDXPCGatedActivity *)self waitingForTrigger];
    _HKInitializeLogging();
    loggingCategory = self->_loggingCategory;
    BOOL v9 = os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138543618;
        double v24 = self;
        __int16 v25 = 2114;
        id v26 = v4;
        _os_log_impl(&dword_21BFB4000, loggingCategory, OS_LOG_TYPE_DEFAULT, "%{public}@ fired with activity %{public}@", buf, 0x16u);
      }
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __49__HDXPCGatedActivity__handleXPCActivityCallback___block_invoke;
      v21[3] = &unk_2643D4950;
      v21[4] = self;
      id v22 = v4;
      [(HDXPCGatedActivity *)self _performActivity:v22 completion:v21];
    }
    else
    {
      if (v9)
      {
        *(_DWORD *)buf = 138543618;
        double v24 = self;
        __int16 v25 = 2114;
        id v26 = v4;
        _os_log_impl(&dword_21BFB4000, loggingCategory, OS_LOG_TYPE_DEFAULT, "%{public}@ fired with activity %{public}@, but we're not currently waiting on a trigger.", buf, 0x16u);
      }
      os_unfair_lock_lock(&self->_lock);
      [(HDXPCGatedActivity *)self _lock_resetNextActivityFireDate];
      os_unfair_lock_unlock(&self->_lock);
      id v12 = objc_loadWeakRetained((id *)&self->_activityShim);
      char v13 = objc_msgSend(v12, "xpcActivity_setCompletionStatus:activity:", 0, v4);

      if ((v13 & 1) == 0)
      {
        _HKInitializeLogging();
        v14 = self->_loggingCategory;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[HDXPCGatedActivity _handleXPCActivityCallback:]((uint64_t)self, v14, v15, v16, v17, v18, v19, v20);
        }
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v10 = self->_loggingCategory;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      *(_DWORD *)buf = 138543362;
      double v24 = (HDXPCGatedActivity *)name;
      _os_log_impl(&dword_21BFB4000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Checked in for gated scheduling", buf, 0xCu);
    }
  }
}

- (int64_t)xpcActivity_getState:(id)a3
{
  return xpc_activity_get_state((xpc_activity_t)a3);
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)v5;
  name = self->_name;
  if (self->_inProgress)
  {
    id v8 = @"ACTIVE";
  }
  else
  {
    if (self->_nextScheduledFireDeadline > 0.0)
    {
      BOOL v9 = objc_msgSend(NSString, "stringWithFormat:", @"%0.2lfs", *(void *)&self->_nextScheduledFireDeadline);
      id v10 = [v3 stringWithFormat:@"<%@:%p %@ %@>", v6, self, name, v9];

      goto LABEL_7;
    }
    id v8 = @"idle";
  }
  id v10 = [v3 stringWithFormat:@"<%@:%p %@ %@>", v5, self, self->_name, v8];
LABEL_7:

  return v10;
}

- (BOOL)waitingForTrigger
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_nextScheduledFireDeadline > 0.0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setWaitingForTrigger:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (a3)
  {
    double nextScheduledFireDeadline = self->_nextScheduledFireDeadline;
    os_unfair_lock_unlock(p_lock);
    if (nextScheduledFireDeadline == 0.0)
    {
      _HKInitializeLogging();
      loggingCategory = self->_loggingCategory;
      if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138543362;
        BOOL v9 = self;
        _os_log_impl(&dword_21BFB4000, loggingCategory, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting implicit run by setting waitingForTrigger = YES.", (uint8_t *)&v8, 0xCu);
      }
      [(HDXPCGatedActivity *)self requestRunWithMaximumDelay:&__block_literal_global_2 completion:0.0];
    }
  }
  else
  {
    [(HDXPCGatedActivity *)self _lock_resetNextActivityFireDate];
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)runUngatedWithCompletion:(id)a3
{
}

- (BOOL)shouldDefer
{
  v3 = [(HDXPCGatedActivity *)self currentActivity];
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

- (void)_registerActivityWithCriteria:(id)a3 delay:(double)a4 gracePeriod:(double)a5
{
  BOOL v7 = (const char *)*MEMORY[0x263EF81A0];
  int64_t v8 = (uint64_t)a4;
  xpc_object_t xdict = a3;
  xpc_dictionary_set_int64(xdict, v7, v8);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x263EF81C0], (uint64_t)a5);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x263EF82A0], 0);
  [(HDXPCGatedActivity *)self _registerActivityWithCriteria:xdict];
}

void __49__HDXPCGatedActivity__handleXPCActivityCallback___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2 != 2)
  {
    if (a2 == 1)
    {
      _HKInitializeLogging();
      uint64_t v6 = (id *)(a1 + 32);
      if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 104), OS_LOG_TYPE_ERROR)) {
        __49__HDXPCGatedActivity__handleXPCActivityCallback___block_invoke_cold_3();
      }
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
      char v19 = objc_msgSend(WeakRetained, "xpcActivity_setCompletionStatus:activity:", 3, *(void *)(a1 + 40));

      if ((v19 & 1) == 0)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*((os_log_t *)*v6 + 13), OS_LOG_TYPE_ERROR)) {
          __49__HDXPCGatedActivity__handleXPCActivityCallback___block_invoke_cold_1();
        }
      }
      goto LABEL_25;
    }
    if (a2) {
      goto LABEL_26;
    }
    _HKInitializeLogging();
    uint64_t v6 = (id *)(a1 + 32);
    BOOL v7 = *(NSObject **)(*(void *)(a1 + 32) + 104);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *v6;
      int v34 = 138543362;
      id v35 = v8;
      _os_log_impl(&dword_21BFB4000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished activity successfully.", (uint8_t *)&v34, 0xCu);
    }
    id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
    char v10 = objc_msgSend(v9, "xpcActivity_setCompletionStatus:activity:", 0, *(void *)(a1 + 40));

    if (v10) {
      goto LABEL_25;
    }
    _HKInitializeLogging();
    if (!os_log_type_enabled(*((os_log_t *)*v6 + 13), OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
LABEL_24:
    __49__HDXPCGatedActivity__handleXPCActivityCallback___block_invoke_cold_1();
LABEL_25:
    os_unfair_lock_lock((os_unfair_lock_t)*v6 + 2);
    objc_msgSend(*v6, "_lock_resetNextActivityFireDate");
    os_unfair_lock_unlock((os_unfair_lock_t)*v6 + 2);
    goto LABEL_26;
  }
  uint64_t v6 = (id *)(a1 + 32);
  id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  int v12 = objc_msgSend(v11, "xpcActivity_shouldDefer:", *(void *)(a1 + 40));

  _HKInitializeLogging();
  char v13 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (v14)
    {
      id v20 = *v6;
      int v34 = 138543362;
      id v35 = v20;
      _os_log_impl(&dword_21BFB4000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Handler requested activity deferral but activity should not be deferred; failing activity.",
        (uint8_t *)&v34,
        0xCu);
    }
    id v21 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
    char v22 = objc_msgSend(v21, "xpcActivity_setCompletionStatus:activity:", 3, *(void *)(a1 + 40));

    if (v22) {
      goto LABEL_25;
    }
    _HKInitializeLogging();
    if (!os_log_type_enabled(*((os_log_t *)*v6 + 13), OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v14)
  {
    id v15 = *v6;
    int v34 = 138543362;
    id v35 = v15;
    _os_log_impl(&dword_21BFB4000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting activity deferral.", (uint8_t *)&v34, 0xCu);
  }
  id v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  char v17 = objc_msgSend(v16, "xpcActivity_setState:activity:", 3, *(void *)(a1 + 40));

  if ((v17 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*((os_log_t *)*v6 + 13), OS_LOG_TYPE_ERROR)) {
      __49__HDXPCGatedActivity__handleXPCActivityCallback___block_invoke_cold_4();
    }
  }
LABEL_26:
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v23 = *(void *)(a1 + 32);
  double v24 = *(double *)(v23 + 56);
  if (v24 <= 0.0)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v23 + 8));
  }
  else
  {
    double v25 = v24 - CFAbsoluteTimeGetCurrent();
    double v26 = 0.0;
    if (v25 >= 0.0) {
      double v27 = v25;
    }
    else {
      double v27 = 0.0;
    }
    objc_msgSend(*(id *)(a1 + 32), "_lock_setNextScheduledFireDeadline:", CFAbsoluteTimeGetCurrent() + v27);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(*(void *)(a1 + 32) + 64));
    uint64_t v28 = *(void *)(a1 + 32);
    v29 = *(void **)(v28 + 64);
    *(void *)(v28 + 64) = 0;

    *(void *)(*(void *)(a1 + 32) + 56) = 0;
    xpc_object_t v30 = xpc_copy(*(xpc_object_t *)(*(void *)(a1 + 32) + 24));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    v31 = *(void **)(a1 + 32);
    int v32 = (void *)v31[15];
    if (v32)
    {
      [v32 timeUntilNextAvailableTrigger];
      double v26 = v33;
    }
    [v31 _registerActivityWithCriteria:v30 delay:v26 gracePeriod:v27];
  }
}

- (void)_performActivity:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  pendingCompletions = self->_pendingCompletions;
  if (!pendingCompletions)
  {
    char v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    id v11 = self->_pendingCompletions;
    self->_pendingCompletions = v10;

    pendingCompletions = self->_pendingCompletions;
  }
  int v12 = (void *)[v8 copy];
  char v13 = (void *)MEMORY[0x21D49F640]();
  [(NSMutableArray *)pendingCompletions addObject:v13];

  BOOL inProgress = self->_inProgress;
  if (!self->_inProgress)
  {
    objc_storeStrong((id *)&self->_currentActivity, a3);
    self->_BOOL inProgress = 1;
  }
  id v15 = (void (**)(void, void, void, void))MEMORY[0x21D49F640](self->_handler);
  os_unfair_lock_unlock(&self->_lock);
  if (!inProgress)
  {
    if (v7
      && (id WeakRetained = objc_loadWeakRetained((id *)&self->_activityShim),
          char v17 = objc_msgSend(WeakRetained, "xpcActivity_setState:activity:", 4, v7),
          WeakRetained,
          (v17 & 1) == 0))
    {
      _HKInitializeLogging();
      loggingCategory = self->_loggingCategory;
      if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR)) {
        -[HDXPCGatedActivity _performActivity:completion:]((uint64_t)self, loggingCategory);
      }
    }
    else
    {
      [(HDCoalescedTaskPoolQuota *)self->_quota consumeQuota];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __50__HDXPCGatedActivity__performActivity_completion___block_invoke;
      v20[3] = &unk_2643D4978;
      v20[4] = self;
      ((void (**)(void, HDXPCGatedActivity *, id, void *))v15)[2](v15, self, v7, v20);
      if (HDIsUnitTesting())
      {
        unitTest_ActivityCompletion = (void (**)(void))self->unitTest_ActivityCompletion;
        if (unitTest_ActivityCompletion) {
          unitTest_ActivityCompletion[2]();
        }
      }
    }
  }
}

uint64_t __50__HDXPCGatedActivity__performActivity_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _activityFinishedWithResult:a2 error:a3];
}

- (void)_activityFinishedWithResult:(int64_t)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  self->_BOOL inProgress = 0;
  uint64_t v6 = self->_pendingCompletions;
  pendingCompletions = self->_pendingCompletions;
  self->_pendingCompletions = 0;

  currentActivity = self->_currentActivity;
  self->_currentActivity = 0;

  os_unfair_lock_unlock(&self->_lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v6;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v13) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * v13));
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)_lock_setNextScheduledFireDeadline:(double)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  self->_double nextScheduledFireDeadline = a3;
  id v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v5 setDouble:self->_name forKey:a3];
}

- (void)_lock_resetNextActivityFireDate
{
  os_unfair_lock_assert_owner(&self->_lock);
  self->_double nextScheduledFireDeadline = 0.0;
  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v3 removeObjectForKey:self->_name];
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
  id v5 = (HDXPCGatedActivity *)a3;
  os_unfair_lock_lock(&self->_lock);
  id v4 = v5;
  if (!v5) {
    id v4 = self;
  }
  objc_storeWeak((id *)&self->_activityShim, v4);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)unitTest_setActivityCompletion:(id)a3
{
  self->unitTest_ActivityCompletion = (id)MEMORY[0x21D49F640](a3, a2);

  MEMORY[0x270F9A758]();
}

- (NSString)name
{
  return self->_name;
}

- (OS_os_log)loggingCategory
{
  return self->_loggingCategory;
}

- (OS_xpc_object)currentActivity
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCurrentActivity:(id)a3
{
}

- (BOOL)rescheduleWhileInProgress
{
  return self->_rescheduleWhileInProgress;
}

- (void)setRescheduleWhileInProgress:(BOOL)a3
{
  self->_rescheduleWhileInProgress = a3;
}

- (HDCoalescedTaskPoolQuota)quota
{
  return self->_quota;
}

- (void)setQuota:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quota, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_activityShim);
  objc_storeStrong(&self->unitTest_ActivityCompletion, 0);
  objc_storeStrong((id *)&self->_nextCompletions, 0);
  objc_storeStrong((id *)&self->_pendingCompletions, 0);
  objc_storeStrong((id *)&self->_criteria, 0);

  objc_storeStrong(&self->_handler, 0);
}

- (void)_handleXPCActivityCallback:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __49__HDXPCGatedActivity__handleXPCActivityCallback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21BFB4000, v0, v1, "%{public}@: Failed to update completion state.", v2, v3, v4, v5, v6);
}

void __49__HDXPCGatedActivity__handleXPCActivityCallback___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_21BFB4000, v1, OS_LOG_TYPE_ERROR, "%{public}@: Failed to perform activity: %{public}@.", v2, 0x16u);
}

void __49__HDXPCGatedActivity__handleXPCActivityCallback___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21BFB4000, v0, v1, "%{public}@: Failed to defer activity.", v2, v3, v4, v5, v6);
}

- (void)_performActivity:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 96);
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_21BFB4000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Failed to continue activity %{public}@", (uint8_t *)&v3, 0x16u);
}

@end