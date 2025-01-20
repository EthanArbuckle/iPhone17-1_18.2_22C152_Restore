@interface LACError
+ (BOOL)error:(id)a3 hasCode:(int64_t)a4;
+ (BOOL)error:(id)a3 hasCode:(int64_t)a4 subcode:(int64_t)a5;
+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4;
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4;
+ (id)errorWithCode:(int64_t)a3 localizedDescription:(id)a4;
+ (id)errorWithCode:(int64_t)a3 localizedDescription:(id)a4 underlyingError:(id)a5;
+ (id)errorWithCode:(int64_t)a3 subcode:(int64_t)a4;
+ (id)errorWithCode:(int64_t)a3 subcode:(int64_t)a4 debugDescription:(id)a5;
+ (id)errorWithCode:(int64_t)a3 subcode:(int64_t)a4 userInfo:(id)a5;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 debugDescription:(id)a5;
+ (id)missingEntitlementError:(id)a3;
@end

@implementation LACError

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
  return (id)[MEMORY[0x263F087E8] errorWithDomain:@"com.apple.LocalAuthentication" code:a3 userInfo:a4];
}

+ (id)missingEntitlementError:(id)a3
{
  v4 = [NSString stringWithFormat:@"Caller is missing the required '%@' entitlement.", a3];
  v5 = [a1 errorWithCode:-1007 debugDescription:v4];

  return v5;
}

+ (id)errorWithCode:(int64_t)a3
{
  return (id)[a1 _errorWithCode:a3 userInfo:0];
}

+ (id)errorWithCode:(int64_t)a3 subcode:(int64_t)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  v10 = @"Subcode";
  v6 = [NSNumber numberWithInteger:a4];
  v11[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = [a1 _errorWithCode:a3 userInfo:v7];

  return v8;
}

+ (id)errorWithCode:(int64_t)a3 subcode:(int64_t)a4 debugDescription:(id)a5
{
  v15[2] = *MEMORY[0x263EF8340];
  v14[0] = @"Subcode";
  v8 = NSNumber;
  id v9 = a5;
  v10 = [v8 numberWithInteger:a4];
  v14[1] = *MEMORY[0x263F07F80];
  v15[0] = v10;
  v15[1] = v9;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  v12 = [a1 _errorWithCode:a3 userInfo:v11];

  return v12;
}

+ (id)errorWithCode:(int64_t)a3 subcode:(int64_t)a4 userInfo:(id)a5
{
  if (a5) {
    id v8 = a5;
  }
  else {
    id v8 = (id)MEMORY[0x263EFFA78];
  }
  id v9 = (void *)[v8 mutableCopy];
  v10 = [NSNumber numberWithInteger:a4];
  [v9 setObject:v10 forKeyedSubscript:@"Subcode"];

  uint64_t v11 = [a1 _errorWithCode:a3 userInfo:v9];

  return v11;
}

+ (id)errorWithCode:(int64_t)a3 localizedDescription:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v11 = *MEMORY[0x263F08320];
  v12[0] = a4;
  v6 = NSDictionary;
  id v7 = a4;
  id v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];

  id v9 = [a1 _errorWithCode:a3 userInfo:v8];

  return v9;
}

+ (id)errorWithCode:(int64_t)a3 localizedDescription:(id)a4 underlyingError:(id)a5
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v8 = *MEMORY[0x263F08608];
  v15[0] = *MEMORY[0x263F08320];
  v15[1] = v8;
  v16[0] = a4;
  v16[1] = a5;
  id v9 = NSDictionary;
  id v10 = a5;
  id v11 = a4;
  v12 = [v9 dictionaryWithObjects:v16 forKeys:v15 count:2];

  v13 = [a1 _errorWithCode:a3 userInfo:v12];

  return v13;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    uint64_t v11 = *MEMORY[0x263F08608];
    v12[0] = v6;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v9 = [a1 _errorWithCode:a3 userInfo:v8];
  }
  else
  {
    id v9 = [a1 errorWithCode:a3];
  }

  return v9;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 debugDescription:(id)a5
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v8 = *MEMORY[0x263F08608];
  v15[0] = *MEMORY[0x263F07F80];
  v15[1] = v8;
  v16[0] = a5;
  v16[1] = a4;
  id v9 = NSDictionary;
  id v10 = a5;
  id v11 = a4;
  v12 = [v9 dictionaryWithObjects:v16 forKeys:v15 count:2];

  v13 = [a1 _errorWithCode:a3 userInfo:v12];

  return v13;
}

+ (BOOL)error:(id)a3 hasCode:(int64_t)a4
{
  return [a1 error:a3 hasCode:a4 subcode:0];
}

+ (BOOL)error:(id)a3 hasCode:(int64_t)a4 subcode:(int64_t)a5
{
  id v7 = a3;
  uint64_t v8 = [v7 domain];
  int v9 = [v8 isEqualToString:@"com.apple.LocalAuthentication"];

  if (v9 && [v7 code] == a4)
  {
    id v10 = [v7 userInfo];
    id v11 = [v10 objectForKeyedSubscript:@"Subcode"];

    if (v11) {
      uint64_t v12 = [v11 integerValue];
    }
    else {
      uint64_t v12 = 0;
    }
    BOOL v13 = v12 == a5;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

@end