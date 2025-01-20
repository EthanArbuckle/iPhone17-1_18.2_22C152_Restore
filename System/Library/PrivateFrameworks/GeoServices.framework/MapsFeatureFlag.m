@interface MapsFeatureFlag
@end

@implementation MapsFeatureFlag

uint64_t __MapsFeatureFlag_AddBlockListener_block_invoke(uint64_t a1)
{
  uint64_t result = GEOIsFeatureActive(*(void **)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned __int8 *)(v3 + 24) != result)
  {
    *(unsigned char *)(v3 + 24) = result;
    v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v4();
  }
  return result;
}

void __MapsFeatureFlag_AddDelegateListener_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained valueChangedForMapsFeatureFlag:v7 enabled:a3];
  }
  else {
    MapsFeatureFlag_RemoveBlockListener(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  }
}

void __MapsFeatureFlag_AddDelegateListener_block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 objectForKey:*(void *)(a1 + 32)];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 arrayByAddingObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  [v8 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:*(void *)(a1 + 32)];
}

void __MapsFeatureFlag_RemoveDelegateListenerForAllKeys_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 objectForKey:v3];
  MapsFeatureFlag_RemoveBlockListener(v5);
  [v4 removeObjectForKey:*(void *)(a1 + 32)];
}

@end