@interface RemoveEndpoint
@end

@implementation RemoveEndpoint

uint64_t __endpointAggregate_RemoveEndpoint_block_invoke(void *a1, uint64_t a2)
{
  v4 = [[MXAggregateEndpointCallback alloc] initWithAggregate:FigEndpointAggregateGetFigEndpoint() features:0 options:a1[5] callback:a1[6] callbackRefCon:a1[7] operationType:4];
  if (!a2 || (FigEndpointAggregateGetClassID(), !CMBaseObjectIsMemberOfClass())) {
    a2 = 0;
  }
  uint64_t v5 = a1[8];
  uint64_t v6 = a1[5];
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 32);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *), MXAggregateEndpointCallback *))(v8 + 16);
  if (v9) {
    uint64_t v10 = v9(a2, v5, v6, MXAggregateSubEndpointCompletionCallback, v4);
  }
  else {
    uint64_t v10 = 4294954514;
  }
  MEMORY[0x199716EE0](*(void *)(a1[9] + 40));
  FigEndpointAggregateGetFigEndpoint();
  MXAggregateEndpointUpdateSubEndpoints();
  MEMORY[0x199716EF0](*(void *)(a1[9] + 40));
  return v10;
}

@end