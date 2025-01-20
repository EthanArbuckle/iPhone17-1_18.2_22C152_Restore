@interface FBSProcessAssertion
- (BKSProcessAssertion)assertion;
- (BOOL)isActivated;
- (BOOL)isInvalidated;
- (FBSProcess)process;
- (FBSProcessAssertion)initWithName:(id)a3 process:(id)a4 policy:(id)a5;
- (FBSProcessExecutionPolicy)policy;
- (NSString)description;
- (NSString)name;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)activationCount;
- (void)activate;
- (void)deactivate;
- (void)dealloc;
- (void)invalidate;
@end

@implementation FBSProcessAssertion

- (FBSProcessAssertion)initWithName:(id)a3 process:(id)a4 policy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  if (!v11)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSProcessAssertion initWithName:process:policy:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
  }
  v12 = v11;
  if (([v11 conformsToProtocol:&unk_1EED4B9A8] & 1) == 0)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(FBSProcess)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSProcessAssertion initWithName:process:policy:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
  }

  id v13 = v8;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v13)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSProcessAssertion initWithName:process:policy:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSProcessAssertion initWithName:process:policy:]();
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
  }

  id v14 = v10;
  NSClassFromString(&cfstr_Fbsprocessexec_0.isa);
  if (!v14)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSProcessAssertion initWithName:process:policy:]();
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSProcessExecutionPolicyClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSProcessAssertion initWithName:process:policy:]();
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
  }

  v26.receiver = self;
  v26.super_class = (Class)FBSProcessAssertion;
  v15 = [(FBSProcessAssertion *)&v26 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_policy, a5);
    objc_storeWeak((id *)&v16->_process, v12);
    uint64_t v17 = [v13 copy];
    name = v16->_name;
    v16->_name = (NSString *)v17;
  }
  return v16;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (BOOL)isActivated
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_activationCount != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)activate
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  obj = self;
  objc_sync_enter(obj);
  if (obj->_invalidated)
  {
    id v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_invalidated == NO"];
    v15 = MEMORY[0x1E4F14500];
    id v16 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138544642;
      id v40 = v17;
      __int16 v41 = 2114;
      v42 = v19;
      __int16 v43 = 2048;
      v44 = obj;
      __int16 v45 = 2114;
      v46 = @"FBSProcessAssertion.m";
      __int16 v47 = 1024;
      int v48 = 63;
      __int16 v49 = 2114;
      v50 = v14;
      _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
  }
  BOOL v3 = obj->_policy;
  NSClassFromString(&cfstr_Fbsprocessexec_0.isa);
  if (!v3)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    v21 = MEMORY[0x1E4F14500];
    id v22 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v24);
      *(_DWORD *)buf = 138544642;
      id v40 = v23;
      __int16 v41 = 2114;
      v42 = v25;
      __int16 v43 = 2048;
      v44 = obj;
      __int16 v45 = 2114;
      v46 = @"FBSProcessAssertion.m";
      __int16 v47 = 1024;
      int v48 = 64;
      __int16 v49 = 2114;
      v50 = v20;
      _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSProcessExecutionPolicyClass]"];
    v27 = MEMORY[0x1E4F14500];
    id v28 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      *(_DWORD *)buf = 138544642;
      id v40 = v29;
      __int16 v41 = 2114;
      v42 = v31;
      __int16 v43 = 2048;
      v44 = obj;
      __int16 v45 = 2114;
      v46 = @"FBSProcessAssertion.m";
      __int16 v47 = 1024;
      int v48 = 64;
      __int16 v49 = 2114;
      v50 = v26;
      _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
  }

  uint64_t v4 = obj;
  unint64_t activationCount = obj->_activationCount;
  obj->_unint64_t activationCount = activationCount + 1;
  if (!activationCount)
  {
    if (obj->_assertion)
    {
      v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_assertion == nil"];
      v33 = MEMORY[0x1E4F14500];
      id v34 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v35 = (id)objc_claimAutoreleasedReturnValue();
        v36 = (objc_class *)objc_opt_class();
        v37 = NSStringFromClass(v36);
        *(_DWORD *)buf = 138544642;
        id v40 = v35;
        __int16 v41 = 2114;
        v42 = v37;
        __int16 v43 = 2048;
        v44 = obj;
        __int16 v45 = 2114;
        v46 = @"FBSProcessAssertion.m";
        __int16 v47 = 1024;
        int v48 = 68;
        __int16 v49 = 2114;
        v50 = v32;
        _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v32 UTF8String];
      _bs_set_crash_log_message();
    }
    id v6 = objc_alloc(MEMORY[0x1E4F4E280]);
    id WeakRetained = objc_loadWeakRetained((id *)&obj->_process);
    uint64_t v8 = [WeakRetained pid];
    uint8_t v9 = [(FBSProcessExecutionPolicy *)obj->_policy strategy];
    uint64_t v10 = [v9 flags];
    id v11 = [(FBSProcessExecutionPolicy *)obj->_policy strategy];
    uint64_t v12 = [v6 initWithPID:v8 flags:v10 reason:[v11 reason] name:obj->_name withHandler:0];
    assertion = obj->_assertion;
    obj->_assertion = (BKSProcessAssertion *)v12;

    uint64_t v4 = obj;
  }
  objc_sync_exit(v4);
}

- (void)deactivate
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  obj = self;
  objc_sync_enter(obj);
  BOOL v3 = obj;
  if (!obj->_invalidated)
  {
    unint64_t activationCount = obj->_activationCount;
    if (!activationCount)
    {
      uint64_t v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_activationCount > 0"];
      uint64_t v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        id v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        *(_DWORD *)buf = 138544642;
        id v15 = v10;
        uint64_t v12 = v16 = 2114;
        id v17 = v12;
        __int16 v18 = 2048;
        v19 = obj;
        __int16 v20 = 2114;
        v21 = @"FBSProcessAssertion.m";
        __int16 v22 = 1024;
        int v23 = 79;
        __int16 v24 = 2114;
        v25 = v7;
        _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v7 UTF8String];
      _bs_set_crash_log_message();
    }
    unint64_t v5 = activationCount - 1;
    obj->_unint64_t activationCount = v5;
    if (!v5)
    {
      [(BKSProcessAssertion *)obj->_assertion invalidate];
      assertion = obj->_assertion;
      obj->_assertion = 0;

      BOOL v3 = obj;
    }
  }
  objc_sync_exit(v3);
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  obj->_unint64_t activationCount = 0;
  obj->_invalidated = 1;
  objc_storeWeak((id *)&obj->_process, 0);
  [(BKSProcessAssertion *)obj->_assertion invalidate];
  assertion = obj->_assertion;
  obj->_assertion = 0;

  objc_sync_exit(obj);
}

- (NSString)description
{
  return (NSString *)[(FBSProcessAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(FBSProcessAssertion *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  BOOL v3 = [off_1E58F44F0 builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_name withName:@"name"];
  unint64_t activationCount = self->_activationCount;
  if (activationCount > 1) {
    id v7 = [v3 appendUnsignedInteger:];
  }
  else {
    id v6 = (id)[v3 appendBool:activationCount == 1 withName:@"active"];
  }

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(FBSProcessAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(FBSProcessAssertion *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__FBSProcessAssertion_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E58F4AB0;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __61__FBSProcessAssertion_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [*(id *)(*(void *)(a1 + 40) + 24) strategy];
  id v4 = (id)[v2 appendObject:v3 withName:@"strategy"];

  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"bksAssertion" skipIfNil:1];
}

- (FBSProcess)process
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_process);

  return (FBSProcess *)WeakRetained;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (FBSProcessExecutionPolicy)policy
{
  return self->_policy;
}

- (unint64_t)activationCount
{
  return self->_activationCount;
}

- (BKSProcessAssertion)assertion
{
  return self->_assertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_destroyWeak((id *)&self->_process);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithName:process:policy:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithName:process:policy:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithName:process:policy:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end