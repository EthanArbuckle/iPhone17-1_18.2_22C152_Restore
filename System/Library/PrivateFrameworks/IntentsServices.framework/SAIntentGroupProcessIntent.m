@interface SAIntentGroupProcessIntent
@end

@implementation SAIntentGroupProcessIntent

void __132__SAIntentGroupProcessIntent_INSExtensionService___handleIntentWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __132__SAIntentGroupProcessIntent_INSExtensionService___handleIntentWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke_2;
  block[3] = &unk_26427E020;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(void **)(a1 + 48);
  block[4] = *(void *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  id v14 = v8;
  id v15 = *(id *)(a1 + 56);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __132__SAIntentGroupProcessIntent_INSExtensionService___handleIntentWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = +[INSAnalytics sharedAnalytics];
  v3 = objc_msgSend(*(id *)(a1 + 32), "ins_afAnalyticsContext");
  [v2 logEventWithType:641 context:v3 contextNoCopy:1];

  v4 = (NSObject **)MEMORY[0x263F0F810];
  id v5 = *MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v20 = 136315394;
    v21 = "-[SAIntentGroupProcessIntent(INSExtensionService) _handleIntentWithExtensionProxy:onQueue:processIntentComplet"
          "ed:completionHandler:]_block_invoke_2";
    __int16 v22 = 2112;
    uint64_t v23 = v6;
    _os_log_impl(&dword_2163DF000, v5, OS_LOG_TYPE_INFO, "%s HandleIntent completed with response %@", (uint8_t *)&v20, 0x16u);
    id v5 = *v4;
  }
  v7 = *(void **)(a1 + 48);
  if (v7)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = v5;
      uint64_t v9 = [v7 errorCode];
      id v10 = [*(id *)(a1 + 48) underlyingError];
      int v20 = 136315650;
      v21 = "-[SAIntentGroupProcessIntent(INSExtensionService) _handleIntentWithExtensionProxy:onQueue:processIntentCompl"
            "eted:completionHandler:]_block_invoke";
      __int16 v22 = 2048;
      uint64_t v23 = v9;
      __int16 v24 = 2112;
      v25 = v10;
      _os_log_error_impl(&dword_2163DF000, v8, OS_LOG_TYPE_ERROR, "%s HandleIntent error. errorCode: %lu underlyingError: %@", (uint8_t *)&v20, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v20 = 136315138;
      v21 = "-[SAIntentGroupProcessIntent(INSExtensionService) _handleIntentWithExtensionProxy:onQueue:processIntentCompl"
            "eted:completionHandler:]_block_invoke";
      _os_log_impl(&dword_2163DF000, v5, OS_LOG_TYPE_INFO, "%s HandleIntent successful.", (uint8_t *)&v20, 0xCu);
    }
    v11 = *(void **)(a1 + 56);
    id v12 = objc_alloc_init(MEMORY[0x263F649B8]);
    id v13 = [*(id *)(a1 + 32) aceId];
    [v12 setRefId:v13];

    if (objc_msgSend(*(id *)(a1 + 32), "ins_isJSONPayload"))
    {
      INSJSONEncodedIntentResponse(*(void **)(a1 + 40));
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      [v12 setJsonEncodedIntentResponse:v14];
    }
    else
    {
      id v14 = objc_alloc_init(MEMORY[0x263F649F8]);
      id v15 = [*(id *)(a1 + 40) backingStore];
      v16 = [v15 data];
      [v14 setData:v16];

      objc_opt_class();
      v17 = INIntentSchemaGetIntentResponseDescriptionWithFacadeClass();
      v18 = [v17 type];

      [v14 setTypeName:v18];
      [v12 setIntentResponse:v14];
    }

    [v11 setHandleIntentCompleted:v12];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __133__SAIntentGroupProcessIntent_INSExtensionService___confirmIntentWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __133__SAIntentGroupProcessIntent_INSExtensionService___confirmIntentWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke_2;
  block[3] = &unk_26427E280;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(void **)(a1 + 48);
  block[4] = *(void *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  id v14 = v8;
  id v15 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 64);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __133__SAIntentGroupProcessIntent_INSExtensionService___confirmIntentWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v2 = +[INSAnalytics sharedAnalytics];
  v3 = objc_msgSend(*(id *)(a1 + 32), "ins_afAnalyticsContext");
  [v2 logEventWithType:639 context:v3 contextNoCopy:1];

  v4 = (os_log_t *)MEMORY[0x263F0F810];
  id v5 = *MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v24 = 136315394;
    v25 = "-[SAIntentGroupProcessIntent(INSExtensionService) _confirmIntentWithExtensionProxy:onQueue:processIntentComple"
          "ted:completionHandler:]_block_invoke_2";
    __int16 v26 = 2112;
    uint64_t v27 = v6;
    _os_log_impl(&dword_2163DF000, v5, OS_LOG_TYPE_INFO, "%s ConfirmIntent completed with response %@", (uint8_t *)&v24, 0x16u);
  }
  id v7 = objc_alloc_init(MEMORY[0x263F64990]);
  v8 = [*(id *)(a1 + 32) aceId];
  [v7 setRefId:v8];

  if (objc_msgSend(*(id *)(a1 + 32), "ins_isJSONPayload"))
  {
    INSJSONEncodedIntentResponse(*(void **)(a1 + 40));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [v7 setJsonEncodedIntentResponse:v9];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x263F649F8]);
    objc_opt_class();
    id v10 = INIntentSchemaGetIntentResponseDescriptionWithFacadeClass();
    v11 = [v10 type];

    [v9 setTypeName:v11];
    id v12 = [*(id *)(a1 + 40) backingStore];
    id v13 = [v12 data];
    [v9 setData:v13];

    [v7 setIntentResponse:v9];
  }

  id v14 = *(void **)(a1 + 48);
  if (v14)
  {
    os_log_t v15 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      id v16 = v15;
      uint64_t v17 = [v14 errorCode];
      v18 = [*(id *)(a1 + 48) underlyingError];
      int v24 = 136315650;
      v25 = "-[SAIntentGroupProcessIntent(INSExtensionService) _confirmIntentWithExtensionProxy:onQueue:processIntentComp"
            "leted:completionHandler:]_block_invoke";
      __int16 v26 = 2048;
      uint64_t v27 = v17;
      __int16 v28 = 2112;
      v29 = v18;
      _os_log_error_impl(&dword_2163DF000, v16, OS_LOG_TYPE_ERROR, "%s ConfirmIntent error. errorCode: %lu underlyingError: %@", (uint8_t *)&v24, 0x20u);
    }
LABEL_17:
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    goto LABEL_18;
  }
  [*(id *)(a1 + 56) setConfirmIntentCompleted:v7];
  os_log_t v19 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
  {
    int v20 = *(void **)(a1 + 32);
    v21 = v19;
    int v22 = [v20 shouldRunHandleIntent];
    uint64_t v23 = @"NO";
    if (v22) {
      uint64_t v23 = @"YES";
    }
    int v24 = 136315394;
    v25 = "-[SAIntentGroupProcessIntent(INSExtensionService) _confirmIntentWithExtensionProxy:onQueue:processIntentComple"
          "ted:completionHandler:]_block_invoke";
    __int16 v26 = 2112;
    uint64_t v27 = (uint64_t)v23;
    _os_log_impl(&dword_2163DF000, v21, OS_LOG_TYPE_INFO, "%s ConfirmIntent successful. ShouldRunHandleIntent = %@", (uint8_t *)&v24, 0x16u);
  }
  if (![*(id *)(a1 + 32) shouldRunHandleIntent]
    || [*(id *)(a1 + 40) _intentResponseCode] != 1
    && [*(id *)(a1 + 40) _intentResponseCode] != 4)
  {
    goto LABEL_17;
  }
  [*(id *)(a1 + 32) _handleIntentWithExtensionProxy:*(void *)(a1 + 64) onQueue:*(void *)(a1 + 72) processIntentCompleted:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 80)];
LABEL_18:
}

void __138__SAIntentGroupProcessIntent_INSExtensionService___resolveIntentSlotsWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke(id *a1, char a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = +[INSAnalytics sharedAnalytics];
  id v10 = objc_msgSend(a1[4], "ins_afAnalyticsContext");
  [v9 logEventWithType:637 context:v10 contextNoCopy:1];

  v11 = *MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v27 = "-[SAIntentGroupProcessIntent(INSExtensionService) _resolveIntentSlotsWithExtensionProxy:onQueue:processIntentC"
          "ompleted:completionHandler:]_block_invoke";
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_2163DF000, v11, OS_LOG_TYPE_INFO, "%s BatchSlotResolution completed in extensionProxy with updatedIntent %@", buf, 0x16u);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __138__SAIntentGroupProcessIntent_INSExtensionService___resolveIntentSlotsWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke_5;
  v17[3] = &unk_26427DF18;
  id v12 = a1[5];
  id v13 = a1[6];
  id v14 = a1[4];
  id v18 = v13;
  id v19 = v14;
  id v20 = v7;
  id v21 = v8;
  char v25 = a2;
  id v22 = a1[7];
  id v23 = a1[5];
  id v24 = a1[8];
  id v15 = v8;
  id v16 = v7;
  dispatch_async(v12, v17);
}

uint64_t __138__SAIntentGroupProcessIntent_INSExtensionService___resolveIntentSlotsWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v52 = *MEMORY[0x263EF8340];
  v37 = *(void **)(a1 + 32);
  id v2 = objc_alloc_init(MEMORY[0x263F64978]);
  [v2 setSlotResolutionMap:0];
  v3 = [*(id *)(v1 + 40) intent];
  v4 = [v3 typeName];
  [v2 setTypeName:v4];

  int v5 = objc_msgSend(*(id *)(v1 + 40), "ins_isJSONPayload");
  uint64_t v6 = *(void **)(v1 + 48);
  v36 = v2;
  if (v5)
  {
    id v7 = INSJSONEncodedIntent(v6);
    [v2 setJsonEncodedIntent:v7];
  }
  else
  {
    id v7 = [v6 backingStore];
    id v8 = [v7 data];
    id v9 = [v8 base64EncodedStringWithOptions:0];
    [v2 setBase64EncodedIntent:v9];
  }
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [*(id *)(v1 + 56) allKeys];
  uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
  id v12 = (os_log_t *)MEMORY[0x263F0F810];
  uint64_t v40 = v11;
  if (v11)
  {
    uint64_t v13 = *(void *)v42;
    uint64_t v38 = v1;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v41 + 1) + 8 * v14);
        id v16 = objc_alloc_init(MEMORY[0x263F64980]);
        [v16 setKeyPath:v15];
        uint64_t v17 = [*(id *)(v1 + 56) objectForKeyedSubscript:v15];
        [v16 setTypeName:@"IntentSlotResolutionResult"];
        int v18 = objc_msgSend(*(id *)(v1 + 40), "ins_isJSONPayload");
        id v19 = [v17 data];
        id v20 = v19;
        if (v18)
        {
          id v21 = INSJSONEncodedSlotResolutionResult(v19, *(void **)(v1 + 48), v15);
          [v16 setJsonEncodedSlotResolutionResult:v21];
        }
        else
        {
          id v21 = [v19 base64EncodedStringWithOptions:0];
          [v16 setBase64EncodedProtobufMessage:v21];
        }

        [v10 addObject:v16];
        id v22 = objc_alloc(MEMORY[0x263F10120]);
        id v23 = [v17 data];
        id v24 = (void *)[v22 initWithData:v23];

        os_log_t v25 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_INFO))
        {
          __int16 v26 = v25;
          objc_msgSend(v24, "typeAsString:", objc_msgSend(v24, "type"));
          uint64_t v27 = v13;
          __int16 v28 = v12;
          uint64_t v30 = v29 = v10;
          *(_DWORD *)buf = 136315650;
          v46 = "-[SAIntentGroupProcessIntent(INSExtensionService) _resolveIntentSlotsWithExtensionProxy:onQueue:processI"
                "ntentCompleted:completionHandler:]_block_invoke";
          __int16 v47 = 2112;
          v48 = v15;
          __int16 v49 = 2112;
          v50 = v30;

          id v10 = v29;
          id v12 = v28;
          uint64_t v13 = v27;
          uint64_t v1 = v38;
        }
        ++v14;
      }
      while (v40 != v14);
      uint64_t v40 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v40);
  }

  [v36 setStepResults:v10];
  [v37 setBatchSlotResolutionResult:v36];

  int v31 = *(unsigned __int8 *)(v1 + 88);
  v32 = *v12;
  BOOL v33 = os_log_type_enabled(*v12, OS_LOG_TYPE_INFO);
  if (v31)
  {
    if (v33)
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[SAIntentGroupProcessIntent(INSExtensionService) _resolveIntentSlotsWithExtensionProxy:onQueue:processInten"
            "tCompleted:completionHandler:]_block_invoke";
      _os_log_impl(&dword_2163DF000, v32, OS_LOG_TYPE_INFO, "%s All slots were resolved successfully. Moving to Confirm.", buf, 0xCu);
    }
    v34 = objc_msgSend(*(id *)(v1 + 64), "_connection", v36);
    [v34 setIntent:*(void *)(v1 + 48)];

    return [*(id *)(v1 + 40) _confirmIntentWithExtensionProxy:*(void *)(v1 + 64) onQueue:*(void *)(v1 + 72) processIntentCompleted:*(void *)(v1 + 32) completionHandler:*(void *)(v1 + 80)];
  }
  else
  {
    if (v33)
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[SAIntentGroupProcessIntent(INSExtensionService) _resolveIntentSlotsWithExtensionProxy:onQueue:processInten"
            "tCompleted:completionHandler:]_block_invoke";
      _os_log_impl(&dword_2163DF000, v32, OS_LOG_TYPE_INFO, "%s BatchSlotResolution needs dialog. Calling completion.", buf, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 80) + 16))();
  }
}

void __109__SAIntentGroupProcessIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v3 = +[INSAnalytics sharedAnalytics];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "ins_afAnalyticsContext");
  [v3 logEventWithType:633 context:v2 contextNoCopy:1];
}

void __109__SAIntentGroupProcessIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v13 = "-[SAIntentGroupProcessIntent(INSExtensionService) ins_sendIntent:toExtensionProxy:onQueue:completionHandler:]_block_invoke";
    _os_log_impl(&dword_2163DF000, v4, OS_LOG_TYPE_INFO, "%s BatchSlotResolution complete.", buf, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, id, void))(v5 + 16))(v5, v3, 0);
  }
  uint64_t v6 = +[INSAnalytics sharedAnalytics];
  id v7 = [v6 contextDictionaryForCommand:*(void *)(a1 + 32)];

  id v8 = +[INSAnalytics sharedAnalytics];
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "ins_analyticsEndEventType");
  id v10 = objc_msgSend(*(id *)(a1 + 40), "ins_afAnalyticsContext");
  uint64_t v11 = IFMergeDictionaries();
  objc_msgSend(v8, "logEventWithType:context:contextNoCopy:", v9, v11, 1, v7, 0);
}

@end