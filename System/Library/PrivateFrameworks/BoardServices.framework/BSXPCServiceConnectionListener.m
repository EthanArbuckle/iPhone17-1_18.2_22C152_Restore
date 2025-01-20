@interface BSXPCServiceConnectionListener
+ (_BYTE)XPCServiceListener;
+ (_BYTE)XPCServiceListenerWithSubserviceName:(uint64_t)a1;
+ (_BYTE)listener;
+ (_BYTE)listenerWithServiceName:(uint64_t)a1;
- (BOOL)_isClientInvalidated;
- (BOOL)_isInvalidated;
- (BSXPCServiceConnectionListener)init;
- (_BYTE)_initWithServiceName:(char)a3 isXPCService:;
- (id)endpoint;
- (uint64_t)isNonLaunching;
- (void)_invalidateChildConnection:(id)a3;
- (void)_invalidateWithLockBlock:(uint64_t)a1;
- (void)_lock_ensureEndpoint;
- (void)activateSuspended;
- (void)configure:(uint64_t)a1;
- (void)dealloc;
- (void)invalidate;
- (void)resume;
- (void)setConnectionHandler:(id)a3;
- (void)setEndpointDescription:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setServiceQuality:(id)a3;
- (void)suspendWithCompletion:(uint64_t)a1;
@end

@implementation BSXPCServiceConnectionListener

void __51__BSXPCServiceConnectionListener_activateSuspended__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = MEMORY[0x19F399FF0](a2);
  if (v8 != MEMORY[0x1E4F14578])
  {
    if (v8 == MEMORY[0x1E4F145A8])
    {
      *(void *)v19 = MEMORY[0x1E4F143A8];
      *(void *)&v19[8] = 3221225472;
      *(void *)&v19[16] = ____handleEvent_block_invoke_217;
      v20 = &unk_1E58FCB00;
      id v21 = v6;
      v22 = a2;
      -[BSXPCServiceConnectionListener _invalidateWithLockBlock:]((uint64_t)WeakRetained, (uint64_t)v19);
      if (v7)
      {
        v11 = BSServiceConnectionErrorCreate(2uLL, a2, 0);
        (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v11);
      }
    }
    else
    {
      v9 = BSServiceXPCErrorsLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v19 = 138543618;
        *(void *)&v19[4] = v6;
        *(_WORD *)&v19[12] = 2112;
        *(void *)&v19[14] = a2;
        _os_log_impl(&dword_19C754000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ unexpected event (%@)", v19, 0x16u);
      }
    }
    goto LABEL_25;
  }
  if (!WeakRetained)
  {
    v12 = BSServiceXPCLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v19 = 138543362;
      *(void *)&v19[4] = v6;
      _os_log_impl(&dword_19C754000, v12, OS_LOG_TYPE_INFO, "%{public}@ Rejecting incoming connection after listener deallocation", v19, 0xCu);
    }

    goto LABEL_24;
  }
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 8);
  if (*((unsigned char *)WeakRetained + 117))
  {
    v10 = BSServiceXPCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v19 = 138543362;
      *(void *)&v19[4] = v6;
      _os_log_impl(&dword_19C754000, v10, OS_LOG_TYPE_INFO, "%{public}@ Rejecting incoming connection after invalidation", v19, 0xCu);
    }
LABEL_23:

    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 8);
LABEL_24:
    +[BSXPCServiceConnection _invalidateIncomingXPCConnection:]((uint64_t)BSXPCServiceConnection, a2);
    goto LABEL_25;
  }
  +[BSXPCServiceConnection _connectionWithIncomingXPCConnection:endpointDescription:]((uint64_t)BSXPCServiceConnection, a2, *((void **)WeakRetained + 6));
  v13 = (id *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v10 = BSServiceXPCErrorsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v19 = 138543362;
      *(void *)&v19[4] = v6;
      _os_log_error_impl(&dword_19C754000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to wrap incoming connection - invalidating", v19, 0xCu);
    }
    goto LABEL_23;
  }
  [*((id *)WeakRetained + 12) addObject:v13];
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 8);
  -[BSXPCServiceConnection _setParent:]((uint64_t)v13, WeakRetained);
  *(void *)v19 = MEMORY[0x1E4F143A8];
  *(void *)&v19[8] = 3221225472;
  *(void *)&v19[16] = ____handleEvent_block_invoke;
  v20 = &unk_1E58FCB70;
  id v21 = WeakRetained;
  -[BSXPCServiceConnection configure:]((uint64_t)v13, (uint64_t)v19);
  v14 = BSServiceXPCLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v13[22];
    v16 = v15;
    if (v15) {
      v17 = (void *)*((void *)v15 + 1);
    }
    else {
      v17 = 0;
    }
    id v18 = v17;
    *(_DWORD *)buf = 138543618;
    v24 = v6;
    __int16 v25 = 2114;
    id v26 = v18;
    _os_log_impl(&dword_19C754000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Incoming connection %{public}@", buf, 0x16u);
  }
  (*(void (**)(uint64_t, id *))(v5 + 16))(v5, v13);

LABEL_25:
}

- (void)_invalidateChildConnection:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSHashTable *)self->_lock_childConnections containsObject:a3]) {
    [(NSHashTable *)self->_lock_childConnections removeObject:a3];
  }
  os_unfair_lock_unlock(p_lock);

  -[BSXPCServiceConnection _setParent:]((uint64_t)a3, 0);
}

- (BSXPCServiceConnectionListener)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = [NSString stringWithFormat:@"-init is not allowed on BSXPCServiceConnectionListener"];
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
    v16 = @"BSXPCServiceConnectionListener.m";
    __int16 v17 = 1024;
    int v18 = 55;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BSXPCServiceConnectionListener *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (_BYTE)_initWithServiceName:(char)a3 isXPCService:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  unint64_t add_explicit = atomic_fetch_add_explicit(&_initWithServiceName_isXPCService____uniqueCounter, 1uLL, memory_order_relaxed);
  v19.receiver = a1;
  v19.super_class = (Class)BSXPCServiceConnectionListener;
  v6 = objc_msgSendSuper2(&v19, sel_init);
  uint64_t v7 = v6;
  if (v6)
  {
    v6[112] = a3;
    uint64_t v8 = [a2 copy];
    int v9 = (void *)*((void *)v7 + 1);
    *((void *)v7 + 1) = v8;

    *((void *)v7 + 2) = add_explicit + 1;
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"[L:%llx]", add_explicit + 1);
    __int16 v11 = (void *)*((void *)v7 + 3);
    *((void *)v7 + 3) = v10;

    *((_DWORD *)v7 + 8) = 0;
    if (*((void *)v7 + 1)) {
      v12 = (__CFString *)*((void *)v7 + 1);
    }
    else {
      v12 = @"<anonymous>";
    }
    objc_storeStrong((id *)v7 + 6, v12);
    uint64_t v13 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    v14 = (void *)*((void *)v7 + 12);
    *((void *)v7 + 12) = v13;

    __int16 v15 = BSServiceXPCLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *((void *)v7 + 3);
      uint64_t v17 = *((void *)v7 + 6);
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v16;
      __int16 v22 = 2112;
      uint64_t v23 = v17;
      _os_log_impl(&dword_19C754000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Alloc (%@)", buf, 0x16u);
    }
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = BSServiceXPCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    proem = self->_proem;
    lock_debugDesc = self->_lock_debugDesc;
    if (!lock_debugDesc) {
      lock_debugDesc = self->_config_eDesc;
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = proem;
    __int16 v14 = 2112;
    __int16 v15 = lock_debugDesc;
    _os_log_impl(&dword_19C754000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Dealloc %@", buf, 0x16u);
  }

  if (!self->_lock_invalidated)
  {
    uint64_t v7 = [NSString stringWithFormat:@"must be invalidated before dealloc"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      uint64_t v8 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
      int v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      uint64_t v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      __int16 v15 = v10;
      __int16 v16 = 2048;
      uint64_t v17 = self;
      __int16 v18 = 2114;
      objc_super v19 = @"BSXPCServiceConnectionListener.m";
      __int16 v20 = 1024;
      int v21 = 79;
      __int16 v22 = 2114;
      uint64_t v23 = v7;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C791AC0);
  }
  v11.receiver = self;
  v11.super_class = (Class)BSXPCServiceConnectionListener;
  [(BSXPCServiceConnectionListener *)&v11 dealloc];
}

+ (_BYTE)listener
{
  self;
  v0 = -[BSXPCServiceConnectionListener _initWithServiceName:isXPCService:]([BSXPCServiceConnectionListener alloc], 0, 0);

  return v0;
}

+ (_BYTE)listenerWithServiceName:(uint64_t)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  id v4 = a2;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v4)
  {
    uint64_t v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_listenerWithServiceName_);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      int v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138544642;
      id v16 = v8;
      __int16 v17 = 2114;
      __int16 v18 = v10;
      __int16 v19 = 2048;
      uint64_t v20 = v3;
      __int16 v21 = 2114;
      __int16 v22 = @"BSXPCServiceConnectionListener.m";
      __int16 v23 = 1024;
      int v24 = 89;
      __int16 v25 = 2114;
      id v26 = v7;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C791D1CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_listenerWithServiceName_);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = (objc_class *)objc_opt_class();
      __int16 v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138544642;
      id v16 = v12;
      __int16 v17 = 2114;
      __int16 v18 = v14;
      __int16 v19 = 2048;
      uint64_t v20 = v3;
      __int16 v21 = 2114;
      __int16 v22 = @"BSXPCServiceConnectionListener.m";
      __int16 v23 = 1024;
      int v24 = 89;
      __int16 v25 = 2114;
      id v26 = v11;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C791E1CLL);
  }

  id v5 = -[BSXPCServiceConnectionListener _initWithServiceName:isXPCService:]([BSXPCServiceConnectionListener alloc], v4, 0);

  return v5;
}

+ (_BYTE)XPCServiceListener
{
  self;
  v0 = -[BSXPCServiceConnectionListener _initWithServiceName:isXPCService:]([BSXPCServiceConnectionListener alloc], 0, 1);

  return v0;
}

+ (_BYTE)XPCServiceListenerWithSubserviceName:(uint64_t)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  id v4 = a2;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v4)
  {
    uint64_t v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_XPCServiceListenerWithSubserviceName_);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      int v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138544642;
      id v16 = v8;
      __int16 v17 = 2114;
      __int16 v18 = v10;
      __int16 v19 = 2048;
      uint64_t v20 = v3;
      __int16 v21 = 2114;
      __int16 v22 = @"BSXPCServiceConnectionListener.m";
      __int16 v23 = 1024;
      int v24 = 98;
      __int16 v25 = 2114;
      id v26 = v7;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C792084);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_XPCServiceListenerWithSubserviceName_);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = (objc_class *)objc_opt_class();
      __int16 v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138544642;
      id v16 = v12;
      __int16 v17 = 2114;
      __int16 v18 = v14;
      __int16 v19 = 2048;
      uint64_t v20 = v3;
      __int16 v21 = 2114;
      __int16 v22 = @"BSXPCServiceConnectionListener.m";
      __int16 v23 = 1024;
      int v24 = 98;
      __int16 v25 = 2114;
      id v26 = v11;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C792184);
  }

  id v5 = -[BSXPCServiceConnectionListener _initWithServiceName:isXPCService:]([BSXPCServiceConnectionListener alloc], v4, 1);

  return v5;
}

- (id)endpoint
{
  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 8;
    os_unfair_lock_lock(a1 + 8);
    -[BSXPCServiceConnectionListener _lock_ensureEndpoint]((uint64_t)v1);
    v1 = (id *)v1[13];
    os_unfair_lock_unlock(v2);
  }

  return v1;
}

- (void)_lock_ensureEndpoint
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
    if (!*(void *)(a1 + 104))
    {
      v2 = *(_xpc_connection_s **)(a1 + 88);
      if (!v2)
      {
        id v5 = [NSString stringWithFormat:@"sanity - this shouldn't be possible"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__lock_ensureEndpoint);
          id v6 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v7 = (objc_class *)objc_opt_class();
          NSStringFromClass(v7);
          *(_DWORD *)buf = 138544642;
          id v14 = v6;
          id v8 = v15 = 2114;
          id v16 = v8;
          __int16 v17 = 2048;
          uint64_t v18 = a1;
          __int16 v19 = 2114;
          uint64_t v20 = @"BSXPCServiceConnectionListener.m";
          __int16 v21 = 1024;
          int v22 = 298;
          __int16 v23 = 2114;
          int v24 = v5;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v5 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C7923ECLL);
      }
      xpc_endpoint_t v3 = xpc_endpoint_create(v2);
      id v4 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v3;

      if (!*(void *)(a1 + 104))
      {
        int v9 = [NSString stringWithFormat:@"failed to retrieve an endpoint from listener=%@", *(void *)(a1 + 88)];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__lock_ensureEndpoint);
          id v10 = (id)objc_claimAutoreleasedReturnValue();
          objc_super v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          *(_DWORD *)buf = 138544642;
          id v14 = v10;
          v12 = __int16 v15 = 2114;
          id v16 = v12;
          __int16 v17 = 2048;
          uint64_t v18 = a1;
          __int16 v19 = 2114;
          uint64_t v20 = @"BSXPCServiceConnectionListener.m";
          __int16 v21 = 1024;
          int v22 = 300;
          __int16 v23 = 2114;
          int v24 = v9;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v9 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C7924ECLL);
      }
      if (xpc_connection_get_bs_type() == 3) {
        *(unsigned char *)(a1 + 113) = 1;
      }
    }
  }
}

- (uint64_t)isNonLaunching
{
  uint64_t v1 = (uint64_t)a1;
  if (a1)
  {
    v2 = a1 + 8;
    os_unfair_lock_lock(a1 + 8);
    -[BSXPCServiceConnectionListener _lock_ensureEndpoint](v1);
    uint64_t v1 = *(unsigned char *)(v1 + 113) != 0;
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)configure:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!a2)
    {
      id v4 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"block"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_configure_);
        id v5 = (id)objc_claimAutoreleasedReturnValue();
        id v6 = (objc_class *)objc_opt_class();
        uint64_t v7 = NSStringFromClass(v6);
        *(_DWORD *)buf = 138544642;
        id v21 = v5;
        __int16 v22 = 2114;
        __int16 v23 = v7;
        __int16 v24 = 2048;
        uint64_t v25 = a1;
        __int16 v26 = 2114;
        uint64_t v27 = @"BSXPCServiceConnectionListener.m";
        __int16 v28 = 1024;
        int v29 = 119;
        __int16 v30 = 2114;
        v31 = v4;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v4 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C792734);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    if (*(unsigned char *)(a1 + 114))
    {
      id v8 = [NSString stringWithFormat:@"cannot configure after sealing"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_configure_);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        id v10 = (objc_class *)objc_opt_class();
        objc_super v11 = NSStringFromClass(v10);
        *(_DWORD *)buf = 138544642;
        id v21 = v9;
        __int16 v22 = 2114;
        __int16 v23 = v11;
        __int16 v24 = 2048;
        uint64_t v25 = a1;
        __int16 v26 = 2114;
        uint64_t v27 = @"BSXPCServiceConnectionListener.m";
        __int16 v28 = 1024;
        int v29 = 121;
        __int16 v30 = 2114;
        v31 = v8;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v8 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C79282CLL);
    }
    if (*(unsigned char *)(a1 + 118))
    {
      id v12 = [NSString stringWithFormat:@"cannot configure after invalidation"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_configure_);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        id v14 = (objc_class *)objc_opt_class();
        __int16 v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138544642;
        id v21 = v13;
        __int16 v22 = 2114;
        __int16 v23 = v15;
        __int16 v24 = 2048;
        uint64_t v25 = a1;
        __int16 v26 = 2114;
        uint64_t v27 = @"BSXPCServiceConnectionListener.m";
        __int16 v28 = 1024;
        int v29 = 122;
        __int16 v30 = 2114;
        v31 = v12;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C792924);
    }
    if (*(unsigned char *)(a1 + 117))
    {
      id v16 = [NSString stringWithFormat:@"sanity - this shouldn't be possible"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_configure_);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v18 = (objc_class *)objc_opt_class();
        __int16 v19 = NSStringFromClass(v18);
        *(_DWORD *)buf = 138544642;
        id v21 = v17;
        __int16 v22 = 2114;
        __int16 v23 = v19;
        __int16 v24 = 2048;
        uint64_t v25 = a1;
        __int16 v26 = 2114;
        uint64_t v27 = @"BSXPCServiceConnectionListener.m";
        __int16 v28 = 1024;
        int v29 = 123;
        __int16 v30 = 2114;
        v31 = v16;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v16 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C792A1CLL);
    }
    (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
  }
}

- (void)activateSuspended
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    if (*(unsigned char *)(a1 + 115))
    {
      __int16 v28 = [NSString stringWithFormat:@"cannot seal after activation"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_activateSuspended);
        id v29 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v30 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v30);
        *(_DWORD *)buf = 138544642;
        id v50 = v29;
        __int16 v51 = 2114;
        v52 = v31;
        __int16 v53 = 2048;
        uint64_t v54 = a1;
        __int16 v55 = 2114;
        v56 = @"BSXPCServiceConnectionListener.m";
        __int16 v57 = 1024;
        int v58 = 130;
        __int16 v59 = 2114;
        v60 = v28;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v28 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C792ED0);
    }
    if (*(unsigned char *)(a1 + 118))
    {
      uint64_t v32 = [NSString stringWithFormat:@"cannot seal after invalidation"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_activateSuspended);
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        v34 = (objc_class *)objc_opt_class();
        v35 = NSStringFromClass(v34);
        *(_DWORD *)buf = 138544642;
        id v50 = v33;
        __int16 v51 = 2114;
        v52 = v35;
        __int16 v53 = 2048;
        uint64_t v54 = a1;
        __int16 v55 = 2114;
        v56 = @"BSXPCServiceConnectionListener.m";
        __int16 v57 = 1024;
        int v58 = 131;
        __int16 v59 = 2114;
        v60 = v32;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v32 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C792FC8);
    }
    if (*(unsigned char *)(a1 + 114))
    {
      v36 = [NSString stringWithFormat:@"cannot seal twice"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_activateSuspended);
        id v37 = (id)objc_claimAutoreleasedReturnValue();
        v38 = (objc_class *)objc_opt_class();
        v39 = NSStringFromClass(v38);
        *(_DWORD *)buf = 138544642;
        id v50 = v37;
        __int16 v51 = 2114;
        v52 = v39;
        __int16 v53 = 2048;
        uint64_t v54 = a1;
        __int16 v55 = 2114;
        v56 = @"BSXPCServiceConnectionListener.m";
        __int16 v57 = 1024;
        int v58 = 132;
        __int16 v59 = 2114;
        v60 = v36;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v36 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C7930C0);
    }
    if (!*(void *)(a1 + 64))
    {
      v40 = [NSString stringWithFormat:@"connection handler must be set before sealing"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_activateSuspended);
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        v42 = (objc_class *)objc_opt_class();
        v43 = NSStringFromClass(v42);
        *(_DWORD *)buf = 138544642;
        id v50 = v41;
        __int16 v51 = 2114;
        v52 = v43;
        __int16 v53 = 2048;
        uint64_t v54 = a1;
        __int16 v55 = 2114;
        v56 = @"BSXPCServiceConnectionListener.m";
        __int16 v57 = 1024;
        int v58 = 133;
        __int16 v59 = 2114;
        v60 = v40;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v40 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C7931B8);
    }
    *(unsigned char *)(a1 + 114) = 1;
    uint64_t v3 = [NSString stringWithFormat:@"BSXPCLsn:%llx:%@", *(void *)(a1 + 16), *(void *)(a1 + 48)];
    id v4 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v3;

    id v5 = BSServiceXPCLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = *(void **)(a1 + 24);
      uint64_t v7 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      id v50 = v6;
      __int16 v51 = 2112;
      v52 = v7;
      _os_log_impl(&dword_19C754000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Sealed %@", buf, 0x16u);
    }

    id v8 = *(void **)(a1 + 56);
    if (v8)
    {
      id v9 = v8;
    }
    else
    {
      id v9 = +[BSServiceQuality userInitiated];
    }
    id v10 = v9;
    objc_super v11 = [MEMORY[0x1E4F4F730] serial];
    id v12 = objc_msgSend(v11, "serviceClass:relativePriority:", objc_msgSend(v10, "serviceClass"), objc_msgSend(v10, "relativePriority"));
    uint64_t v13 = BSDispatchQueueCreate();
    id v14 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = v13;

    __int16 v15 = *(void **)(a1 + 8);
    if (*(unsigned char *)(a1 + 112))
    {
      [v15 UTF8String];
      uint64_t bs_service_listener = xpc_connection_create_bs_service_listener();
    }
    else
    {
      if (!v15)
      {
        xpc_connection_t v27 = xpc_connection_create(0, *(dispatch_queue_t *)(a1 + 80));
        id v17 = *(void **)(a1 + 88);
        *(void *)(a1 + 88) = v27;
        goto LABEL_16;
      }
      uint64_t bs_service_listener = (uint64_t)xpc_connection_create_mach_service((const char *)[v15 UTF8String], *(dispatch_queue_t *)(a1 + 80), 1uLL);
    }
    id v17 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = bs_service_listener;
LABEL_16:

    xpc_connection_set_bs_type();
    objc_initWeak((id *)buf, (id)a1);
    id v18 = *(id *)(a1 + 24);
    __int16 v19 = (void *)MEMORY[0x19F399B00](*(void *)(a1 + 64));
    uint64_t v20 = (void *)MEMORY[0x19F399B00](*(void *)(a1 + 72));
    id v21 = *(_xpc_connection_s **)(a1 + 88);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __51__BSXPCServiceConnectionListener_activateSuspended__block_invoke;
    handler[3] = &unk_1E58FCAB0;
    objc_copyWeak(&v48, (id *)buf);
    id v45 = v18;
    id v46 = v19;
    id v47 = v20;
    id v22 = v20;
    id v23 = v19;
    id v24 = v18;
    xpc_connection_set_event_handler(v21, handler);
    uint64_t v25 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;

    __int16 v26 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = 0;

    os_unfair_lock_unlock(v2);
    objc_destroyWeak(&v48);

    objc_destroyWeak((id *)buf);
  }
}

- (void)resume
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    if (*(unsigned char *)(a1 + 118))
    {
      id v12 = [NSString stringWithFormat:@"cannot resume after invalidation"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_resume);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        id v14 = (objc_class *)objc_opt_class();
        __int16 v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138544642;
        id v33 = v13;
        __int16 v34 = 2114;
        v35 = v15;
        __int16 v36 = 2048;
        uint64_t v37 = a1;
        __int16 v38 = 2114;
        v39 = @"BSXPCServiceConnectionListener.m";
        __int16 v40 = 1024;
        int v41 = 167;
        __int16 v42 = 2114;
        v43 = v12;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C793550);
    }
    if (!*(unsigned char *)(a1 + 114))
    {
      id v16 = [NSString stringWithFormat:@"must be activated before resume"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_resume);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        id v18 = (objc_class *)objc_opt_class();
        __int16 v19 = NSStringFromClass(v18);
        *(_DWORD *)buf = 138544642;
        id v33 = v17;
        __int16 v34 = 2114;
        v35 = v19;
        __int16 v36 = 2048;
        uint64_t v37 = a1;
        __int16 v38 = 2114;
        v39 = @"BSXPCServiceConnectionListener.m";
        __int16 v40 = 1024;
        int v41 = 168;
        __int16 v42 = 2114;
        v43 = v16;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v16 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C793648);
    }
    if (*(unsigned char *)(a1 + 116))
    {
      uint64_t v20 = [NSString stringWithFormat:@"must call suspend before calling resume a second time"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_resume);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        id v22 = (objc_class *)objc_opt_class();
        id v23 = NSStringFromClass(v22);
        *(_DWORD *)buf = 138544642;
        id v33 = v21;
        __int16 v34 = 2114;
        v35 = v23;
        __int16 v36 = 2048;
        uint64_t v37 = a1;
        __int16 v38 = 2114;
        v39 = @"BSXPCServiceConnectionListener.m";
        __int16 v40 = 1024;
        int v41 = 169;
        __int16 v42 = 2114;
        v43 = v20;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v20 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C793740);
    }
    *(unsigned char *)(a1 + 116) = 1;
    if (!*(unsigned char *)(a1 + 117))
    {
      if (*(unsigned char *)(a1 + 115))
      {
        uint64_t v3 = BSServiceXPCLog();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          id v4 = *(void **)(a1 + 24);
          id v5 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          id v33 = v4;
          __int16 v34 = 2112;
          v35 = v5;
          _os_log_impl(&dword_19C754000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Resumed %@", buf, 0x16u);
        }

        xpc_connection_resume(*(xpc_connection_t *)(a1 + 88));
      }
      else
      {
        *(unsigned char *)(a1 + 115) = 1;
        id v6 = BSServiceXPCLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v7 = *(void **)(a1 + 24);
          id v8 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          id v33 = v7;
          __int16 v34 = 2112;
          v35 = v8;
          _os_log_impl(&dword_19C754000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Activated %@", buf, 0x16u);
        }

        if (!*(unsigned char *)(a1 + 112))
        {
          xpc_connection_activate(*(xpc_connection_t *)(a1 + 88));
          if (*(void *)(a1 + 104))
          {
            xpc_endpoint_t v9 = xpc_endpoint_create(*(xpc_connection_t *)(a1 + 88));
            int bs_type = xpc_connection_get_bs_type();
            if (!xpc_equal(*(xpc_object_t *)(a1 + 104), v9))
            {
              id v24 = [NSString stringWithFormat:@"activation endpoint is not equivalent to previous sealing endpoint : new=%@ old=%@", v9, *(void *)(a1 + 104)];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(sel_resume);
                id v25 = (id)objc_claimAutoreleasedReturnValue();
                __int16 v26 = (objc_class *)objc_opt_class();
                xpc_connection_t v27 = NSStringFromClass(v26);
                *(_DWORD *)buf = 138544642;
                id v33 = v25;
                __int16 v34 = 2114;
                v35 = v27;
                __int16 v36 = 2048;
                uint64_t v37 = a1;
                __int16 v38 = 2114;
                v39 = @"BSXPCServiceConnectionListener.m";
                __int16 v40 = 1024;
                int v41 = 187;
                __int16 v42 = 2114;
                v43 = v24;
                _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
              }
              [v24 UTF8String];
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19C79383CLL);
            }
            uint64_t v11 = *(unsigned __int8 *)(a1 + 113);
            if (v11 != (bs_type == 3))
            {
              __int16 v28 = objc_msgSend(NSString, "stringWithFormat:", @"activation endpoint is not the same bs_type as the previous sealing endpoint : new=%{BOOL}i old=%{BOOL}i", bs_type == 3, v11);
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(sel_resume);
                id v29 = (id)objc_claimAutoreleasedReturnValue();
                __int16 v30 = (objc_class *)objc_opt_class();
                v31 = NSStringFromClass(v30);
                *(_DWORD *)buf = 138544642;
                id v33 = v29;
                __int16 v34 = 2114;
                v35 = v31;
                __int16 v36 = 2048;
                uint64_t v37 = a1;
                __int16 v38 = 2114;
                v39 = @"BSXPCServiceConnectionListener.m";
                __int16 v40 = 1024;
                int v41 = 188;
                __int16 v42 = 2114;
                v43 = v28;
                _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
              }
              [v28 UTF8String];
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19C793934);
            }
          }
          else
          {
            -[BSXPCServiceConnectionListener _lock_ensureEndpoint](a1);
          }
        }
      }
    }
    os_unfair_lock_unlock(v2);
  }
}

- (void)suspendWithCompletion:(uint64_t)a1
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*(unsigned char *)(a1 + 112))
    {
      id v8 = [NSString stringWithFormat:@"xpc services cannot be suspended"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_suspendWithCompletion_);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        id v10 = (objc_class *)objc_opt_class();
        uint64_t v11 = NSStringFromClass(v10);
        *(_DWORD *)buf = 138544642;
        id v30 = v9;
        __int16 v31 = 2114;
        uint64_t v32 = v11;
        __int16 v33 = 2048;
        uint64_t v34 = a1;
        __int16 v35 = 2114;
        __int16 v36 = @"BSXPCServiceConnectionListener.m";
        __int16 v37 = 1024;
        int v38 = 199;
        __int16 v39 = 2114;
        __int16 v40 = v8;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v8 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C793C30);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    if (*(unsigned char *)(a1 + 118))
    {
      id v12 = [NSString stringWithFormat:@"cannot suspend after invalidation"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_suspendWithCompletion_);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        id v14 = (objc_class *)objc_opt_class();
        __int16 v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138544642;
        id v30 = v13;
        __int16 v31 = 2114;
        uint64_t v32 = v15;
        __int16 v33 = 2048;
        uint64_t v34 = a1;
        __int16 v35 = 2114;
        __int16 v36 = @"BSXPCServiceConnectionListener.m";
        __int16 v37 = 1024;
        int v38 = 201;
        __int16 v39 = 2114;
        __int16 v40 = v12;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C793D28);
    }
    if (!*(unsigned char *)(a1 + 116))
    {
      id v16 = [NSString stringWithFormat:@"must call resume before calling suspend"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_suspendWithCompletion_);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        id v18 = (objc_class *)objc_opt_class();
        __int16 v19 = NSStringFromClass(v18);
        *(_DWORD *)buf = 138544642;
        id v30 = v17;
        __int16 v31 = 2114;
        uint64_t v32 = v19;
        __int16 v33 = 2048;
        uint64_t v34 = a1;
        __int16 v35 = 2114;
        __int16 v36 = @"BSXPCServiceConnectionListener.m";
        __int16 v37 = 1024;
        int v38 = 202;
        __int16 v39 = 2114;
        __int16 v40 = v16;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v16 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C793E20);
    }
    if (!*(unsigned char *)(a1 + 114))
    {
      uint64_t v20 = [NSString stringWithFormat:@"sanity - this shouldn't be possible"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_suspendWithCompletion_);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        id v22 = (objc_class *)objc_opt_class();
        id v23 = NSStringFromClass(v22);
        *(_DWORD *)buf = 138544642;
        id v30 = v21;
        __int16 v31 = 2114;
        uint64_t v32 = v23;
        __int16 v33 = 2048;
        uint64_t v34 = a1;
        __int16 v35 = 2114;
        __int16 v36 = @"BSXPCServiceConnectionListener.m";
        __int16 v37 = 1024;
        int v38 = 203;
        __int16 v39 = 2114;
        __int16 v40 = v20;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v20 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C793F18);
    }
    if (!*(unsigned char *)(a1 + 115))
    {
      id v24 = [NSString stringWithFormat:@"sanity - this shouldn't be possible"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_suspendWithCompletion_);
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v26 = (objc_class *)objc_opt_class();
        xpc_connection_t v27 = NSStringFromClass(v26);
        *(_DWORD *)buf = 138544642;
        id v30 = v25;
        __int16 v31 = 2114;
        uint64_t v32 = v27;
        __int16 v33 = 2048;
        uint64_t v34 = a1;
        __int16 v35 = 2114;
        __int16 v36 = @"BSXPCServiceConnectionListener.m";
        __int16 v37 = 1024;
        int v38 = 204;
        __int16 v39 = 2114;
        __int16 v40 = v24;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v24 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C794010);
    }
    *(unsigned char *)(a1 + 116) = 0;
    if (!*(unsigned char *)(a1 + 117))
    {
      xpc_connection_suspend(*(xpc_connection_t *)(a1 + 88));
      id v4 = BSServiceXPCLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = *(void **)(a1 + 24);
        id v6 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        id v30 = v5;
        __int16 v31 = 2112;
        uint64_t v32 = v6;
        _os_log_impl(&dword_19C754000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Suspended %@", buf, 0x16u);
      }
    }
    uint64_t v7 = *(NSObject **)(a1 + 80);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __56__BSXPCServiceConnectionListener_suspendWithCompletion___block_invoke;
    v28[3] = &unk_1E58FCB28;
    v28[4] = a1;
    v28[5] = a2;
    dispatch_async(v7, v28);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
  }
}

uint64_t __56__BSXPCServiceConnectionListener_suspendWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 117))
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = *(id *)(v2 + 96);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v3);
          }
          -[BSXPCServiceConnection _parentDisconnectedWithInterrupt:](*(void *)(*((void *)&v8 + 1) + 8 * v6++), 1);
        }
        while (v4 != v6);
        uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }

    uint64_t v2 = *(void *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 32));
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(result + 16))(result);
  }
  return result;
}

- (void)invalidate
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_isXPCService)
  {
    uint64_t v4 = [NSString stringWithFormat:@"xpc services cannot invalidate"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      id v10 = v5;
      __int16 v11 = 2114;
      id v12 = v7;
      __int16 v13 = 2048;
      id v14 = self;
      __int16 v15 = 2114;
      id v16 = @"BSXPCServiceConnectionListener.m";
      __int16 v17 = 1024;
      int v18 = 226;
      __int16 v19 = 2114;
      uint64_t v20 = v4;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C794368);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__BSXPCServiceConnectionListener_invalidate__block_invoke;
  v8[3] = &unk_1E58FCAD8;
  v8[4] = self;
  v8[5] = a2;
  -[BSXPCServiceConnectionListener _invalidateWithLockBlock:]((uint64_t)self, (uint64_t)v8);
}

uint64_t __44__BSXPCServiceConnectionListener_invalidate__block_invoke(uint64_t result)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 118))
  {
    uint64_t v2 = result;
    id v3 = [NSString stringWithFormat:@"cannot invalidate twice"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(v2 + 40));
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      id v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      uint64_t v7 = *(void *)(v2 + 32);
      int v8 = 138544642;
      id v9 = v4;
      __int16 v10 = 2114;
      __int16 v11 = v6;
      __int16 v12 = 2048;
      uint64_t v13 = v7;
      __int16 v14 = 2114;
      __int16 v15 = @"BSXPCServiceConnectionListener.m";
      __int16 v16 = 1024;
      int v17 = 228;
      __int16 v18 = 2114;
      __int16 v19 = v3;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
    }
    [v3 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C794500);
  }
  *(unsigned char *)(v1 + 118) = 1;
  return result;
}

- (void)_invalidateWithLockBlock:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
    if (*(unsigned char *)(a1 + 117))
    {
      BOOL v5 = 0;
      BOOL v6 = 0;
      uint64_t v7 = 0;
      id v8 = 0;
    }
    else
    {
      *(unsigned char *)(a1 + 117) = 1;
      id v8 = *(id *)(a1 + 96);
      id v9 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = 0;

      uint64_t v7 = (_xpc_connection_s *)*(id *)(a1 + 88);
      if (!*(unsigned char *)(a1 + 112))
      {
        __int16 v10 = *(void **)(a1 + 88);
        *(void *)(a1 + 88) = 0;
      }
      __int16 v11 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = 0;

      __int16 v12 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = 0;

      BOOL v5 = *(unsigned char *)(a1 + 115) != 0;
      BOOL v6 = *(unsigned char *)(a1 + 116) != 0;
    }
    os_unfair_lock_unlock(v4);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v21;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v13);
          }
          -[BSXPCServiceConnection _parentDisconnectedWithInterrupt:](*(void *)(*((void *)&v20 + 1) + 8 * v16++), 0);
        }
        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v14);
    }

    if (v7)
    {
      xpc_connection_set_event_handler(v7, &__block_literal_global_118);
      if (*(unsigned char *)(a1 + 112))
      {
        int v17 = BSServiceXPCErrorsLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = *(void *)(a1 + 24);
          uint64_t v19 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138543618;
          uint64_t v25 = v18;
          __int16 v26 = 2114;
          uint64_t v27 = v19;
          _os_log_impl(&dword_19C754000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ xpc-service %{public}@ is now impotent", buf, 0x16u);
        }
      }
      else
      {
        xpc_connection_cancel(v7);
        if (v5)
        {
          if (!v6) {
            xpc_connection_resume(v7);
          }
        }
        else
        {
          xpc_connection_activate(v7);
        }
      }
    }
  }
}

- (void)setEndpointDescription:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v5)
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v10 = (objc_class *)objc_opt_class();
      __int16 v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v17 = v9;
      __int16 v18 = 2114;
      uint64_t v19 = v11;
      __int16 v20 = 2048;
      long long v21 = self;
      __int16 v22 = 2114;
      long long v23 = @"BSXPCServiceConnectionListener.m";
      __int16 v24 = 1024;
      int v25 = 245;
      __int16 v26 = 2114;
      uint64_t v27 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C794984);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138544642;
      id v17 = v13;
      __int16 v18 = 2114;
      uint64_t v19 = v15;
      __int16 v20 = 2048;
      long long v21 = self;
      __int16 v22 = 2114;
      long long v23 = @"BSXPCServiceConnectionListener.m";
      __int16 v24 = 1024;
      int v25 = 245;
      __int16 v26 = 2114;
      uint64_t v27 = v12;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C794A84);
  }

  os_unfair_lock_assert_owner(&self->_lock);
  BOOL v6 = (NSString *)[v5 copy];
  config_eDesc = self->_config_eDesc;
  self->_config_eDesc = v6;
}

- (void)setServiceQuality:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  NSClassFromString(&cfstr_Bsservicequali.isa);
  if (!v5)
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v10 = (objc_class *)objc_opt_class();
      __int16 v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v17 = v9;
      __int16 v18 = 2114;
      uint64_t v19 = v11;
      __int16 v20 = 2048;
      long long v21 = self;
      __int16 v22 = 2114;
      long long v23 = @"BSXPCServiceConnectionListener.m";
      __int16 v24 = 1024;
      int v25 = 251;
      __int16 v26 = 2114;
      uint64_t v27 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C794CA0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSServiceQualityClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138544642;
      id v17 = v13;
      __int16 v18 = 2114;
      uint64_t v19 = v15;
      __int16 v20 = 2048;
      long long v21 = self;
      __int16 v22 = 2114;
      long long v23 = @"BSXPCServiceConnectionListener.m";
      __int16 v24 = 1024;
      int v25 = 251;
      __int16 v26 = 2114;
      uint64_t v27 = v12;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C794DA0);
  }

  os_unfair_lock_assert_owner(&self->_lock);
  BOOL v6 = (BSServiceQuality *)[v5 copy];
  config_qos = self->_config_qos;
  self->_config_qos = v6;
}

- (void)setConnectionHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v10 = (objc_class *)objc_opt_class();
      __int16 v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      __int16 v16 = 2048;
      id v17 = self;
      __int16 v18 = 2114;
      uint64_t v19 = @"BSXPCServiceConnectionListener.m";
      __int16 v20 = 1024;
      int v21 = 257;
      __int16 v22 = 2114;
      long long v23 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C794F90);
  }
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = (void *)MEMORY[0x19F399B00](a3);
  id lock_connectionHandler = self->_lock_connectionHandler;
  self->_id lock_connectionHandler = v5;
}

- (void)setErrorHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v10 = (objc_class *)objc_opt_class();
      __int16 v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      __int16 v16 = 2048;
      id v17 = self;
      __int16 v18 = 2114;
      uint64_t v19 = @"BSXPCServiceConnectionListener.m";
      __int16 v20 = 1024;
      int v21 = 263;
      __int16 v22 = 2114;
      long long v23 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C79514CLL);
  }
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = (void *)MEMORY[0x19F399B00](a3);
  id lock_errorHandler = self->_lock_errorHandler;
  self->_id lock_errorHandler = v5;
}

- (BOOL)_isInvalidated
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_isClientInvalidated
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_clientInvalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

void __59__BSXPCServiceConnectionListener__invalidateWithLockBlock___block_invoke(uint64_t a1, void *a2)
{
  if (MEMORY[0x19F399FF0](a2) == MEMORY[0x1E4F14578])
  {
    +[BSXPCServiceConnection _invalidateIncomingXPCConnection:]((uint64_t)BSXPCServiceConnection, a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_endpoint, 0);
  objc_storeStrong((id *)&self->_lock_childConnections, 0);
  objc_storeStrong((id *)&self->_lock_listener, 0);
  objc_storeStrong((id *)&self->_lock_queue, 0);
  objc_storeStrong(&self->_lock_errorHandler, 0);
  objc_storeStrong(&self->_lock_connectionHandler, 0);
  objc_storeStrong((id *)&self->_config_qos, 0);
  objc_storeStrong((id *)&self->_config_eDesc, 0);
  objc_storeStrong((id *)&self->_lock_debugDesc, 0);
  objc_storeStrong((id *)&self->_proem, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end