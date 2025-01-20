@interface AXSetNextElementCacheUniqueUID
@end

@implementation AXSetNextElementCacheUniqueUID

uint64_t ___AXSetNextElementCacheUniqueUID_block_invoke(uint64_t result)
{
  _ElementCacheUniqueID = *(void *)(result + 32) - 1;
  return result;
}

@end