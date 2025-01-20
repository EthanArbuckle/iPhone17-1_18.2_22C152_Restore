@interface LAPasscodeChangeErrorBuilder
+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4;
+ (id)genericErrorWithDebugDescription:(id)a3;
+ (id)redactError:(id)a3;
@end

@implementation LAPasscodeChangeErrorBuilder

+ (id)redactError:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v8 = 0;
    goto LABEL_11;
  }
  v6 = [v4 domain];
  int v7 = [v6 isEqualToString:@"com.apple.LocalAuthentication.LAPasscodeChangeErrorDomain"];

  if (v7)
  {
    id v8 = v5;
    goto LABEL_11;
  }
  v9 = [v5 domain];
  int v10 = [v9 isEqualToString:@"com.apple.LocalAuthentication.LAPSErrorDomain"];

  if (v10)
  {
    if (![v5 code])
    {
      v14 = [v5 userInfo];
      id v15 = a1;
      uint64_t v16 = 0;
      goto LABEL_10;
    }
    uint64_t v18 = *MEMORY[0x263F08608];
    v19 = v5;
    v11 = NSDictionary;
    v12 = &v19;
    v13 = &v18;
  }
  else
  {
    uint64_t v20 = *MEMORY[0x263F08608];
    v21[0] = v5;
    v11 = NSDictionary;
    v12 = (void **)v21;
    v13 = &v20;
  }
  v14 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
  id v15 = a1;
  uint64_t v16 = 1;
LABEL_10:
  id v8 = [v15 _errorWithCode:v16 userInfo:v14];

LABEL_11:

  return v8;
}

+ (id)genericErrorWithDebugDescription:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = *MEMORY[0x263F07F80];
  v10[0] = a3;
  id v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  int v7 = [a1 _errorWithCode:1 userInfo:v6];

  return v7;
}

+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return (id)[MEMORY[0x263F087E8] errorWithDomain:@"com.apple.LocalAuthentication.LAPasscodeChangeErrorDomain" code:a3 userInfo:a4];
}

@end