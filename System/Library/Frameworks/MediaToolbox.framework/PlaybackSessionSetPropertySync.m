@interface PlaybackSessionSetPropertySync
@end

@implementation PlaybackSessionSetPropertySync

uint64_t __pap_PlaybackSessionSetPropertySync_block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  if (!*(unsigned char *)v2 && *(void *)(v2 + 280))
  {
    uint64_t v3 = a1[6];
    uint64_t v4 = a1[7];
    uint64_t CMBaseObject = FigEndpointPlaybackSessionGetCMBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
    if (v8) {
      int v9 = v8(CMBaseObject, v3, v4);
    }
    else {
      int v9 = -12782;
    }
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v9;
  }
  return *(unsigned int *)(*(void *)(a1[4] + 8) + 24);
}

uint64_t __pap_PlaybackSessionSetPropertySync_block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end