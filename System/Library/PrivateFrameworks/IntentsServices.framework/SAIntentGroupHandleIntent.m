@interface SAIntentGroupHandleIntent
@end

@implementation SAIntentGroupHandleIntent

void __108__SAIntentGroupHandleIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v3 = +[INSAnalytics sharedAnalytics];
  v2 = objc_msgSend(*(id *)(a1 + 32), "ins_afAnalyticsContext");
  [v3 logEventWithType:617 context:v2 contextNoCopy:1];
}

void __108__SAIntentGroupHandleIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_4(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __108__SAIntentGroupHandleIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_2_5;
  v12[3] = &unk_26427E3E0;
  v8 = a1[4];
  uint64_t v7 = a1[5];
  v9 = (void *)a1[6];
  id v13 = v6;
  uint64_t v14 = v7;
  id v15 = v5;
  id v16 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, v12);
}

void __108__SAIntentGroupHandleIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_2_5(id *a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (a1[4])
  {
    id v2 = a1[5];
    INSExtensionServiceTraceCompletionHandlerWithCode(a1[7], 722470896);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = [a1[4] errorCode];
    v4 = [a1[4] underlyingError];
    objc_msgSend(v2, "ins_invokeErrorCompletionHandler:withErrorCode:underlyingError:", v22, v3, v4);
  }
  else
  {
    id v5 = (void *)*MEMORY[0x263F0F810];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
    {
      id v6 = a1[6];
      uint64_t v7 = v5;
      v8 = [v6 backingStore];
      *(_DWORD *)buf = 136315394;
      v24 = "-[SAIntentGroupHandleIntent(INSExtensionService) ins_sendIntent:toExtensionProxy:onQueue:completionHandler:]_block_invoke_2";
      __int16 v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_2163DF000, v7, OS_LOG_TYPE_INFO, "%s intentResponse.backingStore = %@", buf, 0x16u);
    }
    id v9 = objc_alloc_init(MEMORY[0x263F649B8]);
    id v10 = [a1[5] aceId];
    [v9 setRefId:v10];

    if (objc_msgSend(a1[5], "ins_isJSONPayload"))
    {
      INSJSONEncodedIntentResponse(a1[6]);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      [v9 setJsonEncodedIntentResponse:v11];
    }
    else
    {
      id v11 = objc_alloc_init(MEMORY[0x263F649F8]);
      v12 = [a1[6] backingStore];
      id v13 = [v12 data];
      [v11 setData:v13];

      uint64_t v14 = [a1[6] _payloadResponseTypeName];
      [v11 setTypeName:v14];

      [v9 setIntentResponse:v11];
    }

    id v15 = (void (**)(id, id, void))a1[7];
    if (v15) {
      v15[2](v15, v9, 0);
    }
    id v16 = +[INSAnalytics sharedAnalytics];
    v17 = [v16 contextDictionaryForCommand:v9];

    v18 = +[INSAnalytics sharedAnalytics];
    uint64_t v19 = objc_msgSend(a1[5], "ins_analyticsEndEventType");
    v20 = objc_msgSend(a1[5], "ins_afAnalyticsContext");
    v21 = IFMergeDictionaries();
    objc_msgSend(v18, "logEventWithType:context:contextNoCopy:", v19, v21, 1, v17, 0);
  }
}

void __108__SAIntentGroupHandleIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __108__SAIntentGroupHandleIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_3;
  v8[3] = &unk_26427E3B8;
  id v9 = v4;
  id v10 = v5;
  id v6 = v4;
  id v7 = v5;
  [v6 _retrieveImageDataWithReply:v8];
}

void __108__SAIntentGroupHandleIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = *MEMORY[0x263F0F810];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      id v13 = "-[SAIntentGroupHandleIntent(INSExtensionService) ins_sendIntent:toExtensionProxy:onQueue:completionHandler:]_block_invoke_3";
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl(&dword_2163DF000, v7, OS_LOG_TYPE_ERROR, "%s Unable to retrieve image data = %@", (uint8_t *)&v12, 0x16u);
    }
    v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v9 = *(void **)(a1 + 32);
    [v5 _imageSize];
    objc_msgSend(v9, "_setImageSize:");
    id v10 = [MEMORY[0x263F0F9D8] sharedCache];
    [v10 addCacheableObject:v5];

    id v11 = [MEMORY[0x263F0F9D8] sharedCache];
    [v11 addCacheableObject:*(void *)(a1 + 32)];

    v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v8();
}

@end