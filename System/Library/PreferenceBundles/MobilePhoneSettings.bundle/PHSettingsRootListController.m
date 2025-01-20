@interface PHSettingsRootListController
- (BOOL)shouldShowSpecifier:(id)a3;
- (BOOL)showVoicemailPassword;
- (NSOrderedSet)subscriptions;
- (OS_dispatch_queue)queue;
- (PHSettingsRootListController)init;
- (TPSTelephonyController)telephonyController;
- (VMVoicemailManager)voicemailManager;
- (id)specifiers;
- (void)changeVoicemailPassword:(id)a3;
- (void)emitNavigationEvent;
- (void)setSubscriptions:(id)a3;
- (void)systemSettingsSpecifiersProvider:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5;
- (void)systemSettingsSpecifiersProviderDidReloadSpecifiers:(id)a3;
- (void)telephonyController:(id)a3 didChangeSubscriptions:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PHSettingsRootListController

- (id)specifiers
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v6 = objc_alloc(MEMORY[0x263F25600]);
    v7 = (void *)[v6 initWithApplicationBundleIdentifier:*MEMORY[0x263F7E2C8]];
    v8 = [v7 specifiers];
    if (v8) {
      [v5 addObjectsFromArray:v8];
    }
    [(PHSettingsRootListController *)v2 loadSpecifiersFromPlistName:@"Phone" target:v2];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if (-[PHSettingsRootListController shouldShowSpecifier:](v2, "shouldShowSpecifier:", v13, (void)v18)) {
            [v5 addObject:v13];
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    uint64_t v14 = [v5 copy];
    v15 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&v2->super.super.super.super.super.isa + v3) = (Class)v14;

    v4 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v3);
  }
  id v16 = v4;
  objc_sync_exit(v2);

  return v16;
}

- (BOOL)shouldShowSpecifier:(id)a3
{
  BOOL v4 = 1;
  char v14 = 1;
  id v5 = [a3 propertyForKey:@"shouldShowSelector"];
  if ([(NSString *)v5 length])
  {
    SEL v6 = NSSelectorFromString(v5);
    if (v6)
    {
      SEL v7 = v6;
      if (objc_opt_respondsToSelector())
      {
        v8 = self;
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = (void *)MEMORY[0x263EFF958];
          uint64_t v11 = [(PHSettingsRootListController *)v8 methodSignatureForSelector:v7];
          v12 = [v10 invocationWithMethodSignature:v11];

          [v12 setTarget:v9];
          [v12 setSelector:v7];
          [v12 invoke];
          [v12 getReturnValue:&v14];
        }
      }
      BOOL v4 = v14 != 0;
    }
  }

  return v4;
}

- (PHSettingsRootListController)init
{
  v17.receiver = self;
  v17.super_class = (Class)PHSettingsRootListController;
  v2 = [(PHSettingsRootListController *)&v17 init];
  if (v2)
  {
    id v3 = [NSString stringWithFormat:@"com.apple.calls.queue.%@.%p", objc_opt_class(), v2];
    BOOL v4 = (const char *)[v3 UTF8String];
    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = (TPSTelephonyController *)objc_alloc_init(MEMORY[0x263F7E168]);
    telephonyController = v2->_telephonyController;
    v2->_telephonyController = v8;

    uint64_t v10 = (VMVoicemailManager *)objc_alloc_init(MEMORY[0x263F84CE8]);
    voicemailManager = v2->_voicemailManager;
    v2->_voicemailManager = v10;

    objc_initWeak(&location, v2);
    v12 = v2->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__PHSettingsRootListController_init__block_invoke;
    block[3] = &unk_264832AA0;
    objc_copyWeak(&v15, &location);
    dispatch_async(v12, block);
    [(TPSTelephonyController *)v2->_telephonyController addDelegate:v2 queue:v2->_queue];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __36__PHSettingsRootListController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained telephonyController];
    id v3 = [v2 subscriptions];
    [v4 setSubscriptions:v3];

    id WeakRetained = v4;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PHSettingsRootListController;
  [(PHSettingsRootListController *)&v4 viewDidAppear:a3];
  [(PHSettingsRootListController *)self emitNavigationEvent];
}

- (void)emitNavigationEvent
{
  v16[1] = *MEMORY[0x263EF8340];
  id v3 = [NSString stringWithFormat:@"settings-navigation://com.apple.Settings.Apps/%@/", @"com.apple.mobilephone"];
  objc_super v4 = [NSURL URLWithString:v3];
  id v5 = objc_alloc(MEMORY[0x263F08DB0]);
  dispatch_queue_t v6 = [MEMORY[0x263EFF960] currentLocale];
  SEL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 bundleURL];
  id v9 = (void *)[v5 initWithKey:@"Phone" table:0 locale:v6 bundleURL:v8];

  id v10 = objc_alloc(MEMORY[0x263F08DB0]);
  uint64_t v11 = [MEMORY[0x263EFF960] currentLocale];
  v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v13 = [v12 bundleURL];
  char v14 = (void *)[v10 initWithKey:@"Apps" table:0 locale:v11 bundleURL:v13];

  v16[0] = v14;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  [(PHSettingsRootListController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.mobilephone" title:v9 localizedNavigationComponents:v15 deepLink:v4];
}

- (void)systemSettingsSpecifiersProviderDidReloadSpecifiers:(id)a3
{
  objc_super v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_227DC6000, v4, OS_LOG_TYPE_DEFAULT, "PHONE SETTINGS > DEFAULT APP: Calling systemSettingsSpecifiersProviderDidReloadSpecifiers", v5, 2u);
  }

  [(PHSettingsRootListController *)self reloadSpecifiers];
}

- (void)systemSettingsSpecifiersProvider:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  v8 = PHDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_227DC6000, v8, OS_LOG_TYPE_DEFAULT, "PHONE SETTINGS > DEFAULT APP: Calling systemSettingsSpecifiersProvider presentViewController", v9, 2u);
  }

  [(PHSettingsRootListController *)self presentViewController:v7 animated:v5 completion:0];
}

- (void)changeVoicemailPassword:(id)a3
{
  objc_super v4 = [VMPasscodeChangeViewController alloc];
  BOOL v5 = [(PHSettingsRootListController *)self voicemailManager];
  dispatch_queue_t v6 = [(VMNavigationController *)v4 initWithManager:v5];

  [(PHSettingsRootListController *)self presentViewController:v6 animated:1 completion:0];
}

- (BOOL)showVoicemailPassword
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [(PHSettingsRootListController *)self voicemailManager];
  objc_super v4 = [v3 accounts];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "isProvisioned", (void)v16))
        {
          uint64_t v11 = [(PHSettingsRootListController *)self voicemailManager];
          v12 = [v10 UUID];
          char v13 = [v11 isPasscodeChangeSupportedForAccountUUID:v12];

          if (v13)
          {
            BOOL v14 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_12:

  return v14;
}

- (void)telephonyController:(id)a3 didChangeSubscriptions:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(PHSettingsRootListController *)self subscriptions];
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_227DC6000, v6, OS_LOG_TYPE_DEFAULT, "Changing telephony subscriptions from\n %@ to\n %@.", buf, 0x16u);
  }
  [(PHSettingsRootListController *)self setSubscriptions:v5];
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__PHSettingsRootListController_telephonyController_didChangeSubscriptions___block_invoke;
  block[3] = &unk_264832AA0;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __75__PHSettingsRootListController_telephonyController_didChangeSubscriptions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained popRecursivelyToRootController];
    id WeakRetained = v2;
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSOrderedSet)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
}

- (TPSTelephonyController)telephonyController
{
  return self->_telephonyController;
}

- (VMVoicemailManager)voicemailManager
{
  return self->_voicemailManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voicemailManager, 0);
  objc_storeStrong((id *)&self->_telephonyController, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end