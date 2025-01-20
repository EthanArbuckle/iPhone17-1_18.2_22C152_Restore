@interface PlaybackSessionRemovePlayQueueItem
@end

@implementation PlaybackSessionRemovePlayQueueItem

void __pap_PlaybackSessionRemovePlayQueueItem_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F20A88], *(const void **)(a1 + 40));
  if (pap_ShouldUseInterstitialQueuing()) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F20950], (const void *)*MEMORY[0x1E4F1CFD0]);
  }
  uint64_t v4 = *(void *)(DerivedStorage + 280);
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = *(void (**)(uint64_t, __CFDictionary *, void, void))(v6 + 40);
  if (v7) {
    v7(v4, Mutable, 0, 0);
  }
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

@end