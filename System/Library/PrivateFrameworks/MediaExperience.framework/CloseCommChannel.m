@interface CloseCommChannel
@end

@implementation CloseCommChannel

uint64_t __central_CloseCommChannel_block_invoke(uint64_t a1)
{
  if (**(unsigned char **)(a1 + 40))
  {
    uint64_t result = 4294954511;
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2
      && ((uint64_t v3 = *(void *)(a1 + 56), (v4 = *(void *)(CMBaseObjectGetVTable() + 24)) == 0) ? (v5 = 0) : (v5 = v4),
          (v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 104)) != 0))
    {
      uint64_t result = v6(v2, v3);
    }
    else
    {
      uint64_t result = 4294954514;
    }
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __routingContextRemoteXPC_CloseCommChannel_block_invoke(uint64_t a1)
{
  CFArrayRef v2 = *(const __CFArray **)(*(void *)(a1 + 32) + 56);
  v7.length = CFArrayGetCount(v2);
  v7.location = 0;
  CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v2, v7, *(const void **)(a1 + 40));
  if (FirstIndexOfValue != -1)
  {
    CFIndex v4 = FirstIndexOfValue;
    uint64_t v5 = *(__CFArray **)(*(void *)(a1 + 32) + 56);
    CFArrayRemoveValueAtIndex(v5, v4);
  }
}

uint64_t __routingContextResilientRemote_CloseCommChannel_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 128);
  if (!v6) {
    return 4294954514;
  }
  return v6(a2, v3);
}

void __routingContext_CloseCommChannel_block_invoke(void *a1)
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
      uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 24);
      if (v4) {
        uint64_t v5 = v4;
      }
      else {
        uint64_t v5 = 0;
      }
      v6 = *(uint64_t (**)(CFTypeRef, uint64_t))(v5 + 104);
      if (v6) {
        int v7 = v6(v2, v3);
      }
      else {
        int v7 = -12782;
      }
      *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v7;
    }
    if (cf) {
      CFRelease(cf);
    }
  }
}

@end