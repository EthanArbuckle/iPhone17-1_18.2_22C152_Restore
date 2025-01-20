@interface DKComplicationMonitor
@end

@implementation DKComplicationMonitor

void __31___DKComplicationMonitor_start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained asyncUpdateCurrentActiveComplicationsContext];
}

void __31___DKComplicationMonitor_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained[19];
    v4 = WeakRetained;
    dispatch_time_t v3 = dispatch_walltime(0, 2000000000);
    dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    id WeakRetained = v4;
  }
}

uint64_t __31___DKComplicationMonitor_start__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) asyncUpdateCurrentActiveComplicationsContext];
}

uint64_t __51___DKComplicationMonitor_fetchActiveComplications___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __51___DKComplicationMonitor_fetchActiveComplications___block_invoke_cold_1((uint64_t)v6, v7);
    }

    uint64_t v8 = 0;
  }
  else if (v5)
  {
    v9 = [v5 companionAppBundleID];
    v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v11 = [v5 bundleIdentifier];
    [v10 setObject:v9 forKeyedSubscript:v11];

    uint64_t v8 = 1;
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v13 = *(id *)(a1 + 40);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (([v18 isEqual:&stru_26D866630] & 1) == 0)
          {
            uint64_t v19 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectForKeyedSubscript:v18];
            v20 = (void *)v19;
            if (v19) {
              v21 = (__CFString *)v19;
            }
            else {
              v21 = &stru_26D866630;
            }
            v22 = v21;

            [v12 addObject:v22];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v15);
    }

    v23 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v12;
      _os_log_impl(&dword_225002000, v23, OS_LOG_TYPE_DEFAULT, "New list of active complications: %@\n", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v8 = 0;
    id v5 = 0;
  }

  return v8;
}

void __70___DKComplicationMonitor_asyncUpdateCurrentActiveComplicationsContext__block_invoke(uint64_t a1, void *a2)
{
  dispatch_time_t v3 = (void *)MEMORY[0x263F351B8];
  id v4 = a2;
  id v5 = [v3 userContext];
  id v6 = [MEMORY[0x263F351D0] keyPathForActiveComplications];
  [v5 setObject:v4 forKeyedSubscript:v6];

  v7 = *(NSObject **)(*(void *)(a1 + 32) + 152);
  dispatch_resume(v7);
}

void __51___DKComplicationMonitor_fetchActiveComplications___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_225002000, a2, OS_LOG_TYPE_ERROR, "failed to fetch list of installed applications on watch: %@\n", (uint8_t *)&v2, 0xCu);
}

@end