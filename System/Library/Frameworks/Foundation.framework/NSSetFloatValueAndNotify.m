@interface NSSetFloatValueAndNotify
@end

@implementation NSSetFloatValueAndNotify

uint64_t ___NSSetFloatValueAndNotify_block_invoke(uint64_t a1)
{
  IMP MethodImplementation = class_getMethodImplementation(**(Class **)(a1 + 40), *(SEL *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  v5.n128_u32[0] = *(_DWORD *)(a1 + 56);

  return ((uint64_t (*)(uint64_t, uint64_t, __n128))MethodImplementation)(v3, v4, v5);
}

@end