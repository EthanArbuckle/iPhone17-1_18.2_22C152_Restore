@interface NSError(WCError)
+ (id)userInfoDictionaryWithErrorStringsForErrorCode:()WCError;
+ (id)wcErrorFromInternalError:()WCError;
+ (id)wcErrorFromReceivedCode:()WCError;
+ (id)wcErrorWithCode:()WCError underlyingError:;
+ (id)wcErrorWithCode:()WCError underlyingWCErrorWithCode:;
+ (id)wcErrorWithCode:()WCError userInfo:;
+ (uint64_t)wcErrorWithCode:()WCError;
+ (uint64_t)wcInternalErrorWithCode:()WCError;
@end

@implementation NSError(WCError)

+ (id)wcErrorWithCode:()WCError userInfo:
{
  id v6 = a4;
  v7 = [a1 userInfoDictionaryWithErrorStringsForErrorCode:a3];
  [v7 addEntriesFromDictionary:v6];

  v8 = [MEMORY[0x263F087E8] errorWithDomain:@"WCErrorDomain" code:a3 userInfo:v7];

  return v8;
}

+ (uint64_t)wcErrorWithCode:()WCError
{
  return [a1 wcErrorWithCode:a3 userInfo:0];
}

+ (id)userInfoDictionaryWithErrorStringsForErrorCode:()WCError
{
  if (userInfoDictionaryWithErrorStringsForErrorCode__onceToken != -1) {
    dispatch_once(&userInfoDictionaryWithErrorStringsForErrorCode__onceToken, &__block_literal_global_0);
  }
  v4 = objc_opt_new();
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"Err%d", a3);
  id v6 = [(id)userInfoDictionaryWithErrorStringsForErrorCode__bundle localizedStringForKey:v5 value:&stru_26D525540 table:0];
  if ([v6 length]) {
    [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x263F08320]];
  }
  v7 = [NSString stringWithFormat:@"%@-C", v5];
  v8 = [(id)userInfoDictionaryWithErrorStringsForErrorCode__bundle localizedStringForKey:v7 value:&stru_26D525540 table:0];
  if ([v8 length]) {
    [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x263F08338]];
  }
  v9 = [NSString stringWithFormat:@"%@-R", v5];
  v10 = [(id)userInfoDictionaryWithErrorStringsForErrorCode__bundle localizedStringForKey:v9 value:&stru_26D525540 table:0];
  if ([v10 length]) {
    [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x263F08348]];
  }

  return v4;
}

+ (id)wcErrorFromReceivedCode:()WCError
{
  if (a3 == 7010)
  {
    v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v6 = 7014;
    uint64_t v3 = 7010;
  }
  else
  {
    uint64_t v3 = a3;
    if (a3 == 7014)
    {
      v4 = [MEMORY[0x263F087E8] wcErrorWithCode:7014];
      goto LABEL_7;
    }
    v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v6 = 7011;
  }
  v4 = [v5 wcErrorWithCode:v6 underlyingWCErrorWithCode:v3];
LABEL_7:

  return v4;
}

+ (id)wcErrorWithCode:()WCError underlyingError:
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v11 = *MEMORY[0x263F08608];
  v12[0] = a4;
  uint64_t v6 = NSDictionary;
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];

  v9 = [a1 wcErrorWithCode:a3 userInfo:v8];

  return v9;
}

+ (id)wcErrorWithCode:()WCError underlyingWCErrorWithCode:
{
  uint64_t v6 = [a1 wcErrorWithCode:a4];
  id v7 = [a1 wcErrorWithCode:a3 underlyingError:v6];

  return v7;
}

+ (uint64_t)wcInternalErrorWithCode:()WCError
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"WCInternalErrorDomain" code:a3 userInfo:0];
}

+ (id)wcErrorFromInternalError:()WCError
{
  id v3 = a3;
  v4 = [v3 domain];
  char v5 = [v4 isEqual:@"WCInternalErrorDomain"];

  uint64_t v6 = v3;
  if ((v5 & 1) == 0)
  {
    uint64_t v6 = v3;
    if ((unint64_t)([v3 code] - 7501) <= 1)
    {
      uint64_t v6 = [MEMORY[0x263F087E8] wcErrorWithCode:7001 underlyingError:v3];
    }
  }

  return v6;
}

@end