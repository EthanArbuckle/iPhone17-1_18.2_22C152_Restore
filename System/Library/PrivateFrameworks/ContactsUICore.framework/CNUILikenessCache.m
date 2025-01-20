@interface CNUILikenessCache
@end

@implementation CNUILikenessCache

uint64_t __25___CNUILikenessCache_log__block_invoke()
{
  log_cn_once_object_1_1 = (uint64_t)os_log_create("com.apple.contacts.ui", "likeness-cache");
  return MEMORY[0x270F9A758]();
}

void __42___CNUILikenessCache_setUpEvictionHandler__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = [WeakRetained backgroundQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42___CNUILikenessCache_setUpEvictionHandler__block_invoke_2;
  v8[3] = &unk_264018368;
  v8[4] = WeakRetained;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __42___CNUILikenessCache_setUpEvictionHandler__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didEvictCacheEntry:*(void *)(a1 + 40)];
}

void __48___CNUILikenessCache_setUpMemoryPressureWatcher__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained receiveMemoryPressureSignal];
}

id __47___CNUILikenessCache_objectForKey_onCacheMiss___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cache];
  v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [v3 provider];
  }
  else
  {
    v5 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    v6 = [*(id *)(a1 + 32) cache];
    [v6 setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];

    id v4 = [v5 provider];
  }
  return v4;
}

void __33___CNUILikenessCache_emptyCache___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) cache];
  v3 = [v2 allObjects];

  id v4 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v13 = [v3 count];
    _os_log_impl(&dword_20B704000, v4, OS_LOG_TYPE_DEFAULT, "Evicting %lu likenesses from the cache", buf, 0xCu);
  }

  v5 = [*(id *)(a1 + 32) cache];
  [v5 removeAllObjects];

  v6 = [*(id *)(a1 + 32) backgroundQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __33___CNUILikenessCache_emptyCache___block_invoke_11;
  v9[3] = &unk_264018368;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

void __33___CNUILikenessCache_emptyCache___block_invoke_11(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "didEvictCacheEntry:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

@end