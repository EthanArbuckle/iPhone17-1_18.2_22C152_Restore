@interface PlaybackSessionSetRate
@end

@implementation PlaybackSessionSetRate

void __pap_PlaybackSessionSetRate_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v3 = CMBaseObjectGetDerivedStorage();
  v4 = malloc_type_calloc(1uLL, 0x28uLL, 0x10600408834611BuLL);
  v5 = *(const void **)(a1 + 40);
  void *v4 = v5;
  if (v5) {
    CFRetain(v5);
  }
  v6 = *(const void **)(DerivedStorage + 280);
  v4[1] = v6;
  if (v6) {
    CFRetain(v6);
  }
  *((_DWORD *)v4 + 4) = *(_DWORD *)(a1 + 56);
  v7 = *(const void **)(a1 + 48);
  v4[3] = v7;
  int v8 = *(_DWORD *)(v3 + 52);
  *(_DWORD *)(v3 + 52) = v8 + 1;
  *((_DWORD *)v4 + 8) = v8;
  if (v7) {
    CFRetain(v7);
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (pap_ShouldUseInterstitialQueuing()) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F20950], (const void *)*MEMORY[0x1E4F1CFD0]);
  }
  if (*(unsigned char *)(a1 + 108))
  {
    FigCFDictionarySetCMTime();
    FigCFDictionarySetCMTime();
  }
  uint64_t v10 = *(void *)(DerivedStorage + 280);
  float v11 = *(float *)(a1 + 56);
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  v14 = *(void (**)(uint64_t, __CFDictionary *, void (*)(int, uint64_t *), void *, float))(v13 + 80);
  if (v14) {
    v14(v10, Mutable, pap_playbackSessionSetRateCompletion, v4, v11);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

@end