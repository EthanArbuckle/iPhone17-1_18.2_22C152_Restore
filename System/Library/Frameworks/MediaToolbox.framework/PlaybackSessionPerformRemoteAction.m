@interface PlaybackSessionPerformRemoteAction
@end

@implementation PlaybackSessionPerformRemoteAction

uint64_t __pap_PlaybackSessionPerformRemoteAction_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (pap_ShouldUseInterstitialQueuing()) {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 48), (const void *)*MEMORY[0x1E4F20950], (const void *)*MEMORY[0x1E4F1CFD0]);
  }
  uint64_t v3 = *(void *)(DerivedStorage + 280);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v11 = *(void *)(VTable + 16);
  uint64_t result = VTable + 16;
  uint64_t v10 = v11;
  if (v11) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = 0;
  }
  v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 112);
  if (v13)
  {
    return v13(v3, v4, v5, v6, v7);
  }
  return result;
}

@end