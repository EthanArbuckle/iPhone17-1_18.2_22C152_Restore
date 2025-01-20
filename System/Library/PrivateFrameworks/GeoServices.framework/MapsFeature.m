@interface MapsFeature
@end

@implementation MapsFeature

void __MapsFeature_AddDelegateListener_block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = [v8 objectForKey:*(void *)(a1 + 32)];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 arrayByAddingObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  [v8 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:*(void *)(a1 + 32)];
}

uint64_t __MapsFeature_AddBlockListener_block_invoke(uint64_t a1)
{
  uint64_t result = MapsFeature_IsEnabled(*(void *)(a1 + 48), *(void **)(a1 + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned __int8 *)(v3 + 24) != result)
  {
    *(unsigned char *)(v3 + 24) = result;
    v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v4();
  }
  return result;
}

void __MapsFeature_AddDelegateListener_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "valueChangedForMapsFeature:enabled:", *(void *)(a1 + 48), *(void *)(a1 + 56), a4);
  }
  else {
    MapsFeature_RemoveBlockListener(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  }
}

void __MapsFeature_RemoveDelegateListenerForAllKeys_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 objectForKey:v3];
  MapsFeature_RemoveBlockListener(v5);
  [v4 removeObjectForKey:*(void *)(a1 + 32)];
}

@end