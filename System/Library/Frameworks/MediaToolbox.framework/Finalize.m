@interface Finalize
@end

@implementation Finalize

void __figPlaybackCoordinator_Finalize_block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 136);
  if (v6) {
    v6(v2, v3);
  }
  v7 = (const void *)a1[4];
  if (v7) {
    CFRelease(v7);
  }
  v8 = (const void *)a1[6];
  if (v8) {
    CFRelease(v8);
  }
  v9 = (const void *)a1[5];
  if (v9)
  {
    CFRelease(v9);
  }
}

uint64_t __audioSessionAVAudioSession_Finalize_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [**(id **)(a1 + 32) removeObserverForType:2 observer:a3 name:a2];
}

@end