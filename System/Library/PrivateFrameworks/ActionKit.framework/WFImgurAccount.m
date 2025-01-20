@interface WFImgurAccount
+ (id)clientID;
+ (id)clientSecret;
+ (id)localizedServiceName;
+ (id)redirectURI;
+ (id)responseType;
+ (id)serviceID;
+ (id)serviceName;
+ (id)sessionManager;
- (void)refreshWithCompletionHandler:(id)a3;
@end

@implementation WFImgurAccount

- (void)refreshWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__WFImgurAccount_refreshWithCompletionHandler___block_invoke;
  v7[3] = &unk_264E5B4A0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFImgurAccount;
  id v5 = v4;
  [(WFOAuth2Account *)&v6 refreshWithCompletionHandler:v7];
}

void __47__WFImgurAccount_refreshWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 domain];
  int v4 = [v3 isEqualToString:@"WFOAuth2ErrorDomain"];

  if (v4) {
    +[WFAccount deleteAccount:*(void *)(a1 + 32)];
  }
  uint64_t v5 = *(void *)(a1 + 40);
  objc_super v6 = v7;
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
    objc_super v6 = v7;
  }
}

+ (id)responseType
{
  v2 = @"token";
  return @"token";
}

+ (id)redirectURI
{
  return (id)[NSURL URLWithString:@"workflow://imgur_auth"];
}

+ (id)clientSecret
{
  return @"c78e0833cf4acb2e8a0602152526a970921129c0";
}

+ (id)clientID
{
  return @"520dd4dcbe12c2a";
}

+ (id)sessionManager
{
  v3 = [WFImgurOAuth2SessionManager alloc];
  int v4 = [a1 clientID];
  uint64_t v5 = [a1 clientSecret];
  objc_super v6 = [(WFImgurOAuth2SessionManager *)v3 initWithClientID:v4 clientSecret:v5];

  return v6;
}

+ (id)localizedServiceName
{
  return WFLocalizedString(@"Imgur");
}

+ (id)serviceName
{
  return @"Imgur";
}

+ (id)serviceID
{
  return @"is.workflow.my.app.imgur";
}

@end