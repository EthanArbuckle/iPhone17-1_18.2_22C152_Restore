@interface INSupportedIntentsByExtensions
@end

@implementation INSupportedIntentsByExtensions

uint64_t ___INSupportedIntentsByExtensions_block_invoke(uint64_t a1, void *a2)
{
  return _INIsValidIntentNameForBundleProxy(*(unsigned __int8 *)(a1 + 40), a2, *(void **)(a1 + 32));
}

@end