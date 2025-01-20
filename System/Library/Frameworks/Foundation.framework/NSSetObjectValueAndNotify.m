@interface NSSetObjectValueAndNotify
@end

@implementation NSSetObjectValueAndNotify

uint64_t ___NSSetObjectValueAndNotify_block_invoke(uint64_t a1)
{
  IMP MethodImplementation = class_getMethodImplementation(**(Class **)(a1 + 48), *(SEL *)(a1 + 56));
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))MethodImplementation)(v4, v3, v5);
}

@end