@interface HUAddRestrictedGuestViewController
- (BOOL)requiresPresentingViewControllerDismissal;
- (HUAddRestrictedGuestTableViewController)restrictedGuestTableViewController;
- (HUAddRestrictedGuestViewController)initWithHome:(id)a3 inviteeAddresses:(id)a4;
- (HUPresentationDelegate)presentationDelegate;
- (UIBarButtonItem)addButtonItem;
- (UIBarButtonItem)saveButtonItem;
- (id)_contactForAddress:(id)a3;
- (id)_requiredContactKeyDescriptors;
- (id)_servicesAllowingToRGWithNotificationOff;
- (void)restrictedGuestItemManager:(id)a3 didFailToSendInvitations:(id)a4;
- (void)restrictedGuestItemManager:(id)a3 didSendInvitations:(id)a4;
- (void)saveButtonPressed:(id)a3;
- (void)setAddButtonItem:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3;
- (void)setRestrictedGuestTableViewController:(id)a3;
- (void)setSaveButtonItem:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUAddRestrictedGuestViewController

- (HUAddRestrictedGuestViewController)initWithHome:(id)a3 inviteeAddresses:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if (![v7 count])
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HUAddRestrictedGuestViewController.m", 32, @"Invalid parameter not satisfying: %@", @"inviteeAddresses.count > 0" object file lineNumber description];
  }
  v9 = [[HUAddRestrictedGuestTableViewController alloc] initWithItem:0 home:v8 inviteeAddresses:v7];

  v10 = _HULocalizedStringWithDefaultValue(@"HUAddRestrictedGuest_Subtitle", @"HUAddRestrictedGuest_Subtitle", 1);
  v11 = _HULocalizedStringWithDefaultValue(@"HUAddRestrictedGuest_Title", @"HUAddRestrictedGuest_Title", 1);
  v18.receiver = self;
  v18.super_class = (Class)HUAddRestrictedGuestViewController;
  v12 = [(HUItemTableOBWelcomeController *)&v18 initWithTitle:v11 detailText:v10 icon:0 contentLayout:3 itemTableViewController:v9];

  if (v12)
  {
    v13 = [(HUAddRestrictedGuestViewController *)v12 headerView];
    [v13 setTitleAccessibilityIdentifier:@"Home.Users.AddGuest.CustomizeAccess.Title"];

    v14 = [(HUAddRestrictedGuestViewController *)v12 headerView];
    [v14 setDetailTextAccessibilityIdentifier:@"Home.Users.AddGuest.CustomizeAccess.Subtitle"];

    objc_storeStrong((id *)&v12->_restrictedGuestTableViewController, v9);
    [(HUAddRestrictedGuestTableViewController *)v12->_restrictedGuestTableViewController setDelegate:v12];
    v15 = [(HUAddRestrictedGuestTableViewController *)v12->_restrictedGuestTableViewController restrictedGuestItemManager];
    [v15 setRestrictedGuestDelegate:v12];
  }
  return v12;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)HUAddRestrictedGuestViewController;
  [(HUItemTableOBWelcomeController *)&v11 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4F427C0]);
  v4 = _HULocalizedStringWithDefaultValue(@"HUAddRestrictedGuest_InviteButton", @"HUAddRestrictedGuest_InviteButton", 1);
  v5 = (void *)[v3 initWithTitle:v4 style:2 target:self action:sel_saveButtonPressed_];
  [(HUAddRestrictedGuestViewController *)self setSaveButtonItem:v5];

  v6 = [(HUAddRestrictedGuestViewController *)self saveButtonItem];
  [v6 setEnabled:0];

  id v7 = [(HUAddRestrictedGuestViewController *)self saveButtonItem];
  id v8 = [(OBBaseWelcomeController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];

  v9 = [(OBBaseWelcomeController *)self navigationItem];
  v10 = [v9 rightBarButtonItem];
  [v10 setAccessibilityIdentifier:@"Home.Users.AddGuest.NavigationBar.InviteButton"];
}

- (UIBarButtonItem)addButtonItem
{
  v2 = [(OBBaseWelcomeController *)self navigationItem];
  id v3 = [v2 rightBarButtonItem];

  return (UIBarButtonItem *)v3;
}

- (void)setAddButtonItem:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(HUAddRestrictedGuestViewController *)self saveButtonItem];
  }
  id v6 = v4;
  v5 = [(OBBaseWelcomeController *)self navigationItem];
  [v5 setRightBarButtonItem:v6];
}

- (void)saveButtonPressed:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v58 = "-[HUAddRestrictedGuestViewController saveButtonPressed:]";
    __int16 v59 = 2112;
    *(void *)v60 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) '%@' button tapped.", buf, 0x16u);
  }

  v45 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v45];
  id v6 = [(OBBaseWelcomeController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  [v45 startAnimating];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__HUAddRestrictedGuestViewController_saveButtonPressed___block_invoke;
  aBlock[3] = &unk_1E63862A0;
  objc_copyWeak(&v55, &location);
  id v7 = _Block_copy(aBlock);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __56__HUAddRestrictedGuestViewController_saveButtonPressed___block_invoke_33;
  v51[3] = &unk_1E63862C8;
  objc_copyWeak(&v53, &location);
  id v43 = v7;
  id v52 = v43;
  v44 = (void (**)(void))_Block_copy(v51);
  id v8 = [(HUAddRestrictedGuestViewController *)self restrictedGuestTableViewController];
  v46 = [v8 rgHomeAccessSettings];

  v9 = [v46 locksWithReducedFunctionalityDueToSchedule];
  uint64_t v10 = [v9 count];

  objc_super v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v42 = v3;
    uint64_t v12 = [v46 guestAccessSchedule];
    v13 = (void *)v12;
    if (v12) {
      v14 = (__CFString *)v12;
    }
    else {
      v14 = @"Always allowed";
    }
    v15 = (void *)MEMORY[0x1E4F2E4F8];
    v16 = [v46 locksWithReducedFunctionalityDueToSchedule];
    v17 = [v16 allObjects];
    objc_msgSend(v15, "hf_minimumDescriptionsOfAccessories:", v17);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E4F2E4F8];
    v20 = [v46 accessAllowedToAccessories];
    v21 = [v20 allObjects];
    v22 = objc_msgSend(v19, "hf_minimumDescriptionsOfAccessories:", v21);
    *(_DWORD *)buf = 136316162;
    v58 = "-[HUAddRestrictedGuestViewController saveButtonPressed:]";
    __int16 v59 = 1024;
    *(_DWORD *)v60 = v10 != 0;
    *(_WORD *)&v60[4] = 2112;
    *(void *)&v60[6] = v14;
    __int16 v61 = 2112;
    id v62 = v18;
    __int16 v63 = 2112;
    v64 = v22;
    _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "(%s) shouldShowLockScheduleAlert = %{BOOL}d | rgSchedule = %@ | locksWithReducedFunct = %@ | allowedAccessories = %@", buf, 0x30u);

    id v3 = v42;
  }

  if (v10)
  {
    v23 = [v46 accessAllowedToAccessories];
    v24 = objc_msgSend(v23, "na_filter:", &__block_literal_global_284);

    v25 = [(HUAddRestrictedGuestViewController *)self restrictedGuestTableViewController];
    v26 = [v25 restrictedGuestItemManager];
    v27 = [v26 inviteeAddresses];
    BOOL v28 = [v27 count] == 1;

    if (v28) {
      v29 = @"%@_SingleGuest";
    }
    else {
      v29 = @"%@_PluralGuests";
    }
    v30 = objc_msgSend(NSString, "stringWithFormat:", v29, @"HURestrictedGuest_LocksWithReducedFunctionalityDueToSchedule_Alert");
    if ([v24 count] == 1) {
      v31 = @"%@_SingleLock";
    }
    else {
      v31 = @"%@_PluralLocks";
    }
    v32 = objc_msgSend(NSString, "stringWithFormat:", v31, v30);

    v33 = (void *)MEMORY[0x1E4F42728];
    v34 = _HULocalizedStringWithDefaultValue(v32, v32, 1);
    v35 = [v33 alertControllerWithTitle:&stru_1F18F92B8 message:v34 preferredStyle:1];

    v36 = (void *)MEMORY[0x1E4F42720];
    v37 = _HULocalizedStringWithDefaultValue(@"HUContinueTitle", @"HUContinueTitle", 1);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __56__HUAddRestrictedGuestViewController_saveButtonPressed___block_invoke_2;
    v49[3] = &unk_1E638B2B8;
    v50 = v44;
    v38 = [v36 actionWithTitle:v37 style:0 handler:v49];

    [v38 setAccessibilityIdentifier:@"Home.AddGuest.ReducedFunctionality.Alert.ContinueButton"];
    [v35 addAction:v38];
    v39 = (void *)MEMORY[0x1E4F42720];
    v40 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __56__HUAddRestrictedGuestViewController_saveButtonPressed___block_invoke_77;
    v48[3] = &unk_1E6385188;
    v48[4] = self;
    v41 = [v39 actionWithTitle:v40 style:0 handler:v48];

    [v41 setAccessibilityIdentifier:@"Home.AddGuest.ReducedFunctionality.Alert.CancelButton"];
    [v35 addAction:v41];
    [(HUAddRestrictedGuestViewController *)self presentViewController:v35 animated:1 completion:&__block_literal_global_83_2];
  }
  else
  {
    v44[2]();
  }

  objc_destroyWeak(&v53);
  objc_destroyWeak(&v55);
  objc_destroyWeak(&location);
}

void __56__HUAddRestrictedGuestViewController_saveButtonPressed___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [WeakRetained restrictedGuestTableViewController];
    id v4 = [v3 restrictedGuestItemManager];
    v5 = [v4 inviteeAddresses];
    int v7 = 136315394;
    id v8 = "-[HUAddRestrictedGuestViewController saveButtonPressed:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(%s) Sending invitation. Start sending invitation %@", (uint8_t *)&v7, 0x16u);
  }
  id v6 = [WeakRetained restrictedGuestTableViewController];
  [v6 sendInvites];
}

void __56__HUAddRestrictedGuestViewController_saveButtonPressed___block_invoke_33(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained _servicesAllowingToRGWithNotificationOff];
  uint64_t v4 = [v3 count];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"Presenting";
    int v8 = 136315650;
    __int16 v9 = "-[HUAddRestrictedGuestViewController saveButtonPressed:]_block_invoke";
    __int16 v10 = 2112;
    if (!v4) {
      id v6 = @"NOT presenting";
    }
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(%s) %@ notification alert because services allowed to RG with notification Off = %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v4) {
    objc_msgSend(WeakRetained, "hu_presentNotificationAlertForNotificationCapableObjects:notificationsEnabled:mainActionBlock:notNowActionBlock:", v3, 1, v7, *(void *)(a1 + 32));
  }
  else {
    (*(void (**)(void))(v7 + 16))(*(void *)(a1 + 32));
  }
}

uint64_t __56__HUAddRestrictedGuestViewController_saveButtonPressed___block_invoke_47(uint64_t a1, void *a2)
{
  v2 = [a2 category];
  id v3 = [v2 categoryType];
  uint64_t v4 = [v3 isEqualToString:*MEMORY[0x1E4F2C1B0]];

  return v4;
}

uint64_t __56__HUAddRestrictedGuestViewController_saveButtonPressed___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[HUAddRestrictedGuestViewController saveButtonPressed:]_block_invoke_2";
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'Continue' button about the limit for wallet key and pin code due to RG's schedule.", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__HUAddRestrictedGuestViewController_saveButtonPressed___block_invoke_77(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[HUAddRestrictedGuestViewController saveButtonPressed:]_block_invoke";
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'cancel' button about the limit for wallet key and pin code due to RG's schedule. NOT sending invitation.", (uint8_t *)&v5, 0xCu);
  }

  id v3 = [*(id *)(a1 + 32) saveButtonItem];
  int v4 = [*(id *)(a1 + 32) navigationItem];
  [v4 setRightBarButtonItem:v3];
}

void __56__HUAddRestrictedGuestViewController_saveButtonPressed___block_invoke_81()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = HFLogForCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[HUAddRestrictedGuestViewController saveButtonPressed:]_block_invoke";
    _os_log_impl(&dword_1BE345000, v0, OS_LOG_TYPE_DEFAULT, "(%s) Displayed alert about wallet key and pin code limits when updating schedule", (uint8_t *)&v1, 0xCu);
  }
}

- (id)_servicesAllowingToRGWithNotificationOff
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HUAddRestrictedGuestViewController *)self restrictedGuestTableViewController];
  int v4 = [v3 accessoriesToAllowToRG];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = [(HUAddRestrictedGuestViewController *)self restrictedGuestTableViewController];
    int v8 = [v7 accessoriesToAllowToRG];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "hf_servicesWithBulletinBoardNotificationTurnedOff");
          [v6 na_safeAddObjectsFromArray:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v29 count:16];
      }
      while (v10);
    }

    uint64_t v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(HUAddRestrictedGuestViewController *)self restrictedGuestTableViewController];
      v16 = [v15 accessoriesToAllowToRG];
      *(_DWORD *)buf = 136315650;
      v24 = "-[HUAddRestrictedGuestViewController _servicesAllowingToRGWithNotificationOff]";
      __int16 v25 = 2112;
      v26 = v16;
      __int16 v27 = 2112;
      BOOL v28 = v6;
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "(%s) Creating invitation that allows access to RG for %@. Among these accessories, services with notifications turned off: %@", buf, 0x20u);
    }
    id v17 = [v6 copy];
  }
  else
  {
    uint64_t v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[HUAddRestrictedGuestViewController _servicesAllowingToRGWithNotificationOff]";
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "(%s) No accessories to be allowed for restricted guest in this invitation.", buf, 0xCu);
    }
    id v17 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v17;
}

- (id)_contactForAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUAddRestrictedGuestViewController *)self _requiredContactKeyDescriptors];
  if (objc_msgSend(v4, "hf_isPhoneNumber"))
  {
    uint64_t v6 = [MEMORY[0x1E4F69088] contactForPhoneNumber:v4 keyDescriptors:v5];
LABEL_5:
    uint64_t v7 = (void *)v6;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "hf_isEmail"))
  {
    uint64_t v6 = [MEMORY[0x1E4F69088] contactForEmailAddress:v4 keyDescriptors:v5];
    goto LABEL_5;
  }
  uint64_t v7 = 0;
LABEL_7:

  return v7;
}

- (id)_requiredContactKeyDescriptors
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (void)restrictedGuestItemManager:(id)a3 didSendInvitations:(id)a4
{
  uint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "The invitations were successfully sent. Attempting to dismiss invite flow.", v8, 2u);
  }

  [(HUAddRestrictedGuestViewController *)self setRequiresPresentingViewControllerDismissal:1];
  uint64_t v6 = [(HUAddRestrictedGuestViewController *)self presentationDelegate];
  id v7 = (id)[v6 finishPresentation:self animated:1];
}

- (void)restrictedGuestItemManager:(id)a3 didFailToSendInvitations:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "The invitations were NOT sent due to error {%@}.", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [(HUAddRestrictedGuestViewController *)self saveButtonItem];
  int v8 = [(OBBaseWelcomeController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];
}

- (HUPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (HUPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (BOOL)requiresPresentingViewControllerDismissal
{
  return self->_requiresPresentingViewControllerDismissal;
}

- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3
{
  self->_requiresPresentingViewControllerDismissal = a3;
}

- (HUAddRestrictedGuestTableViewController)restrictedGuestTableViewController
{
  return self->_restrictedGuestTableViewController;
}

- (void)setRestrictedGuestTableViewController:(id)a3
{
}

- (UIBarButtonItem)saveButtonItem
{
  return self->_saveButtonItem;
}

- (void)setSaveButtonItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveButtonItem, 0);
  objc_storeStrong((id *)&self->_restrictedGuestTableViewController, 0);

  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end