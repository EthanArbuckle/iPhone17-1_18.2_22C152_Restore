@interface ICURLAggregatedPerformanceMetrics
@end

@implementation ICURLAggregatedPerformanceMetrics

uint64_t __81__ICURLAggregatedPerformanceMetrics_MPCPlaybackEngineEventPayload__mpc_jsonValue__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

id __94__ICURLAggregatedPerformanceMetrics_MPCPlaybackEngineEventPayload__payloadValueFromJSONValue___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F893A8];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithDictionaryRepresentation:v3];

  return v4;
}

@end