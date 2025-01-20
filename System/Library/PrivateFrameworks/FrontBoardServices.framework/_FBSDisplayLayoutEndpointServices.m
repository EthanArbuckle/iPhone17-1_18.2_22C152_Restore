@interface _FBSDisplayLayoutEndpointServices
+ (id)_checkoutServiceWithEndpoint:(id)a3 qos:(char)a4;
+ (void)_checkinService:(id)a3;
@end

@implementation _FBSDisplayLayoutEndpointServices

+ (void)_checkinService:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"service"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[_FBSDisplayLayoutEndpointServices _checkinService:]();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
  }
  id v18 = v3;
  v4 = [v3 endpoint];
  os_unfair_lock_lock((os_unfair_lock_t)&__sharedEndpointServicesLock);
  uint64_t v5 = [(id)__sharedEndpointServices objectForKey:v4];
  v6 = v18;
  v7 = (void *)v5;
  if (v5)
  {
    uint64_t v8 = 0;
    uint64_t v9 = v5 + 8;
    uint64_t v10 = v5 + 32;
    char v11 = 1;
    do
    {
      while (1)
      {
        uint64_t v12 = *(void *)(v10 + 8 * v8);
        if (*(void **)(v9 + 8 * v8) == v6) {
          break;
        }
        v11 &= v12 == 0;
LABEL_6:
        if (++v8 == 3)
        {
          if (v11)
          {
            [(id)__sharedEndpointServices removeObjectForKey:v4];
            if (![(id)__sharedEndpointServices count])
            {
              v15 = (void *)__sharedEndpointServices;
              __sharedEndpointServices = 0;
            }
          }
          goto LABEL_16;
        }
      }
      if (!v12)
      {
        v16 = [NSString stringWithFormat:@"invalid refcnt for qos=%i endpoint=%@", v8, v4];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          +[_FBSDisplayLayoutEndpointServices _checkinService:]();
        }
        [v16 UTF8String];
        _bs_set_crash_log_message();
      }
      uint64_t v13 = v12 - 1;
      *(void *)(v10 + 8 * v8) = v13;
      if (!v13)
      {
        [v6 invalidate];
        v14 = *(void **)(v9 + 8 * v8);
        *(void *)(v9 + 8 * v8) = 0;

        v6 = v18;
        goto LABEL_6;
      }
      char v11 = 0;
      ++v8;
    }
    while (v8 != 3);
  }
LABEL_16:
  os_unfair_lock_unlock((os_unfair_lock_t)&__sharedEndpointServicesLock);
}

+ (id)_checkoutServiceWithEndpoint:(id)a3 qos:(char)a4
{
  uint64_t v4 = a4;
  id v5 = a3;
  if (!v5)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"endpoint"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[_FBSDisplayLayoutEndpointServices _checkoutServiceWithEndpoint:qos:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
  }
  v6 = v5;
  v7 = +[FBSDisplayLayoutMonitor serviceIdentifier];
  uint64_t v8 = [v6 service];
  char v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    v20 = [NSString stringWithFormat:@"endpoint's service is unexpected : %@", v6];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[_FBSDisplayLayoutEndpointServices _checkoutServiceWithEndpoint:qos:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
  }
  if (v4 >= 3)
  {
    v21 = [NSString stringWithFormat:@"invalid QOS %d", (int)v4];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[_FBSDisplayLayoutEndpointServices _checkoutServiceWithEndpoint:qos:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
  }
  os_unfair_lock_lock((os_unfair_lock_t)&__sharedEndpointServicesLock);
  uint64_t v10 = (void *)__sharedEndpointServices;
  if (!__sharedEndpointServices)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v12 = (void *)__sharedEndpointServices;
    __sharedEndpointServices = v11;

    uint64_t v10 = (void *)__sharedEndpointServices;
  }
  uint64_t v13 = [v10 objectForKey:v6];
  if (!v13)
  {
    uint64_t v13 = (char *)objc_opt_new();
    [(id)__sharedEndpointServices setObject:v13 forKey:v6];
  }
  v14 = &v13[8 * v4];
  v16 = (void *)*((void *)v14 + 1);
  v15 = v14 + 8;
  ++*((void *)v15 + 3);
  id v17 = v16;
  if (!v17)
  {
    id v17 = [[_FBSDisplayLayoutService alloc] _initWithEndpoint:v6 qos:v4];
    objc_storeStrong((id *)v15, v17);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__sharedEndpointServicesLock);

  return v17;
}

- (void).cxx_destruct
{
  uint64_t v3 = 24;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

+ (void)_checkoutServiceWithEndpoint:qos:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_checkoutServiceWithEndpoint:qos:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_checkoutServiceWithEndpoint:qos:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_checkinService:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_checkinService:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end