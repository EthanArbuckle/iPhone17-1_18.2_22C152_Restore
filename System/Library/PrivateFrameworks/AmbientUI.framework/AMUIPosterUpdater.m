@interface AMUIPosterUpdater
+ (id)defaultUpdater;
- (AMUIPosterUpdater)init;
- (BOOL)updateInfograph:(id)a3 forPosterConfiguration:(id)a4 completion:(id)a5;
- (void)_clearInflightAndFireNextRequest;
- (void)_lock_fireInfographUpdate:(id)a3;
@end

@implementation AMUIPosterUpdater

+ (id)defaultUpdater
{
  if (defaultUpdater_onceToken != -1) {
    dispatch_once(&defaultUpdater_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)defaultUpdater_defaultUpdater;

  return v2;
}

uint64_t __35__AMUIPosterUpdater_defaultUpdater__block_invoke()
{
  defaultUpdater_defaultUpdater = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (AMUIPosterUpdater)init
{
  v3.receiver = self;
  v3.super_class = (Class)AMUIPosterUpdater;
  result = [(AMUIPosterUpdater *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (BOOL)updateInfograph:(id)a3 forPosterConfiguration:(id)a4 completion:(id)a5
{
  v39[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, id, void))a5;
  id v11 = v8;
  NSClassFromString(&cfstr_Nsdictionary.isa);
  if (!v11)
  {
    v33 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[AMUIPosterUpdater updateInfograph:forPosterConfiguration:completion:]();
    }
    [v33 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2478463F8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v34 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSDictionaryClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[AMUIPosterUpdater updateInfograph:forPosterConfiguration:completion:]();
    }
    [v34 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24784645CLL);
  }

  id v12 = v9;
  NSClassFromString(&cfstr_Prsposterconfi.isa);
  if (!v12)
  {
    v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[AMUIPosterUpdater updateInfograph:forPosterConfiguration:completion:]();
    }
    [v35 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2478464C0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterConfigurationClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[AMUIPosterUpdater updateInfograph:forPosterConfiguration:completion:]();
    }
    [v36 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x247846524);
  }

  if (!v10)
  {
    v37 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completion"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[AMUIPosterUpdater updateInfograph:forPosterConfiguration:completion:]();
    }
    [v37 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x247846588);
  }
  v13 = objc_msgSend(v12, "pr_loadAmbientWidgetLayoutWithError:", 0);
  v14 = [v13 widgetLayoutIconState];
  int v15 = [v14 isEqual:v11];

  if (v15)
  {
    v10[2](v10, v12, 0);
  }
  else
  {
    v16 = [_AMUIPosterUpdate alloc];
    v17 = [MEMORY[0x263F5F378] posterUpdateAmbientWidgets:v11];
    v38 = @"infograph";
    v39[0] = v11;
    v18 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
    v19 = [(_AMUIPosterUpdate *)v16 initWithPosterConfiguration:v12 update:v17 userInfo:v18];

    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_lock_inflightInfographConfigurationUpdate)
    {
      lock_pendingInfographConfigurationUpdate = self->_lock_pendingInfographConfigurationUpdate;
      p_lock_pendingInfographConfigurationUpdate = &self->_lock_pendingInfographConfigurationUpdate;
      if (lock_pendingInfographConfigurationUpdate)
      {
        BOOL v23 = -[_AMUIPosterUpdate isEqual:](v19, "isEqual:");
        v24 = AMUILogInfograph();
        BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
        if (v23)
        {
          if (v25) {
            -[AMUIPosterUpdater updateInfograph:forPosterConfiguration:completion:].cold.6();
          }

          [(_AMUIPosterUpdate *)*p_lock_pendingInfographConfigurationUpdate appendCompletion:v10];
        }
        else
        {
          if (v25) {
            -[AMUIPosterUpdater updateInfograph:forPosterConfiguration:completion:].cold.7();
          }

          v28 = *p_lock_pendingInfographConfigurationUpdate;
          v29 = v19;
          v30 = *p_lock_pendingInfographConfigurationUpdate;
          *p_lock_pendingInfographConfigurationUpdate = v29;
          v31 = v28;

          [(_AMUIPosterUpdate *)v29 adoptCompletionsFromStaleUpdate:v31];
          [(_AMUIPosterUpdate *)v31 cancel];
        }
      }
      else
      {
        v27 = AMUILogInfograph();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[AMUIPosterUpdater updateInfograph:forPosterConfiguration:completion:].cold.5();
        }

        objc_storeStrong((id *)p_lock_pendingInfographConfigurationUpdate, v19);
      }
    }
    else
    {
      [(_AMUIPosterUpdate *)v19 appendCompletion:v10];
      v26 = AMUILogInfograph();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[AMUIPosterUpdater updateInfograph:forPosterConfiguration:completion:].cold.4();
      }

      [(AMUIPosterUpdater *)self _lock_fireInfographUpdate:v19];
    }
    os_unfair_lock_unlock(p_lock);
  }
  return 1;
}

- (void)_clearInflightAndFireNextRequest
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_247837000, v0, v1, "Clear and fire next infograph Update.", v2, v3, v4, v5, v6);
}

- (void)_lock_fireInfographUpdate:(id)a3
{
  id v6 = a3;
  if (self->_lock_inflightInfographConfigurationUpdate)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_lock_inflightInfographConfigurationUpdate == nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[AMUIPosterUpdater _lock_fireInfographUpdate:](a2);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    objc_storeStrong((id *)&self->_lock_inflightInfographConfigurationUpdate, a3);
    v7 = AMUILogInfograph();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AMUIPosterUpdater _lock_fireInfographUpdate:]();
    }

    lock_service = self->_lock_service;
    if (v6)
    {
      if (!lock_service)
      {
        id v9 = (PRSService *)objc_opt_new();
        v10 = self->_lock_service;
        self->_lock_service = v9;
      }
      objc_initWeak(&location, self);
      id v11 = self->_lock_service;
      id v12 = [v6 posterConfiguration];
      v13 = [v6 update];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __47__AMUIPosterUpdater__lock_fireInfographUpdate___block_invoke;
      v15[3] = &unk_265224B38;
      objc_copyWeak(&v17, &location);
      id v16 = v6;
      [(PRSService *)v11 updatePosterConfiguration:v12 update:v13 completion:v15];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      self->_lock_service = 0;
    }
  }
}

void __47__AMUIPosterUpdater__lock_fireInfographUpdate___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = AMUILogInfograph();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v9)
  {
    if (v11) {
      __47__AMUIPosterUpdater__lock_fireInfographUpdate___block_invoke_cold_2((uint64_t)v9, v10);
    }
  }
  else if (v11)
  {
    __47__AMUIPosterUpdater__lock_fireInfographUpdate___block_invoke_cold_1((uint64_t)v7, (uint64_t)v8, v10);
  }

  objc_copyWeak(&v15, (id *)(a1 + 40));
  id v12 = v9;
  id v13 = *(id *)(a1 + 32);
  id v14 = v7;
  BSDispatchMain();

  objc_destroyWeak(&v15);
}

uint64_t __47__AMUIPosterUpdater__lock_fireInfographUpdate___block_invoke_34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _clearInflightAndFireNextRequest];

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);

  return [v3 fireCompletionBlocksWithUpdatedPosterConfiguration:v5 error:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_pendingInfographConfigurationUpdate, 0);
  objc_storeStrong((id *)&self->_lock_inflightInfographConfigurationUpdate, 0);

  objc_storeStrong((id *)&self->_lock_service, 0);
}

- (void)updateInfograph:forPosterConfiguration:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_247837000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updateInfograph:forPosterConfiguration:completion:.cold.2()
{
  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_247837000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updateInfograph:forPosterConfiguration:completion:.cold.3()
{
  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_247837000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updateInfograph:forPosterConfiguration:completion:.cold.4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_247837000, v0, v1, "Infograph Update - Just update", v2, v3, v4, v5, v6);
}

- (void)updateInfograph:forPosterConfiguration:completion:.cold.5()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_247837000, v0, v1, "Infograph Update - Something updating, put in pending", v2, v3, v4, v5, v6);
}

- (void)updateInfograph:forPosterConfiguration:completion:.cold.6()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_247837000, v0, v1, "Infograph Update - same as pending, append completion", v2, v3, v4, v5, v6);
}

- (void)updateInfograph:forPosterConfiguration:completion:.cold.7()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_247837000, v0, v1, "Infograph Update - Squeeze out pending to become pending", v2, v3, v4, v5, v6);
}

- (void)_lock_fireInfographUpdate:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_247837000, v0, v1, "Fire infograph update.", v2, v3, v4, v5, v6);
}

- (void)_lock_fireInfographUpdate:(const char *)a1 .cold.2(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_247837000, &_os_log_internal, v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

void __47__AMUIPosterUpdater__lock_fireInfographUpdate___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_247837000, log, OS_LOG_TYPE_ERROR, "Successfully updated infograph configuration:%@ with update:%@", (uint8_t *)&v3, 0x16u);
}

void __47__AMUIPosterUpdater__lock_fireInfographUpdate___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_247837000, a2, OS_LOG_TYPE_ERROR, "Failed to update infograph configuration with error:%@", (uint8_t *)&v2, 0xCu);
}

@end