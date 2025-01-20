@interface SFAccountDetailViewController
- (BOOL)_allowAuditing;
- (BOOL)_allowEditing;
- (BOOL)_canUserDeleteSavedAccount;
- (BOOL)_completedUpgrade;
- (BOOL)_shouldAddDeletePasskeyItem;
- (BOOL)_shouldShowAccountOptionsHeader;
- (BOOL)_shouldShowMenuForItemIdentifier:(int64_t)a3;
- (BOOL)_shouldShowSecurityRecommendationSection;
- (BOOL)_shouldUseZeroHeightHeaderForSectionType:(int64_t)a3;
- (BOOL)_softDeletePasskey;
- (BOOL)_softDeletePassword;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)canBecomeFirstResponder;
- (BOOL)dataSource:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)isForFillingIndividualAccountFields;
- (BOOL)shouldSuppressAccountManagerLockedView;
- (BOOL)showsChangePasswordControllerOnAppearance;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4;
- (SFAccountDetailViewController)initWithSavedAccount:(id)a3 passwordWarning:(id)a4 options:(unint64_t)a5;
- (SFAccountDetailViewControllerDelegate)delegate;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_accountHeaderSectionFooterView;
- (id)_airDropMenu;
- (id)_allSharedCredentialGroupsMenu;
- (id)_cellForIdentifier:(id)a3 indexPath:(id)a4;
- (id)_cellsThatChangeAppearanceOnEdit;
- (id)_changePasswordURL;
- (id)_createShareBarButtonItem;
- (id)_deleteCellForTableView:(id)a3;
- (id)_deletePasskeyCellForTableView:(id)a3;
- (id)_deletePasswordCellForTableView:(id)a3 shouldRemoveTOTPGenerator:(BOOL)a4;
- (id)_editableCellWithCell:(id)a3;
- (id)_footerTextForLastOneTimeShareDate:(id)a3;
- (id)_groupPickerTableViewCell;
- (id)_groupSectionValueStyleTableViewCellWithText:(id)a3 secondaryText:(id)a4;
- (id)_indexPathForEditMenuInteraction:(id)a3 withConfiguration:(id)a4;
- (id)_lastModifiedDateString;
- (id)_moveRecentlyDeletedAccountToMyPasswordsCell;
- (id)_newSecretEntryAlertController;
- (id)_originalContributorCell;
- (id)_passkeyCreationDateString;
- (id)_passkeyFooterView;
- (id)_passkeySectionFooterView;
- (id)_passwordAuditor;
- (id)_passwordEvaluator;
- (id)_passwordGenerator;
- (id)_passwordWarningManager;
- (id)_recoverRecentlyDeletedAccountCell;
- (id)_savedAccountWebsiteCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_securePasswordPlaceholderText:(id)a3;
- (id)_securityRecommendationSubtitleString;
- (id)_subtitleStringForSignInWithAppleUpgrade;
- (id)_subtitleStringForStrongPasswordUpgrade;
- (id)_warningTitleForPassword;
- (id)dataSource:(id)a3 footerTextForSection:(int64_t)a4;
- (id)dataSource:(id)a3 headerTextForSection:(int64_t)a4;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (id)presentationAnchorForAccountAuthenticationModificationController:(id)a3;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)_itemTypeForIdentifier:(id)a3;
- (int64_t)_listContentTextAlignmentOfCellsInDeleteAccountSection;
- (int64_t)_sectionTypeForSection:(int64_t)a3;
- (int64_t)_textAlignmentOfCellsInDeleteAccountSection;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)QRCodeScannerViewController:(id)a3 didScanQRCodeWithURLValue:(id)a4;
- (void)_accountStoreDidUpdate;
- (void)_addAccountUpgradeItemsForSectionType:(int64_t)a3 toSnapshot:(id)a4;
- (void)_addGroupCellsToSnapshot:(id)a3;
- (void)_addNotesSectionToSnapshot:(id)a3;
- (void)_addTOTPGenerator:(id)a3;
- (void)_addTOTPGeneratorsToSnapshot:(id)a3;
- (void)_cancelBarButtonItemTapped:(id)a3;
- (void)_cancelChangesAndFinishEditing;
- (void)_completedSignInWithAppleUpgrade;
- (void)_completedStrongPasswordUpgrade;
- (void)_configureCell:(id)a3 withText:(id)a4 detailText:(id)a5 detailPlaceholderText:(id)a6 secureEntry:(BOOL)a7;
- (void)_configureDeleteSectionInSnapshot:(id)a3;
- (void)_configureHeaderViewCell:(id)a3;
- (void)_configurePasswordCell:(id)a3;
- (void)_configureSecurityRecommendationInfoCell;
- (void)_configureUserCell:(id)a3;
- (void)_deleteTOTPGenerator:(id)a3;
- (void)_deleteTOTPGeneratorWithConfirmation:(id)a3;
- (void)_editBarButtonItemTapped:(id)a3;
- (void)_fillPassword;
- (void)_fillUsername;
- (void)_fillVerificationCode;
- (void)_handleLongPressGesture:(id)a3;
- (void)_hideSecurityRecommendation;
- (void)_initiateChangeToStrongPassword;
- (void)_initiateUpgradeToSignInWithApple;
- (void)_moveSavedAccountToMyPasswords;
- (void)_openChangePasswordURLInWebBrowser;
- (void)_openURLInSafariViewController:(id)a3 shouldSupressPasswordUpdatePrompts:(BOOL)a4;
- (void)_permanentlyDeleteAllCredentials;
- (void)_permanentlyDeletePasskey;
- (void)_permanentlyDeletePassword;
- (void)_popViewController;
- (void)_presentConfirmationAlertToShareSavedAccountToGroup:(id)a3;
- (void)_presentDialogToConfirmCancelEditing;
- (void)_presentErrorAlertForFailingToMoveAccountToGroup:(id)a3;
- (void)_presentErrorAlertForFailingToRecoverRecentlyDeletedSavedAccount;
- (void)_presentHideSecurityRecommendationConfirmationAlert;
- (void)_presentMoveRecentlyDeletedSavedAccountToMyPasswordsConfirmationAlert;
- (void)_presentSoftDeleteErrorAlertForCredentialTypes:(int64_t)a3;
- (void)_processAccountStoreUpdateWithSavedAccounts:(id)a3;
- (void)_recoverSavedAccount;
- (void)_reloadDiffableDataSourceAnimated:(BOOL)a3;
- (void)_reloadDiffableDataSourceOnInternalQueueAnimated:(BOOL)a3;
- (void)_reloadPasskeySectionFooters;
- (void)_replaceAddPasswordButtonWithPasswordCell;
- (void)_revealPasswordIfNecessary;
- (void)_saveAccountAndFinishEditing;
- (void)_setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)_setHighLyLegibleFontForDetailTextInCell:(id)a3;
- (void)_shareBarButtonItemTapped:(id)a3;
- (void)_sharePasswordWithAuthenticationContext:(id)a3 popoverPresentationControllerConfiguration:(id)a4;
- (void)_sharePasswordWithPopoverPresentationControllerConfiguration:(id)a3;
- (void)_showChangePasswordSafariViewController;
- (void)_showConfirmationToDeleteCredentialTypes:(int64_t)a3;
- (void)_showConfirmationToDeletePasswordAndTOTPGenerator;
- (void)_showConfirmationToPermanentlyDeleteCredentialTypes:(int64_t)a3;
- (void)_showConfirmationToPermanentlyDeletePasswordAndTOTPGenerator;
- (void)_showConfirmationToSoftDeleteCredentialTypes:(int64_t)a3;
- (void)_showConfirmationToSoftDeletePasswordAndTOTPGenerator;
- (void)_softDeletePassword;
- (void)_textFieldChanged:(id)a3;
- (void)_updateAccountModificationOptions;
- (void)_updateAddButtonsInAccountOptionsSectionForSnapshot:(id)a3;
- (void)_updateAddPasswordButton:(BOOL)a3 forSnapshot:(id)a4;
- (void)_updateCachedTOTPGenerators;
- (void)_updateHeaderViewCell;
- (void)_updateIconForCell:(id)a3;
- (void)_updatePasswordFieldTextSuggestions:(id)a3;
- (void)_updateSavedAccountChangeRequest;
- (void)_updateWarningForSavedAccount;
- (void)accountAuthenticationModificationController:(id)a3 didFailRequest:(id)a4 withError:(id)a5;
- (void)accountAuthenticationModificationController:(id)a3 didSuccessfullyCompleteRequest:(id)a4 withUserInfo:(id)a5;
- (void)accountDetailHeaderViewCell:(id)a3 titleTextFieldDidChange:(id)a4;
- (void)accountModificationExtensionManagerExtensionListDidChange:(id)a3;
- (void)dataSource:(id)a3 commitEditingStyle:(int64_t)a4 forItemIdentifier:(id)a5;
- (void)dealloc;
- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)linkableFooterViewDidInteractWithLink:(id)a3;
- (void)noteTableViewCellTextViewTapped:(id)a3;
- (void)passwordManagerWillLock;
- (void)returnKeyActivatedInAccountDetailHeaderViewCell:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsForFillingIndividualAccountFields:(BOOL)a3;
- (void)setShowsChangePasswordControllerOnAppearance:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textFieldDidEndEditing:(id)a3;
- (void)totpMigrationController:(id)a3 presentDetailsForSavedAccount:(id)a4;
- (void)totpMigrationController:(id)a3 presentPickerForGenerator:(id)a4;
- (void)totpMigrationControllerFinishedImport:(id)a3;
- (void)updatedIconIsAvailableForDomain:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SFAccountDetailViewController

- (SFAccountDetailViewController)initWithSavedAccount:(id)a3 passwordWarning:(id)a4 options:(unint64_t)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = [(SFAccountDetailViewController *)self initWithStyle:+[_SFAccountManagerAppearanceValues preferencesTableViewStyle]];
  v12 = v11;
  if (v11)
  {
    v13 = [(SFAccountDetailViewController *)v11 navigationItem];
    v12->_options = a5;
    if ([(SFAccountDetailViewController *)v12 _allowEditing])
    {
      uint64_t v14 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:2 target:v12 action:sel__editBarButtonItemTapped_];
      editBarButtonItem = v12->_editBarButtonItem;
      v12->_editBarButtonItem = (UIBarButtonItem *)v14;

      [(UIBarButtonItem *)v12->_editBarButtonItem setAccessibilityIdentifier:@"PasswordDetailViewNavigationBarEditButton"];
      uint64_t v16 = [(SFAccountDetailViewController *)v12 _createShareBarButtonItem];
      shareBarButtonItem = v12->_shareBarButtonItem;
      v12->_shareBarButtonItem = (UIBarButtonItem *)v16;

      [(UIBarButtonItem *)v12->_shareBarButtonItem setAccessibilityIdentifier:@"PasswordDetailViewNavigationBarShareButton"];
      uint64_t v18 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v12 action:sel__cancelBarButtonItemTapped_];
      cancelBarButtonItem = v12->_cancelBarButtonItem;
      v12->_cancelBarButtonItem = (UIBarButtonItem *)v18;

      [(UIBarButtonItem *)v12->_cancelBarButtonItem setAccessibilityIdentifier:@"PasswordDetailViewNavigationBarCancelButton"];
      uint64_t v20 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:v12 action:sel__doneBarButtonItemTapped_];
      doneBarButtonItem = v12->_doneBarButtonItem;
      v12->_doneBarButtonItem = (UIBarButtonItem *)v20;

      [(UIBarButtonItem *)v12->_doneBarButtonItem setAccessibilityIdentifier:@"PasswordDetailViewNavigationBarDoneButton"];
      v22 = [MEMORY[0x1E4F78290] sharedFeatureManager];
      if ([v22 isAirDropPasswordsAvailable])
      {
        v34 = v12->_editBarButtonItem;
        v35 = v12->_shareBarButtonItem;
        v23 = (void *)MEMORY[0x1E4F1C978];
        v24 = &v34;
        uint64_t v25 = 2;
      }
      else
      {
        v33 = v12->_editBarButtonItem;
        v23 = (void *)MEMORY[0x1E4F1C978];
        v24 = &v33;
        uint64_t v25 = 1;
      }
      v26 = objc_msgSend(v23, "arrayWithObjects:count:", v24, v25, v33, v34, v35, v36);
      [v13 setRightBarButtonItems:v26];
    }
    -[UIBarButtonItem setEnabled:](v12->_shareBarButtonItem, "setEnabled:", [v9 isOneTimeSharable]);
    if ([(SFAccountDetailViewController *)v12 _allowAuditing])
    {
      v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v27 addObserver:v12 selector:sel__accountStoreDidUpdate name:*MEMORY[0x1E4F99540] object:0];
    }
    objc_storeStrong((id *)&v12->_savedAccount, a3);
    v28 = [v13 backBarButtonItem];
    [v28 setAccessibilityIdentifier:@"PasswordDetailViewNavigationBarBackButton"];

    objc_storeStrong((id *)&v12->_passwordWarning, a4);
    v29 = (ASAccountAuthenticationModificationController *)objc_alloc_init(MEMORY[0x1E4F18A98]);
    accountAuthenticationModificationController = v12->_accountAuthenticationModificationController;
    v12->_accountAuthenticationModificationController = v29;

    [(ASAccountAuthenticationModificationController *)v12->_accountAuthenticationModificationController setDelegate:v12];
    [(ASAccountAuthenticationModificationController *)v12->_accountAuthenticationModificationController setPresentationContextProvider:v12];
    [(SFAccountDetailViewController *)v12 _updateCachedTOTPGenerators];
    v12->_showPasswordAsBulletsWhenNotEditing = 1;
    v31 = v12;
  }
  return v12;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (BOOL)_allowEditing
{
  return 0;
}

- (BOOL)_allowAuditing
{
  return 0;
}

- (id)_passwordWarningManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    v4 = [WeakRetained passwordWarningManagerForAccountDetailViewController:self];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_passwordAuditor
{
  v2 = [(SFAccountDetailViewController *)self _passwordWarningManager];
  v3 = [v2 passwordAuditor];

  return v3;
}

- (id)_passwordEvaluator
{
  v2 = [(SFAccountDetailViewController *)self _passwordWarningManager];
  v3 = [v2 passwordEvaluator];

  return v3;
}

- (id)_passwordGenerator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    v4 = [WeakRetained passwordGeneratorForAccountDetailViewController:self];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)viewDidLoad
{
  objc_initWeak(&location, self);
  v16.receiver = self;
  v16.super_class = (Class)SFAccountDetailViewController;
  [(SFAccountDetailViewController *)&v16 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4F78458]);
  v4 = [(SFAccountDetailViewController *)self tableView];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __44__SFAccountDetailViewController_viewDidLoad__block_invoke;
  uint64_t v14 = &unk_1E5C72848;
  objc_copyWeak(&v15, &location);
  v5 = (SFTableViewDiffableDataSource *)[v3 initWithTableView:v4 cellProvider:&v11];
  tableViewDiffableDataSource = self->_tableViewDiffableDataSource;
  self->_tableViewDiffableDataSource = v5;

  -[SFTableViewDiffableDataSource setDelegate:](self->_tableViewDiffableDataSource, "setDelegate:", self, v11, v12, v13, v14);
  [(SFTableViewDiffableDataSource *)self->_tableViewDiffableDataSource setDefaultRowAnimation:0];
  v7 = [(SFAccountDetailViewController *)self tableView];
  if (_SFDeviceIsPad()) {
    [v7 setCellLayoutMarginsFollowReadableWidth:1];
  }
  [v7 setAllowsSelectionDuringEditing:1];
  [v7 _setTopPadding:20.0];
  [v7 setRowHeight:*MEMORY[0x1E4FB2F28]];
  [v7 setAccessibilityIdentifier:@"PasswordDetailView"];
  [v7 registerClass:objc_opt_class() forCellReuseIdentifier:@"NotesCell"];
  if ([(SFAccountDetailViewController *)self _allowAuditing] && !self->_passwordWarning) {
    [(SFAccountDetailViewController *)self _updateWarningForSavedAccount];
  }
  v8 = (UIEditMenuInteraction *)[objc_alloc(MEMORY[0x1E4FB1758]) initWithDelegate:self];
  editMenuInteraction = self->_editMenuInteraction;
  self->_editMenuInteraction = v8;

  [v7 addInteraction:self->_editMenuInteraction];
  if (self->_isForFillingIndividualAccountFields)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel__handleLongPressGesture_];
    [v7 addGestureRecognizer:v10];
  }
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

id __44__SFAccountDetailViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v9 = [WeakRetained _cellForIdentifier:v6 indexPath:v7];

  return v9;
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SFAccountDetailViewController;
  [(SFAccountDetailViewController *)&v10 viewWillAppear:a3];
  [(SFAccountDetailViewController *)self _reloadDiffableDataSourceOnInternalQueueAnimated:0];
  objc_initWeak(&location, self);
  v4 = [MEMORY[0x1E4F18AF0] sharedManager];
  [v4 addChangeObserver:self];

  v5 = [MEMORY[0x1E4F18AF0] sharedManager];
  id v6 = [(WBSSavedAccount *)self->_savedAccount highLevelDomain];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SFAccountDetailViewController_viewWillAppear___block_invoke;
  v7[3] = &unk_1E5C72870;
  objc_copyWeak(&v8, &location);
  [v5 extensionForDomain:v6 completionHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __48__SFAccountDetailViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__SFAccountDetailViewController_viewWillAppear___block_invoke_2;
    v6[3] = &unk_1E5C72238;
    v6[4] = WeakRetained;
    id v7 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __48__SFAccountDetailViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1280), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) _updateAccountModificationOptions];
  v2 = *(void **)(a1 + 32);

  return [v2 _reloadDiffableDataSourceAnimated:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_showsChangePasswordControllerOnAppearance)
  {
    self->_showsChangePasswordControllerOnAppearance = 0;
    [(SFAccountDetailViewController *)self _showChangePasswordSafariViewController];
  }
  v5.receiver = self;
  v5.super_class = (Class)SFAccountDetailViewController;
  [(SFAccountDetailViewController *)&v5 viewDidAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFAccountDetailViewController;
  [(SFAccountDetailViewController *)&v5 viewDidDisappear:a3];
  v4 = [MEMORY[0x1E4F18AF0] sharedManager];
  [v4 removeChangeObserver:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFAccountDetailViewController;
  [(SFAccountDetailViewController *)&v4 viewWillDisappear:a3];
  [(SFAccountDetailViewController *)self safari_dismissPresentedAlert];
}

- (void)_accountStoreDidUpdate
{
  if (!self->_shouldIgnoreAccountStoreUpdates)
  {
    BOOL v3 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__SFAccountDetailViewController__accountStoreDidUpdate__block_invoke;
    block[3] = &unk_1E5C724D8;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

void __55__SFAccountDetailViewController__accountStoreDidUpdate__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F98DF8] sharedStore];
  BOOL v3 = [v2 savedAccounts];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__SFAccountDetailViewController__accountStoreDidUpdate__block_invoke_2;
  v5[3] = &unk_1E5C72238;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __55__SFAccountDetailViewController__accountStoreDidUpdate__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processAccountStoreUpdateWithSavedAccounts:*(void *)(a1 + 40)];
}

- (void)_processAccountStoreUpdateWithSavedAccounts:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changePasswordSafariViewController);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v27;
    id obj = v5;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        p_savedAccount = &self->_savedAccount;
        v13 = [(WBSSavedAccount *)self->_savedAccount uniqueIdentifierForPasswordManagerLegacy];
        uint64_t v14 = [v11 uniqueIdentifierForPasswordManagerLegacy];
        int v15 = [v13 isEqualToString:v14];

        if (v15)
        {
          objc_storeStrong((id *)&self->_savedAccount, v11);
          if ([v11 isEqual:*p_savedAccount]) {
            goto LABEL_21;
          }
          objc_super v16 = [(WBSSavedAccount *)*p_savedAccount password];
          v17 = [v11 password];
          char v18 = [v16 isEqualToString:v17];

          char v8 = 1;
          if ((v18 & 1) == 0)
          {
            if (WeakRetained)
            {
              [WeakRetained setDismissButtonStyle:0];
              v19 = [(SFAccountDetailViewController *)self _passwordEvaluator];
              uint64_t v20 = [v11 password];
              v21 = [v19 evaluatePassword:v20];
              uint64_t v22 = [v21 strength];

              if (v22 == 2)
              {
                self->_completedUpgradeToStrongPassword = 1;
                id v23 = objc_loadWeakRetained((id *)&self->_delegate);
                if (objc_opt_respondsToSelector()) {
                  [v23 setSavedAccountToRemoveAfterCompletedUpgradeInDetailView:v11];
                }
              }
LABEL_21:
              id v5 = obj;

              goto LABEL_22;
            }
          }
        }
      }
      id v5 = obj;
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v7) {
        continue;
      }
      break;
    }

    if (v8) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  if (self->_completedUpgradeToSignInWithApple)
  {
LABEL_22:
    [(SFAccountDetailViewController *)self _updateSavedAccountChangeRequest];
    [(SFAccountDetailViewController *)self _updateCachedTOTPGenerators];
    [(SFAccountDetailViewController *)self _updateWarningForSavedAccount];
    [(SFAccountDetailViewController *)self _reloadDiffableDataSourceOnInternalQueueAnimated:0];
    goto LABEL_23;
  }
  [(SFAccountDetailViewController *)self _popViewController];
LABEL_23:
}

- (void)_popViewController
{
  BOOL v3 = [(SFAccountDetailViewController *)self navigationController];
  id v4 = [v3 topViewController];

  if (v4 == self)
  {
    id v6 = [(SFAccountDetailViewController *)self navigationController];
    id v5 = (id)[v6 popViewControllerAnimated:1];
  }
}

- (id)_changePasswordURL
{
  return (id)[(WBSSavedAccount *)self->_savedAccount wellKnownChangePasswordURL];
}

- (void)_showChangePasswordSafariViewController
{
  BOOL v3 = [(SFAccountDetailViewController *)self _changePasswordURL];
  if (v3)
  {
    uint64_t v9 = v3;
    BOOL v4 = [(UIViewController *)self safari_checkForAbilityToOpenWebContentAndNotifyIfNecessary:v3];
    BOOL v3 = v9;
    if (v4)
    {
      id v5 = objc_alloc_init(SFSafariViewControllerConfiguration);
      [(SFSafariViewControllerConfiguration *)v5 _setPerformingAccountSecurityUpgrade:1];
      id v6 = [[SFSafariViewController alloc] initWithURL:v9 configuration:v5];
      uint64_t v7 = [(SFAccountDetailViewController *)self view];
      char v8 = [v7 tintColor];
      [(SFSafariViewController *)v6 setPreferredControlTintColor:v8];

      [(SFSafariViewController *)v6 setDismissButtonStyle:2];
      [(SFSafariViewController *)v6 setModalPresentationStyle:1];
      [(SFSafariViewController *)v6 setModalInPresentation:1];
      [(SFAccountDetailViewController *)self presentViewController:v6 animated:1 completion:0];
      objc_storeWeak((id *)&self->_changePasswordSafariViewController, v6);

      BOOL v3 = v9;
    }
  }
}

- (void)_openChangePasswordURLInWebBrowser
{
  v7[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  BOOL v4 = [(SFAccountDetailViewController *)self _changePasswordURL];
  uint64_t v6 = *MEMORY[0x1E4F22338];
  v7[0] = MEMORY[0x1E4F1CC38];
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  objc_msgSend(v3, "_sf_openURL:withOptions:completionHandler:", v4, v5, 0);
}

- (void)_editBarButtonItemTapped:(id)a3
{
}

- (void)_cancelChangesAndFinishEditing
{
  [(SFAccountDetailViewController *)self _setEditing:0 animated:1];
  BOOL v3 = [(WBSSavedAccount *)self->_savedAccount user];
  BOOL v4 = [(SFEditableTableViewCell *)self->_userCell editableTextField];
  [v4 setText:v3];

  id v5 = [(WBSSavedAccount *)self->_savedAccount password];
  uint64_t v6 = [(SFEditableTableViewCell *)self->_passwordCell editableTextField];
  [v6 setText:v5];

  uint64_t v7 = [(WBSSavedAccount *)self->_savedAccount notesEntry];
  char v8 = [(SFAccountNoteTableViewCell *)self->_notesCell textView];
  [v8 setText:v7];

  uint64_t v9 = [(SFAccountNoteTableViewCell *)self->_notesCell textDidChange];

  if (v9)
  {
    objc_super v10 = [(SFAccountNoteTableViewCell *)self->_notesCell textDidChange];
    v10[2]();
  }
  uint64_t v11 = [(WBSSavedAccount *)self->_savedAccount customTitle];
  uint64_t v12 = [(SFAccountHeaderViewCell *)self->_headerCell titleTextField];
  [v12 setText:v11];

  headerCell = self->_headerCell;

  [(SFAccountDetailViewController *)self _configureHeaderViewCell:headerCell];
}

- (void)_cancelBarButtonItemTapped:(id)a3
{
  [(SFAccountDetailViewController *)self _updateSavedAccountChangeRequest];
  if ([(WBSSavedAccountChangeRequest *)self->_savedAccountChangeRequest hasChanges])
  {
    [(SFAccountDetailViewController *)self _presentDialogToConfirmCancelEditing];
  }
  else
  {
    [(SFAccountDetailViewController *)self _cancelChangesAndFinishEditing];
  }
}

- (void)_presentDialogToConfirmCancelEditing
{
  BOOL v3 = (void *)MEMORY[0x1E4FB1418];
  BOOL v4 = _WBSLocalizedString();
  id v5 = _WBSLocalizedString();
  uint64_t v6 = [v3 alertControllerWithTitle:v4 message:v5 imageNamed:@"alert-passwords" preferredStyle:_SFDeviceAlertStyle()];

  uint64_t v7 = (void *)MEMORY[0x1E4FB1410];
  char v8 = _WBSLocalizedString();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__SFAccountDetailViewController__presentDialogToConfirmCancelEditing__block_invoke;
  v19[3] = &unk_1E5C72898;
  v19[4] = self;
  uint64_t v9 = [v7 actionWithTitle:v8 style:2 handler:v19];
  [v6 addAction:v9];

  objc_super v10 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v11 = _WBSLocalizedString();
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  objc_super v16 = __69__SFAccountDetailViewController__presentDialogToConfirmCancelEditing__block_invoke_2;
  v17 = &unk_1E5C72898;
  id v18 = v6;
  id v12 = v6;
  v13 = [v10 actionWithTitle:v11 style:1 handler:&v14];
  objc_msgSend(v12, "addAction:", v13, v14, v15, v16, v17);

  [(SFAccountDetailViewController *)self presentViewController:v12 animated:1 completion:0];
}

uint64_t __69__SFAccountDetailViewController__presentDialogToConfirmCancelEditing__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelChangesAndFinishEditing];
}

uint64_t __69__SFAccountDetailViewController__presentDialogToConfirmCancelEditing__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)_shareBarButtonItemTapped:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__SFAccountDetailViewController__shareBarButtonItemTapped___block_invoke;
  v6[3] = &unk_1E5C728C0;
  id v7 = v4;
  id v5 = v4;
  [(SFAccountDetailViewController *)self _sharePasswordWithPopoverPresentationControllerConfiguration:v6];
}

uint64_t __59__SFAccountDetailViewController__shareBarButtonItemTapped___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setBarButtonItem:*(void *)(a1 + 32)];
}

- (id)_allSharedCredentialGroupsMenu
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v28 = [MEMORY[0x1E4F1CA48] array];
  objc_initWeak(&location, self);
  unsigned int v2 = [(WBSSavedAccount *)self->_savedAccount isSavedInPersonalKeychain];
  uint64_t v25 = _WBSLocalizedString();
  BOOL v3 = (void *)MEMORY[0x1E4FB13F0];
  id v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person"];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __63__SFAccountDetailViewController__allSharedCredentialGroupsMenu__block_invoke;
  v37[3] = &unk_1E5C728E8;
  v24 = &v38;
  objc_copyWeak(&v38, &location);
  char v39 = v2;
  long long v26 = [v3 actionWithTitle:v25 image:v4 identifier:0 handler:v37];

  [v26 setState:v2];
  if ((v2 & 1) != 0
    || (objc_msgSend(MEMORY[0x1E4F98DF8], "sharedStore", &v38),
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 _canMoveSavedAccount:self->_savedAccount toGroupWithID:0],
        v5,
        (v6 & 1) == 0))
  {
    objc_msgSend(v26, "setAttributes:", 1, v24);
  }
  [v28 addObject:v26];
  id v7 = [MEMORY[0x1E4F98C48] sharedProvider];
  char v8 = [v7 cachedGroups];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v13 = [(WBSSavedAccount *)self->_savedAccount sharedGroupID];
        uint64_t v14 = [v12 groupID];
        unsigned int v15 = [v13 isEqualToString:v14];

        objc_super v16 = (void *)MEMORY[0x1E4FB13F0];
        v17 = [v12 displayName];
        id v18 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.2"];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __63__SFAccountDetailViewController__allSharedCredentialGroupsMenu__block_invoke_2;
        v30[3] = &unk_1E5C72120;
        objc_copyWeak(&v31, &location);
        char v32 = v15;
        v30[4] = v12;
        v19 = [v16 actionWithTitle:v17 image:v18 identifier:0 handler:v30];

        [v19 setState:v15];
        if (v15) {
          goto LABEL_11;
        }
        uint64_t v20 = [MEMORY[0x1E4F98DF8] sharedStore];
        savedAccount = self->_savedAccount;
        uint64_t v22 = [v12 groupID];
        LOBYTE(savedAccount) = [v20 _canMoveSavedAccount:savedAccount toGroupWithID:v22];

        if ((savedAccount & 1) == 0) {
LABEL_11:
        }
          [v19 setAttributes:1];
        [v28 addObject:v19];

        objc_destroyWeak(&v31);
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v9);
  }

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

  return v28;
}

void __63__SFAccountDetailViewController__allSharedCredentialGroupsMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !*(unsigned char *)(a1 + 40))
  {
    id v3 = WeakRetained;
    [WeakRetained _presentConfirmationAlertToShareSavedAccountToGroup:0];
    id WeakRetained = v3;
  }
}

void __63__SFAccountDetailViewController__allSharedCredentialGroupsMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && !*(unsigned char *)(a1 + 48))
  {
    id v3 = WeakRetained;
    [WeakRetained _presentConfirmationAlertToShareSavedAccountToGroup:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (id)_airDropMenu
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if ([(WBSSavedAccount *)self->_savedAccount isOneTimeSharable])
  {
    objc_initWeak(&location, self);
    id v3 = (void *)MEMORY[0x1E4FB1970];
    id v4 = (void *)MEMORY[0x1E4FB13F0];
    id v5 = _WBSLocalizedString();
    char v6 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"airdrop"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__SFAccountDetailViewController__airDropMenu__block_invoke;
    v12[3] = &unk_1E5C72910;
    objc_copyWeak(&v13, &location);
    id v7 = [v4 actionWithTitle:v5 image:v6 identifier:0 handler:v12];
    v16[0] = v7;
    char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    uint64_t v9 = [v3 menuWithTitle:&stru_1EFB97EB8 image:0 identifier:0 options:1 children:v8];

    unsigned int v15 = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

void __45__SFAccountDetailViewController__airDropMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v2 = WeakRetained;
  if (WeakRetained)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __45__SFAccountDetailViewController__airDropMenu__block_invoke_2;
    v3[3] = &unk_1E5C728C0;
    v3[4] = WeakRetained;
    [WeakRetained _sharePasswordWithPopoverPresentationControllerConfiguration:v3];
  }
}

uint64_t __45__SFAccountDetailViewController__airDropMenu__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setBarButtonItem:*(void *)(*(void *)(a1 + 32) + 1056)];
}

- (void)_presentConfirmationAlertToShareSavedAccountToGroup:(id)a3
{
  id v4 = a3;
  char v5 = [(WBSPasswordWarning *)self->_passwordWarning issueTypes];
  int v6 = [(WBSSavedAccount *)self->_savedAccount isSavedInPersonalKeychain];
  id v7 = [(SFAccountDetailViewController *)self _passwordWarningManager];
  char v8 = [MEMORY[0x1E4F98DF8] sharedStore];
  id v38 = v4;
  uint64_t v9 = [v4 groupID];
  uint64_t v10 = [v8 savedAccountsForGroupID:v9];
  char v11 = [v7 savedAccountsFromGroup:v10 containsPasswordFromSavedAccount:self->_savedAccount];

  id v12 = 0;
  if ((v5 & 1) != 0 && v6 && (v11 & 1) == 0)
  {
    id v12 = [(WBSPasswordWarning *)self->_passwordWarning localizedAlertWarningForSharingReusedPassword];
  }
  id v13 = [MEMORY[0x1E4F98C48] sharedProvider];
  uint64_t v14 = [(WBSSavedAccount *)self->_savedAccount sharedGroupID];
  unsigned int v15 = [v13 cachedGroupWithID:v14];

  uint64_t v16 = [v15 displayName];
  uint64_t v17 = [v38 displayName];
  id v18 = (void *)v17;
  long long v36 = (void *)v16;
  v37 = v15;
  if (v17 && v16)
  {
    uint64_t v19 = [MEMORY[0x1E4F88178] confirmationAlertSubtitleForMovingSavedAccount:self->_savedAccount fromGroupWithName:v16];
LABEL_12:
    uint64_t v20 = (void *)v19;
    goto LABEL_13;
  }
  if (v16)
  {
    uint64_t v19 = [MEMORY[0x1E4F88178] confirmationAlertSubtitleForMovingSavedAccount:self->_savedAccount toMyPasswordsFromGroup:v15];
    goto LABEL_12;
  }
  if (v17)
  {
    uint64_t v19 = [MEMORY[0x1E4F88178] confirmationAlertSubtitleForMovingSavedAccount:self->_savedAccount fromMyPasswordsToGroupWithName:v17];
    goto LABEL_12;
  }
  uint64_t v20 = 0;
LABEL_13:
  if (v12) {
    v21 = v12;
  }
  else {
    v21 = v20;
  }
  id v22 = v21;
  id v23 = [MEMORY[0x1E4F88178] alertTitleForMovingSavedAccount:self->_savedAccount toGroupWithName:v18];
  v24 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v23 message:v22 imageNamed:@"alert-passwords" preferredStyle:_SFDeviceAlertStyle()];
  if ([v12 length])
  {
    uint64_t v25 = (void *)MEMORY[0x1E4FB1410];
    long long v26 = _WBSLocalizedString();
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __85__SFAccountDetailViewController__presentConfirmationAlertToShareSavedAccountToGroup___block_invoke;
    v43[3] = &unk_1E5C72898;
    v43[4] = self;
    long long v27 = [v25 actionWithTitle:v26 style:0 handler:v43];
    [v24 addAction:v27];
  }
  long long v35 = v20;
  id v28 = _WBSLocalizedString();
  objc_initWeak(&location, self);
  long long v29 = (void *)MEMORY[0x1E4FB1410];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __85__SFAccountDetailViewController__presentConfirmationAlertToShareSavedAccountToGroup___block_invoke_2;
  v39[3] = &unk_1E5C72938;
  objc_copyWeak(&v41, &location);
  id v30 = v38;
  id v40 = v30;
  id v31 = [v29 actionWithTitle:v28 style:0 handler:v39];
  [v24 addAction:v31];

  char v32 = (void *)MEMORY[0x1E4FB1410];
  long long v33 = _WBSLocalizedString();
  long long v34 = [v32 actionWithTitle:v33 style:1 handler:0];
  [v24 addAction:v34];

  [(SFAccountDetailViewController *)self presentViewController:v24 animated:1 completion:0];
  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
}

uint64_t __85__SFAccountDetailViewController__presentConfirmationAlertToShareSavedAccountToGroup___block_invoke(uint64_t a1)
{
  int v2 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_isSafariViewServiceBundle");
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 _openChangePasswordURLInWebBrowser];
  }
  else
  {
    return [v3 _showChangePasswordSafariViewController];
  }
}

void __85__SFAccountDetailViewController__presentConfirmationAlertToShareSavedAccountToGroup___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [MEMORY[0x1E4F98DF8] sharedStore];
    uint64_t v4 = WeakRetained[128];
    char v5 = [*(id *)(a1 + 32) groupID];
    LOBYTE(v4) = [v3 _moveSavedAccount:v4 toGroupWithID:v5];

    if ((v4 & 1) == 0)
    {
      uint64_t v6 = MEMORY[0x1E4F143A8];
      uint64_t v7 = 3221225472;
      char v8 = __85__SFAccountDetailViewController__presentConfirmationAlertToShareSavedAccountToGroup___block_invoke_3;
      uint64_t v9 = &unk_1E5C72238;
      uint64_t v10 = WeakRetained;
      id v11 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x1E4F14428], &v6);
    }
    objc_msgSend(WeakRetained, "_reloadDiffableDataSourceOnInternalQueueAnimated:", 0, v6, v7, v8, v9, v10);
  }
}

uint64_t __85__SFAccountDetailViewController__presentConfirmationAlertToShareSavedAccountToGroup___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentErrorAlertForFailingToMoveAccountToGroup:*(void *)(a1 + 40)];
}

- (void)_presentErrorAlertForFailingToMoveAccountToGroup:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F88178];
  id v5 = a3;
  uint64_t v6 = [v4 alertTitleForFailingToMoveToGroup];
  uint64_t v7 = (void *)MEMORY[0x1E4F88178];
  v18[0] = self->_savedAccount;
  char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  uint64_t v9 = [v5 displayName];

  uint64_t v10 = [v7 alertSubtitleForFailingToMoveSavedAccounts:v8 toGroupWithName:v9];

  id v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v6 message:v10 imageNamed:@"alert-passwords" preferredStyle:1];
  id v12 = (void *)MEMORY[0x1E4FB1410];
  id v13 = _WBSLocalizedString();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __82__SFAccountDetailViewController__presentErrorAlertForFailingToMoveAccountToGroup___block_invoke;
  v16[3] = &unk_1E5C72898;
  id v17 = v11;
  id v14 = v11;
  unsigned int v15 = [v12 actionWithTitle:v13 style:0 handler:v16];
  [v14 addAction:v15];

  [(SFAccountDetailViewController *)self presentViewController:v14 animated:1 completion:0];
}

uint64_t __82__SFAccountDetailViewController__presentErrorAlertForFailingToMoveAccountToGroup___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)_setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v35[1] = *MEMORY[0x1E4F143B8];
  if ([(SFAccountDetailViewController *)self _allowEditing])
  {
    v32.receiver = self;
    v32.super_class = (Class)SFAccountDetailViewController;
    [(SFAccountDetailViewController *)&v32 setEditing:v5 animated:v4];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__SFAccountDetailViewController__setEditing_animated___block_invoke;
    block[3] = &unk_1E5C72988;
    block[4] = self;
    BOOL v31 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
    if (v5)
    {
      [(SFAccountDetailViewController *)self _revealPasswordIfNecessary];
      uint64_t v7 = [(SFAccountDetailViewController *)self navigationItem];
      [v7 setLeftBarButtonItem:self->_cancelBarButtonItem animated:v4];
      v35[0] = self->_doneBarButtonItem;
      char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
      [v7 setRightBarButtonItems:v8 animated:v4];

      uint64_t v9 = [(SFEditableTableViewCell *)self->_userCell editableTextField];
      uint64_t v10 = [v9 text];
      userForEditing = self->_userForEditing;
      self->_userForEditing = v10;

      id v12 = [(SFEditableTableViewCell *)self->_passwordCell editableTextField];
      id v13 = [v12 text];
      passwordForEditing = self->_passwordForEditing;
      self->_passwordForEditing = v13;

      unsigned int v15 = [(SFAccountNoteTableViewCell *)self->_notesCell textView];
      uint64_t v16 = [v15 text];
      notesForEditing = self->_notesForEditing;
      self->_notesForEditing = v16;

      id v18 = [(SFAccountHeaderViewCell *)self->_headerCell titleTextField];
      uint64_t v19 = [v18 text];
      titleForEditing = self->_titleForEditing;
      self->_titleForEditing = v19;
    }
    else
    {
      uint64_t v7 = [(SFAccountDetailViewController *)self navigationItem];
      [v7 setLeftBarButtonItem:0 animated:v4];
      v21 = [MEMORY[0x1E4F78290] sharedFeatureManager];
      if ([v21 isAirDropPasswordsAvailable])
      {
        shareBarButtonItem = self->_shareBarButtonItem;
        v34[0] = self->_editBarButtonItem;
        v34[1] = shareBarButtonItem;
        id v23 = (void *)MEMORY[0x1E4F1C978];
        p_editBarButtonItem = (UIBarButtonItem **)v34;
        uint64_t v25 = 2;
      }
      else
      {
        editBarButtonItem = self->_editBarButtonItem;
        id v23 = (void *)MEMORY[0x1E4F1C978];
        p_editBarButtonItem = &editBarButtonItem;
        uint64_t v25 = 1;
      }
      long long v26 = [v23 arrayWithObjects:p_editBarButtonItem count:v25];
      [v7 setRightBarButtonItems:v26 animated:v4];

      long long v27 = self->_userForEditing;
      self->_userForEditing = 0;

      id v28 = self->_passwordForEditing;
      self->_passwordForEditing = 0;

      long long v29 = self->_notesForEditing;
      self->_notesForEditing = 0;

      id v18 = self->_titleForEditing;
      self->_titleForEditing = 0;
    }
  }
}

void __54__SFAccountDetailViewController__setEditing_animated___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1176) = *(unsigned char *)(a1 + 40);
  int v2 = [*(id *)(*(void *)(a1 + 32) + 1192) snapshot];
  id v3 = [*(id *)(a1 + 32) _cellsThatChangeAppearanceOnEdit];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__SFAccountDetailViewController__setEditing_animated___block_invoke_2;
  v12[3] = &unk_1E5C72960;
  id v4 = v2;
  id v13 = v4;
  BOOL v5 = objc_msgSend(v3, "safari_filterObjectsUsingBlock:", v12);

  [v4 reconfigureItemsWithIdentifiers:v5];
  if ([*(id *)(*(void *)(a1 + 32) + 1248) count])
  {
    if (!*(unsigned char *)(a1 + 40))
    {
      [v4 deleteItemsWithIdentifiers:&unk_1EFBDF280];
      goto LABEL_9;
    }
    uint64_t v6 = [v4 sectionIdentifiers];
    int v7 = [v6 containsObject:&unk_1EFBDE7B8];

    if (v7)
    {
      char v8 = &unk_1EFBDF250;
      uint64_t v9 = &unk_1EFBDE7B8;
    }
    else
    {
      uint64_t v10 = [v4 sectionIdentifiers];
      int v11 = [v10 containsObject:&unk_1EFBDE7E8];

      if (!v11) {
        goto LABEL_9;
      }
      char v8 = &unk_1EFBDF268;
      uint64_t v9 = &unk_1EFBDE7E8;
    }
    [v4 appendItemsWithIdentifiers:v8 intoSectionWithIdentifier:v9];
  }
LABEL_9:
  if ([*(id *)(*(void *)(a1 + 32) + 1024) credentialTypes] == 2) {
    [*(id *)(a1 + 32) _updateAddPasswordButton:*(unsigned __int8 *)(a1 + 40) forSnapshot:v4];
  }
  [*(id *)(*(void *)(a1 + 32) + 1192) applySnapshot:v4 animatingDifferences:1];
}

uint64_t __54__SFAccountDetailViewController__setEditing_animated___block_invoke_2(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 itemIdentifiers];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

- (void)_updateAddPasswordButton:(BOOL)a3 forSnapshot:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v8 = v5;
  if (v4)
  {
    [v5 insertSectionsWithIdentifiers:&unk_1EFBDF298 beforeSectionWithIdentifier:&unk_1EFBDE7D0];
    [v8 appendItemsWithIdentifiers:&unk_1EFBDF2B0 intoSectionWithIdentifier:&unk_1EFBDE7E8];
  }
  else
  {
    uint64_t v6 = [v5 sectionIdentifiers];
    int v7 = [v6 containsObject:&unk_1EFBDE7E8];

    if (v7) {
      [v8 deleteSectionsWithIdentifiers:&unk_1EFBDF2C8];
    }
  }
}

- (id)_createShareBarButtonItem
{
  id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
  BOOL v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
  id v5 = (void *)[v3 initWithImage:v4 style:0 target:self action:sel__shareBarButtonItemTapped_];

  return v5;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SFAccountDetailViewController;
  [(SFAccountDetailViewController *)&v4 dealloc];
}

- (void)_handleLongPressGesture:(id)a3
{
  id v14 = a3;
  if ([v14 state] == 1)
  {
    objc_super v4 = [(SFAccountDetailViewController *)self tableView];
    [v14 locationInView:v4];
    double v6 = v5;
    double v8 = v7;

    uint64_t v9 = [(SFAccountDetailViewController *)self tableView];
    uint64_t v10 = objc_msgSend(v9, "indexPathForRowAtPoint:", v6, v8);

    if (v10)
    {
      [(UIEditMenuInteraction *)self->_editMenuInteraction dismissMenu];
      int v11 = (void *)MEMORY[0x1E4FB1750];
      id v12 = [(SFAccountDetailViewController *)self tableView];
      [v12 rectForRowAtIndexPath:v10];
      UIRectGetCenter();
      id v13 = objc_msgSend(v11, "configurationWithIdentifier:sourcePoint:", v10);

      [(UIEditMenuInteraction *)self->_editMenuInteraction presentEditMenuWithConfiguration:v13];
    }
  }
}

- (id)_cellForIdentifier:(id)a3 indexPath:(id)a4
{
  v156[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  int64_t v8 = [(SFAccountDetailViewController *)self _itemTypeForIdentifier:v6];
  if ([(SFAccountDetailViewController *)self isEditing]) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 0;
  }
  if (UIAccessibilityButtonShapesEnabled())
  {
    uint64_t v155 = *MEMORY[0x1E4FB12E8];
    v156[0] = &unk_1EFBDE818;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v156 forKeys:&v155 count:1];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CC08];
  }
  switch(v8)
  {
    case 0:
      int v11 = [(SFAccountDetailViewController *)self tableView];
      id v12 = [v11 dequeueReusableCellWithIdentifier:@"AccountHeaderCell"];
      id v13 = v12;
      if (!v12) {
        id v13 = [[SFAccountHeaderViewCell alloc] initWithStyle:0 reuseIdentifier:@"AccountHeaderCell"];
      }
      p_headerCell = &self->_headerCell;
      objc_storeStrong((id *)&self->_headerCell, v13);
      if (!v12) {

      }
      [(SFAccountDetailViewController *)self _configureHeaderViewCell:*p_headerCell];
      unsigned int v15 = (UITableViewCell *)*p_headerCell;
      goto LABEL_55;
    case 1:
      id v23 = [(SFAccountDetailViewController *)self tableView];
      id v22 = [v23 dequeueReusableCellWithIdentifier:@"editableTableViewCell"];

      if (!v22)
      {
        if ([(SFAccountDetailViewController *)self _allowEditing]) {
          uint64_t v24 = [(SFAccountDetailViewController *)self isEditing];
        }
        else {
          uint64_t v24 = 0;
        }
        id v22 = [[SFEditableTableViewCell alloc] initWithEnabledState:v24];
      }
      [(SFAccountDetailViewController *)self _configureUserCell:v22];
      v127 = [(SFAccountDetailViewController *)self _editableCellWithCell:v22];
      userCell = self->_userCell;
      self->_userCell = v127;

      v129 = [(SFEditableTableViewCell *)self->_userCell editableTextField];
      [v129 setDelegate:self];

      [(SFEditableTableViewCell *)self->_userCell setEnabled:[(SFAccountDetailViewController *)self isEditing]];
      break;
    case 2:
      uint64_t v25 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
      long long v26 = _WBSLocalizedString();
      [v25 setText:v26];

      long long v27 = [(SFAccountDetailViewController *)self _passkeyCreationDateString];
      [v25 setSecondaryText:v27];

      id v28 = [(SFAccountDetailViewController *)self tableView];
      long long v29 = [v28 dequeueReusableCellWithIdentifier:@"PasskeyCell"];
      id v30 = v29;
      if (v29) {
        BOOL v31 = v29;
      }
      else {
        BOOL v31 = (SFEditableTableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"PasskeyCell"];
      }
      id v22 = v31;

      [(SFEditableTableViewCell *)v22 setContentConfiguration:v25];
      break;
    case 3:
      objc_super v32 = [(SFAccountDetailViewController *)self tableView];
      id v22 = [v32 dequeueReusableCellWithIdentifier:@"editableTableViewCell"];

      if (!v22)
      {
        if ([(SFAccountDetailViewController *)self _allowEditing]) {
          uint64_t v33 = [(SFAccountDetailViewController *)self isEditing];
        }
        else {
          uint64_t v33 = 0;
        }
        id v22 = [[SFEditableTableViewCell alloc] initWithEnabledState:v33];
      }
      [(SFAccountDetailViewController *)self _configurePasswordCell:v22];
      v130 = [(SFAccountDetailViewController *)self _editableCellWithCell:v22];
      passwordCell = self->_passwordCell;
      self->_passwordCell = v130;

      v132 = [(SFEditableTableViewCell *)self->_passwordCell editableTextField];
      [v132 setDelegate:self];

      v133 = (void *)MEMORY[0x1E4FB1798];
      v134 = [(SFEditableTableViewCell *)self->_passwordCell editableTextField];
      v135 = [v134 font];
      [v135 pointSize];
      v136 = objc_msgSend(v133, "monospacedSystemFontOfSize:weight:");
      v137 = [(SFEditableTableViewCell *)self->_passwordCell editableTextField];
      [v137 setFont:v136];

      [(SFEditableTableViewCell *)self->_passwordCell setEnabled:[(SFAccountDetailViewController *)self isEditing]];
      break;
    case 4:
      v21 = [(SFAccountDetailViewController *)self _groupPickerTableViewCell];
      goto LABEL_63;
    case 5:
      v21 = [(SFAccountDetailViewController *)self _originalContributorCell];
      goto LABEL_63;
    case 6:
      long long v34 = [(SFAccountDetailViewController *)self tableView];
      long long v35 = [v34 dequeueReusableCellWithIdentifier:@"TOTPCell"];
      long long v36 = v35;
      if (v35) {
        v37 = v35;
      }
      else {
        v37 = [[SFAccountDetailTOTPTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"TOTPCell"];
      }
      id v22 = (SFEditableTableViewCell *)v37;

      [(SFEditableTableViewCell *)v22 configureWithGenerator:v6];
      BOOL isForFillingIndividualAccountFields = self->_isForFillingIndividualAccountFields;
      if (self->_isForFillingIndividualAccountFields)
      {
        v114 = +[_SFAccountManagerAppearanceValues buttonCellTextColor];
      }
      else
      {
        v114 = 0;
      }
      [(SFEditableTableViewCell *)v22 setOverrideVerificationCodeLabelTextColor:v114];
      if (isForFillingIndividualAccountFields) {

      }
      objc_storeStrong((id *)&self->_TOTPCodeCell, v22);
      break;
    case 7:
      p_setupTOTPCodeCell = &self->_setupTOTPCodeCell;
      setupTOTPCodeCell = self->_setupTOTPCodeCell;
      if (setupTOTPCodeCell)
      {
        id v40 = 0;
      }
      else
      {
        v109 = [(SFAccountDetailViewController *)self tableView];
        v110 = [v109 dequeueReusableCellWithIdentifier:@"TOTPSetupCell"];
        v111 = v110;
        if (v110) {
          id v112 = v110;
        }
        else {
          id v112 = (id)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"TOTPSetupCell"];
        }
        id v40 = v112;

        v138 = _WBSLocalizedString();
        v139 = [v40 textLabel];
        [v139 setText:v138];

        v140 = [v40 detailTextLabel];
        [v140 setText:0];

        v141 = [v40 detailTextLabel];
        [v141 setAttributedText:0];

        v142 = [v40 editableTextField];
        [v142 setText:0];

        v143 = [v40 textLabel];
        [v143 setNumberOfLines:0];

        v144 = +[_SFAccountManagerAppearanceValues buttonCellTextColor];
        v145 = [v40 textLabel];
        [v145 setTintColor:v144];

        v146 = [v40 textLabel];
        [v146 _setTextColorFollowsTintColor:1];

        objc_storeStrong((id *)p_setupTOTPCodeCell, v40);
        setupTOTPCodeCell = *p_setupTOTPCodeCell;
      }
      v147 = [(UITableViewCell *)setupTOTPCodeCell textLabel];
      [v147 setTintAdjustmentMode:v9];

      id v22 = *p_setupTOTPCodeCell;
      break;
    case 8:
      id v41 = [(SFAccountDetailViewController *)self tableView];
      uint64_t v42 = [v41 dequeueReusableCellWithIdentifier:@"TOTPDeleteCell"];
      v43 = v42;
      if (v42) {
        v44 = v42;
      }
      else {
        v44 = (SFEditableTableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"TOTPDeleteCell"];
      }
      id v22 = v44;

      v115 = _WBSLocalizedString();
      v116 = [(SFEditableTableViewCell *)v22 textLabel];
      [v116 setText:v115];

      v117 = [MEMORY[0x1E4FB1618] systemRedColor];
      v118 = [(SFEditableTableViewCell *)v22 textLabel];
      [v118 setTextColor:v117];

      v119 = [(SFEditableTableViewCell *)v22 textLabel];
      [v119 setNumberOfLines:0];

      break;
    case 9:
      v45 = [(SFAccountDetailViewController *)self tableView];
      v46 = [v45 dequeueReusableCellWithIdentifier:@"AddPasswordCell"];
      v47 = v46;
      if (v46) {
        v48 = v46;
      }
      else {
        v48 = (SFEditableTableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"AddPasswordCell"];
      }
      id v22 = v48;

      v120 = _WBSLocalizedString();
      v121 = [(SFEditableTableViewCell *)v22 textLabel];
      [v121 setText:v120];

      v122 = [(SFEditableTableViewCell *)v22 textLabel];
      [v122 _setTextColorFollowsTintColor:1];

      v123 = [(SFEditableTableViewCell *)v22 textLabel];
      [v123 setNumberOfLines:0];

      v124 = +[_SFAccountManagerAppearanceValues buttonCellTextColor];
      v125 = [(SFEditableTableViewCell *)v22 textLabel];
      [v125 setTintColor:v124];

      break;
    case 10:
      uint64_t v49 = 1200;
      if (!self->_securityRecommendationInfoCell)
      {
        v50 = [[SFSecurityRecommendationInfoCell alloc] initWithConfiguration:0 reuseIdentifier:0];
        securityRecommendationInfoCell = self->_securityRecommendationInfoCell;
        self->_securityRecommendationInfoCell = v50;

        [(SFSecurityRecommendationInfoCell *)self->_securityRecommendationInfoCell setDelegate:self];
        char v52 = [(WBSPasswordWarning *)self->_passwordWarning issueTypes];
        v153[0] = @"priority";
        uint64_t v53 = [(WBSPasswordWarning *)self->_passwordWarning severity];
        v54 = @"standard";
        if (v53 == 1) {
          v54 = @"high";
        }
        v154[0] = v54;
        v153[1] = @"domain";
        v55 = [(WBSSavedAccount *)self->_savedAccount highLevelDomain];
        v154[1] = v55;
        v153[2] = @"user";
        uint64_t v56 = [(WBSSavedAccount *)self->_savedAccount user];
        v57 = (void *)v56;
        v58 = @"true";
        if (v52) {
          v59 = @"true";
        }
        else {
          v59 = @"false";
        }
        v154[2] = v56;
        v154[3] = v59;
        v153[3] = @"reused";
        v153[4] = @"weak";
        v153[5] = @"compromised";
        if ((v52 & 2) != 0) {
          v60 = @"true";
        }
        else {
          v60 = @"false";
        }
        if ((v52 & 0xC) == 0) {
          v58 = @"false";
        }
        v154[4] = v60;
        v154[5] = v58;
        v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v154 forKeys:v153 count:6];
        v62 = WBSMakeAccessibilityIdentifier();
        [(SFSecurityRecommendationInfoCell *)self->_securityRecommendationInfoCell setAccessibilityIdentifier:v62];

        v63 = [(SFSecurityRecommendationInfoCell *)self->_securityRecommendationInfoCell titleLabel];
        [v63 setAccessibilityIdentifier:@"PasswordDetailViewSecurityRecommendationsCellTitle"];

        v64 = [(SFSecurityRecommendationInfoCell *)self->_securityRecommendationInfoCell subtitleLabel];
        [v64 setAccessibilityIdentifier:@"PasswordDetailViewSecurityRecommendationsCellSubtitle"];
      }
      [(SFAccountDetailViewController *)self _configureSecurityRecommendationInfoCell];
      goto LABEL_54;
    case 11:
      upgradeToSignInWithAppleCell = self->_upgradeToSignInWithAppleCell;
      if (!upgradeToSignInWithAppleCell)
      {
        v66 = (UITableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"upgradeToSignInWithApple"];
        v67 = self->_upgradeToSignInWithAppleCell;
        self->_upgradeToSignInWithAppleCell = v66;

        v68 = [(UITableViewCell *)self->_upgradeToSignInWithAppleCell textLabel];
        [v68 _setTextColorFollowsTintColor:1];

        v69 = _WBSLocalizedString();
        v70 = [(UITableViewCell *)self->_upgradeToSignInWithAppleCell textLabel];
        [v70 setText:v69];

        v71 = [(UITableViewCell *)self->_upgradeToSignInWithAppleCell textLabel];
        [v71 setNumberOfLines:0];

        [(UITableViewCell *)self->_upgradeToSignInWithAppleCell setAccessibilityIdentifier:@"PasswordDetailViewSignInWithAppleUpgradeCell"];
        v72 = +[_SFAccountManagerAppearanceValues buttonCellTextColor];
        v73 = [(UITableViewCell *)self->_upgradeToSignInWithAppleCell textLabel];
        [v73 setTintColor:v72];

        upgradeToSignInWithAppleCell = self->_upgradeToSignInWithAppleCell;
      }
      v74 = [(UITableViewCell *)upgradeToSignInWithAppleCell textLabel];
      [v74 setTintAdjustmentMode:v9];

      unsigned int v15 = self->_upgradeToSignInWithAppleCell;
      goto LABEL_55;
    case 12:
      uint64_t v49 = 1264;
      changeToStrongPasswordCell = self->_changeToStrongPasswordCell;
      if (!changeToStrongPasswordCell)
      {
        v76 = (UITableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"changeToStrongPassword"];
        v77 = self->_changeToStrongPasswordCell;
        self->_changeToStrongPasswordCell = v76;

        v78 = [(UITableViewCell *)self->_changeToStrongPasswordCell textLabel];
        [v78 _setTextColorFollowsTintColor:1];

        id v79 = objc_alloc(MEMORY[0x1E4F28B18]);
        v80 = _WBSLocalizedString();
        v81 = (void *)[v79 initWithString:v80 attributes:v10];
        v82 = [(UITableViewCell *)self->_changeToStrongPasswordCell textLabel];
        [v82 setAttributedText:v81];

        v83 = [(UITableViewCell *)self->_changeToStrongPasswordCell textLabel];
        [v83 setNumberOfLines:0];

        [(UITableViewCell *)self->_changeToStrongPasswordCell setAccessibilityIdentifier:@"PasswordDetailViewChangeToStrongPasswordUpgradeCell"];
        v84 = +[_SFAccountManagerAppearanceValues buttonCellTextColor];
        v85 = [(UITableViewCell *)self->_changeToStrongPasswordCell textLabel];
        [v85 setTintColor:v84];

        changeToStrongPasswordCell = self->_changeToStrongPasswordCell;
      }
      v86 = [(UITableViewCell *)changeToStrongPasswordCell textLabel];
      [v86 setTintAdjustmentMode:v9];

LABEL_54:
      unsigned int v15 = *(UITableViewCell **)((char *)&self->super.super.super.super.isa + v49);
LABEL_55:
      v21 = v15;
      goto LABEL_63;
    case 13:
      v87 = [(SFAccountDetailViewController *)self tableView];
      v88 = [v87 dequeueReusableCellWithIdentifier:@"changePassword"];
      v89 = v88;
      if (!v88) {
        v89 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"changePassword"];
      }
      p_changePasswordOnWebsiteCell = &self->_changePasswordOnWebsiteCell;
      objc_storeStrong((id *)&self->_changePasswordOnWebsiteCell, v89);
      if (!v88) {

      }
      [(UITableViewCell *)*p_changePasswordOnWebsiteCell setAccessibilityIdentifier:@"ChangePasswordOnWebsiteCell"];
      v91 = [(UITableViewCell *)*p_changePasswordOnWebsiteCell textLabel];
      [v91 setTintAdjustmentMode:v9];

      [(WBSPasswordWarning *)self->_passwordWarning issueTypes];
      v102 = _WBSLocalizedString();
      v103 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v102 attributes:v10];
      v104 = [(UITableViewCell *)*p_changePasswordOnWebsiteCell textLabel];
      [v104 setAttributedText:v103];

      v105 = [(UITableViewCell *)*p_changePasswordOnWebsiteCell textLabel];
      [v105 setNumberOfLines:0];

      v106 = [(UITableViewCell *)*p_changePasswordOnWebsiteCell textLabel];
      [v106 _setTextColorFollowsTintColor:1];

      v107 = +[_SFAccountManagerAppearanceValues buttonCellTextColor];
      v108 = [(UITableViewCell *)*p_changePasswordOnWebsiteCell textLabel];
      [v108 setTintColor:v107];

      id v22 = *p_changePasswordOnWebsiteCell;
      break;
    case 14:
      uint64_t v16 = [(SFAccountDetailViewController *)self tableView];
      id v17 = [v16 dequeueReusableCellWithIdentifier:@"NotesCell"];
      notesCell = self->_notesCell;
      self->_notesCell = v17;

      [(SFAccountNoteTableViewCell *)self->_notesCell setDelegate:self];
      notesForEditing = self->_notesForEditing;
      if (notesForEditing)
      {
        uint64_t v20 = self->_notesForEditing;
      }
      else
      {
        uint64_t v20 = [(WBSSavedAccount *)self->_savedAccount notesEntry];
      }
      v126 = [(SFAccountNoteTableViewCell *)self->_notesCell textView];
      [v126 setText:v20];

      if (!notesForEditing) {
      v148[0] = MEMORY[0x1E4F143A8];
      }
      v148[1] = 3221225472;
      v148[2] = __62__SFAccountDetailViewController__cellForIdentifier_indexPath___block_invoke;
      v148[3] = &unk_1E5C725B8;
      objc_copyWeak(&v149, &location);
      [(SFAccountNoteTableViewCell *)self->_notesCell setTextDidChange:v148];
      id v22 = self->_notesCell;
      objc_destroyWeak(&v149);
      break;
    case 15:
      v92 = [(SFAccountDetailViewController *)self tableView];
      id v22 = [(SFAccountDetailViewController *)self _savedAccountWebsiteCellForTableView:v92 atIndexPath:v7];

      v151 = @"domain";
      v93 = [(SFEditableTableViewCell *)v22 textLabel];
      v94 = [v93 text];
      v152 = v94;
      v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v152 forKeys:&v151 count:1];
      v96 = WBSMakeAccessibilityIdentifier();
      [(SFEditableTableViewCell *)v22 setAccessibilityIdentifier:v96];

      break;
    case 16:
      v21 = [(SFAccountDetailViewController *)self _recoverRecentlyDeletedAccountCell];
      goto LABEL_63;
    case 17:
      v21 = [(SFAccountDetailViewController *)self _moveRecentlyDeletedAccountToMyPasswordsCell];
LABEL_63:
      id v22 = v21;
      break;
    case 18:
      v98 = [(SFAccountDetailViewController *)self tableView];
      id v22 = [(SFAccountDetailViewController *)self _deletePasskeyCellForTableView:v98];

      [(SFEditableTableViewCell *)v22 setAccessibilityIdentifier:@"AccountDetailViewDeletePasskeyCell"];
      break;
    case 19:
      v99 = [(SFAccountDetailViewController *)self tableView];
      id v22 = [(SFAccountDetailViewController *)self _deletePasswordCellForTableView:v99 shouldRemoveTOTPGenerator:0];

      [(SFEditableTableViewCell *)v22 setAccessibilityIdentifier:@"AccountDetailViewDeletePasswordCell"];
      break;
    case 20:
      v100 = [(SFAccountDetailViewController *)self tableView];
      id v22 = [(SFAccountDetailViewController *)self _deletePasswordCellForTableView:v100 shouldRemoveTOTPGenerator:1];

      [(SFEditableTableViewCell *)v22 setAccessibilityIdentifier:@"AccountDetailViewDeletePasswordAndVerificationCodeCell"];
      break;
    case 21:
      v101 = [(SFAccountDetailViewController *)self tableView];
      id v22 = [(SFAccountDetailViewController *)self _deleteCellForTableView:v101];

      [(SFEditableTableViewCell *)v22 setAccessibilityIdentifier:@"AccountDetailViewDeleteCell"];
      break;
    default:
      id v22 = 0;
      break;
  }

  objc_destroyWeak(&location);

  return v22;
}

void __62__SFAccountDetailViewController__cellForIdentifier_indexPath___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SFAccountDetailViewController__cellForIdentifier_indexPath___block_invoke_2;
  block[3] = &unk_1E5C725B8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __62__SFAccountDetailViewController__cellForIdentifier_indexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v2 = [WeakRetained tableView];
    [v2 beginUpdates];
    [v2 endUpdates];
    id v3 = [v6[146] textView];
    uint64_t v4 = [v3 text];
    id v5 = v6[148];
    v6[148] = (id)v4;

    id WeakRetained = v6;
  }
}

- (void)_reloadDiffableDataSourceOnInternalQueueAnimated:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __82__SFAccountDetailViewController__reloadDiffableDataSourceOnInternalQueueAnimated___block_invoke;
  v3[3] = &unk_1E5C72988;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __82__SFAccountDetailViewController__reloadDiffableDataSourceOnInternalQueueAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadDiffableDataSourceAnimated:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_reloadDiffableDataSourceAnimated:(BOOL)a3
{
  uint64_t v3 = a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  [v5 appendSectionsWithIdentifiers:&unk_1EFBDF2E0];
  [v5 appendItemsWithIdentifiers:&unk_1EFBDF2F8];
  [v5 reconfigureItemsWithIdentifiers:&unk_1EFBDF310];
  switch([(WBSSavedAccount *)self->_savedAccount credentialTypes])
  {
    case 1:
      id v6 = &unk_1EFBDF328;
      goto LABEL_4;
    case 2:
      id v6 = &unk_1EFBDF340;
LABEL_4:
      id v7 = &unk_1EFBDE830;
      goto LABEL_11;
    case 3:
      if (self->_isForFillingIndividualAccountFields) {
        int64_t v8 = &unk_1EFBDF358;
      }
      else {
        int64_t v8 = &unk_1EFBDF370;
      }
      [v5 appendSectionsWithIdentifiers:v8];
      [v5 appendItemsWithIdentifiers:&unk_1EFBDF388 intoSectionWithIdentifier:&unk_1EFBDE818];
      if ([(SFAccountDetailViewController *)self _shouldAddDeletePasskeyItem]) {
        [v5 appendItemsWithIdentifiers:&unk_1EFBDF3A0 intoSectionWithIdentifier:&unk_1EFBDE818];
      }
      id v6 = &unk_1EFBDF3B8;
      id v7 = &unk_1EFBDE7E8;
LABEL_11:
      [v5 appendItemsWithIdentifiers:v6 intoSectionWithIdentifier:v7];
      goto LABEL_12;
    case 4:
      goto LABEL_52;
    default:
LABEL_12:
      uint64_t v9 = [(WBSSavedAccount *)self->_savedAccount password];

      if (v9) {
        [v5 reconfigureItemsWithIdentifiers:&unk_1EFBDF3D0];
      }
      if ([(SFAccountDetailViewController *)self _completedUpgrade])
      {
        [v5 appendSectionsWithIdentifiers:&unk_1EFBDF3E8];
        [v5 appendItemsWithIdentifiers:&unk_1EFBDF400 intoSectionWithIdentifier:&unk_1EFBDE878];
        [v5 reconfigureItemsWithIdentifiers:&unk_1EFBDF418];
        if (self->_completedUpgradeToStrongPassword)
        {
          [(SFAccountDetailViewController *)self _addGroupCellsToSnapshot:v5];
          [v5 appendSectionsWithIdentifiers:&unk_1EFBDF430];
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          uint64_t v10 = [(WBSSavedAccount *)self->_savedAccount userVisibleSites];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v36;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v36 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v42 = *(void *)(*((void *)&v35 + 1) + 8 * i);
                unsigned int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
                [v5 appendItemsWithIdentifiers:v15 intoSectionWithIdentifier:&unk_1EFBDE7D0];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v43 count:16];
            }
            while (v12);
          }

          [v5 appendSectionsWithIdentifiers:&unk_1EFBDF448];
          [v5 appendItemsWithIdentifiers:&unk_1EFBDF460 intoSectionWithIdentifier:&unk_1EFBDE800];
          uint64_t v3 = v3;
        }
        [(SFTableViewDiffableDataSource *)self->_tableViewDiffableDataSource applySnapshot:v5 animatingDifferences:v3];
        goto LABEL_52;
      }
      [(SFAccountDetailViewController *)self _addGroupCellsToSnapshot:v5];
      if ([(SFAccountDetailViewController *)self _shouldShowSecurityRecommendationSection])
      {
        [(SFAccountDetailViewController *)self _addAccountUpgradeItemsForSectionType:5 toSnapshot:v5];
        self->_accountUpgradeOriginType = 1;
      }
      if ([(NSArray *)self->_TOTPGenerators count]) {
        [(SFAccountDetailViewController *)self _addTOTPGeneratorsToSnapshot:v5];
      }
      if ([(SFAccountDetailViewController *)self _allowEditing]
        || ([(WBSSavedAccount *)self->_savedAccount notesEntry],
            uint64_t v16 = objc_claimAutoreleasedReturnValue(),
            uint64_t v17 = [v16 length],
            v16,
            v17))
      {
        [(SFAccountDetailViewController *)self _addNotesSectionToSnapshot:v5];
      }
      [(SFAccountDetailViewController *)self _updateAddButtonsInAccountOptionsSectionForSnapshot:v5];
      if ([(SFAccountDetailViewController *)self _shouldShowSecurityRecommendationSection]|| ([(WBSSavedAccount *)self->_savedAccount credentialTypes] & 1) == 0)
      {
        goto LABEL_40;
      }
      uint64_t v18 = [(WBSSavedAccount *)self->_savedAccount credentialTypes];
      if (v18 == 1)
      {
        uint64_t v19 = 6;
      }
      else
      {
        if (v18 != 3) {
          goto LABEL_39;
        }
        uint64_t v19 = 2;
      }
      [(SFAccountDetailViewController *)self _addAccountUpgradeItemsForSectionType:v19 toSnapshot:v5];
LABEL_39:
      self->_accountUpgradeOriginType = 2;
LABEL_40:
      if ([(WBSSavedAccount *)self->_savedAccount hasValidWebsite])
      {
        unsigned int v29 = v3;
        [v5 appendSectionsWithIdentifiers:&unk_1EFBDF478];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v20 = [(WBSSavedAccount *)self->_savedAccount userVisibleSites];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v41 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v32;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v32 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v40 = *(void *)(*((void *)&v31 + 1) + 8 * j);
              uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
              [v5 appendItemsWithIdentifiers:v25 intoSectionWithIdentifier:&unk_1EFBDE7D0];
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v41 count:16];
          }
          while (v22);
        }

        uint64_t v3 = v29;
      }
      if ([(WBSSavedAccount *)self->_savedAccount credentialTypes] == 2)
      {
        long long v26 = [(WBSSavedAccount *)self->_savedAccount passkeyRelyingPartyID];
        char v39 = v26;
        long long v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
        [v5 appendItemsWithIdentifiers:v27 intoSectionWithIdentifier:&unk_1EFBDE7D0];
      }
      [(SFAccountDetailViewController *)self _configureDeleteSectionInSnapshot:v5];
      tableViewDiffableDataSource = self->_tableViewDiffableDataSource;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __67__SFAccountDetailViewController__reloadDiffableDataSourceAnimated___block_invoke;
      v30[3] = &unk_1E5C724D8;
      v30[4] = self;
      [(SFTableViewDiffableDataSource *)tableViewDiffableDataSource applySnapshot:v5 animatingDifferences:v3 completion:v30];
LABEL_52:

      return;
  }
}

uint64_t __67__SFAccountDetailViewController__reloadDiffableDataSourceAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadPasskeySectionFooters];
}

- (void)_addGroupCellsToSnapshot:(id)a3
{
  id v7 = a3;
  BOOL v4 = [MEMORY[0x1E4F98C48] sharedProvider];
  id v5 = [v4 cachedGroups];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    [v7 appendItemsWithIdentifiers:&unk_1EFBDF490 intoSectionWithIdentifier:&unk_1EFBDE830];
    [v7 reconfigureItemsWithIdentifiers:&unk_1EFBDF4A8];
  }
  if ([(WBSSavedAccount *)self->_savedAccount isSavedInSharedGroup]) {
    [v7 appendItemsWithIdentifiers:&unk_1EFBDF4C0 intoSectionWithIdentifier:&unk_1EFBDE830];
  }
}

- (BOOL)_shouldAddDeletePasskeyItem
{
  return ([(WBSSavedAccount *)self->_savedAccount isRecentlyDeleted] & 1) == 0
      && !self->_isForFillingIndividualAccountFields;
}

- (void)_configureDeleteSectionInSnapshot:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(WBSSavedAccount *)self->_savedAccount canUserEditSavedAccount]
    && !self->_isForFillingIndividualAccountFields)
  {
    int v5 = [(WBSSavedAccount *)self->_savedAccount isRecentlyDeleted];
    savedAccount = self->_savedAccount;
    if (v5)
    {
      if ([(WBSSavedAccount *)savedAccount canUserEditSavedAccount])
      {
        [v4 appendSectionsWithIdentifiers:&unk_1EFBDF4D8];
        [v4 appendItemsWithIdentifiers:&unk_1EFBDF4F0 intoSectionWithIdentifier:&unk_1EFBDE800];
        if ([(WBSSavedAccount *)self->_savedAccount isSavedInSharedGroup]
          && [(WBSSavedAccount *)self->_savedAccount isCurrentUserOriginalContributor])
        {
          [v4 appendItemsWithIdentifiers:&unk_1EFBDF508 intoSectionWithIdentifier:&unk_1EFBDE800];
        }
        id v7 = &unk_1EFBDF520;
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v8 = [(WBSSavedAccount *)savedAccount credentialTypes];
      if ((unint64_t)(v8 - 3) < 2)
      {
        NSUInteger v9 = [(NSArray *)self->_TOTPGenerators count];
        uint64_t v10 = &unk_1EFBDE8F0;
        if (!v9) {
          uint64_t v10 = &unk_1EFBDE908;
        }
        v12[0] = v10;
        uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
        [v4 appendItemsWithIdentifiers:v11 intoSectionWithIdentifier:&unk_1EFBDE7E8];
      }
      else if ((unint64_t)(v8 - 1) <= 1)
      {
        [v4 appendSectionsWithIdentifiers:&unk_1EFBDF538];
        id v7 = &unk_1EFBDF550;
LABEL_12:
        [v4 appendItemsWithIdentifiers:v7 intoSectionWithIdentifier:&unk_1EFBDE800];
      }
    }
  }
}

- (id)_groupSectionValueStyleTableViewCellWithText:(id)a3 secondaryText:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4FB1948];
  id v7 = a4;
  id v8 = a3;
  NSUInteger v9 = [v6 valueCellConfiguration];
  [v9 setText:v8];

  [v9 setSecondaryText:v7];
  uint64_t v10 = [(SFAccountDetailViewController *)self tableView];
  uint64_t v11 = [v10 dequeueReusableCellWithIdentifier:@"sharedGroupValueCell"];
  uint64_t v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = (id)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"sharedGroupValueCell"];
  }
  id v14 = v13;

  [v14 setContentConfiguration:v9];

  return v14;
}

- (BOOL)_shouldShowSecurityRecommendationSection
{
  passwordWarning = self->_passwordWarning;
  if (passwordWarning) {
    LOBYTE(passwordWarning) = ([(WBSPasswordWarning *)passwordWarning hasBeenHidden] & 1) == 0
  }
                           && [(WBSPasswordWarning *)self->_passwordWarning severity] != 0;
  return (char)passwordWarning;
}

- (void)_addAccountUpgradeItemsForSectionType:(int64_t)a3 toSnapshot:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(SFAccountDetailViewController *)self _allowAuditing]
    && ([(WBSSavedAccount *)self->_savedAccount isRecentlyDeleted] & 1) == 0)
  {
    id v7 = [NSNumber numberWithInteger:a3];
    id v8 = [v6 sectionIdentifiers];
    uint64_t v9 = [v8 indexOfObject:v7];

    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v12[0] = v7;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      [v6 appendSectionsWithIdentifiers:v10];
    }
    if (a3 == 5)
    {
      [v6 appendItemsWithIdentifiers:&unk_1EFBDF568 intoSectionWithIdentifier:v7];
      [v6 reconfigureItemsWithIdentifiers:&unk_1EFBDF580];
    }
    if (self->_eligibleToUpgradeToSignInWithApple) {
      [v6 appendItemsWithIdentifiers:&unk_1EFBDF598 intoSectionWithIdentifier:v7];
    }
    if (self->_eligibleToChangeToStrongPassword) {
      uint64_t v11 = &unk_1EFBDF5B0;
    }
    else {
      uint64_t v11 = &unk_1EFBDF5C8;
    }
    [v6 appendItemsWithIdentifiers:v11 intoSectionWithIdentifier:v7];
  }
}

- (void)_updateAddButtonsInAccountOptionsSectionForSnapshot:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(SFAccountDetailViewController *)self _allowEditing]
    && ![(NSArray *)self->_TOTPGenerators count]
    && [(WBSSavedAccount *)self->_savedAccount credentialTypes] != 2;
  uint64_t v6 = [v4 indexOfItemIdentifier:&unk_1EFBDE968];
  char v7 = v6 == 0x7FFFFFFFFFFFFFFFLL || v5;
  if (((v5 ^ (v6 == 0x7FFFFFFFFFFFFFFFLL)) & 1) == 0)
  {
    char v8 = !v5;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
      char v8 = 1;
    }
    if (v8)
    {
      if ((v7 & 1) == 0) {
        [v4 deleteItemsWithIdentifiers:&unk_1EFBDF628];
      }
      goto LABEL_29;
    }
    if ([v4 indexOfSectionIdentifier:&unk_1EFBDE980] != 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_22:
      uint64_t v11 = [(WBSSavedAccount *)self->_savedAccount credentialTypes];
      if (v11 == 3)
      {
        [v4 insertItemsWithIdentifiers:&unk_1EFBDF610 afterItemWithIdentifier:&unk_1EFBDE848];
      }
      else if (v11 == 1)
      {
        uint64_t v12 = [v4 itemIdentifiersInSectionWithIdentifier:&unk_1EFBDE980];
        if ([v12 count])
        {
          id v13 = [v12 firstObject];
          [v4 insertItemsWithIdentifiers:&unk_1EFBDF5E0 beforeItemWithIdentifier:v13];
        }
        else
        {
          [v4 appendItemsWithIdentifiers:&unk_1EFBDF5F8 intoSectionWithIdentifier:&unk_1EFBDE980];
        }
      }
LABEL_29:
      if ([v4 indexOfSectionIdentifier:&unk_1EFBDE980] != 0x7FFFFFFFFFFFFFFFLL
        && ![v4 numberOfItemsInSection:&unk_1EFBDE980])
      {
        unsigned int v15 = &unk_1EFBDE980;
        id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
        [v4 deleteSectionsWithIdentifiers:v14];
      }
      goto LABEL_32;
    }
    if ([v4 indexOfSectionIdentifier:&unk_1EFBDE7D0] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v4 indexOfSectionIdentifier:&unk_1EFBDE800] == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v16 = &unk_1EFBDE980;
        uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
        [v4 appendSectionsWithIdentifiers:v9];
LABEL_21:

        goto LABEL_22;
      }
      uint64_t v17 = &unk_1EFBDE980;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      uint64_t v10 = &unk_1EFBDE800;
    }
    else
    {
      v18[0] = &unk_1EFBDE980;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      uint64_t v10 = &unk_1EFBDE7D0;
    }
    [v4 insertSectionsWithIdentifiers:v9 beforeSectionWithIdentifier:v10];
    goto LABEL_21;
  }
LABEL_32:
}

- (void)_addTOTPGeneratorsToSnapshot:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(WBSSavedAccount *)self->_savedAccount credentialTypes];
  if (v4 == 3)
  {
    [v7 insertItemsWithIdentifiers:self->_TOTPGenerators afterItemWithIdentifier:&unk_1EFBDE848];
LABEL_9:
    uint64_t v6 = v7;
    goto LABEL_10;
  }
  if (v4 == 2)
  {
    [v7 insertSectionsWithIdentifiers:&unk_1EFBDF658 beforeSectionWithIdentifier:&unk_1EFBDE830];
    goto LABEL_8;
  }
  BOOL v5 = v4 == 1;
  uint64_t v6 = v7;
  if (v5)
  {
    [v7 insertSectionsWithIdentifiers:&unk_1EFBDF640 afterSectionWithIdentifier:&unk_1EFBDE830];
LABEL_8:
    [v7 appendItemsWithIdentifiers:self->_TOTPGenerators intoSectionWithIdentifier:&unk_1EFBDE7B8];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_configureSecurityRecommendationInfoCell
{
  if (self->_completedUpgradeToSignInWithApple)
  {
    [(SFSecurityRecommendationInfoCell *)self->_securityRecommendationInfoCell showCheckmarkForDetailView];
    uint64_t v3 = _WBSLocalizedString();
    [(SFSecurityRecommendationInfoCell *)self->_securityRecommendationInfoCell setTitle:v3];

    uint64_t v4 = [(SFAccountDetailViewController *)self _subtitleStringForSignInWithAppleUpgrade];
LABEL_5:
    uint64_t v6 = (void *)v4;
    [(SFSecurityRecommendationInfoCell *)self->_securityRecommendationInfoCell setSubtitle:v4];

    id v7 = [(SFSecurityRecommendationInfoCell *)self->_securityRecommendationInfoCell subtitleLabel];
    char v8 = [v7 layer];
    [v8 setDisableUpdateMask:0];

    securityRecommendationInfoCell = self->_securityRecommendationInfoCell;
    [(SFSecurityRecommendationInfoCell *)securityRecommendationInfoCell setShowsHideButton:0];
    return;
  }
  if (self->_completedUpgradeToStrongPassword)
  {
    [(SFSecurityRecommendationInfoCell *)self->_securityRecommendationInfoCell showCheckmarkForDetailView];
    BOOL v5 = _WBSLocalizedString();
    [(SFSecurityRecommendationInfoCell *)self->_securityRecommendationInfoCell setTitle:v5];

    uint64_t v4 = [(SFAccountDetailViewController *)self _subtitleStringForStrongPasswordUpgrade];
    goto LABEL_5;
  }
  if ([(WBSPasswordWarning *)self->_passwordWarning issueTypes] == 1) {
    uint64_t v10 = @"secondaryWarningImageColor";
  }
  else {
    uint64_t v10 = @"warningImageColor";
  }
  objc_msgSend(MEMORY[0x1E4FB1618], "sf_colorNamed:", v10);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.triangle.fill"];
  uint64_t v12 = [v11 imageWithTintColor:v18 renderingMode:1];
  [(SFSecurityRecommendationInfoCell *)self->_securityRecommendationInfoCell setIcon:v12];

  id v13 = [(WBSPasswordWarning *)self->_passwordWarning localizedShortDescriptivePhrase];
  [(SFSecurityRecommendationInfoCell *)self->_securityRecommendationInfoCell setTitle:v13];

  id v14 = [(SFAccountDetailViewController *)self _securityRecommendationSubtitleString];
  [(SFSecurityRecommendationInfoCell *)self->_securityRecommendationInfoCell setSubtitle:v14];

  [(SFSecurityRecommendationInfoCell *)self->_securityRecommendationInfoCell setShowsHideButton:[(WBSPasswordWarning *)self->_passwordWarning hasBeenHidden] ^ 1];
  unsigned int v15 = objc_msgSend(MEMORY[0x1E4F1CB18], "pm_defaults");
  LOBYTE(v12) = objc_msgSend(v15, "pm_passwordManagerIsInDemoMode");

  if ((v12 & 1) == 0)
  {
    uint64_t v16 = [(SFSecurityRecommendationInfoCell *)self->_securityRecommendationInfoCell subtitleLabel];
    uint64_t v17 = [v16 layer];
    [v17 setDisableUpdateMask:18];
  }
}

- (id)_securityRecommendationSubtitleString
{
  if (([(WBSPasswordWarning *)self->_passwordWarning issueTypes] & 8) != 0)
  {
    uint64_t v4 = _WBSLocalizedString();
    BOOL v5 = [(WBSPasswordWarning *)self->_passwordWarning localizedLongDescriptionForClient:1];
    uint64_t v6 = [NSString stringWithFormat:@" %@", v4];
    uint64_t v3 = [v5 stringByAppendingString:v6];
  }
  else
  {
    uint64_t v3 = [(WBSPasswordWarning *)self->_passwordWarning localizedLongDescriptionForClient:1];
  }

  return v3;
}

- (id)_subtitleStringForSignInWithAppleUpgrade
{
  int64_t accountUpgradeOriginType = self->_accountUpgradeOriginType;
  if (accountUpgradeOriginType == 2 || accountUpgradeOriginType == 1)
  {
    [MEMORY[0x1E4F98AF8] isAppleAccountBrandingEnabled];
    uint64_t v3 = _WBSLocalizedString();
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_subtitleStringForStrongPasswordUpgrade
{
  int64_t accountUpgradeOriginType = self->_accountUpgradeOriginType;
  if (accountUpgradeOriginType == 2 || accountUpgradeOriginType == 1)
  {
    uint64_t v3 = _WBSLocalizedString();
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_editableCellWithCell:(id)a3
{
  id v3 = a3;

  return v3;
}

- (void)_configureUserCell:(id)a3
{
  id v10 = a3;
  uint64_t v4 = _WBSLocalizedString();
  userForEditing = self->_userForEditing;
  uint64_t v6 = userForEditing;
  if (!userForEditing)
  {
    uint64_t v6 = [(WBSSavedAccount *)self->_savedAccount user];
  }
  id v7 = _WBSLocalizedString();
  [(SFAccountDetailViewController *)self _configureCell:v10 withText:v4 detailText:v6 detailPlaceholderText:v7 secureEntry:0];

  if (!userForEditing) {
  [v10 setAccessibilityIdentifier:@"PasswordDetailViewUsernameCell"];
  }
  char v8 = [v10 textLabel];
  [v8 setAccessibilityIdentifier:@"PasswordDetailViewUsernameLabel"];

  if (self->_isForFillingIndividualAccountFields)
  {
    uint64_t v9 = +[_SFAccountManagerAppearanceValues buttonCellTextColor];
    [v10 setOverrideEditableTextFieldTextColor:v9];
  }
  else
  {
    [v10 setOverrideEditableTextFieldTextColor:0];
  }
}

- (id)_securePasswordPlaceholderText:(id)a3
{
  uint64_t v3 = objc_msgSend(a3, "safari_numberOfComposedCharacters");

  return (id)[&stru_1EFB97EB8 stringByPaddingToLength:v3 withString:@"•" startingAtIndex:0];
}

- (void)_configurePasswordCell:(id)a3
{
  id v15 = a3;
  passwordForEditing = self->_passwordForEditing;
  if (passwordForEditing)
  {
    BOOL v5 = passwordForEditing;
  }
  else
  {
    BOOL v5 = [(WBSSavedAccount *)self->_savedAccount password];
  }
  uint64_t v6 = v5;
  if (self->_showPasswordAsBulletsWhenNotEditing
    && ![(SFAccountDetailViewController *)self isEditing])
  {
    id v7 = [(SFAccountDetailViewController *)self _securePasswordPlaceholderText:v6];
  }
  else
  {
    id v7 = v6;
  }
  char v8 = v7;
  if (self->_completedUpgradeToSignInWithApple)
  {

    char v8 = @"—";
  }
  uint64_t v9 = _WBSLocalizedString();
  id v10 = _WBSLocalizedString();
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CB18], "pm_defaults");
  -[SFAccountDetailViewController _configureCell:withText:detailText:detailPlaceholderText:secureEntry:](self, "_configureCell:withText:detailText:detailPlaceholderText:secureEntry:", v15, v9, v8, v10, objc_msgSend(v11, "pm_passwordManagerIsInDemoMode") ^ 1);

  [v15 setAccessibilityIdentifier:@"PasswordDetailViewPasswordCell"];
  uint64_t v12 = [v15 textLabel];
  [v12 setAccessibilityIdentifier:@"PasswordDetailViewUsernameLabel"];

  if (self->_completedUpgradeToSignInWithApple) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = [(SFAccountDetailViewController *)self isEditing];
  }
  [v15 setEnabled:v13];
  [(SFAccountDetailViewController *)self _setHighLyLegibleFontForDetailTextInCell:v15];
  if (self->_isForFillingIndividualAccountFields)
  {
    id v14 = +[_SFAccountManagerAppearanceValues buttonCellTextColor];
    [v15 setOverrideEditableTextFieldTextColor:v14];
  }
  else
  {
    [v15 setOverrideEditableTextFieldTextColor:0];
  }
}

- (void)_setHighLyLegibleFontForDetailTextInCell:(id)a3
{
  id v4 = a3;
  if ([(SFAccountDetailViewController *)self _allowEditing])
  {
    id v11 = [(SFAccountDetailViewController *)self _editableCellWithCell:v4];

    BOOL v5 = [v11 editableTextField];
    uint64_t v6 = (void *)MEMORY[0x1E4FB1798];
    id v7 = [v5 font];
    char v8 = objc_msgSend(v6, "_sf_highLegibilityAlternateFont:", v7);

    if (v8) {
      [v5 setFont:v8];
    }
  }
  else
  {
    id v11 = [v4 detailTextLabel];

    uint64_t v9 = (void *)MEMORY[0x1E4FB1798];
    id v10 = [v11 font];
    BOOL v5 = objc_msgSend(v9, "_sf_highLegibilityAlternateFont:", v10);

    if (v5) {
      [v11 setFont:v5];
    }
  }
}

- (void)_configureCell:(id)a3 withText:(id)a4 detailText:(id)a5 detailPlaceholderText:(id)a6 secureEntry:(BOOL)a7
{
  BOOL v7 = a7;
  id v17 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v14 textLabel];
  [v15 setText:v13];

  uint64_t v16 = [v14 editableTextField];

  [v16 setText:v12];
  [v16 setSecureTextEntry:v7];
  [v16 setDisplaySecureTextUsingPlainText:v7];
  if ([(SFAccountDetailViewController *)self _allowEditing])
  {
    [v16 addTarget:self action:sel__textFieldChanged_ forControlEvents:0x20000];
    [v16 setPlaceholder:v17];
  }
}

- (id)_savedAccountWebsiteCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WBSSavedAccount *)self->_savedAccount credentialTypes];
  savedAccount = self->_savedAccount;
  if (v8 == 2)
  {
    id v10 = [(WBSSavedAccount *)savedAccount passkeyRelyingPartyID];
  }
  else
  {
    id v11 = [(WBSSavedAccount *)savedAccount userVisibleSites];
    id v10 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  }
  id v12 = [v6 dequeueReusableCellWithIdentifier:@"site"];
  if (!v12) {
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"site"];
  }
  id v13 = [v12 textLabel];
  [v13 setText:v10];

  if (([(SFAccountDetailViewController *)self _allowEditing]
     || [(SFAccountDetailViewController *)self _allowAuditing])
    && v10)
  {
    id v14 = (void *)MEMORY[0x1E4F1CB10];
    id v15 = [@"https://" stringByAppendingString:v10];
    uint64_t v16 = [v14 URLWithString:v15];

    if (v16)
    {
      id v17 = objc_alloc_init(_SFWebsiteButton);
      objc_initWeak(&location, self);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __82__SFAccountDetailViewController__savedAccountWebsiteCellForTableView_atIndexPath___block_invoke;
      v19[3] = &unk_1E5C729B0;
      objc_copyWeak(&v21, &location);
      id v20 = v16;
      [(_SFWebsiteButton *)v17 setActivationHandler:v19];
      [v12 setAccessoryView:v17];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }

  return v12;
}

void __82__SFAccountDetailViewController__savedAccountWebsiteCellForTableView_atIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    int v4 = objc_msgSend(WeakRetained, "safari_checkForAbilityToOpenWebContentAndNotifyIfNecessary:", *(void *)(a1 + 32));
    uint64_t v3 = v7;
    if (v4)
    {
      BOOL v5 = objc_alloc_init(SFSafariViewControllerConfiguration);
      [(SFSafariViewControllerConfiguration *)v5 _setPerformingAccountSecurityUpgrade:1];
      id v6 = [[SFSafariViewController alloc] initWithURL:*(void *)(a1 + 32) configuration:v5];
      [(SFSafariViewController *)v6 setModalPresentationStyle:1];
      [(SFSafariViewController *)v6 setModalInPresentation:1];
      [v7 presentViewController:v6 animated:1 completion:0];

      uint64_t v3 = v7;
    }
  }
}

- (id)_deleteCellForTableView:(id)a3
{
  int v4 = [a3 dequeueReusableCellWithIdentifier:@"deleteAccount"];
  if (!v4) {
    int v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"deleteAccount"];
  }
  uint64_t v5 = [(WBSSavedAccount *)self->_savedAccount credentialTypes];
  if (v5 == 3 || v5 == 2 || v5 == 1)
  {
    id v6 = _WBSLocalizedString();
    id v7 = [v4 textLabel];
    [v7 setText:v6];
  }
  BOOL v8 = [(SFAccountDetailViewController *)self _canUserDeleteSavedAccount];
  if (v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = 2;
  }
  id v10 = [v4 textLabel];
  [v10 setTintAdjustmentMode:v9];

  id v11 = [v4 textLabel];
  [v11 setEnabled:v8];

  id v12 = [MEMORY[0x1E4FB1618] systemRedColor];
  id v13 = [v4 textLabel];
  [v13 setTextColor:v12];

  int64_t v14 = [(SFAccountDetailViewController *)self _textAlignmentOfCellsInDeleteAccountSection];
  id v15 = [v4 textLabel];
  [v15 setTextAlignment:v14];

  uint64_t v16 = [v4 textLabel];
  [v16 setNumberOfLines:0];

  return v4;
}

- (BOOL)_canUserDeleteSavedAccount
{
  int v3 = [(WBSSavedAccount *)self->_savedAccount canUserEditSavedAccount];
  if (v3)
  {
    if ([(WBSSavedAccount *)self->_savedAccount isRecentlyDeleted])
    {
      savedAccount = self->_savedAccount;
      LOBYTE(v3) = [(WBSSavedAccount *)savedAccount isCurrentUserOriginalContributor];
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)_configureHeaderViewCell:(id)a3
{
  id v12 = a3;
  [v12 setDelegate:self];
  int v4 = [(WBSSavedAccount *)self->_savedAccount userVisibleDomain];
  uint64_t v5 = [(WBSSavedAccount *)self->_savedAccount customTitle];
  [v12 setHeaderTitleForHighLevelDomain:v4 customTitle:v5];

  titleForEditing = self->_titleForEditing;
  if (titleForEditing)
  {
    id v7 = [v12 titleTextField];
    [v7 setText:titleForEditing];
  }
  [(SFAccountDetailViewController *)self _updateIconForCell:v12];
  BOOL v8 = [(SFAccountDetailViewController *)self _lastModifiedDateString];
  [v12 setLastModifiedDateString:v8];

  uint64_t v9 = [(WBSSavedAccount *)self->_savedAccount customTitle];
  id v10 = (NSString *)[v9 copy];
  id v11 = self->_titleForEditing;
  self->_titleForEditing = v10;

  [(SFAccountDetailViewController *)self _updateHeaderViewCell];
  [v12 setSavedAccount:self->_savedAccount];
}

- (void)_updateIconForCell:(id)a3
{
  id v13 = a3;
  int v4 = [(WBSSavedAccount *)self->_savedAccount highLevelDomain];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v6 = [WeakRetained iconControllerForAccountDetailViewController:self];
    id v7 = [v6 iconForDomain:v4];
    if (v7
      && ((v8 = v7, [v7 size], v10 == 56.0) ? (BOOL v11 = v9 == 56.0) : (BOOL v11 = 0),
          v11
       || (objc_msgSend(MEMORY[0x1E4F98BC8], "resizedImage:withSize:", v8),
           uint64_t v12 = objc_claimAutoreleasedReturnValue(),
           v8,
           (BOOL v8 = (void *)v12) != 0)))
    {
      [v13 setIcon:v8];
    }
    else
    {
      BOOL v8 = [v6 backgroundColorForDomain:v4];
      [v13 setMonogramBackgroundColor:v8];
    }
  }
  else
  {
    id v6 = +[_SFAccountManagerAppearanceValues defaultMonogramBackgroundColor];
    [v13 setMonogramBackgroundColor:v6];
  }
}

- (id)_deletePasswordCellForTableView:(id)a3 shouldRemoveTOTPGenerator:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = [a3 dequeueReusableCellWithIdentifier:@"removePassword"];
  if (v5)
  {
    if (v4)
    {
LABEL_3:
      id v6 = _WBSLocalizedString();
      id v7 = [v5 textLabel];
      [v7 setText:v6];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"removePassword"];
    if (v4) {
      goto LABEL_3;
    }
  }
  id v6 = _WBSLocalizedString();
  id v7 = [v5 textLabel];
  [v7 setText:v6];
  BOOL v8 = [v5 textLabel];
  [v8 setText:v6];

LABEL_6:
  double v9 = [MEMORY[0x1E4FB1618] systemRedColor];
  double v10 = [v5 textLabel];
  [v10 setTextColor:v9];

  BOOL v11 = [v5 textLabel];
  [v11 setNumberOfLines:0];

  return v5;
}

- (id)_deletePasskeyCellForTableView:(id)a3
{
  int v3 = [a3 dequeueReusableCellWithIdentifier:@"removePasskey"];
  if (!v3) {
    int v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"removePasskey"];
  }
  BOOL v4 = _WBSLocalizedString();
  uint64_t v5 = [v3 textLabel];
  [v5 setText:v4];
  id v6 = [v3 textLabel];
  [v6 setText:v4];

  id v7 = [MEMORY[0x1E4FB1618] systemRedColor];
  BOOL v8 = [v3 textLabel];
  [v8 setTextColor:v7];

  double v9 = [v3 textLabel];
  [v9 setNumberOfLines:0];

  return v3;
}

- (id)_groupPickerTableViewCell
{
  [(WBSSavedAccount *)self->_savedAccount isRecentlyDeleted];
  int v3 = _WBSLocalizedString();
  if ([(WBSSavedAccount *)self->_savedAccount isSavedInSharedGroup])
  {
    BOOL v4 = [MEMORY[0x1E4F98C48] sharedProvider];
    uint64_t v5 = [(WBSSavedAccount *)self->_savedAccount sharedGroupID];
    id v6 = [v4 cachedGroupWithID:v5];
    id v7 = [v6 displayName];
  }
  else
  {
    id v7 = _WBSLocalizedString();
  }
  BOOL v8 = [(SFAccountDetailViewController *)self _groupSectionValueStyleTableViewCellWithText:v3 secondaryText:v7];

  return v8;
}

- (id)_originalContributorCell
{
  int v3 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  BOOL v4 = _WBSLocalizedString();
  [v3 setText:v4];

  uint64_t v5 = [MEMORY[0x1E4F18AF8] sharedManager];
  id v6 = [(WBSSavedAccount *)self->_savedAccount originalContributorParticipantID];
  id v7 = [(WBSSavedAccount *)self->_savedAccount sharedGroupID];
  BOOL v8 = [v5 displayNameForOriginalContributorParticipantID:v6 inGroupID:v7];
  [v3 setSecondaryText:v8];

  double v9 = [(SFAccountDetailViewController *)self tableView];
  double v10 = [v9 dequeueReusableCellWithIdentifier:@"originalContributor"];
  BOOL v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"originalContributor"];
  }
  id v13 = v12;

  [v13 setContentConfiguration:v3];

  return v13;
}

- (id)_recoverRecentlyDeletedAccountCell
{
  int v3 = [(SFAccountDetailViewController *)self tableView];
  BOOL v4 = [v3 dequeueReusableCellWithIdentifier:@"RecoverRecentlyDeletedAccount"];
  uint64_t v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"RecoverRecentlyDeletedAccount"];
  }
  id v7 = v6;

  BOOL v8 = [MEMORY[0x1E4FB1948] cellConfiguration];
  if ([(WBSSavedAccount *)self->_savedAccount isSavedInSharedGroup]) {
    [(WBSSavedAccount *)self->_savedAccount isCurrentUserOriginalContributor];
  }
  double v9 = _WBSLocalizedString();
  [v8 setText:v9];
  double v10 = +[_SFAccountManagerAppearanceValues buttonCellTextColor];
  BOOL v11 = [v8 textProperties];
  [v11 setColor:v10];

  int64_t v12 = [(SFAccountDetailViewController *)self _listContentTextAlignmentOfCellsInDeleteAccountSection];
  id v13 = [v8 textProperties];
  [v13 setAlignment:v12];

  [v7 setContentConfiguration:v8];

  return v7;
}

- (id)_moveRecentlyDeletedAccountToMyPasswordsCell
{
  int v3 = [(SFAccountDetailViewController *)self tableView];
  BOOL v4 = [v3 dequeueReusableCellWithIdentifier:@"MoveRecentlyDeletedAccountToMyPasswords"];
  uint64_t v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"MoveRecentlyDeletedAccountToMyPasswords"];
  }
  id v7 = v6;

  BOOL v8 = [MEMORY[0x1E4FB1948] cellConfiguration];
  double v9 = _WBSLocalizedString();
  [v8 setText:v9];

  double v10 = [MEMORY[0x1E4FB1618] tintColor];
  BOOL v11 = [v8 textProperties];
  [v11 setColor:v10];

  int64_t v12 = [(SFAccountDetailViewController *)self _listContentTextAlignmentOfCellsInDeleteAccountSection];
  id v13 = [v8 textProperties];
  [v13 setAlignment:v12];

  [v7 setContentConfiguration:v8];

  return v7;
}

- (int64_t)_listContentTextAlignmentOfCellsInDeleteAccountSection
{
  id v2 = [(SFTableViewDiffableDataSource *)self->_tableViewDiffableDataSource snapshot];
  int64_t v3 = [v2 numberOfItemsInSection:&unk_1EFBDE800] < 2;

  return v3;
}

- (int64_t)_textAlignmentOfCellsInDeleteAccountSection
{
  id v2 = [(SFTableViewDiffableDataSource *)self->_tableViewDiffableDataSource snapshot];
  if ([v2 numberOfItemsInSection:&unk_1EFBDE800] <= 1) {
    int64_t v3 = 1;
  }
  else {
    int64_t v3 = 4;
  }

  return v3;
}

- (id)_cellsThatChangeAppearanceOnEdit
{
  id v2 = [MEMORY[0x1E4F1CA48] array];
  [v2 addObjectsFromArray:&unk_1EFBDF670];
  [v2 addObjectsFromArray:&unk_1EFBDF688];
  [v2 addObjectsFromArray:&unk_1EFBDF6A0];

  return v2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(SFTableViewDiffableDataSource *)self->_tableViewDiffableDataSource itemIdentifierForIndexPath:v7];
  int64_t v9 = [(SFAccountDetailViewController *)self _itemTypeForIdentifier:v8];

  switch(v9)
  {
    case 18:
      [v6 deselectRowAtIndexPath:v7 animated:1];
      goto LABEL_3;
    case 19:
      [v6 deselectRowAtIndexPath:v7 animated:1];
      goto LABEL_9;
    case 20:
      [v6 deselectRowAtIndexPath:v7 animated:1];
      [(SFAccountDetailViewController *)self _showConfirmationToDeletePasswordAndTOTPGenerator];
      goto LABEL_21;
    case 21:
      [v6 deselectRowAtIndexPath:v7 animated:1];
      uint64_t v14 = [(WBSSavedAccount *)self->_savedAccount credentialTypes];
      switch(v14)
      {
        case 3:
          double v10 = self;
          uint64_t v11 = 3;
          goto LABEL_10;
        case 2:
LABEL_3:
          double v10 = self;
          uint64_t v11 = 2;
LABEL_10:
          [(SFAccountDetailViewController *)v10 _showConfirmationToDeleteCredentialTypes:v11];
          break;
        case 1:
LABEL_9:
          double v10 = self;
          uint64_t v11 = 1;
          goto LABEL_10;
      }
LABEL_21:

      return;
    default:
      if ([(SFAccountDetailViewController *)self isEditing])
      {
        if (v9 == 9)
        {
          [(SFAccountDetailViewController *)self _replaceAddPasswordButtonWithPasswordCell];
        }
        else if (v9 == 8)
        {
          int64_t v12 = [(WBSSavedAccount *)self->_savedAccount totpGenerators];
          id v13 = [v12 firstObject];
          [(SFAccountDetailViewController *)self _deleteTOTPGeneratorWithConfirmation:v13];
        }
      }
      else
      {
        switch(v9)
        {
          case 4:
            break;
          case 7:
            [v6 deselectRowAtIndexPath:v7 animated:1];
            self->_didAcceptTOTPQRCode = 0;
            long long v37 = _WBSLocalizedString();
            id v15 = NSString;
            uint64_t v16 = _WBSLocalizedString();
            id v17 = [(WBSSavedAccount *)self->_savedAccount highLevelDomain];
            long long v36 = objc_msgSend(v15, "stringWithFormat:", v16, v17);

            id v18 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v37 message:v36 imageNamed:@"alert-passwords" preferredStyle:0];
            uint64_t v19 = (void *)MEMORY[0x1E4FB1410];
            id v20 = _WBSLocalizedString();
            v41[0] = MEMORY[0x1E4F143A8];
            v41[1] = 3221225472;
            v41[2] = __67__SFAccountDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke;
            v41[3] = &unk_1E5C72448;
            v41[4] = self;
            id v21 = v18;
            id v42 = v21;
            uint64_t v22 = [v19 actionWithTitle:v20 style:0 handler:v41];
            [v21 addAction:v22];

            uint64_t v23 = (void *)MEMORY[0x1E4FB1410];
            uint64_t v24 = _WBSLocalizedString();
            v40[0] = MEMORY[0x1E4F143A8];
            v40[1] = 3221225472;
            v40[2] = __67__SFAccountDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
            v40[3] = &unk_1E5C72898;
            v40[4] = self;
            uint64_t v25 = [v23 actionWithTitle:v24 style:0 handler:v40];
            [v21 addAction:v25];

            long long v26 = (void *)MEMORY[0x1E4FB1410];
            long long v27 = _WBSLocalizedString();
            v38[0] = MEMORY[0x1E4F143A8];
            v38[1] = 3221225472;
            v38[2] = __67__SFAccountDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
            v38[3] = &unk_1E5C72898;
            id v39 = v21;
            id v28 = v21;
            unsigned int v29 = [v26 actionWithTitle:v27 style:1 handler:v38];
            [v28 addAction:v29];

            [v6 deselectRowAtIndexPath:v7 animated:1];
            [(SFAccountDetailViewController *)self presentViewController:v28 animated:1 completion:0];

            goto LABEL_21;
          case 11:
            [v6 deselectRowAtIndexPath:v7 animated:1];
            [(SFAccountDetailViewController *)self _initiateUpgradeToSignInWithApple];
            goto LABEL_21;
          case 12:
            [v6 deselectRowAtIndexPath:v7 animated:1];
            [(SFAccountDetailViewController *)self _initiateChangeToStrongPassword];
            goto LABEL_21;
          case 13:
            [v6 deselectRowAtIndexPath:v7 animated:1];
            if (objc_msgSend(MEMORY[0x1E4F28B50], "safari_isSafariViewServiceBundle")) {
              [(SFAccountDetailViewController *)self _openChangePasswordURLInWebBrowser];
            }
            else {
              [(SFAccountDetailViewController *)self _showChangePasswordSafariViewController];
            }
            goto LABEL_21;
          case 14:
            [v6 deselectRowAtIndexPath:v7 animated:1];
            id v30 = [(WBSSavedAccount *)self->_savedAccount notesEntry];
            uint64_t v31 = [v30 length];

            if (!v31)
            {
              [(SFAccountDetailViewController *)self _setEditing:1 animated:1];
              long long v32 = [(SFAccountNoteTableViewCell *)self->_notesCell textView];
              [v32 becomeFirstResponder];
            }
            goto LABEL_21;
          case 16:
            [v6 deselectRowAtIndexPath:v7 animated:1];
            [(SFAccountDetailViewController *)self _recoverSavedAccount];
            goto LABEL_21;
          case 17:
            [v6 deselectRowAtIndexPath:v7 animated:1];
            [(SFAccountDetailViewController *)self _presentMoveRecentlyDeletedSavedAccountToMyPasswordsConfirmationAlert];
            goto LABEL_21;
          default:
            if (!self->_isForFillingIndividualAccountFields) {
              goto LABEL_35;
            }
            switch(v9)
            {
              case 6:
                [(SFAccountDetailViewController *)self _fillVerificationCode];
                goto LABEL_21;
              case 3:
                [(SFAccountDetailViewController *)self _fillPassword];
                goto LABEL_21;
              case 1:
                [(SFAccountDetailViewController *)self _fillUsername];
                goto LABEL_21;
            }
LABEL_35:
            if ([(SFAccountDetailViewController *)self _shouldShowMenuForItemIdentifier:v9])
            {
              long long v33 = [(SFAccountNoteTableViewCell *)self->_notesCell textView];
              objc_msgSend(v33, "setSelectedRange:", 0, 0);

              [(UIEditMenuInteraction *)self->_editMenuInteraction dismissMenu];
              long long v34 = (void *)MEMORY[0x1E4FB1750];
              [v6 rectForRowAtIndexPath:v7];
              UIRectGetCenter();
              long long v35 = objc_msgSend(v34, "configurationWithIdentifier:sourcePoint:", v7);
              [(UIEditMenuInteraction *)self->_editMenuInteraction presentEditMenuWithConfiguration:v35];

              goto LABEL_21;
            }
            break;
        }
      }
      [v6 deselectRowAtIndexPath:v7 animated:1];
      goto LABEL_21;
  }
}

void __67__SFAccountDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) _newSecretEntryAlertController];
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 1240), v2);
  [*(id *)(a1 + 40) dismissViewControllerAnimated:1 completion:0];
  [*(id *)(a1 + 32) presentViewController:v2 animated:1 completion:0];
}

void __67__SFAccountDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F88180]);
  [v3 setDelegate:*(void *)(a1 + 32)];
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v3];
  [*(id *)(a1 + 32) presentViewController:v2 animated:1 completion:0];
}

uint64_t __67__SFAccountDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)_replaceAddPasswordButtonWithPasswordCell
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SFAccountDetailViewController__replaceAddPasswordButtonWithPasswordCell__block_invoke;
  block[3] = &unk_1E5C724D8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __74__SFAccountDetailViewController__replaceAddPasswordButtonWithPasswordCell__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1192) snapshot];
  [v2 deleteItemsWithIdentifiers:&unk_1EFBDF6B8];
  [v2 appendItemsWithIdentifiers:&unk_1EFBDF6D0 intoSectionWithIdentifier:&unk_1EFBDE7E8];
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 1192);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__SFAccountDetailViewController__replaceAddPasswordButtonWithPasswordCell__block_invoke_2;
  v5[3] = &unk_1E5C724D8;
  v5[4] = v3;
  [v4 applySnapshot:v2 animatingDifferences:1 completion:v5];
}

void __74__SFAccountDetailViewController__replaceAddPasswordButtonWithPasswordCell__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SFAccountDetailViewController__replaceAddPasswordButtonWithPasswordCell__block_invoke_3;
  block[3] = &unk_1E5C724D8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __74__SFAccountDetailViewController__replaceAddPasswordButtonWithPasswordCell__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1104) editableTextField];
  [v2 becomeFirstResponder];

  uint64_t v3 = *(id **)(a1 + 32);
  id v4 = [v3[138] editableTextField];
  [v3 _updatePasswordFieldTextSuggestions:v4];
}

- (BOOL)_shouldShowMenuForItemIdentifier:(int64_t)a3
{
  BOOL v3 = 1;
  if (a3 > 5)
  {
    if (a3 != 6 && a3 != 15) {
      return 0;
    }
  }
  else
  {
    if (a3 == 1)
    {
      id v4 = [(WBSSavedAccount *)self->_savedAccount user];
      BOOL v3 = [v4 length] != 0;

      return v3;
    }
    if (a3 != 3) {
      return 0;
    }
  }
  return v3;
}

- (void)_revealPasswordIfNecessary
{
  if (self->_showPasswordAsBulletsWhenNotEditing)
  {
    self->_showPasswordAsBulletsWhenNotEditing = 0;
    passwordForEditing = self->_passwordForEditing;
    id v5 = passwordForEditing;
    if (!passwordForEditing)
    {
      id v5 = [(WBSSavedAccount *)self->_savedAccount password];
    }
    id v4 = [(SFEditableTableViewCell *)self->_passwordCell editableTextField];
    [v4 setText:v5];

    if (!passwordForEditing)
    {
    }
  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if (-[SFAccountDetailViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", [v5 section]) == 8)
  {
    unsigned int v6 = [(WBSSavedAccount *)self->_savedAccount credentialTypes] != 2;
  }
  else
  {
    id v7 = [(SFTableViewDiffableDataSource *)self->_tableViewDiffableDataSource itemIdentifierForIndexPath:v5];
    int64_t v8 = [(SFAccountDetailViewController *)self _itemTypeForIdentifier:v7];

    if (v8 == 6) {
      unsigned int v6 = [(SFAccountDetailViewController *)self isEditing];
    }
    else {
      unsigned int v6 = 0;
    }
  }
  int64_t v9 = v6;

  return v9;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  id v5 = [(SFTableViewDiffableDataSource *)self->_tableViewDiffableDataSource itemIdentifierForIndexPath:a4];
  int64_t v6 = [(SFAccountDetailViewController *)self _itemTypeForIdentifier:v5];

  return v6 == 15 || v6 == 6;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v8 = [(SFTableViewDiffableDataSource *)self->_tableViewDiffableDataSource itemIdentifierForIndexPath:a4];
  int64_t v7 = [(SFAccountDetailViewController *)self _itemTypeForIdentifier:v8];

  LOBYTE(v8) = 0;
  switch(v7)
  {
    case 1:
    case 3:
    case 6:
    case 7:
    case 11:
    case 12:
    case 13:
    case 15:
      LODWORD(v8) = [v6 isEditing] ^ 1;
      break;
    case 4:
      if ([(SFAccountDetailViewController *)self _allowEditing]
        && ([v6 isEditing] & 1) == 0)
      {
        char v10 = [(WBSSavedAccount *)self->_savedAccount isCurrentUserOriginalContributor];
        goto LABEL_10;
      }
      LOBYTE(v8) = 0;
      break;
    case 8:
    case 9:
    case 14:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
      LOBYTE(v8) = 1;
      break;
    case 21:
      char v10 = [(SFAccountDetailViewController *)self _canUserDeleteSavedAccount];
LABEL_10:
      LOBYTE(v8) = v10;
      break;
    default:
      break;
  }

  return (char)v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  int64_t v5 = [(SFAccountDetailViewController *)self _sectionTypeForSection:a4];
  if (v5 != 1)
  {
    if (!v5 && !self->_isForFillingIndividualAccountFields)
    {
      id v6 = [(SFAccountDetailViewController *)self _accountHeaderSectionFooterView];
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (self->_isForFillingIndividualAccountFields)
  {
LABEL_6:
    id v6 = 0;
    goto LABEL_7;
  }
  id v6 = [(SFAccountDetailViewController *)self _passkeySectionFooterView];
LABEL_7:

  return v6;
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SFAccountDetailViewController *)self tableView];
  int v12 = [v11 isEditing];

  if (v12)
  {
    id v13 = [MEMORY[0x1E4FB1970] menuWithChildren:MEMORY[0x1E4F1CBF0]];
    goto LABEL_18;
  }
  uint64_t v14 = [(SFAccountDetailViewController *)self _indexPathForEditMenuInteraction:v8 withConfiguration:v9];
  if (v14)
  {
    objc_initWeak(location, self);
    id v15 = [(SFTableViewDiffableDataSource *)self->_tableViewDiffableDataSource itemIdentifierForIndexPath:v14];
    uint64_t v16 = [(SFAccountDetailViewController *)self _itemTypeForIdentifier:v15];
    id v17 = [MEMORY[0x1E4F1CA48] array];
    id v18 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
    if (v16 > 5)
    {
      if (v16 == 6)
      {
        id v28 = (void *)MEMORY[0x1E4FB13F0];
        unsigned int v29 = _WBSLocalizedString();
        uint64_t v32 = MEMORY[0x1E4F143A8];
        uint64_t v33 = 3221225472;
        long long v34 = __91__SFAccountDetailViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_4;
        long long v35 = &unk_1E5C729D8;
        id v36 = v15;
        objc_copyWeak(&v37, location);
        id v30 = [v28 actionWithTitle:v29 image:v18 identifier:0 handler:&v32];
        objc_msgSend(v17, "addObject:", v30, v32, v33, v34, v35);

        objc_destroyWeak(&v37);
        goto LABEL_16;
      }
      if (v16 == 15)
      {
        uint64_t v23 = (void *)MEMORY[0x1E4FB13F0];
        uint64_t v24 = _WBSLocalizedString();
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __91__SFAccountDetailViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_3;
        v38[3] = &unk_1E5C721C0;
        objc_copyWeak(&v40, location);
        id v39 = v14;
        uint64_t v25 = [v23 actionWithTitle:v24 image:v18 identifier:0 handler:v38];
        [v17 addObject:v25];

        long long v26 = &v40;
LABEL_14:
        objc_destroyWeak(v26);
      }
    }
    else
    {
      if (v16 == 1)
      {
        long long v27 = (void *)MEMORY[0x1E4FB13F0];
        id v20 = _WBSLocalizedString();
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __91__SFAccountDetailViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke;
        v43[3] = &unk_1E5C72910;
        id v21 = &v44;
        objc_copyWeak(&v44, location);
        uint64_t v22 = [v27 actionWithTitle:v20 image:v18 identifier:0 handler:v43];
        [v17 addObject:v22];
        goto LABEL_13;
      }
      if (v16 == 3)
      {
        uint64_t v19 = (void *)MEMORY[0x1E4FB13F0];
        id v20 = _WBSLocalizedString();
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __91__SFAccountDetailViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_2;
        v41[3] = &unk_1E5C72910;
        id v21 = &v42;
        objc_copyWeak(&v42, location);
        uint64_t v22 = [v19 actionWithTitle:v20 image:v18 identifier:0 handler:v41];
        [v17 addObject:v22];
LABEL_13:

        long long v26 = v21;
        goto LABEL_14;
      }
    }
LABEL_16:
    id v13 = [MEMORY[0x1E4FB1970] menuWithChildren:v17];

    objc_destroyWeak(location);
    goto LABEL_17;
  }
  id v13 = [MEMORY[0x1E4FB1970] menuWithChildren:MEMORY[0x1E4F1CBF0]];
LABEL_17:

LABEL_18:

  return v13;
}

void __91__SFAccountDetailViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    id v2 = [WeakRetained[128] user];
    objc_msgSend(v1, "safari_setSensitiveString:", v2);
  }
}

void __91__SFAccountDetailViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    id v2 = [WeakRetained[128] password];
    objc_msgSend(v1, "safari_setSensitiveString:", v2);
  }
}

void __91__SFAccountDetailViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    uint64_t v3 = [WeakRetained[128] credentialTypes];
    id v4 = v8[128];
    if (v3 == 2)
    {
      int64_t v5 = [v4 passkeyRelyingPartyID];
    }
    else
    {
      id v6 = [v4 userVisibleSites];
      int64_t v5 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "row"));
    }
    int64_t v7 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    [v7 setString:v5];

    id WeakRetained = v8;
  }
}

void __91__SFAccountDetailViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_4(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      uint64_t v3 = *(void **)(a1 + 32);
      id v7 = WeakRetained;
      id v4 = [MEMORY[0x1E4F1C9C8] date];
      int64_t v5 = [v3 codeForDate:v4];

      id v6 = [MEMORY[0x1E4FB1A78] generalPasteboard];
      objc_msgSend(v6, "safari_setSensitiveString:", v5);

      id WeakRetained = v7;
    }
  }
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  int64_t v5 = [(SFAccountDetailViewController *)self _indexPathForEditMenuInteraction:a3 withConfiguration:a4];
  if (v5)
  {
    id v6 = [(SFAccountDetailViewController *)self tableView];
    [v6 rectForRowAtIndexPath:v5];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB20];
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v6 = -[SFAccountDetailViewController _indexPathForEditMenuInteraction:withConfiguration:](self, "_indexPathForEditMenuInteraction:withConfiguration:", a3, a4, a5);
  if (v6)
  {
    double v9 = v6;
    double v7 = [(SFTableViewDiffableDataSource *)self->_tableViewDiffableDataSource itemIdentifierForIndexPath:v6];
    int64_t v8 = [(SFAccountDetailViewController *)self _itemTypeForIdentifier:v7];

    id v6 = v9;
    if (v8 == 3)
    {
      [(SFAccountDetailViewController *)self _revealPasswordIfNecessary];
      id v6 = v9;
    }
  }
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  -[SFAccountDetailViewController _indexPathForEditMenuInteraction:withConfiguration:](self, "_indexPathForEditMenuInteraction:withConfiguration:", a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    id v6 = [(SFAccountDetailViewController *)self tableView];
    [v6 deselectRowAtIndexPath:v7 animated:1];
  }
}

- (id)_indexPathForEditMenuInteraction:(id)a3 withConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = [a4 identifier];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
  }
  else
  {
    double v9 = [(SFAccountDetailViewController *)self tableView];
    double v10 = [(SFAccountDetailViewController *)self tableView];
    [v6 locationInView:v10];
    objc_msgSend(v9, "indexPathForRowAtPoint:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)_updateHeaderViewCell
{
  headerCell = self->_headerCell;
  id v4 = [(WBSSavedAccount *)self->_savedAccount userVisibleDomain];
  [(SFAccountHeaderViewCell *)headerCell setHeaderTitleForHighLevelDomain:v4 customTitle:self->_titleForEditing];
}

- (BOOL)_shouldUseZeroHeightHeaderForSectionType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 2) {
    return self->_isForFillingIndividualAccountFields;
  }
  BOOL result = 1;
  if (a3 && a3 != 4) {
    return 0;
  }
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if ([(SFAccountDetailViewController *)self _shouldUseZeroHeightHeaderForSectionType:[(SFAccountDetailViewController *)self _sectionTypeForSection:a4]])
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
  BOOL v4 = [(SFAccountDetailViewController *)self _shouldUseZeroHeightHeaderForSectionType:[(SFAccountDetailViewController *)self _sectionTypeForSection:a4]];
  double result = *MEMORY[0x1E4FB2F28];
  if (v4) {
    return 0.0;
  }
  return result;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v10 = a3;
  id v4 = [(SFEditableTableViewCell *)self->_userCell editableTextField];

  if (v4 == v10)
  {
    id WeakRetained = [(SFEditableTableViewCell *)self->_userCell editableTextField];
    id v8 = [WeakRetained text];
    uint64_t v9 = 1120;
  }
  else
  {
    id v5 = [(SFEditableTableViewCell *)self->_passwordCell editableTextField];

    if (v5 != v10)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_secretEntryAlertController);
      id v7 = [WeakRetained textFields];
      [v7 firstObject];

      goto LABEL_7;
    }
    id WeakRetained = [(SFEditableTableViewCell *)self->_passwordCell editableTextField];
    id v8 = [WeakRetained text];
    uint64_t v9 = 1128;
  }
  id v7 = *(Class *)((char *)&self->super.super.super.super.isa + v9);
  *(Class *)((char *)&self->super.super.super.super.isa + v9) = v8;
LABEL_7:
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id v5 = [(SFEditableTableViewCell *)self->_userCell editableTextField];

  passwordCell = self->_passwordCell;
  if (v5 == v4)
  {
    if (passwordCell)
    {
      id v8 = [(SFEditableTableViewCell *)passwordCell editableTextField];
      [v8 becomeFirstResponder];

      goto LABEL_9;
    }
    goto LABEL_7;
  }
  id v7 = [(SFEditableTableViewCell *)passwordCell editableTextField];
  if (v7 != v4)
  {

    goto LABEL_8;
  }
  int v9 = [(UIBarButtonItem *)self->_doneBarButtonItem isEnabled];

  if (v9)
  {
LABEL_7:
    [(SFAccountDetailViewController *)self _saveAccountAndFinishEditing];
    goto LABEL_9;
  }
LABEL_8:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secretEntryAlertController);
  double v11 = [WeakRetained textFields];
  id v12 = [v11 firstObject];

  if (v12 == v4)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F98ED8]);
    double v15 = [v4 text];
    double v16 = (void *)[v14 initWithUserProvidedString:v15];
    [(SFAccountDetailViewController *)self _addTOTPGenerator:v16];

    BOOL v13 = 1;
    [(SFAccountDetailViewController *)self dismissViewControllerAnimated:1 completion:0];
    goto LABEL_11;
  }
LABEL_9:
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (void)_updatePasswordFieldTextSuggestions:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 text];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v8 = [(WBSSavedAccount *)self->_savedAccount highLevelDomain];
    int v9 = objc_msgSend(v8, "safari_bestURLForUserTypedString");

    id v10 = +[_SFFormDataController sharedController];
    double v11 = [v10 autoGeneratedPasswordForURL:v9 respectingPasswordRequirements:0 maxLength:-1];

    if (v11)
    {
      id v12 = [MEMORY[0x1E4FB1DC8] textSuggestionWithInputText:v11];
      BOOL v13 = _WBSLocalizedString();
      [v12 setHeaderText:v13];

      [v12 setDisplayText:v11];
      v19[0] = v12;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    }
    else
    {
      id v7 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __69__SFAccountDetailViewController__updatePasswordFieldTextSuggestions___block_invoke;
  v16[3] = &unk_1E5C72238;
  id v17 = v4;
  id v18 = v7;
  id v14 = v7;
  id v15 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v16);
}

void __69__SFAccountDetailViewController__updatePasswordFieldTextSuggestions___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) textInputSuggestionDelegate];
  [v2 setSuggestions:*(void *)(a1 + 40)];
}

- (void)_textFieldChanged:(id)a3
{
  id v16 = a3;
  id v4 = [(SFEditableTableViewCell *)self->_passwordCell editableTextField];

  if (v4 == v16) {
    [(SFAccountDetailViewController *)self _updatePasswordFieldTextSuggestions:v16];
  }
  id v5 = [(SFEditableTableViewCell *)self->_userCell editableTextField];
  if (v5 == v16)
  {

    goto LABEL_10;
  }
  id v6 = [(SFEditableTableViewCell *)self->_passwordCell editableTextField];

  if (v6 == v16)
  {
LABEL_10:
    [(SFAccountDetailViewController *)self _updateSavedAccountChangeRequest];
    id WeakRetained = [MEMORY[0x1E4F98DF8] sharedStore];
    -[UIBarButtonItem setEnabled:](self->_doneBarButtonItem, "setEnabled:", [WeakRetained canChangeSavedAccountWithRequest:self->_savedAccountChangeRequest]);
    goto LABEL_11;
  }
  id v7 = [(SFAccountHeaderViewCell *)self->_headerCell editableTextField];

  if (v7 == v16) {
    [(SFAccountDetailViewController *)self _updateHeaderViewCell];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secretEntryAlertController);
  int v9 = [WeakRetained textFields];
  id v10 = [v9 firstObject];

  if (v10 == v16)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F98ED8]);
    id v12 = [v16 text];
    BOOL v13 = (void *)[v11 initWithUserProvidedString:v12];
    id v14 = [WeakRetained actions];
    id v15 = [v14 lastObject];
    [v15 setEnabled:v13 != 0];
  }
LABEL_11:
}

- (id)_lastModifiedDateString
{
  if (self->_completedUpgradeToSignInWithApple)
  {
    id v2 = _WBSLocalizedString();
  }
  else
  {
    id v4 = [MEMORY[0x1E4F98928] dateFormatterWithDynamicContext];
    id v5 = [(WBSSavedAccount *)self->_savedAccount lastModifiedDate];
    id v6 = [v4 stringFromDate:v5];

    if (v6)
    {
      id v7 = NSString;
      id v8 = _WBSLocalizedString();
      id v2 = objc_msgSend(v7, "stringWithFormat:", v8, v6);
    }
    else
    {
      id v2 = 0;
    }
  }

  return v2;
}

- (id)_passkeyCreationDateString
{
  uint64_t v3 = [MEMORY[0x1E4F98928] dateFormatterWithStandaloneContext];
  id v4 = [(WBSSavedAccount *)self->_savedAccount creationDateForPasskey];
  id v5 = [v3 stringFromDate:v4];

  id v6 = NSString;
  id v7 = _WBSLocalizedString();
  id v8 = objc_msgSend(v6, "stringWithFormat:", v7, v5);

  return v8;
}

- (int64_t)_sectionTypeForSection:(int64_t)a3
{
  id v4 = [(SFTableViewDiffableDataSource *)self->_tableViewDiffableDataSource snapshot];
  id v5 = [v4 sectionIdentifiers];
  id v6 = [v5 objectAtIndexedSubscript:a3];
  int64_t v7 = [v6 integerValue];

  return v7;
}

- (int64_t)_itemTypeForIdentifier:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v4 = 15;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int64_t v4 = 6;
    }
    else {
      int64_t v4 = [v3 integerValue];
    }
  }

  return v4;
}

- (void)_updateSavedAccountChangeRequest
{
  savedAccountChangeRequest = self->_savedAccountChangeRequest;
  if (!savedAccountChangeRequest)
  {
    int64_t v4 = (WBSSavedAccountChangeRequest *)objc_alloc_init(MEMORY[0x1E4F98DD8]);
    id v5 = self->_savedAccountChangeRequest;
    self->_savedAccountChangeRequest = v4;

    savedAccountChangeRequest = self->_savedAccountChangeRequest;
  }
  [(WBSSavedAccountChangeRequest *)savedAccountChangeRequest setSavedAccount:self->_savedAccount];
  id v6 = [(SFEditableTableViewCell *)self->_userCell editableTextField];
  int64_t v7 = [v6 text];
  [(WBSSavedAccountChangeRequest *)self->_savedAccountChangeRequest setUser:v7];

  id v8 = [(SFEditableTableViewCell *)self->_passwordCell editableTextField];
  int v9 = [v8 text];
  [(WBSSavedAccountChangeRequest *)self->_savedAccountChangeRequest setPassword:v9];

  id v10 = [(SFAccountNoteTableViewCell *)self->_notesCell textView];
  id v11 = [v10 text];
  [(WBSSavedAccountChangeRequest *)self->_savedAccountChangeRequest setNotesEntry:v11];

  id v12 = [(WBSSavedAccount *)self->_savedAccount totpGenerators];
  BOOL v13 = [v12 firstObject];
  [(WBSSavedAccountChangeRequest *)self->_savedAccountChangeRequest setTotpGenerator:v13];

  id v15 = [(SFAccountHeaderViewCell *)self->_headerCell titleTextField];
  id v14 = [v15 text];
  [(WBSSavedAccountChangeRequest *)self->_savedAccountChangeRequest setCustomTitle:v14];
}

- (void)_saveAccountAndFinishEditing
{
  self->_showPasswordAsBulletsWhenNotEditing = 0;
  [(SFAccountHeaderViewCell *)self->_headerCell commitCustomTitle];
  [(SFAccountDetailViewController *)self _updateSavedAccountChangeRequest];
  id v3 = [MEMORY[0x1E4F98DF8] sharedStore];
  [v3 changeSavedAccountWithRequest:self->_savedAccountChangeRequest];

  [(SFAccountDetailViewController *)self _setEditing:0 animated:1];
  if ([(WBSSavedAccount *)self->_savedAccount credentialTypes] == 2)
  {
    passwordCell = self->_passwordCell;
    self->_passwordCell = 0;
  }

  [(SFAccountDetailViewController *)self _reloadDiffableDataSourceOnInternalQueueAnimated:0];
}

- (id)_warningTitleForPassword
{
  return 0;
}

- (void)_updateWarningForSavedAccount
{
  objc_initWeak(&location, self);
  id v3 = [(SFAccountDetailViewController *)self _passwordWarningManager];
  savedAccount = self->_savedAccount;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__SFAccountDetailViewController__updateWarningForSavedAccount__block_invoke;
  v5[3] = &unk_1E5C72A00;
  objc_copyWeak(&v6, &location);
  [v3 getWarningForSavedAccount:savedAccount completionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __62__SFAccountDetailViewController__updateWarningForSavedAccount__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong(WeakRetained + 151, a2);
    [WeakRetained _reloadDiffableDataSourceOnInternalQueueAnimated:0];
  }
}

- (void)_addTOTPGenerator:(id)a3
{
  if (a3)
  {
    int64_t v4 = (void *)MEMORY[0x1E4F98DF8];
    id v5 = a3;
    id v6 = [v4 sharedStore];
    [v6 saveTOTPGenerator:v5 forSavedAccount:self->_savedAccount];

    [(SFAccountDetailViewController *)self _updateCachedTOTPGenerators];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__SFAccountDetailViewController__addTOTPGenerator___block_invoke;
    block[3] = &unk_1E5C724D8;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __51__SFAccountDetailViewController__addTOTPGenerator___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 1192) snapshot];
  id v2 = [v4 sectionIdentifiers];
  int v3 = [v2 containsObject:&unk_1EFBDE7B8];

  if (v3) {
    [v4 deleteSectionsWithIdentifiers:&unk_1EFBDF6E8];
  }
  [*(id *)(a1 + 32) _addTOTPGeneratorsToSnapshot:v4];
  [*(id *)(a1 + 32) _updateAddButtonsInAccountOptionsSectionForSnapshot:v4];
  if ([*(id *)(*(void *)(a1 + 32) + 1024) credentialTypes] == 3)
  {
    [v4 deleteItemsWithIdentifiers:&unk_1EFBDF700];
    [v4 appendItemsWithIdentifiers:&unk_1EFBDF718 intoSectionWithIdentifier:&unk_1EFBDE7E8];
  }
  [*(id *)(*(void *)(a1 + 32) + 1192) applySnapshot:v4 animatingDifferences:1];
}

- (void)_deleteTOTPGenerator:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F98DF8] sharedStore];
  [v5 removeTOTPGeneratorForSavedAccount:self->_savedAccount];

  [(SFAccountDetailViewController *)self _updateCachedTOTPGenerators];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __54__SFAccountDetailViewController__deleteTOTPGenerator___block_invoke;
  v7[3] = &unk_1E5C72238;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __54__SFAccountDetailViewController__deleteTOTPGenerator___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1192) snapshot];
  v13[0] = *(void *)(a1 + 40);
  int v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v2 deleteItemsWithIdentifiers:v3];

  if ([v2 indexOfSectionIdentifier:&unk_1EFBDE7B8] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = [v2 itemIdentifiersInSectionWithIdentifier:&unk_1EFBDE7B8];
    uint64_t v5 = [v4 count];

    if (!v5) {
      [v2 deleteSectionsWithIdentifiers:&unk_1EFBDF730];
    }
  }
  id v6 = [v2 itemIdentifiers];
  int v7 = [v6 containsObject:&unk_1EFBDE8F0];

  if (v7)
  {
    [v2 insertItemsWithIdentifiers:&unk_1EFBDF748 beforeItemWithIdentifier:&unk_1EFBDE8F0];
    [v2 deleteItemsWithIdentifiers:&unk_1EFBDF760];
  }
  id v8 = [v2 itemIdentifiers];
  int v9 = [v8 containsObject:&unk_1EFBDE7D0];

  if (v9) {
    [v2 deleteItemsWithIdentifiers:&unk_1EFBDF778];
  }
  [*(id *)(a1 + 32) _updateAddButtonsInAccountOptionsSectionForSnapshot:v2];
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 1192);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __54__SFAccountDetailViewController__deleteTOTPGenerator___block_invoke_2;
  v12[3] = &unk_1E5C724D8;
  void v12[4] = v10;
  [v11 applySnapshot:v2 animatingDifferences:1 completion:v12];
}

uint64_t __54__SFAccountDetailViewController__deleteTOTPGenerator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelChangesAndFinishEditing];
}

- (void)_updateCachedTOTPGenerators
{
  int v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = [(WBSSavedAccount *)self->_savedAccount totpGenerators];
  id v4 = [v3 setWithArray:v7];
  uint64_t v5 = [v4 allObjects];
  TOTPGenerators = self->_TOTPGenerators;
  self->_TOTPGenerators = v5;
}

- (id)_newSecretEntryAlertController
{
  int v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = _WBSLocalizedString();
  uint64_t v5 = [(WBSSavedAccount *)self->_savedAccount highLevelDomain];
  id v6 = NSString;
  id v7 = _WBSLocalizedString();
  id v8 = objc_msgSend(v6, "stringWithFormat:", v7, v5);

  int v9 = [v3 alertControllerWithTitle:v4 message:v8 imageNamed:@"alert-passwords" preferredStyle:1];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __63__SFAccountDetailViewController__newSecretEntryAlertController__block_invoke;
  v25[3] = &unk_1E5C72A28;
  v25[4] = self;
  [v9 addTextFieldWithConfigurationHandler:v25];
  uint64_t v10 = (void *)MEMORY[0x1E4FB1410];
  id v11 = _WBSLocalizedString();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __63__SFAccountDetailViewController__newSecretEntryAlertController__block_invoke_2;
  v23[3] = &unk_1E5C72898;
  id v12 = v9;
  id v24 = v12;
  BOOL v13 = [v10 actionWithTitle:v11 style:1 handler:v23];
  [v12 addAction:v13];

  id v14 = (void *)MEMORY[0x1E4FB1410];
  id v15 = _WBSLocalizedString();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __63__SFAccountDetailViewController__newSecretEntryAlertController__block_invoke_3;
  v20[3] = &unk_1E5C72448;
  id v16 = v12;
  id v21 = v16;
  uint64_t v22 = self;
  id v17 = [v14 actionWithTitle:v15 style:0 handler:v20];

  [v17 setEnabled:0];
  [v16 addAction:v17];
  id v18 = v16;

  return v18;
}

void __63__SFAccountDetailViewController__newSecretEntryAlertController__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  int v3 = _WBSLocalizedString();
  [v7 setPlaceholder:v3];

  id v4 = (void *)MEMORY[0x1E4FB1798];
  uint64_t v5 = [v7 font];
  id v6 = objc_msgSend(v4, "_sf_highLegibilityAlternateFont:", v5);
  [v7 setFont:v6];

  [v7 setDelegate:*(void *)(a1 + 32)];
  [v7 addTarget:*(void *)(a1 + 32) action:sel__textFieldChanged_ forEvents:0x20000];
}

uint64_t __63__SFAccountDetailViewController__newSecretEntryAlertController__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void __63__SFAccountDetailViewController__newSecretEntryAlertController__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) textFields];
  int v3 = [v2 firstObject];
  id v6 = [v3 text];

  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F98ED8]) initWithUserProvidedString:v6];
  [v4 _addTOTPGenerator:v5];

  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)_deleteTOTPGeneratorWithConfirmation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F18B28] configurationForDeleting:1 fromSavedAccount:self->_savedAccount];
  id v6 = (void *)MEMORY[0x1E4FB1418];
  id v7 = [v5 title];
  id v8 = [v5 subtitle];
  int v9 = [v6 alertControllerWithTitle:v7 message:v8 imageNamed:@"alert-passwords" preferredStyle:_SFDeviceAlertStyle()];

  uint64_t v10 = (void *)MEMORY[0x1E4FB1410];
  id v11 = [v5 buttonTitle];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __70__SFAccountDetailViewController__deleteTOTPGeneratorWithConfirmation___block_invoke;
  v31[3] = &unk_1E5C72A50;
  v31[4] = self;
  id v12 = v4;
  id v32 = v12;
  id v13 = v9;
  id v33 = v13;
  id v14 = [v10 actionWithTitle:v11 style:2 handler:v31];
  [v13 addAction:v14];

  if ([(WBSSavedAccount *)self->_savedAccount hasValidWebsite])
  {
    id v15 = (void *)MEMORY[0x1E4FB1410];
    id v16 = _WBSLocalizedString();
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __70__SFAccountDetailViewController__deleteTOTPGeneratorWithConfirmation___block_invoke_2;
    v28[3] = &unk_1E5C72448;
    id v17 = v13;
    id v29 = v17;
    id v30 = self;
    id v18 = [v15 actionWithTitle:v16 style:0 handler:v28];
    [v17 addAction:v18];
  }
  uint64_t v19 = (void *)MEMORY[0x1E4FB1410];
  id v20 = _WBSLocalizedString();
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  uint64_t v25 = __70__SFAccountDetailViewController__deleteTOTPGeneratorWithConfirmation___block_invoke_4;
  long long v26 = &unk_1E5C72898;
  id v27 = v13;
  id v21 = v13;
  uint64_t v22 = [v19 actionWithTitle:v20 style:1 handler:&v23];
  objc_msgSend(v21, "addAction:", v22, v23, v24, v25, v26);

  [(SFAccountDetailViewController *)self presentViewController:v21 animated:1 completion:0];
}

uint64_t __70__SFAccountDetailViewController__deleteTOTPGeneratorWithConfirmation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _deleteTOTPGenerator:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 48);

  return [v2 dismissViewControllerAnimated:1 completion:0];
}

uint64_t __70__SFAccountDetailViewController__deleteTOTPGeneratorWithConfirmation___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__SFAccountDetailViewController__deleteTOTPGeneratorWithConfirmation___block_invoke_3;
  v3[3] = &unk_1E5C724D8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 dismissViewControllerAnimated:1 completion:v3];
}

void __70__SFAccountDetailViewController__deleteTOTPGeneratorWithConfirmation___block_invoke_3(uint64_t a1)
{
  v1 = *(id **)(a1 + 32);
  id v4 = [v1[128] userVisibleSites];
  id v2 = [v4 firstObject];
  int v3 = objc_msgSend(v2, "safari_bestURLForUserTypedString");
  [v1 _openURLInSafariViewController:v3 shouldSupressPasswordUpdatePrompts:1];
}

uint64_t __70__SFAccountDetailViewController__deleteTOTPGeneratorWithConfirmation___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)_addNotesSectionToSnapshot:(id)a3
{
  id v14 = a3;
  id v4 = [v14 sectionIdentifiers];
  char v5 = [v4 containsObject:&unk_1EFBDE968];

  if ((v5 & 1) == 0)
  {
    if (!self->_isForFillingIndividualAccountFields) {
      goto LABEL_5;
    }
    id v6 = [v14 sectionIdentifiers];
    id v7 = &unk_1EFBDE818;
    char v8 = [v6 containsObject:&unk_1EFBDE818];

    if ((v8 & 1) == 0)
    {
      int v9 = [v14 sectionIdentifiers];
      id v7 = &unk_1EFBDE7E8;
      char v10 = [v9 containsObject:&unk_1EFBDE7E8];

      if ((v10 & 1) == 0)
      {
LABEL_5:
        id v11 = [v14 sectionIdentifiers];
        int v12 = [v11 containsObject:&unk_1EFBDE7B8];
        id v13 = &unk_1EFBDE830;
        if (v12) {
          id v13 = &unk_1EFBDE7B8;
        }
        id v7 = v13;
      }
    }
    [v14 insertSectionsWithIdentifiers:&unk_1EFBDF790 afterSectionWithIdentifier:v7];
    [v14 appendItemsWithIdentifiers:&unk_1EFBDF7A8 intoSectionWithIdentifier:&unk_1EFBDE968];
    [v14 reconfigureItemsWithIdentifiers:&unk_1EFBDF7C0];
  }
}

- (void)_openURLInSafariViewController:(id)a3 shouldSupressPasswordUpdatePrompts:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (-[UIViewController safari_checkForAbilityToOpenWebContentAndNotifyIfNecessary:](self, "safari_checkForAbilityToOpenWebContentAndNotifyIfNecessary:"))
  {
    id v6 = objc_alloc_init(SFSafariViewControllerConfiguration);
    [(SFSafariViewControllerConfiguration *)v6 _setPerformingAccountSecurityUpgrade:v4];
    id v7 = [[SFSafariViewController alloc] initWithURL:v8 configuration:v6];
    [(SFSafariViewController *)v7 setModalPresentationStyle:1];
    [(SFSafariViewController *)v7 setModalInPresentation:1];
    [(SFAccountDetailViewController *)self presentViewController:v7 animated:1 completion:0];
  }
}

- (id)_footerTextForLastOneTimeShareDate:(id)a3
{
  if (a3)
  {
    int v3 = NSString;
    id v4 = a3;
    char v5 = _WBSLocalizedString();
    id v6 = [MEMORY[0x1E4F98928] dateFormatterWithDynamicContext];
    id v7 = [v6 stringFromDate:v4];

    id v8 = objc_msgSend(v3, "localizedStringWithFormat:", v5, v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_reloadPasskeySectionFooters
{
  uint64_t v3 = [(SFTableViewDiffableDataSource *)self->_tableViewDiffableDataSource indexForSectionIdentifier:&unk_1EFBDE830];
  id v6 = [MEMORY[0x1E4F28E60] indexSetWithIndex:v3];
  uint64_t v4 = [(SFTableViewDiffableDataSource *)self->_tableViewDiffableDataSource indexForSectionIdentifier:&unk_1EFBDE818];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    [v6 addIndex:v4];
  }
  char v5 = [(SFAccountDetailViewController *)self tableView];
  [v5 _reloadSectionHeaderFooters:v6 withRowAnimation:5];
}

- (id)_accountHeaderSectionFooterView
{
  if ([(WBSSavedAccount *)self->_savedAccount credentialTypes] == 2)
  {
    uint64_t v3 = [(SFAccountDetailViewController *)self _passkeyFooterView];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_passkeySectionFooterView
{
  if ([(WBSSavedAccount *)self->_savedAccount credentialTypes] == 3)
  {
    uint64_t v3 = [(SFAccountDetailViewController *)self _passkeyFooterView];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_passkeyFooterView
{
  if ([(WBSSavedAccount *)self->_savedAccount credentialTypes] == 1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    if (!self->_passkeyFooterView)
    {
      uint64_t v4 = objc_alloc_init(_SFTableLinkableFooterView);
      passkeyFooterView = self->_passkeyFooterView;
      self->_passkeyFooterView = v4;

      [(_SFTableLinkableFooterView *)self->_passkeyFooterView setDelegate:self];
    }
    id v6 = [(WBSSavedAccount *)self->_savedAccount lastOneTimeShareDateForPasskey];

    if (v6)
    {
      id v7 = [(WBSSavedAccount *)self->_savedAccount lastOneTimeShareDateForPasskey];
      id v8 = [(SFAccountDetailViewController *)self _footerTextForLastOneTimeShareDate:v7];

      if (v8)
      {
        int v9 = NSString;
        char v10 = [MEMORY[0x1E4F18B18] footerString];
        id v11 = [v9 stringWithFormat:@"%@\n\n%@", v8, v10];
      }
      else
      {
        id v11 = [MEMORY[0x1E4F18B18] footerString];
      }
    }
    else
    {
      id v11 = [MEMORY[0x1E4F18B18] footerString];
    }
    int v12 = [(_SFTableLinkableFooterView *)self->_passkeyFooterView textLabel];
    id v13 = [v12 text];
    char v14 = [v13 isEqualToString:v11];

    if ((v14 & 1) == 0) {
      [(_SFTableLinkableFooterView *)self->_passkeyFooterView invalidateIntrinsicContentSize];
    }
    id v15 = self->_passkeyFooterView;
    id v16 = [MEMORY[0x1E4F18B18] footerLearnMoreLinkBindingString];
    id v17 = [MEMORY[0x1E4F18B18] footerLearnMoreLinkString];
    [(_SFTableLinkableFooterView *)v15 setText:v11 linkPlaceholderString:v16 linkReplacementString:v17];

    uint64_t v3 = self->_passkeyFooterView;
  }

  return v3;
}

- (void)_fillUsername
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountDetailViewController:self fillUsernameForSavedAccount:self->_savedAccount];
  }
}

- (void)_fillPassword
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountDetailViewController:self fillPasswordForSavedAccount:self->_savedAccount];
  }
}

- (void)_fillVerificationCode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountDetailViewController:self fillVerificationCodeForSavedAccount:self->_savedAccount];
  }
}

- (void)linkableFooterViewDidInteractWithLink:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F18B20]);
  objc_initWeak(&location, v5);
  id v6 = objc_alloc(MEMORY[0x1E4FB14A8]);
  id v7 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  char v14 = __71__SFAccountDetailViewController_linkableFooterViewDidInteractWithLink___block_invoke;
  id v15 = &unk_1E5C72910;
  objc_copyWeak(&v16, &location);
  id v8 = [v7 actionWithHandler:&v12];
  int v9 = objc_msgSend(v6, "initWithBarButtonSystemItem:primaryAction:", 0, v8, v12, v13, v14, v15);
  char v10 = [v5 navigationItem];
  [v10 setRightBarButtonItem:v9];

  id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];
  [(SFAccountDetailViewController *)self presentViewController:v11 animated:1 completion:0];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __71__SFAccountDetailViewController_linkableFooterViewDidInteractWithLink___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)_sharePasswordWithPopoverPresentationControllerConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [[_SFAirDropAccountSharingAuthenticationContext alloc] initWithSavedAccount:self->_savedAccount];
  self->_isOneTimeSharingAccount = 1;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__SFAccountDetailViewController__sharePasswordWithPopoverPresentationControllerConfiguration___block_invoke;
  v8[3] = &unk_1E5C72A78;
  v8[4] = self;
  int v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  +[_SFSettingsAuthentication authenticateForSettings:v7 allowAuthenticationReuse:0 completionHandler:v8];
}

void __94__SFAccountDetailViewController__sharePasswordWithPopoverPresentationControllerConfiguration___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (a2)
  {
    [*(id *)(a1 + 32) _sharePasswordWithAuthenticationContext:*(void *)(a1 + 40) popoverPresentationControllerConfiguration:*(void *)(a1 + 48)];
  }
  else
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __94__SFAccountDetailViewController__sharePasswordWithPopoverPresentationControllerConfiguration___block_invoke_cold_1(v7);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 1344) = 0;
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"_SFShowAccountManagerLockedViewIfNeededNotification" object:0];
  }
}

- (void)_sharePasswordWithAuthenticationContext:(id)a3 popoverPresentationControllerConfiguration:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *))a4;
  if ([a3 hasBeenAuthenticated])
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F98258]) initWithSavedPassword:self->_savedAccount];
    id v8 = objc_alloc(MEMORY[0x1E4F42718]);
    int v9 = [v7 urlRepresentationForAirDrop];
    v16[0] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    id v11 = (void *)[v8 initWithActivityItems:v10 applicationActivities:0];

    uint64_t v15 = *MEMORY[0x1E4F43590];
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    [v11 setIncludedActivityTypes:v12];

    [v11 setExcludedActivityCategories:3];
    [v11 setModalPresentationStyle:7];
    uint64_t v13 = [v11 popoverPresentationController];
    [v13 setPermittedArrowDirections:1];
    if (v6) {
      v6[2](v6, v13);
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __116__SFAccountDetailViewController__sharePasswordWithAuthenticationContext_popoverPresentationControllerConfiguration___block_invoke;
    v14[3] = &unk_1E5C72AA0;
    v14[4] = self;
    [v11 setCompletionWithItemsHandler:v14];
    [(SFAccountDetailViewController *)self presentViewController:v11 animated:1 completion:0];
  }
}

void __116__SFAccountDetailViewController__sharePasswordWithAuthenticationContext_popoverPresentationControllerConfiguration___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    id v4 = [MEMORY[0x1E4F98DF8] sharedStore];
    [v4 _updateLastOneTimeShareDateforSavedAccountIfNeeded:*(void *)(*(void *)(a1 + 32) + 1024)];

    [*(id *)(a1 + 32) _reloadPasskeySectionFooters];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1344) = 0;
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"_SFShowAccountManagerLockedViewIfNeededNotification" object:0];
}

- (id)dataSource:(id)a3 headerTextForSection:(int64_t)a4
{
  id v5 = 0;
  switch([(SFAccountDetailViewController *)self _sectionTypeForSection:a4])
  {
    case 1:
      if (self->_isForFillingIndividualAccountFields) {
        goto LABEL_9;
      }
      goto LABEL_10;
    case 2:
      if (!self->_isForFillingIndividualAccountFields) {
        goto LABEL_10;
      }
      goto LABEL_9;
    case 5:
      if (![(SFAccountDetailViewController *)self _completedUpgrade]) {
        goto LABEL_10;
      }
      goto LABEL_9;
    case 6:
      if ([(SFAccountDetailViewController *)self _shouldShowAccountOptionsHeader]) {
        goto LABEL_10;
      }
LABEL_9:
      id v5 = 0;
      break;
    case 7:
LABEL_10:
      id v5 = _WBSLocalizedString();
      break;
    case 8:
      id v6 = [(WBSSavedAccount *)self->_savedAccount sites];
      [v6 count];
      id v5 = _WBSLocalizedString();

      break;
    default:
      break;
  }

  return v5;
}

- (id)dataSource:(id)a3 footerTextForSection:(int64_t)a4
{
  if ([(SFAccountDetailViewController *)self _sectionTypeForSection:a4] == 9
    && [(WBSSavedAccount *)self->_savedAccount isRecentlyDeleted])
  {
    id v5 = [(WBSSavedAccount *)self->_savedAccount pm_recentlyDeletedDetailViewDeleteSectionFooter];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)dataSource:(id)a3 commitEditingStyle:(int64_t)a4 forItemIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  int64_t v9 = [(SFAccountDetailViewController *)self _itemTypeForIdentifier:v8];
  id v10 = [(SFTableViewDiffableDataSource *)self->_tableViewDiffableDataSource indexPathForItemIdentifier:v8];
  if (v9 == 15)
  {
    objc_initWeak(&location, self);
    id v11 = [MEMORY[0x1E4F98DF8] sharedStore];
    uint64_t v12 = [(WBSSavedAccount *)self->_savedAccount sites];
    uint64_t v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v10, "row"));
    savedAccount = self->_savedAccount;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __81__SFAccountDetailViewController_dataSource_commitEditingStyle_forItemIdentifier___block_invoke;
    v15[3] = &unk_1E5C72808;
    objc_copyWeak(&v18, &location);
    id v16 = v8;
    id v17 = v10;
    [v11 removeSite:v13 fromSavedAccountWithPassword:savedAccount withCompletion:v15];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __81__SFAccountDetailViewController_dataSource_commitEditingStyle_forItemIdentifier___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__SFAccountDetailViewController_dataSource_commitEditingStyle_forItemIdentifier___block_invoke_2;
    block[3] = &unk_1E5C72350;
    void block[4] = WeakRetained;
    id v5 = a1[4];
    id v6 = a1[5];
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __81__SFAccountDetailViewController_dataSource_commitEditingStyle_forItemIdentifier___block_invoke_2(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1192) snapshot];
  v12[0] = *(void *)(a1 + 40);
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v2 deleteItemsWithIdentifiers:v3];

  [*(id *)(*(void *)(a1 + 32) + 1192) applySnapshot:v2 animatingDifferences:1];
  id v4 = *(void **)(a1 + 32);
  id v5 = (void *)v4[149];
  id v6 = [v4 tableView];
  uint64_t v7 = objc_msgSend(v5, "tableView:numberOfRowsInSection:", v6, objc_msgSend(*(id *)(a1 + 48), "section"));

  if (!v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4FB60F8]);
    [v8 schedulePasswordIconsCleanup];
    [*(id *)(a1 + 32) _popViewController];
  }
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 1192) indexForSectionIdentifier:&unk_1EFBDE7D0];
  id v10 = [MEMORY[0x1E4F28E60] indexSetWithIndex:v9];
  id v11 = [*(id *)(a1 + 32) tableView];
  [v11 _reloadSectionHeaderFooters:v10 withRowAnimation:5];
}

- (BOOL)dataSource:(id)a3 canEditRowAtIndexPath:(id)a4
{
  tableViewDiffableDataSource = self->_tableViewDiffableDataSource;
  id v6 = a4;
  uint64_t v7 = [(SFTableViewDiffableDataSource *)tableViewDiffableDataSource snapshot];
  id v8 = [v7 sectionIdentifiers];
  uint64_t v9 = [v6 section];

  id v10 = [v8 objectAtIndexedSubscript:v9];
  uint64_t v11 = [v10 integerValue];

  if (v11 == 8)
  {
    if ([(WBSSavedAccount *)self->_savedAccount credentialTypes] != 2)
    {
      char v14 = [(WBSSavedAccount *)self->_savedAccount sites];
      BOOL v13 = (unint64_t)[v14 count] > 1;

      return v13;
    }
    return 0;
  }
  if (v11 == 7) {
    return 1;
  }
  if (v11) {
    return 0;
  }

  return [(SFAccountDetailViewController *)self _allowEditing];
}

- (BOOL)_completedUpgrade
{
  return self->_completedUpgradeToSignInWithApple || self->_completedUpgradeToStrongPassword;
}

- (void)_updateAccountModificationOptions
{
  uint64_t v3 = [(NSExtension *)self->_accountModificationExtension attributes];
  if (objc_msgSend(v3, "safari_BOOLForKey:", *MEMORY[0x1E4F98268]))
  {
    id v4 = [MEMORY[0x1E4F98BE0] sharedMonitor];
    self->_eligibleToChangeToStrongPassword = [v4 isKeychainSyncEnabled];
  }
  else
  {
    self->_eligibleToChangeToStrongPassword = 0;
  }
  objc_msgSend(v3, "safari_stringForKey:", *MEMORY[0x1E4F98278]);
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  rulesForStrongPasswordChange = self->_rulesForStrongPasswordChange;
  self->_rulesForStrongPasswordChange = v5;

  if (([(WBSSavedAccount *)self->_savedAccount credentialTypes] & 2) != 0)
  {
    self->_eligibleToUpgradeToSignInWithApple = 0;
    goto LABEL_8;
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "pm_defaults");
  int v8 = objc_msgSend(v7, "pm_passwordManagerIsInDemoMode");

  if (v8)
  {
    self->_eligibleToUpgradeToSignInWithApple = objc_msgSend(v3, "safari_BOOLForKey:", *MEMORY[0x1E4F98270]);
LABEL_8:
    [(SFAccountDetailViewController *)self _reloadDiffableDataSourceOnInternalQueueAnimated:0];
    goto LABEL_9;
  }
  [(SFAccountDetailViewController *)self _reloadDiffableDataSourceOnInternalQueueAnimated:0];
  if (objc_msgSend(v3, "safari_BOOLForKey:", *MEMORY[0x1E4F98270]))
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F4EF90]);
    id v10 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v11 = [(NSExtension *)self->_accountModificationExtension _plugIn];
    uint64_t v12 = [v11 containingUrl];
    BOOL v13 = [v10 bundleWithURL:v12];
    char v14 = [v13 bundleIdentifier];

    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __66__SFAccountDetailViewController__updateAccountModificationOptions__block_invoke;
    v15[3] = &unk_1E5C72AC8;
    objc_copyWeak(&v16, &location);
    [v9 getCredentialStateForClientID:v14 completion:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
LABEL_9:
}

void __66__SFAccountDetailViewController__updateAccountModificationOptions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a3)
    {
      id v6 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __66__SFAccountDetailViewController__updateAccountModificationOptions__block_invoke_cold_1((uint64_t)WeakRetained, v6);
      }
    }
    WeakRetained[1289] = a2 == 2;
    [WeakRetained _reloadDiffableDataSourceOnInternalQueueAnimated:0];
  }
}

- (void)_initiateUpgradeToSignInWithApple
{
  id v3 = objc_alloc(MEMORY[0x1E4F18AA0]);
  id v4 = [(WBSSavedAccount *)self->_savedAccount user];
  id v5 = [(WBSSavedAccount *)self->_savedAccount password];
  accountModificationExtension = self->_accountModificationExtension;
  id v7 = objc_alloc(MEMORY[0x1E4F18AB0]);
  int v8 = [(WBSSavedAccount *)self->_savedAccount highLevelDomain];
  id v9 = (void *)[v7 initWithIdentifier:v8 type:0];
  id v10 = (id)[v3 initWithUser:v4 password:v5 extension:accountModificationExtension serviceIdentifier:v9 userInfo:0];

  [(ASAccountAuthenticationModificationController *)self->_accountAuthenticationModificationController performRequest:v10];
}

- (void)_initiateChangeToStrongPassword
{
  id v3 = objc_alloc(MEMORY[0x1E4F18AA8]);
  id v4 = [(WBSSavedAccount *)self->_savedAccount user];
  id v5 = [(WBSSavedAccount *)self->_savedAccount password];
  accountModificationExtension = self->_accountModificationExtension;
  id v7 = objc_alloc(MEMORY[0x1E4F18AB0]);
  int v8 = [(WBSSavedAccount *)self->_savedAccount highLevelDomain];
  id v9 = (void *)[v7 initWithIdentifier:v8 type:0];
  id v10 = (id)[v3 initWithUser:v4 password:v5 extension:accountModificationExtension serviceIdentifier:v9 userInfo:0];

  [(ASAccountAuthenticationModificationController *)self->_accountAuthenticationModificationController performRequest:v10];
}

- (void)accountAuthenticationModificationController:(id)a3 didSuccessfullyCompleteRequest:(id)a4 withUserInfo:(id)a5
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SFAccountDetailViewController *)self _completedSignInWithAppleUpgrade];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SFAccountDetailViewController *)self _completedStrongPasswordUpgrade];
    }
  }
}

- (void)_completedSignInWithAppleUpgrade
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained setSavedAccountToRemoveAfterCompletedUpgradeInDetailView:self->_savedAccount];
  }
  id v3 = [MEMORY[0x1E4F98DF8] sharedStore];
  [v3 removeCredentialTypes:1 forSavedAccount:self->_savedAccount];

  self->_completedUpgradeToSignInWithApple = 1;
  [(UIBarButtonItem *)self->_editBarButtonItem setEnabled:0];
  [(UIBarButtonItem *)self->_shareBarButtonItem setEnabled:0];
  [(SFAccountDetailViewController *)self _reloadDiffableDataSourceOnInternalQueueAnimated:0];
  id v4 = [(SFAccountDetailViewController *)self tableView];
  id v5 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  [v4 _reloadSectionHeaderFooters:v5 withRowAnimation:5];
}

- (void)_completedStrongPasswordUpgrade
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained setSavedAccountToRemoveAfterCompletedUpgradeInDetailView:self->_savedAccount];
  }
  self->_completedUpgradeToStrongPassword = 1;
  [(SFAccountDetailViewController *)self _reloadDiffableDataSourceOnInternalQueueAnimated:0];
}

- (void)accountAuthenticationModificationController:(id)a3 didFailRequest:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SFAccountDetailViewController accountAuthenticationModificationController:didFailRequest:withError:](v11);
    }
  }
  if ([v10 code] != 1)
  {
    id v35 = v8;
    uint64_t v12 = [v10 userInfo];
    BOOL v13 = [v12 objectForKey:*MEMORY[0x1E4F18A88]];

    if ([v10 code] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v24 = (void *)MEMORY[0x1E4FB1418];
      uint64_t v25 = NSString;
      long long v26 = _WBSLocalizedString();
      [(NSExtension *)self->_accountModificationExtension _plugIn];
      id v27 = self;
      id v28 = v9;
      v30 = id v29 = v13;
      uint64_t v31 = [v30 localizedContainingName];
      id v32 = objc_msgSend(v25, "stringWithFormat:", v26, v31);
      id v20 = [v24 alertControllerWithTitle:0 message:v32 imageNamed:@"alert-passwords" preferredStyle:1];

      BOOL v13 = v29;
      id v9 = v28;
      self = v27;

      id v33 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v22 = _WBSLocalizedString();
      uint64_t v23 = v33;
    }
    else
    {
      char v14 = (void *)MEMORY[0x1E4FB1418];
      uint64_t v15 = NSString;
      id v16 = _WBSLocalizedString();
      id v17 = [(NSExtension *)self->_accountModificationExtension _plugIn];
      id v18 = [v17 localizedContainingName];
      uint64_t v19 = objc_msgSend(v15, "stringWithFormat:", v16, v18);
      id v20 = [v14 alertControllerWithTitle:v19 message:v13 imageNamed:@"alert-passwords" preferredStyle:1];

      id v21 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v22 = _WBSLocalizedString();
      uint64_t v23 = v21;
    }
    long long v34 = [v23 actionWithTitle:v22 style:0 handler:0];
    [v20 addAction:v34];

    [(SFAccountDetailViewController *)self presentViewController:v20 animated:1 completion:0];
    id v8 = v35;
  }
}

- (id)presentationAnchorForAccountAuthenticationModificationController:(id)a3
{
  id v3 = [(SFAccountDetailViewController *)self view];
  id v4 = [v3 window];

  return v4;
}

- (void)accountModificationExtensionManagerExtensionListDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [MEMORY[0x1E4F18AF0] sharedManager];
  id v6 = [(WBSSavedAccount *)self->_savedAccount highLevelDomain];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __91__SFAccountDetailViewController_accountModificationExtensionManagerExtensionListDidChange___block_invoke;
  v7[3] = &unk_1E5C72870;
  objc_copyWeak(&v8, &location);
  [v5 extensionForDomain:v6 completionHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __91__SFAccountDetailViewController_accountModificationExtensionManagerExtensionListDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __91__SFAccountDetailViewController_accountModificationExtensionManagerExtensionListDidChange___block_invoke_2;
    v6[3] = &unk_1E5C72238;
    void v6[4] = WeakRetained;
    id v7 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __91__SFAccountDetailViewController_accountModificationExtensionManagerExtensionListDidChange___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1280), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) _updateAccountModificationOptions];
  id v2 = *(void **)(a1 + 32);

  return [v2 _reloadDiffableDataSourceAnimated:0];
}

- (void)_showConfirmationToDeletePasswordAndTOTPGenerator
{
  if ([(WBSSavedAccount *)self->_savedAccount isRecentlyDeleted])
  {
    [(SFAccountDetailViewController *)self _showConfirmationToPermanentlyDeletePasswordAndTOTPGenerator];
  }
  else
  {
    [(SFAccountDetailViewController *)self _showConfirmationToSoftDeletePasswordAndTOTPGenerator];
  }
}

- (void)_showConfirmationToPermanentlyDeletePasswordAndTOTPGenerator
{
  id v3 = [MEMORY[0x1E4F18B28] configurationForDeleting:0 fromSavedAccount:self->_savedAccount];
  id v4 = (void *)MEMORY[0x1E4FB1418];
  id v5 = [v3 title];
  id v6 = [v3 subtitle];
  id v7 = [v4 alertControllerWithTitle:v5 message:v6 imageNamed:@"alert-passwords" preferredStyle:_SFDeviceAlertStyle()];

  id v8 = [v7 view];
  [v8 setAccessibilityIdentifier:@"DeletePasswordAndTOTPGeneratorConfirmation"];

  id v9 = (void *)MEMORY[0x1E4FB1410];
  id v10 = [v3 buttonTitle];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__SFAccountDetailViewController__showConfirmationToPermanentlyDeletePasswordAndTOTPGenerator__block_invoke;
  v15[3] = &unk_1E5C72898;
  void v15[4] = self;
  uint64_t v11 = [v9 actionWithTitle:v10 style:2 handler:v15];
  [v7 addAction:v11];

  uint64_t v12 = (void *)MEMORY[0x1E4FB1410];
  BOOL v13 = _WBSLocalizedString();
  char v14 = [v12 actionWithTitle:v13 style:1 handler:0];
  [v7 addAction:v14];

  [(SFAccountDetailViewController *)self presentViewController:v7 animated:1 completion:0];
}

uint64_t __93__SFAccountDetailViewController__showConfirmationToPermanentlyDeletePasswordAndTOTPGenerator__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _permanentlyDeletePassword];
}

- (void)_showConfirmationToSoftDeletePasswordAndTOTPGenerator
{
  id v3 = [MEMORY[0x1E4F18B28] configurationForDeleting:0 fromSavedAccount:self->_savedAccount];
  id v4 = (void *)MEMORY[0x1E4FB1418];
  id v5 = [v3 title];
  id v6 = [v3 subtitle];
  id v7 = [v4 alertControllerWithTitle:v5 message:v6 imageNamed:@"alert-passwords" preferredStyle:_SFDeviceAlertStyle()];

  id v8 = [v7 view];
  [v8 setAccessibilityIdentifier:@"SoftDeletePasswordAndTOTPGeneratorConfirmation"];

  id v9 = (void *)MEMORY[0x1E4FB1410];
  id v10 = [v3 buttonTitle];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__SFAccountDetailViewController__showConfirmationToSoftDeletePasswordAndTOTPGenerator__block_invoke;
  v15[3] = &unk_1E5C72898;
  void v15[4] = self;
  uint64_t v11 = [v9 actionWithTitle:v10 style:2 handler:v15];
  [v7 addAction:v11];

  uint64_t v12 = (void *)MEMORY[0x1E4FB1410];
  BOOL v13 = _WBSLocalizedString();
  char v14 = [v12 actionWithTitle:v13 style:1 handler:0];
  [v7 addAction:v14];

  [(SFAccountDetailViewController *)self presentViewController:v7 animated:1 completion:0];
}

uint64_t __86__SFAccountDetailViewController__showConfirmationToSoftDeletePasswordAndTOTPGenerator__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _softDeletePassword];
}

- (void)_showConfirmationToDeleteCredentialTypes:(int64_t)a3
{
  if ([(WBSSavedAccount *)self->_savedAccount isRecentlyDeleted])
  {
    [(SFAccountDetailViewController *)self _showConfirmationToPermanentlyDeleteCredentialTypes:a3];
  }
  else
  {
    [(SFAccountDetailViewController *)self _showConfirmationToSoftDeleteCredentialTypes:a3];
  }
}

- (void)_showConfirmationToPermanentlyDeleteCredentialTypes:(int64_t)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 3)
  {
    id v8 = (void *)MEMORY[0x1E4F18B28];
    v23[0] = self->_savedAccount;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    id v10 = [v8 configurationForDeletingSavedAccounts:v9];
  }
  else
  {
    if (a3 == 2)
    {
      id v5 = (void *)MEMORY[0x1E4F18B28];
      savedAccount = self->_savedAccount;
      uint64_t v7 = 2;
    }
    else
    {
      if (a3 != 1)
      {
        id v10 = 0;
        goto LABEL_9;
      }
      id v5 = (void *)MEMORY[0x1E4F18B28];
      savedAccount = self->_savedAccount;
      uint64_t v7 = 0;
    }
    id v10 = [v5 configurationForDeleting:v7 fromSavedAccount:savedAccount];
  }
LABEL_9:
  uint64_t v11 = (void *)MEMORY[0x1E4FB1418];
  uint64_t v12 = [v10 title];
  BOOL v13 = [v10 subtitle];
  char v14 = [v11 alertControllerWithTitle:v12 message:v13 imageNamed:@"alert-passwords" preferredStyle:_SFDeviceAlertStyle()];

  uint64_t v15 = [v14 view];
  [v15 setAccessibilityIdentifier:@"DeleteCredentialConfirmation"];

  id v16 = (void *)MEMORY[0x1E4FB1410];
  id v17 = [v10 buttonTitle];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __85__SFAccountDetailViewController__showConfirmationToPermanentlyDeleteCredentialTypes___block_invoke;
  v22[3] = &unk_1E5C72AF0;
  v22[4] = self;
  v22[5] = a3;
  id v18 = [v16 actionWithTitle:v17 style:2 handler:v22];
  [v14 addAction:v18];

  uint64_t v19 = (void *)MEMORY[0x1E4FB1410];
  id v20 = _WBSLocalizedString();
  id v21 = [v19 actionWithTitle:v20 style:1 handler:0];
  [v14 addAction:v21];

  [(SFAccountDetailViewController *)self presentViewController:v14 animated:1 completion:0];
}

void __85__SFAccountDetailViewController__showConfirmationToPermanentlyDeleteCredentialTypes___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1392));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountDetailViewController:*(void *)(a1 + 32) didDeleteAccountWithWarning:*(void *)(*(void *)(a1 + 32) + 1208)];
  }
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1024) credentialTypes];
  uint64_t v3 = *(void *)(a1 + 40);
  switch(v3)
  {
    case 3:
      [*(id *)(a1 + 32) _permanentlyDeleteAllCredentials];
      break;
    case 2:
      [*(id *)(a1 + 32) _permanentlyDeletePasskey];
      break;
    case 1:
      [*(id *)(a1 + 32) _permanentlyDeletePassword];
      break;
  }
  if (v2 == *(void *)(a1 + 40)) {
    [*(id *)(a1 + 32) _popViewController];
  }
}

- (void)_permanentlyDeletePassword
{
  uint64_t v3 = [(SFAccountDetailViewController *)self _passwordWarningManager];
  [v3 removeWarningForSavedAccount:self->_savedAccount];

  passwordWarning = self->_passwordWarning;
  self->_passwordWarning = 0;

  passwordCell = self->_passwordCell;
  self->_passwordCell = 0;

  id v6 = [MEMORY[0x1E4F98DF8] sharedStore];
  [v6 removeCredentialTypes:1 forSavedAccount:self->_savedAccount];
}

- (void)_permanentlyDeletePasskey
{
  id v3 = [MEMORY[0x1E4F98DF8] sharedStore];
  [v3 removeCredentialTypes:2 forSavedAccount:self->_savedAccount];
}

- (void)_permanentlyDeleteAllCredentials
{
  id v3 = [MEMORY[0x1E4F98DF8] sharedStore];
  [v3 removeCredentialTypes:3 forSavedAccount:self->_savedAccount];
}

- (void)_showConfirmationToSoftDeleteCredentialTypes:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v6 = 0;
    goto LABEL_5;
  }
  id v5 = 0;
  if (a3 == 2)
  {
    uint64_t v6 = 2;
LABEL_5:
    id v5 = [MEMORY[0x1E4F18B28] configurationForDeleting:v6 fromSavedAccount:self->_savedAccount];
  }
  uint64_t v7 = (void *)MEMORY[0x1E4FB1418];
  id v8 = [v5 title];
  id v9 = [v5 subtitle];
  id v10 = [v7 alertControllerWithTitle:v8 message:v9 imageNamed:@"alert-passwords" preferredStyle:_SFDeviceAlertStyle()];

  uint64_t v11 = [v10 view];
  [v11 setAccessibilityIdentifier:@"DeleteCredentialConfirmation"];

  uint64_t v12 = (void *)MEMORY[0x1E4FB1410];
  BOOL v13 = [v5 buttonTitle];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __78__SFAccountDetailViewController__showConfirmationToSoftDeleteCredentialTypes___block_invoke;
  v18[3] = &unk_1E5C72AF0;
  v18[4] = self;
  v18[5] = a3;
  char v14 = [v12 actionWithTitle:v13 style:2 handler:v18];
  [v10 addAction:v14];

  uint64_t v15 = (void *)MEMORY[0x1E4FB1410];
  id v16 = _WBSLocalizedString();
  id v17 = [v15 actionWithTitle:v16 style:1 handler:0];
  [v10 addAction:v17];

  [(SFAccountDetailViewController *)self presentViewController:v10 animated:1 completion:0];
}

void __78__SFAccountDetailViewController__showConfirmationToSoftDeleteCredentialTypes___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1024) credentialTypes];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3 == 1)
  {
    if ([*(id *)(a1 + 32) _softDeletePassword]) {
      goto LABEL_4;
    }
  }
  else if (v3 == 2 && ([*(id *)(a1 + 32) _softDeletePasskey] & 1) != 0)
  {
LABEL_4:
    if (v2 == *(void *)(a1 + 40))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1392));
      if (objc_opt_respondsToSelector()) {
        [WeakRetained accountDetailViewController:*(void *)(a1 + 32) didMoveSavedAccountToRecentlyDeleted:*(void *)(*(void *)(a1 + 32) + 1024)];
      }
      [*(id *)(a1 + 32) _popViewController];
    }
    return;
  }
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  [v4 _presentSoftDeleteErrorAlertForCredentialTypes:v5];
}

- (BOOL)_softDeletePassword
{
  uint64_t v3 = [MEMORY[0x1E4F98DF8] sharedStore];
  id v4 = [v3 _moveCredentialTypesToRecentlyDeleted:1 fromSavedAccount:self->_savedAccount];

  if (v4)
  {
    uint64_t v5 = [(SFAccountDetailViewController *)self _passwordWarningManager];
    [v5 removeWarningForSavedAccount:self->_savedAccount];

    passwordWarning = self->_passwordWarning;
    self->_passwordWarning = 0;

    passwordCell = self->_passwordCell;
    self->_passwordCell = 0;
  }
  else
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(SFAccountDetailViewController *)v8 _softDeletePassword];
    }
  }
  return v4 != 0;
}

- (BOOL)_softDeletePasskey
{
  uint64_t v3 = [MEMORY[0x1E4F98DF8] sharedStore];
  id v4 = [v3 _moveCredentialTypesToRecentlyDeleted:2 fromSavedAccount:self->_savedAccount];
  LOBYTE(self) = v4 != 0;

  return (char)self;
}

- (void)_presentSoftDeleteErrorAlertForCredentialTypes:(int64_t)a3
{
  id v4 = _WBSLocalizedString();
  uint64_t v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v4 message:0 imageNamed:@"alert-passwords" preferredStyle:1];
  uint64_t v6 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v7 = _WBSLocalizedString();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__SFAccountDetailViewController__presentSoftDeleteErrorAlertForCredentialTypes___block_invoke;
  v10[3] = &unk_1E5C72898;
  id v11 = v5;
  id v8 = v5;
  uint64_t v9 = [v6 actionWithTitle:v7 style:0 handler:v10];
  [v8 addAction:v9];

  [(SFAccountDetailViewController *)self presentViewController:v8 animated:1 completion:0];
}

uint64_t __80__SFAccountDetailViewController__presentSoftDeleteErrorAlertForCredentialTypes___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)_recoverSavedAccount
{
}

- (void)_presentMoveRecentlyDeletedSavedAccountToMyPasswordsConfirmationAlert
{
  uint64_t v3 = [MEMORY[0x1E4F88188] alertTitleAndMessageForRecoveringSavedAccountToMyPasswords:self->_savedAccount];
  id v4 = (void *)MEMORY[0x1E4FB1418];
  uint64_t v5 = [v3 first];
  uint64_t v6 = [v3 second];
  uint64_t v7 = [v4 alertControllerWithTitle:v5 message:v6 imageNamed:@"alert-passwords" preferredStyle:1];

  objc_initWeak(&location, self);
  id v8 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v9 = _WBSLocalizedString();
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __102__SFAccountDetailViewController__presentMoveRecentlyDeletedSavedAccountToMyPasswordsConfirmationAlert__block_invoke;
  id v17 = &unk_1E5C72B18;
  objc_copyWeak(&v18, &location);
  uint64_t v10 = [v8 actionWithTitle:v9 style:0 handler:&v14];
  objc_msgSend(v7, "addAction:", v10, v14, v15, v16, v17);

  id v11 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v12 = _WBSLocalizedString();
  uint64_t v13 = [v11 actionWithTitle:v12 style:1 handler:0];
  [v7 addAction:v13];

  [(SFAccountDetailViewController *)self presentViewController:v7 animated:1 completion:0];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __102__SFAccountDetailViewController__presentMoveRecentlyDeletedSavedAccountToMyPasswordsConfirmationAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _moveSavedAccountToMyPasswords];
    id WeakRetained = v2;
  }
}

- (void)_moveSavedAccountToMyPasswords
{
}

- (void)_presentErrorAlertForFailingToRecoverRecentlyDeletedSavedAccount
{
  uint64_t v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = _WBSLocalizedString();
  id v8 = [v3 alertControllerWithTitle:v4 message:0 imageNamed:@"alert-passwords" preferredStyle:1];

  uint64_t v5 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v6 = _WBSLocalizedString();
  uint64_t v7 = [v5 actionWithTitle:v6 style:0 handler:0];
  [v8 addAction:v7];

  [(SFAccountDetailViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (BOOL)_shouldShowAccountOptionsHeader
{
  uint64_t v3 = [(SFTableViewDiffableDataSource *)self->_tableViewDiffableDataSource snapshot];
  id v4 = [v3 itemIdentifiersInSectionWithIdentifier:&unk_1EFBDE980];
  unint64_t v5 = [v4 count];

  if (v5 <= 1) {
    return self->_didShowAccountOptionsHeaderText;
  }
  BOOL result = 1;
  self->_didShowAccountOptionsHeaderText = 1;
  return result;
}

- (void)QRCodeScannerViewController:(id)a3 didScanQRCodeWithURLValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!self->_didAcceptTOTPQRCode)
  {
    if (objc_msgSend(v7, "safari_isOTPAuthMigrationURL"))
    {
      if (self->_totpMigrationNavigationController) {
        goto LABEL_2;
      }
      uint64_t v9 = (PMTOTPMigrationController *)[objc_alloc(MEMORY[0x1E4F881B0]) initWithMigrationURL:v8];
      totpMigrationController = self->_totpMigrationController;
      self->_totpMigrationController = v9;

      if (self->_totpMigrationController)
      {
        self->_didAcceptTOTPQRCode = 1;
        uint64_t v11 = [(PMTOTPMigrationController *)self->_totpMigrationController numberOfCodes];
        uint64_t v12 = self->_totpMigrationController;
        if (v11 != 1)
        {
          [(PMTOTPMigrationController *)v12 setDelegate:self];
          id v23 = objc_alloc(MEMORY[0x1E4FB19E8]);
          uint64_t v24 = [(PMTOTPMigrationController *)self->_totpMigrationController viewController];
          uint64_t v25 = (UINavigationController *)[v23 initWithRootViewController:v24];
          totpMigrationNavigationController = self->_totpMigrationNavigationController;
          self->_totpMigrationNavigationController = v25;

          [(UINavigationController *)self->_totpMigrationNavigationController setModalPresentationStyle:2];
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __87__SFAccountDetailViewController_QRCodeScannerViewController_didScanQRCodeWithURLValue___block_invoke;
          v32[3] = &unk_1E5C724D8;
          v32[4] = self;
          [(SFAccountDetailViewController *)self dismissViewControllerAnimated:1 completion:v32];
          goto LABEL_2;
        }
        uint64_t v13 = [(PMTOTPMigrationController *)v12 totpGenerators];
        uint64_t v14 = [v13 firstObject];

        if (v14) {
          goto LABEL_9;
        }
      }
    }
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F98ED8]) initWithOTPAuthURL:v8];
    if (v14)
    {
LABEL_9:
      [(SFAccountDetailViewController *)self _addTOTPGenerator:v14];
      self->_didAcceptTOTPQRCode = 1;
      [(SFAccountDetailViewController *)self dismissViewControllerAnimated:1 completion:0];

      goto LABEL_2;
    }
    uint64_t v15 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[SFAccountDetailViewController QRCodeScannerViewController:didScanQRCodeWithURLValue:](v15);
    }
    id v16 = (void *)MEMORY[0x1E4FB1418];
    id v17 = _WBSLocalizedString();
    id v18 = [v16 alertControllerWithTitle:v17 message:0 preferredStyle:1];

    uint64_t v19 = (void *)MEMORY[0x1E4FB1410];
    id v20 = _WBSLocalizedString();
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    id v29 = __87__SFAccountDetailViewController_QRCodeScannerViewController_didScanQRCodeWithURLValue___block_invoke_824;
    id v30 = &unk_1E5C72898;
    id v31 = v18;
    id v21 = v18;
    uint64_t v22 = [v19 actionWithTitle:v20 style:0 handler:&v27];
    objc_msgSend(v21, "addAction:", v22, v27, v28, v29, v30);

    [v6 presentViewController:v21 animated:1 completion:0];
  }
LABEL_2:
}

uint64_t __87__SFAccountDetailViewController_QRCodeScannerViewController_didScanQRCodeWithURLValue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(*(void *)(a1 + 32) + 1368) animated:1 completion:0];
}

void __87__SFAccountDetailViewController_QRCodeScannerViewController_didScanQRCodeWithURLValue___block_invoke_824(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (void)_presentHideSecurityRecommendationConfirmationAlert
{
  uint64_t v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = _WBSLocalizedString();
  unint64_t v5 = _WBSLocalizedString();
  id v6 = [v3 alertControllerWithTitle:v4 message:v5 imageNamed:@"alert-passwords" preferredStyle:_SFDeviceAlertStyle()];

  objc_initWeak(&location, self);
  id v7 = (void *)MEMORY[0x1E4FB1410];
  id v8 = _WBSLocalizedString();
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __84__SFAccountDetailViewController__presentHideSecurityRecommendationConfirmationAlert__block_invoke;
  id v16 = &unk_1E5C72B18;
  objc_copyWeak(&v17, &location);
  uint64_t v9 = [v7 actionWithTitle:v8 style:0 handler:&v13];
  objc_msgSend(v6, "addAction:", v9, v13, v14, v15, v16);

  uint64_t v10 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v11 = _WBSLocalizedString();
  uint64_t v12 = [v10 actionWithTitle:v11 style:1 handler:0];
  [v6 addAction:v12];

  [(SFAccountDetailViewController *)self presentViewController:v6 animated:1 completion:0];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __84__SFAccountDetailViewController__presentHideSecurityRecommendationConfirmationAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [WeakRetained _hideSecurityRecommendation];
    id v1 = objc_loadWeakRetained(WeakRetained + 174);
    if (objc_opt_respondsToSelector()) {
      [v1 accountDetailViewController:WeakRetained didHideWarning:WeakRetained[151]];
    }
    [WeakRetained _popViewController];
  }
}

- (void)_hideSecurityRecommendation
{
  id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F98CA8]), "initWithIssueTypes:", -[WBSPasswordWarning issueTypes](self->_passwordWarning, "issueTypes"));
  uint64_t v3 = [MEMORY[0x1E4F98DF8] sharedStore];
  [v3 saveHideMarker:v4 forSavedAccount:self->_savedAccount];

  [(SFAccountDetailViewController *)self _reloadDiffableDataSourceOnInternalQueueAnimated:0];
}

- (BOOL)shouldSuppressAccountManagerLockedView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changePasswordSafariViewController);

  return WeakRetained || self->_isOneTimeSharingAccount;
}

- (void)passwordManagerWillLock
{
  uint64_t v3 = [(SFAccountDetailViewController *)self tableView];
  id v4 = [v3 contextMenuInteraction];
  [v4 dismissMenu];

  editMenuInteraction = self->_editMenuInteraction;

  [(UIEditMenuInteraction *)editMenuInteraction dismissMenu];
}

- (void)noteTableViewCellTextViewTapped:(id)a3
{
  if (([(SFAccountDetailViewController *)self isEditing] & 1) == 0)
  {
    id v4 = [(WBSSavedAccount *)self->_savedAccount notesEntry];
    uint64_t v5 = [v4 length];

    if (!v5)
    {
      [(SFAccountDetailViewController *)self _setEditing:1 animated:1];
      id v6 = [(SFAccountNoteTableViewCell *)self->_notesCell textView];
      [v6 becomeFirstResponder];
    }
  }
}

- (void)accountDetailHeaderViewCell:(id)a3 titleTextFieldDidChange:(id)a4
{
  objc_msgSend(a4, "text", a3);
  uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  titleForEditing = self->_titleForEditing;
  self->_titleForEditing = v5;

  [(SFAccountDetailViewController *)self _updateHeaderViewCell];
}

- (void)returnKeyActivatedInAccountDetailHeaderViewCell:(id)a3
{
  id v3 = [(SFEditableTableViewCell *)self->_userCell editableTextField];
  [v3 becomeFirstResponder];
}

- (void)updatedIconIsAvailableForDomain:(id)a3
{
}

- (void)totpMigrationControllerFinishedImport:(id)a3
{
  id v8 = (PMTOTPMigrationController *)a3;
  id v4 = [(SFAccountDetailViewController *)self presentedViewController];
  if (v4 != self->_totpMigrationNavigationController) {
    goto LABEL_2;
  }
  totpMigrationController = self->_totpMigrationController;

  uint64_t v5 = v8;
  if (totpMigrationController == v8)
  {
    [(SFAccountDetailViewController *)self dismissViewControllerAnimated:1 completion:0];
    totpMigrationNavigationController = self->_totpMigrationNavigationController;
    self->_totpMigrationNavigationController = 0;

    id v4 = (UINavigationController *)self->_totpMigrationController;
    self->_totpMigrationController = 0;
LABEL_2:

    uint64_t v5 = v8;
  }
}

- (void)totpMigrationController:(id)a3 presentDetailsForSavedAccount:(id)a4
{
  uint64_t v10 = (PMTOTPMigrationController *)a3;
  id v6 = a4;
  id v7 = [(SFAccountDetailViewController *)self presentedViewController];
  id v8 = (SFAccountDetailViewController *)v7;
  if (v7 != self->_totpMigrationNavigationController) {
    goto LABEL_2;
  }
  totpMigrationController = self->_totpMigrationController;

  if (totpMigrationController == v10)
  {
    id v8 = [[SFAccountDetailViewController alloc] initWithSavedAccount:v6 passwordWarning:0 options:0];
    [(UINavigationController *)self->_totpMigrationNavigationController pushViewController:v8 animated:1];
LABEL_2:
  }
}

- (void)totpMigrationController:(id)a3 presentPickerForGenerator:(id)a4
{
  id v6 = (PMTOTPMigrationController *)a3;
  id v7 = a4;
  id v8 = [(SFAccountDetailViewController *)self presentedViewController];
  if (v8 == self->_totpMigrationNavigationController)
  {
    totpMigrationController = self->_totpMigrationController;

    if (totpMigrationController == v6)
    {
      uint64_t v10 = objc_alloc_init(SFAccountPickerConfiguration);
      uint64_t v11 = _WBSLocalizedString();
      [(SFAccountPickerConfiguration *)v10 setPrompt:v11];

      uint64_t v12 = _WBSLocalizedString();
      [(SFAccountPickerConfiguration *)v10 setTitle:v12];

      [(SFAccountPickerConfiguration *)v10 setMinimumNumberOfCredentialsToShowLikelyMatchesSection:1];
      [(SFAccountPickerConfiguration *)v10 setShouldEnableAddingNewPasswordsIfPossible:1];
      [(SFAccountPickerConfiguration *)v10 setShouldHideCreatePasswordsInSettingsHint:1];
      uint64_t v13 = [v7 heuristicallyDeterminedServiceNameHints];
      uint64_t v14 = [v13 count];

      if (v14)
      {
        uint64_t v15 = [v7 heuristicallyDeterminedServiceNameHints];
        [(SFAccountPickerConfiguration *)v10 setServiceNameHintStrings:v15];
      }
      id v16 = [SFAccountPickerViewController alloc];
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      uint64_t v22 = __83__SFAccountDetailViewController_totpMigrationController_presentPickerForGenerator___block_invoke;
      id v23 = &unk_1E5C72B40;
      id v17 = v6;
      uint64_t v24 = v17;
      id v25 = v7;
      id v18 = [(SFAccountPickerViewController *)v16 initWithConfiguration:v10 completionHandler:&v20];
      uint64_t v19 = [(PMTOTPMigrationController *)v17 viewController];
      [v19 presentViewController:v18 animated:1 completion:0];
    }
  }
  else
  {
  }
}

void __83__SFAccountDetailViewController_totpMigrationController_presentPickerForGenerator___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addGenerator:*(void *)(a1 + 40) toSavedAccount:v3];
    id v3 = v4;
  }
}

- (SFAccountDetailViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFAccountDetailViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showsChangePasswordControllerOnAppearance
{
  return self->_showsChangePasswordControllerOnAppearance;
}

- (void)setShowsChangePasswordControllerOnAppearance:(BOOL)a3
{
  self->_showsChangePasswordControllerOnAppearance = a3;
}

- (BOOL)isForFillingIndividualAccountFields
{
  return self->_isForFillingIndividualAccountFields;
}

- (void)setIsForFillingIndividualAccountFields:(BOOL)a3
{
  self->_BOOL isForFillingIndividualAccountFields = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_totpMigrationController, 0);
  objc_storeStrong((id *)&self->_totpMigrationNavigationController, 0);
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
  objc_storeStrong((id *)&self->_passkeyFooterView, 0);
  objc_storeStrong((id *)&self->_addPasswordNavigationController, 0);
  objc_storeStrong((id *)&self->_visitWebsiteCell, 0);
  objc_storeStrong((id *)&self->_accountAuthenticationModificationController, 0);
  objc_storeStrong((id *)&self->_accountModificationExtension, 0);
  objc_storeStrong((id *)&self->_rulesForStrongPasswordChange, 0);
  objc_storeStrong((id *)&self->_changeToStrongPasswordCell, 0);
  objc_storeStrong((id *)&self->_upgradeToSignInWithAppleCell, 0);
  objc_storeStrong((id *)&self->_TOTPGenerators, 0);
  objc_destroyWeak((id *)&self->_secretEntryAlertController);
  objc_storeStrong((id *)&self->_TOTPTimer, 0);
  objc_destroyWeak((id *)&self->_changePasswordSafariViewController);
  objc_storeStrong((id *)&self->_passwordWarning, 0);
  objc_storeStrong((id *)&self->_securityRecommendationInfoCell, 0);
  objc_storeStrong((id *)&self->_tableViewDiffableDataSource, 0);
  objc_storeStrong((id *)&self->_notesForEditing, 0);
  objc_storeStrong((id *)&self->_notesCell, 0);
  objc_storeStrong((id *)&self->_TOTPCodeCell, 0);
  objc_storeStrong((id *)&self->_totpFooterView, 0);
  objc_storeStrong((id *)&self->_setupTOTPCodeCell, 0);
  objc_storeStrong((id *)&self->_changePasswordOnWebsiteCell, 0);
  objc_storeStrong((id *)&self->_passwordForEditing, 0);
  objc_storeStrong((id *)&self->_userForEditing, 0);
  objc_storeStrong((id *)&self->_titleForEditing, 0);
  objc_storeStrong((id *)&self->_passwordCell, 0);
  objc_storeStrong((id *)&self->_userCell, 0);
  objc_storeStrong((id *)&self->_headerCell, 0);
  objc_storeStrong((id *)&self->_backBarButtonItem, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_shareBarButtonItem, 0);
  objc_storeStrong((id *)&self->_editBarButtonItem, 0);
  objc_storeStrong((id *)&self->_savedAccountChangeRequest, 0);

  objc_storeStrong((id *)&self->_savedAccount, 0);
}

void __94__SFAccountDetailViewController__sharePasswordWithPopoverPresentationControllerConfiguration___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v4, v5, "Failed to authenticate for one time account sharing: %@", v6, v7, v8, v9, v10);
}

void __66__SFAccountDetailViewController__updateAccountModificationOptions__block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_2() _plugIn];
  uint64_t v5 = [v4 localizedContainingName];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v6, v7, "Failed to get Sign in with Apple authorization credential state for %@", v8, v9, v10, v11, v12);
}

- (void)accountAuthenticationModificationController:(void *)a1 didFailRequest:withError:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v4, v5, "Account Modification Extension request canceled with error: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_softDeletePassword
{
}

- (void)QRCodeScannerViewController:(void *)a1 didScanQRCodeWithURLValue:.cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_2() absoluteString];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1A690B000, v1, OS_LOG_TYPE_DEBUG, "Ignoring invalid QR-encoded URL. %@", v4, 0xCu);
}

@end