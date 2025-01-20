@interface SAIntentGroupResolveIntentSlot(INSExtensionService)
- (uint64_t)ins_analyticsBeginEventType;
- (uint64_t)ins_analyticsEndEventType;
- (uint64_t)ins_shouldUseExtendedFlowTimeout;
- (void)ins_sendIntent:()INSExtensionService toExtensionProxy:onQueue:completionHandler:;
@end

@implementation SAIntentGroupResolveIntentSlot(INSExtensionService)

- (uint64_t)ins_shouldUseExtendedFlowTimeout
{
  return 1;
}

- (uint64_t)ins_analyticsEndEventType
{
  return 609;
}

- (uint64_t)ins_analyticsBeginEventType
{
  return 606;
}

- (void)ins_sendIntent:()INSExtensionService toExtensionProxy:onQueue:completionHandler:
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (NSObject **)MEMORY[0x263F0F810];
  v15 = *MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
  {
    v16 = v15;
    v17 = [v10 backingStore];
    *(_DWORD *)buf = 136315394;
    v35 = "-[SAIntentGroupResolveIntentSlot(INSExtensionService) ins_sendIntent:toExtensionProxy:onQueue:completionHandler:]";
    __int16 v36 = 2112;
    v37 = v17;
    _os_log_impl(&dword_2163DF000, v16, OS_LOG_TYPE_INFO, "%s intent.backingStore = %@", buf, 0x16u);

    v15 = *v14;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v18 = v15;
    v19 = [a1 intentSlotKeyPath];
    *(_DWORD *)buf = 136315394;
    v35 = "-[SAIntentGroupResolveIntentSlot(INSExtensionService) ins_sendIntent:toExtensionProxy:onQueue:completionHandler:]";
    __int16 v36 = 2112;
    v37 = v19;
    _os_log_impl(&dword_2163DF000, v18, OS_LOG_TYPE_INFO, "%s intentSlotKeyPath = %@", buf, 0x16u);
  }
  v20 = +[INSAnalytics sharedAnalytics];
  v21 = objc_msgSend(a1, "ins_afAnalyticsContext");
  [v20 logEventWithType:607 context:v21 contextNoCopy:1];

  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __113__SAIntentGroupResolveIntentSlot_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke;
  v33[3] = &unk_26427E370;
  v33[4] = a1;
  [v11 setResponseHandler:v33];
  v22 = [a1 intentSlotKeyPath];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __113__SAIntentGroupResolveIntentSlot_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_2;
  v27[3] = &unk_26427E048;
  id v28 = v12;
  v29 = a1;
  id v30 = v10;
  id v31 = v22;
  id v32 = v13;
  id v23 = v13;
  id v24 = v22;
  id v25 = v10;
  id v26 = v12;
  [v11 resolveIntentSlotKeyPath:v24 completionHandler:v27];
}

@end