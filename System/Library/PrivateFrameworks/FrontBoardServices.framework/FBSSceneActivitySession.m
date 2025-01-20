@interface FBSSceneActivitySession
- (BOOL)_isValid;
- (BOOL)isInvalidated;
- (BOOL)isOpen;
- (FBSProcessExecutionPolicy)executionPolicy;
- (FBSSceneActivitySession)initWithName:(id)a3 scene:(id)a4 executionPolicy:(id)a5;
- (FBSSceneHandle)scene;
- (NSString)description;
- (NSString)identifier;
- (NSString)name;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)errorHandler;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)close;
- (void)dealloc;
- (void)invalidate;
- (void)open;
- (void)setErrorHandler:(id)a3;
- (void)setExecutionPolicy:(id)a3;
- (void)setName:(id)a3;
- (void)setScene:(id)a3;
@end

@implementation FBSSceneActivitySession

- (FBSSceneActivitySession)initWithName:(id)a3 scene:(id)a4 executionPolicy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v11)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSceneActivitySession initWithName:scene:executionPolicy:]();
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSceneActivitySession initWithName:scene:executionPolicy:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
  }

  id v12 = v9;
  if (!v12)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSceneActivitySession initWithName:scene:executionPolicy:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
  }
  v13 = v12;
  if (([v12 conformsToProtocol:&unk_1EED442B0] & 1) == 0)
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(FBSSceneHandle)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSceneActivitySession initWithName:scene:executionPolicy:]();
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
  }

  id v14 = v10;
  NSClassFromString(&cfstr_Fbsprocessexec_0.isa);
  if (!v14)
  {
    v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSceneActivitySession initWithName:scene:executionPolicy:]();
    }
    [v29 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSProcessExecutionPolicyClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSceneActivitySession initWithName:scene:executionPolicy:]();
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
  }

  v15 = [(FBSSceneActivitySession *)self init];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    name = v15->_name;
    v15->_name = (NSString *)v16;

    v18 = [MEMORY[0x1E4F29128] UUID];
    v19 = [v18 UUIDString];
    uint64_t v20 = [v19 copy];
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v20;

    objc_storeWeak((id *)&v15->_scene, v13);
    uint64_t v22 = [v14 copy];
    executionPolicy = v15->_executionPolicy;
    v15->_executionPolicy = (FBSProcessExecutionPolicy *)v22;
  }
  return v15;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (id)errorHandler
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x19F3991F0](v2->_errorHandler);
  objc_sync_exit(v2);

  return v3;
}

- (void)setErrorHandler:(id)a3
{
  id v7 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (v4->_errorHandler != v7)
  {
    uint64_t v5 = [v7 copy];
    id errorHandler = v4->_errorHandler;
    v4->_id errorHandler = (id)v5;
  }
  objc_sync_exit(v4);
}

- (BOOL)_isValid
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_open && !v2->_invalidated;
  objc_sync_exit(v2);

  return v3;
}

- (void)open
{
  v2 = self;
  objc_sync_enter(v2);
  if (!*(_WORD *)&v2->_open)
  {
    v2->_open = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&v2->_scene);
    uint64_t v4 = [WeakRetained clientProcess];
    int v5 = [v4 pid];
    if (v5 == getpid())
    {
      uint64_t v6 = [WeakRetained hostProcess];

      uint64_t v4 = (void *)v6;
    }
    objc_storeWeak((id *)&v2->_process, v4);
    if (v4)
    {
      if (v2->_executionPolicy)
      {
        id v7 = [[FBSProcessAssertion alloc] initWithName:v2->_name process:v4 policy:v2->_executionPolicy];
        assertion = v2->_assertion;
        v2->_assertion = v7;

        [(FBSProcessAssertion *)v2->_assertion activate];
        uint8_t v9 = [(FBSProcessExecutionPolicy *)v2->_executionPolicy provisions];
        uint64_t v10 = [v9 count];

        if (v10)
        {
          id v11 = [WeakRetained callOutQueue];
          objc_initWeak(&location, v2);
          id v12 = [(FBSProcessExecutionPolicy *)v2->_executionPolicy provisions];
          v13 = +[FBSProcessWatchdogPolicy policyWithProvisions:v12];

          id v14 = [[FBSProcessWatchdog alloc] initWithName:v2->_name process:v4 policy:v13];
          watchdog = v2->_watchdog;
          v2->_watchdog = v14;

          uint64_t v16 = v2->_watchdog;
          uint64_t v18 = MEMORY[0x1E4F143A8];
          uint64_t v19 = 3221225472;
          uint64_t v20 = __31__FBSSceneActivitySession_open__block_invoke;
          v21 = &unk_1E58F5DA8;
          objc_copyWeak(&v24, &location);
          id v17 = v11;
          id v22 = v17;
          id v23 = WeakRetained;
          [(FBSProcessWatchdog *)v16 setCompletion:&v18];
          [(FBSProcessWatchdog *)v2->_watchdog activate];

          objc_destroyWeak(&v24);
          objc_destroyWeak(&location);
        }
      }
    }
  }
  objc_sync_exit(v2);
}

BOOL __31__FBSSceneActivitySession_open__block_invoke(uint64_t a1, BOOL a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = WeakRetained;
  if (a2)
  {
    if ([WeakRetained _isValid])
    {
      uint64_t v8 = [v7 errorHandler];
      uint8_t v9 = (void (**)(void, void))MEMORY[0x19F3991F0]();
    }
    else
    {
      uint8_t v9 = 0;
    }
    a2 = v9 != 0;
    if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
      [v10 setObject:@"An execution provision was violated during the session." forKey:*MEMORY[0x1E4F28568]];
      id v11 = [v5 localizedFailureReason];
      [v10 bs_setSafeObject:v11 forKey:*MEMORY[0x1E4F28588]];

      [v10 bs_setSafeObject:v5 forKey:*MEMORY[0x1E4F28A50]];
      [v10 bs_setSafeObject:v7 forKey:@"FBSSceneActivitySession"];
      id v12 = [v5 userInfo];
      v13 = [v12 objectForKey:@"FBSProcessExecutionProvision"];
      [v10 bs_setSafeObject:v13 forKey:@"FBSProcessExecutionProvision"];

      id v14 = [v5 userInfo];
      v15 = [v14 objectForKey:@"FBSProcessTerminationRequest"];
      [v10 bs_setSafeObject:v15 forKey:@"FBSProcessTerminationRequest"];

      uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FBSSceneActivitySessionErrorDomain" code:2 userInfo:v10];
      ((void (**)(void, void *))v9)[2](v9, v16);
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __31__FBSSceneActivitySession_open__block_invoke_2;
    v19[3] = &unk_1E58F4AB0;
    id v17 = *(void **)(a1 + 32);
    id v20 = *(id *)(a1 + 40);
    id v21 = v7;
    [v17 performAsync:v19];
  }
  return a2;
}

uint64_t __31__FBSSceneActivitySession_open__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeSession:*(void *)(a1 + 40)];
}

- (void)close
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_open)
  {
    obj->_open = 0;
    objc_storeWeak((id *)&obj->_process, 0);
    [(FBSProcessWatchdog *)obj->_watchdog deactivate];
    [(FBSProcessWatchdog *)obj->_watchdog invalidate];
    watchdog = obj->_watchdog;
    obj->_watchdog = 0;

    [(FBSProcessAssertion *)obj->_assertion deactivate];
    [(FBSProcessAssertion *)obj->_assertion invalidate];
    assertion = obj->_assertion;
    obj->_assertion = 0;

    id errorHandler = obj->_errorHandler;
    obj->_id errorHandler = 0;
  }
  objc_sync_exit(obj);
}

- (void)invalidate
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_invalidated)
  {
    v2->_invalidated = 1;
    if (v2->_open)
    {
      BOOL v3 = [(FBSSceneActivitySession *)v2 errorHandler];
      if (v3)
      {
        uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
        [v4 bs_setSafeObject:@"The session was unexpectedly interrupted." forKey:*MEMORY[0x1E4F28568]];
        [v4 bs_setSafeObject:v2 forKey:@"FBSSceneActivitySession"];
        id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FBSSceneActivitySessionErrorDomain" code:1 userInfo:v4];
        uint64_t v6 = dispatch_get_global_queue(33, 0);
        uint64_t v8 = MEMORY[0x1E4F143A8];
        uint64_t v9 = 3221225472;
        uint64_t v10 = __37__FBSSceneActivitySession_invalidate__block_invoke;
        id v11 = &unk_1E58F5450;
        id v12 = v5;
        id v13 = v3;
        id v7 = v5;
        dispatch_async(v6, &v8);
      }
      [(FBSSceneActivitySession *)v2 close];
    }
  }
  objc_sync_exit(v2);
}

uint64_t __37__FBSSceneActivitySession_invalidate__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (NSString)description
{
  return (NSString *)[(FBSSceneActivitySession *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(FBSSceneActivitySession *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  BOOL v3 = [off_1E58F44F0 builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_name withName:@"name"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  uint64_t v6 = [WeakRetained identifier];
  id v7 = (id)[v3 appendObject:v6 withName:@"sceneID"];

  id v8 = (id)[v3 appendBool:self->_open withName:@"open"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(FBSSceneActivitySession *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSceneActivitySession *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__FBSSceneActivitySession_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E58F4AB0;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __65__FBSSceneActivitySession_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"identifier"];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 56));
  if (WeakRetained)
  {
    BOOL v3 = *(void **)(a1 + 32);
    id v4 = [off_1E58F44F0 succinctDescriptionForObject:WeakRetained];
    id v5 = (id)[v3 appendObject:v4 withName:@"process"];
  }
  id v6 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"executionPolicy"];
  uint64_t v7 = *(void *)(a1 + 40);
  if (*(void *)(v7 + 64))
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = [off_1E58F44F0 succinctDescriptionForObject];
    id v10 = (id)[v8 appendObject:v9 withName:@"assertion"];

    uint64_t v7 = *(void *)(a1 + 40);
  }
  id v11 = WeakRetained;
  if (*(void *)(v7 + 72))
  {
    id v12 = *(void **)(a1 + 32);
    id v13 = [off_1E58F44F0 succinctDescriptionForObject:];
    id v14 = (id)[v12 appendObject:v13 withName:@"watchdog"];

    id v11 = WeakRetained;
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (FBSSceneHandle)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (FBSSceneHandle *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (FBSProcessExecutionPolicy)executionPolicy
{
  return self->_executionPolicy;
}

- (void)setExecutionPolicy:(id)a3
{
}

- (BOOL)isOpen
{
  return self->_open;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_destroyWeak((id *)&self->_process);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_executionPolicy, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithName:scene:executionPolicy:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithName:scene:executionPolicy:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithName:scene:executionPolicy:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end