@interface ASCredentialPickerPaneViewController
- (ASCredentialPickerPaneViewController)initWithPresentationContext:(id)a3 activity:(id)a4;
- (ASCredentialPickerPaneViewController)initWithPresentationContext:(id)a3 shouldExpandOtherLoginChoices:(BOOL)a4 activity:(id)a5;
- (BOOL)_errorIsPINRequiredError:(id)a3;
- (BOOL)_isOtherAccountsSection:(int64_t)a3;
- (BOOL)_isUserVerificationConfigured;
- (BOOL)_shouldShowLoginChoicesInTableView;
- (BOOL)validateReadyForAuthorization:(id)a3;
- (UIWindow)presentationAnchor;
- (double)_secondaryButtonBottomMargin;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_cellForRow:(int64_t)a3 section:(int64_t)a4;
- (id)_defaultPasskeySignInTitle;
- (id)_iconImage;
- (id)_infoLabelStringForPassword;
- (id)_infoLabelStringForSecurityKeyCredentialAssertion;
- (id)_infoLabelStringForSignInWithApple;
- (id)_localizedInfoString;
- (id)_messageOfAlertForFailedBiometryAttemptWhenPasscodeFallbackIsNotAllowed;
- (id)_serviceName;
- (id)_subtitleForPlatformPublicKeyCredentialAssertion;
- (id)_subtitleForPlatformPublicKeyCredentialRegistration;
- (id)_titleForPlatformPublicKeyCredentialAssertion;
- (id)_titleForPlatformPublicKeyCredentialRegistration;
- (id)_titleOfAlertForFailedBiometryAttemptWhenPasscodeFallbackIsNotAllowed;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)numberOfTableRows;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_credentialCount;
- (void)_addAuthorizationButtonToPaneContext:(id)a3;
- (void)_addManuallyEnterPasswordButtonIfNeeded;
- (void)_addOtherLoginChoicesButtonIfNeeded;
- (void)_completePasskeyAssertionWithCredential:(id)a3 error:(id)a4 completion:(id)a5;
- (void)_configureAuthenticationPaneForSelectedLoginChoice:(id)a3;
- (void)_dismiss;
- (void)_dumpConfiguration;
- (void)_keychainSyncStatusMayHaveChanged:(id)a3;
- (void)_manuallyEnterPasswordButtonTapped;
- (void)_otherLoginChoicesButtonTapped;
- (void)_performAuthorizationWithAuthenticatedContext:(id)a3 completionHandler:(id)a4;
- (void)_presentAlert:(id)a3 primaryAction:(id)a4 alternateAction:(id)a5;
- (void)_selectInitialLoginChoice;
- (void)_selectPreviouslySelectedLoginChoiceIfPossible:(id)a3;
- (void)_setCancelButtonEnabled:(BOOL)a3;
- (void)_setUpIconViewIfNecessary;
- (void)_setUpInfoLabel;
- (void)_setUpPlatformCredentialRequestPane;
- (void)_setUpView;
- (void)_updateCachedLoginChoices;
- (void)_updateSelectedRow:(int64_t)a3 section:(int64_t)a4;
- (void)_useCABLEButtonTapped;
- (void)_useOtherAccountsButtonTapped;
- (void)_useSecurityKeyButtonTapped;
- (void)_userSelectedExternalPasswordCredential;
- (void)_userTappedContinueButtonForCABLELoginChoice:(id)a3;
- (void)_userTappedContinueButtonForCredentialProviderExtensionLoginChoice:(id)a3;
- (void)_userTappedContinueButtonForPasskeyLoginChoice:(id)a3;
- (void)_userTappedContinueButtonForPasswordLoginChoice:(id)a3;
- (void)_userTappendContinueButtonForSecurityKeyLoginChoice:(id)a3;
- (void)authenticationProvider:(id)a3 hideViewController:(id)a4;
- (void)authenticationProvider:(id)a3 presentAlert:(id)a4 primaryAction:(id)a5 alternateAction:(id)a6;
- (void)authenticationProvider:(id)a3 showViewController:(id)a4;
- (void)confirmButtonSubPaneDidEnterProcessingState:(id)a3 withAuthenticatedContext:(id)a4;
- (void)confirmButtonSubPaneDidFailBiometry:(id)a3 allowingPasscodeFallback:(BOOL)a4;
- (void)credentialAuthenticationViewController:(id)a3 didFinishWithCredential:(id)a4 error:(id)a5 completion:(id)a6;
- (void)credentialAuthenticationViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 error:(id)a5 completion:(id)a6;
- (void)credentialAuthenticationViewController:(id)a3 didFinishWithPasskeyRegistrationCredential:(id)a4 error:(id)a5 completion:(id)a6;
- (void)credentialListViewController:(id)a3 didFinishWithCredential:(id)a4 completion:(id)a5;
- (void)credentialListViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 completion:(id)a5;
- (void)credentialListViewControllerDidPrepareInterface:(id)a3;
- (void)performAuthorization:(id)a3 withAuthenticatedLAContext:(id)a4;
- (void)performConditionalRegistrationIfPossible;
- (void)performPasswordAuthentication:(id)a3;
- (void)presentUIForPasswordCredentialAuthenticationViewController:(id)a3;
- (void)reloadLoginChoices;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)userTappedContinueButton;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ASCredentialPickerPaneViewController

- (ASCredentialPickerPaneViewController)initWithPresentationContext:(id)a3 shouldExpandOtherLoginChoices:(BOOL)a4 activity:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v47.receiver = self;
  v47.super_class = (Class)ASCredentialPickerPaneViewController;
  v11 = [(ASCredentialRequestPaneViewController *)&v47 initRequiringTableView:1];
  v12 = (ASCredentialPickerPaneViewController *)v11;
  if (v11)
  {
    objc_storeStrong(v11 + 141, a5);
    v13 = [MEMORY[0x263F662C8] sharedMonitor];
    v12->_isKeychainSyncEnabled = [v13 isKeychainSyncEnabled];
    v12->_canKeychainSyncBeEnabled = [v13 canKeychainSyncBeEnabled];
    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v12 selector:sel__keychainSyncStatusMayHaveChanged_ name:*MEMORY[0x263F66438] object:0];

    id v46 = v10;
    if ([v9 isRegistrationRequest]
      && !v12->_isKeychainSyncEnabled
      && !v12->_canKeychainSyncBeEnabled
      && ![v9 externalPasskeyLoginChoiceCount])
    {
      a4 = 1;
    }
    id v45 = v9;
    v15 = [v9 loginChoices];
    v16 = objc_msgSend(v15, "safari_firstObjectPassingTest:", &__block_literal_global_21);
    v12->_onlyHasOtherAccountsLoginChoices = v16 == 0;

    BOOL v17 = v12->_onlyHasOtherAccountsLoginChoices || a4;
    v12->_isUserVerificationConfigured = [(ASCredentialPickerPaneViewController *)v12 _isUserVerificationConfigured];
    v12->_currentlyEnabledBiometryType = [MEMORY[0x263F29440] biometryType];
    id v18 = objc_alloc_init(MEMORY[0x263F10468]);
    [v18 canEvaluatePolicy:2 error:0];
    v12->_supportedBiometryType = [v18 biometryType];
    p_presentationContext = (id *)&v12->_presentationContext;
    objc_storeStrong((id *)&v12->_presentationContext, a3);
    v12->_BOOL shouldExpandOtherLoginChoices = v17;
    v12->_currentlySelectedRow = -1;
    v12->_currentlySelectedSection = -1;
    v20 = [MEMORY[0x263F66550] sharedFeatureManager];
    v12->_shouldAutoFillFromICloudKeychain = [v20 shouldAutoFillPasswordsFromKeychain];

    uint64_t v21 = [(ASCAuthorizationPresentationContext *)v12->_presentationContext requestTypes];
    uint64_t v22 = ascCredentialRequestTypesAllPublicKey();
    uint64_t v23 = ascCredentialRequestTypesAllPasskey() & v21;
    BOOL v24 = v12->_shouldAutoFillFromICloudKeychain
       || [*p_presentationContext externalPasskeyLoginChoiceCount] != 0;
    v25 = objc_msgSend(MEMORY[0x263F66568], "sharedManager", 1177);
    v26 = [v25 extensionsSync];
    v27 = objc_msgSend(v26, "safari_anyObjectPassingTest:", &__block_literal_global_39_0);
    v12->_hasAvailablePasskeyProviders = v27 != 0;

    if (v23 && ((v22 | 0x40) & v21) == v21 && !v24)
    {
      BOOL shouldExpandOtherLoginChoices = v12->_shouldExpandOtherLoginChoices;
      p_shouldShowEnableCredentialProviderPrompt = &v12->_shouldShowEnableCredentialProviderPrompt;
      v12->_shouldShowEnableCredentialProviderPrompt = !shouldExpandOtherLoginChoices;
      BOOL v30 = !shouldExpandOtherLoginChoices && *((unsigned char *)&v12->super.super.super.super.isa + v44) != 0;
    }
    else
    {
      BOOL v30 = 0;
      p_shouldShowEnableCredentialProviderPrompt = &v12->_shouldShowEnableCredentialProviderPrompt;
      v12->_shouldShowEnableCredentialProviderPrompt = 0;
    }
    id v9 = v45;
    BOOL *p_shouldShowEnableCredentialProviderPrompt = v30;
    v31 = [*p_presentationContext loginChoices];
    int v32 = objc_msgSend(v31, "safari_containsObjectPassingTest:", &__block_literal_global_41_0);

    if (v32) {
      BOOL *p_shouldShowEnableCredentialProviderPrompt = 0;
    }
    [(ASCredentialPickerPaneViewController *)v12 _updateCachedLoginChoices];
    if (([*p_presentationContext requestTypes] & 2) != 0)
    {
      id v33 = objc_alloc(MEMORY[0x263F29298]);
      v34 = [(ASCredentialPickerPaneViewController *)v12 _serviceName];
      v35 = [*p_presentationContext teamIdentifier];
      v36 = [*p_presentationContext bundleIdentifier];
      v37 = [*p_presentationContext appleIDAuthorizationRequest];
      uint64_t v38 = [v33 initWithAppName:v34 teamIdentifier:v35 bundleIdentifier:v36 authorizationRequest:v37];
      authKitAuthorizationProvider = v12->_authKitAuthorizationProvider;
      v12->_authKitAuthorizationProvider = (AKASAuthorizationProvider *)v38;

      [(AKASAuthorizationProvider *)v12->_authKitAuthorizationProvider setPresentationProvider:v12];
      dispatch_queue_t v40 = dispatch_queue_create("com.apple.AuthenticationServicesCore.AuthorizationErrorAlertQueue", 0);
      alertQueue = v12->_alertQueue;
      v12->_alertQueue = (OS_dispatch_queue *)v40;
    }
    [(ASCredentialPickerPaneViewController *)v12 _selectInitialLoginChoice];
    v42 = v12;

    id v10 = v46;
  }

  return v12;
}

BOOL __107__ASCredentialPickerPaneViewController_initWithPresentationContext_shouldExpandOtherLoginChoices_activity___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)([a2 loginChoiceKind] - 7) < 0xFFFFFFFFFFFFFFFELL;
}

uint64_t __107__ASCredentialPickerPaneViewController_initWithPresentationContext_shouldExpandOtherLoginChoices_activity___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F66568];
  id v3 = a2;
  v4 = [v2 sharedManager];
  uint64_t v5 = [v4 extensionSupportsPasskeys:v3];

  return v5;
}

uint64_t __107__ASCredentialPickerPaneViewController_initWithPresentationContext_shouldExpandOtherLoginChoices_activity___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 loginChoiceKind] == 2)
  {
    id v3 = [v2 relyingPartyIdentifier];
    uint64_t v4 = [v3 isEqualToString:@"apple.com"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (ASCredentialPickerPaneViewController)initWithPresentationContext:(id)a3 activity:(id)a4
{
  return [(ASCredentialPickerPaneViewController *)self initWithPresentationContext:a3 shouldExpandOtherLoginChoices:0 activity:a4];
}

- (void)reloadLoginChoices
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__ASCredentialPickerPaneViewController_reloadLoginChoices__block_invoke;
  block[3] = &unk_264395388;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void *__58__ASCredentialPickerPaneViewController_reloadLoginChoices__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _updateCachedLoginChoices];
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];

  [*(id *)(a1 + 32) sizeToFitPaneContent];
  if ([*(id *)(*(void *)(a1 + 32) + 1056) hasPlatformCredentialRequest])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v3 = [*(id *)(a1 + 32) paneHeaderStackView];
    uint64_t v4 = [v3 subviews];
    uint64_t v5 = (void *)[v4 copy];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = objc_msgSend(*(id *)(a1 + 32), "paneFooterStackView", 0);
    v11 = [v10 subviews];
    v12 = (void *)[v11 copy];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * j) removeFromSuperview];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }

    [*(id *)(a1 + 32) _setUpView];
  }
  else
  {
    BOOL v17 = [*(id *)(a1 + 32) _localizedInfoString];
    [*(id *)(*(void *)(a1 + 32) + 1200) setText:v17];
  }
  result = *(void **)(a1 + 32);
  if (result[137]) {
    return objc_msgSend(result, "_selectPreviouslySelectedLoginChoiceIfPossible:");
  }
  return result;
}

- (void)_selectPreviouslySelectedLoginChoiceIfPossible:(id)a3
{
  NSUInteger v4 = [(NSArray *)self->_tableViewLoginChoices indexOfObject:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v5 = v4;
    unint64_t v6 = [(ASCredentialPickerPaneViewController *)self _credentialCount];
    BOOL v7 = v5 >= v6;
    if (v5 < v6) {
      unint64_t v8 = 0;
    }
    else {
      unint64_t v8 = v6;
    }
    NSUInteger v9 = v5 - v8;
    id v11 = [(ASCredentialRequestPaneViewController *)self tableView];
    id v10 = [MEMORY[0x263F088C8] indexPathForRow:v9 inSection:v7];
    [v11 selectRowAtIndexPath:v10 animated:1 scrollPosition:0];
    [(ASCredentialPickerPaneViewController *)self _updateSelectedRow:v9 section:v7];
  }
}

- (void)performConditionalRegistrationIfPossible
{
  id v3 = self->_previouslySelectedLoginChoice;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    authorizationActivity = self->_authorizationActivity;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__ASCredentialPickerPaneViewController_performConditionalRegistrationIfPossible__block_invoke;
    block[3] = &unk_264395388;
    id v10 = v3;
    os_activity_apply(authorizationActivity, block);
    NSUInteger v5 = v10;
LABEL_7:

    goto LABEL_8;
  }
  if (![(ASCLoginChoiceProtocol *)v3 isExternal]
    || ([(ASCLoginChoiceProtocol *)v3 isRegistrationRequest] & 1) == 0)
  {
    unint64_t v6 = self->_authorizationActivity;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __80__ASCredentialPickerPaneViewController_performConditionalRegistrationIfPossible__block_invoke_50;
    v7[3] = &unk_264395388;
    unint64_t v8 = v3;
    os_activity_apply(v6, v7);
    NSUInteger v5 = v8;
    goto LABEL_7;
  }
  [(ASCredentialPickerPaneViewController *)self _userTappedContinueButtonForPasskeyLoginChoice:v3];
LABEL_8:
}

void __80__ASCredentialPickerPaneViewController_performConditionalRegistrationIfPossible__block_invoke(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __80__ASCredentialPickerPaneViewController_performConditionalRegistrationIfPossible__block_invoke_cold_1(a1, v2);
  }
}

void __80__ASCredentialPickerPaneViewController_performConditionalRegistrationIfPossible__block_invoke_50(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __80__ASCredentialPickerPaneViewController_performConditionalRegistrationIfPossible__block_invoke_50_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ASCredentialPickerPaneViewController;
  [(ASCredentialRequestPaneViewController *)&v3 viewDidLoad];
  [(ASCredentialPickerPaneViewController *)self _setUpView];
  [(ASCredentialRequestPaneViewController *)self sizeToFitPaneContent];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASCredentialPickerPaneViewController;
  [(ASCredentialRequestPaneViewController *)&v4 viewWillAppear:a3];
  if (self->_previouslySelectedLoginChoice) {
    -[ASCredentialPickerPaneViewController _configureAuthenticationPaneForSelectedLoginChoice:](self, "_configureAuthenticationPaneForSelectedLoginChoice:");
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASCredentialPickerPaneViewController;
  [(ASCredentialPickerPaneViewController *)&v4 viewDidDisappear:a3];
  if ([MEMORY[0x263F29440] biometryType] == 2) {
    [(ASCredentialRequestConfirmButtonSubPane *)self->_confirmButtonSubPane setAuthorizationCapabilityEnabled:0];
  }
}

- (void)_setUpView
{
  [(ASCredentialPickerPaneViewController *)self _dumpConfiguration];
  objc_super v3 = [(ASCredentialRequestPaneViewController *)self tableView];
  [v3 setDataSource:self];

  objc_super v4 = [(ASCredentialRequestPaneViewController *)self paneHeaderStackView];
  [v4 _addSpacerView];

  BOOL v5 = self->_isKeychainSyncEnabled
    || [(ASCAuthorizationPresentationContext *)self->_presentationContext externalPasskeyLoginChoiceCount] != 0;
  if ([(ASCAuthorizationPresentationContext *)self->_presentationContext hasPlatformCredentialRequest]&& ((([(ASCAuthorizationPresentationContext *)self->_presentationContext isRegistrationRequest] ^ 1 | v5) & 1) != 0|| [(NSArray *)self->_tableViewLoginChoices count] <= 1))
  {
    [(ASCredentialPickerPaneViewController *)self _setUpPlatformCredentialRequestPane];
  }
  else
  {
    [(ASCredentialPickerPaneViewController *)self _setUpIconViewIfNecessary];
    [(ASCredentialPickerPaneViewController *)self _setUpInfoLabel];
  }
  uint64_t v6 = [(ASCredentialRequestPaneViewController *)self paneHeaderStackView];
  [v6 _addSpacerView];

  if (![(ASCAuthorizationPresentationContext *)self->_presentationContext isRegistrationRequest]|| [(NSArray *)self->_tableViewLoginChoices count]|| self->_isKeychainSyncEnabled|| self->_canKeychainSyncBeEnabled|| [(ASCAuthorizationPresentationContext *)self->_presentationContext externalPasskeyLoginChoiceCount])
  {
    uint64_t v7 = [(ASCredentialRequestPaneViewController *)self footerPaneContext];
    [(ASCredentialPickerPaneViewController *)self _addAuthorizationButtonToPaneContext:v7];
  }
  [(ASCredentialPickerPaneViewController *)self _addOtherLoginChoicesButtonIfNeeded];
  [(ASCredentialPickerPaneViewController *)self _addManuallyEnterPasswordButtonIfNeeded];
  id v8 = [(ASCredentialRequestPaneViewController *)self paneFooterStackView];
  [v8 _addSpacerView];
}

- (void)_setUpPlatformCredentialRequestPane
{
  if (self->_isKeychainSyncEnabled || !self->_canKeychainSyncBeEnabled) {
    int v3 = 1;
  }
  else {
    int v3 = [(ASCAuthorizationPresentationContext *)self->_presentationContext isRegistrationRequest] ^ 1;
  }
  objc_super v4 = [(ASCAuthorizationPresentationContext *)self->_presentationContext loginChoices];
  char v5 = objc_msgSend(v4, "safari_containsObjectPassingTest:", &__block_literal_global_58);

  BOOL v6 = ((v5 & 1) != 0 || v3) && !self->_shouldShowEnableCredentialProviderPrompt || self->_isUserVerificationConfigured;
  uint64_t v16 = 2;
  if (([(ASCAuthorizationPresentationContext *)self->_presentationContext requestTypes] & 4) != 0)
  {
    uint64_t v7 = [(ASCredentialPickerPaneViewController *)self _titleForPlatformPublicKeyCredentialRegistration];
    id v8 = [(ASCredentialPickerPaneViewController *)self _subtitleForPlatformPublicKeyCredentialRegistration];
    if (v6)
    {
LABEL_14:
      NSUInteger v9 = +[ASCredentialRequestIconGenerator headerIconForPresentationContext:self->_presentationContext outIconStyle:&v16];
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v7 = [(ASCredentialPickerPaneViewController *)self _titleForPlatformPublicKeyCredentialAssertion];
    id v8 = [(ASCredentialPickerPaneViewController *)self _subtitleForPlatformPublicKeyCredentialAssertion];
    if (v6)
    {
      if (self->_shouldExpandOtherLoginChoices)
      {
        NSUInteger v9 = +[ASCredentialRequestIconGenerator passwordManagerIcon];
        uint64_t v16 = 0;
        goto LABEL_16;
      }
      goto LABEL_14;
    }
  }
  NSUInteger v9 = 0;
LABEL_16:
  if (v8)
  {
    id v10 = [[ASCredentialRequestInfoLabelSubPane alloc] initWithString:v8 labelType:1];
    subtitleSubPane = self->_subtitleSubPane;
    self->_subtitleSubPane = v10;
  }
  v12 = [(ASCredentialRequestPaneViewController *)self headerPaneContext];
  uint64_t v13 = v16;
  uint64_t v14 = self->_subtitleSubPane;
  uint64_t v15 = [NSNumber numberWithDouble:16.0];
  [v12 addIcon:v9 iconStyle:v13 title:v7 titleStyle:2 subtitlePane:v14 subtitleStyle:3 subtitleBottomSpacing:v15];
}

BOOL __75__ASCredentialPickerPaneViewController__setUpPlatformCredentialRequestPane__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 loginChoiceKind] == 2)
  {
    id v3 = v2;
    if ([v3 isRegistrationRequest])
    {
      objc_super v4 = [v3 externalCredentialProviderName];
      BOOL v5 = v4 != 0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_setUpIconViewIfNecessary
{
  id v3 = [(ASCredentialPickerPaneViewController *)self _iconImage];
  if (v3)
  {
    id v8 = v3;
    if ([MEMORY[0x263F29440] isPad])
    {
      objc_super v4 = [(ASCredentialRequestPaneViewController *)self headerPaneContext];
      [v4 addEmptyViewWithSpacing:16.0];
    }
    BOOL v5 = [[ASCredentialRequestImageSubPane alloc] initWithImage:v8];
    imageSubPane = self->_imageSubPane;
    self->_imageSubPane = v5;

    uint64_t v7 = [(ASCredentialRequestPaneViewController *)self headerPaneContext];
    [v7 addSubPane:self->_imageSubPane withCustomSpacingAfter:16.0];

    id v3 = v8;
  }
}

- (void)_setUpInfoLabel
{
  if (!self->_imageSubPane)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F82E00]);
    objc_super v4 = [(ASCredentialRequestPaneViewController *)self headerPaneContext];
    BOOL v5 = [v4 stackView];
    [v5 addArrangedSubview:v3];

    BOOL v6 = [(ASCredentialRequestPaneViewController *)self headerPaneContext];
    uint64_t v7 = [v6 stackView];
    [v7 setCustomSpacing:v3 afterView:24.0];
  }
  id v8 = [ASCredentialRequestInfoLabelSubPane alloc];
  NSUInteger v9 = [(ASCredentialPickerPaneViewController *)self _localizedInfoString];
  id v10 = [(ASCredentialRequestInfoLabelSubPane *)v8 initWithString:v9 labelType:1];
  infoLabelPane = self->_infoLabelPane;
  self->_infoLabelPane = v10;

  id v12 = [(ASCredentialRequestPaneViewController *)self headerPaneContext];
  [v12 addSubPane:self->_infoLabelPane withCustomSpacingAfter:24.0];
}

- (void)_addAuthorizationButtonToPaneContext:(id)a3
{
  id v4 = a3;
  obuint64_t j = [[ASCredentialRequestConfirmButtonSubPane alloc] initWithActivity:self->_authorizationActivity];
  int v5 = [(ASCAuthorizationPresentationContext *)self->_presentationContext isCombinedPublicKeyCredentialRegistrationRequest];
  double v6 = 3.40282347e38;
  if (v5) {
    double v6 = 8.0;
  }
  [v4 addSubPane:obj withCustomSpacingAfter:v6];

  [(ASCredentialRequestConfirmButtonSubPane *)obj setDelegate:self];
  objc_storeStrong((id *)&self->_confirmButtonSubPane, obj);
  if (self->_shouldShowEnableCredentialProviderPrompt && self->_isKeychainSyncEnabled)
  {
    confirmButtonSubPane = self->_confirmButtonSubPane;
    id v8 = _WBSLocalizedString();
    [(ASCredentialRequestConfirmButtonSubPane *)confirmButtonSubPane showContinueButtonWithTitle:v8];
  }
}

- (void)_addOtherLoginChoicesButtonIfNeeded
{
  if (![(NSArray *)self->_otherLoginChoices count]) {
    return;
  }
  if ([(NSArray *)self->_otherLoginChoices count] != 1) {
    goto LABEL_11;
  }
  id v3 = [(NSArray *)self->_otherLoginChoices firstObject];
  uint64_t v4 = [v3 loginChoiceKind];

  if ((unint64_t)(v4 - 5) < 2)
  {
    int v5 = _WBSLocalizedString();
    double v6 = sel__useOtherAccountsButtonTapped;
  }
  else if (v4 == 4)
  {
    [(ASCAuthorizationPresentationContext *)self->_presentationContext isRegistrationRequest];
    int v5 = _WBSLocalizedString();
    double v6 = sel__useCABLEButtonTapped;
  }
  else
  {
    if (v4 != 3)
    {
LABEL_11:
      [(ASCAuthorizationPresentationContext *)self->_presentationContext isRegistrationRequest];
      id v8 = _WBSLocalizedString();
      id v11 = +[ASCredentialRequestSecondaryButton buttonWithTitle:v8 target:self action:sel__otherLoginChoicesButtonTapped];

      goto LABEL_12;
    }
    int v5 = _WBSLocalizedString();
    double v6 = sel__useSecurityKeyButtonTapped;
  }
  id v11 = +[ASCredentialRequestSecondaryButton buttonWithTitle:v5 target:self action:v6];

  if (!v11) {
    goto LABEL_11;
  }
LABEL_12:
  LODWORD(v7) = 1148846080;
  [v11 setContentCompressionResistancePriority:1 forAxis:v7];
  NSUInteger v9 = [(ASCredentialRequestPaneViewController *)self paneFooterStackView];
  [v9 addArrangedSubview:v11];

  id v10 = [(ASCredentialRequestPaneViewController *)self paneFooterStackView];
  [(ASCredentialPickerPaneViewController *)self _secondaryButtonBottomMargin];
  objc_msgSend(v10, "setCustomSpacing:afterView:", v11);
}

- (void)_addManuallyEnterPasswordButtonIfNeeded
{
  if [(ASCAuthorizationPresentationContext *)self->_presentationContext isProxiedRequest]&& ([(ASCAuthorizationPresentationContext *)self->_presentationContext requestTypes])
  {
    id v3 = _WBSLocalizedString();
    id v7 = +[ASCredentialRequestSecondaryButton buttonWithTitle:v3 target:self action:sel__manuallyEnterPasswordButtonTapped];

    LODWORD(v4) = 1148846080;
    [v7 setContentCompressionResistancePriority:1 forAxis:v4];
    int v5 = [(ASCredentialRequestPaneViewController *)self paneFooterStackView];
    [v5 addArrangedSubview:v7];

    double v6 = [(ASCredentialRequestPaneViewController *)self paneFooterStackView];
    [(ASCredentialPickerPaneViewController *)self _secondaryButtonBottomMargin];
    objc_msgSend(v6, "setCustomSpacing:afterView:", v7);
  }
}

- (double)_secondaryButtonBottomMargin
{
  int v2 = [MEMORY[0x263F29440] isPad];
  double result = 12.0;
  if (v2) {
    return 0.0;
  }
  return result;
}

- (void)_otherLoginChoicesButtonTapped
{
  [(ASCredentialRequestConfirmButtonSubPane *)self->_confirmButtonSubPane disableBiometricView];
  id v3 = [(ASCredentialRequestPaneViewController *)self delegate];
  [v3 requestPaneViewControllerPresentExpandedLoginChoiceInterface:self];
}

- (void)_useSecurityKeyButtonTapped
{
  id v3 = [(ASCAuthorizationPresentationContext *)self->_presentationContext loginChoices];
  objc_msgSend(v3, "safari_firstObjectPassingTest:", &__block_literal_global_101);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  double v4 = [(ASCredentialRequestPaneViewController *)self delegate];
  int v5 = v4;
  if (v7)
  {
    [v4 requestPaneViewController:self didRequestCredentialForLoginChoice:v7 authenticatedContext:0 completionHandler:&__block_literal_global_108];
  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_103);
    double v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F29388] code:1 userInfo:0];
    [v5 requestPaneViewController:self dismissWithCredential:0 error:v6];
  }
}

BOOL __67__ASCredentialPickerPaneViewController__useSecurityKeyButtonTapped__block_invoke(uint64_t a1, void *a2)
{
  return [a2 loginChoiceKind] == 3;
}

void __67__ASCredentialPickerPaneViewController__useSecurityKeyButtonTapped__block_invoke_2()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __67__ASCredentialPickerPaneViewController__useSecurityKeyButtonTapped__block_invoke_2_cold_1();
  }
}

- (void)_useCABLEButtonTapped
{
  id v3 = [(ASCAuthorizationPresentationContext *)self->_presentationContext loginChoices];
  objc_msgSend(v3, "safari_firstObjectPassingTest:", &__block_literal_global_110);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  double v4 = [(ASCredentialRequestPaneViewController *)self delegate];
  int v5 = v4;
  if (v7)
  {
    [v4 requestPaneViewController:self didRequestCredentialForLoginChoice:v7 authenticatedContext:0 completionHandler:&__block_literal_global_115];
  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_112);
    double v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F29388] code:1 userInfo:0];
    [v5 requestPaneViewController:self dismissWithCredential:0 error:v6];
  }
}

BOOL __61__ASCredentialPickerPaneViewController__useCABLEButtonTapped__block_invoke(uint64_t a1, void *a2)
{
  return [a2 loginChoiceKind] == 4;
}

void __61__ASCredentialPickerPaneViewController__useCABLEButtonTapped__block_invoke_2()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __61__ASCredentialPickerPaneViewController__useCABLEButtonTapped__block_invoke_2_cold_1();
  }
}

- (void)_useOtherAccountsButtonTapped
{
  id v3 = [(NSArray *)self->_otherLoginChoices firstObject];
  double v4 = (void *)MEMORY[0x263F08800];
  int v5 = [v3 providerExtensionBundleID];
  double v6 = [v4 extensionWithIdentifier:v5 error:0];

  id v7 = objc_alloc_init(MEMORY[0x263F66268]);
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __69__ASCredentialPickerPaneViewController__useOtherAccountsButtonTapped__block_invoke;
  uint64_t v14 = &unk_264396790;
  uint64_t v15 = self;
  id v16 = v6;
  id v8 = v6;
  NSUInteger v9 = (void *)MEMORY[0x21D484070](&v11);
  id v10 = [(ASCAuthorizationPresentationContext *)self->_presentationContext appIdentifier];
  [v7 getPasskeyAssertionRequestParametersForApplicationIdentifier:v10 completionHandler:v9];
}

uint64_t __69__ASCredentialPickerPaneViewController__useOtherAccountsButtonTapped__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [_ASCredentialListViewController alloc];
  uint64_t v5 = [(_ASCredentialListViewController *)v4 initWithExtension:*(void *)(a1 + 40) serviceIdentifiers:MEMORY[0x263EFFA68] requestParameters:v3];

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 1152);
  *(void *)(v6 + 1152) = v5;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1152), "setDelegate:");
  id v8 = *(void **)(*(void *)(a1 + 32) + 1152);

  return [v8 setDismissOnBackground:1];
}

- (void)_manuallyEnterPasswordButtonTapped
{
  id v3 = [(ASCredentialRequestPaneViewController *)self delegate];
  [v3 requestPaneViewControllerPresentManualPasswordEntryInterface:self];
}

- (void)_selectInitialLoginChoice
{
  if ([(NSArray *)self->_tableViewLoginChoices count])
  {
    if ([(ASCredentialPickerPaneViewController *)self _shouldShowLoginChoicesInTableView])
    {
      [(ASCredentialPickerPaneViewController *)self _updateSelectedRow:0 section:0];
    }
    else
    {
      id v3 = [(NSArray *)self->_tableViewLoginChoices objectAtIndexedSubscript:0];
      previouslySelectedLoginChoice = self->_previouslySelectedLoginChoice;
      self->_previouslySelectedLoginChoice = v3;

      uint64_t v5 = [(ASCredentialRequestPaneViewController *)self tableView];
      [v5 setUserInteractionEnabled:0];

      uint64_t v6 = self->_previouslySelectedLoginChoice;
      [(ASCredentialPickerPaneViewController *)self _configureAuthenticationPaneForSelectedLoginChoice:v6];
    }
  }
  else if (!self->_shouldShowEnableCredentialProviderPrompt)
  {
    confirmButtonSubPane = self->_confirmButtonSubPane;
    _WBSLocalizedString();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [(ASCredentialRequestConfirmButtonSubPane *)confirmButtonSubPane showContinueButtonWithTitle:v8];
  }
}

- (id)_localizedInfoString
{
  if ([(NSArray *)self->_tableViewLoginChoices count] == 1)
  {
    id v3 = [(NSArray *)self->_tableViewLoginChoices firstObject];
    uint64_t v4 = [v3 loginChoiceKind];

    switch(v4)
    {
      case 0:
        uint64_t v12 = [(ASCredentialPickerPaneViewController *)self _infoLabelStringForSignInWithApple];
        goto LABEL_12;
      case 1:
        uint64_t v12 = [(ASCredentialPickerPaneViewController *)self _infoLabelStringForPassword];
        goto LABEL_12;
      case 3:
        uint64_t v12 = [(ASCredentialPickerPaneViewController *)self _infoLabelStringForSecurityKeyCredentialAssertion];
        goto LABEL_12;
      case 5:
      case 6:
        [(ASCAuthorizationPresentationContext *)self->_presentationContext isCABLEAuthenticatorRequest];
        goto LABEL_11;
      default:
        break;
    }
  }
  presentationContext = self->_presentationContext;
  if (!self->_onlyHasOtherAccountsLoginChoices)
  {
    uint64_t v6 = [(ASCAuthorizationPresentationContext *)presentationContext proxiedOriginDeviceName];

    if (v6)
    {
      id v7 = NSString;
      id v8 = _WBSLocalizedString();
      NSUInteger v9 = [(ASCredentialPickerPaneViewController *)self _serviceName];
      id v10 = [(ASCAuthorizationPresentationContext *)self->_presentationContext proxiedOriginDeviceName];
      uint64_t v11 = objc_msgSend(v7, "stringWithFormat:", v8, v9, v10);

LABEL_23:
      goto LABEL_24;
    }
    uint64_t v11 = [(ASCAuthorizationPresentationContext *)self->_presentationContext localAccountLoginChoices];
    uint64_t v13 = [v11 count];
    uint64_t v14 = [(ASCAuthorizationPresentationContext *)self->_presentationContext loginChoices];
    uint64_t v15 = [v14 count];

    if (v13 == v15)
    {
      uint64_t v16 = [(ASCAuthorizationPresentationContext *)self->_presentationContext serviceType];
      if (v16 == 1)
      {
        BOOL v17 = NSString;
        goto LABEL_22;
      }
      if (!v16)
      {
        BOOL v17 = NSString;
LABEL_22:
        id v8 = _WBSLocalizedString();
        long long v19 = [(ASCredentialPickerPaneViewController *)self _serviceName];
        uint64_t v11 = objc_msgSend(v17, "localizedStringWithFormat:", v8, v19);

        goto LABEL_23;
      }
    }
    uint64_t v18 = [(ASCAuthorizationPresentationContext *)self->_presentationContext serviceType];
    if (v18 == 1)
    {
      BOOL v17 = NSString;
    }
    else
    {
      if (v18) {
        goto LABEL_24;
      }
      BOOL v17 = NSString;
    }
    goto LABEL_22;
  }
  [(ASCAuthorizationPresentationContext *)presentationContext isCABLEAuthenticatorRequest];
LABEL_11:
  uint64_t v12 = _WBSLocalizedString();
LABEL_12:
  uint64_t v11 = (void *)v12;
LABEL_24:

  return v11;
}

- (id)_serviceName
{
  uint64_t v3 = [(ASCAuthorizationPresentationContext *)self->_presentationContext serviceName];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    id v5 = 0;
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x263F01890];
    id v7 = [(ASCAuthorizationPresentationContext *)self->_presentationContext appIdentifier];
    id v13 = 0;
    id v8 = [v6 bundleRecordWithApplicationIdentifier:v7 error:&v13];
    id v5 = v13;
    uint64_t v4 = [v8 localizedName];

    if (!v4)
    {
      authorizationActivity = self->_authorizationActivity;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __52__ASCredentialPickerPaneViewController__serviceName__block_invoke;
      v11[3] = &unk_264395388;
      id v5 = v5;
      id v12 = v5;
      os_activity_apply(authorizationActivity, v11);
    }
  }

  return v4;
}

void __52__ASCredentialPickerPaneViewController__serviceName__block_invoke(uint64_t a1)
{
  int v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __52__ASCredentialPickerPaneViewController__serviceName__block_invoke_cold_1(a1, v2);
  }
}

- (id)_defaultPasskeySignInTitle
{
  uint64_t v3 = _WBSLocalizedString();
  uint64_t v4 = [(ASCAuthorizationPresentationContext *)self->_presentationContext loginChoices];
  id v5 = objc_msgSend(v4, "safari_filterObjectsUsingBlock:", &__block_literal_global_162);

  if ([v5 count]) {
    goto LABEL_2;
  }
  if (self->_isUserVerificationConfigured)
  {
    if (self->_currentlyEnabledBiometryType)
    {
      _WBSLocalizedString();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
LABEL_2:
    id v6 = v3;
LABEL_3:
    id v7 = v6;
    goto LABEL_4;
  }
  id v7 = 0;
LABEL_4:

  return v7;
}

BOOL __66__ASCredentialPickerPaneViewController__defaultPasskeySignInTitle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 externalCredentialProviderBundleID];
    BOOL v4 = v3 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)_titleForPlatformPublicKeyCredentialRegistration
{
  if (!self->_isUserVerificationConfigured
    && self->_shouldAutoFillFromICloudKeychain
    && ![(ASCAuthorizationPresentationContext *)self->_presentationContext externalPasskeyLoginChoiceCount])
  {
    goto LABEL_29;
  }
  uint64_t v3 = [(ASCAuthorizationPresentationContext *)self->_presentationContext loginChoices];
  int v4 = objc_msgSend(v3, "safari_containsObjectPassingTest:", &__block_literal_global_170);

  if (v4)
  {
    if (self->_shouldShowEnableCredentialProviderPrompt) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
  if (self->_isKeychainSyncEnabled) {
    goto LABEL_35;
  }
  if (self->_canKeychainSyncBeEnabled)
  {
    [(ASCAuthorizationPresentationContext *)self->_presentationContext shouldUseFallbackPasskeyUI];
    goto LABEL_7;
  }
  if ([(NSArray *)self->_tableViewLoginChoices count])
  {
LABEL_35:
    if (self->_shouldShowEnableCredentialProviderPrompt) {
      goto LABEL_7;
    }
    if (self->_isUserVerificationConfigured)
    {
LABEL_15:
      if (!self->_isKeychainSyncEnabled)
      {
        int v7 = self->_canKeychainSyncBeEnabled ? 1 : v4;
        if (v7 != 1) {
          goto LABEL_29;
        }
      }
      char v8 = [(ASCAuthorizationPresentationContext *)self->_presentationContext shouldUseFallbackPasskeyUI];
      int64_t currentlyEnabledBiometryType = self->_currentlyEnabledBiometryType;
      if (v8)
      {
        id v10 = NSString;
        id v12 = _WBSLocalizedString();
        id v13 = [(ASCAuthorizationPresentationContext *)self->_presentationContext serviceName];
        id v6 = objc_msgSend(v10, "stringWithFormat:", v12, v13);

        goto LABEL_30;
      }
      if ([(ASCAuthorizationPresentationContext *)self->_presentationContext externalPasskeyLoginChoiceCount])
      {
        BOOL v11 = 1;
      }
      else
      {
        BOOL v11 = currentlyEnabledBiometryType == 0;
      }
      if (!v11)
      {
        uint64_t v5 = [(ASCredentialPickerPaneViewController *)self _defaultPasskeySignInTitle];
        goto LABEL_8;
      }
LABEL_7:
      uint64_t v5 = _WBSLocalizedString();
LABEL_8:
      id v6 = (void *)v5;
      goto LABEL_30;
    }
  }
LABEL_29:
  id v6 = 0;
LABEL_30:

  return v6;
}

BOOL __88__ASCredentialPickerPaneViewController__titleForPlatformPublicKeyCredentialRegistration__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 loginChoiceKind] == 2)
  {
    id v3 = v2;
    if ([v3 isRegistrationRequest])
    {
      int v4 = [v3 externalCredentialProviderName];
      BOOL v5 = v4 != 0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_subtitleForPlatformPublicKeyCredentialRegistration
{
  id v3 = [(ASCAuthorizationPresentationContext *)self->_presentationContext loginChoices];
  int v4 = [v3 firstObject];

  BOOL v5 = [(ASCAuthorizationPresentationContext *)self->_presentationContext loginChoices];
  id v6 = objc_msgSend(v5, "safari_firstObjectPassingTest:", &__block_literal_global_193);

  if (v6) {
    goto LABEL_2;
  }
  if (self->_isKeychainSyncEnabled)
  {
    BOOL canKeychainSyncBeEnabled = 0;
LABEL_9:
    BOOL v9 = 0;
    goto LABEL_10;
  }
  BOOL canKeychainSyncBeEnabled = self->_canKeychainSyncBeEnabled;
  if (self->_canKeychainSyncBeEnabled) {
    goto LABEL_9;
  }
  BOOL v9 = [(NSArray *)self->_tableViewLoginChoices count] == 0;
LABEL_10:
  if (self->_shouldAutoFillFromICloudKeychain && !self->_isUserVerificationConfigured) {
    goto LABEL_22;
  }
  if (canKeychainSyncBeEnabled)
  {
    [MEMORY[0x263F662A0] isAppleAccountBrandingEnabled];
LABEL_22:
    char v8 = _WBSLocalizedString();
    goto LABEL_23;
  }
  if (v9) {
    goto LABEL_22;
  }
LABEL_2:
  if (self->_shouldShowEnableCredentialProviderPrompt) {
    goto LABEL_22;
  }
  if ([(ASCAuthorizationPresentationContext *)self->_presentationContext shouldUseFallbackPasskeyUI])
  {
    char v8 = 0;
    goto LABEL_23;
  }
  NSUInteger v10 = [(NSArray *)self->_tableViewLoginChoices count];
  BOOL v11 = NSString;
  if (v10 >= 2)
  {
    id v12 = _WBSLocalizedString();
    uint64_t v13 = [(ASCredentialPickerPaneViewController *)self _serviceName];
LABEL_27:
    uint64_t v14 = (void *)v13;
    char v8 = objc_msgSend(v11, "stringWithFormat:", v12, v13);
    goto LABEL_28;
  }
  if (!v6)
  {
    id v12 = _WBSLocalizedString();
    uint64_t v13 = [v4 userVisibleName];
    goto LABEL_27;
  }
  id v12 = _WBSLocalizedString();
  uint64_t v14 = [v6 userVisibleName];
  uint64_t v15 = [v6 externalCredentialProviderName];
  char v8 = objc_msgSend(v11, "stringWithFormat:", v12, v14, v15);

LABEL_28:
LABEL_23:

  return v8;
}

BOOL __91__ASCredentialPickerPaneViewController__subtitleForPlatformPublicKeyCredentialRegistration__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 loginChoiceKind] == 2)
  {
    id v3 = v2;
    if ([v3 isRegistrationRequest])
    {
      int v4 = [v3 externalCredentialProviderName];
      BOOL v5 = v4 != 0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_titleForPlatformPublicKeyCredentialAssertion
{
  if (self->_isUserVerificationConfigured
    || !self->_shouldAutoFillFromICloudKeychain
    || (id v3 = (void *)[(ASCAuthorizationPresentationContext *)self->_presentationContext externalPasskeyLoginChoiceCount]) != 0)
  {
    if (self->_shouldShowEnableCredentialProviderPrompt)
    {
      id v3 = _WBSLocalizedString();
    }
    else if (self->_shouldExpandOtherLoginChoices)
    {
      id v3 = 0;
    }
    else
    {
      id v3 = [(ASCredentialPickerPaneViewController *)self _defaultPasskeySignInTitle];
    }
  }

  return v3;
}

- (id)_subtitleForPlatformPublicKeyCredentialAssertion
{
  if (![(ASCAuthorizationPresentationContext *)self->_presentationContext externalPasskeyLoginChoiceCount]&& self->_shouldAutoFillFromICloudKeychain&& !self->_isUserVerificationConfigured)
  {
    goto LABEL_14;
  }
  id v3 = [(ASCAuthorizationPresentationContext *)self->_presentationContext serviceName];
  int v4 = [v3 isEqualToString:@"apple.com"];

  if (v4)
  {
    uint64_t v5 = [(NSArray *)self->_tableViewLoginChoices safari_firstObjectPassingTest:&__block_literal_global_229];
    if (v5)
    {
      id v6 = (void *)v5;
      [MEMORY[0x263F662A0] isAppleAccountBrandingEnabled];
      int v7 = NSString;
      NSUInteger v10 = _WBSLocalizedString();
      BOOL v11 = [v6 name];
      id v12 = objc_msgSend(v7, "stringWithFormat:", v10, v11);
LABEL_35:

      goto LABEL_36;
    }
  }
  if (self->_shouldShowEnableCredentialProviderPrompt)
  {
LABEL_14:
    id v12 = _WBSLocalizedString();
    goto LABEL_37;
  }
  if (self->_shouldExpandOtherLoginChoices)
  {
    uint64_t v8 = [(ASCAuthorizationPresentationContext *)self->_presentationContext serviceType];
    if (v8 == 1)
    {
      BOOL v9 = NSString;
      goto LABEL_21;
    }
    if (!v8)
    {
      BOOL v9 = NSString;
LABEL_21:
      uint64_t v16 = _WBSLocalizedString();
      BOOL v17 = [(ASCredentialPickerPaneViewController *)self _serviceName];
      uint64_t v18 = objc_msgSend(v9, "localizedStringWithFormat:", v16, v17);
      goto LABEL_22;
    }
  }
  NSUInteger v13 = [(NSArray *)self->_tableViewLoginChoices count];
  presentationContext = self->_presentationContext;
  if (v13 == 1)
  {
    if ([(ASCAuthorizationPresentationContext *)presentationContext shouldUseFallbackPasskeyUI])
    {
      uint64_t v15 = NSString;
      uint64_t v16 = _WBSLocalizedString();
      BOOL v17 = [(ASCredentialPickerPaneViewController *)self _serviceName];
      uint64_t v18 = objc_msgSend(v15, "stringWithFormat:", v16, v17);
LABEL_22:
      id v12 = (void *)v18;

      goto LABEL_37;
    }
    long long v23 = [(ASCAuthorizationPresentationContext *)self->_presentationContext loginChoices];
    id v6 = [v23 firstObject];

    NSUInteger v10 = [(ASCAuthorizationPresentationContext *)self->_presentationContext destinationSiteForCrossSiteAssertion];
    if ([v10 length])
    {
      [v6 isSharedCredential];
      long long v24 = NSString;
      BOOL v11 = _WBSLocalizedString();
      v27 = [v6 userVisibleName];
      v31 = [(ASCredentialPickerPaneViewController *)self _serviceName];
      uint64_t v32 = objc_msgSend(v24, "stringWithFormat:", v11, v10, v27, v31);
    }
    else
    {
      v28 = [(ASCAuthorizationPresentationContext *)self->_presentationContext proxiedOriginDeviceName];
      uint64_t v29 = [v28 length];

      [v6 isSharedCredential];
      BOOL v30 = NSString;
      if (v29)
      {
        BOOL v11 = _WBSLocalizedString();
        v27 = [(ASCredentialPickerPaneViewController *)self _serviceName];
        v31 = [(ASCAuthorizationPresentationContext *)self->_presentationContext proxiedOriginDeviceName];
        id v33 = [v6 userVisibleName];
        id v12 = objc_msgSend(v30, "localizedStringWithFormat:", v11, v27, v31, v33);

LABEL_33:
        goto LABEL_34;
      }
      BOOL v11 = _WBSLocalizedString();
      v27 = [(ASCredentialPickerPaneViewController *)self _serviceName];
      v31 = [v6 userVisibleName];
      uint64_t v32 = objc_msgSend(v30, "localizedStringWithFormat:", v11, v27, v31);
    }
    id v12 = (void *)v32;
    goto LABEL_33;
  }
  id v6 = [(ASCAuthorizationPresentationContext *)presentationContext destinationSiteForCrossSiteAssertion];
  uint64_t v19 = [v6 length];
  long long v20 = self->_presentationContext;
  if (v19)
  {
    long long v21 = [(ASCAuthorizationPresentationContext *)v20 loginChoices];
    NSUInteger v10 = [v21 firstObject];

    [v10 isSharedCredential];
    long long v22 = NSString;
    BOOL v11 = _WBSLocalizedString();
    v27 = [(ASCAuthorizationPresentationContext *)self->_presentationContext serviceName];
    objc_msgSend(v22, "stringWithFormat:", v11, v6, v27);
    id v12 = LABEL_27:;
LABEL_34:

    goto LABEL_35;
  }
  long long v25 = [(ASCAuthorizationPresentationContext *)v20 proxiedOriginDeviceName];

  if (v25)
  {
    long long v26 = NSString;
    NSUInteger v10 = _WBSLocalizedString();
    BOOL v11 = [(ASCredentialPickerPaneViewController *)self _serviceName];
    v27 = [(ASCAuthorizationPresentationContext *)self->_presentationContext proxiedOriginDeviceName];
    objc_msgSend(v26, "stringWithFormat:", v10, v11, v27);
    goto LABEL_27;
  }
  id v12 = 0;
LABEL_36:

LABEL_37:

  return v12;
}

uint64_t __88__ASCredentialPickerPaneViewController__subtitleForPlatformPublicKeyCredentialAssertion__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_infoLabelStringForSecurityKeyCredentialAssertion
{
  id v3 = NSString;
  int v4 = _WBSLocalizedString();
  uint64_t v5 = [(ASCredentialPickerPaneViewController *)self _serviceName];
  id v6 = objc_msgSend(v3, "stringWithFormat:", v4, v5);

  return v6;
}

- (id)_infoLabelStringForPassword
{
  int v4 = [(ASCAuthorizationPresentationContext *)self->_presentationContext loginChoices];
  uint64_t v5 = [v4 firstObject];

  id v6 = [(ASCAuthorizationPresentationContext *)self->_presentationContext proxiedOriginDeviceName];

  if (!v6) {
    goto LABEL_28;
  }
  if ([v5 isSharedCredential])
  {
    int v7 = NSString;
    uint64_t v8 = _WBSLocalizedString();
    BOOL v9 = [(ASCredentialPickerPaneViewController *)self _serviceName];
    NSUInteger v10 = [(ASCAuthorizationPresentationContext *)self->_presentationContext proxiedOriginDeviceName];
    BOOL v11 = [v5 groupName];
    uint64_t v12 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v9, v10, v11);
LABEL_21:
    id v2 = (void *)v12;

    goto LABEL_22;
  }
  uint64_t v13 = [(ASCAuthorizationPresentationContext *)self->_presentationContext serviceType];
  if (v13 == 1)
  {
    uint64_t v14 = NSString;
    goto LABEL_15;
  }
  if (v13)
  {
LABEL_28:
    if ([v5 isSharedCredential])
    {
      uint64_t v15 = [(ASCAuthorizationPresentationContext *)self->_presentationContext serviceType];
      if (v15 == 1)
      {
        uint64_t v16 = NSString;
        goto LABEL_20;
      }
      if (!v15)
      {
        uint64_t v16 = NSString;
LABEL_20:
        uint64_t v8 = _WBSLocalizedString();
        BOOL v9 = [(ASCredentialPickerPaneViewController *)self _serviceName];
        NSUInteger v10 = [v5 username];
        BOOL v11 = [v5 groupName];
        uint64_t v12 = objc_msgSend(v16, "stringWithFormat:", v8, v9, v10, v11);
        goto LABEL_21;
      }
    }
    uint64_t v17 = [(ASCAuthorizationPresentationContext *)self->_presentationContext serviceType];
    if (v17 == 1)
    {
      uint64_t v18 = NSString;
    }
    else
    {
      if (v17) {
        goto LABEL_23;
      }
      uint64_t v18 = NSString;
    }
    uint64_t v8 = _WBSLocalizedString();
    BOOL v9 = [(ASCredentialPickerPaneViewController *)self _serviceName];
    NSUInteger v10 = [v5 username];
    uint64_t v19 = objc_msgSend(v18, "stringWithFormat:", v8, v9, v10);
    goto LABEL_18;
  }
  uint64_t v14 = NSString;
LABEL_15:
  uint64_t v8 = _WBSLocalizedString();
  BOOL v9 = [(ASCredentialPickerPaneViewController *)self _serviceName];
  NSUInteger v10 = [(ASCAuthorizationPresentationContext *)self->_presentationContext proxiedOriginDeviceName];
  uint64_t v19 = objc_msgSend(v14, "localizedStringWithFormat:", v8, v9, v10);
LABEL_18:
  id v2 = (void *)v19;
LABEL_22:

LABEL_23:

  return v2;
}

- (id)_infoLabelStringForSignInWithApple
{
  id v2 = [(AKASAuthorizationProvider *)self->_authKitAuthorizationProvider loginRowData];
  id v3 = [v2 loginRowPaneTitleText];

  return v3;
}

- (id)_titleOfAlertForFailedBiometryAttemptWhenPasscodeFallbackIsNotAllowed
{
  id v2 = _WBSLocalizedString();

  return v2;
}

- (id)_messageOfAlertForFailedBiometryAttemptWhenPasscodeFallbackIsNotAllowed
{
  return (id)_WBSLocalizedString();
}

- (void)_configureAuthenticationPaneForSelectedLoginChoice:(id)a3
{
  id v20 = a3;
  uint64_t v4 = [v20 loginChoiceKind];
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      if ([v20 isExternal])
      {
        [(ASCredentialRequestConfirmButtonSubPane *)self->_confirmButtonSubPane showContinueButton];
        goto LABEL_31;
      }
      id v7 = 0;
      if ([MEMORY[0x263F29440] shouldRequireLocalAuthenticationForPasswords]) {
        goto LABEL_28;
      }
    }
    else
    {
      if (!v4)
      {
        uint64_t v5 = [(AKASAuthorizationProvider *)self->_authKitAuthorizationProvider loginRowData];
        uint64_t v6 = [v5 loginRowAuthenticationType];

        if (v6 == 3)
        {
          [(ASCredentialRequestConfirmButtonSubPane *)self->_confirmButtonSubPane showContinueWithPasswordButton];
          goto LABEL_31;
        }
        id v7 = 0;
        goto LABEL_28;
      }
      id v7 = 0;
    }
LABEL_29:
    [(ASCredentialRequestConfirmButtonSubPane *)self->_confirmButtonSubPane showContinueButton];
    goto LABEL_30;
  }
  id v7 = v20;
  uint64_t v8 = [MEMORY[0x263F66568] sharedManager];
  BOOL v9 = [v7 externalCredentialProviderBundleID];
  NSUInteger v10 = [v8 enabledExtensionWithContainingAppBundleID:v9];

  BOOL v11 = [MEMORY[0x263F66568] sharedManager];
  int v12 = [v11 extensionSupportsPasskeys:v10];

  if ([(ASCAuthorizationPresentationContext *)self->_presentationContext hasPlatformCredentialRequest]&& !self->_isUserVerificationConfigured&& (_WBSLocalizedString(), v14 = objc_claimAutoreleasedReturnValue(), (uint64_t v13 = (void *)v14) != 0)|| (([(ASCAuthorizationPresentationContext *)self->_presentationContext isRegistrationRequest] ^ 1 | v12) & 1) == 0&& (!self->_isKeychainSyncEnabled || self->_shouldShowEnableCredentialProviderPrompt)&& (_WBSLocalizedString(), (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [(ASCredentialRequestConfirmButtonSubPane *)self->_confirmButtonSubPane showContinueButtonWithTitle:v13];
  }
  uint64_t v15 = [(ASCAuthorizationPresentationContext *)self->_presentationContext platformUserVerificationPreference];
  if ([v15 isEqualToString:@"required"]) {
    char v16 = 1;
  }
  else {
    char v16 = [MEMORY[0x263F29440] shouldRequireLocalAuthenticationForPlatformCredentials];
  }

  uint64_t v17 = [v7 externalCredentialProviderName];

  if (v17 || (v16 & 1) == 0) {
    goto LABEL_29;
  }
LABEL_28:
  confirmButtonSubPane = self->_confirmButtonSubPane;
  uint64_t v19 = [(ASCredentialRequestPaneViewController *)self footerPaneContext];
  [(ASCredentialRequestConfirmButtonSubPane *)confirmButtonSubPane setUpButtonInPaneContext:v19];

  [(ASCredentialRequestConfirmButtonSubPane *)self->_confirmButtonSubPane setAuthorizationCapabilityEnabled:1];
LABEL_30:

LABEL_31:
}

- (void)_setCancelButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UIViewController *)self as_navigationItem];
  uint64_t v4 = [v5 rightBarButtonItem];
  [v4 setEnabled:v3];
}

- (void)_performAuthorizationWithAuthenticatedContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ASCAuthorizationPresentationContext *)self->_presentationContext isRegistrationRequest])
  {
    uint64_t v8 = [(ASCAuthorizationPresentationContext *)self->_presentationContext loginChoices];
    objc_msgSend(v8, "safari_firstObjectPassingTest:", &__block_literal_global_321);
    BOOL v9 = (ASCLoginChoiceProtocol *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v9 = self->_previouslySelectedLoginChoice;
  }
  if (![(ASCLoginChoiceProtocol *)v9 loginChoiceKind])
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __104__ASCredentialPickerPaneViewController__performAuthorizationWithAuthenticatedContext_completionHandler___block_invoke_2;
    v21[3] = &unk_2643967B8;
    id v22 = v7;
    uint64_t v13 = (void *)MEMORY[0x21D484070](v21);
    char v14 = objc_opt_respondsToSelector();
    authKitAuthorizationProvider = self->_authKitAuthorizationProvider;
    if (v14)
    {
      char v16 = v9;
      uint64_t v17 = [(ASCLoginChoiceProtocol *)v16 underlyingAppleIDLoginChoice];
      [(AKASAuthorizationProvider *)authKitAuthorizationProvider performAuthorizationWithLoginChoice:v17 completionHandler:v13];
    }
    else
    {
      [(AKASAuthorizationProvider *)authKitAuthorizationProvider performAuthorizationWithCompletionHandler:v13];
    }

    int v12 = v22;
    goto LABEL_14;
  }
  if ([(ASCLoginChoiceProtocol *)v9 loginChoiceKind] != 1
    || ![(ASCLoginChoiceProtocol *)v9 isExternal])
  {
    BOOL v11 = [(ASCredentialRequestPaneViewController *)self delegate];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __104__ASCredentialPickerPaneViewController__performAuthorizationWithAuthenticatedContext_completionHandler___block_invoke_327;
    v19[3] = &unk_2643967E0;
    v19[4] = self;
    id v20 = v7;
    [v11 requestPaneViewController:self didRequestCredentialForLoginChoice:v9 authenticatedContext:v6 completionHandler:v19];

    int v12 = v20;
LABEL_14:

    goto LABEL_15;
  }
  externalPasswordCredentialForSelectedLoginChoice = self->_externalPasswordCredentialForSelectedLoginChoice;
  if (externalPasswordCredentialForSelectedLoginChoice)
  {
    (*((void (**)(id, ASCPasswordCredential *, void))v7 + 2))(v7, externalPasswordCredentialForSelectedLoginChoice, 0);
  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_326);
    uint64_t v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F29388] code:1 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v18);
  }
LABEL_15:
}

uint64_t __104__ASCredentialPickerPaneViewController__performAuthorizationWithAuthenticatedContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 loginChoiceKind] == 2) {
    uint64_t v3 = [v2 isRegistrationRequest];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void __104__ASCredentialPickerPaneViewController__performAuthorizationWithAuthenticatedContext_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F293B8]) initWithAuthorization:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __104__ASCredentialPickerPaneViewController__performAuthorizationWithAuthenticatedContext_completionHandler___block_invoke_3()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __104__ASCredentialPickerPaneViewController__performAuthorizationWithAuthenticatedContext_completionHandler___block_invoke_3_cold_1();
  }
}

void __104__ASCredentialPickerPaneViewController__performAuthorizationWithAuthenticatedContext_completionHandler___block_invoke_327(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __104__ASCredentialPickerPaneViewController__performAuthorizationWithAuthenticatedContext_completionHandler___block_invoke_2_328;
    block[3] = &unk_2643954B8;
    void block[4] = *(void *)(a1 + 32);
    id v9 = v5;
    id v10 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __104__ASCredentialPickerPaneViewController__performAuthorizationWithAuthenticatedContext_completionHandler___block_invoke_2_328(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 requestPaneViewController:*(void *)(a1 + 32) dismissWithCredential:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (BOOL)_shouldShowLoginChoicesInTableView
{
  if (self->_shouldExpandOtherLoginChoices) {
    return 1;
  }
  tableViewLoginChoices = self->_tableViewLoginChoices;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__ASCredentialPickerPaneViewController__shouldShowLoginChoicesInTableView__block_invoke;
  v6[3] = &unk_264396808;
  v6[4] = self;
  id v4 = [(NSArray *)tableViewLoginChoices safari_filterObjectsUsingBlock:v6];
  BOOL v2 = (unint64_t)[v4 count] > 1;

  return v2;
}

BOOL __74__ASCredentialPickerPaneViewController__shouldShowLoginChoicesInTableView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 loginChoiceKind] == 2 && !*(unsigned char *)(*(void *)(a1 + 32) + 1179))
  {
    id v5 = [v3 externalCredentialProviderName];
    BOOL v4 = v5 != 0;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)_updateCachedLoginChoices
{
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __65__ASCredentialPickerPaneViewController__updateCachedLoginChoices__block_invoke;
  v19[3] = &unk_264396808;
  v19[4] = self;
  id v3 = (void *)MEMORY[0x21D484070](v19, a2);
  presentationContext = self->_presentationContext;
  if (self->_shouldExpandOtherLoginChoices)
  {
    id v5 = [(ASCAuthorizationPresentationContext *)presentationContext loginChoices];
    objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v3);
    id v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    tableViewLoginChoices = self->_tableViewLoginChoices;
    self->_tableViewLoginChoices = v6;

    if (!self->_isKeychainSyncEnabled && !self->_canKeychainSyncBeEnabled)
    {
      uint64_t v8 = self->_tableViewLoginChoices;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __65__ASCredentialPickerPaneViewController__updateCachedLoginChoices__block_invoke_2;
      v18[3] = &unk_264396808;
      v18[4] = self;
      id v9 = [(NSArray *)v8 safari_filterObjectsUsingBlock:v18];
      id v10 = self->_tableViewLoginChoices;
      self->_tableViewLoginChoices = v9;
    }
    otherLoginChoices = self->_otherLoginChoices;
    self->_otherLoginChoices = 0;
  }
  else
  {
    id v16 = 0;
    id v17 = 0;
    [(ASCAuthorizationPresentationContext *)presentationContext _getPrimaryLoginChoices:&v17 otherLoginChoices:&v16];
    otherLoginChoices = (NSArray *)v17;
    int v12 = (NSArray *)v16;
    uint64_t v13 = [(NSArray *)otherLoginChoices safari_filterObjectsUsingBlock:v3];
    char v14 = self->_tableViewLoginChoices;
    self->_tableViewLoginChoices = v13;

    uint64_t v15 = self->_otherLoginChoices;
    self->_otherLoginChoices = v12;
  }
}

BOOL __65__ASCredentialPickerPaneViewController__updateCachedLoginChoices__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v8 = 1;
    goto LABEL_7;
  }
  id v4 = v3;
  id v5 = [v4 externalCredentialProviderName];

  if (!v5)
  {
    id v6 = [v4 relyingPartyIdentifier];
    char v7 = [v6 isEqualToString:@"apple.com"];

    if ((v7 & 1) == 0)
    {
      if ([v4 isRegistrationRequest]
        && (uint64_t v10 = *(void *)(a1 + 32), !*(unsigned char *)(v10 + 1177))
        && [*(id *)(v10 + 1056) externalPasskeyLoginChoiceCount]
        || (uint64_t v11 = *(void *)(a1 + 32), *(unsigned char *)(v11 + 1216))
        || *(unsigned char *)(v11 + 1104) && *(unsigned char *)(v11 + 1177) && !*(unsigned char *)(v11 + 1218))
      {
        BOOL v8 = 0;
        goto LABEL_5;
      }
      if ([*(id *)(v11 + 1056) externalPasskeyLoginChoiceCount])
      {
        BOOL v8 = *(unsigned char *)(*(void *)(a1 + 32) + 1179) != 0;
        goto LABEL_5;
      }
    }
  }
  BOOL v8 = 1;
LABEL_5:

LABEL_7:
  return v8;
}

BOOL __65__ASCredentialPickerPaneViewController__updateCachedLoginChoices__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 loginChoiceKind] == 2
    && [*(id *)(*(void *)(a1 + 32) + 1056) isRegistrationRequest])
  {
    id v4 = [v3 externalCredentialProviderName];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)_iconImage
{
  if ([(ASCAuthorizationPresentationContext *)self->_presentationContext isCABLEAuthenticatorRequest])+[ASCredentialRequestIconGenerator passwordManagerIcon]; {
  else
  }
  id v3 = +[ASCredentialRequestIconGenerator headerIconForPresentationContext:self->_presentationContext];

  return v3;
}

- (void)_userSelectedExternalPasswordCredential
{
  id v10 = [(ASCLoginChoiceProtocol *)self->_previouslySelectedLoginChoice providerBundleIdentifier];
  id v3 = [MEMORY[0x263F66568] sharedManager];
  id v4 = [v3 enabledExtensionWithContainingAppBundleID:v10];

  if (v4)
  {
    BOOL v5 = [ASPasswordCredentialIdentity alloc];
    id v6 = [(ASCLoginChoiceProtocol *)self->_previouslySelectedLoginChoice externalCredentialIdentity];
    char v7 = [(ASPasswordCredentialIdentity *)v5 initWithFoundationCredentialIdentity:v6];

    BOOL v8 = [[_ASCredentialAuthenticationViewController alloc] initWithExtension:v4 credentialIdentity:v7];
    credentialProviderViewController = self->_credentialProviderViewController;
    self->_credentialProviderViewController = v8;

    [(_ASCredentialAuthenticationViewController *)self->_credentialProviderViewController setDelegate:self];
  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_330);
  }
}

void __79__ASCredentialPickerPaneViewController__userSelectedExternalPasswordCredential__block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __79__ASCredentialPickerPaneViewController__userSelectedExternalPasswordCredential__block_invoke_cold_1();
  }
}

- (unint64_t)_credentialCount
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v2 = self->_tableViewLoginChoices;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        if ((unint64_t)objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "loginChoiceKind", (void)v9) < 5) {
          ++v5;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)presentUIForPasswordCredentialAuthenticationViewController:(id)a3
{
}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [a3 presentingViewController];

  if (!v10)
  {
    [(_ASCredentialAuthenticationViewController *)self->_credentialProviderViewController dismissViewControllerAnimated:1 completion:v12];
    credentialProviderViewController = self->_credentialProviderViewController;
    self->_credentialProviderViewController = 0;

    externalPasswordCredentialForSelectedLoginChoice = self->_externalPasswordCredentialForSelectedLoginChoice;
    self->_externalPasswordCredentialForSelectedLoginChoice = 0;

    if ([(ASCAuthorizationPresentationContext *)self->_presentationContext isConditionalRegistrationRequest])
    {
      authorizationActivity = self->_authorizationActivity;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __120__ASCredentialPickerPaneViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke;
      block[3] = &unk_264395388;
      id v45 = v11;
      os_activity_apply(authorizationActivity, block);
      uint64_t v29 = [(ASCredentialRequestPaneViewController *)self delegate];
      BOOL v30 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F29388] code:2 userInfo:0];
      [v29 requestPaneViewController:self dismissWithCredential:0 error:v30];

      v31 = v45;
    }
    else
    {
      [(ASCredentialPickerPaneViewController *)self _configureAuthenticationPaneForSelectedLoginChoice:self->_previouslySelectedLoginChoice];
      int v32 = objc_msgSend(v11, "safari_matchesErrorDomain:andCode:", @"ASExtensionErrorDomain", 1);
      id v33 = self->_authorizationActivity;
      if (v32)
      {
        os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_335);
        goto LABEL_14;
      }
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __120__ASCredentialPickerPaneViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_336;
      v42[3] = &unk_264395388;
      id v43 = v11;
      os_activity_apply(v33, v42);
      v31 = v43;
    }

    goto LABEL_14;
  }
  id v37 = v11;
  id v14 = objc_alloc_init(MEMORY[0x263F663B8]);
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __120__ASCredentialPickerPaneViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_338;
  v40[3] = &unk_264395B50;
  id v36 = v12;
  id v41 = v12;
  v35 = v14;
  [v14 setHandler:v40];
  uint64_t v39 = [(ASCredentialRequestPaneViewController *)self delegate];
  uint64_t v15 = self->_previouslySelectedLoginChoice;
  id v16 = [(ASCLoginChoiceProtocol *)v15 site];
  id v17 = objc_alloc(MEMORY[0x263F293E0]);
  uint64_t v18 = [v10 user];
  id v38 = v10;
  uint64_t v19 = [v10 password];
  id v20 = [MEMORY[0x263EFF910] date];
  v34 = v15;
  long long v21 = [(ASCLoginChoiceProtocol *)v15 externalCredentialIdentity];
  id v22 = [v21 owningExtensionState];
  long long v23 = [v22 providerBundleID];
  long long v24 = (void *)[v17 initWithUser:v18 password:v19 site:v16 creationDate:v20 externalProviderBundleIdentifier:v23];

  if (v13)
  {
    long long v25 = (void *)v39;
LABEL_8:
    [v25 requestPaneViewController:self dismissWithCredential:v24 error:0];
    goto LABEL_9;
  }
  long long v25 = (void *)v39;
  if (([MEMORY[0x263F29440] shouldRequireLocalAuthenticationForPasswords] & 1) == 0) {
    goto LABEL_8;
  }
  objc_storeStrong((id *)&self->_externalPasswordCredentialForSelectedLoginChoice, v24);
  [(ASCredentialRequestConfirmButtonSubPane *)self->_confirmButtonSubPane showAuthenticationMechanismForExternalPasswordCredential];
LABEL_9:
  id v11 = v37;
  id v10 = v38;
  id v12 = v36;

LABEL_14:
}

void __120__ASCredentialPickerPaneViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    unint64_t v5 = objc_msgSend(v3, "safari_privacyPreservingDescription");
    int v6 = 138543362;
    char v7 = v5;
    _os_log_impl(&dword_21918F000, v4, OS_LOG_TYPE_DEFAULT, "Credential provider rejected conditional registration request: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

void __120__ASCredentialPickerPaneViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_333()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21918F000, v0, OS_LOG_TYPE_DEFAULT, "Did not receive any external password credential because user canceled", v1, 2u);
  }
}

void __120__ASCredentialPickerPaneViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_336(uint64_t a1)
{
  BOOL v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __120__ASCredentialPickerPaneViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_336_cold_1(a1, v2);
  }
}

uint64_t __120__ASCredentialPickerPaneViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_338(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  credentialProviderViewController = self->_credentialProviderViewController;
  id v10 = a6;
  id v11 = a5;
  id v13 = a4;
  [(_ASCredentialAuthenticationViewController *)credentialProviderViewController dismissViewControllerAnimated:1 completion:v10];
  id v12 = self->_credentialProviderViewController;
  self->_credentialProviderViewController = 0;

  [(ASCredentialPickerPaneViewController *)self _completePasskeyAssertionWithCredential:v13 error:v11 completion:v10];
}

- (void)_completePasskeyAssertionWithCredential:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  if (v9 || (v24 = 0, v11 = [v8 _validateWithError:&v24], id v9 = v24, (v11 & 1) != 0))
  {
    if (!v8)
    {
      uint64_t v19 = 0;
      goto LABEL_10;
    }
    id v12 = objc_alloc(MEMORY[0x263F293F0]);
    id v13 = [v8 relyingParty];
    [v8 authenticatorData];
    v14 = long long v23 = self;
    uint64_t v15 = [v8 signature];
    id v16 = [v8 userHandle];
    id v17 = [v8 credentialID];
    uint64_t v18 = [v8 coreExtensions];
    LOBYTE(v22) = 1;
    uint64_t v19 = (void *)[v12 initWithRelyingPartyIdentifier:v13 authenticatorData:v14 signature:v15 userHandle:v16 rawClientDataJSON:0 credentialID:v17 extensions:v18 attachment:*MEMORY[0x263F29398] isExternal:v22];

    self = v23;
  }
  else
  {
    id v20 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[ASCredentialPickerPaneViewController _completePasskeyAssertionWithCredential:error:completion:]();
    }
    uint64_t v19 = 0;
    id v13 = v8;
    id v8 = 0;
  }

LABEL_10:
  long long v21 = [(ASCredentialRequestPaneViewController *)self delegate];
  [v21 requestPaneViewController:self dismissWithCredential:v19 error:v9];

  if (v10) {
    v10[2](v10);
  }
}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithPasskeyRegistrationCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  char v11 = (void (**)(void))a6;
  [(_ASCredentialAuthenticationViewController *)self->_credentialProviderViewController dismissViewControllerAnimated:1 completion:v11];
  credentialProviderViewController = self->_credentialProviderViewController;
  self->_credentialProviderViewController = 0;

  if (v10 || (v24 = 0, v13 = [v9 _validateWithError:&v24], id v10 = v24, (v13 & 1) != 0))
  {
    if (!v9)
    {
      id v20 = 0;
      goto LABEL_10;
    }
    id v14 = objc_alloc(MEMORY[0x263F29400]);
    uint64_t v15 = [v9 relyingParty];
    id v16 = [v9 attestationObject];
    id v17 = [v9 credentialID];
    uint64_t v18 = +[ASPasskeyRegistrationCredential _defaultTransports];
    uint64_t v19 = [v9 coreExtensions];
    LOBYTE(v23) = 1;
    id v20 = (void *)[v14 initWithRelyingPartyIdentifier:v15 attestationObject:v16 rawClientDataJSON:0 credentialID:v17 transports:v18 extensions:v19 attachment:*MEMORY[0x263F29398] isExternal:v23];
  }
  else
  {
    long long v21 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[ASCredentialPickerPaneViewController _completePasskeyAssertionWithCredential:error:completion:]();
    }
    id v20 = 0;
    uint64_t v15 = v9;
    id v9 = 0;
  }

LABEL_10:
  uint64_t v22 = [(ASCredentialRequestPaneViewController *)self delegate];
  [v22 requestPaneViewController:self dismissWithCredential:v20 error:v10];

  if (v11) {
    v11[2](v11);
  }
}

- (void)credentialListViewController:(id)a3 didFinishWithCredential:(id)a4 completion:(id)a5
{
  id v26 = a4;
  char v7 = self->_previouslySelectedLoginChoice;
  if (v26)
  {
    id v8 = (objc_class *)MEMORY[0x263F293E0];
    id v9 = a5;
    id v25 = [v8 alloc];
    id v24 = [v26 user];
    id v10 = [v26 password];
    char v11 = [(ASCAuthorizationPresentationContext *)self->_presentationContext serviceName];
    id v12 = [MEMORY[0x263EFF910] date];
    [(ASCLoginChoiceProtocol *)v7 externalCredentialIdentity];
    v14 = char v13 = v7;
    uint64_t v15 = [v14 owningExtensionState];
    id v16 = [v15 providerBundleID];
    id v17 = (void *)[v25 initWithUser:v24 password:v10 site:v11 creationDate:v12 externalProviderBundleIdentifier:v16];

    char v7 = v13;
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F29388];
    id v21 = a5;
    uint64_t v18 = [v19 errorWithDomain:v20 code:2 userInfo:0];
    id v17 = 0;
  }
  uint64_t v22 = [(ASCredentialRequestPaneViewController *)self delegate];
  [v22 requestPaneViewController:self dismissWithCredential:v17 error:v18];

  credentialListViewController = self->_credentialListViewController;
  self->_credentialListViewController = 0;

  (*((void (**)(id))a5 + 2))(a5);
}

- (void)credentialListViewControllerDidPrepareInterface:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __88__ASCredentialPickerPaneViewController_credentialListViewControllerDidPrepareInterface___block_invoke;
  v6[3] = &unk_264395428;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __88__ASCredentialPickerPaneViewController_credentialListViewControllerDidPrepareInterface___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)credentialListViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 completion:(id)a5
{
  id v11 = a4;
  id v7 = (void (**)(void))a5;
  credentialListViewController = self->_credentialListViewController;
  self->_credentialListViewController = 0;

  id v9 = [(ASCredentialRequestPaneViewController *)self delegate];
  if (v11)
  {
    [(ASCredentialPickerPaneViewController *)self _completePasskeyAssertionWithCredential:v11 error:0 completion:v7];
  }
  else
  {
    id v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F29388] code:2 userInfo:0];
    [v9 requestPaneViewController:self dismissWithCredential:0 error:v10];

    v7[2](v7);
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (![(ASCredentialPickerPaneViewController *)self _shouldShowLoginChoicesInTableView])return 0; {
  if (![(NSArray *)self->_tableViewLoginChoices safari_containsObjectPassingTest:&__block_literal_global_345])return 1;
  }
  if (self->_onlyHasOtherAccountsLoginChoices) {
    return 1;
  }
  return 2;
}

uint64_t __68__ASCredentialPickerPaneViewController_numberOfSectionsInTableView___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ([(ASCredentialPickerPaneViewController *)self _isOtherAccountsSection:a4]
    && !self->_onlyHasOtherAccountsLoginChoices)
  {
    id v5 = _WBSLocalizedString();
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(ASCredentialPickerPaneViewController *)self _isOtherAccountsSection:a4])
  {
    id v5 = [(NSArray *)self->_tableViewLoginChoices safari_filterObjectsUsingBlock:&__block_literal_global_352];
    int64_t v6 = [v5 count];

    return v6;
  }
  else
  {
    return [(ASCredentialPickerPaneViewController *)self numberOfTableRows];
  }
}

uint64_t __72__ASCredentialPickerPaneViewController_tableView_numberOfRowsInSection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 row];
  uint64_t v7 = [v5 section];

  return [(ASCredentialPickerPaneViewController *)self _cellForRow:v6 section:v7];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  if (!-[ASCredentialPickerPaneViewController _isOtherAccountsSection:](self, "_isOtherAccountsSection:", objc_msgSend(a4, "section", a3)))return *MEMORY[0x263F839B8]; {
  +[ASViewServiceInterfaceUtilities tableViewRowHeight];
  }
  double v5 = v4;
  +[ASViewServiceInterfaceUtilities otherAccountsCellSizeFactor];
  return v5 * v6;
}

- (BOOL)_isOtherAccountsSection:(int64_t)a3
{
  return !self->_onlyHasOtherAccountsLoginChoices == a3;
}

- (int64_t)numberOfTableRows
{
  if (self->_onlyHasOtherAccountsLoginChoices)
  {
    uint64_t v3 = [(ASCAuthorizationPresentationContext *)self->_presentationContext loginChoices];
    int64_t v4 = [v3 count];

    return v4;
  }
  else if ([(ASCredentialPickerPaneViewController *)self _shouldShowLoginChoicesInTableView])
  {
    return [(ASCredentialPickerPaneViewController *)self _credentialCount];
  }
  else
  {
    return 0;
  }
}

- (id)_cellForRow:(int64_t)a3 section:(int64_t)a4
{
  if (a4)
  {
    uint64_t v7 = [(ASCAuthorizationPresentationContext *)self->_presentationContext otherAccountsLoginChoices];
    id v8 = [v7 objectAtIndexedSubscript:a3];
  }
  else
  {
    id v8 = [(NSArray *)self->_tableViewLoginChoices objectAtIndexedSubscript:a3];
  }
  id v9 = [[ASCredentialRequestLoginChoiceCell alloc] initWithLoginChoice:v8 presentationContext:self->_presentationContext authorizationProvider:self->_authKitAuthorizationProvider];
  BOOL v10 = self->_currentlySelectedRow == a3 && self->_currentlySelectedSection == a4
     || [(NSArray *)self->_tableViewLoginChoices count] == 1;
  [(ASCredentialRequestLoginChoiceCell *)v9 setIsSelectedLoginChoice:v10];

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 row];
  uint64_t v7 = [v5 section];

  [(ASCredentialPickerPaneViewController *)self _updateSelectedRow:v6 section:v7];
}

- (void)_updateSelectedRow:(int64_t)a3 section:(int64_t)a4
{
  if (*(_OWORD *)&self->_currentlySelectedRow != __PAIR128__(a4, a3))
  {
    credentialProviderViewController = self->_credentialProviderViewController;
    self->_credentialProviderViewController = 0;

    externalPasswordCredentialForSelectedLoginChoice = self->_externalPasswordCredentialForSelectedLoginChoice;
    self->_externalPasswordCredentialForSelectedLoginChoice = 0;

    int64_t v9 = a3;
    if (a4 == 1) {
      int64_t v9 = [(ASCredentialPickerPaneViewController *)self _credentialCount] + a3;
    }
    obuint64_t j = [(NSArray *)self->_tableViewLoginChoices objectAtIndexedSubscript:v9];
    [(ASCredentialPickerPaneViewController *)self _configureAuthenticationPaneForSelectedLoginChoice:obj];
    int64_t currentlySelectedRow = self->_currentlySelectedRow;
    int64_t currentlySelectedSection = self->_currentlySelectedSection;
    self->_int64_t currentlySelectedRow = a3;
    self->_int64_t currentlySelectedSection = a4;
    objc_storeStrong((id *)&self->_previouslySelectedLoginChoice, obj);
    if (([(ASCredentialPickerPaneViewController *)self isMovingToParentViewController] & 1) == 0)
    {
      if ((currentlySelectedRow & 0x8000000000000000) == 0 && (currentlySelectedSection & 0x8000000000000000) == 0)
      {
        id v12 = [(ASCredentialRequestPaneViewController *)self tableView];
        char v13 = [MEMORY[0x263F088C8] indexPathForRow:currentlySelectedRow inSection:currentlySelectedSection];
        id v14 = [v12 cellForRowAtIndexPath:v13];

        [v14 setIsSelectedLoginChoice:0];
      }
      if (((a4 | a3) & 0x8000000000000000) == 0)
      {
        uint64_t v15 = [(ASCredentialRequestPaneViewController *)self tableView];
        id v16 = [MEMORY[0x263F088C8] indexPathForRow:a3 inSection:a4];
        id v17 = [v15 cellForRowAtIndexPath:v16];

        [v17 setIsSelectedLoginChoice:1];
      }
    }
  }
}

- (void)confirmButtonSubPaneDidEnterProcessingState:(id)a3 withAuthenticatedContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_previouslySelectedLoginChoice)
  {
    [(ASCredentialPickerPaneViewController *)self _setCancelButtonEnabled:0];
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __109__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidEnterProcessingState_withAuthenticatedContext___block_invoke;
    v10[3] = &unk_264396830;
    objc_copyWeak(&v12, &location);
    id v11 = v6;
    [(ASCredentialPickerPaneViewController *)self _performAuthorizationWithAuthenticatedContext:v7 completionHandler:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    [v6 invalidateProcessingState];
    confirmButtonSubPane = self->_confirmButtonSubPane;
    int64_t v9 = _WBSLocalizedString();
    [(ASCredentialRequestConfirmButtonSubPane *)confirmButtonSubPane biometricAuthenticationFailureWithAlertString:v9];
  }
}

void __109__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidEnterProcessingState_withAuthenticatedContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      int64_t v9 = *(void **)(a1 + 32);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __109__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidEnterProcessingState_withAuthenticatedContext___block_invoke_2;
      v17[3] = &unk_2643954B8;
      v17[4] = WeakRetained;
      id v18 = v5;
      id v19 = v6;
      [v9 finishProcessingWithCompletionHandler:v17];

      BOOL v10 = v18;
LABEL_7:

      goto LABEL_8;
    }
    if (![WeakRetained _errorIsPINRequiredError:v6])
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __109__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidEnterProcessingState_withAuthenticatedContext___block_invoke_4;
      v11[3] = &unk_264396218;
      id v12 = *(id *)(a1 + 32);
      char v13 = v8;
      id v14 = 0;
      id v15 = v6;
      dispatch_async(MEMORY[0x263EF83A0], v11);

      BOOL v10 = v12;
      goto LABEL_7;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __109__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidEnterProcessingState_withAuthenticatedContext___block_invoke_3;
    block[3] = &unk_264395388;
    void block[4] = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
LABEL_8:
}

void __109__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidEnterProcessingState_withAuthenticatedContext___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 requestPaneViewController:*(void *)(a1 + 32) dismissWithCredential:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

void __109__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidEnterProcessingState_withAuthenticatedContext___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 requestPaneViewControllerRequiresPINEntryInterface:*(void *)(a1 + 32)];
}

void __109__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidEnterProcessingState_withAuthenticatedContext___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateProcessingState];
  [*(id *)(a1 + 40) _setCancelButtonEnabled:1];
  id v2 = [*(id *)(a1 + 40) delegate];
  [v2 requestPaneViewController:*(void *)(a1 + 40) dismissWithCredential:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (BOOL)_errorIsPINRequiredError:(id)a3
{
  return objc_msgSend(a3, "safari_matchesErrorDomain:andCode:", *MEMORY[0x263F29388], 3);
}

- (void)confirmButtonSubPaneDidFailBiometry:(id)a3 allowingPasscodeFallback:(BOOL)a4
{
  os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_359);
  if (!a4)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __101__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidFailBiometry_allowingPasscodeFallback___block_invoke_360;
    block[3] = &unk_264395388;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __101__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidFailBiometry_allowingPasscodeFallback___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21918F000, v0, OS_LOG_TYPE_INFO, "Biometric authentication in ASAuthorizationController credential picker failed.", v1, 2u);
  }
}

void __101__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidFailBiometry_allowingPasscodeFallback___block_invoke_360(uint64_t a1)
{
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __101__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidFailBiometry_allowingPasscodeFallback___block_invoke_2;
  v19[3] = &unk_264395388;
  v19[4] = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x21D484070](v19);
  uint64_t v3 = (void *)MEMORY[0x263F82418];
  int64_t v4 = [*(id *)(a1 + 32) _titleOfAlertForFailedBiometryAttemptWhenPasscodeFallbackIsNotAllowed];
  id v5 = [*(id *)(a1 + 32) _messageOfAlertForFailedBiometryAttemptWhenPasscodeFallbackIsNotAllowed];
  id v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  id v7 = (void *)MEMORY[0x263F82400];
  id v8 = _WBSLocalizedString();
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __101__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidFailBiometry_allowingPasscodeFallback___block_invoke_3;
  v17[3] = &unk_264396858;
  id v9 = v2;
  id v18 = v9;
  BOOL v10 = [v7 actionWithTitle:v8 style:0 handler:v17];
  [v6 addAction:v10];

  id v11 = (void *)MEMORY[0x263F82400];
  id v12 = _WBSLocalizedString();
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __101__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidFailBiometry_allowingPasscodeFallback___block_invoke_4;
  v15[3] = &unk_264396858;
  id v16 = v9;
  id v13 = v9;
  id v14 = [v11 actionWithTitle:v12 style:0 handler:v15];

  [v6 addAction:v14];
  [v6 setPreferredAction:v14];
  [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
}

void __101__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidFailBiometry_allowingPasscodeFallback___block_invoke_2(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F29388];
  uint64_t v7 = *MEMORY[0x263F08338];
  v8[0] = @"Stolen Device Protection is enabled and biometry is required.";
  int64_t v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v5 = [v2 errorWithDomain:v3 code:1 userInfo:v4];

  id v6 = [*(id *)(a1 + 32) delegate];
  [v6 requestPaneViewController:*(void *)(a1 + 32) dismissWithCredential:0 error:v5];
}

uint64_t __101__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidFailBiometry_allowingPasscodeFallback___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __101__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidFailBiometry_allowingPasscodeFallback___block_invoke_4(uint64_t a1)
{
  id v2 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v3 = [NSURL URLWithString:@"https://support.apple.com/en-us/HT212510"];
  [v2 openURL:v3 options:MEMORY[0x263EFFA78] completionHandler:0];

  int64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

- (void)performPasswordAuthentication:(id)a3
{
  if ([(ASCLoginChoiceProtocol *)self->_previouslySelectedLoginChoice loginChoiceKind])
  {
    authorizationActivity = self->_authorizationActivity;
    os_activity_apply(authorizationActivity, &__block_literal_global_374);
  }
  else
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __70__ASCredentialPickerPaneViewController_performPasswordAuthentication___block_invoke_375;
    v5[3] = &unk_2643964F0;
    v5[4] = self;
    [(ASCredentialPickerPaneViewController *)self _performAuthorizationWithAuthenticatedContext:0 completionHandler:v5];
  }
}

void __70__ASCredentialPickerPaneViewController_performPasswordAuthentication___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __70__ASCredentialPickerPaneViewController_performPasswordAuthentication___block_invoke_cold_1();
  }
}

void __70__ASCredentialPickerPaneViewController_performPasswordAuthentication___block_invoke_375(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__ASCredentialPickerPaneViewController_performPasswordAuthentication___block_invoke_2;
  block[3] = &unk_2643954B8;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __70__ASCredentialPickerPaneViewController_performPasswordAuthentication___block_invoke_2(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "ak_isUserCancelError") & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 40) delegate];
    [v2 requestPaneViewController:*(void *)(a1 + 40) dismissWithCredential:*(void *)(a1 + 48) error:*(void *)(a1 + 32)];
  }
}

- (void)performAuthorization:(id)a3 withAuthenticatedLAContext:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __88__ASCredentialPickerPaneViewController_performAuthorization_withAuthenticatedLAContext___block_invoke;
  v4[3] = &unk_2643964F0;
  v4[4] = self;
  [(ASCredentialPickerPaneViewController *)self _performAuthorizationWithAuthenticatedContext:a4 completionHandler:v4];
}

void __88__ASCredentialPickerPaneViewController_performAuthorization_withAuthenticatedLAContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) _errorIsPINRequiredError:v6])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __88__ASCredentialPickerPaneViewController_performAuthorization_withAuthenticatedLAContext___block_invoke_2;
    block[3] = &unk_264395388;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __88__ASCredentialPickerPaneViewController_performAuthorization_withAuthenticatedLAContext___block_invoke_3;
    v7[3] = &unk_2643954B8;
    void v7[4] = *(void *)(a1 + 32);
    id v8 = v5;
    id v9 = v6;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

void __88__ASCredentialPickerPaneViewController_performAuthorization_withAuthenticatedLAContext___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 requestPaneViewControllerRequiresPINEntryInterface:*(void *)(a1 + 32)];
}

void __88__ASCredentialPickerPaneViewController_performAuthorization_withAuthenticatedLAContext___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 requestPaneViewController:*(void *)(a1 + 32) dismissWithCredential:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (BOOL)validateReadyForAuthorization:(id)a3
{
  return self->_previouslySelectedLoginChoice != 0;
}

- (void)userTappedContinueButton
{
  v16[1] = *MEMORY[0x263EF8340];
  if (self->_shouldShowEnableCredentialProviderPrompt
    && ((uint64_t v3 = self->_previouslySelectedLoginChoice) == 0
     || [(ASCLoginChoiceProtocol *)v3 loginChoiceKind] == 2))
  {
    +[ASSettingsHelper openCredentialProviderAppSettingsWithCompletionHandler:&__block_literal_global_379];
    [(ASCredentialPickerPaneViewController *)self _dismiss];
  }
  else
  {
    previouslySelectedLoginChoice = self->_previouslySelectedLoginChoice;
    if (previouslySelectedLoginChoice)
    {
      switch([(ASCLoginChoiceProtocol *)previouslySelectedLoginChoice loginChoiceKind])
      {
        case 1:
          id v5 = self->_previouslySelectedLoginChoice;
          [(ASCredentialPickerPaneViewController *)self _userTappedContinueButtonForPasswordLoginChoice:v5];
          break;
        case 2:
          id v11 = self->_previouslySelectedLoginChoice;
          [(ASCredentialPickerPaneViewController *)self _userTappedContinueButtonForPasskeyLoginChoice:v11];
          break;
        case 3:
          uint64_t v12 = self->_previouslySelectedLoginChoice;
          [(ASCredentialPickerPaneViewController *)self _userTappendContinueButtonForSecurityKeyLoginChoice:v12];
          break;
        case 4:
          id v13 = self->_previouslySelectedLoginChoice;
          [(ASCredentialPickerPaneViewController *)self _userTappedContinueButtonForCABLELoginChoice:v13];
          break;
        case 5:
          [(ASCredentialPickerPaneViewController *)self _userTappedContinueButtonForICloudKeychainLoginChoice];
          break;
        case 6:
          id v14 = self->_previouslySelectedLoginChoice;
          [(ASCredentialPickerPaneViewController *)self _userTappedContinueButtonForCredentialProviderExtensionLoginChoice:v14];
          break;
        default:
          return;
      }
    }
    else
    {
      id v6 = [(ASCredentialRequestPaneViewController *)self delegate];
      uint64_t v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = *MEMORY[0x263F29388];
      uint64_t v15 = *MEMORY[0x263F08338];
      v16[0] = @"Passkeys require iCloud Keychain, which has been restricted by a configuration profile.";
      id v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      BOOL v10 = [v7 errorWithDomain:v8 code:1 userInfo:v9];
      [v6 requestPaneViewController:self dismissWithCredential:0 error:v10];
    }
  }
}

void __64__ASCredentialPickerPaneViewController_userTappedContinueButton__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __64__ASCredentialPickerPaneViewController_userTappedContinueButton__block_invoke_cold_1(v3);
  }
}

- (void)_userTappedContinueButtonForPasskeyLoginChoice:(id)a3
{
  v55[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 externalCredentialProviderBundleID];

  if (!v5)
  {
    if (([v4 isRegistrationRequest] & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_16;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v6 = [MEMORY[0x263F66568] sharedManager];
  uint64_t v7 = [v6 getEnabledExtensionsSynchronously];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v43 = self;
    id v5 = 0;
    uint64_t v10 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v13 = objc_msgSend(v4, "externalCredentialProviderBundleID", v43);
        id v14 = objc_msgSend(v12, "sf_bundleIdentifierForContainingApp");
        int v15 = [v13 isEqualToString:v14];

        if (v15)
        {
          id v16 = v12;

          id v5 = v16;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v9);

    if (v5)
    {
      if (([v4 isRegistrationRequest] & 1) == 0)
      {
        self = v43;
        goto LABEL_23;
      }
      id v17 = [MEMORY[0x263F66568] sharedManager];
      int v18 = [v17 extensionSupportsPasskeys:v5];

      self = v43;
      if (v18)
      {
        id v19 = [ASPasskeyRegistrationCredentialExtensionInput alloc];
        uint64_t v20 = [(ASCAuthorizationPresentationContext *)v43->_presentationContext passkeyCreationOptionsForExternalProvider];
        id v21 = [v20 extensions];
        uint64_t v22 = [(ASPasskeyRegistrationCredentialExtensionInput *)v19 initWithCoreExtensions:v21];

        uint64_t v23 = [[ASPasskeyCredentialRequest alloc] initWithLoginChoice:v4 registrationExtensionInput:v22];
        id v24 = [[_ASCredentialAuthenticationViewController alloc] initWithExtension:v5 passkeyRegistrationRequest:v23 forConditionalRegistration:[(ASCAuthorizationPresentationContext *)v43->_presentationContext isConditionalRegistrationRequest]];
LABEL_27:
        credentialProviderViewController = self->_credentialProviderViewController;
        self->_credentialProviderViewController = v24;

        [(_ASCredentialAuthenticationViewController *)self->_credentialProviderViewController setDelegate:self];
LABEL_31:

        goto LABEL_35;
      }
LABEL_16:
      if (!self->_isUserVerificationConfigured)
      {
        id v37 = [NSURL URLWithString:@"prefs:root=PASSCODE"];
        id v38 = [MEMORY[0x263F01880] defaultWorkspace];
        uint64_t v51 = *MEMORY[0x263F3F5E8];
        uint64_t v52 = MEMORY[0x263EFFA88];
        uint64_t v39 = NSDictionary;
        dispatch_queue_t v40 = &v52;
        id v41 = &v51;
        goto LABEL_34;
      }
      if (!self->_isKeychainSyncEnabled)
      {
        id v25 = [NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.KeychainSync"];
        id v26 = [MEMORY[0x263F01880] defaultWorkspace];
        uint64_t v54 = *MEMORY[0x263F3F5E8];
        v55[0] = MEMORY[0x263EFFA88];
        v27 = [NSDictionary dictionaryWithObjects:v55 forKeys:&v54 count:1];
        [v26 openSensitiveURL:v25 withOptions:v27];

        [(ASCredentialPickerPaneViewController *)self _dismiss];
LABEL_35:

        goto LABEL_36;
      }
LABEL_23:
      uint64_t v29 = [v4 externalCredentialProviderName];
      BOOL v30 = v29;
      if (v29 && v5)
      {
        v31 = [MEMORY[0x263F66568] sharedManager];
        int v32 = [v31 extensionSupportsPasskeys:v5];

        if (v32)
        {
          id v33 = [ASPasskeyAssertionCredentialExtensionInput alloc];
          v34 = [(ASCAuthorizationPresentationContext *)self->_presentationContext passkeyAssertionOptionsForExternalProvider];
          v35 = [v34 extensions];
          uint64_t v22 = [(ASPasskeyAssertionCredentialExtensionInput *)v33 initWithCoreExtensions:v35];

          uint64_t v23 = [[ASPasskeyCredentialRequest alloc] initWithLoginChoice:v4 assertionExtensionInput:v22];
          id v24 = [[_ASCredentialAuthenticationViewController alloc] initWithExtension:v5 passkeyAssertionRequest:v23];
          goto LABEL_27;
        }
      }
      else
      {
      }
      if (self->_isUserVerificationConfigured)
      {
        uint64_t v22 = [(ASCredentialRequestPaneViewController *)self delegate];
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __87__ASCredentialPickerPaneViewController__userTappedContinueButtonForPasskeyLoginChoice___block_invoke;
        v44[3] = &unk_2643964F0;
        v44[4] = self;
        [(ASPasskeyRegistrationCredentialExtensionInput *)v22 requestPaneViewController:self didRequestCredentialForLoginChoice:v4 authenticatedContext:0 completionHandler:v44];
        goto LABEL_31;
      }
      id v37 = [NSURL URLWithString:@"prefs:root=PASSCODE"];
      id v38 = [MEMORY[0x263F01880] defaultWorkspace];
      uint64_t v49 = *MEMORY[0x263F3F5E8];
      uint64_t v50 = MEMORY[0x263EFFA88];
      uint64_t v39 = NSDictionary;
      dispatch_queue_t v40 = &v50;
      id v41 = &v49;
LABEL_34:
      v42 = [v39 dictionaryWithObjects:v40 forKeys:v41 count:1];
      [v38 openSensitiveURL:v37 withOptions:v42];

      goto LABEL_35;
    }
  }
  else
  {
  }
  v28 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    -[ASCredentialPickerPaneViewController _userTappedContinueButtonForPasskeyLoginChoice:](v28);
  }
LABEL_36:
}

void __87__ASCredentialPickerPaneViewController__userTappedContinueButtonForPasskeyLoginChoice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__ASCredentialPickerPaneViewController__userTappedContinueButtonForPasskeyLoginChoice___block_invoke_2;
  block[3] = &unk_2643954B8;
  void block[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __87__ASCredentialPickerPaneViewController__userTappedContinueButtonForPasskeyLoginChoice___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 requestPaneViewController:*(void *)(a1 + 32) dismissWithCredential:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)_userTappedContinueButtonForPasswordLoginChoice:(id)a3
{
  id v4 = a3;
  if ([v4 isExternal])
  {
    [(ASCredentialPickerPaneViewController *)self _userSelectedExternalPasswordCredential];
  }
  else
  {
    id v5 = [(ASCredentialRequestPaneViewController *)self delegate];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __88__ASCredentialPickerPaneViewController__userTappedContinueButtonForPasswordLoginChoice___block_invoke;
    v6[3] = &unk_2643964F0;
    v6[4] = self;
    [v5 requestPaneViewController:self didRequestCredentialForLoginChoice:v4 authenticatedContext:0 completionHandler:v6];
  }
}

void __88__ASCredentialPickerPaneViewController__userTappedContinueButtonForPasswordLoginChoice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 delegate];
  [v8 requestPaneViewController:*(void *)(a1 + 32) dismissWithCredential:v7 error:v6];
}

- (void)_userTappendContinueButtonForSecurityKeyLoginChoice:(id)a3
{
  unint64_t v4 = [a3 credentialKind];
  if (v4 >= 2)
  {
    if (v4 == 2) {
      id v5 = &__block_literal_global_388;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __92__ASCredentialPickerPaneViewController__userTappendContinueButtonForSecurityKeyLoginChoice___block_invoke_2;
    v7[3] = &unk_2643964F0;
    void v7[4] = self;
    id v5 = (void *)MEMORY[0x21D484070](v7);
  }
  id v6 = [(ASCredentialRequestPaneViewController *)self delegate];
  [v6 requestPaneViewController:self didRequestCredentialForLoginChoice:self->_previouslySelectedLoginChoice authenticatedContext:0 completionHandler:v5];
}

void __92__ASCredentialPickerPaneViewController__userTappendContinueButtonForSecurityKeyLoginChoice___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__ASCredentialPickerPaneViewController__userTappendContinueButtonForSecurityKeyLoginChoice___block_invoke_3;
  block[3] = &unk_2643954B8;
  void block[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __92__ASCredentialPickerPaneViewController__userTappendContinueButtonForSecurityKeyLoginChoice___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 requestPaneViewController:*(void *)(a1 + 32) dismissWithCredential:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)_userTappedContinueButtonForCABLELoginChoice:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCredentialRequestPaneViewController *)self delegate];
  [v5 requestPaneViewController:self didRequestCredentialForLoginChoice:v4 authenticatedContext:0 completionHandler:&__block_literal_global_390];
}

- (void)_userTappedContinueButtonForCredentialProviderExtensionLoginChoice:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08800];
  id v5 = [a3 providerExtensionBundleID];
  id v6 = [v4 extensionWithIdentifier:v5 error:0];

  id v7 = objc_alloc_init(MEMORY[0x263F66268]);
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __107__ASCredentialPickerPaneViewController__userTappedContinueButtonForCredentialProviderExtensionLoginChoice___block_invoke;
  id v14 = &unk_264396790;
  int v15 = self;
  id v8 = v6;
  id v16 = v8;
  uint64_t v9 = (void *)MEMORY[0x21D484070](&v11);
  if ([(ASCAuthorizationPresentationContext *)self->_presentationContext isCABLEAuthenticatorRequest])
  {
    [v7 getPasskeyAssertionRequestParametersForCABLEWithCompletionHandler:v9];
  }
  else
  {
    id v10 = [(ASCAuthorizationPresentationContext *)self->_presentationContext appIdentifier];
    [v7 getPasskeyAssertionRequestParametersForApplicationIdentifier:v10 completionHandler:v9];
  }
}

uint64_t __107__ASCredentialPickerPaneViewController__userTappedContinueButtonForCredentialProviderExtensionLoginChoice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [_ASCredentialListViewController alloc];
  uint64_t v5 = [(_ASCredentialListViewController *)v4 initWithExtension:*(void *)(a1 + 40) serviceIdentifiers:MEMORY[0x263EFFA68] requestParameters:v3];

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 1152);
  *(void *)(v6 + 1152) = v5;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1152), "setDelegate:");
  id v8 = *(void **)(*(void *)(a1 + 32) + 1152);

  return [v8 setDismissOnBackground:1];
}

- (void)authenticationProvider:(id)a3 presentAlert:(id)a4 primaryAction:(id)a5 alternateAction:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(AKASAuthorizationProvider *)self->_authKitAuthorizationProvider loginRowData];
  BOOL v13 = [v12 loginRowAuthenticationType] == 3;

  [(ASCredentialRequestConfirmButtonSubPane *)self->_confirmButtonSubPane showAlertContinuingWithPassword:v13];
  dispatch_time_t v14 = dispatch_time(0, 1100000000);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __106__ASCredentialPickerPaneViewController_authenticationProvider_presentAlert_primaryAction_alternateAction___block_invoke;
  v18[3] = &unk_2643968A0;
  v18[4] = self;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  dispatch_after(v14, MEMORY[0x263EF83A0], v18);
}

uint64_t __106__ASCredentialPickerPaneViewController_authenticationProvider_presentAlert_primaryAction_alternateAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentAlert:*(void *)(a1 + 40) primaryAction:*(void *)(a1 + 48) alternateAction:*(void *)(a1 + 56)];
}

- (void)_presentAlert:(id)a3 primaryAction:(id)a4 alternateAction:(id)a5
{
  CFDictionaryRef v8 = (const __CFDictionary *)a3;
  id v9 = a4;
  id v10 = a5;
  SInt32 error = 0;
  CFUserNotificationRef v11 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, 0, &error, v8);
  if (v11)
  {
    alertQueue = self->_alertQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84__ASCredentialPickerPaneViewController__presentAlert_primaryAction_alternateAction___block_invoke;
    block[3] = &unk_2643968C8;
    CFUserNotificationRef v21 = v11;
    BOOL v13 = &v19;
    id v19 = v9;
    id v20 = v10;
    dispatch_async(alertQueue, block);
  }
  else
  {
    authorizationActivity = self->_authorizationActivity;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __84__ASCredentialPickerPaneViewController__presentAlert_primaryAction_alternateAction___block_invoke_2;
    v15[3] = &unk_2643968F0;
    BOOL v13 = (id *)&v16;
    CFDictionaryRef v16 = v8;
    SInt32 v17 = error;
    os_activity_apply(authorizationActivity, v15);
  }
}

void __84__ASCredentialPickerPaneViewController__presentAlert_primaryAction_alternateAction___block_invoke(uint64_t a1)
{
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 48), 0.0, &responseFlags);
  uint64_t v2 = AKUserNotificationResponseAction();
  if ((unint64_t)(v2 - 1) < 3)
  {
    uint64_t v3 = a1 + 40;
LABEL_5:
    (*(void (**)(void))(*(void *)v3 + 16))();
    goto LABEL_6;
  }
  if (!v2)
  {
    uint64_t v3 = a1 + 32;
    goto LABEL_5;
  }
LABEL_6:
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

void __84__ASCredentialPickerPaneViewController__presentAlert_primaryAction_alternateAction___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __84__ASCredentialPickerPaneViewController__presentAlert_primaryAction_alternateAction___block_invoke_2_cold_1(a1, v2);
  }
}

- (void)authenticationProvider:(id)a3 showViewController:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__ASCredentialPickerPaneViewController_authenticationProvider_showViewController___block_invoke;
  v7[3] = &unk_264395428;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __82__ASCredentialPickerPaneViewController_authenticationProvider_showViewController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  [v2 pushViewController:*(void *)(a1 + 40) animated:1];
}

- (void)authenticationProvider:(id)a3 hideViewController:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__ASCredentialPickerPaneViewController_authenticationProvider_hideViewController___block_invoke;
  v7[3] = &unk_264395428;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __82__ASCredentialPickerPaneViewController_authenticationProvider_hideViewController___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) navigationController];
  id v4 = [v3 topViewController];

  id v5 = *(void **)(a1 + 40);
  if (v2 == v4)
  {
    id v8 = [v5 navigationController];
    id v7 = (id)[v8 popViewControllerAnimated:1];
  }
  else
  {
    id v6 = v5[141];
    os_activity_apply(v6, &__block_literal_global_392);
  }
}

void __82__ASCredentialPickerPaneViewController_authenticationProvider_hideViewController___block_invoke_2()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __82__ASCredentialPickerPaneViewController_authenticationProvider_hideViewController___block_invoke_2_cold_1();
  }
}

- (UIWindow)presentationAnchor
{
  id v2 = [(ASCredentialPickerPaneViewController *)self view];
  uint64_t v3 = [v2 window];

  return (UIWindow *)v3;
}

- (void)_keychainSyncStatusMayHaveChanged:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F662C8], "sharedMonitor", a3);
  int v5 = [v4 isKeychainSyncEnabled];

  if (self->_isKeychainSyncEnabled != v5)
  {
    self->_isKeychainSyncEnabled = v5;
    BOOL v6 = self->_shouldAutoFillFromICloudKeychain
      || [(ASCAuthorizationPresentationContext *)self->_presentationContext externalPasskeyLoginChoiceCount] != 0;
    char v7 = [(ASCAuthorizationPresentationContext *)self->_presentationContext requestTypes];
    BOOL v8 = 0;
    if ((v7 & 1) == 0 && !v6) {
      BOOL v8 = !self->_shouldExpandOtherLoginChoices && self->_isKeychainSyncEnabled;
    }
    self->_shouldShowEnableCredentialProviderPrompt = v8;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__ASCredentialPickerPaneViewController__keychainSyncStatusMayHaveChanged___block_invoke;
    block[3] = &unk_264395388;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __74__ASCredentialPickerPaneViewController__keychainSyncStatusMayHaveChanged___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 requestPaneViewControllerNeedsReload:*(void *)(a1 + 32)];
}

- (BOOL)_isUserVerificationConfigured
{
  id v3 = objc_alloc_init(MEMORY[0x263F10468]);
  id v11 = 0;
  char v4 = [v3 canEvaluatePolicy:2 error:&v11];
  id v5 = v11;
  BOOL v6 = v5;
  if ((v4 & 1) == 0)
  {
    authorizationActivity = self->_authorizationActivity;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __69__ASCredentialPickerPaneViewController__isUserVerificationConfigured__block_invoke;
    v9[3] = &unk_264395388;
    id v10 = v5;
    os_activity_apply(authorizationActivity, v9);
  }
  return v4;
}

void __69__ASCredentialPickerPaneViewController__isUserVerificationConfigured__block_invoke(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __69__ASCredentialPickerPaneViewController__isUserVerificationConfigured__block_invoke_cold_1(a1, v2);
  }
}

- (void)_dismiss
{
  id v4 = [(ASCredentialRequestPaneViewController *)self delegate];
  id v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F29388] code:2 userInfo:0];
  [v4 requestPaneViewController:self dismissWithCredential:0 error:v3];
}

- (void)_dumpConfiguration
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_394);
  authorizationActivity = self->_authorizationActivity;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_395;
  block[3] = &unk_264395388;
  void block[4] = self;
  os_activity_apply(authorizationActivity, block);
  id v4 = self->_authorizationActivity;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_402;
  v32[3] = &unk_264395388;
  v32[4] = self;
  os_activity_apply(v4, v32);
  id v5 = self->_authorizationActivity;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_403;
  v31[3] = &unk_264395388;
  v31[4] = self;
  os_activity_apply(v5, v31);
  BOOL v6 = self->_authorizationActivity;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_410;
  v30[3] = &unk_264395388;
  v30[4] = self;
  os_activity_apply(v6, v30);
  char v7 = [MEMORY[0x263F66568] sharedManager];
  BOOL v8 = [v7 getEnabledExtensionsSynchronously];

  if ([v8 count])
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_413);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          id v15 = self->_authorizationActivity;
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v25[2] = __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_414;
          v25[3] = &unk_264395388;
          v25[4] = v14;
          os_activity_apply(v15, v25);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v11);
    }
  }
  id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v17 = [(ASCAuthorizationPresentationContext *)self->_presentationContext requestTypes];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = 1;
    while (1)
    {
      do
      {
        while ((v19 & v18) == 0)
          v19 *= 2;
      }
      while (!v19);
      if (v19 <= 31)
      {
        switch(v19)
        {
          case 1:
            id v20 = @"Password";
            goto LABEL_31;
          case 2:
            id v20 = @"Apple ID";
            goto LABEL_31;
          case 3:
          case 5:
          case 6:
          case 7:
            goto LABEL_32;
          case 4:
            id v20 = @"Passkey Registration";
            goto LABEL_31;
          case 8:
            id v20 = @"Passkey Assertion";
            goto LABEL_31;
          default:
            if (v19 != 16) {
              goto LABEL_32;
            }
            id v20 = @"Security Key Registration";
            break;
        }
        goto LABEL_31;
      }
      if (v19 > 127)
      {
        if (v19 != 128 && v19 != 256) {
          goto LABEL_32;
        }
        id v20 = @"Other Accounts";
        goto LABEL_31;
      }
      if (v19 == 32) {
        break;
      }
      if (v19 == 64)
      {
        id v20 = @"caBLE";
LABEL_31:
        [v16 addObject:v20];
      }
LABEL_32:
      v18 &= ~v19;
      v19 *= 2;
      if (!v18) {
        goto LABEL_33;
      }
    }
    id v20 = @"Security Key Assertion";
    goto LABEL_31;
  }
LABEL_33:
  CFUserNotificationRef v21 = self->_authorizationActivity;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_440;
  v23[3] = &unk_264395388;
  id v24 = v16;
  id v22 = v16;
  os_activity_apply(v21, v23);
}

void __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21918F000, v0, OS_LOG_TYPE_DEFAULT, "ASCredentialPickerPaneViewController configuration:", v1, 2u);
  }
}

void __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_395(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    int v5 = [v3 _isUserVerificationConfigured];
    BOOL v6 = @"off";
    if (v5) {
      BOOL v6 = @"on";
    }
    int v7 = 138543362;
    BOOL v8 = v6;
    _os_log_impl(&dword_21918F000, v4, OS_LOG_TYPE_DEFAULT, "\tUser verification: %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

void __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_402(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 1177)) {
      id v3 = @"on";
    }
    else {
      id v3 = @"off";
    }
    int v4 = 138543362;
    int v5 = v3;
    _os_log_impl(&dword_21918F000, v2, OS_LOG_TYPE_DEFAULT, "\tKeychain sync: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_403(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 1178)) {
      id v3 = @"no";
    }
    else {
      id v3 = @"yes";
    }
    int v4 = 138543362;
    int v5 = v3;
    _os_log_impl(&dword_21918F000, v2, OS_LOG_TYPE_DEFAULT, "\tKeychain sync restricted by configuration profile: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_410(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 1218)) {
      id v3 = @"on";
    }
    else {
      id v3 = @"off";
    }
    int v4 = 138543362;
    int v5 = v3;
    _os_log_impl(&dword_21918F000, v2, OS_LOG_TYPE_DEFAULT, "\tiCloud Keychain AutoFill: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_411()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21918F000, v0, OS_LOG_TYPE_DEFAULT, "\tEnabled credential provider extensions:", v1, 2u);
  }
}

void __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_414(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    int v4 = v2;
    int v5 = [v3 _localizedName];
    int v6 = 138543362;
    int v7 = v5;
    _os_log_impl(&dword_21918F000, v4, OS_LOG_TYPE_DEFAULT, "\t\t%{public}@", (uint8_t *)&v6, 0xCu);
  }
}

void __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_440(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    int v4 = v2;
    int v5 = [v3 componentsJoinedByString:@" | "];
    int v6 = 138543362;
    int v7 = v5;
    _os_log_impl(&dword_21918F000, v4, OS_LOG_TYPE_DEFAULT, "\tRequest types: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleSubPane, 0);
  objc_storeStrong((id *)&self->_infoLabelPane, 0);
  objc_storeStrong((id *)&self->_externalPasswordCredentialForSelectedLoginChoice, 0);
  objc_storeStrong((id *)&self->_credentialProviderViewController, 0);
  objc_storeStrong((id *)&self->_credentialListViewController, 0);
  objc_storeStrong((id *)&self->_alertQueue, 0);
  objc_storeStrong((id *)&self->_authKitAuthorizationProvider, 0);
  objc_storeStrong((id *)&self->_authorizationActivity, 0);
  objc_storeStrong((id *)&self->_otherLoginChoices, 0);
  objc_storeStrong((id *)&self->_tableViewLoginChoices, 0);
  objc_storeStrong((id *)&self->_previouslySelectedLoginChoice, 0);
  objc_storeStrong((id *)&self->_confirmButtonSubPane, 0);
  objc_storeStrong((id *)&self->_imageSubPane, 0);

  objc_storeStrong((id *)&self->_presentationContext, 0);
}

void __80__ASCredentialPickerPaneViewController_performConditionalRegistrationIfPossible__block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_1_1();
  id v3 = (objc_class *)objc_opt_class();
  int v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v5, v6, "Tried to perform conditional registration with unexpected login choice: %{public}@", v7, v8, v9, v10, v11);
}

void __80__ASCredentialPickerPaneViewController_performConditionalRegistrationIfPossible__block_invoke_50_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __67__ASCredentialPickerPaneViewController__useSecurityKeyButtonTapped__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21918F000, v0, v1, "Use Security Key button tapped but no security key login choice is available. Failing request.", v2, v3, v4, v5, v6);
}

void __61__ASCredentialPickerPaneViewController__useCABLEButtonTapped__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21918F000, v0, v1, "Use caBLE button tapped but no caBLE login choice is available. Failing request.", v2, v3, v4, v5, v6);
}

void __52__ASCredentialPickerPaneViewController__serviceName__block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v4, v5, "Failed to get application name with error: %{public}@", v6, v7, v8, v9, v10);
}

void __104__ASCredentialPickerPaneViewController__performAuthorizationWithAuthenticatedContext_completionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21918F000, v0, v1, "authenticated for external password login choice but no credential is available", v2, v3, v4, v5, v6);
}

void __79__ASCredentialPickerPaneViewController__userSelectedExternalPasswordCredential__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21918F000, v0, v1, "No credential provider extension available", v2, v3, v4, v5, v6);
}

void __120__ASCredentialPickerPaneViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_336_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v4, v5, "Did not receive any external password credential because of error: %@", v6, v7, v8, v9, v10);
}

- (void)_completePasskeyAssertionWithCredential:error:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21918F000, v0, v1, "Returned credential failed validation: %{public}@", v2, v3, v4, v5, v6);
}

void __70__ASCredentialPickerPaneViewController_performPasswordAuthentication___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21918F000, v0, v1, "Password authentication button pressed but selected login choice is not a Sign in with Apple login choice", v2, v3, v4, v5, v6);
}

void __64__ASCredentialPickerPaneViewController_userTappedContinueButton__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v4, v5, "Failed to open credential provider settings with error: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_userTappedContinueButtonForPasskeyLoginChoice:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_1_1() externalCredentialProviderBundleID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v4, v5, "Extension for bundle %{public}@ not found", v6, v7, v8, v9, v10);
}

void __84__ASCredentialPickerPaneViewController__presentAlert_primaryAction_alternateAction___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *MEMORY[0x263EFFFC8];
  uint64_t v4 = a2;
  uint64_t v5 = [v2 objectForKeyedSubscript:v3];
  OUTLINED_FUNCTION_1_0();
  __int16 v8 = 1024;
  int v9 = v6;
  _os_log_error_impl(&dword_21918F000, v4, OS_LOG_TYPE_ERROR, "Showing alert (%@) failed, user notification is nil!. Error: %d", v7, 0x12u);
}

void __82__ASCredentialPickerPaneViewController_authenticationProvider_hideViewController___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21918F000, v0, v1, "Authentication provider tried to pop view controller but it was not the top view controller in the navigation stack", v2, v3, v4, v5, v6);
}

void __69__ASCredentialPickerPaneViewController__isUserVerificationConfigured__block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v4, v5, "User verification is not configured: %{public}@", v6, v7, v8, v9, v10);
}

@end