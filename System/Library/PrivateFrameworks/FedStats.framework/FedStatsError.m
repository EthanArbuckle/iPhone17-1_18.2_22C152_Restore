@interface FedStatsError
+ (id)errorWithCode:(int64_t)a3 description:(id)a4;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5;
+ (id)errorWithCode:(int64_t)a3 underlyingErrors:(id)a4 description:(id)a5;
@end

@implementation FedStatsError

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  v5 = (objc_class *)MEMORY[0x263F087E8];
  id v6 = a4;
  id v7 = [v5 alloc];
  uint64_t v11 = *MEMORY[0x263F08320];
  v12[0] = v6;
  v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];

  v9 = (void *)[v7 initWithDomain:@"com.apple.FedStats" code:a3 userInfo:v8];
  return v9;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5
{
  v18[2] = *MEMORY[0x263EF8340];
  if (a4)
  {
    id v7 = (objc_class *)MEMORY[0x263F087E8];
    id v8 = a5;
    id v9 = a4;
    id v10 = [v7 alloc];
    uint64_t v11 = *MEMORY[0x263F08608];
    v17[0] = *MEMORY[0x263F08320];
    v17[1] = v11;
    v18[0] = v8;
    v18[1] = v9;
    v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

    v13 = (void *)[v10 initWithDomain:@"com.apple.FedStats" code:a3 userInfo:v12];
  }
  else
  {
    id v14 = a5;
    id v15 = 0;
    v13 = +[FedStatsError errorWithCode:a3 description:v14];
  }
  return v13;
}

+ (id)errorWithCode:(int64_t)a3 underlyingErrors:(id)a4 description:(id)a5
{
  v16[2] = *MEMORY[0x263EF8340];
  id v7 = (objc_class *)MEMORY[0x263F087E8];
  id v8 = a5;
  id v9 = a4;
  id v10 = [v7 alloc];
  uint64_t v11 = *MEMORY[0x263F083F0];
  v15[0] = *MEMORY[0x263F08320];
  v15[1] = v11;
  v16[0] = v8;
  v16[1] = v9;
  v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  v13 = (void *)[v10 initWithDomain:@"com.apple.FedStats" code:a3 userInfo:v12];
  return v13;
}

@end