@interface Deactivate
@end

@implementation Deactivate

void __endpoint_Deactivate_block_invoke(uint64_t a1)
{
  (*(void (**)(void, void, void, void, void))(a1 + 32))(*(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), 0, *(void *)(a1 + 64));
  v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

@end