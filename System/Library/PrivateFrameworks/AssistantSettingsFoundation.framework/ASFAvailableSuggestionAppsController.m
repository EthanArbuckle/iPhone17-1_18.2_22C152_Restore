@interface ASFAvailableSuggestionAppsController
+ (id)sharedController;
- (ASFAvailableSuggestionAppsController)init;
- (ASFAvailableSuggestionAppsController)initWithApplicationSupplier:(id)a3;
- (id)_allVisibleAppBundleIds;
- (id)visibleApps;
- (id)visibleBundleIds;
- (void)_allVisibleAppBundleIds;
@end

@implementation ASFAvailableSuggestionAppsController

+ (id)sharedController
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "+[ASFAvailableSuggestionAppsController sharedController]";
    _os_log_impl(&dword_2487B3000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__ASFAvailableSuggestionAppsController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, block);
  }
  v4 = (void *)sharedController_sharedController;

  return v4;
}

uint64_t __56__ASFAvailableSuggestionAppsController_sharedController__block_invoke(uint64_t a1)
{
  sharedController_sharedController = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (ASFAvailableSuggestionAppsController)init
{
  v3 = objc_alloc_init(ASFApplicationSupplier);
  v4 = [(ASFAvailableSuggestionAppsController *)self initWithApplicationSupplier:v3];

  return v4;
}

- (ASFAvailableSuggestionAppsController)initWithApplicationSupplier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASFAvailableSuggestionAppsController;
  v6 = [(ASFAvailableSuggestionAppsController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_applicationSupplier, a3);
  }

  return v7;
}

- (id)visibleApps
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [(ASFAvailableSuggestionAppsController *)self visibleBundleIds];
  v4 = [MEMORY[0x263EFF9C0] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = -[ASFApplicationSupplier applicationForBundleId:](self->_applicationSupplier, "applicationForBundleId:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)visibleBundleIds
{
  v2 = [(ASFAvailableSuggestionAppsController *)self _allVisibleAppBundleIds];
  v3 = (void *)[v2 mutableCopy];
  [v3 addObject:@"com.apple.iCloudDriveApp"];

  return v3;
}

- (id)_allVisibleAppBundleIds
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v2 = (uint64_t (*)(void))getSBSCopyDisplayIdentifiersSymbolLoc_ptr;
  objc_super v9 = getSBSCopyDisplayIdentifiersSymbolLoc_ptr;
  if (!getSBSCopyDisplayIdentifiersSymbolLoc_ptr)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke;
    v5[3] = &unk_26523E468;
    v5[4] = &v6;
    __getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke((uint64_t)v5);
    v2 = (uint64_t (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2) {
    -[ASFAvailableSuggestionAppsController _allVisibleAppBundleIds]();
  }
  v3 = (void *)v2();

  return v3;
}

- (void).cxx_destruct
{
}

- (void)_allVisibleAppBundleIds
{
  dlerror();
  uint64_t v0 = abort_report_np();
  __getPETEventPropertyClass_block_invoke_cold_1(v0);
}

@end