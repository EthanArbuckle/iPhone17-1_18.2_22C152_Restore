@interface CreateCommChannel
@end

@implementation CreateCommChannel

uint64_t __central_CreateCommChannel_block_invoke(uint64_t a1)
{
  if (**(unsigned char **)(a1 + 40))
  {
    uint64_t result = 4294954511;
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2
      && ((uint64_t v3 = *(void *)(a1 + 56), v4 = *(void *)(a1 + 64), (v5 = *(void *)(CMBaseObjectGetVTable() + 24)) == 0)
        ? (uint64_t v6 = 0)
        : (uint64_t v6 = v5),
          (v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 88)) != 0))
    {
      uint64_t result = v7(v2, v3, v4);
    }
    else
    {
      uint64_t result = 4294954514;
    }
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __routingContextRemoteXPC_CreateCommChannel_block_invoke(uint64_t a1)
{
}

uint64_t __routingContextResilientRemote_CreateCommChannel_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 112);
  if (!v7) {
    return 4294954514;
  }
  return v7(a2, v3, v4);
}

void __routingContext_CreateCommChannel_block_invoke(void *a1)
{
  CFTypeRef cf = 0;
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = FigRoutingManagerCopyPickedEndpointForRoutingContext(*(void *)(a1[5] + 8), &cf);
  CFTypeRef v2 = cf;
  if (cf)
  {
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass())
    {
      uint64_t v3 = a1[6];
      uint64_t v4 = a1[7];
      uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 24);
      if (v5) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
      v7 = *(uint64_t (**)(CFTypeRef, uint64_t, uint64_t))(v6 + 88);
      if (v7) {
        int v8 = v7(v2, v3, v4);
      }
      else {
        int v8 = -12782;
      }
      *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v8;
      if (!*(_DWORD *)(*(void *)(a1[4] + 8) + 24))
      {
        uint64_t v9 = *(void *)a1[7];
        if (v9) {
          *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = FigRoutingManagerSaveCommunicationChannelUUIDForContext(*(void *)(a1[5] + 8), v9);
        }
      }
    }
    if (cf) {
      CFRelease(cf);
    }
  }
}

@end