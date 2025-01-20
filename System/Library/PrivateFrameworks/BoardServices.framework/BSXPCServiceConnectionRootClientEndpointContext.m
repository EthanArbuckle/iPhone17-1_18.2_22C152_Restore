@interface BSXPCServiceConnectionRootClientEndpointContext
+ (BSXPCServiceConnectionRootClientEndpointContext)uniqueClientContextWithEndpoint:(void *)a3 oneshot:(BOOL)a4 nonLaunching:(void *)a5 description:;
- (BOOL)isClient;
- (BOOL)isNonLaunching;
@end

@implementation BSXPCServiceConnectionRootClientEndpointContext

- (BOOL)isClient
{
  return 1;
}

- (BOOL)isNonLaunching
{
  return self->_nonLaunching;
}

+ (BSXPCServiceConnectionRootClientEndpointContext)uniqueClientContextWithEndpoint:(void *)a3 oneshot:(BOOL)a4 nonLaunching:(void *)a5 description:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = self;
  if (!v8)
  {
    v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"endpoint"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_uniqueClientContextWithEndpoint_oneshot_nonLaunching_description_);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      *(_DWORD *)buf = 138544642;
      id v40 = v24;
      __int16 v41 = 2114;
      v42 = v26;
      __int16 v43 = 2048;
      uint64_t v44 = v11;
      __int16 v45 = 2114;
      v46 = @"BSXPCServiceConnectionContext.m";
      __int16 v47 = 1024;
      int v48 = 247;
      __int16 v49 = 2114;
      v50 = v23;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76C620);
  }
  id v12 = v9;
  if (v12)
  {
    NSClassFromString(&cfstr_Nsuuid.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_uniqueClientContextWithEndpoint_oneshot_nonLaunching_description_);
        id v36 = (id)objc_claimAutoreleasedReturnValue();
        v37 = (objc_class *)objc_opt_class();
        v38 = NSStringFromClass(v37);
        *(_DWORD *)buf = 138544642;
        id v40 = v36;
        __int16 v41 = 2114;
        v42 = v38;
        __int16 v43 = 2048;
        uint64_t v44 = v11;
        __int16 v45 = 2114;
        v46 = @"BSXPCServiceConnectionContext.m";
        __int16 v47 = 1024;
        int v48 = 248;
        __int16 v49 = 2114;
        v50 = v35;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v35 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C76C920);
    }
  }

  id v13 = v10;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v13)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_uniqueClientContextWithEndpoint_oneshot_nonLaunching_description_);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      *(_DWORD *)buf = 138544642;
      id v40 = v28;
      __int16 v41 = 2114;
      v42 = v30;
      __int16 v43 = 2048;
      uint64_t v44 = v11;
      __int16 v45 = 2114;
      v46 = @"BSXPCServiceConnectionContext.m";
      __int16 v47 = 1024;
      int v48 = 249;
      __int16 v49 = 2114;
      v50 = v27;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76C720);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_uniqueClientContextWithEndpoint_oneshot_nonLaunching_description_);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      v33 = (objc_class *)objc_opt_class();
      v34 = NSStringFromClass(v33);
      *(_DWORD *)buf = 138544642;
      id v40 = v32;
      __int16 v41 = 2114;
      v42 = v34;
      __int16 v43 = 2048;
      uint64_t v44 = v11;
      __int16 v45 = 2114;
      v46 = @"BSXPCServiceConnectionContext.m";
      __int16 v47 = 1024;
      int v48 = 249;
      __int16 v49 = 2114;
      v50 = v31;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76C820);
  }

  v14 = [BSXPCServiceConnectionRootClientEndpointContext alloc];
  id v15 = v8;
  id v16 = v12;
  id v17 = v13;
  if (v14)
  {
    v14 = (BSXPCServiceConnectionRootClientEndpointContext *)-[BSXPCServiceConnectionRootContext _initWithType:eDesc:](v14, 0x43u, v17);
    if (v14)
    {
      v18 = (OS_xpc_object *)xpc_copy(v15);
      endpoint = v14->_endpoint;
      v14->_endpoint = v18;

      uint64_t v20 = [v16 copy];
      oneshot = v14->_oneshot;
      v14->_oneshot = (NSUUID *)v20;

      v14->_nonLaunching = a4;
    }
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oneshot, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end