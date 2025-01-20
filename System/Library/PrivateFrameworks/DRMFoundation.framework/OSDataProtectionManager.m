@interface OSDataProtectionManager
@end

@implementation OSDataProtectionManager

uint64_t __42___OSDataProtectionManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

void __32___OSDataProtectionManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleKeyBagLockNotification];
}

uint64_t __56___OSDataProtectionManager_handleKeyBagLockNotification__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isDataAvailableForClassA"));
  v6 = *(void **)(*(void *)(a1 + 32) + 32);
  v7 = +[_OSDataProtectionStateMonitor dataProtectionClassA];
  [v6 setObject:v5 forKeyedSubscript:v7];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isDataAvailableForClassC"));
  v9 = *(void **)(*(void *)(a1 + 32) + 32);
  v10 = +[_OSDataProtectionStateMonitor dataProtectionClassC];
  [v9 setObject:v8 forKeyedSubscript:v10];

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) allValues];
  return MEMORY[0x270F9A758]();
}

void __56___OSDataProtectionManager_handleKeyBagLockNotification__block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v8 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", v7, (void)v13);
        int v9 = [v8 BOOLValue];

        v10 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v7];
        uint64_t v11 = [v10 BOOLValue];

        if (v9 != v11)
        {
          v12 = [NSNumber numberWithBool:v11];
          [*(id *)(a1 + 40) setObject:v12 forKeyedSubscript:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

void __47___OSDataProtectionManager_isDataAvailableFor___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  if (v2)
  {
    uint64_t v3 = v2;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v2 BOOLValue];
    id v2 = v3;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

void __55___OSDataProtectionManager_registerStateChangeHandler___block_invoke(void *a1)
{
  id v2 = (id)MEMORY[0x230F77820](a1[6]);
  [*(id *)(a1[4] + 24) setObject:v2 forKeyedSubscript:a1[5]];
}

uint64_t __57___OSDataProtectionManager_deregisterStateChangeHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
}

@end