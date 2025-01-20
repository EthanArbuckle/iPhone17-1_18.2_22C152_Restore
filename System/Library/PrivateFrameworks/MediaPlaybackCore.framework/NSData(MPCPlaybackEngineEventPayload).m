@interface NSData(MPCPlaybackEngineEventPayload)
+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload;
- (uint64_t)mpc_jsonValue;
@end

@implementation NSData(MPCPlaybackEngineEventPayload)

- (uint64_t)mpc_jsonValue
{
  return [a1 base64EncodedStringWithOptions:0];
}

+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  id v4 = a3;
  v5 = (void *)[[a1 alloc] initWithBase64EncodedString:v4 options:0];

  return v5;
}

@end