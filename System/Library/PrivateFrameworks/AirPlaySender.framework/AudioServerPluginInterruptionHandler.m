@interface AudioServerPluginInterruptionHandler
@end

@implementation AudioServerPluginInterruptionHandler

void __manager_AudioServerPluginInterruptionHandler_block_invoke(uint64_t a1)
{
  uint64_t v2 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v2)
  {
    v3 = (const void *)v2;
    if (!*(unsigned char *)(CMBaseObjectGetDerivedStorage() + 1)) {
      manager_asyncRegisterAirPlayHALDriverInternal(v3);
    }
    CFRelease(v3);
  }
  v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
  }
}

@end