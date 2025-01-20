@interface COStatusBar
- (BOOL)didRequestTeardownOnce;
- (BOOL)showStopConditionAlert;
- (BOOL)statusBarCoordinator:(id)a3 receivedTapWithContext:(id)a4 completionBlock:(id)a5;
- (COStatusBar)initWithConditionClass:(id)a3 profile:(id)a4 teardownBeganCb:(id)a5 teardownCompleteCb:(id)a6;
- (NSString)conditionClass;
- (NSString)profileDescription;
- (SBSStatusBarStyleOverridesAssertion)statusBarAssertion;
- (SBSStatusBarStyleOverridesCoordinator)coordinator;
- (__CFUserNotification)userNotificationStopCondition;
- (id)doTeardownOnStop;
- (id)getDeviceType;
- (id)terminationBeganCallback;
- (id)terminationNotifyCallback;
- (void)acquireStatusBarWithCompletionHandler:(id)a3;
- (void)clearStatusBar;
- (void)dealloc;
- (void)setConditionClass:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setDidRequestTeardownOnce:(BOOL)a3;
- (void)setProfileDescription:(id)a3;
- (void)setStatusBarAssertion:(id)a3;
- (void)setTerminationBeganCallback:(id)a3;
- (void)setTerminationNotifyCallback:(id)a3;
- (void)setUserNotificationStopCondition:(__CFUserNotification *)a3;
- (void)showConditionIsTearingDownAlert;
- (void)showStopConditionAlert;
- (void)statusBarCoordinator:(id)a3 invalidatedRegistrationWithError:(id)a4;
@end

@implementation COStatusBar

- (COStatusBar)initWithConditionClass:(id)a3 profile:(id)a4 teardownBeganCb:(id)a5 teardownCompleteCb:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)COStatusBar;
  v15 = [(COStatusBar *)&v26 init];
  if (v15)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Creating statusbar assertion for ConditionInducer", v25, 2u);
    }
    objc_storeStrong((id *)&v15->_conditionClass, a3);
    objc_storeStrong((id *)&v15->_profileDescription, a4);
    uint64_t v16 = MEMORY[0x230F76E70](v13);
    id terminationBeganCallback = v15->_terminationBeganCallback;
    v15->_id terminationBeganCallback = (id)v16;

    uint64_t v18 = MEMORY[0x230F76E70](v14);
    id terminationNotifyCallback = v15->_terminationNotifyCallback;
    v15->_id terminationNotifyCallback = (id)v18;

    uint64_t v20 = [MEMORY[0x263F79468] assertionWithStatusBarStyleOverrides:0x80000 forPID:getpid() exclusive:1 showsWhenForeground:1];
    statusBarAssertion = v15->_statusBarAssertion;
    v15->_statusBarAssertion = (SBSStatusBarStyleOverridesAssertion *)v20;

    v22 = (SBSStatusBarStyleOverridesCoordinator *)objc_alloc_init(MEMORY[0x263F79470]);
    coordinator = v15->_coordinator;
    v15->_coordinator = v22;

    [(SBSStatusBarStyleOverridesCoordinator *)v15->_coordinator setDelegate:v15];
    [(SBSStatusBarStyleOverridesCoordinator *)v15->_coordinator setRegisteredStyleOverrides:0x80000 reply:&__block_literal_global_0];
    [(COStatusBar *)v15 acquireStatusBarWithCompletionHandler:&__block_literal_global_5];
  }

  return v15;
}

void __81__COStatusBar_initWithConditionClass_profile_teardownBeganCb_teardownCompleteCb___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __81__COStatusBar_initWithConditionClass_profile_teardownBeganCb_teardownCompleteCb___block_invoke_cold_1((uint64_t)v2);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Registered status bar assertion", v3, 2u);
  }
}

void __81__COStatusBar_initWithConditionClass_profile_teardownBeganCb_teardownCompleteCb___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __81__COStatusBar_initWithConditionClass_profile_teardownBeganCb_teardownCompleteCb___block_invoke_2_cold_1();
  }
}

- (void)acquireStatusBarWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = dispatch_get_global_queue(25, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__COStatusBar_acquireStatusBarWithCompletionHandler___block_invoke;
  v7[3] = &unk_264935CC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __53__COStatusBar_acquireStatusBarWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) statusBarAssertion];
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__COStatusBar_acquireStatusBarWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_264935CA0;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  [v2 acquireWithHandler:v3 invalidationHandler:v4];

  objc_destroyWeak(&v5);
}

void __53__COStatusBar_acquireStatusBarWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained clearStatusBar];
}

- (void)clearStatusBar
{
  uint64_t v3 = [(COStatusBar *)self statusBarAssertion];
  [v3 invalidate];

  [(COStatusBar *)self setStatusBarAssertion:0];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Released status bar assertion for ConditionInducer", v4, 2u);
  }
}

- (void)dealloc
{
  [(COStatusBar *)self clearStatusBar];
  v3.receiver = self;
  v3.super_class = (Class)COStatusBar;
  [(COStatusBar *)&v3 dealloc];
}

- (id)getDeviceType
{
  id v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)doTeardownOnStop
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v20 = v2;
  BOOL v3 = +[COConditionSession tearDownAllConditionsWithErrors:&v20];
  id v4 = v20;

  if (!v3)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = [v4 allKeys];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v25 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v17;
      v10 = &_os_log_internal;
      *(void *)&long long v7 = 138412546;
      long long v15 = v7;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          id v13 = objc_msgSend(v4, "objectForKey:", v12, v15);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v15;
            uint64_t v22 = v12;
            __int16 v23 = 2112;
            v24 = v13;
            _os_log_error_impl(&dword_22CE75000, v10, OS_LOG_TYPE_ERROR, "From the status bar, error while tearing down %@: %@", buf, 0x16u);
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v25 count:16];
      }
      while (v8);
    }
  }

  return v4;
}

- (BOOL)showStopConditionAlert
{
  v24[4] = *MEMORY[0x263EF8340];
  BOOL v3 = NSString;
  id v4 = [(COStatusBar *)self conditionClass];
  id v5 = [v3 stringWithFormat:@"%@ Condition Active", v4];

  uint64_t v6 = NSString;
  long long v7 = [(COStatusBar *)self profileDescription];
  uint64_t v8 = [(COStatusBar *)self getDeviceType];
  uint64_t v9 = [v6 stringWithFormat:@"\"%@\" is active on this %@. Stop running this condition?", v7, v8];

  uint64_t v10 = *MEMORY[0x263EFFFD8];
  v23[0] = *MEMORY[0x263EFFFC8];
  v23[1] = v10;
  v24[0] = v5;
  v24[1] = v9;
  uint64_t v11 = *MEMORY[0x263F00000];
  v23[2] = *MEMORY[0x263F00020];
  v23[3] = v11;
  v24[2] = @"Cancel";
  v24[3] = @"Stop";
  CFDictionaryRef v12 = (const __CFDictionary *)[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
  self->_userNotificationStopCondition = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, 0, 0, v12);
  id v13 = [(COStatusBar *)self userNotificationStopCondition];
  if (v13)
  {
    CFOptionFlags responseFlags = 0;
    CFUserNotificationReceiveResponse(self->_userNotificationStopCondition, 0.0, &responseFlags);
    switch(responseFlags)
    {
      case 3uLL:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
          -[COStatusBar showStopConditionAlert]();
        }
        break;
      case 2uLL:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Continuing with the condition...", buf, 2u);
        }
        break;
      case 0uLL:
        [(COStatusBar *)self setDidRequestTeardownOnce:1];
        id v14 = [(COStatusBar *)self terminationBeganCallback];

        if (v14)
        {
          long long v15 = [(COStatusBar *)self terminationBeganCallback];
          v15[2]();
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "We got a request, to terminate, but there's no termination began callback set", buf, 2u);
        }
        long long v16 = [(COStatusBar *)self doTeardownOnStop];
        long long v17 = [(COStatusBar *)self terminationNotifyCallback];

        BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
        if (v17)
        {
          if (v18)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Invoking termination callback...", buf, 2u);
          }
          long long v19 = [(COStatusBar *)self terminationNotifyCallback];
          ((void (**)(void, void *))v19)[2](v19, v16);
        }
        else if (v18)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "We got a request, to terminate, but there's no termination complete callback set", buf, 2u);
        }

        break;
    }
    CFRelease(self->_userNotificationStopCondition);
    self->_userNotificationStopCondition = 0;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    -[COStatusBar showStopConditionAlert]();
  }

  return v13 != 0;
}

- (void)showConditionIsTearingDownAlert
{
  BOOL v3 = NSString;
  id v4 = [(COStatusBar *)self conditionClass];
  alertHeader = [v3 stringWithFormat:@"%@ Condition Stopping", v4];

  id v5 = NSString;
  uint64_t v6 = [(COStatusBar *)self profileDescription];
  long long v7 = [v5 stringWithFormat:@"\"%@\" may take a few moments to turn off.", v6];

  CFUserNotificationDisplayNotice(0.0, 2uLL, 0, 0, 0, alertHeader, v7, @"OK");
}

- (BOOL)statusBarCoordinator:(id)a3 receivedTapWithContext:(id)a4 completionBlock:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = self;
    __int16 v14 = 1024;
    BOOL v15 = [(COStatusBar *)self didRequestTeardownOnce];
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Received a tap on the status bar coordinator! Showing popup... %@, %d", (uint8_t *)&v12, 0x12u);
  }
  if ([(COStatusBar *)self didRequestTeardownOnce]) {
    [(COStatusBar *)self showConditionIsTearingDownAlert];
  }
  else {
    [(COStatusBar *)self showStopConditionAlert];
  }
  v10[2](v10);

  return 1;
}

- (void)statusBarCoordinator:(id)a3 invalidatedRegistrationWithError:(id)a4
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "statusBarCoordinator:invalidatedRegistrationWithError:", v4, 2u);
  }
}

- (id)terminationNotifyCallback
{
  return self->_terminationNotifyCallback;
}

- (void)setTerminationNotifyCallback:(id)a3
{
}

- (id)terminationBeganCallback
{
  return self->_terminationBeganCallback;
}

- (void)setTerminationBeganCallback:(id)a3
{
}

- (SBSStatusBarStyleOverridesAssertion)statusBarAssertion
{
  return self->_statusBarAssertion;
}

- (void)setStatusBarAssertion:(id)a3
{
}

- (SBSStatusBarStyleOverridesCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (__CFUserNotification)userNotificationStopCondition
{
  return self->_userNotificationStopCondition;
}

- (void)setUserNotificationStopCondition:(__CFUserNotification *)a3
{
  self->_userNotificationStopCondition = a3;
}

- (NSString)conditionClass
{
  return self->_conditionClass;
}

- (void)setConditionClass:(id)a3
{
}

- (NSString)profileDescription
{
  return self->_profileDescription;
}

- (void)setProfileDescription:(id)a3
{
}

- (BOOL)didRequestTeardownOnce
{
  return self->_didRequestTeardownOnce;
}

- (void)setDidRequestTeardownOnce:(BOOL)a3
{
  self->_didRequestTeardownOnce = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileDescription, 0);
  objc_storeStrong((id *)&self->_conditionClass, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong(&self->_terminationBeganCallback, 0);

  objc_storeStrong(&self->_terminationNotifyCallback, 0);
}

void __81__COStatusBar_initWithConditionClass_profile_teardownBeganCb_teardownCompleteCb___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error registering status bar assertion: %@", (uint8_t *)&v1, 0xCu);
}

void __81__COStatusBar_initWithConditionClass_profile_teardownBeganCb_teardownCompleteCb___block_invoke_2_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to acquire status bar assertion for ConditionInducer", v0, 2u);
}

- (void)showStopConditionAlert
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Unable to show status bar alert for condition!", v0, 2u);
}

@end