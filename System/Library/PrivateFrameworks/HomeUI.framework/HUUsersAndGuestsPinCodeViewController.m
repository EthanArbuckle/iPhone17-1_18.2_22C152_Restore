@interface HUUsersAndGuestsPinCodeViewController
- (BOOL)_isEditingGuestList;
- (BOOL)_shouldShowInvitePeople;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFPinCodeManager)pinCodeManager;
- (HUPresentationDelegate)presentationDelegate;
- (HUUsersAndGuestsPinCodeViewController)initWithSourceItem:(id)a3 pinCodeManager:(id)a4 home:(id)a5 forAccessory:(id)a6;
- (id)_addPinCodeItem;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)finishPresentation:(id)a3 animated:(BOOL)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)hideSpinner;
- (void)setPinCodeManager:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)showSpinner;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)userSwitchCell:(id)a3 didTurnOn:(BOOL)a4;
@end

@implementation HUUsersAndGuestsPinCodeViewController

- (HUUsersAndGuestsPinCodeViewController)initWithSourceItem:(id)a3 pinCodeManager:(id)a4 home:(id)a5 forAccessory:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a5;
  v12 = [[HUUsersAndGuestsPinCodeItemManager alloc] initWithPinCodeManager:v9 delegate:self home:v11 forAccessory:v10];

  v17.receiver = self;
  v17.super_class = (Class)HUUsersAndGuestsPinCodeViewController;
  v13 = [(HUItemTableViewController *)&v17 initWithItemManager:v12 tableViewStyle:1];
  v14 = v13;
  if (v13)
  {
    [(HUUsersAndGuestsPinCodeViewController *)v13 setPinCodeManager:v9];
    v15 = _HULocalizedStringWithDefaultValue(@"HUUsersAndGuestsPinCodesTitle", @"HUUsersAndGuestsPinCodesTitle", 1);
    [(HUUsersAndGuestsPinCodeViewController *)v14 setTitle:v15];

    [(HUItemTableViewController *)v14 setAutomaticallyUpdatesViewControllerTitle:0];
  }

  return v14;
}

- (void)showSpinner
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v5];
  v4 = [(HUUsersAndGuestsPinCodeViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  [v5 startAnimating];
}

- (void)hideSpinner
{
  objc_opt_class();
  v3 = [(HUUsersAndGuestsPinCodeViewController *)self navigationItem];
  v4 = [v3 rightBarButtonItem];
  id v5 = [v4 customView];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v8 = v6;

  v7 = [(HUUsersAndGuestsPinCodeViewController *)self navigationItem];
  [v7 setRightBarButtonItem:0];

  [v8 stopAnimating];
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    NSLog(&cfstr_UnexpectedModu.isa, v3);
  }
  v4 = [[HUPinCodeListModuleController alloc] initWithModule:v3];

  return v4;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  v6 = [(HUItemTableViewController *)self itemManager];
  v7 = [v6 userItemProvider];
  id v8 = [v7 items];
  char v9 = [v8 containsObject:v5];

  if ((v9 & 1) == 0)
  {
    id v10 = [v6 transformedGuestUserItemProvider];
    id v11 = [v10 items];
    int v12 = [v11 containsObject:v5];

    if (v12)
    {
      [(HUUsersAndGuestsPinCodeViewController *)self _isEditingGuestList];
    }
    else
    {
      v13 = [v6 restoreHomeKeyAccessItem];
      char v14 = [v5 isEqual:v13];

      if ((v14 & 1) == 0) {
        NSLog(&cfstr_UnrecognizedIt.isa, v5);
      }
    }
  }
  v15 = objc_opt_class();

  return (Class)v15;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v37 = a3;
  id v7 = a4;
  id v8 = [(HUItemTableViewController *)self itemManager];
  char v9 = [v8 userItemProvider];
  id v10 = [v9 items];
  int v11 = [v10 containsObject:v7];

  if (v11)
  {
    objc_opt_class();
    id v12 = v37;
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    [v14 setAccessoryType:0];
    v15 = [v7 latestResults];
    v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
    objc_super v17 = [v16 stringByAppendingString:@".UsersAndGuests"];
    [v14 setAccessibilityIdentifier:v17];

    v18 = [v7 latestResults];
    v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F68C78]];

    if (v19) {
      [v14 setUserHandle:v19];
    }
  }
  else
  {
    v20 = [v8 transformedGuestUserItemProvider];
    v21 = [v20 items];
    int v22 = [v21 containsObject:v7];

    if (!v22) {
      goto LABEL_20;
    }
    objc_opt_class();
    id v23 = v37;
    if (objc_opt_isKindOfClass()) {
      v24 = v23;
    }
    else {
      v24 = 0;
    }
    id v14 = v24;

    v25 = [v7 latestResults];
    v19 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4F68C78]];

    if (v19) {
      [v14 setUserHandle:v19];
    }
    v26 = +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:v7];
    [v14 setShowAccessLevelDescription:1];
    [v26 setPrefersSideBySideTextAndSecondaryText:0];
    [v23 setContentConfiguration:v26];
    v27 = [v7 latestResults];
    uint64_t v28 = *MEMORY[0x1E4F68928];
    v29 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
    [v23 setAccessibilityIdentifier:v29];

    if ([(HUUsersAndGuestsPinCodeViewController *)self _isEditingGuestList])
    {
      [v23 setAccessoryType:1];
      v30 = [v7 latestResults];
      v31 = [v30 objectForKeyedSubscript:v28];
      [v23 setAccessibilityIdentifier:v31];
    }
    objc_opt_class();
    id v32 = v23;
    if (objc_opt_isKindOfClass()) {
      v33 = v32;
    }
    else {
      v33 = 0;
    }
    id v34 = v33;

    [v34 setOverrideDefaultContentConfiguration:0];
    [v34 setDelegate:self];
    v35 = [v7 latestResults];
    v36 = [v35 objectForKeyedSubscript:v28];
    [v34 setAccessibilityIdentifier:v36];
  }
LABEL_20:
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HUItemTableViewController *)self itemManager];
  char v9 = [v8 displayedItemAtIndexPath:v7];
  id v10 = [v8 userItemProvider];
  int v11 = [v10 items];
  char v12 = [v11 containsObject:v9];

  if ((v12 & 1) != 0
    || ![(HUUsersAndGuestsPinCodeViewController *)self _isEditingGuestList]
    && ([v8 transformedGuestUserItemProvider],
        v13 = objc_claimAutoreleasedReturnValue(),
        [v13 items],
        id v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = [v14 containsObject:v9],
        v14,
        v13,
        (v15 & 1) != 0))
  {
    BOOL v16 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)HUUsersAndGuestsPinCodeViewController;
    BOOL v16 = [(HUItemTableViewController *)&v18 tableView:v6 shouldHighlightRowAtIndexPath:v7];
  }

  return v16;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)HUUsersAndGuestsPinCodeViewController;
  id v6 = a4;
  id v7 = [(HUItemTableViewController *)&v19 tableView:a3 cellForRowAtIndexPath:v6];
  id v8 = [(HUItemTableViewController *)self itemManager];
  char v9 = [v8 displayedItemAtIndexPath:v6];

  if ([(HUUsersAndGuestsPinCodeViewController *)self _shouldShowInvitePeople])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [(HUUsersAndGuestsPinCodeViewController *)self _addPinCodeItem];
      int v11 = [v9 isEqual:v10];

      if (v11)
      {
        objc_opt_class();
        char v12 = [v7 contentConfiguration];
        if (objc_opt_isKindOfClass()) {
          v13 = v12;
        }
        else {
          v13 = 0;
        }
        id v14 = v13;

        char v15 = _HULocalizedStringWithDefaultValue(@"HUInviteButtonTitle", @"HUInviteButtonTitle", 1);
        [v14 setText:v15];

        [v7 setContentConfiguration:v14];
        BOOL v16 = [v9 latestResults];
        objc_super v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
        [v7 setAccessibilityIdentifier:v17];
      }
    }
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  char v9 = [(HUItemTableViewController *)self itemManager];
  id v10 = [v9 displayedItemAtIndexPath:v8];

  int v11 = [(HUItemTableViewController *)self itemManager];
  objc_initWeak(&location, v11);

  char v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v59 = self;
    __int16 v60 = 2080;
    v61 = "-[HUUsersAndGuestsPinCodeViewController tableView:didSelectRowAtIndexPath:]";
    __int16 v62 = 2112;
    v63 = v10;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "In %@'s %s, user selected item %@", buf, 0x20u);
  }

  if ([(HUUsersAndGuestsPinCodeViewController *)self _shouldShowInvitePeople])
  {
    v13 = [(HUUsersAndGuestsPinCodeViewController *)self _addPinCodeItem];
    int v14 = [v10 isEqual:v13];

    if (v14)
    {
      char v15 = [(HUItemTableViewController *)self itemManager];
      BOOL v16 = [v15 home];
      if ([v16 hasOnboardedForAccessCode])
      {
        objc_super v17 = [(HUItemTableViewController *)self itemManager];
        objc_super v18 = [v17 home];
        objc_super v19 = [v18 accessories];
        int v20 = objc_msgSend(v19, "na_any:", &__block_literal_global_154);
      }
      else
      {
        int v20 = 0;
      }

      v47 = [HUAddPersonRoleViewController alloc];
      v48 = [(HUItemTableViewController *)self itemManager];
      v49 = [v48 home];
      v27 = [(HUAddPersonRoleViewController *)v47 initWithHome:v49];

      if (v20)
      {
        v50 = [(HUUsersAndGuestsPinCodeViewController *)self pinCodeManager];
        [(HUAddPersonRoleViewController *)v27 setPinCodeManager:v50];
      }
      [(HUAddPersonRoleViewController *)v27 setPresentationDelegate:self];
      v30 = (HUAddPersonRoleViewController *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v27];
      [(HUAddPersonRoleViewController *)v30 setModalPresentationStyle:2];
      [(HUUsersAndGuestsPinCodeViewController *)self presentViewController:v30 animated:1 completion:0];
      [v7 deselectRowAtIndexPath:v8 animated:1];
LABEL_25:

      goto LABEL_26;
    }
  }
  if ([(HUUsersAndGuestsPinCodeViewController *)self _isEditingGuestList])
  {
    id v21 = objc_loadWeakRetained(&location);
    int v22 = [v21 transformedGuestUserItemProvider];
    id v23 = [v22 items];
    int v24 = [v23 containsObject:v10];

    if (v24)
    {
      objc_opt_class();
      id v25 = v10;
      if (objc_opt_isKindOfClass()) {
        v26 = v25;
      }
      else {
        v26 = 0;
      }
      v27 = v26;

      objc_opt_class();
      id v28 = [(HUAddPersonRoleViewController *)v27 sourceItem];
      if (objc_opt_isKindOfClass()) {
        v29 = v28;
      }
      else {
        v29 = 0;
      }
      v30 = v29;

      v31 = [HUEditUserViewController alloc];
      id v32 = [(HUUsersAndGuestsPinCodeViewController *)self pinCodeManager];
      v33 = [v32 home];
      id v34 = [(HUUsersAndGuestsPinCodeViewController *)self pinCodeManager];
      v35 = [(HUEditUserViewController *)v31 initWithItem:v30 home:v33 pinCodeManager:v34];

      v36 = [(HUUsersAndGuestsPinCodeViewController *)self navigationController];
      id v37 = (id)objc_msgSend(v36, "hu_pushPreloadableViewController:animated:", v35, 1);

      goto LABEL_25;
    }
  }
  v56.receiver = self;
  v56.super_class = (Class)HUUsersAndGuestsPinCodeViewController;
  [(HUItemTableViewController *)&v56 tableView:v7 didSelectRowAtIndexPath:v8];
  [v7 deselectRowAtIndexPath:v8 animated:1];
  id v38 = objc_loadWeakRetained(&location);
  v39 = [v38 restoreHomeKeyAccessItem];
  int v40 = [v10 isEqual:v39];

  if (v40)
  {
    v41 = [v7 cellForRowAtIndexPath:v8];
    objc_opt_class();
    v27 = v41;
    if (objc_opt_isKindOfClass()) {
      v42 = v27;
    }
    else {
      v42 = 0;
    }
    v43 = v42;

    [(HUAddPersonRoleViewController *)v43 setShowSpinner:1];
    objc_initWeak((id *)buf, self);
    id v44 = objc_loadWeakRetained(&location);
    v45 = [v44 restoreFuture];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __75__HUUsersAndGuestsPinCodeViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    v51[3] = &unk_1E638D4D8;
    objc_copyWeak(&v54, (id *)buf);
    objc_copyWeak(v55, &location);
    id v52 = v10;
    v55[1] = (id)a2;
    v30 = v43;
    v53 = v30;
    id v46 = (id)[v45 addSuccessBlock:v51];

    objc_destroyWeak(v55);
    objc_destroyWeak(&v54);
    objc_destroyWeak((id *)buf);
    goto LABEL_25;
  }
LABEL_26:
  objc_destroyWeak(&location);
}

uint64_t __75__HUUsersAndGuestsPinCodeViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsAccessCodes];
}

void __75__HUUsersAndGuestsPinCodeViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = [WeakRetained pinCodeManager];
  id v6 = [v5 home];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__HUUsersAndGuestsPinCodeViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
  v9[3] = &unk_1E638D4B0;
  objc_copyWeak(v12, (id *)(a1 + 56));
  v9[4] = WeakRetained;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(void **)(a1 + 64);
  id v10 = v7;
  v12[1] = v8;
  id v11 = *(id *)(a1 + 40);
  [v6 restoreMissingWalletKeys:v3 completion:v9];

  objc_destroyWeak(v12);
}

uint64_t __75__HUUsersAndGuestsPinCodeViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F7A0D8] futureWithResult:a2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained setRestoreFuture:v3];

  id v5 = [*(id *)(a1 + 32) itemManager];
  id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
  id v7 = (id)[v5 updateResultsForItems:v6 senderSelector:*(void *)(a1 + 64)];

  id v8 = *(void **)(a1 + 48);

  return [v8 setShowSpinner:0];
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 conformsToProtocol:&unk_1F19E7BA8]) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  int v9 = [v8 requiresPresentingViewControllerDismissal];

  if (v9)
  {
    id v10 = [(HUUsersAndGuestsPinCodeViewController *)self presentationDelegate];
    id v11 = [v10 finishPresentation:self animated:v4];
  }
  else
  {
    id v11 = [(UIViewController *)self hu_dismissViewControllerAnimated:v4];
  }

  return v11;
}

- (void)userSwitchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = NSStringFromSelector(a2);
    id v10 = [v7 text];
    id v11 = [v7 item];
    *(_DWORD *)buf = 138413314;
    v31 = self;
    __int16 v32 = 2112;
    v33 = v9;
    __int16 v34 = 2112;
    v35 = v10;
    __int16 v36 = 1024;
    BOOL v37 = v4;
    __int16 v38 = 2112;
    v39 = v11;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped on switch cell '%@' | isOn = %{BOOL}d | item = %@", buf, 0x30u);
  }
  char v12 = [(HUItemTableViewController *)self itemManager];
  objc_opt_class();
  v13 = [v7 item];
  if (objc_opt_isKindOfClass()) {
    int v14 = v13;
  }
  else {
    int v14 = 0;
  }
  id v15 = v14;

  BOOL v16 = [v15 sourceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_opt_class();
    objc_super v18 = [v15 sourceItem];
    if (objc_opt_isKindOfClass()) {
      objc_super v19 = v18;
    }
    else {
      objc_super v19 = 0;
    }
    id v20 = v19;

    id v21 = [v12 enableRestrictedGuestAccessSetting:v4 forItem:v20];

    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __66__HUUsersAndGuestsPinCodeViewController_userSwitchCell_didTurnOn___block_invoke;
    v27 = &unk_1E6385A48;
    id v28 = v7;
    BOOL v29 = v4;
    id v22 = (id)[v21 addCompletionBlock:&v24];
  }
  id v23 = (id)objc_msgSend(v12, "reloadAndUpdateAllItemsFromSenderSelector:", a2, v24, v25, v26, v27);
}

void __66__HUUsersAndGuestsPinCodeViewController_userSwitchCell_didTurnOn___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [*(id *)(a1 + 32) setOn:*(unsigned char *)(a1 + 40) == 0 animated:1];
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "-[HUUsersAndGuestsPinCodeViewController userSwitchCell:didTurnOn:]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "(%s) Failed to update restricted guest access settings with error %@.", (uint8_t *)&v7, 0x16u);
    }

    id v6 = [MEMORY[0x1E4F69110] sharedHandler];
    [v6 handleError:v4 operationType:*MEMORY[0x1E4F687E8] options:0 retryBlock:0 cancelBlock:0];
  }
}

- (id)_addPinCodeItem
{
  v2 = [(HUItemTableViewController *)self itemModuleControllers];
  id v3 = objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_98);

  id v4 = [v3 module];
  id v5 = [v4 addPinCodeItem];

  return v5;
}

BOOL __56__HUUsersAndGuestsPinCodeViewController__addPinCodeItem__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = [v2 module];

  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  BOOL v6 = [v5 listType] == 2;
  return v6;
}

- (BOOL)_isEditingGuestList
{
  id v2 = [(HUItemTableViewController *)self itemModuleControllers];
  id v3 = objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_100_0);

  LOBYTE(v2) = [v3 editing];
  return (char)v2;
}

BOOL __60__HUUsersAndGuestsPinCodeViewController__isEditingGuestList__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = [v2 module];

  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  BOOL v6 = [v5 listType] == 2;
  return v6;
}

- (BOOL)_shouldShowInvitePeople
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = [(HUItemTableViewController *)self itemManager];
  id v3 = [v2 home];

  id v4 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v5 = [v4 homeManager];
  int v6 = [v5 hasOptedToHH2];

  if (v6)
  {
    int v7 = [v3 residentDevices];
    BOOL v8 = [v7 count] != 0;
  }
  else
  {
    BOOL v8 = 1;
  }
  __int16 v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v3 residentDevices];
    int v12 = 136316162;
    v13 = "-[HUUsersAndGuestsPinCodeViewController _shouldShowInvitePeople]";
    __int16 v14 = 1024;
    BOOL v15 = v8;
    __int16 v16 = 1024;
    int v17 = v6;
    __int16 v18 = 2048;
    uint64_t v19 = [v10 count];
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "(%s) shouldShowInvitePeople = %{BOOL}d because hasOptedToHH2 = %{BOOL}d | residentDevices.count = %ld | home %@", (uint8_t *)&v12, 0x2Cu);
  }
  return v8;
}

- (HUPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->presentationDelegate);

  return (HUPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (HFPinCodeManager)pinCodeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pinCodeManager);

  return (HFPinCodeManager *)WeakRetained;
}

- (void)setPinCodeManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pinCodeManager);

  objc_destroyWeak((id *)&self->presentationDelegate);
}

@end