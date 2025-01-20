@interface LTLanguageStatusMulticaster
@end

@implementation LTLanguageStatusMulticaster

uint64_t __38___LTLanguageStatusMulticaster_shared__block_invoke()
{
  shared_shared = objc_alloc_init(_LTLanguageStatusMulticaster);

  return MEMORY[0x270F9A758]();
}

void __51___LTLanguageStatusMulticaster__removeAllObservers__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v3 = objc_msgSend(WeakRetained[2], "keyEnumerator", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = [v2[2] objectForKey:*(void *)(*((void *)&v9 + 1) + 8 * v7)];
          if (v8) {
            [v2 removeObserver:v8];
          }

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

void __44___LTLanguageStatusMulticaster_addObserver___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[2];
    id v16 = WeakRetained;
    uint64_t v4 = [*(id *)(a1 + 32) identifier];
    uint64_t v5 = [v3 objectForKey:v4];

    WeakRetained = v16;
    if (!v5)
    {
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = [v6 observationType];
      int v8 = [v6 useDedicatedMachPort];

      long long v9 = objc_msgSend(NSString, "stringWithFormat:", @"%lu:%d", v7, v8 ^ 1u);
      long long v10 = [*((id *)v16 + 4) objectForKeyedSubscript:v9];

      if (v10)
      {
        long long v11 = [*((id *)v16 + 3) objectForKeyedSubscript:v9];
        if (v11)
        {
          long long v12 = [*(id *)(a1 + 32) observations];
          ((void (**)(void, void *))v12)[2](v12, v11);
        }
      }
      else
      {
        long long v11 = [MEMORY[0x263F08C38] UUID];
        [*((id *)v16 + 4) setObject:v11 forKeyedSubscript:v9];
        objc_msgSend(v16, "_startWithConnectionIdentifier:observationType:useDedicatedMachPort:", v11, objc_msgSend(*(id *)(a1 + 32), "observationType"), objc_msgSend(*(id *)(a1 + 32), "useDedicatedMachPort"));
      }

      v13 = (void *)*((void *)v16 + 2);
      uint64_t v14 = *(void **)(a1 + 32);
      v15 = [v14 identifier];
      [v13 setObject:v14 forKey:v15];

      WeakRetained = v16;
    }
  }
}

void __47___LTLanguageStatusMulticaster_removeObserver___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    v3 = [WeakRetained[2] objectForKey:*(void *)(a1 + 32)];

    WeakRetained = v6;
    if (v3)
    {
      [v6[2] removeObjectForKey:*(void *)(a1 + 32)];
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lu:%d", *(void *)(a1 + 48), *(unsigned char *)(a1 + 56) == 0);
      uint64_t v5 = [v6[4] objectForKeyedSubscript:v4];
      if (v5)
      {
        [v6[4] setObject:0 forKeyedSubscript:v4];
        [v6 _cancelWithConnectionIdentifier:v5 observationType:*(void *)(a1 + 48) useDedicatedMachPort:*(unsigned __int8 *)(a1 + 56)];
      }

      WeakRetained = v6;
    }
  }
}

void __80___LTLanguageStatusMulticaster__multicastObservations_observationType_progress___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = objc_msgSend(NSString, "stringWithFormat:", @"%lu:%d", *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
    [WeakRetained[3] setObject:*(void *)(a1 + 32) forKeyedSubscript:v3];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = [WeakRetained[2] keyEnumerator];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          long long v10 = [WeakRetained[2] objectForKey:v9];
          long long v11 = v10;
          if (v10)
          {
            if ([v10 observationType] == *(void *)(a1 + 48)
              && *(unsigned __int8 *)(a1 + 56) != [v11 useDedicatedMachPort])
            {
              long long v12 = [v11 observations];
              v12[2](v12, *(void *)(a1 + 32));
            }
          }
          else
          {
            [WeakRetained[2] removeObjectForKey:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
}

void __115___LTLanguageStatusMulticaster__reconnectIfStreamingWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _startWithConnectionIdentifier:*(void *)(a1 + 32) observationType:*(void *)(a1 + 48) useDedicatedMachPort:*(unsigned __int8 *)(a1 + 56)];
    id WeakRetained = v3;
  }
}

void __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      uint64_t v5 = _LTOSLogAssets();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
      }
    }
    [WeakRetained _reconnectIfStreamingWithConnectionIdentifier:*(void *)(a1 + 32) observationType:*(void *)(a1 + 48) useDedicatedMachPort:*(unsigned __int8 *)(a1 + 56)];
  }
}

void __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = WeakRetained[1];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_2;
    v12[3] = &unk_2651DBE40;
    id v13 = v5;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = *(void **)(a1 + 48);
    id v14 = v10;
    v16[1] = v11;
    objc_copyWeak(v16, (id *)(a1 + 40));
    id v15 = v6;
    char v17 = *(unsigned char *)(a1 + 56);
    dispatch_async(v9, v12);

    objc_destroyWeak(v16);
  }
}

void __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_3;
  v7[3] = &unk_2651DBE18;
  objc_copyWeak(v10, (id *)(a1 + 56));
  id v9 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(void **)(a1 + 64);
  id v8 = v5;
  v10[1] = v6;
  char v11 = *(unsigned char *)(a1 + 72);
  [v2 startLanguageStatusChangeObservation:v3 type:v4 completion:v7];

  objc_destroyWeak(v10);
}

void __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      id v5 = _LTOSLogAssets();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_3_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [WeakRetained _reconnectIfStreamingWithConnectionIdentifier:*(void *)(a1 + 32) observationType:*(void *)(a1 + 56) useDedicatedMachPort:*(unsigned __int8 *)(a1 + 64)];
  }
}

void __101___LTLanguageStatusMulticaster__cancelWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = [v2 domain];
    id v5 = v4;
    if (v4 == (void *)*MEMORY[0x263F07F70])
    {
      uint64_t v6 = [v3 code];

      if (v6 == 4099)
      {
        uint64_t v7 = _LTOSLogAssets();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v15 = 0;
          _os_log_impl(&dword_24639B000, v7, OS_LOG_TYPE_INFO, "Language status observation closed was expected so ignoring hangup error", v15, 2u);
        }
        goto LABEL_9;
      }
    }
    else
    {
    }
    uint64_t v8 = _LTOSLogAssets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __101___LTLanguageStatusMulticaster__cancelWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_cold_1((uint64_t)v3, v8, v9, v10, v11, v12, v13, v14);
    }
LABEL_9:
  }
}

void __101___LTLanguageStatusMulticaster__cancelWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = WeakRetained[1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __101___LTLanguageStatusMulticaster__cancelWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_2;
    block[3] = &unk_2651DBEB0;
    id v11 = v5;
    id v12 = *(id *)(a1 + 32);
    id v13 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __101___LTLanguageStatusMulticaster__cancelWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) cancelLanguageStatusChangeObservation:*(void *)(a1 + 40)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __101___LTLanguageStatusMulticaster__cancelWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end