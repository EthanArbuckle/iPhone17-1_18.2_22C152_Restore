@interface WFInstapaperAccessResource
+ (NSString)instapaperToken;
+ (NSString)instapaperTokenSecret;
+ (NSString)instapaperUsername;
+ (id)keychain;
+ (id)userInterfaceClasses;
+ (id)userInterfaceProtocol;
+ (void)initialize;
+ (void)setInstapaperToken:(id)a3;
+ (void)setInstapaperTokenSecret:(id)a3;
+ (void)setInstapaperUsername:(id)a3;
- (BOOL)canLogOut;
- (id)associatedAppIdentifier;
- (id)localizedProtectedResourceDescriptionWithContext:(id)a3;
- (id)resourceName;
- (id)username;
- (unint64_t)status;
- (void)logOut;
- (void)makeAvailableWithRemoteInterface:(id)a3 completionHandler:(id)a4;
@end

@implementation WFInstapaperAccessResource

+ (id)userInterfaceClasses
{
  v6[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F33B28];
  v5[0] = *MEMORY[0x263F33B40];
  v5[1] = v2;
  v6[0] = @"WFInstapaperAccessResourceUserInterface";
  v6[1] = @"WFInstapaperAccessResourceUserInterface";
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  return v3;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E21F8;
}

+ (void)setInstapaperTokenSecret:(id)a3
{
  id v7 = a3;
  v4 = [a1 instapaperToken];
  if (v4)
  {
    v5 = [v7 dataUsingEncoding:4];
    v6 = [a1 keychain];
    [v6 setData:v5 forKey:v4];
  }
}

+ (NSString)instapaperTokenSecret
{
  v3 = [a1 instapaperToken];
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

+ (id)keychain
{
  uint64_t v2 = [WFKeychain alloc];
  v3 = [(WFKeychain *)v2 initWithService:@"is.workflow.my.app.instapaper.%@tokenSecret" accessGroup:*MEMORY[0x263F33B50]];
  return v3;
}

+ (void)setInstapaperToken:(id)a3
{
  v3 = (void *)MEMORY[0x263EFFA40];
  id v4 = a3;
  id v5 = [v3 workflowUserDefaults];
  [v5 setObject:v4 forKey:@"WFInstapaperToken"];
}

+ (NSString)instapaperToken
{
  uint64_t v2 = [MEMORY[0x263EFFA40] workflowUserDefaults];
  v3 = [v2 objectForKey:@"WFInstapaperToken"];

  return (NSString *)v3;
}

+ (void)setInstapaperUsername:(id)a3
{
  v3 = (void *)MEMORY[0x263EFFA40];
  id v4 = a3;
  id v5 = [v3 workflowUserDefaults];
  [v5 setObject:v4 forKey:@"WFInstapaperUsername"];
}

+ (NSString)instapaperUsername
{
  uint64_t v2 = [MEMORY[0x263EFFA40] workflowUserDefaults];
  v3 = [v2 objectForKey:@"WFInstapaperUsername"];

  return (NSString *)v3;
}

+ (void)initialize
{
  if (initialize_onceToken_39698 != -1) {
    dispatch_once(&initialize_onceToken_39698, &__block_literal_global_39699);
  }
}

uint64_t __40__WFInstapaperAccessResource_initialize__block_invoke()
{
  return +[IKEngine setOAuthConsumerKey:@"682e860c444040369c400e6ebdc9ec50" andConsumerSecret:@"ad023926d2fd402c8186da34500e943b"];
}

- (void)logOut
{
  [(id)objc_opt_class() setInstapaperTokenSecret:0];
  [(id)objc_opt_class() setInstapaperUsername:0];
  [(id)objc_opt_class() setInstapaperToken:0];
  [(WFResource *)self refreshAvailabilityWithNotification];
}

- (BOOL)canLogOut
{
  return 1;
}

- (id)username
{
  uint64_t v2 = objc_opt_class();
  return (id)[v2 instapaperUsername];
}

- (id)resourceName
{
  return WFLocalizedString(@"Instapaper");
}

- (void)makeAvailableWithRemoteInterface:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __81__WFInstapaperAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke;
  v8[3] = &unk_264E5CD58;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 authorizeWithCompletionHandler:v8];
}

void __81__WFInstapaperAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 refreshAvailabilityWithForcedNotification];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (unint64_t)status
{
  uint64_t v2 = [(id)objc_opt_class() instapaperToken];
  if ([v2 length])
  {
    v3 = [(id)objc_opt_class() instapaperTokenSecret];
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
  unint64_t v4 = WFLocalizedStringResourceWithKey(@"your Instapaper account", @"your Instapaper account");
  id v5 = [v3 localize:v4];

  return v5;
}

- (id)associatedAppIdentifier
{
  return @"com.marcoarment.instapaperpro";
}

@end