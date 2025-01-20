@interface HUAccessorySettingsProfileModuleController
- (BOOL)profileViewControllerIsProfileInstalled;
- (Class)cellClassForItem:(id)a3;
- (HUAccessorySettingsProfileModuleController)initWithModule:(id)a3;
- (HUAccessorySettingsProfileModuleControllerDelegate)delegate;
- (unint64_t)didSelectItem:(id)a3;
- (void)profileViewControllerDidSelectRemoveProfile:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
@end

@implementation HUAccessorySettingsProfileModuleController

- (HUAccessorySettingsProfileModuleController)initWithModule:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUAccessorySettingsProfileModuleController;
  return [(HUItemModuleController *)&v4 initWithModule:a3];
}

- (Class)cellClassForItem:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  objc_super v4 = (void *)getMCProfileSummaryCellClass_softClass;
  uint64_t v12 = getMCProfileSummaryCellClass_softClass;
  if (!getMCProfileSummaryCellClass_softClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getMCProfileSummaryCellClass_block_invoke;
    v8[3] = &unk_1E63852F0;
    v8[4] = &v9;
    __getMCProfileSummaryCellClass_block_invoke((uint64_t)v8);
    objc_super v4 = (void *)v10[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  v6 = objc_opt_class();

  return (Class)v6;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v5 = [a4 profile];
  [v6 setProfile:v5];

  [v6 setAccessoryType:1];
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 profile];
  if (v5)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2050000000;
    id v6 = (void *)getMCProfileViewControllerClass_softClass;
    uint64_t v15 = getMCProfileViewControllerClass_softClass;
    if (!getMCProfileViewControllerClass_softClass)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __getMCProfileViewControllerClass_block_invoke;
      v11[3] = &unk_1E63852F0;
      v11[4] = &v12;
      __getMCProfileViewControllerClass_block_invoke((uint64_t)v11);
      id v6 = (void *)v13[3];
    }
    v7 = v6;
    _Block_object_dispose(&v12, 8);
    v8 = (void *)[[v7 alloc] initWithStyle:1 profile:v5 profileViewMode:2];
    [v8 setProfileViewControllerDelegate:self];
    uint64_t v9 = [(HUAccessorySettingsProfileModuleController *)self delegate];
    [v9 accessorySettingsProfileModuleController:self needsNavigationToController:v8];
  }
  return 1;
}

- (BOOL)profileViewControllerIsProfileInstalled
{
  v2 = [(HUItemModuleController *)self module];
  id v3 = [v2 itemProviders];
  id v4 = [v3 anyObject];

  id v5 = [v4 items];
  LOBYTE(v3) = objc_msgSend(v5, "na_any:", &__block_literal_global_151);

  return (char)v3;
}

BOOL __85__HUAccessorySettingsProfileModuleController_profileViewControllerIsProfileInstalled__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5 != 0;
}

- (void)profileViewControllerDidSelectRemoveProfile:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemModuleController *)self module];
  id v6 = [v5 itemProviders];
  v7 = [v6 anyObject];
  v8 = [v7 items];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__HUAccessorySettingsProfileModuleController_profileViewControllerDidSelectRemoveProfile___block_invoke;
  v17[3] = &unk_1E6386108;
  id v9 = v4;
  id v18 = v9;
  v10 = objc_msgSend(v8, "na_firstObjectPassingTest:", v17);

  uint64_t v11 = [(HUItemModuleController *)self module];
  uint64_t v12 = [v11 promptForRemoveProfileItem:v10];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__HUAccessorySettingsProfileModuleController_profileViewControllerDidSelectRemoveProfile___block_invoke_2;
  v15[3] = &unk_1E63856C0;
  id v16 = v9;
  id v13 = v9;
  id v14 = (id)[v12 addCompletionBlock:v15];
}

BOOL __90__HUAccessorySettingsProfileModuleController_profileViewControllerDidSelectRemoveProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  v7 = [v6 profile];
  v8 = [*(id *)(a1 + 32) UIProfile];
  id v9 = [v8 profile];
  BOOL v10 = v7 == v9;

  return v10;
}

void __90__HUAccessorySettingsProfileModuleController_profileViewControllerDidSelectRemoveProfile___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if ((objc_msgSend(a3, "na_isCancelledError") & 1) == 0)
  {
    id v5 = [*(id *)(a1 + 32) navigationController];
    id v4 = (id)[v5 popViewControllerAnimated:1];
  }
}

- (HUAccessorySettingsProfileModuleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUAccessorySettingsProfileModuleControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end