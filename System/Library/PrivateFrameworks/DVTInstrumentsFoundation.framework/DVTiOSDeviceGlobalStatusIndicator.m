@interface DVTiOSDeviceGlobalStatusIndicator
- (BOOL)_showStopConditionAlert;
- (BOOL)statusBarCoordinator:(id)a3 receivedTapWithContext:(id)a4 completionBlock:(id)a5;
- (DVTDeviceGlobalStatusIndicatorConfiguration)configuration;
- (DVTiOSDeviceGlobalStatusIndicator)initWithConfiguration:(id)a3 stoppedByUserBlock:(id)a4;
- (SBSStatusBarStyleOverridesAssertion)statusBarAssertion;
- (SBSStatusBarStyleOverridesCoordinator)coordinator;
- (__CFUserNotification)userNotificationStopCondition;
- (id)stoppedByUserBlock;
- (void)acquireStatusBarWithCompletionHandler:(id)a3;
- (void)activateWithCompletionBlock:(id)a3;
- (void)clearStatusBar;
- (void)setConfiguration:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setStatusBarAssertion:(id)a3;
- (void)setStoppedByUserBlock:(id)a3;
- (void)setUserNotificationStopCondition:(__CFUserNotification *)a3;
- (void)statusBarCoordinator:(id)a3 invalidatedRegistrationWithError:(id)a4;
@end

@implementation DVTiOSDeviceGlobalStatusIndicator

- (DVTiOSDeviceGlobalStatusIndicator)initWithConfiguration:(id)a3 stoppedByUserBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DVTiOSDeviceGlobalStatusIndicator;
  v9 = [(DVTiOSDeviceGlobalStatusIndicator *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    v11 = _Block_copy(v8);
    id stoppedByUserBlock = v10->_stoppedByUserBlock;
    v10->_id stoppedByUserBlock = v11;

    os_log_t v13 = os_log_create("com.apple.dt.DVTInstrumentsFoundation", "DeviceStatusIndicator");
    statusIndicatorLog = v10->_statusIndicatorLog;
    v10->_statusIndicatorLog = (OS_os_log *)v13;
  }
  return v10;
}

- (void)activateWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F79468] assertionWithStatusBarStyleOverrides:0x80000 forPID:getpid() exclusive:1 showsWhenForeground:1];
  statusBarAssertion = self->_statusBarAssertion;
  self->_statusBarAssertion = v5;

  id v7 = [(DVTiOSDeviceGlobalStatusIndicator *)self configuration];
  id v8 = [v7 title];
  [(SBSStatusBarStyleOverridesAssertion *)self->_statusBarAssertion setStatusString:v8];

  v9 = (SBSStatusBarStyleOverridesCoordinator *)objc_alloc_init(MEMORY[0x263F79470]);
  coordinator = self->_coordinator;
  self->_coordinator = v9;

  [(SBSStatusBarStyleOverridesCoordinator *)self->_coordinator setDelegate:self];
  objc_initWeak(&location, self);
  v11 = self->_coordinator;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_2308C9C30;
  v16[3] = &unk_264B8F210;
  objc_copyWeak(&v17, &location);
  [(SBSStatusBarStyleOverridesCoordinator *)v11 setRegisteredStyleOverrides:0x80000 reply:v16];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_2308C9C9C;
  v13[3] = &unk_264B8F238;
  objc_copyWeak(&v15, &location);
  id v12 = v4;
  id v14 = v12;
  [(DVTiOSDeviceGlobalStatusIndicator *)self acquireStatusBarWithCompletionHandler:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)acquireStatusBarWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = dispatch_get_global_queue(25, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2308C9DFC;
  v7[3] = &unk_264B8F260;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)clearStatusBar
{
  v3 = [(DVTiOSDeviceGlobalStatusIndicator *)self statusBarAssertion];
  [v3 invalidate];

  [(DVTiOSDeviceGlobalStatusIndicator *)self setStatusBarAssertion:0];
  userNotificationStopCondition = self->_userNotificationStopCondition;
  if (userNotificationStopCondition)
  {
    CFUserNotificationCancel(userNotificationStopCondition);
  }
}

- (BOOL)_showStopConditionAlert
{
  v15[4] = *MEMORY[0x263EF8340];
  v14[0] = *MEMORY[0x263EFFFC8];
  v3 = [(DVTiOSDeviceGlobalStatusIndicator *)self configuration];
  id v4 = [v3 title];
  v15[0] = v4;
  v14[1] = *MEMORY[0x263EFFFD8];
  v5 = [(DVTiOSDeviceGlobalStatusIndicator *)self configuration];
  id v6 = [v5 informationText];
  uint64_t v7 = *MEMORY[0x263F00020];
  v15[1] = v6;
  v15[2] = @"Continue Recording";
  uint64_t v8 = *MEMORY[0x263F00000];
  v14[2] = v7;
  v14[3] = v8;
  v15[3] = @"Stop Recording";
  CFDictionaryRef v9 = (const __CFDictionary *)[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];

  self->_userNotificationStopCondition = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, 0, 0, v9);
  v10 = [(DVTiOSDeviceGlobalStatusIndicator *)self userNotificationStopCondition];
  if (v10)
  {
    CFOptionFlags v13 = 0;
    CFUserNotificationReceiveResponse(self->_userNotificationStopCondition, 0.0, &v13);
    if (!v13)
    {
      v11 = [(DVTiOSDeviceGlobalStatusIndicator *)self stoppedByUserBlock];
      v11[2]();

      [(DVTiOSDeviceGlobalStatusIndicator *)self clearStatusBar];
    }
    CFRelease(self->_userNotificationStopCondition);
    self->_userNotificationStopCondition = 0;
  }
  return v10 != 0;
}

- (BOOL)statusBarCoordinator:(id)a3 receivedTapWithContext:(id)a4 completionBlock:(id)a5
{
  id v6 = (void (**)(void))a5;
  [(DVTiOSDeviceGlobalStatusIndicator *)self _showStopConditionAlert];
  v6[2](v6);

  return 1;
}

- (void)statusBarCoordinator:(id)a3 invalidatedRegistrationWithError:(id)a4
{
  statusIndicatorLog = self->_statusIndicatorLog;
  if (os_log_type_enabled(statusIndicatorLog, OS_LOG_TYPE_ERROR)) {
    sub_23093DA48(statusIndicatorLog, a4);
  }
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

- (DVTDeviceGlobalStatusIndicatorConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (id)stoppedByUserBlock
{
  return self->_stoppedByUserBlock;
}

- (void)setStoppedByUserBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stoppedByUserBlock, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong((id *)&self->_statusIndicatorLog, 0);
}

@end