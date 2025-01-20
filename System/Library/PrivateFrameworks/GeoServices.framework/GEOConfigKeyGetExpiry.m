@interface GEOConfigKeyGetExpiry
@end

@implementation GEOConfigKeyGetExpiry

void ___GEOConfigKeyGetExpiry_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = _GEOConfigProxy();
  v7 = [v6 configExpiryForOptions:a3];

  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  uint64_t v11 = *(void *)(v8 + 8);
  id v12 = *(id *)(v11 + 40);
  id obj = v10;
  [v7 getConfigKeyExpiry:v5 date:&obj osVersion:&v12];

  objc_storeStrong((id *)(v9 + 40), obj);
  objc_storeStrong((id *)(v11 + 40), v12);
}

@end