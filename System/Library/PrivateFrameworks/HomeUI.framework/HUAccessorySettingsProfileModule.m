@interface HUAccessorySettingsProfileModule
- (HFAccessorySettingGroupItem)settingGroupItem;
- (HFAccessorySettingManagedConfigurationAdapter)adapter;
- (HUAccessorySettingsProfileItemProvider)profileItemProvider;
- (HUAccessorySettingsProfileModule)initWithItemUpdater:(id)a3 settingGroupItem:(id)a4;
- (HUAccessorySettingsProfileModuleDelegate)delegate;
- (id)_actuallyRemoveProfileItem:(id)a3;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (id)promptForRemoveProfileItem:(id)a3;
- (void)managedConfigurationAdapterSettingsWereUpdated:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HUAccessorySettingsProfileModule

- (HUAccessorySettingsProfileModule)initWithItemUpdater:(id)a3 settingGroupItem:(id)a4
{
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HUAccessorySettingsProfileModule;
  v8 = [(HFItemModule *)&v20 initWithItemUpdater:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_settingGroupItem, a4);
    v10 = [v7 homeKitSettingsVendor];
    v11 = objc_msgSend(v10, "hf_settingsAdapterManager");
    uint64_t v12 = [v11 adapterForIdentifier:*MEMORY[0x1E4F67FB0]];
    adapter = v9->_adapter;
    v9->_adapter = (HFAccessorySettingManagedConfigurationAdapter *)v12;

    v14 = [HUAccessorySettingsProfileItemProvider alloc];
    v15 = v9->_adapter;
    v16 = [v7 settingGroup];
    uint64_t v17 = [(HUAccessorySettingsProfileItemProvider *)v14 initWithAdapter:v15 settingGroup:v16];
    profileItemProvider = v9->_profileItemProvider;
    v9->_profileItemProvider = (HUAccessorySettingsProfileItemProvider *)v17;

    [(HFAccessorySettingManagedConfigurationAdapter *)v9->_adapter addProfileObserver:v9];
  }

  return v9;
}

- (id)itemProviders
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(HUAccessorySettingsProfileModule *)self profileItemProvider];
  v4 = [v2 setWithObject:v3];

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    v4 = [v3 allObjects];
    v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_123];

    v6 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"!!!ProfileZone!!!!"];
    id v7 = _HULocalizedStringWithDefaultValue(@"HUMobileDeviceManagement", @"HUMobileDeviceManagement", 1);
    [v6 setHeaderTitle:v7];

    v8 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"ManagedZone"];
    v9 = _HULocalizedStringWithDefaultValue(@"HUConfigurationProfile", @"HUConfigurationProfile", 1);
    [v8 setHeaderTitle:v9];

    uint64_t v10 = objc_opt_class();
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __68__HUAccessorySettingsProfileModule_buildSectionsWithDisplayedItems___block_invoke_3;
    v24[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
    v24[4] = v10;
    v11 = objc_msgSend(v5, "na_filter:", v24);
    [v8 setItems:v11];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __68__HUAccessorySettingsProfileModule_buildSectionsWithDisplayedItems___block_invoke_4;
    v23[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
    v23[4] = v10;
    uint64_t v12 = objc_msgSend(v5, "na_filter:", v23);
    [v6 setItems:v12];

    v13 = [v6 items];
    uint64_t v14 = [v13 count];

    v15 = [v8 items];
    uint64_t v16 = [v15 count];
    uint64_t v17 = v16;
    if (v14)
    {
      if (v16)
      {
        v27[0] = v6;
        v27[1] = v8;
        v18 = (void *)MEMORY[0x1E4F1C978];
        v19 = (void **)v27;
        uint64_t v20 = 2;
      }
      else
      {
        v26 = v6;
        v18 = (void *)MEMORY[0x1E4F1C978];
        v19 = &v26;
        uint64_t v20 = 1;
      }
      v21 = [v18 arrayWithObjects:v19 count:v20];
    }
    else
    {

      if (v17)
      {
        v25 = v8;
        v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      }
      else
      {
        v21 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v21;
}

uint64_t __68__HUAccessorySettingsProfileModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 latestResults];
  uint64_t v6 = *MEMORY[0x1E4F68AB8];
  id v7 = [v5 objectForKey:*MEMORY[0x1E4F68AB8]];

  v8 = [v4 latestResults];

  v9 = [v8 objectForKey:v6];

  uint64_t v17 = MEMORY[0x1E4F143A8];
  id v10 = v7;
  v18 = v10;
  id v11 = v9;
  uint64_t v12 = v11;
  id v19 = v11;
  if (v10) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = v11 != 0;
  }
  if (v10) {
    BOOL v14 = v11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    v15 = v11;
  }
  else
  {
    uint64_t v13 = objc_msgSend(v10, "compare:", v11, v17, 3221225472, __68__HUAccessorySettingsProfileModule_buildSectionsWithDisplayedItems___block_invoke_2, &unk_1E6385480, v10);
    v15 = v19;
  }

  return v13;
}

uint64_t __68__HUAccessorySettingsProfileModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) compare:*(void *)(a1 + 40)];
}

uint64_t __68__HUAccessorySettingsProfileModule_buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  v5 = [v4 profile];
  if (v5)
  {
    uint64_t v6 = [v4 profile];
    uint64_t v7 = [v6 isManagedByProfileService];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __68__HUAccessorySettingsProfileModule_buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  v5 = [v4 profile];
  if (v5)
  {
    uint64_t v6 = [v4 profile];
    uint64_t v7 = [v6 isManagedByProfileService] ^ 1;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)promptForRemoveProfileItem:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(HUAccessorySettingsProfileModule *)self delegate];

  if (!v6) {
    NSLog(&cfstr_NoDelegateSome.isa);
  }
  if (!v5)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HUAccessorySettingsProfileModule.m", 89, @"Invalid parameter not satisfying: %@", @"profileItem" object file lineNumber description];
  }
  objc_initWeak(&location, self);
  uint64_t v7 = [(HUAccessorySettingsProfileModule *)self delegate];
  v8 = [v7 settingsProfileModule:self wantsProfileItemDeleted:v5];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__HUAccessorySettingsProfileModule_promptForRemoveProfileItem___block_invoke;
  v13[3] = &unk_1E6389AC0;
  objc_copyWeak(&v15, &location);
  id v9 = v5;
  id v14 = v9;
  id v10 = [v8 addCompletionBlock:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v10;
}

void __63__HUAccessorySettingsProfileModule_promptForRemoveProfileItem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v7)
  {
    if ((objc_msgSend(v7, "na_isCancelledError") & 1) == 0)
    {
      id v5 = [MEMORY[0x1E4F69110] sharedHandler];
      [v5 handleError:v7];
    }
  }
  else
  {
    id v6 = (id)[WeakRetained _actuallyRemoveProfileItem:*(void *)(a1 + 32)];
  }
}

- (id)_actuallyRemoveProfileItem:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HUAccessorySettingsProfileModule.m", 107, @"Invalid parameter not satisfying: %@", @"profileItem" object file lineNumber description];
  }
  objc_initWeak(&location, self);
  id v6 = (void *)MEMORY[0x1E4F69230];
  id v7 = [(HUAccessorySettingsProfileModule *)self itemProviders];
  v8 = [v6 requestToReloadItemProviders:v7 senderSelector:a2];

  id v9 = [(HUAccessorySettingsProfileModule *)self adapter];
  id v10 = [v5 profile];
  id v11 = [v9 removeProfileFromHomeKit:v10];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__HUAccessorySettingsProfileModule__actuallyRemoveProfileItem___block_invoke;
  v16[3] = &unk_1E6389AC0;
  objc_copyWeak(&v18, &location);
  id v12 = v8;
  id v17 = v12;
  uint64_t v13 = [v11 addCompletionBlock:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v13;
}

void __63__HUAccessorySettingsProfileModule__actuallyRemoveProfileItem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v7)
  {
    id v5 = [MEMORY[0x1E4F69110] sharedHandler];
    [v5 handleError:v7];
  }
  else
  {
    id v5 = [WeakRetained itemUpdater];
    id v6 = (id)[v5 performItemUpdateRequest:*(void *)(a1 + 32)];
  }
}

- (void)managedConfigurationAdapterSettingsWereUpdated:(id)a3
{
  id v5 = (void *)MEMORY[0x1E4F69230];
  id v6 = [(HUAccessorySettingsProfileModule *)self itemProviders];
  id v9 = [v5 requestToReloadItemProviders:v6 senderSelector:a2];

  id v7 = [(HFItemModule *)self itemUpdater];
  id v8 = (id)[v7 performItemUpdateRequest:v9];
}

- (HUAccessorySettingsProfileModuleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUAccessorySettingsProfileModuleDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HFAccessorySettingGroupItem)settingGroupItem
{
  return self->_settingGroupItem;
}

- (HFAccessorySettingManagedConfigurationAdapter)adapter
{
  return self->_adapter;
}

- (HUAccessorySettingsProfileItemProvider)profileItemProvider
{
  return self->_profileItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileItemProvider, 0);
  objc_storeStrong((id *)&self->_adapter, 0);
  objc_storeStrong((id *)&self->_settingGroupItem, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end