@interface ITAttentionAwarenessClient
- (AWAttentionAwarenessClient)_access_attentionAwarenessClient;
- (AWAttentionAwarenessConfiguration)configuration;
- (BOOL)isEnabled;
- (ITAttentionAwarenessClient)init;
- (ITAttentionAwarenessClient)initWithCalloutQueue:(id)a3;
- (ITAttentionAwarenessClientDelegate)delegate;
- (id)_initWithCalloutQueue:(id)a3 attentionAwarenessClient:(id)a4;
- (void)_access_resume;
- (void)_access_suspend;
- (void)_handleAttentionAwarenessEvent:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setConfiguration:(id)a3 shouldReset:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)set_access_attentionAwarenessClient:(id)a3;
@end

@implementation ITAttentionAwarenessClient

- (ITAttentionAwarenessClient)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"ITAttentionAwarenessClient.m" lineNumber:25 description:@"wrong initializer"];

  return 0;
}

- (ITAttentionAwarenessClient)initWithCalloutQueue:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F28868];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [(ITAttentionAwarenessClient *)self _initWithCalloutQueue:v5 attentionAwarenessClient:v6];

  return v7;
}

- (id)_initWithCalloutQueue:(id)a3 attentionAwarenessClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ITAttentionAwarenessClient;
  v8 = [(ITAttentionAwarenessClient *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_accessLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v8->_access_attentionAwarenessClient, a4);
    objc_initWeak(&location, v9);
    access_attentionAwarenessClient = v9->_access_attentionAwarenessClient;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __77__ITAttentionAwarenessClient__initWithCalloutQueue_attentionAwarenessClient___block_invoke;
    v12[3] = &unk_2645C7960;
    objc_copyWeak(&v13, &location);
    [(AWAttentionAwarenessClient *)access_attentionAwarenessClient setEventHandlerWithQueue:v6 block:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __77__ITAttentionAwarenessClient__initWithCalloutQueue_attentionAwarenessClient___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleAttentionAwarenessEvent:v5];
  }
}

- (BOOL)isEnabled
{
  v2 = self;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  LOBYTE(v2) = v2->_access_enabled;
  os_unfair_lock_unlock(p_accessLock);
  return (char)v2;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  if (self->_access_enabled != v3)
  {
    self->_access_enabled = v3;
    if (v3) {
      [(ITAttentionAwarenessClient *)self _access_resume];
    }
    else {
      [(ITAttentionAwarenessClient *)self _access_suspend];
    }
  }

  os_unfair_lock_unlock(p_accessLock);
}

- (AWAttentionAwarenessConfiguration)configuration
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  v4 = [(AWAttentionAwarenessClient *)self->_access_attentionAwarenessClient configuration];
  id v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_accessLock);

  return (AWAttentionAwarenessConfiguration *)v5;
}

- (void)setConfiguration:(id)a3
{
}

- (void)setConfiguration:(id)a3 shouldReset:(BOOL)a4
{
  BOOL v4 = a4;
  p_accessLock = &self->_accessLock;
  id v7 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  access_attentionAwarenessClient = self->_access_attentionAwarenessClient;
  v9 = (void *)[v7 copy];

  [(AWAttentionAwarenessClient *)access_attentionAwarenessClient setConfiguration:v9 shouldReset:v4];

  os_unfair_lock_unlock(p_accessLock);
}

- (void)_access_resume
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->_accessLock);
  BOOL v3 = [(AWAttentionAwarenessClient *)self->_access_attentionAwarenessClient configuration];
  BOOL v4 = ITLogIdleTimer();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    access_attentionAwarenessClient = self->_access_attentionAwarenessClient;
    *(_DWORD *)buf = 138543618;
    v14 = access_attentionAwarenessClient;
    __int16 v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_22177B000, v4, OS_LOG_TYPE_DEFAULT, "attention client RESUME client: %{public}@ with configuration: %{public}@", buf, 0x16u);
  }

  id v6 = self->_access_attentionAwarenessClient;
  id v12 = 0;
  char v7 = [(AWAttentionAwarenessClient *)v6 resumeWithError:&v12];
  id v8 = v12;
  if ((v7 & 1) == 0)
  {
    v9 = ITLogIdleTimer();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (AWAttentionAwarenessClient *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v11;
      __int16 v15 = 2114;
      v16 = v3;
      __int16 v17 = 2114;
      id v18 = v8;
      _os_log_error_impl(&dword_22177B000, v9, OS_LOG_TYPE_ERROR, "%{public}@ - attention client %{public}@ cannot resume; error:%{public}@",
        buf,
        0x20u);
    }
  }
}

- (void)_access_suspend
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->_accessLock);
  BOOL v3 = ITLogIdleTimer();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22177B000, v3, OS_LOG_TYPE_DEFAULT, "attention client SUSPEND", buf, 2u);
  }

  access_attentionAwarenessClient = self->_access_attentionAwarenessClient;
  id v12 = 0;
  char v5 = [(AWAttentionAwarenessClient *)access_attentionAwarenessClient suspendWithError:&v12];
  id v6 = v12;
  if ((v5 & 1) == 0)
  {
    char v7 = [(AWAttentionAwarenessClient *)self->_access_attentionAwarenessClient configuration];
    id v8 = ITLogIdleTimer();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      v11 = [v7 identifier];
      *(_DWORD *)buf = 138543874;
      v14 = v10;
      __int16 v15 = 2114;
      v16 = v11;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_error_impl(&dword_22177B000, v8, OS_LOG_TYPE_ERROR, "%{public}@ - attention client %{public}@ cannot suspend; error:%{public}@",
        buf,
        0x20u);
    }
  }
}

- (void)_handleAttentionAwarenessEvent:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [v4 tag];
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    if ([v4 eventMask])
    {
      uint64_t v12 = objc_opt_class();
      id v13 = v4;
      if (v12)
      {
        if (objc_opt_isKindOfClass()) {
          v14 = v13;
        }
        else {
          v14 = 0;
        }
      }
      else
      {
        v14 = 0;
      }
      id v15 = v14;

      if (v15)
      {
        [v15 attentionLostTimeout];
        double v17 = v16;
        id v18 = [v15 associatedObject];
        uint64_t v19 = objc_opt_class();
        id v20 = v18;
        if (v19)
        {
          if (objc_opt_isKindOfClass()) {
            v21 = v20;
          }
          else {
            v21 = 0;
          }
        }
        else
        {
          v21 = 0;
        }
        v22 = v21;

        if (v22)
        {
          v23 = [[ITIdleTimeout alloc] initWithDuration:[v22 unsignedIntegerValue] identifier:v17];
          [WeakRetained client:self attentionLostTimeoutDidExpire:v23 forContext:v10];
        }
        else
        {
          ITLogIdleTimer();
          v23 = (ITIdleTimeout *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v23->super, OS_LOG_TYPE_FAULT)) {
            [(ITAttentionAwarenessClient *)(uint64_t)self _handleAttentionAwarenessEvent:&v23->super];
          }
        }
      }
      else
      {
        v22 = ITLogIdleTimer();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          [(ITAttentionAwarenessClient *)(uint64_t)self _handleAttentionAwarenessEvent:v22];
        }
      }
    }
    else
    {
      v11 = ITLogIdleTimer();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[ITAttentionAwarenessClient _handleAttentionAwarenessEvent:]((uint64_t)v4, v11);
      }

      [WeakRetained clientDidReset:self forUserAttentionEvent:v4 withContext:v10];
    }
  }
}

- (AWAttentionAwarenessClient)_access_attentionAwarenessClient
{
  return self->_access_attentionAwarenessClient;
}

- (void)set_access_attentionAwarenessClient:(id)a3
{
}

- (ITAttentionAwarenessClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ITAttentionAwarenessClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_access_attentionAwarenessClient, 0);
}

- (void)_handleAttentionAwarenessEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22177B000, a2, OS_LOG_TYPE_DEBUG, "attention event: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_handleAttentionAwarenessEvent:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  int v7 = 138543618;
  id v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_22177B000, a3, OS_LOG_TYPE_ERROR, "%{public}@ - attention event: expected AWAttentionLostEvent instead of %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)_handleAttentionAwarenessEvent:(NSObject *)a3 .cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  char v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  int v7 = [a2 associatedObject];
  int v8 = 138543618;
  __int16 v9 = v6;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  _os_log_fault_impl(&dword_22177B000, a3, OS_LOG_TYPE_FAULT, "%{public}@ - attention client \"lost event\" timeoutTag is not a NSObject: %{public}@", (uint8_t *)&v8, 0x16u);
}

@end