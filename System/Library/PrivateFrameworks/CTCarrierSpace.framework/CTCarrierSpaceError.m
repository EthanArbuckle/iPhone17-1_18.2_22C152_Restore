@interface CTCarrierSpaceError
+ (id)errorForCode:(int64_t)a3;
+ (id)errorForCode:(int64_t)a3 subdomain:(int64_t)a4 subdomainError:(int64_t)a5;
+ (id)errorForCode:(int64_t)a3 withDescription:(id)a4;
@end

@implementation CTCarrierSpaceError

+ (id)errorForCode:(int64_t)a3
{
  v5 = errorDescription(a3);
  v6 = [a1 errorForCode:a3 withDescription:v5];

  return v6;
}

+ (id)errorForCode:(int64_t)a3 withDescription:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    uint64_t v10 = *MEMORY[0x263F08320];
    v11[0] = v5;
    v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    v7 = 0;
  }
  v8 = [MEMORY[0x263F087E8] errorWithDomain:@"CTCarrierSpaceError" code:a3 userInfo:v7];

  return v8;
}

+ (id)errorForCode:(int64_t)a3 subdomain:(int64_t)a4 subdomainError:(int64_t)a5
{
  v8 = errorDescription(a3);
  if (a4 == 1)
  {
    v9 = +[CTCarrierSpaceDataPlanMetricsError errorDescriptionForCode:a5];
  }
  else
  {
    v9 = 0;
  }
  uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
  [v10 setObject:v8 forKeyedSubscript:*MEMORY[0x263F08320]];
  if (v9) {
    [v10 setObject:v9 forKeyedSubscript:*MEMORY[0x263F08338]];
  }
  v11 = [MEMORY[0x263F087E8] errorWithDomain:@"CTCarrierSpaceError" code:a3 userInfo:v10];

  return v11;
}

@end