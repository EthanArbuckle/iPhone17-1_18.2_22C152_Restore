@interface PlaybackSessionGetPlaybackInfo
@end

@implementation PlaybackSessionGetPlaybackInfo

uint64_t __pap_PlaybackSessionGetPlaybackInfo_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(CMBaseObjectGetDerivedStorage() + 280);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v8 = *(void *)(VTable + 16);
  uint64_t result = VTable + 16;
  uint64_t v7 = v8;
  if (v8) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0;
  }
  v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 56);
  if (v10)
  {
    return v10(v2, v3, v4);
  }
  return result;
}

@end