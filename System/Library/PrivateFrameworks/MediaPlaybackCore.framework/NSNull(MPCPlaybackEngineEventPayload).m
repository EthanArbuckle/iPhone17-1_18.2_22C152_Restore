@interface NSNull(MPCPlaybackEngineEventPayload)
+ (uint64_t)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload;
- (uint64_t)mpc_jsonValue;
@end

@implementation NSNull(MPCPlaybackEngineEventPayload)

- (uint64_t)mpc_jsonValue
{
  return 0;
}

+ (uint64_t)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  return [MEMORY[0x263EFF9D0] null];
}

@end