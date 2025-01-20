@interface NSSetSizeValueAndNotify
@end

@implementation NSSetSizeValueAndNotify

uint64_t ___NSSetSizeValueAndNotify_block_invoke(uint64_t a1)
{
  IMP MethodImplementation = class_getMethodImplementation(**(Class **)(a1 + 40), *(SEL *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  v5.n128_u64[0] = *(void *)(a1 + 56);
  v6.n128_u64[0] = *(void *)(a1 + 64);

  return ((uint64_t (*)(uint64_t, uint64_t, __n128, __n128))MethodImplementation)(v3, v4, v5, v6);
}

@end