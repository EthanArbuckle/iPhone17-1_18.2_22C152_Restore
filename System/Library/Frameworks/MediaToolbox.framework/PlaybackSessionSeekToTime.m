@interface PlaybackSessionSeekToTime
@end

@implementation PlaybackSessionSeekToTime

void __pap_PlaybackSessionSeekToTime_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!*(unsigned char *)DerivedStorage)
  {
    itemairplay_clearCoordinatedPlaybackSynchronizationTimebase();
    playerairplay_clearCoordinatedPlaybackSynchronizationTimebaseForItemsAfterItem(*(void *)(a1 + 32), *(char **)(a1 + 40));
    v4 = *(const void **)(a1 + 32);
    v5 = *(const void **)(a1 + 40);
    int v6 = *(_DWORD *)(a1 + 72);
    float v7 = *(float *)(DerivedStorage + 48);
    long long v21 = *(_OWORD *)(a1 + 76);
    uint64_t v22 = *(void *)(a1 + 92);
    playerairplay_notifyStartupTasksOfSeek(v4, v5, v6, &v21, v7);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F20A88], *(const void **)(*(void *)(a1 + 48) + 80));
    if (pap_ShouldUseInterstitialQueuing()) {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F20950], (const void *)*MEMORY[0x1E4F1CFD0]);
    }
    FigCFDictionarySetValueFromKeyInDict();
    FigCFDictionarySetValueFromKeyInDict();
    FigCFDictionarySetValueFromKeyInDict();
    v8 = malloc_type_calloc(1uLL, 0x40uLL, 0x10600403C78B70CuLL);
    v9 = *(const void **)(a1 + 56);
    void *v8 = v9;
    if (v9) {
      CFRetain(v9);
    }
    v10 = *(const void **)(DerivedStorage + 280);
    v8[2] = v10;
    if (v10) {
      CFRetain(v10);
    }
    v11 = *(const void **)(a1 + 40);
    v8[1] = v11;
    if (v11) {
      CFRetain(v11);
    }
    v12 = (long long *)(a1 + 76);
    *((_DWORD *)v8 + 6) = *(_DWORD *)(a1 + 72);
    *((unsigned char *)v8 + 28) = *(unsigned char *)(a1 + 100);
    v13 = *(const void **)(a1 + 64);
    v8[7] = v13;
    if (v13) {
      CFRetain(v13);
    }
    long long v14 = *v12;
    v8[6] = *(void *)(a1 + 92);
    *((_OWORD *)v8 + 2) = v14;
    uint64_t v15 = *(void *)(DerivedStorage + 280);
    long long v19 = *v12;
    uint64_t v20 = *(void *)(a1 + 92);
    uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v16) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 0;
    }
    v18 = *(void (**)(uint64_t, long long *, __CFDictionary *, void (*)(const void *, int, uint64_t *), void *))(v17 + 64);
    if (v18)
    {
      long long v21 = v19;
      uint64_t v22 = v20;
      v18(v15, &v21, Mutable, pap_playbackSessionSeekCompletion, v8);
    }
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

@end