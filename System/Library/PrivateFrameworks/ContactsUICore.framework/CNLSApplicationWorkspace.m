@interface CNLSApplicationWorkspace
+ (id)inProcessLaunchServices;
+ (id)launchServices;
+ (id)remoteAdapter;
- (CNLSApplicationWorkspace)init;
- (CNLSApplicationWorkspace)initWithSchedulerProvider:(id)a3;
- (CNSchedulerProvider)schedulerProvider;
- (id)applicationForBundleIdentifier:(id)a3;
- (id)applicationsAvailableForDefaultAppCategory:(unint64_t)a3;
- (id)applicationsAvailableForHandlingURLScheme:(id)a3;
- (id)applicationsForUserActivityType:(id)a3;
- (id)defaultApplicationForDefaultAppCategory:(unint64_t)a3;
- (id)observableForApplicationsChangedWithSchedulerProvider:(id)a3;
- (void)openSensitiveURLInBackground:(id)a3 withOptions:(id)a4;
- (void)openSensitiveURLInBackground:(id)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (void)openUserActivity:(id)a3 inApplication:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)setSchedulerProvider:(id)a3;
@end

@implementation CNLSApplicationWorkspace

- (CNLSApplicationWorkspace)init
{
  v3 = [MEMORY[0x263F33668] defaultProvider];
  v4 = [(CNLSApplicationWorkspace *)self initWithSchedulerProvider:v3];

  return v4;
}

- (CNLSApplicationWorkspace)initWithSchedulerProvider:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNLSApplicationWorkspace;
  v6 = [(CNLSApplicationWorkspace *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_schedulerProvider, a3);
    v8 = v7;
  }

  return v7;
}

+ (id)launchServices
{
  if (_CFMZEnabled())
  {
    v3 = [a1 inProcessLaunchServices];
  }
  else
  {
    v4 = [MEMORY[0x263F335C8] currentEnvironment];
    id v5 = [v4 entitlementVerifier];
    uint64_t v6 = *MEMORY[0x263F334A8];
    id v12 = 0;
    int v7 = [v5 currentProcessHasBooleanEntitlement:v6 error:&v12];
    id v8 = v12;

    if (v7)
    {
      id v9 = [a1 inProcessLaunchServices];
    }
    else
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __42__CNLSApplicationWorkspace_launchServices__block_invoke;
      v11[3] = &__block_descriptor_40_e5_v8__0l;
      v11[4] = a1;
      if (launchServices_cn_once_token_1 != -1) {
        dispatch_once(&launchServices_cn_once_token_1, v11);
      }
      id v9 = (id)launchServices_cn_once_object_1;
    }
    v3 = v9;
  }
  return v3;
}

void __42__CNLSApplicationWorkspace_launchServices__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F335F0]);
  id v5 = [*(id *)(a1 + 32) remoteAdapter];
  uint64_t v3 = [v2 initWithAdapter:v5];
  v4 = (void *)launchServices_cn_once_object_1;
  launchServices_cn_once_object_1 = v3;
}

+ (id)inProcessLaunchServices
{
  if (inProcessLaunchServices_cn_once_token_2 != -1) {
    dispatch_once(&inProcessLaunchServices_cn_once_token_2, &__block_literal_global_52);
  }
  id v2 = (void *)inProcessLaunchServices_cn_once_object_2;
  return v2;
}

uint64_t __51__CNLSApplicationWorkspace_inProcessLaunchServices__block_invoke()
{
  inProcessLaunchServices_cn_once_object_2 = (uint64_t)objc_alloc_init(MEMORY[0x263F335F0]);
  return MEMORY[0x270F9A758]();
}

+ (id)remoteAdapter
{
  if (remoteAdapter_cn_once_token_3 != -1) {
    dispatch_once(&remoteAdapter_cn_once_token_3, &__block_literal_global_8_0);
  }
  id v2 = (void *)remoteAdapter_cn_once_object_3;
  return v2;
}

uint64_t __41__CNLSApplicationWorkspace_remoteAdapter__block_invoke()
{
  remoteAdapter_cn_once_object_3 = (uint64_t)objc_alloc_init(MEMORY[0x263EFEAD8]);
  return MEMORY[0x270F9A758]();
}

- (id)observableForApplicationsChangedWithSchedulerProvider:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F33608];
  v4 = (void *)MEMORY[0x263F087C8];
  id v5 = a3;
  uint64_t v6 = [v4 defaultCenter];
  int v7 = [v3 observableOnNotificationCenter:v6 withName:@"com.apple.LaunchServices.applicationRegistered" object:0];
  v14[0] = v7;
  id v8 = (void *)MEMORY[0x263F33608];
  id v9 = [MEMORY[0x263F087C8] defaultCenter];
  objc_super v10 = [v8 observableOnNotificationCenter:v9 withName:@"com.apple.LaunchServices.applicationUnregistered" object:0];
  v14[1] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  id v12 = [v3 merge:v11 schedulerProvider:v5];

  return v12;
}

- (void)openUserActivity:(id)a3 inApplication:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __85__CNLSApplicationWorkspace_openUserActivity_inApplication_options_completionHandler___block_invoke;
  void v14[3] = &unk_264018DA0;
  v14[4] = self;
  id v15 = v10;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [a3 _createUserActivityDataWithOptions:a5 completionHandler:v14];
}

void __85__CNLSApplicationWorkspace_openUserActivity_inApplication_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class() inProcessLaunchServices];
  [v4 openUserActivityData:v3 inApplication:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)openSensitiveURLInBackground:(id)a3 withOptions:(id)a4
{
}

- (void)openSensitiveURLInBackground:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CNLSApplicationWorkspace *)self schedulerProvider];
  id v12 = [v11 backgroundScheduler];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __87__CNLSApplicationWorkspace_openSensitiveURLInBackground_withOptions_completionHandler___block_invoke;
  v16[3] = &unk_264018130;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [v12 performBlock:v16];
}

void __87__CNLSApplicationWorkspace_openSensitiveURLInBackground_withOptions_completionHandler___block_invoke(void *a1)
{
  id v2 = [(id)objc_opt_class() inProcessLaunchServices];
  [v2 openSensitiveURLInBackground:a1[5] withOptions:a1[6] completionHandler:a1[7]];
}

- (id)applicationsAvailableForHandlingURLScheme:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() launchServices];
  id v5 = [v4 applicationsAvailableForHandlingURLScheme:v3];

  return v5;
}

- (id)applicationsForUserActivityType:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() launchServices];
  id v5 = [v4 applicationsForUserActivityType:v3];

  return v5;
}

- (id)applicationsAvailableForDefaultAppCategory:(unint64_t)a3
{
  id v4 = [(id)objc_opt_class() launchServices];
  id v5 = [v4 applicationsAvailableForDefaultAppCategory:a3];

  return v5;
}

- (id)defaultApplicationForDefaultAppCategory:(unint64_t)a3
{
  id v4 = [(id)objc_opt_class() launchServices];
  id v5 = [v4 defaultApplicationForDefaultAppCategory:a3];

  return v5;
}

- (id)applicationForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() launchServices];
  id v5 = [v4 applicationForBundleIdentifier:v3];

  return v5;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void)setSchedulerProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end