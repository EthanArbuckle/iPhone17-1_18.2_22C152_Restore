@interface HACCMenuModuleViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)accessibilityPerformEscape;
- (HACCContentModuleDelegate)delegate;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation HACCMenuModuleViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73__HACCMenuModuleViewController_dismissViewControllerAnimated_completion___block_invoke;
  v9[3] = &unk_2647CDB10;
  v9[4] = self;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)HACCMenuModuleViewController;
  id v7 = v6;
  [(HACCMenuModuleViewController *)&v8 dismissViewControllerAnimated:v4 completion:v9];
}

uint64_t __73__HACCMenuModuleViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 viewController:0 didExpand:0];

  v3 = [*(id *)(a1 + 32) delegate];
  [v3 updateView];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

- (HACCContentModuleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HACCContentModuleDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end