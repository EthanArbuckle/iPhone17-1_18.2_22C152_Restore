@interface SendData
@end

@implementation SendData

uint64_t __central_SendData_block_invoke(uint64_t a1)
{
  if (**(unsigned char **)(a1 + 40))
  {
    uint64_t result = 4294954511;
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2
      && ((uint64_t v3 = *(void *)(a1 + 56),
           uint64_t v4 = *(void *)(a1 + 64),
           uint64_t v5 = *(void *)(a1 + 72),
           uint64_t v6 = *(void *)(a1 + 80),
           (uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 24)) == 0)
        ? (uint64_t v8 = 0)
        : (uint64_t v8 = v7),
          (v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 96)) != 0))
    {
      uint64_t result = v9(v2, v3, v4, v5, v6);
    }
    else
    {
      uint64_t result = 4294954514;
    }
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __routingContext_SendData_block_invoke(uint64_t a1)
{
  CFTypeRef cf = 0;
  FigRoutingManagerCopyPickedEndpointForRoutingContext(*(void *)(*(void *)(a1 + 40) + 8), &cf);
  CFTypeRef v2 = cf;
  if (cf && (FigEndpointExtendedGetClassID(), CMBaseObjectIsMemberOfClass()))
  {
    uint64_t v3 = (CFTypeRef *)malloc_type_calloc(1uLL, 0x18uLL, 0xA00402214FCE6uLL);
    *uint64_t v3 = CFRetain(*(CFTypeRef *)(a1 + 48));
    v3[1] = *(CFTypeRef *)(a1 + 56);
    v3[2] = *(CFTypeRef *)(a1 + 64);
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v5 = *(void *)(a1 + 80);
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 24);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(uint64_t (**)(CFTypeRef, uint64_t, uint64_t, void (*)(uint64_t, uint64_t, uint64_t, CFTypeRef *), CFTypeRef *))(v7 + 96);
    if (v8) {
      uint64_t v9 = v8(v2, v4, v5, routingContext_sendDataCompletionCallback, v3);
    }
    else {
      uint64_t v9 = 4294954514;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v9;
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == -12782) {
      routingContext_sendDataCompletionCallback(v9, *(void *)(a1 + 72), 4294954514, v3);
    }
  }
  else
  {
    (*(void (**)(void, void, void, void))(a1 + 56))(*(void *)(a1 + 48), *(void *)(a1 + 72), *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), *(void *)(a1 + 64));
  }
  if (cf) {
    CFRelease(cf);
  }
}

uint64_t __endpointAggregate_SendData_block_invoke(void *a1, uint64_t a2)
{
  if (!a2 || (uint64_t v3 = a2, FigEndpointExtendedGetClassID(), !CMBaseObjectIsMemberOfClass())) {
    uint64_t v3 = 0;
  }
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 24);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 96);
  if (!v10) {
    return 4294954514;
  }
  return v10(v3, v4, v5, v6, v7);
}

@end