@interface WFPinboardAccessResource
+ (id)pinboardPassword;
+ (id)pinboardToken;
+ (id)pinboardUsername;
+ (id)userInterfaceClasses;
+ (id)userInterfaceProtocol;
- (BOOL)canLogOut;
- (id)icon;
- (id)localizedProtectedResourceDescriptionWithContext:(id)a3;
- (id)name;
- (id)resourceName;
- (id)username;
- (unint64_t)status;
- (void)logOut;
- (void)makeAvailableWithRemoteInterface:(id)a3 completionHandler:(id)a4;
@end

@implementation WFPinboardAccessResource

+ (id)userInterfaceClasses
{
  v6[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F33B28];
  v5[0] = *MEMORY[0x263F33B40];
  v5[1] = v2;
  v6[0] = @"WFPinboardAccessResourceUserInterface";
  v6[1] = @"WFPinboardAccessResourceUserInterface";
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  return v3;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E1910;
}

+ (id)pinboardToken
{
  uint64_t v2 = [a1 pinboardUsername];
  v3 = v2;
  if (v2)
  {
    v4 = WFPinboardGetSecretForUsername(v2, @"token");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)pinboardPassword
{
  uint64_t v2 = [a1 pinboardUsername];
  v3 = v2;
  if (v2)
  {
    v4 = WFPinboardGetSecretForUsername(v2, @"password");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)pinboardUsername
{
  uint64_t v2 = [MEMORY[0x263EFFA40] workflowUserDefaults];
  v3 = [v2 objectForKey:@"WFPinboardUsername"];

  return v3;
}

- (void)logOut
{
  id v4 = [(WFPinboardAccessResource *)self username];
  v3 = [MEMORY[0x263EFFA40] workflowUserDefaults];
  [v3 removeObjectForKey:@"WFPinboardUsername"];

  WFPinboardStoreSecretForUsername(v4, 0, @"password");
  WFPinboardStoreSecretForUsername(v4, 0, @"token");
  [(WFResource *)self refreshAvailabilityWithNotification];
}

- (BOOL)canLogOut
{
  return 1;
}

- (id)username
{
  uint64_t v2 = objc_opt_class();
  return (id)[v2 pinboardUsername];
}

- (id)resourceName
{
  return @"Pinboard";
}

- (void)makeAvailableWithRemoteInterface:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__WFPinboardAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke;
  v8[3] = &unk_264E5CD58;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 authorizeWithCompletionHandler:v8];
}

void __79__WFPinboardAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 refreshAvailabilityWithForcedNotification];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (unint64_t)status
{
  v3 = [(id)objc_opt_class() pinboardUsername];
  uint64_t v4 = [v3 length];
  if (v4)
  {
    uint64_t v2 = [(id)objc_opt_class() pinboardPassword];
    if ([v2 length])
    {
      unint64_t v5 = 4;
LABEL_8:

      goto LABEL_9;
    }
  }
  id v6 = [(id)objc_opt_class() pinboardToken];
  if ([v6 length]) {
    unint64_t v5 = 4;
  }
  else {
    unint64_t v5 = 1;
  }

  if (v4) {
    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = WFLocalizedStringResourceWithKey(@"your Pinboard account", @"your Pinboard account");
  unint64_t v5 = [v3 localize:v4];

  return v5;
}

- (id)icon
{
  return (id)[MEMORY[0x263F85308] workflowKitImageNamed:@"Pinboard"];
}

- (id)name
{
  return WFLocalizedString(@"Pinboard");
}

@end