@interface CopyPlayableEventsForItem
@end

@implementation CopyPlayableEventsForItem

CFIndex __fpic_CopyPlayableEventsForItem_block_invoke(uint64_t a1)
{
  CFIndex result = (CFIndex)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  **(unsigned char **)(a1 + 40) = 0;
  uint64_t v3 = *(void *)(a1 + 48);
  if (*(unsigned char *)(v3 + 975))
  {
    if (*(void *)(v3 + 152) == *(void *)(a1 + 56))
    {
      **(unsigned char **)(a1 + 40) = 1;
      CFIndex result = fpic_ShouldIgnoreInterstitialsDueToExternalPlaybackStrategy(*(void *)(a1 + 64));
      if (!result)
      {
        for (CFIndex i = 0; ; ++i)
        {
          CFIndex result = *(void *)(*(void *)(a1 + 48) + 184);
          if (result) {
            CFIndex result = CFArrayGetCount((CFArrayRef)result);
          }
          if (i >= result) {
            break;
          }
          ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 48) + 184), i);
          v6 = (const void *)(*(uint64_t (**)(void, void, const void *))(*(void *)(a1 + 48) + 80))(*(void *)(a1 + 64), *(void *)(a1 + 72), ValueAtIndex);
          if (*(void *)(a1 + 56) == (*(uint64_t (**)(void, void, const void *))(*(void *)(a1 + 48)
                                                                                               + 88))(*(void *)(a1 + 64), *(void *)(a1 + 72), ValueAtIndex)&& !FigPlayerInterstitialEventDidLastPlaybackFail((uint64_t)v6))
          {
            if (FigPlayerInterstitialEventCueOnce((uint64_t)v6))
            {
              v7 = FigPlayerInterstitialEventCopyIdentifier((uint64_t)v6);
              FigCFDictionaryGetInt32IfPresent();
              if (v7) {
                CFRelease(v7);
              }
            }
            fpic_EnsureEventHasResolvedProperties(*(const void **)(a1 + 64), *(void *)(a1 + 72), ValueAtIndex, 0);
            CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v6);
          }
        }
      }
    }
  }
  return result;
}

CFArrayRef __fpirc_CopyPlayableEventsForItem_block_invoke(uint64_t a1)
{
  CFIndex v2 = 0;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  **(unsigned char **)(a1 + 40) = 1;
  while (1)
  {
    CFArrayRef result = *(const __CFArray **)(*(void *)(a1 + 48) + 136);
    if (result) {
      CFArrayRef result = (const __CFArray *)CFArrayGetCount(result);
    }
    if (v2 >= (uint64_t)result) {
      break;
    }
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 48) + 136), v2);
    v5 = (const void *)(*(uint64_t (**)(void, void, const void *))(*(void *)(a1 + 48) + 72))(*(void *)(a1 + 56), *(void *)(a1 + 64), ValueAtIndex);
    if (*(void *)(a1 + 72) == (*(uint64_t (**)(void, void, const void *))(*(void *)(a1 + 48) + 80))(*(void *)(a1 + 56), *(void *)(a1 + 64), ValueAtIndex))CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v5); {
    ++v2;
    }
  }
  return result;
}

@end