@interface CreateCommChannel
@end

@implementation CreateCommChannel

uint64_t __carEndpoint_CreateCommChannel_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = carEndpoint_createCommChannelInternal(*(const void **)(a1 + 56), *(__CFDictionary **)(a1 + 64), (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8)+ 24), *(CFTypeRef **)(*(void *)(*(void *)(a1 + 48) + 8)+ 24));
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  uint64_t v5 = v4 ? v4 : 0;
  v6 = *(uint64_t (**)(uint64_t, void (*)(uint64_t, const void *, const void *, const void *), uint64_t))(v5 + 16);
  int v7 = v6 ? v6(v2, carEndpoint_handleRemoteControlSessionEvent, v3) : -12782;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
    || ((uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24),
         (uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16)) == 0)
      ? (uint64_t v10 = 0)
      : (uint64_t v10 = v9),
        (v11 = *(uint64_t (**)(uint64_t))(v10 + 32)) == 0 ? (int v12 = -12782) : (int v12 = v11(v8)),
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v12,
        uint64_t result = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24),
        result))
  {
LABEL_16:
    return APSLogErrorAt();
  }
  return result;
}

@end