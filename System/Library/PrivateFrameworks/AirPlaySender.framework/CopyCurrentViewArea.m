@interface CopyCurrentViewArea
@end

@implementation CopyCurrentViewArea

uint64_t __carEndpoint_CopyCurrentViewArea_block_invoke(uint64_t a1)
{
  uint64_t result = carEndpoint_getScreenStreamForDisplayUUID();
  if (result)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    v7 = *(uint64_t (**)(uint64_t, void, void, uint64_t))(v6 + 48);
    if (v7) {
      int v8 = v7(CMBaseObject, *MEMORY[0x1E4F21410], 0, v3 + 24);
    }
    else {
      int v8 = -12782;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
    uint64_t result = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (result)
    {
      return APSLogErrorAt();
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -16725;
  }
  return result;
}

@end