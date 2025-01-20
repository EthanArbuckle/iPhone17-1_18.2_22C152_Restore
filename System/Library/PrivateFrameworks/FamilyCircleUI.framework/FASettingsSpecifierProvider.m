@interface FASettingsSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (BOOL)_isEnabled;
- (BOOL)handleURL:(id)a3;
- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5;
- (BOOL)shouldUseModernNavigationForPresenter:(id)a3;
- (FASettingsSpecifierProvider)initWithAccountManager:(id)a3;
- (FASettingsSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (NSArray)specifiers;
- (id)_accountStore;
- (id)_acuPresenter;
- (id)_appleAccount;
- (id)_configureContextWithType:(id)a3 resourceDictionary:(id)a4;
- (id)_familyBaseSpecifierWithState:(unint64_t)a3;
- (id)_familySpecifier;
- (id)_grandSlamSigner;
- (id)_invitationsCellSpecifier;
- (id)_requestConfigurator;
- (id)_valueForFamilySpecifier:(id)a3;
- (id)_valueForInvitiationsSpecifier:(id)a3;
- (unint64_t)_familyState;
- (unint64_t)cachePolicy;
- (void)_clearFamilyState;
- (void)_handleFamilyChanged:(id)a3;
- (void)_handleFamilyDetailsResponse:(id)a3 error:(id)a4 completion:(id)a5;
- (void)_handleFamilyEligibilityResponse:(id)a3 completion:(id)a4;
- (void)_handleObjectModelChangeForController:(id)a3 objectModel:(id)a4 isModal:(BOOL)a5;
- (void)_handleShowChildTransferActionURL:(id)a3;
- (void)_handleShowFamilyInviteActionURL:(id)a3;
- (void)_handleShowFamilySettingsURL:(id)a3;
- (void)_handleShowFamilySettingsV2WithResourceDictionary:(id)a3;
- (void)_handleShowInviteActionURL:(id)a3 isChildTransfer:(BOOL)a4;
- (void)_handleShowInvitesActionURL:(id)a3;
- (void)_handleStartFamilySetupActionURL:(id)a3;
- (void)_initiateFamily;
- (void)_initiateFamilyWithResources:(id)a3;
- (void)_loadFamilyDetailsWithCompletion:(id)a3;
- (void)_loadFamilyEligibilityWithCompletion:(id)a3;
- (void)_pendingInvitationsSpecifierWasTapped:(id)a3;
- (void)_presentFlowWithEventType:(id)a3 completion:(id)a4;
- (void)_presentPendingInvitesRemoteUI;
- (void)_presentViewController:(id)a3;
- (void)_reloadFamily;
- (void)_reloadFamilySpecifiers;
- (void)_reloadFamilySpecifiersAnimated:(BOOL)a3;
- (void)_setUpFamilySpecifierWasTapped:(id)a3;
- (void)_showUnderageAlertWithEligibilityResponse:(id)a3;
- (void)_viewFamilySpecifierWasTapped;
- (void)_viewFamilyWithResourceDictionary:(id)a3;
- (void)dealloc;
- (void)familySettingsViewController2StopFamilySharing:(id)a3;
- (void)familySetupViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4;
- (void)presentFamilySettingsFromPresenter:(id)a3;
- (void)reloadSpecifiers;
- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4;
- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation FASettingsSpecifierProvider

- (FASettingsSpecifierProvider)initWithAccountManager:(id)a3
{
  return [(FASettingsSpecifierProvider *)self initWithAccountManager:a3 presenter:0];
}

- (FASettingsSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(FASettingsSpecifierProvider *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_presenter, v8);
    objc_storeStrong((id *)&v10->_accountManager, a3);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingFamilyDetailsCompletionBlocks = v10->_pendingFamilyDetailsCompletionBlocks;
    v10->_pendingFamilyDetailsCompletionBlocks = v11;

    v13 = [MEMORY[0x263F087C8] defaultCenter];
    [v13 addObserver:v10 selector:sel__handleFamilyChanged_ name:*MEMORY[0x263F3BDE0] object:0];

    v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    networkActivityQueue = v10->_networkActivityQueue;
    v10->_networkActivityQueue = v14;

    v16 = v10->_networkActivityQueue;
    v17 = dispatch_get_global_queue(33, 0);
    [(NSOperationQueue *)v16 setUnderlyingQueue:v17];
  }
  return v10;
}

- (id)_accountStore
{
  return (id)[(AIDAAccountManager *)self->_accountManager accountStore];
}

- (id)_appleAccount
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v3;
}

- (id)_grandSlamSigner
{
  grandSlamSigner = self->_grandSlamSigner;
  if (!grandSlamSigner)
  {
    v4 = [(AIDAAccountManager *)self->_accountManager aidaAccountForService:*MEMORY[0x263F26D28]];
    id v5 = objc_alloc(MEMORY[0x263F25878]);
    v6 = [(AIDAAccountManager *)self->_accountManager accountStore];
    id v7 = (AAGrandSlamSigner *)[v5 initWithAccountStore:v6 grandSlamAccount:v4 appTokenID:*MEMORY[0x263F256D0]];
    id v8 = self->_grandSlamSigner;
    self->_grandSlamSigner = v7;

    grandSlamSigner = self->_grandSlamSigner;
  }
  return grandSlamSigner;
}

- (id)_requestConfigurator
{
  requestConfigurator = self->_requestConfigurator;
  if (!requestConfigurator)
  {
    id v4 = objc_alloc(MEMORY[0x263F3BFA8]);
    id v5 = [(FASettingsSpecifierProvider *)self _appleAccount];
    v6 = (FARequestConfigurator *)[v4 initWithAccount:v5];
    id v7 = self->_requestConfigurator;
    self->_requestConfigurator = v6;

    requestConfigurator = self->_requestConfigurator;
  }
  return requestConfigurator;
}

- (BOOL)_isEnabled
{
  v2 = [(FASettingsSpecifierProvider *)self _appleAccount];
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "aa_needsToVerifyTerms"))
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      id v5 = objc_msgSend(v3, "aa_suspensionInfo");
      int v4 = [v5 isFamilySuspended] ^ 1;
    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (void)setSpecifiers:(id)a3
{
  if (!self->_specifiers && self->_didFailToGetFamilyDetails) {
    self->_didFailToGetFamilyDetails = 0;
  }
}

- (NSArray)specifiers
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([MEMORY[0x263F25820] isMultiUserMode])
  {
    int v4 = _FALogSystem();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    id v5 = "Device is in multi-user mode, not showing Family Sharing specifiers.";
LABEL_12:
    _os_log_impl(&dword_2189F0000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
    goto LABEL_13;
  }
  v6 = [(FASettingsSpecifierProvider *)self _appleAccount];

  if (!v6)
  {
    int v4 = _FALogSystem();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    id v5 = "User not signed in to AppleAccount, not showing family sharing specifiers.";
    goto LABEL_12;
  }
  int v4 = [(FASettingsSpecifierProvider *)self _familySpecifier];
  if (v4) {
    [v3 addObject:v4];
  }
  id v7 = [(FASettingsSpecifierProvider *)self _invitationsCellSpecifier];
  if (v7) {
    [v3 insertObject:v7 atIndex:0];
  }

LABEL_13:
  if ((unint64_t)[v3 count] >= 2)
  {
    id v8 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"Family"];
    [v3 insertObject:v8 atIndex:0];
  }
  if (![(FASettingsSpecifierProvider *)self _isEnabled])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v3;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      uint64_t v13 = *MEMORY[0x263F600A8];
      uint64_t v14 = MEMORY[0x263EFFA80];
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "setProperty:forKey:", v14, v13, (void)v20);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v11);
    }
  }
  v16 = (NSArray *)objc_msgSend(v3, "copy", (void)v20);
  specifiers = self->_specifiers;
  self->_specifiers = v16;

  v18 = self->_specifiers;
  return v18;
}

- (unint64_t)_familyState
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_didFailToGetFamilyDetails)
  {
    unint64_t v2 = 4;
    goto LABEL_10;
  }
  if (self->_isLoadingFamilyDetails)
  {
    unint64_t v2 = 3;
    goto LABEL_10;
  }
  int v4 = [(FAFamilyCircle *)self->_familyCircle pendingMembers];
  if ([v4 count])
  {

LABEL_8:
    unint64_t v2 = 1;
LABEL_9:
    id v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v7 setInteger:v2 forKey:@"_FAFamilyCachedFamilyStateKey"];

    goto LABEL_10;
  }
  id v5 = [(FAFamilyCircle *)self->_familyCircle members];
  uint64_t v6 = [v5 count];

  if (v6) {
    goto LABEL_8;
  }
  if (self->_familyEligibilityStatus)
  {
    unint64_t v2 = 2;
    goto LABEL_9;
  }
  unint64_t v2 = 0;
LABEL_10:
  id v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    unint64_t v11 = v2;
    _os_log_impl(&dword_2189F0000, v8, OS_LOG_TYPE_DEFAULT, "Returning FAFamilySpecifierState - %lu", (uint8_t *)&v10, 0xCu);
  }

  return v2;
}

- (id)_invitationsCellSpecifier
{
  if (self->_invitationSummary || self->_isHandlingURLForInvite)
  {
    invitationsCellSpecifier = self->_invitationsCellSpecifier;
    if (!invitationsCellSpecifier)
    {
      int v4 = (void *)MEMORY[0x263F5FC40];
      id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v6 = [v5 localizedStringForKey:@"FAMILY_INVITATIONS_CELL" value:&stru_26CA2C800 table:@"Localizable"];
      id v7 = [v4 preferenceSpecifierNamed:v6 target:self set:0 get:sel__valueForInvitiationsSpecifier_ detail:0 cell:2 edit:0];
      id v8 = self->_invitationsCellSpecifier;
      self->_invitationsCellSpecifier = v7;

      [(PSSpecifier *)self->_invitationsCellSpecifier setControllerLoadAction:sel__pendingInvitationsSpecifierWasTapped_];
      [(PSSpecifier *)self->_invitationsCellSpecifier setIdentifier:@"INVITATIONS"];
      invitationsCellSpecifier = self->_invitationsCellSpecifier;
    }
    id v9 = invitationsCellSpecifier;
  }
  else
  {
    unint64_t v11 = _FALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2189F0000, v11, OS_LOG_TYPE_DEFAULT, "No invitations returning nil invitations specfier", buf, 2u);
    }

    id v9 = 0;
  }
  return v9;
}

- (id)_familySpecifier
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v4 = [v3 integerForKey:@"_FAFamilyCachedFamilyStateKey"];

  BOOL v5 = v4 && !self->_familyCircle && !self->_didFailToGetFamilyDetails;
  uint64_t v6 = _FALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    BOOL v15 = v5;
    __int16 v16 = 2048;
    uint64_t v17 = v4;
    _os_log_impl(&dword_2189F0000, v6, OS_LOG_TYPE_DEFAULT, "Using cache - %d with state - %lu", buf, 0x12u);
  }

  if (self->_familyCircle || self->_didFailToGetFamilyDetails)
  {
    if (v5) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  [(FASettingsSpecifierProvider *)self _loadFamilyDetailsWithCompletion:0];
  if (!v5) {
LABEL_10:
  }
    uint64_t v4 = [(FASettingsSpecifierProvider *)self _familyState];
LABEL_11:
  switch(v4)
  {
    case 1:
      id v7 = [(FASettingsSpecifierProvider *)self _familyBaseSpecifierWithState:1];
      [v7 setControllerLoadAction:sel__viewFamilySpecifierWasTapped];
      id v8 = @"Family";
      goto LABEL_17;
    case 2:
      id v7 = [(FASettingsSpecifierProvider *)self _familyBaseSpecifierWithState:2];
      [v7 setButtonAction:sel__setUpFamilySpecifierWasTapped_];
      id v8 = @"INITIATE_FAMILY";
LABEL_17:
      [v7 setIdentifier:v8];
      break;
    case 3:
      id v7 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
      break;
    case 4:
      int v10 = (void *)MEMORY[0x263F5FC40];
      unint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v12 = [v11 localizedStringForKey:@"FAILED_TO_LOAD_FAMILY_STATUS" value:&stru_26CA2C800 table:@"Localizable"];
      id v7 = [v10 preferenceSpecifierNamed:v12 target:0 set:0 get:0 detail:0 cell:-1 edit:0];

      [v7 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
      break;
    default:
      id v9 = _FALogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2189F0000, v9, OS_LOG_TYPE_DEFAULT, "Invalid family state, returning nil specifier", buf, 2u);
      }

      id v7 = 0;
      break;
  }
  return v7;
}

- (id)_familyBaseSpecifierWithState:(unint64_t)a3
{
  BOOL v5 = (void *)MEMORY[0x263F827E8];
  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v5 imageNamed:@"family" inBundle:v6];

  id v8 = (void *)MEMORY[0x263F5FC40];
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v10 = [v9 localizedStringForKey:@"FAMILY_CELL_LABEL" value:&stru_26CA2C800 table:@"Localizable"];
  unint64_t v11 = [v8 preferenceSpecifierNamed:v10 target:self set:0 get:sel__valueForFamilySpecifier_ detail:0 cell:2 edit:0];

  [v11 setProperty:v7 forKey:*MEMORY[0x263F60140]];
  uint64_t v12 = [NSNumber numberWithUnsignedInteger:a3];
  [v11 setProperty:v12 forKey:@"_FAFamilyCachedFamilyStateKey"];

  return v11;
}

- (unint64_t)cachePolicy
{
  return 2;
}

- (void)_loadFamilyDetailsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  BOOL v5 = [(FASettingsSpecifierProvider *)self _appleAccount];
  if (v5)
  {
    if (v4)
    {
      pendingFamilyDetailsCompletionBlocks = self->_pendingFamilyDetailsCompletionBlocks;
      id v7 = _Block_copy(v4);
      [(NSMutableArray *)pendingFamilyDetailsCompletionBlocks addObject:v7];
    }
    if (!self->_isLoadingFamilyDetails)
    {
      self->_isLoadingFamilyDetails = 1;
      id v8 = objc_opt_new();
      objc_msgSend(v8, "setCachePolicy:", -[FASettingsSpecifierProvider cachePolicy](self, "cachePolicy"));
      [v8 setQualityOfService:33];
      [v8 setPromptUserToResolveAuthenticatonFailure:1];
      id v9 = _FALogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2189F0000, v9, OS_LOG_TYPE_DEFAULT, "Starting family request.", buf, 2u);
      }

      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __64__FASettingsSpecifierProvider__loadFamilyDetailsWithCompletion___block_invoke;
      v11[3] = &unk_264349A30;
      v11[4] = self;
      [v8 startRequestWithCompletionHandler:v11];
    }
  }
  else
  {
    int v10 = _FALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2189F0000, v10, OS_LOG_TYPE_DEFAULT, "Attempted to load family details without an Apple Account, bailing!", buf, 2u);
    }

    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

void __64__FASettingsSpecifierProvider__loadFamilyDetailsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _FALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2189F0000, v7, OS_LOG_TYPE_DEFAULT, "FACacheImageMarqueeOperationWrapper op being fired off", buf, 2u);
  }

  id v8 = [[FACacheImageMarqueeOperationWrapper alloc] initWithFamilyCircle:v5];
  [(FACacheImageMarqueeOperationWrapper *)v8 generateMarqueeWith:1];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__FASettingsSpecifierProvider__loadFamilyDetailsWithCompletion___block_invoke_84;
  block[3] = &unk_2643491B8;
  block[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __64__FASettingsSpecifierProvider__loadFamilyDetailsWithCompletion___block_invoke_84(void *a1)
{
  unint64_t v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = a1[6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__FASettingsSpecifierProvider__loadFamilyDetailsWithCompletion___block_invoke_2;
  v5[3] = &unk_264349A08;
  v5[4] = v2;
  return [v2 _handleFamilyDetailsResponse:v1 error:v3 completion:v5];
}

unsigned char *__64__FASettingsSpecifierProvider__loadFamilyDetailsWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * i));
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "removeAllObjects", (void)v11);
  result = *(unsigned char **)(a1 + 32);
  if (result[160]) {
    BOOL v10 = a2 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    [result _setUpFamilySpecifierWasTapped:0];
    result = *(unsigned char **)(a1 + 32);
  }
  result[160] = 0;
  return result;
}

- (void)_handleFamilyDetailsResponse:(id)a3 error:(id)a4 completion:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  self->_isLoadingFamilyDetails = 0;
  if (!v10)
  {
    p_familyCircle = &self->_familyCircle;
    objc_storeStrong((id *)&self->_familyCircle, a3);
    long long v14 = _FALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v15 = [(FAFamilyCircle *)*p_familyCircle _serverResponse];
      *(_DWORD *)buf = 138412290;
      id v49 = v15;
      _os_log_impl(&dword_2189F0000, v14, OS_LOG_TYPE_DEFAULT, "Family details response: %@", buf, 0xCu);
    }
    uint64_t v16 = [(FAFamilyCircle *)*p_familyCircle invites];
    uint64_t v17 = [v16 count];

    if (v17 >= 1 && [(FAFamilyCircle *)*p_familyCircle shouldShowInvites])
    {
      uint64_t v18 = (void *)MEMORY[0x263F08A30];
      v19 = [NSNumber numberWithInteger:v17];
      long long v20 = [v18 localizedStringFromNumber:v19 numberStyle:0];
      invitationSummary = self->_invitationSummary;
      self->_invitationSummary = v20;

      long long v22 = [(FAFamilyCircle *)self->_familyCircle invites];
      long long v23 = (NSMutableArray *)[v22 mutableCopy];
      pendingInvites = self->_pendingInvites;
      self->_pendingInvites = v23;
    }
    v25 = [(FAFamilyCircle *)*p_familyCircle members];
    uint64_t v26 = [v25 count];

    v27 = [(FAFamilyCircle *)*p_familyCircle pendingMembers];
    uint64_t v28 = [v27 count];

    if (!(v28 | v26))
    {
      familyStatusSummary = self->_familyStatusSummary;
      self->_familyStatusSummary = 0;

      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __77__FASettingsSpecifierProvider__handleFamilyDetailsResponse_error_completion___block_invoke;
      v46[3] = &unk_264349A58;
      v46[4] = self;
      id v47 = v11;
      [(FASettingsSpecifierProvider *)self _loadFamilyEligibilityWithCompletion:v46];

      goto LABEL_26;
    }
    v30 = [(FAFamilyCircle *)*p_familyCircle me];
    if (([v30 hasLinkediTunesAccount] & 1) == 0)
    {
      v31 = [v30 iTunesNotLinkedMessage];
      v32 = self->_familyStatusSummary;
      self->_familyStatusSummary = v31;

      if (![(NSString *)self->_familyStatusSummary length])
      {
        v33 = _FALogSystem();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = [v30 appleID];
          v35 = [(FAFamilyCircle *)*p_familyCircle _serverResponse];
          *(_DWORD *)buf = 138412546;
          id v49 = v34;
          __int16 v50 = 2112;
          v51 = v35;
          _os_log_impl(&dword_2189F0000, v33, OS_LOG_TYPE_DEFAULT, "Member %@ is not sharing purchases but there is no iTunesNotLinkedMessage, response dictionary is %@", buf, 0x16u);
        }
      }
    }
    if (!self->_familyStatusSummary)
    {
      if (v26 > 1)
      {
        v36 = NSString;
        v37 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v38 = [v37 localizedStringForKey:@"FAMILY_MEMBERS_IN_FAMILY" value:&stru_26CA2C800 table:@"Localizable"];
        objc_msgSend(v36, "localizedStringWithFormat:", v38, v26);
        v39 = (NSString *)objc_claimAutoreleasedReturnValue();
        v40 = self->_familyStatusSummary;
        self->_familyStatusSummary = v39;

LABEL_24:
        goto LABEL_25;
      }
      if (v28 >= 1)
      {
        if (v28 == 1)
        {
          v37 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v41 = [v37 localizedStringForKey:@"FAMILY_SENT_INVITE_ONE" value:&stru_26CA2C800 table:@"Localizable"];
          v38 = self->_familyStatusSummary;
          self->_familyStatusSummary = v41;
        }
        else
        {
          v42 = NSString;
          v37 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v38 = [v37 localizedStringForKey:@"FAMILY_SENT_INVITES_MANY" value:&stru_26CA2C800 table:@"Localizable"];
          v43 = [NSNumber numberWithInteger:v28];
          objc_msgSend(v42, "stringWithFormat:", v38, v43);
          v44 = (NSString *)objc_claimAutoreleasedReturnValue();
          v45 = self->_familyStatusSummary;
          self->_familyStatusSummary = v44;
        }
        goto LABEL_24;
      }
    }
LABEL_25:
    [(FASettingsSpecifierProvider *)self reloadSpecifiers];
    (*((void (**)(id, uint64_t))v11 + 2))(v11, 1);

    goto LABEL_26;
  }
  self->_didFailToGetFamilyDetails = 1;
  long long v12 = _FALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v49 = v10;
    _os_log_impl(&dword_2189F0000, v12, OS_LOG_TYPE_DEFAULT, "Failed to get family details: %@", buf, 0xCu);
  }

  [(FASettingsSpecifierProvider *)self reloadSpecifiers];
  (*((void (**)(id, void))v11 + 2))(v11, 0);
LABEL_26:
}

uint64_t __77__FASettingsSpecifierProvider__handleFamilyDetailsResponse_error_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  unint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)_setUpFamilySpecifierWasTapped:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    int v9 = 138412290;
    id v10 = WeakRetained;
    _os_log_impl(&dword_2189F0000, v4, OS_LOG_TYPE_DEFAULT, "Setup Family activated with presenter %@", (uint8_t *)&v9, 0xCu);
  }
  if (self->_familyEligibilityResponse)
  {
    int64_t familyEligibilityStatus = self->_familyEligibilityStatus;
    if (familyEligibilityStatus == 1)
    {
      id v8 = _FALogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_2189F0000, v8, OS_LOG_TYPE_DEFAULT, "Starting Family Setup Flow", (uint8_t *)&v9, 2u);
      }

      [(FASettingsSpecifierProvider *)self _initiateFamily];
    }
    else if (familyEligibilityStatus == 2)
    {
      -[FASettingsSpecifierProvider _showUnderageAlertWithEligibilityResponse:](self, "_showUnderageAlertWithEligibilityResponse:");
    }
  }
  else
  {
    uint64_t v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_2189F0000, v7, OS_LOG_TYPE_DEFAULT, "Error: The user tapped the Family setup specifier before we got a response from the server. We need to confirm eligibility prior.", (uint8_t *)&v9, 2u);
    }

    self->_delayedEnterInitiateFlow = 1;
  }
}

- (void)_reloadFamily
{
  [(FASettingsSpecifierProvider *)self _clearFamilyState];
  [(FASettingsSpecifierProvider *)self _reloadFamilySpecifiersAnimated:1];
}

- (void)_initiateFamily
{
}

- (void)_initiateFamilyWithResources:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FASettingsSpecifierProvider *)self _configureContextWithType:@"FACircleEventTypeInitiate" resourceDictionary:v4];
  context = self->_context;
  self->_context = v5;

  uint64_t v7 = [(NSArray *)self->_specifiers specifierForID:@"INITIATE_FAMILY"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained specifierProvider:self willBeginLoadingSpecifier:v7];

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__2;
  long long v21 = __Block_byref_object_dispose__2;
  int v9 = [FACircleStateController alloc];
  id v10 = objc_loadWeakRetained((id *)&self->_presenter);
  long long v22 = [(FACircleStateController *)v9 initWithPresenter:v10];

  [(id)v18[5] setPresentationType:2];
  uint64_t v11 = (void *)v18[5];
  long long v12 = self->_context;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__FASettingsSpecifierProvider__initiateFamilyWithResources___block_invoke;
  v14[3] = &unk_264349A80;
  uint64_t v16 = &v17;
  v14[4] = self;
  id v13 = v7;
  id v15 = v13;
  [v11 performWithContext:v12 completion:v14];

  _Block_object_dispose(&v17, 8);
}

void __60__FASettingsSpecifierProvider__initiateFamilyWithResources___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[6] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__FASettingsSpecifierProvider__initiateFamilyWithResources___block_invoke_2;
  block[3] = &unk_2643491B8;
  uint64_t v6 = (void *)a1[5];
  block[4] = a1[4];
  id v9 = v6;
  id v10 = v3;
  id v7 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __60__FASettingsSpecifierProvider__initiateFamilyWithResources___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 184));
  [WeakRetained specifierProvider:*(void *)(a1 + 32) didFinishLoadingSpecifier:*(void *)(a1 + 40)];

  uint64_t result = [*(id *)(a1 + 48) loadSuccess];
  if (result)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    return [v4 _reloadFamily];
  }
  return result;
}

- (id)_configureContextWithType:(id)a3 resourceDictionary:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[FACircleContext alloc] initWithEventType:v6];

  [(FACircleContext *)v7 setClientName:@"Preferences"];
  if ([v5 count])
  {
    id v8 = [v5 objectForKeyedSubscript:@"clientAppContext"];

    if (v8)
    {
      id v9 = [v5 objectForKeyedSubscript:@"clientAppContext"];
      [(FACircleContext *)v7 setClientName:v9];
    }
  }

  return v7;
}

- (void)_showUnderageAlertWithEligibilityResponse:(id)a3
{
  id v4 = a3;
  id v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2189F0000, v5, OS_LOG_TYPE_DEFAULT, "Error: showing underage alert.", buf, 2u);
  }

  uint64_t v6 = [v4 underageEligibilityAlertTitle];
  uint64_t v7 = [v4 underageEligibilityAlertMessage];

  if (v6 | v7)
  {
    id v9 = (void *)MEMORY[0x263F82418];
    id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v11 = [v10 localizedStringForKey:@"OK" value:&stru_26CA2C800 table:@"Localizable"];
    id v8 = [v9 alertWithTitle:v6 message:v7 buttonTitle:v11];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    [WeakRetained presentViewController:v8 animated:1 completion:0];
  }
  else
  {
    id v8 = _FALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_2189F0000, v8, OS_LOG_TYPE_DEFAULT, "Server did not provide under alert title and message. Cannot show alert!", v13, 2u);
    }
  }
}

- (void)familySetupViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4
{
  if (a4)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __80__FASettingsSpecifierProvider_familySetupViewController_didCompleteWithSuccess___block_invoke;
    v5[3] = &unk_264349A08;
    v5[4] = self;
    [(FASettingsSpecifierProvider *)self _loadFamilyDetailsWithCompletion:v5];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    [WeakRetained dismissViewControllerAnimated:1 completion:0];
  }
}

void __80__FASettingsSpecifierProvider_familySetupViewController_didCompleteWithSuccess___block_invoke(uint64_t a1)
{
  unint64_t v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  id v4 = *(id **)(a1 + 32);
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id WeakRetained = objc_loadWeakRetained(v4 + 4);
    [WeakRetained dismissViewControllerAnimated:1 completion:0];

    uint64_t v6 = *(void **)(a1 + 32);
    [v6 _viewFamilySpecifierWasTapped];
  }
  else
  {
    [v4 _viewFamilySpecifierWasTapped];
    id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    [v7 dismissViewControllerAnimated:1 completion:0];
  }
}

- (id)_valueForInvitiationsSpecifier:(id)a3
{
  return self->_invitationSummary;
}

- (void)_pendingInvitationsSpecifierWasTapped:(id)a3
{
  id v4 = a3;
  if (!self->_familyCircle)
  {
    uint64_t v6 = _FALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      id v7 = "Error: pending invites specifier cannot possibly be tapped when no family info is available!";
      id v8 = (uint8_t *)&v10;
LABEL_8:
      _os_log_impl(&dword_2189F0000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (![(NSMutableArray *)self->_pendingInvites count])
  {
    uint64_t v6 = _FALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      id v7 = "No invites to send to the Invitations VC.";
      id v8 = (uint8_t *)&v9;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  [(PSSpecifier *)self->_invitationsCellSpecifier setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  id v5 = [(FASettingsSpecifierProvider *)self delegate];
  [v5 specifierProvider:self willBeginLoadingSpecifier:self->_invitationsCellSpecifier];

  [(FASettingsSpecifierProvider *)self _presentPendingInvitesRemoteUI];
LABEL_10:
}

- (void)_presentFlowWithEventType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void))v7;
  if (v6)
  {
    __int16 v9 = [[FACircleContext alloc] initWithEventType:v6];
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__2;
    long long v20 = __Block_byref_object_dispose__2;
    __int16 v10 = [FACircleStateController alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    long long v21 = [(FACircleStateController *)v10 initWithPresenter:WeakRetained];

    long long v12 = (void *)v17[5];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __68__FASettingsSpecifierProvider__presentFlowWithEventType_completion___block_invoke;
    v13[3] = &unk_264349AA8;
    id v15 = &v16;
    long long v14 = v8;
    [v12 performWithContext:v9 completion:v13];

    _Block_object_dispose(&v16, 8);
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    __int16 v9 = (FACircleContext *)[objc_alloc(MEMORY[0x263F3BEF0]) initWithLoadSuccess:1 error:0 userInfo:0];
    ((void (**)(void, FACircleContext *))v8)[2](v8, v9);
    goto LABEL_5;
  }
LABEL_6:
}

void __68__FASettingsSpecifierProvider__presentFlowWithEventType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

- (void)_presentPendingInvitesRemoteUI
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __61__FASettingsSpecifierProvider__presentPendingInvitesRemoteUI__block_invoke;
  v2[3] = &unk_264349AD0;
  v2[4] = self;
  [(FASettingsSpecifierProvider *)self _presentFlowWithEventType:@"FACircleEventTypeGetFamilyInvitationsUI" completion:v2];
}

void __61__FASettingsSpecifierProvider__presentPendingInvitesRemoteUI__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__FASettingsSpecifierProvider__presentPendingInvitesRemoteUI__block_invoke_2;
  block[3] = &unk_2643489F8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __61__FASettingsSpecifierProvider__presentPendingInvitesRemoteUI__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _reloadFamily];
  [*(id *)(*(void *)(a1 + 32) + 48) setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 specifierProvider:*(void *)(a1 + 32) didFinishLoadingSpecifier:*(void *)(*(void *)(a1 + 32) + 48)];
}

- (id)_valueForFamilySpecifier:(id)a3
{
  id v4 = [a3 propertyForKey:@"_FAFamilyCachedFamilyStateKey"];
  uint64_t v5 = [v4 integerValue];

  if (v5 == 2)
  {
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"SETUP_FAMILY" value:&stru_26CA2C800 table:@"Localizable"];
  }
  else
  {
    id v7 = self->_familyStatusSummary;
  }
  return v7;
}

- (void)_viewFamilySpecifierWasTapped
{
  p_presenter = &self->_presenter;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  BOOL v5 = [(FASettingsSpecifierProvider *)self shouldUseModernNavigationForPresenter:WeakRetained];

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_presenter);
    [(FASettingsSpecifierProvider *)self presentFamilySettingsFromPresenter:v6];
  }
  else
  {
    [(FASettingsSpecifierProvider *)self _viewFamilyWithResourceDictionary:self->_cachedResourceDictionary];
  }
  cachedResourceDictionary = self->_cachedResourceDictionary;
  self->_cachedResourceDictionary = 0;
}

- (void)_viewFamilyWithResourceDictionary:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v25 = a3;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v25;
    _os_log_impl(&dword_2189F0000, v4, OS_LOG_TYPE_DEFAULT, "_viewFamilyWithResourceDictionary: %@", buf, 0xCu);
  }

  BOOL v5 = [(NSArray *)self->_specifiers specifierForID:@"Family"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained specifierProvider:self didFinishLoadingSpecifier:v5];

  id v7 = objc_loadWeakRetained((id *)&self->_delegate);
  [v7 specifierProvider:self willBeginLoadingSpecifier:v5];

  if (!v5)
  {
    BOOL v5 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Family" target:0 set:0 get:0 detail:0 cell:13 edit:0];
    [v5 setIdentifier:@"Family"];
  }
  if (self->_familyCircle)
  {
    if (!self->_familyPictureStore)
    {
      id v8 = [[FAProfilePictureStore alloc] initWithFamilyCircle:self->_familyCircle];
      familyPictureStore = self->_familyPictureStore;
      self->_familyPictureStore = v8;
    }
    __int16 v10 = [FAFamilySettingsMemberSpecifierProvider alloc];
    uint64_t v11 = [(FASettingsSpecifierProvider *)self _appleAccount];
    v24 = [(FAFamilySettingsMemberSpecifierProvider *)v10 initWithAppleAccount:v11 familyCircle:self->_familyCircle familyPictureStore:self->_familyPictureStore];

    long long v12 = [_TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 alloc];
    id v13 = [(FASettingsSpecifierProvider *)self _appleAccount];
    long long v14 = [(FASettingsSpecifierProvider *)self _grandSlamSigner];
    familyCircle = self->_familyCircle;
    uint64_t v16 = self->_familyPictureStore;
    accountManager = self->_accountManager;
    uint64_t v18 = [MEMORY[0x263F3BF90] sharedInstance];
    uint64_t v19 = [(FAFamilySettingsViewControllerV2 *)v12 initWithAppleAccount:v13 grandSlamSigner:v14 familyCircle:familyCircle pictureStore:v16 accountManager:accountManager peopleDiscoveryService:v18];

    [(FAFamilySettingsViewControllerV2 *)v19 setDelegate:self];
    id v20 = objc_loadWeakRetained((id *)&self->_presenter);
    long long v21 = [v20 rootController];
    [(FARestorableViewController *)v19 setRootController:v21];

    [(FARestorableViewController *)v19 setSpecifier:v5];
    objc_initWeak((id *)buf, self);
    long long v22 = self->_familyPictureStore;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __65__FASettingsSpecifierProvider__viewFamilyWithResourceDictionary___block_invoke_3;
    v26[3] = &unk_264349AF8;
    objc_copyWeak(&v31, (id *)buf);
    long long v23 = v19;
    v27 = v23;
    id v28 = v5;
    v29 = self;
    id v30 = v25;
    [(FAProfilePictureStore *)v22 fetchProfileImagesWithCompletion:v26];

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __65__FASettingsSpecifierProvider__viewFamilyWithResourceDictionary___block_invoke;
    v32[3] = &unk_264349098;
    v32[4] = self;
    id v33 = v25;
    [(FASettingsSpecifierProvider *)self _loadFamilyDetailsWithCompletion:v32];
  }
}

void __65__FASettingsSpecifierProvider__viewFamilyWithResourceDictionary___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __65__FASettingsSpecifierProvider__viewFamilyWithResourceDictionary___block_invoke_2;
  v2[3] = &unk_264348AE0;
  uint64_t v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __65__FASettingsSpecifierProvider__viewFamilyWithResourceDictionary___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _viewFamilyWithResourceDictionary:*(void *)(a1 + 40)];
}

void __65__FASettingsSpecifierProvider__viewFamilyWithResourceDictionary___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(WeakRetained + 23);
    [v4 specifierProvider:v3 didFinishLoadingSpecifier:*(void *)(a1 + 40)];

    id v5 = objc_loadWeakRetained(v3 + 4);
    objc_msgSend(*(id *)(a1 + 32), "set_presenter:", v5);

    [*(id *)(a1 + 48) _presentViewController:*(void *)(a1 + 32)];
    id v6 = *(void **)(a1 + 48);
    id v7 = objc_msgSend(*(id *)(a1 + 56), "fa_eventTypeForFamilyActionURL");
    [v6 _presentFlowWithEventType:v7 completion:0];
  }
  else
  {
    id v8 = _FALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __65__FASettingsSpecifierProvider__viewFamilyWithResourceDictionary___block_invoke_3_cold_1(a1, v8);
    }
  }
}

- (void)_loadFamilyEligibilityWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke;
  aBlock[3] = &unk_264348B20;
  aBlock[4] = self;
  id v5 = _Block_copy(aBlock);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke_2;
  v14[3] = &unk_264349B48;
  v14[4] = self;
  id v15 = v4;
  id v6 = v4;
  id v7 = _Block_copy(v14);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke_4;
  v11[3] = &unk_264349B98;
  v11[4] = self;
  id v12 = v5;
  id v13 = v7;
  id v8 = v7;
  __int16 v9 = v5;
  __int16 v10 = _Block_copy(v11);
  v9[2](v9, v10);
}

void __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F25858];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [*(id *)(a1 + 32) _grandSlamSigner];
  id v10 = (id)[v5 initWithGrandSlamSigner:v6];

  id v7 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  id v8 = objc_msgSend(v7, "ams_activeiTunesAccount");
  [v10 setITunesAccount:v8];

  __int16 v9 = (void *)[objc_alloc(MEMORY[0x263F25938]) initWithRequest:v10 handler:v4];
  [*(id *)(*(void *)(a1 + 32) + 120) addOperation:v9];
}

void __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke_3;
  block[3] = &unk_264349B20;
  id v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleFamilyEligibilityResponse:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke_4(id *a1, void *a2)
{
  v18[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [a1[4] _appleAccount];
  if ([v3 statusCode] == 401 && v4)
  {
    id v5 = _FALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2189F0000, v5, OS_LOG_TYPE_DEFAULT, "Family eligibility check request returned 401. We need to re-auth...", buf, 2u);
    }

    uint64_t v6 = *MEMORY[0x263EFB390];
    v18[0] = MEMORY[0x263EFFA88];
    uint64_t v7 = *MEMORY[0x263EFB380];
    v17[0] = v6;
    v17[1] = v7;
    uint64_t v16 = *MEMORY[0x263F256D0];
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    v18[1] = v8;
    __int16 v9 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

    id v10 = [a1[4] _accountStore];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke_122;
    v11[3] = &unk_264349B70;
    id v13 = a1[5];
    id v14 = a1[6];
    id v12 = v3;
    [v10 renewCredentialsForAccount:v4 options:v9 completion:v11];
  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke_122(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = _FALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_2189F0000, v6, OS_LOG_TYPE_DEFAULT, "Result of renewing credentials for family eligibility check request: %ld. Error: %@", buf, 0x16u);
  }

  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke_123;
    v7[3] = &unk_264348BC0;
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

uint64_t __68__FASettingsSpecifierProvider__loadFamilyEligibilityWithCompletion___block_invoke_123(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)_handleFamilyEligibilityResponse:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (void (**)(id, BOOL))a4;
  id v9 = [v7 error];

  if (v9)
  {
    id v10 = _FALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v7 error];
      int v14 = 138412290;
      id v15 = v11;
      __int16 v12 = "Failed to get family eligibility: %@";
LABEL_6:
      _os_log_impl(&dword_2189F0000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    self->_int64_t familyEligibilityStatus = [v7 eligibilityStatus];
    p_familyEligibilityResponse = &self->_familyEligibilityResponse;
    objc_storeStrong((id *)p_familyEligibilityResponse, a3);
    id v10 = _FALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(AAFamilyEligibilityResponse *)*p_familyEligibilityResponse responseDictionary];
      int v14 = 138412290;
      id v15 = v11;
      __int16 v12 = "Family eligibility response: %@";
      goto LABEL_6;
    }
  }

  v8[2](v8, v9 == 0);
}

- (void)reloadSpecifiers
{
}

- (void)_reloadFamilySpecifiers
{
}

- (void)_reloadFamilySpecifiersAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl(&dword_2189F0000, v5, OS_LOG_TYPE_DEFAULT, "FASettingsSpecifierProvider _reloadFamilySpecifiersAnimated: %d", (uint8_t *)v9, 8u);
  }

  uint64_t v6 = (void *)[(NSArray *)self->_specifiers copy];
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadSpecifiersForProvider:self oldSpecifiers:v6 animated:v3];
}

- (void)_clearFamilyState
{
  BOOL v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_2189F0000, v3, OS_LOG_TYPE_DEFAULT, "FASettingsSpecifierProvider _clearFamilyState", v9, 2u);
  }

  self->_didFailToGetFamilyDetails = 0;
  familyCircle = self->_familyCircle;
  self->_familyCircle = 0;

  pendingInvites = self->_pendingInvites;
  self->_pendingInvites = 0;

  self->_int64_t familyEligibilityStatus = 0;
  familyStatusSummary = self->_familyStatusSummary;
  self->_familyStatusSummary = 0;

  invitationSummary = self->_invitationSummary;
  self->_invitationSummary = 0;

  cachedResourceDictionary = self->_cachedResourceDictionary;
  self->_cachedResourceDictionary = 0;
}

- (BOOL)handleURL:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (NSDictionary *)[v4 copy];
  cachedResourceDictionary = self->_cachedResourceDictionary;
  self->_cachedResourceDictionary = v5;

  id v7 = _FALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_2189F0000, v7, OS_LOG_TYPE_DEFAULT, "Handle URL in: %@", (uint8_t *)&v11, 0xCu);
  }

  id v8 = [v4 objectForKeyedSubscript:@"aaaction"];
  if ([v8 isEqual:@"showFamilyInvite"])
  {
    [(FASettingsSpecifierProvider *)self _handleShowFamilyInviteActionURL:v4];
  }
  else if ([v8 isEqual:@"setupFamily"])
  {
    [(FASettingsSpecifierProvider *)self _handleStartFamilySetupActionURL:v4];
  }
  else if ([v8 isEqual:@"showFamilySettings"])
  {
    [(FASettingsSpecifierProvider *)self _handleShowFamilySettingsURL:v4];
  }
  else if ([v8 isEqual:@"showFamilySettingsV2"])
  {
    [(FASettingsSpecifierProvider *)self _handleShowFamilySettingsV2WithResourceDictionary:v4];
  }
  else if ([v8 isEqual:@"showChildTransferRequest"])
  {
    [(FASettingsSpecifierProvider *)self _handleShowChildTransferActionURL:v4];
  }
  else
  {
    if (![v8 isEqual:@"showAllInvites"])
    {
      BOOL v9 = 0;
      goto LABEL_16;
    }
    [(FASettingsSpecifierProvider *)self _handleShowInvitesActionURL:v4];
  }
  BOOL v9 = 1;
LABEL_16:

  return v9;
}

- (void)_handleShowFamilySettingsV2WithResourceDictionary:(id)a3
{
  id v4 = +[FASwiftUIHostingControllerProvider getSettingsViewControllerWithResourceDictionary:a3];
  [(FASettingsSpecifierProvider *)self _presentViewController:v4];
}

- (void)_presentViewController:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_presenter = &self->_presenter;
  id WeakRetained = objc_loadWeakRetained((id *)p_presenter);
  id v7 = [WeakRetained navigationController];
  id v8 = [v7 viewControllers];
  char v9 = [v8 containsObject:v4];

  if (v9)
  {
    uint64_t v10 = _FALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v4;
      _os_log_impl(&dword_2189F0000, v10, OS_LOG_TYPE_DEFAULT, "View Controller %@ already exists in Navigation stack, can't push another", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    id v11 = objc_loadWeakRetained((id *)p_presenter);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v13 = _FALogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = objc_loadWeakRetained((id *)p_presenter);
        int v18 = 138412546;
        id v19 = v4;
        __int16 v20 = 2112;
        id v21 = v14;
        _os_log_impl(&dword_2189F0000, v13, OS_LOG_TYPE_DEFAULT, "Calling showController with settingsViewController %@ for presenter %@", (uint8_t *)&v18, 0x16u);
      }
      uint64_t v10 = objc_loadWeakRetained((id *)p_presenter);
      [v10 showController:v4 animate:1];
    }
    else
    {
      id v15 = objc_loadWeakRetained((id *)p_presenter);
      uint64_t v10 = [v15 splitViewController];

      uint64_t v16 = _FALogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = objc_loadWeakRetained((id *)p_presenter);
        int v18 = 138412802;
        id v19 = v4;
        __int16 v20 = 2112;
        id v21 = v17;
        __int16 v22 = 2112;
        long long v23 = v10;
        _os_log_impl(&dword_2189F0000, v16, OS_LOG_TYPE_DEFAULT, "Calling showInitialViewController with settingsViewController %@ for presenter %@ with splitViewController %@", (uint8_t *)&v18, 0x20u);
      }
      [v10 showInitialViewController:v4];
    }
  }
}

- (void)_handleShowInvitesActionURL:(id)a3
{
  id v4 = [(FASettingsSpecifierProvider *)self _appleAccount];
  id v5 = v4;
  if (!v4)
  {
    uint64_t v6 = _FALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v7 = "User not signed in to an Apple Account. How did you even get here?";
LABEL_8:
      _os_log_impl(&dword_2189F0000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if ((objc_msgSend(v4, "aa_isPrimaryAccount") & 1) == 0)
  {
    uint64_t v6 = _FALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v7 = "Non-primary accounts cannot see family invites. How did you even get here?";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__FASettingsSpecifierProvider__handleShowInvitesActionURL___block_invoke;
  v8[3] = &unk_264349A08;
  v8[4] = self;
  [(FASettingsSpecifierProvider *)self _loadFamilyDetailsWithCompletion:v8];
LABEL_10:
}

void __59__FASettingsSpecifierProvider__handleShowInvitesActionURL___block_invoke(uint64_t a1, char a2)
{
  v17[1] = *MEMORY[0x263EF8340];
  BOOL v3 = *(id **)(a1 + 32);
  if ((a2 & 1) == 0)
  {
    id v4 = [v3 _acuPresenter];
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"OK" value:&stru_26CA2C800 table:@"Localizable"];
    v17[0] = v8;
    char v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v11 = [v10 localizedStringForKey:@"COULD_NOT_CONNECT_TO_ICLOUD" value:&stru_26CA2C800 table:@"Localizable"];
    [v4 showConfirmationWithButtons:v9 title:v11 message:0 destructive:0 completion:0];

LABEL_6:
    goto LABEL_7;
  }
  id v4 = [v3[1] invites];
  uint64_t v5 = [v4 count];
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v5)
  {
    id v7 = [v6 _acuPresenter];
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v12 = [v8 localizedStringForKey:@"OK" value:&stru_26CA2C800 table:@"Localizable"];
    uint64_t v16 = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v15 = [v14 localizedStringForKey:@"NO_INVITATIONS_MESSAGE" value:&stru_26CA2C800 table:@"Localizable"];
    [v7 showConfirmationWithButtons:v13 title:v15 message:0 destructive:0 completion:0];

    goto LABEL_6;
  }
  [v6 _presentPendingInvitesRemoteUI];
LABEL_7:
}

- (void)_handleShowFamilySettingsURL:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__FASettingsSpecifierProvider__handleShowFamilySettingsURL___block_invoke;
  v3[3] = &unk_264349A08;
  v3[4] = self;
  [(FASettingsSpecifierProvider *)self _loadFamilyDetailsWithCompletion:v3];
}

void __60__FASettingsSpecifierProvider__handleShowFamilySettingsURL___block_invoke(uint64_t a1, char a2)
{
  v14[1] = *MEMORY[0x263EF8340];
  BOOL v3 = *(id **)(a1 + 32);
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = [v3 _acuPresenter];
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v9 = [v8 localizedStringForKey:@"OK" value:&stru_26CA2C800 table:@"Localizable"];
    v14[0] = v9;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v12 = [v11 localizedStringForKey:@"COULD_NOT_CONNECT_TO_ICLOUD" value:&stru_26CA2C800 table:@"Localizable"];
    [v6 showConfirmationWithButtons:v10 title:v12 message:0 destructive:0 completion:0];

LABEL_7:
    return;
  }
  id v4 = [v3[1] members];
  uint64_t v5 = [v4 count];

  uint64_t v6 = _FALogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v7)
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_2189F0000, v6, OS_LOG_TYPE_DEFAULT, "No family member found. Staying at spyglass.", v13, 2u);
    }
    goto LABEL_7;
  }
  if (v7)
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_2189F0000, v6, OS_LOG_TYPE_DEFAULT, "Viewing family.", v13, 2u);
  }

  [*(id *)(a1 + 32) _viewFamilySpecifierWasTapped];
}

- (id)_acuPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return WeakRetained;
}

- (void)_handleShowChildTransferActionURL:(id)a3
{
}

- (void)_handleShowFamilyInviteActionURL:(id)a3
{
}

- (void)_handleShowInviteActionURL:(id)a3 isChildTransfer:(BOOL)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = [(FASettingsSpecifierProvider *)self _appleAccount];
  id v8 = v7;
  if (!v7)
  {
    char v9 = _FALogSystem();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    id v17 = "User not signed in to an Apple Account. How did you even get here?";
LABEL_11:
    _os_log_impl(&dword_2189F0000, v9, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
    goto LABEL_15;
  }
  if ((objc_msgSend(v7, "aa_isPrimaryAccount") & 1) == 0)
  {
    char v9 = _FALogSystem();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    id v17 = "Non-primary accounts cannot accept family invites. How did you even get here?";
    goto LABEL_11;
  }
  char v9 = [v6 objectForKeyedSubscript:@"inviteCode"];
  if (v9)
  {
    self->_isHandlingURLForInvite = 1;
    uint64_t v10 = [v6 objectForKeyedSubscript:@"organizerFirstName"];
    id v11 = [v6 objectForKeyedSubscript:@"organizerLastName"];
    id v12 = [v6 objectForKeyedSubscript:@"organizerEmail"];
    uint64_t v13 = _FALogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v11;
      __int16 v26 = 2112;
      v27 = v11;
      _os_log_impl(&dword_2189F0000, v13, OS_LOG_TYPE_DEFAULT, "About to present family invite coming from %@ %@", buf, 0x16u);
    }

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __74__FASettingsSpecifierProvider__handleShowInviteActionURL_isChildTransfer___block_invoke;
    void v18[3] = &unk_264349BC0;
    v18[4] = self;
    BOOL v23 = a4;
    id v19 = v9;
    id v20 = v10;
    id v21 = v11;
    id v22 = v12;
    id v14 = v12;
    id v15 = v11;
    uint64_t v16 = v10;
    [(FASettingsSpecifierProvider *)self _loadFamilyDetailsWithCompletion:v18];
  }
  else
  {
    uint64_t v16 = _FALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2189F0000, v16, OS_LOG_TYPE_DEFAULT, "Asked to show family invite details but no invite code was provided.", buf, 2u);
    }
  }

LABEL_15:
}

void __74__FASettingsSpecifierProvider__handleShowInviteActionURL_isChildTransfer___block_invoke(uint64_t a1, char a2)
{
  v23[1] = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 112) = 0;
  BOOL v3 = *(id **)(a1 + 32);
  if ((a2 & 1) == 0)
  {
    id v4 = [v3 _acuPresenter];
    id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"OK" value:&stru_26CA2C800 table:@"Localizable"];
    v23[0] = v10;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v13 = [v12 localizedStringForKey:@"COULD_NOT_CONNECT_TO_ICLOUD" value:&stru_26CA2C800 table:@"Localizable"];
    [v4 showConfirmationWithButtons:v11 title:v13 message:0 destructive:0 completion:0];

LABEL_14:
    goto LABEL_15;
  }
  id v4 = [v3[1] invites];
  if ([v4 count])
  {
    uint64_t v5 = 0;
    while (1)
    {
      id v6 = [v4 objectAtIndexedSubscript:v5];
      BOOL v7 = [v6 code];
      char v8 = [v7 isEqualToString:*(void *)(a1 + 40)];

      if (v8) {
        break;
      }
      if (++v5 >= (unint64_t)[v4 count]) {
        goto LABEL_9;
      }
    }
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [*(id *)(a1 + 32) _presentPendingInvitesRemoteUI];
      goto LABEL_15;
    }
  }
LABEL_9:
  if (!*(unsigned char *)(a1 + 72))
  {
    id v9 = objc_alloc_init(MEMORY[0x263F3BF20]);
    [v9 setCode:*(void *)(a1 + 40)];
    [v9 setOrganizerFirstName:*(void *)(a1 + 48)];
    [v9 setOrganizerLastName:*(void *)(a1 + 56)];
    [v9 setOrganizerEmail:*(void *)(a1 + 64)];
    id v10 = (id)[v4 mutableCopy];
    if (!v10) {
      id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    [v10 insertObject:v9 atIndex:0];
    [*(id *)(a1 + 32) _presentPendingInvitesRemoteUI];
    goto LABEL_14;
  }
  id v21 = [*(id *)(a1 + 32) _acuPresenter];
  id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v15 = [v14 localizedStringForKey:@"OK" value:&stru_26CA2C800 table:@"Localizable"];
  id v22 = v15;
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
  id v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v18 = [v17 localizedStringForKey:@"INVALID_INVITE_TITLE" value:&stru_26CA2C800 table:@"Localizable"];
  id v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v20 = [v19 localizedStringForKey:@"INVALID_INVITE_MESSAGE" value:&stru_26CA2C800 table:@"Localizable"];
  [v21 showConfirmationWithButtons:v16 title:v18 message:v20 destructive:0 completion:0];

LABEL_15:
}

- (void)_handleStartFamilySetupActionURL:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  uint64_t v5 = [WeakRetained presentedViewController];

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_presenter);
    [v6 dismissViewControllerAnimated:0 completion:0];
  }
  [(FASettingsSpecifierProvider *)self _initiateFamilyWithResources:v7];
}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(FASettingsSpecifierProvider *)self _requestConfigurator];
  [v7 addFresnoHeadersToRequest:v6];

  char v8 = [(FASettingsSpecifierProvider *)self _requestConfigurator];
  id v12 = @"clientAppContext";
  id v9 = [(FACircleContext *)self->_context clientName];
  v13[0] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v8 addFresnoPayloadToRequest:v6 additionalPayload:v10];

  return 1;
}

- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(FASettingsSpecifierProvider *)self _handleObjectModelChangeForController:v7 objectModel:v6 isModal:0];
  }
}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(FASettingsSpecifierProvider *)self _handleObjectModelChangeForController:v9 objectModel:v8 isModal:v5];
  }
}

- (void)_handleObjectModelChangeForController:(id)a3 objectModel:(id)a4 isModal:(BOOL)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = _FALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 identifier];
    int v33 = 138412290;
    v34 = v8;
    _os_log_impl(&dword_2189F0000, v7, OS_LOG_TYPE_DEFAULT, "Handling an object model: %@", (uint8_t *)&v33, 0xCu);
  }
  id v9 = [v6 clientInfo];
  id v10 = [v9 objectForKeyedSubscript:@"needsProfilePhotoHeader"];
  int v11 = [v10 isEqual:@"true"];

  if (v11)
  {
    id v12 = [v6 defaultPages];
    uint64_t v13 = [v12 firstObject];

    char v14 = [v13 hasTableView];
    id v15 = _FALogSystem();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_2189F0000, v15, OS_LOG_TYPE_DEFAULT, "Handing page over to FAFamilyMemberDetailsPageSurrogate...", (uint8_t *)&v33, 2u);
      }

      id v15 = objc_alloc_init(MEMORY[0x263F25860]);
      id v17 = [(FASettingsSpecifierProvider *)self _appleAccount];
      int v18 = objc_msgSend(v17, "aa_firstName");
      [v15 setFirstName:v18];

      id v19 = [(FASettingsSpecifierProvider *)self _appleAccount];
      id v20 = objc_msgSend(v19, "aa_lastName");
      [v15 setLastName:v20];

      id v21 = [(FASettingsSpecifierProvider *)self _appleAccount];
      id v22 = objc_msgSend(v21, "aa_appleId");
      [v15 setAppleID:v22];

      BOOL v23 = NSNumber;
      uint64_t v24 = [(FASettingsSpecifierProvider *)self _appleAccount];
      id v25 = objc_msgSend(v24, "aa_personID");
      __int16 v26 = objc_msgSend(v23, "numberWithLongLong:", objc_msgSend(v25, "longLongValue"));
      [v15 setPersonID:v26];

      [v15 setIsMe:1];
      v27 = [FAProfileViewTableViewDecorator alloc];
      uint64_t v28 = [v13 tableViewOM];
      v29 = [v28 tableView];
      id v30 = [v13 tableViewOM];
      id v31 = [(FAProfileViewTableViewDecorator *)v27 initWithTableView:v29 ruiTableView:v30 forPerson:v15 pictureStore:self->_familyPictureStore];
      remoteUIDecorator = self->_remoteUIDecorator;
      self->_remoteUIDecorator = v31;
    }
    else if (v16)
    {
      LOWORD(v33) = 0;
      _os_log_impl(&dword_2189F0000, v15, OS_LOG_TYPE_DEFAULT, "OM wants us to add a photo header, but it has no table view in its page.", (uint8_t *)&v33, 2u);
    }
  }
}

- (void)_handleFamilyChanged:(id)a3
{
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = self;
    _os_log_impl(&dword_2189F0000, v3, OS_LOG_TYPE_DEFAULT, "FASettingsSpecifierProvider dealloc %@", buf, 0xCu);
  }

  id v4 = [MEMORY[0x263F087C8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)FASettingsSpecifierProvider;
  [(FASettingsSpecifierProvider *)&v5 dealloc];
}

- (void)familySettingsViewController2StopFamilySharing:(id)a3
{
  id v4 = a3;
  [(FASettingsSpecifierProvider *)self _clearFamilyState];
  [(FASettingsSpecifierProvider *)self _reloadFamilySpecifiersAnimated:0];
  p_presenter = &self->_presenter;
  id WeakRetained = objc_loadWeakRetained((id *)p_presenter);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v8 = [v4 navigationController];
    id v9 = objc_loadWeakRetained((id *)p_presenter);
    id v10 = (id)[v8 popToViewController:v9 animated:1];
  }
  else
  {
    uint64_t v13 = 0;
    int v11 = [MEMORY[0x263F3C010] urlDestinationTo:0 error:&v13];
    id v12 = [MEMORY[0x263F01880] defaultWorkspace];
    [v12 openSensitiveURL:v11 withOptions:0];
  }
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedResourceDictionary, 0);
  objc_storeStrong((id *)&self->_familyPictureStore, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_requestConfigurator, 0);
  objc_storeStrong((id *)&self->_grandSlamSigner, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_networkActivityQueue, 0);
  objc_storeStrong((id *)&self->_invitationSummary, 0);
  objc_storeStrong((id *)&self->_familyStatusSummary, 0);
  objc_storeStrong((id *)&self->_pendingInvites, 0);
  objc_storeStrong((id *)&self->_familyEligibilityResponse, 0);
  objc_storeStrong((id *)&self->_pendingFamilyDetailsCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_invitationsCellSpecifier, 0);
  objc_storeStrong((id *)&self->_familyCellSpecifier, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_remoteUIDecorator, 0);
  objc_storeStrong((id *)&self->_familyCircle, 0);
}

- (BOOL)shouldUseModernNavigationForPresenter:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  BOOL v6 = sub_218A90AB8(v4);

  return v6;
}

- (void)presentFamilySettingsFromPresenter:(id)a3
{
  uint64_t v5 = sub_218CAD108();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_218CAD0C8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218A90A64();
  id v13 = a3;
  char v14 = self;
  sub_218CAD0B8();
  id v15 = objc_msgSend(v13, sel_traitCollection);
  sub_218CAF5F8();

  sub_218A90C74(&qword_267BE9CF8, MEMORY[0x263F60390]);
  sub_218CAD0E8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

void __65__FASettingsSpecifierProvider__viewFamilyWithResourceDictionary___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_2189F0000, a2, OS_LOG_TYPE_DEBUG, "Can't present %@, presenter seems deallocated.", (uint8_t *)&v3, 0xCu);
}

@end