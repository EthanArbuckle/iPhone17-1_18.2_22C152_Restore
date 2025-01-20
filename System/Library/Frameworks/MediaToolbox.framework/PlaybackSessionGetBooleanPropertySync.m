@interface PlaybackSessionGetBooleanPropertySync
@end

@implementation PlaybackSessionGetBooleanPropertySync

void *__pap_PlaybackSessionGetBooleanPropertySync_block_invoke(void *result)
{
  uint64_t v1 = result[5];
  if (!*(unsigned char *)v1 && *(void *)(v1 + 280))
  {
    uint64_t v2 = result[6];
    uint64_t v3 = *(void *)(result[4] + 8);
    uint64_t CMBaseObject = FigEndpointPlaybackSessionGetCMBaseObject();
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v7 = *(void *)(VTable + 8);
    result = (void *)(VTable + 8);
    uint64_t v6 = v7;
    uint64_t v8 = v7 ? v6 : 0;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 48);
    if (v9)
    {
      uint64_t v10 = *MEMORY[0x1E4F1CF80];
      return (void *)v9(CMBaseObject, v2, v10, v3 + 24);
    }
  }
  return result;
}

uint64_t __pap_PlaybackSessionGetBooleanPropertySync_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end