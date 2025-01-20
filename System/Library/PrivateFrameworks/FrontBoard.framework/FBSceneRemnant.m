@interface FBSceneRemnant
- (BOOL)_hasBeenInvalidated;
- (BSSimpleAssertion)_assertion;
- (FBSSceneClientSettings)_clientSettings;
- (FBSSceneDefinition)definition;
- (FBSSceneSettings)lastSettings;
- (FBSceneRemnant)init;
- (FBWorkspace)_workspace;
- (NSString)description;
- (id)_initWithIdentity:(id)a3 client:(id)a4 workspace:(id)a5 parameters:(id)a6 assertionQueue:(id)a7 assertion:(id)a8;
- (void)dealloc;
- (void)invalidate;
@end

@implementation FBSceneRemnant

- (void)dealloc
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (FBSceneRemnant)init
{
  uint64_t v4 = [NSString stringWithFormat:@"-init is not allowed on FBSceneRemnant"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"FBSceneRemnant.m";
    __int16 v17 = 1024;
    int v18 = 34;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (FBSceneRemnant *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (FBSSceneSettings)lastSettings
{
  return (FBSSceneSettings *)[(FBSSceneParameters *)self->_parameters settings];
}

- (void)invalidate
{
  if ([(BSAtomicSignal *)self->_invalidated signal])
  {
    assertionQueue = self->_assertionQueue;
    if (assertionQueue)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __28__FBSceneRemnant_invalidate__block_invoke;
      block[3] = &unk_1E5C49AE0;
      block[4] = self;
      dispatch_async_and_wait(assertionQueue, block);
    }
    else
    {
      assertion = self->_assertion;
      [(BSSimpleAssertion *)assertion invalidate];
    }
  }
}

uint64_t __28__FBSceneRemnant_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
}

- (id)_initWithIdentity:(id)a3 client:(id)a4 workspace:(id)a5 parameters:(id)a6 assertionQueue:(id)a7 assertion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = v14;
  NSClassFromString(&cfstr_Fbssceneidenti.isa);
  if (!v20)
  {
    v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneRemnant _initWithIdentity:client:workspace:parameters:assertionQueue:assertion:]();
    }
    }
LABEL_36:
    [v35 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6335BA8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneIdentityClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneRemnant _initWithIdentity:client:workspace:parameters:assertionQueue:assertion:]();
    }
    }
    [v36 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6335C0CLL);
  }

  id v21 = v15;
  NSClassFromString(&cfstr_Fbssceneclient.isa);
  if (!v21)
  {
    v37 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneRemnant _initWithIdentity:client:workspace:parameters:assertionQueue:assertion:]();
    }
    }
    [v37 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6335C70);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v38 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneClientIdentityClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneRemnant _initWithIdentity:client:workspace:parameters:assertionQueue:assertion:]();
    }
    }
    [v38 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6335CD4);
  }

  if (!v16)
  {
    v39 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"workspace"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneRemnant _initWithIdentity:client:workspace:parameters:assertionQueue:assertion:]();
    }
    }
    [v39 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6335D38);
  }
  id v22 = v17;
  NSClassFromString(&cfstr_Fbssceneparame.isa);
  if (!v22)
  {
    v40 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneRemnant _initWithIdentity:client:workspace:parameters:assertionQueue:assertion:].cold.4();
    }
    }
    [v40 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6335D9CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v41 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneParametersClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneRemnant _initWithIdentity:client:workspace:parameters:assertionQueue:assertion:].cold.4();
    }
    }
    [v41 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6335E00);
  }

  id v23 = v19;
  if (v23)
  {
    NSClassFromString(&cfstr_Bssimpleassert.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSSimpleAssertionClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBSceneRemnant _initWithIdentity:client:workspace:parameters:assertionQueue:assertion:].cold.5();
      }
      }
      goto LABEL_36;
    }
  }

  v43.receiver = self;
  v43.super_class = (Class)FBSceneRemnant;
  v24 = [(FBSceneRemnant *)&v43 init];
  if (v24)
  {
    id v25 = objc_alloc_init(MEMORY[0x1E4F629B0]);
    [v25 setIdentity:v20];
    [v22 specification];
    id obj = a8;
    v27 = id v26 = v18;
    [v25 setSpecification:v27];

    id v18 = v26;
    [v25 setClientIdentity:v21];
    uint64_t v28 = [v25 copy];
    definition = v24->_definition;
    v24->_definition = (FBSSceneDefinition *)v28;

    objc_storeWeak((id *)&v24->_workspace, v16);
    uint64_t v30 = [v22 copy];
    parameters = v24->_parameters;
    v24->_parameters = (FBSSceneParameters *)v30;

    objc_storeStrong((id *)&v24->_assertionQueue, a7);
    objc_storeStrong((id *)&v24->_assertion, obj);
    uint64_t v32 = objc_opt_new();
    invalidated = v24->_invalidated;
    v24->_invalidated = (BSAtomicSignal *)v32;
  }
  return v24;
}

- (BOOL)_hasBeenInvalidated
{
  return [(BSAtomicSignal *)self->_invalidated hasBeenSignalled];
}

- (FBSSceneClientSettings)_clientSettings
{
  return (FBSSceneClientSettings *)[(FBSSceneParameters *)self->_parameters clientSettings];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(FBSSceneDefinition *)self->_definition identity];
  uint64_t v6 = [(FBSSceneDefinition *)self->_definition clientIdentity];
  [(BSSimpleAssertion *)self->_assertion isValid];
  uint64_t v7 = NSStringFromBOOL();
  uint64_t v8 = [v3 stringWithFormat:@"<%@:%p %@ -> %@ valid=%@>", v4, self, v5, v6, v7];

  return (NSString *)v8;
}

- (FBSSceneDefinition)definition
{
  return self->_definition;
}

- (FBWorkspace)_workspace
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workspace);

  return (FBWorkspace *)WeakRetained;
}

- (BSSimpleAssertion)_assertion
{
  return self->_assertion;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_workspace);
}

- (void)_initWithIdentity:client:workspace:parameters:assertionQueue:assertion:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithIdentity:client:workspace:parameters:assertionQueue:assertion:.cold.2()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithIdentity:client:workspace:parameters:assertionQueue:assertion:.cold.3()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithIdentity:client:workspace:parameters:assertionQueue:assertion:.cold.4()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithIdentity:client:workspace:parameters:assertionQueue:assertion:.cold.5()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end