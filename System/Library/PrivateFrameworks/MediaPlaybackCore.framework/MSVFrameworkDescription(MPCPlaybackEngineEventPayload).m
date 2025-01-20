@interface MSVFrameworkDescription(MPCPlaybackEngineEventPayload)
+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload;
- (id)mpc_jsonValue;
@end

@implementation MSVFrameworkDescription(MPCPlaybackEngineEventPayload)

+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  id v4 = a3;
  id v5 = [a1 alloc];
  v6 = [v4 objectForKeyedSubscript:@"name"];
  id v7 = objc_alloc(MEMORY[0x263F08C38]);
  v8 = [v4 objectForKeyedSubscript:@"uuid"];
  v9 = (void *)[v7 initWithUUIDString:v8];
  v10 = [v4 objectForKeyedSubscript:@"version"];
  v11 = [v4 objectForKeyedSubscript:@"root"];
  uint64_t v12 = [v11 BOOLValue];
  v13 = [v4 objectForKeyedSubscript:@"debug"];

  v14 = objc_msgSend(v5, "initWithName:uuid:version:root:debug:", v6, v9, v10, v12, objc_msgSend(v13, "BOOLValue"));

  return v14;
}

- (id)mpc_jsonValue
{
  v13[5] = *MEMORY[0x263EF8340];
  v12[0] = @"name";
  v2 = [a1 name];
  v13[0] = v2;
  v12[1] = @"uuid";
  v3 = [a1 uuid];
  id v4 = [v3 UUIDString];
  v13[1] = v4;
  v12[2] = @"version";
  uint64_t v5 = [a1 version];
  v6 = (void *)v5;
  id v7 = &stru_26CBCA930;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  v13[2] = v7;
  v12[3] = @"debug";
  v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isDebug"));
  v13[3] = v8;
  v12[4] = @"root";
  v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isRoot"));
  v13[4] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:5];

  return v10;
}

@end