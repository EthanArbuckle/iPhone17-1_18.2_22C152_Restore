@interface _ASCredentialListViewController
- (_ASCredentialListViewController)initWithExtension:(id)a3 serviceIdentifiers:(id)a4 requestParameters:(id)a5;
- (_ASCredentialListViewControllerDelegate)delegate;
- (id)initForTextSelectingWithExtension:(id)a3 serviceIdentifiers:(id)a4;
- (id)initOneTimeCodeCredentialListWithExtension:(id)a3 serviceIdentifiers:(id)a4;
- (void)_finishWithCredential:(id)a3 completion:(id)a4;
- (void)_requestDidFailWithError:(id)a3 completion:(id)a4;
- (void)prepareToCompleteOneTimeCodeRequestWithHostContext:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)prepareToCompleteRequestWithHostContext:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)prepareToCompleteRequestWithHostContext:(id)a3 passkeyAssertionCredential:(id)a4 completion:(id)a5;
- (void)prepareToCompleteSelectionRequestWithHostContext:(id)a3 text:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation _ASCredentialListViewController

- (_ASCredentialListViewController)initWithExtension:(id)a3 serviceIdentifiers:(id)a4 requestParameters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)_ASCredentialListViewController;
  v11 = [(_ASExtensionViewController *)&v28 initWithExtension:v8];
  if (v11)
  {
    objc_initWeak(&location, v11);
    v12 = (void *)[v9 copy];

    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __90___ASCredentialListViewController_initWithExtension_serviceIdentifiers_requestParameters___block_invoke;
    v25[3] = &unk_264395360;
    objc_copyWeak(&v26, &location);
    v13 = (void *)MEMORY[0x21D484070](v25);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __90___ASCredentialListViewController_initWithExtension_serviceIdentifiers_requestParameters___block_invoke_3;
    v21[3] = &unk_264395BF0;
    id v22 = v10;
    id v9 = v12;
    id v23 = v9;
    id v14 = v13;
    id v24 = v14;
    [(_ASExtensionViewController *)v11 _beginRequestWithConnectionHandler:v21];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __90___ASCredentialListViewController_initWithExtension_serviceIdentifiers_requestParameters___block_invoke_4;
    v19[3] = &unk_264395360;
    objc_copyWeak(&v20, &location);
    uint64_t v15 = +[_ASIncomingCallObserver callObserverWithBlock:v19];
    callObserver = v11->_callObserver;
    v11->_callObserver = (_ASIncomingCallObserver *)v15;

    v17 = v11;
    objc_destroyWeak(&v20);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (id)initOneTimeCodeCredentialListWithExtension:(id)a3 serviceIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_ASCredentialListViewController;
  id v8 = [(_ASExtensionViewController *)&v19 initWithExtension:v6];
  if (v8)
  {
    objc_initWeak(&location, v8);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __97___ASCredentialListViewController_initOneTimeCodeCredentialListWithExtension_serviceIdentifiers___block_invoke;
    v15[3] = &unk_264395C18;
    id v16 = v7;
    objc_copyWeak(&v17, &location);
    [(_ASExtensionViewController *)v8 _beginRequestWithConnectionHandler:v15];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __97___ASCredentialListViewController_initOneTimeCodeCredentialListWithExtension_serviceIdentifiers___block_invoke_4;
    v13[3] = &unk_264395360;
    objc_copyWeak(&v14, &location);
    uint64_t v9 = +[_ASIncomingCallObserver callObserverWithBlock:v13];
    callObserver = v8->_callObserver;
    v8->_callObserver = (_ASIncomingCallObserver *)v9;

    v11 = v8;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }

  return v8;
}

- (id)initForTextSelectingWithExtension:(id)a3 serviceIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_ASCredentialListViewController;
  id v8 = [(_ASExtensionViewController *)&v17 initWithExtension:v6];
  uint64_t v9 = v8;
  if (v8)
  {
    [(_ASExtensionViewController *)v8 _beginRequestWithConnectionHandler:&__block_literal_global_7];
    objc_initWeak(&location, v9);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __88___ASCredentialListViewController_initForTextSelectingWithExtension_serviceIdentifiers___block_invoke_2;
    v14[3] = &unk_264395360;
    objc_copyWeak(&v15, &location);
    uint64_t v10 = +[_ASIncomingCallObserver callObserverWithBlock:v14];
    callObserver = v9->_callObserver;
    v9->_callObserver = (_ASIncomingCallObserver *)v10;

    v12 = v9;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)_requestDidFailWithError:(id)a3 completion:(id)a4
{
}

- (void)_finishWithCredential:(id)a3 completion:(id)a4
{
  id v9 = a3;
  if (a4) {
    id v6 = a4;
  }
  else {
    id v6 = &__block_literal_global_5;
  }
  id v7 = (void (**)(void))MEMORY[0x21D484070](v6);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained credentialListViewController:self didFinishWithCredential:v9 completion:v7];
  }
  else {
    v7[2](v7);
  }
}

- (void)prepareToCompleteRequestWithHostContext:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97___ASCredentialListViewController_prepareToCompleteRequestWithHostContext_credential_completion___block_invoke;
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
  id v10 = a4;
  if (a5) {
    id v7 = a5;
  }
  else {
    id v7 = &__block_literal_global_9;
  }
  id v8 = (void (**)(void))MEMORY[0x21D484070](v7);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained credentialListViewController:self didFinishWithPasskeyAssertionCredential:v10 completion:v8];
  }
  else {
    v8[2](v8);
  }
}

- (void)prepareToCompleteOneTimeCodeRequestWithHostContext:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v10 = a4;
  if (a5) {
    id v7 = a5;
  }
  else {
    id v7 = &__block_literal_global_13;
  }
  id v8 = (void (**)(void))MEMORY[0x21D484070](v7);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained credentialListViewController:self didFinishWithOneTimeCodeCredential:v10 completion:v8];
  }
  else {
    v8[2](v8);
  }
}

- (void)prepareToCompleteSelectionRequestWithHostContext:(id)a3 text:(id)a4 completion:(id)a5
{
  id v7 = a4;
  if (a5) {
    id v8 = a5;
  }
  else {
    id v8 = &__block_literal_global_17;
  }
  id v9 = (void (**)(void))MEMORY[0x21D484070](v8);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __100___ASCredentialListViewController_prepareToCompleteSelectionRequestWithHostContext_text_completion___block_invoke_2;
    v11[3] = &unk_264395530;
    id v12 = WeakRetained;
    id v13 = self;
    id v14 = v7;
    id v15 = v9;
    dispatch_async(MEMORY[0x263EF83A0], v11);
  }
  else
  {
    v9[2](v9);
  }
}

- (_ASCredentialListViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_ASCredentialListViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_callObserver, 0);
}

@end