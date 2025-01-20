@interface CNUILikenessImageCache
@end

@implementation CNUILikenessImageCache

void __60___CNUILikenessImageCache_initWithCapacity_hasContactStore___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [WeakRetained cache];
  [v4 setObject:0 forKeyedSubscript:v3];
}

void __60___CNUILikenessImageCache_initWithCapacity_hasContactStore___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained emptyCache:0];
}

void __38___CNUILikenessImageCache_emptyCache___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) cache];
  [v1 removeAllObjects];
}

void __71___CNUILikenessImageCache_invalidateCacheEntriesContainingIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) cache];
  id v3 = [v2 allKeys];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v20 + 1) + 8 * v7);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v9 = *(id *)(a1 + 40);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v17;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v9);
              }
              if ([v8 hasContactIdentifier:*(void *)(*((void *)&v16 + 1) + 8 * v13)])
              {
                v14 = [*(id *)(a1 + 32) cache];
                [v14 setObject:0 forKey:v8];
              }
              ++v13;
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }
}

@end