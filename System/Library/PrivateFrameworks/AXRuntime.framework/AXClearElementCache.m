@interface AXClearElementCache
@end

@implementation AXClearElementCache

uint64_t ___AXClearElementCache_block_invoke()
{
  return [(id)_ElementCache removeAllObjects];
}

@end