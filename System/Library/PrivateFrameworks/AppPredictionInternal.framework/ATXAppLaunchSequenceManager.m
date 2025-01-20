@interface ATXAppLaunchSequenceManager
@end

@implementation ATXAppLaunchSequenceManager

void __46___ATXAppLaunchSequenceManager_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  v1 = objc_alloc_init(_ATXAppLaunchSequenceManager);
  v2 = (void *)sharedInstance__pasExprOnceResult_28;
  sharedInstance__pasExprOnceResult_28 = (uint64_t)v1;
}

void __50___ATXAppLaunchSequenceManager_initWithDataStore___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained deleteAllLaunchesForBundles:v3];

  id v5 = objc_loadWeakRetained(v2);
  [v5 deleteAllLaunchesForAppActions:v3];
}

void __56___ATXAppLaunchSequenceManager_launchSequenceForBundle___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id v5 = [[_ATXAppLaunchSequence alloc] initWithPreviousLaunch:a1[5] dataStore:*(void *)(a1[4] + 8)];
    uint64_t v6 = *(void *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = a1[5];
    v9 = *(void **)(a1[4] + 16);
    uint64_t v10 = *(void *)(*(void *)(a1[6] + 8) + 40);
    [v9 setObject:v10 forKey:v8];
  }
}

void __59___ATXAppLaunchSequenceManager_launchSequenceForAppAction___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id v5 = [[_ATXAppLaunchSequence alloc] initWithPreviousAppActionLaunch:a1[5] dataStore:*(void *)(a1[4] + 8)];
    uint64_t v6 = *(void *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = a1[5];
    v9 = *(void **)(a1[4] + 24);
    uint64_t v10 = *(void *)(*(void *)(a1[6] + 8) + 40);
    [v9 setObject:v10 forKey:v8];
  }
}

void __74___ATXAppLaunchSequenceManager_decayAllLaunchSequencesWithHalfLifeInDays___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v3 = objc_opt_new();
  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74___ATXAppLaunchSequenceManager_decayAllLaunchSequencesWithHalfLifeInDays___block_invoke_2;
  v17[3] = &unk_1E68B1220;
  id v5 = v3;
  id v18 = v5;
  [v4 enumerateAppInfoBundlesExecutingBlock:v17];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKey:", v11, (void)v13);
        v12 = (_ATXAppLaunchSequence *)objc_claimAutoreleasedReturnValue();
        if (!v12) {
          v12 = [[_ATXAppLaunchSequence alloc] initWithPreviousLaunch:v11 dataStore:*(void *)(*(void *)(a1 + 32) + 8)];
        }
        [(_ATXAppLaunchSequence *)v12 decayWithHalfLifeInDays:*(double *)(a1 + 40)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v8);
  }
}

uint64_t __74___ATXAppLaunchSequenceManager_decayAllLaunchSequencesWithHalfLifeInDays___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __83___ATXAppLaunchSequenceManager_decayAllAppActionLaunchSequencesWithHalfLifeInDays___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v3 = objc_opt_new();
  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83___ATXAppLaunchSequenceManager_decayAllAppActionLaunchSequencesWithHalfLifeInDays___block_invoke_2;
  v17[3] = &unk_1E68B1220;
  id v5 = v3;
  id v18 = v5;
  [v4 enumerateAppInfoAppActionsExecutingBlock:v17];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKey:", v11, (void)v13);
        v12 = (_ATXAppLaunchSequence *)objc_claimAutoreleasedReturnValue();
        if (!v12) {
          v12 = [[_ATXAppLaunchSequence alloc] initWithPreviousAppActionLaunch:v11 dataStore:*(void *)(*(void *)(a1 + 32) + 8)];
        }
        [(_ATXAppLaunchSequence *)v12 decayWithHalfLifeInDays:*(double *)(a1 + 40)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v8);
  }
}

uint64_t __83___ATXAppLaunchSequenceManager_decayAllAppActionLaunchSequencesWithHalfLifeInDays___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __60___ATXAppLaunchSequenceManager_deleteAllLaunchesForBundles___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v3 = objc_opt_new();
  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __60___ATXAppLaunchSequenceManager_deleteAllLaunchesForBundles___block_invoke_2;
  v29[3] = &unk_1E68B27C0;
  id v30 = *(id *)(a1 + 40);
  id v5 = v3;
  id v31 = v5;
  [v4 enumerateAppInfoBundlesExecutingBlock:v29];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v12 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v11];
        if (!v12) {
          v12 = [[_ATXAppLaunchSequence alloc] initWithPreviousLaunch:v11 dataStore:*(void *)(*(void *)(a1 + 32) + 8)];
        }
        [(_ATXAppLaunchSequence *)v12 deleteDataForLaunches:*(void *)(a1 + 40)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v8);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8 * j);
        v19 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKey:", v18, (void)v21);
        uint64_t v20 = v19;
        if (v19)
        {
          [v19 deleteAllInformation];
          [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:v18];
        }
        else
        {
          [*(id *)(*(void *)(a1 + 32) + 8) deleteLaunchesFollowingBundle:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v32 count:16];
    }
    while (v15);
  }
}

void __60___ATXAppLaunchSequenceManager_deleteAllLaunchesForBundles___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void __63___ATXAppLaunchSequenceManager_deleteAllLaunchesForAppActions___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D25F6CC0]();
  id v3 = objc_opt_new();
  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __63___ATXAppLaunchSequenceManager_deleteAllLaunchesForAppActions___block_invoke_2;
  v29[3] = &unk_1E68B27C0;
  id v30 = *(id *)(a1 + 40);
  id v5 = v3;
  id v31 = v5;
  [v4 enumerateAppInfoAppActionsExecutingBlock:v29];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v12 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:v11];
        if (!v12) {
          v12 = [[_ATXAppLaunchSequence alloc] initWithPreviousAppActionLaunch:v11 dataStore:*(void *)(*(void *)(a1 + 32) + 8)];
        }
        [(_ATXAppLaunchSequence *)v12 deleteDataForLaunches:*(void *)(a1 + 40)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v8);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8 * j);
        v19 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKey:", v18, (void)v21);
        uint64_t v20 = v19;
        if (v19)
        {
          [v19 deleteAllInformation];
          [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:v18];
        }
        else
        {
          [*(id *)(*(void *)(a1 + 32) + 8) deleteLaunchesFollowingAppAction:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v32 count:16];
    }
    while (v15);
  }
}

void __63___ATXAppLaunchSequenceManager_deleteAllLaunchesForAppActions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

uint64_t __46___ATXAppLaunchSequenceManager_launchSequence__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) appLaunchSequence];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __65___ATXAppLaunchSequenceManager_addBundleIdToLaunchSequence_date___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 8) addAppLaunchForAppLaunchSequence:a1[5] date:a1[6]];
}

@end