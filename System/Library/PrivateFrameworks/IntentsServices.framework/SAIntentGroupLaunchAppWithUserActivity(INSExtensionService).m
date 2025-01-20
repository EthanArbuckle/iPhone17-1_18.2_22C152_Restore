@interface SAIntentGroupLaunchAppWithUserActivity(INSExtensionService)
- (uint64_t)ins_analyticsBeginEventType;
- (uint64_t)ins_analyticsEndEventType;
- (uint64_t)ins_shouldUseExtendedFlowTimeout;
- (void)ins_launchAppWithConnection:()INSExtensionService userActivityIdentifier:delegate:completionHandler:;
@end

@implementation SAIntentGroupLaunchAppWithUserActivity(INSExtensionService)

- (uint64_t)ins_shouldUseExtendedFlowTimeout
{
  return 1;
}

- (uint64_t)ins_analyticsEndEventType
{
  return 623;
}

- (uint64_t)ins_analyticsBeginEventType
{
  return 622;
}

- (void)ins_launchAppWithConnection:()INSExtensionService userActivityIdentifier:delegate:completionHandler:
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [v13 _transaction];
  v15 = [v14 userActivityWithIdentifier:v12];

  v16 = (void *)MEMORY[0x263F502A0];
  v17 = [v13 intent];
  v18 = [v15 interaction];
  v19 = [v18 intentResponse];
  uint64_t v20 = [v16 shouldLaunchAppInBackgroundWithIntent:v17 intentResponse:v19];

  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  v26 = __141__SAIntentGroupLaunchAppWithUserActivity_INSExtensionService__ins_launchAppWithConnection_userActivityIdentifier_delegate_completionHandler___block_invoke;
  v27 = &unk_26427E098;
  uint64_t v28 = a1;
  id v29 = v10;
  id v21 = v10;
  v22 = [v11 completionHandlerForAppLaunchCommand:a1 withCompletion:&v24];

  v23 = objc_msgSend(v13, "appProxy", v24, v25, v26, v27, v28);

  [v23 launchAppInBackground:v20 restrictAppsToCarPlay:1 userActivityIdentifier:v12 completionHandler:v22];
}

@end