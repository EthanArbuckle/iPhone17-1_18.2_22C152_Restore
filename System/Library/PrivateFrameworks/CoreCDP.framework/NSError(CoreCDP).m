@interface NSError(CoreCDP)
+ (id)cdp_errorWithCode:()CoreCDP underlyingError:;
+ (uint64_t)cdp_errorWithCode:()CoreCDP;
+ (uint64_t)cdp_errorWithCode:()CoreCDP userInfo:;
- (BOOL)cdp_isCDPErrorWithCode:()CoreCDP;
- (uint64_t)cdp_isLoginHardLimit;
- (uint64_t)cdp_isLoginSoftLimit;
@end

@implementation NSError(CoreCDP)

+ (uint64_t)cdp_errorWithCode:()CoreCDP
{
  return objc_msgSend(a1, "cdp_errorWithCode:userInfo:", a3, 0);
}

+ (uint64_t)cdp_errorWithCode:()CoreCDP userInfo:
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"CDPStateError" code:a3 userInfo:a4];
}

+ (id)cdp_errorWithCode:()CoreCDP underlyingError:
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    uint64_t v10 = *MEMORY[0x263F08608];
    v11[0] = v5;
    v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:userInfo:", a3, v7);

  return v8;
}

- (BOOL)cdp_isCDPErrorWithCode:()CoreCDP
{
  id v5 = [a1 domain];
  if ([v5 isEqualToString:@"CDPStateError"]) {
    BOOL v6 = [a1 code] == a3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (uint64_t)cdp_isLoginHardLimit
{
  return objc_msgSend(a1, "cdp_isCDPErrorWithCode:", -5204);
}

- (uint64_t)cdp_isLoginSoftLimit
{
  return objc_msgSend(a1, "cdp_isCDPErrorWithCode:", -5203);
}

@end