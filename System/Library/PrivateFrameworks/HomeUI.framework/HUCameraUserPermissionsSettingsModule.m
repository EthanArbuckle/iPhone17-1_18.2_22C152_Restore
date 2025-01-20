@interface HUCameraUserPermissionsSettingsModule
- (BOOL)isItemHeader:(id)a3;
- (HFStaticItemProvider)itemProvider;
- (HMHome)home;
- (HMUser)user;
- (HUCameraAccessLevelOptionItemProvider)accessLevelSettingItemProvider;
- (HUCameraUserPermissionsSettingsModule)initWithItemUpdater:(id)a3;
- (HUCameraUserPermissionsSettingsModule)initWithItemUpdater:(id)a3 user:(id)a4 home:(id)a5;
- (NSArray)optionItems;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)didSelectItem:(id)a3;
- (id)itemProviders;
- (id)showOptionsItem;
- (id)updateUserAccessLevelSetting:(unint64_t)a3;
- (unint64_t)userAccessLevelSetting;
- (void)_buildItemProvider;
- (void)_dispatchUpdateForHome:(id)a3 user:(id)a4;
- (void)setAccessLevelSettingItemProvider:(id)a3;
- (void)setItemProvider:(id)a3;
- (void)setOptionItems:(id)a3;
@end

@implementation HUCameraUserPermissionsSettingsModule

- (HUCameraUserPermissionsSettingsModule)initWithItemUpdater:(id)a3 user:(id)a4 home:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v10 || !v11)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HUCameraUserPermissionsSettingsModule.m", 26, @"Invalid parameter not satisfying: %@", @"user != nil && home != nil" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)HUCameraUserPermissionsSettingsModule;
  v13 = [(HFItemModule *)&v17 initWithItemUpdater:v9];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_user, a4);
    objc_storeStrong((id *)&v14->_home, a5);
    [(HUCameraUserPermissionsSettingsModule *)v14 _buildItemProvider];
  }

  return v14;
}

- (HUCameraUserPermissionsSettingsModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_user_home_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCameraUserPermissionsSettingsModule.m", 39, @"%s is unavailable; use %@ instead",
    "-[HUCameraUserPermissionsSettingsModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (BOOL)isItemHeader:(id)a3
{
  return 0;
}

- (unint64_t)userAccessLevelSetting
{
  v3 = [(HUCameraUserPermissionsSettingsModule *)self home];
  v4 = [(HUCameraUserPermissionsSettingsModule *)self user];
  v5 = [v3 homeAccessControlForUser:v4];
  unint64_t v6 = [v5 camerasAccessLevel];

  return v6;
}

- (id)updateUserAccessLevelSetting:(unint64_t)a3
{
  objc_initWeak(&location, self);
  unint64_t v6 = (void *)MEMORY[0x1E4F7A0D8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__HUCameraUserPermissionsSettingsModule_updateUserAccessLevelSetting___block_invoke;
  v11[3] = &unk_1E638F628;
  v11[4] = self;
  v12[1] = (id)a3;
  objc_copyWeak(v12, &location);
  v7 = [v6 futureWithBlock:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__HUCameraUserPermissionsSettingsModule_updateUserAccessLevelSetting___block_invoke_3;
  v10[3] = &unk_1E63877D0;
  v10[4] = self;
  v10[5] = a2;
  v8 = [v7 addCompletionBlock:v10];

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);

  return v8;
}

void __70__HUCameraUserPermissionsSettingsModule_updateUserAccessLevelSetting___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) home];
  v5 = [*(id *)(a1 + 32) user];
  unint64_t v6 = [v4 homeAccessControlForUser:v5];
  uint64_t v7 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__HUCameraUserPermissionsSettingsModule_updateUserAccessLevelSetting___block_invoke_2;
  v9[3] = &unk_1E638FAA8;
  id v8 = v3;
  id v10 = v8;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  [v6 updateCamerasAccessLevel:v7 completionHandler:v9];

  objc_destroyWeak(&v11);
}

void __70__HUCameraUserPermissionsSettingsModule_updateUserAccessLevelSetting___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) finishWithNoResult];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained home];
  id v3 = [WeakRetained user];
  [WeakRetained _dispatchUpdateForHome:v2 user:v3];
}

void __70__HUCameraUserPermissionsSettingsModule_updateUserAccessLevelSetting___block_invoke_3(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) itemUpdater];
  v2 = (void *)MEMORY[0x1E4F69230];
  id v3 = [*(id *)(a1 + 32) itemProviders];
  v4 = [v2 requestToReloadItemProviders:v3 senderSelector:*(void *)(a1 + 40)];
  id v5 = (id)[v6 performItemUpdateRequest:v4];
}

- (void)_dispatchUpdateForHome:(id)a3 user:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__HUCameraUserPermissionsSettingsModule__dispatchUpdateForHome_user___block_invoke;
  v10[3] = &unk_1E6387408;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 dispatchHomeObserverMessage:v10 sender:0];
}

uint64_t __69__HUCameraUserPermissionsSettingsModule__dispatchUpdateForHome_user___block_invoke(uint64_t a1, void *a2)
{
  return [a2 home:*(void *)(a1 + 32) didUpdateAccessControlForUser:*(void *)(a1 + 40)];
}

- (id)didSelectItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 latestResults];
  id v6 = [v5 objectForKeyedSubscript:@"HUCameraSettingResultKey"];
  uint64_t v7 = [v6 unsignedIntegerValue];

  id v8 = [(HUCameraUserPermissionsSettingsModule *)self accessLevelSettingItemProvider];
  id v9 = [v8 items];
  int v10 = [v9 containsObject:v4];

  if (v10) {
    [(HUCameraUserPermissionsSettingsModule *)self updateUserAccessLevelSetting:v7];
  }
  else {
  id v11 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v11;
}

- (id)itemProviders
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(HUCameraUserPermissionsSettingsModule *)self itemProvider];
  id v4 = [v2 setWithObject:v3];

  return v4;
}

- (void)_buildItemProvider
{
  id v3 = objc_alloc(MEMORY[0x1E4F69708]);
  id v4 = [(HUCameraUserPermissionsSettingsModule *)self home];
  id v5 = [(HUCameraUserPermissionsSettingsModule *)self user];
  id v6 = (HFItem *)[v3 initWithHome:v4 user:v5 nameStyle:2];
  showOptionsItem = self->_showOptionsItem;
  self->_showOptionsItem = v6;

  id v8 = [HUCameraAccessLevelOptionItemProvider alloc];
  id v9 = [(HUCameraUserPermissionsSettingsModule *)self user];
  int v10 = [(HUCameraUserPermissionsSettingsModule *)self home];
  id v11 = [(HUCameraAccessLevelOptionItemProvider *)v8 initWithUser:v9 home:v10];
  [(HUCameraUserPermissionsSettingsModule *)self setAccessLevelSettingItemProvider:v11];

  id v12 = [(HUCameraUserPermissionsSettingsModule *)self accessLevelSettingItemProvider];
  id v13 = (id)[v12 reloadItems];

  v14 = [(HUCameraUserPermissionsSettingsModule *)self accessLevelSettingItemProvider];
  v15 = [v14 items];
  v16 = [v15 allObjects];
  [(HUCameraUserPermissionsSettingsModule *)self setOptionItems:v16];

  objc_super v17 = (void *)MEMORY[0x1E4F1CAD0];
  v18 = [(HUCameraUserPermissionsSettingsModule *)self optionItems];
  v19 = [v17 setWithArray:v18];
  v20 = [(HUCameraUserPermissionsSettingsModule *)self showOptionsItem];
  id v22 = [v19 setByAddingObject:v20];

  v21 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v22];
  [(HUCameraUserPermissionsSettingsModule *)self setItemProvider:v21];
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F692E8]);
  id v6 = [(HUCameraUserPermissionsSettingsModule *)self user];
  uint64_t v7 = [v6 userID];
  id v8 = (void *)[v5 initWithIdentifier:v7];

  id v9 = (void *)MEMORY[0x1E4F1CA48];
  int v10 = [(HUCameraUserPermissionsSettingsModule *)self showOptionsItem];
  id v11 = [v9 arrayWithObject:v10];

  if ([(HUExpandableItemModule *)self showOptions])
  {
    id v12 = [(HUCameraUserPermissionsSettingsModule *)self optionItems];
    id v13 = [v12 sortedArrayUsingComparator:&__block_literal_global_228];

    [v11 addObjectsFromArray:v13];
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__HUCameraUserPermissionsSettingsModule_buildSectionsWithDisplayedItems___block_invoke_3;
  v18[3] = &unk_1E6386108;
  id v19 = v4;
  id v14 = v4;
  v15 = objc_msgSend(v11, "na_filter:", v18);
  [v8 setItems:v15];

  v20[0] = v8;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];

  return v16;
}

uint64_t __73__HUCameraUserPermissionsSettingsModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 latestResults];
  uint64_t v6 = *MEMORY[0x1E4F68B48];
  uint64_t v7 = [v5 objectForKey:*MEMORY[0x1E4F68B48]];

  id v8 = [v4 latestResults];

  id v9 = [v8 objectForKey:v6];

  uint64_t v17 = MEMORY[0x1E4F143A8];
  id v10 = v7;
  v18 = v10;
  id v11 = v9;
  id v12 = v11;
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
    uint64_t v13 = objc_msgSend(v10, "compare:", v11, v17, 3221225472, __73__HUCameraUserPermissionsSettingsModule_buildSectionsWithDisplayedItems___block_invoke_2, &unk_1E6385480, v10);
    v15 = v19;
  }

  return v13;
}

uint64_t __73__HUCameraUserPermissionsSettingsModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) compare:*(void *)(a1 + 40)];
}

uint64_t __73__HUCameraUserPermissionsSettingsModule_buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (id)showOptionsItem
{
  return self->_showOptionsItem;
}

- (HMUser)user
{
  return self->_user;
}

- (HMHome)home
{
  return self->_home;
}

- (HUCameraAccessLevelOptionItemProvider)accessLevelSettingItemProvider
{
  return self->_accessLevelSettingItemProvider;
}

- (void)setAccessLevelSettingItemProvider:(id)a3
{
}

- (HFStaticItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
}

- (NSArray)optionItems
{
  return self->_optionItems;
}

- (void)setOptionItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionItems, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_accessLevelSettingItemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_showOptionsItem, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end