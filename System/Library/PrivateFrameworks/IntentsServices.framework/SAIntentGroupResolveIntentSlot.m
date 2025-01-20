@interface SAIntentGroupResolveIntentSlot
@end

@implementation SAIntentGroupResolveIntentSlot

void __113__SAIntentGroupResolveIntentSlot_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v3 = +[INSAnalytics sharedAnalytics];
  v2 = objc_msgSend(*(id *)(a1 + 32), "ins_afAnalyticsContext");
  [v3 logEventWithType:608 context:v2 contextNoCopy:1];
}

void __113__SAIntentGroupResolveIntentSlot_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __113__SAIntentGroupResolveIntentSlot_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_3;
  block[3] = &unk_26427E020;
  v5 = *(NSObject **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  id v9 = v3;
  uint64_t v10 = v4;
  id v11 = v6;
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  id v7 = v3;
  dispatch_async(v5, block);
}

void __113__SAIntentGroupResolveIntentSlot_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (id)*MEMORY[0x263F0F810];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = v3
       ? (__CFString *)[objc_alloc(MEMORY[0x263F10120]) initWithData:*(void *)(a1 + 32)]
       : @"no data";
    *(_DWORD *)buf = 136315394;
    v16 = "-[SAIntentGroupResolveIntentSlot(INSExtensionService) ins_sendIntent:toExtensionProxy:onQueue:completionHandle"
          "r:]_block_invoke_3";
    __int16 v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_2163DF000, v2, OS_LOG_TYPE_INFO, "%s resolutionResultData = %@", buf, 0x16u);
    if (v3) {
  }
    }
  id v5 = objc_alloc_init(MEMORY[0x263F64A10]);
  v6 = [*(id *)(a1 + 40) aceId];
  [v5 setRefId:v6];

  if (objc_msgSend(*(id *)(a1 + 40), "ins_isJSONPayload"))
  {
    INSJSONEncodedSlotResolutionResult(*(void **)(a1 + 32), *(void **)(a1 + 48), *(void **)(a1 + 56));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v5 setJsonEncodedIntentSlotResolutionResult:v7];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x263F649F8]);
    [v7 setData:*(void *)(a1 + 32)];
    [v7 setTypeName:@"IntentSlotResolutionResult"];
    [v5 setIntentSlotResolutionResult:v7];
  }

  uint64_t v8 = *(void *)(a1 + 64);
  if (v8) {
    (*(void (**)(uint64_t, id, void))(v8 + 16))(v8, v5, 0);
  }
  id v9 = +[INSAnalytics sharedAnalytics];
  uint64_t v10 = [v9 contextDictionaryForCommand:v5];

  id v11 = +[INSAnalytics sharedAnalytics];
  uint64_t v12 = objc_msgSend(*(id *)(a1 + 40), "ins_analyticsEndEventType");
  id v13 = objc_msgSend(*(id *)(a1 + 40), "ins_afAnalyticsContext");
  v14 = IFMergeDictionaries();
  objc_msgSend(v11, "logEventWithType:context:contextNoCopy:", v12, v14, 1, v10, 0);
}

@end