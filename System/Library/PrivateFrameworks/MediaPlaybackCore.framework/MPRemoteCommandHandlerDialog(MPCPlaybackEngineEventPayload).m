@interface MPRemoteCommandHandlerDialog(MPCPlaybackEngineEventPayload)
+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload;
- (id)mpc_jsonValue;
@end

@implementation MPRemoteCommandHandlerDialog(MPCPlaybackEngineEventPayload)

- (id)mpc_jsonValue
{
  v2 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  v3 = [a1 localizedTitle];
  [v2 setObject:v3 forKeyedSubscript:@"title"];

  v4 = [a1 localizedMessage];
  [v2 setObject:v4 forKeyedSubscript:@"message"];

  v5 = [a1 actions];
  v6 = objc_msgSend(v5, "msv_map:", &__block_literal_global_282);
  [v2 setObject:v6 forKeyedSubscript:@"actions"];

  return v2;
}

+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"title"];
  v6 = [v4 objectForKeyedSubscript:@"message"];
  v7 = [a1 dialogWithTitle:v5 message:v6];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = objc_msgSend(v4, "objectForKeyedSubscript:", @"actions", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [MEMORY[0x263F121C8] payloadValueFromJSONValue:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        [v7 addAction:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

@end