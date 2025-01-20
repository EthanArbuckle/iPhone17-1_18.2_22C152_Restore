@interface VSUserAccountUpdateManager
- (NSMutableArray)updatedUserAccounts;
- (NSMutableSet)updateRequests;
- (OS_dispatch_source)watchdog;
- (VSJSApp)currentApp;
- (VSStateMachine)stateMachine;
- (VSUserAccountUpdateManager)initWithUserAccountUpdateRequests:(id)a3;
- (VSUserAccountUpdateManagerDelegate)delegate;
- (VSUserAccountUpdateRequest)currentUpdateRequest;
- (id)_requestOptionsWithUserAccounts:(id)a3 callback:(id)a4;
- (void)_configureWatchdogWithSeconds:(unint64_t)a3;
- (void)app:(id)a3 didFailToStartWithError:(id)a4;
- (void)app:(id)a3 prewarmWithContext:(id)a4;
- (void)appDidStart:(id)a3;
- (void)appDidStop:(id)a3;
- (void)setCurrentApp:(id)a3;
- (void)setCurrentUpdateRequest:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setUpdateRequests:(id)a3;
- (void)setUpdatedUserAccounts:(id)a3;
- (void)setWatchdog:(id)a3;
- (void)transitionToBootingAppState;
- (void)transitionToEnqueuingNextUserAccountSetState;
- (void)transitionToInvokingOnRequestCallbackState;
- (void)transitionToNotifyingFinishState;
- (void)transitionToNotifyingForUserAccountSetState;
- (void)transitionToStoppingAppState;
- (void)transitionToWaitingForAppStopState;
- (void)updateUserAccounts;
@end

@implementation VSUserAccountUpdateManager

- (VSUserAccountUpdateManager)initWithUserAccountUpdateRequests:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VSUserAccountUpdateManager;
  v5 = [(VSUserAccountUpdateManager *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
    updateRequests = v5->_updateRequests;
    v5->_updateRequests = (NSMutableSet *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    updatedUserAccounts = v5->_updatedUserAccounts;
    v5->_updatedUserAccounts = v8;

    v10 = objc_alloc_init(VSStateMachine);
    stateMachine = v5->_stateMachine;
    v5->_stateMachine = v10;

    v12 = v5->_stateMachine;
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [(VSStateMachine *)v12 setName:v14];

    [(VSStateMachine *)v5->_stateMachine setDelegate:v5];
    [(VSStateMachine *)v5->_stateMachine setDestinationState:@"Enqueuing Next User Account Set" forEvent:@"Start" inState:@"Initial"];
    [(VSStateMachine *)v5->_stateMachine setDestinationState:@"Done" forEvent:@"Done" inState:@"Initial"];
    [(VSStateMachine *)v5->_stateMachine setDestinationState:@"Booting App" forEvent:@"Done" inState:@"Enqueuing Next User Account Set"];
    [(VSStateMachine *)v5->_stateMachine setDestinationState:@"Notifying Finish" forEvent:@"Stop" inState:@"Enqueuing Next User Account Set"];
    [(VSStateMachine *)v5->_stateMachine setDestinationState:@"Waiting For App Boot" forEvent:@"Done" inState:@"Booting App"];
    [(VSStateMachine *)v5->_stateMachine setDestinationState:@"Notifying For User Account Set" forEvent:@"Error" inState:@"Booting App"];
    [(VSStateMachine *)v5->_stateMachine setDestinationState:@"Invoking On Request Callback" forEvent:@"Done" inState:@"Waiting For App Boot"];
    [(VSStateMachine *)v5->_stateMachine setDestinationState:@"Notifying For User Account Set" forEvent:@"Timeout" inState:@"Waiting For App Boot"];
    [(VSStateMachine *)v5->_stateMachine setDestinationState:@"Notifying For User Account Set" forEvent:@"Error" inState:@"Waiting For App Boot"];
    [(VSStateMachine *)v5->_stateMachine setDestinationState:@"Waiting For On Request Callback" forEvent:@"Done" inState:@"Invoking On Request Callback"];
    [(VSStateMachine *)v5->_stateMachine setDestinationState:@"Notifying For User Account Set" forEvent:@"Error" inState:@"Invoking On Request Callback"];
    [(VSStateMachine *)v5->_stateMachine setDestinationState:@"Stopping App" forEvent:@"Done" inState:@"Waiting For On Request Callback"];
    [(VSStateMachine *)v5->_stateMachine setDestinationState:@"Notifying For User Account Set" forEvent:@"Error" inState:@"Waiting For On Request Callback"];
    [(VSStateMachine *)v5->_stateMachine setDestinationState:@"Notifying For User Account Set" forEvent:@"Timeout" inState:@"Waiting For On Request Callback"];
    [(VSStateMachine *)v5->_stateMachine setDestinationState:@"Waiting for App Stop" forEvent:@"Done" inState:@"Stopping App"];
    [(VSStateMachine *)v5->_stateMachine setDestinationState:@"Notifying For User Account Set" forEvent:@"Done" inState:@"Waiting for App Stop"];
    [(VSStateMachine *)v5->_stateMachine setDestinationState:@"Notifying For User Account Set" forEvent:@"Timeout" inState:@"Waiting for App Stop"];
    [(VSStateMachine *)v5->_stateMachine setDestinationState:@"Enqueuing Next User Account Set" forEvent:@"Done" inState:@"Notifying For User Account Set"];
    [(VSStateMachine *)v5->_stateMachine setDestinationState:@"Done" forEvent:@"Done" inState:@"Notifying Finish"];
    [(VSStateMachine *)v5->_stateMachine activateWithState:@"Initial"];
  }

  return v5;
}

- (void)updateUserAccounts
{
  v3 = [(VSUserAccountUpdateManager *)self updateRequests];
  uint64_t v4 = [v3 count];

  v5 = [(VSUserAccountUpdateManager *)self stateMachine];
  id v7 = v5;
  if (v4) {
    uint64_t v6 = @"Start";
  }
  else {
    uint64_t v6 = @"Done";
  }
  [v5 enqueueEvent:v6];
}

- (id)_requestOptionsWithUserAccounts:(id)a3 callback:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v9 setObject:@"refreshAccounts" forKeyedSubscript:@"requestType"];
  v10 = +[VSJSUserAccount jsUserAccountsFromUserAccounts:v7];

  [v9 setObject:v10 forKeyedSubscript:@"currentUserAccounts"];
  [v8 setObject:v9 forKeyedSubscript:@"request"];
  [v8 setObject:v6 forKeyedSubscript:@"callback"];

  return v8;
}

- (void)_configureWatchdogWithSeconds:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v5 = [(VSUserAccountUpdateManager *)self watchdog];
  id v6 = VSDefaultLogObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v7)
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v13 = a3;
      _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Configuring watchdog timer for %lu seconds", buf, 0xCu);
    }

    if (v5)
    {
      dispatch_source_cancel(v5);
      [(VSUserAccountUpdateManager *)self setWatchdog:0];
    }
    id v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);

    dispatch_time_t v9 = dispatch_time(0, 1000000000 * a3);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak((id *)buf, self);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __60__VSUserAccountUpdateManager__configureWatchdogWithSeconds___block_invoke;
    handler[3] = &unk_1E6BD35C8;
    objc_copyWeak(&v11, (id *)buf);
    dispatch_source_set_event_handler(v8, handler);
    [(VSUserAccountUpdateManager *)self setWatchdog:v8];
    dispatch_activate(v8);
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
    goto LABEL_11;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Cancelling watchdog timer", buf, 2u);
  }

  if (v5)
  {
    dispatch_source_cancel(v5);
    [(VSUserAccountUpdateManager *)self setWatchdog:0];
    id v8 = v5;
LABEL_11:
  }
}

void __60__VSUserAccountUpdateManager__configureWatchdogWithSeconds___block_invoke(uint64_t a1)
{
  v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1DA674000, v2, OS_LOG_TYPE_DEFAULT, "Watchdog timer fired.", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained stateMachine];
    [v5 enqueueEvent:@"Timeout"];
  }
}

- (void)transitionToEnqueuingNextUserAccountSetState
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(VSUserAccountUpdateManager *)self setCurrentApp:0];
  [(VSUserAccountUpdateManager *)self setCurrentUpdateRequest:0];
  v3 = [(VSUserAccountUpdateManager *)self updateRequests];
  uint64_t v4 = [v3 allObjects];
  v5 = [v4 firstObject];

  if (v5)
  {
    id v6 = VSDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Enqueuing update request: %@", (uint8_t *)&v11, 0xCu);
    }

    BOOL v7 = [(VSUserAccountUpdateManager *)self updateRequests];
    [v7 removeObject:v5];

    [(VSUserAccountUpdateManager *)self setCurrentUpdateRequest:v5];
    id v8 = [(VSUserAccountUpdateManager *)self stateMachine];
    dispatch_time_t v9 = v8;
    v10 = @"Done";
  }
  else
  {
    id v8 = [(VSUserAccountUpdateManager *)self stateMachine];
    dispatch_time_t v9 = v8;
    v10 = @"Stop";
  }
  [v8 enqueueEvent:v10];
}

- (void)transitionToBootingAppState
{
  id v8 = [(VSUserAccountUpdateManager *)self currentUpdateRequest];
  v3 = [v8 userAccount];
  uint64_t v4 = [v3 updateURL];

  v5 = [[VSJSApp alloc] initWithScriptURL:v4];
  id v6 = [v8 userAccount];
  -[VSJSApp setEnforceSystemTrust:](v5, "setEnforceSystemTrust:", [v6 requiresSystemTrust]);

  [(VSUserAccountUpdateManager *)self setCurrentApp:v5];
  [(VSJSApp *)v5 setDelegate:self];
  [(VSJSApp *)v5 start];
  BOOL v7 = [(VSUserAccountUpdateManager *)self stateMachine];
  [v7 enqueueEvent:@"Done"];
}

- (void)transitionToInvokingOnRequestCallbackState
{
  v3 = [(VSUserAccountUpdateManager *)self currentApp];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__VSUserAccountUpdateManager_transitionToInvokingOnRequestCallbackState__block_invoke;
  v5[3] = &unk_1E6BD3618;
  v5[4] = self;
  [v3 evaluateWithBlock:v5];

  uint64_t v4 = [(VSUserAccountUpdateManager *)self stateMachine];
  [v4 enqueueEvent:@"Done"];

  [(VSUserAccountUpdateManager *)self _configureWatchdogWithSeconds:30];
}

void __72__VSUserAccountUpdateManager_transitionToInvokingOnRequestCallbackState__block_invoke(uint64_t a1, void *a2)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v4 = (void *)MEMORY[0x1E4F30938];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__VSUserAccountUpdateManager_transitionToInvokingOnRequestCallbackState__block_invoke_2;
  aBlock[3] = &unk_1E6BD35F0;
  objc_copyWeak(&v18, &location);
  v5 = _Block_copy(aBlock);
  id v6 = [v3 context];
  BOOL v7 = [v4 valueWithObject:v5 inContext:v6];

  id v8 = [*(id *)(a1 + 32) currentUpdateRequest];
  LODWORD(v5) = v8 == 0;

  if (v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [self currentUpdateRequest] parameter must not be nil."];
  }
  dispatch_time_t v9 = [*(id *)(a1 + 32) currentUpdateRequest];
  v10 = [v9 userAccount];
  v21[0] = v10;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];

  v12 = [*(id *)(a1 + 32) _requestOptionsWithUserAccounts:v11 callback:v7];
  uint64_t v13 = [v3 context];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"App"];

  VSAssertWithMessage(v14 != 0, @"App object undefined");
  v20 = v12;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  id v16 = (id)[v14 invokeMethod:@"onRequest" withArguments:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __72__VSUserAccountUpdateManager_transitionToInvokingOnRequestCallbackState__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = VSDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    v19 = @"onRequest";
    _os_log_impl(&dword_1DA674000, v7, OS_LOG_TYPE_DEFAULT, "%@ callback invoked", (uint8_t *)&v18, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_time_t v9 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _configureWatchdogWithSeconds:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!v5) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The responsePayloadOrNil parameter must not be nil."];
      }
      v10 = [v5 userAccounts];
      int v11 = +[VSJSUserAccount userAccountsFromJSUserAccounts:v10];
      v12 = [v11 firstObject];

      uint64_t v13 = [v9 currentUpdateRequest];
      [v13 setUpdatedUserAccount:v12];

      uint64_t v14 = [v9 stateMachine];
      [v14 enqueueEvent:@"Done"];
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v16 = VSErrorLogObject();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
      if (isKindOfClass)
      {
        if (v17) {
          __72__VSUserAccountUpdateManager_transitionToInvokingOnRequestCallbackState__block_invoke_2_cold_1(v6, v16);
        }
      }
      else
      {
        if (v17) {
          __72__VSUserAccountUpdateManager_transitionToInvokingOnRequestCallbackState__block_invoke_2_cold_2(v16);
        }

        id v16 = [v9 currentApp];
        [v16 setExceptionWithMessage:@"Must provide a valid ResponsePayload or Error object to onRequest callback."];
      }

      v12 = [v9 stateMachine];
      [v12 enqueueEvent:@"Error"];
    }
  }
}

- (void)transitionToStoppingAppState
{
  id v3 = [(VSUserAccountUpdateManager *)self currentApp];
  [v3 stop];

  id v4 = [(VSUserAccountUpdateManager *)self stateMachine];
  [v4 enqueueEvent:@"Done"];
}

- (void)transitionToWaitingForAppStopState
{
  id v2 = [(VSUserAccountUpdateManager *)self stateMachine];
  [v2 enqueueEvent:@"Done"];
}

- (void)transitionToNotifyingForUserAccountSetState
{
  id v5 = [(VSUserAccountUpdateManager *)self currentUpdateRequest];
  id v3 = [(VSUserAccountUpdateManager *)self delegate];
  [v3 updateManager:self updateRequestDidFinish:v5];
  id v4 = [(VSUserAccountUpdateManager *)self stateMachine];
  [v4 enqueueEvent:@"Done"];
}

- (void)transitionToNotifyingFinishState
{
  id v3 = [(VSUserAccountUpdateManager *)self delegate];
  [v3 updateManagerDidFinish:self];

  id v4 = [(VSUserAccountUpdateManager *)self stateMachine];
  [v4 enqueueEvent:@"Done"];
}

- (void)app:(id)a3 prewarmWithContext:(id)a4
{
  id v4 = [a4 objectForKeyedSubscript:@"App"];
  VSAssertWithMessage(v4 != 0, @"App object undefined");
  [v4 setObject:objc_opt_class() forKeyedSubscript:@"UserAccount"];
  [v4 setObject:objc_opt_class() forKeyedSubscript:@"AppleSubscription"];
  [v4 setObject:objc_opt_class() forKeyedSubscript:@"ResponsePayload"];
}

- (void)app:(id)a3 didFailToStartWithError:(id)a4
{
  id v5 = a4;
  id v6 = VSErrorLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[VSUserAccountUpdateManager app:didFailToStartWithError:]((uint64_t)v5, v6);
  }

  BOOL v7 = [(VSUserAccountUpdateManager *)self currentUpdateRequest];
  [v7 setUpdateError:v5];

  id v8 = [(VSUserAccountUpdateManager *)self stateMachine];
  [v8 enqueueEvent:@"Error"];
}

- (void)appDidStart:(id)a3
{
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1DA674000, v4, OS_LOG_TYPE_DEFAULT, "JS app did finish starting.", v6, 2u);
  }

  id v5 = [(VSUserAccountUpdateManager *)self stateMachine];
  [v5 enqueueEvent:@"Done"];
}

- (void)appDidStop:(id)a3
{
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1DA674000, v4, OS_LOG_TYPE_DEFAULT, "JS app did stop.", v6, 2u);
  }

  id v5 = [(VSUserAccountUpdateManager *)self stateMachine];
  [v5 enqueueEvent:@"Done"];
}

- (VSUserAccountUpdateManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VSUserAccountUpdateManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableSet)updateRequests
{
  return self->_updateRequests;
}

- (void)setUpdateRequests:(id)a3
{
}

- (NSMutableArray)updatedUserAccounts
{
  return self->_updatedUserAccounts;
}

- (void)setUpdatedUserAccounts:(id)a3
{
}

- (VSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (VSJSApp)currentApp
{
  return self->_currentApp;
}

- (void)setCurrentApp:(id)a3
{
}

- (VSUserAccountUpdateRequest)currentUpdateRequest
{
  return self->_currentUpdateRequest;
}

- (void)setCurrentUpdateRequest:(id)a3
{
}

- (OS_dispatch_source)watchdog
{
  return self->_watchdog;
}

- (void)setWatchdog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_currentUpdateRequest, 0);
  objc_storeStrong((id *)&self->_currentApp, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_updatedUserAccounts, 0);
  objc_storeStrong((id *)&self->_updateRequests, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __72__VSUserAccountUpdateManager_transitionToInvokingOnRequestCallbackState__block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 message];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Error updating user account(s): %@", (uint8_t *)&v4, 0xCu);
}

void __72__VSUserAccountUpdateManager_transitionToInvokingOnRequestCallbackState__block_invoke_2_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA674000, log, OS_LOG_TYPE_ERROR, "JS application did not provide a valid ResponsePayload or Error object in onRequest callback.", v1, 2u);
}

- (void)app:(uint64_t)a1 didFailToStartWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "JS app failed to start: %@", (uint8_t *)&v2, 0xCu);
}

@end