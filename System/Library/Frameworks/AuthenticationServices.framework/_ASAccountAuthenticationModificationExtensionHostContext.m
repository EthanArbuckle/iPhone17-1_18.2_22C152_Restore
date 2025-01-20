@interface _ASAccountAuthenticationModificationExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (_ASAccountAuthenticationModificationExtensionHostContextDelegate)delegate;
- (void)dismissRequestUI;
- (void)getSignInWithAppleAuthorizationWithState:(id)a3 nonce:(id)a4 completion:(id)a5;
- (void)prepareToCancelRequestWithError:(id)a3 completion:(id)a4;
- (void)prepareToCompleteRequestWithUpdatedCredential:(id)a3 userInfo:(id)a4 completion:(id)a5;
- (void)prepareToCompleteUpgradeToSignInWithAppleWithUserInfo:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation _ASAccountAuthenticationModificationExtensionHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x263F08D80], "_as_accountModificationHostInterface");
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x263F08D80], "_as_accountModificationExtensionInterface");
}

- (void)getSignInWithAppleAuthorizationWithState:(id)a3 nonce:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void, void *))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained getSignInWithAppleAuthorizationWithState:v12 nonce:v8 completion:v9];
  }
  else
  {
    v11 = [MEMORY[0x263F087E8] errorWithDomain:@"ASExtensionErrorDomain" code:0 userInfo:0];
    v9[2](v9, 0, v11);
  }
}

- (void)prepareToCompleteUpgradeToSignInWithAppleWithUserInfo:(id)a3 completion:(id)a4
{
  id v8 = a3;
  v6 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained prepareToCompleteUpgradeToSignInWithAppleRequestWithHostContext:self userInfo:v8 completion:v6];
  }
  else {
    v6[2](v6);
  }
}

- (void)prepareToCompleteRequestWithUpdatedCredential:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  v9 = (void (**)(void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained prepareToCompleteRequestWithHostContext:self updatedCredential:v11 userInfo:v8 completion:v9];
  }
  else {
    v9[2](v9);
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

- (void)dismissRequestUI
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained dismissRequestUI:self];
  }
}

- (_ASAccountAuthenticationModificationExtensionHostContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_ASAccountAuthenticationModificationExtensionHostContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end