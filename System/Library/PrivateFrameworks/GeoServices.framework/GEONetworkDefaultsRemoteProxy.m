@interface GEONetworkDefaultsRemoteProxy
@end

@implementation GEONetworkDefaultsRemoteProxy

void __38___GEONetworkDefaultsRemoteProxy_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _networkDefaultsDidChange];
}

void __84___GEONetworkDefaultsRemoteProxy_updateNetworkDefaultsWithReason_completionHandler___block_invoke_192(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__48;
  v26 = __Block_byref_object_dispose__48;
  id v27 = 0;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __84___GEONetworkDefaultsRemoteProxy_updateNetworkDefaultsWithReason_completionHandler___block_invoke_2_193;
  v19 = &unk_1E53D89C0;
  uint64_t v20 = v7;
  v21 = &v22;
  geo_isolate_sync_data();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v8 = (id)v23[5];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v28 count:16];
    }
    while (v9);
  }

  _Block_object_dispose(&v22, 8);
}

uint64_t __84___GEONetworkDefaultsRemoteProxy_updateNetworkDefaultsWithReason_completionHandler___block_invoke_2_193(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v5 removeAllObjects];
}

void __84___GEONetworkDefaultsRemoteProxy_updateNetworkDefaultsWithReason_completionHandler___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 24) count] != 0;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  id v6 = (id)[*(id *)(a1 + 40) copy];
  [v2 addObject:v6];
}

@end