@interface WFEvernoteAccessResource
+ (ENSession)evernoteSession;
+ (id)evernoteCallbackScheme;
+ (id)userInterfaceClasses;
+ (id)userInterfaceProtocol;
- (BOOL)canLogOut;
- (WFEvernoteAccessResource)initWithDefinition:(id)a3;
- (id)associatedAppIdentifier;
- (id)localizedProtectedResourceDescriptionWithContext:(id)a3;
- (id)resourceName;
- (id)username;
- (unint64_t)status;
- (void)dealloc;
- (void)logOut;
- (void)makeAvailableWithRemoteInterface:(id)a3 completionHandler:(id)a4;
@end

@implementation WFEvernoteAccessResource

- (void)logOut
{
  id v2 = [(id)objc_opt_class() evernoteSession];
  [v2 unauthenticate];
}

- (BOOL)canLogOut
{
  return 1;
}

- (id)username
{
  id v2 = [(id)objc_opt_class() evernoteSession];
  v3 = [v2 userDisplayName];

  return v3;
}

- (id)resourceName
{
  return @"Evernote";
}

- (void)makeAvailableWithRemoteInterface:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__WFEvernoteAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke;
  v8[3] = &unk_264E5CD58;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 authorizeWithCompletionHandler:v8];
}

void __79__WFEvernoteAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 refreshAvailabilityWithForcedNotification];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (unint64_t)status
{
  id v2 = [(id)objc_opt_class() evernoteSession];
  if ([v2 isAuthenticated]) {
    unint64_t v3 = 4;
  }
  else {
    unint64_t v3 = 1;
  }

  return v3;
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"your Evernote account", @"your Evernote account");
  id v5 = [v3 localize:v4];

  return v5;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"ENSessionDidUnauthenticateNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)WFEvernoteAccessResource;
  [(WFAccessResource *)&v4 dealloc];
}

- (WFEvernoteAccessResource)initWithDefinition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFEvernoteAccessResource;
  id v3 = [(WFAccessResource *)&v7 initWithDefinition:a3];
  if (v3)
  {
    objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v3 selector:sel_refreshAvailabilityWithNotification name:@"ENSessionDidUnauthenticateNotification" object:0];

    id v5 = v3;
  }

  return v3;
}

- (id)associatedAppIdentifier
{
  return @"com.evernote.iPhone.Evernote";
}

+ (id)userInterfaceClasses
{
  v6[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F33B28];
  v5[0] = *MEMORY[0x263F33B40];
  v5[1] = v2;
  v6[0] = @"WFEvernoteAccessResourceUserInterface";
  v6[1] = @"WFEvernoteAccessResourceUserInterface";
  id v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  return v3;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E19D0;
}

+ (id)evernoteCallbackScheme
{
  return (id)[NSString stringWithFormat:@"en-%@", @"team146"];
}

+ (ENSession)evernoteSession
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__WFEvernoteAccessResource_evernoteSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (evernoteSession_onceToken != -1) {
    dispatch_once(&evernoteSession_onceToken, block);
  }
  uint64_t v2 = (void *)evernoteSession_evernoteSession;
  return (ENSession *)v2;
}

void __43__WFEvernoteAccessResource_evernoteSession__block_invoke(uint64_t a1)
{
  +[ENSession setSharedSessionConsumerKey:@"team146" consumerSecret:@"893f90c98d2a27dd" optionalHost:0];
  uint64_t v2 = +[ENSession sharedSession];
  id v3 = (void *)evernoteSession_evernoteSession;
  evernoteSession_evernoteSession = v2;

  objc_super v4 = [MEMORY[0x263F86830] sharedManager];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__WFEvernoteAccessResource_evernoteSession__block_invoke_2;
  void v6[3] = &__block_descriptor_40_e23_v16__0___ICURLRequest_8l;
  id v7 = *(id *)(a1 + 32);
  id v5 = [v7 evernoteCallbackScheme];
  [v4 registerHandler:v6 forIncomingRequestsWithAction:0 scheme:v5];
}

void __43__WFEvernoteAccessResource_evernoteSession__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 evernoteSession];
  objc_super v4 = [v3 URL];

  [v5 handleOpenURL:v4];
}

@end