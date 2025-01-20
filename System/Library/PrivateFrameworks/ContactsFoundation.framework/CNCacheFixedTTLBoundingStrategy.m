@interface CNCacheFixedTTLBoundingStrategy
@end

@implementation CNCacheFixedTTLBoundingStrategy

uint64_t __73___CNCacheFixedTTLBoundingStrategy_willUpdateCacheBy_forKey_keysToEvict___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldEvictKey:a2];
}

@end