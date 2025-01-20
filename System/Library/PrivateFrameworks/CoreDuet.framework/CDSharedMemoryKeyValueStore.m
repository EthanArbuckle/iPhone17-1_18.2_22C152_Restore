@interface CDSharedMemoryKeyValueStore
@end

@implementation CDSharedMemoryKeyValueStore

void __47___CDSharedMemoryKeyValueStore_setData_forKey___block_invoke(uint64_t a1)
{
  v2 = (uint64_t *)(a1 + 40);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v3)
  {
    v4 = (id *)v3;
    -[_CDSerializableKeyedData setData:](v3, *(void **)(a1 + 48));
    v5 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __47___CDSharedMemoryKeyValueStore_setData_forKey___block_invoke_cold_2(v2, v5);
    }
  }
  else
  {
    v6 = [_CDSerializableKeyedData alloc];
    v7 = *(void **)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    id v14 = 0;
    v4 = -[_CDSerializableKeyedData initWithKey:data:error:]((id *)&v6->super.isa, v7, v8, &v14);
    id v9 = v14;
    if (v9)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;

      goto LABEL_7;
    }
    v10 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __47___CDSharedMemoryKeyValueStore_setData_forKey___block_invoke_cold_1(v2, v10);
    }
    v12 = *(void **)(*(void *)(a1 + 32) + 48);
    if (v4) {
      id Property = objc_getProperty(v4, v11, 24, 1);
    }
    else {
      id Property = 0;
    }
    [v12 setObject:v4 forKeyedSubscript:Property];
  }
  -[_CDSharedMemoryKeyValueStore schedulePersistToShMem](*(void *)(a1 + 32));
LABEL_7:
}

uint64_t __54___CDSharedMemoryKeyValueStore_schedulePersistToShMem__block_invoke(uint64_t a1)
{
  return -[_CDSharedMemoryKeyValueStore _persistToShMem](*(void *)(a1 + 32));
}

void __47___CDSharedMemoryKeyValueStore__persistToShMem__block_invoke(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 24));
  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    uint64_t v2 = a1[4];
    uint64_t v3 = *(void **)(v2 + 24);
    *(void *)(v2 + 24) = 0;

    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1[4] + 48), "count"));
    uint64_t v5 = *(void *)(a1[6] + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = *(id *)(a1[4] + 48);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*(void *)(a1[6] + 8) + 40);
          v13 = objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * v11), (void)v15);
          id v14 = (void *)[v13 copy];
          [v12 addObject:v14];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

void __46___CDSharedMemoryKeyValueStore_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_alloc(*(Class *)(a1 + 32));
  id v5 = [*(id *)(a1 + 32) defaultName];
  uint64_t v3 = -[_CDSharedMemoryKeyValueStore initWithName:size:](v2, v5, [*(id *)(a1 + 32) defaultSize]);
  uint64_t v4 = (void *)sharedInstance_theStore;
  sharedInstance_theStore = (uint64_t)v3;
}

uint64_t __35___CDSharedMemoryKeyValueStore_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.coreduet", "SharedMemoryKeyValueStore");
  uint64_t v1 = log_log;
  log_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __47___CDSharedMemoryKeyValueStore__persistToShMem__block_invoke_19(void *a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v2 = *(id *)(*(void *)(a1[6] + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v43 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    v6 = 0;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(id **)(*((void *)&v25 + 1) + 8 * i);
        if (v9)
        {
          uint64_t v10 = objc_msgSend(v9[1], "length", (void)v25);
          unint64_t v12 = v10 + [v9[4] length] + 18;
          if (v12 > v5)
          {
            id v13 = objc_getProperty(v9, v11, 24, 1);

            unint64_t v5 = v12;
            v6 = v13;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v25 objects:v43 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
    v6 = 0;
  }

  id v14 = +[_CDSharedMemoryKeyValueStore log]();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
  {
    long long v16 = (void *)a1[4];
    if (v16) {
      id Property = objc_getProperty(v16, v15, 24, 1);
    }
    else {
      id Property = 0;
    }
    long long v18 = NSNumber;
    uint64_t v19 = a1[7];
    uint64_t v20 = *(void **)(*(void *)(a1[6] + 8) + 40);
    id v21 = Property;
    v22 = objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
    uint64_t v23 = a1[8];
    uint64_t v24 = *(void *)(a1[5] + 64);

    *(_DWORD *)buf = 138544898;
    id v30 = Property;
    __int16 v31 = 2048;
    uint64_t v32 = v19;
    __int16 v33 = 2112;
    v34 = v22;
    __int16 v35 = 2114;
    v36 = v6;
    __int16 v37 = 2048;
    unint64_t v38 = v5;
    __int16 v39 = 2048;
    uint64_t v40 = v23;
    __int16 v41 = 2048;
    uint64_t v42 = v24;
    _os_log_fault_impl(&dword_18ECEB000, v14, OS_LOG_TYPE_FAULT, "Shared memory exhausted trying to write %{public}@ (%zuB) - %@ entries (largest %{public}@ (%zuB), %zu/%zuB full", buf, 0x48u);
  }
}

void __50___CDSharedMemoryKeyValueStore_syncPersistToShMem__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x192FB2F20]();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -[_CDSharedMemoryKeyValueStore _persistToShMem](*(void *)(a1 + 32));
}

void __50___CDSharedMemoryKeyValueStore_removeDataForKeys___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) removeObjectsForKeys:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  -[_CDSharedMemoryKeyValueStore schedulePersistToShMem](v2);
}

void __43___CDSharedMemoryKeyValueStore_dataForKey___block_invoke(void *a1)
{
  uint64_t v2 = a1 + 5;
  uint64_t v3 = [*(id *)(a1[4] + 48) objectForKeyedSubscript:a1[5]];
  unint64_t v5 = v3;
  if (v3) {
    id Property = objc_getProperty(v3, v4, 32, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v8 = a1[6];
  uint64_t v7 = (uint64_t)(a1 + 6);
  objc_storeStrong((id *)(*(void *)(v8 + 8) + 40), Property);

  uint64_t v9 = *(NSObject **)(*(void *)(v7 - 16) + 40);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __43___CDSharedMemoryKeyValueStore_dataForKey___block_invoke_cold_1(v2, v7, v9);
  }
}

uint64_t __39___CDSharedMemoryKeyValueStore_allKeys__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) allKeys];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

void __47___CDSharedMemoryKeyValueStore_setData_forKey___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_DEBUG, "Set value for key %{public}@", (uint8_t *)&v3, 0xCu);
}

void __47___CDSharedMemoryKeyValueStore_setData_forKey___block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_DEBUG, "Updated value for key %{public}@", (uint8_t *)&v3, 0xCu);
}

void __43___CDSharedMemoryKeyValueStore_dataForKey___block_invoke_cold_1(uint64_t *a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = NSNumber;
  BOOL v5 = *(void *)(*(void *)(*(void *)a2 + 8) + 40) != 0;
  v6 = a3;
  uint64_t v7 = [v4 numberWithInt:v5];
  int v8 = 138543618;
  uint64_t v9 = v3;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_debug_impl(&dword_18ECEB000, v6, OS_LOG_TYPE_DEBUG, "Attempt to retrieve data for key %{public}@ (was present = %@)", (uint8_t *)&v8, 0x16u);
}

@end