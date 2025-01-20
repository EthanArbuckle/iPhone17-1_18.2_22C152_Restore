@interface FBSProcessWatchdog
- (FBSProcess)process;
- (FBSProcessWatchdog)initWithName:(id)a3 process:(id)a4 policy:(id)a5;
- (FBSProcessWatchdogPolicy)policy;
- (NSString)description;
- (NSString)name;
- (id)completion;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_beginMonitoringConstraints;
- (void)_stopMonitoringConstraints;
- (void)activate;
- (void)deactivate;
- (void)dealloc;
- (void)invalidate;
- (void)provision:(id)a3 wasViolatedWithError:(id)a4;
- (void)setCompletion:(id)a3;
@end

@implementation FBSProcessWatchdog

- (FBSProcessWatchdogPolicy)policy
{
  return self->_policy;
}

- (void)activate
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0(v2, v3, v4, 5.8382e-34);
  _os_log_debug_impl(&dword_19C680000, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] Activating %{public}@", v5, 0x16u);
}

- (void)_beginMonitoringConstraints
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2->_active)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v3 = [(FBSProcessWatchdogPolicy *)v2->_policy provisions];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v3);
          }
          v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          [v7 prepareForReuse];
          [v7 setDelegate:v2];
          id WeakRetained = objc_loadWeakRetained((id *)&v2->_process);
          [v7 monitorProcess:WeakRetained];
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v4);
    }
  }
  objc_sync_exit(v2);
}

- (void)invalidate
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0(v2, v3, v4, 5.8382e-34);
  _os_log_debug_impl(&dword_19C680000, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] Invalidating %{public}@", v5, 0x16u);
}

- (void)deactivate
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_active)
  {
    [(FBSProcessWatchdog *)obj _stopMonitoringConstraints];
    obj->_active = 0;
  }
  objc_sync_exit(obj);
}

- (void)_stopMonitoringConstraints
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = [(FBSProcessWatchdogPolicy *)v2->_policy provisions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        [v7 setDelegate:0];
        [v7 stopMonitoring];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)dealloc
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_destroyWeak((id *)&self->_process);

  objc_storeStrong((id *)&self->_name, 0);
}

- (FBSProcessWatchdog)initWithName:(id)a3 process:(id)a4 policy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  if (!v11)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSProcessWatchdog initWithName:process:policy:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
  }
  long long v12 = v11;
  if (([v11 conformsToProtocol:&unk_1EED4BB10] & 1) == 0)
  {
    v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(FBSProcessInternal)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSProcessWatchdog initWithName:process:policy:]();
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
  }

  id v13 = v8;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v13)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSProcessWatchdog initWithName:process:policy:]();
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSProcessWatchdog initWithName:process:policy:]();
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
  }

  id v14 = v10;
  NSClassFromString(&cfstr_Fbsprocesswatc_1.isa);
  if (!v14)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSProcessWatchdog initWithName:process:policy:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSProcessWatchdogPolicyClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSProcessWatchdog initWithName:process:policy:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
  }

  v28.receiver = self;
  v28.super_class = (Class)FBSProcessWatchdog;
  v15 = [(FBSProcessWatchdog *)&v28 init];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_process, v12);
    uint64_t v17 = [v13 copy];
    name = v16->_name;
    v16->_name = (NSString *)v17;

    uint64_t v19 = [v14 copy];
    policy = v16->_policy;
    v16->_policy = (FBSProcessWatchdogPolicy *)v19;
  }
  return v16;
}

- (void)setCompletion:(id)a3
{
  id v7 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (v4->_completion != v7)
  {
    uint64_t v5 = [v7 copy];
    id completion = v4->_completion;
    v4->_id completion = (id)v5;
  }
  objc_sync_exit(v4);
}

- (id)completion
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)MEMORY[0x19F3991F0](v2->_completion);
  objc_sync_exit(v2);

  return v3;
}

- (void)provision:(id)a3 wasViolatedWithError:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id WeakRetained = objc_loadWeakRetained((id *)&v8->_process);
  id v10 = [(FBSProcessWatchdog *)v8 completion];
  [(FBSProcessWatchdog *)v8 setCompletion:0];
  if (v8->_active
    && ([(FBSProcessWatchdogPolicy *)v8->_policy provisions],
        id v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 containsObject:v6],
        v11,
        v12))
  {
    [(FBSProcessWatchdog *)v8 deactivate];
    int v13 = 1;
  }
  else
  {
    int v13 = 0;
  }
  objc_sync_exit(v8);

  id v14 = FBLogWatchdog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v25 = FBSProcessPrettyDescription(WeakRetained);
    v26 = [(FBSProcessWatchdog *)v8 succinctDescription];
    v27 = [v6 succinctDescription];
    *(_DWORD *)buf = 138543874;
    v31 = v25;
    __int16 v32 = 2114;
    id v33 = v26;
    __int16 v34 = 2114;
    v35 = v27;
    _os_log_error_impl(&dword_19C680000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Watchdog %{public}@ provision violated: %{public}@", buf, 0x20u);
  }
  if (v13)
  {
    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    [v15 bs_setSafeObject:v6 forKey:@"FBSProcessExecutionProvision"];
    [v15 bs_setSafeObject:@"An execution provision was violated." forKey:*MEMORY[0x1E4F28568]];
    [v15 bs_setSafeObject:v7 forKey:*MEMORY[0x1E4F28A50]];
    v16 = [v7 localizedFailureReason];
    [v15 bs_setSafeObject:v16 forKey:*MEMORY[0x1E4F28588]];

    id v29 = 0;
    int v17 = [WeakRetained _watchdog:v8 shouldTerminateWithDeclineReason:&v29];
    id v28 = v29;
    if (v17)
    {
      v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FBSProcessWatchdogErrorDomain" code:1 userInfo:v15];
      uint64_t v19 = [WeakRetained _watchdog:v8 terminationRequestForViolatedProvision:v6 error:v18];
      v20 = FBLogWatchdog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[FBSProcessWatchdog provision:wasViolatedWithError:](WeakRetained);
      }
    }
    else
    {
      v18 = FBLogWatchdog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v21 = FBSProcessPrettyDescription(WeakRetained);
        *(_DWORD *)buf = 138543618;
        v31 = v21;
        __int16 v32 = 2114;
        id v33 = v28;
        _os_log_impl(&dword_19C680000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Process declined watchdog termination with reason: %{public}@", buf, 0x16u);
      }
      uint64_t v19 = 0;
    }

    if (!v10
      || [v15 bs_setSafeObject:v19 forKey:@"FBSProcessTerminationRequest"],
          [MEMORY[0x1E4F28C58] errorWithDomain:@"FBSProcessWatchdogErrorDomain" code:1 userInfo:v15], v22 = objc_claimAutoreleasedReturnValue(), char v23 = ((uint64_t (**)(void, uint64_t, void *))v10)[2](v10, 1, v22), v22, (v23 & 1) == 0))
    {
      if (v19)
      {
        [WeakRetained _terminateWithRequest:v19 forWatchdog:v8];
      }
      else
      {
        v24 = FBLogCommon();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[FBSProcessWatchdog provision:wasViolatedWithError:](WeakRetained);
        }
      }
    }
  }
}

- (NSString)description
{
  return (NSString *)[(FBSProcessWatchdog *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(FBSProcessWatchdog *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [off_1E58F44F0 builderWithObject:self];
  [v3 appendString:self->_name withName:@"name"];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [(FBSProcessWatchdogPolicy *)self->_policy provisions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    double v8 = 0.0;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = [v11 type];
        memset(v18, 0, sizeof(v18));
        if (v11) {
          [v11 allowance];
        }
        unint64_t Value = FBSProcessResourceAllowanceGetValue((uint64_t)v18);
        double v14 = FBSProcessResourceTimeIntervalForValue(Value);
        if (v12 == 2)
        {
          double v8 = v8 + v14;
        }
        else if (v12 == 1)
        {
          double v9 = v9 + v14;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);

    if (v9 > 0.0) {
      id v15 = (id)[v3 appendTimeInterval:@"time" withName:0 decomposeUnits:v9];
    }
    if (v8 > 0.0) {
      id v16 = (id)[v3 appendTimeInterval:@"cpuTime" withName:0 decomposeUnits:v8];
    }
  }
  else
  {
  }

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(FBSProcessWatchdog *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBSProcessWatchdog *)self succinctDescriptionBuilder];
  id v6 = (id)[v5 appendBool:self->_active withName:@"active"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__FBSProcessWatchdog_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E58F4AB0;
  id v7 = v5;
  id v11 = v7;
  uint64_t v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];

  id v8 = v7;
  return v8;
}

id __60__FBSProcessWatchdog_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"policy"];
}

- (NSString)name
{
  return self->_name;
}

- (FBSProcess)process
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_process);

  return (FBSProcess *)WeakRetained;
}

- (void)initWithName:process:policy:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithName:process:policy:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithName:process:policy:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)provision:(void *)a1 wasViolatedWithError:.cold.1(void *a1)
{
  SEL v1 = FBSProcessPrettyDescription(a1);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_8_0(&dword_19C680000, v2, v3, "Not terminating \"%{public}@\" for violated provision because: \"%{public}@\"", v4, v5, v6, v7, v8);
}

- (void)provision:(void *)a1 wasViolatedWithError:.cold.2(void *a1)
{
  SEL v1 = FBSProcessPrettyDescription(a1);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_8_0(&dword_19C680000, v2, v3, "[%{public}@] Watchdog termination request provided: %{public}@", v4, v5, v6, v7, v8);
}

@end