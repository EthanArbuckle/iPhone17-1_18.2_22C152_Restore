@interface _ASCredentialAuthenticationViewController
- (_ASCredentialAuthenticationViewController)initWithExtension:(id)a3 credentialIdentity:(id)a4;
- (_ASCredentialAuthenticationViewController)initWithExtension:(id)a3 oneTimeCodeCredentialRequest:(id)a4;
- (_ASCredentialAuthenticationViewController)initWithExtension:(id)a3 passkeyAssertionRequest:(id)a4;
- (_ASCredentialAuthenticationViewController)initWithExtension:(id)a3 passkeyRegistrationRequest:(id)a4 forConditionalRegistration:(BOOL)a5;
- (_ASCredentialAuthenticationViewControllerDelegate)delegate;
- (void)_finishWithCredential:(id)a3 error:(id)a4 completion:(id)a5;
- (void)_finishWithOneTimeCodeCredential:(id)a3 error:(id)a4 completion:(id)a5;
- (void)_finishWithPasskeyAssertionCredential:(id)a3 error:(id)a4 completion:(id)a5;
- (void)_finishWithPasskeyRegistrationCredential:(id)a3 error:(id)a4 completion:(id)a5;
- (void)_nonUIRequestDidRequireUserInteraction;
- (void)_requestDidFailWithError:(id)a3 completion:(id)a4;
- (void)prepareToCompleteOneTimeCodeRequestWithHostContext:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)prepareToCompleteRequestWithHostContext:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)prepareToCompleteRequestWithHostContext:(id)a3 passkeyAssertionCredential:(id)a4 completion:(id)a5;
- (void)prepareToCompleteRequestWithHostContext:(id)a3 passkeyRegistrationCredential:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation _ASCredentialAuthenticationViewController

- (_ASCredentialAuthenticationViewController)initWithExtension:(id)a3 passkeyAssertionRequest:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_ASCredentialAuthenticationViewController;
  v7 = [(_ASExtensionViewController *)&v15 initWithExtension:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    credentialRequest = v7->_credentialRequest;
    v7->_credentialRequest = (ASCredentialRequest *)v8;

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __87___ASCredentialAuthenticationViewController_initWithExtension_passkeyAssertionRequest___block_invoke;
    v13[3] = &unk_264395B78;
    v10 = v7;
    v14 = v10;
    [(_ASExtensionViewController *)v10 _beginNonUIRequest:1 connectionHandler:v13];
    v11 = v10;
  }
  return v7;
}

- (_ASCredentialAuthenticationViewController)initWithExtension:(id)a3 passkeyRegistrationRequest:(id)a4 forConditionalRegistration:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_ASCredentialAuthenticationViewController;
  v9 = [(_ASExtensionViewController *)&v19 initWithExtension:a3];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    credentialRequest = v9->_credentialRequest;
    v9->_credentialRequest = (ASCredentialRequest *)v10;

    if (v5)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __117___ASCredentialAuthenticationViewController_initWithExtension_passkeyRegistrationRequest_forConditionalRegistration___block_invoke;
      v17[3] = &unk_264395B78;
      v12 = &v18;
      id v18 = v8;
      [(_ASExtensionViewController *)v9 _beginNonUIRequest:0 connectionHandler:v17];
    }
    else
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __117___ASCredentialAuthenticationViewController_initWithExtension_passkeyRegistrationRequest_forConditionalRegistration___block_invoke_2;
      v15[3] = &unk_264395B78;
      v12 = (id *)&v16;
      v16 = v9;
      [(_ASExtensionViewController *)v16 _beginRequestWithConnectionHandler:v15];
    }
    v13 = v9;
  }
  return v9;
}

- (_ASCredentialAuthenticationViewController)initWithExtension:(id)a3 credentialIdentity:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_ASCredentialAuthenticationViewController;
  v7 = [(_ASExtensionViewController *)&v16 initWithExtension:a3];
  if (v7)
  {
    uint64_t v8 = +[ASPasswordCredentialRequest requestWithCredentialIdentity:v6];
    credentialRequest = v7->_credentialRequest;
    v7->_credentialRequest = (ASCredentialRequest *)v8;

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __82___ASCredentialAuthenticationViewController_initWithExtension_credentialIdentity___block_invoke;
    v13[3] = &unk_264395BA0;
    id v14 = v6;
    uint64_t v10 = v7;
    objc_super v15 = v10;
    [(_ASExtensionViewController *)v10 _beginNonUIRequest:1 connectionHandler:v13];
    v11 = v10;
  }
  return v7;
}

- (_ASCredentialAuthenticationViewController)initWithExtension:(id)a3 oneTimeCodeCredentialRequest:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_ASCredentialAuthenticationViewController;
  uint64_t v8 = [(_ASExtensionViewController *)&v14 initWithExtension:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_credentialRequest, a4);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __92___ASCredentialAuthenticationViewController_initWithExtension_oneTimeCodeCredentialRequest___block_invoke;
    v12[3] = &unk_264395B78;
    id v13 = v7;
    [(_ASExtensionViewController *)v9 _beginNonUIRequest:1 connectionHandler:v12];
    uint64_t v10 = v9;
  }
  return v9;
}

- (void)_nonUIRequestDidRequireUserInteraction
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __83___ASCredentialAuthenticationViewController__nonUIRequestDidRequireUserInteraction__block_invoke;
  v2[3] = &unk_264395B78;
  v2[4] = self;
  [(_ASExtensionViewController *)self _beginRequestWithConnectionHandler:v2];
}

- (void)_finishWithCredential:(id)a3 error:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  if (a5) {
    id v9 = a5;
  }
  else {
    id v9 = &__block_literal_global_6;
  }
  uint64_t v10 = (void (**)(void))MEMORY[0x21D484070](v9);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained credentialAuthenticationViewController:self didFinishWithCredential:v12 error:v8 completion:v10];
  }
  else {
    v10[2](v10);
  }
}

- (void)_finishWithPasskeyAssertionCredential:(id)a3 error:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  if (a5) {
    id v9 = a5;
  }
  else {
    id v9 = &__block_literal_global_8;
  }
  uint64_t v10 = (void (**)(void))MEMORY[0x21D484070](v9);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained credentialAuthenticationViewController:self didFinishWithPasskeyAssertionCredential:v12 error:v8 completion:v10];
  }
  else {
    v10[2](v10);
  }
}

- (void)_finishWithPasskeyRegistrationCredential:(id)a3 error:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  if (a5) {
    id v9 = a5;
  }
  else {
    id v9 = &__block_literal_global_12;
  }
  uint64_t v10 = (void (**)(void))MEMORY[0x21D484070](v9);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained credentialAuthenticationViewController:self didFinishWithPasskeyRegistrationCredential:v12 error:v8 completion:v10];
  }
  else {
    v10[2](v10);
  }
}

- (void)_finishWithOneTimeCodeCredential:(id)a3 error:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  if (a5) {
    id v9 = a5;
  }
  else {
    id v9 = &__block_literal_global_16;
  }
  uint64_t v10 = (void (**)(void))MEMORY[0x21D484070](v9);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained credentialAuthenticationViewController:self didFinishWithOneTimeCodeCredential:v12 error:v8 completion:v10];
  }
  else {
    v10[2](v10);
  }
}

- (void)_requestDidFailWithError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend(v6, "safari_matchesErrorDomain:andCode:", @"ASExtensionErrorDomain", 101))
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21918F000, v8, OS_LOG_TYPE_DEFAULT, "Extension did not find a credential corresponding the identity. Invalidating the identity store.", buf, 2u);
    }
    id v9 = [(_ASExtensionViewController *)self extension];
    uint64_t v10 = objc_msgSend(v9, "sf_bundleIdentifierForContainingApp");

    id v11 = objc_alloc_init(MEMORY[0x263F66560]);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __81___ASCredentialAuthenticationViewController__requestDidFailWithError_completion___block_invoke;
    v13[3] = &unk_264395BC8;
    id v14 = v11;
    id v12 = v11;
    [v12 removeCredentialIdentityStoreForApplication:v10 completion:v13];
  }
  [(_ASCredentialAuthenticationViewController *)self _finishWithCredential:0 error:v6 completion:v7];
}

- (void)prepareToCompleteRequestWithHostContext:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __107___ASCredentialAuthenticationViewController_prepareToCompleteRequestWithHostContext_credential_completion___block_invoke;
  block[3] = &unk_2643954E0;
  block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)prepareToCompleteRequestWithHostContext:(id)a3 passkeyAssertionCredential:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __123___ASCredentialAuthenticationViewController_prepareToCompleteRequestWithHostContext_passkeyAssertionCredential_completion___block_invoke;
  block[3] = &unk_2643954E0;
  block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)prepareToCompleteRequestWithHostContext:(id)a3 passkeyRegistrationCredential:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __126___ASCredentialAuthenticationViewController_prepareToCompleteRequestWithHostContext_passkeyRegistrationCredential_completion___block_invoke;
  block[3] = &unk_2643954E0;
  block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)prepareToCompleteOneTimeCodeRequestWithHostContext:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __118___ASCredentialAuthenticationViewController_prepareToCompleteOneTimeCodeRequestWithHostContext_credential_completion___block_invoke;
  block[3] = &unk_2643954E0;
  block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (_ASCredentialAuthenticationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_ASCredentialAuthenticationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_credentialRequest, 0);
}

@end