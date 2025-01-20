@interface GEOConfigKeySetExpiry
@end

@implementation GEOConfigKeySetExpiry

void ___GEOConfigKeySetExpiry_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = _GEOConfigProxy();
  id v7 = [v6 configExpiryForOptions:a3];

  [v7 setConfigKeyExpiry:v5 date:*(void *)(a1 + 32) osVersion:*(void *)(a1 + 40)];
}

@end