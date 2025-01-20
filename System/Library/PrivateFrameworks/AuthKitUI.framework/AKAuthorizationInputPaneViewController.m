@interface AKAuthorizationInputPaneViewController
- (AKAuthorizationInputPaneViewController)init;
- (AKAuthorizationInputPaneViewController)initWithPresentationContext:(id)a3 scopeChoices:(id)a4;
- (AKAuthorizationNameFormatter)nameFormatter;
- (AKAuthorizationPresentationContext)presentationContext;
- (AKAuthorizationScopeChoices)editableScopeChoices;
- (AKAuthorizationSubPaneConfirmButton)confirmButton;
- (AKAuthorizationSubPaneImage)imageSubPane;
- (AKAuthorizationViewController)authorizationViewController;
- (AKUserInformation)editingUserInformation;
- (BOOL)_emailScopeAllowsAuthorization;
- (BOOL)_getValidEditingGivenName:(id *)a3 familyName:(id *)a4;
- (BOOL)_hasEmailScope;
- (BOOL)_hasNameScope;
- (BOOL)_hasOneLoginChoice;
- (BOOL)_hasSharedAccountLoginChoices;
- (BOOL)_isUnderageUser;
- (BOOL)_isValidEditingName;
- (BOOL)_nameScopeAllowsAuthorization;
- (BOOL)_shouldAllowAuthorization;
- (BOOL)_shouldOverrideIntrinsicContentHeight;
- (BOOL)_shouldPresentCreateFlow;
- (BOOL)_shouldPresentUpgradeFlow;
- (BOOL)editableScopeChoicesChanged;
- (BOOL)isEditingName;
- (BOOL)isEmailExpanded;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)validateReadyForAuthorization;
- (UIBarButtonItem)savedLeftBarButtonItem;
- (UIBarButtonItem)savedRightBarButtonItem;
- (double)_computeNameEditHeightChange;
- (double)_mainSectionScreenMaxY;
- (double)_padNameEditHeightChange;
- (double)_phoneNameEditHeightChange;
- (double)contentScrollOffset;
- (double)intrinsicContentHeight;
- (id)_cellForScope:(id)a3 localRow:(int64_t)a4;
- (id)_clearButton;
- (id)_defaultSharedEmail;
- (id)_doneBarButtonItem;
- (id)_editingNameCellForRow:(unint64_t)a3;
- (id)_emailCellForLocalRow:(int64_t)a3;
- (id)_firstLoginChoice;
- (id)_hideMyEmailCell;
- (id)_localizedAuthorizationPrefix:(BOOL)a3;
- (id)_localizedAuthorizationString;
- (id)_localizedChoiceString;
- (id)_localizedEmailKey;
- (id)_localizedFirstPartyAuthorizationStringWithAppName:(id)a3 accountName:(id)a4;
- (id)_localizedInfoString;
- (id)_localizedNameKey;
- (id)_localizedPrivacyMessageStringForManagedAppleID;
- (id)_localizedSharedAccountsChoiceString;
- (id)_localizedSubscriptionString;
- (id)_localizedUpgradeString;
- (id)_loginChoiceCellForRow:(unint64_t)a3;
- (id)_loginChoiceTableViewCellForRow:(unint64_t)a3;
- (id)_nameCell;
- (id)_nameCellDetailLabelTextForManagedAppleID;
- (id)_paneTitleString;
- (id)_selectedLoginChoice;
- (id)_shareMyEmailCell;
- (id)_singleEmailCellForIndex:(int64_t)a3;
- (id)_textFieldForRow:(unint64_t)a3;
- (id)_textFromTextField:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_numberOfRowsInValidatedScopes;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_numberOfRowsInScope:(id)a3;
- (void)_addAdditionalCTAToContext:(id)a3;
- (void)_addAuthorizationButtonToPaneContext:(id)a3;
- (void)_addShimToStackView:(id)a3;
- (void)_addUseOtherIDButtonToContext:(id)a3;
- (void)_beginEditing;
- (void)_beginEditingRow:(unint64_t)a3;
- (void)_computeNameEditHeightChange;
- (void)_createAppIconViewWithIcon:(id)a3;
- (void)_didSelectEditScope:(id)a3 options:(id)a4;
- (void)_enableOrDisableConfirmButton;
- (void)_escapeKeyPressed;
- (void)_handleAuthorizationError:(id)a3;
- (void)_loadAppIconViewImage;
- (void)_localizedAuthorizationString;
- (void)_nameEditDone;
- (void)_paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:(id)a3 error:(id)a4;
- (void)_paneDelegate_didRequestAuthorizationWithUserProvidedInformation:(id)a3 completion:(id)a4;
- (void)_performAdditionalCTA:(id)a3;
- (void)_performAuthorizationWithRawPassword:(id)a3;
- (void)_performAuthorizationWithRawPassword:(id)a3 completionHandler:(id)a4;
- (void)_performPasswordAuthentication;
- (void)_prepareScopeChoices:(id)a3 withLoginChoice:(id)a4;
- (void)_reloadDataAnimated:(BOOL)a3 heightChange:(id)a4;
- (void)_reloadDataAnimated:(BOOL)a3 heightChange:(id)a4 animation:(id)a5;
- (void)_reloadDataAnimated:(BOOL)a3 heightChange:(id)a4 animation:(id)a5 completion:(id)a6;
- (void)_selectEmailLocalRow:(int64_t)a3;
- (void)_selectHideMyEmail;
- (void)_selectLoginChoiceCell;
- (void)_selectLoginChoiceCell:(id)a3;
- (void)_selectRow:(int64_t)a3;
- (void)_selectScope:(id)a3 localRow:(int64_t)a4;
- (void)_selectShareMyEmail;
- (void)_selectSingleEmailAtIndex:(int64_t)a3;
- (void)_setCancelButtonEnabled:(BOOL)a3;
- (void)_setEditableScopeChoicesForManagedAppleID;
- (void)_setEditableScopeChoicesForUnderageUser;
- (void)_setFamilyNameFromTextField:(id)a3;
- (void)_setGivenNameFromTextField:(id)a3;
- (void)_setupAlternateButton;
- (void)_setupAnalyticsReport;
- (void)_setupAppIconView;
- (void)_setupEditableScopeChoices;
- (void)_setupEscapeKeyListener;
- (void)_setupFamilyNameCell:(id)a3;
- (void)_setupGivenNameCell:(id)a3;
- (void)_setupInfoLabel;
- (void)_setupLoginChoiceView;
- (void)_setupPrivacyLink;
- (void)_setupTableView;
- (void)_setupUpgradeFromPasswordBulletPointViews;
- (void)_setupValidatedScopes;
- (void)_transitionFromEditingNameAnimated:(BOOL)a3;
- (void)_transitionToEditingNameAnimated:(BOOL)a3;
- (void)_updateAnalyticsReport;
- (void)_updateDataSourceWithValidEditingName;
- (void)_updateEditableScopeChoicesWithPrivateEmail:(BOOL)a3;
- (void)_updateInfoLabelStringWithAppName:(id)a3;
- (void)_updateLayoutForHeightChange:(double)a3;
- (void)_updatePaneTitleForEditing:(BOOL)a3;
- (void)_useOtherIDButtonSelected:(id)a3;
- (void)_userCanceledPanel;
- (void)dealloc;
- (void)passwordAuthenticationCompletedWithResults:(id)a3 error:(id)a4;
- (void)performAuthorization;
- (void)performPasswordAuthentication;
- (void)setAuthorizationViewController:(id)a3;
- (void)setConfirmButton:(id)a3;
- (void)setEditableScopeChoicesChanged:(BOOL)a3;
- (void)setEditingName:(BOOL)a3;
- (void)setEditingName:(BOOL)a3 animated:(BOOL)a4;
- (void)setEditingName:(BOOL)a3 shouldClear:(BOOL)a4 animated:(BOOL)a5;
- (void)setEditingUserInformation:(id)a3;
- (void)setEmailExpanded:(BOOL)a3;
- (void)setEmailExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setImageSubPane:(id)a3;
- (void)setNameFormatter:(id)a3;
- (void)setSavedLeftBarButtonItem:(id)a3;
- (void)setSavedRightBarButtonItem:(id)a3;
- (void)subPaneConfirmButtonDidEnterProcessingState:(id)a3;
- (void)subPaneConfirmButtonPerformAccountCreation:(id)a3;
- (void)subPaneConfirmButtonPerformExternalAuthentication:(id)a3;
- (void)subpaneConfirmButtonDidFailBiometry:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)validateReadyForAuthorization;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AKAuthorizationInputPaneViewController

- (AKAuthorizationInputPaneViewController)init
{
  return 0;
}

- (AKAuthorizationInputPaneViewController)initWithPresentationContext:(id)a3 scopeChoices:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKAuthorizationInputPaneViewController;
  v9 = [(AKAuthorizationPaneViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presentationContext, a3);
    objc_storeStrong((id *)&v10->_editableScopeChoices, a4);
    [(AKAuthorizationInputPaneViewController *)v10 _setupAnalyticsReport];
    [(AKAuthorizationInputPaneViewController *)v10 _setupValidatedScopes];
    [(AKAuthorizationInputPaneViewController *)v10 _setupEditableScopeChoices];
  }

  return v10;
}

- (void)dealloc
{
  [(AKCAReporter *)self->_analyticsReport sendReport];
  v3.receiver = self;
  v3.super_class = (Class)AKAuthorizationInputPaneViewController;
  [(AKAuthorizationInputPaneViewController *)&v3 dealloc];
}

- (void)_setupEditableScopeChoices
{
  objc_super v3 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  v4 = [v3 userInformation];
  int v5 = [v4 isManagedAppleID];

  v6 = [(AKAuthorizationScopeChoices *)self->_editableScopeChoices userInformation];
  id v16 = [v6 reachableEmails];

  id v7 = [(AKAuthorizationScopeChoices *)self->_editableScopeChoices userInformation];
  id v8 = [v7 previouslySelectedEmail];

  if (v5)
  {
    [(AKAuthorizationInputPaneViewController *)self _setEditableScopeChoicesForManagedAppleID];
  }
  else if ([(AKAuthorizationInputPaneViewController *)self _isUnderageUser] {
         && ([MEMORY[0x1E4F4F020] sharedManager],
  }
             v9 = objc_claimAutoreleasedReturnValue(),
             int v10 = [v9 isTiburonU13Enabled],
             v9,
             v10))
  {
    [(AKAuthorizationInputPaneViewController *)self _setEditableScopeChoicesForUnderageUser];
  }
  else
  {
    -[AKAuthorizationScopeChoices setIndexOfChosenEmail:](self->_editableScopeChoices, "setIndexOfChosenEmail:", [v16 indexOfObject:v8]);
    editableScopeChoices = self->_editableScopeChoices;
    objc_super v12 = [(AKAuthorizationScopeChoices *)editableScopeChoices userInformation];
    v13 = [v12 previouslyWantedPrivateEmail];
    -[AKAuthorizationScopeChoices setWantsPrivateEmail:](editableScopeChoices, "setWantsPrivateEmail:", [v13 BOOLValue]);
  }
  v14 = [(AKAuthorizationPresentationContext *)self->_presentationContext loginChoices];
  uint64_t v15 = [v14 count];

  if (v15) {
    [(AKAuthorizationScopeChoices *)self->_editableScopeChoices setIndexOfChosenLogin:0];
  }
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)AKAuthorizationInputPaneViewController;
  [(AKAuthorizationPaneViewController *)&v13 viewDidLoad];
  objc_super v3 = +[AKAuthorizationAppearance paneBackgroundColor];
  v4 = [(AKAuthorizationInputPaneViewController *)self view];
  [v4 setBackgroundColor:v3];

  [(AKAuthorizationInputPaneViewController *)self _setupTableView];
  int v5 = [(AKAuthorizationPaneViewController *)self paneHeaderStackView];
  [(AKAuthorizationInputPaneViewController *)self _addShimToStackView:v5];

  [(AKAuthorizationInputPaneViewController *)self _setupAppIconView];
  [(AKAuthorizationInputPaneViewController *)self _setupInfoLabel];
  [(AKAuthorizationInputPaneViewController *)self _setupLoginChoiceView];
  v6 = [(AKAuthorizationPaneViewController *)self paneHeaderStackView];
  [(AKAuthorizationInputPaneViewController *)self _addShimToStackView:v6];

  [(AKAuthorizationInputPaneViewController *)self _setupNameAndEmailScopeViews];
  [(AKAuthorizationInputPaneViewController *)self _setupPrivacyLink];
  id v7 = [(AKAuthorizationPaneViewController *)self paneFooterStackView];
  [(AKAuthorizationInputPaneViewController *)self _addShimToStackView:v7];

  id v8 = [(AKAuthorizationPaneViewController *)self footerPaneContext];
  [(AKAuthorizationInputPaneViewController *)self _addAuthorizationButtonToPaneContext:v8];

  v9 = [(AKAuthorizationPaneViewController *)self footerPaneContext];
  [(AKAuthorizationInputPaneViewController *)self _addAdditionalCTAToContext:v9];

  [(AKAuthorizationInputPaneViewController *)self _setupAlternateButton];
  int v10 = [(AKAuthorizationPaneViewController *)self paneFooterStackView];
  [(AKAuthorizationInputPaneViewController *)self _addShimToStackView:v10];

  [(AKAuthorizationInputPaneViewController *)self _updatePaneTitleForEditing:0];
  [(AKAuthorizationInputPaneViewController *)self _setupEscapeKeyListener];
  v11 = (void *)MEMORY[0x1E4F28DC8];
  objc_super v12 = [(AKAuthorizationPaneViewController *)self mutableConstraints];
  [v11 activateConstraints:v12];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKAuthorizationInputPaneViewController;
  [(AKAuthorizationPaneViewController *)&v5 viewWillAppear:a3];
  if ([(AKAuthorizationInputPaneViewController *)self editableScopeChoicesChanged])
  {
    [(AKAuthorizationInputPaneViewController *)self setEditableScopeChoicesChanged:0];
    v4 = [(AKAuthorizationPaneViewController *)self tableView];
    [v4 reloadData];
  }
  [(AKAuthorizationInputPaneViewController *)self _enableOrDisableConfirmButton];
  if ([(AKAuthorizationInputPaneViewController *)self isViewLoaded])
  {
    if (([(AKAuthorizationInputPaneViewController *)self isBeingDismissed] & 1) == 0)
    {
      -[AKAuthorizationInputPaneViewController setPreferredContentSize:](self, "setPreferredContentSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      [(AKAuthorizationPaneViewController *)self sizeToFitPaneContent];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationInputPaneViewController;
  [(AKAuthorizationPaneViewController *)&v4 viewDidAppear:a3];
  if ([(AKAuthorizationInputPaneViewController *)self isEditingName]) {
    [(AKAuthorizationInputPaneViewController *)self _beginEditing];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationInputPaneViewController;
  [(AKAuthorizationInputPaneViewController *)&v4 viewWillDisappear:a3];
  [(AKAuthorizationInputPaneViewController *)self _updateDataSourceWithValidEditingName];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AKAuthorizationInputPaneViewController;
  [(AKAuthorizationInputPaneViewController *)&v7 viewDidDisappear:a3];
  objc_super v4 = [MEMORY[0x1E4F4F010] currentDevice];
  int v5 = [v4 isFaceIDCapable];

  if (v5)
  {
    v6 = [(AKAuthorizationInputPaneViewController *)self confirmButton];
    [v6 enableAuthorizationCapability:0];
  }
}

- (void)_setupAnalyticsReport
{
  objc_super v3 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  objc_super v4 = [v3 credentialRequestContext];
  int v5 = [v4 requestIdentifier];
  v6 = [v5 UUIDString];

  objc_super v7 = [[AKCATiburonInputUIReporter alloc] initWithRequestID:v6];
  analyticsReport = self->_analyticsReport;
  self->_analyticsReport = v7;

  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v9 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  int v10 = [v9 loginChoices];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__AKAuthorizationInputPaneViewController__setupAnalyticsReport__block_invoke;
  v11[3] = &unk_1E648F780;
  v11[4] = &v16;
  v11[5] = &v12;
  [v10 enumerateObjectsUsingBlock:v11];

  [(AKCATiburonInputUIReporter *)self->_analyticsReport didShowAppleID:*((unsigned __int8 *)v17 + 24)];
  [(AKCATiburonInputUIReporter *)self->_analyticsReport setPasswordCredentialCount:v13[3]];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
}

uint64_t __63__AKAuthorizationInputPaneViewController__setupAnalyticsReport__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isAppleIDAuthorization];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  else {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  return result;
}

- (void)_setupValidatedScopes
{
  id v5 = [MEMORY[0x1E4F1CA48] array];
  if ([(AKAuthorizationInputPaneViewController *)self _hasNameScope]) {
    [v5 addObject:*MEMORY[0x1E4F4EE20]];
  }
  if ([(AKAuthorizationInputPaneViewController *)self _hasEmailScope]) {
    [v5 addObject:*MEMORY[0x1E4F4EE18]];
  }
  objc_super v3 = (NSArray *)[v5 copy];
  validatedScopes = self->_validatedScopes;
  self->_validatedScopes = v3;
}

- (void)_setupTableView
{
  objc_super v3 = [(AKAuthorizationPaneViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"AKAuthorizationScopeDetailTableViewCell-Name"];

  objc_super v4 = [(AKAuthorizationPaneViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"AKAuthorizationScopeEditTableViewCell-Name"];

  id v5 = [(AKAuthorizationPaneViewController *)self tableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"AKAuthorizationScopeDetailTableViewCell-Email-Summary"];

  v6 = [(AKAuthorizationPaneViewController *)self tableView];
  [v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"AKAuthorizationScopeDetailTableViewCell-Email-Single"];

  objc_super v7 = [MEMORY[0x1E4F4F020] sharedManager];
  [v7 isSiwaCredentialSharingEnabled];

  id v8 = [(AKAuthorizationPaneViewController *)self tableView];
  [v8 registerClass:objc_opt_class() forCellReuseIdentifier:@"AKAuthorizationLoginChoiceCell"];

  v9 = [(AKAuthorizationInputPaneViewController *)self authorizationViewController];
  char v10 = [v9 _isManagedAppleID];

  if (v10)
  {
    uint64_t v11 = 0;
  }
  else if ([(AKAuthorizationInputPaneViewController *)self _isUnderageUser])
  {
    uint64_t v12 = [MEMORY[0x1E4F4F020] sharedManager];
    uint64_t v11 = [v12 isTiburonU13Enabled] ^ 1;
  }
  else
  {
    uint64_t v11 = 1;
  }
  objc_super v13 = [(AKAuthorizationPaneViewController *)self tableView];
  [v13 setAllowsSelection:v11];

  uint64_t v14 = [(AKAuthorizationPaneViewController *)self tableView];
  [v14 setDataSource:self];

  id v15 = [(AKAuthorizationPaneViewController *)self tableView];
  [v15 setDelegate:self];
}

- (void)_setupAppIconView
{
  objc_super v3 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  id v6 = +[AKIcon iconWithPresentationContext:v3];

  if ([v6 iconType] == 1)
  {
    +[AKAuthorizationPaneMetrics iconSize];
    uint64_t v4 = +[AKIcon iconWithName:size:](AKIcon, "iconWithName:size:", @"AppleLogo");

    id v5 = (id)v4;
  }
  else
  {
    id v5 = v6;
  }
  id v7 = v5;
  [(AKAuthorizationInputPaneViewController *)self _createAppIconViewWithIcon:v5];
  [(AKAuthorizationInputPaneViewController *)self _loadAppIconViewImage];
}

- (void)_setupInfoLabel
{
  objc_super v3 = [AKAuthorizationSubPaneInfoLabel alloc];
  uint64_t v4 = [(AKAuthorizationInputPaneViewController *)self _localizedInfoString];
  id v5 = [(AKAuthorizationSubPaneInfoLabel *)v3 initWithString:v4];
  infoLabel = self->_infoLabel;
  self->_infoLabel = v5;

  id v7 = self->_infoLabel;
  +[AKAuthorizationPaneMetrics infoLabelBottomSpacing];
  -[AKAuthorizationSubPane setCustomSpacingAfter:](v7, "setCustomSpacingAfter:");
  id v8 = [(AKAuthorizationPaneViewController *)self headerPaneContext];
  [v8 addSubPane:self->_infoLabel];
}

- (void)_setupLoginChoiceView
{
  if ([(AKAuthorizationInputPaneViewController *)self _shouldPresentUpgradeFlow])
  {
    [(AKAuthorizationInputPaneViewController *)self _setupUpgradeFromPasswordBulletPointViews];
  }
}

- (void)_setupUpgradeFromPasswordBulletPointViews
{
  objc_super v3 = (void *)0x1E4F4F000;
  uint64_t v4 = [MEMORY[0x1E4F4F010] currentDevice];
  int v5 = [v4 isBiometricAuthCapable];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F4F010] currentDevice];
    int v7 = [v6 isFaceIDCapable];

    id v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v9 = v8;
    if (v7) {
      char v10 = @"AUTHORIZE_UPGRADE_MESSAGE_1_FACEID";
    }
    else {
      char v10 = @"AUTHORIZE_UPGRADE_MESSAGE_1_TOUCHID";
    }
    id v29 = [v8 localizedStringForKey:v10 value:&stru_1F1EE8138 table:@"Localizable"];
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v11 = @"AUTHORIZE_UPGRADE_MESSAGE_1_NOBIO";
    char v12 = [@"AUTHORIZE_UPGRADE_MESSAGE_1_NOBIO" containsString:@"REBRAND"];
    if (v12)
    {
      int v13 = 0;
    }
    else
    {
      objc_super v3 = [MEMORY[0x1E4F4F020] sharedManager];
      if ([v3 isAABrandingEnabled])
      {
        uint64_t v11 = [@"AUTHORIZE_UPGRADE_MESSAGE_1_NOBIO" stringByAppendingString:@"_REBRAND"];
        int v13 = 1;
      }
      else
      {
        int v13 = 0;
      }
    }
    id v29 = [v9 localizedStringForKey:v11 value:&stru_1F1EE8138 table:@"Localizable"];
    if (v13) {

    }
    if ((v12 & 1) == 0) {
  }
    }

  uint64_t v14 = [(AKAuthorizationPaneViewController *)self headerPaneContext];
  +[AKAuthorizationPaneMetrics upgradeAccountTopSpacing];
  objc_msgSend(v14, "addEmptyViewWithSpacing:");

  id v15 = [AKAuthorizationBulletPointSubPane alloc];
  uint64_t v16 = +[AKAuthorizationBiometricImage biometricImage];
  v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v18 = [v17 localizedStringForKey:@"AUTHORIZE_UPGRADE_TITLE_1" value:&stru_1F1EE8138 table:@"Localizable"];
  char v19 = [(AKAuthorizationBulletPointSubPane *)v15 initWithImage:v16 title:v18 message:v29];

  v20 = [AKAuthorizationBulletPointSubPane alloc];
  v21 = objc_msgSend(MEMORY[0x1E4F42A80], "ak_imageNamed:", @"lock.fill");
  v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v23 = [v22 localizedStringForKey:@"AUTHORIZE_UPGRADE_TITLE_2" value:&stru_1F1EE8138 table:@"Localizable"];
  v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v25 = [v24 localizedStringForKey:@"AUTHORIZE_UPGRADE_MESSAGE_2" value:&stru_1F1EE8138 table:@"Localizable"];
  v26 = [(AKAuthorizationBulletPointSubPane *)v20 initWithImage:v21 title:v23 message:v25];

  v27 = [(AKAuthorizationPaneViewController *)self headerPaneContext];
  [v27 addSubPane:v19];

  v28 = [(AKAuthorizationPaneViewController *)self headerPaneContext];
  [v28 addSubPane:v26];

  +[AKAuthorizationPaneMetrics upgradeAccountInterItemSpacing];
  -[AKAuthorizationSubPane setCustomSpacingAfter:](v19, "setCustomSpacingAfter:");
}

- (void)_setupAlternateButton
{
  id v3 = [(AKAuthorizationPaneViewController *)self footerPaneContext];
  [(AKAuthorizationInputPaneViewController *)self _addUseOtherIDButtonToContext:v3];
}

- (void)_createAppIconViewWithIcon:(id)a3
{
  v36[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F42FF0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  int v7 = [(AKAuthorizationPaneViewController *)self headerPaneContext];
  id v8 = [v7 stackView];
  [v8 addArrangedSubview:v6];

  v35 = self;
  v9 = [(AKAuthorizationPaneViewController *)self headerPaneContext];
  char v10 = [v9 stackView];
  +[AKAuthorizationPaneMetrics iconTopSpacing];
  v34 = v6;
  objc_msgSend(v10, "setCustomSpacing:afterView:", v6);

  uint64_t v11 = [v5 automaskedImage];

  v33 = (void *)v11;
  char v12 = [[AKAuthorizationSubPaneImage alloc] initWithImage:v11];
  int v13 = [(AKAuthorizationSubPaneImage *)v12 image];
  [v13 size];
  if (v14 == 0.0)
  {
    double v20 = 1.0;
  }
  else
  {
    id v15 = [(AKAuthorizationSubPaneImage *)v12 image];
    [v15 size];
    double v17 = v16;
    uint64_t v18 = [(AKAuthorizationSubPaneImage *)v12 image];
    [v18 size];
    double v20 = v17 / v19;
  }
  v21 = [(AKAuthorizationSubPaneImage *)v12 imageView];
  v22 = [v21 heightAnchor];
  +[AKAuthorizationPaneMetrics iconSize];
  v24 = [v22 constraintEqualToConstant:v23];
  v36[0] = v24;
  v25 = [(AKAuthorizationSubPaneImage *)v12 imageView];
  v26 = [v25 widthAnchor];
  v27 = [(AKAuthorizationSubPaneImage *)v12 imageView];
  v28 = [v27 heightAnchor];
  id v29 = [v26 constraintEqualToAnchor:v28 multiplier:v20];
  v36[1] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  [(AKAuthorizationSubPaneImage *)v12 setImageViewConstraints:v30];

  v31 = [(AKAuthorizationPaneViewController *)v35 headerPaneContext];
  [v31 addSubPane:v12];

  +[AKAuthorizationPaneMetrics iconBottomSpacing];
  -[AKAuthorizationSubPane setCustomSpacingAfter:](v12, "setCustomSpacingAfter:");
  imageSubPane = v35->_imageSubPane;
  v35->_imageSubPane = v12;
}

- (void)_loadAppIconViewImage
{
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__AKAuthorizationInputPaneViewController__loadAppIconViewImage__block_invoke;
  v6[3] = &unk_1E648F7D0;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  id v3 = (void (**)(void, void))MEMORY[0x1C8777520](v6);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__AKAuthorizationInputPaneViewController__loadAppIconViewImage__block_invoke_3;
  v4[3] = &unk_1E648F820;
  objc_copyWeak(&v5, &location);
  ((void (**)(void, void *))v3)[2](v3, v4);
  objc_destroyWeak(&v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __63__AKAuthorizationInputPaneViewController__loadAppIconViewImage__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __63__AKAuthorizationInputPaneViewController__loadAppIconViewImage__block_invoke_2;
  v19[3] = &unk_1E648F7A8;
  id v5 = v3;
  id v20 = v5;
  id v6 = (void *)MEMORY[0x1C8777520](v19);
  id v7 = [*(id *)(a1 + 32) presentationContext];
  id v8 = +[AKIcon iconWithPresentationContext:v7];

  v9 = [WeakRetained presentationContext];
  char v10 = [v9 credentialRequestContext];
  int v11 = [v10 _isSubscriptionLogin];

  if (v11)
  {
    uint64_t v12 = [v8 automaskedImageData];
    if (v12)
    {
      int v13 = (void *)v12;
      uint64_t v14 = [v8 iconType];

      if (v14 == 2)
      {
LABEL_9:
        uint64_t v18 = [v8 automaskedImage];
        (*((void (**)(id, void *, void, void))v5 + 2))(v5, v18, 0, 0);
        goto LABEL_10;
      }
    }
  }
  else
  {
    if ([v8 iconType] == 2) {
      goto LABEL_9;
    }
    id v15 = [*(id *)(a1 + 32) presentationContext];
    double v16 = [v15 credentialRequestContext];
    char v17 = [v16 _isWebLogin];

    if ((v17 & 1) == 0) {
      goto LABEL_9;
    }
    if (!WeakRetained)
    {
      (*((void (**)(id, void, void, void))v5 + 2))(v5, 0, 0, 0);
      goto LABEL_11;
    }
  }
  uint64_t v18 = [WeakRetained paneDelegate];
  [v18 authorizationPaneViewController:WeakRetained didRequestIconWithCompletion:v6];
LABEL_10:

LABEL_11:
}

void __63__AKAuthorizationInputPaneViewController__loadAppIconViewImage__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v11)
  {
    id v6 = +[AKIcon iconWithIconContext:](AKIcon, "iconWithIconContext:");
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = [v6 iconType];
  uint64_t v8 = *(void *)(a1 + 32);
  if (v7 == 2)
  {
    v9 = [v6 automaskedImage];
    char v10 = [v11 appName];
    (*(void (**)(uint64_t, void *, void *, void))(v8 + 16))(v8, v9, v10, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, void, id))(v8 + 16))(v8, 0, 0, v5);
  }
}

void __63__AKAuthorizationInputPaneViewController__loadAppIconViewImage__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AKAuthorizationInputPaneViewController__loadAppIconViewImage__block_invoke_4;
  block[3] = &unk_1E648F7F8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __63__AKAuthorizationInputPaneViewController__loadAppIconViewImage__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (*(void *)(a1 + 32))
  {
    id v3 = [WeakRetained imageSubPane];
    [v3 setImage:*(void *)(a1 + 32) animated:1];

    id WeakRetained = v4;
  }
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(v4, "_updateInfoLabelStringWithAppName:");
    id WeakRetained = v4;
  }
}

- (void)_updateInfoLabelStringWithAppName:(id)a3
{
  id v9 = a3;
  id v4 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  id v5 = [v4 localizedAppName];

  if (!v5)
  {
    id v6 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
    [v6 setLocalizedAppName:v9];

    infoLabel = self->_infoLabel;
    id v8 = [(AKAuthorizationInputPaneViewController *)self _localizedInfoString];
    [(AKAuthorizationSubPaneInfoLabel *)infoLabel setString:v8 animated:1];
  }
}

- (void)_setupPrivacyLink
{
  id v3 = [(AKAuthorizationInputPaneViewController *)self authorizationViewController];
  int v4 = [v3 _isManagedAppleID];

  if (v4)
  {
    id v5 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
    id v6 = [v5 credentialRequestContext];
    id v7 = [v6 authorizationRequest];
    uint64_t v8 = [v7 existingStatus];

    if (v8 == 2)
    {
      id v12 = [(AKAuthorizationPaneViewController *)self footerPaneContext];
      +[AKAuthorizationPaneMetrics privacyInfoTopSpacing];
      objc_msgSend(v12, "addEmptyViewWithSpacing:");
      id v9 = [(AKAuthorizationInputPaneViewController *)self _localizedPrivacyMessageStringForManagedAppleID];
      id v10 = [[AKAuthorizationSubPaneInfoLabel alloc] initWithString:v9];
      [(AKAuthorizationSubPaneInfoLabel *)v10 setInfoLabelType:4];
      +[AKAuthorizationPaneMetrics privacyInfoToLinkBottomSpacing];
      -[AKAuthorizationSubPane setCustomSpacingAfter:](v10, "setCustomSpacingAfter:");
      [v12 addSubPane:v10];

      id v11 = [[AKAuthorizationSubPanePrivacyLink alloc] initWithPrivacyLinkType:1];
      [v12 addSubPane:v11];
      +[AKAuthorizationPaneMetrics privacyLinkBottomSpacing];
      objc_msgSend(v12, "addEmptyViewWithSpacing:");
    }
  }
}

- (void)_useOtherIDButtonSelected:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7038);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(AKAuthorizationInputPaneViewController *)self _paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:0 error:v4];
}

- (void)_performAdditionalCTA:(id)a3
{
  id v4 = _AKLogSiwa();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1C38C1000, v4, OS_LOG_TYPE_DEFAULT, "Perform Additional CTA.", v6, 2u);
  }

  id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7124);
  [(AKAuthorizationInputPaneViewController *)self _paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:0 error:v5];
}

- (void)_addAuthorizationButtonToPaneContext:(id)a3
{
  id v4 = a3;
  id v5 = [AKAuthorizationSubPaneConfirmButton alloc];
  id v6 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  id v9 = [(AKAuthorizationSubPaneConfirmButton *)v5 initWithPresentationContext:v6];

  [v4 addSubPane:v9];
  [(AKAuthorizationSubPaneConfirmButton *)v9 setDelegate:self];
  [(AKAuthorizationSubPaneConfirmButton *)v9 setUpButtonToPaneContext:v4];

  id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"BIO_BUTTON_SELECT_EMAIL" value:&stru_1F1EE8138 table:@"Localizable"];
  [(AKAuthorizationSubPaneConfirmButton *)v9 setBioTextForInactiveState:v8];

  [(AKAuthorizationInputPaneViewController *)self setConfirmButton:v9];
  [(AKAuthorizationInputPaneViewController *)self _enableOrDisableConfirmButton];
}

- (void)_addUseOtherIDButtonToContext:(id)a3
{
  id v20 = a3;
  id v4 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  id v5 = [v4 credentialRequestContext];
  int v6 = [v5 _isWebLogin];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    if ([@"USE_DIFFERENT_APPLE_ID" containsString:@"REBRAND"])
    {
      uint64_t v8 = [v7 localizedStringForKey:@"USE_DIFFERENT_APPLE_ID" value:&stru_1F1EE8138 table:@"Localizable"];
    }
    else
    {
      id v9 = [MEMORY[0x1E4F4F020] sharedManager];
      if ([v9 isAABrandingEnabled])
      {
        id v10 = [@"USE_DIFFERENT_APPLE_ID" stringByAppendingString:@"_REBRAND"];
        uint64_t v8 = [v7 localizedStringForKey:v10 value:&stru_1F1EE8138 table:@"Localizable"];
      }
      else
      {
        uint64_t v8 = [v7 localizedStringForKey:@"USE_DIFFERENT_APPLE_ID" value:&stru_1F1EE8138 table:@"Localizable"];
      }
    }
    id v11 = +[AKTextualLinkButton buttonWithText:v8 fontSize:self target:sel__useOtherIDButtonSelected_ action:13.0];
    id v12 = [v20 stackView];
    [v12 addArrangedSubview:v11];

    int v13 = [v20 stackView];
    +[AKAuthorizationPaneMetrics useOtherAppleIDTopSpacing];
    double v15 = v14;
    double v16 = [v20 stackView];
    char v17 = [v16 arrangedSubviews];
    uint64_t v18 = [v17 lastObject];
    [v13 setCustomSpacing:v18 afterView:v15];

    double v19 = [v20 stackView];
    +[AKAuthorizationPaneMetrics useOtherAppleIDBottomSpacing];
    objc_msgSend(v19, "setCustomSpacing:afterView:", v11);
  }
}

- (void)_addAdditionalCTAToContext:(id)a3
{
  id v18 = a3;
  id v4 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  id v5 = [v4 credentialRequestContext];
  int v6 = [v5 _shouldShowAdditionalCTA];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"ADDITIONAL_CTA" value:&stru_1F1EE8138 table:@"Localizable"];

    id v9 = +[AKTextualLinkButton buttonWithText:v8 fontSize:self target:sel__performAdditionalCTA_ action:16.0];
    id v10 = [v18 stackView];
    [v10 addArrangedSubview:v9];

    id v11 = [v18 stackView];
    +[AKAuthorizationPaneMetrics useOtherAppleIDTopSpacing];
    double v13 = v12;
    double v14 = [v18 stackView];
    double v15 = [v14 arrangedSubviews];
    double v16 = [v15 lastObject];
    [v11 setCustomSpacing:v16 afterView:v13];

    char v17 = [v18 stackView];
    +[AKAuthorizationPaneMetrics useOtherAppleIDBottomSpacing];
    objc_msgSend(v17, "setCustomSpacing:afterView:", v9);
  }
}

- (void)_addShimToStackView:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F42FF0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v4 addArrangedSubview:v5];
}

- (void)_setupEscapeKeyListener
{
  id v3 = [(AKAuthorizationInputPaneViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1)
  {
    id v5 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*MEMORY[0x1E4F439F0] modifierFlags:0 action:sel__escapeKeyPressed];
    [(AKAuthorizationInputPaneViewController *)self addKeyCommand:v5];
  }
}

- (void)_escapeKeyPressed
{
  id v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1C38C1000, v3, OS_LOG_TYPE_DEFAULT, "Escape key pressed", v4, 2u);
  }

  [(AKAuthorizationInputPaneViewController *)self _userCanceledPanel];
}

- (void)_userCanceledPanel
{
  [(AKCATiburonInputUIReporter *)self->_analyticsReport didComplete:0];
  [(AKCAReporter *)self->_analyticsReport sendReport];
  id v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1C38C1000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling the panel", v5, 2u);
  }

  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7003);
  [(AKAuthorizationInputPaneViewController *)self _paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:0 error:v4];
}

- (void)_setEditableScopeChoicesForManagedAppleID
{
  id v3 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  uint64_t v4 = [v3 userInformation];
  id v9 = [v4 sharedEmailForManagedAppleID];

  if (v9)
  {
    id v5 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
    int v6 = [v5 userInformation];
    id v7 = [v6 reachableEmails];
    uint64_t v8 = [v7 indexOfObject:v9];
  }
  else
  {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [(AKAuthorizationScopeChoices *)self->_editableScopeChoices setIndexOfChosenEmail:v8];
  [(AKAuthorizationScopeChoices *)self->_editableScopeChoices setWantsPrivateEmail:0];
}

- (void)_setEditableScopeChoicesForUnderageUser
{
}

- (id)_localizedPrivacyMessageStringForManagedAppleID
{
  v2 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  id v3 = [v2 localizedAppName];

  uint64_t v4 = [v3 length];
  id v5 = NSString;
  int v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v7 = v6;
  if (v4)
  {
    uint64_t v8 = [v6 localizedStringForKey:@"AUTHORIZATION_MANAGED_ACCOUNT_PRIVACY_MESSAGE_APPNAME_FORMAT" value:&stru_1F1EE8138 table:@"Localizable"];
    objc_msgSend(v5, "stringWithFormat:", v8, v3, v3);
  }
  else
  {
    uint64_t v8 = [v6 localizedStringForKey:@"AUTHORIZATION_MANAGED_ACCOUNT_PRIVACY_MESSAGE" value:&stru_1F1EE8138 table:@"Localizable"];
    objc_msgSend(v5, "stringWithFormat:", v8, v11, v12);
  id v9 = };

  return v9;
}

- (id)_nameCellDetailLabelTextForManagedAppleID
{
  id v3 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  uint64_t v4 = [v3 userInformation];
  id v5 = [v4 sharedEmailForManagedAppleID];

  if (v5)
  {
    int v6 = 0;
  }
  else
  {
    id v7 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
    uint64_t v8 = [v7 userInformation];
    int v6 = [v8 managedOrganizationName];
  }

  return v6;
}

- (BOOL)_hasSharedAccountLoginChoices
{
  v2 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  char v3 = [v2 hasSharedAccountLoginChoices];

  return v3;
}

- (BOOL)_shouldPresentCreateFlow
{
  char v3 = [MEMORY[0x1E4F4F020] sharedManager];
  if ([v3 isSiwaCredentialSharingEnabled])
  {
    BOOL v4 = [(AKAuthorizationInputPaneViewController *)self _shouldPresentUpgradeFlow];

    if (!v4
      && [(AKAuthorizationInputPaneViewController *)self _hasSharedAccountLoginChoices])
    {
      return 0;
    }
  }
  else
  {
  }
  id v5 = [(AKAuthorizationPresentationContext *)self->_presentationContext loginChoices];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    uint64_t v8 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
    id v9 = [v8 credentialRequestContext];
    id v10 = [v9 passwordRequest];
    BOOL v7 = v10 == 0;

    return v7;
  }
  return 0;
}

- (BOOL)_shouldPresentUpgradeFlow
{
  v2 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  char v3 = [v2 credentialRequestContext];
  char v4 = [v3 _isEligibleForUpgradeFromPassword];

  return v4;
}

- (BOOL)_hasOneLoginChoice
{
  char v3 = [(AKAuthorizationInputPaneViewController *)self authorizationViewController];
  int v4 = [v3 _isManagedAppleID];

  if (v4)
  {
    id v5 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
    uint64_t v6 = [v5 userInformation];
    BOOL v7 = [v6 sharedEmailForManagedAppleID];
    BOOL v8 = [v7 length] != 0;
  }
  else
  {
    id v5 = [(AKAuthorizationPresentationContext *)self->_presentationContext loginChoices];
    BOOL v8 = [v5 count] == 1;
  }

  return v8;
}

- (id)_firstLoginChoice
{
  v2 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  char v3 = [v2 loginChoices];
  int v4 = [v3 firstObject];

  return v4;
}

- (BOOL)_hasNameScope
{
  v2 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
  char v3 = [v2 scopes];
  char v4 = [v3 containsObject:*MEMORY[0x1E4F4EE20]];

  return v4;
}

- (BOOL)_hasEmailScope
{
  char v3 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
  char v4 = [v3 scopes];
  if ([v4 containsObject:*MEMORY[0x1E4F4EE18]])
  {
    id v5 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
    uint64_t v6 = [v5 userInformation];
    BOOL v7 = [v6 reachableEmails];
    BOOL v8 = [v7 count] != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_nameScopeAllowsAuthorization
{
  if (![(AKAuthorizationInputPaneViewController *)self _hasNameScope]
    || ![(AKAuthorizationInputPaneViewController *)self isEditingName])
  {
    return 1;
  }

  return [(AKAuthorizationInputPaneViewController *)self _isValidEditingName];
}

- (BOOL)_emailScopeAllowsAuthorization
{
  char v3 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
  char v4 = [v3 wantsPrivateEmail];

  id v5 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
  uint64_t v6 = [v5 indexOfChosenEmail];

  BOOL v7 = [(AKAuthorizationInputPaneViewController *)self authorizationViewController];
  char v8 = [v7 _isManagedAppleID];

  BOOL v9 = [(AKAuthorizationInputPaneViewController *)self _hasEmailScope];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    BOOL v10 = v8;
  }
  else {
    BOOL v10 = 1;
  }
  if (v4) {
    BOOL v10 = 1;
  }
  return !v9 || v10;
}

- (BOOL)_shouldAllowAuthorization
{
  if ([(AKAuthorizationInputPaneViewController *)self _shouldPresentCreateFlow])
  {
    if (![(AKAuthorizationInputPaneViewController *)self _nameScopeAllowsAuthorization]) {
      return 0;
    }
  }
  else
  {
    if ([(AKAuthorizationInputPaneViewController *)self _hasOneLoginChoice]) {
      return 1;
    }
    char v4 = [(AKAuthorizationInputPaneViewController *)self authorizationViewController];
    int v5 = [v4 _isManagedAppleID];

    if (!v5)
    {
      BOOL v7 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
      BOOL v3 = [v7 indexOfChosenLogin] != 0x7FFFFFFFFFFFFFFFLL;

      return v3;
    }
  }

  return [(AKAuthorizationInputPaneViewController *)self _emailScopeAllowsAuthorization];
}

- (BOOL)_isValidEditingName
{
  return [(AKAuthorizationInputPaneViewController *)self _getValidEditingGivenName:0 familyName:0];
}

- (BOOL)_isUnderageUser
{
  v2 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  BOOL v3 = [v2 userInformation];
  char v4 = [v3 isUnderage];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)_paneTitleString
{
  v2 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  BOOL v3 = [v2 credentialRequestContext];
  int v4 = [v3 _isFirstPartyLogin];

  char v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  if (v4)
  {
    if (![@"AUTHORIZATION_VIEWCONTROLLER_TITLE" containsString:@"REBRAND"])
    {
      char v8 = [MEMORY[0x1E4F4F020] sharedManager];
      if ([v8 isAABrandingEnabled])
      {
        BOOL v9 = [@"AUTHORIZATION_VIEWCONTROLLER_TITLE" stringByAppendingString:@"_REBRAND"];
        BOOL v7 = [v5 localizedStringForKey:v9 value:&stru_1F1EE8138 table:@"Localizable"];
      }
      else
      {
        BOOL v7 = [v5 localizedStringForKey:@"AUTHORIZATION_VIEWCONTROLLER_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];
      }

      goto LABEL_10;
    }
    uint64_t v6 = @"AUTHORIZATION_VIEWCONTROLLER_TITLE";
  }
  else
  {
    uint64_t v6 = @"AUTHORIZATION_VIEWCONTROLLER_TITLE_MODERN";
  }
  BOOL v7 = [v5 localizedStringForKey:v6 value:&stru_1F1EE8138 table:@"Localizable"];
LABEL_10:

  return v7;
}

- (id)_localizedInfoString
{
  if ([(AKAuthorizationInputPaneViewController *)self _shouldPresentUpgradeFlow])
  {
    BOOL v3 = [(AKAuthorizationInputPaneViewController *)self _localizedUpgradeString];
  }
  else
  {
    int v4 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
    char v5 = [v4 credentialRequestContext];
    int v6 = [v5 _isSubscriptionLogin];

    if (v6)
    {
      BOOL v3 = [(AKAuthorizationInputPaneViewController *)self _localizedSubscriptionString];
    }
    else if ([(AKAuthorizationInputPaneViewController *)self _shouldPresentCreateFlow])
    {
      BOOL v3 = [(AKAuthorizationInputPaneViewController *)self _localizedAuthorizationString];
    }
    else
    {
      if ([(AKAuthorizationInputPaneViewController *)self _hasSharedAccountLoginChoices])
      {
        [(AKAuthorizationInputPaneViewController *)self _localizedSharedAccountsChoiceString];
      }
      else
      {
        [(AKAuthorizationInputPaneViewController *)self _localizedChoiceString];
      BOOL v3 = };
    }
  }

  return v3;
}

- (id)_localizedAuthorizationString
{
  BOOL v3 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  int v4 = [v3 userInformation];
  char v5 = [v4 accountName];

  int v6 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  BOOL v7 = [v6 localizedAppName];

  char v8 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  BOOL v9 = [v8 credentialRequestContext];
  BOOL v10 = [v9 _proxiedDeviceName];

  uint64_t v11 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  uint64_t v12 = [v11 credentialRequestContext];
  double v13 = [v12 _proxiedDeviceClass];

  uint64_t v14 = [v5 length];
  uint64_t v15 = [v7 length];
  v66 = v10;
  v65 = v5;
  double v16 = v13;
  if ([v10 length]) {
    BOOL v17 = [v13 length] == 0;
  }
  else {
    BOOL v17 = 1;
  }
  id v18 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  double v19 = [v18 userInformation];
  uint64_t v20 = [v19 isManagedAppleID];

  v21 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  v22 = [v21 credentialRequestContext];
  int v23 = [v22 _isFirstPartyLogin];

  if (v23 && v15 && v14)
  {
    v24 = v65;
    v25 = [(AKAuthorizationInputPaneViewController *)self _localizedFirstPartyAuthorizationStringWithAppName:v7 accountName:v65];
    v26 = v66;
    goto LABEL_42;
  }
  v27 = [(AKAuthorizationInputPaneViewController *)self _localizedAuthorizationPrefix:v20];
  if (v20)
  {
    v28 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
    id v29 = [v28 userInformation];
    v30 = [v29 managedOrganizationName];

    uint64_t v31 = [v30 length];
    if (v15) {
      char v32 = v17;
    }
    else {
      char v32 = 1;
    }
    if ((v32 & 1) == 0 && v31)
    {
      v33 = [NSString stringWithFormat:@"%@_PROXIED_FORMAT", v27];
      v34 = NSString;
      v35 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v36 = [v35 localizedStringForKey:v33 value:&stru_1F1EE8138 table:@"Localizable"];
      v26 = v66;
      v25 = objc_msgSend(v34, "stringWithFormat:", v36, v7, v16, v66, 1);

LABEL_40:
      v24 = v65;

      goto LABEL_41;
    }
    if (v15 && v31)
    {
      v45 = [NSString stringWithFormat:@"%@_APPNAME_ORGNAME_FORMAT", v27];
      v46 = NSString;
      v47 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v48 = [v47 localizedStringForKey:v45 value:&stru_1F1EE8138 table:@"Localizable"];
      objc_msgSend(v46, "stringWithFormat:", v48, v7, v30);
    }
    else
    {
      if (!v15)
      {
        v62 = _AKLogSiwa();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
          -[AKAuthorizationInputPaneViewController _localizedAuthorizationString]();
        }

        v45 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v25 = [v45 localizedStringForKey:v27 value:&stru_1F1EE8138 table:@"Localizable"];
        goto LABEL_39;
      }
      v45 = [NSString stringWithFormat:@"%@_APPNAME_FORMAT", v27];
      v59 = NSString;
      v47 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v48 = [v47 localizedStringForKey:v45 value:&stru_1F1EE8138 table:@"Localizable"];
      objc_msgSend(v59, "stringWithFormat:", v48, v7, v64);
    v25 = };

LABEL_39:
    v26 = v66;
    goto LABEL_40;
  }
  if (v14) {
    BOOL v37 = v15 == 0;
  }
  else {
    BOOL v37 = 1;
  }
  char v38 = v37;
  char v39 = v37 || v17;
  if (v39)
  {
    if (v38)
    {
      if (!v15)
      {
        if (v14)
        {
          v40 = [NSString stringWithFormat:@"%@_APPLEID_FORMAT", v27];
          v41 = NSString;
          v42 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v43 = [v42 localizedStringForKey:v40 value:&stru_1F1EE8138 table:@"Localizable"];
          v44 = v65;
          objc_msgSend(v41, "stringWithFormat:", v43, v65, v64);
          v25 = LABEL_46:;

          v24 = v44;
          v26 = v66;
          goto LABEL_41;
        }
        v63 = _AKLogSiwa();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
          -[AKAuthorizationInputPaneViewController _localizedAuthorizationString]();
        }

        v55 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v25 = [v55 localizedStringForKey:v27 value:&stru_1F1EE8138 table:@"Localizable"];
        goto LABEL_35;
      }
    }
    else
    {
      v53 = [MEMORY[0x1E4F4F020] sharedManager];
      char v54 = [v53 isAABrandingEnabled];

      if ((v54 & 1) == 0)
      {
        v40 = [NSString stringWithFormat:@"%@_FORMAT", v27];
        v61 = NSString;
        v42 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v43 = [v42 localizedStringForKey:v40 value:&stru_1F1EE8138 table:@"Localizable"];
        v44 = v65;
        objc_msgSend(v61, "stringWithFormat:", v43, v7, v65);
        goto LABEL_46;
      }
    }
    v55 = [NSString stringWithFormat:@"%@_APPNAME_FORMAT", v27];
    v56 = NSString;
    v57 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v58 = [v57 localizedStringForKey:v55 value:&stru_1F1EE8138 table:@"Localizable"];
    v25 = objc_msgSend(v56, "stringWithFormat:", v58, v7);

LABEL_35:
    v24 = v65;
    v26 = v66;
    goto LABEL_41;
  }
  v49 = [NSString stringWithFormat:@"%@_PROXIED_FORMAT", v27];
  v50 = NSString;
  v51 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v52 = [v51 localizedStringForKey:v49 value:&stru_1F1EE8138 table:@"Localizable"];
  v26 = v66;
  v25 = objc_msgSend(v50, "stringWithFormat:", v52, v7, v16, v66, v65);

  v24 = v65;
LABEL_41:

LABEL_42:

  return v25;
}

- (id)_localizedFirstPartyAuthorizationStringWithAppName:(id)a3 accountName:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  BOOL v9 = @"AUTHORIZE_APPLE_ID_1ST_PARTY_LOGIN";
  if (([@"AUTHORIZE_APPLE_ID_1ST_PARTY_LOGIN" containsString:@"REBRAND"] & 1) == 0)
  {
    BOOL v10 = [MEMORY[0x1E4F4F020] sharedManager];
    if ([v10 isAABrandingEnabled])
    {
      BOOL v9 = [@"AUTHORIZE_APPLE_ID_1ST_PARTY_LOGIN" stringByAppendingString:@"_REBRAND"];
    }
  }
  uint64_t v11 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  int v12 = [v11 signInAllowsPCSKeyAccess];

  if (v12)
  {
    double v13 = (void *)MEMORY[0x1E4F4F010];
    uint64_t v14 = @"AUTHORIZE_APPLE_ID_1ST_PARTY_LOGIN_KEY_ACCESS";
    char v15 = [@"AUTHORIZE_APPLE_ID_1ST_PARTY_LOGIN_KEY_ACCESS" containsString:@"REBRAND"];
    if (v15)
    {
      int v16 = 0;
    }
    else
    {
      int v4 = [MEMORY[0x1E4F4F020] sharedManager];
      if ([v4 isAABrandingEnabled])
      {
        uint64_t v14 = [@"AUTHORIZE_APPLE_ID_1ST_PARTY_LOGIN_KEY_ACCESS" stringByAppendingString:@"_REBRAND"];
        int v16 = 1;
      }
      else
      {
        int v16 = 0;
      }
    }
    BOOL v17 = [v13 deviceSpecificLocalizedStringWithKey:v14];

    if (v16) {
    if ((v15 & 1) == 0)
    }
  }
  else
  {
    BOOL v17 = v9;
  }
  id v18 = NSString;
  double v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v20 = [v19 localizedStringForKey:v17 value:&stru_1F1EE8138 table:@"Localizable"];
  v21 = objc_msgSend(v18, "stringWithFormat:", v20, v8, v7);

  return v21;
}

- (id)_localizedAuthorizationPrefix:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(AKAuthorizationInputPaneViewController *)self _shouldPresentCreateFlow];
  char v5 = [MEMORY[0x1E4F4F020] sharedManager];
  int v6 = [v5 isAABrandingEnabled];

  id v7 = @"AUTHORIZE_APPLE_ID_WELCOME";
  if (v6) {
    id v7 = @"AUTHORIZE_APPLE_ACCOUNT_WELCOME_BACK";
  }
  id v8 = @"AUTHORIZE_MANAGED_APPLEID_WELCOME";
  if (v6) {
    id v8 = @"AUTHORIZE_MANAGED_APPLE_ACCOUNT_WELCOME_BACK";
  }
  if (v3) {
    id v7 = v8;
  }
  BOOL v9 = @"AUTHORIZE_APPLEID_CREATE";
  if (v6) {
    BOOL v9 = @"AUTHORIZE_APPLE_ACCOUNT_CREATE";
  }
  BOOL v10 = @"AUTHORIZE_MANAGED_APPLEID_CREATE";
  if (v6) {
    BOOL v10 = @"AUTHORIZE_MANAGED_APPLE_ACCOUNT_CREATE";
  }
  if (v3) {
    BOOL v9 = v10;
  }
  if (v4) {
    return v9;
  }
  else {
    return v7;
  }
}

- (id)_localizedUpgradeString
{
  BOOL v3 = [MEMORY[0x1E4F4F020] sharedManager];
  int v4 = [v3 isAABrandingEnabled];

  char v5 = NSString;
  int v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v7 = v6;
  if (v4) {
    id v8 = @"AUTHORIZE_APPLE_ACCOUNT_UPGRADE_LOGIN";
  }
  else {
    id v8 = @"AUTHORIZE_APPLE_ID_UPGRADE_LOGIN";
  }
  BOOL v9 = [v6 localizedStringForKey:v8 value:&stru_1F1EE8138 table:@"Localizable"];
  BOOL v10 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  uint64_t v11 = [v10 localizedAppName];
  int v12 = objc_msgSend(v5, "stringWithFormat:", v9, v11);

  return v12;
}

- (id)_localizedSubscriptionString
{
  BOOL v3 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  int v4 = [v3 credentialRequestContext];
  char v5 = [v4 authorizationRequest];
  uint64_t v6 = [v5 existingStatus];

  if (v6 == 1) {
    id v7 = @"AUTHORIZE_APPLE_ID_WELCOME_SUBSCRIPTION";
  }
  else {
    id v7 = @"AUTHORIZE_APPLEID_CREATE_SUBSCRIPTION";
  }
  id v8 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  BOOL v9 = [v8 localizedAppName];

  if ([v9 length])
  {
    id v7 = [NSString stringWithFormat:@"%@_APPNAME_FORMAT", v7];
    BOOL v10 = NSString;
    uint64_t v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int v12 = [v11 localizedStringForKey:v7 value:&stru_1F1EE8138 table:@"Localizable"];
    double v13 = objc_msgSend(v10, "stringWithFormat:", v12, v9);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v13 = [v11 localizedStringForKey:v7 value:&stru_1F1EE8138 table:@"Localizable"];
  }

  return v13;
}

- (id)_localizedSharedAccountsChoiceString
{
  BOOL v3 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  int v4 = [v3 localizedAppName];

  char v5 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  int v6 = [v5 hasCreateAccountLoginChoice];

  id v7 = NSString;
  id v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v9 = v8;
  if (v6) {
    BOOL v10 = @"AUTHORIZE_CREATE_ACCOUNT_OR_SHARED_ACCOUNT_MESSAGE";
  }
  else {
    BOOL v10 = @"AUTHORIZE_EXISTING_ACCOUNT_OR_SHARED_ACCOUNT_MESSAGE";
  }
  uint64_t v11 = [v8 localizedStringForKey:v10 value:&stru_1F1EE8138 table:@"Localizable"];
  int v12 = objc_msgSend(v7, "stringWithFormat:", v11, v4);

  return v12;
}

- (id)_localizedChoiceString
{
  BOOL v3 = NSString;
  int v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v5 = [v4 localizedStringForKey:@"AUTHORIZE_APPLE_ACCOUNT_WELCOME_BACK_APPNAME_FORMAT" value:&stru_1F1EE8138 table:@"Localizable"];
  int v6 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  id v7 = [v6 localizedAppName];
  id v8 = objc_msgSend(v3, "stringWithFormat:", v5, v7);

  return v8;
}

- (id)_localizedNameKey
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"AUTHORIZE_FULL_NAME" value:&stru_1F1EE8138 table:@"Localizable"];

  return v3;
}

- (id)_localizedEmailKey
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"AUTHORIZE_EMAIL_CONTACT" value:&stru_1F1EE8138 table:@"Localizable"];

  return v3;
}

- (id)_defaultSharedEmail
{
  BOOL v3 = [(AKAuthorizationInputPaneViewController *)self authorizationViewController];
  int v4 = [v3 _isManagedAppleID];

  char v5 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
  int v6 = v5;
  if (v4
    || (uint64_t v7 = [v5 indexOfChosenEmail],
        v6,
        [(AKAuthorizationInputPaneViewController *)self editableScopeChoices],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v6 = v8,
        v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v9 = [v6 chosenEmail];
  }
  else
  {
    uint64_t v9 = [v8 emailAtIndex:0];
  }
  BOOL v10 = (void *)v9;

  return v10;
}

- (id)_selectedLoginChoice
{
  if ([(AKAuthorizationInputPaneViewController *)self _shouldPresentCreateFlow]
    || ([(AKAuthorizationInputPaneViewController *)self editableScopeChoices],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 indexOfChosenLogin],
        v3,
        v4 == 0x7FFFFFFFFFFFFFFFLL))
  {
    char v5 = 0;
  }
  else
  {
    int v6 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
    uint64_t v7 = [v6 loginChoices];
    id v8 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
    char v5 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v8, "indexOfChosenLogin"));
  }

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(AKAuthorizationInputPaneViewController *)self isEditingName]) {
    return 1;
  }
  char v5 = [MEMORY[0x1E4F4F020] sharedManager];
  int v6 = [v5 isSiwaCredentialSharingEnabled];

  if (v6)
  {
    if (![(AKAuthorizationInputPaneViewController *)self _shouldPresentUpgradeFlow])
    {
      uint64_t v7 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
      id v8 = [v7 loginChoices];
      uint64_t v9 = [v8 count];

      if (v9) {
        return 1;
      }
      goto LABEL_10;
    }
    return 0;
  }
  if ([(AKAuthorizationInputPaneViewController *)self _hasOneLoginChoice])
  {
    BOOL v10 = [(AKAuthorizationInputPaneViewController *)self _firstLoginChoice];
    char v11 = [v10 isAppleIDAuthorization];

    if (v11) {
      return 0;
    }
  }
LABEL_10:
  validatedScopes = self->_validatedScopes;

  return [(NSArray *)validatedScopes count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int v6 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  uint64_t v7 = [v6 loginChoices];
  int64_t v8 = [v7 count];

  if ([(AKAuthorizationInputPaneViewController *)self isEditingName]) {
    return 2;
  }
  if ([(AKAuthorizationInputPaneViewController *)self _shouldPresentCreateFlow])
  {
    BOOL v10 = [(NSArray *)self->_validatedScopes objectAtIndexedSubscript:a4];
    int64_t v11 = [(AKAuthorizationInputPaneViewController *)self _numberOfRowsInScope:v10];

    return v11;
  }
  else if (v8 <= 1)
  {
    return 1;
  }
  else
  {
    return v8;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 section];
  uint64_t v7 = [v5 row];
  if (![(AKAuthorizationInputPaneViewController *)self isEditingName])
  {
    if ([(AKAuthorizationInputPaneViewController *)self _shouldPresentCreateFlow])
    {
      uint64_t v9 = [(NSArray *)self->_validatedScopes objectAtIndexedSubscript:v6];
      BOOL v10 = -[AKAuthorizationInputPaneViewController _cellForScope:localRow:](self, "_cellForScope:localRow:", v9, [v5 row]);

      goto LABEL_11;
    }
    int64_t v11 = [MEMORY[0x1E4F4F020] sharedManager];
    if ([v11 isSiwaCredentialSharingEnabled])
    {
      BOOL v12 = [(AKAuthorizationInputPaneViewController *)self _shouldPresentUpgradeFlow];

      if (!v12)
      {
        uint64_t v8 = [(AKAuthorizationInputPaneViewController *)self _loginChoiceTableViewCellForRow:v7];
        goto LABEL_10;
      }
    }
    else
    {
    }
    uint64_t v8 = [(AKAuthorizationInputPaneViewController *)self _loginChoiceCellForRow:v7];
    goto LABEL_10;
  }
  uint64_t v8 = [(AKAuthorizationInputPaneViewController *)self _editingNameCellForRow:v7];
LABEL_10:
  BOOL v10 = (void *)v8;
LABEL_11:

  return v10;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return ![(AKAuthorizationInputPaneViewController *)self isEditingName];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  unint64_t v9 = [v7 row];
  if (![(AKAuthorizationInputPaneViewController *)self _shouldPresentCreateFlow])
  {
    int64_t v11 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
    BOOL v12 = [v11 loginChoices];
    unint64_t v13 = [v12 count];

    if (v9 >= v13)
    {
      BOOL v10 = _AKLogSiwa();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[AKAuthorizationInputPaneViewController tableView:didSelectRowAtIndexPath:](v7, self);
      }
      goto LABEL_16;
    }
    uint64_t v14 = [MEMORY[0x1E4F4F020] sharedManager];
    if ([v14 isSiwaCredentialSharingEnabled])
    {
      BOOL v15 = [(AKAuthorizationInputPaneViewController *)self _hasSharedAccountLoginChoices];

      if (v15)
      {
        int v16 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
        uint64_t v17 = [v16 indexOfChosenLogin];

        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v18 = (void *)MEMORY[0x1E4F28D58];
          double v19 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
          uint64_t v20 = objc_msgSend(v18, "indexPathForRow:inSection:", objc_msgSend(v19, "indexOfChosenLogin"), 0);

          v21 = [v6 cellForRowAtIndexPath:v20];
          [v21 setChecked:0];
        }
        v22 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
        int v23 = [v22 loginChoices];
        unint64_t v24 = [v23 count];

        if (v24 >= 2) {
          [(AKAuthorizationInputPaneViewController *)self _selectLoginChoiceCell:v7];
        }
        v25 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
        if ([v25 hasCreateAccountLoginChoice])
        {
          v26 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
          v27 = [v26 loginChoices];
          v28 = [v27 objectAtIndex:v9];
          int v29 = [v28 shouldCreateAppleID];

          if (v29)
          {
            v30 = [(AKAuthorizationInputPaneViewController *)self confirmButton];
            [v30 switchToAccountCreation];
LABEL_25:

LABEL_26:
            [(AKAuthorizationInputPaneViewController *)self _enableOrDisableConfirmButton];
            goto LABEL_27;
          }
        }
        else
        {
        }
        v30 = [(AKAuthorizationInputPaneViewController *)self confirmButton];
        [v30 resetToDefault];
        goto LABEL_25;
      }
    }
    else
    {
    }
    uint64_t v31 = _AKLogSiwa();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      -[AKAuthorizationInputPaneViewController tableView:didSelectRowAtIndexPath:](v7, v31);
    }

    char v32 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
    uint64_t v33 = [v32 indexOfChosenLogin];

    if (v33 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v34 = (void *)MEMORY[0x1E4F28D58];
      v35 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
      v36 = objc_msgSend(v34, "indexPathForRow:inSection:", objc_msgSend(v35, "indexOfChosenLogin"), 0);

      BOOL v37 = [v6 cellForRowAtIndexPath:v36];
      [v37 setAccessoryType:0];
    }
    char v38 = [v6 cellForRowAtIndexPath:v7];
    [v38 setAccessoryType:3];

    char v39 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
    [v39 setIndexOfChosenLogin:v9];

    goto LABEL_26;
  }
  if (![(AKAuthorizationInputPaneViewController *)self isEditingName])
  {
    BOOL v10 = [(NSArray *)self->_validatedScopes objectAtIndexedSubscript:v8];
    -[AKAuthorizationInputPaneViewController _selectScope:localRow:](self, "_selectScope:localRow:", v10, [v7 row]);
    [v6 deselectRowAtIndexPath:v7 animated:1];
LABEL_16:
  }
LABEL_27:
}

- (id)_loginChoiceTableViewCellForRow:(unint64_t)a3
{
  id v5 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  id v6 = [v5 loginChoices];
  id v7 = [v6 objectAtIndex:a3];

  uint64_t v8 = [[AKAuthorizationLoginChoiceTableViewCell alloc] initWithLoginChoice:v7 reuseIdentifier:@"AKAuthorizationLoginChoiceCell"];
  [(AKAuthorizationLoginChoiceTableViewCell *)v8 setAccessibilityIdentifier:@"SIWA_ACCOUNT_CELL"];
  +[AKAuthorizationPaneMetrics nameCellHeight];
  -[AKAuthorizationScopeDetailTableViewCell setMinimumHeight:](v8, "setMinimumHeight:");
  if (([v7 isAppleIDAuthorization] & 1) == 0)
  {
    unint64_t v9 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
    BOOL v10 = +[AKIcon iconWithPresentationContext:v9];
    int64_t v11 = [v10 automaskedImage];
    [(AKAuthorizationLoginChoiceTableViewCell *)v8 setIconImage:v11];
  }
  BOOL v12 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  unint64_t v13 = [v12 loginChoices];
  uint64_t v14 = [v13 count];

  if (v14 == 1)
  {
    [(AKAuthorizationScopeDetailTableViewCell *)v8 setCheckmarkStyle:0];
    [(AKAuthorizationLoginChoiceTableViewCell *)v8 setSelectionStyle:0];
  }
  else
  {
    [(AKAuthorizationScopeDetailTableViewCell *)v8 setCheckmarkStyle:2];
  }
  BOOL v15 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
  -[AKAuthorizationScopeDetailTableViewCell setChecked:](v8, "setChecked:", [v15 indexOfChosenLogin] == a3);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v7;
    uint64_t v17 = [v16 sharedAccount];
    id v18 = [v17 shareInfo];
    double v19 = [v18 participantHandle];

    uint64_t v20 = [(AKAuthorizationLoginChoiceTableViewCell *)v8 sharedIconImageView];
    v21 = [v16 sharedAccount];

    v22 = [v21 shareInfo];
    objc_msgSend(v20, "setHidden:", objc_msgSend(v22, "isCurrentUser"));

    +[AKAuthorizationSubPaneMetrics scopeImageViewSize];
    int v23 = +[AKSignInWithAppleAvatarManager avatarImageForUserHandle:diameter:](AKSignInWithAppleAvatarManager, "avatarImageForUserHandle:diameter:", v19);
    [(AKAuthorizationScopeDetailTableViewCell *)v8 setScopeImage:v23];
  }
  else
  {
    unint64_t v24 = [(AKAuthorizationLoginChoiceTableViewCell *)v8 sharedIconImageView];
    [v24 setHidden:1];

    +[AKAuthorizationSubPaneMetrics scopeImageViewSize];
    double v19 = +[AKSignInWithAppleAvatarManager avatarImageForPrimaryAccountOwnerWithDiameter:](AKSignInWithAppleAvatarManager, "avatarImageForPrimaryAccountOwnerWithDiameter:");
    [(AKAuthorizationScopeDetailTableViewCell *)v8 setScopeImage:v19];
  }

  return v8;
}

- (void)_selectLoginChoiceCell:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAuthorizationPaneViewController *)self tableView];
  [v5 selectRowAtIndexPath:v4 animated:1 scrollPosition:1];

  id v6 = [(AKAuthorizationPaneViewController *)self tableView];
  id v10 = [v6 cellForRowAtIndexPath:v4];

  [v10 setChecked:1];
  uint64_t v7 = [v4 row];
  uint64_t v8 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
  [v8 setIndexOfChosenLogin:v7];

  unint64_t v9 = [(AKAuthorizationPaneViewController *)self tableView];
  [v9 deselectRowAtIndexPath:v4 animated:1];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 tag];
  uint64_t v6 = [v4 returnKeyType];
  if (v6 == 9)
  {
    [(AKAuthorizationInputPaneViewController *)self _nameEditDone];
    goto LABEL_5;
  }
  if (v6 == 4)
  {
    [(AKAuthorizationInputPaneViewController *)self _beginEditingRow:v5 + 1];
LABEL_5:
    BOOL v7 = 1;
    goto LABEL_9;
  }
  uint64_t v8 = _AKLogSiwa();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[AKAuthorizationInputPaneViewController textFieldShouldReturn:](v4);
  }

  BOOL v7 = 0;
LABEL_9:

  return v7;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  id v10 = a3;
  int64_t v11 = [v10 text];
  BOOL v12 = objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", location, length, v9);

  uint64_t v13 = [v9 length];
  v23[0] = v13 + location;
  v23[1] = 0;
  uint64_t v14 = [(AKAuthorizationInputPaneViewController *)self nameFormatter];

  if (!v14)
  {
    BOOL v15 = objc_alloc_init(AKAuthorizationNameFormatter);
    nameFormatter = self->_nameFormatter;
    self->_nameFormatter = v15;
  }
  uint64_t v17 = [(AKAuthorizationInputPaneViewController *)self nameFormatter];
  id v22 = v12;
  id v18 = [v10 text];

  char v19 = objc_msgSend(v17, "isPartialStringValid:proposedSelectedRange:originalString:originalSelectedRange:errorDescription:", &v22, v23, v18, location, length, 0);
  id v20 = v22;

  return v19;
}

- (id)_cellForScope:(id)a3 localRow:(int64_t)a4
{
  id v6 = a3;
  if ([v6 isEqualToString:*MEMORY[0x1E4F4EE20]])
  {
    uint64_t v7 = [(AKAuthorizationInputPaneViewController *)self _nameCell];
LABEL_5:
    uint64_t v8 = (void *)v7;
    goto LABEL_9;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F4EE18]])
  {
    uint64_t v7 = [(AKAuthorizationInputPaneViewController *)self _emailCellForLocalRow:a4];
    goto LABEL_5;
  }
  id v9 = _AKLogSiwa();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[AKAuthorizationInputPaneViewController _cellForScope:localRow:]();
  }

  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (id)_nameCell
{
  BOOL v3 = [(AKAuthorizationPaneViewController *)self tableView];
  id v4 = [v3 dequeueReusableCellWithIdentifier:@"AKAuthorizationScopeDetailTableViewCell-Name"];

  [v4 setAccessibilityIdentifier:@"SIWA_NAME_SCOPE_CELL"];
  +[AKAuthorizationPaneMetrics nameCellHeight];
  objc_msgSend(v4, "setMinimumHeight:");
  uint64_t v5 = [MEMORY[0x1E4F4F020] sharedManager];
  int v6 = [v5 isLisbonAvailable];

  if (v6)
  {
    uint64_t v7 = [v4 scopeLabel];
    [v7 setText:0];

    uint64_t v8 = [(AKAuthorizationInputPaneViewController *)self _localizedNameKey];
    id v9 = [v4 mainLabel];
    [v9 setText:v8];

    id v10 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
    int64_t v11 = [v10 localizedName];
    BOOL v12 = [v4 mainDetailLabel];
    [v12 setText:v11];

    uint64_t v13 = [MEMORY[0x1E4F42A80] systemImageNamed:@"person.fill"];
    [v4 setScopeImage:v13];
  }
  else
  {
    uint64_t v14 = [(AKAuthorizationInputPaneViewController *)self _localizedNameKey];
    BOOL v15 = [v14 localizedUppercaseString];
    id v16 = [v4 scopeLabel];
    [v16 setText:v15];

    uint64_t v17 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
    id v18 = [v17 localizedName];
    char v19 = [v4 mainLabel];
    [v19 setText:v18];

    uint64_t v13 = [v4 mainDetailLabel];
    [v13 setText:0];
  }

  id v20 = [(AKAuthorizationInputPaneViewController *)self authorizationViewController];
  int v21 = [v20 _isManagedAppleID];

  if (v21)
  {
    id v22 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
    int v23 = [v22 localizedName];
    unint64_t v24 = [v4 mainLabel];
    [v24 setText:v23];

    v25 = [(AKAuthorizationInputPaneViewController *)self _nameCellDetailLabelTextForManagedAppleID];
    v26 = [v4 mainDetailLabel];
    [v26 setText:v25];
  }
  else
  {
    v25 = [(AKAuthorizationInputPaneViewController *)self _clearButton];
    [v4 setAccessoryView:v25];
  }

  return v4;
}

- (id)_emailCellForLocalRow:(int64_t)a3
{
  if ([(AKAuthorizationInputPaneViewController *)self _isUnderageUser])
  {
    uint64_t v5 = [MEMORY[0x1E4F4F020] sharedManager];
    int v6 = [v5 isTiburonU13Enabled];

    if (v6) {
      goto LABEL_5;
    }
  }
  if (a3)
  {
    if ([(AKAuthorizationInputPaneViewController *)self _numberOfRowsInScope:*MEMORY[0x1E4F4EE18]]- 1 == a3)
    {
LABEL_5:
      uint64_t v7 = [(AKAuthorizationInputPaneViewController *)self _hideMyEmailCell];
      goto LABEL_8;
    }
    uint64_t v7 = [(AKAuthorizationInputPaneViewController *)self _singleEmailCellForIndex:a3 - 1];
  }
  else
  {
    uint64_t v7 = [(AKAuthorizationInputPaneViewController *)self _shareMyEmailCell];
  }
LABEL_8:

  return v7;
}

- (id)_shareMyEmailCell
{
  BOOL v3 = [(AKAuthorizationPaneViewController *)self tableView];
  id v4 = [v3 dequeueReusableCellWithIdentifier:@"AKAuthorizationScopeDetailTableViewCell-Email-Summary"];

  [v4 setAccessibilityIdentifier:@"SIWA_SHARE_MY_EMAIL_SCOPE_CELL"];
  uint64_t v5 = [(AKAuthorizationInputPaneViewController *)self authorizationViewController];
  int v6 = [v5 _isManagedAppleID];

  if (v6)
  {
    uint64_t v7 = [(AKAuthorizationInputPaneViewController *)self _defaultSharedEmail];
    uint64_t v8 = [v4 mainLabel];
    [v8 setText:v7];

    id v9 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
    id v10 = [v9 userInformation];
    int64_t v11 = [v10 managedOrganizationName];
    BOOL v12 = [v4 mainDetailLabel];
    [v12 setText:v11];

    [v4 setCheckmarkStyle:0];
    uint64_t v13 = [MEMORY[0x1E4F42A80] systemImageNamed:@"envelope.fill"];
    [v4 setScopeImage:v13];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v15 = [v14 localizedStringForKey:@"AUTHORIZE_SHARE_MY_EMAIL" value:&stru_1F1EE8138 table:@"Localizable"];
    id v16 = [v4 mainLabel];
    [v16 setText:v15];

    uint64_t v17 = [(AKAuthorizationInputPaneViewController *)self _defaultSharedEmail];
    id v18 = [v4 mainDetailLabel];
    [v18 setText:v17];

    [v4 setCheckmarkStyle:2];
    char v19 = [MEMORY[0x1E4F42A80] systemImageNamed:@"envelope.fill"];
    [v4 setScopeImage:v19];

    uint64_t v13 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
    if ([v13 wantsPrivateEmail])
    {
      [v4 setChecked:0];
    }
    else
    {
      id v20 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
      objc_msgSend(v4, "setChecked:", objc_msgSend(v20, "indexOfChosenEmail") != 0x7FFFFFFFFFFFFFFFLL);
    }
  }

  +[AKAuthorizationPaneMetrics emailCellHeight];
  objc_msgSend(v4, "setMinimumHeight:");
  [v4 _setSeparatorIndentToMainLabel];

  return v4;
}

- (id)_hideMyEmailCell
{
  BOOL v3 = [(AKAuthorizationPaneViewController *)self tableView];
  id v4 = [v3 dequeueReusableCellWithIdentifier:@"AKAuthorizationScopeDetailTableViewCell-Email-Summary"];

  [v4 setAccessibilityIdentifier:@"SIWA_HIDE_MY_EMAIL_SCOPE_CELL"];
  +[AKAuthorizationPaneMetrics emailCellHeight];
  objc_msgSend(v4, "setMinimumHeight:");
  uint64_t v5 = [v4 scopeLabel];
  [v5 setText:&stru_1F1EE8138];

  [v4 setScopeImage:0];
  int v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"AUTHORIZE_HIDE_MY_EMAIL" value:&stru_1F1EE8138 table:@"Localizable"];
  uint64_t v8 = [v4 mainLabel];
  [v8 setText:v7];

  id v9 = NSString;
  id v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int64_t v11 = [v10 localizedStringForKey:@"AUTHORIZE_FORWARD_TO_FORMAT" value:&stru_1F1EE8138 table:@"Localizable"];
  BOOL v12 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
  uint64_t v13 = [v12 forwardingEmail];
  uint64_t v14 = objc_msgSend(v9, "stringWithFormat:", v11, v13);
  BOOL v15 = [v4 mainDetailLabel];
  [v15 setText:v14];

  [v4 setCheckmarkStyle:2];
  id v16 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
  objc_msgSend(v4, "setChecked:", objc_msgSend(v16, "wantsPrivateEmail"));

  [v4 _setSeparatorIndentToMainLabel];
  if ([(AKAuthorizationInputPaneViewController *)self _isUnderageUser])
  {
    uint64_t v17 = [MEMORY[0x1E4F4F020] sharedManager];
    int v18 = [v17 isTiburonU13Enabled];

    if (v18)
    {
      char v19 = [MEMORY[0x1E4F42A80] systemImageNamed:@"envelope.fill"];
      [v4 setScopeImage:v19];
    }
  }

  return v4;
}

- (id)_editingNameCellForRow:(unint64_t)a3
{
  uint64_t v5 = [(AKAuthorizationPaneViewController *)self tableView];
  int v6 = [v5 dequeueReusableCellWithIdentifier:@"AKAuthorizationScopeEditTableViewCell-Name"];

  uint64_t v7 = [v6 detailTextField];
  [v7 setDelegate:self];

  uint64_t v8 = [v6 detailTextField];
  [v8 setTag:a3];

  if (self->_editingGivenNameIndex == a3)
  {
    [(AKAuthorizationInputPaneViewController *)self _setupGivenNameCell:v6];
  }
  else if (self->_editingFamilyNameIndex == a3)
  {
    [(AKAuthorizationInputPaneViewController *)self _setupFamilyNameCell:v6];
  }
  else
  {
    id v9 = _AKLogSiwa();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AKAuthorizationInputPaneViewController _editingNameCellForRow:](a3);
    }
  }

  return v6;
}

- (void)_setupGivenNameCell:(id)a3
{
  id v4 = a3;
  id v19 = +[AKAuthorizationScopeChoices localizedGivenNameLabel];
  uint64_t v5 = [MEMORY[0x1E4F4F020] sharedManager];
  char v6 = [v5 isLisbonAvailable];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [v19 localizedUppercaseString];

    id v19 = (id)v7;
  }
  uint64_t v8 = [v4 textLabel];
  [v8 setText:v19];

  id v9 = +[AKAuthorizationScopeChoices localizedGivenNameLabel];
  id v10 = [v4 detailTextField];
  [v10 setAccessibilityIdentifier:v9];

  int64_t v11 = [(AKAuthorizationInputPaneViewController *)self editingUserInformation];
  BOOL v12 = [v11 givenName];
  uint64_t v13 = [v4 detailTextField];
  [v13 setText:v12];

  uint64_t v14 = *MEMORY[0x1E4F43D80];
  BOOL v15 = [v4 detailTextField];
  [v15 setTextContentType:v14];

  id v16 = [v4 detailTextField];
  [v16 setReturnKeyType:4];

  uint64_t v17 = [v4 detailTextField];
  [v17 removeTarget:self action:0 forControlEvents:0x20000];

  int v18 = [v4 detailTextField];

  [v18 addTarget:self action:sel__setGivenNameFromTextField_ forControlEvents:0x20000];
}

- (void)_setupFamilyNameCell:(id)a3
{
  id v4 = a3;
  id v19 = +[AKAuthorizationScopeChoices localizedFamilyNameLabel];
  uint64_t v5 = [MEMORY[0x1E4F4F020] sharedManager];
  char v6 = [v5 isLisbonAvailable];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [v19 localizedUppercaseString];

    id v19 = (id)v7;
  }
  uint64_t v8 = [v4 textLabel];
  [v8 setText:v19];

  id v9 = +[AKAuthorizationScopeChoices localizedFamilyNameLabel];
  id v10 = [v4 detailTextField];
  [v10 setAccessibilityIdentifier:v9];

  int64_t v11 = [(AKAuthorizationInputPaneViewController *)self editingUserInformation];
  BOOL v12 = [v11 familyName];
  uint64_t v13 = [v4 detailTextField];
  [v13 setText:v12];

  uint64_t v14 = *MEMORY[0x1E4F43D68];
  BOOL v15 = [v4 detailTextField];
  [v15 setTextContentType:v14];

  id v16 = [v4 detailTextField];
  [v16 setReturnKeyType:9];

  uint64_t v17 = [v4 detailTextField];
  [v17 removeTarget:self action:0 forControlEvents:0x20000];

  int v18 = [v4 detailTextField];

  [v18 addTarget:self action:sel__setFamilyNameFromTextField_ forControlEvents:0x20000];
}

- (id)_loginChoiceCellForRow:(unint64_t)a3
{
  uint64_t v5 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  char v6 = [v5 loginChoices];
  unint64_t v7 = [v6 count];

  if (v7 > a3)
  {
    uint64_t v8 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
    id v9 = [v8 loginChoices];
    id v10 = [v9 objectAtIndex:a3];

    int64_t v11 = [[AKAuthorizationLoginChoiceCell alloc] initWithLoginChoice:v10 reuseIdentifier:@"AKAuthorizationLoginChoiceCell"];
    if (([v10 isAppleIDAuthorization] & 1) == 0)
    {
      BOOL v12 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
      uint64_t v13 = +[AKIcon iconWithPresentationContext:v12];
      uint64_t v14 = [v13 automaskedImage];
      [(AKAuthorizationLoginChoiceCell *)v11 setIconImage:v14];
    }
    BOOL v15 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
    if ([v15 indexOfChosenLogin] == a3)
    {
    }
    else
    {
      uint64_t v17 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
      int v18 = [v17 loginChoices];
      uint64_t v19 = [v18 count];

      if (v19 != 1)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    [(AKAuthorizationLoginChoiceCell *)v11 setAccessoryType:3];
    goto LABEL_11;
  }
  id v16 = _AKLogSiwa();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[AKAuthorizationInputPaneViewController _loginChoiceCellForRow:](self);
  }

  int64_t v11 = 0;
LABEL_12:

  return v11;
}

- (int64_t)_numberOfRowsInValidatedScopes
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  validatedScopes = self->_validatedScopes;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__AKAuthorizationInputPaneViewController__numberOfRowsInValidatedScopes__block_invoke;
  v5[3] = &unk_1E648F848;
  v5[4] = self;
  v5[5] = &v6;
  [(NSArray *)validatedScopes enumerateObjectsUsingBlock:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __72__AKAuthorizationInputPaneViewController__numberOfRowsInValidatedScopes__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _numberOfRowsInScope:a2];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
  return result;
}

- (unint64_t)_numberOfRowsInScope:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x1E4F4EE20]]) {
    goto LABEL_2;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F4EE18]])
  {
    uint64_t v6 = [(AKAuthorizationInputPaneViewController *)self authorizationViewController];
    int v7 = [v6 _isManagedAppleID];

    if (v7)
    {
      uint64_t v8 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
      uint64_t v9 = [v8 userInformation];
      id v10 = [v9 sharedEmailForManagedAppleID];
      unint64_t v5 = [v10 length] != 0;
    }
    else
    {
      if ([(AKAuthorizationInputPaneViewController *)self _isUnderageUser])
      {
        BOOL v12 = [MEMORY[0x1E4F4F020] sharedManager];
        char v13 = [v12 isTiburonU13Enabled];

        if (v13)
        {
LABEL_2:
          unint64_t v5 = 1;
          goto LABEL_15;
        }
      }
      if (![(AKAuthorizationInputPaneViewController *)self isEmailExpanded])
      {
        unint64_t v5 = 2;
        goto LABEL_15;
      }
      uint64_t v8 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
      unint64_t v5 = [v8 emailCount] + 2;
    }

    goto LABEL_15;
  }
  int64_t v11 = _AKLogSiwa();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[AKAuthorizationInputPaneViewController _cellForScope:localRow:]();
  }

  unint64_t v5 = 0;
LABEL_15:

  return v5;
}

- (id)_singleEmailCellForIndex:(int64_t)a3
{
  unint64_t v5 = [(AKAuthorizationPaneViewController *)self tableView];
  uint64_t v6 = [v5 dequeueReusableCellWithIdentifier:@"AKAuthorizationScopeDetailTableViewCell-Email-Single"];

  [v6 setAccessibilityIdentifier:@"SIWA_SINGLE_EMAIL_SCOPE_CELL"];
  +[AKAuthorizationPaneMetrics selectEmailCellHeight];
  objc_msgSend(v6, "setMinimumHeight:");
  int v7 = [v6 scopeLabel];
  [v7 setText:&stru_1F1EE8138];

  uint64_t v8 = [v6 mainLabel];
  uint64_t v9 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
  id v10 = [v9 emailAtIndex:a3];
  [v8 setText:v10];

  int64_t v11 = +[AKAuthorizationAppearance scopeSelectionTitleFont];
  BOOL v12 = [v6 mainLabel];
  [v12 setFont:v11];

  char v13 = [v6 mainDetailLabel];
  [v13 setText:0];

  uint64_t v14 = [(AKAuthorizationInputPaneViewController *)self authorizationViewController];
  LODWORD(v12) = [v14 _isManagedAppleID];

  if (v12)
  {
    [v6 setCheckmarkStyle:0];
  }
  else
  {
    [v6 setCheckmarkStyle:1];
    BOOL v15 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
    if ([v15 wantsPrivateEmail])
    {
      [v6 setChecked:0];
    }
    else
    {
      id v16 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
      objc_msgSend(v6, "setChecked:", objc_msgSend(v16, "indexOfChosenEmail") == a3);
    }
  }
  [v6 _setSeparatorIndentToMainLabel];

  return v6;
}

- (void)_selectRow:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v5 = self->_validatedScopes;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      uint64_t v9 = 0;
      int64_t v10 = a3;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        int64_t v12 = -[AKAuthorizationInputPaneViewController _numberOfRowsInScope:](self, "_numberOfRowsInScope:", v11, (void)v13);
        a3 = v10 - v12;
        if (v10 < v12)
        {
          [(AKAuthorizationInputPaneViewController *)self _selectScope:v11 localRow:v10];
          goto LABEL_11;
        }
        ++v9;
        v10 -= v12;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)_selectScope:(id)a3 localRow:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F4EE20];
  if ([v6 isEqualToString:*MEMORY[0x1E4F4EE20]])
  {
    [(AKAuthorizationInputPaneViewController *)self _didSelectEditScope:v7 options:MEMORY[0x1E4F1CC08]];
  }
  else if ([v6 isEqualToString:*MEMORY[0x1E4F4EE18]])
  {
    [(AKAuthorizationInputPaneViewController *)self _selectEmailLocalRow:a4];
  }
  else
  {
    uint64_t v8 = _AKLogSiwa();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AKAuthorizationInputPaneViewController _selectScope:localRow:]();
    }
  }
}

- (void)_selectEmailLocalRow:(int64_t)a3
{
  if (a3)
  {
    if ([(AKAuthorizationInputPaneViewController *)self _numberOfRowsInScope:*MEMORY[0x1E4F4EE18]]- 1 == a3)
    {
      [(AKAuthorizationInputPaneViewController *)self _selectHideMyEmail];
    }
    else
    {
      [(AKAuthorizationInputPaneViewController *)self _selectSingleEmailAtIndex:a3 - 1];
    }
  }
  else
  {
    [(AKAuthorizationInputPaneViewController *)self _selectShareMyEmail];
  }
}

- (void)_selectSingleEmailAtIndex:(int64_t)a3
{
  if (a3 < 0
    || ([(AKAuthorizationInputPaneViewController *)self editableScopeChoices],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int64_t v6 = [v5 emailCount],
        v5,
        v6 <= a3))
  {
    uint64_t v9 = _AKLogSiwa();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AKAuthorizationInputPaneViewController _selectSingleEmailAtIndex:](a3, self);
    }
  }
  else
  {
    uint64_t v7 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
    [v7 setWantsPrivateEmail:0];

    uint64_t v8 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
    [v8 setIndexOfChosenEmail:a3];

    [(AKAuthorizationInputPaneViewController *)self setEditableScopeChoicesChanged:1];
    [(AKAuthorizationInputPaneViewController *)self _enableOrDisableConfirmButton];
    [(AKAuthorizationInputPaneViewController *)self setEmailExpanded:0 animated:1];
  }
}

- (void)_selectLoginChoiceCell
{
  if (![(AKAuthorizationInputPaneViewController *)self _shouldPresentCreateFlow]
    && ![(AKAuthorizationInputPaneViewController *)self _hasOneLoginChoice])
  {
    int64_t v3 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
    uint64_t v4 = [v3 indexOfChosenLogin];

    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = [(AKAuthorizationPaneViewController *)self tableView];
      unint64_t v5 = (void *)MEMORY[0x1E4F28D58];
      int64_t v6 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
      uint64_t v7 = objc_msgSend(v5, "indexPathForRow:inSection:", objc_msgSend(v6, "indexOfChosenLogin"), 0);
      [v8 selectRowAtIndexPath:v7 animated:1 scrollPosition:1];
    }
  }
}

- (BOOL)isEmailExpanded
{
  return self->_isEmailExpanded;
}

- (void)setEmailExpanded:(BOOL)a3
{
}

- (void)setEmailExpanded:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_isEmailExpanded != a3)
  {
    self->_isEmailExpanded = a3;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __68__AKAuthorizationInputPaneViewController_setEmailExpanded_animated___block_invoke;
    v4[3] = &unk_1E648F870;
    void v4[4] = self;
    BOOL v5 = a3;
    [(AKAuthorizationInputPaneViewController *)self _reloadDataAnimated:a4 heightChange:v4];
  }
}

void __68__AKAuthorizationInputPaneViewController_setEmailExpanded_animated___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  if (![v2 userInterfaceIdiom])
  {

    goto LABEL_5;
  }
  int64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 0.0;
  if (v4 == 6)
  {
LABEL_5:
    int64_t v6 = objc_msgSend(*(id *)(a1 + 32), "editableScopeChoices", v5);
    [v6 emailCount];
    +[AKAuthorizationPaneMetrics selectEmailCellHeight];
  }
}

- (void)_transitionToEditingNameAnimated:(BOOL)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__AKAuthorizationInputPaneViewController__transitionToEditingNameAnimated___block_invoke;
  v4[3] = &unk_1E648F898;
  void v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __75__AKAuthorizationInputPaneViewController__transitionToEditingNameAnimated___block_invoke_2;
  v3[3] = &unk_1E648EF28;
  v3[4] = self;
  [(AKAuthorizationInputPaneViewController *)self _reloadDataAnimated:a3 heightChange:v4 animation:v3];
}

double __75__AKAuthorizationInputPaneViewController__transitionToEditingNameAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _computeNameEditHeightChange];
  *(void *)(*(void *)(a1 + 32) + 1096) = v2;
  return *(double *)(*(void *)(a1 + 32) + 1096);
}

uint64_t __75__AKAuthorizationInputPaneViewController__transitionToEditingNameAnimated___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) navigationItem];
  int64_t v3 = [v2 rightBarButtonItem];
  [*(id *)(a1 + 32) setSavedRightBarButtonItem:v3];

  uint64_t v4 = [*(id *)(a1 + 32) navigationItem];
  double v5 = [v4 leftBarButtonItem];
  [*(id *)(a1 + 32) setSavedLeftBarButtonItem:v5];

  int64_t v6 = [*(id *)(a1 + 32) _doneBarButtonItem];
  uint64_t v7 = [*(id *)(a1 + 32) navigationItem];
  [v7 setRightBarButtonItem:v6];

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithTitle:&stru_1F1EE8138 style:0 target:*(void *)(a1 + 32) action:0];
  uint64_t v9 = [*(id *)(a1 + 32) navigationItem];
  [v9 setLeftBarButtonItem:v8];

  int64_t v10 = *(void **)(a1 + 32);

  return [v10 _updatePaneTitleForEditing:1];
}

- (void)_transitionFromEditingNameAnimated:(BOOL)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__AKAuthorizationInputPaneViewController__transitionFromEditingNameAnimated___block_invoke;
  v4[3] = &unk_1E648F898;
  void v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__AKAuthorizationInputPaneViewController__transitionFromEditingNameAnimated___block_invoke_2;
  v3[3] = &unk_1E648EF28;
  v3[4] = self;
  [(AKAuthorizationInputPaneViewController *)self _reloadDataAnimated:a3 heightChange:v4 animation:v3];
}

double __77__AKAuthorizationInputPaneViewController__transitionFromEditingNameAnimated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double result = -*(double *)(v1 + 1096);
  *(void *)(v1 + 1096) = 0;
  return result;
}

uint64_t __77__AKAuthorizationInputPaneViewController__transitionFromEditingNameAnimated___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) savedRightBarButtonItem];
  int64_t v3 = [*(id *)(a1 + 32) navigationItem];
  [v3 setRightBarButtonItem:v2];

  uint64_t v4 = [*(id *)(a1 + 32) savedLeftBarButtonItem];
  double v5 = [*(id *)(a1 + 32) navigationItem];
  [v5 setLeftBarButtonItem:v4];

  [*(id *)(a1 + 32) setSavedRightBarButtonItem:0];
  [*(id *)(a1 + 32) setSavedLeftBarButtonItem:0];
  int64_t v6 = *(void **)(a1 + 32);

  return [v6 _updatePaneTitleForEditing:0];
}

- (void)_beginEditingRow:(unint64_t)a3
{
  id v6 = [(AKAuthorizationInputPaneViewController *)self _textFieldForRow:a3];
  [v6 becomeFirstResponder];
  uint64_t v4 = [(AKAuthorizationInputPaneViewController *)self view];
  [v4 setNeedsLayout];

  double v5 = [(AKAuthorizationInputPaneViewController *)self view];
  [v5 layoutIfNeeded];
}

- (void)_beginEditing
{
}

- (id)_textFieldForRow:(unint64_t)a3
{
  uint64_t v4 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:0];
  double v5 = [(AKAuthorizationPaneViewController *)self tableView];
  id v6 = [v5 cellForRowAtIndexPath:v4];

  uint64_t v7 = [v6 detailTextField];

  return v7;
}

- (void)_nameEditDone
{
  int64_t v3 = [(AKAuthorizationInputPaneViewController *)self navigationController];
  uint64_t v4 = [v3 topViewController];

  if (v4 == self)
  {
    [(AKAuthorizationInputPaneViewController *)self setEditingName:0 animated:1];
  }
}

- (void)_setGivenNameFromTextField:(id)a3
{
  id v8 = [(AKAuthorizationInputPaneViewController *)self _textFromTextField:a3];
  uint64_t v4 = [(AKAuthorizationInputPaneViewController *)self editingUserInformation];
  double v5 = [v4 givenName];
  char v6 = [v5 isEqualToString:v8];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [(AKAuthorizationInputPaneViewController *)self editingUserInformation];
    [v7 setGivenName:v8];
  }
}

- (void)_setFamilyNameFromTextField:(id)a3
{
  id v8 = [(AKAuthorizationInputPaneViewController *)self _textFromTextField:a3];
  uint64_t v4 = [(AKAuthorizationInputPaneViewController *)self editingUserInformation];
  double v5 = [v4 familyName];
  char v6 = [v5 isEqualToString:v8];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [(AKAuthorizationInputPaneViewController *)self editingUserInformation];
    [v7 setFamilyName:v8];
  }
}

- (id)_textFromTextField:(id)a3
{
  return (id)[a3 text];
}

- (BOOL)_getValidEditingGivenName:(id *)a3 familyName:(id *)a4
{
  char v6 = [(AKAuthorizationInputPaneViewController *)self editingUserInformation];
  uint64_t v7 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v8 = [v6 givenName];
  uint64_t v9 = [v8 stringByTrimmingCharactersInSet:v7];

  int64_t v10 = [v6 familyName];
  uint64_t v11 = [v10 stringByTrimmingCharactersInSet:v7];

  if ([v9 length] || objc_msgSend(v11, "length"))
  {
    if (a3) {
      *a3 = v9;
    }
    if (a4) {
      *a4 = v11;
    }
    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)_updateDataSourceWithValidEditingName
{
  if ([(AKAuthorizationInputPaneViewController *)self isEditingName])
  {
    id v16 = 0;
    id v17 = 0;
    BOOL v3 = [(AKAuthorizationInputPaneViewController *)self _getValidEditingGivenName:&v17 familyName:&v16];
    id v4 = v17;
    id v5 = v16;
    if (v3)
    {
      char v6 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
      uint64_t v7 = [v6 userInformation];
      id v8 = [v7 givenName];
      if ([v8 isEqualToString:v4])
      {
        uint64_t v9 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
        int64_t v10 = [v9 userInformation];
        uint64_t v11 = [v10 familyName];
        uint64_t v12 = [v11 isEqualToString:v5] ^ 1;
      }
      else
      {
        uint64_t v12 = 1;
      }

      [(AKCATiburonInputUIReporter *)self->_analyticsReport didModifyName:v12];
      long long v14 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
      [v14 setGivenName:v4 familyName:v5];

      long long v13 = [(AKAuthorizationPaneViewController *)self editableDataSources];
      [v13 setEditableScopeChoicesChanged:1];
    }
    else
    {
      long long v13 = _AKLogSiwa();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v15 = 0;
        _os_log_impl(&dword_1C38C1000, v13, OS_LOG_TYPE_DEFAULT, "Name change not accepted.", v15, 2u);
      }
    }
  }
}

- (double)_computeNameEditHeightChange
{
  BOOL v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1)
  {
    [(AKAuthorizationInputPaneViewController *)self _padNameEditHeightChange];
  }
  else if (v4)
  {
    char v6 = _AKLogSiwa();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(AKAuthorizationInputPaneViewController *)v6 _computeNameEditHeightChange];
    }

    return 0.0;
  }
  else
  {
    [(AKAuthorizationInputPaneViewController *)self _phoneNameEditHeightChange];
  }
  return result;
}

- (double)_phoneNameEditHeightChange
{
  BOOL v3 = [MEMORY[0x1E4F4F020] sharedManager];
  int v4 = [v3 isLisbonAvailable];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F42D90] mainScreen];
    [v5 bounds];
    double MaxY = CGRectGetMaxY(v27);

    [(AKAuthorizationInputPaneViewController *)self preferredContentSize];
    double v8 = v7;
    uint64_t v9 = [(AKAuthorizationInputPaneViewController *)self navigationController];
    uint64_t v10 = [v9 navigationBar];
    [v10 frame];
    double v11 = v8 + CGRectGetHeight(v28);

    return MaxY - v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F42B08], "sizeForInterfaceOrientation:", -[AKAuthorizationInputPaneViewController interfaceOrientation](self, "interfaceOrientation"));
    double v14 = v13;
    +[AKAuthorizationPaneMetrics keyboardAccessoryViewHeight];
    double v16 = v14 + v15;
    id v17 = [MEMORY[0x1E4F42D90] mainScreen];
    [v17 bounds];
    double v18 = CGRectGetMaxY(v29);

    [(AKAuthorizationInputPaneViewController *)self _mainSectionScreenMaxY];
    double v20 = v19;
    int v21 = [(AKAuthorizationPaneViewController *)self tableView];
    [v21 contentOffset];
    double v23 = v22;
    unint64_t v24 = [(AKAuthorizationInputPaneViewController *)self navigationController];
    v25 = [v24 navigationBar];
    [v25 frame];
    double v26 = v20 + v23 + CGRectGetHeight(v30);

    return v16 - (v18 - v26);
  }
}

- (double)_padNameEditHeightChange
{
  [(AKAuthorizationInputPaneViewController *)self _mainSectionScreenMaxY];
  double v4 = v3;
  id v5 = [(AKAuthorizationPaneViewController *)self paneFooterStackView];
  [v5 bounds];
  double Height = CGRectGetHeight(v11);

  double v7 = [(AKAuthorizationInputPaneViewController *)self navigationController];
  double v8 = [v7 view];

  [v8 bounds];
  objc_msgSend(v8, "convertRect:toView:", 0);
  double v9 = v4 + Height - CGRectGetMaxY(v12);

  return v9;
}

- (double)_mainSectionScreenMaxY
{
  double v3 = [(AKAuthorizationPaneViewController *)self tableView];
  double v4 = [v3 tableHeaderView];

  [v4 bounds];
  objc_msgSend(v4, "convertRect:toView:", 0);
  double MaxY = CGRectGetMaxY(v9);
  char v6 = [(AKAuthorizationPaneViewController *)self tableView];
  [v6 rectForSection:0];
  double Height = CGRectGetHeight(v10);

  return MaxY + Height;
}

- (void)_reloadDataAnimated:(BOOL)a3 heightChange:(id)a4
{
}

- (void)_reloadDataAnimated:(BOOL)a3 heightChange:(id)a4 animation:(id)a5
{
}

- (void)_reloadDataAnimated:(BOOL)a3 heightChange:(id)a4 animation:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  CGRect v10 = (void (**)(void, double))a4;
  id v11 = a5;
  id v12 = a6;
  double v13 = [MEMORY[0x1E4F4F020] sharedManager];
  int v14 = [v13 isLisbonAvailable];

  if (v14)
  {
    double v15 = [(AKAuthorizationPaneViewController *)self tableView];
    [v15 reloadData];

    double v16 = [(AKAuthorizationPaneViewController *)self tableView];
    uint64_t v17 = [v16 numberOfSections];

    objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v17);
  }
  else
  {
    [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  double v18 = };
  if (v8) {
    uint64_t v19 = 100;
  }
  else {
    uint64_t v19 = 5;
  }
  double v20 = [(AKAuthorizationPaneViewController *)self tableView];
  [v20 reloadSections:v18 withRowAnimation:v19];

  double v21 = 0.0;
  uint64_t v22 = 0;
  if (v10) {
    v10[2](v10, 0.0);
  }
  if (v8) {
    double v21 = 0.3;
  }
  double v23 = (void *)MEMORY[0x1E4F42FF0];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __96__AKAuthorizationInputPaneViewController__reloadDataAnimated_heightChange_animation_completion___block_invoke;
  v28[3] = &unk_1E648F8C0;
  v28[4] = self;
  id v29 = v11;
  uint64_t v30 = v22;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __96__AKAuthorizationInputPaneViewController__reloadDataAnimated_heightChange_animation_completion___block_invoke_2;
  v26[3] = &unk_1E648F8E8;
  id v27 = v12;
  id v24 = v12;
  id v25 = v11;
  [v23 animateWithDuration:v28 animations:v26 completion:v21];
}

uint64_t __96__AKAuthorizationInputPaneViewController__reloadDataAnimated_heightChange_animation_completion___block_invoke(double *a1)
{
  uint64_t v2 = *((void *)a1 + 5);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  double v3 = (void *)*((void *)a1 + 4);
  double v4 = a1[6];

  return [v3 _updateLayoutForHeightChange:v4];
}

uint64_t __96__AKAuthorizationInputPaneViewController__reloadDataAnimated_heightChange_animation_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_updateLayoutForHeightChange:(double)a3
{
  if (a3 != 0.0)
  {
    [(AKAuthorizationInputPaneViewController *)self preferredContentSize];
    double v7 = v6 + a3;
    BOOL v8 = [(AKAuthorizationInputPaneViewController *)self view];
    [v8 bounds];
    -[AKAuthorizationInputPaneViewController setPreferredContentSize:](self, "setPreferredContentSize:", CGRectGetWidth(v10), v7);

    id v9 = [(AKAuthorizationInputPaneViewController *)self view];
    [v9 layoutIfNeeded];
  }
}

- (BOOL)_shouldOverrideIntrinsicContentHeight
{
  return self->_isEditingName || self->_isEmailExpanded;
}

- (double)intrinsicContentHeight
{
  if ([(AKAuthorizationInputPaneViewController *)self _shouldOverrideIntrinsicContentHeight])
  {
    [(AKAuthorizationInputPaneViewController *)self preferredContentSize];
    return v3;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AKAuthorizationInputPaneViewController;
    [(AKAuthorizationPaneViewController *)&v5 intrinsicContentHeight];
  }
  return result;
}

- (double)contentScrollOffset
{
  double v3 = [MEMORY[0x1E4F42B08] activeKeyboard];
  if ([v3 isActive])
  {
    double v4 = [v3 window];
    [v4 frame];
    double Height = CGRectGetHeight(v38);
    [v3 frame];
    CGFloat v6 = Height - CGRectGetHeight(v39);

    [v3 frame];
    CGRect v41 = CGRectOffset(v40, 0.0, v6);
    CGFloat x = v41.origin.x;
    CGFloat y = v41.origin.y;
    CGFloat width = v41.size.width;
    CGFloat v10 = v41.size.height;
    id v11 = [v3 window];
    id v12 = [(AKAuthorizationInputPaneViewController *)self view];
    [v12 frame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v21 = [(AKAuthorizationInputPaneViewController *)self view];
    objc_msgSend(v11, "convertRect:fromView:", v21, v14, v16, v18, v20);
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;

    v42.origin.CGFloat x = v23;
    v42.origin.CGFloat y = v25;
    v42.size.CGFloat width = v27;
    v42.size.height = v29;
    double MaxY = CGRectGetMaxY(v42);
    v43.origin.CGFloat x = x;
    v43.origin.CGFloat y = y;
    v43.size.CGFloat width = width;
    v43.size.height = v10;
    double v31 = MaxY - CGRectGetMinY(v43);
    v37.receiver = self;
    v37.super_class = (Class)AKAuthorizationInputPaneViewController;
    [(AKAuthorizationPaneViewController *)&v37 contentScrollOffset];
    double v33 = fmax(v31, v32);
  }
  else
  {
    v36.receiver = self;
    v36.super_class = (Class)AKAuthorizationInputPaneViewController;
    [(AKAuthorizationPaneViewController *)&v36 contentScrollOffset];
    double v33 = v34;
  }

  return v33;
}

- (void)_selectShareMyEmail
{
  [(AKAuthorizationInputPaneViewController *)self _updateEditableScopeChoicesWithPrivateEmail:0];
  if ([(AKAuthorizationInputPaneViewController *)self isEmailExpanded])
  {
    double v3 = self;
    uint64_t v4 = 0;
LABEL_5:
    [(AKAuthorizationInputPaneViewController *)v3 setEmailExpanded:v4 animated:1];
    return;
  }
  objc_super v5 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
  unint64_t v6 = [v5 emailCount];

  double v3 = self;
  if (v6 >= 2)
  {
    uint64_t v4 = 1;
    goto LABEL_5;
  }
  id v7 = [(AKAuthorizationPaneViewController *)self tableView];
  [v7 reloadData];
}

- (void)_selectHideMyEmail
{
  [(AKAuthorizationInputPaneViewController *)self _updateEditableScopeChoicesWithPrivateEmail:1];
  if ([(AKAuthorizationInputPaneViewController *)self isEmailExpanded])
  {
    [(AKAuthorizationInputPaneViewController *)self setEmailExpanded:0 animated:1];
  }
  else
  {
    id v3 = [(AKAuthorizationPaneViewController *)self tableView];
    [v3 reloadData];
  }
}

- (void)_updateEditableScopeChoicesWithPrivateEmail:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3)
  {
    objc_super v5 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
    uint64_t v6 = [v5 indexOfChosenEmail];

    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
      [v7 setIndexOfChosenEmail:0];
    }
  }
  BOOL v8 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
  [v8 setWantsPrivateEmail:v3];

  [(AKAuthorizationInputPaneViewController *)self setEditableScopeChoicesChanged:1];

  [(AKAuthorizationInputPaneViewController *)self _enableOrDisableConfirmButton];
}

- (id)_clearButton
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__AKAuthorizationInputPaneViewController__clearButton__block_invoke;
  v12[3] = &unk_1E648F348;
  v12[4] = self;
  uint64_t v2 = [MEMORY[0x1E4F426E8] actionWithHandler:v12];
  BOOL v3 = (void *)MEMORY[0x1E4F427E0];
  uint64_t v4 = +[AKAuthorizationAppearance clearButtonConfiguration];
  objc_super v5 = [v3 buttonWithConfiguration:v4 primaryAction:v2];

  +[AKAuthorizationPaneMetrics clearButtonWidth];
  double v7 = v6;
  +[AKAuthorizationPaneMetrics clearButtonWidth];
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v7, v8);
  id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  CGFloat v10 = [v9 localizedStringForKey:@"AUTHORIZATION_VIEWCONTROLLER_CLEAR" value:&stru_1F1EE8138 table:@"Localizable"];
  [v5 setAccessibilityLabel:v10];

  return v5;
}

void __54__AKAuthorizationInputPaneViewController__clearButton__block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *MEMORY[0x1E4F4EE20];
  uint64_t v4 = @"shouldClear";
  v5[0] = MEMORY[0x1E4F1CC38];
  BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v1 _didSelectEditScope:v2 options:v3];
}

- (id)_doneBarButtonItem
{
  id v3 = objc_alloc(MEMORY[0x1E4F427C0]);
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v5 = [v4 localizedStringForKey:@"AUTHORIZATION_VIEWCONTROLLER_DONE" value:&stru_1F1EE8138 table:@"Localizable"];
  double v6 = objc_msgSend(v3, "initWithTitle:style:target:action:", v5, +[AKAuthorizationAppearance editingDoneButtonStyle](AKAuthorizationAppearance, "editingDoneButtonStyle"), self, sel__doneButtonSelected_);

  return v6;
}

- (void)_updatePaneTitleForEditing:(BOOL)a3
{
  objc_super v5 = [MEMORY[0x1E4F4F020] sharedManager];
  int v6 = [v5 isLisbonAvailable];

  if (v6)
  {
    if (a3)
    {
      id v7 = [(AKAuthorizationInputPaneViewController *)self _paneTitleString];
      [(AKAuthorizationInputPaneViewController *)self setTitle:v7];
    }
    else
    {
      [(AKAuthorizationInputPaneViewController *)self setTitle:0];
    }
  }
}

- (void)_didSelectEditScope:(id)a3 options:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(AKAuthorizationPaneViewController *)self paneDelegate];
  if (objc_opt_respondsToSelector())
  {
    double v8 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
    [v7 authorizationPaneViewController:self pushEditScope:v9 presentationContext:v8 options:v6];
  }
}

- (void)_setCancelButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AKAuthorizationInputPaneViewController *)self navigationItem];
  uint64_t v4 = [v5 rightBarButtonItem];
  [v4 setEnabled:v3];
}

- (void)_enableOrDisableConfirmButton
{
  BOOL v3 = [(AKAuthorizationInputPaneViewController *)self isEditingName];
  uint64_t v4 = [(AKAuthorizationInputPaneViewController *)self confirmButton];
  id v5 = [v4 view];
  [v5 setHidden:v3];

  if (!v3)
  {
    BOOL v6 = [(AKAuthorizationInputPaneViewController *)self _shouldAllowAuthorization];
    id v7 = [(AKAuthorizationInputPaneViewController *)self confirmButton];
    [v7 enableAuthorizationCapability:v6];
  }
}

- (BOOL)isEditingName
{
  return self->_isEditingName;
}

- (void)setEditingName:(BOOL)a3
{
}

- (void)setEditingName:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setEditingName:(BOOL)a3 shouldClear:(BOOL)a4 animated:(BOOL)a5
{
  if (self->_isEditingName == a3) {
    return;
  }
  BOOL v5 = a5;
  if (a3)
  {
    BOOL v7 = a4;
    double v8 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
    id v9 = [v8 userInformation];
    [(AKAuthorizationInputPaneViewController *)self setEditingUserInformation:v9];

    CGFloat v10 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
    uint64_t v11 = [v10 personNameComponentsOrder];

    if (v11)
    {
      if (v11 != 1)
      {
LABEL_9:
        if (v7)
        {
          double v15 = [(AKAuthorizationInputPaneViewController *)self editingUserInformation];
          [v15 setGivenName:&stru_1F1EE8138];

          double v16 = [(AKAuthorizationInputPaneViewController *)self editingUserInformation];
          [v16 setFamilyName:&stru_1F1EE8138];
        }
        self->_isEditingName = 1;
        [(AKAuthorizationInputPaneViewController *)self _transitionToEditingNameAnimated:v5];
        [(AKAuthorizationInputPaneViewController *)self _beginEditing];
        goto LABEL_12;
      }
      id v12 = &OBJC_IVAR___AKAuthorizationInputPaneViewController__editingGivenNameIndex;
      double v13 = &OBJC_IVAR___AKAuthorizationInputPaneViewController__editingFamilyNameIndex;
    }
    else
    {
      id v12 = &OBJC_IVAR___AKAuthorizationInputPaneViewController__editingFamilyNameIndex;
      double v13 = &OBJC_IVAR___AKAuthorizationInputPaneViewController__editingGivenNameIndex;
    }
    *(Class *)((char *)&self->super.super.super.super.isa + *v13) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa + *v12) = (Class)1;
    goto LABEL_9;
  }
  [(AKAuthorizationInputPaneViewController *)self _updateDataSourceWithValidEditingName];
  self->_isEditingName = 0;
  [(AKAuthorizationInputPaneViewController *)self _endEditing];
  [(AKAuthorizationInputPaneViewController *)self _transitionFromEditingNameAnimated:v5];
  nameFormatter = self->_nameFormatter;
  self->_nameFormatter = 0;

LABEL_12:

  [(AKAuthorizationInputPaneViewController *)self _enableOrDisableConfirmButton];
}

- (void)_performAuthorizationWithRawPassword:(id)a3
{
}

- (void)_performAuthorizationWithRawPassword:(id)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
  id v9 = [(AKAuthorizationInputPaneViewController *)self _selectedLoginChoice];
  [(AKAuthorizationInputPaneViewController *)self _prepareScopeChoices:v8 withLoginChoice:v9];

  CGFloat v10 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
  uint64_t v11 = [v10 userResponse];

  [v11 setRawAccountPassword:v6];
  [(AKAuthorizationInputPaneViewController *)self _updateAnalyticsReport];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  double v19 = __97__AKAuthorizationInputPaneViewController__performAuthorizationWithRawPassword_completionHandler___block_invoke;
  double v20 = &unk_1E648F910;
  double v21 = self;
  id v22 = v7;
  id v12 = v7;
  [(AKAuthorizationInputPaneViewController *)self _paneDelegate_didRequestAuthorizationWithUserProvidedInformation:v11 completion:&v17];
  double v13 = _AKLogSiwa();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
    double v15 = (void *)v14;
    double v16 = @"YES";
    if (!v6) {
      double v16 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = v14;
    __int16 v25 = 2112;
    double v26 = v16;
    _os_log_impl(&dword_1C38C1000, v13, OS_LOG_TYPE_DEFAULT, "AKAuthorizationInputPaneViewController: User requested authorization with scope choices: %@ \nContains password: %@", buf, 0x16u);
  }
}

void __97__AKAuthorizationInputPaneViewController__performAuthorizationWithRawPassword_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6) {
    [*(id *)(*(void *)(a1 + 32) + 1112) sendReport];
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  else
  {
    if (v5)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __97__AKAuthorizationInputPaneViewController__performAuthorizationWithRawPassword_completionHandler___block_invoke_2;
      block[3] = &unk_1E648F2C8;
      void block[4] = *(void *)(a1 + 32);
      id v12 = v5;
      dispatch_async(MEMORY[0x1E4F14428], block);
      double v8 = v12;
    }
    else
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __97__AKAuthorizationInputPaneViewController__performAuthorizationWithRawPassword_completionHandler___block_invoke_3;
      v9[3] = &unk_1E648F2C8;
      v9[4] = *(void *)(a1 + 32);
      id v10 = v6;
      dispatch_async(MEMORY[0x1E4F14428], v9);
      double v8 = v10;
    }
  }
}

uint64_t __97__AKAuthorizationInputPaneViewController__performAuthorizationWithRawPassword_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:error:", *(void *)(a1 + 40), 0);
}

uint64_t __97__AKAuthorizationInputPaneViewController__performAuthorizationWithRawPassword_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAuthorizationError:*(void *)(a1 + 40)];
}

- (void)_performPasswordAuthentication
{
  BOOL v3 = [(AKAuthorizationPaneViewController *)self paneDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = _AKLogSiwa();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1C38C1000, v4, OS_LOG_TYPE_DEFAULT, "AKAuthorizationConfirmPaneViewController: Performing password authorization", v5, 2u);
    }

    [v3 performPasswordAuthenticationForPaneViewController:self];
  }
}

- (void)_handleAuthorizationError:(id)a3
{
  id v11 = a3;
  if (objc_msgSend(v11, "ak_isAuthenticationErrorWithCode:", -7081))
  {
    if ([(AKAuthorizationInputPaneViewController *)self _nameScopeAllowsAuthorization])
    {
      if ([(AKAuthorizationInputPaneViewController *)self _emailScopeAllowsAuthorization])
      {
        goto LABEL_13;
      }
      uint64_t v4 = [(AKAuthorizationInputPaneViewController *)self confirmButton];
      id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v6 = v5;
      uint64_t v7 = @"BIO_BUTTON_SELECT_EMAIL";
    }
    else
    {
      uint64_t v4 = [(AKAuthorizationInputPaneViewController *)self confirmButton];
      id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v6 = v5;
      uint64_t v7 = @"BIO_BUTTON_ENTER_NAME";
    }
  }
  else
  {
    if (!objc_msgSend(v11, "ak_isAuthenticationErrorWithCode:", -7082))
    {
      BOOL v9 = [v11 code] == -7006 || objc_msgSend(v11, "code") == -7075;
      id v10 = [(AKAuthorizationInputPaneViewController *)self confirmButton];
      [v10 showAlertAndContinueWithPassword:v9];

      [(AKAuthorizationInputPaneViewController *)self _paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:0 error:v11];
      goto LABEL_13;
    }
    uint64_t v4 = [(AKAuthorizationInputPaneViewController *)self confirmButton];
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v6 = v5;
    uint64_t v7 = @"BIO_BUTTON_SELECT_ACCOUNT";
  }
  double v8 = [v5 localizedStringForKey:v7 value:&stru_1F1EE8138 table:@"Localizable"];
  [v4 bioAuthFailWithAlertString:v8];

LABEL_13:
}

- (void)_prepareScopeChoices:(id)a3 withLoginChoice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [MEMORY[0x1E4F4F020] sharedManager];
  int v9 = [v8 isSiwaCredentialSharingEnabled];

  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [v7 sharedAccount];
      id v11 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
      id v12 = [v11 credentialRequestContext];
      double v13 = [v12 authorizationRequest];
      objc_msgSend(v13, "set_sharedAccount:", v10);
    }
  }
  uint64_t v14 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  double v15 = [v14 credentialRequestContext];
  double v16 = [v15 authorizationRequest];

  [v6 setLoginChoice:v7];
  if (v7 && ![v7 isAppleIDAuthorization])
  {
    if (v16)
    {
      uint64_t v17 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
      uint64_t v18 = [v17 loginChoices];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __79__AKAuthorizationInputPaneViewController__prepareScopeChoices_withLoginChoice___block_invoke;
      v29[3] = &unk_1E648F938;
      id v30 = v6;
      [v18 enumerateObjectsUsingBlock:v29];
    }
    double v19 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
    double v20 = [v19 credentialRequestContext];
    double v21 = [v20 passwordRequest];
    [v6 setSelectedRequest:v21];

    goto LABEL_13;
  }
  if (!v16)
  {
    double v19 = _AKLogSiwa();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[AKAuthorizationInputPaneViewController _prepareScopeChoices:withLoginChoice:](v19, v22, v23, v24, v25, v26, v27, v28);
    }
LABEL_13:

    goto LABEL_14;
  }
  [v6 setSelectedRequest:v16];
LABEL_14:
}

unint64_t __79__AKAuthorizationInputPaneViewController__prepareScopeChoices_withLoginChoice___block_invoke(uint64_t a1, void *a2, unint64_t a3, BOOL *a4)
{
  if ([a2 isAppleIDAuthorization]) {
    objc_msgSend(*(id *)(a1 + 32), "setIndexOfChosenLogin:", objc_msgSend(*(id *)(a1 + 32), "indexOfChosenLogin") - 1);
  }
  unint64_t result = [*(id *)(a1 + 32) indexOfChosenLogin];
  *a4 = result <= a3;
  return result;
}

- (void)_updateAnalyticsReport
{
  [(AKCATiburonInputUIReporter *)self->_analyticsReport didSelectAppleID:1];
  analyticsReport = self->_analyticsReport;
  id v4 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
  -[AKCATiburonInputUIReporter didSelectAnonymousEmail:](analyticsReport, "didSelectAnonymousEmail:", [v4 wantsPrivateEmail]);
}

- (void)subPaneConfirmButtonDidEnterProcessingState:(id)a3
{
  id v4 = a3;
  id v5 = _AKLogSiwa();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1C38C1000, v5, OS_LOG_TYPE_DEFAULT, "Finished biometric authentication successfully.", (uint8_t *)buf, 2u);
  }

  if ([(AKAuthorizationInputPaneViewController *)self _shouldAllowAuthorization])
  {
    [(AKAuthorizationInputPaneViewController *)self _setCancelButtonEnabled:0];
    [(AKAuthorizationInputPaneViewController *)self _updateDataSourceWithValidEditingName];
    objc_initWeak(buf, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __86__AKAuthorizationInputPaneViewController_subPaneConfirmButtonDidEnterProcessingState___block_invoke;
    v11[3] = &unk_1E648F960;
    objc_copyWeak(&v13, buf);
    id v12 = v4;
    [(AKAuthorizationInputPaneViewController *)self _performAuthorizationWithRawPassword:0 completionHandler:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
  else
  {
    BOOL v6 = [(AKAuthorizationInputPaneViewController *)self _shouldPresentCreateFlow];
    id v7 = _AKLogSiwa();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1C38C1000, v7, OS_LOG_TYPE_DEFAULT, "Selection does not satisfy scopes. Providing instructions for user.", (uint8_t *)buf, 2u);
      }
      uint64_t v9 = -7081;
    }
    else
    {
      if (v8)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1C38C1000, v7, OS_LOG_TYPE_DEFAULT, "No choice selection from user. Providing instructions for user.", (uint8_t *)buf, 2u);
      }
      uint64_t v9 = -7082;
    }

    id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", v9);
    [v4 invalidateProcessingState];
    [(AKAuthorizationInputPaneViewController *)self _handleAuthorizationError:v10];
  }
}

void __86__AKAuthorizationInputPaneViewController_subPaneConfirmButtonDidEnterProcessingState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v8 = WeakRetained;
  if (v5)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __86__AKAuthorizationInputPaneViewController_subPaneConfirmButtonDidEnterProcessingState___block_invoke_2;
    v18[3] = &unk_1E648F2C8;
    id v10 = &v19;
    id v19 = WeakRetained;
    id v11 = &v20;
    id v20 = v5;
    id v12 = v8;
    [v9 finishProcessingWithCompletionHandler:v18];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__AKAuthorizationInputPaneViewController_subPaneConfirmButtonDidEnterProcessingState___block_invoke_3;
    block[3] = &unk_1E648F278;
    id v10 = &v15;
    id v11 = &v16;
    id v15 = *(id *)(a1 + 32);
    double v16 = v8;
    id v17 = v6;
    id v13 = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __86__AKAuthorizationInputPaneViewController_subPaneConfirmButtonDidEnterProcessingState___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:error:", *(void *)(a1 + 40), 0);
}

uint64_t __86__AKAuthorizationInputPaneViewController_subPaneConfirmButtonDidEnterProcessingState___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateProcessingState];
  [*(id *)(a1 + 40) _setCancelButtonEnabled:1];
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 _handleAuthorizationError:v3];
}

- (void)subpaneConfirmButtonDidFailBiometry:(id)a3
{
  uint64_t v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1C38C1000, v3, OS_LOG_TYPE_DEFAULT, "Finished biometric authentication with failure.", v4, 2u);
  }
}

- (void)performPasswordAuthentication
{
  uint64_t v3 = [(AKAuthorizationInputPaneViewController *)self _selectedLoginChoice];
  id v4 = v3;
  if (v3 && ([v3 isAppleIDAuthorization] & 1) == 0) {
    [(AKAuthorizationInputPaneViewController *)self _performAuthorizationWithRawPassword:0];
  }
  else {
    [(AKAuthorizationInputPaneViewController *)self _performPasswordAuthentication];
  }
}

- (void)performAuthorization
{
}

- (void)subPaneConfirmButtonPerformExternalAuthentication:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = _AKLogSiwa();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
    *(_DWORD *)buf = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_1C38C1000, v4, OS_LOG_TYPE_DEFAULT, "AKAuthorizationInputPaneViewController: Did continue -  User requested authorization with scope choices: %@", buf, 0xCu);
  }
  id v6 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
  id v7 = [(AKAuthorizationInputPaneViewController *)self _selectedLoginChoice];
  [(AKAuthorizationInputPaneViewController *)self _prepareScopeChoices:v6 withLoginChoice:v7];

  BOOL v8 = [(AKAuthorizationInputPaneViewController *)self editableScopeChoices];
  uint64_t v9 = [v8 userResponse];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__AKAuthorizationInputPaneViewController_subPaneConfirmButtonPerformExternalAuthentication___block_invoke;
  v10[3] = &unk_1E648F2F0;
  v10[4] = self;
  [(AKAuthorizationInputPaneViewController *)self _paneDelegate_didRequestAuthorizationWithUserProvidedInformation:v9 completion:v10];
}

void __92__AKAuthorizationInputPaneViewController_subPaneConfirmButtonPerformExternalAuthentication___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__AKAuthorizationInputPaneViewController_subPaneConfirmButtonPerformExternalAuthentication___block_invoke_2;
    block[3] = &unk_1E648F2C8;
    void block[4] = *(void *)(a1 + 32);
    id v8 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __92__AKAuthorizationInputPaneViewController_subPaneConfirmButtonPerformExternalAuthentication___block_invoke_3;
    v6[3] = &unk_1E648EF28;
    v6[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __92__AKAuthorizationInputPaneViewController_subPaneConfirmButtonPerformExternalAuthentication___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAuthorizationError:*(void *)(a1 + 40)];
}

uint64_t __92__AKAuthorizationInputPaneViewController_subPaneConfirmButtonPerformExternalAuthentication___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:error:", 0, 0);
}

- (BOOL)validateReadyForAuthorization
{
  BOOL v3 = [(AKAuthorizationInputPaneViewController *)self _shouldAllowAuthorization];
  if (v3)
  {
    [(AKAuthorizationInputPaneViewController *)self _updateDataSourceWithValidEditingName];
  }
  else
  {
    id v4 = _AKLogSiwa();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(AKAuthorizationInputPaneViewController *)v4 validateReadyForAuthorization];
    }
  }
  return v3;
}

- (void)subPaneConfirmButtonPerformAccountCreation:(id)a3
{
  id v8 = [(AKAuthorizationInputPaneViewController *)self authorizationViewController];
  id v4 = (void *)MEMORY[0x1E4F4EFA0];
  uint64_t v5 = [(AKAuthorizationInputPaneViewController *)self presentationContext];
  uint64_t v6 = [v4 presentationContextForCreateAppleIDFlow:v5];

  uint64_t v7 = [v6 credentialRequestContext];
  [v7 setPasswordRequest:0];

  [v8 setPresentationContext:v6];
  [v8 presentInputPaneViewController];
}

- (void)passwordAuthenticationCompletedWithResults:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = _AKLogSiwa();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AKAuthorizationInputPaneViewController passwordAuthenticationCompletedWithResults:error:]();
    }
  }
  else
  {
    uint64_t v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[AKAuthorizationInputPaneViewController passwordAuthenticationCompletedWithResults:error:]();
    }

    [(AKAuthorizationInputPaneViewController *)self _performAuthorizationWithRawPassword:0];
  }
}

- (void)_paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(AKAuthorizationPaneViewController *)self paneDelegate];
  if (objc_opt_respondsToSelector()) {
    [v7 authorizationPaneViewController:self dismissWithAuthorization:v8 error:v6];
  }
}

- (void)_paneDelegate_didRequestAuthorizationWithUserProvidedInformation:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(AKAuthorizationPaneViewController *)self paneDelegate];
  if (objc_opt_respondsToSelector()) {
    [v7 authorizationPaneViewController:self didRequestAuthorizationWithUserProvidedInformation:v8 completion:v6];
  }
}

- (AKAuthorizationScopeChoices)editableScopeChoices
{
  return self->_editableScopeChoices;
}

- (BOOL)editableScopeChoicesChanged
{
  return self->_editableScopeChoicesChanged;
}

- (void)setEditableScopeChoicesChanged:(BOOL)a3
{
  self->_editableScopeChoicesChanged = a3;
}

- (AKAuthorizationPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (AKAuthorizationViewController)authorizationViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_authorizationViewController);

  return (AKAuthorizationViewController *)WeakRetained;
}

- (void)setAuthorizationViewController:(id)a3
{
}

- (AKUserInformation)editingUserInformation
{
  return self->_editingUserInformation;
}

- (void)setEditingUserInformation:(id)a3
{
}

- (AKAuthorizationSubPaneImage)imageSubPane
{
  return self->_imageSubPane;
}

- (void)setImageSubPane:(id)a3
{
}

- (AKAuthorizationSubPaneConfirmButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setConfirmButton:(id)a3
{
}

- (UIBarButtonItem)savedLeftBarButtonItem
{
  return self->_savedLeftBarButtonItem;
}

- (void)setSavedLeftBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)savedRightBarButtonItem
{
  return self->_savedRightBarButtonItem;
}

- (void)setSavedRightBarButtonItem:(id)a3
{
}

- (AKAuthorizationNameFormatter)nameFormatter
{
  return self->_nameFormatter;
}

- (void)setNameFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameFormatter, 0);
  objc_storeStrong((id *)&self->_savedRightBarButtonItem, 0);
  objc_storeStrong((id *)&self->_savedLeftBarButtonItem, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_imageSubPane, 0);
  objc_storeStrong((id *)&self->_editingUserInformation, 0);
  objc_destroyWeak((id *)&self->_authorizationViewController);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_editableScopeChoices, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_analyticsReport, 0);

  objc_storeStrong((id *)&self->_validatedScopes, 0);
}

- (void)_localizedAuthorizationString
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1C38C1000, v0, v1, "Account/application information is missing, showing default text in %@.", v2, v3, v4, v5, v6);
}

- (void)tableView:(void *)a1 didSelectRowAtIndexPath:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 row];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_DEBUG, "Setting login choice to cell at index %lu", v3, 0xCu);
}

- (void)tableView:(void *)a1 didSelectRowAtIndexPath:(void *)a2 .cold.2(void *a1, void *a2)
{
  [a1 row];
  uint64_t v3 = [a2 presentationContext];
  uint64_t v4 = [v3 loginChoices];
  [v4 count];
  OUTLINED_FUNCTION_1_0(&dword_1C38C1000, v5, v6, "Row %ld selected from %ld available login choices.", v7, v8, v9, v10, 0);
}

- (void)textFieldShouldReturn:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "returnKeyType"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_0(&dword_1C38C1000, v2, v3, "Text field of unexpected return key type %@", v4, v5, v6, v7, v8);
}

- (void)_cellForScope:localRow:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1C38C1000, v0, v1, "Unknown scope: %@", v2, v3, v4, v5, v6);
}

- (void)_editingNameCellForRow:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_0(&dword_1C38C1000, v2, v3, "_setupCell unknown row %@", v4, v5, v6, v7, v8);
}

- (void)_loginChoiceCellForRow:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 presentationContext];
  uint64_t v2 = [v1 loginChoices];
  [v2 count];
  OUTLINED_FUNCTION_1_0(&dword_1C38C1000, v3, v4, "Cell row %ld >= %ld choices available.", v5, v6, v7, v8, 0);
}

- (void)_selectScope:localRow:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1C38C1000, v0, v1, "Unknown scope selected %@", v2, v3, v4, v5, v6);
}

- (void)_selectSingleEmailAtIndex:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v3 = [NSNumber numberWithInteger:a1];
  uint64_t v4 = NSNumber;
  uint64_t v5 = [a2 editableScopeChoices];
  id v12 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "emailCount"));
  OUTLINED_FUNCTION_1_0(&dword_1C38C1000, v6, v7, "Select email at index %@ beyond count %@.", v8, v9, v10, v11, 2u);
}

- (void)_computeNameEditHeightChange
{
}

- (void)_prepareScopeChoices:(uint64_t)a3 withLoginChoice:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)validateReadyForAuthorization
{
}

- (void)passwordAuthenticationCompletedWithResults:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1C38C1000, v0, OS_LOG_TYPE_DEBUG, "Password authenticate result: %@", v1, 0xCu);
}

- (void)passwordAuthenticationCompletedWithResults:error:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1C38C1000, v0, v1, "Error during password authentication %@", v2, v3, v4, v5, v6);
}

@end