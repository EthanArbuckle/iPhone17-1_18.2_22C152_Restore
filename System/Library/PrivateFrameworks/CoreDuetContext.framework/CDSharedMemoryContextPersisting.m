@interface CDSharedMemoryContextPersisting
@end

@implementation CDSharedMemoryContextPersisting

void __57___CDSharedMemoryContextPersisting_saveValue_forKeyPath___block_invoke(uint64_t *a1)
{
  if (![(id)a1[4] isEphemeral]
    || [*(id *)(a1[5] + 32) countForObject:a1[4]])
  {
    v2 = [[_CDContextualKeyPathAndValue alloc] initWithKeyPath:a1[4] andValue:a1[6]];
    id v8 = 0;
    v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v2 requiringSecureCoding:1 error:&v8];
    id v4 = v8;
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __57___CDSharedMemoryContextPersisting_saveValue_forKeyPath___block_invoke_cold_1();
      }
    }
    uint64_t v5 = a1[4];
    v6 = *(void **)(a1[5] + 8);
    v7 = +[_CDSharedMemoryContextPersisting sharedMemoryKeyFromKeyPath:v5];
    [v6 setData:v3 forKey:v7];
  }
}

void __51___CDSharedMemoryContextPersisting_deleteKeyPaths___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEphemeral", (void)v12)
          && ![*(id *)(*(void *)(a1 + 40) + 32) countForObject:v8])
        {
          v9 = +[_CDSharedMemoryContextPersisting sharedMemoryKeyFromKeyPath:v8];
          [v2 addObject:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  v10 = *(void **)(*(void *)(a1 + 40) + 8);
  v11 = [MEMORY[0x1E4F1C978] arrayWithArray:v2];
  [v10 removeDataForKeys:v11];
}

void __53___CDSharedMemoryContextPersisting_saveRegistration___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = [*(id *)(a1 + 32) predicate];
  id v3 = [v2 keyPaths];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        [*(id *)(*(void *)(a1 + 40) + 24) addObject:v8];
        v9 = [*(id *)(a1 + 32) callback];

        if (v9) {
          [*(id *)(*(void *)(a1 + 40) + 32) addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v16 = 0;
  v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v16];
  id v12 = v16;
  if (v12 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __53___CDSharedMemoryContextPersisting_saveRegistration___block_invoke_cold_1();
  }
  uint64_t v13 = *(void *)(a1 + 32);
  long long v14 = *(void **)(*(void *)(a1 + 40) + 8);
  long long v15 = +[_CDSharedMemoryContextPersisting sharedMemoryKeyFromRegistration:v13];
  [v14 setData:v11 forKey:v15];
}

void __55___CDSharedMemoryContextPersisting_deleteRegistration___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = +[_CDSharedMemoryContextPersisting sharedMemoryKeyFromRegistration:*(void *)(a1 + 40)];
  [v2 removeDataForKey:v3];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeObject:", v9, (void)v11);
        uint64_t v10 = [*(id *)(a1 + 40) callback];

        if (v10) {
          [*(id *)(*(void *)(a1 + 32) + 32) removeObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

void __58___CDSharedMemoryContextPersisting_allKeysForContextStore__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (([v7 hasPrefix:@"context.keyPath"] & 1) != 0
          || [v7 hasPrefix:@"context.registration"])
        {
          [*(id *)(a1 + 40) addObject:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __57___CDSharedMemoryContextPersisting_saveValue_forKeyPath___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_18EC9B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@: Error saving data to key value store: %@", v2, 0x16u);
}

void __53___CDSharedMemoryContextPersisting_saveRegistration___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_18EC9B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@: Error saving registration data to key value store: %@", v2, 0x16u);
}

@end