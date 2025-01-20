@interface _ASAgentPeriodicMaintenanceActivity
- (_ASAgentPeriodicMaintenanceActivity)init;
- (void)_activityDidTransitionToRunState:(id)a3;
- (void)_registerActivity;
- (void)_runActivityWithCompletionHandler:(id)a3;
@end

@implementation _ASAgentPeriodicMaintenanceActivity

- (_ASAgentPeriodicMaintenanceActivity)init
{
  v6.receiver = self;
  v6.super_class = (Class)_ASAgentPeriodicMaintenanceActivity;
  v2 = [(_ASAgentPeriodicMaintenanceActivity *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(_ASAgentPeriodicMaintenanceActivity *)v2 _registerActivity];
    v4 = v3;
  }

  return v3;
}

- (void)_registerActivity
{
  v3 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21918F000, v3, OS_LOG_TYPE_INFO, "Periodic maintenance activity checking in.", buf, 2u);
  }
  v4 = (void *)*MEMORY[0x263EF8188];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __56___ASAgentPeriodicMaintenanceActivity__registerActivity__block_invoke;
  handler[3] = &unk_264395B00;
  handler[4] = self;
  xpc_activity_register("com.apple.AuthenticationServicesCore.AuthenticationServicesAgent.PeriodicMaintenanceActivity", v4, handler);
}

- (void)_activityDidTransitionToRunState:(id)a3
{
  v4 = (_xpc_activity_s *)a3;
  v5 = (void *)os_transaction_create();
  objc_super v6 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21918F000, v6, OS_LOG_TYPE_INFO, "Periodic maintenance activity transitioned to state Run.", buf, 2u);
  }
  if (!xpc_activity_set_state(v4, 4))
  {
    v7 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_ASAgentPeriodicMaintenanceActivity _activityDidTransitionToRunState:]();
    }
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72___ASAgentPeriodicMaintenanceActivity__activityDidTransitionToRunState___block_invoke;
  v10[3] = &unk_264395B28;
  v11 = v4;
  id v12 = v5;
  id v8 = v5;
  v9 = v4;
  [(_ASAgentPeriodicMaintenanceActivity *)self _runActivityWithCompletionHandler:v10];
}

- (void)_runActivityWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v4 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73___ASAgentPeriodicMaintenanceActivity__runActivityWithCompletionHandler___block_invoke;
  block[3] = &unk_264395B50;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)_activityDidTransitionToRunState:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21918F000, v0, v1, "Periodic maintenance activity failed to transition to state Continue. Continuing, but activity may be interrupted.", v2, v3, v4, v5, v6);
}

@end