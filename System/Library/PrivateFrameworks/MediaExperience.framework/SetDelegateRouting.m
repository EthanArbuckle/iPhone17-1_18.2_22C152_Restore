@interface SetDelegateRouting
@end

@implementation SetDelegateRouting

uint64_t __endpointAggregate_SetDelegateRouting_block_invoke(uint64_t a1, uint64_t a2)
{
  CFTypeRef v3 = *(CFTypeRef *)(a1 + 32);
  v8[3] = 0;
  v8[4] = 0;
  v8[1] = MXAggregateEndpointHandleAuthRequired;
  v8[2] = MXAggregateEndpointHandleEndpointFailed;
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
  v6 = *(uint64_t (**)(uint64_t, void *))(v5 + 48);
  if (v6) {
    return v6(a2, v8);
  }
  else {
    return 4294954514;
  }
}

@end