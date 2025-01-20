@interface AXIsInElementCache
@end

@implementation AXIsInElementCache

void ___AXIsInElementCache_block_invoke(uint64_t a1)
{
  v2 = NSMapGet((NSMapTable *)_ElementCache, (const void *)~*(void *)(a1 + 40));
  if (v2) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2[2];
  }
}

@end