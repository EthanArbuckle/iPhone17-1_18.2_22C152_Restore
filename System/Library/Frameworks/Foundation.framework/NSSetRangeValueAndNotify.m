@interface NSSetRangeValueAndNotify
@end

@implementation NSSetRangeValueAndNotify

uint64_t ___NSSetRangeValueAndNotify_block_invoke(uint64_t a1)
{
  IMP MethodImplementation = class_getMethodImplementation(**(Class **)(a1 + 40), *(SEL *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))MethodImplementation)(v3, v4, v5, v6);
}

@end