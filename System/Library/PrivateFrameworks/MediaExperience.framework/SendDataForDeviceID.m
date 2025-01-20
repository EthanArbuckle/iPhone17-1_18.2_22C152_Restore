@interface SendDataForDeviceID
@end

@implementation SendDataForDeviceID

uint64_t __routingContext_SendDataForDeviceID_block_invoke(uint64_t a1)
{
  uint64_t result = MXSystemRemotePool_SendData(*(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void (**)(CFTypeRef, uint64_t, uint64_t, uint64_t))(a1 + 64), *(void *)(a1 + 72));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end