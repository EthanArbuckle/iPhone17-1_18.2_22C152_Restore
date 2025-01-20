@interface HUAccessorySettingsProfileViewController
- (HFAccessorySettingGroupItem)item;
- (HUAccessorySettingsProfileModule)profileModule;
- (HUAccessorySettingsProfileModuleController)profileModuleController;
- (HUAccessorySettingsProfileViewController)initWithAccessoryGroupItem:(id)a3;
- (id)hu_preloadContent;
- (id)itemModuleControllers;
- (id)settingsProfileModule:(id)a3 wantsProfileItemDeleted:(id)a4;
- (void)accessorySettingsProfileModuleController:(id)a3 needsNavigationToController:(id)a4;
- (void)setProfileModule:(id)a3;
- (void)setProfileModuleController:(id)a3;
@end

@implementation HUAccessorySettingsProfileViewController

- (HUAccessorySettingsProfileViewController)initWithAccessoryGroupItem:(id)a3
{
  v5 = (void *)[a3 copy];
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HUAccessorySettingsProfileViewController.m", 30, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];
  }
  v6 = [[HUAccessorySettingsProfileItemManager alloc] initWithDelegate:self accessoryGroupItem:v5];
  v17.receiver = self;
  v17.super_class = (Class)HUAccessorySettingsProfileViewController;
  v7 = [(HUItemTableViewController *)&v17 initWithItemManager:v6 tableViewStyle:1];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_item, v5);
    v9 = [(HUAccessorySettingsProfileItemManager *)v6 profileModule];
    [(HUAccessorySettingsProfileViewController *)v8 setProfileModule:v9];

    v10 = [(HUAccessorySettingsProfileViewController *)v8 profileModule];
    [v10 setDelegate:v8];

    v11 = [HUAccessorySettingsProfileModuleController alloc];
    v12 = [(HUAccessorySettingsProfileViewController *)v8 profileModule];
    v13 = [(HUAccessorySettingsProfileModuleController *)v11 initWithModule:v12];
    [(HUAccessorySettingsProfileViewController *)v8 setProfileModuleController:v13];

    v14 = [(HUAccessorySettingsProfileViewController *)v8 profileModuleController];
    [v14 setDelegate:v8];
  }
  return v8;
}

- (id)itemModuleControllers
{
  v3 = objc_opt_new();
  v4 = [(HUAccessorySettingsProfileViewController *)self profileModuleController];
  objc_msgSend(v3, "na_safeAddObject:", v4);

  return v3;
}

- (id)hu_preloadContent
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)accessorySettingsProfileModuleController:(id)a3 needsNavigationToController:(id)a4
{
  id v5 = a4;
  id v6 = [(HUAccessorySettingsProfileViewController *)self navigationController];
  [v6 pushViewController:v5 animated:1];
}

- (id)settingsProfileModule:(id)a3 wantsProfileItemDeleted:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  v28 = v7;
  v9 = [v7 profile];
  uint64_t v10 = _HULocalizedStringWithDefaultValue(@"HUAccessorySettingsProfileViewControllerRemoveProfile", @"HUAccessorySettingsProfileViewControllerRemoveProfile", 1);
  if ([v9 needsReboot]) {
    v11 = @"HUAccessorySettingsProfileViewControllerRemoveNeedsReboot";
  }
  else {
    v11 = @"HUAccessorySettingsProfileViewControllerRemove";
  }
  v12 = _HULocalizedStringWithDefaultValue(v11, v11, 1);
  v13 = _HULocalizedStringWithDefaultValue(@"HUAccessorySettingsProfileViewControllerDeleteActionTitle", @"HUAccessorySettingsProfileViewControllerDeleteActionTitle", 1);
  v14 = _HULocalizedStringWithDefaultValue(@"HUAccessorySettingsProfileViewControllerCancelActionTitle", @"HUAccessorySettingsProfileViewControllerCancelActionTitle", 1);
  v27 = (void *)v10;
  v15 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v10 message:v12 preferredStyle:1];
  objc_initWeak(location, self);
  v29 = v6;
  v16 = [v6 adapter];
  BOOL v17 = [v16 numberOfProfiles] == 1;

  v18 = (void *)MEMORY[0x1E4F42720];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __90__HUAccessorySettingsProfileViewController_settingsProfileModule_wantsProfileItemDeleted___block_invoke;
  v32[3] = &unk_1E63898E0;
  objc_copyWeak(&v34, location);
  BOOL v35 = v17;
  id v19 = v8;
  id v33 = v19;
  v20 = [v18 actionWithTitle:v13 style:2 handler:v32];
  [v15 addAction:v20];

  v21 = (void *)MEMORY[0x1E4F42720];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __90__HUAccessorySettingsProfileViewController_settingsProfileModule_wantsProfileItemDeleted___block_invoke_2;
  v30[3] = &unk_1E6385188;
  id v22 = v19;
  id v31 = v22;
  v23 = [v21 actionWithTitle:v14 style:1 handler:v30];
  [v15 addAction:v23];

  [(HUAccessorySettingsProfileViewController *)self presentViewController:v15 animated:1 completion:0];
  v24 = v31;
  id v25 = v22;

  objc_destroyWeak(&v34);
  objc_destroyWeak(location);

  return v25;
}

void __90__HUAccessorySettingsProfileViewController_settingsProfileModule_wantsProfileItemDeleted___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = [WeakRetained navigationController];
    id v3 = (id)[v2 popViewControllerAnimated:1];
  }
  [*(id *)(a1 + 32) finishWithNoResult];
}

void __90__HUAccessorySettingsProfileViewController_settingsProfileModule_wantsProfileItemDeleted___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "na_cancelledError");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 finishWithError:v2];
}

- (HFAccessorySettingGroupItem)item
{
  return self->_item;
}

- (HUAccessorySettingsProfileModule)profileModule
{
  return self->_profileModule;
}

- (void)setProfileModule:(id)a3
{
}

- (HUAccessorySettingsProfileModuleController)profileModuleController
{
  return self->_profileModuleController;
}

- (void)setProfileModuleController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileModuleController, 0);
  objc_storeStrong((id *)&self->_profileModule, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end