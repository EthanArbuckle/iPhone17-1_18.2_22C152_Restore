@interface HUHomeKitAccessorySettingsDetailsViewController
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (HUHomeKitAccessorySettingsDetailsViewController)initWithCollapsedAccessorySettingItemModule:(id)a3;
- (HUHomeKitAccessorySettingsItemModule)collapsedModule;
- (HUHomeKitAccessorySettingsItemModuleController)moduleController;
- (id)buildItemModuleControllerForModule:(id)a3;
- (void)didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a3 settings:(id)a4;
- (void)dismissPrivacyController;
- (void)setCollapsedModule:(id)a3;
- (void)setModuleController:(id)a3;
@end

@implementation HUHomeKitAccessorySettingsDetailsViewController

- (HUHomeKitAccessorySettingsDetailsViewController)initWithCollapsedAccessorySettingItemModule:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HUHomeKitAccessorySettingsDetailsViewController.m", 38, @"Invalid parameter not satisfying: %@", @"itemModule != nil" object file lineNumber description];
  }
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F69590]) initWithDelegate:self];
  v7 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v8 = [v7 accessorySettingsDataSource];
  [v8 addObserver:self];

  objc_opt_class();
  id v9 = v5;
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __95__HUHomeKitAccessorySettingsDetailsViewController_initWithCollapsedAccessorySettingItemModule___block_invoke;
  v25[3] = &unk_1E6385000;
  id v12 = v11;
  id v26 = v12;
  [v6 setHomeCreator:v25];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __95__HUHomeKitAccessorySettingsDetailsViewController_initWithCollapsedAccessorySettingItemModule___block_invoke_2;
  v23[3] = &unk_1E638E0A8;
  id v13 = v12;
  id v24 = v13;
  [v6 setItemModuleCreator:v23];
  v22.receiver = self;
  v22.super_class = (Class)HUHomeKitAccessorySettingsDetailsViewController;
  v14 = [(HUItemTableViewController *)&v22 initWithItemManager:v6 tableViewStyle:1];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_collapsedModule, v10);
    v16 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v17 = [v16 accessorySettingsDataSource];
    v18 = [v13 settingGroupKeyPath];
    v19 = objc_msgSend(v17, "hf_localizedTitleForKeyPath:", v18);
    [(HUHomeKitAccessorySettingsDetailsViewController *)v15 setTitle:v19];
  }
  return v15;
}

id __95__HUHomeKitAccessorySettingsDetailsViewController_initWithCollapsedAccessorySettingItemModule___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F7A0D8];
  v2 = [*(id *)(a1 + 32) home];
  v3 = [v1 futureWithResult:v2];

  return v3;
}

id __95__HUHomeKitAccessorySettingsDetailsViewController_initWithCollapsedAccessorySettingItemModule___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = objc_opt_new();
  v8 = [HUHomeKitAccessorySettingsItemModule alloc];
  id v9 = [*(id *)(a1 + 32) settingsController];
  v10 = [*(id *)(a1 + 32) sourceItem];
  id v11 = [*(id *)(a1 + 32) settingGroupKeyPath];
  id v12 = [(HUHomeKitAccessorySettingsItemModule *)v8 initWithSettingsController:v9 itemUpdater:v5 home:v6 sourceItem:v10 settingGroupKeyPath:v11 isCollapsed:0];

  [v7 addObject:v12];

  return v7;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    NSLog(&cfstr_UnexpectedModu.isa, v4);
  }
  id v5 = [[HUHomeKitAccessorySettingsItemModuleController alloc] initWithModule:v4 delegate:0];
  [(HUHomeKitAccessorySettingsDetailsViewController *)self setModuleController:v5];

  id v6 = [(HUHomeKitAccessorySettingsDetailsViewController *)self moduleController];

  return v6;
}

- (void)didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a3 settings:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v31 = v10;
    __int16 v32 = 2112;
    id v33 = v7;
    __int16 v34 = 2112;
    id v35 = v8;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@ didRecieveSettingsUpdatesForAccessoryWithIdentifier = [%@] settings = [%@]. Now reloading all Items.", buf, 0x20u);
  }
  id v24 = v7;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = [(HUItemTableViewController *)self itemManager];
  id v12 = [v11 itemModules];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v25 + 1) + 8 * v16);
        objc_opt_class();
        id v18 = v17;
        if (objc_opt_isKindOfClass()) {
          v19 = v18;
        }
        else {
          v19 = 0;
        }
        id v20 = v19;

        if (v20)
        {
          v21 = [v20 accessorySettingsItemProvider];
          [v21 updateSettings:v8];
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }

  objc_super v22 = [(HUItemTableViewController *)self itemManager];
  id v23 = (id)[v22 reloadAndUpdateAllItemsFromSenderSelector:a2];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    v17 = self;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v9 = [(HUHomeKitAccessorySettingsDetailsViewController *)self navigationController];
  v10 = (void *)v9;
  if (v9) {
    id v11 = (HUHomeKitAccessorySettingsDetailsViewController *)v9;
  }
  else {
    id v11 = self;
  }
  id v12 = v11;

  uint64_t v13 = [MEMORY[0x1E4F83AD8] presenterForPrivacySplashWithIdentifier:*MEMORY[0x1E4F83B10]];
  uint64_t v14 = [v13 splashController];
  [v14 setDisplayDeviceType:6];

  [v13 setPresentingViewController:v12];
  [v13 present];

  return 0;
}

- (void)dismissPrivacyController
{
}

- (HUHomeKitAccessorySettingsItemModule)collapsedModule
{
  return self->_collapsedModule;
}

- (void)setCollapsedModule:(id)a3
{
}

- (HUHomeKitAccessorySettingsItemModuleController)moduleController
{
  return self->_moduleController;
}

- (void)setModuleController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleController, 0);

  objc_storeStrong((id *)&self->_collapsedModule, 0);
}

@end