@interface INRequiredIntentsSetForExtensionAttributesKey
@end

@implementation INRequiredIntentsSetForExtensionAttributesKey

uint64_t ___INRequiredIntentsSetForExtensionAttributesKey_block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  v5 = [v2 objectForKey:v3];
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

@end