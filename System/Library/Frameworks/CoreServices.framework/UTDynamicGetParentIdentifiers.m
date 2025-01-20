@interface UTDynamicGetParentIdentifiers
@end

@implementation UTDynamicGetParentIdentifiers

void ___UTDynamicGetParentIdentifiers_block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (id)[a2 copy];
  objc_msgSend(v2, "addObject:");
}

@end