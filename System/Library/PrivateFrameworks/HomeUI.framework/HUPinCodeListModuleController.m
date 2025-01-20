@interface HUPinCodeListModuleController
- (BOOL)canSelectItem:(id)a3;
- (BOOL)editing;
- (Class)cellClassForItem:(id)a3;
- (HUPinCodeDetailsViewController)addGuestViewController;
- (HUPinCodeListModuleController)initWithModule:(id)a3;
- (UIBarButtonItem)addButtonItem;
- (UIBarButtonItem)addGuestDoneButtonItem;
- (unint64_t)didSelectItem:(id)a3;
- (void)_switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)addGuestDoneButtonPressed:(id)a3;
- (void)cancelAddGuest:(id)a3;
- (void)hideSpinner;
- (void)itemSection:(id)a3 accessoryButtonPressedInHeader:(id)a4;
- (void)setAddButtonItem:(id)a3;
- (void)setAddGuestDoneButtonItem:(id)a3;
- (void)setAddGuestViewController:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)showSpinner;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUPinCodeListModuleController

- (HUPinCodeListModuleController)initWithModule:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUPinCodeListModuleController;
  v5 = [(HUItemModuleController *)&v10 initWithModule:v4];
  if (v5)
  {
    objc_opt_class();
    id v6 = v4;
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;

    [v8 setEditButtonHeaderDelegate:v5];
    [(HUPinCodeListModuleController *)v5 setEditing:0];
  }
  return v5;
}

- (Class)cellClassForItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUItemModuleController *)self module];
  uint64_t v6 = [v5 listType];

  v7 = [(HUItemModuleController *)self module];
  uint64_t v8 = [v7 addPinCodeItem];
  if ((id)v8 == v4)
  {
  }
  else
  {
    v9 = (void *)v8;
    objc_super v10 = [(HUItemModuleController *)self module];
    id v11 = [v10 revokePinCodeItem];

    if (v11 != v4)
    {
      v12 = [(HUItemModuleController *)self module];
      v13 = [v12 accessory];

      if (v13)
      {
        if ((v6 & 0xFFFFFFFFFFFFFFFDLL) != 1) {
          [(HUPinCodeListModuleController *)self editing];
        }
      }
    }
  }
  v14 = objc_opt_class();

  return (Class)v14;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v47 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v47 setAccessoryType:1];
    id v7 = v6;
    uint64_t v8 = [(HUItemModuleController *)self module];
    uint64_t v9 = [v8 listType];

    switch(v9)
    {
      case 1:
        objc_opt_class();
        id v30 = v47;
        if (objc_opt_isKindOfClass()) {
          v31 = v30;
        }
        else {
          v31 = 0;
        }
        id v11 = v31;

        v32 = [v7 latestResults];
        v33 = [v32 objectForKeyedSubscript:*MEMORY[0x1E4F68C78]];
        [v11 setUserHandle:v33];

        v34 = [(HUItemModuleController *)self module];
        v35 = [v34 accessory];

        if (v35) {
          [v30 setAccessoryType:0];
        }
        objc_opt_class();
        id v36 = v30;
        if (objc_opt_isKindOfClass()) {
          v37 = v36;
        }
        else {
          v37 = 0;
        }
        id v20 = v37;

        [v20 setDelegate:self];
        v38 = +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:v7];
        [v38 setPrefersSideBySideTextAndSecondaryText:0];
        [v36 setContentConfiguration:v38];
        v39 = [v7 latestResults];
        v40 = [v39 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
        [v36 setAccessibilityIdentifier:v40];

        goto LABEL_25;
      case 2:
      case 4:
        objc_super v10 = [MEMORY[0x1E4F42B58] cellConfiguration];
        id v11 = +[HUListContentConfigurationUtilities labelConfiguration:v10 forItem:v7];

        [v11 setPrefersSideBySideTextAndSecondaryText:0];
        v12 = _HULocalizedStringWithDefaultValue(@"HUPinCodeGuestAccessDescription", @"HUPinCodeGuestAccessDescription", 1);
        [v11 setSecondaryText:v12];

        v13 = [v11 imageProperties];
        objc_msgSend(v13, "setReservedLayoutSize:", 37.0, 37.0);

        v14 = [MEMORY[0x1E4F428B8] systemGray2Color];
        v15 = [v11 imageProperties];
        [v15 setTintColor:v14];

        [v11 setAxesPreservingSuperviewLayoutMargins:2];
        [v47 setContentConfiguration:v11];
        v16 = [v7 latestResults];
        v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
        [v47 setAccessibilityIdentifier:v17];

        objc_opt_class();
        id v18 = v47;
        if (objc_opt_isKindOfClass()) {
          v19 = v18;
        }
        else {
          v19 = 0;
        }
        id v20 = v19;

        [v20 setDelegate:self];
        goto LABEL_25;
      case 3:
        [v47 setAccessoryType:0];
        objc_opt_class();
        id v41 = v47;
        if (objc_opt_isKindOfClass()) {
          v42 = v41;
        }
        else {
          v42 = 0;
        }
        id v11 = v42;

        v43 = [v7 latestResults];
        v44 = [v43 objectForKeyedSubscript:*MEMORY[0x1E4F68C78]];
        [v11 setUserHandle:v44];

        id v20 = +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:v7];
        [v20 setPrefersSideBySideTextAndSecondaryText:0];
        [v41 setContentConfiguration:v20];
        v45 = [v7 latestResults];
        v46 = [v45 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
        [v41 setAccessibilityIdentifier:v46];

        goto LABEL_25;
      default:
        break;
    }
  }
  else
  {
    v21 = [(HUItemModuleController *)self module];
    uint64_t v22 = [v21 addPinCodeItem];
    if ((id)v22 == v6)
    {
    }
    else
    {
      v23 = (void *)v22;
      v24 = [(HUItemModuleController *)self module];
      id v25 = [v24 revokePinCodeItem];

      if (v25 != v6) {
        goto LABEL_27;
      }
    }
    id v7 = +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:v6];
    v26 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
    v27 = [v7 textProperties];
    [v27 setColor:v26];

    double v28 = *MEMORY[0x1E4F43BA0];
    v29 = [v7 imageProperties];
    objc_msgSend(v29, "setReservedLayoutSize:", 37.0, v28);

    [v47 setContentConfiguration:v7];
    id v11 = [v6 latestResults];
    id v20 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
    [v47 setAccessibilityIdentifier:v20];
LABEL_25:
  }
LABEL_27:
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v14 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v14;
    objc_opt_class();
    id v8 = v6;
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    id v11 = [v10 user];

    if (v11)
    {
      [v7 setDisabled:1];
      [v7 updateUIWithAnimation:0];
      v12 = [v8 latestResults];
      v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
      [v7 setAccessibilityIdentifier:v13];
    }
  }
}

- (BOOL)canSelectItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUItemModuleController *)self module];
  id v6 = [v5 addPinCodeItem];

  id v7 = [(HUItemModuleController *)self module];
  id v8 = [v7 revokePinCodeItem];

  BOOL result = 1;
  if (v6 != v4 && v8 != v4)
  {
    id v10 = [(HUItemModuleController *)self module];
    uint64_t v11 = [v10 accessory];
    if (v11)
    {
      v12 = (void *)v11;
      BOOL v13 = [(HUPinCodeListModuleController *)self editing];

      if (!v13) {
        return 0;
      }
    }
    else
    {
    }
    return 1;
  }
  return result;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUItemModuleController *)self module];
  id v6 = [v5 addPinCodeItem];

  id v7 = [(HUItemModuleController *)self module];
  id v8 = [v7 revokePinCodeItem];

  uint64_t v9 = [(HUItemModuleController *)self module];
  id v10 = [v9 accessory];

  if (v10 && v8 == v4)
  {
    [(HUPinCodeListModuleController *)self showSpinner];
    id v11 = [(HUItemModuleController *)self module];
    v12 = [v11 pinCodeManager];
    BOOL v13 = [v12 revokeAccessForAllRemovedUsers];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __47__HUPinCodeListModuleController_didSelectItem___block_invoke;
    v38[3] = &unk_1E63850B8;
    v38[4] = self;
    id v14 = (id)[v13 addCompletionBlock:v38];
  }
  else
  {
    v15 = [(HUItemModuleController *)self module];
    v16 = [v15 accessory];
    v17 = v16;
    if (!v16 || v6 == v4)
    {
    }
    else
    {
      BOOL v18 = [(HUPinCodeListModuleController *)self editing];

      if (!v18) {
        goto LABEL_17;
      }
    }
    objc_opt_class();
    id v19 = v4;
    if (objc_opt_isKindOfClass()) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }
    id v11 = v20;

    v21 = [HUPinCodeDetailsViewController alloc];
    uint64_t v22 = [(HUItemModuleController *)self module];
    v23 = [v22 pinCodeManager];
    v24 = [(HUItemModuleController *)self module];
    id v25 = [v24 home];
    if (v6 == v4)
    {
      v26 = [(HUPinCodeDetailsViewController *)v21 initWithItem:0 pinCodeManager:v23 home:v25];

      [(HUPinCodeDetailsViewController *)v26 setDelegate:self];
      double v28 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel_addGuestDoneButtonPressed_];
      [(HUPinCodeListModuleController *)self setAddGuestDoneButtonItem:v28];

      v29 = [(HUPinCodeListModuleController *)self addGuestDoneButtonItem];
      [v29 setEnabled:0];

      id v30 = [(HUPinCodeListModuleController *)self addGuestDoneButtonItem];
      v31 = [(HUPinCodeDetailsViewController *)v26 navigationItem];
      [v31 setRightBarButtonItem:v30];

      v32 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel_cancelAddGuest_];
      v33 = [(HUPinCodeDetailsViewController *)v26 navigationItem];
      [v33 setLeftBarButtonItem:v32];

      v34 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v26];
      [v34 setModalPresentationStyle:2];
      v27 = +[HUViewControllerPresentationRequest requestWithViewController:v34];
      [v27 setPreferredPresentationType:0];
      [(HUPinCodeListModuleController *)self setAddGuestViewController:v26];
    }
    else
    {
      v26 = [(HUPinCodeDetailsViewController *)v21 initWithItem:v11 pinCodeManager:v23 home:v25];

      v27 = +[HUViewControllerPresentationRequest requestWithViewController:v26];
      [v27 setPreferredPresentationType:1];
    }

    v35 = [(HUItemModuleController *)self host];
    id v36 = (id)[v35 moduleController:self presentViewControllerForRequest:v27];
  }
LABEL_17:

  return 0;
}

uint64_t __47__HUPinCodeListModuleController_didSelectItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideSpinner];
}

- (void)cancelAddGuest:(id)a3
{
  id v4 = [(HUPinCodeListModuleController *)self addGuestViewController];
  id v7 = +[HUViewControllerDismissalRequest requestWithViewController:v4];

  v5 = [(HUItemModuleController *)self host];
  id v6 = (id)[v5 moduleController:self dismissViewControllerForRequest:v7];

  [(HUPinCodeListModuleController *)self setAddGuestViewController:0];
}

- (void)addGuestDoneButtonPressed:(id)a3
{
  id v4 = [(HUPinCodeListModuleController *)self addGuestViewController];
  v5 = [v4 commitNewPinCode];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__HUPinCodeListModuleController_addGuestDoneButtonPressed___block_invoke;
  v7[3] = &unk_1E63856C0;
  v7[4] = self;
  id v6 = (id)[v5 addCompletionBlock:v7];
}

void __59__HUPinCodeListModuleController_addGuestDoneButtonPressed___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = [*(id *)(a1 + 32) addGuestViewController];
  id v6 = +[HUViewControllerDismissalRequest requestWithViewController:v5];

  if (v4)
  {
    id v7 = [MEMORY[0x1E4F69110] sharedHandler];
    uint64_t v8 = *MEMORY[0x1E4F68750];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__HUPinCodeListModuleController_addGuestDoneButtonPressed___block_invoke_2;
    v13[3] = &unk_1E6386340;
    id v9 = v4;
    uint64_t v10 = *(void *)(a1 + 32);
    id v14 = v9;
    uint64_t v15 = v10;
    id v16 = v6;
    [v7 handleError:v9 operationType:v8 options:0 retryBlock:0 cancelBlock:v13];
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) host];
    id v12 = (id)[v11 moduleController:*(void *)(a1 + 32) dismissViewControllerForRequest:v6];

    [*(id *)(a1 + 32) setAddGuestViewController:0];
  }
}

void __59__HUPinCodeListModuleController_addGuestDoneButtonPressed___block_invoke_2(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) domain];
  if ([v6 isEqualToString:*MEMORY[0x1E4F68410]])
  {
    uint64_t v2 = [*(id *)(a1 + 32) code];

    if (v2 == 80)
    {
      v3 = [*(id *)(a1 + 40) host];
      id v4 = (id)[v3 moduleController:*(void *)(a1 + 40) dismissViewControllerForRequest:*(void *)(a1 + 48)];

      v5 = *(void **)(a1 + 40);
      [v5 setAddGuestViewController:0];
    }
  }
  else
  {
  }
}

- (UIBarButtonItem)addButtonItem
{
  uint64_t v2 = [(HUPinCodeListModuleController *)self addGuestViewController];
  v3 = [v2 navigationItem];
  id v4 = [v3 rightBarButtonItem];

  return (UIBarButtonItem *)v4;
}

- (void)setAddButtonItem:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(HUPinCodeListModuleController *)self addGuestDoneButtonItem];
  }
  id v7 = v4;
  v5 = [(HUPinCodeListModuleController *)self addGuestViewController];
  id v6 = [v5 navigationItem];
  [v6 setRightBarButtonItem:v7];
}

- (void)showSpinner
{
  v3 = [(HUItemModuleController *)self host];
  id v7 = [v3 presentingViewControllerForModuleController:self];

  if (v7)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v4];
    id v6 = [v7 navigationItem];
    [v6 setRightBarButtonItem:v5];

    [v4 startAnimating];
  }
}

- (void)hideSpinner
{
  v3 = [(HUItemModuleController *)self host];
  id v10 = [v3 presentingViewControllerForModuleController:self];

  objc_opt_class();
  id v4 = [v10 navigationItem];
  v5 = [v4 rightBarButtonItem];
  id v6 = [v5 customView];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = [v10 navigationItem];
    [v9 setRightBarButtonItem:0];

    [v8 stopAnimating];
  }
}

- (void)_switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(HUPinCodeListModuleController *)self showSpinner];
  objc_opt_class();
  id v7 = [v6 item];

  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = [(HUItemModuleController *)self module];
  id v11 = [v10 pinCodeManager];
  id v12 = [(HUItemModuleController *)self module];
  BOOL v13 = [v12 accessory];
  v18[0] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  uint64_t v15 = [v11 setPinCodeWithItem:v9 enabled:v4 onAccessories:v14];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__HUPinCodeListModuleController__switchCell_didTurnOn___block_invoke;
  v17[3] = &unk_1E638E798;
  v17[4] = self;
  id v16 = (id)[v15 addCompletionBlock:v17];
}

void __55__HUPinCodeListModuleController__switchCell_didTurnOn___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) hideSpinner];
  if (v5)
  {
    BOOL v4 = [MEMORY[0x1E4F69110] sharedHandler];
    [v4 handleError:v5 operationType:*MEMORY[0x1E4F68830] options:0 retryBlock:0 cancelBlock:0];
  }
}

- (void)itemSection:(id)a3 accessoryButtonPressedInHeader:(id)a4
{
  id v5 = a4;
  [(HUPinCodeListModuleController *)self setEditing:[(HUPinCodeListModuleController *)self editing] ^ 1];
  objc_opt_class();
  id v6 = [(HUItemModuleController *)self host];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  objc_opt_class();
  id v9 = [v8 itemManager];

  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  id v12 = (void *)MEMORY[0x1E4F1CA48];
  BOOL v13 = [(HUItemModuleController *)self module];
  id v14 = [v13 pinCodeItemProvider];
  uint64_t v15 = [v14 items];
  id v16 = [v15 allObjects];
  v17 = [v12 arrayWithArray:v16];

  BOOL v18 = [v11 transformedGuestUserItemProvider];

  id v19 = [v18 items];
  id v20 = [v19 allObjects];
  [v17 addObjectsFromArray:v20];

  v21 = [(HUItemModuleController *)self host];
  [v21 reloadCellForItems:v17 withDiffableDataSourceReload:1];

  objc_opt_class();
  id v25 = v5;
  if (objc_opt_isKindOfClass()) {
    uint64_t v22 = v25;
  }
  else {
    uint64_t v22 = 0;
  }
  id v23 = v22;

  [(HUPinCodeListModuleController *)self editing];
  v24 = HFLocalizedString();
  [v23 setOverrideAccessoryButtonTitle:v24];
  [v23 setAccessibilityIdentifier:@"Home.Locks.PinCode.EditDoneButton"];
  [v23 updateUIWithAnimation:1];
}

- (BOOL)editing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (HUPinCodeDetailsViewController)addGuestViewController
{
  return self->_addGuestViewController;
}

- (void)setAddGuestViewController:(id)a3
{
}

- (UIBarButtonItem)addGuestDoneButtonItem
{
  return self->_addGuestDoneButtonItem;
}

- (void)setAddGuestDoneButtonItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addGuestDoneButtonItem, 0);

  objc_storeStrong((id *)&self->_addGuestViewController, 0);
}

@end