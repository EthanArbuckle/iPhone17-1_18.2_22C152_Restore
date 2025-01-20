@interface CDSiriLearningSettings
@end

@implementation CDSiriLearningSettings

uint64_t __55___CDSiriLearningSettings_allLearningDisabledBundleIDs__block_invoke(uint64_t a1)
{
  uint64_t v2 = -[_CDSiriLearningSettings _unsafe_allLearningDisabledBundleIDs](*(void *)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

void __64___CDSiriLearningSettings__startWithCallback_invokeCallbackNow___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v26 = "com.apple.suggestions.settingsChanged";
    _os_log_impl(&dword_18ECEB000, v2, OS_LOG_TYPE_DEFAULT, "Handling callback for %{public}s", buf, 0xCu);
  }

  uint64_t v3 = -[_CDSiriLearningSettings _unsafe_allLearningDisabledBundleIDs](*(void *)(a1 + 32));
  -[_CDSiriLearningSettings _unsafe_clearAllLearningDisabledBundleIDs](*(void **)(a1 + 32));
  uint64_t v4 = -[_CDSiriLearningSettings _unsafe_allLearningDisabledBundleIDs](*(void *)(a1 + 32));
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __64___CDSiriLearningSettings__startWithCallback_invokeCallbackNow___block_invoke_140;
  v22[3] = &unk_1E560ED90;
  id v5 = v3;
  id v23 = v5;
  objc_msgSend(v4, "_pas_filteredArrayWithTest:", v22);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64___CDSiriLearningSettings__startWithCallback_invokeCallbackNow___block_invoke_2;
  v20[3] = &unk_1E560ED90;
  id v7 = v4;
  id v21 = v7;
  v8 = objc_msgSend(v5, "_pas_filteredArrayWithTest:", v20);
  v9 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v26 = v6;
    __int16 v27 = 2114;
    v28 = v8;
    _os_log_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_DEFAULT, "Learning toggled. New disabled: %{public}@. New enabled: %{public}@", buf, 0x16u);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v10 = *(void **)(a1 + 32);
  if (v10) {
    v10 = (void *)v10[4];
  }
  v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v15) + 16))(*(void *)(*((void *)&v16 + 1) + 8 * v15));
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

void __59___CDSiriLearningSettings_startSanitizingInteractionStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v27 = a1;
  uint64_t v7 = [*(id *)(a1 + 32) metadataForKey:@"SiriCanLearnFromAppBlacklist"];
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v7) {
    v9 = (void *)v7;
  }
  id v10 = v9;

  if ([v6 isEqual:v10])
  {
    v11 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = (uint64_t)v6;
      _os_log_impl(&dword_18ECEB000, v11, OS_LOG_TYPE_DEFAULT, "allDisabledBundles equals persistedDisabledBundles (%{public}@); bailing",
        buf,
        0xCu);
    }
  }
  else
  {
    id v25 = v6;
    id v26 = v5;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v6;
    uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v31;
      unint64_t v15 = 0x1E560C000uLL;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(obj);
          }
          long long v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v18 = (void *)MEMORY[0x192FB2F20]();
          if (objc_msgSend(v10, "_cd_containsSiriLearningBundleId:", v17))
          {
            long long v19 = [*(id *)(v15 + 2288) interactionChannel];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v35 = (uint64_t)v17;
              _os_log_impl(&dword_18ECEB000, v19, OS_LOG_TYPE_DEFAULT, "newly disabled bundle %{public}@ is already in persistedDisabledBundles; skipping",
                buf,
                0xCu);
            }
          }
          else
          {
            v20 = *(void **)(v27 + 32);
            id v29 = 0;
            uint64_t v21 = [v20 deleteInteractionsWithBundleId:v17 error:&v29];
            long long v19 = v29;
            unint64_t v22 = v15;
            id v23 = [*(id *)(v15 + 2288) interactionChannel];
            v24 = v23;
            if (v19)
            {
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v35 = (uint64_t)v17;
                _os_log_error_impl(&dword_18ECEB000, v24, OS_LOG_TYPE_ERROR, "Failed to delete interactions for disabled learning bundle: %{public}@", buf, 0xCu);
              }
            }
            else if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              uint64_t v35 = v21;
              __int16 v36 = 2114;
              v37 = v17;
              _os_log_impl(&dword_18ECEB000, v24, OS_LOG_TYPE_DEFAULT, "Deleted %tu interactions for newly-disabled learning bundle: %{public}@", buf, 0x16u);
            }

            unint64_t v15 = v22;
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v13);
    }

    [*(id *)(v27 + 32) setMetadata:obj forKey:@"SiriCanLearnFromAppBlacklist"];
    id v6 = v25;
    id v5 = v26;
  }
}

void __57___CDSiriLearningSettings_startSanitizingKnowledgeStore___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = _os_activity_create(&dword_18ECEB000, "Duet: _CDSiriLearningSettings startSanitizingKnowledgeStore", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    os_activity_scope_leave(&state);

    id v5 = +[_DKQuery predicateForEventsWithStreamNames:&unk_1EDE1E680];
    id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = +[_DKQuery predicateForEventsWithBundleID:*(void *)(*((void *)&v20 + 1) + 8 * v11)];
          [v6 addObject:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v9);
    }

    uint64_t v13 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v6];
    uint64_t v14 = (void *)MEMORY[0x1E4F28BA0];
    v25[0] = v5;
    v25[1] = v13;
    unint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    long long v16 = [v14 andPredicateWithSubpredicates:v15];

    long long v17 = *(void **)(a1 + 32);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __57___CDSiriLearningSettings_startSanitizingKnowledgeStore___block_invoke_2;
    v18[3] = &unk_1E560EDB8;
    id v19 = v7;
    [v17 deleteAllEventsMatchingPredicate:v16 responseQueue:0 withCompletion:v18];
  }
}

void __41___CDSiriLearningSettings_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)sharedInstance_manager;
  sharedInstance_manager = (uint64_t)v1;

  if (sharedInstance_manager) {
    *(void *)(sharedInstance_manager + 12) = 0xFFFFFFFFLL;
  }
  id v3 = [MEMORY[0x1E4F1CA48] array];
  -[_CDSiriLearningSettings setDelegates:](sharedInstance_manager, v3);

  getpid();
  int v4 = sandbox_check();
  if (v4 == -1)
  {
    id v5 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __41___CDSiriLearningSettings_sharedInstance__block_invoke_cold_2(v5);
    }
    goto LABEL_9;
  }
  if (!v4)
  {
    id v5 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_INFO, "Process has access to preferences for Siri Learning toggles.", buf, 2u);
    }
LABEL_9:

    uint64_t v6 = sharedInstance_manager;
    if (!sharedInstance_manager) {
      return;
    }
    char v7 = 1;
    goto LABEL_15;
  }
  uint64_t v8 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __41___CDSiriLearningSettings_sharedInstance__block_invoke_cold_1(v8);
  }

  uint64_t v6 = sharedInstance_manager;
  if (sharedInstance_manager)
  {
    char v7 = 0;
LABEL_15:
    *(unsigned char *)(v6 + 8) = v7;
  }
}

void __44___CDSiriLearningSettings_notificationQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.coreduet.siriLearningTracker", v2);
  id v1 = (void *)notificationQueue_queue;
  notificationQueue_queue = (uint64_t)v0;
}

uint64_t __63___CDSiriLearningSettings__unsafe_allLearningDisabledBundleIDs__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:2];
}

uint64_t __64___CDSiriLearningSettings__startWithCallback_invokeCallbackNow___block_invoke_140(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cd_containsSiriLearningBundleId:", a2) ^ 1;
}

uint64_t __64___CDSiriLearningSettings__startWithCallback_invokeCallbackNow___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cd_containsSiriLearningBundleId:", a2) ^ 1;
}

uint64_t __64___CDSiriLearningSettings__startWithCallback_invokeCallbackNow___block_invoke_143(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), MEMORY[0x1E4F1CBF0], *(void *)(a1 + 32));
}

void __57___CDSiriLearningSettings_startSanitizingKnowledgeStore___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = +[_CDLogging knowledgeChannel];
  char v7 = v6;
  if (a3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __57___CDSiriLearningSettings_startSanitizingKnowledgeStore___block_invoke_2_cold_1(a1, v7);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 134218242;
    uint64_t v10 = a2;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    _os_log_impl(&dword_18ECEB000, v7, OS_LOG_TYPE_DEFAULT, "Deleted %tu objects for newly-disabled learning bundles: %{public}@", (uint8_t *)&v9, 0x16u);
  }
}

uint64_t __41___CDSiriLearningSettings_stopSanitizing__block_invoke(uint64_t a1)
{
  -[_CDSiriLearningSettings _unsafe_clearAllLearningDisabledBundleIDs](*(void **)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 32);
  }
  else {
    id v3 = 0;
  }
  return [v3 removeAllObjects];
}

void __41___CDSiriLearningSettings_sharedInstance__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "Unable to access preferences for Siri Learning toggles. Disabling checks.", v1, 2u);
}

void __41___CDSiriLearningSettings_sharedInstance__block_invoke_cold_2(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_18ECEB000, a1, OS_LOG_TYPE_ERROR, "Error checking preferences access (errno %{darwin.errno}d). Attempting checks but they may not work.", (uint8_t *)v3, 8u);
}

void __57___CDSiriLearningSettings_startSanitizingKnowledgeStore___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Failed to delete objects for disabled learning bundles: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end