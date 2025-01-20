@interface _ASCredentialProviderExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (_ASCredentialProviderExtensionHostContextDelegate)delegate;
- (void)prepareToCancelRequestWithError:(id)a3 completion:(id)a4;
- (void)prepareToCompleteAssertionRequestWithSelectedPasskeyCredential:(id)a3 completion:(id)a4;
- (void)prepareToCompleteExtensionConfigurationRequestWithCompletion:(id)a3;
- (void)prepareToCompleteOneTimeCodeRequestWithSelectedCredential:(id)a3 completion:(id)a4;
- (void)prepareToCompleteRegistrationRequestWithSelectedPasskeyCredential:(id)a3 completion:(id)a4;
- (void)prepareToCompleteRequestWithSelectedCredential:(id)a3 completion:(id)a4;
- (void)prepareToCompleteRequestWithSelectedText:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation _ASCredentialProviderExtensionHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x263F08D80], "_as_credentialProviderHostInterface");
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x263F08D80], "_as_credentialProviderExtensionInterface");
}

- (void)prepareToCompleteRequestWithSelectedCredential:(id)a3 completion:(id)a4
{
  id v8 = a3;
  v6 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained prepareToCompleteRequestWithHostContext:self credential:v8 completion:v6];
  }
  else {
    v6[2](v6);
  }
}

- (void)prepareToCompleteAssertionRequestWithSelectedPasskeyCredential:(id)a3 completion:(id)a4
{
  id v8 = a3;
  v6 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained prepareToCompleteRequestWithHostContext:self passkeyAssertionCredential:v8 completion:v6];
  }
  else {
    v6[2](v6);
  }
}

- (void)prepareToCompleteRegistrationRequestWithSelectedPasskeyCredential:(id)a3 completion:(id)a4
{
  id v8 = a3;
  v6 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained prepareToCompleteRequestWithHostContext:self passkeyRegistrationCredential:v8 completion:v6];
  }
  else {
    v6[2](v6);
  }
}

- (void)prepareToCompleteOneTimeCodeRequestWithSelectedCredential:(id)a3 completion:(id)a4
{
  id v8 = a3;
  v6 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained prepareToCompleteOneTimeCodeRequestWithHostContext:self credential:v8 completion:v6];
  }
  else {
    v6[2](v6);
  }
}

- (void)prepareToCompleteRequestWithSelectedText:(id)a3 completion:(id)a4
{
  id v8 = a3;
  v6 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained prepareToCompleteSelectionRequestWithHostContext:self text:v8 completion:v6];
  }
  else {
    v6[2](v6);
  }
}

- (void)prepareToCancelRequestWithError:(id)a3 completion:(id)a4
{
  id v8 = a3;
  v6 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained prepareToCancelRequestWithHostContext:self error:v8 completion:v6];
  }
  else {
    v6[2](v6);
  }
}

- (void)prepareToCompleteExtensionConfigurationRequestWithCompletion:(id)a3
{
  p_delegate = &self->_delegate;
  v5 = (void (**)(void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained prepareToCompleteExtensionConfigurationRequestWithHost:self completion:v5];
  }
  else {
    v5[2](v5);
  }
}

- (_ASCredentialProviderExtensionHostContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_ASCredentialProviderExtensionHostContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end