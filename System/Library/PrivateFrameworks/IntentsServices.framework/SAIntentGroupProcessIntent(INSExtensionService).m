@interface SAIntentGroupProcessIntent(INSExtensionService)
- (uint64_t)ins_analyticsBeginEventType;
- (uint64_t)ins_analyticsEndEventType;
- (uint64_t)ins_shouldUseExtendedFlowTimeout;
- (void)_confirmIntentWithExtensionProxy:()INSExtensionService onQueue:processIntentCompleted:completionHandler:;
- (void)_handleIntentWithExtensionProxy:()INSExtensionService onQueue:processIntentCompleted:completionHandler:;
- (void)_resolveIntentSlotsWithExtensionProxy:()INSExtensionService onQueue:processIntentCompleted:completionHandler:;
- (void)ins_sendIntent:()INSExtensionService toExtensionProxy:onQueue:completionHandler:;
@end

@implementation SAIntentGroupProcessIntent(INSExtensionService)

- (uint64_t)ins_shouldUseExtendedFlowTimeout
{
  return 1;
}

- (uint64_t)ins_analyticsEndEventType
{
  return 631;
}

- (uint64_t)ins_analyticsBeginEventType
{
  return 630;
}

- (void)_handleIntentWithExtensionProxy:()INSExtensionService onQueue:processIntentCompleted:completionHandler:
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[INSAnalytics sharedAnalytics];
  v15 = objc_msgSend(a1, "ins_afAnalyticsContext");
  [v14 logEventWithType:640 context:v15 contextNoCopy:1];

  [v12 setLastAttemptedStep:*MEMORY[0x263F658F0]];
  v16 = (void *)*MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
  {
    v17 = v16;
    v18 = [v10 _connection];
    v19 = [v18 intent];
    *(_DWORD *)buf = 136315394;
    v29 = "-[SAIntentGroupProcessIntent(INSExtensionService) _handleIntentWithExtensionProxy:onQueue:processIntentComplet"
          "ed:completionHandler:]";
    __int16 v30 = 2112;
    v31 = v19;
    _os_log_impl(&dword_2163DF000, v17, OS_LOG_TYPE_INFO, "%s Beginning HandleIntent with intent %@", buf, 0x16u);
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __132__SAIntentGroupProcessIntent_INSExtensionService___handleIntentWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke;
  v23[3] = &unk_26427DF90;
  id v24 = v11;
  v25 = a1;
  id v26 = v12;
  id v27 = v13;
  id v20 = v13;
  id v21 = v12;
  id v22 = v11;
  [v10 handleIntentWithCompletionHandler:v23];
}

- (void)_confirmIntentWithExtensionProxy:()INSExtensionService onQueue:processIntentCompleted:completionHandler:
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[INSAnalytics sharedAnalytics];
  v15 = objc_msgSend(a1, "ins_afAnalyticsContext");
  [v14 logEventWithType:638 context:v15 contextNoCopy:1];

  [v12 setLastAttemptedStep:*MEMORY[0x263F658E8]];
  v16 = (void *)*MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
  {
    v17 = v16;
    v18 = [v10 _connection];
    v19 = [v18 intent];
    id v20 = [v19 typeName];
    *(_DWORD *)buf = 136315394;
    uint64_t v32 = "-[SAIntentGroupProcessIntent(INSExtensionService) _confirmIntentWithExtensionProxy:onQueue:processIntentComple"
          "ted:completionHandler:]";
    __int16 v33 = 2112;
    v34 = v20;
    _os_log_impl(&dword_2163DF000, v17, OS_LOG_TYPE_INFO, "%s Beginning ConfirmIntent with intent %@", buf, 0x16u);
  }
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __133__SAIntentGroupProcessIntent_INSExtensionService___confirmIntentWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke;
  v25[3] = &unk_26427DF68;
  id v26 = v11;
  id v27 = a1;
  id v28 = v12;
  id v29 = v10;
  id v30 = v13;
  id v21 = v13;
  id v22 = v10;
  id v23 = v12;
  id v24 = v11;
  [v22 confirmIntentWithCompletionHandler:v25];
}

- (void)_resolveIntentSlotsWithExtensionProxy:()INSExtensionService onQueue:processIntentCompleted:completionHandler:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[INSAnalytics sharedAnalytics];
  v15 = objc_msgSend(a1, "ins_afAnalyticsContext");
  [v14 logEventWithType:636 context:v15 contextNoCopy:1];

  [v12 setLastAttemptedStep:*MEMORY[0x263F658F8]];
  v16 = [a1 intentSlotKeyPaths];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __138__SAIntentGroupProcessIntent_INSExtensionService___resolveIntentSlotsWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke;
  v21[3] = &unk_26427DF40;
  v21[4] = a1;
  id v22 = v11;
  id v23 = v12;
  id v24 = v10;
  id v25 = v13;
  id v17 = v13;
  id v18 = v10;
  id v19 = v12;
  id v20 = v11;
  [v18 resolveIntentSlotKeyPaths:v16 completionHandler:v21];
}

- (void)ins_sendIntent:()INSExtensionService toExtensionProxy:onQueue:completionHandler:
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (os_log_t *)MEMORY[0x263F0F810];
  v15 = (void *)*MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
  {
    v16 = v15;
    id v17 = [a1 intentSlotKeyPaths];
    *(_DWORD *)buf = 136315394;
    __int16 v33 = "-[SAIntentGroupProcessIntent(INSExtensionService) ins_sendIntent:toExtensionProxy:onQueue:completionHandler:]";
    __int16 v34 = 2112;
    uint64_t v35 = v17;
    _os_log_impl(&dword_2163DF000, v16, OS_LOG_TYPE_INFO, "%s intentSlotKeyPaths = %@", buf, 0x16u);
  }
  id v18 = +[INSAnalytics sharedAnalytics];
  id v19 = objc_msgSend(a1, "ins_afAnalyticsContext");
  [v18 logEventWithType:632 context:v19 contextNoCopy:1];

  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __109__SAIntentGroupProcessIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke;
  v31[3] = &unk_26427E370;
  v31[4] = a1;
  [v11 setResponseHandler:v31];
  id v20 = objc_alloc_init(MEMORY[0x263F649F0]);
  id v21 = [a1 aceId];
  [v20 setRefId:v21];

  os_log_t v22 = *v14;
  if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
  {
    id v23 = v22;
    id v24 = [v10 typeName];
    *(_DWORD *)buf = 136315394;
    __int16 v33 = "-[SAIntentGroupProcessIntent(INSExtensionService) ins_sendIntent:toExtensionProxy:onQueue:completionHandler:]";
    __int16 v34 = 2112;
    uint64_t v35 = v24;
    _os_log_impl(&dword_2163DF000, v23, OS_LOG_TYPE_INFO, "%s Beginning BatchSlotResolution with intent %@", buf, 0x16u);
  }
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __109__SAIntentGroupProcessIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_3;
  v27[3] = &unk_26427DEF0;
  id v29 = a1;
  id v30 = v13;
  id v28 = v20;
  id v25 = v20;
  id v26 = v13;
  [a1 _resolveIntentSlotsWithExtensionProxy:v11 onQueue:v12 processIntentCompleted:v25 completionHandler:v27];
}

@end