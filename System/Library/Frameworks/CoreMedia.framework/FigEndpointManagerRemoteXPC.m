@interface FigEndpointManagerRemoteXPC
@end

@implementation FigEndpointManagerRemoteXPC

void __FigEndpointManagerRemoteXPC_SetDiscoveryMode_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = remoteXPCFigEndpointManager_sendSetDiscoveryMode(*(void *)(a1 + 40), *(void *)(a1 + 48), *(const void **)(a1 + 56), *(const void **)(a1 + 64));
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v2 = *(void *)(a1 + 72);
    v3 = *(const void **)(v2 + 48);
    v4 = *(const void **)(a1 + 56);
    *(void *)(v2 + 48) = v4;
    if (v4) {
      CFRetain(v4);
    }
    if (v3) {
      CFRelease(v3);
    }
    v5 = *(const void **)(a1 + 64);
    uint64_t v6 = *(void *)(a1 + 72);
    v7 = *(const void **)(v6 + 56);
    *(void *)(v6 + 56) = v5;
    if (v5) {
      CFRetain(v5);
    }
    if (v7)
    {
      CFRelease(v7);
    }
  }
}

@end