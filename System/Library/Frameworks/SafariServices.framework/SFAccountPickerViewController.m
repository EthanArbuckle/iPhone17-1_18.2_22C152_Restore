@interface SFAccountPickerViewController
- (LAContext)authenticatedContext;
- (NSString)searchQuery;
- (SFAccountPickerViewController)initWithConfiguration:(id)a3 completionHandler:(id)a4;
- (SFAccountPickerViewControllerSystemAutoFillDelegate)systemAutoFillDelegate;
- (void)_callCompletionHandlerIfNeeded:(id)a3;
- (void)_dismiss;
- (void)_dismissWithAnimation:(BOOL)a3 accounts:(id)a4;
- (void)_viewControllerDismissalTransitionDidEnd:(id)a3;
- (void)accountPickerTableViewController:(id)a3 didPickSavedAccounts:(id)a4;
- (void)accountPickerTableViewController:(id)a3 fillPasswordForSavedAccount:(id)a4;
- (void)accountPickerTableViewController:(id)a3 fillUsernameForSavedAccount:(id)a4;
- (void)accountPickerTableViewController:(id)a3 fillVerificationCode:(id)a4;
- (void)accountPickerTableViewController:(id)a3 fillVerificationCodeForSavedAccount:(id)a4;
- (void)accountPickerTableViewControllerDidCancel:(id)a3;
- (void)buildMenuWithBuilder:(id)a3;
- (void)setAuthenticatedContext:(id)a3;
- (void)setSearchQuery:(id)a3;
- (void)setSystemAutoFillDelegate:(id)a3;
@end

@implementation SFAccountPickerViewController

- (SFAccountPickerViewController)initWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SFAccountPickerViewController;
  v8 = [(SFAccountPickerViewController *)&v24 initWithNibName:0 bundle:0];
  if (v8)
  {
    objc_initWeak(&location, v8);
    uint64_t v9 = MEMORY[0x1AD0C36A0](v7);
    id completionHandler = v8->_completionHandler;
    v8->_id completionHandler = (id)v9;

    v11 = [[_SFAccountPickerTableViewController alloc] initWithConfiguration:v6];
    accountPickerTableViewController = v8->_accountPickerTableViewController;
    v8->_accountPickerTableViewController = v11;

    [(_SFAccountPickerTableViewController *)v8->_accountPickerTableViewController setDelegate:v8];
    [(SFAccountPickerViewController *)v8 pushViewController:v8->_accountPickerTableViewController animated:0];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __73__SFAccountPickerViewController_initWithConfiguration_completionHandler___block_invoke;
    v21[3] = &unk_1E5C725B8;
    objc_copyWeak(&v22, &location);
    [(SFAccountPickerViewController *)v8 _as_setApplicationBackgroundBlock:v21];
    v13 = (void *)MEMORY[0x1E4F18B10];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73__SFAccountPickerViewController_initWithConfiguration_completionHandler___block_invoke_2;
    v19[3] = &unk_1E5C725B8;
    objc_copyWeak(&v20, &location);
    uint64_t v14 = [v13 callObserverWithBlock:v19];
    callObserver = v8->_callObserver;
    v8->_callObserver = (_ASIncomingCallObserver *)v14;

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v8 selector:sel__viewControllerDismissalTransitionDidEnd_ name:*MEMORY[0x1E4FB2E60] object:0];

    v17 = v8;
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __73__SFAccountPickerViewController_initWithConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismiss];
}

void __73__SFAccountPickerViewController_initWithConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismiss];
}

- (void)_dismiss
{
}

- (void)_callCompletionHandlerIfNeeded:(id)a3
{
  id completionHandler = (void (**)(id, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, a3);
    id v5 = self->_completionHandler;
    self->_id completionHandler = 0;
  }
}

- (void)_viewControllerDismissalTransitionDidEnd:(id)a3
{
  if (!self->_isDismissingSelf
    && [(SFAccountPickerViewController *)self _sf_isPresentationControllerDismissalTransitionDidEndNotification:a3])
  {
    [(SFAccountPickerViewController *)self _callCompletionHandlerIfNeeded:0];
  }
}

- (void)_dismissWithAnimation:(BOOL)a3 accounts:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  self->_isDismissingSelf = 1;
  id v7 = [(SFAccountPickerViewController *)self presentingViewController];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__SFAccountPickerViewController__dismissWithAnimation_accounts___block_invoke;
  v9[3] = &unk_1E5C72238;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 dismissViewControllerAnimated:v4 completion:v9];
}

uint64_t __64__SFAccountPickerViewController__dismissWithAnimation_accounts___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callCompletionHandlerIfNeeded:*(void *)(a1 + 40)];
}

- (void)buildMenuWithBuilder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFAccountPickerViewController;
  id v3 = a3;
  [(SFAccountPickerViewController *)&v4 buildMenuWithBuilder:v3];
  objc_msgSend(v3, "replaceChildrenOfMenuForIdentifier:fromChildrenBlock:", *MEMORY[0x1E4FB2C98], &__block_literal_global_56, v4.receiver, v4.super_class);
}

uint64_t __54__SFAccountPickerViewController_buildMenuWithBuilder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_filterObjectsUsingBlock:", &__block_literal_global_10_0);
}

BOOL __54__SFAccountPickerViewController_buildMenuWithBuilder___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = (objc_opt_respondsToSelector() & 1) != 0 && [v2 action] == (void)sel_captureTextFromCamera_;

  return v3;
}

- (void)accountPickerTableViewControllerDidCancel:(id)a3
{
}

- (void)accountPickerTableViewController:(id)a3 didPickSavedAccounts:(id)a4
{
}

- (void)accountPickerTableViewController:(id)a3 fillUsernameForSavedAccount:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemAutoFillDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountPickerViewController:self fillUsernameForSavedAccount:v6];
  }
}

- (void)accountPickerTableViewController:(id)a3 fillPasswordForSavedAccount:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemAutoFillDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountPickerViewController:self fillPasswordForSavedAccount:v6];
  }
}

- (void)accountPickerTableViewController:(id)a3 fillVerificationCodeForSavedAccount:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemAutoFillDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountPickerViewController:self fillVerificationCodeForSavedAccount:v6];
  }
}

- (void)accountPickerTableViewController:(id)a3 fillVerificationCode:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemAutoFillDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountPickerViewController:self fillVerificationCode:v6];
  }
}

- (LAContext)authenticatedContext
{
  return [(_SFAccountPickerTableViewController *)self->_accountPickerTableViewController authenticatedContext];
}

- (void)setAuthenticatedContext:(id)a3
{
}

- (void)setSearchQuery:(id)a3
{
}

- (NSString)searchQuery
{
  return [(_SFAccountTableViewController *)self->_accountPickerTableViewController searchQuery];
}

- (SFAccountPickerViewControllerSystemAutoFillDelegate)systemAutoFillDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemAutoFillDelegate);

  return (SFAccountPickerViewControllerSystemAutoFillDelegate *)WeakRetained;
}

- (void)setSystemAutoFillDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_systemAutoFillDelegate);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_accountPickerTableViewController, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end