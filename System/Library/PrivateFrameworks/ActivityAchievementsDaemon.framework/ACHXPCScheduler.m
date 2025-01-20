@interface ACHXPCScheduler
- (ACHXPCScheduler)initWithName:(id)a3 performHandler:(id)a4;
- (NSDate)lastSuccessfulRunDate;
- (NSString)lastSuccessfulRunDateKey;
- (NSString)name;
- (id)performHandler;
- (void)_handleCompletionResult:(BOOL)a3 error:(id)a4 activity:(id)a5;
- (void)_handleXPCActivityCallback:(id)a3;
- (void)_performActivity:(id)a3;
- (void)_registerActivity;
- (void)setLastSuccessfulRunDate:(id)a3;
- (void)synthesizeActivityFireWithCompletion:(id)a3;
@end

@implementation ACHXPCScheduler

- (ACHXPCScheduler)initWithName:(id)a3 performHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ACHXPCScheduler;
  v9 = [(ACHXPCScheduler *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    uint64_t v11 = [NSString stringWithFormat:@"ACHXPCScheduler_%@_lastSuccessfulRunDate", v7];
    lastSuccessfulRunDateKey = v10->_lastSuccessfulRunDateKey;
    v10->_lastSuccessfulRunDateKey = (NSString *)v11;

    uint64_t v13 = [v8 copy];
    id performHandler = v10->_performHandler;
    v10->_id performHandler = (id)v13;

    v10->_lock._os_unfair_lock_opaque = 0;
    [(ACHXPCScheduler *)v10 _registerActivity];
  }

  return v10;
}

- (void)setLastSuccessfulRunDate:(id)a3
{
  v4 = (NSDate *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lastSuccessfulRunDate = self->_lastSuccessfulRunDate;
  self->_lastSuccessfulRunDate = v4;
  id v7 = v4;

  id v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [(NSDate *)self->_lastSuccessfulRunDate timeIntervalSinceReferenceDate];
  double v10 = v9;

  uint64_t v11 = [(ACHXPCScheduler *)self lastSuccessfulRunDateKey];
  [v8 setDouble:v11 forKey:v10];

  os_unfair_lock_unlock(p_lock);
}

- (NSDate)lastSuccessfulRunDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lastSuccessfulRunDate)
  {
    v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v5 = [(ACHXPCScheduler *)self lastSuccessfulRunDateKey];
    [v4 doubleForKey:v5];
    double v7 = v6;

    if (v7 <= 0.0) {
      [MEMORY[0x263EFF910] distantPast];
    }
    else {
    id v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v7];
    }
    lastSuccessfulRunDate = self->_lastSuccessfulRunDate;
    self->_lastSuccessfulRunDate = v8;
  }
  double v10 = self->_lastSuccessfulRunDate;
  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void)_registerActivity
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF8180], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF82A8], 1);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8288]);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x263EF81D8], *MEMORY[0x263EF81E8]);
  objc_initWeak(&location, self);
  id v4 = [(ACHXPCScheduler *)self name];
  v5 = (const char *)[v4 UTF8String];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__ACHXPCScheduler__registerActivity__block_invoke;
  v6[3] = &unk_264516A60;
  objc_copyWeak(&v7, &location);
  xpc_activity_register(v5, v3, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __36__ACHXPCScheduler__registerActivity__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  xpc_object_t v3 = (void *)MEMORY[0x223C50570]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleXPCActivityCallback:v5];
}

- (void)_handleXPCActivityCallback:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = (_xpc_activity_s *)a3;
  xpc_activity_state_t state = xpc_activity_get_state(v4);
  double v6 = ACHLogXPC();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (state)
  {
    if (v7)
    {
      id v8 = [(ACHXPCScheduler *)self name];
      int v10 = 138543362;
      uint64_t v11 = v8;
      _os_log_impl(&dword_21F5DA000, v6, OS_LOG_TYPE_DEFAULT, "XPC activity for %{public}@ requested perform.", (uint8_t *)&v10, 0xCu);
    }
    [(ACHXPCScheduler *)self _performActivity:v4];
  }
  else
  {
    if (v7)
    {
      double v9 = [(ACHXPCScheduler *)self name];
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_21F5DA000, v6, OS_LOG_TYPE_DEFAULT, "XPC activity for %{public}@ checked in.", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_performActivity:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = (_xpc_activity_s *)a3;
  BOOL v5 = xpc_activity_set_state(v4, 4);
  double v6 = ACHLogXPC();
  BOOL v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(ACHXPCScheduler *)self name];
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v8;
      _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Performing activity for %{public}@", buf, 0xCu);
    }
    double v9 = [(ACHXPCScheduler *)self performHandler];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __36__ACHXPCScheduler__performActivity___block_invoke;
    v10[3] = &unk_264516A88;
    v10[4] = self;
    uint64_t v11 = v4;
    ((void (**)(void, void *))v9)[2](v9, v10);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ACHXPCScheduler _performActivity:](self);
    }
  }
}

uint64_t __36__ACHXPCScheduler__performActivity___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleCompletionResult:a2 error:a3 activity:*(void *)(a1 + 40)];
}

- (void)_handleCompletionResult:(BOOL)a3 error:(id)a4 activity:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  double v9 = (_xpc_activity_s *)a5;
  if (v6)
  {
    if ((xpc_activity_set_completion_status() & 1) == 0)
    {
      int v10 = ACHLogXPC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ACHXPCScheduler _handleCompletionResult:error:activity:](self);
      }
    }
    uint64_t v11 = [MEMORY[0x263EFF910] date];
    [(ACHXPCScheduler *)self setLastSuccessfulRunDate:v11];
  }
  else
  {
    uint64_t v12 = ACHLogXPC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ACHXPCScheduler _handleCompletionResult:error:activity:].cold.4(self, (uint64_t)v8, v12);
    }

    if (xpc_activity_should_defer(v9))
    {
      if (xpc_activity_set_state(v9, 3)) {
        goto LABEL_8;
      }
      uint64_t v11 = ACHLogXPC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[ACHXPCScheduler _handleCompletionResult:error:activity:](self);
      }
    }
    else
    {
      if (xpc_activity_set_completion_status()) {
        goto LABEL_8;
      }
      uint64_t v11 = ACHLogXPC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[ACHXPCScheduler _handleCompletionResult:error:activity:](self);
      }
    }
  }

LABEL_8:
}

- (void)synthesizeActivityFireWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ACHXPCScheduler *)self performHandler];
  v5[2](v5, v4);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)lastSuccessfulRunDateKey
{
  return self->_lastSuccessfulRunDateKey;
}

- (id)performHandler
{
  return self->_performHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_performHandler, 0);
  objc_storeStrong((id *)&self->_lastSuccessfulRunDateKey, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lastSuccessfulRunDate, 0);
}

- (void)_performActivity:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21F5DA000, v2, v3, "Failed to continue activity for %{public}@", v4, v5, v6, v7, v8);
}

- (void)_handleCompletionResult:(void *)a1 error:activity:.cold.1(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21F5DA000, v2, v3, "Unable to finish activity for %{public}@", v4, v5, v6, v7, v8);
}

- (void)_handleCompletionResult:(void *)a1 error:activity:.cold.2(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21F5DA000, v2, v3, "Unable to defer activity for %{public}@", v4, v5, v6, v7, v8);
}

- (void)_handleCompletionResult:(void *)a1 error:(uint64_t)a2 activity:(NSObject *)a3 .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 name];
  OUTLINED_FUNCTION_1();
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_21F5DA000, a3, OS_LOG_TYPE_ERROR, "Activity for %{public}@ was not successful and returned error %{public}@", v6, 0x16u);
}

@end