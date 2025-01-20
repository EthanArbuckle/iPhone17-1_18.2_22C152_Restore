@interface LAPasscodeServiceErrorBuilder
+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4;
+ (id)genericErrorWithDebugDescription:(id)a3;
+ (id)redactError:(id)a3;
@end

@implementation LAPasscodeServiceErrorBuilder

+ (id)redactError:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v8 = 0;
    goto LABEL_17;
  }
  v6 = [v4 domain];
  int v7 = [v6 isEqualToString:@"com.apple.LocalAuthentication.LAPasscodeServiceErrorDomain"];

  if (v7)
  {
    id v8 = v5;
    goto LABEL_17;
  }
  v9 = [v5 domain];
  int v10 = [v9 isEqualToString:@"com.apple.LocalAuthentication.LAPSErrorDomain"];

  if ((v10 & 1) == 0)
  {
    uint64_t v20 = *MEMORY[0x263F08608];
    v21[0] = v5;
    v14 = NSDictionary;
    v15 = (void **)v21;
    v16 = &v20;
LABEL_10:
    v11 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
    id v12 = a1;
    uint64_t v13 = 4;
    goto LABEL_16;
  }
  if (![v5 code])
  {
    v11 = [v5 userInfo];
    id v12 = a1;
    uint64_t v13 = 0;
    goto LABEL_16;
  }
  if ([v5 code] != 1)
  {
    if ([v5 code] == 2)
    {
      v11 = [v5 userInfo];
      id v12 = a1;
      uint64_t v13 = 3;
      goto LABEL_16;
    }
    if ([v5 code] == 3)
    {
      v11 = [v5 userInfo];
      id v12 = a1;
      uint64_t v13 = 2;
      goto LABEL_16;
    }
    uint64_t v18 = *MEMORY[0x263F08608];
    v19 = v5;
    v14 = NSDictionary;
    v15 = &v19;
    v16 = &v18;
    goto LABEL_10;
  }
  v11 = [v5 userInfo];
  id v12 = a1;
  uint64_t v13 = 1;
LABEL_16:
  id v8 = [v12 _errorWithCode:v13 userInfo:v11];

LABEL_17:

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

  int v7 = [a1 _errorWithCode:4 userInfo:v6];

  return v7;
}

+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return (id)[MEMORY[0x263F087E8] errorWithDomain:@"com.apple.LocalAuthentication.LAPasscodeServiceErrorDomain" code:a3 userInfo:a4];
}

@end