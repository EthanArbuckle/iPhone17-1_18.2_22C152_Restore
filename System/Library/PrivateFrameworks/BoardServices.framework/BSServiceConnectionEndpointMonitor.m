@interface BSServiceConnectionEndpointMonitor
+ (id)monitorForService:(id)a3;
- (BSServiceConnectionEndpointMonitor)init;
- (BSServiceConnectionEndpointMonitorDelegate)delegate;
- (NSString)description;
- (NSString)service;
- (id)endpointsForEnvironment:(id)a3;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)serialCallOut_didUpdateEndpointEnvironments:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation BSServiceConnectionEndpointMonitor

- (void)activate
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    v9 = [NSString stringWithFormat:@"cannot activate after invalidation"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v10 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138544642;
      v22 = v10;
      __int16 v23 = 2114;
      v24 = v12;
      __int16 v25 = 2048;
      v26 = self;
      __int16 v27 = 2114;
      v28 = @"BSServiceConnectionEndpointMonitor.m";
      __int16 v29 = 1024;
      int v30 = 85;
      __int16 v31 = 2114;
      v32 = v9;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C778F64);
  }
  if (self->_lock_activated)
  {
    v13 = [NSString stringWithFormat:@"cannot activate twice"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v14 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138544642;
      v22 = v14;
      __int16 v23 = 2114;
      v24 = v16;
      __int16 v25 = 2048;
      v26 = self;
      __int16 v27 = 2114;
      v28 = @"BSServiceConnectionEndpointMonitor.m";
      __int16 v29 = 1024;
      int v30 = 86;
      __int16 v31 = 2114;
      v32 = v13;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77905CLL);
  }
  self->_lock_activated = 1;
  os_unfair_lock_lock(&self->_registrationLock);
  os_unfair_lock_unlock(p_lock);
  v5 = BSServiceInjectionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    service = self->_service;
    *(_DWORD *)buf = 138412290;
    v22 = service;
    _os_log_impl(&dword_19C754000, v5, OS_LOG_TYPE_DEFAULT, "activating monitor for service %@", buf, 0xCu);
  }

  -[BSServiceManager registerMonitor:]((uint64_t)self->_manager, self);
  v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  registrationLock_assertion = self->_registrationLock_assertion;
  self->_registrationLock_assertion = v7;

  if (!self->_registrationLock_assertion)
  {
    v17 = [NSString stringWithFormat:@"failed to register monitor for service %@", self->_service];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v18 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138544642;
      v22 = v18;
      __int16 v23 = 2114;
      v24 = v20;
      __int16 v25 = 2048;
      v26 = self;
      __int16 v27 = 2114;
      v28 = @"BSServiceConnectionEndpointMonitor.m";
      __int16 v29 = 1024;
      int v30 = 93;
      __int16 v31 = 2114;
      v32 = v17;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77915CLL);
  }
  os_unfair_lock_unlock(&self->_registrationLock);
}

- (NSString)service
{
  return self->_service;
}

- (void)serialCallOut_didUpdateEndpointEnvironments:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  __int16 v27 = v6;
  if (!v6)
  {
    __int16 v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"endpointToEnvironments", 0];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      *(_DWORD *)buf = 138544642;
      id v44 = v24;
      __int16 v45 = 2114;
      v46 = v26;
      __int16 v47 = 2048;
      v48 = self;
      __int16 v49 = 2114;
      v50 = @"BSServiceConnectionEndpointMonitor.m";
      __int16 v51 = 1024;
      int v52 = 131;
      __int16 v53 = 2114;
      v54 = v23;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C779BCCLL);
  }
  v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = v27;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v37;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v8);
        }
        [v7 addObject:*(void *)(*((void *)&v36 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v9);
  }

  v12 = (void *)[v7 mutableCopy];
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_lock_endpointToEnvironments, a3);
  v13 = self->_lock_delegate;
  v14 = self->_lock_serialCallOut_endpoints;
  objc_storeStrong((id *)&self->_lock_serialCallOut_endpoints, v7);
  os_unfair_lock_unlock(&self->_lock);
  if (v14) {
    [v12 minusSet:v14];
  }
  [(NSMutableSet *)v14 minusSet:v7];
  if (v13)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v15 = v14;
    uint64_t v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v33;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v15);
          }
          [(BSServiceConnectionEndpointMonitorDelegate *)v13 monitor:self willLoseEndpoint:*(void *)(*((void *)&v32 + 1) + 8 * v18++)];
        }
        while (v16 != v18);
        uint64_t v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v32 objects:v41 count:16];
      }
      while (v16);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v19 = v12;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v40 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v29;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v19);
          }
          [(BSServiceConnectionEndpointMonitorDelegate *)v13 monitor:self didReceiveEndpoint:*(void *)(*((void *)&v28 + 1) + 8 * v22++)];
        }
        while (v20 != v22);
        uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v40 count:16];
      }
      while (v20);
    }
  }
}

- (void)setDelegate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v5 = (BSServiceConnectionEndpointMonitorDelegate *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_activated)
  {
    v7 = [NSString stringWithFormat:@"cannot set the delegate after activation"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      int v11 = 138544642;
      id v12 = v8;
      __int16 v13 = 2114;
      v14 = v10;
      __int16 v15 = 2048;
      uint64_t v16 = self;
      __int16 v17 = 2114;
      uint64_t v18 = @"BSServiceConnectionEndpointMonitor.m";
      __int16 v19 = 1024;
      int v20 = 78;
      __int16 v21 = 2114;
      uint64_t v22 = v7;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77D0D8);
  }
  lock_delegate = self->_lock_delegate;
  self->_lock_delegate = v5;

  os_unfair_lock_unlock(&self->_lock);
}

+ (id)monitorForService:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [BSServiceConnectionEndpointMonitor alloc];
  v5 = +[BSServiceManager sharedInstanceCreatingIfNecessary:]((uint64_t)BSServiceManager, 1);
  id v6 = v5;
  id v7 = v3;
  if (v4)
  {
    id v8 = v6;
    NSClassFromString(&cfstr_Bsservicemanag.isa);
    if (!v8)
    {
      __int16 v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithManager_service_);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v17 = (objc_class *)objc_opt_class();
        uint64_t v18 = NSStringFromClass(v17);
        *(_DWORD *)long long v31 = 138544642;
        *(void *)&v31[4] = v16;
        *(_WORD *)&v31[12] = 2114;
        *(void *)&v31[14] = v18;
        __int16 v32 = 2048;
        long long v33 = v4;
        __int16 v34 = 2114;
        long long v35 = @"BSServiceConnectionEndpointMonitor.m";
        __int16 v36 = 1024;
        int v37 = 44;
        __int16 v38 = 2114;
        long long v39 = v15;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v31, 0x3Au);
      }
      [v15 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C77D7BCLL);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int16 v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSServiceManagerClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithManager_service_);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v21 = (objc_class *)objc_opt_class();
        uint64_t v22 = NSStringFromClass(v21);
        *(_DWORD *)long long v31 = 138544642;
        *(void *)&v31[4] = v20;
        *(_WORD *)&v31[12] = 2114;
        *(void *)&v31[14] = v22;
        __int16 v32 = 2048;
        long long v33 = v4;
        __int16 v34 = 2114;
        long long v35 = @"BSServiceConnectionEndpointMonitor.m";
        __int16 v36 = 1024;
        int v37 = 44;
        __int16 v38 = 2114;
        long long v39 = v19;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v31, 0x3Au);
      }
      [v19 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C77D8BCLL);
    }

    id v9 = v7;
    NSClassFromString(&cfstr_Nsstring.isa);
    if (!v9)
    {
      uint64_t v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithManager_service_);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        *(_DWORD *)long long v31 = 138544642;
        *(void *)&v31[4] = v24;
        *(_WORD *)&v31[12] = 2114;
        *(void *)&v31[14] = v26;
        __int16 v32 = 2048;
        long long v33 = v4;
        __int16 v34 = 2114;
        long long v35 = @"BSServiceConnectionEndpointMonitor.m";
        __int16 v36 = 1024;
        int v37 = 45;
        __int16 v38 = 2114;
        long long v39 = v23;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v31, 0x3Au);
      }
      [v23 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C77D9BCLL);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int16 v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithManager_service_);
        id v28 = (id)objc_claimAutoreleasedReturnValue();
        long long v29 = (objc_class *)objc_opt_class();
        long long v30 = NSStringFromClass(v29);
        *(_DWORD *)long long v31 = 138544642;
        *(void *)&v31[4] = v28;
        *(_WORD *)&v31[12] = 2114;
        *(void *)&v31[14] = v30;
        __int16 v32 = 2048;
        long long v33 = v4;
        __int16 v34 = 2114;
        long long v35 = @"BSServiceConnectionEndpointMonitor.m";
        __int16 v36 = 1024;
        int v37 = 45;
        __int16 v38 = 2114;
        long long v39 = v27;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v31, 0x3Au);
      }
      [v27 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C77DABCLL);
    }

    *(void *)long long v31 = v4;
    *(void *)&v31[8] = BSServiceConnectionEndpointMonitor;
    uint64_t v10 = (id *)objc_msgSendSuper2((objc_super *)v31, sel_init);
    int v11 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 1, v5);
      uint64_t v12 = [v9 copy];
      id v13 = v11[8];
      v11[8] = (id)v12;

      *((_DWORD *)v11 + 4) = 0;
      *((_DWORD *)v11 + 13) = 0;
    }
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

- (BSServiceConnectionEndpointMonitor)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = [NSString stringWithFormat:@"-init is not allowed on BSServiceConnectionEndpointMonitor"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    id v16 = @"BSServiceConnectionEndpointMonitor.m";
    __int16 v17 = 1024;
    int v18 = 39;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BSServiceConnectionEndpointMonitor *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_invalidated)
  {
    id v5 = [NSString stringWithFormat:@"must call invalidate before dealloc"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138544642;
      id v11 = v6;
      __int16 v12 = 2114;
      __int16 v13 = v8;
      __int16 v14 = 2048;
      __int16 v15 = self;
      __int16 v16 = 2114;
      __int16 v17 = @"BSServiceConnectionEndpointMonitor.m";
      __int16 v18 = 1024;
      int v19 = 57;
      __int16 v20 = 2114;
      uint64_t v21 = v5;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C795BE0);
  }
  os_unfair_lock_unlock(p_lock);
  v9.receiver = self;
  v9.super_class = (Class)BSServiceConnectionEndpointMonitor;
  [(BSServiceConnectionEndpointMonitor *)&v9 dealloc];
}

- (BSServiceConnectionEndpointMonitorDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_delegate;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)invalidate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_lock_invalidated = 1;
    lock_delegate = self->_lock_delegate;
    self->_lock_delegate = 0;

    os_unfair_lock_lock(&self->_registrationLock);
    os_unfair_lock_unlock(p_lock);
    [(BSInvalidatable *)self->_registrationLock_assertion invalidate];
    id v5 = BSServiceInjectionLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      service = self->_service;
      int v7 = 138412290;
      id v8 = service;
      _os_log_impl(&dword_19C754000, v5, OS_LOG_TYPE_DEFAULT, "invalidated monitor for service %@", (uint8_t *)&v7, 0xCu);
    }

    os_unfair_lock_unlock(&self->_registrationLock);
  }
}

- (id)endpointsForEnvironment:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    __int16 v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"environment"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v16 = (objc_class *)objc_opt_class();
      __int16 v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138544642;
      id v30 = v15;
      __int16 v31 = 2114;
      __int16 v32 = v17;
      __int16 v33 = 2048;
      __int16 v34 = self;
      __int16 v35 = 2114;
      __int16 v36 = @"BSServiceConnectionEndpointMonitor.m";
      __int16 v37 = 1024;
      int v38 = 113;
      __int16 v39 = 2114;
      uint64_t v40 = v14;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C796004);
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    __int16 v18 = [NSString stringWithFormat:@"cannot query after invalidation"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v20 = (objc_class *)objc_opt_class();
      uint64_t v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138544642;
      id v30 = v19;
      __int16 v31 = 2114;
      __int16 v32 = v21;
      __int16 v33 = 2048;
      __int16 v34 = self;
      __int16 v35 = 2114;
      __int16 v36 = @"BSServiceConnectionEndpointMonitor.m";
      __int16 v37 = 1024;
      int v38 = 116;
      __int16 v39 = 2114;
      uint64_t v40 = v18;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C7960F8);
  }
  if (!self->_lock_activated)
  {
    uint64_t v22 = [NSString stringWithFormat:@"cannot query before activation"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      id v24 = (objc_class *)objc_opt_class();
      __int16 v25 = NSStringFromClass(v24);
      *(_DWORD *)buf = 138544642;
      id v30 = v23;
      __int16 v31 = 2114;
      __int16 v32 = v25;
      __int16 v33 = 2048;
      __int16 v34 = self;
      __int16 v35 = 2114;
      __int16 v36 = @"BSServiceConnectionEndpointMonitor.m";
      __int16 v37 = 1024;
      int v38 = 117;
      __int16 v39 = 2114;
      uint64_t v40 = v22;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C7961ECLL);
  }
  int v7 = [MEMORY[0x1E4F1CA80] set];
  lock_endpointToEnvironments = self->_lock_endpointToEnvironments;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __62__BSServiceConnectionEndpointMonitor_endpointsForEnvironment___block_invoke;
  v26[3] = &unk_1E58FCBD0;
  id v9 = v5;
  id v27 = v9;
  id v10 = v7;
  id v28 = v10;
  [(NSDictionary *)lock_endpointToEnvironments enumerateKeysAndObjectsUsingBlock:v26];
  os_unfair_lock_unlock(p_lock);
  id v11 = v28;
  id v12 = v10;

  return v12;
}

void __62__BSServiceConnectionEndpointMonitor_endpointsForEnvironment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 containsObject:*(void *)(a1 + 32)]) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_service withName:@"service"];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    id v5 = @"invalidated";
LABEL_3:
    os_unfair_lock_unlock(&self->_lock);
LABEL_4:
    id v6 = 0;
    [v3 appendString:v5 withName:0];
    goto LABEL_5;
  }
  if (!self->_lock_activated)
  {
    id v5 = @"initializing";
    goto LABEL_3;
  }
  id v6 = self->_lock_delegate;
  os_unfair_lock_unlock(p_lock);
  if (!v6)
  {
    id v5 = @"active";
    goto LABEL_4;
  }
  id v9 = NSString;
  id v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  id v12 = [v9 stringWithFormat:@"<%@:%p>", v11, v6];
  [v3 appendString:v12 withName:@"delegate"];

LABEL_5:
  int v7 = [v3 build];

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_registrationLock_assertion, 0);
  objc_storeStrong((id *)&self->_lock_serialCallOut_endpoints, 0);
  objc_storeStrong((id *)&self->_lock_endpointToEnvironments, 0);
  objc_storeStrong((id *)&self->_lock_delegate, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

@end