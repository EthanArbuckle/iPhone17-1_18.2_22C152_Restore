@interface WFTumblrAccessResource
+ (NSString)tumblrOAuthToken;
+ (NSString)tumblrOAuthTokenSecret;
+ (id)keychain;
+ (id)userInterfaceClasses;
+ (id)userInterfaceProtocol;
+ (void)setTumblrOAuthToken:(id)a3;
+ (void)setTumblrOAuthTokenSecret:(id)a3;
- (BOOL)canLogOut;
- (NSString)OAuthToken;
- (NSString)OAuthTokenSecret;
- (id)associatedAppIdentifier;
- (id)localizedProtectedResourceDescriptionWithContext:(id)a3;
- (id)resourceName;
- (id)username;
- (unint64_t)status;
- (void)logOut;
- (void)makeAvailableWithRemoteInterface:(id)a3 completionHandler:(id)a4;
- (void)setOAuthToken:(id)a3;
- (void)setOAuthTokenSecret:(id)a3;
@end

@implementation WFTumblrAccessResource

+ (id)userInterfaceClasses
{
  v6[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F33B28];
  v5[0] = *MEMORY[0x263F33B40];
  v5[1] = v2;
  v6[0] = @"WFTumblrAccessResourceUserInterface";
  v6[1] = @"WFTumblrAccessResourceUserInterface";
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  return v3;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E2740;
}

+ (void)setTumblrOAuthTokenSecret:(id)a3
{
  id v7 = a3;
  v4 = [a1 tumblrOAuthToken];
  if (v4)
  {
    v5 = [v7 dataUsingEncoding:4];
    v6 = [a1 keychain];
    [v6 setData:v5 forKey:v4];
  }
}

+ (id)keychain
{
  uint64_t v2 = [@"is.workflow.my.app.tumblr.%@" stringByAppendingString:@"secret"];
  v3 = [WFKeychain alloc];
  v4 = [(WFKeychain *)v3 initWithService:v2 accessGroup:*MEMORY[0x263F33B50]];

  return v4;
}

+ (NSString)tumblrOAuthTokenSecret
{
  v3 = [a1 tumblrOAuthToken];
  if (v3)
  {
    v4 = [a1 keychain];
    v5 = [v4 dataForKey:v3];

    if (v5) {
      v6 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

+ (void)setTumblrOAuthToken:(id)a3
{
  id v5 = a3;
  v3 = [MEMORY[0x263EFFA40] workflowUserDefaults];
  v4 = v3;
  if (v5) {
    [v3 setObject:v5 forKey:@"WFTumblrOAuthToken"];
  }
  else {
    [v3 removeObjectForKey:@"WFTumblrOAuthToken"];
  }
}

+ (NSString)tumblrOAuthToken
{
  uint64_t v2 = [MEMORY[0x263EFFA40] workflowUserDefaults];
  v3 = [v2 objectForKey:@"WFTumblrOAuthToken"];

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_OAuthTokenSecret, 0);
  objc_storeStrong((id *)&self->_OAuthToken, 0);
}

- (void)setOAuthTokenSecret:(id)a3
{
}

- (NSString)OAuthTokenSecret
{
  return self->_OAuthTokenSecret;
}

- (void)setOAuthToken:(id)a3
{
}

- (NSString)OAuthToken
{
  return self->_OAuthToken;
}

- (void)logOut
{
  [(id)objc_opt_class() setTumblrOAuthTokenSecret:0];
  [(id)objc_opt_class() setTumblrOAuthToken:0];
  [(WFResource *)self refreshAvailabilityWithNotification];
}

- (BOOL)canLogOut
{
  return 1;
}

- (id)username
{
  return 0;
}

- (id)resourceName
{
  return @"Tumblr";
}

- (void)makeAvailableWithRemoteInterface:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__WFTumblrAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke;
  v8[3] = &unk_264E5CD58;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 authorizeWithCompletionHandler:v8];
}

void __77__WFTumblrAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 refreshAvailabilityWithForcedNotification];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (unint64_t)status
{
  uint64_t v2 = [(id)objc_opt_class() tumblrOAuthToken];
  if ([v2 length])
  {
    v3 = [(id)objc_opt_class() tumblrOAuthTokenSecret];
    if ([v3 length]) {
      unint64_t v4 = 4;
    }
    else {
      unint64_t v4 = 1;
    }
  }
  else
  {
    unint64_t v4 = 1;
  }

  return v4;
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  id v3 = a3;
  unint64_t v4 = WFLocalizedStringResourceWithKey(@"your Tumblr account", @"your Tumblr account");
  id v5 = [v3 localize:v4];

  return v5;
}

- (id)associatedAppIdentifier
{
  return @"com.tumblr.tumblr";
}

@end