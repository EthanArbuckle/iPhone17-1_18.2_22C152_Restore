@interface NSError(MPCPlaybackEngineEventPayload)
+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload;
+ (uint64_t)mpc_userInfoFromJSONValue:()MPCPlaybackEngineEventPayload;
- (id)mpc_jsonValue;
- (id)mpc_userInfoJSONValue;
@end

@implementation NSError(MPCPlaybackEngineEventPayload)

- (id)mpc_userInfoJSONValue
{
  v1 = [a1 userInfo];
  v2 = objc_msgSend(v1, "msv_compactMapValues:", &__block_literal_global_26771);

  return v2;
}

- (id)mpc_jsonValue
{
  v9[3] = *MEMORY[0x263EF8340];
  v8[0] = @"domain";
  v2 = [a1 domain];
  v9[0] = v2;
  v8[1] = @"code";
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "code"));
  v9[1] = v3;
  v8[2] = @"userInfo";
  v4 = objc_msgSend(a1, "mpc_userInfoJSONValue");
  v5 = v4;
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF9D0] null];
  }
  v9[2] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];
  if (!v4) {

  }
  return v6;
}

+ (uint64_t)mpc_userInfoFromJSONValue:()MPCPlaybackEngineEventPayload
{
  return objc_msgSend(a3, "msv_mapValues:", &__block_literal_global_67);
}

+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [v4 objectForKeyedSubscript:@"domain"];
    v6 = [v4 objectForKeyedSubscript:@"code"];
    uint64_t v7 = [v6 integerValue];
    v8 = (void *)MEMORY[0x263F087E8];
    v9 = [v4 objectForKeyedSubscript:@"userInfo"];
    v10 = objc_msgSend(v8, "mpc_userInfoFromJSONValue:", v9);
    v11 = [a1 errorWithDomain:v5 code:v7 userInfo:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end