@interface BSXPCServiceConnectionRootServerContext
+ (void)uniqueServerContextWithEndpointDescription:(uint64_t)a1;
- (BOOL)isServer;
@end

@implementation BSXPCServiceConnectionRootServerContext

- (BOOL)isServer
{
  return 1;
}

+ (void)uniqueServerContextWithEndpointDescription:(uint64_t)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = self;
  id v4 = v2;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v4)
  {
    v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_uniqueServerContextWithEndpointDescription_);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138544642;
      id v16 = v8;
      __int16 v17 = 2114;
      v18 = v10;
      __int16 v19 = 2048;
      uint64_t v20 = v3;
      __int16 v21 = 2114;
      v22 = @"BSXPCServiceConnectionContext.m";
      __int16 v23 = 1024;
      int v24 = 203;
      __int16 v25 = 2114;
      v26 = v7;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76A7E4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_uniqueServerContextWithEndpointDescription_);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138544642;
      id v16 = v12;
      __int16 v17 = 2114;
      v18 = v14;
      __int16 v19 = 2048;
      uint64_t v20 = v3;
      __int16 v21 = 2114;
      v22 = @"BSXPCServiceConnectionContext.m";
      __int16 v23 = 1024;
      int v24 = 203;
      __int16 v25 = 2114;
      v26 = v11;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76A8E4);
  }

  v5 = -[BSXPCServiceConnectionRootContext _initWithType:eDesc:]([BSXPCServiceConnectionRootServerContext alloc], 0x53u, v4);

  return v5;
}

@end