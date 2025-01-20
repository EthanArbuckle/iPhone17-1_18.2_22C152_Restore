@interface GEOConfigKeyIsExpired
@end

@implementation GEOConfigKeyIsExpired

void ___GEOConfigKeyIsExpired_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = _GEOConfigProxy();
  id v7 = [v6 configExpiryForOptions:a3];

  LOBYTE(a3) = [v7 getConfigKeyIsExpired:v5];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
}

@end