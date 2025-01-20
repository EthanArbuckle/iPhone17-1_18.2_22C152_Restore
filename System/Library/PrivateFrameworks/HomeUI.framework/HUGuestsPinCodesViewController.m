@interface HUGuestsPinCodesViewController
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFPinCodeManager)pinCodeManager;
- (HUGuestsPinCodesViewController)initWithPinCodeManager:(id)a3 settingsContext:(unint64_t)a4;
- (HUPresentationDelegate)presentationDelegate;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)finishPresentation:(id)a3 animated:(BOOL)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (unint64_t)settingsContext;
- (void)hideSpinner;
- (void)setPinCodeManager:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setSettingsContext:(unint64_t)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)showSpinner;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation HUGuestsPinCodesViewController

- (HUGuestsPinCodesViewController)initWithPinCodeManager:(id)a3 settingsContext:(unint64_t)a4
{
  id v6 = a3;
  v7 = [[HUGuestsPinCodesItemManager alloc] initWithPinCodeManager:v6 delegate:0];
  v12.receiver = self;
  v12.super_class = (Class)HUGuestsPinCodesViewController;
  v8 = [(HUItemTableViewController *)&v12 initWithItemManager:v7 tableViewStyle:1];
  v9 = v8;
  if (v8)
  {
    [(HUGuestsPinCodesViewController *)v8 setPinCodeManager:v6];
    [(HUGuestsPinCodesViewController *)v9 setSettingsContext:a4];
    v10 = _HULocalizedStringWithDefaultValue(@"HUGuestsPinCodesTitle", @"HUGuestsPinCodesTitle", 1);
    [(HUGuestsPinCodesViewController *)v9 setTitle:v10];

    [(HUItemTableViewController *)v9 setAutomaticallyUpdatesViewControllerTitle:0];
  }

  return v9;
}

- (void)showSpinner
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v5];
  v4 = [(HUGuestsPinCodesViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  [v5 startAnimating];
}

- (void)hideSpinner
{
  objc_opt_class();
  v3 = [(HUGuestsPinCodesViewController *)self navigationItem];
  v4 = [v3 rightBarButtonItem];
  id v5 = [v4 customView];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v8 = v6;

  v7 = [(HUGuestsPinCodesViewController *)self navigationItem];
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

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v25.receiver = self;
  v25.super_class = (Class)HUGuestsPinCodesViewController;
  id v6 = a4;
  v7 = [(HUItemTableViewController *)&v25 tableView:a3 cellForRowAtIndexPath:v6];
  id v8 = [(HUItemTableViewController *)self itemManager];
  v9 = [v8 displayedItemAtIndexPath:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    v10 = [v7 contentConfiguration];
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    v13 = _HULocalizedStringWithDefaultValue(@"HUPinCodeGuestAccessDescription", @"HUPinCodeGuestAccessDescription", 1);
    [v12 setSecondaryText:v13];

    [v7 setContentConfiguration:v12];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_16;
    }
    objc_opt_class();
    id v14 = v9;
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
    id v16 = v15;

    v17 = [v16 latestResults];

    id v12 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    v18 = HFLocalizedString();
    int v19 = [v12 isEqualToString:v18];

    if (v19)
    {
      objc_opt_class();
      v20 = [v7 contentConfiguration];
      if (objc_opt_isKindOfClass()) {
        v21 = v20;
      }
      else {
        v21 = 0;
      }
      id v22 = v21;

      [v7 setAccessibilityIdentifier:@"Home.Guests.InvitePeople"];
      v23 = _HULocalizedStringWithDefaultValue(@"HUInviteButtonTitle", @"HUInviteButtonTitle", 1);
      [v22 setText:v23];

      [v7 setContentConfiguration:v22];
    }
  }

LABEL_16:

  return v7;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();

  id v5 = objc_opt_class();

  return (Class)v5;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v15 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v7 = v15;
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    [v9 setShowAccessLevelDescription:1];
    [v9 setAccessoryType:1];
    v10 = [v6 latestResults];
    v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F68C78]];

    if (v11)
    {
      [v9 setUserHandle:v11];
      id v12 = [v6 latestResults];
      v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
      id v14 = [v13 stringByAppendingString:@".Guest"];
      [v9 setAccessibilityIdentifier:v14];
    }
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v7];

  v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v48 = self;
    __int16 v49 = 2112;
    v50 = v9;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@: User did select row for item: %@", buf, 0x16u);
  }

  v11 = [v9 latestResults];
  id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v13 = HFLocalizedString();
  int v14 = [v12 isEqualToString:v13];

  if (v14)
  {
    id v15 = [(HUItemTableViewController *)self itemManager];
    id v16 = [v15 home];
    if ([v16 hasOnboardedForAccessCode])
    {
      v17 = [(HUItemTableViewController *)self itemManager];
      v18 = [v17 home];
      int v19 = [v18 accessories];
      int v20 = objc_msgSend(v19, "na_any:", &__block_literal_global_255);
    }
    else
    {
      int v20 = 0;
    }

    v32 = [HUAddPersonRoleViewController alloc];
    v33 = [(HUItemTableViewController *)self itemManager];
    v34 = [v33 home];
    v23 = [(HUAddPersonRoleViewController *)v32 initWithHome:v34];

    if (v20)
    {
      v35 = [(HUGuestsPinCodesViewController *)self pinCodeManager];
      [(HUAddPersonRoleViewController *)v23 setPinCodeManager:v35];
    }
    [(HUAddPersonRoleViewController *)v23 setPresentationDelegate:self];
    v29 = (HUEditUserViewController *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v23];
    [(HUEditUserViewController *)v29 setModalPresentationStyle:2];
    [(HUGuestsPinCodesViewController *)self presentViewController:v29 animated:1 completion:0];
    [v6 deselectRowAtIndexPath:v7 animated:1];
    goto LABEL_19;
  }
  v46.receiver = self;
  v46.super_class = (Class)HUGuestsPinCodesViewController;
  [(HUItemTableViewController *)&v46 tableView:v6 didSelectRowAtIndexPath:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v21 = v9;
    if (objc_opt_isKindOfClass()) {
      id v22 = v21;
    }
    else {
      id v22 = 0;
    }
    v23 = v22;

    if ([(HUGuestsPinCodesViewController *)self settingsContext])
    {
      if ([(HUGuestsPinCodesViewController *)self settingsContext] != 1)
      {
LABEL_20:

        goto LABEL_21;
      }
      v24 = [(HUAddPersonRoleViewController *)v23 user];
      objc_super v25 = [(HUItemTableViewController *)self itemManager];
      v26 = [v25 home];

      objc_initWeak((id *)buf, self);
      v27 = [(HUGuestsPinCodesViewController *)self pinCodeManager];
      v28 = [v27 userPinCodes];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __68__HUGuestsPinCodesViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
      v41[3] = &unk_1E6389E50;
      objc_copyWeak(&v45, (id *)buf);
      v29 = v24;
      v42 = v29;
      v43 = v23;
      id v30 = v26;
      id v44 = v30;
      id v31 = (id)[v28 addSuccessBlock:v41];

      objc_destroyWeak(&v45);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v36 = [HUEditUserViewController alloc];
      v37 = [(HUGuestsPinCodesViewController *)self pinCodeManager];
      v38 = [v37 home];
      v39 = [(HUGuestsPinCodesViewController *)self pinCodeManager];
      v29 = [(HUEditUserViewController *)v36 initWithItem:v23 home:v38 pinCodeManager:v39];

      id v30 = [(HUGuestsPinCodesViewController *)self navigationController];
      id v40 = (id)objc_msgSend(v30, "hu_pushPreloadableViewController:animated:", v29, 1);
    }

LABEL_19:
    goto LABEL_20;
  }
LABEL_21:
}

uint64_t __68__HUGuestsPinCodesViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsAccessCodes];
}

void __68__HUGuestsPinCodesViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__HUGuestsPinCodesViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
  v14[3] = &unk_1E6389E28;
  id v15 = *(id *)(a1 + 32);
  id v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v14);

  id v7 = *(id *)(a1 + 40);
  if (v6)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F693B0]) initWithPinCode:v6 inHome:*(void *)(a1 + 48) onAccessory:0];

    id v7 = (id)v8;
  }
  id v9 = [HUPinCodeDetailsViewController alloc];
  v10 = [WeakRetained pinCodeManager];
  v11 = [(HUPinCodeDetailsViewController *)v9 initWithItem:v7 pinCodeManager:v10 home:*(void *)(a1 + 48)];

  id v12 = [WeakRetained navigationController];
  id v13 = (id)objc_msgSend(v12, "hu_pushPreloadableViewController:animated:", v11, 1);
}

uint64_t __68__HUGuestsPinCodesViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 userLabel];
  id v4 = [v3 user];
  id v5 = [v4 uniqueIdentifier];
  id v6 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v7 = [v5 isEqual:v6];

  return v7;
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 conformsToProtocol:&unk_1F19E7BA8]) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  int v9 = [v8 requiresPresentingViewControllerDismissal];

  if (v9)
  {
    v10 = [(HUGuestsPinCodesViewController *)self presentationDelegate];
    v11 = [v10 finishPresentation:self animated:v4];
  }
  else
  {
    v11 = [(UIViewController *)self hu_dismissViewControllerAnimated:v4];
  }

  return v11;
}

- (HUPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->presentationDelegate);

  return (HUPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (unint64_t)settingsContext
{
  return self->_settingsContext;
}

- (void)setSettingsContext:(unint64_t)a3
{
  self->_settingsContext = a3;
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