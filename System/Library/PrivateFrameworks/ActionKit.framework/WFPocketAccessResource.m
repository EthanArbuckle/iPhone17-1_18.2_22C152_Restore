@interface WFPocketAccessResource
- (BOOL)canLogOut;
- (PocketAPI)pocket;
- (id)associatedAppIdentifier;
- (id)localizedProtectedResourceDescriptionWithContext:(id)a3;
- (id)loginHandler;
- (id)pocketCallbackScheme;
- (id)resourceName;
- (id)username;
- (unint64_t)status;
- (void)logOut;
- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4;
- (void)pocketAPI:(id)a3 hadLoginError:(id)a4;
- (void)pocketAPI:(id)a3 requestedOpenURL:(id)a4 completionHandler:(id)a5;
- (void)pocketAPILoggedIn:(id)a3;
- (void)refreshAvailabilityWithNotification:(BOOL)a3;
- (void)setLoginHandler:(id)a3;
- (void)setPocket:(id)a3;
@end

@implementation WFPocketAccessResource

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loginHandler, 0);
  objc_storeStrong((id *)&self->_pocket, 0);
}

- (void)setLoginHandler:(id)a3
{
}

- (id)loginHandler
{
  return self->_loginHandler;
}

- (void)setPocket:(id)a3
{
}

- (void)logOut
{
  v3 = [(WFPocketAccessResource *)self pocket];
  [v3 logout];

  [(WFResource *)self refreshAvailabilityWithForcedNotification];
}

- (BOOL)canLogOut
{
  return 1;
}

- (id)username
{
  v2 = [(WFPocketAccessResource *)self pocket];
  v3 = [v2 username];

  return v3;
}

- (id)resourceName
{
  return @"Pocket";
}

- (void)pocketAPI:(id)a3 requestedOpenURL:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v7 = (void *)MEMORY[0x263F33718];
  id v8 = a4;
  v9 = [v7 sharedContext];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__WFPocketAccessResource_pocketAPI_requestedOpenURL_completionHandler___block_invoke;
  v11[3] = &unk_264E59738;
  id v12 = v6;
  id v10 = v6;
  [v9 openURL:v8 completionHandler:v11];
}

uint64_t __71__WFPocketAccessResource_pocketAPI_requestedOpenURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pocketAPI:(id)a3 hadLoginError:(id)a4
{
  id v8 = a4;
  v5 = [(WFPocketAccessResource *)self loginHandler];

  if (v5)
  {
    id v6 = [(WFPocketAccessResource *)self loginHandler];
    if ([v8 code] == 158) {
      id v7 = 0;
    }
    else {
      id v7 = v8;
    }
    ((void (**)(void, void, id))v6)[2](v6, 0, v7);

    [(WFPocketAccessResource *)self setLoginHandler:0];
    [(WFResource *)self refreshAvailabilityWithForcedNotification];
  }
}

- (void)pocketAPILoggedIn:(id)a3
{
  v4 = [(WFPocketAccessResource *)self loginHandler];

  if (v4)
  {
    v5 = [(WFPocketAccessResource *)self loginHandler];
    v5[2](v5, 1, 0);

    [(WFPocketAccessResource *)self setLoginHandler:0];
    [(WFResource *)self refreshAvailabilityWithForcedNotification];
  }
}

- (void)refreshAvailabilityWithNotification:(BOOL)a3
{
  if (a3)
  {
    v3.receiver = self;
    v3.super_class = (Class)WFPocketAccessResource;
    [(WFAccessResource *)&v3 refreshAvailabilityWithNotification:1];
  }
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  v11 = (void (**)(id, void, void *))a4;
  id v6 = [a3 userInterfaceType];
  int v7 = [v6 isEqualToString:*MEMORY[0x263F33B48]];

  if (v7
    || ([MEMORY[0x263F33718] sharedContext],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 applicationOrNil],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        !v9))
  {
    id v10 = [MEMORY[0x263F087E8] wfUnsupportedUserInterfaceError];
    v11[2](v11, 0, v10);
  }
  else
  {
    [(WFPocketAccessResource *)self setLoginHandler:v11];
    id v10 = [(WFPocketAccessResource *)self pocket];
    [v10 loginWithDelegate:self];
  }
}

- (unint64_t)status
{
  v2 = [(WFPocketAccessResource *)self pocket];
  if ([v2 isLoggedIn]) {
    unint64_t v3 = 4;
  }
  else {
    unint64_t v3 = 1;
  }

  return v3;
}

- (id)pocketCallbackScheme
{
  v2 = NSString;
  unint64_t v3 = [@"36486-fbcaffd4ccb4dcdcce449a20" componentsSeparatedByString:@"-"];
  v4 = [v3 firstObject];
  v5 = [v2 stringWithFormat:@"pocketapp%@", v4];

  return v5;
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"your Pocket account", @"your Pocket account");
  v5 = [v3 localize:v4];

  return v5;
}

- (id)associatedAppIdentifier
{
  return @"com.ideashower.ReadItLaterPro";
}

- (PocketAPI)pocket
{
  pocket = self->_pocket;
  if (!pocket)
  {
    v4 = +[PocketAPI sharedAPI];
    [v4 setConsumerKey:@"36486-fbcaffd4ccb4dcdcce449a20"];

    v5 = +[PocketAPI sharedAPI];
    id v6 = self->_pocket;
    self->_pocket = v5;

    int v7 = [MEMORY[0x263F86830] sharedManager];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __32__WFPocketAccessResource_pocket__block_invoke;
    v10[3] = &unk_264E55F48;
    v10[4] = self;
    id v8 = [(WFPocketAccessResource *)self pocketCallbackScheme];
    [v7 registerHandler:v10 forIncomingRequestsWithAction:0 scheme:v8];

    pocket = self->_pocket;
  }
  return pocket;
}

void __32__WFPocketAccessResource_pocket__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 pocket];
  v4 = [v3 URL];

  [v5 handleOpenURL:v4];
}

@end