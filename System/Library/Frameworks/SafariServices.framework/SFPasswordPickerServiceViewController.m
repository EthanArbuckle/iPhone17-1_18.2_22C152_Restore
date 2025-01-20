@interface SFPasswordPickerServiceViewController
+ (BOOL)_shouldRestoreStateForSystemAutoFillForAppID:(id)a3;
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
+ (void)_rememberStateForSystemAutoFillWithSearchQuery:(id)a3 savedAccount:(id)a4;
+ (void)_restoreStateForSystemAutoFillToAccountPickerConfiguration:(id)a3;
- (BOOL)_isClientEntitledToDirectlyReceiveCredentials;
- (BOOL)_isConfiguredForSystemAutoFill;
- (BOOL)contextRequiresSessionBasedAuthentication:(id)a3;
- (BOOL)contextShouldAllowMultipleBiometricFailures:(id)a3;
- (BOOL)contextShouldAllowPasscodeFallback:(id)a3;
- (BOOL)displayMessageAsTitleForContext:(id)a3;
- (SFPasswordPickerServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_actionForPresentingPasswordManagerExtension:(id)a3;
- (id)_context;
- (id)authenticationCustomUIProgressObserverForContext:(id)a3;
- (id)authenticationMessageForContext:(id)a3;
- (id)passcodePromptForContext:(id)a3;
- (void)_authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext:(id)a3 completionHandler:(id)a4;
- (void)_authenticateToViewOtherPasswordsWithCompletion:(id)a3;
- (void)_dismiss;
- (void)_fillCredential:(id)a3 needsAuthentication:(BOOL)a4;
- (void)_presentCredentialListForExtension:(id)a3;
- (void)_sendCredentialToClient:(id)a3 needsAuthentication:(BOOL)a4;
- (void)_sendCredentialToClientAndDismiss:(id)a3;
- (void)accountPickerViewController:(id)a3 fillPasswordForSavedAccount:(id)a4;
- (void)accountPickerViewController:(id)a3 fillUsernameForSavedAccount:(id)a4;
- (void)accountPickerViewController:(id)a3 fillVerificationCode:(id)a4;
- (void)accountPickerViewController:(id)a3 fillVerificationCodeForSavedAccount:(id)a4;
- (void)authenticateToPresentInPopover:(BOOL)a3 savedAccountContext:(id)a4 completion:(id)a5;
- (void)credentialAuthenticationViewController:(id)a3 didFinishWithCredential:(id)a4 error:(id)a5 completion:(id)a6;
- (void)credentialAuthenticationViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 error:(id)a5 completion:(id)a6;
- (void)credentialListViewController:(id)a3 didFinishWithCredential:(id)a4 completion:(id)a5;
- (void)credentialListViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 completion:(id)a5;
- (void)credentialListViewController:(id)a3 didFinishWithText:(id)a4 completion:(id)a5;
- (void)presentUIForPasswordCredentialAuthenticationViewController:(id)a3;
- (void)setAuthenticationGracePeriod:(double)a3;
- (void)setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:(id)a3;
- (void)setPageID:(id)a3 frameID:(id)a4 credentialType:(id)a5;
- (void)setRemoteAppID:(id)a3;
- (void)setRemoteLocalizedAppName:(id)a3;
- (void)setRemoteUnlocalizedAppName:(id)a3;
- (void)setSystemAutoFillDocumentTraits:(id)a3;
- (void)setWebViewURL:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SFPasswordPickerServiceViewController

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFBEF158];
}

- (id)authenticationCustomUIProgressObserverForContext:(id)a3
{
  return 0;
}

- (id)authenticationMessageForContext:(id)a3
{
  v3 = +[SFAutoFillAuthenticationUtilities customAuthenticationTitleForFillingSavedPassword];

  return v3;
}

- (id)passcodePromptForContext:(id)a3
{
  v3 = +[SFAutoFillAuthenticationUtilities passcodePromptForFillingSavedAccount];

  return v3;
}

- (BOOL)displayMessageAsTitleForContext:(id)a3
{
  return 1;
}

- (BOOL)contextRequiresSessionBasedAuthentication:(id)a3
{
  return 0;
}

- (BOOL)contextShouldAllowPasscodeFallback:(id)a3
{
  return 0;
}

- (BOOL)contextShouldAllowMultipleBiometricFailures:(id)a3
{
  return 0;
}

- (id)_context
{
  context = self->_context;
  if (!context)
  {
    v4 = objc_alloc_init(_SFAuthenticationContext);
    v5 = self->_context;
    self->_context = v4;

    [(_SFAuthenticationContext *)self->_context setDelegate:self];
    context = self->_context;
  }
  v6 = context;

  return v6;
}

+ (id)_exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC44728];
}

- (SFPasswordPickerServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)SFPasswordPickerServiceViewController;
  v4 = [(SFPasswordPickerServiceViewController *)&v16 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    objc_initWeak(&location, v4);
    v5 = [MEMORY[0x1E4F98230] sharedManager];
    [v5 addObserver:v4];

    v6 = (WBSAuthenticationServicesAgentProxy *)objc_alloc_init(MEMORY[0x1E4F98968]);
    authenticationServicesAgentProxy = v4->_authenticationServicesAgentProxy;
    v4->_authenticationServicesAgentProxy = v6;

    v8 = (void *)MEMORY[0x1E4F18B10];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__SFPasswordPickerServiceViewController_initWithNibName_bundle___block_invoke;
    v13[3] = &unk_1E5C731C0;
    objc_copyWeak(&v14, &location);
    uint64_t v9 = [v8 callObserverWithBlock:v13];
    callObserver = v4->_callObserver;
    v4->_callObserver = (_ASIncomingCallObserver *)v9;

    v11 = v4;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v4;
}

void __64__SFPasswordPickerServiceViewController_initWithNibName_bundle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismiss];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x1E4F98230] sharedManager];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)SFPasswordPickerServiceViewController;
  [(SFPasswordPickerServiceViewController *)&v6 viewWillDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SFPasswordPickerServiceViewController;
  [(SFPasswordPickerServiceViewController *)&v9 viewDidAppear:a3];
  v4 = [(SFPasswordPickerServiceViewController *)self view];
  v5 = [v4 window];
  objc_super v6 = [v5 _rootSheetPresentationController];
  [v6 _setShouldScaleDownBehindDescendantSheets:0];

  presentCredentialsHandler = (void (**)(void))self->_presentCredentialsHandler;
  if (presentCredentialsHandler)
  {
    presentCredentialsHandler[2]();
    id v8 = self->_presentCredentialsHandler;
    self->_presentCredentialsHandler = 0;
  }
}

- (void)_dismiss
{
  self->_hasAuthenticationForOtherPasswords = 0;
  id v2 = [(SFPasswordPickerServiceViewController *)self _remoteViewControllerProxy];
  [v2 willDismissServiceViewController];
}

- (void)_authenticateToViewOtherPasswordsWithCompletion:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(void))a3;
  v5 = v4;
  if (self->_hasAuthenticationForOtherPasswords)
  {
    ((void (*)(void (**)(void), uint64_t, void))v4[2])(v4, 1, 0);
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F30B50]);
    long long v20 = 0u;
    long long v21 = 0u;
    [(SFPasswordPickerServiceViewController *)self _hostAuditToken];
    long long v18 = 0u;
    long long v19 = 0u;
    if (WBSAuditTokenHasEntitlement()) {
      [v6 setTouchIDAuthenticationAllowableReuseDuration:self->_authenticationGracePeriod];
    }
    uint64_t v7 = WBSAuthenticationPolicyForPasswordManager();
    id v17 = 0;
    char v8 = [v6 canEvaluatePolicy:v7 error:&v17];
    id v9 = v17;
    v10 = v9;
    if (v8)
    {
      v22[0] = &unk_1EFBDEC20;
      v11 = +[SFAutoFillAuthenticationUtilities passcodePromptForViewingSavedAccounts];
      v22[1] = &unk_1EFBDEC38;
      v23[0] = v11;
      v12 = +[SFAutoFillAuthenticationUtilities customAuthenticationTitleForViewingSavedAccounts];
      v23[1] = v12;
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __89__SFPasswordPickerServiceViewController__authenticateToViewOtherPasswordsWithCompletion___block_invoke;
      v14[3] = &unk_1E5C74B70;
      v14[4] = self;
      objc_super v16 = v5;
      id v15 = v6;
      [v15 evaluatePolicy:v7 options:v13 reply:v14];
    }
    else
    {
      self->_hasAuthenticationForOtherPasswords = [v9 code] == -5;
      v5[2](v5);
    }
  }
}

void __89__SFPasswordPickerServiceViewController__authenticateToViewOtherPasswordsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 1017) = v4 == 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__SFPasswordPickerServiceViewController__authenticateToViewOtherPasswordsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E5C74B48;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v5;
  id v11 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __89__SFPasswordPickerServiceViewController__authenticateToViewOtherPasswordsWithCompletion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = (id)WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __89__SFPasswordPickerServiceViewController__authenticateToViewOtherPasswordsWithCompletion___block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 40) _dismiss];
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v4();
  }
}

- (id)_actionForPresentingPasswordManagerExtension:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [MEMORY[0x1E4F98230] sharedManager];
  id v6 = [v5 displayNameForExtension:v4];

  uint64_t v7 = NSString;
  id v8 = _WBSLocalizedString();
  uint64_t v9 = objc_msgSend(v7, "stringWithFormat:", v8, v6);

  id v10 = (void *)MEMORY[0x1E4FB1410];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__SFPasswordPickerServiceViewController__actionForPresentingPasswordManagerExtension___block_invoke;
  v14[3] = &unk_1E5C74B98;
  objc_copyWeak(&v16, &location);
  id v11 = v4;
  id v15 = v11;
  v12 = [v10 _actionWithTitle:v9 image:0 style:0 handler:v14 shouldDismissHandler:&__block_literal_global_24];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v12;
}

void __86__SFPasswordPickerServiceViewController__actionForPresentingPasswordManagerExtension___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _presentCredentialListForExtension:*(void *)(a1 + 32)];
}

uint64_t __86__SFPasswordPickerServiceViewController__actionForPresentingPasswordManagerExtension___block_invoke_2()
{
  return 1;
}

- (void)_presentCredentialListForExtension:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __76__SFPasswordPickerServiceViewController__presentCredentialListForExtension___block_invoke;
  v25[3] = &unk_1E5C74C08;
  v25[4] = self;
  id v5 = v4;
  id v26 = v5;
  id v6 = (void (**)(void, void, void))MEMORY[0x1AD0C36A0](v25);
  long long v23 = 0u;
  long long v24 = 0u;
  [(SFPasswordPickerServiceViewController *)self _hostAuditToken];
  long long v21 = 0u;
  long long v22 = 0u;
  int HasEntitlement = WBSAuditTokenHasEntitlement();
  char v8 = HasEntitlement;
  if (HasEntitlement && (remoteAppID = self->_remoteAppID) != 0)
  {
    id v10 = remoteAppID;
  }
  else
  {
    id v10 = [(SFPasswordServiceViewController *)self applicationIdentifier];
  }
  id v11 = v10;
  if (self->_webViewURL)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F18AB0]);
    v13 = [(NSURL *)self->_webViewURL absoluteString];
    id v14 = (void *)[v12 initWithIdentifier:v13 type:1];
    v27[0] = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    ((void (**)(void, void *, NSString *))v6)[2](v6, v15, v11);
  }
  else
  {
    id v16 = (void *)MEMORY[0x1E4F98250];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __76__SFPasswordPickerServiceViewController__presentCredentialListForExtension___block_invoke_4;
    v17[3] = &unk_1E5C74C58;
    char v20 = v8;
    v17[4] = self;
    long long v19 = v6;
    long long v18 = v11;
    [v16 bestDomainForAppID:v18 completionHandler:v17];
  }
}

void __76__SFPasswordPickerServiceViewController__presentCredentialListForExtension___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__SFPasswordPickerServiceViewController__presentCredentialListForExtension___block_invoke_2;
  v10[3] = &unk_1E5C74BE0;
  id v6 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v6;
  id v7 = v5;
  id v12 = v7;
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x1AD0C36A0](v10);
  [*(id *)(*(void *)(a1 + 32) + 1000) getPasskeyAssertionRequestParametersForApplicationIdentifier:v8 completionHandler:v9];
}

void __76__SFPasswordPickerServiceViewController__presentCredentialListForExtension___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1[4] + 1112) isExplicitAutoFillMode]) {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F18B08]) initForTextSelectingWithExtension:a1[5] serviceIdentifiers:a1[6]];
  }
  else {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F18B08]) initWithExtension:a1[5] serviceIdentifiers:a1[6] requestParameters:v3];
  }
  id v5 = v4;
  [v4 setDelegate:a1[4]];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__SFPasswordPickerServiceViewController__presentCredentialListForExtension___block_invoke_3;
  v7[3] = &unk_1E5C72628;
  void v7[4] = a1[4];
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __76__SFPasswordPickerServiceViewController__presentCredentialListForExtension___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

void __76__SFPasswordPickerServiceViewController__presentCredentialListForExtension___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__SFPasswordPickerServiceViewController__presentCredentialListForExtension___block_invoke_5;
  block[3] = &unk_1E5C74C30;
  char v11 = *(unsigned char *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v10 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __76__SFPasswordPickerServiceViewController__presentCredentialListForExtension___block_invoke_5(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = *(id *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)(a1 + 56);
LABEL_3:
    v1 = (void *)[objc_alloc(MEMORY[0x1E4F18AB0]) initWithIdentifier:v4 type:0];
    v11[0] = v1;
    int v6 = 1;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    goto LABEL_10;
  }
  if (*(unsigned char *)(a1 + 64) && (v8 = *(void *)(a1 + 40), (uint64_t v9 = *(void *)(v8 + 1064)) != 0))
  {
    uint64_t v10 = [MEMORY[0x1E4F98250] bestDomainForAutoFillFromDomains:v9 appID:*(void *)(v8 + 1040)];
    uint64_t v5 = *(void *)(a1 + 56);
    if (v10)
    {
      uint64_t v4 = (void *)v10;
      goto LABEL_3;
    }
    int v6 = 0;
    uint64_t v4 = 0;
  }
  else
  {
    int v6 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)(a1 + 56);
  }
  id v7 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_10:
  (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v7, *(void *)(a1 + 48));
  if (v6)
  {
  }
}

- (void)authenticateToPresentInPopover:(BOOL)a3 savedAccountContext:(id)a4 completion:(id)a5
{
  self->_presentInPopover = a3;
  [(SFPasswordPickerServiceViewController *)self _authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext:a4 completionHandler:a5];
}

- (void)_fillCredential:(id)a3 needsAuthentication:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 isExternal])
  {
    id v7 = [v6 externalCredential];
    objc_storeStrong((id *)&self->_credentialIdentityToFill, v7);
    uint64_t v8 = [v7 owningExtensionState];
    uint64_t v9 = [v8 providerBundleID];

    uint64_t v10 = [MEMORY[0x1E4F98230] sharedManager];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __77__SFPasswordPickerServiceViewController__fillCredential_needsAuthentication___block_invoke;
    v16[3] = &unk_1E5C74CA8;
    id v11 = v7;
    id v17 = v11;
    long long v18 = self;
    [v10 getExtensionWithBundleID:v9 completion:v16];
  }
  else
  {
    [(SFPasswordPickerServiceViewController *)self _sendCredentialToClient:v6 needsAuthentication:v4];
    authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
    v13 = [v6 user];
    id v14 = [v6 site];
    id v15 = [(SFPasswordServiceViewController *)self applicationIdentifier];
    [(WBSAuthenticationServicesAgentProxy *)authenticationServicesAgentProxy didFillCredentialForUsername:v13 forHost:v14 fromProviderWithBundleIdentifier:*MEMORY[0x1E4F99368] inAppWithBundleIdentifier:v15];
  }
}

void __77__SFPasswordPickerServiceViewController__fillCredential_needsAuthentication___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) type];
  if (v4 == 1)
  {
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F18AD0]) initWithFoundationCredentialIdentity:*(void *)(a1 + 32)];
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F18B00]) initWithExtension:v3 credentialIdentity:v5];
    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = *(void **)(v13 + 984);
    *(void *)(v13 + 984) = v12;

    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 984), "setDelegate:");
    goto LABEL_5;
  }
  if (v4 == 2)
  {
    id v5 = *(id *)(a1 + 32);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __77__SFPasswordPickerServiceViewController__fillCredential_needsAuthentication___block_invoke_2;
    long long v18 = &unk_1E5C74C80;
    uint64_t v19 = *(void *)(a1 + 40);
    id v20 = v3;
    id v6 = (void *)MEMORY[0x1AD0C36A0](&v15);
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = (void *)v7[125];
    uint64_t v9 = objc_msgSend(v7, "applicationIdentifier", v15, v16, v17, v18, v19);
    uint64_t v10 = [v5 serviceIdentifier];
    id v11 = [v5 credentialID];
    [v8 getExternalPasskeyRequestForApplicationIdentifier:v9 relyingPartyIdentifier:v10 credentialID:v11 completionHandler:v6];

LABEL_5:
  }
}

void __77__SFPasswordPickerServiceViewController__fillCredential_needsAuthentication___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F18B00]) initWithExtension:*(void *)(a1 + 40) passkeyAssertionRequest:v6];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 984);
    *(void *)(v4 + 984) = v3;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 984), "setDelegate:");
  }
  else
  {
    [*(id *)(a1 + 32) _dismiss];
  }
}

- (void)_sendCredentialToClient:(id)a3 needsAuthentication:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__SFPasswordPickerServiceViewController__sendCredentialToClient_needsAuthentication___block_invoke;
  v13[3] = &unk_1E5C72628;
  id v7 = v6;
  id v14 = v7;
  uint64_t v15 = self;
  uint64_t v8 = MEMORY[0x1AD0C36A0](v13);
  uint64_t v9 = (void *)v8;
  if (v4)
  {
    uint64_t v10 = [(SFPasswordPickerServiceViewController *)self _context];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __85__SFPasswordPickerServiceViewController__sendCredentialToClient_needsAuthentication___block_invoke_124;
    v11[3] = &unk_1E5C74CD0;
    v11[4] = self;
    id v12 = v9;
    [v10 authenticateForClient:self userInitiated:1 completion:v11];
  }
  else
  {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
  }
}

uint64_t __85__SFPasswordPickerServiceViewController__sendCredentialToClient_needsAuthentication___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = (id)WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) user];
    if ([v3 length]) {
      BOOL v4 = @"YES";
    }
    else {
      BOOL v4 = @"NO";
    }
    id v5 = v4;
    id v6 = [*(id *)(a1 + 32) password];
    if ([v6 length]) {
      id v7 = @"YES";
    }
    else {
      id v7 = @"NO";
    }
    uint64_t v8 = v7;
    uint64_t v9 = [*(id *)(a1 + 32) site];
    if ([v9 length]) {
      uint64_t v10 = @"YES";
    }
    else {
      uint64_t v10 = @"NO";
    }
    int v14 = 138543874;
    uint64_t v15 = v5;
    __int16 v16 = 2114;
    id v17 = v8;
    __int16 v18 = 2114;
    uint64_t v19 = v10;
    id v11 = v10;
    _os_log_impl(&dword_1A690B000, v2, OS_LOG_TYPE_DEFAULT, "Sending credential with non-empty username: %{public}@, non-empty password: %{public}@, non-empty site: %{public}@", (uint8_t *)&v14, 0x20u);
  }
  id v12 = (id)WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    [*(id *)(a1 + 32) user];
    objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) site];
    objc_claimAutoreleasedReturnValue();
    __85__SFPasswordPickerServiceViewController__sendCredentialToClient_needsAuthentication___block_invoke_cold_1();
  }

  return [*(id *)(a1 + 40) _sendCredentialToClientAndDismiss:*(void *)(a1 + 32)];
}

void __85__SFPasswordPickerServiceViewController__sendCredentialToClient_needsAuthentication___block_invoke_124(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXAutoFillAuthentication();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1A690B000, v6, OS_LOG_TYPE_DEFAULT, "Successfully authenticated App AutoFill", v8, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = (id)WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __85__SFPasswordPickerServiceViewController__sendCredentialToClient_needsAuthentication___block_invoke_124_cold_1();
    }

    [*(id *)(a1 + 32) _dismiss];
  }
}

- (void)_authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  objc_initWeak(location, self);
  uint64_t v8 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SFPasswordPickerServiceViewController _authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext:completionHandler:].cold.4((uint64_t)self, v8);
  }
  uint64_t v9 = [(SFPasswordPickerServiceViewController *)self presentedViewController];

  if (v9)
  {
    v7[2](v7, 1);
    goto LABEL_27;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  id v29 = v6;
  [(SFPasswordPickerServiceViewController *)self _hostAuditToken];
  long long v41 = 0u;
  long long v42 = 0u;
  int HasEntitlement = WBSAuditTokenHasEntitlement();
  id v11 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[SFPasswordPickerServiceViewController _authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext:completionHandler:]();
    if (!HasEntitlement) {
      goto LABEL_10;
    }
  }
  else if (!HasEntitlement)
  {
    goto LABEL_10;
  }
  remoteAppID = self->_remoteAppID;
  if (remoteAppID)
  {
    uint64_t v13 = remoteAppID;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v13 = [(SFPasswordServiceViewController *)self applicationIdentifier];
LABEL_11:
  int v14 = v13;
  v28 = v13;
  uint64_t v15 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[SFPasswordPickerServiceViewController _authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext:completionHandler:]();
  }
  BOOL v16 = [(SFPasswordPickerServiceViewController *)self _isConfiguredForSystemAutoFill];
  id v17 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    if (v16) {
      goto LABEL_15;
    }
LABEL_19:
    char v18 = 0;
    goto LABEL_20;
  }
  -[SFPasswordPickerServiceViewController _authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext:completionHandler:]();
  if (!v16) {
    goto LABEL_19;
  }
LABEL_15:
  if ([(RTIDocumentTraits *)self->_systemAutoFillDocumentTraits autofillMode] == 1) {
    char v18 = [(RTIDocumentTraits *)self->_systemAutoFillDocumentTraits isExplicitAutoFillMode];
  }
  else {
    char v18 = 1;
  }
LABEL_20:
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke;
  v33[3] = &unk_1E5C74E98;
  v33[4] = self;
  char v38 = HasEntitlement;
  uint64_t v19 = v14;
  v34 = v19;
  BOOL v39 = v16;
  id v35 = v6;
  char v40 = v18;
  objc_copyWeak(&v37, location);
  v36 = v7;
  uint64_t v20 = (void *)MEMORY[0x1AD0C36A0](v33);
  if (HasEntitlement) {
    long long v21 = self->_externallyVerifiedAssociatedDomains;
  }
  else {
    long long v21 = 0;
  }
  long long v22 = (void *)MEMORY[0x1E4F98250];
  if (v19) {
    long long v23 = v19;
  }
  else {
    long long v23 = &stru_1EFB97EB8;
  }
  webFrameIdentifier = self->_webFrameIdentifier;
  webViewURL = self->_webViewURL;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_3_247;
  v30[3] = &unk_1E5C73FE0;
  id v26 = v19;
  v31 = v26;
  id v32 = v20;
  id v27 = v20;
  [v22 getCredentialsForAppWithAppID:v23 frameIdentifier:webFrameIdentifier externallyVerifiedAndApprovedSharedWebCredentialDomains:v21 websiteURL:webViewURL completionHandler:v30];

  objc_destroyWeak(&v37);
  id v6 = v29;
LABEL_27:
  objc_destroyWeak(location);
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v129[0] = MEMORY[0x1E4F143A8];
  v129[1] = 3221225472;
  v129[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2;
  v129[3] = &unk_1E5C74D68;
  v129[4] = *(void *)(a1 + 32);
  id v96 = v5;
  id v130 = v96;
  char v134 = *(unsigned char *)(a1 + 72);
  id v131 = *(id *)(a1 + 40);
  char v135 = *(unsigned char *)(a1 + 73);
  id v94 = v6;
  id v132 = v94;
  uint64_t v101 = a1;
  id v133 = *(id *)(a1 + 48);
  v95 = (void *)MEMORY[0x1AD0C36A0](v129);
  id v7 = [MEMORY[0x1E4F98208] sharedFeatureManager];
  unsigned int v97 = [v7 shouldAutoFillPasswordsFromKeychain];

  uint64_t v8 = [MEMORY[0x1E4F98230] sharedManager];
  v98 = [v8 enabledExtensions];

  if ([v98 count]) {
    char v9 = v97;
  }
  else {
    char v9 = 0;
  }
  BOOL v10 = (v9 & 1) == 0 && (unint64_t)[v98 count] < 2;
  if (*(unsigned char *)(a1 + 74))
  {
    id v11 = objc_msgSend(v98, "safari_filterObjectsUsingBlock:", &__block_literal_global_177_0);
    uint64_t v12 = [v11 count];

    BOOL v13 = v12 != 0;
    BOOL v10 = v12 + v97 == 1;
  }
  else
  {
    BOOL v13 = 0;
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 1016))
  {
    if ([v98 count]) {
      char v14 = v10;
    }
    else {
      char v14 = 1;
    }
    if (v14)
    {
LABEL_16:
      if (*(unsigned char *)(a1 + 74))
      {
        if (v13)
        {
          v126[0] = MEMORY[0x1E4F143A8];
          v126[1] = 3221225472;
          v126[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_178;
          v126[3] = &unk_1E5C74DB0;
          objc_copyWeak(&v128, (id *)(a1 + 64));
          id v127 = v98;
          uint64_t v15 = MEMORY[0x1AD0C36A0](v126);
          uint64_t v16 = *(void *)(a1 + 32);
          id v17 = *(void **)(v16 + 1096);
          *(void *)(v16 + 1096) = v15;

          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          objc_destroyWeak(&v128);
          goto LABEL_77;
        }
      }
      else if ([v98 count])
      {
        v123[0] = MEMORY[0x1E4F143A8];
        v123[1] = 3221225472;
        v123[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_3;
        v123[3] = &unk_1E5C74DB0;
        objc_copyWeak(&v125, (id *)(a1 + 64));
        id v124 = v98;
        uint64_t v21 = MEMORY[0x1AD0C36A0](v123);
        uint64_t v22 = *(void *)(a1 + 32);
        long long v23 = *(void **)(v22 + 1096);
        *(void *)(v22 + 1096) = v21;

        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        objc_destroyWeak(&v125);
        goto LABEL_77;
      }
      uint64_t v25 = MEMORY[0x1AD0C36A0](v95);
      uint64_t v26 = *(void *)(a1 + 32);
      id v27 = *(void **)(v26 + 1096);
      *(void *)(v26 + 1096) = v25;

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_77;
    }
  }
  else if (v10)
  {
    goto LABEL_16;
  }
  if (*(unsigned char *)(a1 + 74))
  {
    int v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = (void *)MEMORY[0x1E4FB1418];
  }
  else
  {
    uint64_t v24 = [v96 count];
    uint64_t v20 = (void *)MEMORY[0x1E4FB1418];
    if (v24)
    {
      uint64_t v19 = _WBSLocalizedString();
      int v18 = 1;
    }
    else
    {
      int v18 = 0;
      uint64_t v19 = 0;
    }
  }
  _SFDeviceIsPad();
  v100 = objc_msgSend(v20, "alertControllerWithTitle:message:imageNamed:preferredStyle:", v19, 0);
  if (v18) {

  }
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  obuint64_t j = v96;
  uint64_t v28 = [obj countByEnumeratingWithState:&v119 objects:v137 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v120;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v120 != v29) {
          objc_enumerationMutation(obj);
        }
        v31 = *(void **)(*((void *)&v119 + 1) + 8 * i);
        id v32 = NSString;
        v33 = _WBSLocalizedString();
        v34 = [v31 site];
        id v35 = objc_msgSend(v32, "stringWithFormat:", v33, v34);

        if ([v31 isExternal])
        {
          v36 = [v31 externalCredential];
          uint64_t v37 = [MEMORY[0x1E4F98250] titleForCredentialIdentity:v36 formURL:0];

          id v35 = (void *)v37;
        }
        char v38 = [v31 user];
        BOOL v39 = [v31 creationDate];
        char v40 = +[SFCredentialDisplayData descriptionForPasswordWithUser:v38 creationDate:v39];

        v118[0] = MEMORY[0x1E4F143A8];
        v118[1] = 3221225472;
        v118[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_4;
        v118[3] = &unk_1E5C74DD8;
        v118[4] = *(void *)(v101 + 32);
        v118[5] = v31;
        long long v41 = +[SFMultipleLineAlertAction actionWithTitle:v40 detail:v35 handler:v118];
        [v100 addAction:v41];
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v119 objects:v137 count:16];
    }
    while (v28);
  }

  long long v42 = _WBSLocalizedString();
  if ([v98 count])
  {
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id v43 = v98;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v114 objects:v136 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v115;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v115 != v45) {
            objc_enumerationMutation(v43);
          }
          uint64_t v47 = *(void *)(*((void *)&v114 + 1) + 8 * j);
          v48 = [MEMORY[0x1E4F98230] sharedManager];
          char v49 = [v48 extensionSupportsTextInsertion:v47];

          if (*(unsigned char *)(v101 + 74)) {
            char v50 = v49;
          }
          else {
            char v50 = 1;
          }
          if (v50)
          {
            v51 = [*(id *)(v101 + 32) _actionForPresentingPasswordManagerExtension:v47];
            [v100 addAction:v51];
          }
        }
        uint64_t v44 = [v43 countByEnumeratingWithState:&v114 objects:v136 count:16];
      }
      while (v44);
    }

    uint64_t v52 = _WBSLocalizedString();

    long long v42 = (void *)v52;
  }
  if (v97)
  {
    v53 = (void *)MEMORY[0x1E4FB1410];
    v112[0] = MEMORY[0x1E4F143A8];
    v112[1] = 3221225472;
    v112[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_5;
    v112[3] = &unk_1E5C74E00;
    id v113 = v95;
    v54 = [v53 actionWithTitle:v42 style:0 handler:v112];
    [v100 addAction:v54];
  }
  v55 = [v100 actions];
  BOOL v56 = [v55 count] == 0;

  if (v56)
  {
    v63 = objc_msgSend(v98, "safari_mapObjectsUsingBlock:", &__block_literal_global_200);
    switch([v98 count])
    {
      case 0:
        v64 = _WBSLocalizedString();
        int v65 = 0;
        int v66 = 1;
        goto LABEL_67;
      case 1:
        v68 = NSString;
        v69 = _WBSLocalizedString();
        v70 = [v63 objectAtIndexedSubscript:0];
        v71 = [v63 objectAtIndexedSubscript:0];
        v64 = objc_msgSend(v68, "stringWithFormat:", v69, v70, v71);
        int v65 = 1;
        goto LABEL_66;
      case 2:
        v72 = NSString;
        v69 = _WBSLocalizedString();
        v70 = [v63 objectAtIndexedSubscript:0];
        v71 = [v63 objectAtIndexedSubscript:1];
        v64 = objc_msgSend(v72, "stringWithFormat:", v69, v70, v71);
        goto LABEL_65;
      case 3:
        v73 = NSString;
        v69 = _WBSLocalizedString();
        v70 = [v63 objectAtIndexedSubscript:0];
        v71 = [v63 objectAtIndexedSubscript:1];
        v74 = [v63 objectAtIndexedSubscript:2];
        v64 = objc_msgSend(v73, "stringWithFormat:", v69, v70, v71, v74);

LABEL_65:
        int v65 = 0;
LABEL_66:

        int v66 = 0;
LABEL_67:
        v75 = (void *)MEMORY[0x1E4FB1418];
        v76 = _WBSLocalizedString();
        v77 = [v75 alertControllerWithTitle:v76 message:v64 imageNamed:@"alert-passwords" preferredStyle:1];

        if (v66)
        {
          v78 = (void *)MEMORY[0x1E4FB1410];
          v79 = _WBSLocalizedString();
          v111[0] = MEMORY[0x1E4F143A8];
          v111[1] = 3221225472;
          v111[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_220;
          v111[3] = &unk_1E5C74E48;
          v111[4] = *(void *)(v101 + 32);
          v80 = [v78 actionWithTitle:v79 style:0 handler:v111];
          [v77 addAction:v80];

          v81 = (void *)MEMORY[0x1E4FB1410];
          v82 = _WBSLocalizedString();
          v110[0] = MEMORY[0x1E4F143A8];
          v110[1] = 3221225472;
          v110[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_3_227;
          v110[3] = &unk_1E5C74E48;
          v110[4] = *(void *)(v101 + 32);
          v83 = [v81 actionWithTitle:v82 style:0 handler:v110];
          [v77 addAction:v83];
        }
        else
        {
          if (v65)
          {
            v84 = (void *)MEMORY[0x1E4FB1410];
            v85 = NSString;
            v86 = _WBSLocalizedString();
            v87 = [v63 objectAtIndexedSubscript:0];
            v88 = objc_msgSend(v85, "stringWithFormat:", v86, v87);
            v108[0] = MEMORY[0x1E4F143A8];
            v108[1] = 3221225472;
            v108[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_4_231;
            v108[3] = &unk_1E5C74E48;
            id v109 = v98;
            v89 = [v84 actionWithTitle:v88 style:0 handler:v108];
            [v77 addAction:v89];
          }
          v90 = (void *)MEMORY[0x1E4FB1410];
          v91 = _WBSLocalizedString();
          v107[0] = MEMORY[0x1E4F143A8];
          v107[1] = 3221225472;
          v107[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_235;
          v107[3] = &unk_1E5C74E48;
          v107[4] = *(void *)(v101 + 32);
          v92 = [v90 actionWithTitle:v91 style:0 handler:v107];
          [v77 addAction:v92];
        }
        [*(id *)(v101 + 32) presentViewController:v77 animated:1 completion:0];
        v93 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A690B000, v93, OS_LOG_TYPE_INFO, "There is no available CPE that supports explicit AutoFill.", buf, 2u);
        }
        (*(void (**)(void))(*(void *)(v101 + 56) + 16))();

        break;
      default:
        v67 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT)) {
          __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_cold_1();
        }
        (*(void (**)(void))(*(void *)(v101 + 56) + 16))();
        break;
    }
  }
  else
  {
    v57 = (void *)MEMORY[0x1E4FB1410];
    v58 = _WBSLocalizedString();
    v105[0] = MEMORY[0x1E4F143A8];
    v105[1] = 3221225472;
    v105[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_242;
    v105[3] = &unk_1E5C74E48;
    v105[4] = *(void *)(v101 + 32);
    v59 = [v57 actionWithTitle:v58 style:1 handler:v105];
    [v100 addAction:v59];

    v102[0] = MEMORY[0x1E4F143A8];
    v102[1] = 3221225472;
    v102[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_243;
    v102[3] = &unk_1E5C74DB0;
    objc_copyWeak(&v104, (id *)(v101 + 64));
    id v103 = v100;
    uint64_t v60 = MEMORY[0x1AD0C36A0](v102);
    uint64_t v61 = *(void *)(v101 + 32);
    v62 = *(void **)(v61 + 1096);
    *(void *)(v61 + 1096) = v60;

    (*(void (**)(void))(*(void *)(v101 + 56) + 16))();
    objc_destroyWeak(&v104);
  }

LABEL_77:
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v2 = (uint64_t *)(a1 + 32);
  BOOL v56 = [*(id *)(a1 + 32) _hostApplicationBundleIdentifier];
  uint64_t v3 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v56];
  BOOL v4 = [v3 localizedNameForContext:0];

  v53 = v4;
  if (![v4 length])
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_cold_3();
    }
  }
  v54 = objc_msgSend(*(id *)(*v2 + 1024), "safari_originalDataAsString");
  v55 = objc_msgSend(*(id *)(a1 + 40), "safari_mapObjectsUsingBlock:", &__block_literal_global_130);
  uint64_t v60 = [MEMORY[0x1E4F1CA48] array];
  if (!*(unsigned char *)(a1 + 72)) {
    goto LABEL_11;
  }
  id v6 = *(void **)(*v2 + 1056);
  uint64_t v7 = *(void *)(*v2 + 1048);
  if (!v6)
  {
    if (v7) {
      goto LABEL_9;
    }
LABEL_11:
    id v6 = v4;
    if (!v4)
    {
LABEL_13:
      uint64_t v8 = (void *)*v2;
      goto LABEL_14;
    }
LABEL_12:
    [v60 addObject:v6];
    goto LABEL_13;
  }
  if (!v7) {
    goto LABEL_12;
  }
LABEL_9:
  [v60 addObject:*(void *)(*v2 + 1048)];
  uint64_t v8 = (void *)*v2;
  id v6 = *(void **)(*v2 + 1056);
  if (v6) {
    goto LABEL_12;
  }
LABEL_14:
  if (v8)
  {
    [v8 _hostAuditToken];
  }
  else
  {
    long long v71 = 0u;
    long long v72 = 0u;
  }
  id v9 = *(id *)(a1 + 48);
  *(_OWORD *)buf = v71;
  *(_OWORD *)&buf[16] = v72;
  if (WBSAuditTokenHasEntitlement())
  {

LABEL_19:
    uint64_t v10 = 1;
LABEL_29:
    uint64_t v17 = *(void *)(a1 + 48);
    id v69 = 0;
    id v70 = 0;
    [MEMORY[0x1E4F98CA0] getHintStringsForAppID:v17 appNames:v60 matchedSites:v55 urlString:v54 outServiceNameHintStrings:&v70 outDomainHintStrings:&v69];
    id v57 = v70;
    id v58 = v69;
    int v18 = (id)WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v50 = *(void *)(a1 + 32);
      uint64_t v51 = *(void *)(a1 + 48);
      uint64_t v52 = [v55 count];
      *(_DWORD *)buf = 134219522;
      *(void *)&buf[4] = v50;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v51;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v60;
      __int16 v77 = 2048;
      uint64_t v78 = v52;
      __int16 v79 = 2112;
      v80 = v54;
      __int16 v81 = 2112;
      id v82 = v57;
      __int16 v83 = 2112;
      id v84 = v58;
      _os_log_debug_impl(&dword_1A690B000, v18, OS_LOG_TYPE_DEBUG, "Password view controller %p requested hint strings for app ID \"%@\", appNames %@, number of matchedSites %lu, urlString %@; got service name hint strings: %@ and domain hint strings: %@",
        buf,
        0x48u);
    }

    goto LABEL_32;
  }
  long long v74 = v71;
  long long v75 = v72;
  if (WBSAuditTokenHasEntitlement())
  {
    id v73 = 0;
    id v11 = [MEMORY[0x1E4F223F8] bundleRecordWithApplicationIdentifier:v9 error:&v73];
    id v12 = v73;
    BOOL v13 = v12;
    if (v11)
    {
      char v14 = [v11 entitlements];
      uint64_t v15 = [v14 objectForKey:@"com.apple.developer.web-browser" ofClass:objc_opt_class()];
      char v16 = [v15 BOOLValue];

      if (v16) {
        goto LABEL_19;
      }
    }
    else
    {
    }
  }
  else
  {
  }
  if (!*(void *)(*v2 + 1024) || [*(id *)(a1 + 40) count])
  {
    uint64_t v10 = 0;
    goto LABEL_29;
  }
  char v49 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
    __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_cold_2();
  }
  uint64_t v10 = 0;
  id v57 = 0;
  id v58 = 0;
LABEL_32:
  uint64_t v19 = objc_alloc_init(SFAccountPickerConfiguration);
  [(SFAccountPickerConfiguration *)v19 setMinimumNumberOfCredentialsToShowLikelyMatchesSection:10];
  [(SFAccountPickerConfiguration *)v19 setServiceNameHintStrings:v57];
  [(SFAccountPickerConfiguration *)v19 setDomainHintStrings:v58];
  if (v10) {
    [(SFAccountPickerConfiguration *)v19 setCurrentWebFrameIdentifierForAutoFillPasskeys:*(void *)(*v2 + 1080)];
  }
  v59 = [v60 firstObject];
  if (!*(unsigned char *)(a1 + 73) || ![*(id *)(*v2 + 1112) isExplicitAutoFillMode])
  {
    if (v10)
    {
      uint64_t v20 = *(void **)(*v2 + 1024);
      if (v20)
      {
        uint64_t v21 = objc_msgSend(v20, "safari_userVisibleString");
        uint64_t v22 = objc_msgSend(v21, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);

        long long v23 = NSString;
        uint64_t v24 = _WBSLocalizedString();
        uint64_t v25 = objc_msgSend(v23, "stringWithFormat:", v24, v22);
        [(SFAccountPickerConfiguration *)v19 setPrompt:v25];

        uint64_t v26 = NSString;
        id v27 = _WBSLocalizedString();
        uint64_t v28 = objc_msgSend(v26, "stringWithFormat:", v27, v22);
        [(SFAccountPickerConfiguration *)v19 setPromptWhenPasskeysAreAvailable:v28];

LABEL_41:
        goto LABEL_43;
      }
    }
    if ([v59 length])
    {
      uint64_t v29 = NSString;
      v30 = _WBSLocalizedString();
      v31 = objc_msgSend(v29, "stringWithFormat:", v30, v59);
      [(SFAccountPickerConfiguration *)v19 setPrompt:v31];

      id v32 = NSString;
      uint64_t v22 = _WBSLocalizedString();
      id v27 = objc_msgSend(v32, "stringWithFormat:", v22, v59);
      [(SFAccountPickerConfiguration *)v19 setPromptWhenPasskeysAreAvailable:v27];
      goto LABEL_41;
    }
  }
  v33 = _WBSLocalizedString();
  [(SFAccountPickerConfiguration *)v19 setPrompt:v33];

  uint64_t v22 = _WBSLocalizedString();
  [(SFAccountPickerConfiguration *)v19 setPromptWhenPasskeysAreAvailable:v22];
LABEL_43:

  [(SFAccountPickerConfiguration *)v19 setShouldEnableAddingNewPasswordsIfPossible:1];
  [(SFAccountPickerConfiguration *)v19 setShouldShowAutoFillPasskeys:1];
  v34 = (void *)*v2;
  char v35 = v10 ^ 1;
  if (!*(void *)(*v2 + 1080)) {
    char v35 = 1;
  }
  if ((v35 & 1) != 0
    || ([(SFAccountPickerConfiguration *)v19 setShouldShowPasskeysInAccountPicker:1], (v34 = (void *)*v2) != 0))
  {
    [v34 _hostAuditToken];
  }
  else
  {
    long long v67 = 0u;
    long long v68 = 0u;
  }
  v66[0] = v67;
  v66[1] = v68;
  [(SFAccountPickerConfiguration *)v19 setConnectedAppAuditToken:v66];
  char v36 = [&unk_1EFBDF8E0 containsObject:*(void *)(a1 + 48)];
  if (v10 && *(void *)(*v2 + 1024))
  {
    uint64_t v37 = [*(id *)(*v2 + 1024) host];
    char v38 = objc_msgSend(v37, "safari_highLevelDomainFromHost");
    [(SFAccountPickerConfiguration *)v19 setAddPasswordSuggestedDomain:v38];
  }
  else if ((v36 & 1) == 0)
  {
    uint64_t v39 = [*(id *)(a1 + 56) length];
    uint64_t v40 = *(void *)(a1 + 48);
    if (v39)
    {
      [(SFAccountPickerConfiguration *)v19 setBundleIDForFallbackIcon:v40];
      [(SFAccountPickerConfiguration *)v19 setAddPasswordSuggestedDomain:*(void *)(a1 + 56)];
    }
    else
    {
      [(SFAccountPickerConfiguration *)v19 setBundleIDForFallbackIcon:v40];
      [(SFAccountPickerConfiguration *)v19 setAddPasswordSuggestedLabel:v59];
    }
  }
  if (*(unsigned char *)(a1 + 73))
  {
    if ([*(id *)(*v2 + 1112) autofillMode] == 1) {
      uint64_t v41 = [*(id *)(*v2 + 1112) isExplicitAutoFillMode];
    }
    else {
      uint64_t v41 = 1;
    }
    [(SFAccountPickerConfiguration *)v19 setIsForFillingIndividualAccountFields:v41];
    [(SFAccountPickerConfiguration *)v19 setShouldShowReceivedVerificationCodes:1];
    [(SFAccountPickerConfiguration *)v19 setWebsiteURLForReceivedVerificationCodes:*(void *)(*v2 + 1024)];
    if ([(id)objc_opt_class() _shouldRestoreStateForSystemAutoFillForAppID:*(void *)(a1 + 48)])objc_msgSend((id)objc_opt_class(), "_restoreStateForSystemAutoFillToAccountPickerConfiguration:", v19); {
    else
    }
      [(id)objc_opt_class() _rememberStateForSystemAutoFillWithSearchQuery:0 savedAccount:0];
  }
  [(SFAccountPickerConfiguration *)v19 setAppID:*(void *)(a1 + 48)];
  [(SFAccountPickerConfiguration *)v19 setIsConnectedAppAWebBrowser:v10];
  [(SFAccountPickerConfiguration *)v19 setSavedAccountContext:*(void *)(a1 + 64)];
  long long v42 = [SFAccountPickerViewController alloc];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_168;
  v64[3] = &unk_1E5C74D18;
  char v65 = *(unsigned char *)(a1 + 73);
  v64[4] = *(void *)(a1 + 32);
  uint64_t v43 = [(SFAccountPickerViewController *)v42 initWithConfiguration:v19 completionHandler:v64];
  uint64_t v44 = *(void **)(*v2 + 1008);
  *(void *)(*v2 + 1008) = v43;

  [*(id *)(*v2 + 1008) setModalPresentationStyle:2];
  uint64_t v45 = *v2;
  v46 = [*(id *)(*v2 + 1008) presentationController];
  [v46 setDelegate:v45];

  objc_msgSend(*(id *)(*v2 + 1008), "setSystemAutoFillDelegate:");
  uint64_t v47 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
    __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_cold_1(v2, v47);
  }
  v48 = *(void **)(a1 + 32);
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_171;
  v61[3] = &unk_1E5C74D40;
  v61[4] = v48;
  char v63 = *(unsigned char *)(a1 + 73);
  id v62 = *(id *)(a1 + 48);
  [v48 _authenticateToViewOtherPasswordsWithCompletion:v61];
}

id __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_127(uint64_t a1, void *a2)
{
  id v2 = [a2 site];

  return v2;
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_168(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v24 = a2;
  uint64_t v3 = [v24 firstObject];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F98248]);
    id v5 = [v3 user];
    id v6 = [v3 password];
    uint64_t v7 = [v3 highLevelDomain];
    uint64_t v8 = [v3 creationDate];
    id v9 = [v3 customTitle];
    uint64_t v10 = [v3 sharedGroupName];
    id v11 = (void *)[v4 initWithUser:v5 password:v6 site:v7 creationDate:v8 customTitle:v9 groupName:v10];

    id v12 = (id)WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      long long v23 = [v11 user];
      if ([v23 length]) {
        BOOL v13 = @"YES";
      }
      else {
        BOOL v13 = @"NO";
      }
      char v14 = v13;
      uint64_t v15 = [v11 password];
      if ([v15 length]) {
        char v16 = @"YES";
      }
      else {
        char v16 = @"NO";
      }
      uint64_t v17 = v16;
      int v18 = [v11 site];
      if ([v18 length]) {
        uint64_t v19 = @"YES";
      }
      else {
        uint64_t v19 = @"NO";
      }
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v14;
      __int16 v27 = 2114;
      uint64_t v28 = v17;
      __int16 v29 = 2114;
      v30 = v19;
      uint64_t v20 = v19;
      _os_log_impl(&dword_1A690B000, v12, OS_LOG_TYPE_DEFAULT, "Sending credential with non-empty username: %{public}@, non-empty password: %{public}@, non-empty site: %{public}@", buf, 0x20u);
    }
    uint64_t v21 = (id)WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      [v11 user];
      objc_claimAutoreleasedReturnValue();
      [v11 site];
      objc_claimAutoreleasedReturnValue();
      __85__SFPasswordPickerServiceViewController__sendCredentialToClient_needsAuthentication___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) _sendCredentialToClientAndDismiss:v11];
  }
  else
  {
    uint64_t v22 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A690B000, v22, OS_LOG_TYPE_DEFAULT, "Not sending a credential because we didn't receive one from the password picker", buf, 2u);
    }
    if (*(unsigned char *)(a1 + 40)) {
      [(id)objc_opt_class() _rememberStateForSystemAutoFillWithSearchQuery:0 savedAccount:0];
    }
    [*(id *)(a1 + 32) _dismiss];
  }
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_171(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_171_cold_1(a1, a2, v6);
  }
  if (a2)
  {
    uint64_t v7 = (id)WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 1008);
      int v11 = 134218498;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      uint64_t v14 = v9;
      __int16 v15 = 2048;
      uint64_t v16 = v10;
      _os_log_debug_impl(&dword_1A690B000, v7, OS_LOG_TYPE_DEBUG, "View controller %p presenting password view controller %{public}@ <%p>", (uint8_t *)&v11, 0x20u);
    }

    [*(id *)(*(void *)(a1 + 32) + 1008) setAuthenticatedContext:v5];
    [*(id *)(a1 + 32) presentViewController:*(void *)(*(void *)(a1 + 32) + 1008) animated:1 completion:0];
    if (*(unsigned char *)(a1 + 48)) {
      objc_storeStrong((id *)&lastUsedAppIDForSystemAutoFill, *(id *)(a1 + 40));
    }
  }
  else
  {
    [*(id *)(a1 + 32) _dismiss];
  }
}

uint64_t __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_174(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [MEMORY[0x1E4F98230] sharedManager];
  uint64_t v4 = [v3 extensionSupportsTextInsertion:v2];

  return v4;
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_178(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) firstObject];
  [WeakRetained _presentCredentialListForExtension:v2];
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) firstObject];
  [WeakRetained _presentCredentialListForExtension:v2];
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = +[_SFManagedFeatureObserver sharedObserver];
  objc_msgSend(v1, "_fillCredential:needsAuthentication:", v2, objc_msgSend(v3, "authenticationRequiredToAutoFill"));
}

uint64_t __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
  uint64_t v4 = objc_msgSend(v2, "sf_bundleIdentifierForContainingApp");
  id v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];
  id v6 = [v5 localizedName];

  return v6;
}

uint64_t __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_220(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_222;
  v2[3] = &unk_1E5C73238;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4F18AD8] openCredentialProviderAppSettingsWithCompletionHandler:v2];
}

uint64_t __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_222(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismiss];
}

uint64_t __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_3_227(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismiss];
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_4_231(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
  id v2 = objc_msgSend(v1, "sf_bundleIdentifierForContainingApp");

  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v4 = objc_alloc_init(MEMORY[0x1E4F224A0]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_5_234;
  v6[3] = &unk_1E5C74E70;
  id v5 = v2;
  id v7 = v5;
  [v3 openApplicationWithBundleIdentifier:v5 configuration:v4 completionHandler:v6];
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_5_234(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_5_234_cold_1(a1, v4);
    }
  }
}

uint64_t __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_235(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismiss];
}

uint64_t __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_242(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismiss];
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_243(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained presentViewController:*(void *)(a1 + 32) animated:1 completion:0];
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_3_247(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F98250];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_4_248;
  v8[3] = &unk_1E5C74EE8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v4 bestDomainForAppID:v5 completionHandler:v8];
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_4_248(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_5_249;
  block[3] = &unk_1E5C74EC0;
  id v8 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_5_249(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_sendCredentialToClientAndDismiss:(id)a3
{
  id v4 = a3;
  [(SFPasswordPickerServiceViewController *)self _hostAuditToken];
  int HasEntitlement = WBSAuditTokenHasEntitlement();
  id v6 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    -[SFPasswordPickerServiceViewController _sendCredentialToClientAndDismiss:]();
    if (HasEntitlement) {
      goto LABEL_3;
    }
LABEL_7:
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__SFPasswordPickerServiceViewController__sendCredentialToClientAndDismiss___block_invoke;
    v9[3] = &unk_1E5C73108;
    v9[4] = self;
    [MEMORY[0x1E4FAE280] sendAutofillCredentialCandidate:v4 completionHandler:v9];
    goto LABEL_8;
  }
  if (!HasEntitlement) {
    goto LABEL_7;
  }
LABEL_3:
  id v7 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A690B000, v7, OS_LOG_TYPE_INFO, "Dismissing password picker service view controller after sending credential directly", buf, 2u);
  }
  id v8 = [(SFPasswordPickerServiceViewController *)self _remoteViewControllerProxy];
  [v8 selectedCredential:v4];

  [(SFPasswordPickerServiceViewController *)self _dismiss];
LABEL_8:
}

void __75__SFPasswordPickerServiceViewController__sendCredentialToClientAndDismiss___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__SFPasswordPickerServiceViewController__sendCredentialToClientAndDismiss___block_invoke_2;
  block[3] = &unk_1E5C73108;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __75__SFPasswordPickerServiceViewController__sendCredentialToClientAndDismiss___block_invoke_2(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A690B000, v2, OS_LOG_TYPE_INFO, "Dismissing password picker service view controller after sending credential via TextInput", v4, 2u);
  }
  return [*(id *)(a1 + 32) _dismiss];
}

- (BOOL)_isClientEntitledToDirectlyReceiveCredentials
{
  return WBSAuditTokenHasEntitlement();
}

- (void)setWebViewURL:(id)a3
{
  id v4 = (NSURL *)a3;
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SFPasswordPickerServiceViewController setWebViewURL:]();
  }
  webViewURL = self->_webViewURL;
  self->_webViewURL = v4;
}

- (void)setRemoteAppID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SFPasswordPickerServiceViewController setRemoteAppID:]();
  }
  id v6 = (NSString *)[v4 copy];
  remoteAppID = self->_remoteAppID;
  self->_remoteAppID = v6;
}

- (void)setRemoteLocalizedAppName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SFPasswordPickerServiceViewController setRemoteLocalizedAppName:]();
  }
  id v6 = (NSString *)[v4 copy];
  remoteLocalizedAppName = self->_remoteLocalizedAppName;
  self->_remoteLocalizedAppName = v6;
}

- (void)setRemoteUnlocalizedAppName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SFPasswordPickerServiceViewController setRemoteUnlocalizedAppName:]();
  }
  id v6 = (NSString *)[v4 copy];
  remoteUnlocalizedAppName = self->_remoteUnlocalizedAppName;
  self->_remoteUnlocalizedAppName = v6;
}

- (void)setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:(id)a3
{
  id v4 = a3;
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SFPasswordPickerServiceViewController setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:]();
  }
  id v6 = (NSArray *)[v4 copy];
  externallyVerifiedAssociatedDomains = self->_externallyVerifiedAssociatedDomains;
  self->_externallyVerifiedAssociatedDomains = v6;
}

- (void)setAuthenticationGracePeriod:(double)a3
{
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(SFPasswordPickerServiceViewController *)(uint64_t)self setAuthenticationGracePeriod:a3];
  }
  self->_authenticationGracePeriod = a3;
}

- (void)setPageID:(id)a3 frameID:(id)a4 credentialType:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 134218754;
    __int16 v15 = self;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_debug_impl(&dword_1A690B000, v11, OS_LOG_TYPE_DEBUG, "View controller %p setPageID: %@ frameID: %@ credentialType: %@", (uint8_t *)&v14, 0x2Au);
    if (!v8) {
      goto LABEL_5;
    }
  }
  else if (!v8)
  {
    goto LABEL_5;
  }
  if (v9)
  {
    uint64_t v12 = (WBSGlobalFrameIdentifier *)[objc_alloc(MEMORY[0x1E4F98B78]) initWithPageID:v8 frameID:v9];
    webFrameIdentifier = self->_webFrameIdentifier;
    self->_webFrameIdentifier = v12;

    objc_storeStrong((id *)&self->_credentialType, a5);
  }
LABEL_5:
}

- (void)setSystemAutoFillDocumentTraits:(id)a3
{
  id v4 = a3;
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SFPasswordPickerServiceViewController setSystemAutoFillDocumentTraits:]();
  }
  id v6 = (RTIDocumentTraits *)[v4 copy];
  systemAutoFillDocumentTraits = self->_systemAutoFillDocumentTraits;
  self->_systemAutoFillDocumentTraits = v6;
}

- (BOOL)_isConfiguredForSystemAutoFill
{
  [(SFPasswordPickerServiceViewController *)self _hostAuditToken];
  int HasEntitlement = WBSAuditTokenHasEntitlement();
  if (HasEntitlement) {
    LOBYTE(HasEntitlement) = self->_systemAutoFillDocumentTraits != 0;
  }
  return HasEntitlement;
}

- (void)credentialListViewController:(id)a3 didFinishWithCredential:(id)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __105__SFPasswordPickerServiceViewController_credentialListViewController_didFinishWithCredential_completion___block_invoke;
  v29[3] = &unk_1E5C74EC0;
  id v11 = v10;
  id v32 = v11;
  id v12 = v9;
  id v30 = v12;
  uint64_t v31 = self;
  [v8 dismissViewControllerAnimated:1 completion:v29];
  if (v12)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F98248]);
    int v14 = [v12 user];
    __int16 v15 = [v12 password];
    __int16 v16 = [MEMORY[0x1E4F1C9C8] date];
    __int16 v27 = (void *)[v13 initWithUser:v14 password:v15 site:&stru_1EFB97EB8 creationDate:v16 customTitle:0 groupName:0];

    [(SFPasswordPickerServiceViewController *)self _sendCredentialToClientAndDismiss:v27];
    id v17 = [(SFPasswordServiceViewController *)self applicationIdentifier];
    id v28 = 0;
    __int16 v18 = objc_msgSend(v17, "safari_bundleIdentifierFromApplicationIdentifier:", &v28);
    id v19 = v28;

    if (v19)
    {
      __int16 v20 = (id)WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v19, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[SFPasswordPickerServiceViewController credentialListViewController:didFinishWithCredential:completion:]();
      }
    }
    else
    {
      authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
      uint64_t v26 = [v12 user];
      uint64_t v22 = [(SFCredentialIdentity *)self->_credentialIdentityToFill site];
      long long v23 = [v8 extension];
      id v24 = [v23 identifier];
      [(WBSAuthenticationServicesAgentProxy *)authenticationServicesAgentProxy didFillCredentialForUsername:v26 forHost:v22 fromProviderWithBundleIdentifier:v24 inAppWithBundleIdentifier:v18];
    }
    credentialIdentityToFill = self->_credentialIdentityToFill;
    self->_credentialIdentityToFill = 0;
  }
}

uint64_t __105__SFPasswordPickerServiceViewController_credentialListViewController_didFinishWithCredential_completion___block_invoke(void *a1)
{
  uint64_t result = (*(uint64_t (**)(void))(a1[6] + 16))();
  if (!a1[4])
  {
    id v3 = (void *)a1[5];
    return [v3 _dismiss];
  }
  return result;
}

- (void)credentialListViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v18 = a5;
  authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
  id v11 = [(SFPasswordServiceViewController *)self applicationIdentifier];
  id v12 = [v9 relyingParty];
  id v13 = [v9 authenticatorData];
  int v14 = [v9 signature];
  __int16 v15 = [v9 userHandle];
  __int16 v16 = [v9 credentialID];
  [(WBSAuthenticationServicesAgentProxy *)authenticationServicesAgentProxy completeAssertionWithExternalPasskeyForApplicationIdentifier:v11 relyingPartyIdentifier:v12 authenticatorData:v13 signature:v14 userHandle:v15 credentialID:v16];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __121__SFPasswordPickerServiceViewController_credentialListViewController_didFinishWithPasskeyAssertionCredential_completion___block_invoke;
  v19[3] = &unk_1E5C73040;
  id v17 = v18;
  v19[4] = self;
  id v20 = v17;
  [v8 dismissViewControllerAnimated:1 completion:v19];
}

uint64_t __121__SFPasswordPickerServiceViewController_credentialListViewController_didFinishWithPasskeyAssertionCredential_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);

  return [v2 _dismiss];
}

- (void)credentialListViewController:(id)a3 didFinishWithText:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __99__SFPasswordPickerServiceViewController_credentialListViewController_didFinishWithText_completion___block_invoke;
  v14[3] = &unk_1E5C74EC0;
  id v10 = v9;
  id v17 = v10;
  id v11 = v8;
  id v15 = v11;
  __int16 v16 = self;
  [a3 dismissViewControllerAnimated:1 completion:v14];
  if ([v11 length])
  {
    id v12 = [(SFPasswordPickerServiceViewController *)self _remoteViewControllerProxy];
    [v12 fillText:v11];
  }
  else
  {
    id v13 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SFPasswordPickerServiceViewController credentialListViewController:didFinishWithText:completion:]();
    }
  }
}

uint64_t __99__SFPasswordPickerServiceViewController_credentialListViewController_didFinishWithText_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t result = [*(id *)(a1 + 32) length];
  if (!result)
  {
    id v3 = *(void **)(a1 + 40);
    return [v3 _dismiss];
  }
  return result;
}

- (void)presentUIForPasswordCredentialAuthenticationViewController:(id)a3
{
}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  externalCredentialViewController = self->_externalCredentialViewController;
  self->_externalCredentialViewController = 0;

  id v13 = [v9 presentingViewController];

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __121__SFPasswordPickerServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke;
  v34[3] = &unk_1E5C74EC0;
  id v14 = v11;
  id v37 = v14;
  id v15 = v10;
  id v35 = v15;
  char v36 = self;
  id v32 = (void *)MEMORY[0x1AD0C36A0](v34);
  [v9 dismissViewControllerAnimated:1 completion:v32];
  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F98248]);
    id v17 = [v15 user];
    id v18 = [v15 password];
    id v19 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v31 = (void *)[v16 initWithUser:v17 password:v18 site:&stru_1EFB97EB8 creationDate:v19 customTitle:0 groupName:0];

    if (v13)
    {
      uint64_t v20 = 0;
    }
    else
    {
      id v17 = +[_SFManagedFeatureObserver sharedObserver];
      uint64_t v20 = [v17 authenticationRequiredToAutoFill];
    }
    [(SFPasswordPickerServiceViewController *)self _sendCredentialToClient:v31 needsAuthentication:v20];
    if (!v13) {

    }
    id v21 = [(SFPasswordServiceViewController *)self applicationIdentifier];
    id v33 = 0;
    id v30 = objc_msgSend(v21, "safari_bundleIdentifierFromApplicationIdentifier:", &v33);
    id v22 = v33;

    if (v22)
    {
      long long v23 = (id)WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v22, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[SFPasswordPickerServiceViewController credentialListViewController:didFinishWithCredential:completion:]();
      }
    }
    else
    {
      authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
      __int16 v29 = [v15 user];
      uint64_t v25 = [(SFCredentialIdentity *)self->_credentialIdentityToFill site];
      uint64_t v26 = [v9 extension];
      __int16 v27 = [v26 identifier];
      [(WBSAuthenticationServicesAgentProxy *)authenticationServicesAgentProxy didFillCredentialForUsername:v29 forHost:v25 fromProviderWithBundleIdentifier:v27 inAppWithBundleIdentifier:v30];
    }
    credentialIdentityToFill = self->_credentialIdentityToFill;
    self->_credentialIdentityToFill = 0;
  }
}

uint64_t __121__SFPasswordPickerServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke(void *a1)
{
  uint64_t result = (*(uint64_t (**)(void))(a1[6] + 16))();
  if (!a1[4])
  {
    id v3 = (void *)a1[5];
    return [v3 _dismiss];
  }
  return result;
}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v20 = a6;
  externalCredentialViewController = self->_externalCredentialViewController;
  self->_externalCredentialViewController = 0;

  authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
  id v13 = [(SFPasswordServiceViewController *)self applicationIdentifier];
  id v14 = [v10 relyingParty];
  id v15 = [v10 authenticatorData];
  id v16 = [v10 signature];
  id v17 = [v10 userHandle];
  id v18 = [v10 credentialID];
  [(WBSAuthenticationServicesAgentProxy *)authenticationServicesAgentProxy completeAssertionWithExternalPasskeyForApplicationIdentifier:v13 relyingPartyIdentifier:v14 authenticatorData:v15 signature:v16 userHandle:v17 credentialID:v18];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __137__SFPasswordPickerServiceViewController_credentialAuthenticationViewController_didFinishWithPasskeyAssertionCredential_error_completion___block_invoke;
  v21[3] = &unk_1E5C73040;
  id v19 = v20;
  v21[4] = self;
  id v22 = v19;
  [v9 dismissViewControllerAnimated:1 completion:v21];
}

uint64_t __137__SFPasswordPickerServiceViewController_credentialAuthenticationViewController_didFinishWithPasskeyAssertionCredential_error_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);

  return [v2 _dismiss];
}

- (void)accountPickerViewController:(id)a3 fillUsernameForSavedAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SFPasswordPickerServiceViewController *)self _isClientEntitledToDirectlyReceiveCredentials])
  {
    id v8 = objc_opt_class();
    id v9 = [v6 searchQuery];
    [v8 _rememberStateForSystemAutoFillWithSearchQuery:v9 savedAccount:v7];

    id v10 = [(SFPasswordPickerServiceViewController *)self _remoteViewControllerProxy];
    id v11 = [v7 user];
    [v10 fillUsername:v11];

    [(SFPasswordPickerServiceViewController *)self _dismiss];
  }
  else
  {
    id v12 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SFPasswordPickerServiceViewController accountPickerViewController:fillUsernameForSavedAccount:]();
    }
  }
}

- (void)accountPickerViewController:(id)a3 fillPasswordForSavedAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SFPasswordPickerServiceViewController *)self _isClientEntitledToDirectlyReceiveCredentials])
  {
    id v8 = objc_opt_class();
    id v9 = [v6 searchQuery];
    [v8 _rememberStateForSystemAutoFillWithSearchQuery:v9 savedAccount:v7];

    id v10 = [(SFPasswordPickerServiceViewController *)self _remoteViewControllerProxy];
    id v11 = [v7 password];
    [v10 fillPassword:v11];

    [(SFPasswordPickerServiceViewController *)self _dismiss];
  }
  else
  {
    id v12 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SFPasswordPickerServiceViewController accountPickerViewController:fillUsernameForSavedAccount:]();
    }
  }
}

- (void)accountPickerViewController:(id)a3 fillVerificationCodeForSavedAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SFPasswordPickerServiceViewController *)self _isClientEntitledToDirectlyReceiveCredentials])
  {
    id v8 = objc_opt_class();
    id v9 = [v6 searchQuery];
    [v8 _rememberStateForSystemAutoFillWithSearchQuery:v9 savedAccount:v7];

    id v10 = [(SFPasswordPickerServiceViewController *)self _remoteViewControllerProxy];
    id v11 = [v7 currentOneTimeCode];
    [v10 fillVerificationCode:v11];

    [(SFPasswordPickerServiceViewController *)self _dismiss];
  }
  else
  {
    id v12 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SFPasswordPickerServiceViewController accountPickerViewController:fillUsernameForSavedAccount:]();
    }
  }
}

- (void)accountPickerViewController:(id)a3 fillVerificationCode:(id)a4
{
  id v5 = a4;
  if ([(SFPasswordPickerServiceViewController *)self _isClientEntitledToDirectlyReceiveCredentials])
  {
    id v6 = [(SFPasswordPickerServiceViewController *)self _remoteViewControllerProxy];
    id v7 = [v5 code];
    [v6 fillVerificationCode:v7];

    [(SFPasswordPickerServiceViewController *)self _dismiss];
  }
  else
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SFPasswordPickerServiceViewController accountPickerViewController:fillUsernameForSavedAccount:]();
    }
  }
}

+ (BOOL)_shouldRestoreStateForSystemAutoFillForAppID:(id)a3
{
  LODWORD(v3) = [a3 isEqualToString:lastUsedAppIDForSystemAutoFill];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] now];
    [v4 timeIntervalSinceReferenceDate];
    double v6 = v5 - *(double *)&timeIntervalSinceReferenceDateOfLastSystemAutoFill;

    if (v6 <= 120.0)
    {
      uint64_t v3 = [(id)lastSearchQueryForSystemAutoFill length];
      LOBYTE(v3) = (v3 | lastUsedSavedAccountForSystemAutoFill) != 0;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

+ (void)_restoreStateForSystemAutoFillToAccountPickerConfiguration:(id)a3
{
  id v4 = a3;
  [v4 setInitialSearchQuery:lastSearchQueryForSystemAutoFill];
  [v4 setSavedAccountToInitiallyShowDetailsFor:lastUsedSavedAccountForSystemAutoFill];
  [a1 _rememberStateForSystemAutoFillWithSearchQuery:0 savedAccount:0];
}

+ (void)_rememberStateForSystemAutoFillWithSearchQuery:(id)a3 savedAccount:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  objc_storeStrong((id *)&lastSearchQueryForSystemAutoFill, a3);
  objc_storeStrong((id *)&lastUsedSavedAccountForSystemAutoFill, a4);
  id v7 = [MEMORY[0x1E4F1C9C8] now];
  [v7 timeIntervalSinceReferenceDate];
  timeIntervalSinceReferenceDateOfLastSystemAutoFill = v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemAutoFillDocumentTraits, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong(&self->_presentCredentialsHandler, 0);
  objc_storeStrong((id *)&self->_credentialType, 0);
  objc_storeStrong((id *)&self->_webFrameIdentifier, 0);
  objc_storeStrong((id *)&self->_externallyVerifiedAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_remoteUnlocalizedAppName, 0);
  objc_storeStrong((id *)&self->_remoteLocalizedAppName, 0);
  objc_storeStrong((id *)&self->_remoteAppID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_webViewURL, 0);
  objc_storeStrong((id *)&self->_accountPickerViewController, 0);
  objc_storeStrong((id *)&self->_authenticationServicesAgentProxy, 0);
  objc_storeStrong((id *)&self->_credentialIdentityToFill, 0);

  objc_storeStrong((id *)&self->_externalCredentialViewController, 0);
}

void __89__SFPasswordPickerServiceViewController__authenticateToViewOtherPasswordsWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_0(&dword_1A690B000, v3, v4, "Failed to get authentication for other passwords: %{public}@", v5);
}

void __85__SFPasswordPickerServiceViewController__sendCredentialToClient_needsAuthentication___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7(v2, v3, v4, 5.8081e-34);
  _os_log_debug_impl(&dword_1A690B000, v6, OS_LOG_TYPE_DEBUG, "Sending credential with username: %{private}@, site: %{private}@", v5, 0x16u);
}

void __85__SFPasswordPickerServiceViewController__sendCredentialToClient_needsAuthentication___block_invoke_124_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_0(&dword_1A690B000, v3, v4, "Failed to get authentication to fill password with error: %{public}@", v5);
}

- (void)_authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4(&dword_1A690B000, v0, v1, "View controller %p is configured for system AutoFill: %{BOOL}d");
}

- (void)_authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_1A690B000, v0, v1, "View controller %p resolved app ID for credential lookup: %@");
}

- (void)_authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4(&dword_1A690B000, v0, v1, "View controller %p resolved that host app can set remote app properties: %d", v2, v3);
}

- (void)_authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A690B000, a2, OS_LOG_TYPE_DEBUG, "View controller %p will show passwords", (uint8_t *)&v2, 0xCu);
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_fault_impl(&dword_1A690B000, v0, OS_LOG_TYPE_FAULT, "We don't support more than 3 credential provider extensions. If we ever do, then change this switch statement.", v1, 2u);
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A690B000, a2, OS_LOG_TYPE_DEBUG, "View controller %p attempting to authenticate", (uint8_t *)&v3, 0xCu);
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_1A690B000, v0, OS_LOG_TYPE_DEBUG, "Not requesting hint strings.", v1, 2u);
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "Unable to get localized app name for host app", v2, v3, v4, v5, v6);
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_171_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 134218240;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_4(&dword_1A690B000, a2, a3, "View controller %p got authentication result %d ", (const void *)v3, DWORD2(v3));
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_5_234_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A690B000, a2, OS_LOG_TYPE_ERROR, "Failed to open app with bundle ID %@", (uint8_t *)&v3, 0xCu);
}

- (void)_sendCredentialToClientAndDismiss:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4(&dword_1A690B000, v0, v1, "View controller %p resolved that host app can receive credentials directly: %d", v2, v3);
}

- (void)setWebViewURL:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_1A690B000, v0, v1, "View controller %p setWebViewURL: %@");
}

- (void)setRemoteAppID:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_1A690B000, v0, v1, "View controller %p setRemoteAppID: %@");
}

- (void)setRemoteLocalizedAppName:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_1A690B000, v0, v1, "View controller %p setRemoteLocalizedAppName: %@");
}

- (void)setRemoteUnlocalizedAppName:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_1A690B000, v0, v1, "View controller %p setRemoteUnlocalizedAppName: %@");
}

- (void)setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_1A690B000, v0, v1, "View controller %p setExternallyVerifiedAndApprovedSharedWebCredentialsDomains: %@");
}

- (void)setAuthenticationGracePeriod:(double)a3 .cold.1(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&dword_1A690B000, a2, OS_LOG_TYPE_DEBUG, "View controller %p setAuthenticationGracePeriod: %f", (uint8_t *)&v3, 0x16u);
}

- (void)setSystemAutoFillDocumentTraits:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_1A690B000, v0, v1, "View controller %p setSystemAutoFillDocumentTraits: %@d");
}

- (void)credentialListViewController:didFinishWithCredential:completion:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_0(&dword_1A690B000, v3, v4, "Failed to get application bundle identifier with error: %{public}@", v5);
}

- (void)credentialListViewController:didFinishWithText:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "Received empty text value.", v2, v3, v4, v5, v6);
}

- (void)accountPickerViewController:fillUsernameForSavedAccount:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "Client is not allowed to receive credentials directly", v2, v3, v4, v5, v6);
}

@end