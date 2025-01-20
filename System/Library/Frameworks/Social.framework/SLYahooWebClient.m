@interface SLYahooWebClient
+ (BOOL)supportsSecureCoding;
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
- (SLYahooWebClient)initWithCoder:(id)a3;
@end

@implementation SLYahooWebClient

- (SLYahooWebClient)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SLYahooWebClient;
  return [(SLYahooWebClient *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)clientID
{
  return (NSString *)@"dj0yJmk9blBKcUh4SVNnZWFCJmQ9WVdrOVdEWk5XRlkyTXpBbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD1iMQ--";
}

- (NSString)clientSecret
{
  v10[1] = *MEMORY[0x1E4F143B8];
  int v2 = [@"1ff1e68bef:b72224e516b1480b95f14f8e6:b44" length];
  MEMORY[0x1F4188790]();
  objc_super v4 = (char *)v10 - v3;
  uint64_t v5 = [@"1ff1e68bef:b72224e516b1480b95f14f8e6:b44" UTF8String];
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

- (NSString)clientRedirect
{
  return (NSString *)@"https://apple.com";
}

- (NSString)source
{
  return (NSString *)@"iphone01";
}

- (NSString)tokenURL
{
  return (NSString *)@"https://api.login.yahoo.com/oauth2/get_token";
}

- (NSString)authRequestURL
{
  return (NSString *)@"https://api.login.yahoo.com/oauth2/request_auth";
}

- (NSString)userInfoURL
{
  return (NSString *)@"https://api.login.yahoo.com/openid/v1/userinfo?scope=openid%20sdpp-w";
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