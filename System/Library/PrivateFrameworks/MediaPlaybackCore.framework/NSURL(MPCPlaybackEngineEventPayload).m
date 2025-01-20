@interface NSURL(MPCPlaybackEngineEventPayload)
+ (uint64_t)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload;
@end

@implementation NSURL(MPCPlaybackEngineEventPayload)

+ (uint64_t)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  return objc_msgSend(NSURL, "URLWithString:");
}

@end