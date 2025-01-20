@interface CFFileDescriptorInduceFakeReadCallBack
@end

@implementation CFFileDescriptorInduceFakeReadCallBack

void ___CFFileDescriptorInduceFakeReadCallBack_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  if (v3)
  {
    *(unsigned char *)(v2 + 50) = 1;
    if (!*(unsigned char *)(v2 + 48))
    {
      dispatch_suspend(v3);
      uint64_t v2 = *(void *)(a1 + 32);
      *(unsigned char *)(v2 + 48) = 1;
    }
    v4 = *(__CFRunLoopSource **)(v2 + 56);
    if (v4)
    {
      CFRunLoopSourceSignal(v4);
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 56);
      _CFRunLoopSourceWakeUpRunLoops(v5);
    }
  }
}

@end