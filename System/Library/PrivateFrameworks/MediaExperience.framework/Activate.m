@interface Activate
@end

@implementation Activate

uint64_t __endpointAggregate_Activate_block_invoke(void *a1, uint64_t a2)
{
  v4 = [[MXAggregateEndpointCallback alloc] initWithAggregate:a1[4] features:a1[5] options:a1[6] callback:a1[7] callbackRefCon:a1[8] operationType:1];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, MXAggregateEndpointCallback *))(v8 + 8);
  if (!v9) {
    return 4294954514;
  }
  return v9(a2, v5, v6, MXAggregateEndpointCompletionCallback, v4);
}

@end