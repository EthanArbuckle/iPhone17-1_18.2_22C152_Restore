@interface DNDSAppFocusConfigurationTask
- (DNDSAppFocusConfigurationTask)initWithAction:(id)a3 bundleIdentifier:(id)a4;
- (NSString)bundleIdentifier;
- (NSUUID)taskIdentifier;
- (id)_executorCreatingIfNeeded;
- (id)_malformedIntentErrorWithMessage:(id)a3;
- (void)execute;
- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5;
- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4;
- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4;
- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4;
- (void)executor:(id)a3 needsValueWithRequest:(id)a4;
- (void)prepareWithCompletion:(id)a3;
@end

@implementation DNDSAppFocusConfigurationTask

- (DNDSAppFocusConfigurationTask)initWithAction:(id)a3 bundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DNDSAppFocusConfigurationTask;
  v9 = [(DNDSAppFocusConfigurationTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_action, a3);
    objc_storeStrong((id *)&v10->_bundleIdentifier, a4);
  }

  return v10;
}

- (NSUUID)taskIdentifier
{
  v2 = [(DNDSAppFocusConfigurationTask *)self _executorCreatingIfNeeded];
  v3 = [v2 identifier];

  return (NSUUID *)v3;
}

- (void)prepareWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[a3 copy];
  id completion = self->_completion;
  self->_id completion = v4;

  v6 = (void *)DNDSLogAppFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [(DNDSAppFocusConfigurationTask *)self taskIdentifier];
    v9 = [(LNActionExecutor *)self->_executor connection];
    v10 = [v9 bundleIdentifier];
    v11 = [(LNActionExecutor *)self->_executor action];
    int v12 = 138543874;
    v13 = v8;
    __int16 v14 = 2114;
    v15 = v10;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Task id=%{public}@ Preparing action on %{public}@; action=%{public}@",
      (uint8_t *)&v12,
      0x20u);
  }
}

- (void)execute
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = (void *)DNDSLogAppFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = [(DNDSAppFocusConfigurationTask *)self taskIdentifier];
    v6 = [(LNActionExecutor *)self->_executor connection];
    id v7 = [v6 bundleIdentifier];
    id v8 = [(LNActionExecutor *)self->_executor action];
    int v10 = 138543874;
    v11 = v5;
    __int16 v12 = 2114;
    v13 = v7;
    __int16 v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Task id=%{public}@ Executing prepared action on %{public}@; action=%{public}@",
      (uint8_t *)&v10,
      0x20u);
  }
  v9 = [(DNDSAppFocusConfigurationTask *)self _executorCreatingIfNeeded];
  [v9 perform];
}

- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)DNDSLogAppFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    log = v11;
    uint64_t v18 = [(DNDSAppFocusConfigurationTask *)self taskIdentifier];
    __int16 v12 = [v8 connection];
    v13 = [v12 bundleIdentifier];
    __int16 v14 = [v8 action];
    v15 = [v14 identifier];
    uint64_t v16 = [v10 localizedDescription];
    *(_DWORD *)buf = 138544386;
    v21 = v18;
    __int16 v22 = 2114;
    v23 = v13;
    __int16 v24 = 2114;
    v25 = v15;
    __int16 v26 = 2114;
    id v27 = v9;
    __int16 v28 = 2114;
    v29 = v16;
    _os_log_impl(&dword_1D3052000, log, OS_LOG_TYPE_DEFAULT, "Task id=%{public}@ completed action execution %{public}@:%{public}@; result=%{public}@ error=%{public}@",
      buf,
      0x34u);
  }
  id completion = (void (**)(id, DNDSAppFocusConfigurationTask *, id, id))self->_completion;
  if (completion) {
    completion[2](completion, self, v9, v10);
  }
}

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  id v6 = a4;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_FAULT)) {
    -[DNDSAppFocusConfigurationTask executor:needsConfirmationWithRequest:]();
  }
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"Unexpected callback: %@ request=%@", v8, v6];;
  id v10 = [(DNDSAppFocusConfigurationTask *)self _malformedIntentErrorWithMessage:v9];
  [v6 respondWithError:v10];
}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  id v6 = a4;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_FAULT)) {
    -[DNDSAppFocusConfigurationTask executor:needsConfirmationWithRequest:]();
  }
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"Unexpected callback: %@ request=%@", v8, v6];;
  id v10 = [(DNDSAppFocusConfigurationTask *)self _malformedIntentErrorWithMessage:v9];
  [v6 respondWithError:v10];
}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v6 = a4;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_FAULT)) {
    -[DNDSAppFocusConfigurationTask executor:needsConfirmationWithRequest:]();
  }
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"Unexpected callback: %@ request=%@", v8, v6];;
  id v10 = [(DNDSAppFocusConfigurationTask *)self _malformedIntentErrorWithMessage:v9];
  [v6 respondWithError:v10];
}

- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4
{
  id v6 = a4;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_FAULT)) {
    -[DNDSAppFocusConfigurationTask executor:needsConfirmationWithRequest:]();
  }
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"Unexpected callback: %@ request=%@", v8, v6];;
  id v10 = [(DNDSAppFocusConfigurationTask *)self _malformedIntentErrorWithMessage:v9];
  [v6 respondWithError:v10];
}

- (id)_executorCreatingIfNeeded
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  executor = self->_executor;
  if (executor) {
    goto LABEL_20;
  }
  v4 = _DNDSContainingBundleIdentifier(self->_bundleIdentifier);
  id v5 = objc_alloc_init(MEMORY[0x1E4F72CD8]);
  id v6 = [(LNAction *)self->_action identifier];
  id v29 = 0;
  id v7 = [v5 actionForBundleIdentifier:v4 andActionIdentifier:v6 error:&v29];
  id v8 = v29;

  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  int v10 = !v9;
  if (!v9)
  {
    v11 = [MEMORY[0x1E4F72BC8] policyWithActionMetadata:v7];
    id v28 = 0;
    __int16 v12 = [v11 connectionWithError:&v28];
    id v8 = v28;
    v13 = [(LNAction *)self->_action parameters];
    __int16 v14 = [v11 actionWithParameters:v13];

    v15 = [v14 actionWithOpenWhenRun:0];

    if (v8 || !v12)
    {
      __int16 v22 = (void *)DNDSLogAppFocusConfiguration;
      if (!os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      action = self->_action;
      uint64_t v16 = v22;
      uint64_t v27 = [(LNAction *)action identifier];
      bundleIdentifier = self->_bundleIdentifier;
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v27;
      __int16 v32 = 2114;
      v33 = bundleIdentifier;
      __int16 v34 = 2114;
      id v35 = v8;
      _os_log_error_impl(&dword_1D3052000, v16, OS_LOG_TYPE_ERROR, "Failed to create connection for task with actionIdentifier:%{public}@ applicationIdentifier:%{public}@ error=%{public}@", buf, 0x20u);
      uint64_t v18 = (LNActionExecutor *)v27;
    }
    else
    {
      uint64_t v16 = objc_alloc_init(MEMORY[0x1E4F72AD0]);
      v17 = [v12 executorForAction:v15 options:v16 delegate:self];
      uint64_t v18 = self->_executor;
      self->_executor = v17;
    }

LABEL_16:
    goto LABEL_17;
  }
  v19 = (void *)DNDSLogAppFocusConfiguration;
  if (!os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_ERROR)) {
    goto LABEL_18;
  }
  v20 = self->_action;
  v11 = v19;
  __int16 v12 = [(LNAction *)v20 identifier];
  v21 = self->_bundleIdentifier;
  *(_DWORD *)buf = 138543874;
  uint64_t v31 = (uint64_t)v12;
  __int16 v32 = 2114;
  v33 = v21;
  __int16 v34 = 2114;
  id v35 = v8;
  _os_log_error_impl(&dword_1D3052000, v11, OS_LOG_TYPE_ERROR, "Failed to get action metadata for task with actionIdentifier:%{public}@ applicationIdentifier:%{public}@ error=%{public}@", buf, 0x20u);
LABEL_17:

LABEL_18:
  if (v10)
  {
    executor = self->_executor;
LABEL_20:
    v23 = executor;
    goto LABEL_21;
  }
  v23 = 0;
LABEL_21:
  return v23;
}

- (id)_malformedIntentErrorWithMessage:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F5F528];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v11[0] = a3;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  id v7 = [v5 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = [v3 errorWithDomain:v4 code:1009 userInfo:v7];

  return v8;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_executor, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)executor:needsConfirmationWithRequest:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  v3 = (const char *)OUTLINED_FUNCTION_2_1();
  uint64_t v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1D3052000, v5, v6, "Unexpected callback: %{public}@; request=%{public}@",
    v7,
    v8,
    v9,
    v10,
    v11);
}

@end