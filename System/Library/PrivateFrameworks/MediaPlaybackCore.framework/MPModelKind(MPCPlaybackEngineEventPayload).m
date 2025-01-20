@interface MPModelKind(MPCPlaybackEngineEventPayload)
+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload;
- (id)mpc_jsonValue;
@end

@implementation MPModelKind(MPCPlaybackEngineEventPayload)

+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  v4 = [a3 objectForKeyedSubscript:@"modelClass"];
  Class v5 = NSClassFromString(v4);

  if (v5)
  {
    v6 = [a1 kindWithModelClass:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)mpc_jsonValue
{
  v5[1] = *MEMORY[0x263EF8340];
  v4 = @"modelClass";
  v1 = NSStringFromClass((Class)[a1 modelClass]);
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

@end