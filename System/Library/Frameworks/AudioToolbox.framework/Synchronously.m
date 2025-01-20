@interface Synchronously
@end

@implementation Synchronously

void __Synchronously_ServicingMainRunLoop_block_invoke(uint64_t a1)
{
  v1[0] = MEMORY[0x263EF8330];
  v1[1] = 0x40000000;
  v1[2] = __Synchronously_ServicingMainRunLoop_block_invoke_2;
  v1[3] = &unk_26505E1E0;
  long long v2 = *(_OWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v1);
}

void __Synchronously_ServicingMainRunLoop_block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  CFRunLoopSourceSignal((CFRunLoopSourceRef)Synchronously_ServicingMainRunLoop::source);
  long long v2 = *(__CFRunLoop **)(a1 + 40);

  CFRunLoopWakeUp(v2);
}

@end