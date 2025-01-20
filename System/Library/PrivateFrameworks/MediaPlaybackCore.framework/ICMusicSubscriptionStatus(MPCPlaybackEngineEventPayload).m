@interface ICMusicSubscriptionStatus(MPCPlaybackEngineEventPayload)
+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload;
@end

@implementation ICMusicSubscriptionStatus(MPCPlaybackEngineEventPayload)

+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  id v4 = a3;
  v5 = (void *)[[a1 alloc] initWithResponseDictionary:v4];

  return v5;
}

@end