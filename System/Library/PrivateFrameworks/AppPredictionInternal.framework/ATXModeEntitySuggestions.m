@interface ATXModeEntitySuggestions
- (void)suggestedBundleIDsForAllowListWithCompletion:(id)a3;
- (void)suggestedBundleIDsForDenyListWithCompletion:(id)a3;
@end

@implementation ATXModeEntitySuggestions

- (void)suggestedBundleIDsForAllowListWithCompletion:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = dispatch_group_create();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  allModesForTraining();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = [*(id *)(*((void *)&v25 + 1) + 8 * v9) unsignedIntegerValue];
        v11 = objc_opt_new();
        v12 = ATXModeToString();
        [v3 setObject:v11 forKeyedSubscript:v12];

        dispatch_group_enter(v5);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __73__ATXModeEntitySuggestions_suggestedBundleIDsForAllowListWithCompletion___block_invoke;
        v21[3] = &unk_1E68AC648;
        v22 = v5;
        id v23 = v3;
        uint64_t v24 = v10;
        [v4 recommendedAndCandidateAllowedAppsForMode:v10 reply:v21];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  v13 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__ATXModeEntitySuggestions_suggestedBundleIDsForAllowListWithCompletion___block_invoke_2;
  block[3] = &unk_1E68ABB98;
  id v19 = v3;
  id v20 = v16;
  id v14 = v3;
  id v15 = v16;
  dispatch_group_notify(v5, v13, block);
}

void __73__ATXModeEntitySuggestions_suggestedBundleIDsForAllowListWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __73__ATXModeEntitySuggestions_suggestedBundleIDsForAllowListWithCompletion___block_invoke_cold_1((uint64_t)v6, v7);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    uint64_t v8 = [v5 recommendedApps];
    uint64_t v9 = objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_15);

    id v10 = *(id *)(a1 + 40);
    objc_sync_enter(v10);
    v11 = *(void **)(a1 + 40);
    v12 = ATXModeToString();
    [v11 setObject:v9 forKeyedSubscript:v12];

    objc_sync_exit(v10);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

uint64_t __73__ATXModeEntitySuggestions_suggestedBundleIDsForAllowListWithCompletion___block_invoke_12(uint64_t a1, void *a2)
{
  return [a2 bundleId];
}

uint64_t __73__ATXModeEntitySuggestions_suggestedBundleIDsForAllowListWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)suggestedBundleIDsForDenyListWithCompletion:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  id v5 = dispatch_group_create();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  allModesForTraining();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = [*(id *)(*((void *)&v25 + 1) + 8 * v9) unsignedIntegerValue];
        v11 = objc_opt_new();
        v12 = ATXModeToString();
        [v3 setObject:v11 forKeyedSubscript:v12];

        dispatch_group_enter(v5);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __72__ATXModeEntitySuggestions_suggestedBundleIDsForDenyListWithCompletion___block_invoke;
        v21[3] = &unk_1E68AC648;
        v22 = v5;
        id v23 = v3;
        uint64_t v24 = v10;
        [v4 recommendedAndCandidateDeniedAppsForMode:v10 reply:v21];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  v13 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__ATXModeEntitySuggestions_suggestedBundleIDsForDenyListWithCompletion___block_invoke_2;
  block[3] = &unk_1E68ABB98;
  id v19 = v3;
  id v20 = v16;
  id v14 = v3;
  id v15 = v16;
  dispatch_group_notify(v5, v13, block);
}

void __72__ATXModeEntitySuggestions_suggestedBundleIDsForDenyListWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __72__ATXModeEntitySuggestions_suggestedBundleIDsForDenyListWithCompletion___block_invoke_cold_1((uint64_t)v6, v7);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    uint64_t v8 = [v5 recommendedApps];
    uint64_t v9 = objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_18);

    id v10 = *(id *)(a1 + 40);
    objc_sync_enter(v10);
    v11 = *(void **)(a1 + 40);
    v12 = ATXModeToString();
    [v11 setObject:v9 forKeyedSubscript:v12];

    objc_sync_exit(v10);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

uint64_t __72__ATXModeEntitySuggestions_suggestedBundleIDsForDenyListWithCompletion___block_invoke_16(uint64_t a1, void *a2)
{
  return [a2 bundleId];
}

uint64_t __72__ATXModeEntitySuggestions_suggestedBundleIDsForDenyListWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __73__ATXModeEntitySuggestions_suggestedBundleIDsForAllowListWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Could not get recommended and candidate allowed apps: %@", (uint8_t *)&v2, 0xCu);
}

void __72__ATXModeEntitySuggestions_suggestedBundleIDsForDenyListWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Could not get recommended and candidate denied apps: %@", (uint8_t *)&v2, 0xCu);
}

@end