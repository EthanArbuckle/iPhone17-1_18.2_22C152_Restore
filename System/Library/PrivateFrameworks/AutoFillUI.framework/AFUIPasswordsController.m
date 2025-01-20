@interface AFUIPasswordsController
+ (BOOL)isPasswordPickerViewControllerAuthenticating:(id)a3;
- (AFUIPasswordPickerDelegate)passwordPickerDelegate;
- (AFUIPasswordsController)initWithDocumentTraits:(id)a3;
- (id)makePasswordPickerViewController;
- (void)passwordViewController:(id)a3 fillPassword:(id)a4;
- (void)passwordViewController:(id)a3 fillText:(id)a4;
- (void)passwordViewController:(id)a3 fillUsername:(id)a4;
- (void)passwordViewController:(id)a3 fillVerificationCode:(id)a4;
- (void)passwordViewController:(id)a3 selectedCredential:(id)a4;
- (void)passwordViewControllerDidFinish:(id)a3;
- (void)presentPasswordPickerFromViewController:(id)a3 didFinishAuthenticationBlock:(id)a4;
- (void)setPasswordPickerDelegate:(id)a3;
@end

@implementation AFUIPasswordsController

- (AFUIPasswordsController)initWithDocumentTraits:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AFUIPasswordsController;
  v5 = [(AFUIPasswordsController *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    documentTraits = v5->_documentTraits;
    v5->_documentTraits = (RTIDocumentTraits *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)makePasswordPickerViewController
{
  v3 = (void *)[objc_alloc((Class)get_SFAppAutoFillPasswordViewControllerClass()) init];
  [v3 setDelegate:self];
  id v4 = [(RTIDocumentTraits *)self->_documentTraits appId];
  [v3 setRemoteAppID:v4];

  v5 = [(RTIDocumentTraits *)self->_documentTraits localizedAppName];
  [v3 setRemoteLocalizedAppName:v5];

  uint64_t v6 = [(RTIDocumentTraits *)self->_documentTraits appName];
  [v3 setRemoteUnlocalizedAppName:v6];

  v7 = [(RTIDocumentTraits *)self->_documentTraits associatedDomains];
  [v3 setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:v7];

  v8 = [(RTIDocumentTraits *)self->_documentTraits autofillContext];
  v9 = [v8 objectForKeyedSubscript:@"_WebViewURL"];

  [v3 setWebViewURL:v9];
  objc_super v10 = [(RTIDocumentTraits *)self->_documentTraits autofillContext];
  v11 = [v10 objectForKeyedSubscript:@"_page_id"];

  v12 = [(RTIDocumentTraits *)self->_documentTraits autofillContext];
  v13 = [v12 objectForKeyedSubscript:@"_frame_id"];

  v14 = [(RTIDocumentTraits *)self->_documentTraits autofillContext];
  v15 = [v14 objectForKeyedSubscript:@"_credential_type"];

  [v3 setPageID:v11 frameID:v13 credentialType:v15];
  [v3 setSystemAutoFillDocumentTraits:self->_documentTraits];

  return v3;
}

- (void)presentPasswordPickerFromViewController:(id)a3 didFinishAuthenticationBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(AFUIPasswordsController *)self makePasswordPickerViewController];
  [v8 setModalPresentationStyle:4];
  BOOL v9 = [(AFUIPasswordsController *)self _shouldPresentAllPasswordsViewInPopover];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __96__AFUIPasswordsController_presentPasswordPickerFromViewController_didFinishAuthenticationBlock___block_invoke;
  v13[3] = &unk_2652493D0;
  id v15 = v8;
  id v16 = v7;
  id v14 = v6;
  id v10 = v8;
  id v11 = v6;
  id v12 = v7;
  [v10 authenticateToPresentInPopover:v9 completion:v13];
}

uint64_t __96__AFUIPasswordsController_presentPasswordPickerFromViewController_didFinishAuthenticationBlock___block_invoke(void *a1, int a2)
{
  uint64_t result = a1[6];
  if (result) {
    uint64_t result = (*(uint64_t (**)(void))(result + 16))();
  }
  if (a2)
  {
    v5 = (void *)a1[4];
    uint64_t v6 = a1[5];
    return [v5 presentViewController:v6 animated:0 completion:0];
  }
  return result;
}

+ (BOOL)isPasswordPickerViewControllerAuthenticating:(id)a3
{
  id v3 = a3;
  get_SFAppAutoFillPasswordViewControllerClass();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 presentedViewController];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)passwordViewControllerDidFinish:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passwordPickerDelegate);
  [WeakRetained passwordsControllerDidFinish:self];
}

- (void)passwordViewController:(id)a3 selectedCredential:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passwordPickerDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained passwordsController:self selectedCredential:v6];
  }
}

- (void)passwordViewController:(id)a3 fillUsername:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passwordPickerDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained passwordsController:self fillUsername:v6];
  }
}

- (void)passwordViewController:(id)a3 fillPassword:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passwordPickerDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained passwordsController:self fillPassword:v6];
  }
}

- (void)passwordViewController:(id)a3 fillVerificationCode:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passwordPickerDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained passwordsController:self fillVerificationCode:v6];
  }
}

- (void)passwordViewController:(id)a3 fillText:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passwordPickerDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained passwordsController:self fillText:v6];
  }
}

- (AFUIPasswordPickerDelegate)passwordPickerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passwordPickerDelegate);

  return (AFUIPasswordPickerDelegate *)WeakRetained;
}

- (void)setPasswordPickerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_passwordPickerDelegate);

  objc_storeStrong((id *)&self->_documentTraits, 0);
}

@end