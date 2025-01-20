@interface WFDropboxAccount
+ (id)clientID;
+ (id)clientSecret;
+ (id)localizedServiceName;
+ (id)redirectURI;
+ (id)responseType;
+ (id)serviceID;
+ (id)serviceName;
+ (id)sessionManager;
@end

@implementation WFDropboxAccount

+ (id)responseType
{
  v2 = @"token";
  return @"token";
}

+ (id)redirectURI
{
  v2 = NSURL;
  v3 = NSString;
  v4 = [a1 clientID];
  v5 = [v3 stringWithFormat:@"db-%@://2/token", v4];
  v6 = [v2 URLWithString:v5];

  return v6;
}

+ (id)clientSecret
{
  return @"1cht7oafrslos09";
}

+ (id)clientID
{
  return @"i0cvbg4s5rzbeys";
}

+ (id)localizedServiceName
{
  return WFLocalizedString(@"Dropbox");
}

+ (id)serviceName
{
  return @"Dropbox";
}

+ (id)sessionManager
{
  v3 = [WFDropboxOAuth2SessionManager alloc];
  v4 = [a1 clientID];
  v5 = [a1 clientSecret];
  v6 = [(WFDropboxOAuth2SessionManager *)v3 initWithClientID:v4 clientSecret:v5];

  return v6;
}

+ (id)serviceID
{
  return @"is.workflow.my.app.dropbox";
}

@end