@interface MRUAnalytics
+ (void)sendEvent:(id)a3 withError:(id)a4 payload:(id)a5;
@end

@implementation MRUAnalytics

+ (void)sendEvent:(id)a3 withError:(id)a4 payload:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (sendEvent_withError_payload__once != -1) {
    dispatch_once(&sendEvent_withError_payload__once, &__block_literal_global_16);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__MRUAnalytics_sendEvent_withError_payload___block_invoke_2;
  aBlock[3] = &unk_1E5F0E688;
  id v20 = v8;
  id v21 = v9;
  id v10 = v8;
  id v11 = v9;
  v12 = _Block_copy(aBlock);
  v13 = sendEvent_withError_payload____analyticsQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __44__MRUAnalytics_sendEvent_withError_payload___block_invoke_3;
  v16[3] = &unk_1E5F0DFB8;
  id v17 = v7;
  id v18 = v12;
  id v14 = v7;
  id v15 = v12;
  dispatch_async(v13, v16);
}

void __44__MRUAnalytics_sendEvent_withError_payload___block_invoke()
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.mediacontrols.MRUAnalytics", v0);
  v2 = (void *)sendEvent_withError_payload____analyticsQueue;
  sendEvent_withError_payload____analyticsQueue = (uint64_t)v1;
}

id __44__MRUAnalytics_sendEvent_withError_payload___block_invoke_2(uint64_t a1)
{
  v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v3 = (void *)[v2 mutableCopy];

  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "code"));
    [v3 setObject:v5 forKeyedSubscript:@"errorCode"];

    v6 = [*(id *)(a1 + 32) domain];
    [v3 setObject:v6 forKeyedSubscript:@"errorDomain"];
  }

  return v3;
}

void __44__MRUAnalytics_sendEvent_withError_payload___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (MSVDeviceOSIsInternalInstall())
  {
    v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    v3 = _MRLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v8 = v4;
      __int16 v9 = 2112;
      id v10 = v2;
      _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, "Logging to CoreAnalytics: %@\n%@", buf, 0x16u);
    }

    v6 = v2;
    id v5 = v2;
    AnalyticsSendEventLazy();
  }
  else
  {
    AnalyticsSendEventLazy();
  }
}

id __44__MRUAnalytics_sendEvent_withError_payload___block_invoke_19(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end