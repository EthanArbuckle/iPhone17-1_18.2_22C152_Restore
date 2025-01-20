@interface DKDataProtectionMonitor
@end

@implementation DKDataProtectionMonitor

uint64_t __57___DKDataProtectionMonitor_deregisterStateChangeHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
}

void __55___DKDataProtectionMonitor_registerStateChangeHandler___block_invoke(void *a1)
{
  id v2 = (id)MEMORY[0x192FB31A0](a1[6]);
  [*(id *)(a1[4] + 8) setObject:v2 forKeyedSubscript:a1[5]];
}

void __47___DKDataProtectionMonitor_isDataAvailableFor___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];
  if (v2)
  {
    v3 = v2;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v2 BOOLValue];
    id v2 = v3;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

uint64_t __42___DKDataProtectionMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance_instance_1;
  sharedInstance_instance_1 = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

void __32___DKDataProtectionMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_DKDataProtectionMonitor handleKeyBagLockNotification]((uint64_t)WeakRetained);
}

uint64_t __35___DKDataProtectionMonitor_dealloc__block_invoke(uint64_t a1)
{
  return notify_cancel(*(_DWORD *)(*(void *)(a1 + 32) + 48));
}

void __56___DKDataProtectionMonitor_handleKeyBagLockNotification__block_invoke(uint64_t *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 24) copy];
  uint64_t v3 = *(void *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = [NSNumber numberWithBool:-[_DKDataProtectionMonitor isDataAvailableForClassA](a1[4])];
  [*(id *)(a1[4] + 24) setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F28340]];

  v6 = [NSNumber numberWithBool:-[_DKDataProtectionMonitor isDataAvailableForClassC](a1[4])];
  [*(id *)(a1[4] + 24) setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F28358]];

  uint64_t v7 = [*(id *)(a1[4] + 8) allValues];
  uint64_t v8 = *(void *)(a1[6] + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = *(id *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v16 = objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "objectForKeyedSubscript:", v15, (void)v21);
        int v17 = [v16 BOOLValue];

        v18 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:v15];
        uint64_t v19 = [v18 BOOLValue];

        if (v17 != v19)
        {
          v20 = [NSNumber numberWithBool:v19];
          [*(id *)(*(void *)(a1[7] + 8) + 40) setObject:v20 forKeyedSubscript:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }
}

@end