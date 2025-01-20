@interface PlaybackSessionInsertPlayQueueItem
@end

@implementation PlaybackSessionInsertPlayQueueItem

uint64_t __pap_PlaybackSessionInsertPlayQueueItem_block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(CMBaseObjectGetDerivedStorage() + 280);
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v9 = *(void *)(VTable + 16);
  uint64_t result = VTable + 16;
  uint64_t v8 = v9;
  if (v9) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = 0;
  }
  v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void (*)(uint64_t, uint64_t), uint64_t))(v10 + 32);
  if (v11)
  {
    return v11(v2, v3, v4, pap_playbackSessionInsertPlayQueueItemCompletion, v5);
  }
  return result;
}

@end