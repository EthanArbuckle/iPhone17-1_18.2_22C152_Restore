@interface AXInitializeElementCache
@end

@implementation AXInitializeElementCache

void ___AXInitializeElementCache_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:1282 valueOptions:1282];
  v1 = (void *)_ElementCache;
  _ElementCache = v0;

  _ElementCacheLock = 0;
}

@end