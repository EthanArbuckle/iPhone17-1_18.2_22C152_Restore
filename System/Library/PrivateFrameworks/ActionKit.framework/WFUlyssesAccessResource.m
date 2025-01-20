@interface WFUlyssesAccessResource
+ (BOOL)refreshesAvailabilityOnApplicationResume;
- (ICScheme)scheme;
- (WFUlyssesAccessResource)initWithDefinition:(id)a3;
- (id)associatedAppIdentifier;
- (id)localizedProtectedResourceDescriptionWithContext:(id)a3;
- (unint64_t)status;
- (void)dealloc;
- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4;
@end

@implementation WFUlyssesAccessResource

- (void).cxx_destruct
{
}

- (ICScheme)scheme
{
  return self->_scheme;
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  v24[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  v8 = [MEMORY[0x263F33718] sharedContext];
  v9 = [v8 provider];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v11 = [MEMORY[0x263F087E8] wfUnsupportedUserInterfaceError];
    v7[2](v7, 0, v11);
  }
  else
  {
    v11 = [(WFUlyssesAccessResource *)self scheme];
    v12 = objc_opt_new();
    v13 = [v11 scheme];
    [v12 setScheme:v13];

    [v12 setHost:@"x-callback-url"];
    [v12 setPath:@"/authorize"];
    v14 = [MEMORY[0x263F08BD0] queryItemWithName:@"appname" value:@"Shortcuts"];
    v24[0] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    [v12 setQueryItems:v15];

    v16 = (void *)MEMORY[0x263F87080];
    v17 = [v12 URL];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __76__WFUlyssesAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
    v22[3] = &unk_264E57828;
    v22[4] = self;
    v23 = v7;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __76__WFUlyssesAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2;
    v20[3] = &unk_264E5CA00;
    v21 = v23;
    v18 = [v16 requestWithURL:v17 scheme:v11 userInterface:v6 bundleIdentifier:@"com.ulyssesapp.ios" successHandler:v22 failureHandler:v20];

    v19 = [MEMORY[0x263F86830] sharedManager];
    [v19 performRequest:v18];
  }
}

void __76__WFUlyssesAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 objectForKeyedSubscript:@"access-token"];
  if (v4)
  {
    v3 = [MEMORY[0x263EFFA40] workflowUserDefaults];
    [v3 setObject:v4 forKey:@"WFUlyssesAccessToken"];

    [*(id *)(a1 + 32) refreshAvailabilityWithNotification];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __76__WFUlyssesAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 code] == 4)
  {

    id v3 = 0;
  }
  else
  {
    id v3 = v4;
  }
  id v5 = v3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)status
{
  v2 = [MEMORY[0x263EFFA40] workflowUserDefaults];
  id v3 = [v2 stringForKey:@"WFUlyssesAccessToken"];

  if ([v3 length]) {
    unint64_t v4 = 4;
  }
  else {
    unint64_t v4 = 1;
  }

  return v4;
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  id v3 = a3;
  unint64_t v4 = WFLocalizedStringResourceWithKey(@"your Ulysses library", @"your Ulysses library");
  id v5 = [v3 localize:v4];

  return v5;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"WFUlyssesAccessResourceAvailabilityChangedNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)WFUlyssesAccessResource;
  [(WFAccessResource *)&v4 dealloc];
}

- (WFUlyssesAccessResource)initWithDefinition:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)WFUlyssesAccessResource;
  id v5 = [(WFAccessResource *)&v27 initWithDefinition:v4];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F87250]];
    uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F87248]];
    v8 = [MEMORY[0x263F86828] sharedRegistry];
    v22 = (void *)v7;
    v9 = [v8 appWithIdentifier:v7];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v21 = v9;
    v10 = [v9 schemes];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v16 = [v15 scheme];
          int v17 = [v16 isEqualToString:v6];

          if (v17)
          {
            objc_storeStrong((id *)&v5->_scheme, v15);
            goto LABEL_12;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 addObserver:v5 selector:sel_refreshAvailabilityWithNotification name:@"WFUlyssesAccessResourceAvailabilityChangedNotification" object:0];

    v19 = v5;
  }

  return v5;
}

- (id)associatedAppIdentifier
{
  return @"com.soulmen.ulysses.pad";
}

+ (BOOL)refreshesAvailabilityOnApplicationResume
{
  return 0;
}

@end