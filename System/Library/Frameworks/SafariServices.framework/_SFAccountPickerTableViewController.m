@interface _SFAccountPickerTableViewController
- (BOOL)_shouldShowAutoFillPasskeys;
- (BOOL)_shouldShowPasswordsMatchingHintStringsSection;
- (BOOL)_shouldUseEmptyHeaderFooterHeightInSection:(int64_t)a3;
- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4;
- (LAContext)authenticatedContext;
- (SFAccountPickerConfiguration)configuration;
- (_SFAccountPickerTableViewController)initWithConfiguration:(id)a3;
- (_SFAccountPickerTableViewControllerDelegate)delegate;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_appIconForVerificationCode:(id)a3;
- (id)_bundleIdentifierForVerificationCodeSource:(int64_t)a3;
- (id)_cellConfigurationForVerificationCodeAtIndexPath:(id)a3;
- (id)_detailViewControllerForSavedAccount:(id)a3;
- (id)_generatedPasswordsDomainHintString;
- (id)_indexPathForSavedAccount:(id)a3;
- (id)_savedAccountForIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)_rowTypeForIndexPath:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_accountStoreDidChange;
- (void)_cancel;
- (void)_consumeAndFillVerificationCode:(id)a3;
- (void)_deleteSavedAccountAtIndexPath:(id)a3;
- (void)_didPickSavedAccountForPassword:(id)a3;
- (void)_didPickSavedAccountForPasswordButPresentAlertToAddAdditionalSiteIfApplicable:(id)a3;
- (void)_fillPasswordForSavedAccount:(id)a3;
- (void)_fillUsernameForSavedAccount:(id)a3;
- (void)_fillVerificationCodeForSavedAccount:(id)a3;
- (void)_presentAddPasswordViewController;
- (void)_presentAlertToConfirmDeletingAccountsAtIndexPath:(id)a3;
- (void)_presentErrorAlertWithString:(id)a3;
- (void)_presentGeneratedPasswordsViewController;
- (void)_reloadSavedAccountsWithCompletionHandler:(id)a3;
- (void)_reloadVerificationCodesIfNeeded;
- (void)_removeSavedAccount:(id)a3 modifyingAccountStore:(BOOL)a4;
- (void)_showAccountDetailsForSavedAccount:(id)a3;
- (void)_showAccountDetailsForSavedAccountAtIndexPath:(id)a3;
- (void)_updateMatchingGeneratedPasswordsState;
- (void)_updateMatchingPasswords;
- (void)_updateNavigationItemTitleAndPrompt;
- (void)_updateSections;
- (void)accountDetailViewController:(id)a3 didMoveSavedAccountToRecentlyDeleted:(id)a4;
- (void)accountDetailViewController:(id)a3 fillPasswordForSavedAccount:(id)a4;
- (void)accountDetailViewController:(id)a3 fillUsernameForSavedAccount:(id)a4;
- (void)accountDetailViewController:(id)a3 fillVerificationCodeForSavedAccount:(id)a4;
- (void)addSavedAccountViewControllerDidFinish:(id)a3 withSavedAccount:(id)a4;
- (void)dealloc;
- (void)handleIconDidUpdateForDomain:(id)a3;
- (void)linkableFooterViewDidInteractWithLink:(id)a3;
- (void)newAutoFillablePasskeysAvailable:(id)a3;
- (void)passwordManagerLogViewControllerWantsToDismiss;
- (void)passwordManagerLogViewControllerWantsToSaveGeneratedPassword:(id)a3;
- (void)reloadTable;
- (void)searchPatternDidUpdate;
- (void)setAuthenticatedContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation _SFAccountPickerTableViewController

- (_SFAccountPickerTableViewController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v6 = objc_alloc_init(_SFAccountTableConfiguration);
  [(_SFAccountTableConfiguration *)v6 setShouldShowSearchBar:1];
  [(_SFAccountTableConfiguration *)v6 setSupportsDelete:1];
  [(_SFAccountTableConfiguration *)v6 setShouldConfigureMultipleSelectionDuringEditing:0];
  [(_SFAccountTableConfiguration *)v6 setSupportsShare:0];
  -[_SFAccountTableConfiguration setIsForFillingIndividualAccountFields:](v6, "setIsForFillingIndividualAccountFields:", [v5 isForFillingIndividualAccountFields]);
  v7 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
  v28.receiver = self;
  v28.super_class = (Class)_SFAccountPickerTableViewController;
  v8 = [(_SFAccountTableViewController *)&v28 initWithSiteMetadataManager:v7 configuration:v6];

  if (v8)
  {
    objc_storeStrong((id *)&v8->_configuration, a3);
    v9 = [(_SFAccountPickerTableViewController *)v8 navigationItem];
    v10 = _WBSLocalizedString();
    [v9 setBackButtonTitle:v10];

    v11 = [(SFAccountPickerConfiguration *)v8->_configuration prompt];
    [v9 setPrompt:v11];

    if ([(SFAccountPickerConfiguration *)v8->_configuration shouldAllowAddingNewPasswords])
    {
      uint64_t v12 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:4 target:v8 action:sel__addNavigationBarItemTapped_];
      addNavigationBarItem = v8->_addNavigationBarItem;
      v8->_addNavigationBarItem = (UIBarButtonItem *)v12;

      [(UIBarButtonItem *)v8->_addNavigationBarItem setAccessibilityIdentifier:@"Passwords List Navigation Bar Add Button"];
      [v9 setRightBarButtonItem:v8->_addNavigationBarItem];
    }
    v14 = (WBSAuthenticationServicesAgentProxy *)objc_alloc_init(MEMORY[0x1E4F98968]);
    authenticationServicesAgentProxy = v8->_authenticationServicesAgentProxy;
    v8->_authenticationServicesAgentProxy = v14;

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v8 selector:sel_newAutoFillablePasskeysAvailable_ name:*MEMORY[0x1E4F99548] object:0];

    v17 = [(_SFAccountPickerTableViewController *)v8 tableView];
    [v17 setAccessibilityIdentifier:@"AutoFillPasswordTable"];

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v19 = *MEMORY[0x1E4F99540];
    v20 = [MEMORY[0x1E4F98DF8] sharedStore];
    [v18 addObserver:v8 selector:sel__accountStoreDidChange name:v19 object:v20];

    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v22 = *MEMORY[0x1E4F99220];
    v23 = [MEMORY[0x1E4F98B70] sharedStore];
    [v21 addObserver:v8 selector:sel__generatedPasswordsStoreDidChange name:v22 object:v23];

    if ([(SFAccountPickerConfiguration *)v8->_configuration shouldShowReceivedVerificationCodes])
    {
      v24 = (SFAppAutoFillOneTimeCodeProvider *)objc_alloc_init(MEMORY[0x1E4F98200]);
      verificationCodeProvider = v8->_verificationCodeProvider;
      v8->_verificationCodeProvider = v24;

      [(SFAppAutoFillOneTimeCodeProvider *)v8->_verificationCodeProvider addObserver:v8];
      [(_SFAccountPickerTableViewController *)v8 _reloadVerificationCodesIfNeeded];
    }
    v26 = v8;
  }
  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4F99540];
  id v5 = [MEMORY[0x1E4F98DF8] sharedStore];
  [v3 removeObserver:self name:v4 object:v5];

  v6.receiver = self;
  v6.super_class = (Class)_SFAccountPickerTableViewController;
  [(_SFAccountTableViewController *)&v6 dealloc];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)_SFAccountPickerTableViewController;
  [(_SFAccountTableViewController *)&v4 viewDidLoad];
  v3 = [(_SFAccountPickerTableViewController *)self tableView];
  [v3 setKeyboardDismissMode:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_SFAccountPickerTableViewController;
  [(_SFAccountTableViewController *)&v8 viewWillAppear:a3];
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancel];
  id v5 = [(_SFAccountPickerTableViewController *)self navigationItem];
  [v5 setLeftBarButtonItem:v4];

  [(_SFAccountPickerTableViewController *)self _updateNavigationItemTitleAndPrompt];
  if (self->_indexPathOfRowShowingDetailView)
  {
    objc_super v6 = [(_SFAccountPickerTableViewController *)self tableView];
    [v6 deselectRowAtIndexPath:self->_indexPathOfRowShowingDetailView animated:1];

    indexPathOfRowShowingDetailView = self->_indexPathOfRowShowingDetailView;
    self->_indexPathOfRowShowingDetailView = 0;
  }
  else
  {
    [(_SFAccountPickerTableViewController *)self reloadTable];
  }
}

- (void)reloadTable
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50___SFAccountPickerTableViewController_reloadTable__block_invoke;
  v2[3] = &unk_1E5C724D8;
  v2[4] = self;
  [(_SFAccountPickerTableViewController *)self _reloadSavedAccountsWithCompletionHandler:v2];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_SFAccountPickerTableViewController;
  -[_SFAccountTableViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  id v5 = [(_SFAccountPickerTableViewController *)self navigationController];
  [v5 setNavigationBarHidden:0 animated:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_SFAccountPickerTableViewController;
  [(_SFAccountTableViewController *)&v10 viewDidDisappear:a3];
  if (!self->_indexPathOfRowShowingDetailView)
  {
    objc_super v4 = [MEMORY[0x1E4F98DF8] sharedStore];
    [v4 reset];

    savedAccounts = self->_savedAccounts;
    self->_savedAccounts = 0;

    matchingSavedAccounts = self->_matchingSavedAccounts;
    self->_matchingSavedAccounts = 0;

    autoFillPasskeys = self->_autoFillPasskeys;
    self->_autoFillPasskeys = 0;

    savedAccountWithUsablePasskeys = self->_savedAccountWithUsablePasskeys;
    self->_savedAccountWithUsablePasskeys = 0;

    passkeyNearbyDeviceOptions = self->_passkeyNearbyDeviceOptions;
    self->_passkeyNearbyDeviceOptions = 0;
  }
}

- (void)newAutoFillablePasskeysAvailable:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72___SFAccountPickerTableViewController_newAutoFillablePasskeysAvailable___block_invoke;
  block[3] = &unk_1E5C724D8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_updateNavigationItemTitleAndPrompt
{
  id v8 = [(_SFAccountPickerTableViewController *)self navigationItem];
  if ([(NSMutableArray *)self->_savedAccountWithUsablePasskeys count] || self->_passkeyNearbyDeviceOptions)
  {
    BOOL v3 = _WBSLocalizedString();
    [v8 setTitle:v3];

    uint64_t v4 = [(SFAccountPickerConfiguration *)self->_configuration promptWhenPasskeysAreAvailable];
  }
  else
  {
    objc_super v6 = [(SFAccountPickerConfiguration *)self->_configuration title];
    if (v6)
    {
      [v8 setTitle:v6];
    }
    else
    {
      v7 = _WBSLocalizedString();
      [v8 setTitle:v7];
    }
    uint64_t v4 = [(SFAccountPickerConfiguration *)self->_configuration prompt];
  }
  id v5 = (void *)v4;
  [v8 setPrompt:v4];
}

- (void)_cancel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountPickerTableViewControllerDidCancel:self];
  }
}

- (void)handleIconDidUpdateForDomain:(id)a3
{
  id v7 = a3;
  addPasswordViewController = self->_addPasswordViewController;
  if (addPasswordViewController) {
    [(SFAddSavedAccountViewController *)addPasswordViewController updatedIconIsAvailableForDomain:v7];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailViewController);
  objc_super v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained updatedIconIsAvailableForDomain:v7];
  }
}

- (void)_reloadSavedAccountsWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  id v5 = [MEMORY[0x1E4F98DF8] sharedStore];
  objc_super v6 = [v5 savedAccounts];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81___SFAccountPickerTableViewController__reloadSavedAccountsWithCompletionHandler___block_invoke;
  v18[3] = &unk_1E5C77B28;
  v18[4] = self;
  id v7 = objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v18);
  id v8 = (NSMutableArray *)[v7 mutableCopy];
  savedAccounts = self->_savedAccounts;
  self->_savedAccounts = v8;

  if ([(SFAccountPickerConfiguration *)self->_configuration shouldShowAutoFillPasskeys])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __81___SFAccountPickerTableViewController__reloadSavedAccountsWithCompletionHandler___block_invoke_2;
    v16[3] = &unk_1E5C77B50;
    v16[4] = self;
    v17 = v4;
    objc_super v10 = (void *)MEMORY[0x1AD0C36A0](v16);
    BOOL v11 = [(SFAccountPickerConfiguration *)self->_configuration hasAuditToken];
    authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
    if (v11)
    {
      configuration = self->_configuration;
      if (configuration) {
        [(SFAccountPickerConfiguration *)configuration connectedAppAuditToken];
      }
      v14 = WBSApplicationIdentifierFromAuditToken();
      [(WBSAuthenticationServicesAgentProxy *)authenticationServicesAgentProxy getPasskeysForRunningAssertionWithApplicationIdentifier:v14 withCompletionHandler:v10];
    }
    else
    {
      v14 = [MEMORY[0x1E4F28B50] mainBundle];
      v15 = [v14 bundleIdentifier];
      [(WBSAuthenticationServicesAgentProxy *)authenticationServicesAgentProxy getPasskeysForRunningAssertionWithApplicationIdentifier:v15 withCompletionHandler:v10];
    }
  }
  else
  {
    v4[2](v4);
  }
}

- (void)_accountStoreDidChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __61___SFAccountPickerTableViewController__accountStoreDidChange__block_invoke;
  v2[3] = &unk_1E5C724D8;
  v2[4] = self;
  [(_SFAccountPickerTableViewController *)self _reloadSavedAccountsWithCompletionHandler:v2];
}

- (void)_didPickSavedAccountForPassword:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(SFAccountPickerConfiguration *)self->_configuration isForFillingIndividualAccountFields])
  {
    id v5 = [(SFAccountPickerConfiguration *)self->_configuration addPasswordSuggestedDomain];
    objc_super v6 = objc_msgSend(v5, "safari_highLevelDomainForPasswordManager");
    id v7 = [v4 highLevelDomain];
    int v8 = [v6 isEqualToString:v7];

    if (v8)
    {
      v9 = (void *)MEMORY[0x1E4F18D98];
      objc_super v10 = [@"https://" stringByAppendingString:v5];
      BOOL v11 = objc_msgSend(v10, "safari_bestURLForUserTypedString");
      uint64_t v12 = objc_msgSend(v9, "safari_HTMLFormProtectionSpaceForURL:", v11);

      v13 = [MEMORY[0x1E4F98DF8] sharedStore];
      v14 = [(SFAccountPickerConfiguration *)self->_configuration savedAccountContext];
      [v13 setSavedAccountAsDefault:v4 forProtectionSpace:v12 context:v14];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      v17[0] = v4;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      [WeakRetained accountPickerTableViewController:self didPickSavedAccounts:v16];
    }
  }
}

- (void)_didPickSavedAccountForPasswordButPresentAlertToAddAdditionalSiteIfApplicable:(id)a3
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SFAccountPickerConfiguration *)self->_configuration addPasswordSuggestedDomain];
  objc_super v6 = [v4 highLevelDomain];
  v56[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];

  int v8 = [v4 additionalSites];
  v9 = objc_msgSend(v8, "safari_mapObjectsUsingBlock:", &__block_literal_global_99);
  objc_super v10 = [v7 arrayByAddingObjectsFromArray:v9];

  if ([v5 length])
  {
    BOOL v11 = objc_msgSend(v5, "safari_highLevelDomainForPasswordManager");
    int v12 = [v11 isEqualToString:@"apple.com"];
  }
  else
  {
    int v12 = 0;
  }
  v13 = (void *)MEMORY[0x1E4F98238];
  v14 = [MEMORY[0x1E4F98238] domainByStrippingSubdomainWildcardPrefixIfNecessary:v5];
  int v15 = [v13 domainIsProhibitedForSavingCredentials:v14];

  if ([v5 length]
    && (objc_msgSend(v5, "safari_highLevelDomainForPasswordManager"),
        v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v10 containsObject:v16] | v12 | v15,
        v16,
        v17 != 1))
  {
    v18 = [(SFAccountPickerConfiguration *)self->_configuration appID];
    v47 = v18;
    if (v18)
    {
      uint64_t v19 = v18;
      if ([(SFAccountPickerConfiguration *)self->_configuration isConnectedAppAWebBrowser])
      {
        v18 = 0;
      }
      else
      {
        v18 = [MEMORY[0x1E4F223C8] bundleRecordWithApplicationIdentifier:v19 error:0];
      }
    }
    v48 = v10;
    v46 = v18;
    v20 = [v18 localizedName];
    uint64_t v21 = [v20 length];
    uint64_t v22 = NSString;
    if (v21)
    {
      v23 = _WBSLocalizedString();
      v24 = [v4 effectiveTitle];
      uint64_t v25 = objc_msgSend(v22, "stringWithFormat:", v23, v24, v20);

      v26 = NSString;
      v27 = _WBSLocalizedString();
      objc_msgSend(v26, "stringWithFormat:", v27, v20);
    }
    else
    {
      objc_super v28 = _WBSLocalizedString();
      v29 = [v4 effectiveTitle];
      uint64_t v25 = objc_msgSend(v22, "stringWithFormat:", v28, v29, v5);

      v30 = NSString;
      v27 = _WBSLocalizedString();
      objc_msgSend(v30, "stringWithFormat:", v27, v5);
    uint64_t v31 = };

    v43 = (void *)v31;
    v32 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v25 message:v31 preferredStyle:1];
    v33 = (void *)MEMORY[0x1E4FB1410];
    v34 = _WBSLocalizedString();
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __117___SFAccountPickerTableViewController__didPickSavedAccountForPasswordButPresentAlertToAddAdditionalSiteIfApplicable___block_invoke_2;
    v54[3] = &unk_1E5C72448;
    v54[4] = self;
    id v35 = v4;
    id v55 = v35;
    v36 = [v33 actionWithTitle:v34 style:0 handler:v54];

    [v32 addAction:v36];
    [v32 setPreferredAction:v36];
    [v20 length];
    v44 = (void *)v25;
    v45 = v20;
    v37 = _WBSLocalizedString();
    v38 = (void *)MEMORY[0x1E4FB1410];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __117___SFAccountPickerTableViewController__didPickSavedAccountForPasswordButPresentAlertToAddAdditionalSiteIfApplicable___block_invoke_3;
    v50[3] = &unk_1E5C72A50;
    id v51 = v5;
    id v52 = v35;
    v53 = self;
    v39 = [v38 actionWithTitle:v37 style:0 handler:v50];
    [v32 addAction:v39];
    v40 = (void *)MEMORY[0x1E4FB1410];
    v41 = _WBSLocalizedString();
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __117___SFAccountPickerTableViewController__didPickSavedAccountForPasswordButPresentAlertToAddAdditionalSiteIfApplicable___block_invoke_4;
    v49[3] = &unk_1E5C72898;
    v49[4] = self;
    v42 = [v40 actionWithTitle:v41 style:1 handler:v49];
    [v32 addAction:v42];

    [(_SFAccountPickerTableViewController *)self presentViewController:v32 animated:1 completion:0];
    objc_super v10 = v48;
  }
  else
  {
    [(_SFAccountPickerTableViewController *)self _didPickSavedAccountForPassword:v4];
  }
}

- (void)_presentAddPasswordViewController
{
  id v18 = [(WBSGeneratedPassword *)self->_generatedPasswordBeingTransformedIntoSavedAccount password];
  BOOL v3 = [SFAddSavedAccountViewController alloc];
  id v4 = [(SFAccountPickerConfiguration *)self->_configuration addPasswordSuggestedDomain];
  id v5 = v4;
  if (!v4)
  {
    id v5 = [(SFAccountPickerConfiguration *)self->_configuration addPasswordSuggestedLabel];
  }
  objc_super v6 = [(SFAddSavedAccountViewController *)v3 initWithSuggestedDomain:v5 password:v18];
  addPasswordViewController = self->_addPasswordViewController;
  self->_addPasswordViewController = v6;

  if (!v4) {
  int v8 = [(SFAccountPickerConfiguration *)self->_configuration bundleIDForFallbackIcon];
  }

  if (v8)
  {
    v9 = [(SFAccountPickerConfiguration *)self->_configuration bundleIDForFallbackIcon];
    [(SFAddSavedAccountViewController *)self->_addPasswordViewController setBundleIDForFallbackIcon:v9];
  }
  [(SFAddSavedAccountViewController *)self->_addPasswordViewController setDelegate:self];
  objc_super v10 = [MEMORY[0x1E4F98BE0] sharedMonitor];
  unint64_t v11 = [v10 keychainSyncSettingValue];

  if (v11 >= 2)
  {
    if (v11 != 2) {
      goto LABEL_12;
    }
    BOOL v12 = [v18 length] == 0;
  }
  else
  {
    BOOL v12 = 0;
  }
  [(SFAddSavedAccountViewController *)self->_addPasswordViewController setShouldPopulatePasswordFieldWithNewGeneratedStrongPassword:v12];
LABEL_12:
  v13 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:self->_addPasswordViewController];
  [v13 setModalPresentationStyle:2];
  +[_SFAccountManagerAppearanceValues preferredFormSheetContentSize];
  objc_msgSend(v13, "setPreferredContentSize:");
  uint64_t v14 = [(_SFAccountPickerTableViewController *)self presentedViewController];
  int v15 = (void *)v14;
  if (v14) {
    v16 = (_SFAccountPickerTableViewController *)v14;
  }
  else {
    v16 = self;
  }
  int v17 = v16;

  [(_SFAccountPickerTableViewController *)v17 presentViewController:v13 animated:1 completion:0];
}

- (void)_fillUsernameForSavedAccount:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountPickerTableViewController:self fillUsernameForSavedAccount:v5];
  }
}

- (void)_fillPasswordForSavedAccount:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountPickerTableViewController:self fillPasswordForSavedAccount:v5];
  }
}

- (void)_fillVerificationCodeForSavedAccount:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountPickerTableViewController:self fillVerificationCodeForSavedAccount:v5];
  }
}

- (void)_reloadVerificationCodesIfNeeded
{
  BOOL v3 = [(SFAccountPickerConfiguration *)self->_configuration appID];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    verificationCodeProvider = self->_verificationCodeProvider;
    objc_super v6 = [(SFAccountPickerConfiguration *)self->_configuration appID];
    id v7 = [(SFAccountPickerConfiguration *)self->_configuration websiteURLForReceivedVerificationCodes];
    int v8 = [(SFAppAutoFillOneTimeCodeProvider *)verificationCodeProvider currentOneTimeCodesWithAppIdentifier:v6 website:v7 usernameHint:0 fieldClassification:2];
    objc_msgSend(v8, "safari_filterObjectsUsingBlock:", &__block_literal_global_157);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    verificationCodes = self->_verificationCodes;
    self->_verificationCodes = v9;

    if ([(_SFAccountPickerTableViewController *)self isViewLoaded])
    {
      id v11 = [(_SFAccountPickerTableViewController *)self tableView];
      [v11 reloadData];
    }
  }
}

- (id)_cellConfigurationForVerificationCodeAtIndexPath:(id)a3
{
  uint64_t v4 = -[NSArray objectAtIndexedSubscript:](self->_verificationCodes, "objectAtIndexedSubscript:", [a3 row]);
  id v5 = [MEMORY[0x1E4FB1948] cellConfiguration];
  objc_super v6 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  id v7 = [v5 secondaryTextProperties];
  [v7 setFont:v6];

  int v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v9 = [v5 secondaryTextProperties];
  [v9 setColor:v8];

  objc_super v10 = [v4 localizedTitleForContext:3];
  [v5 setText:v10];

  id v11 = [v4 localizedSubtitleForContext:3];
  [v5 setSecondaryText:v11];

  BOOL v12 = [(_SFAccountPickerTableViewController *)self _appIconForVerificationCode:v4];
  [v5 setImage:v12];

  return v5;
}

- (id)_bundleIdentifierForVerificationCodeSource:(int64_t)a3
{
  BOOL v3 = @"com.apple.mobilemail";
  if (a3 != 1) {
    BOOL v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return @"com.apple.MobileSMS";
  }
}

- (id)_appIconForVerificationCode:(id)a3
{
  BOOL v3 = -[_SFAccountPickerTableViewController _bundleIdentifierForVerificationCodeSource:](self, "_bundleIdentifierForVerificationCodeSource:", [a3 source]);
  if (v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:v3];
    id v5 = objc_alloc(MEMORY[0x1E4F6F258]);
    [MEMORY[0x1E4F18B30] tableViewIconSize];
    double v7 = v6;
    double v9 = v8;
    _SFScreenScale();
    id v11 = objc_msgSend(v5, "initWithSize:scale:", v7, v9, v10);
    BOOL v12 = [v4 prepareImageForDescriptor:v11];
    if ([v12 placeholder])
    {
      v13 = 0;
    }
    else
    {
      id v14 = objc_alloc(MEMORY[0x1E4FB1818]);
      uint64_t v15 = [v12 CGImage];
      [v12 scale];
      v16 = objc_msgSend(v14, "initWithCGImage:scale:orientation:", v15, 0);
      int v17 = (void *)MEMORY[0x1E4F98BC8];
      [MEMORY[0x1E4F18B30] tableViewIconSize];
      v13 = objc_msgSend(v17, "resizedImage:withSize:", v16);
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_consumeAndFillVerificationCode:(id)a3
{
  id v5 = a3;
  -[SFAppAutoFillOneTimeCodeProvider consumeOneTimeCode:](self->_verificationCodeProvider, "consumeOneTimeCode:");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountPickerTableViewController:self fillVerificationCode:v5];
  }
}

- (void)addSavedAccountViewControllerDidFinish:(id)a3 withSavedAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (!v7)
  {
    addPasswordViewController = self;
LABEL_11:
    [addPasswordViewController dismissViewControllerAnimated:1 completion:0];
    goto LABEL_12;
  }
  if (self->_didPresentAddAccountViewControllerFromGeneratedPasswords)
  {
    double v9 = [v7 password];
    double v10 = [(WBSGeneratedPassword *)self->_generatedPasswordBeingTransformedIntoSavedAccount password];
    int v11 = [v9 isEqualToString:v10];

    if (v11)
    {
      BOOL v12 = [MEMORY[0x1E4F98B70] sharedStore];
      [v12 removeGeneratedPassword:self->_generatedPasswordBeingTransformedIntoSavedAccount completionHandler:0];
    }
    else
    {
      id v14 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A690B000, v14, OS_LOG_TYPE_DEFAULT, "Newly created saved account has a password that doesn't match the generated password record it was created from. The generated password record was not deleted.", buf, 2u);
      }
    }
    generatedPasswordBeingTransformedIntoSavedAccount = self->_generatedPasswordBeingTransformedIntoSavedAccount;
    self->_generatedPasswordBeingTransformedIntoSavedAccount = 0;

    addPasswordViewController = self->_addPasswordViewController;
    goto LABEL_11;
  }
  if ([(SFAccountPickerConfiguration *)self->_configuration isForFillingIndividualAccountFields])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __95___SFAccountPickerTableViewController_addSavedAccountViewControllerDidFinish_withSavedAccount___block_invoke;
    v17[3] = &unk_1E5C72238;
    v17[4] = self;
    id v18 = v8;
    [(_SFAccountPickerTableViewController *)self dismissViewControllerAnimated:1 completion:v17];
  }
  else
  {
    [(_SFAccountPickerTableViewController *)self _didPickSavedAccountForPassword:v8];
  }
LABEL_12:
  v16 = self->_addPasswordViewController;
  self->_addPasswordViewController = 0;
}

- (int64_t)_rowTypeForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 row];
  if ([v4 section] == self->_sectionForPasswordsMatchingHintStrings)
  {
    BOOL v6 = [(SFAccountPickerConfiguration *)self->_configuration shouldAllowAddingNewPasswords];
    if ([(SFAccountPickerConfiguration *)self->_configuration shouldShowGeneratedPasswordsForDomain])
    {
      if (self->_hasMatchingGeneratedPasswords && v6)
      {
        if (v5 != [(NSMutableArray *)self->_savedAccountsMatchingHintStrings count])
        {
          if (v5 != [(NSMutableArray *)self->_savedAccountsMatchingHintStrings count] + 1) {
            goto LABEL_16;
          }
LABEL_15:
          int64_t v8 = 1;
          goto LABEL_23;
        }
LABEL_12:
        int64_t v8 = 4;
        goto LABEL_23;
      }
      if (self->_hasMatchingGeneratedPasswords
        && v5 == [(NSMutableArray *)self->_savedAccountsMatchingHintStrings count])
      {
        goto LABEL_12;
      }
    }
    if (v6 && v5 == [(NSMutableArray *)self->_savedAccountsMatchingHintStrings count]) {
      goto LABEL_15;
    }
  }
LABEL_16:
  if ([(SFAccountPickerConfiguration *)self->_configuration shouldShowAutoFillPasskeys]
    && [v4 section] == self->_sectionForPasskeys
    && (uint64_t v9 = [v4 row], v9 == -[NSMutableArray count](self->_savedAccountWithUsablePasskeys, "count")))
  {
    int64_t v8 = 2;
  }
  else if ([v4 section] == self->_sectionForVerificationCodes)
  {
    int64_t v8 = 3;
  }
  else
  {
    int64_t v8 = 0;
  }
LABEL_23:

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  [(_SFAccountPickerTableViewController *)self _updateSections];
  uint64_t v4 = 1;
  if (self->_sectionForPasskeys != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v4 = 2;
  }
  if (self->_sectionForPasswordsMatchingHintStrings == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t v5 = self->_sectionForPasskeys != 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    int64_t v5 = v4;
  }
  if (self->_sectionForAllPasswords != 0x7FFFFFFFFFFFFFFFLL) {
    ++v5;
  }
  if (self->_sectionForVerificationCodes == 0x7FFFFFFFFFFFFFFFLL) {
    return v5;
  }
  else {
    return v5 + 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (self->_sectionForPasskeys == a4)
  {
    uint64_t v7 = [(NSMutableArray *)self->_savedAccountWithUsablePasskeys count];
    if (self->_passkeyNearbyDeviceOptions) {
      int64_t v8 = v7 + 1;
    }
    else {
      int64_t v8 = v7;
    }
  }
  else if (self->_sectionForPasswordsMatchingHintStrings == a4)
  {
    uint64_t v9 = [(NSMutableArray *)self->_savedAccountsMatchingHintStrings count];
    int64_t v8 = v9
       + [(SFAccountPickerConfiguration *)self->_configuration shouldAllowAddingNewPasswords];
    if ([(SFAccountPickerConfiguration *)self->_configuration shouldShowGeneratedPasswordsForDomain])
    {
      v8 += self->_hasMatchingGeneratedPasswords;
    }
  }
  else
  {
    if (self->_sectionForAllPasswords == a4)
    {
      uint64_t v10 = 1088;
    }
    else
    {
      if (self->_sectionForVerificationCodes != a4)
      {
        int64_t v8 = 0;
        goto LABEL_14;
      }
      uint64_t v10 = 1200;
    }
    int64_t v8 = [*(id *)((char *)&self->super.super.super.super.super.isa + v10) count];
  }
LABEL_14:

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (self->_sectionForPasskeys == a4)
  {
    if ([(NSMutableArray *)self->_savedAccountWithUsablePasskeys count])
    {
LABEL_10:
      int64_t v8 = _WBSLocalizedString();
      goto LABEL_12;
    }
  }
  else if (self->_sectionForAllPasswords == a4)
  {
    if ([(NSMutableArray *)self->_savedAccountsMatchingHintStrings count])
    {
      uint64_t v7 = [(_SFAccountTableViewController *)self searchPattern];
      [v7 length];
      int64_t v8 = _WBSLocalizedString();

      goto LABEL_12;
    }
  }
  else if (self->_sectionForVerificationCodes == a4 {
         || [(_SFAccountPickerTableViewController *)self _shouldShowAutoFillPasskeys]
  }
         || [(NSMutableArray *)self->_savedAccountsMatchingHintStrings count])
  {
    goto LABEL_10;
  }
  int64_t v8 = 0;
LABEL_12:

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch([(_SFAccountPickerTableViewController *)self _rowTypeForIndexPath:v7])
  {
    case 1:
      int64_t v8 = [v6 dequeueReusableCellWithIdentifier:@"addPassword"];
      if (!v8)
      {
        int64_t v8 = (SFAccountTableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"addPassword"];
        uint64_t v9 = +[_SFAccountManagerAppearanceValues buttonCellTextColor];
        uint64_t v10 = [(SFAccountTableViewCell *)v8 textLabel];
        [v10 setTextColor:v9];

        goto LABEL_13;
      }
      goto LABEL_34;
    case 2:
      int64_t v8 = [v6 dequeueReusableCellWithIdentifier:@"useNearbyDevice"];
      if (!v8)
      {
        int64_t v8 = (SFAccountTableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"useNearbyDevice"];
        v13 = +[_SFAccountManagerAppearanceValues buttonCellTextColor];
        id v14 = [(SFAccountTableViewCell *)v8 textLabel];
        [v14 setTextColor:v13];

LABEL_13:
        uint64_t v15 = _WBSLocalizedString();
        v16 = [(SFAccountTableViewCell *)v8 textLabel];
        [v16 setText:v15];
        goto LABEL_18;
      }
      goto LABEL_34;
    case 3:
      int v17 = [v6 dequeueReusableCellWithIdentifier:@"verificationCode"];
      id v18 = v17;
      if (v17) {
        uint64_t v19 = v17;
      }
      else {
        uint64_t v19 = (SFAccountTableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"verificationCode"];
      }
      int64_t v8 = v19;

      uint64_t v15 = [(_SFAccountPickerTableViewController *)self _cellConfigurationForVerificationCodeAtIndexPath:v7];
      [(SFAccountTableViewCell *)v8 setContentConfiguration:v15];
      goto LABEL_33;
    case 4:
      int64_t v8 = [v6 dequeueReusableCellWithIdentifier:@"generatedPasswords"];
      if (v8) {
        goto LABEL_34;
      }
      int64_t v8 = (SFAccountTableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"generatedPasswords"];
      v20 = _WBSLocalizedString();
      uint64_t v21 = [(SFAccountTableViewCell *)v8 textLabel];
      [v21 setText:v20];

      uint64_t v15 = +[_SFAccountManagerAppearanceValues buttonCellTextColor];
      v16 = [(SFAccountTableViewCell *)v8 textLabel];
      [v16 setTextColor:v15];
LABEL_18:

LABEL_33:
LABEL_34:

      return v8;
    default:
      int64_t v8 = [v6 dequeueReusableCellWithIdentifier:@"savedAccount"];
      if (!v8) {
        int64_t v8 = [[SFAccountTableViewCell alloc] initWithStyle:3 reuseIdentifier:@"savedAccount"];
      }
      if ([(SFAccountPickerConfiguration *)self->_configuration isForFillingIndividualAccountFields])
      {
        uint64_t v11 = 1;
      }
      else
      {
        uint64_t v11 = 4;
      }
      [(SFAccountTableViewCell *)v8 setAccessoryType:v11];
      [(SFAccountTableViewCell *)v8 setDelegate:self];
      BOOL v12 = [v7 section] == self->_sectionForPasswordsMatchingHintStrings
         || [v7 section] == self->_sectionForPasskeys;
      uint64_t v15 = [(_SFAccountPickerTableViewController *)self _savedAccountForIndexPath:v7];
      uint64_t v22 = [(_SFAccountTableViewController *)self searchPattern];
      -[SFAccountTableViewCell setSavedAccount:searchPattern:emphasizeUserName:shouldDifferentiateWithGroupName:](v8, "setSavedAccount:searchPattern:emphasizeUserName:shouldDifferentiateWithGroupName:", v15, v22, v12, [v15 hasSameUsernameAndHighLevelDomainAsOtherSharedSavedAccounts]);

      BOOL v23 = [v7 section] == self->_sectionForPasskeys || objc_msgSend(v15, "credentialTypes") != 2;
      int v24 = [(NSMutableArray *)self->_savedAccountWithUsablePasskeys containsObject:v15];
      int v25 = v24;
      if (v23
        || (v24 & 1) != 0
        || [(SFAccountPickerConfiguration *)self->_configuration forUserNamesOnly])
      {
        [(SFAccountTableViewCell *)v8 setUserInteractionEnabled:1];
        uint64_t v26 = [MEMORY[0x1E4FB1618] labelColor];
      }
      else
      {
        v27 = _WBSLocalizedString();
        objc_super v28 = [(SFAccountTableViewCell *)v8 detailTextLabel];
        [v28 setText:v27];

        [(SFAccountTableViewCell *)v8 setUserInteractionEnabled:0];
        uint64_t v26 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      }
      v29 = (void *)v26;
      v30 = [(SFAccountTableViewCell *)v8 textLabel];
      [v30 setTextColor:v29];

      uint64_t v31 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      v32 = [(SFAccountTableViewCell *)v8 detailTextLabel];
      [v32 setTextColor:v31];

      if (v25)
      {
        v33 = [v15 passkeyRelyingPartyID];
        int v34 = [v33 isEqualToString:@"apple.com"];

        if (v34) {
          [(SFAccountTableViewCell *)v8 setAccessoryType:0];
        }
      }
      goto LABEL_33;
  }
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if (self->_sectionForPasswordsMatchingHintStrings == a4
    && [(SFAccountPickerConfiguration *)self->_configuration shouldAllowAddingNewPasswords]&& ![(SFAccountPickerConfiguration *)self->_configuration shouldHideCreatePasswordsInSettingsHint])
  {
    int64_t v5 = objc_alloc_init(_SFTableLinkableFooterView);
    [(_SFTableLinkableFooterView *)v5 setDelegate:self];
    id v7 = _WBSLocalizedString();
    if ([MEMORY[0x1E4F98AF8] isPasswordsAppInstalled])
    {
      uint64_t v8 = _WBSLocalizedString();

      id v7 = (void *)v8;
    }
    uint64_t v9 = _WBSLocalizedString();
    [(_SFTableLinkableFooterView *)v5 setText:v7 linkPlaceholderString:@"%settings-link%" linkReplacementString:v9];
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch([(_SFAccountPickerTableViewController *)self _rowTypeForIndexPath:v7])
  {
    case 1:
      [v6 deselectRowAtIndexPath:v7 animated:1];
      self->_didPresentAddAccountViewControllerFromGeneratedPasswords = 0;
      [(_SFAccountPickerTableViewController *)self _presentAddPasswordViewController];
      goto LABEL_18;
    case 2:
      authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
      passkeyNearbyDeviceOptions = self->_passkeyNearbyDeviceOptions;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __73___SFAccountPickerTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v27[3] = &unk_1E5C72678;
      v27[4] = self;
      [(WBSAuthenticationServicesAgentProxy *)authenticationServicesAgentProxy userSelectedAutoFillNearbyDevice:passkeyNearbyDeviceOptions completionHandler:v27];
      goto LABEL_18;
    case 3:
      uint64_t v10 = -[NSArray objectAtIndexedSubscript:](self->_verificationCodes, "objectAtIndexedSubscript:", [v7 row]);
      [(_SFAccountPickerTableViewController *)self _consumeAndFillVerificationCode:v10];

      goto LABEL_5;
    case 4:
      [(_SFAccountPickerTableViewController *)self _presentGeneratedPasswordsViewController];
      uint64_t v19 = [(_SFAccountPickerTableViewController *)self tableView];
      [v19 deselectRowAtIndexPath:v7 animated:1];

      goto LABEL_18;
    default:
LABEL_5:
      if ([v7 section] == self->_sectionForPasskeys)
      {
        uint64_t v11 = [(_SFAccountPickerTableViewController *)self _savedAccountForIndexPath:v7];
        BOOL v12 = v11;
        if (v11)
        {
          autoFillPasskeys = self->_autoFillPasskeys;
          uint64_t v22 = MEMORY[0x1E4F143A8];
          uint64_t v23 = 3221225472;
          int v24 = __73___SFAccountPickerTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_243;
          int v25 = &unk_1E5C77B98;
          id v26 = v11;
          id v14 = [(NSArray *)autoFillPasskeys safari_firstObjectPassingTest:&v22];
          uint64_t v15 = self->_authenticationServicesAgentProxy;
          authenticatedContext = self->_authenticatedContext;
          int v17 = [(SFAccountPickerConfiguration *)self->_configuration savedAccountContext];
          [(WBSAuthenticationServicesAgentProxy *)v15 userSelectedAutoFillPasskey:v14 authenticatedLAContext:authenticatedContext savedAccountContext:v17 completionHandler:&__block_literal_global_246];

          id v18 = [(_SFAccountPickerTableViewController *)self delegate];
          [v18 accountPickerTableViewControllerDidCancel:self];
        }
        else
        {
          v20 = WBS_LOG_CHANNEL_PREFIXAutoFill();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[_SFAccountPickerTableViewController tableView:didSelectRowAtIndexPath:]();
          }
        }
      }
      else
      {
        if ([(SFAccountPickerConfiguration *)self->_configuration isForFillingIndividualAccountFields])
        {
          [(_SFAccountPickerTableViewController *)self _showAccountDetailsForSavedAccountAtIndexPath:v7];
          goto LABEL_18;
        }
        BOOL v12 = [(_SFAccountPickerTableViewController *)self _savedAccountForIndexPath:v7];
        if (v12)
        {
          [(_SFAccountPickerTableViewController *)self _didPickSavedAccountForPasswordButPresentAlertToAddAdditionalSiteIfApplicable:v12];
        }
        else
        {
          uint64_t v21 = WBS_LOG_CHANNEL_PREFIXAutoFill();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            -[_SFAccountPickerTableViewController tableView:didSelectRowAtIndexPath:]();
          }
        }
      }

LABEL_18:
      return;
  }
}

- (void)linkableFooterViewDidInteractWithLink:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F98C98], "passwordManagerURL", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (void)_presentGeneratedPasswordsViewController
{
  BOOL v3 = (void *)MEMORY[0x1E4F88170];
  uint64_t v4 = [(_SFAccountPickerTableViewController *)self _generatedPasswordsDomainHintString];
  int64_t v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = &stru_1EFB97EB8;
  }
  id v8 = [v3 makeUIViewControllerWithDelegate:self searchTerm:v6 alwaysShowSearchBar:0];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v8];
  [v7 setModalPresentationStyle:2];
  [(_SFAccountPickerTableViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5 = a4;
  if (![(SFAccountPickerConfiguration *)self->_configuration isForFillingIndividualAccountFields])[(_SFAccountPickerTableViewController *)self _showAccountDetailsForSavedAccountAtIndexPath:v5]; {
}
  }

- (void)_showAccountDetailsForSavedAccountAtIndexPath:(id)a3
{
  uint64_t v4 = (NSIndexPath *)a3;
  id v9 = [(_SFAccountPickerTableViewController *)self _savedAccountForIndexPath:v4];
  id v5 = [(_SFAccountPickerTableViewController *)self _detailViewControllerForSavedAccount:v9];
  id v6 = [(_SFAccountPickerTableViewController *)self tableView];
  [v6 selectRowAtIndexPath:v4 animated:1 scrollPosition:0];

  id v7 = [(_SFAccountPickerTableViewController *)self navigationController];
  [v7 pushViewController:v5 animated:1];

  indexPathOfRowShowingDetailView = self->_indexPathOfRowShowingDetailView;
  self->_indexPathOfRowShowingDetailView = v4;

  objc_storeWeak((id *)&self->_detailViewController, v5);
  [(_SFAccountPickerTableViewController *)self reloadTable];
}

- (void)_showAccountDetailsForSavedAccount:(id)a3
{
  id v7 = a3;
  uint64_t v4 = -[_SFAccountPickerTableViewController _indexPathForSavedAccount:](self, "_indexPathForSavedAccount:");
  if (v4)
  {
    [(_SFAccountPickerTableViewController *)self _showAccountDetailsForSavedAccountAtIndexPath:v4];
  }
  else
  {
    id v5 = [(_SFAccountPickerTableViewController *)self _detailViewControllerForSavedAccount:v7];
    id v6 = [(_SFAccountPickerTableViewController *)self navigationController];
    [v6 pushViewController:v5 animated:1];

    objc_storeWeak((id *)&self->_detailViewController, v5);
  }
}

- (id)_detailViewControllerForSavedAccount:(id)a3
{
  id v4 = a3;
  id v5 = [[SFAccountDetailViewController alloc] initWithSavedAccount:v4 passwordWarning:0 options:0];

  [(SFAccountDetailViewController *)v5 setDelegate:self];
  [(SFAccountDetailViewController *)v5 setIsForFillingIndividualAccountFields:[(SFAccountPickerConfiguration *)self->_configuration isForFillingIndividualAccountFields]];

  return v5;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_SFAccountPickerTableViewController;
  return [(_SFAccountPickerTableViewController *)&v5 tableView:a3 shouldShowMenuForRowAtIndexPath:a4];
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)_SFAccountPickerTableViewController;
  return [(_SFAccountPickerTableViewController *)&v7 tableView:a3 canPerformAction:a4 forRowAtIndexPath:a5 withSender:a6];
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ((unint64_t)([(_SFAccountPickerTableViewController *)self _rowTypeForIndexPath:v5]- 1) >= 4)
  {
    objc_super v7 = [(_SFAccountPickerTableViewController *)self _savedAccountForIndexPath:v5];
    id v8 = [v7 passkeyRelyingPartyID];
    char v9 = [v8 isEqualToString:@"apple.com"];

    if (v9)
    {
      id v6 = 0;
    }
    else
    {
      uint64_t v10 = _WBSLocalizedString();
      uint64_t v11 = (void *)MEMORY[0x1E4FB1688];
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      id v18 = __100___SFAccountPickerTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
      uint64_t v19 = &unk_1E5C77BC0;
      v20 = self;
      id v21 = v5;
      BOOL v12 = [v11 contextualActionWithStyle:1 title:v10 handler:&v16];
      v13 = (void *)MEMORY[0x1E4FB1CC0];
      v22[0] = v12;
      id v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v22, 1, v16, v17, v18, v19, v20);
      id v6 = [v13 configurationWithActions:v14];

      [v6 setPerformsFirstActionWithFullSwipe:0];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_presentAlertToConfirmDeletingAccountsAtIndexPath:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_SFAccountPickerTableViewController *)self _savedAccountForIndexPath:v4];
  id v6 = (void *)MEMORY[0x1E4F18B28];
  v25[0] = v5;
  objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  id v8 = [v6 configurationForDeletingSavedAccounts:v7];

  char v9 = (void *)MEMORY[0x1E4FB1418];
  uint64_t v10 = [v8 title];
  uint64_t v11 = [v8 subtitle];
  BOOL v12 = [v9 alertControllerWithTitle:v10 message:v11 preferredStyle:_SFDeviceAlertStyle()];

  v13 = [v12 view];
  [v13 setAccessibilityIdentifier:@"DeleteCredentialConfirmation"];

  objc_initWeak(&location, self);
  id v14 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v15 = [v8 buttonTitle];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __89___SFAccountPickerTableViewController__presentAlertToConfirmDeletingAccountsAtIndexPath___block_invoke;
  v21[3] = &unk_1E5C72938;
  objc_copyWeak(&v23, &location);
  id v16 = v4;
  id v22 = v16;
  uint64_t v17 = [v14 actionWithTitle:v15 style:2 handler:v21];
  [v12 addAction:v17];

  id v18 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v19 = _WBSLocalizedString();
  v20 = [v18 actionWithTitle:v19 style:1 handler:0];
  [v12 addAction:v20];

  [(_SFAccountPickerTableViewController *)self presentViewController:v12 animated:1 completion:0];
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)_deleteSavedAccountAtIndexPath:(id)a3
{
  id v4 = [(_SFAccountPickerTableViewController *)self _savedAccountForIndexPath:a3];
  [(_SFAccountPickerTableViewController *)self _removeSavedAccount:v4 modifyingAccountStore:1];
}

- (void)_removeSavedAccount:(id)a3 modifyingAccountStore:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = [(NSMutableArray *)self->_savedAccountsMatchingHintStrings indexOfObject:v6];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL
    || (uint64_t v9 = v8,
        [(NSMutableArray *)self->_savedAccountsMatchingHintStrings removeObject:v6],
        self->_sectionForPasswordsMatchingHintStrings == 0x7FFFFFFFFFFFFFFFLL))
  {
    BOOL v10 = 0;
  }
  else
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v9);
    [v7 addObject:v11];
    BOOL v10 = [(NSMutableArray *)self->_savedAccountsMatchingHintStrings count] == 0;
  }
  uint64_t v12 = [(NSMutableArray *)self->_savedAccountWithUsablePasskeys indexOfObject:v6];
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v13 = v12;
    [(NSMutableArray *)self->_savedAccountWithUsablePasskeys removeObject:v6];
    if (self->_sectionForPasskeys != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v14 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v13);
      [v7 addObject:v14];
      if (![(NSMutableArray *)self->_savedAccountWithUsablePasskeys count]) {
        BOOL v10 = 1;
      }
    }
  }
  uint64_t v15 = [(NSMutableArray *)self->_matchingSavedAccounts indexOfObject:v6];
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v16 = v15;
    [(NSMutableArray *)self->_matchingSavedAccounts removeObject:v6];
    if (self->_sectionForAllPasswords != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v16);
      [v7 addObject:v17];
      if (![(NSMutableArray *)self->_matchingSavedAccounts count]) {
        BOOL v10 = 1;
      }
    }
  }
  if (!v4
    || ([MEMORY[0x1E4F98DF8] sharedStore],
        id v18 = objc_claimAutoreleasedReturnValue(),
        [v18 _moveCredentialTypesToRecentlyDeleted:3 fromSavedAccount:v6],
        uint64_t v19 = objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        v19))
  {
    if (v10)
    {
      v20 = [(_SFAccountPickerTableViewController *)self tableView];
      [v20 reloadData];
    }
    else
    {
      if (![v7 count])
      {
LABEL_22:
        [(NSMutableArray *)self->_savedAccounts removeObject:v6];
        id v21 = objc_alloc_init(MEMORY[0x1E4FB60F8]);
        [v21 schedulePasswordIconsCleanup];

        goto LABEL_23;
      }
      v20 = [(_SFAccountPickerTableViewController *)self tableView];
      [v20 deleteRowsAtIndexPaths:v7 withRowAnimation:100];
    }

    goto LABEL_22;
  }
  id v22 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[_SFAccountPickerTableViewController _removeSavedAccount:modifyingAccountStore:]();
  }
  id v23 = _WBSLocalizedString();
  [(_SFAccountPickerTableViewController *)self _presentErrorAlertWithString:v23];

LABEL_23:
}

- (void)_presentErrorAlertWithString:(id)a3
{
  id v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:a3 message:0 preferredStyle:1];
  BOOL v4 = (void *)MEMORY[0x1E4FB1410];
  id v5 = _WBSLocalizedString();
  id v6 = [v4 actionWithTitle:v5 style:0 handler:0];
  [v7 addAction:v6];

  [(_SFAccountPickerTableViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if ([(_SFAccountPickerTableViewController *)self _shouldUseEmptyHeaderFooterHeightInSection:a4])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  BOOL v4 = [(_SFAccountPickerTableViewController *)self _shouldUseEmptyHeaderFooterHeightInSection:a4];
  id v5 = (double *)&SFAccountListEmptyHeaderFooterHeight;
  if (!v4) {
    id v5 = (double *)MEMORY[0x1E4FB2F28];
  }
  return *v5;
}

- (BOOL)_shouldUseEmptyHeaderFooterHeightInSection:(int64_t)a3
{
  if (a3) {
    return 0;
  }
  id v5 = [(_SFAccountPickerTableViewController *)self tableView];
  id v6 = [(_SFAccountPickerTableViewController *)self tableView:v5 titleForHeaderInSection:0];
  BOOL v3 = v6 == 0;

  return v3;
}

- (void)searchPatternDidUpdate
{
  [(_SFAccountPickerTableViewController *)self _updateMatchingPasswords];
  id v3 = [(_SFAccountPickerTableViewController *)self tableView];
  [v3 reloadData];
}

- (void)_updateMatchingPasswords
{
  id v3 = [(_SFAccountTableViewController *)self searchPattern];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    savedAccounts = self->_savedAccounts;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63___SFAccountPickerTableViewController__updateMatchingPasswords__block_invoke_3;
    v13[3] = &unk_1E5C77B28;
    v13[4] = self;
    id v6 = [(NSMutableArray *)savedAccounts safari_filterObjectsUsingBlock:v13];
    id v7 = (NSMutableArray *)[v6 mutableCopy];
    matchingSavedAccounts = self->_matchingSavedAccounts;
    self->_matchingSavedAccounts = v7;
  }
  else
  {
    uint64_t v9 = self->_savedAccounts;
    if (self->_savedAccountsMatchingHintStrings)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __63___SFAccountPickerTableViewController__updateMatchingPasswords__block_invoke;
      v14[3] = &unk_1E5C77B28;
      v14[4] = self;
      BOOL v10 = [(NSMutableArray *)v9 safari_filterObjectsUsingBlock:v14];
      uint64_t v11 = (NSMutableArray *)[v10 mutableCopy];
      uint64_t v12 = self->_matchingSavedAccounts;
      self->_matchingSavedAccounts = v11;
    }
    else
    {
      objc_storeStrong((id *)&self->_matchingSavedAccounts, v9);
    }
  }
  if (![(SFAccountPickerConfiguration *)self->_configuration shouldShowPasskeysInAccountPicker])[(NSMutableArray *)self->_matchingSavedAccounts safari_removeObjectsPassingTest:&__block_literal_global_282]; {
}
  }

- (id)_generatedPasswordsDomainHintString
{
  id v3 = [(SFAccountPickerConfiguration *)self->_configuration addPasswordSuggestedDomain];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = objc_msgSend(v3, "safari_highLevelDomainForPasswordManager");
  }
  else
  {
    id v6 = [(SFAccountPickerConfiguration *)self->_configuration domainHintStrings];
    id v7 = [v6 firstObject];
    id v5 = objc_msgSend(v7, "safari_highLevelDomainForPasswordManager");
  }

  return v5;
}

- (void)_updateMatchingGeneratedPasswordsState
{
  id v3 = [(_SFAccountPickerTableViewController *)self _generatedPasswordsDomainHintString];

  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F18D98];
    id v5 = [(_SFAccountPickerTableViewController *)self _generatedPasswordsDomainHintString];
    id v6 = [@"https://" stringByAppendingString:v5];
    id v7 = objc_msgSend(v6, "safari_bestURLForUserTypedString");
    objc_msgSend(v4, "safari_HTMLFormProtectionSpaceForURL:", v7);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v8 = [MEMORY[0x1E4F98B70] sharedStore];
    uint64_t v9 = [v8 generatedPasswordsForProtectionSpace:v10 options:1];
    self->_hasMatchingGeneratedPasswords = [v9 count] != 0;
  }
  else
  {
    self->_hasMatchingGeneratedPasswords = 0;
  }
}

- (BOOL)_shouldShowAutoFillPasskeys
{
  BOOL v3 = [(SFAccountPickerConfiguration *)self->_configuration shouldShowAutoFillPasskeys];
  if (v3)
  {
    if ([(NSMutableArray *)self->_savedAccountWithUsablePasskeys count]) {
      LOBYTE(v3) = 1;
    }
    else {
      LOBYTE(v3) = self->_passkeyNearbyDeviceOptions != 0;
    }
  }
  return v3;
}

- (BOOL)_shouldShowPasswordsMatchingHintStringsSection
{
  BOOL v3 = [(_SFAccountTableViewController *)self searchPattern];
  uint64_t v4 = [v3 length];

  if (v4) {
    return 0;
  }
  if ([(SFAccountPickerConfiguration *)self->_configuration shouldAllowAddingNewPasswords])
  {
    return 1;
  }
  return [(NSMutableArray *)self->_savedAccountsMatchingHintStrings count] != 0;
}

- (void)_updateSections
{
  self->_sectionForPasskeys = 0x7FFFFFFFFFFFFFFFLL;
  self->_sectionForPasswordsMatchingHintStrings = 0x7FFFFFFFFFFFFFFFLL;
  self->_sectionForAllPasswords = 0x7FFFFFFFFFFFFFFFLL;
  self->_sectionForVerificationCodes = 0x7FFFFFFFFFFFFFFFLL;
  if ([(NSArray *)self->_verificationCodes count])
  {
    self->_sectionForVerificationCodes = 0;
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = 0;
  }
  if ([(_SFAccountPickerTableViewController *)self _shouldShowAutoFillPasskeys]) {
    self->_sectionForPasskeys = v3++;
  }
  if ([(_SFAccountPickerTableViewController *)self _shouldShowPasswordsMatchingHintStringsSection])
  {
    self->_sectionForPasswordsMatchingHintStrings = v3++;
  }
  self->_sectionForAllPasswords = v3;
}

- (id)_savedAccountForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  uint64_t v6 = [v4 row];

  if (v5 == self->_sectionForPasskeys)
  {
    if (v6 < 0 || (uint64_t v7 = 1104, v6 >= [(NSMutableArray *)self->_savedAccountWithUsablePasskeys count]))
    {
      uint64_t v8 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[_SFAccountPickerTableViewController _savedAccountForIndexPath:]();
      }
      goto LABEL_17;
    }
LABEL_14:
    id v10 = [*(id *)((char *)&self->super.super.super.super.super.isa + v7) objectAtIndexedSubscript:v6];
    goto LABEL_18;
  }
  if (v5 == self->_sectionForPasswordsMatchingHintStrings)
  {
    if (v6 < 0 || (uint64_t v7 = 1072, v6 >= [(NSMutableArray *)self->_savedAccountsMatchingHintStrings count]))
    {
      uint64_t v9 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_SFAccountPickerTableViewController _savedAccountForIndexPath:]();
      }
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  if (v5 == self->_sectionForAllPasswords)
  {
    if (v6 < 0 || (uint64_t v7 = 1088, v6 >= [(NSMutableArray *)self->_matchingSavedAccounts count]))
    {
      uint64_t v11 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_SFAccountPickerTableViewController _savedAccountForIndexPath:]();
      }
      goto LABEL_17;
    }
    goto LABEL_14;
  }
LABEL_17:
  id v10 = 0;
LABEL_18:

  return v10;
}

- (id)_indexPathForSavedAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableArray *)self->_savedAccountWithUsablePasskeys count];
  if (v5 < 1)
  {
LABEL_5:
    uint64_t v11 = [(NSMutableArray *)self->_savedAccountsMatchingHintStrings count];
    if (v11 < 1)
    {
LABEL_9:
      uint64_t v15 = [(NSMutableArray *)self->_matchingSavedAccounts count];
      if (v15 < 1)
      {
LABEL_13:
        uint64_t v19 = 0;
        goto LABEL_15;
      }
      uint64_t v16 = v15;
      uint64_t v7 = 0;
      uint64_t v8 = &OBJC_IVAR____SFAccountPickerTableViewController__sectionForAllPasswords;
      while (1)
      {
        uint64_t v17 = [(NSMutableArray *)self->_matchingSavedAccounts objectAtIndexedSubscript:v7];
        char v18 = [v4 isEqual:v17];

        if (v18) {
          break;
        }
        if (v16 == ++v7) {
          goto LABEL_13;
        }
      }
    }
    else
    {
      uint64_t v12 = v11;
      uint64_t v7 = 0;
      uint64_t v8 = &OBJC_IVAR____SFAccountPickerTableViewController__sectionForPasswordsMatchingHintStrings;
      while (1)
      {
        uint64_t v13 = [(NSMutableArray *)self->_savedAccountsMatchingHintStrings objectAtIndexedSubscript:v7];
        char v14 = [v4 isEqual:v13];

        if (v14) {
          break;
        }
        if (v12 == ++v7) {
          goto LABEL_9;
        }
      }
    }
  }
  else
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = &OBJC_IVAR____SFAccountPickerTableViewController__sectionForPasskeys;
    while (1)
    {
      uint64_t v9 = [(NSMutableArray *)self->_savedAccountWithUsablePasskeys objectAtIndexedSubscript:v7];
      char v10 = [v4 isEqual:v9];

      if (v10) {
        break;
      }
      if (v6 == ++v7) {
        goto LABEL_5;
      }
    }
  }
  uint64_t v19 = [MEMORY[0x1E4F28D58] indexPathForRow:v7 inSection:*(Class *)((char *)&self->super.super.super.super.super.isa + *v8)];
LABEL_15:

  return v19;
}

- (void)accountDetailViewController:(id)a3 didMoveSavedAccountToRecentlyDeleted:(id)a4
{
}

- (void)accountDetailViewController:(id)a3 fillUsernameForSavedAccount:(id)a4
{
}

- (void)accountDetailViewController:(id)a3 fillPasswordForSavedAccount:(id)a4
{
}

- (void)accountDetailViewController:(id)a3 fillVerificationCodeForSavedAccount:(id)a4
{
}

- (void)passwordManagerLogViewControllerWantsToSaveGeneratedPassword:(id)a3
{
  self->_didPresentAddAccountViewControllerFromGeneratedPasswords = 1;
  objc_storeStrong((id *)&self->_generatedPasswordBeingTransformedIntoSavedAccount, a3);

  [(_SFAccountPickerTableViewController *)self _presentAddPasswordViewController];
}

- (void)passwordManagerLogViewControllerWantsToDismiss
{
  id v2 = [(_SFAccountPickerTableViewController *)self presentedViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (_SFAccountPickerTableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFAccountPickerTableViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SFAccountPickerConfiguration)configuration
{
  return self->_configuration;
}

- (LAContext)authenticatedContext
{
  return self->_authenticatedContext;
}

- (void)setAuthenticatedContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticatedContext, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_generatedPasswordBeingTransformedIntoSavedAccount, 0);
  objc_storeStrong((id *)&self->_verificationCodes, 0);
  objc_storeStrong((id *)&self->_verificationCodeProvider, 0);
  objc_destroyWeak((id *)&self->_detailViewController);
  objc_storeStrong((id *)&self->_addPasswordViewController, 0);
  objc_storeStrong((id *)&self->_addNavigationBarItem, 0);
  objc_storeStrong((id *)&self->_indexPathOfRowShowingDetailView, 0);
  objc_storeStrong((id *)&self->_authenticationServicesAgentProxy, 0);
  objc_storeStrong((id *)&self->_passkeyNearbyDeviceOptions, 0);
  objc_storeStrong((id *)&self->_savedAccountWithUsablePasskeys, 0);
  objc_storeStrong((id *)&self->_autoFillPasskeys, 0);
  objc_storeStrong((id *)&self->_matchingSavedAccounts, 0);
  objc_storeStrong((id *)&self->_savedAccounts, 0);

  objc_storeStrong((id *)&self->_savedAccountsMatchingHintStrings, 0);
}

- (void)tableView:didSelectRowAtIndexPath:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "Failed to get saved account for selection in passkey section of picker.", v2, v3, v4, v5, v6);
}

- (void)tableView:didSelectRowAtIndexPath:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "Failed to get saved account for selection in picker.", v2, v3, v4, v5, v6);
}

- (void)_removeSavedAccount:modifyingAccountStore:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "Failed to move password to recently deleted.", v2, v3, v4, v5, v6);
}

- (void)_savedAccountForIndexPath:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "Received row index that is outside of bounds of usable passkeys array.", v2, v3, v4, v5, v6);
}

- (void)_savedAccountForIndexPath:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "Received row index that is outside of bounds of passwords matching hint strings array.", v2, v3, v4, v5, v6);
}

- (void)_savedAccountForIndexPath:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "Received row index that is outside of bounds of all passwords array.", v2, v3, v4, v5, v6);
}

@end