@interface ICURLAggregatedPerformanceMetrics(MPCPlaybackEngineEventPayload)
+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload;
- (id)mpc_jsonValue;
@end

@implementation ICURLAggregatedPerformanceMetrics(MPCPlaybackEngineEventPayload)

- (id)mpc_jsonValue
{
  v6[1] = *MEMORY[0x263EF8340];
  v5 = @"urlMetrics";
  v1 = [a1 urlMetrics];
  v2 = objc_msgSend(v1, "msv_map:", &__block_literal_global_340);
  v6[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  v3 = [a3 objectForKeyedSubscript:@"urlMetrics"];
  id v4 = objc_alloc(MEMORY[0x263F89390]);
  v5 = objc_msgSend(v3, "msv_map:", &__block_literal_global_336);
  v6 = (void *)[v4 initWithURLMetrics:v5];

  return v6;
}

@end