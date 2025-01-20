@interface DPDataProtectionMaster
@end

@implementation DPDataProtectionMaster

uint64_t __41___DPDataProtectionMaster_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_0 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

void __31___DPDataProtectionMaster_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleKeyBagLockNotification];
}

uint64_t __34___DPDataProtectionMaster_dealloc__block_invoke(uint64_t a1)
{
  return notify_cancel(*(_DWORD *)(a1 + 32));
}

void __55___DPDataProtectionMaster_handleKeyBagLockNotification__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) availableState];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isDataAvailableForClassC"));
  v7 = [*(id *)(a1 + 32) availableState];
  v8 = +[_DPDataProtectionStateMonitor dataProtectionClassC];
  [v7 setObject:v6 forKeyedSubscript:v8];

  id v12 = [*(id *)(a1 + 32) handlers];
  uint64_t v9 = [v12 allValues];
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

void __55___DPDataProtectionMaster_handleKeyBagLockNotification__block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v8 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", v7, (void)v14);
        int v9 = [v8 BOOLValue];

        uint64_t v10 = [*(id *)(a1 + 32) availableState];
        v11 = [v10 objectForKeyedSubscript:v7];
        uint64_t v12 = [v11 BOOLValue];

        if (v9 != v12)
        {
          v13 = [NSNumber numberWithBool:v12];
          [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

void __46___DPDataProtectionMaster_isDataAvailableFor___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) availableState];
  id v4 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v3 = v4;
  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 BOOLValue];
    uint64_t v3 = v4;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void __54___DPDataProtectionMaster_registerStateChangeHandler___block_invoke(uint64_t a1)
{
  id v3 = (id)MEMORY[0x1E019FA60](*(void *)(a1 + 48));
  id v2 = [*(id *)(a1 + 32) handlers];
  [v2 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
}

void __56___DPDataProtectionMaster_deregisterStateChangeHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handlers];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

@end