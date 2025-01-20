@interface _ASCredentialProviderExtensionConfigurationViewController
- (_ASCredentialProviderExtensionConfigurationViewControllerDelegate)delegate;
- (void)_finishWithSuccess:(BOOL)a3 completion:(id)a4;
- (void)_requestDidFailWithError:(id)a3 completion:(id)a4;
- (void)beginConfiguringExtension;
- (void)prepareToCompleteExtensionConfigurationRequestWithHost:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation _ASCredentialProviderExtensionConfigurationViewController

- (void)beginConfiguringExtension
{
}

- (void)_requestDidFailWithError:(id)a3 completion:(id)a4
{
}

- (void)_finishWithSuccess:(BOOL)a3 completion:(id)a4
{
  if (a4) {
    id v5 = a4;
  }
  else {
    id v5 = &__block_literal_global_3;
  }
  v7 = (void (**)(void))MEMORY[0x21D484070](v5, a2, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained credentialProviderExtensionConfigurationViewControllerDidFinish:self completion:v7];
  }
  else {
    v7[2]();
  }
}

- (void)prepareToCompleteExtensionConfigurationRequestWithHost:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __127___ASCredentialProviderExtensionConfigurationViewController_prepareToCompleteExtensionConfigurationRequestWithHost_completion___block_invoke;
  v7[3] = &unk_264395C60;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

- (_ASCredentialProviderExtensionConfigurationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_ASCredentialProviderExtensionConfigurationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end