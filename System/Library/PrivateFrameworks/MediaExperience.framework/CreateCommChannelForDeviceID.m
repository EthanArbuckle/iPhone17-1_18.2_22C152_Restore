@interface CreateCommChannelForDeviceID
@end

@implementation CreateCommChannelForDeviceID

void __routingContextRemoteXPC_CreateCommChannelForDeviceID_block_invoke(uint64_t a1)
{
}

uint64_t __routingContextResilientRemote_CreateCommChannelForDeviceID_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 152);
  if (!v8) {
    return 4294954514;
  }
  return v8(a2, v3, v4, v5);
}

uint64_t __routingContext_CreateCommChannelForDeviceID_block_invoke(void *a1)
{
  uint64_t result = MXSystemRemotePool_CreateCommChannel(a1[5], a1[6], a1[7]);
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

@end