@interface SAIntentGroupHandleIntent(INSExtensionService)
- (uint64_t)ins_analyticsBeginEventType;
- (uint64_t)ins_analyticsEndEventType;
- (uint64_t)ins_shouldUseExtendedFlowTimeout;
- (void)ins_sendIntent:()INSExtensionService toExtensionProxy:onQueue:completionHandler:;
@end

@implementation SAIntentGroupHandleIntent(INSExtensionService)

- (uint64_t)ins_shouldUseExtendedFlowTimeout
{
  return 1;
}

- (uint64_t)ins_analyticsEndEventType
{
  return 619;
}

- (uint64_t)ins_analyticsBeginEventType
{
  return 615;
}

- (void)ins_sendIntent:()INSExtensionService toExtensionProxy:onQueue:completionHandler:
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)*MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    v15 = [a3 backingStore];
    *(_DWORD *)buf = 136315394;
    v26 = "-[SAIntentGroupHandleIntent(INSExtensionService) ins_sendIntent:toExtensionProxy:onQueue:completionHandler:]";
    __int16 v27 = 2112;
    v28 = v15;
    _os_log_impl(&dword_2163DF000, v14, OS_LOG_TYPE_INFO, "%s intent.backingStore = %@", buf, 0x16u);
  }
  v16 = +[INSAnalytics sharedAnalytics];
  v17 = objc_msgSend(a1, "ins_afAnalyticsContext");
  [v16 logEventWithType:616 context:v17 contextNoCopy:1];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __108__SAIntentGroupHandleIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke;
  v24[3] = &unk_26427E370;
  v24[4] = a1;
  [v10 setResponseHandler:v24];
  [v10 setImageProcessingHandler:&__block_literal_global_383];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __108__SAIntentGroupHandleIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_4;
  v20[3] = &unk_26427E408;
  id v21 = v11;
  v22 = a1;
  id v23 = v12;
  id v18 = v12;
  id v19 = v11;
  [v10 handleIntentWithCompletionHandler:v20];
}

@end