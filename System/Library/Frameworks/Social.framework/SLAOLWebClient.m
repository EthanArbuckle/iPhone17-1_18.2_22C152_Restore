@interface SLAOLWebClient
+ (BOOL)supportsSecureCoding;
+ (id)clientRedirect;
- (Class)fallbackWebUserInfoResponseClass;
- (Class)tokenRequestClass;
- (Class)tokenResponseClass;
- (Class)webAuthRequestClass;
- (Class)webUserInfoResponseClass;
- (NSArray)defaultScope;
- (NSArray)emailScope;
- (NSArray)youTubeScope;
- (NSString)authRequestURL;
- (NSString)clientID;
- (NSString)clientRedirect;
- (NSString)clientRedirectForAppOpenURL;
- (NSString)clientSecret;
- (NSString)fallbackUserInfoURL;
- (NSString)source;
- (NSString)tokenURL;
- (NSString)userInfoURL;
- (SLAOLWebClient)initWithCoder:(id)a3;
@end

@implementation SLAOLWebClient

- (SLAOLWebClient)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SLAOLWebClient;
  return [(SLAOLWebClient *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)clientID
{
  return (NSString *)@"kmpMGPVGmSPvOqfD";
}

- (NSString)clientSecret
{
  v10[1] = *MEMORY[0x1E4F143B8];
  int v2 = [@"dzxrqhuqe9kajx2jm9znic2876vk{bhl2sme6x5h" length];
  MEMORY[0x1F4188790]();
  objc_super v4 = (char *)v10 - v3;
  uint64_t v5 = [@"dzxrqhuqe9kajx2jm9znic2876vk{bhl2sme6x5h" UTF8String];
  if (v2 < 1)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = v2;
    do
    {
      v4[v6] = *(unsigned char *)(v5 + v6) - ((v6 + 1) & 1);
      ++v6;
    }
    while (v2 != v6);
  }
  v4[v7] = 0;
  v8 = [NSString stringWithUTF8String:v4];

  return (NSString *)v8;
}

+ (id)clientRedirect
{
  return @"https://apple.com";
}

- (NSString)tokenURL
{
  return (NSString *)@"https://api.login.aol.com/oauth2/get_token";
}

- (NSString)authRequestURL
{
  return (NSString *)@"https://api.login.aol.com/oauth2/request_auth";
}

- (NSString)userInfoURL
{
  return (NSString *)@"https://api.login.aol.com/openid/v1/userinfo";
}

- (NSString)clientRedirect
{
  return (NSString *)@"https://apple.com";
}

- (NSString)source
{
  return (NSString *)@"iphone01";
}

- (NSString)fallbackUserInfoURL
{
  return 0;
}

- (Class)tokenResponseClass
{
  return (Class)objc_opt_class();
}

- (Class)tokenRequestClass
{
  return (Class)objc_opt_class();
}

- (Class)webAuthRequestClass
{
  return (Class)objc_opt_class();
}

- (Class)webUserInfoResponseClass
{
  return (Class)objc_opt_class();
}

- (Class)fallbackWebUserInfoResponseClass
{
  return 0;
}

- (NSString)clientRedirectForAppOpenURL
{
  return 0;
}

- (NSArray)defaultScope
{
  return 0;
}

- (NSArray)youTubeScope
{
  return 0;
}

- (NSArray)emailScope
{
  return 0;
}

@end