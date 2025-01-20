@interface SLGoogleWebClient
+ (BOOL)supportsSecureCoding;
+ (id)dataclassesForScopes:(id)a3;
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
- (SLGoogleWebClient)initWithClientID:(id)a3;
- (SLGoogleWebClient)initWithCoder:(id)a3;
- (id)loginScopes;
@end

@implementation SLGoogleWebClient

- (SLGoogleWebClient)initWithClientID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SLGoogleWebClient;
  v6 = [(SLGoogleWebClient *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_clientID, a3);
  }

  return v7;
}

- (SLGoogleWebClient)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SLGoogleWebClient;
  return [(SLGoogleWebClient *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)clientID
{
  if (self->_clientID) {
    return self->_clientID;
  }
  else {
    return (NSString *)@"450232826690-0rm6bs9d2fps9tifvk2oodh3tasd7vl7.apps.googleusercontent.com";
  }
}

- (NSString)clientSecret
{
  return 0;
}

- (NSString)clientRedirect
{
  return (NSString *)@"urn:ietf:wg:oauth:2.0:oob";
}

- (NSString)tokenURL
{
  return (NSString *)@"https://www.googleapis.com/oauth2/v4/token";
}

- (NSString)authRequestURL
{
  return (NSString *)@"https://accounts.google.com/o/oauth2/v2/auth";
}

- (NSString)userInfoURL
{
  return (NSString *)@"https://people.googleapis.com/v1/people/me?personFields=emailAddresses,names";
}

- (NSString)fallbackUserInfoURL
{
  return (NSString *)@"https://www.googleapis.com/plus/v1/people/me";
}

- (NSArray)defaultScope
{
  return (NSArray *)&unk_1F1E40DB0;
}

- (id)loginScopes
{
  return &unk_1F1E40DC8;
}

- (NSArray)youTubeScope
{
  return (NSArray *)&unk_1F1E40DE0;
}

- (NSArray)emailScope
{
  return (NSArray *)&unk_1F1E40DF8;
}

+ (id)dataclassesForScopes:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = [MEMORY[0x1E4F1CA80] set];
  if ([v3 containsObject:@"https://mail.google.com/"])
  {
    uint64_t v5 = *MEMORY[0x1E4F175F0];
    v9[0] = *MEMORY[0x1E4F175C8];
    v9[1] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    [v4 addObjectsFromArray:v6];
  }
  if ([v3 containsObject:@"https://www.googleapis.com/auth/calendar"]) {
    [v4 addObject:*MEMORY[0x1E4F17568]];
  }
  if ([v3 containsObject:@"https://www.googleapis.com/auth/carddav"]) {
    [v4 addObject:*MEMORY[0x1E4F17578]];
  }
  v7 = [v4 allObjects];

  return v7;
}

- (NSString)source
{
  return 0;
}

- (NSString)clientRedirectForAppOpenURL
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
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
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
}

@end