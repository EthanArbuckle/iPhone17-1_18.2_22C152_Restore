@interface _BSServiceConnectionConfiguration
- (id)interface;
- (void)setActivationHandler:(id)a3;
- (void)setBatchingHandler:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setInterface:(id)a3;
- (void)setInterfaceTarget:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMessageHandler:(id)a3;
- (void)setName:(id)a3;
- (void)setServiceQuality:(id)a3;
- (void)setTargetDispatchingQueue:(id)a3;
- (void)setTargetQueue:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation _BSServiceConnectionConfiguration

- (void)setInterface:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"interface"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v13 = v9;
      __int16 v14 = 2114;
      v15 = v11;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      v19 = @"BSServiceConnection.m";
      __int16 v20 = 1024;
      int v21 = 84;
      __int16 v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C760960);
  }
  os_unfair_lock_assert_owner(self->_lock);
  v5 = (BSServiceInterface *)[a3 copy];
  interface = self->_interface;
  self->_interface = v5;
}

- (void)setServiceQuality:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"serviceQuality"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v13 = v9;
      __int16 v14 = 2114;
      v15 = v11;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      v19 = @"BSServiceConnection.m";
      __int16 v20 = 1024;
      int v21 = 74;
      __int16 v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C762480);
  }
  os_unfair_lock_assert_owner(self->_lock);
  v5 = (BSServiceQuality *)[a3 copy];
  serviceQuality = self->_serviceQuality;
  self->_serviceQuality = v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong(&self->_batchingHandler, 0);
  objc_storeStrong((id *)&self->_targetDispatchingQueue, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_activationHandler, 0);
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_serviceQuality, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)setInvalidationHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v13 = v9;
      __int16 v14 = 2114;
      v15 = v11;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      v19 = @"BSServiceConnection.m";
      __int16 v20 = 1024;
      int v21 = 111;
      __int16 v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76D230);
  }
  os_unfair_lock_assert_owner(self->_lock);
  v5 = (void *)[a3 copy];
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = v5;
}

- (void)setInterruptionHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v13 = v9;
      __int16 v14 = 2114;
      v15 = v11;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      v19 = @"BSServiceConnection.m";
      __int16 v20 = 1024;
      int v21 = 105;
      __int16 v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76D670);
  }
  os_unfair_lock_assert_owner(self->_lock);
  v5 = (void *)[a3 copy];
  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = v5;
}

- (void)setInterfaceTarget:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"target"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138544642;
      id v11 = v7;
      __int16 v12 = 2114;
      id v13 = v9;
      __int16 v14 = 2048;
      v15 = self;
      __int16 v16 = 2114;
      v17 = @"BSServiceConnection.m";
      __int16 v18 = 1024;
      int v19 = 90;
      __int16 v20 = 2114;
      int v21 = v6;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76D8B4);
  }
  os_unfair_lock_assert_owner(self->_lock);
  objc_storeStrong(&self->_target, a3);
}

- (void)setTargetQueue:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"targetQueue"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138544642;
      id v11 = v7;
      __int16 v12 = 2114;
      id v13 = v9;
      __int16 v14 = 2048;
      v15 = self;
      __int16 v16 = 2114;
      v17 = @"BSServiceConnection.m";
      __int16 v18 = 1024;
      int v19 = 117;
      __int16 v20 = 2114;
      int v21 = v6;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C772190);
  }
  os_unfair_lock_assert_owner(self->_lock);
  objc_storeStrong((id *)&self->_targetQueue, a3);
}

- (void)setUserInfo:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"userInfo"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v13 = v9;
      __int16 v14 = 2114;
      v15 = v11;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      int v19 = @"BSServiceConnection.m";
      __int16 v20 = 1024;
      int v21 = 136;
      __int16 v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77236CLL);
  }
  os_unfair_lock_assert_owner(self->_lock);
  v5 = (NSCopying *)[a3 copyWithZone:0];
  userInfo = self->_userInfo;
  self->_userInfo = v5;
}

- (void)setTargetDispatchingQueue:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"dispatchingQueue"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138544642;
      id v15 = v7;
      __int16 v16 = 2114;
      v17 = v9;
      __int16 v18 = 2048;
      int v19 = self;
      __int16 v20 = 2114;
      int v21 = @"BSServiceConnection.m";
      __int16 v22 = 1024;
      int v23 = 123;
      __int16 v24 = 2114;
      v25 = v6;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C776D88);
  }
  os_unfair_lock_assert_owner(self->_lock);
  if (self->_targetQueue)
  {
    v10 = [NSString stringWithFormat:@"Cannot have a target queue set if using a target dispatching queue."];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544642;
      id v15 = v11;
      __int16 v16 = 2114;
      v17 = v13;
      __int16 v18 = 2048;
      int v19 = self;
      __int16 v20 = 2114;
      int v21 = @"BSServiceConnection.m";
      __int16 v22 = 1024;
      int v23 = 125;
      __int16 v24 = 2114;
      v25 = v10;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C776E80);
  }
  objc_storeStrong((id *)&self->_targetDispatchingQueue, a3);
}

- (void)setMessageHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v13 = v9;
      __int16 v14 = 2114;
      id v15 = v11;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      int v19 = @"BSServiceConnection.m";
      __int16 v20 = 1024;
      int v21 = 142;
      __int16 v22 = 2114;
      int v23 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77A32CLL);
  }
  os_unfair_lock_assert_owner(self->_lock);
  v5 = (void *)[a3 copy];
  id messageHandler = self->_messageHandler;
  self->_id messageHandler = v5;
}

- (void)setErrorHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v13 = v9;
      __int16 v14 = 2114;
      id v15 = v11;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      int v19 = @"BSServiceConnection.m";
      __int16 v20 = 1024;
      int v21 = 148;
      __int16 v22 = 2114;
      int v23 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77A4E8);
  }
  os_unfair_lock_assert_owner(self->_lock);
  v5 = (void *)[a3 copy];
  id errorHandler = self->_errorHandler;
  self->_id errorHandler = v5;
}

- (void)setName:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"name"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v13 = v9;
      __int16 v14 = 2114;
      id v15 = v11;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      int v19 = @"BSServiceConnection.m";
      __int16 v20 = 1024;
      int v21 = 68;
      __int16 v22 = 2114;
      int v23 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77A6A4);
  }
  os_unfair_lock_assert_owner(self->_lock);
  v5 = (NSString *)[a3 copy];
  name = self->_name;
  self->_name = v5;
}

- (void)setActivationHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v13 = v9;
      __int16 v14 = 2114;
      id v15 = v11;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      int v19 = @"BSServiceConnection.m";
      __int16 v20 = 1024;
      int v21 = 98;
      __int16 v22 = 2114;
      int v23 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77AFE4);
  }
  os_unfair_lock_assert_owner(self->_lock);
  v5 = (void *)[a3 copy];
  id activationHandler = self->_activationHandler;
  self->_id activationHandler = v5;
}

- (void)setBatchingHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v13 = v9;
      __int16 v14 = 2114;
      id v15 = v11;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      int v19 = @"BSServiceConnection.m";
      __int16 v20 = 1024;
      int v21 = 130;
      __int16 v22 = 2114;
      int v23 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77CF14);
  }
  os_unfair_lock_assert_owner(self->_lock);
  v5 = (void *)[a3 copy];
  id batchingHandler = self->_batchingHandler;
  self->_id batchingHandler = v5;
}

- (id)interface
{
  os_unfair_lock_assert_owner(self->_lock);
  interface = self->_interface;

  return interface;
}

@end