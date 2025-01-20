@interface MPRemoteCommandEvent(MPCPlaybackEngineEventPayload)
+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload;
- (id)mpc_jsonValue;
@end

@implementation MPRemoteCommandEvent(MPCPlaybackEngineEventPayload)

- (id)mpc_jsonValue
{
  v9[2] = *MEMORY[0x263EF8340];
  v8[0] = @"mrCommand";
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "mediaRemoteCommandType"));
  v8[1] = @"options";
  v9[0] = v2;
  v3 = [a1 mediaRemoteOptions];
  v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x263EFFA78];
  }
  v5 = _coerceJSONValueFromValue(v3, 0);
  v9[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 objectForKeyedSubscript:@"mrCommand"];
    uint64_t v6 = [v5 integerValue];

    v7 = (void *)[objc_alloc(MEMORY[0x263F121A8]) initWithMediaRemoteCommandType:v6];
    v8 = [v4 objectForKeyedSubscript:@"options"];

    v9 = (void *)[v8 mutableCopy];
    uint64_t v10 = *MEMORY[0x263F54DA8];
    v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F54DA8]];
    if (_NSIsNSString())
    {
      v12 = [MEMORY[0x263EFF8F8] payloadValueFromJSONValue:v11];
      [v9 setObject:v12 forKeyedSubscript:v10];
    }
    v13 = _coercePayloadFromJSONValue(v9, &stru_26CBCA930);
    v14 = [a1 eventWithCommand:v7 mediaRemoteType:v6 options:v13];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end