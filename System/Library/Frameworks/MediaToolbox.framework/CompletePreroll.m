@interface CompletePreroll
@end

@implementation CompletePreroll

void __customVideoCompositor_CompletePreroll_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void (**)(void, void, void))(v2 + 200);
  if (v3) {
    v3(*(void *)(v2 + 208), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  }
  v4 = *(const void **)(a1 + 40);
  if (v4)
  {
    CFRelease(v4);
  }
}

@end