@interface CopyEvents
@end

@implementation CopyEvents

CFArrayRef __fpic_CopyEvents_block_invoke(uint64_t a1)
{
  BOOL ShouldIgnoreInterstitialsDueToExternalPlaybackStrategy = fpic_ShouldIgnoreInterstitialsDueToExternalPlaybackStrategy(*(void *)(a1 + 32));
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (ShouldIgnoreInterstitialsDueToExternalPlaybackStrategy) {
    CFArrayRef result = CFArrayCreate(v3, 0, 0, MEMORY[0x1E4F1D510]);
  }
  else {
    CFArrayRef result = CFArrayCreateCopy(v3, *(CFArrayRef *)(*(void *)(a1 + 48) + 184));
  }
  **(void **)(a1 + 40) = result;
  return result;
}

CFArrayRef __fpirc_CopyEvents_block_invoke(uint64_t a1)
{
  CFArrayRef result = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(CFArrayRef *)(*(void *)(a1 + 40) + 136));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end