@interface CloseCommChannelForDeviceID
@end

@implementation CloseCommChannelForDeviceID

void __routingContextRemoteXPC_CloseCommChannelForDeviceID_block_invoke(uint64_t a1)
{
}

uint64_t __routingContextResilientRemote_CloseCommChannelForDeviceID_block_invoke(uint64_t a1, uint64_t a2)
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
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 168);
  if (!v7) {
    return 4294954514;
  }
  return v7(a2, v3, v4);
}

uint64_t __routingContext_CloseCommChannelForDeviceID_block_invoke(void *a1)
{
  uint64_t result = MXSystemRemotePool_CloseCommChannel(a1[5], a1[6]);
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

@end