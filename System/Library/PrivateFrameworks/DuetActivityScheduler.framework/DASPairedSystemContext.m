@interface DASPairedSystemContext
@end

@implementation DASPairedSystemContext

void __52___DASPairedSystemContext_registerForContextChanges__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) handlerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52___DASPairedSystemContext_registerForContextChanges__block_invoke_4;
  block[3] = &unk_1E6112A70;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(v2, block);
}

uint64_t __52___DASPairedSystemContext_registerForContextChanges__block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) handlerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52___DASPairedSystemContext_registerForContextChanges__block_invoke_6;
  block[3] = &unk_1E6112A70;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(v2, block);

  return 1;
}

uint64_t __52___DASPairedSystemContext_registerForContextChanges__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleAppStateChange];
}

uint64_t __52___DASPairedSystemContext_registerForContextChanges__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleAppStateChange];
}

void __47___DASPairedSystemContext_handleAppStateChange__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) onConditionsChange];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 40), *(void *)(a1 + 40));
}

uint64_t __52___DASPairedSystemContext_registerForContextChanges__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleConditionChange];
}

void __52___DASPairedSystemContext_registerForContextChanges__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handlerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52___DASPairedSystemContext_registerForContextChanges__block_invoke_2;
  block[3] = &unk_1E6112A70;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(v2, block);
}

uint64_t __144___DASPairedSystemContext_initWithClientIdentifier_context_knowledgeStore_callbackQueue_systemConditionChangeCallback_trafficCancelationHander___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAppUsageHistory];
}

uint64_t __144___DASPairedSystemContext_initWithClientIdentifier_context_knowledgeStore_callbackQueue_systemConditionChangeCallback_trafficCancelationHander___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteRemoteHistogram];
}

void __125___DASPairedSystemContext_contextWithClientIdentifier_callbackQueue_systemConditionChangeCallback_trafficCancelationHandler___block_invoke(void *a1)
{
  id v2 = objc_alloc((Class)objc_opt_class());
  uint64_t v3 = a1[4];
  id v7 = [MEMORY[0x1E4F5B6A0] userContext];
  v4 = [MEMORY[0x1E4F5B568] knowledgeStore];
  uint64_t v5 = [v2 initWithClientIdentifier:v3 context:v7 knowledgeStore:v4 callbackQueue:a1[5] systemConditionChangeCallback:a1[6] trafficCancelationHander:a1[7]];
  v6 = (void *)contextWithClientIdentifier_callbackQueue_systemConditionChangeCallback_trafficCancelationHandler__pairedSystemContext;
  contextWithClientIdentifier_callbackQueue_systemConditionChangeCallback_trafficCancelationHandler__pairedSystemContext = v5;
}

void __48___DASPairedSystemContext_handleConditionChange__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) onConditionsChange];
  (*((void (**)(id, void, void))v1 + 2))(v1, 0, 0);
}

void __48___DASPairedSystemContext_handleConditionChange__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) onConditionsChange];
  (*((void (**)(id, void, void))v1 + 2))(v1, 0, 0);
}

void __53___DASPairedSystemContext_handleWatchAppBackgrounded__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v8 = a3;
  [*(id *)(a1 + 32) timeIntervalSinceDate:v8];
  if (v9 <= 120.0)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) timeIntervalSinceDate:v8];
    if (v10 > 0.0)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __54___DASPairedSystemContext_didHandleExclusiveAppChange__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) onApplicationStateChange];
  v2[2](v2, *(void *)(a1 + 40));
}

void __54___DASPairedSystemContext_didHandleExclusiveAppChange__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) onConditionsChange];
  (*((void (**)(id, void, void))v1 + 2))(v1, 0, 0);
}

void __46___DASPairedSystemContext_isAnyThirdPartyApp___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_1B578B000, v7, OS_LOG_TYPE_INFO, "Error obtaining applications for remote device: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    id v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4AC58]];
    BOOL v9 = v8 == 0;

    double v10 = [*(id *)(a1 + 32) log];
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v11)
      {
        v14 = *(void **)(a1 + 48);
        int v17 = 138412290;
        id v18 = v14;
        _os_log_impl(&dword_1B578B000, v10, OS_LOG_TYPE_INFO, "%@ IS NOT a WatchKit app", (uint8_t *)&v17, 0xCu);
      }
      char v13 = 0;
    }
    else if (v11)
    {
      v12 = *(void **)(a1 + 48);
      int v17 = 138412290;
      id v18 = v12;
      char v13 = 1;
      _os_log_impl(&dword_1B578B000, v10, OS_LOG_TYPE_INFO, "%@ IS a WatchKit app", (uint8_t *)&v17, 0xCu);
    }
    else
    {
      char v13 = 1;
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v13;
    id v7 = [*(id *)(a1 + 32) watchKitAppStatus];
    objc_sync_enter(v7);
    v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
    v16 = [*(id *)(a1 + 32) watchKitAppStatus];
    [v16 setObject:v15 forKeyedSubscript:*(void *)(a1 + 48)];

    objc_sync_exit(v7);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end