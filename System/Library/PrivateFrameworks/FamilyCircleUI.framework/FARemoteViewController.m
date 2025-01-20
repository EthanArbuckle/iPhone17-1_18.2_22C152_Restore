@interface FARemoteViewController
+ (id)exportedInterface;
+ (id)requestViewControllerWithCompletion:(id)a3;
+ (id)serviceViewControllerInterface;
- (FARemoteViewControllerDelegate)delegate;
- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (void)_notifyPresentationCompletion;
- (void)dismissAlertProxyWithCompletion:(id)a3;
- (void)dismissWithCompletion:(id)a3;
- (void)operationFinishedWithResponse:(id)a3;
- (void)presentAlertProxyWithCompletion:(id)a3;
- (void)presentWithRUIModalPresentationStyle:(unint64_t)a3 completion:(id)a4;
- (void)replaceModalRUIControllerWithStyle:(unint64_t)a3 byController:(unint64_t)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)startFlowWithContext:(id)a3 viewController:(id)a4 completion:(id)a5;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation FARemoteViewController

+ (id)requestViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F3BE28];
  uint64_t v6 = *MEMORY[0x263F3BE20];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__FARemoteViewController_requestViewControllerWithCompletion___block_invoke;
  v10[3] = &unk_264349DD8;
  id v11 = v4;
  id v7 = v4;
  v8 = [a1 requestViewController:v5 fromServiceWithBundleIdentifier:v6 connectionHandler:v10];

  return v8;
}

uint64_t __62__FARemoteViewController_requestViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startFlowWithContext:(id)a3 viewController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = _Block_copy(a5);
  id completion = self->_completion;
  self->_id completion = v10;

  objc_storeWeak((id *)&self->_hostViewController, v9);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__FARemoteViewController_startFlowWithContext_viewController_completion___block_invoke;
  aBlock[3] = &unk_2643489F8;
  aBlock[4] = self;
  v12 = _Block_copy(aBlock);
  id presentationCompletion = self->_presentationCompletion;
  self->_id presentationCompletion = v12;

  if ([v8 activityIndicatorStyle] == 1) {
    [(FARemoteViewController *)self presentWithRUIModalPresentationStyle:0 completion:&__block_literal_global_13];
  }
  v14 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v14 startFlowWithContext:v8];
}

void __73__FARemoteViewController_startFlowWithContext_viewController_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 remoteViewControllerDidStartFlow:*(void *)(a1 + 32)];
}

- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v7 = (objc_class *)MEMORY[0x263F63798];
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[[v7 alloc] initWithPresentedViewController:v9 presentingViewController:v8 modalPresentationStyle:self->_ruiPresentationStyle];

  return v10;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  if (([(FARemoteViewController *)self isBeingDismissed] & 1) == 0)
  {
    uint64_t v5 = [(FARemoteViewController *)self presentingViewController];
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F3BEF0]) initWithLoadSuccess:v4 == 0 error:v4 userInfo:0];

  [(FARemoteViewController *)self operationFinishedWithResponse:v6];
  id presentationCompletion = self->_presentationCompletion;
  self->_id presentationCompletion = 0;
}

- (void)_notifyPresentationCompletion
{
  id presentationCompletion = (void (**)(id, SEL))self->_presentationCompletion;
  if (presentationCompletion)
  {
    presentationCompletion[2](presentationCompletion, a2);
    id v4 = self->_presentationCompletion;
    self->_id presentationCompletion = 0;
  }
}

- (void)presentWithRUIModalPresentationStyle:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(FARemoteViewController *)self presentingViewController];

  if (!v7)
  {
    self->_ruiPresentationStyle = a3;
    [(FARemoteViewController *)self setModalPresentationStyle:4];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __74__FARemoteViewController_presentWithRUIModalPresentationStyle_completion___block_invoke;
    v9[3] = &unk_264349070;
    v9[4] = self;
    id v10 = v6;
    [WeakRetained presentViewController:self animated:1 completion:v9];
  }
}

uint64_t __74__FARemoteViewController_presentWithRUIModalPresentationStyle_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _notifyPresentationCompletion];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)replaceModalRUIControllerWithStyle:(unint64_t)a3 byController:(unint64_t)a4 completion:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __85__FARemoteViewController_replaceModalRUIControllerWithStyle_byController_completion___block_invoke;
  v9[3] = &unk_264349E00;
  v9[4] = self;
  id v10 = v7;
  unint64_t v11 = a4;
  id v8 = v7;
  [(FARemoteViewController *)self dismissViewControllerAnimated:1 completion:v9];
}

uint64_t __85__FARemoteViewController_replaceModalRUIControllerWithStyle_byController_completion___block_invoke(void *a1)
{
  (*(void (**)(void))(a1[5] + 16))();
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[6];
  return [v2 presentWithRUIModalPresentationStyle:v3 completion:&__block_literal_global_4];
}

- (void)operationFinishedWithResponse:(id)a3
{
  id completion = (void (**)(id, id))self->_completion;
  if (completion)
  {
    completion[2](completion, a3);
    id v5 = self->_completion;
    self->_id completion = 0;
  }
}

- (void)presentAlertProxyWithCompletion:(id)a3
{
  id v5 = (void (**)(void))a3;
  [(FARemoteViewController *)self setModalPresentationStyle:6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  [WeakRetained presentViewController:self animated:0 completion:0];

  v5[2]();
}

- (void)dismissAlertProxyWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__FARemoteViewController_dismissAlertProxyWithCompletion___block_invoke;
  v6[3] = &unk_264349070;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(FARemoteViewController *)self dismissViewControllerAnimated:1 completion:v6];
}

uint64_t __58__FARemoteViewController_dismissAlertProxyWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F3BEF0]) initWithLoadSuccess:1 error:0 userInfo:0];
  [v2 operationFinishedWithResponse:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)dismissWithCompletion:(id)a3
{
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CA80358];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CA80790];
}

- (FARemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FARemoteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_hostViewController);
  objc_storeStrong(&self->_presentationCompletion, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end