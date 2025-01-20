@interface HLPCommonDefines
+ (BOOL)hasServiceTicket;
+ (BOOL)isInternalBuild;
+ (BOOL)isVisionOS;
+ (id)assetRequestHeaderFields;
+ (id)assetServiceTicket;
+ (id)clientID;
+ (id)contentRequestHeaderFields;
+ (id)contentServiceTicket;
+ (id)userName;
+ (void)setAuthenticationContext:(id)a3;
@end

@implementation HLPCommonDefines

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1) {
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_11);
  }
  return isInternalBuild__isInternal;
}

uint64_t __35__HLPCommonDefines_isInternalBuild__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isInternalBuild__isInternal = result;
  return result;
}

+ (BOOL)isVisionOS
{
  if (isVisionOS_onceToken != -1) {
    dispatch_once(&isVisionOS_onceToken, &__block_literal_global_3);
  }
  return isVisionOS__isVisionOS;
}

void __30__HLPCommonDefines_isVisionOS__block_invoke()
{
  id v0 = [MEMORY[0x263F1C5C0] currentDevice];
  isVisionOS__isVisionOS = [v0 userInterfaceIdiom] == 6;
}

+ (void)setAuthenticationContext:(id)a3
{
}

+ (id)userName
{
  return (id)[(id)kHLPAuthenticationContext objectForKeyedSubscript:@"user-name"];
}

+ (id)clientID
{
  return (id)[(id)kHLPAuthenticationContext objectForKeyedSubscript:@"client-id"];
}

+ (id)contentServiceTicket
{
  return (id)[(id)kHLPAuthenticationContext objectForKeyedSubscript:@"content-service-ticket"];
}

+ (id)assetServiceTicket
{
  return (id)[(id)kHLPAuthenticationContext objectForKeyedSubscript:@"asset-service-ticket"];
}

+ (BOOL)hasServiceTicket
{
  return kHLPAuthenticationContext
      && +[HLPCommonDefines isInternalBuild];
}

+ (id)contentRequestHeaderFields
{
  v9[2] = *MEMORY[0x263EF8340];
  if (+[HLPCommonDefines hasServiceTicket])
  {
    v2 = +[HLPCommonDefines contentServiceTicket];
    uint64_t v3 = +[HLPCommonDefines userName];
    v4 = (void *)v3;
    if (v2) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      v6 = 0;
    }
    else
    {
      v8[0] = @"X-AppleConnect-Token";
      v8[1] = @"X-AppleConnect-User";
      v9[0] = v2;
      v9[1] = v3;
      v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)assetRequestHeaderFields
{
  v11[3] = *MEMORY[0x263EF8340];
  if (+[HLPCommonDefines hasServiceTicket])
  {
    v2 = +[HLPCommonDefines assetServiceTicket];
    uint64_t v3 = +[HLPCommonDefines userName];
    uint64_t v4 = +[HLPCommonDefines clientID];
    BOOL v5 = (void *)v4;
    if (v2) {
      BOOL v6 = v3 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6 || v4 == 0)
    {
      v8 = 0;
    }
    else
    {
      v10[0] = @"X-AppleConnect-Token";
      v10[1] = @"X-AppleConnect-User";
      v11[0] = v2;
      v11[1] = v3;
      v10[2] = @"X-Client-Id";
      v11[2] = v4;
      v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end