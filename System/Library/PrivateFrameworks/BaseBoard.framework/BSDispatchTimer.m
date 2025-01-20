@interface BSDispatchTimer
+ (void)timerWithIdentifier:(uint64_t)a1;
- (BSDispatchTimer)init;
- (double)timeRemaining;
- (os_unfair_lock_s)hasBeenInvalidated;
- (os_unfair_lock_s)isScheduled;
- (void)_lock_cancel;
- (void)appendDescriptionToBuilder:(int)a3 forDebugging:;
- (void)cancel;
- (void)dealloc;
- (void)invalidate;
- (void)scheduleWithFireTime:(uint64_t)a3 repeatNanoseconds:(uint64_t)a4 leewayNanoseconds:(void *)a5 queue:(void *)a6 weakContext:(void *)a7 handler:;
@end

@implementation BSDispatchTimer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_handler, 0);
  objc_destroyWeak(&self->_lock_context);
  objc_storeStrong((id *)&self->_lock_source, 0);
  objc_storeStrong((id *)&self->_lock_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!self->_lock_invalidated)
  {
    v4 = [NSString stringWithFormat:@"must invalidate timer \"%@\" before dealloc", self->_identifier];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      id v10 = v5;
      __int16 v11 = 2114;
      v12 = v7;
      __int16 v13 = 2048;
      v14 = self;
      __int16 v15 = 2114;
      v16 = @"BSDispatchTimer.m";
      __int16 v17 = 1024;
      int v18 = 59;
      __int16 v19 = 2114;
      v20 = v4;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v4 UTF8String];
    __break(0);
    JUMPOUT(0x18AADB2A0);
  }
  v8.receiver = self;
  v8.super_class = (Class)BSDispatchTimer;
  [(BSDispatchTimer *)&v8 dealloc];
}

void __102__BSDispatchTimer_scheduleWithFireTime_repeatNanoseconds_leewayNanoseconds_queue_weakContext_handler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    int v2 = *(_DWORD *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 16));
    if (*(_DWORD *)(v1 + 88) == v2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v1 + 40));
      v3 = (void (**)(void, void))MEMORY[0x18C125630](*(void *)(v1 + 48));
      ++*(void *)(v1 + 80);
      if (!WeakRetained || *(uint64_t *)(v1 + 64) <= 0) {
        -[BSDispatchTimer _lock_cancel](v1);
      }
    }
    else
    {
      v3 = 0;
      id WeakRetained = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 16));
    if (WeakRetained && v3) {
      ((void (**)(void, id))v3)[2](v3, WeakRetained);
    }
  }
}

- (os_unfair_lock_s)hasBeenInvalidated
{
  uint64_t v1 = a1;
  if (a1)
  {
    int v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    uint64_t v1 = (os_unfair_lock_s *)(LOBYTE(v1[23]._os_unfair_lock_opaque) != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)invalidate
{
  if (a1)
  {
    int v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (!*(unsigned char *)(a1 + 92))
    {
      *(unsigned char *)(a1 + 92) = 1;
      -[BSDispatchTimer _lock_cancel](a1);
    }
    os_unfair_lock_unlock(v2);
  }
}

- (void)cancel
{
  if (a1)
  {
    int v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    -[BSDispatchTimer _lock_cancel]((uint64_t)a1);
    os_unfair_lock_unlock(v2);
  }
}

- (void)_lock_cancel
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    int v2 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    v3 = *(NSObject **)(a1 + 32);
    if (v3)
    {
      dispatch_source_cancel(v3);
      v4 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;
    }
    objc_storeWeak((id *)(a1 + 40), 0);
    id v5 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    ++*(_DWORD *)(a1 + 88);
  }
}

- (void)scheduleWithFireTime:(uint64_t)a3 repeatNanoseconds:(uint64_t)a4 leewayNanoseconds:(void *)a5 queue:(void *)a6 weakContext:(void *)a7 handler:
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v14 = a5;
  id obj = a6;
  id v15 = a7;
  v16 = v15;
  if (a1)
  {
    if (!obj)
    {
      v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"context"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_scheduleWithFireTime_repeatNanoseconds_leewayNanoseconds_queue_weakContext_handler_);
        id v29 = (id)objc_claimAutoreleasedReturnValue();
        v30 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v30);
        *(_DWORD *)buf = 138544642;
        id v48 = v29;
        __int16 v49 = 2114;
        v50 = v31;
        __int16 v51 = 2048;
        uint64_t v52 = a1;
        __int16 v53 = 2114;
        v54 = @"BSDispatchTimer.m";
        __int16 v55 = 1024;
        int v56 = 168;
        __int16 v57 = 2114;
        v58 = v28;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v28 UTF8String];
      __break(0);
      JUMPOUT(0x18AAE7B70);
    }
    if (!v14)
    {
      v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"queue"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_scheduleWithFireTime_repeatNanoseconds_leewayNanoseconds_queue_weakContext_handler_);
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        v34 = (objc_class *)objc_opt_class();
        v35 = NSStringFromClass(v34);
        *(_DWORD *)buf = 138544642;
        id v48 = v33;
        __int16 v49 = 2114;
        v50 = v35;
        __int16 v51 = 2048;
        uint64_t v52 = a1;
        __int16 v53 = 2114;
        v54 = @"BSDispatchTimer.m";
        __int16 v55 = 1024;
        int v56 = 169;
        __int16 v57 = 2114;
        v58 = v32;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v32 UTF8String];
      __break(0);
      JUMPOUT(0x18AAE7C74);
    }
    if (!v15)
    {
      v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_scheduleWithFireTime_repeatNanoseconds_leewayNanoseconds_queue_weakContext_handler_);
        id v37 = (id)objc_claimAutoreleasedReturnValue();
        v38 = (objc_class *)objc_opt_class();
        v39 = NSStringFromClass(v38);
        *(_DWORD *)buf = 138544642;
        id v48 = v37;
        __int16 v49 = 2114;
        v50 = v39;
        __int16 v51 = 2048;
        uint64_t v52 = a1;
        __int16 v53 = 2114;
        v54 = @"BSDispatchTimer.m";
        __int16 v55 = 1024;
        int v56 = 170;
        __int16 v57 = 2114;
        v58 = v36;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v36 UTF8String];
      __break(0);
      JUMPOUT(0x18AAE7D78);
    }
    __int16 v17 = v14;
    dispatch_time_t v18 = dispatch_time(a2, 0);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (*(unsigned char *)(a1 + 92))
    {
      v40 = [NSString stringWithFormat:@"cannot schedule after invalidating"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_scheduleWithFireTime_repeatNanoseconds_leewayNanoseconds_queue_weakContext_handler_);
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        v42 = (objc_class *)objc_opt_class();
        v43 = NSStringFromClass(v42);
        *(_DWORD *)buf = 138544642;
        id v48 = v41;
        __int16 v49 = 2114;
        v50 = v43;
        __int16 v51 = 2048;
        uint64_t v52 = a1;
        __int16 v53 = 2114;
        v54 = @"BSDispatchTimer.m";
        __int16 v55 = 1024;
        int v56 = 176;
        __int16 v57 = 2114;
        v58 = v40;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v40 UTF8String];
      __break(0);
      JUMPOUT(0x18AAE7E70);
    }
    if (*(void *)(a1 + 32) && *(NSObject **)(a1 + 24) != v17) {
      -[BSDispatchTimer _lock_cancel](a1);
    }
    int v19 = *(_DWORD *)(a1 + 88) + 1;
    *(_DWORD *)(a1 + 88) = v19;
    *(void *)(a1 + 56) = v18;
    *(void *)(a1 + 64) = a3;
    *(void *)(a1 + 72) = a4 & ~(a4 >> 63);
    objc_storeWeak((id *)(a1 + 40), obj);
    objc_storeStrong((id *)(a1 + 24), a5);
    v14 = v17;
    uint64_t v20 = MEMORY[0x18C125630](v16);
    uint64_t v21 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v20;

    *(void *)(a1 + 80) = 0;
    v22 = *(NSObject **)(a1 + 32);
    if (v22)
    {
      dispatch_suspend(v22);
    }
    else
    {
      dispatch_source_t v23 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v17);
      v24 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v23;
    }
    v25 = *(NSObject **)(a1 + 32);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __102__BSDispatchTimer_scheduleWithFireTime_repeatNanoseconds_leewayNanoseconds_queue_weakContext_handler___block_invoke;
    handler[3] = &unk_1E5446358;
    handler[4] = a1;
    int v46 = v19;
    id v26 = (id)a1;
    dispatch_source_set_event_handler(v25, handler);
    if (*(uint64_t *)(a1 + 64) <= 0) {
      uint64_t v27 = -1;
    }
    else {
      uint64_t v27 = *(void *)(a1 + 64);
    }
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 32), *(void *)(a1 + 56), v27, *(void *)(a1 + 72));
    dispatch_resume(*(dispatch_object_t *)(a1 + 32));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  }
}

+ (void)timerWithIdentifier:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  v3 = [BSDispatchTimer alloc];
  id v4 = v2;
  id v5 = v4;
  if (v3)
  {
    if (!v4)
    {
      id v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identifier"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithIdentifier_);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        v12 = (objc_class *)objc_opt_class();
        __int16 v13 = NSStringFromClass(v12);
        *(_DWORD *)v14 = 138544642;
        *(void *)&v14[4] = v11;
        *(_WORD *)&v14[12] = 2114;
        *(void *)&v14[14] = v13;
        __int16 v15 = 2048;
        v16 = v3;
        __int16 v17 = 2114;
        dispatch_time_t v18 = @"BSDispatchTimer.m";
        __int16 v19 = 1024;
        int v20 = 46;
        __int16 v21 = 2114;
        v22 = v10;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v14, 0x3Au);
      }
      qword_1E911F420 = [v10 UTF8String];
      __break(0);
      JUMPOUT(0x18AAE8264);
    }
    *(void *)v14 = v3;
    *(void *)&v14[8] = BSDispatchTimer;
    v6 = objc_msgSendSuper2((objc_super *)v14, sel_init);
    if (v6)
    {
      uint64_t v7 = [v5 copy];
      objc_super v8 = (void *)v6[1];
      v6[1] = v7;

      *((_DWORD *)v6 + 4) = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BSDispatchTimer)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [NSString stringWithFormat:@"-init is unavailable"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"BSDispatchTimer.m";
    __int16 v17 = 1024;
    int v18 = 41;
    __int16 v19 = 2114;
    int v20 = v4;
    _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  result = (BSDispatchTimer *)[v4 UTF8String];
  qword_1E911F420 = (uint64_t)result;
  __break(0);
  return result;
}

- (os_unfair_lock_s)isScheduled
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    uint64_t v1 = (os_unfair_lock_s *)(*(void *)&v1[8]._os_unfair_lock_opaque != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (double)timeRemaining
{
  if (!a1) {
    return 0.0;
  }
  id v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  uint64_t v3 = *(void *)(a1 + 32);
  dispatch_time_t v5 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 80);
  os_unfair_lock_unlock(v2);
  if (!v3) {
    return NAN;
  }
  return BSDispatchTimerTimeRemainingForFireTimeWithRepeat(v5, v6, v4);
}

- (void)appendDescriptionToBuilder:(int)a3 forDebugging:
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    [v5 appendString:*(void *)(a1 + 8) withName:@"identifier"];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    uint64_t v7 = *(void *)(a1 + 32);
    dispatch_time_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 80);
    unint64_t v16 = *(void *)(a1 + 72);
    int v11 = *(unsigned __int8 *)(a1 + 92);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    id v12 = (id)[v6 appendBool:v7 != 0 withName:@"isScheduled"];
    if (v7)
    {
      id v13 = (id)objc_msgSend(v6, "appendTimeInterval:withName:decomposeUnits:", @"timeRemaining", 1, BSDispatchTimerTimeRemainingForFireTimeWithRepeat(v8, v10, v9));
      if (a3)
      {
        if (v9 != -1) {
          dispatch_time_to_nsec();
        }
        id v14 = (id)[v6 appendTimeInterval:@"leeway" withName:0 decomposeUnits:(double)(v16 % 0x3B9ACA00) / 1000000000.0+ (double)(v16 / 0x3B9ACA00)];
      }
    }
    id v15 = (id)[v6 appendBool:v11 != 0 withName:@"isInvalidated"];
  }
}

@end