@interface PSAccessoriesListController
- (BOOL)shouldReloadSpecifiersOnResume;
- (id)specifierForDevice:(id)a3;
- (id)specifiers;
- (void)handleSessionEvent:(id)a3;
- (void)refreshDADevices;
- (void)viewDidLoad;
@end

@implementation PSAccessoriesListController

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)PSAccessoriesListController;
  [(PSAccessoriesListController *)&v13 viewDidLoad];
  v3 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) propertyForKey:@"bundleID"];
  appBundleID = self->_appBundleID;
  self->_appBundleID = v3;

  if (!self->_appSession)
  {
    v5 = (DASession *)objc_alloc_init(MEMORY[0x263F397C0]);
    appSession = self->_appSession;
    self->_appSession = v5;

    objc_initWeak(&location, self);
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    v9 = __42__PSAccessoriesListController_viewDidLoad__block_invoke;
    v10 = &unk_265231228;
    objc_copyWeak(&v11, &location);
    [(DASession *)self->_appSession setEventHandler:&v7];
    [(DASession *)self->_appSession activate];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __42__PSAccessoriesListController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleSessionEvent:v3];
}

- (id)specifierForDevice:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F5FC40];
  v6 = [v4 name];
  uint64_t v7 = [v5 preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:NSClassFromString(&cfstr_Asaccessoryinf.isa) cell:2 edit:0];

  uint64_t v8 = [v4 identifier];
  [v7 setIdentifier:v8];

  v9 = [v4 bluetoothOTAName];
  if (v9)
  {
    [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x263F602C8]];
  }
  else
  {
    v10 = [v4 SSID];
    [v7 setObject:v10 forKeyedSubscript:*MEMORY[0x263F602C8]];
  }
  [v7 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  [v7 setProperty:v4 forKey:@"device"];
  [v7 setProperty:self->_appSession forKey:@"session"];

  return v7;
}

- (id)specifiers
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"ACCESSORIES_GROUP"];
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"The accessories listed are paired with apps on your device." value:&stru_26FC1C568 table:0];
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x263F600F8]];

    v11[0] = v5;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v8;

    id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (void)handleSessionEvent:(id)a3
{
  unint64_t v4 = [a3 eventType];
  if (v4 <= 0x2A && ((1 << v4) & 0x60000000400) != 0)
  {
    [(PSAccessoriesListController *)self refreshDADevices];
  }
}

- (void)refreshDADevices
{
  appSession = self->_appSession;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__PSAccessoriesListController_refreshDADevices__block_invoke;
  v3[3] = &unk_265231028;
  v3[4] = self;
  [(DASession *)appSession getDevicesWithFlags:8 completionHandler:v3];
}

void __47__PSAccessoriesListController_refreshDADevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__PSAccessoriesListController_refreshDADevices__block_invoke_2;
  block[3] = &unk_2652311D8;
  id v10 = v6;
  id v11 = v5;
  uint64_t v12 = *(void *)(a1 + 32);
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __47__PSAccessoriesListController_refreshDADevices__block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = _AULoggingFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v3;
      _os_log_impl(&dword_247E6E000, v2, OS_LOG_TYPE_DEFAULT, "Error while trying to fetch accessories: %@", buf, 0xCu);
    }
  }
  v17 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v10 = [v9 appAccessInfoMap];
        id v11 = [v10 allKeys];
        int v12 = [v11 containsObject:*(void *)(*(void *)(a1 + 48) + 1384)];

        if (v12)
        {
          objc_super v13 = [*(id *)(a1 + 48) specifierForDevice:v9];
          [v17 addObject:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  [v17 sortUsingComparator:&__block_literal_global_0];
  [*(id *)(a1 + 48) removeContiguousSpecifiers:*(void *)(*(void *)(a1 + 48) + 1400)];
  uint64_t v14 = [v17 copy];
  uint64_t v15 = *(void *)(a1 + 48);
  v16 = *(void **)(v15 + 1400);
  *(void *)(v15 + 1400) = v14;

  [*(id *)(a1 + 48) insertContiguousSpecifiers:*(void *)(*(void *)(a1 + 48) + 1400) afterSpecifierID:@"ACCESSORIES_GROUP"];
}

uint64_t __47__PSAccessoriesListController_refreshDADevices__block_invoke_62(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 name];
  uint64_t v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySpecifiers, 0);
  objc_storeStrong((id *)&self->_appSession, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
}

@end