@interface MPRemoteCommandStatus(MPCPlaybackEngineEventPayload)
+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload;
- (id)mpc_jsonValue;
@end

@implementation MPRemoteCommandStatus(MPCPlaybackEngineEventPayload)

- (id)mpc_jsonValue
{
  v2 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "type"));
  [v2 setObject:v3 forKeyedSubscript:@"type"];

  v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "statusCode"));
  [v2 setObject:v4 forKeyedSubscript:@"code"];

  uint64_t v5 = [a1 type];
  if (v5 == 999)
  {
    v9 = [a1 customData];
    v10 = objc_msgSend(v9, "mpc_jsonValue");
    [v2 setObject:v10 forKeyedSubscript:@"data"];

    v6 = [a1 customDataType];
    [v2 setObject:v6 forKeyedSubscript:@"dataType"];
  }
  else
  {
    if (v5 == 3)
    {
      v6 = [a1 error];
      v7 = objc_msgSend(v6, "mpc_jsonValue");
      v8 = @"error";
    }
    else
    {
      if (v5 != 2) {
        goto LABEL_9;
      }
      v6 = [a1 dialog];
      v7 = objc_msgSend(v6, "mpc_jsonValue");
      v8 = @"dialog";
    }
    [v2 setObject:v7 forKeyedSubscript:v8];
  }
LABEL_9:

  return v2;
}

+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"code"];
  uint64_t v6 = [v5 integerValue];

  v7 = [v4 objectForKeyedSubscript:@"type"];
  uint64_t v8 = [v7 integerValue];

  v9 = 0;
  if (v8 <= 2)
  {
    if (v8 == 1)
    {
      v9 = [a1 statusWithCode:v6];
      goto LABEL_11;
    }
    if (v8 != 2) {
      goto LABEL_11;
    }
    v10 = (void *)MEMORY[0x263F121C0];
    v11 = [v4 objectForKeyedSubscript:@"dialog"];
    v12 = [v10 payloadValueFromJSONValue:v11];

    uint64_t v13 = [a1 statusWithCode:v6 dialog:v12];
    goto LABEL_10;
  }
  if (v8 == 3)
  {
    v18 = (void *)MEMORY[0x263F087E8];
    v19 = [v4 objectForKeyedSubscript:@"error"];
    v12 = [v18 payloadValueFromJSONValue:v19];

    uint64_t v13 = [a1 statusWithCode:v6 error:v12];
LABEL_10:
    v9 = (void *)v13;

    goto LABEL_11;
  }
  if (v8 == 999)
  {
    v14 = (void *)MEMORY[0x263EFF8F8];
    v15 = [v4 objectForKeyedSubscript:@"data"];
    v16 = [v14 payloadValueFromJSONValue:v15];
    v17 = [v4 objectForKeyedSubscript:@"dataType"];
    v9 = [a1 statusWithCode:v6 customData:v16 type:v17];
  }
LABEL_11:

  return v9;
}

@end