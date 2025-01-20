@interface DeadConnectionCallback
@end

@implementation DeadConnectionCallback

void __remoteXPCRoutingContext_DeadConnectionCallback_block_invoke(uint64_t a1)
{
  CFDictionaryRemoveValue((CFMutableDictionaryRef)gFigRoutingContextRemoteObject_0, *(const void **)(a1 + 32));
  v2 = *(const void **)(a1 + 32);
  CFRelease(v2);
}

void __routingSessionManagerRemote_DeadConnectionCallback_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  MEMORY[0x199716EE0](*(void *)(DerivedStorage + 16));
  CFArrayRef v3 = (const __CFArray *)FigCFDictionaryCopyArrayOfValues();
  CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(DerivedStorage + 24));
  MEMORY[0x199716EF0](*(void *)(DerivedStorage + 16));
  if (v3)
  {
    if (CFArrayGetCount(v3) >= 1)
    {
      CFIndex v4 = 0;
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, v4);
        routingSessionManagerRemote_runOneCallback(ValueAtIndex, 4294951902);
        ++v4;
      }
      while (v4 < CFArrayGetCount(v3));
    }
    CFRelease(v3);
  }
  v6 = *(const void **)(a1 + 32);
  if (v6)
  {
    CFRelease(v6);
  }
}

@end