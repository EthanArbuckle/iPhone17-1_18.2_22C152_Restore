@interface CDContextualLocationRegistrationMonitor
@end

@implementation CDContextualLocationRegistrationMonitor

void __60___CDContextualLocationRegistrationMonitor_addRegistration___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) locationManagerEffectiveBundleID];

  if (v3)
  {
    v4 = [*(id *)(a1 + 40) registrations];
    [v4 addObject:*(void *)(a1 + 32)];

    v5 = [*(id *)(a1 + 32) locationManagerEffectiveBundleID];
    v6 = [*(id *)(a1 + 40) managers];
    v7 = [v6 objectForKeyedSubscript:v5];

    if (!v7)
    {
      if ([v5 isEqualToString:@"com.apple.shortcuts"])
      {
        v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B50]) initWithPath:@"/System/Library/LocationBundles/ShortcutsLocation.bundle"];
        id v9 = objc_alloc(MEMORY[0x1E4F1E600]);
        v10 = *(void **)(a1 + 40);
        v11 = [v10 queue];
        v7 = (void *)[v9 initWithEffectiveBundle:v8 delegate:v10 onQueue:v11];
      }
      else
      {
        id v12 = objc_alloc(MEMORY[0x1E4F1E600]);
        v13 = *(void **)(a1 + 40);
        v8 = [v13 queue];
        v7 = (void *)[v12 initWithEffectiveBundleIdentifier:v5 delegate:v13 onQueue:v8];
      }

      v14 = [*(id *)(a1 + 40) managers];
      [v14 setObject:v7 forKeyedSubscript:v5];

      v15 = [*(id *)(a1 + 40) effectiveBundleIDs];
      id v16 = [v5 copy];
      [v15 setObject:v16 forKey:v7];

      v17 = [*(id *)(a1 + 40) effectiveBundleIDRegionInfos];
      v18 = [v17 objectForKeyedSubscript:v5];

      if (!v18)
      {
        id v19 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
        v20 = [*(id *)(a1 + 40) effectiveBundleIDRegionInfos];
        [v20 setObject:v19 forKeyedSubscript:v5];
      }
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v21 = objc_msgSend(*v2, "predicate", 0);
    v22 = [v21 circularLocationRegions];

    uint64_t v23 = [v22 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v29 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          [v27 setNotifyOnEntry:1];
          [v27 setNotifyOnExit:1];
          [v7 startMonitoringForRegion:v27];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v24);
    }
  }
  else
  {
    v5 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __60___CDContextualLocationRegistrationMonitor_addRegistration___block_invoke_cold_1(v2, v5);
    }
  }
}

void __63___CDContextualLocationRegistrationMonitor_removeRegistration___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) registrations];
  [v2 removeObject:*(void *)(a1 + 40)];

  v3 = [*(id *)(a1 + 40) locationManagerEffectiveBundleID];
  v4 = [*(id *)(a1 + 32) managers];
  v5 = [v4 objectForKeyedSubscript:v3];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = objc_msgSend(*(id *)(a1 + 40), "predicate", 0);
  v7 = [v6 circularLocationRegions];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [v5 stopMonitoringForRegion:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

void __60___CDContextualLocationRegistrationMonitor_addRegistration___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [*a1 identifier];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_18EC9B000, a2, OS_LOG_TYPE_ERROR, "Cannot monitor location for contextual registration %@ which has no effective bundleID", (uint8_t *)&v4, 0xCu);
}

@end