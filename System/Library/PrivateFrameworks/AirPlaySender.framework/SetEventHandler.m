@interface SetEventHandler
@end

@implementation SetEventHandler

void __vdsink_SetEventHandler_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(const void **)(v2 + 88);
  if (v3)
  {
    _Block_release(v3);
    uint64_t v2 = *(void *)(a1 + 40);
  }
  *(void *)(v2 + 88) = *(void *)(a1 + 32);
}

@end