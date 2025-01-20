@interface DSError
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 appName:(id)a4;
+ (id)errorWithCode:(int64_t)a3 appName:(id)a4 serviceName:(id)a5 underlyingErrors:(id)a6;
+ (id)errorWithCode:(int64_t)a3 serviceName:(id)a4;
+ (id)errorWithCode:(int64_t)a3 sourceName:(id)a4;
+ (id)errorWithCode:(int64_t)a3 sourceName:(id)a4 underlyingErrors:(id)a5;
+ (id)errorWithCode:(int64_t)a3 underlyingErrors:(id)a4;
@end

@implementation DSError

+ (id)errorWithCode:(int64_t)a3
{
  return (id)[a1 errorWithCode:a3 underlyingErrors:MEMORY[0x263EFFA68]];
}

+ (id)errorWithCode:(int64_t)a3 sourceName:(id)a4
{
  return (id)[a1 errorWithCode:a3 sourceName:a4 underlyingErrors:MEMORY[0x263EFFA68]];
}

+ (id)errorWithCode:(int64_t)a3 appName:(id)a4
{
  return (id)[a1 errorWithCode:a3 appName:a4 serviceName:0 underlyingErrors:MEMORY[0x263EFFA68]];
}

+ (id)errorWithCode:(int64_t)a3 serviceName:(id)a4
{
  return (id)[a1 errorWithCode:a3 appName:0 serviceName:a4 underlyingErrors:MEMORY[0x263EFFA68]];
}

+ (id)errorWithCode:(int64_t)a3 underlyingErrors:(id)a4
{
  return (id)[a1 errorWithCode:a3 sourceName:0 underlyingErrors:a4];
}

+ (id)errorWithCode:(int64_t)a3 sourceName:(id)a4 underlyingErrors:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = descriptionForError(a3);
  v10 = [MEMORY[0x263EFF9A0] dictionary];
  v11 = v10;
  if (v9) {
    [v10 setObject:v9 forKeyedSubscript:*MEMORY[0x263F08320]];
  }
  if ([v8 count]) {
    [v11 setObject:v8 forKeyedSubscript:*MEMORY[0x263F083F0]];
  }
  if (v7) {
    [v11 setObject:v7 forKeyedSubscript:@"DSErrorKeySourceName"];
  }
  v12 = [MEMORY[0x263F087E8] errorWithDomain:DSErrorDomain code:a3 userInfo:v11];

  return v12;
}

+ (id)errorWithCode:(int64_t)a3 appName:(id)a4 serviceName:(id)a5 underlyingErrors:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = descriptionForError(a3);
  v13 = [MEMORY[0x263EFF9A0] dictionary];
  v14 = v13;
  if (v12) {
    [v13 setObject:v12 forKeyedSubscript:*MEMORY[0x263F08320]];
  }
  if ([v11 count]) {
    [v14 setObject:v11 forKeyedSubscript:*MEMORY[0x263F083F0]];
  }
  if (v9) {
    [v14 setObject:v9 forKeyedSubscript:@"DSErrorKeyAppName"];
  }
  if (v10) {
    [v14 setObject:v10 forKeyedSubscript:@"DSErrorKeyServiceName"];
  }
  v15 = [MEMORY[0x263F087E8] errorWithDomain:DSErrorDomain code:a3 userInfo:v14];

  return v15;
}

@end