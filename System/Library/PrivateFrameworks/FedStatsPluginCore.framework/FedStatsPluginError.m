@interface FedStatsPluginError
+ (id)errorWithCode:(int64_t)a3 description:(id)a4;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5;
+ (id)errorWithCode:(int64_t)a3 underlyingErrors:(id)a4 description:(id)a5;
@end

@implementation FedStatsPluginError

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v11 = *MEMORY[0x263F08320];
  v12[0] = a4;
  v5 = NSDictionary;
  id v6 = a4;
  v7 = [v5 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v8 = objc_alloc(MEMORY[0x263F087E8]);

  v9 = (void *)[v8 initWithDomain:@"com.apple.FedStats" code:a3 userInfo:v7];
  return v9;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5
{
  v18[2] = *MEMORY[0x263EF8340];
  if (a4)
  {
    uint64_t v7 = *MEMORY[0x263F08608];
    v17[0] = *MEMORY[0x263F08320];
    v17[1] = v7;
    v18[0] = a5;
    v18[1] = a4;
    id v8 = NSDictionary;
    id v9 = a5;
    id v10 = a4;
    uint64_t v11 = [v8 dictionaryWithObjects:v18 forKeys:v17 count:2];
    id v12 = objc_alloc(MEMORY[0x263F087E8]);

    v13 = (void *)[v12 initWithDomain:@"com.apple.FedStats" code:a3 userInfo:v11];
  }
  else
  {
    id v14 = a5;
    id v15 = 0;
    v13 = +[FedStatsPluginError errorWithCode:a3 description:v14];
  }
  return v13;
}

+ (id)errorWithCode:(int64_t)a3 underlyingErrors:(id)a4 description:(id)a5
{
  v18[2] = *MEMORY[0x263EF8340];
  if (a4)
  {
    uint64_t v7 = *MEMORY[0x263F083F0];
    v17[0] = *MEMORY[0x263F08320];
    v17[1] = v7;
    v18[0] = a5;
    v18[1] = a4;
    id v8 = NSDictionary;
    id v9 = a5;
    id v10 = a4;
    uint64_t v11 = [v8 dictionaryWithObjects:v18 forKeys:v17 count:2];
    id v12 = objc_alloc(MEMORY[0x263F087E8]);

    v13 = (void *)[v12 initWithDomain:@"com.apple.FedStats" code:a3 userInfo:v11];
  }
  else
  {
    id v14 = a5;
    id v15 = 0;
    v13 = +[FedStatsPluginError errorWithCode:a3 description:v14];
  }
  return v13;
}

@end