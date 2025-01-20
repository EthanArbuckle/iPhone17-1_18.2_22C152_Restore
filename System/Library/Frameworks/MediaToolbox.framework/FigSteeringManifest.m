@interface FigSteeringManifest
@end

@implementation FigSteeringManifest

void __FigSteeringManifest_ensureClientEstablished_block_invoke(uint64_t a1)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (Mutable)
  {
    CFMutableDictionaryRef v3 = Mutable;
    FigCFDictionarySetValue();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate();
    CFRelease(v3);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -12786;
  }
}

@end