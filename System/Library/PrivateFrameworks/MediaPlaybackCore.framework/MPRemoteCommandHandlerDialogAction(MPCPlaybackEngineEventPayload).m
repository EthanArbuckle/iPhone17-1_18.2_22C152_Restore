@interface MPRemoteCommandHandlerDialogAction(MPCPlaybackEngineEventPayload)
+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload;
- (id)mpc_jsonValue;
@end

@implementation MPRemoteCommandHandlerDialogAction(MPCPlaybackEngineEventPayload)

- (id)mpc_jsonValue
{
  v2 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  v3 = [a1 title];
  [v2 setObject:v3 forKeyedSubscript:@"title"];

  v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "type"));
  [v2 setObject:v4 forKeyedSubscript:@"type"];

  v5 = [a1 event];
  v6 = objc_msgSend(v5, "mpc_jsonValue");
  [v2 setObject:v6 forKeyedSubscript:@"event"];

  return v2;
}

+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  v4 = (void *)MEMORY[0x263F121B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"event"];
  v7 = [v4 payloadValueFromJSONValue:v6];

  v8 = [v5 objectForKeyedSubscript:@"title"];
  v9 = [v5 objectForKeyedSubscript:@"type"];

  v10 = objc_msgSend(a1, "actionWithTitle:type:commandEvent:", v8, objc_msgSend(v9, "integerValue"), v7);

  return v10;
}

@end