@interface ASAgentPeriodicMaintenanceActivity
@end

@implementation ASAgentPeriodicMaintenanceActivity

void __56___ASAgentPeriodicMaintenanceActivity__registerActivity__block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  if (xpc_activity_get_state(v3))
  {
    if (xpc_activity_should_defer(v3))
    {
      v4 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_21918F000, v4, OS_LOG_TYPE_INFO, "Periodic maintenance activity transitioned to state Run, but criteria are no longer satisfied. Deferring.", v6, 2u);
      }
      if (!xpc_activity_set_state(v3, 3))
      {
        v5 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          __56___ASAgentPeriodicMaintenanceActivity__registerActivity__block_invoke_cold_1();
        }
      }
    }
    else
    {
      [*(id *)(a1 + 32) _activityDidTransitionToRunState:v3];
    }
  }
}

void __72___ASAgentPeriodicMaintenanceActivity__activityDidTransitionToRunState___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
    {
      v3 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        __72___ASAgentPeriodicMaintenanceActivity__activityDidTransitionToRunState___block_invoke_cold_1();
      }
    }
    v4 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      __int16 v9 = 0;
      v5 = "Periodic maintenance activity transitioned to state Done.";
      v6 = (uint8_t *)&v9;
LABEL_14:
      _os_log_impl(&dword_21918F000, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
    }
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __72___ASAgentPeriodicMaintenanceActivity__activityDidTransitionToRunState___block_invoke_cold_3();
    }
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3))
    {
      v8 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __56___ASAgentPeriodicMaintenanceActivity__registerActivity__block_invoke_cold_1();
      }
    }
    v4 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "Periodic maintenance activity transitioned to state Defer.";
      v6 = buf;
      goto LABEL_14;
    }
  }
}

void __73___ASAgentPeriodicMaintenanceActivity__runActivityWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(ASCredentialSharingGroupsNotificationManager);
  [(ASCredentialSharingGroupsNotificationManager *)v2 notifyUserAboutSharedSavedAccountsInRecentlyDeleted:*(void *)(a1 + 32)];
  v3 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __73___ASAgentPeriodicMaintenanceActivity__runActivityWithCompletionHandler___block_invoke_cold_1();
  }
  v4 = [MEMORY[0x263F663B0] sharedStore];
  [v4 _verifyGroupsInSync];

  v5 = [MEMORY[0x263F66550] sharedFeatureManager];
  [v5 reportPasswordAutoFillProviderTelemetry];
}

void __56___ASAgentPeriodicMaintenanceActivity__registerActivity__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21918F000, v0, v1, "Periodic maintenance activity failed to transition to state Defer.", v2, v3, v4, v5, v6);
}

void __72___ASAgentPeriodicMaintenanceActivity__activityDidTransitionToRunState___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21918F000, v0, v1, "Periodic maintenance activity failed to transition to state Done.", v2, v3, v4, v5, v6);
}

void __72___ASAgentPeriodicMaintenanceActivity__activityDidTransitionToRunState___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21918F000, v0, v1, "Periodic maintenance activity failed to complete. Deferring.", v2, v3, v4, v5, v6);
}

void __73___ASAgentPeriodicMaintenanceActivity__runActivityWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21918F000, v0, v1, "Periodic maintenance activity is attempting to run group sync verification", v2, v3, v4, v5, v6);
}

@end