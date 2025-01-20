@interface MDExtensionManager
@end

@implementation MDExtensionManager

void __79___MDExtensionManager_indexRequestsPerformDataJob_forBundle_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
  v3 = [WeakRetained getProviderIDForBundle:*(void *)(a1 + 40)];

  v4 = [*(id *)(a1 + 48) fileType];

  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    v6 = [*(id *)(a1 + 48) fileType];
    v7 = [v5 extensionForFileType:v6];
  }
  else
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __79___MDExtensionManager_indexRequestsPerformDataJob_forBundle_completionHandler___block_invoke_2;
    v17 = &unk_1E554CD18;
    id v18 = *(id *)(a1 + 40);
    id v19 = v3;
    v7 = [v5 anyExtensionWithBlock:&v14];
    v8 = objc_msgSend(v7, "containerID", v14, v15, v16, v17);
    char v9 = [v8 isEqualToString:*(void *)(a1 + 40)];

    if ((v9 & 1) == 0) {
      [*(id *)(a1 + 48) setExtensionBundleID:*(void *)(a1 + 40)];
    }
  }
  v10 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v7;
    _os_log_impl(&dword_18D0E3000, v10, OS_LOG_TYPE_INFO, "~~~ Extension to use: %@", buf, 0xCu);
  }

  if (v7)
  {
    [v7 performJob:*(void *)(a1 + 48) completionBlock:*(void *)(a1 + 56)];
  }
  else
  {
    v11 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *(void **)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v21 = v12;
      __int16 v22 = 2112;
      uint64_t v23 = v13;
      _os_log_impl(&dword_18D0E3000, v11, OS_LOG_TYPE_INFO, "~~~ Couldn't find an indexing extension for bundleID:%@, job:%@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __57___MDExtensionManager_findExtensionsWithCompletionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v7 = a5;
    id v8 = [a2 allValues];
    (*(void (**)(uint64_t, id, id))(v5 + 16))(v5, v8, v7);
  }
}

void __49___MDExtensionManager__notifyForLoadedExtensions__block_invoke()
{
  v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"_MDIndexExtensionsLoadedNotification" object:0];

  id v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"_MDImportExtensionsLoadedNotification" object:0];
}

uint64_t __44___MDExtensionManager_extensionForFileType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44___MDExtensionManager_extensionForFileType___block_invoke_cold_1(v3, v4);
  }

  uint64_t v5 = [v3 supportedFileTypes];
  uint64_t v6 = [v5 containsObject:*(void *)(a1 + 32)];

  return v6;
}

id __47___MDExtensionManager__willRunJobWithBundleID___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v4 = @"bundleid";
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

id __48___MDExtensionManager__didRetryJobWithBundleID___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v4 = @"bundleid";
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

void __91___MDExtensionManager__performJob_extensions_count_throttle_perExtensionCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x192F99810]();
  if ([*(id *)(a1 + 32) count])
  {
    if (*(void *)(a1 + 72) <= 1uLL) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v3];
    uint64_t v5 = [*(id *)(a1 + 32) objectEnumerator];
    do
    {
      uint64_t v6 = [v5 nextObject];
      if (!v6) {
        break;
      }
      id v7 = (void *)v6;
      [v4 addObject:v6];

      --v3;
    }
    while (v3);
    objc_msgSend(*(id *)(a1 + 32), "removeObjectsInArray:", v4, v5);
    long long v35 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v14 = [v13 containerID];
          uint64_t v15 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138412546;
            uint64_t v37 = v16;
            __int16 v38 = 2112;
            v39 = v13;
            _os_log_impl(&dword_18D0E3000, v15, OS_LOG_TYPE_DEFAULT, "### [SpotlightClient] _MDExtensionManager#_performJob Performing job:%@, extension:%@", buf, 0x16u);
          }

          [*(id *)(a1 + 48) _willRunJobWithBundleID:v14];
          v17 = *(void **)(a1 + 40);
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __91___MDExtensionManager__performJob_extensions_count_throttle_perExtensionCompletionHandler___block_invoke_56;
          v24[3] = &unk_1E554CC78;
          id v18 = v17;
          id v25 = v18;
          v26 = v13;
          id v19 = *(id *)(a1 + 56);
          uint64_t v20 = *(void *)(a1 + 48);
          id v27 = v19;
          uint64_t v28 = v20;
          id v29 = *(id *)(a1 + 32);
          id v21 = *(id *)(a1 + 64);
          id v30 = v14;
          id v31 = v21;
          id v22 = v14;
          [v13 performJob:v18 completionBlock:v24];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v10);
    }
  }
}

void __91___MDExtensionManager__performJob_extensions_count_throttle_perExtensionCompletionHandler___block_invoke_56(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v6)
  {
    id v21 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      __91___MDExtensionManager__performJob_extensions_count_throttle_perExtensionCompletionHandler___block_invoke_56_cold_1();
    }
    goto LABEL_13;
  }
  id v8 = [v6 domain];
  char v9 = [v8 isEqualToString:@"CSIndexErrorDomain"];

  if (v9) {
    goto LABEL_9;
  }
  uint64_t v10 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __91___MDExtensionManager__performJob_extensions_count_throttle_perExtensionCompletionHandler___block_invoke_56_cold_2();
  }

  uint64_t v11 = [*(id *)(a1 + 48) nextDispatchTimeDeltaForExtension:*(void *)(a1 + 40) job:*(void *)(a1 + 32) memoryPressure:sUnderMemoryPressure];
  if (v11 < 1)
  {
LABEL_9:
    id v21 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __91___MDExtensionManager__performJob_extensions_count_throttle_perExtensionCompletionHandler___block_invoke_56_cold_2();
    }
LABEL_13:

    uint64_t v22 = *(void *)(a1 + 80);
    if (v22)
    {
      (*(void (**)(uint64_t, void, void *))(v22 + 16))(v22, *(void *)(a1 + 72), v7);
      uint64_t v23 = *(void *)(a1 + 80);
    }
    else
    {
      uint64_t v23 = 0;
    }
    [*(id *)(a1 + 56) _performJob:*(void *)(a1 + 32) extensions:*(void *)(a1 + 64) count:1 throttle:*(void *)(a1 + 48) perExtensionCompletionHandler:v23];
    goto LABEL_17;
  }
  unint64_t v12 = v11;
  uint64_t v13 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    uint64_t v33 = v14;
    __int16 v34 = 2112;
    uint64_t v35 = v15;
    __int16 v36 = 2048;
    unint64_t v37 = v12 / 0x3B9ACA00;
    _os_log_impl(&dword_18D0E3000, v13, OS_LOG_TYPE_DEFAULT, "Rescheduling job:%@, extension:%@, delta:%llds", buf, 0x20u);
  }

  dispatch_time_t v16 = dispatch_time(0, v12);
  v17 = *(NSObject **)(*(void *)(a1 + 56) + 72);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91___MDExtensionManager__performJob_extensions_count_throttle_perExtensionCompletionHandler___block_invoke_57;
  block[3] = &unk_1E554CC50;
  id v18 = *(id *)(a1 + 64);
  uint64_t v20 = *(void **)(a1 + 32);
  uint64_t v19 = *(void *)(a1 + 40);
  id v25 = v18;
  uint64_t v26 = v19;
  uint64_t v27 = *(void *)(a1 + 56);
  id v28 = v20;
  id v29 = *(id *)(a1 + 48);
  id v31 = *(id *)(a1 + 80);
  id v30 = *(id *)(a1 + 72);
  dispatch_after(v16, v17, block);

LABEL_17:
}

uint64_t __91___MDExtensionManager__performJob_extensions_count_throttle_perExtensionCompletionHandler___block_invoke_57(uint64_t a1)
{
  [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) _performJob:*(void *)(a1 + 56) extensions:*(void *)(a1 + 32) count:1 throttle:*(void *)(a1 + 64) perExtensionCompletionHandler:*(void *)(a1 + 80)];
  v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 72);

  return [v2 _didRetryJobWithBundleID:v3];
}

void __94___MDExtensionManager__performJob_extensions_perExtensionCompletionHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v3);
}

void __94___MDExtensionManager__performJob_extensions_perExtensionCompletionHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x192F99810]();
  uint64_t v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __94___MDExtensionManager__performJob_extensions_perExtensionCompletionHandler_completionHandler___block_invoke_2_cold_1(a1, v3);
  }

  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

void __75___MDExtensionManager_indexRequestsPerformJob_forBundle_completionHandler___block_invoke(uint64_t a1)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x192F99810]();
  uint64_t v3 = [*(id *)(a1 + 32) fileType];

  uint64_t v4 = *(void **)(a1 + 40);
  if (v3)
  {
    id v5 = v22;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __75___MDExtensionManager_indexRequestsPerformJob_forBundle_completionHandler___block_invoke_2;
    v22[3] = &unk_1E554CC00;
    id v6 = (id *)(a1 + 32);
  }
  else
  {
    id v5 = &v18;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __75___MDExtensionManager_indexRequestsPerformJob_forBundle_completionHandler___block_invoke_3;
    id v21 = &unk_1E554CC00;
    id v6 = (id *)(a1 + 48);
  }
  v5[4] = (uint64_t)*v6;
  id v7 = [v4 anyExtensionWithBlock:v5];

  if (v7)
  {
    id v8 = [v7 containerID];
    char v9 = [v8 isEqualToString:*(void *)(a1 + 48)];

    if ((v9 & 1) == 0) {
      [*(id *)(a1 + 32) setExtensionBundleID:*(void *)(a1 + 48)];
    }
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(a1 + 40);
    v23[0] = v7;
    unint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v23, 1, v18, v19, v20, v21);
    [v10 _performJob:v11 extensions:v12 perExtensionCompletionHandler:0 completionHandler:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v13 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __75___MDExtensionManager_indexRequestsPerformJob_forBundle_completionHandler___block_invoke_cold_1();
    }

    uint64_t v17 = *(void *)(a1 + 56);
    if (v17) {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 16))(v17, v14, v15, v16);
    }
  }
}

uint64_t __75___MDExtensionManager_indexRequestsPerformJob_forBundle_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 supportedFileTypes];
  uint64_t v4 = [*(id *)(a1 + 32) fileType];
  uint64_t v5 = [v3 containsObject:v4];

  return v5;
}

uint64_t __75___MDExtensionManager_indexRequestsPerformJob_forBundle_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 containerID];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v5 = 1;
  }
  else
  {
    id v6 = [v3 identifiers];
    uint64_t v5 = [v6 containsObject:*(void *)(a1 + 32)];
  }
  return v5;
}

void __95___MDExtensionManager_indexRequestsPerformJob_perExtensionCompletionHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x192F99810]();
  id v3 = [*(id *)(a1 + 32) extensions];
  if ([v3 count])
  {
    [*(id *)(a1 + 32) _performJob:*(void *)(a1 + 40) extensions:v3 perExtensionCompletionHandler:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v4 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __95___MDExtensionManager_indexRequestsPerformJob_perExtensionCompletionHandler_completionHandler___block_invoke_cold_1(a1, v4);
    }

    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
}

void __106___MDExtensionManager_indexRequestsPerformJob_forBundles_perExtensionCompletionHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x192F99810]();
  id v3 = [*(id *)(a1 + 32) fileType];

  if (v3)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __106___MDExtensionManager_indexRequestsPerformJob_forBundles_perExtensionCompletionHandler_completionHandler___block_invoke_2;
    v23[3] = &unk_1E554CC00;
    uint64_t v4 = *(void **)(a1 + 40);
    id v24 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 anyExtensionWithBlock:v23];
    if (v5)
    {
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObject:v5];
    }
    else
    {
      id v6 = 0;
    }

    id v7 = v24;
  }
  else
  {
    id v7 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v14 = *(void **)(a1 + 40);
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __106___MDExtensionManager_indexRequestsPerformJob_forBundles_perExtensionCompletionHandler_completionHandler___block_invoke_3;
          v18[3] = &unk_1E554CC00;
          v18[4] = v13;
          uint64_t v15 = [v14 anyExtensionWithBlock:v18];
          if (v15) {
            [v7 addObject:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v10);
    }

    if ([v7 count]) {
      id v6 = (void *)[v7 copy];
    }
    else {
      id v6 = 0;
    }
  }

  if ([v6 count])
  {
    [*(id *)(a1 + 40) _performJob:*(void *)(a1 + 32) extensions:v6 perExtensionCompletionHandler:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v16 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __106___MDExtensionManager_indexRequestsPerformJob_forBundles_perExtensionCompletionHandler_completionHandler___block_invoke_cold_1();
    }

    uint64_t v17 = *(void *)(a1 + 56);
    if (v17) {
      (*(void (**)(void))(v17 + 16))();
    }
  }
}

uint64_t __106___MDExtensionManager_indexRequestsPerformJob_forBundles_perExtensionCompletionHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 supportedFileTypes];
  uint64_t v4 = [*(id *)(a1 + 32) fileType];
  uint64_t v5 = [v3 containsObject:v4];

  return v5;
}

uint64_t __106___MDExtensionManager_indexRequestsPerformJob_forBundles_perExtensionCompletionHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 containerID];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v5 = 1;
  }
  else
  {
    id v6 = [v3 identifiers];
    uint64_t v5 = [v6 containsObject:*(void *)(a1 + 32)];
  }
  return v5;
}

void __106___MDExtensionManager_indexRequestsPerformJob_extensions_perExtensionCompletionHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x192F99810]();
  [*(id *)(a1 + 32) _performJob:*(void *)(a1 + 40) extensions:*(void *)(a1 + 48) perExtensionCompletionHandler:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

uint64_t __79___MDExtensionManager_indexRequestsPerformDataJob_forBundle_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 containerID];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v5 = 1;
  }
  else
  {
    id v6 = [v3 identifiers];
    id v7 = v6;
    uint64_t v8 = *(void *)(a1 + 40);
    if (!v8) {
      uint64_t v8 = *(void *)(a1 + 32);
    }
    uint64_t v5 = [v6 containsObject:v8];
  }
  return v5;
}

void __44___MDExtensionManager_extensionForFileType___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 supportedFileTypes];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_DEBUG, "~~~ supportedTypes: %@", v4, 0xCu);
}

void __91___MDExtensionManager__performJob_extensions_count_throttle_perExtensionCompletionHandler___block_invoke_56_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_18D0E3000, v0, OS_LOG_TYPE_DEBUG, "Finished job:%@, extension:%@", v1, 0x16u);
}

void __91___MDExtensionManager__performJob_extensions_count_throttle_perExtensionCompletionHandler___block_invoke_56_cold_2()
{
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_5_0(&dword_18D0E3000, v0, v1, "Failed to complete job:%@, extension:%@, error:%@");
}

void __94___MDExtensionManager__performJob_extensions_perExtensionCompletionHandler_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_DEBUG, "Finished job:%@ with %ld indexing extensions", (uint8_t *)&v4, 0x16u);
}

void __75___MDExtensionManager_indexRequestsPerformJob_forBundle_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_18D0E3000, v0, v1, "Couldn't find an indexing extension for bundleID:%@, job:%@");
}

void __95___MDExtensionManager_indexRequestsPerformJob_perExtensionCompletionHandler_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_ERROR, "Failed to find any indexing extensions for job:%@", (uint8_t *)&v3, 0xCu);
}

void __106___MDExtensionManager_indexRequestsPerformJob_forBundles_perExtensionCompletionHandler_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_18D0E3000, v0, v1, "Couldn't find any indexing extensions for bundleIDs:%@, job:%@");
}

@end