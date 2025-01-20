@interface LACBackgroundTaskErrorBuilder
+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4;
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4;
@end

@implementation LACBackgroundTaskErrorBuilder

+ (id)errorWithCode:(int64_t)a3
{
  return (id)[a1 _errorWithCode:a3 userInfo:0];
}

+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v11 = *MEMORY[0x263F07F80];
  v12[0] = a4;
  v6 = NSDictionary;
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];

  v9 = [a1 _errorWithCode:a3 userInfo:v8];

  return v9;
}

+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return (id)[MEMORY[0x263F087E8] errorWithDomain:@"LACBackgroundTaskErrorDomain" code:a3 userInfo:a4];
}

@end