@interface NSDate(MPCPlaybackEngineEventPayload)
+ (uint64_t)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload;
- (uint64_t)mpc_jsonValue;
@end

@implementation NSDate(MPCPlaybackEngineEventPayload)

- (uint64_t)mpc_jsonValue
{
  v1 = NSNumber;
  [a1 timeIntervalSinceReferenceDate];

  return objc_msgSend(v1, "numberWithDouble:");
}

+ (uint64_t)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  v3 = (void *)MEMORY[0x263EFF910];
  [a3 doubleValue];

  return objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
}

@end