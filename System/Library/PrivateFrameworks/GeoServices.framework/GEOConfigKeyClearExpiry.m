@interface GEOConfigKeyClearExpiry
@end

@implementation GEOConfigKeyClearExpiry

void ___GEOConfigKeyClearExpiry_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  v5 = _GEOConfigProxy();
  id v6 = [v5 configExpiryForOptions:a3];

  [v6 clearConfigKeyExpiry:v4];
}

@end