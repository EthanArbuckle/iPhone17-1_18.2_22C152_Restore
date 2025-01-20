@interface SendData
@end

@implementation SendData

uint64_t __carEndpoint_SendData_block_invoke(uint64_t a1)
{
  CFDictionaryRef v2 = *(const __CFDictionary **)(*(void *)(a1 + 56) + 440);
  if (v2) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFDictionaryGetValue(v2, *(const void **)(a1 + 64));
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t result = APSLogErrorAt();
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    int v12 = -16725;
LABEL_15:
    *(_DWORD *)(v11 + 24) = v12;
    return result;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = malloc_type_calloc(1uLL, 0x28uLL, 0x10E0040139F2759uLL);
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t result = APSLogErrorAt();
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    int v12 = -16721;
    goto LABEL_15;
  }
  **(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = CFRetain(*(CFTypeRef *)(a1 + 72));
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + 8) = CFRetain(*(CFTypeRef *)(a1 + 64));
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + 16) = *(void *)(a1 + 80);
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + 24) = *(void *)(a1 + 88);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v4 = *(void *)(a1 + 96);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = *(uint64_t (**)(uint64_t, uint64_t, void (*)(uint64_t, uint64_t, uint64_t), uint64_t))(v7 + 8);
  if (v8) {
    int v9 = v8(v3, v4, carEndpoint_rcsSendMessageCompletion, v5);
  }
  else {
    int v9 = -12782;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
  uint64_t result = *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (result)
  {
    return APSLogErrorAt();
  }
  return result;
}

@end