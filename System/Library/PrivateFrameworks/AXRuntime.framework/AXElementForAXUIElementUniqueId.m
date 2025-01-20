@interface AXElementForAXUIElementUniqueId
@end

@implementation AXElementForAXUIElementUniqueId

BOOL ___AXElementForAXUIElementUniqueId_block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuidHash] == *(void *)(a1 + 32);
}

@end