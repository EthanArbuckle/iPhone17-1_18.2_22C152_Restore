@interface _ASAccountAuthenticationModificationRemoteViewController
+ (id)exportedInterface;
+ (id)requestViewControllerWithConnectionHandler:(id)a3;
+ (id)serviceViewControllerInterface;
- (_ASAccountAuthenticationModificationRemoteViewControllerDelegate)delegate;
- (void)dismissAccountModificationRemoteViewController;
- (void)presentAccountModificationRemoteViewController;
- (void)requestDidFailWithError:(id)a3 completion:(id)a4;
- (void)requestDidFinishWithCredential:(id)a3 userInfo:(id)a4 completion:(id)a5;
- (void)requestToUpgradeToSignInWithAppleDidFinishWithUserInfo:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)updateCredential:(id)a3 forServiceIdentifier:(id)a4 userInfo:(id)a5 extension:(id)a6;
- (void)upgradeCredentialToSignInWithApple:(id)a3 forServiceIdentifier:(id)a4 userInfo:(id)a5 extension:(id)a6;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation _ASAccountAuthenticationModificationRemoteViewController

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() requestViewController:@"ASAccountAuthenticationModificationServiceViewController" fromServiceWithBundleIdentifier:@"com.apple.SafariViewService" connectionHandler:v3];

  return v4;
}

- (void)upgradeCredentialToSignInWithApple:(id)a3 forServiceIdentifier:(id)a4 userInfo:(id)a5 extension:(id)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [a6 _plugIn];
  id v15 = [v13 uuid];

  v14 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v14 upgradeCredentialToSignInWithApple:v12 forServiceIdentifier:v11 userInfo:v10 extensionUUID:v15];
}

- (void)updateCredential:(id)a3 forServiceIdentifier:(id)a4 userInfo:(id)a5 extension:(id)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [a6 _plugIn];
  id v15 = [v13 uuid];

  v14 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v14 updateCredential:v12 forServiceIdentifier:v11 userInfo:v10 extensionUUID:v15];
}

- (void)requestToUpgradeToSignInWithAppleDidFinishWithUserInfo:(id)a3 completion:(id)a4
{
  id v8 = a3;
  v6 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountModificationRemoteViewControllerDidFinishUpgradeToSignInWithApple:self userInfo:v8 completion:v6];
  }
  else {
    v6[2](v6);
  }
}

- (void)requestDidFinishWithCredential:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  v9 = (void (**)(void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountModificationRemoteViewController:self didFinishWithCredential:v11 userInfo:v8 completion:v9];
  }
  else {
    v9[2](v9);
  }
}

- (void)requestDidFailWithError:(id)a3 completion:(id)a4
{
  id v8 = a3;
  v6 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountModificationRemoteViewController:self requestCanceledWithError:v8 completion:v6];
  }
  else {
    v6[2](v6);
  }
}

- (void)presentAccountModificationRemoteViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained presentAccountModificationRemoteViewController:self];
  }
}

- (void)dismissAccountModificationRemoteViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained dismissAccountModificationRemoteViewController:self];
  }
}

+ (id)exportedInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CAB2378];
  id v3 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_requestDidFinishWithCredential_userInfo_completion_ argumentIndex:0 ofReply:0];

  v4 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v4 forSelector:sel_requestDidFailWithError_completion_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)serviceViewControllerInterface
{
  return +[ASAccountAuthenticationModificationServiceViewController _exportedInterface];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountModificationRemoteViewController:self viewServiceDidTerminateWithError:v5];
  }
}

- (_ASAccountAuthenticationModificationRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_ASAccountAuthenticationModificationRemoteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end