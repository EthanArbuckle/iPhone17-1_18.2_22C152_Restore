@interface WFSilenceUnknownCallersSettingsClient
+ (void)createClientWithCompletionHandler:(id)a3;
- (void)getStateWithCompletionHandler:(id)a3;
- (void)setState:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation WFSilenceUnknownCallersSettingsClient

+ (void)createClientWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, id, void))a3;
  id v5 = objc_alloc_init((Class)a1);
  v4[2](v4, v5, 0);
}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v5 = (void (**)(id, void))a4;
  id v6 = objc_alloc(MEMORY[0x263EFFA40]);
  v7 = getTUBundleIdentifierTelephonyUtilitiesFramework();
  v8 = (void *)[v6 initWithSuiteName:v7];
  v9 = getTUCallFilteringPreferencesContactsOnlyKey();
  [v8 setBool:v4 forKey:v9];

  v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 postNotificationName:@"SilenceCallsSettingsChangedNotification" object:0];

  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v11 = (void *)getNPSManagerClass_softClass;
  uint64_t v22 = getNPSManagerClass_softClass;
  if (!getNPSManagerClass_softClass)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __getNPSManagerClass_block_invoke;
    v18[3] = &unk_264E5EC88;
    v18[4] = &v19;
    __getNPSManagerClass_block_invoke((uint64_t)v18);
    v11 = (void *)v20[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v19, 8);
  v13 = objc_opt_new();
  v14 = getTUBundleIdentifierTelephonyUtilitiesFramework();
  v15 = (void *)MEMORY[0x263EFFA08];
  v16 = getTUCallFilteringPreferencesContactsOnlyKey();
  v17 = [v15 setWithObject:v16];
  [v13 synchronizeUserDefaultsDomain:v14 keys:v17];

  v5[2](v5, 0);
}

- (void)getStateWithCompletionHandler:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263EFFA40];
  v9 = (void (**)(id, uint64_t, void))a3;
  id v4 = [v3 alloc];
  id v5 = getTUBundleIdentifierTelephonyUtilitiesFramework();
  id v6 = (void *)[v4 initWithSuiteName:v5];
  v7 = getTUCallFilteringPreferencesContactsOnlyKey();
  uint64_t v8 = [v6 BOOLForKey:v7];

  v9[2](v9, v8, 0);
}

@end