@interface PlaybackSessionSeekToDate
@end

@implementation PlaybackSessionSeekToDate

void __pap_PlaybackSessionSeekToDate_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  v4 = Mutable;
  if (!*(unsigned char *)DerivedStorage)
  {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F20A88], *(const void **)(*(void *)(a1 + 40) + 80));
    if (pap_ShouldUseInterstitialQueuing()) {
      CFDictionaryAddValue(v4, (const void *)*MEMORY[0x1E4F20950], (const void *)*MEMORY[0x1E4F1CFD0]);
    }
    v5 = malloc_type_calloc(1uLL, 0x40uLL, 0x10600403C78B70CuLL);
    v6 = *(const void **)(a1 + 48);
    void *v5 = v6;
    if (v6) {
      CFRetain(v6);
    }
    v7 = *(const void **)(DerivedStorage + 280);
    v5[2] = v7;
    if (v7) {
      CFRetain(v7);
    }
    v8 = *(const void **)(a1 + 56);
    v5[1] = v8;
    if (v8) {
      CFRetain(v8);
    }
    *((_DWORD *)v5 + 6) = *(_DWORD *)(a1 + 72);
    *((unsigned char *)v5 + 28) = *(_DWORD *)(a1 + 72) != 0;
    uint64_t v9 = MEMORY[0x1E4F1F9F8];
    *((_OWORD *)v5 + 2) = *MEMORY[0x1E4F1F9F8];
    v5[6] = *(void *)(v9 + 16);
    uint64_t v10 = *(void *)(DerivedStorage + 280);
    uint64_t v11 = *(void *)(a1 + 64);
    uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    v14 = *(void (**)(uint64_t, uint64_t, __CFDictionary *, void (*)(const void *, int, uint64_t *), void *))(v13 + 72);
    if (v14) {
      v14(v10, v11, v4, pap_playbackSessionSeekCompletion, v5);
    }
  }
  if (v4)
  {
    CFRelease(v4);
  }
}

@end