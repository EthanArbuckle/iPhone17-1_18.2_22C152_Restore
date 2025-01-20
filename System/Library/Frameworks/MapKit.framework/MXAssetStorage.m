@interface MXAssetStorage
@end

@implementation MXAssetStorage

void __45___MXAssetStorage_loadAssetForKey_withBlock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];

  if (!v2 && ([*(id *)(*(void *)(a1 + 32) + 24) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
    v3 = dispatch_get_global_queue(21, 0);
    dispatch_async(v3, *(dispatch_block_t *)(a1 + 48));
  }
}

uint64_t __35___MXAssetStorage_setAsset_forKey___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  v3 = *(void **)(a1[5] + 16);
  if (v2) {
    [v3 setObject:v2 forKey:a1[6]];
  }
  else {
    [v3 removeObjectForKey:a1[6]];
  }
  [*(id *)(a1[5] + 24) removeObject:a1[6]];
  v4 = [*(id *)(a1[5] + 32) objectForKey:a1[6]];
  uint64_t v5 = [v4 copy];
  uint64_t v6 = *(void *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = a1[6];
  v9 = *(void **)(a1[5] + 32);

  return [v9 removeObjectForKey:v8];
}

void __35___MXAssetStorage_setAsset_forKey___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void __47___MXAssetStorage_fetchAssetForKey_completion___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[7] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    id v6 = [*(id *)(a1[4] + 32) objectForKey:a1[5]];
    if (!v6)
    {
      id v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
      objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKey:");
    }
    uint64_t v5 = (void *)MEMORY[0x18C139AE0](a1[6]);
    [v6 addObject:v5];
  }
}

@end