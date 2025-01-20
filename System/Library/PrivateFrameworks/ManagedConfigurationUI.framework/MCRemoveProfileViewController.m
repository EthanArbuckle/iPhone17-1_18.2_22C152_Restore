@interface MCRemoveProfileViewController
- (BOOL)_hasYorktownWatch;
- (BOOL)profileViewControllerIsProfileInstalled;
- (BOOL)profileViewControllerShouldDisplayPoll:(id)a3;
- (BOOL)profileWantsToReEnroll;
- (DMCProfileUIDataProvider)profileUIDataProvider;
- (MCProfile)updatingProfile;
- (MCRemoveProfileViewController)initWithProfile:(id)a3;
- (UITextField)passwordField;
- (id)_mdmProfileRemovalAlertBody;
- (unint64_t)cachedHasYorktownWatch;
- (void)_didFinishEnteringPINWithCompletion:(id)a3;
- (void)_leaveRemoteManagementAndErase;
- (void)_performReEnroll;
- (void)_performReEnrollAfterPINVerification;
- (void)_resetWithMode:(int)a3;
- (void)_showEraseDeviceAlert;
- (void)_showLeaveRemoteManagementAlert;
- (void)_showRemovalWarningActionSheet;
- (void)_showRemovalWarningAfterPINVerification;
- (void)_showRemovalWarningAlert;
- (void)_showWrongRemovalPasswordAlert;
- (void)didAcceptEnteredPIN:(id)a3;
- (void)didCancelEnteringPIN;
- (void)profileRemovalDidFinish;
- (void)profileViewControllerDidSelectPoll:(id)a3;
- (void)profileViewControllerDidSelectRemoveProfile:(id)a3;
- (void)profileViewControllerDidSelectUpdateProfile:(id)a3;
- (void)setCachedHasYorktownWatch:(unint64_t)a3;
- (void)setInstallState:(int)a3 animated:(BOOL)a4;
- (void)setPasswordField:(id)a3;
- (void)setProfileUIDataProvider:(id)a3;
- (void)setProfileWantsToReEnroll:(BOOL)a3;
- (void)setUpdatingProfile:(id)a3;
- (void)updateTitleForProfileInstallationState:(int)a3;
@end

@implementation MCRemoveProfileViewController

- (MCRemoveProfileViewController)initWithProfile:(id)a3
{
  id v4 = a3;
  v5 = +[MCUIWatchManager shared];
  v6 = objc_opt_new();

  v10.receiver = self;
  v10.super_class = (Class)MCRemoveProfileViewController;
  v7 = [(MCInstallProfileViewController *)&v10 initWithProfile:v4 viewMode:2 profileUIDataProvider:v6];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_profileUIDataProvider, v6);
    v7->_cachedHasYorktownWatch = 0;
    [(MCRemoveProfileViewController *)v7 updateTitleForProfileInstallationState:1];
    v9.receiver = v7;
    v9.super_class = (Class)MCRemoveProfileViewController;
    [(MCUIViewController *)&v9 updateExtendedLayoutIncludesOpaqueBars];
  }

  return v7;
}

- (void)updateTitleForProfileInstallationState:(int)a3
{
  if (a3 == 1)
  {
    id v4 = @"SINGULAR_BLOBS_DESIGNATION";
  }
  else
  {
    if (a3 != 9) {
      return;
    }
    id v4 = @"BLOB_JUST_UPDATED_TITLE";
  }
  MCUILocalizedString(v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [(MCRemoveProfileViewController *)self navigationItem];
  [v5 setTitle:v6];
}

- (void)setInstallState:(int)a3 animated:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MCRemoveProfileViewController;
  [(MCInstallProfileViewController *)&v8 setInstallState:*(void *)&a3 animated:a4];
  id v6 = [(MCRemoveProfileViewController *)self updatingProfile];

  if (a3 == 1)
  {
    if (v6)
    {
      v7 = [(MCRemoveProfileViewController *)self updatingProfile];
      [(MCInstallProfileViewController *)self setProfile:v7];

      [(MCRemoveProfileViewController *)self setUpdatingProfile:0];
    }
  }
}

- (BOOL)profileViewControllerIsProfileInstalled
{
  return 1;
}

- (void)profileViewControllerDidSelectRemoveProfile:(id)a3
{
  if ([(DMCProfileUIDataProvider *)self->_profileUIDataProvider isPasscodeSet])
  {
    [(MCInstallProfileViewController *)self pinExtensionShowPINSheet];
  }
  else
  {
    [(MCRemoveProfileViewController *)self _showRemovalWarningAfterPINVerification];
  }
}

- (void)profileViewControllerDidSelectUpdateProfile:(id)a3
{
  id v4 = [(MCInstallProfileViewController *)self profile];
  int v5 = [v4 isManagedByProfileService];

  if (v5)
  {
    [(MCRemoveProfileViewController *)self _performReEnroll];
  }
  else
  {
    [(MCInstallProfileViewController *)self showReEnrollFailureAlert];
  }
}

- (BOOL)profileViewControllerShouldDisplayPoll:(id)a3
{
  v3 = [(MCInstallProfileViewController *)self profile];
  char v4 = [v3 isHRNProfile];

  return v4;
}

- (void)profileViewControllerDidSelectPoll:(id)a3
{
  v3 = [(MCInstallProfileViewController *)self profile];
  char v4 = [v3 isHRNProfile];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F73160] sharedClient];
    [v5 simulatePushWithCompletion:&__block_literal_global_1];
  }
  else
  {
    NSLog(&cfstr_Mcremoveprofil.isa);
  }
}

void __68__MCRemoveProfileViewController_profileViewControllerDidSelectPoll___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_Mcremoveprofil_1.isa, a2);
  }
  else {
    NSLog(&cfstr_Mcremoveprofil_0.isa);
  }
}

- (void)didAcceptEnteredPIN:(id)a3
{
  id v4 = a3;
  if (![(MCInstallProfileViewController *)self installHasFailed]
    && [(MCRemoveProfileViewController *)self profileWantsToReEnroll])
  {
    [(MCInstallProfileViewController *)self setPin:v4];
  }
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__MCRemoveProfileViewController_didAcceptEnteredPIN___block_invoke;
  v5[3] = &unk_1E6EAD1F8;
  objc_copyWeak(&v6, &location);
  [(MCRemoveProfileViewController *)self _didFinishEnteringPINWithCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __53__MCRemoveProfileViewController_didAcceptEnteredPIN___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained profileWantsToReEnroll])
    {
      id v4 = (id *)&v8;
      id v5 = v7;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      id v6 = __53__MCRemoveProfileViewController_didAcceptEnteredPIN___block_invoke_3;
    }
    else
    {
      id v4 = (id *)&v10;
      id v5 = v9;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      id v6 = __53__MCRemoveProfileViewController_didAcceptEnteredPIN___block_invoke_2;
    }
    v5[2] = v6;
    v5[3] = &unk_1E6EAD1F8;
    objc_copyWeak(v4, v1);
    dispatch_async(MEMORY[0x1E4F14428], v5);
    objc_destroyWeak(v4);
    [v3 setProfileWantsToReEnroll:0];
  }
}

void __53__MCRemoveProfileViewController_didAcceptEnteredPIN___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _showRemovalWarningAfterPINVerification];
    id WeakRetained = v2;
  }
}

void __53__MCRemoveProfileViewController_didAcceptEnteredPIN___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _performReEnrollAfterPINVerification];
    id WeakRetained = v2;
  }
}

- (void)didCancelEnteringPIN
{
  [(MCRemoveProfileViewController *)self setProfileWantsToReEnroll:0];
  [(MCRemoveProfileViewController *)self _didFinishEnteringPINWithCompletion:0];
}

- (void)_didFinishEnteringPINWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MCRemoveProfileViewController *)self navigationController];
  [v5 dismissViewControllerAnimated:1 completion:v4];
}

- (void)_showRemovalWarningAfterPINVerification
{
  v3 = [(MCInstallProfileViewController *)self profile];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(MCInstallProfileViewController *)self profile];
    int v5 = [v4 isMDMProfile];

    if (v5
      && [(DMCProfileUIDataProvider *)self->_profileUIDataProvider isProvisionallyEnrolled])
    {
      [(MCRemoveProfileViewController *)self _showLeaveRemoteManagementAlert];
      return;
    }
  }
  else
  {
  }
  id v6 = [(MCInstallProfileViewController *)self profile];
  if ([v6 isLocked])
  {
    v7 = [(MCInstallProfileViewController *)self profile];
    uint64_t v8 = [v7 removalPasscode];
    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  if ((MCUIPreferAlert() & 1) != 0 || v9)
  {
    [(MCRemoveProfileViewController *)self _showRemovalWarningAlert];
  }
  else
  {
    [(MCRemoveProfileViewController *)self _showRemovalWarningActionSheet];
  }
}

- (void)_performReEnroll
{
  [(MCInstallProfileViewController *)self setInstallHasFailed:0];
  if ([(DMCProfileUIDataProvider *)self->_profileUIDataProvider isPasscodeSet])
  {
    [(MCRemoveProfileViewController *)self setProfileWantsToReEnroll:1];
    [(MCInstallProfileViewController *)self pinExtensionShowPINSheet];
  }
  else
  {
    [(MCRemoveProfileViewController *)self _performReEnrollAfterPINVerification];
  }
}

- (void)_performReEnrollAfterPINVerification
{
  [(MCInstallProfileViewController *)self setQuestionsAlreadyAsked:1];
  v3 = [(MCInstallProfileViewController *)self profile];
  [(MCRemoveProfileViewController *)self setUpdatingProfile:v3];

  [(MCInstallProfileViewController *)self showProgressIndicator];
  profileUIDataProvider = self->_profileUIDataProvider;
  id v6 = [(MCInstallProfileViewController *)self profile];
  int v5 = [v6 identifier];
  [(DMCProfileUIDataProvider *)profileUIDataProvider updateProfileWithIdentifier:v5 interactionDelegate:self];
}

- (void)profileRemovalDidFinish
{
  v5.receiver = self;
  v5.super_class = (Class)MCRemoveProfileViewController;
  [(MCInstallProfileViewController *)&v5 profileRemovalDidFinish];
  v3 = [(MCInstallProfileViewController *)self profile];
  int v4 = [v3 needsReboot];

  if (v4) {
    [MEMORY[0x1E4F42728] MCUIShowRebootAlertFromViewController:self];
  }
}

- (void)_showLeaveRemoteManagementAlert
{
  v3 = MCUILocalizedString(@"MOBILE_DEVICE_MANAGEMENT_LEAVE_REMOTE_MANAGEMENT");
  int v4 = MCUILocalizedStringByDevice(@"MOBILE_DEVICE_MANAGEMENT_LEAVE_REMOTE_MANAGEMENT_ALERT_BODY");
  objc_super v5 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v3 message:v4 preferredStyle:1];
  id v6 = MCUILocalizedString(@"CANCEL");
  [v5 MCUIAddCancelActionWithTitle:v6];

  objc_initWeak(&location, self);
  v7 = MCUILocalizedString(@"ERASE");
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __64__MCRemoveProfileViewController__showLeaveRemoteManagementAlert__block_invoke;
  v11 = &unk_1E6EAD1F8;
  objc_copyWeak(&v12, &location);
  [v5 MCUIAddActionWithTitle:v7 style:2 completion:&v8];

  objc_msgSend(v5, "MCUIShowFromController:", self, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __64__MCRemoveProfileViewController__showLeaveRemoteManagementAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _showEraseDeviceAlert];
    id WeakRetained = v2;
  }
}

- (void)_showEraseDeviceAlert
{
  v3 = MCUILocalizedStringByDevice(@"ERASE_ALERT_TITLE");
  int v4 = (void *)MEMORY[0x1E4F42728];
  objc_super v5 = MCUILocalizedString(@"ERASE_ALERT_BODY");
  id v6 = [v4 alertControllerWithTitle:v3 message:v5 preferredStyle:1];

  v7 = MCUILocalizedString(@"CANCEL");
  [v6 MCUIAddCancelActionWithTitle:v7];

  objc_initWeak(&location, self);
  uint64_t v8 = MCUILocalizedString(@"ERASE");
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __54__MCRemoveProfileViewController__showEraseDeviceAlert__block_invoke;
  id v12 = &unk_1E6EAD1F8;
  objc_copyWeak(&v13, &location);
  [v6 MCUIAddActionWithTitle:v8 style:2 completion:&v9];

  objc_msgSend(v6, "MCUIShowFromController:", self, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __54__MCRemoveProfileViewController__showEraseDeviceAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _leaveRemoteManagementAndErase];
    id WeakRetained = v2;
  }
}

- (void)_leaveRemoteManagementAndErase
{
  objc_initWeak(&location, self);
  profileUIDataProvider = self->_profileUIDataProvider;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__MCRemoveProfileViewController__leaveRemoteManagementAndErase__block_invoke;
  v4[3] = &unk_1E6EAD370;
  objc_copyWeak(&v5, &location);
  [(DMCProfileUIDataProvider *)profileUIDataProvider unenrollWithCompletionBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __63__MCRemoveProfileViewController__leaveRemoteManagementAndErase__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__MCRemoveProfileViewController__leaveRemoteManagementAndErase__block_invoke_2;
  v5[3] = &unk_1E6EAD2A8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __63__MCRemoveProfileViewController__leaveRemoteManagementAndErase__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      id v3 = MCUILocalizedString(@"MOBILE_DEVICE_MANAGEMENT_LEAVING_REMOTE_MANAGEMENT_FAILED_ALERT_TITLE");
      id v4 = MCUILocalizedString(@"MOBILE_DEVICE_MANAGEMENT_LEAVING_REMOTE_MANAGEMENT_FAILED_ALERT_BODY");
      id v5 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v3 message:v4 preferredStyle:1];
      id v6 = MCUILocalizedString(@"OK");
      [v5 MCUIAddCancelActionWithTitle:v6];

      [v5 MCUIShowFromController:WeakRetained];
    }
    else
    {
      NSLog(&cfstr_UnenrolledFrom.isa);
      id v3 = [WeakRetained profile];
      id v4 = [v3 identifier];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __63__MCRemoveProfileViewController__leaveRemoteManagementAndErase__block_invoke_3;
      v7[3] = &unk_1E6EAD6A8;
      void v7[4] = WeakRetained;
      [WeakRetained _removeProfileWithIdentifier:v4 isProtectedProfile:1 completionHandler:v7];
    }
  }
}

uint64_t __63__MCRemoveProfileViewController__leaveRemoteManagementAndErase__block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSLog(&cfstr_ProfileRemoval.isa, a2);
  id v3 = *(void **)(a1 + 32);
  return [v3 _resetWithMode:7];
}

- (void)_showRemovalWarningAlert
{
  id v3 = [(MCInstallProfileViewController *)self profile];
  if ([v3 isLocked])
  {
    id v4 = [v3 removalPasscode];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = MCUILocalizedString(@"REMOVE");
    goto LABEL_8;
  }
  int v6 = [v3 isMDMProfile];
  id v7 = MCUILocalizedString(@"REMOVE");
  if (!v6)
  {
LABEL_8:
    if (v5)
    {
      uint64_t v8 = MCUILocalizedString(@"BLOB_REMOVE_TITLE_PROTECTED");
      uint64_t v10 = @"PROFILE_REMOVE_WARNING_PROTECTED";
    }
    else
    {
      uint64_t v8 = MCUILocalizedString(@"BLOB_REMOVE_TITLE");
      uint64_t v10 = @"PROFILE_REMOVE_WARNING";
    }
    uint64_t v9 = MCUILocalizedStringByDevice(v10);
    goto LABEL_12;
  }
  uint64_t v8 = MCUILocalizedString(@"MOBILE_DEVICE_MANAGEMENT_REMOVE_TITLE");
  uint64_t v9 = [(MCRemoveProfileViewController *)self _mdmProfileRemovalAlertBody];
LABEL_12:
  v11 = (void *)v9;
  id v12 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v8 message:v9 preferredStyle:1];
  id v13 = MCUILocalizedString(@"CANCEL");
  [v12 MCUIAddCancelActionWithTitle:v13];

  objc_initWeak(&location, self);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __57__MCRemoveProfileViewController__showRemovalWarningAlert__block_invoke;
  v22[3] = &unk_1E6EAD1F8;
  objc_copyWeak(&v23, &location);
  [v12 MCUIAddActionWithTitle:v7 style:2 completion:v22];
  if (v5)
  {
    v14 = MCUILocalizedString(@"REMOVAL_PASSCODE");
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __57__MCRemoveProfileViewController__showRemovalWarningAlert__block_invoke_2;
    v19 = &unk_1E6EAD6D0;
    objc_copyWeak(&v21, &location);
    id v15 = v14;
    id v20 = v15;
    [v12 addTextFieldWithConfigurationHandler:&v16];

    objc_destroyWeak(&v21);
  }
  objc_msgSend(v12, "MCUIShowFromController:", self, v16, v17, v18, v19);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __57__MCRemoveProfileViewController__showRemovalWarningAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v2 = [WeakRetained profile];
    id v3 = [v2 removalPasscode];

    if (v3
      && ([v7 passwordField],
          id v4 = objc_claimAutoreleasedReturnValue(),
          [v4 text],
          BOOL v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v3 isEqualToString:v5],
          v5,
          v4,
          !v6))
    {
      [v7 _showWrongRemovalPasswordAlert];
    }
    else
    {
      [v7 performRemoveAfterFinalVerification];
    }

    id WeakRetained = v7;
  }
}

void __57__MCRemoveProfileViewController__showRemovalWarningAlert__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [v4 setPlaceholder:*(void *)(a1 + 32)];
    [v4 setSecureTextEntry:1];
    [WeakRetained setPasswordField:v4];
  }
}

- (void)_showRemovalWarningActionSheet
{
  id v3 = [(MCInstallProfileViewController *)self profile];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 isMDMProfile])
  {
    id v4 = [(MCRemoveProfileViewController *)self _mdmProfileRemovalAlertBody];
    BOOL v5 = @"MOBILE_DEVICE_MANAGEMENT_REMOVE_TITLE";
  }
  else
  {
    id v4 = 0;
    BOOL v5 = @"REMOVE";
  }
  int v6 = MCUILocalizedString(v5);
  id v7 = [MEMORY[0x1E4F42728] alertControllerWithTitle:0 message:v4 preferredStyle:0];
  uint64_t v8 = MCUILocalizedString(@"CANCEL");
  [v7 MCUIAddCancelActionWithTitle:v8];

  objc_initWeak(&location, self);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __63__MCRemoveProfileViewController__showRemovalWarningActionSheet__block_invoke;
  id v12 = &unk_1E6EAD1F8;
  objc_copyWeak(&v13, &location);
  [v7 MCUIAddActionWithTitle:v6 style:2 completion:&v9];
  objc_msgSend(v7, "MCUIShowFromController:", self, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __63__MCRemoveProfileViewController__showRemovalWarningActionSheet__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = [WeakRetained profile];
    id v3 = [v2 removalPasscode];

    id WeakRetained = v4;
    if (!v3)
    {
      [v4 performRemoveAfterFinalVerification];
      id WeakRetained = v4;
    }
  }
}

- (void)_showWrongRemovalPasswordAlert
{
  id v3 = (void *)MEMORY[0x1E4F42728];
  id v4 = MCUILocalizedString(@"BLOB_REMOVE_TITLE_PROTECTED");
  BOOL v5 = MCUILocalizedString(@"BLOB_REMOVE_FAILURE_PROTECTED");
  id v7 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  int v6 = MCUILocalizedString(@"CANCEL");
  [v7 MCUIAddCancelActionWithTitle:v6];

  [v7 MCUIShowFromController:self];
}

- (id)_mdmProfileRemovalAlertBody
{
  id v3 = [(MCRemoveProfileViewController *)self profileUIDataProvider];
  id v4 = [v3 managedAppsUninstalledOnMDMRemoval];

  if (!v4) {
    goto LABEL_6;
  }
  BOOL v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5E628]];
  unsigned int v6 = [v5 unsignedIntValue];

  if (v6 == 1)
  {
    uint64_t v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5E630]];
    uint64_t v9 = NSString;
    uint64_t v10 = MCUILocalizedStringByDevice(@"MOBILE_DEVICE_MANAGEMENT_REMOVE_WARNING_SINGULAR_APP_%@");
    v11 = objc_msgSend(v9, "stringWithFormat:", v10, v8);

LABEL_9:
    if ([(MCRemoveProfileViewController *)self _hasYorktownWatch])
    {
      v14 = NSString;
      id v15 = MCUILocalizedString(@"MOBILE_DEVICE_MANAGEMENT_REMOVE_WARNING_YORKTOWN_ADDITIONAL");
      id v7 = [v14 stringWithFormat:@"%@ %@", v11, v15];
    }
    else
    {
      id v7 = v11;
    }

    goto LABEL_13;
  }
  if (v6)
  {
    uint64_t v12 = v6;
    id v13 = NSString;
    uint64_t v8 = MCUILocalizedStringByDevice(@"MOBILE_DEVICE_MANAGEMENT_REMOVE_WARNING_MULTIPLE_APPS_%ld");
    v11 = objc_msgSend(v13, "stringWithFormat:", v8, v12);
    goto LABEL_9;
  }
  if ([(MCRemoveProfileViewController *)self _hasYorktownWatch])
  {
    MCUILocalizedString(@"MOBILE_DEVICE_MANAGEMENT_REMOVE_WARNING_YORKTOWN_FULL");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
LABEL_6:
  id v7 = 0;
LABEL_13:

  return v7;
}

- (BOOL)_hasYorktownWatch
{
  unint64_t v3 = [(MCRemoveProfileViewController *)self cachedHasYorktownWatch];
  if (v3 == 2) {
    return 0;
  }
  if (v3) {
    return 1;
  }
  if (!+[MCUISettingsWatchManager hasAnyYorktownEnrolledWatches])
  {
    [(MCRemoveProfileViewController *)self setCachedHasYorktownWatch:0];
    return 0;
  }
  BOOL v4 = 1;
  [(MCRemoveProfileViewController *)self setCachedHasYorktownWatch:1];
  return v4;
}

- (void)_resetWithMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = SBSSpringBoardServerPort();
  NSLog(&cfstr_CallingSbdatar.isa, v3, v4);
  uint64_t v5 = SBDataReset();
  NSLog(&cfstr_SbdataresetRet.isa, v5);
}

- (BOOL)profileWantsToReEnroll
{
  return self->_profileWantsToReEnroll;
}

- (void)setProfileWantsToReEnroll:(BOOL)a3
{
  self->_profileWantsToReEnroll = a3;
}

- (MCProfile)updatingProfile
{
  return self->_updatingProfile;
}

- (void)setUpdatingProfile:(id)a3
{
}

- (UITextField)passwordField
{
  return self->_passwordField;
}

- (void)setPasswordField:(id)a3
{
}

- (DMCProfileUIDataProvider)profileUIDataProvider
{
  return self->_profileUIDataProvider;
}

- (void)setProfileUIDataProvider:(id)a3
{
}

- (unint64_t)cachedHasYorktownWatch
{
  return self->_cachedHasYorktownWatch;
}

- (void)setCachedHasYorktownWatch:(unint64_t)a3
{
  self->_cachedHasYorktownWatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileUIDataProvider, 0);
  objc_storeStrong((id *)&self->_passwordField, 0);
  objc_storeStrong((id *)&self->_updatingProfile, 0);
}

@end