@interface HUAddPersonRoleViewController
- (BOOL)_disableAddPinCode;
- (BOOL)shouldShowPinCodeRoleOption;
- (BOOL)shouldShowRestrictedGuestRoleOption;
- (HFPinCodeManager)pinCodeManager;
- (HMHome)home;
- (HUAddPersonRoleViewController)initWithHome:(id)a3;
- (HUAddPersonRoleViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (HUAddPersonRoleViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (HUAddPersonRoleViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (HUPresentationDelegate)presentationDelegate;
- (id)finishPresentation:(id)a3 animated:(BOOL)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancelButtonPressed:(id)a3;
- (void)didSelectPeopleForInvite:(id)a3 inviteeAddresses:(id)a4;
- (void)setHome:(id)a3;
- (void)setPinCodeManager:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation HUAddPersonRoleViewController

- (HUAddPersonRoleViewController)initWithHome:(id)a3
{
  id v4 = a3;
  v5 = _HULocalizedStringWithDefaultValue(@"HUAddPersonRoleTitle", @"HUAddPersonRoleTitle", 1);
  v6 = _HULocalizedStringWithDefaultValue(@"HUAddPersonRoleSubtitle", @"HUAddPersonRoleSubtitle", 1);
  if (objc_msgSend(v4, "hf_canAddRestrictedGuest"))
  {
    uint64_t v7 = _HULocalizedStringWithDefaultValue(@"HUAddPersonRole_Title", @"HUAddPersonRole_Title", 1);

    uint64_t v8 = _HULocalizedStringWithDefaultValue(@"HUAddPersonRole_Subtitle", @"HUAddPersonRole_Subtitle", 1);

    v5 = (void *)v7;
    v6 = (void *)v8;
  }
  v28.receiver = self;
  v28.super_class = (Class)HUAddPersonRoleViewController;
  v9 = [(OBTableWelcomeController *)&v28 initWithTitle:v5 detailText:v6 symbolName:0];
  v10 = v9;
  if (v9)
  {
    [(HUAddPersonRoleViewController *)v9 setHome:v4];
    v11 = [(HUAddPersonRoleViewController *)v10 headerView];
    [v11 setTitleAccessibilityIdentifier:@"Home.Users.AddPerson.ChooseRole.Title"];

    v12 = [(HUAddPersonRoleViewController *)v10 headerView];
    [v12 setDetailTextAccessibilityIdentifier:@"Home.Users.AddPerson.ChooseRole.Subtitle"];

    id v13 = objc_alloc(MEMORY[0x1E4F42E98]);
    v14 = objc_msgSend(v13, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(OBTableWelcomeController *)v10 setTableView:v14];

    v15 = [(OBTableWelcomeController *)v10 tableView];
    [v15 setDataSource:v10];

    v16 = [(OBTableWelcomeController *)v10 tableView];
    [v16 setDelegate:v10];

    v17 = [(OBTableWelcomeController *)v10 tableView];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

    v18 = [MEMORY[0x1E4F428B8] clearColor];
    v19 = [(OBTableWelcomeController *)v10 tableView];
    [v19 setBackgroundColor:v18];

    v20 = [(OBTableWelcomeController *)v10 tableView];
    [v20 registerClass:objc_opt_class() forCellReuseIdentifier:@"HUAddPersonRoleCell"];

    v21 = [(OBTableWelcomeController *)v10 tableView];
    v22 = [v21 bottomAnchor];
    v23 = [(HUAddPersonRoleViewController *)v10 view];
    v24 = [v23 layoutMarginsGuide];
    v25 = [v24 bottomAnchor];
    v26 = [v22 constraintEqualToAnchor:v25];
    [v26 setActive:1];
  }
  return v10;
}

- (HUAddPersonRoleViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  uint64_t v8 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAddPersonRoleViewController.m", 75, @"%s is unavailable; use %@ instead",
    "-[HUAddPersonRoleViewController initWithTitle:detailText:icon:]",
    v8);

  return 0;
}

- (HUAddPersonRoleViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  v9 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAddPersonRoleViewController.m", 80, @"%s is unavailable; use %@ instead",
    "-[HUAddPersonRoleViewController initWithTitle:detailText:icon:adoptTableViewScrollView:]",
    v9);

  return 0;
}

- (HUAddPersonRoleViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  v9 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAddPersonRoleViewController.m", 85, @"%s is unavailable; use %@ instead",
    "-[HUAddPersonRoleViewController initWithTitle:detailText:symbolName:adoptTableViewScrollView:]",
    v9);

  return 0;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)HUAddPersonRoleViewController;
  [(OBTableWelcomeController *)&v7 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonPressed_];
  id v4 = [(OBBaseWelcomeController *)self navigationItem];
  [v4 setLeftBarButtonItem:v3];

  v5 = [(OBBaseWelcomeController *)self navigationItem];
  v6 = [v5 leftBarButtonItem];
  [v6 setAccessibilityIdentifier:@"Home.Users.AddPerson.CancelButton"];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(HUAddPersonRoleViewController *)self shouldShowPinCodeRoleOption]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 1;
  }
  if ([(HUAddPersonRoleViewController *)self shouldShowRestrictedGuestRoleOption])
  {
    return 2;
  }
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a3 dequeueReusableCellWithIdentifier:@"HUAddPersonRoleCell"];
  uint64_t v8 = [MEMORY[0x1E4F42B58] subtitleCellConfiguration];
  if ([v6 section])
  {
    if ([v6 section] == 1)
    {
      v9 = _HULocalizedStringWithDefaultValue(@"HUAddPersonPinGuestTitle", @"HUAddPersonPinGuestTitle", 1);
      [v8 setText:v9];

      v10 = _HULocalizedStringWithDefaultValue(@"HUAddPersonPinGuestSubitle", @"HUAddPersonPinGuestSubitle", 1);
      [v8 setSecondaryText:v10];

      [v7 setAccessibilityIdentifier:@"Home.Users.AddPerson.PinCodeGuest"];
      if ([(HUAddPersonRoleViewController *)self shouldShowRestrictedGuestRoleOption])
      {
        v11 = _HULocalizedStringWithDefaultValue(@"HUAddPersonRole_PinCode_Title", @"HUAddPersonRole_PinCode_Title", 1);
        [v8 setText:v11];

        [v8 setSecondaryText:0];
        v12 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"number"];
        [v8 setImage:v12];

        id v13 = [MEMORY[0x1E4F428B8] systemGrayColor];
        v14 = [v8 imageProperties];
        [v14 setTintColor:v13];

        [v7 setAccessibilityIdentifier:@"Home.Users.AddPerson.PincodeAccess"];
      }
      if ([(HUAddPersonRoleViewController *)self _disableAddPinCode])
      {
        v15 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
        v16 = [v8 textProperties];
        [v16 setColor:v15];
      }
    }
  }
  else
  {
    if ([v6 row])
    {
      if ([v6 row] != 1) {
        goto LABEL_13;
      }
      v17 = _HULocalizedStringWithDefaultValue(@"HUAddPersonRole_RestrictedGuest_Title", @"HUAddPersonRole_RestrictedGuest_Title", 1);
      [v8 setText:v17];

      v18 = _HULocalizedStringWithDefaultValue(@"HUAddPersonRole_RestrictedGuest_Subtitle", @"HUAddPersonRole_RestrictedGuest_Subtitle", 1);
      [v8 setSecondaryText:v18];

      v19 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"person"];
      [v8 setImage:v19];

      v20 = @"Home.Users.AddPerson.Guest";
    }
    else
    {
      v21 = _HULocalizedStringWithDefaultValue(@"HUAddPersonResidentTitle", @"HUAddPersonResidentTitle", 1);
      [v8 setText:v21];

      v22 = _HULocalizedStringWithDefaultValue(@"HUAddPersonResidentSubitle", @"HUAddPersonResidentSubitle", 1);
      [v8 setSecondaryText:v22];

      if (![(HUAddPersonRoleViewController *)self shouldShowRestrictedGuestRoleOption])goto LABEL_13; {
      v23 = _HULocalizedStringWithDefaultValue(@"HUAddPersonRole_Resident_Subtitle", @"HUAddPersonRole_Resident_Subtitle", 1);
      }
      [v8 setSecondaryText:v23];

      v24 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"house.fill"];
      [v8 setImage:v24];

      v20 = @"Home.Users.AddPerson.Resident";
    }
    [v7 setAccessibilityIdentifier:v20];
  }
LABEL_13:
  v25 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  v26 = [v8 secondaryTextProperties];
  [v26 setColor:v25];

  [v8 setAxesPreservingSuperviewLayoutMargins:3];
  [v7 setContentConfiguration:v8];
  [v7 setAccessoryType:1];
  v27 = [MEMORY[0x1E4F427B0] listGroupedCellConfiguration];
  objc_super v28 = [MEMORY[0x1E4F428B8] tertiarySystemGroupedBackgroundColor];
  [v27 setBackgroundColor:v28];

  [v7 setBackgroundConfiguration:v27];

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 == 1)
  {
    if ([(HUAddPersonRoleViewController *)self _disableAddPinCode])
    {
      id v6 = _HULocalizedStringWithDefaultValue(@"HUAddPersonPinGuestSectionHeaderDisabled", @"HUAddPersonPinGuestSectionHeaderDisabled", 1);
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4 == 1 && [(HUAddPersonRoleViewController *)self _disableAddPinCode])
  {
    uint64_t v5 = _HULocalizedStringWithDefaultValue(@"HUAddPersonPinGuestFooterDisabled", @"HUAddPersonPinGuestFooterDisabled", 1);
    if ([(HUAddPersonRoleViewController *)self shouldShowRestrictedGuestRoleOption])
    {
      uint64_t v6 = _HULocalizedStringWithDefaultValue(@"HUAddPersonRole_PinCode_Disabled_Footer", @"HUAddPersonRole_PinCode_Disabled_Footer", 1);

      uint64_t v5 = (void *)v6;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 section];
  objc_super v7 = v5;
  if (v6 == 1)
  {
    if ([(HUAddPersonRoleViewController *)self _disableAddPinCode]) {
      objc_super v7 = 0;
    }
    else {
      objc_super v7 = v5;
    }
  }
  id v8 = v7;

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (![v5 section])
  {
    if (![v5 row])
    {
      v9 = [(HUAddPersonRoleViewController *)self navigationController];
      v10 = [(HUAddPersonRoleViewController *)self home];
      +[HUAddPeopleViewController presentAddPersonOrAlertForHH2Upgrade:v9 withHome:v10 viewContext:0 delegate:0 presentationDelegate:self];
      v12 = @"HUAddPersonRoleSectionUser - HUUserSectionRowResident";
      goto LABEL_9;
    }
    if ([v5 row] == 1)
    {
      v9 = [(HUAddPersonRoleViewController *)self navigationController];
      v10 = [(HUAddPersonRoleViewController *)self home];
      +[HUAddPeopleViewController presentAddPersonOrAlertForHH2Upgrade:v9 withHome:v10 viewContext:1 delegate:self presentationDelegate:self];
      v12 = @"HUAddPersonRoleSectionUser - HUUserSectionRowRestrictedGuest";
      goto LABEL_9;
    }
LABEL_7:
    v12 = &stru_1F18F92B8;
    goto LABEL_10;
  }
  if ([v5 section] != 1) {
    goto LABEL_7;
  }
  uint64_t v6 = [HUAddGuestViewController alloc];
  objc_super v7 = [(HUAddPersonRoleViewController *)self pinCodeManager];
  id v8 = [(HUAddPersonRoleViewController *)self home];
  v9 = [(HUAddGuestViewController *)v6 initWithPinCodeManager:v7 home:v8];

  [(HUAddGuestViewController *)v9 setPresentationDelegate:self];
  v10 = [(HUAddPersonRoleViewController *)self navigationController];
  id v11 = (id)objc_msgSend(v10, "hu_pushPreloadableViewController:animated:", v9, 1);
  v12 = @"HUAddPersonRoleSectionPinCode";
LABEL_9:

LABEL_10:
  id v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    v15 = "-[HUAddPersonRoleViewController tableView:didSelectRowAtIndexPath:]";
    __int16 v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "(%s) User selected %@", (uint8_t *)&v14, 0x16u);
  }
}

- (void)cancelButtonPressed:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    objc_super v7 = "-[HUAddPersonRoleViewController cancelButtonPressed:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'cancel' button %@", (uint8_t *)&v6, 0x16u);
  }

  [(HUAddPersonRoleViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)shouldShowRestrictedGuestRoleOption
{
  v2 = [(HUAddPersonRoleViewController *)self home];
  char v3 = objc_msgSend(v2, "hf_canAddRestrictedGuest");

  return v3;
}

- (BOOL)shouldShowPinCodeRoleOption
{
  v2 = [(HUAddPersonRoleViewController *)self home];
  char v3 = objc_msgSend(v2, "hf_canAddAccessCode");

  return v3;
}

- (BOOL)_disableAddPinCode
{
  char v3 = [(HUAddPersonRoleViewController *)self home];
  id v4 = objc_msgSend(v3, "hf_accessoriesSupportingAccessCodes");
  char v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_197);

  if (v5)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    objc_super v7 = [(HUAddPersonRoleViewController *)self home];
    int v6 = objc_msgSend(v7, "hf_hasEnabledResident") ^ 1;
  }
  return v6;
}

uint64_t __51__HUAddPersonRoleViewController__disableAddPinCode__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isDirectlyReachable");
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 conformsToProtocol:&unk_1F19E7BA8]) {
    objc_super v7 = v6;
  }
  else {
    objc_super v7 = 0;
  }
  id v8 = v7;
  int v9 = [v8 requiresPresentingViewControllerDismissal];

  if (v9)
  {
    uint64_t v10 = [(HUAddPersonRoleViewController *)self presentationDelegate];
    id v11 = [v10 finishPresentation:self animated:v4];
  }
  else
  {
    id v11 = [(UIViewController *)self hu_dismissViewControllerAnimated:v4];
  }

  return v11;
}

- (void)didSelectPeopleForInvite:(id)a3 inviteeAddresses:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  objc_super v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v14 = 138412546;
    v15 = self;
    __int16 v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ User did select people to invite. Continuing with restricted guest flow.", (uint8_t *)&v14, 0x16u);
  }
  int v9 = [HUAddRestrictedGuestViewController alloc];
  uint64_t v10 = [(HUAddPersonRoleViewController *)self home];
  id v11 = [(HUAddRestrictedGuestViewController *)v9 initWithHome:v10 inviteeAddresses:v6];

  [(HUAddRestrictedGuestViewController *)v11 setPresentationDelegate:self];
  v12 = [(HUAddPersonRoleViewController *)self navigationController];
  id v13 = (id)objc_msgSend(v12, "hu_pushPreloadableViewController:animated:", v11, 1);
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
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);

  objc_destroyWeak((id *)&self->presentationDelegate);
}

@end