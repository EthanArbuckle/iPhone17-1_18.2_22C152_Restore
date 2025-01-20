@interface SetDelegateRemoteControl
@end

@implementation SetDelegateRemoteControl

uint64_t __central_SetDelegateRemoteControl_block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  if (*(unsigned char *)v2)
  {
    uint64_t result = 4294954511;
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 8);
    uint64_t v4 = a1[6];
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 56);
    if (v7) {
      uint64_t result = v7(v3, v4);
    }
    else {
      uint64_t result = 4294954514;
    }
  }
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

uint64_t __endpointAggregate_SetDelegateRemoteControl_block_invoke(uint64_t a1, uint64_t a2)
{
  CFTypeRef v3 = *(CFTypeRef *)(a1 + 32);
  v8[1] = 0;
  v8[2] = MXAggregateEndpointDidReceiveDataFromCommChannel;
  v8[3] = MXAggregateEndpointDidCloseCommChannel;
  if (v3) {
    CFTypeRef v3 = CFRetain(v3);
  }
  v8[0] = v3;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void *))(v5 + 56);
  if (v6) {
    return v6(a2, v8);
  }
  else {
    return 4294954514;
  }
}

@end