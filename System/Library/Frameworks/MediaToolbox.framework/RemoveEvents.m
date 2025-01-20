@interface RemoveEvents
@end

@implementation RemoveEvents

void __fpic_RemoveEvents_block_invoke(uint64_t a1)
{
  CFArrayRef v2 = *(const __CFArray **)(a1 + 64);
  if (!v2) {
    CFArrayRef v2 = *(const __CFArray **)(*(void *)(a1 + 72) + 184);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFArrayGetCount(v2);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v3 >= 1)
  {
    unint64_t v4 = v3 + 1;
    do
    {
      char v10 = 0;
      ValueAtIndex = CFArrayGetValueAtIndex(v2, v4 - 2);
      fpic_RemoveEventIfNotPlaying(*(const void **)(a1 + 80), ValueAtIndex, *(__CFArray **)(*(void *)(*(void *)(a1 + 40) + 8) + 24), &v10);
      if (v10)
      {
        uint64_t v6 = (*(uint64_t (**)(void, void, const void *))(*(void *)(a1 + 72) + 80))(*(void *)(a1 + 80), *(void *)(a1 + 88), ValueAtIndex);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        FigPlayerInterstitialEventGetResumptionOffset(v6, (uint64_t)&v8);
        uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
        *(_OWORD *)(v7 + 32) = v8;
        *(void *)(v7 + 48) = v9;
      }
      --v4;
    }
    while (v4 > 1);
  }
}

@end