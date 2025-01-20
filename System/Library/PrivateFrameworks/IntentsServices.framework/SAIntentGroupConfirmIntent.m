@interface SAIntentGroupConfirmIntent
@end

@implementation SAIntentGroupConfirmIntent

void __109__SAIntentGroupConfirmIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v3 = +[INSAnalytics sharedAnalytics];
  v2 = objc_msgSend(*(id *)(a1 + 32), "ins_afAnalyticsContext");
  [v3 logEventWithType:612 context:v2 contextNoCopy:1];
}

void __109__SAIntentGroupConfirmIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __109__SAIntentGroupConfirmIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_3;
  block[3] = &unk_26427DFD0;
  v5 = a1[4];
  uint64_t v4 = a1[5];
  v6 = (void *)a1[6];
  id v9 = v3;
  uint64_t v10 = v4;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __109__SAIntentGroupConfirmIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = (void *)*MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    v5 = [v3 backingStore];
    *(_DWORD *)buf = 136315394;
    v20 = "-[SAIntentGroupConfirmIntent(INSExtensionService) ins_sendIntent:toExtensionProxy:onQueue:completionHandler:]_block_invoke_3";
    __int16 v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_2163DF000, v4, OS_LOG_TYPE_INFO, "%s intentResponse.backingStore = %@", buf, 0x16u);
  }
  id v6 = objc_alloc_init(MEMORY[0x263F64990]);
  id v7 = [*(id *)(a1 + 40) aceId];
  [v6 setRefId:v7];

  if (objc_msgSend(*(id *)(a1 + 40), "ins_isJSONPayload"))
  {
    INSJSONEncodedIntentResponse(*(void **)(a1 + 32));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v6 setJsonEncodedIntentResponse:v8];
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x263F649F8]);
    id v9 = [*(id *)(a1 + 32) _payloadResponseTypeName];
    [v8 setTypeName:v9];

    uint64_t v10 = [*(id *)(a1 + 32) backingStore];
    id v11 = [v10 data];
    [v8 setData:v11];

    [v6 setIntentResponse:v8];
  }

  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, id, void))(v12 + 16))(v12, v6, 0);
  }
  v13 = +[INSAnalytics sharedAnalytics];
  v14 = [v13 contextDictionaryForCommand:v6];

  v15 = +[INSAnalytics sharedAnalytics];
  uint64_t v16 = objc_msgSend(*(id *)(a1 + 40), "ins_analyticsEndEventType");
  v17 = objc_msgSend(*(id *)(a1 + 40), "ins_afAnalyticsContext");
  v18 = IFMergeDictionaries();
  objc_msgSend(v15, "logEventWithType:context:contextNoCopy:", v16, v18, 1, v14, 0);
}

@end