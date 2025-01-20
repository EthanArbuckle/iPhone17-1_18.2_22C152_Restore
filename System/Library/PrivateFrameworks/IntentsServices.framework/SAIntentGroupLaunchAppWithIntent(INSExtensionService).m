@interface SAIntentGroupLaunchAppWithIntent(INSExtensionService)
- (uint64_t)ins_analyticsBeginEventType;
- (uint64_t)ins_analyticsEndEventType;
- (void)ins_launchAppWithConnection:()INSExtensionService delegate:completionHandler:;
@end

@implementation SAIntentGroupLaunchAppWithIntent(INSExtensionService)

- (uint64_t)ins_analyticsEndEventType
{
  return 621;
}

- (uint64_t)ins_analyticsBeginEventType
{
  return 620;
}

- (void)ins_launchAppWithConnection:()INSExtensionService delegate:completionHandler:
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = *MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v45 = "-[SAIntentGroupLaunchAppWithIntent(INSExtensionService) ins_launchAppWithConnection:delegate:completionHandler:]";
    __int16 v46 = 2112;
    id v47 = v8;
    _os_log_impl(&dword_2163DF000, v11, OS_LOG_TYPE_INFO, "%s ins_launchAppWithConnection: %@", buf, 0x16u);
  }
  v12 = [v8 _transaction];
  v13 = [v12 currentUserActivity];

  if (!v13)
  {
    v14 = objc_msgSend(a1, "ins_aceIntentResponse");
    v15 = v14;
    if (v14)
    {
      v16 = [v14 userActivity];

      id v17 = objc_alloc(MEMORY[0x263F018D0]);
      if (v16)
      {
        v18 = [v15 userActivity];
        v19 = [v18 activityType];
        v13 = (void *)[v17 initWithActivityType:v19];
      }
      else
      {
        v18 = [v8 intent];
        v13 = (void *)[v17 _initWithIntent:v18];
      }

      id v20 = objc_alloc(MEMORY[0x263F0FBD8]);
      v21 = [v8 intent];
      v22 = (void *)[v20 initWithIntent:v21 response:v15];

      [v22 setIntentHandlingStatus:3];
      [v13 _setInteraction:v22 donate:0];
      v23 = [v8 _transaction];
      id v24 = objc_alloc(MEMORY[0x263F502B0]);
      v25 = [v8 intent];
      v26 = (void *)[v24 initWithType:5 intent:v25 intentResponse:v15 userActivities:0];
      [v23 setState:v26];
    }
    else
    {
      v13 = 0;
    }
  }
  v27 = (void *)MEMORY[0x263F502A0];
  v28 = [v8 intent];
  v29 = [v13 interaction];
  v30 = [v29 intentResponse];
  uint64_t v31 = [v27 shouldLaunchAppInBackgroundWithIntent:v28 intentResponse:v30];

  uint64_t v38 = MEMORY[0x263EF8330];
  uint64_t v39 = 3221225472;
  v40 = __112__SAIntentGroupLaunchAppWithIntent_INSExtensionService__ins_launchAppWithConnection_delegate_completionHandler___block_invoke;
  v41 = &unk_26427E098;
  v42 = a1;
  id v32 = v10;
  id v43 = v32;
  v33 = [v9 completionHandlerForAppLaunchCommand:a1 withCompletion:&v38];
  v34 = (void *)*MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
  {
    v35 = v34;
    int v36 = objc_msgSend(a1, "doNotDismissSiri", v38, v39, v40, v41, v42);
    *(_DWORD *)buf = 136315394;
    v45 = "-[SAIntentGroupLaunchAppWithIntent(INSExtensionService) ins_launchAppWithConnection:delegate:completionHandler:]";
    __int16 v46 = 1024;
    LODWORD(v47) = v36;
    _os_log_impl(&dword_2163DF000, v35, OS_LOG_TYPE_INFO, "%s donotdismiss: %d", buf, 0x12u);
  }
  v37 = objc_msgSend(v8, "appProxy", v38, v39, v40, v41, v42);
  objc_msgSend(v37, "launchAppInBackground:restrictAppsToCarPlay:userActivityIdentifier:retainsSiri:completionHandler:", v31, 1, 0, objc_msgSend(a1, "doNotDismissSiri"), v33);
}

@end