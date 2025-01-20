@interface LNActionExecutor
- (BOOL)extendsTimeoutOnProgressUpdates;
- (BOOL)validateEntitlementsForConnection:(id)a3;
- (BOOL)validateURLSchemeBeforeLaunching;
- (LNAction)action;
- (LNActionExecutor)initWithAction:(id)a3 connection:(id)a4 options:(id)a5;
- (LNActionExecutorDelegate)delegate;
- (LNActionExecutorOptions)options;
- (LNActionExecutorPassthroughDelegate)showOutputActionPassthroughDelegate;
- (LNActionMetadata)_showOutputActionMetadata;
- (LNConnection)connection;
- (LNProgressPropertySynchronizer)progressPropertySynchronizer;
- (NSProgress)executionProgress;
- (NSProgress)progress;
- (NSString)appBundleIdentifier;
- (NSUUID)identifier;
- (OS_os_activity)activity;
- (id)progressSubscriber;
- (int64_t)state;
- (os_unfair_lock_s)progressSubscriptionLock;
- (void)_logTransitionFromState:(int64_t)a3 toState:(int64_t)a4;
- (void)dealloc;
- (void)donateActionIfNecessary:(id)a3 result:(id)a4 completionHandler:(id)a5;
- (void)getConnectionInterfaceWithOptions:(id)a3 completionHandler:(id)a4;
- (void)getPrimaryConnectionInterfaceWithOptions:(id)a3 completionHandler:(id)a4;
- (void)getXPCListenerConnectionInterfaceWithOptions:(id)a3 completionHandler:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)openActionURL:(id)a3 completionHandler:(id)a4;
- (void)perform;
- (void)performOneShotWithConnectionOptions:(id)a3;
- (void)requestActionConfirmation:(id)a3 completionHandler:(id)a4;
- (void)requestAppProtectionUnlockWithCompletionHandler:(id)a3;
- (void)requestCancelTimeout;
- (void)requestContinueInApp:(id)a3 completionHandler:(id)a4;
- (void)requestExtendTimeout;
- (void)requestOpenURL:(id)a3 completionHandler:(id)a4;
- (void)requestParameterConfirmation:(id)a3 completionHandler:(id)a4;
- (void)requestParameterDisambiguation:(id)a3 completionHandler:(id)a4;
- (void)requestParameterNeedsValue:(id)a3 completionHandler:(id)a4;
- (void)requestViewSnippetEnvironmentWithCompletion:(id)a3;
- (void)requestViewSnippetSizeWithCompletion:(id)a3;
- (void)runShowOutputActionIfNecessary:(id)a3 completionHandler:(id)a4;
- (void)setCompletedWithError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExecutionProgress:(id)a3;
- (void)setProgressPropertySynchronizer:(id)a3;
- (void)setProgressSubscriber:(id)a3;
- (void)setShowOutputActionPassthroughDelegate:(id)a3;
- (void)setState:(int64_t)a3;
- (void)set_showOutputActionMetadata:(id)a3;
- (void)unsubscribeProgressObservation;
@end

@implementation LNActionExecutor

- (void)performOneShotWithConnectionOptions:(id)a3
{
  id v4 = a3;
  v5 = getLNLogCategoryExecution();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4419000, v5, OS_LOG_TYPE_INFO, "Requested to perform action in a single shot", buf, 2u);
  }

  v6 = [(LNActionExecutor *)self action];
  id v7 = v4;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;

  [v9 setOneShotActionForSpringBoardOnly:v6];
  v10 = [(LNActionExecutor *)self options];
  id v11 = v7;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  id v13 = v12;

  [v13 setOneShotActionExecutorOptionsForSpringBoardOnly:v10];
  v14 = [(LNActionExecutor *)self connection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__LNActionExecutor_OneShot__performOneShotWithConnectionOptions___block_invoke;
  v15[3] = &unk_1E5B389F0;
  v15[4] = self;
  [v14 getConnectionInterfaceWithOptions:v11 completionHandler:v15];
}

void __65__LNActionExecutor_OneShot__performOneShotWithConnectionOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v7 = [*(id *)(a1 + 32) activity];
  os_activity_scope_enter(v7, &state);

  if (v5)
  {
    v8 = [LNActionOutput alloc];
    id v9 = [MEMORY[0x1E4F29128] UUID];
    LOBYTE(v24) = 0;
    LOBYTE(v23) = 0;
    v10 = -[LNActionOutput initWithIdentifier:dialog:viewSnippet:attribution:value:showOutputAction:showOutputActionHint:showOutputActionOptions:deferred:nextAction:suggestedFollowUpActions:activityIdentifier:confirmationActionName:showPrompt:confirmationConditions:undoContext:](v8, "initWithIdentifier:dialog:viewSnippet:attribution:value:showOutputAction:showOutputActionHint:showOutputActionOptions:deferred:nextAction:suggestedFollowUpActions:activityIdentifier:confirmationActionName:showPrompt:confirmationConditions:undoContext:", v9, 0, 0, 0, 0, 0, 0, 0, v23, 0, 0, 0, 0, v24, 0,
            0);

    id v11 = [LNSuccessResult alloc];
    v12 = [*(id *)(a1 + 32) action];
    id v13 = [(LNSuccessResult *)v11 initWithAction:v12 output:v10 actionAppContext:0 predictions:MEMORY[0x1E4F1CBF0]];

    v14 = [*(id *)(a1 + 32) delegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      v16 = [*(id *)(a1 + 32) delegate];
      [v16 executor:*(void *)(a1 + 32) didPerformActionWithResult:v13 error:v6];
    }
    v17 = [*(id *)(a1 + 32) delegate];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      v19 = [*(id *)(a1 + 32) delegate];
      [v19 executor:*(void *)(a1 + 32) didFinishWithResult:v13 error:v6];
    }
    v20 = [*(id *)(a1 + 32) delegate];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      v22 = [*(id *)(a1 + 32) delegate];
      [v22 executor:*(void *)(a1 + 32) didCompleteExecutionWithResult:v13 error:v6];
    }
    [*(id *)(a1 + 32) setState:10];
  }
  else
  {
    [*(id *)(a1 + 32) setCompletedWithError:v6];
  }
  os_activity_scope_leave(&state);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_progressPropertySynchronizer, 0);
  objc_storeStrong((id *)&self->_executionProgress, 0);
  objc_storeStrong(&self->_progressSubscriber, 0);
  objc_storeStrong((id *)&self->_showOutputActionPassthroughDelegate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_showOutputActionMetadata, 0);
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (BOOL)extendsTimeoutOnProgressUpdates
{
  return self->_extendsTimeoutOnProgressUpdates;
}

- (void)setProgressPropertySynchronizer:(id)a3
{
}

- (LNProgressPropertySynchronizer)progressPropertySynchronizer
{
  return self->_progressPropertySynchronizer;
}

- (void)setExecutionProgress:(id)a3
{
}

- (NSProgress)executionProgress
{
  return self->_executionProgress;
}

- (void)setProgressSubscriber:(id)a3
{
}

- (id)progressSubscriber
{
  return self->_progressSubscriber;
}

- (os_unfair_lock_s)progressSubscriptionLock
{
  return self->_progressSubscriptionLock;
}

- (void)setShowOutputActionPassthroughDelegate:(id)a3
{
}

- (LNActionExecutorPassthroughDelegate)showOutputActionPassthroughDelegate
{
  return self->_showOutputActionPassthroughDelegate;
}

- (void)setDelegate:(id)a3
{
}

- (LNActionExecutorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (LNActionExecutorDelegate *)WeakRetained;
}

- (LNAction)action
{
  return self->_action;
}

- (LNActionExecutorOptions)options
{
  return self->_options;
}

- (LNConnection)connection
{
  return self->_connection;
}

- (int64_t)state
{
  return self->_state;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 24, 1);
}

- (void)set_showOutputActionMetadata:(id)a3
{
}

- (LNActionMetadata)_showOutputActionMetadata
{
  return self->_showOutputActionMetadata;
}

- (BOOL)validateEntitlementsForConnection:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28F80] processInfo];
  id v6 = v5;
  if (v5) {
    objc_msgSend(v5, "if_auditToken");
  }
  else {
    memset(v38, 0, sizeof(v38));
  }
  id v7 = +[LNEntitlementsValidator valueForEntitlement:@"com.apple.private.appintents.exception.restricted-allowed" auditToken:v38];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v31 = v8;

  id v9 = [v4 xpcConnection];
  v10 = v9;
  if (v9) {
    [v9 auditToken];
  }
  else {
    memset(v37, 0, sizeof(v37));
  }
  id v11 = +[LNEntitlementsValidator valueForEntitlement:@"com.apple.private.appintents.restricted" auditToken:v37];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  id v13 = v12;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [v13 allKeys];
  uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    id v30 = v4;
    uint64_t v16 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        v19 = [v13 objectForKeyedSubscript:v18];
        if (v19)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v20 = v19;
          }
          else {
            v20 = 0;
          }
        }
        else
        {
          v20 = 0;
        }
        id v21 = v20;

        v22 = [v21 objectForKeyedSubscript:@"appintents"];
        if (v22)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v23 = v22;
          }
          else {
            uint64_t v23 = 0;
          }
        }
        else
        {
          uint64_t v23 = 0;
        }
        id v24 = v23;

        v25 = [(LNActionExecutor *)self action];
        v26 = [v25 identifier];
        if ([v24 containsObject:v26])
        {
          char v27 = [v31 containsObject:v18];

          if ((v27 & 1) == 0)
          {

            BOOL v28 = 0;
            goto LABEL_39;
          }
        }
        else
        {
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v15);
    BOOL v28 = 1;
LABEL_39:
    id v4 = v30;
  }
  else
  {
    BOOL v28 = 1;
  }

  return v28;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  id v11 = v10;
  if ((void *)LNActionExecutorRemoteProgressCompletedContext == a6)
  {
    [v10 fractionCompleted];
    uint64_t v13 = (uint64_t)(v12 * 100000.0);
    uint64_t v14 = [(LNActionExecutor *)self progress];
    [v14 setCompletedUnitCount:v13];

    if ([(LNActionExecutor *)self extendsTimeoutOnProgressUpdates]) {
      [(LNActionExecutor *)self requestExtendTimeout];
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)LNActionExecutor;
    [(LNActionExecutor *)&v15 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
}

- (void)unsubscribeProgressObservation
{
  p_progressSubscriptionLock = &self->_progressSubscriptionLock;
  os_unfair_lock_lock(&self->_progressSubscriptionLock);
  id v4 = [(LNActionExecutor *)self executionProgress];

  if (v4)
  {
    id v5 = [(LNActionExecutor *)self executionProgress];
    [v5 removeObserver:self forKeyPath:@"fractionCompleted" context:LNActionExecutorRemoteProgressCompletedContext];

    id v6 = [(LNActionExecutor *)self progressPropertySynchronizer];
    [v6 stopSynchronization];

    [(LNActionExecutor *)self setProgressPropertySynchronizer:0];
    [(LNActionExecutor *)self setExecutionProgress:0];
  }
  os_unfair_lock_unlock(p_progressSubscriptionLock);
  id v7 = [(LNActionExecutor *)self progressSubscriber];

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E4F28F90];
    id v9 = [(LNActionExecutor *)self progressSubscriber];
    [v8 removeSubscriber:v9];

    [(LNActionExecutor *)self setProgressSubscriber:0];
  }
}

- (BOOL)validateURLSchemeBeforeLaunching
{
  v2 = [(LNActionExecutor *)self connection];
  v3 = [v2 bundleIdentifier];
  char v4 = [v3 hasPrefix:@"com.apple."] ^ 1;

  return v4;
}

- (void)requestExtendTimeout
{
  id v4 = [(LNActionExecutor *)self connection];
  v3 = [(LNActionExecutor *)self identifier];
  [v4 extendTimeoutForOperationWithIdentifier:v3];
}

- (void)requestCancelTimeout
{
  id v4 = [(LNActionExecutor *)self connection];
  v3 = [(LNActionExecutor *)self identifier];
  [v4 cancelTimeoutForOperationWithIdentifier:v3];
}

- (void)requestOpenURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [v6 setCompletionHandler:a4];
  id v7 = getLNLogCategoryExecution();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = [v6 url];
    *(_DWORD *)buf = 138412290;
    v17 = v8;
  }
  id v9 = [LNURLLaunchRequest alloc];
  id v10 = [v6 url];
  id v11 = [(LNURLLaunchRequest *)v9 initWithURL:v10];

  BOOL v12 = [(LNActionExecutor *)self validateURLSchemeBeforeLaunching];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__LNActionExecutor_requestOpenURL_completionHandler___block_invoke;
  v14[3] = &unk_1E5B39828;
  id v15 = v6;
  id v13 = v6;
  [(LNURLLaunchRequest *)v11 performValidatingURLScheme:v12 completionHandler:v14];
}

uint64_t __53__LNActionExecutor_requestOpenURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 respondWithError:a2];
  }
  else {
    return [v2 respondWithSuccess];
  }
}

- (void)requestContinueInApp:(id)a3 completionHandler:(id)a4
{
  v66[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  v8 = [v6 bundleIdentifier];

  if (v8)
  {
    id v9 = [(LNActionExecutor *)self connection];
    id v10 = [v9 xpcConnection];
    id v11 = v10;
    if (v10) {
      [v10 auditToken];
    }
    else {
      memset(v56, 0, sizeof(v56));
    }
    BOOL v16 = +[LNEntitlementsValidator validateEntitlement:@"com.apple.private.appintents.exception.continue-in-any-app-allowed" auditToken:v56 validator:&__block_literal_global_159];

    if (!v16)
    {
      v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v65 = *MEMORY[0x1E4F28568];
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:&v65 count:1];
      v20 = [v19 errorWithDomain:@"LNActionExecutorErrorDomain" code:2018 userInfo:v17];
      v7[2](v7, 0, v20);
      goto LABEL_41;
    }
    id v17 = [v6 bundleIdentifier];
    char v18 = [v6 options] & 1;
  }
  else
  {
    BOOL v12 = [(LNActionExecutor *)self connection];
    id v13 = [v12 xpcConnection];
    uint64_t v14 = [v13 userInfo];

    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v15 = v14;
      }
      else {
        id v15 = 0;
      }
    }
    else
    {
      id v15 = 0;
    }
    id v21 = v15;

    id v17 = [v21 objectForKeyedSubscript:@"bundleIdentifier"];

    char v18 = 0;
  }
  uint64_t v22 = [objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v17 allowPlaceholder:0 error:0];
  if (v22)
  {
    v20 = (void *)v22;
    [v6 setCompletionHandler:v7];
    uint64_t v23 = [(LNActionExecutor *)self connection];
    int v24 = [v23 isDaemon];

    if (!v24)
    {
      BOOL v32 = +[LNUnlockService isDeviceLocked];
      long long v33 = getLNLogCategoryExecution();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v49 = [(LNActionExecutor *)self options];
        unsigned int v34 = [v49 source];
        if (v34 > 0xA) {
          long long v35 = @"Application";
        }
        else {
          long long v35 = off_1E5B38738[v34];
        }
        long long v36 = v35;
        if (v32) {
          v37 = @"locked";
        }
        else {
          v37 = @"unlocked";
        }
        uint64_t v38 = [v6 type];
        v39 = @"UserInitiated";
        if (v38 == 1) {
          v39 = @"ForegroundLaunch";
        }
        if (v38 == 2) {
          v39 = @"ForegroundLaunchWithRunningUI";
        }
        uint64_t v40 = v39;
        *(_DWORD *)buf = 138543874;
        v58 = v36;
        __int16 v59 = 2114;
        v60 = v37;
        __int16 v61 = 2114;
        v62 = v40;
        _os_log_impl(&dword_1A4419000, v33, OS_LOG_TYPE_INFO, "Source: %{public}@, device is %{public}@, request type: %{public}@", buf, 0x20u);
      }
      v41 = [v6 sceneOptions];
      v42 = [v6 completionHandler];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __59__LNActionExecutor_requestContinueInApp_completionHandler___block_invoke_177;
      v50[3] = &unk_1E5B39A48;
      v50[4] = self;
      id v29 = v41;
      id v51 = v29;
      id v17 = v17;
      id v52 = v17;
      char v55 = v18;
      v53 = v7;
      id v43 = v42;
      id v54 = v43;
      [v6 setCompletionHandler:v50];
      if ([v6 requestConfirmation])
      {
        v44 = [(LNActionExecutor *)self connection];
        uint64_t v45 = [(LNActionExecutor *)self identifier];
        [v44 cancelTimeoutForOperationWithIdentifier:v45];

        v46 = [(LNActionExecutor *)self delegate];
        LOBYTE(v45) = objc_opt_respondsToSelector();

        if (v45)
        {
          v47 = [(LNActionExecutor *)self delegate];
          [v47 executor:self needsContinueInAppWithRequest:v6];
        }
        else
        {
          v48 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
          [v6 respondWithError:v48];
        }
      }
      else
      {
        [v6 respondWithSuccess];
      }

      goto LABEL_40;
    }
    v25 = getLNLogCategoryExecution();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v26 = [(LNActionExecutor *)self connection];
      char v27 = [v26 bundleIdentifier];
      *(_DWORD *)buf = 138543362;
      v58 = v27;
    }
    if ([v6 requestConfirmation])
    {
      BOOL v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v63 = *MEMORY[0x1E4F28568];
      id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
      id v30 = [v28 errorWithDomain:@"LNActionExecutorErrorDomain" code:2018 userInfo:v29];
      v7[2](v7, 0, v30);

LABEL_40:
      goto LABEL_41;
    }
    [v6 respondWithSuccess];
  }
  else
  {
    id v31 = [MEMORY[0x1E4F28C58] errorWithDomain:@"LNActionExecutorErrorDomain" code:2018 userInfo:0];
    v7[2](v7, 0, v31);

    v20 = 0;
  }
LABEL_41:
}

void __59__LNActionExecutor_requestContinueInApp_completionHandler___block_invoke_177(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_opt_new();
    id v5 = [*(id *)(a1 + 32) options];
    int v6 = [v5 source];

    if (v6 == 6) {
      [v4 setValue:*MEMORY[0x1E4FA7078] forKey:*MEMORY[0x1E4F62658]];
    }
    id v7 = [*(id *)(a1 + 32) options];
    int v8 = [v7 source];

    if (v8 == 7) {
      [v4 setValue:*MEMORY[0x1E4FA7090] forKey:*MEMORY[0x1E4F62658]];
    }
    id v9 = [*(id *)(a1 + 32) delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [*(id *)(a1 + 32) delegate];
      int v12 = [v11 progressIsPersistentInSystemApertureForExecutor:*(void *)(a1 + 32)];

      if (v12) {
        [v4 setValue:*MEMORY[0x1E4FA7098] forKey:*MEMORY[0x1E4F62658]];
      }
    }
    id v13 = [*(id *)(a1 + 32) delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      id v15 = [*(id *)(a1 + 32) delegate];
      [v15 executorWillLaunchApplicationInForeground:*(void *)(a1 + 32)];
    }
    BOOL v16 = *(void **)(a1 + 40);
    if (v16)
    {
      id v17 = [*(id *)(a1 + 32) options];
      char v18 = [v16 fbsOpenApplicationOptionsWithActionExecutorOptions:v17];

      [v4 addEntriesFromDictionary:v18];
    }
    v19 = getLNLogCategoryExecution();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v4;
      _os_log_impl(&dword_1A4419000, v19, OS_LOG_TYPE_INFO, "INCAppLaunchRequest with options %@", buf, 0xCu);
    }

    id v20 = objc_alloc(MEMORY[0x1E4F70BE0]);
    uint64_t v21 = *(void *)(a1 + 48);
    uint64_t v22 = (void *)[v4 copy];
    uint64_t v23 = (void *)[v20 initWithBundleIdentifier:v21 options:v22 URL:0 userActivity:0 retainsSiri:*(unsigned char *)(a1 + 72) == 0];

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __59__LNActionExecutor_requestContinueInApp_completionHandler___block_invoke_184;
    v24[3] = &unk_1E5B39A20;
    v24[4] = *(void *)(a1 + 32);
    id v26 = *(id *)(a1 + 56);
    id v27 = *(id *)(a1 + 64);
    id v25 = v3;
    [v23 performWithCompletionHandler:v24];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __59__LNActionExecutor_requestContinueInApp_completionHandler___block_invoke_184(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  int v6 = [*(id *)(a1 + 32) connection];
  id v7 = [*(id *)(a1 + 32) identifier];
  [v6 extendTimeoutForOperationWithIdentifier:v7];

  if (a2)
  {
    int v8 = getLNLogCategoryExecution();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v10 = 0;
      _os_log_impl(&dword_1A4419000, v8, OS_LOG_TYPE_INFO, "App Launch request succeeded", v10, 2u);
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v9();
}

uint64_t __59__LNActionExecutor_requestContinueInApp_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = [v4 BOOLValue];

  return v5;
}

- (void)requestViewSnippetSizeWithCompletion:(id)a3
{
  id v7 = (void (**)(id, void))a3;
  id v4 = [(LNActionExecutor *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    int v6 = [(LNActionExecutor *)self delegate];
    [v6 executor:self preferredContentSizeForViewSnippetWithCompletion:v7];
  }
  else
  {
    v7[2](v7, 0);
  }
}

- (void)requestViewSnippetEnvironmentWithCompletion:(id)a3
{
  id v7 = (void (**)(id, void))a3;
  id v4 = [(LNActionExecutor *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    int v6 = [(LNActionExecutor *)self delegate];
    [v6 executor:self environmentForViewSnippetWithCompletion:v7];
  }
  else
  {
    v7[2](v7, 0);
  }
}

- (void)requestAppProtectionUnlockWithCompletionHandler:(id)a3
{
  id v4 = a3;
  char v5 = [(LNActionExecutor *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    int64_t v7 = [(LNActionExecutor *)self state];
    [(LNActionExecutor *)self setState:2];
    int v8 = [(LNActionExecutor *)self connection];
    id v9 = [(LNActionExecutor *)self identifier];
    [v8 cancelTimeoutForOperationWithIdentifier:v9];

    char v10 = [(LNActionExecutor *)self delegate];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__LNActionExecutor_requestAppProtectionUnlockWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E5B399F8;
    v11[4] = self;
    int64_t v13 = v7;
    id v12 = v4;
    [v10 executor:self needsAppProtectionUnlockWithCompletionHandler:v11];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

uint64_t __68__LNActionExecutor_requestAppProtectionUnlockWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:*(void *)(a1 + 48)];
  id v2 = [*(id *)(a1 + 32) connection];
  id v3 = [*(id *)(a1 + 32) identifier];
  [v2 extendTimeoutForOperationWithIdentifier:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)requestActionConfirmation:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  [v6 setCompletionHandler:a4];
  int64_t v7 = [(LNActionExecutor *)self state];
  [(LNActionExecutor *)self setState:8];
  int v8 = [v6 completionHandler];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__LNActionExecutor_requestActionConfirmation_completionHandler___block_invoke;
  v15[3] = &unk_1E5B399D0;
  v15[4] = self;
  int64_t v17 = v7;
  id v9 = v8;
  id v16 = v9;
  [v6 setCompletionHandler:v15];
  char v10 = [(LNActionExecutor *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(LNActionExecutor *)self connection];
    int64_t v13 = [(LNActionExecutor *)self identifier];
    [v12 cancelTimeoutForOperationWithIdentifier:v13];

    char v14 = [(LNActionExecutor *)self delegate];
    [v14 executor:self needsActionConfirmationWithRequest:v6];
  }
  else
  {
    [v6 respondWithConfirmation:1];
  }
}

void __64__LNActionExecutor_requestActionConfirmation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  char v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = a3;
  id v10 = a2;
  [v5 setState:v6];
  int v8 = [*(id *)(a1 + 32) connection];
  id v9 = [*(id *)(a1 + 32) identifier];
  [v8 extendTimeoutForOperationWithIdentifier:v9];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)requestParameterNeedsValue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  [v6 setCompletionHandler:a4];
  int64_t v7 = [(LNActionExecutor *)self state];
  [(LNActionExecutor *)self setState:6];
  int v8 = [v6 completionHandler];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__LNActionExecutor_requestParameterNeedsValue_completionHandler___block_invoke;
  v13[3] = &unk_1E5B399A8;
  id v14 = v8;
  int64_t v15 = v7;
  v13[4] = self;
  id v9 = v8;
  [v6 setCompletionHandler:v13];
  id v10 = [(LNActionExecutor *)self connection];
  char v11 = [(LNActionExecutor *)self identifier];
  [v10 cancelTimeoutForOperationWithIdentifier:v11];

  id v12 = [(LNActionExecutor *)self delegate];
  [v12 executor:self needsValueWithRequest:v6];
}

void __65__LNActionExecutor_requestParameterNeedsValue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  char v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = a3;
  id v10 = a2;
  [v5 setState:v6];
  int v8 = [*(id *)(a1 + 32) connection];
  id v9 = [*(id *)(a1 + 32) identifier];
  [v8 extendTimeoutForOperationWithIdentifier:v9];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)requestParameterDisambiguation:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  [v6 setCompletionHandler:a4];
  int64_t v7 = [(LNActionExecutor *)self state];
  [(LNActionExecutor *)self setState:4];
  int v8 = [v6 completionHandler];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__LNActionExecutor_requestParameterDisambiguation_completionHandler___block_invoke;
  v13[3] = &unk_1E5B39980;
  id v14 = v8;
  int64_t v15 = v7;
  v13[4] = self;
  id v9 = v8;
  [v6 setCompletionHandler:v13];
  id v10 = [(LNActionExecutor *)self connection];
  char v11 = [(LNActionExecutor *)self identifier];
  [v10 cancelTimeoutForOperationWithIdentifier:v11];

  id v12 = [(LNActionExecutor *)self delegate];
  [v12 executor:self needsDisambiguationWithRequest:v6];
}

void __69__LNActionExecutor_requestParameterDisambiguation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  char v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = a3;
  id v10 = a2;
  [v5 setState:v6];
  int v8 = [*(id *)(a1 + 32) connection];
  id v9 = [*(id *)(a1 + 32) identifier];
  [v8 extendTimeoutForOperationWithIdentifier:v9];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)requestParameterConfirmation:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  [v6 setCompletionHandler:a4];
  int64_t v7 = [(LNActionExecutor *)self state];
  [(LNActionExecutor *)self setState:5];
  int v8 = [v6 completionHandler];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__LNActionExecutor_requestParameterConfirmation_completionHandler___block_invoke;
  v13[3] = &unk_1E5B39958;
  id v14 = v8;
  int64_t v15 = v7;
  v13[4] = self;
  id v9 = v8;
  [v6 setCompletionHandler:v13];
  id v10 = [(LNActionExecutor *)self connection];
  char v11 = [(LNActionExecutor *)self identifier];
  [v10 cancelTimeoutForOperationWithIdentifier:v11];

  id v12 = [(LNActionExecutor *)self delegate];
  [v12 executor:self needsConfirmationWithRequest:v6];
}

void __67__LNActionExecutor_requestParameterConfirmation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  char v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = a3;
  id v10 = a2;
  [v5 setState:v6];
  int v8 = [*(id *)(a1 + 32) connection];
  id v9 = [*(id *)(a1 + 32) identifier];
  [v8 extendTimeoutForOperationWithIdentifier:v9];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setCompletedWithError:(id)a3
{
  id v13 = a3;
  [(LNActionExecutor *)self setState:10];
  id v4 = [(LNActionExecutor *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(LNActionExecutor *)self delegate];
    [v6 executor:self didPerformActionWithResult:0 error:v13];
  }
  id v7 = [(LNActionExecutor *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(LNActionExecutor *)self delegate];
    [v9 executor:self didFinishWithResult:0 error:v13];
  }
  id v10 = [(LNActionExecutor *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(LNActionExecutor *)self delegate];
    [v12 executor:self didCompleteExecutionWithResult:0 error:v13];
  }
}

- (void)runShowOutputActionIfNecessary:(id)a3 completionHandler:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  id v8 = [v6 showOutputAction];
  if (v8)
  {
    id v9 = [(LNActionExecutor *)self connection];
    id v10 = [v9 appBundleIdentifier];
    if (v10)
    {
      char v11 = [(LNActionExecutor *)self delegate];
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {

        goto LABEL_9;
      }
      id v12 = [(LNActionExecutor *)self delegate];
      char v13 = [v12 executor:self shouldRunShowOutputAction:v8];

      if (v13)
      {
LABEL_9:
        id v14 = [v8 url];
        BOOL v15 = v14 == 0;

        if (!v15)
        {
          [(LNActionExecutor *)self setState:9];
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __69__LNActionExecutor_runShowOutputActionIfNecessary_completionHandler___block_invoke;
          v43[3] = &unk_1E5B3A148;
          id v45 = v7;
          id v8 = v8;
          id v44 = v8;
          [(LNActionExecutor *)self openActionURL:v8 completionHandler:v43];

          id v16 = v45;
LABEL_24:

          goto LABEL_25;
        }
        showOutputActionMetadata = self->_showOutputActionMetadata;
        if (showOutputActionMetadata)
        {
          id v16 = 0;
        }
        else
        {
          char v18 = objc_opt_new();
          v19 = [(LNActionExecutor *)self connection];
          id v20 = [v19 appBundleIdentifier];
          uint64_t v21 = [v8 identifier];
          id v42 = 0;
          uint64_t v22 = [v18 actionForBundleIdentifier:v20 andActionIdentifier:v21 error:&v42];
          uint64_t v38 = v19;
          id v16 = v42;
          uint64_t v23 = self->_showOutputActionMetadata;
          self->_showOutputActionMetadata = v22;

          if (!self->_showOutputActionMetadata)
          {
            v37 = getLNLogCategoryExecution();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v48 = v16;
              _os_log_impl(&dword_1A4419000, v37, OS_LOG_TYPE_ERROR, "Failed to read intent metadata: %{public}@.", buf, 0xCu);
            }

            (*((void (**)(id, void, id))v7 + 2))(v7, 0, v16);
            goto LABEL_23;
          }

          showOutputActionMetadata = self->_showOutputActionMetadata;
        }
        int v24 = +[LNConnectionPolicy policyWithActionMetadata:](LNConnectionPolicy, "policyWithActionMetadata:", showOutputActionMetadata, v38);
        id v41 = v16;
        id v25 = [v24 connectionWithError:&v41];
        id v26 = v41;

        if (v25)
        {
          id v27 = [v8 parameters];
          uint64_t v28 = [v24 actionWithParameters:v27];

          id v29 = [LNActionExecutorPassthroughDelegate alloc];
          uint64_t v30 = [(LNActionExecutor *)self delegate];
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __69__LNActionExecutor_runShowOutputActionIfNecessary_completionHandler___block_invoke_142;
          v39[3] = &unk_1E5B39930;
          id v40 = v7;
          id v31 = [(LNActionExecutorPassthroughDelegate *)v29 initWithShowOutputActionDelegate:v30 performCompletionHandler:v39];
          [(LNActionExecutor *)self setShowOutputActionPassthroughDelegate:v31];

          BOOL v32 = [(LNActionExecutor *)self options];
          long long v33 = (void *)[v32 copy];

          if ([v6 showOutputActionOptions]) {
            [v33 setPreferNoticePresentation:1];
          }
          unsigned int v34 = [(LNActionExecutor *)self showOutputActionPassthroughDelegate];
          long long v35 = [v25 executorForAction:v28 options:v33 delegate:v34];

          [v35 perform];
          id v8 = (id)v28;
        }
        else
        {
          long long v36 = getLNLogCategoryExecution();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v48 = v26;
            _os_log_impl(&dword_1A4419000, v36, OS_LOG_TYPE_ERROR, "Failed to initialize connection: %{public}@.", buf, 0xCu);
          }

          (*((void (**)(id, void, id))v7 + 2))(v7, 0, v26);
        }

        char v18 = v24;
        id v16 = v26;
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
    }
  }
  (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
LABEL_25:

  os_activity_scope_leave(&state);
}

void __69__LNActionExecutor_runShowOutputActionIfNecessary_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id v4 = [LNActionOutput alloc];
    char v5 = [MEMORY[0x1E4F29128] UUID];
    LOBYTE(v10) = 0;
    LOBYTE(v9) = 0;
    char v11 = -[LNActionOutput initWithIdentifier:dialog:viewSnippet:attribution:value:showOutputAction:showOutputActionHint:showOutputActionOptions:deferred:nextAction:suggestedFollowUpActions:activityIdentifier:confirmationActionName:showPrompt:confirmationConditions:undoContext:](v4, "initWithIdentifier:dialog:viewSnippet:attribution:value:showOutputAction:showOutputActionHint:showOutputActionOptions:deferred:nextAction:suggestedFollowUpActions:activityIdentifier:confirmationActionName:showPrompt:confirmationConditions:undoContext:", v5, 0, 0, 0, 0, 0, 0, 0, v9, 0, 0, 0, 0, v10, 0,
            0);

    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [LNSuccessResult alloc];
    id v8 = [(LNSuccessResult *)v7 initWithAction:*(void *)(a1 + 32) output:v11 actionAppContext:0 predictions:MEMORY[0x1E4F1CBF0]];
    (*(void (**)(uint64_t, LNSuccessResult *, void))(v6 + 16))(v6, v8, 0);
  }
}

uint64_t __69__LNActionExecutor_runShowOutputActionIfNecessary_completionHandler___block_invoke_142(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)donateActionIfNecessary:(id)a3 result:(id)a4 completionHandler:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [(LNActionExecutor *)self options];
  char v12 = [v11 donateToTranscript];

  if (v9 && (v12 & 1) != 0)
  {
    id v29 = v10;
    char v13 = [LNTranscriptActionRecord alloc];
    unsigned int v34 = [(LNActionExecutor *)self connection];
    long long v33 = [v34 bundleIdentifier];
    BOOL v32 = [(LNActionExecutor *)self options];
    uint64_t v14 = [v32 source];
    id v31 = [(LNActionExecutor *)self options];
    uint64_t v30 = [v31 clientLabel];
    uint64_t v28 = [(LNActionExecutor *)self options];
    id v27 = [v28 executionUUID];
    id v26 = [MEMORY[0x1E4F1C9C8] date];
    id v38 = 0;
    BOOL v15 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v38];
    id v16 = v38;
    if (v16 || !v15)
    {
      int64_t v17 = getLNLogCategoryGeneral();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v40 = v8;
        __int16 v41 = 2112;
        id v42 = v16;
        _os_log_impl(&dword_1A4419000, v17, OS_LOG_TYPE_ERROR, "Object archival failed for %@: %@", buf, 0x16u);
      }
    }
    char v18 = [v9 actionData];
    [v9 outputData];
    v19 = id v35 = v8;
    id v20 = [v9 predictionsData];
    uint64_t v21 = [v9 output];
    uint64_t v22 = [v21 nextAction];
    LOBYTE(v24) = v22 != 0;
    id v25 = [(LNTranscriptActionRecord *)v13 initWithBundleIdentifier:v33 source:v14 clientLabel:v30 executionUUID:v27 executionDate:v26 actionData:v15 resolvedActionData:v18 actionOutputData:v19 predictionsData:v20 hasNextAction:v24];

    uint64_t v23 = +[LNConnectionManager sharedInstance];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __69__LNActionExecutor_donateActionIfNecessary_result_completionHandler___block_invoke;
    v36[3] = &unk_1E5B3A550;
    id v10 = v29;
    id v37 = v29;
    [v23 donateActionRecord:v25 completionHandler:v36];

    id v8 = v35;
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

uint64_t __69__LNActionExecutor_donateActionIfNecessary_result_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)openActionURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, LNURLLaunchRequest *))a4;
  id v8 = getLNLogCategoryExecution();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v6 url];
    int v15 = 138412290;
    id v16 = v9;
  }
  id v10 = [(LNActionExecutor *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0
    && ([(LNActionExecutor *)self delegate],
        char v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v12 executor:self shouldOpenActionURL:v6],
        v12,
        (v13 & 1) == 0))
  {
    uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    v7[2](v7, v14);
  }
  else
  {
    uint64_t v14 = [[LNURLLaunchRequest alloc] initWithAction:v6];
    [(LNURLLaunchRequest *)v14 performValidatingURLScheme:[(LNActionExecutor *)self validateURLSchemeBeforeLaunching] completionHandler:v7];
  }
}

- (void)perform
{
  v37[1] = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  [(LNActionExecutor *)self setState:1];
  id v3 = [(LNActionExecutor *)self action];
  id v4 = [v3 url];
  BOOL v5 = v4 == 0;

  if (v5)
  {
    id v7 = [(LNActionExecutor *)self action];
    if ([v7 openAppWhenRun])
    {
      id v8 = [(LNActionExecutor *)self connection];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v10 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v36 = *MEMORY[0x1E4F28568];
        v37[0] = @"openAppWhenRun is not supported in extensions";
        char v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
        char v12 = [v10 errorWithDomain:@"LNContextErrorDomain" code:2001 userInfo:v11];
        [(LNActionExecutor *)self setCompletedWithError:v12];

        goto LABEL_15;
      }
    }
    else
    {
    }
    char v13 = [(LNActionExecutor *)self connection];
    uint64_t v14 = objc_opt_class();
    int v15 = [(LNActionExecutor *)self action];
    id v16 = [(LNActionExecutor *)self options];
    uint64_t v17 = [v16 interactionMode];
    char v18 = [(LNActionExecutor *)self options];
    uint64_t v19 = [v18 source];
    id v20 = [(LNActionExecutor *)self options];
    uint64_t v21 = [v20 sourceOverride];
    uint64_t v22 = [v14 optionsForAction:v15 interactionMode:v17 source:v19 sourceOverride:v21];

    uint64_t v23 = [(LNActionExecutor *)self options];
    LODWORD(v15) = [v23 requestUnlockIfNeeded];

    if (v15) {
      [v22 setAuthenticationPolicy:1];
    }
    uint64_t v24 = getLNLogCategoryExecution();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = [(LNActionExecutor *)self options];
      id v26 = [v25 executionUUID];
      *(_DWORD *)buf = 138412546;
      long long v33 = v26;
      __int16 v34 = 2112;
      id v35 = v22;
      _os_log_impl(&dword_1A4419000, v24, OS_LOG_TYPE_INFO, "Performing action with UUID: %@, connection options: %@", buf, 0x16u);
    }
    id v27 = [(LNActionExecutor *)self options];
    int v28 = [v27 oneShotForSpringBoardOnly];

    if (v28)
    {
      [(LNActionExecutor *)self performOneShotWithConnectionOptions:v22];
    }
    else
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __27__LNActionExecutor_perform__block_invoke_96;
      v29[3] = &unk_1E5B39908;
      v29[4] = self;
      [(LNActionExecutor *)self getConnectionInterfaceWithOptions:v22 completionHandler:v29];
    }
  }
  else
  {
    id v6 = [(LNActionExecutor *)self action];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __27__LNActionExecutor_perform__block_invoke;
    v30[3] = &unk_1E5B39828;
    v30[4] = self;
    [(LNActionExecutor *)self openActionURL:v6 completionHandler:v30];
  }
LABEL_15:
  os_activity_scope_leave(&state);
}

void __27__LNActionExecutor_perform__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setCompletedWithError:a2];
  if (!a2)
  {
    id v4 = getLNLogCategoryExecution();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      BOOL v5 = [*(id *)(a1 + 32) action];
      id v6 = [v5 url];
      int v7 = 138412290;
      id v8 = v6;
    }
  }
}

void __27__LNActionExecutor_perform__block_invoke_96(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 112), &state);
  char v13 = *(void **)(a1 + 32);
  if (v11)
  {
    if ([v13 validateEntitlementsForConnection:v9])
    {
      uint64_t v14 = [v9 xpcConnection];
      int v15 = v14;
      if (v14) {
        [v14 auditToken];
      }
      else {
        memset(v36, 0, sizeof(v36));
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 8) = +[LNEntitlementsValidator validateEntitlement:@"com.apple.private.appintents.extend-timeout-on-progress-updates" auditToken:v36 validator:&__block_literal_global_9690];

      objc_initWeak(&location, *(id *)(a1 + 32));
      uint64_t v24 = (void *)MEMORY[0x1E4F28F90];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __27__LNActionExecutor_perform__block_invoke_3;
      v33[3] = &unk_1E5B39858;
      objc_copyWeak(&v34, &location);
      id v25 = [v24 _addSubscriberForCategory:@"com.apple.PerformActionProgressCategory" usingPublishingHandler:v33];
      [*(id *)(a1 + 32) setProgressSubscriber:v25];

      id v26 = [LNPerformActionConnectionOperation alloc];
      id v27 = *(void **)(a1 + 32);
      int v28 = [v27 activity];
      id v29 = [v9 queue];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __27__LNActionExecutor_perform__block_invoke_5;
      v31[3] = &unk_1E5B398E0;
      v31[4] = *(void *)(a1 + 32);
      id v32 = v10;
      uint64_t v30 = [(LNPerformActionConnectionOperation *)v26 initWithConnectionInterface:v11 action:v32 executor:v27 executorActivity:v28 queue:v29 completionHandler:v31];

      [*(id *)(a1 + 32) setState:9];
      [v9 enqueueConnectionOperation:v30];

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
    }
    else
    {
      id v16 = *(void **)(a1 + 32);
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v38 = *MEMORY[0x1E4F28568];
      char v18 = NSString;
      uint64_t v19 = [v16 action];
      id v20 = [v19 identifier];
      uint64_t v21 = [v18 stringWithFormat:@"This client is not entitled to perform %@", v20];
      v39[0] = v21;
      uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
      uint64_t v23 = [v17 errorWithDomain:@"LNContextErrorDomain" code:2021 userInfo:v22];
      [v16 setCompletedWithError:v23];
    }
  }
  else
  {
    [v13 setCompletedWithError:v12];
  }
  os_activity_scope_leave(&state);
}

id __27__LNActionExecutor_perform__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v5 = [v3 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"ExecutionUUID"];
  int v7 = [(os_unfair_lock_s *)WeakRetained options];
  id v8 = [v7 executionUUID];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    os_unfair_lock_lock(WeakRetained + 3);
    [v3 addObserver:WeakRetained forKeyPath:@"fractionCompleted" options:1 context:LNActionExecutorRemoteProgressCompletedContext];
    [(os_unfair_lock_s *)WeakRetained setExecutionProgress:v3];
    id v10 = [LNProgressPropertySynchronizer alloc];
    id v11 = [(os_unfair_lock_s *)WeakRetained progress];
    id v12 = [(LNProgressPropertySynchronizer *)v10 initWithSourceProgress:v3 destinationProgress:v11];
    [(os_unfair_lock_s *)WeakRetained setProgressPropertySynchronizer:v12];

    char v13 = [(os_unfair_lock_s *)WeakRetained progressPropertySynchronizer];
    [v13 startSynchronization];

    os_unfair_lock_unlock(WeakRetained + 3);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __27__LNActionExecutor_perform__block_invoke_4;
    aBlock[3] = &unk_1E5B3A0B0;
    aBlock[4] = WeakRetained;
    uint64_t v14 = _Block_copy(aBlock);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

void __27__LNActionExecutor_perform__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) unsubscribeProgressObservation];
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x3032000000;
  id v42 = __Block_byref_object_copy__9692;
  uint64_t v43 = __Block_byref_object_dispose__9693;
  id v44 = 0;
  if (v6)
  {
    int v7 = getLNLogCategoryExecution();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v48 = v6;
      _os_log_impl(&dword_1A4419000, v7, OS_LOG_TYPE_ERROR, "Perform action connection operation completed with error: %{public}@", buf, 0xCu);
    }

    id v8 = (void *)MEMORY[0x1E4F28C58];
    v45[0] = *MEMORY[0x1E4F28568];
    int v9 = NSString;
    id v10 = @"LNActionExecutorErrorCodePerformAction";
    id v11 = [v6 localizedDescription];
    id v12 = [v9 stringWithFormat:@"%@. Underlying error: %@", @"LNActionExecutorErrorCodePerformAction", v11];
    v45[1] = @"LNActionExecutorErrorUnderlyingError";
    v46[0] = v12;
    v46[1] = v6;
    char v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
    uint64_t v14 = [v8 errorWithDomain:@"LNActionExecutorErrorDomain" code:3001 userInfo:v13];
    int v15 = (void *)v40[5];
    v40[5] = v14;
  }
  [*(id *)(a1 + 32) setState:10];
  id v16 = [*(id *)(a1 + 32) delegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    char v18 = [*(id *)(a1 + 32) delegate];
    [v18 executor:*(void *)(a1 + 32) didPerformActionWithResult:v5 error:v6];
  }
  uint64_t v19 = [*(id *)(a1 + 32) delegate];
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    uint64_t v21 = [*(id *)(a1 + 32) delegate];
    [v21 executor:*(void *)(a1 + 32) didFinishWithResult:v5 error:v6];
  }
  uint64_t v22 = dispatch_group_create();
  dispatch_group_enter(v22);
  uint64_t v23 = *(void **)(a1 + 32);
  uint64_t v24 = *(void *)(a1 + 40);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  _OWORD v37[2] = __27__LNActionExecutor_perform__block_invoke_121;
  void v37[3] = &unk_1E5B39828;
  id v25 = v22;
  uint64_t v38 = v25;
  [v23 donateActionIfNecessary:v24 result:v5 completionHandler:v37];
  dispatch_group_enter(v25);
  id v26 = *(void **)(a1 + 32);
  id v27 = [v5 output];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __27__LNActionExecutor_perform__block_invoke_122;
  v34[3] = &unk_1E5B39890;
  uint64_t v36 = &v39;
  int v28 = v25;
  id v35 = v28;
  [v26 runShowOutputActionIfNecessary:v27 completionHandler:v34];

  id v29 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__LNActionExecutor_perform__block_invoke_2_124;
  block[3] = &unk_1E5B398B8;
  block[4] = *(void *)(a1 + 32);
  id v32 = v5;
  long long v33 = &v39;
  id v30 = v5;
  dispatch_group_notify(v28, v29, block);

  _Block_object_dispose(&v39, 8);
}

void __27__LNActionExecutor_perform__block_invoke_121(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = getLNLogCategoryExecution();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_ERROR, "Biome donation has failed with error: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __27__LNActionExecutor_perform__block_invoke_122(uint64_t a1, void *a2, void *a3)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 && !*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    v16[0] = *MEMORY[0x1E4F28568];
    id v8 = NSString;
    int v9 = @"LNActionExecutorErrorCodePerformShowOutputAction";
    id v10 = [v6 localizedDescription];
    id v11 = [v8 stringWithFormat:@"%@. Underlying error: %@", @"LNActionExecutorErrorCodePerformShowOutputAction", v10];
    v16[1] = @"LNActionExecutorErrorUnderlyingError";
    v17[0] = v11;
    v17[1] = v6;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    uint64_t v13 = [v7 errorWithDomain:@"LNActionExecutorErrorDomain" code:3003 userInfo:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    int v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __27__LNActionExecutor_perform__block_invoke_2_124(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 executor:*(void *)(a1 + 32) didCompleteExecutionWithResult:*(void *)(a1 + 40) error:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
}

uint64_t __27__LNActionExecutor_perform__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) unsubscribeProgressObservation];
}

uint64_t __27__LNActionExecutor_perform__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v3 = v2;
    }
    else {
      char v3 = 0;
    }
  }
  else
  {
    char v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = [v4 BOOLValue];

  return v5;
}

- (void)getXPCListenerConnectionInterfaceWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(LNActionExecutor *)self action];
  int v9 = [v8 actionWithNonSecureParameters];

  id v10 = [(LNActionExecutor *)self connection];
  id v11 = [(LNActionExecutor *)self connection];
  id v12 = [v11 bundleIdentifier];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __83__LNActionExecutor_getXPCListenerConnectionInterfaceWithOptions_completionHandler___block_invoke;
  v16[3] = &unk_1E5B39800;
  id v17 = v9;
  char v18 = self;
  id v19 = v6;
  id v20 = v7;
  id v13 = v6;
  id v14 = v9;
  id v15 = v7;
  [v10 getListenerEndpointForBundleIdentifier:v12 action:v14 completionHandler:v16];
}

void __83__LNActionExecutor_getXPCListenerConnectionInterfaceWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v40 = v10;
  if (v9)
  {
    id v36 = v9;
    id v13 = [*(id *)(a1 + 32) parameters];
    id v14 = [v13 valueForKeyPath:@"identifier"];

    id v15 = [*(id *)(a1 + 40) action];
    id v39 = v11;
    id v16 = [v11 parameters];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __83__LNActionExecutor_getXPCListenerConnectionInterfaceWithOptions_completionHandler___block_invoke_2;
    v47[3] = &unk_1E5B3A438;
    id v38 = v14;
    id v48 = v38;
    id v17 = objc_msgSend(v16, "if_objectsPassingTest:", v47);
    id v37 = [v15 actionWithByMergingParameters:v17];

    char v18 = [LNXPCListenerEndpointConnection alloc];
    id v35 = [*(id *)(a1 + 40) connection];
    uint64_t v19 = [v35 effectiveBundleIdentifier];
    long long v33 = [*(id *)(a1 + 40) connection];
    id v20 = [v33 appBundleIdentifier];
    uint64_t v21 = [*(id *)(a1 + 40) connection];
    uint64_t v22 = [v21 processInstanceIdentifier];
    uint64_t v23 = [*(id *)(a1 + 40) connection];
    uint64_t v24 = [v23 userIdentity];
    if (v10) {
      objc_msgSend(v10, "if_auditToken");
    }
    else {
      memset(v46, 0, sizeof(v46));
    }
    id v45 = v12;
    id v25 = v18;
    id v26 = (void *)v19;
    uint64_t v27 = v19;
    id v9 = v36;
    int v28 = [(LNXPCListenerEndpointConnection *)v25 initWithEffectiveBundleIdentifier:v27 appBundleIdentifier:v20 processInstanceIdentifier:v22 appIntentsEnabledOnly:0 userIdentity:v24 listenerEndpoint:v36 auditToken:v46 error:&v45];
    id v34 = v45;

    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __83__LNActionExecutor_getXPCListenerConnectionInterfaceWithOptions_completionHandler___block_invoke_3;
    v41[3] = &unk_1E5B397D8;
    uint64_t v29 = *(void *)(a1 + 48);
    id v30 = *(id *)(a1 + 56);
    id v42 = v28;
    id v43 = v37;
    id v44 = v30;
    id v31 = v37;
    id v32 = v28;
    [(LNConnection *)v32 getConnectionInterfaceWithOptions:v29 completionHandler:v41];

    id v12 = v34;
    id v11 = v39;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __83__LNActionExecutor_getXPCListenerConnectionInterfaceWithOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  char v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __83__LNActionExecutor_getXPCListenerConnectionInterfaceWithOptions_completionHandler___block_invoke_3(void *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, void, uint64_t, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2, a3);
}

- (void)getPrimaryConnectionInterfaceWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(LNActionExecutor *)self action];
  id v9 = [v8 systemProtocols];
  id v10 = [MEMORY[0x1E4F72710] xpcListenerProtocol];
  int v11 = [v9 containsObject:v10];

  if (v11)
  {
    [(LNActionExecutor *)self getXPCListenerConnectionInterfaceWithOptions:v6 completionHandler:v7];
  }
  else
  {
    id v12 = [(LNActionExecutor *)self connection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__LNActionExecutor_getPrimaryConnectionInterfaceWithOptions_completionHandler___block_invoke;
    v13[3] = &unk_1E5B39788;
    v13[4] = self;
    id v14 = v7;
    [v12 getConnectionInterfaceWithOptions:v6 completionHandler:v13];
  }
}

void __79__LNActionExecutor_getPrimaryConnectionInterfaceWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  id v10 = [v6 connection];
  id v9 = [*(id *)(a1 + 32) action];
  (*(void (**)(uint64_t, id, void *, id, id))(v5 + 16))(v5, v10, v9, v8, v7);
}

- (void)getConnectionInterfaceWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F4B7E0];
  id v9 = [(LNActionExecutor *)self connection];
  id v10 = [v9 appBundleIdentifier];
  int v11 = [v8 applicationWithBundleIdentifier:v10];

  if ([v11 isLocked])
  {
    id v12 = [MEMORY[0x1E4F4B7E8] sharedGuard];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__LNActionExecutor_getConnectionInterfaceWithOptions_completionHandler___block_invoke;
    v13[3] = &unk_1E5B397B0;
    v13[4] = self;
    id v14 = v6;
    id v15 = v7;
    [v12 getIsChallengeCurrentlyRequiredForSubject:v11 completion:v13];
  }
  else
  {
    [(LNActionExecutor *)self getPrimaryConnectionInterfaceWithOptions:v6 completionHandler:v7];
  }
}

void __72__LNActionExecutor_getConnectionInterfaceWithOptions_completionHandler___block_invoke(id *a1, void *a2)
{
  char v3 = [a2 BOOLValue];
  id v4 = a1[4];
  if (v3)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__LNActionExecutor_getConnectionInterfaceWithOptions_completionHandler___block_invoke_3;
    v8[3] = &unk_1E5B3A100;
    v8[4] = v4;
    id v9 = a1[5];
    id v10 = a1[6];
    [v4 requestAppProtectionUnlockWithCompletionHandler:v8];
  }
  else
  {
    uint64_t v5 = [a1[4] connection];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__LNActionExecutor_getConnectionInterfaceWithOptions_completionHandler___block_invoke_2;
    v11[3] = &unk_1E5B39788;
    id v6 = a1[5];
    id v7 = a1[6];
    v11[4] = a1[4];
    id v12 = v7;
    [v5 getConnectionInterfaceWithOptions:v6 completionHandler:v11];
  }
}

void __72__LNActionExecutor_getConnectionInterfaceWithOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  id v10 = [v6 connection];
  id v9 = [*(id *)(a1 + 32) action];
  (*(void (**)(uint64_t, id, void *, id, id))(v5 + 16))(v5, v10, v9, v8, v7);
}

void __72__LNActionExecutor_getConnectionInterfaceWithOptions_completionHandler___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    char v3 = [*(id *)(a1 + 32) connection];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__LNActionExecutor_getConnectionInterfaceWithOptions_completionHandler___block_invoke_4;
    v8[3] = &unk_1E5B39788;
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(id *)(a1 + 48);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v5;
    [v3 getConnectionInterfaceWithOptions:v4 completionHandler:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    LNConnectionErrorWithCode(2400);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void, void, id))(v6 + 16))(v6, 0, 0, 0, v7);
  }
}

void __72__LNActionExecutor_getConnectionInterfaceWithOptions_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  id v10 = [v6 connection];
  id v9 = [*(id *)(a1 + 32) action];
  (*(void (**)(uint64_t, id, void *, id, id))(v5 + 16))(v5, v10, v9, v8, v7);
}

- (void)_logTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3 == a4) {
    return;
  }
  id v7 = getLNLogCategoryExecution();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a3 - 1) > 9) {
      id v8 = @"Idle";
    }
    else {
      id v8 = off_1E5B39A68[a3 - 1];
    }
    if ((unint64_t)(a4 - 1) > 9) {
      id v9 = @"Idle";
    }
    else {
      id v9 = off_1E5B39A68[a4 - 1];
    }
    int v24 = 138543618;
    id v25 = v8;
    __int16 v26 = 2114;
    uint64_t v27 = v9;
  }

  if ((unint64_t)a3 <= 9)
  {
    if (((1 << a3) & 0x174) != 0)
    {
      id v10 = getLNLogCategoryExecution();
      int v11 = v10;
      if ((unint64_t)&self->super.isa + 1 < 2 || !os_signpost_enabled(v10)) {
        goto LABEL_22;
      }
      LOWORD(v24) = 0;
      id v12 = "waiting";
    }
    else if (a3 == 1)
    {
      id v14 = getLNLogCategoryExecution();
      int v11 = v14;
      if ((unint64_t)&self->super.isa + 1 < 2 || !os_signpost_enabled(v14)) {
        goto LABEL_22;
      }
      LOWORD(v24) = 0;
      id v12 = "connecting";
    }
    else
    {
      if (a3 != 9) {
        goto LABEL_23;
      }
      id v13 = getLNLogCategoryExecution();
      int v11 = v13;
      if ((unint64_t)&self->super.isa + 1 < 2 || !os_signpost_enabled(v13)) {
        goto LABEL_22;
      }
      LOWORD(v24) = 0;
      id v12 = "performing";
    }
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v11, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)self, v12, "", (uint8_t *)&v24, 2u);
LABEL_22:
  }
LABEL_23:
  switch(a4)
  {
    case 1:
      id v20 = getLNLogCategoryExecution();
      id v16 = v20;
      if ((unint64_t)&self->super.isa + 1 < 2 || !os_signpost_enabled(v20)) {
        goto LABEL_39;
      }
      LOWORD(v24) = 0;
      id v17 = "connecting";
      goto LABEL_27;
    case 2:
    case 4:
    case 5:
    case 6:
    case 8:
      id v15 = getLNLogCategoryExecution();
      id v16 = v15;
      if ((unint64_t)&self->super.isa + 1 < 2 || !os_signpost_enabled(v15)) {
        goto LABEL_39;
      }
      LOWORD(v24) = 0;
      id v17 = "waiting";
      goto LABEL_27;
    case 3:
      uint64_t v21 = getLNLogCategoryExecution();
      id v16 = v21;
      if ((unint64_t)&self->super.isa + 1 < 2 || !os_signpost_enabled(v21)) {
        goto LABEL_39;
      }
      LOWORD(v24) = 0;
      id v17 = "resolving";
      goto LABEL_27;
    case 7:
      uint64_t v22 = getLNLogCategoryExecution();
      id v16 = v22;
      if ((unint64_t)&self->super.isa + 1 < 2 || !os_signpost_enabled(v22)) {
        goto LABEL_39;
      }
      LOWORD(v24) = 0;
      id v17 = "resolving";
      char v18 = v16;
      os_signpost_type_t v19 = OS_SIGNPOST_INTERVAL_END;
      goto LABEL_28;
    case 9:
      uint64_t v23 = getLNLogCategoryExecution();
      id v16 = v23;
      if ((unint64_t)&self->super.isa + 1 < 2 || !os_signpost_enabled(v23)) {
        goto LABEL_39;
      }
      LOWORD(v24) = 0;
      id v17 = "performing";
LABEL_27:
      char v18 = v16;
      os_signpost_type_t v19 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_28:
      _os_signpost_emit_with_name_impl(&dword_1A4419000, v18, v19, (os_signpost_id_t)self, v17, "", (uint8_t *)&v24, 2u);
LABEL_39:

      break;
    default:
      return;
  }
}

- (void)setState:(int64_t)a3
{
  int64_t state = self->_state;
  if (state != a3)
  {
    switch(state)
    {
      case 0:
        if (a3 != 1)
        {
          id v7 = [MEMORY[0x1E4F28B00] currentHandler];
          [v7 handleFailureInMethod:a2, self, @"LNActionExecutor.m", 164, @"Invalid parameter not satisfying: %@", @"state == LNActionExecutorStateConnecting" object file lineNumber description];
          goto LABEL_16;
        }
        int64_t state = 0;
        break;
      case 1:
        if ((unint64_t)(a3 - 2) >= 9 || ((0x183u >> (a3 - 2)) & 1) == 0)
        {
          id v7 = [MEMORY[0x1E4F28B00] currentHandler];
          [v7 handleFailureInMethod:a2, self, @"LNActionExecutor.m", 170, @"Invalid parameter not satisfying: %@", @"state == LNActionExecutorStateWaitingForAppProtectionUnlock || state == LNActionExecutorStateResolving || state == LNActionExecutorStatePerforming || state == LNActionExecutorStateCompleted" object file lineNumber description];
          goto LABEL_16;
        }
        int64_t state = 1;
        break;
      case 2:
        if (a3 != 1)
        {
          id v7 = [MEMORY[0x1E4F28B00] currentHandler];
          [v7 handleFailureInMethod:a2, self, @"LNActionExecutor.m", 188, @"Invalid parameter not satisfying: %@", @"state == LNActionExecutorStateConnecting" object file lineNumber description];
          goto LABEL_16;
        }
        int64_t state = 2;
        break;
      case 3:
        if ((unint64_t)(a3 - 4) >= 7 || ((0x67u >> (a3 - 4)) & 1) == 0)
        {
          id v7 = [MEMORY[0x1E4F28B00] currentHandler];
          [v7 handleFailureInMethod:a2, self, @"LNActionExecutor.m", 177, @"Invalid parameter not satisfying: %@", @"state == LNActionExecutorStateWaitingForValue || state == LNActionExecutorStateWaitingForDisambiguation || state == LNActionExecutorStateWaitingForConfirmation || state == LNActionExecutorStatePerforming || state == LNActionExecutorStateCompleted" object file lineNumber description];
          goto LABEL_16;
        }
        int64_t state = 3;
        break;
      case 4:
      case 5:
      case 6:
      case 8:
        if ((unint64_t)a3 > 0xA || ((1 << a3) & 0x608) == 0)
        {
          id v7 = [MEMORY[0x1E4F28B00] currentHandler];
          [v7 handleFailureInMethod:a2, self, @"LNActionExecutor.m", 185, @"Invalid parameter not satisfying: %@", @"state == LNActionExecutorStateResolving || state == LNActionExecutorStatePerforming || state == LNActionExecutorStateCompleted" object file lineNumber description];
LABEL_16:

          int64_t state = self->_state;
        }
        break;
      default:
        break;
    }
    [(LNActionExecutor *)self _logTransitionFromState:state toState:a3];
    self->_int64_t state = a3;
  }
}

- (void)dealloc
{
  [(LNActionExecutor *)self unsubscribeProgressObservation];
  v3.receiver = self;
  v3.super_class = (Class)LNActionExecutor;
  [(LNActionExecutor *)&v3 dealloc];
}

- (LNActionExecutor)initWithAction:(id)a3 connection:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_15:
    id v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"LNActionExecutor.m", 96, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_16;
  }
  id v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"LNActionExecutor.m", 95, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

  if (!v10) {
    goto LABEL_15;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_16:
  id v37 = [MEMORY[0x1E4F28B00] currentHandler];
  [v37 handleFailureInMethod:a2, self, @"LNActionExecutor.m", 97, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];

LABEL_4:
  v38.receiver = self;
  v38.super_class = (Class)LNActionExecutor;
  id v12 = [(LNActionExecutor *)&v38 init];
  if (!v12) {
    goto LABEL_13;
  }
  uint64_t v13 = [MEMORY[0x1E4F29128] UUID];
  identifier = v12->_identifier;
  v12->_identifier = (NSUUID *)v13;

  id v15 = [v9 systemProtocols];
  id v16 = [MEMORY[0x1E4F72710] openEntitySystemProtocol];
  if (([v15 containsObject:v16] & 1) == 0)
  {

    goto LABEL_9;
  }
  [v9 systemProtocols];
  id v17 = a4;
  v19 = id v18 = v10;
  id v20 = [MEMORY[0x1E4F72710] urlRepresentableProtocol];
  int v21 = [v19 containsObject:v20];

  id v10 = v18;
  a4 = v17;

  if (!v21)
  {
LABEL_9:
    uint64_t v22 = (LNAction *)v9;
    goto LABEL_10;
  }
  uint64_t v22 = [v9 actionWithOpenWhenRun:0];
LABEL_10:
  action = v12->_action;
  v12->_action = v22;

  objc_storeStrong((id *)&v12->_connection, a4);
  uint64_t v24 = [v11 copy];
  options = v12->_options;
  v12->_options = (LNActionExecutorOptions *)v24;

  __int16 v26 = [v9 systemProtocols];
  uint64_t v27 = [MEMORY[0x1E4F72710] cameraCaptureProtocol];
  int v28 = [v26 containsObject:v27];

  if (v28) {
    [(LNActionExecutorOptions *)v12->_options setOneShotForSpringBoardOnly:1];
  }
  v12->_int64_t state = 0;
  os_activity_t v29 = _os_activity_create(&dword_1A4419000, "appintents:action executor", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  activity = v12->_activity;
  v12->_activity = (OS_os_activity *)v29;

  uint64_t v31 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100000];
  progress = v12->_progress;
  v12->_progress = (NSProgress *)v31;

  v12->_progressSubscriptionLock._os_unfair_lock_opaque = 0;
  long long v33 = v12;
LABEL_13:

  return v12;
}

- (NSString)appBundleIdentifier
{
  id v2 = [(LNActionExecutor *)self connection];
  objc_super v3 = [v2 appBundleIdentifier];

  return (NSString *)v3;
}

@end