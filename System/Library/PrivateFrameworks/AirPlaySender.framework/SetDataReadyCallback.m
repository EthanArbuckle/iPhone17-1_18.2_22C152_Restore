@interface SetDataReadyCallback
@end

@implementation SetDataReadyCallback

void __carplaySource_SetDataReadyCallback_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 248) = 0;
  *(void *)(*(void *)(a1 + 32) + 256) = 0;
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 200);
  if (v2)
  {
    dispatch_release(v2);
    *(void *)(*(void *)(a1 + 32) + 200) = 0;
  }
}

void __carplaySource_SetDataReadyCallback_block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 200) = *(void *)(a1 + 40);
  dispatch_retain(*(dispatch_object_t *)(*(void *)(a1 + 32) + 200));
  *(void *)(*(void *)(a1 + 32) + 248) = *(void *)(a1 + 48);
  *(void *)(*(void *)(a1 + 32) + 256) = *(void *)(a1 + 56);
  *(_DWORD *)(*(void *)(a1 + 32) + 100) = *(_DWORD *)(a1 + 64);
}

@end