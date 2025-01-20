@interface SFExternalPasswordCredentialServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)contextRequiresSessionBasedAuthentication:(id)a3;
- (BOOL)contextShouldAllowMultipleBiometricFailures:(id)a3;
- (BOOL)contextShouldAllowPasscodeFallback:(id)a3;
- (BOOL)displayMessageAsTitleForContext:(id)a3;
- (SFExternalPasswordCredentialServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_authenticationContext;
- (id)authenticationCustomUIProgressObserverForContext:(id)a3;
- (id)authenticationMessageForContext:(id)a3;
- (id)passcodePromptForContext:(id)a3;
- (void)_autoFillWithCredentialIdentity:(id)a3 pageID:(id)a4 frameID:(id)a5;
- (void)_dismiss;
- (void)_finishRequestToAutoFillCredential:(id)a3 extensionShowedUI:(BOOL)a4 error:(id)a5 completion:(id)a6;
- (void)_finishRequestToReturnCredential:(id)a3 extensionShowedUI:(BOOL)a4 error:(id)a5 completion:(id)a6;
- (void)autoFillWithCredentialIdentity:(id)a3;
- (void)credentialAuthenticationViewController:(id)a3 didFinishWithCredential:(id)a4 error:(id)a5 completion:(id)a6;
- (void)credentialAuthenticationViewController:(id)a3 didFinishWithOneTimeCodeCredential:(id)a4 error:(id)a5 completion:(id)a6;
- (void)credentialAuthenticationViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 error:(id)a5 completion:(id)a6;
- (void)getCredentialForCredentialIdentity:(id)a3 completion:(id)a4;
- (void)presentUIForPasswordCredentialAuthenticationViewController:(id)a3;
@end

@implementation SFExternalPasswordCredentialServiceViewController

- (void)_dismiss
{
  v3 = [MEMORY[0x1E4F98230] sharedManager];
  [v3 removeObserver:self];

  id v4 = [(SFExternalPasswordCredentialServiceViewController *)self _remoteViewControllerProxy];
  [v4 willDismissServiceViewController];
}

- (id)_authenticationContext
{
  authenticationContext = self->_authenticationContext;
  if (!authenticationContext)
  {
    id v4 = objc_alloc_init(_SFAuthenticationContext);
    v5 = self->_authenticationContext;
    self->_authenticationContext = v4;

    [(_SFAuthenticationContext *)self->_authenticationContext setDelegate:self];
    authenticationContext = self->_authenticationContext;
  }
  v6 = authenticationContext;

  return v6;
}

- (id)authenticationCustomUIProgressObserverForContext:(id)a3
{
  return 0;
}

- (id)authenticationMessageForContext:(id)a3
{
  return +[SFAutoFillAuthenticationUtilities customAuthenticationTitleForFillingSavedPassword];
}

- (id)passcodePromptForContext:(id)a3
{
  return +[SFAutoFillAuthenticationUtilities passcodePromptForFillingSavedAccount];
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
  return 1;
}

- (BOOL)contextShouldAllowMultipleBiometricFailures:(id)a3
{
  return 1;
}

+ (id)_exportedInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC67A50];
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_autoFillWithCredentialIdentity_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v3 forSelector:sel_getCredentialForCredentialIdentity_completion_ argumentIndex:0 ofReply:0];
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v4 forSelector:sel_getCredentialForCredentialIdentity_completion_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  return +[SFExternalPasswordCredentialRemoteViewController exportedInterface];
}

- (SFExternalPasswordCredentialServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SFExternalPasswordCredentialServiceViewController;
  id v4 = [(SFExternalPasswordCredentialServiceViewController *)&v10 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = (WBSAuthenticationServicesAgentProxy *)objc_alloc_init(MEMORY[0x1E4F98968]);
    authenticationServicesAgentProxy = v4->_authenticationServicesAgentProxy;
    v4->_authenticationServicesAgentProxy = v5;

    v7 = [MEMORY[0x1E4F98230] sharedManager];
    [v7 addObserver:v4];

    v8 = v4;
  }

  return v4;
}

- (void)autoFillWithCredentialIdentity:(id)a3
{
}

- (void)_autoFillWithCredentialIdentity:(id)a3 pageID:(id)a4 frameID:(id)a5
{
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = [v6 owningExtensionState];
    v9 = [v8 providerBundleID];

    objc_super v10 = [MEMORY[0x1E4F98230] sharedManager];
    v11 = [v10 enabledExtensionWithContainingAppBundleID:v9];

    if (!v11)
    {
      v18 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[SFExternalPasswordCredentialServiceViewController _autoFillWithCredentialIdentity:pageID:frameID:]();
      }
      [(SFExternalPasswordCredentialServiceViewController *)self _dismiss];
      goto LABEL_16;
    }
    self->_completionAction = 0;
    uint64_t v12 = [v7 type];
    switch(v12)
    {
      case 4:
        id v19 = objc_alloc(MEMORY[0x1E4F18B00]);
        id v20 = objc_alloc(MEMORY[0x1E4F18AC0]);
        v21 = (void *)[objc_alloc(MEMORY[0x1E4F18AB8]) _initWithFoundationCredentialIdentity:v7];
        v22 = (void *)[v20 initWithCredentialIdentity:v21];
        v23 = (_ASCredentialAuthenticationViewController *)[v19 initWithExtension:v11 oneTimeCodeCredentialRequest:v22];
        extensionController = self->_extensionController;
        self->_extensionController = v23;

        break;
      case 2:
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __100__SFExternalPasswordCredentialServiceViewController__autoFillWithCredentialIdentity_pageID_frameID___block_invoke;
        v31[3] = &unk_1E5C75A30;
        v31[4] = self;
        id v32 = v11;
        v25 = (void *)MEMORY[0x1AD0C36A0](v31);
        id v26 = v7;
        [(SFExternalPasswordCredentialServiceViewController *)self _hostAuditToken];
        v27 = WBSApplicationIdentifierFromAuditToken();
        authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
        v29 = [v26 serviceIdentifier];
        v30 = [v26 credentialID];

        [(WBSAuthenticationServicesAgentProxy *)authenticationServicesAgentProxy getExternalPasskeyRequestForApplicationIdentifier:v27 relyingPartyIdentifier:v29 credentialID:v30 completionHandler:v25];
        goto LABEL_16;
      case 1:
        id v13 = objc_alloc(MEMORY[0x1E4F18B00]);
        v14 = (void *)[objc_alloc(MEMORY[0x1E4F18AD0]) initWithFoundationCredentialIdentity:v7];
        v15 = (_ASCredentialAuthenticationViewController *)[v13 initWithExtension:v11 credentialIdentity:v14];
        v16 = self->_extensionController;
        self->_extensionController = v15;

        break;
      default:
LABEL_16:

        goto LABEL_17;
    }
    [(_ASCredentialAuthenticationViewController *)self->_extensionController setDelegate:self];
    goto LABEL_16;
  }
  v17 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[SFExternalPasswordCredentialServiceViewController _autoFillWithCredentialIdentity:pageID:frameID:]();
  }
  [(SFExternalPasswordCredentialServiceViewController *)self _dismiss];
LABEL_17:
}

void __100__SFExternalPasswordCredentialServiceViewController__autoFillWithCredentialIdentity_pageID_frameID___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F18B00]) initWithExtension:*(void *)(a1 + 40) passkeyAssertionRequest:v6];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 992);
    *(void *)(v4 + 992) = v3;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 992), "setDelegate:");
  }
  else
  {
    [*(id *)(a1 + 32) _dismiss];
  }
}

- (void)_finishRequestToAutoFillCredential:(id)a3 extensionShowedUI:(BOOL)a4 error:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __123__SFExternalPasswordCredentialServiceViewController__finishRequestToAutoFillCredential_extensionShowedUI_error_completion___block_invoke;
  v19[3] = &unk_1E5C77A50;
  id v11 = v10;
  id v21 = v11;
  id v12 = v9;
  id v20 = v12;
  id v13 = (void (**)(void, void))MEMORY[0x1AD0C36A0](v19);
  if (a4
    || (+[_SFManagedFeatureObserver sharedObserver],
        v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = [v14 authenticationRequiredToAutoFill],
        v14,
        (v15 & 1) == 0))
  {
    v13[2](v13, 1);
  }
  else
  {
    v16 = [(SFExternalPasswordCredentialServiceViewController *)self _authenticationContext];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __123__SFExternalPasswordCredentialServiceViewController__finishRequestToAutoFillCredential_extensionShowedUI_error_completion___block_invoke_2;
    v17[3] = &unk_1E5C74548;
    v18 = v13;
    [v16 authenticateForClient:self userInitiated:1 completion:v17];
  }
}

void __123__SFExternalPasswordCredentialServiceViewController__finishRequestToAutoFillCredential_extensionShowedUI_error_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void **)(a1 + 32);
      v5 = v3;
      id v6 = [v4 user];
      if ([v6 length]) {
        v7 = @"YES";
      }
      else {
        v7 = @"NO";
      }
      v8 = v7;
      id v9 = [*(id *)(a1 + 32) password];
      if ([v9 length]) {
        id v10 = @"YES";
      }
      else {
        id v10 = @"NO";
      }
      id v11 = v10;
      *(_DWORD *)buf = 138543618;
      id v19 = v8;
      __int16 v20 = 2114;
      id v21 = v11;
      _os_log_impl(&dword_1A690B000, v5, OS_LOG_TYPE_DEFAULT, "Sending credential with non-empty username: %{public}@, non-empty password: %{public}@", buf, 0x16u);
    }
    id v12 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __123__SFExternalPasswordCredentialServiceViewController__finishRequestToAutoFillCredential_extensionShowedUI_error_completion___block_invoke_cold_1(a1, v12);
    }
    id v13 = (void *)MEMORY[0x1E4FAE280];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __123__SFExternalPasswordCredentialServiceViewController__finishRequestToAutoFillCredential_extensionShowedUI_error_completion___block_invoke_66;
    v16[3] = &unk_1E5C72CB0;
    uint64_t v14 = *(void *)(a1 + 32);
    id v17 = *(id *)(a1 + 40);
    [v13 sendAutofillCredentialCandidate:v14 completionHandler:v16];
  }
  else
  {
    char v15 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v15();
  }
}

uint64_t __123__SFExternalPasswordCredentialServiceViewController__finishRequestToAutoFillCredential_extensionShowedUI_error_completion___block_invoke_66(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __123__SFExternalPasswordCredentialServiceViewController__finishRequestToAutoFillCredential_extensionShowedUI_error_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getCredentialForCredentialIdentity:(id)a3 completion:(id)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    [(SFExternalPasswordCredentialServiceViewController *)self _hostAuditToken];
    if (WBSAuditTokenHasEntitlement())
    {
      v8 = [v6 owningExtensionState];
      id v9 = [v8 providerBundleID];

      id v10 = [MEMORY[0x1E4F98230] sharedManager];
      id v11 = [v10 enabledExtensionWithContainingAppBundleID:v9];

      if (v11)
      {
        id v12 = (void *)MEMORY[0x1AD0C36A0](v7);
        id getCredentialCompletion = self->_getCredentialCompletion;
        self->_id getCredentialCompletion = v12;

        self->_completionAction = 1;
        id v14 = objc_alloc(MEMORY[0x1E4F18B00]);
        char v15 = (void *)[objc_alloc(MEMORY[0x1E4F18AD0]) initWithFoundationCredentialIdentity:v6];
        v16 = (_ASCredentialAuthenticationViewController *)[v14 initWithExtension:v11 credentialIdentity:v15];
        extensionController = self->_extensionController;
        self->_extensionController = v16;

        [(_ASCredentialAuthenticationViewController *)self->_extensionController setDelegate:self];
      }
      else
      {
        v23 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[SFExternalPasswordCredentialServiceViewController _autoFillWithCredentialIdentity:pageID:frameID:]();
        }
        v24 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v25 = *MEMORY[0x1E4F18A80];
        uint64_t v28 = *MEMORY[0x1E4F28588];
        v29 = @"Primary credential provider extension was not found";
        id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        v27 = [v24 errorWithDomain:v25 code:0 userInfo:v26];
        (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v27);

        [(SFExternalPasswordCredentialServiceViewController *)self _dismiss];
      }
    }
    else
    {
      v18 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[SFExternalPasswordCredentialServiceViewController getCredentialForCredentialIdentity:completion:]();
      }
      id v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F281F8];
      uint64_t v30 = *MEMORY[0x1E4F28588];
      v31[0] = @"Calling process is not entitled";
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      uint64_t v22 = [v19 errorWithDomain:v20 code:4099 userInfo:v21];
      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v22);

      [(SFExternalPasswordCredentialServiceViewController *)self _dismiss];
    }
  }
}

- (void)_finishRequestToReturnCredential:(id)a3 extensionShowedUI:(BOOL)a4 error:(id)a5 completion:(id)a6
{
  id getCredentialCompletion = self->_getCredentialCompletion;
  if (getCredentialCompletion)
  {
    BOOL v10 = !a4;
    id v11 = (void (*)(void *, id, BOOL, id))getCredentialCompletion[2];
    id v12 = a6;
    v11(getCredentialCompletion, a3, v10, a5);
  }
  else
  {
    id v13 = a6;
    id v14 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SFExternalPasswordCredentialServiceViewController _finishRequestToReturnCredential:extensionShowedUI:error:completion:]();
    }
  }
  (*((void (**)(id))a6 + 2))(a6);
}

- (void)presentUIForPasswordCredentialAuthenticationViewController:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __112__SFExternalPasswordCredentialServiceViewController_presentUIForPasswordCredentialAuthenticationViewController___block_invoke;
  v3[3] = &unk_1E5C724D8;
  v3[4] = self;
  [(SFExternalPasswordCredentialServiceViewController *)self presentViewController:a3 animated:1 completion:v3];
}

void __112__SFExternalPasswordCredentialServiceViewController_presentUIForPasswordCredentialAuthenticationViewController___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 presentExternalPasswordCredentialRemoteViewController];
}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v14 = [v13 presentingViewController];

  char v15 = dispatch_group_create();
  dispatch_group_enter(v15);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke;
  v42[3] = &unk_1E5C73300;
  id v16 = v12;
  id v44 = v16;
  id v17 = v15;
  v43 = v17;
  [v13 dismissViewControllerAnimated:1 completion:v42];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_2;
  v39[3] = &unk_1E5C72238;
  v18 = v17;
  v40 = v18;
  v41 = self;
  id v19 = (void (**)(void))MEMORY[0x1AD0C36A0](v39);
  if (v10)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F98248]);
    [v10 user];
    v33 = self;
    id v21 = v18;
    id v22 = v16;
    v24 = id v23 = v11;
    [v10 password];
    id v26 = v25 = v10;
    [MEMORY[0x1E4F1C9C8] date];
    uint64_t v28 = v27 = v14;
    v29 = (void *)[v20 initWithUser:v24 password:v26 site:&stru_1EFB97EB8 creationDate:v28 customTitle:0 groupName:0];

    id v14 = v27;
    id v10 = v25;

    id v11 = v23;
    id v16 = v22;
    v18 = v21;
    self = v33;
  }
  else
  {
    v29 = 0;
  }
  int64_t completionAction = self->_completionAction;
  if (completionAction == 1)
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_86;
    v34[3] = &unk_1E5C72CB0;
    v35 = v19;
    [(SFExternalPasswordCredentialServiceViewController *)self _finishRequestToReturnCredential:v29 extensionShowedUI:v14 != 0 error:v11 completion:v34];
    v31 = v35;
    goto LABEL_9;
  }
  if (completionAction)
  {
LABEL_12:
    v19[2](v19);
    goto LABEL_13;
  }
  if (!v29)
  {
    id v32 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A690B000, v32, OS_LOG_TYPE_DEFAULT, "Did not receive any external password credential", buf, 2u);
    }
    goto LABEL_12;
  }
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_84;
  v36[3] = &unk_1E5C72CB0;
  v37 = v19;
  [(SFExternalPasswordCredentialServiceViewController *)self _finishRequestToAutoFillCredential:v29 extensionShowedUI:v14 != 0 error:v11 completion:v36];
  v31 = v37;
LABEL_9:

LABEL_13:
}

void __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v2);
}

void __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_3;
  block[3] = &unk_1E5C724D8;
  id v1 = *(NSObject **)(a1 + 32);
  block[4] = *(void *)(a1 + 40);
  dispatch_group_notify(v1, MEMORY[0x1E4F14428], block);
}

uint64_t __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismiss];
}

void __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_84(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_2_85;
  block[3] = &unk_1E5C72CB0;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_2_85(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A690B000, v2, OS_LOG_TYPE_INFO, "Dismissing external password credential service view controller after sending credential", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_86(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_2_87;
  block[3] = &unk_1E5C72CB0;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_2_87(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A690B000, v2, OS_LOG_TYPE_INFO, "Dismissing external password credential service view controller after returning credential", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  id v20 = a6;
  extensionController = self->_extensionController;
  self->_extensionController = 0;
  id v10 = a4;
  id v11 = a3;

  authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
  [(SFExternalPasswordCredentialServiceViewController *)self _hostAuditToken];
  id v13 = WBSApplicationIdentifierFromAuditToken();
  id v14 = [v10 relyingParty];
  char v15 = [v10 authenticatorData];
  id v16 = [v10 signature];
  id v17 = [v10 userHandle];
  v18 = [v10 credentialID];

  [(WBSAuthenticationServicesAgentProxy *)authenticationServicesAgentProxy completeAssertionWithExternalPasskeyForApplicationIdentifier:v13 relyingPartyIdentifier:v14 authenticatorData:v15 signature:v16 userHandle:v17 credentialID:v18];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __149__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithPasskeyAssertionCredential_error_completion___block_invoke;
  v21[3] = &unk_1E5C73300;
  v21[4] = self;
  id v22 = v20;
  id v19 = v20;
  [v11 dismissViewControllerAnimated:1 completion:v21];
}

uint64_t __149__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithPasskeyAssertionCredential_error_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);

  return [v2 _dismiss];
}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithOneTimeCodeCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __144__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithOneTimeCodeCredential_error_completion___block_invoke;
  v29[3] = &unk_1E5C73300;
  id v15 = v12;
  id v31 = v15;
  id v16 = v14;
  uint64_t v30 = v16;
  [v13 dismissViewControllerAnimated:1 completion:v29];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __144__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithOneTimeCodeCredential_error_completion___block_invoke_2;
  v26[3] = &unk_1E5C72238;
  id v17 = v16;
  v27 = v17;
  uint64_t v28 = self;
  v18 = (void (**)(void))MEMORY[0x1AD0C36A0](v26);
  if (v10
    && (id v19 = objc_alloc(MEMORY[0x1E4F98248]),
        [v10 code],
        id v20 = objc_claimAutoreleasedReturnValue(),
        id v21 = (void *)[v19 initWithOneTimeCode:v20],
        v20,
        v21))
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __144__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithOneTimeCodeCredential_error_completion___block_invoke_88;
    v23[3] = &unk_1E5C72CB0;
    v24 = v18;
    [(SFExternalPasswordCredentialServiceViewController *)self _finishRequestToAutoFillCredential:v21 extensionShowedUI:1 error:v11 completion:v23];
  }
  else
  {
    id v22 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A690B000, v22, OS_LOG_TYPE_DEFAULT, "Did not receive any external one time code credential", buf, 2u);
    }
    v18[2](v18);
  }
}

void __144__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithOneTimeCodeCredential_error_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v2);
}

void __144__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithOneTimeCodeCredential_error_completion___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __144__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithOneTimeCodeCredential_error_completion___block_invoke_3;
  block[3] = &unk_1E5C724D8;
  id v1 = *(NSObject **)(a1 + 32);
  void block[4] = *(void *)(a1 + 40);
  dispatch_group_notify(v1, MEMORY[0x1E4F14428], block);
}

uint64_t __144__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithOneTimeCodeCredential_error_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismiss];
}

void __144__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithOneTimeCodeCredential_error_completion___block_invoke_88(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __144__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithOneTimeCodeCredential_error_completion___block_invoke_2_89;
  block[3] = &unk_1E5C72CB0;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __144__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithOneTimeCodeCredential_error_completion___block_invoke_2_89(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A690B000, v2, OS_LOG_TYPE_INFO, "Dismissing external one time code credential service view controller after sending credential", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationServicesAgentProxy, 0);
  objc_storeStrong(&self->_getCredentialCompletion, 0);
  objc_storeStrong((id *)&self->_extensionController, 0);

  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

- (void)_autoFillWithCredentialIdentity:pageID:frameID:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "No credential identity was provided", v2, v3, v4, v5, v6);
}

- (void)_autoFillWithCredentialIdentity:pageID:frameID:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "No credential provider extension available", v2, v3, v4, v5, v6);
}

void __123__SFExternalPasswordCredentialServiceViewController__finishRequestToAutoFillCredential_extensionShowedUI_error_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = a2;
  uint64_t v4 = [v2 user];
  int v5 = 138477827;
  uint8_t v6 = v4;
  _os_log_debug_impl(&dword_1A690B000, v3, OS_LOG_TYPE_DEBUG, "Sending credential with username: %{private}@", (uint8_t *)&v5, 0xCu);
}

- (void)getCredentialForCredentialIdentity:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "The caller is not entitled to read from credential provider extensions", v2, v3, v4, v5, v6);
}

- (void)_finishRequestToReturnCredential:extensionShowedUI:error:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "Failed to finish request to return credential because a completion handler was not available", v2, v3, v4, v5, v6);
}

@end