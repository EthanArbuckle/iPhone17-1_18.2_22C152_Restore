@interface CallRequestCallbackBlock
@end

@implementation CallRequestCallbackBlock

void ___CallRequestCallbackBlock_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  v3 = *(const void **)(a1 + 32);
  _Block_release(v3);
}

@end