@interface BSServiceConnectionListener
+ (id)extendBootstrap;
+ (id)listenerWithConfigurator:(id)a3;
- (BSServiceConnectionEndpoint)endpoint;
- (BSServiceConnectionListener)init;
- (NSString)description;
- (NSString)domain;
- (NSString)instance;
- (NSString)service;
- (void)activate;
- (void)dealloc;
- (void)didReceiveConnection:(id)a3;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setDomain:(id)a3;
- (void)setInstance:(id)a3;
- (void)setService:(id)a3;
@end

@implementation BSServiceConnectionListener

- (void)didReceiveConnection:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_activated || self->_lock_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
LABEL_4:
    v6 = BSServiceLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = [a3 instance];
      domain = self->_domain;
      service = self->_service;
      *(_DWORD *)buf = 138413058;
      v13 = v8;
      __int16 v14 = 2112;
      v15 = service;
      __int16 v16 = 2112;
      v17 = domain;
      __int16 v18 = 2112;
      id v19 = a3;
      _os_log_error_impl(&dword_19C754000, v6, OS_LOG_TYPE_ERROR, "invalidating connection to instance %@ of service %@ of domain %@ because there is no delegate to handle it : %@", buf, 0x2Au);
    }
    [a3 invalidate];
    return;
  }
  v11 = self->_lock_delegate;
  os_unfair_lock_unlock(p_lock);
  if (!v11) {
    goto LABEL_4;
  }
  v7 = -[BSServiceConnection _clientContext]((uint64_t)a3);
  [(BSServiceConnectionListenerDelegate *)v11 listener:self didReceiveConnection:a3 withContext:v7];
}

- (BSServiceConnectionEndpoint)endpoint
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
    goto LABEL_9;
  }
  lock_endpoint = self->_lock_endpoint;
  if (lock_endpoint)
  {
    v6 = lock_endpoint;
    os_unfair_lock_unlock(p_lock);
    goto LABEL_5;
  }
  +[BSServiceConnectionEndpoint _endpointForManager:domain:service:instance:]((uint64_t)BSServiceConnectionEndpoint, self->_manager, self->_domain, self->_service, self->_instance);
  v7 = (BSServiceConnectionEndpoint *)objc_claimAutoreleasedReturnValue();
  v8 = self->_lock_endpoint;
  self->_lock_endpoint = v7;

  v6 = v7;
  os_unfair_lock_unlock(p_lock);
  if (!v6)
  {
LABEL_9:
    v10 = [NSString stringWithFormat:@"failed to fetch endpoint for %@", self];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544642;
      id v15 = v11;
      __int16 v16 = 2114;
      v17 = v13;
      __int16 v18 = 2048;
      id v19 = self;
      __int16 v20 = 2114;
      v21 = @"BSServiceConnectionListener.m";
      __int16 v22 = 1024;
      int v23 = 91;
      __int16 v24 = 2114;
      v25 = v10;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77A998);
  }
LABEL_5:

  return v6;
}

- (BSServiceConnectionListener)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = [NSString stringWithFormat:@"-init is not allowed on BSServiceConnectionListener"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    __int16 v14 = self;
    __int16 v15 = 2114;
    __int16 v16 = @"BSServiceConnectionListener.m";
    __int16 v17 = 1024;
    int v18 = 41;
    __int16 v19 = 2114;
    __int16 v20 = v4;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BSServiceConnectionListener *)_bs_set_crash_log_message();
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
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138544642;
      id v11 = v6;
      __int16 v12 = 2114;
      __int16 v13 = v8;
      __int16 v14 = 2048;
      __int16 v15 = self;
      __int16 v16 = 2114;
      __int16 v17 = @"BSServiceConnectionListener.m";
      __int16 v18 = 1024;
      int v19 = 65;
      __int16 v20 = 2114;
      uint64_t v21 = v5;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C7967F4);
  }
  os_unfair_lock_unlock(p_lock);
  v9.receiver = self;
  v9.super_class = (Class)BSServiceConnectionListener;
  [(BSServiceConnectionListener *)&v9 dealloc];
}

+ (id)listenerWithConfigurator:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v4 = [BSServiceConnectionListener alloc];
  id v5 = +[BSServiceManager sharedInstanceCreatingIfNecessary:]((uint64_t)BSServiceManager, 1);
  id v6 = v5;
  if (v4)
  {
    id v7 = v5;
    NSClassFromString(&cfstr_Bsservicemanag.isa);
    if (!v7)
    {
      id v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithManager_config_);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v12 = (objc_class *)objc_opt_class();
        __int16 v13 = NSStringFromClass(v12);
        *(_DWORD *)buf = 138544642;
        id v36 = v11;
        __int16 v37 = 2114;
        v38 = v13;
        __int16 v39 = 2048;
        v40 = v4;
        __int16 v41 = 2114;
        v42 = @"BSServiceConnectionListener.m";
        __int16 v43 = 1024;
        int v44 = 46;
        __int16 v45 = 2114;
        v46 = v10;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v10 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C796AB0);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int16 v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSServiceManagerClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithManager_config_);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v16 = (objc_class *)objc_opt_class();
        __int16 v17 = NSStringFromClass(v16);
        *(_DWORD *)buf = 138544642;
        id v36 = v15;
        __int16 v37 = 2114;
        v38 = v17;
        __int16 v39 = 2048;
        v40 = v4;
        __int16 v41 = 2114;
        v42 = @"BSServiceConnectionListener.m";
        __int16 v43 = 1024;
        int v44 = 46;
        __int16 v45 = 2114;
        v46 = v14;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v14 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C796BB0);
    }

    if (!a3)
    {
      __int16 v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"block"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithManager_config_);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v20 = (objc_class *)objc_opt_class();
        uint64_t v21 = NSStringFromClass(v20);
        *(_DWORD *)buf = 138544642;
        id v36 = v19;
        __int16 v37 = 2114;
        v38 = v21;
        __int16 v39 = 2048;
        v40 = v4;
        __int16 v41 = 2114;
        v42 = @"BSServiceConnectionListener.m";
        __int16 v43 = 1024;
        int v44 = 47;
        __int16 v45 = 2114;
        v46 = v18;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v18 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C796CB0);
    }
    v34.receiver = v4;
    v34.super_class = (Class)BSServiceConnectionListener;
    v8 = objc_msgSendSuper2(&v34, sel_init);
    v4 = (BSServiceConnectionListener *)v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, v6);
      v4->_lock._os_unfair_lock_opaque = 0;
      v4->_registrationLock._os_unfair_lock_opaque = 0;
      os_unfair_lock_lock(&v4->_lock);
      (*((void (**)(id, BSServiceConnectionListener *))a3 + 2))(a3, v4);
      if (!v4->_domain)
      {
        uint64_t v22 = [NSString stringWithFormat:@"must configure a domain"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithManager_config_);
          id v23 = (id)objc_claimAutoreleasedReturnValue();
          __int16 v24 = (objc_class *)objc_opt_class();
          v25 = NSStringFromClass(v24);
          *(_DWORD *)buf = 138544642;
          id v36 = v23;
          __int16 v37 = 2114;
          v38 = v25;
          __int16 v39 = 2048;
          v40 = v4;
          __int16 v41 = 2114;
          v42 = @"BSServiceConnectionListener.m";
          __int16 v43 = 1024;
          int v44 = 55;
          __int16 v45 = 2114;
          v46 = v22;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v22 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C796DA4);
      }
      if (!v4->_service)
      {
        uint64_t v26 = [NSString stringWithFormat:@"must configure a service"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithManager_config_);
          id v27 = (id)objc_claimAutoreleasedReturnValue();
          v28 = (objc_class *)objc_opt_class();
          v29 = NSStringFromClass(v28);
          *(_DWORD *)buf = 138544642;
          id v36 = v27;
          __int16 v37 = 2114;
          v38 = v29;
          __int16 v39 = 2048;
          v40 = v4;
          __int16 v41 = 2114;
          v42 = @"BSServiceConnectionListener.m";
          __int16 v43 = 1024;
          int v44 = 56;
          __int16 v45 = 2114;
          v46 = v26;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v26 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C796E98);
      }
      if (!v4->_lock_delegate)
      {
        v30 = [NSString stringWithFormat:@"must configure a delegate"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithManager_config_);
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          v32 = (objc_class *)objc_opt_class();
          v33 = NSStringFromClass(v32);
          *(_DWORD *)buf = 138544642;
          id v36 = v31;
          __int16 v37 = 2114;
          v38 = v33;
          __int16 v39 = 2048;
          v40 = v4;
          __int16 v41 = 2114;
          v42 = @"BSServiceConnectionListener.m";
          __int16 v43 = 1024;
          int v44 = 57;
          __int16 v45 = 2114;
          v46 = v30;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v30 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C796F8CLL);
      }
      os_unfair_lock_unlock(&v4->_lock);
    }
  }

  return v4;
}

- (void)activate
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    __int16 v12 = [NSString stringWithFormat:@"cannot activate after invalidation"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      __int16 v13 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      __int16 v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      id v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      id v31 = v13;
      __int16 v32 = 2114;
      v33 = v15;
      __int16 v34 = 2048;
      v35 = self;
      __int16 v36 = 2114;
      __int16 v37 = @"BSServiceConnectionListener.m";
      __int16 v38 = 1024;
      int v39 = 97;
      __int16 v40 = 2114;
      __int16 v41 = v12;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C7972F0);
  }
  if (self->_lock_activated)
  {
    __int16 v16 = [NSString stringWithFormat:@"cannot activate twice"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      __int16 v17 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      __int16 v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      id v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      id v31 = v17;
      __int16 v32 = 2114;
      v33 = v19;
      __int16 v34 = 2048;
      v35 = self;
      __int16 v36 = 2114;
      __int16 v37 = @"BSServiceConnectionListener.m";
      __int16 v38 = 1024;
      int v39 = 98;
      __int16 v40 = 2114;
      __int16 v41 = v16;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C7973E8);
  }
  self->_lock_activated = 1;
  os_unfair_lock_lock(&self->_registrationLock);
  os_unfair_lock_unlock(p_lock);
  id v5 = -[BSServiceManager domainWithIdentifier:]((uint64_t)self->_manager, self->_domain);
  if (!v5)
  {
    instance = (__CFString *)self->_instance;
    if (!instance) {
      instance = @"<any>";
    }
    uint64_t v21 = [NSString stringWithFormat:@"failed to activate listener for instance %@ of service %@ in domain %@ because the domain was not initialized", instance, self->_service, self->_domain];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      uint64_t v22 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      id v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      __int16 v24 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      id v31 = v22;
      __int16 v32 = 2114;
      v33 = v24;
      __int16 v34 = 2048;
      v35 = self;
      __int16 v36 = 2114;
      __int16 v37 = @"BSServiceConnectionListener.m";
      __int16 v38 = 1024;
      int v39 = 104;
      __int16 v40 = 2114;
      __int16 v41 = v21;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C7974FCLL);
  }
  id v6 = BSServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (__CFString *)self->_instance;
    if (!v7) {
      id v7 = @"<any>";
    }
    domain = self->_domain;
    service = self->_service;
    *(_DWORD *)buf = 138412802;
    id v31 = v7;
    __int16 v32 = 2112;
    v33 = service;
    __int16 v34 = 2112;
    v35 = (BSServiceConnectionListener *)domain;
    _os_log_impl(&dword_19C754000, v6, OS_LOG_TYPE_INFO, "activating listener for instance %@ of service %@ in domain %@", buf, 0x20u);
  }

  -[BSServiceDomain registerListener:]((uint64_t)v5, self);
  id v10 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  registrationLock_assertion = self->_registrationLock_assertion;
  self->_registrationLock_assertion = v10;

  if (!self->_registrationLock_assertion)
  {
    v25 = (__CFString *)self->_instance;
    if (!v25) {
      v25 = @"<any>";
    }
    uint64_t v26 = [NSString stringWithFormat:@"failed to register listener for instance %@ of service %@ in domain %@", v25, self->_service, self->_domain];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v27 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      id v31 = v27;
      __int16 v32 = 2114;
      v33 = v29;
      __int16 v34 = 2048;
      v35 = self;
      __int16 v36 = 2114;
      __int16 v37 = @"BSServiceConnectionListener.m";
      __int16 v38 = 1024;
      int v39 = 107;
      __int16 v40 = 2114;
      __int16 v41 = v26;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C797610);
  }
  os_unfair_lock_unlock(&self->_registrationLock);
}

- (void)invalidate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
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
    id v5 = BSServiceLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      domain = self->_domain;
      service = self->_service;
      int v8 = 138412546;
      objc_super v9 = service;
      __int16 v10 = 2112;
      id v11 = domain;
      _os_log_impl(&dword_19C754000, v5, OS_LOG_TYPE_INFO, "invalidated listener for service %@ in domain %@", (uint8_t *)&v8, 0x16u);
    }

    os_unfair_lock_unlock(&self->_registrationLock);
  }
}

+ (id)extendBootstrap
{
  +[BSServiceManager sharedInstanceCreatingIfNecessary:]((uint64_t)BSServiceManager, 1);
  v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v3 = -[BSServiceManager extendAutomaticBootstrapCompletion](v2);

  return v3;
}

- (void)setDomain:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v5)
  {
    int v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v17 = v9;
      __int16 v18 = 2114;
      id v19 = v11;
      __int16 v20 = 2048;
      uint64_t v21 = self;
      __int16 v22 = 2114;
      id v23 = @"BSServiceConnectionListener.m";
      __int16 v24 = 1024;
      int v25 = 143;
      __int16 v26 = 2114;
      id v27 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C797A08);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138544642;
      id v17 = v13;
      __int16 v18 = 2114;
      id v19 = v15;
      __int16 v20 = 2048;
      uint64_t v21 = self;
      __int16 v22 = 2114;
      id v23 = @"BSServiceConnectionListener.m";
      __int16 v24 = 1024;
      int v25 = 143;
      __int16 v26 = 2114;
      id v27 = v12;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C797B08);
  }

  os_unfair_lock_assert_owner(&self->_lock);
  id v6 = (NSString *)[v5 copy];
  domain = self->_domain;
  self->_domain = v6;
}

- (void)setService:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v5)
  {
    int v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v17 = v9;
      __int16 v18 = 2114;
      id v19 = v11;
      __int16 v20 = 2048;
      uint64_t v21 = self;
      __int16 v22 = 2114;
      id v23 = @"BSServiceConnectionListener.m";
      __int16 v24 = 1024;
      int v25 = 149;
      __int16 v26 = 2114;
      id v27 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C797D24);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138544642;
      id v17 = v13;
      __int16 v18 = 2114;
      id v19 = v15;
      __int16 v20 = 2048;
      uint64_t v21 = self;
      __int16 v22 = 2114;
      id v23 = @"BSServiceConnectionListener.m";
      __int16 v24 = 1024;
      int v25 = 149;
      __int16 v26 = 2114;
      id v27 = v12;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C797E24);
  }

  os_unfair_lock_assert_owner(&self->_lock);
  id v6 = (NSString *)[v5 copy];
  service = self->_service;
  self->_service = v6;
}

- (void)setInstance:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v5)
  {
    int v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v17 = v9;
      __int16 v18 = 2114;
      id v19 = v11;
      __int16 v20 = 2048;
      uint64_t v21 = self;
      __int16 v22 = 2114;
      id v23 = @"BSServiceConnectionListener.m";
      __int16 v24 = 1024;
      int v25 = 155;
      __int16 v26 = 2114;
      id v27 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C798040);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138544642;
      id v17 = v13;
      __int16 v18 = 2114;
      id v19 = v15;
      __int16 v20 = 2048;
      uint64_t v21 = self;
      __int16 v22 = 2114;
      id v23 = @"BSServiceConnectionListener.m";
      __int16 v24 = 1024;
      int v25 = 155;
      __int16 v26 = 2114;
      id v27 = v12;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C798140);
  }

  os_unfair_lock_assert_owner(&self->_lock);
  id v6 = (NSString *)[v5 copy];
  instance = self->_instance;
  self->_instance = v6;
}

- (void)setDelegate:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"delegate"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      int v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138544642;
      id v11 = v7;
      __int16 v12 = 2114;
      id v13 = v9;
      __int16 v14 = 2048;
      id v15 = self;
      __int16 v16 = 2114;
      id v17 = @"BSServiceConnectionListener.m";
      __int16 v18 = 1024;
      int v19 = 161;
      __int16 v20 = 2114;
      uint64_t v21 = v6;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C79831CLL);
  }
  os_unfair_lock_assert_owner(&self->_lock);
  objc_storeStrong((id *)&self->_lock_delegate, a3);
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_domain withName:@"domain"];
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
    id v5 = @"inactive";
    goto LABEL_3;
  }
  id v6 = self->_lock_delegate;
  os_unfair_lock_unlock(p_lock);
  if (!v6)
  {
    id v5 = 0;
    goto LABEL_4;
  }
  id v9 = (id)[v3 appendObject:v6 withName:@"delegate"];
LABEL_5:
  id v7 = [v3 build];

  return (NSString *)v7;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)service
{
  return self->_service;
}

- (NSString)instance
{
  return self->_instance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_endpoint, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_registrationLock_assertion, 0);
  objc_storeStrong((id *)&self->_lock_delegate, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

@end