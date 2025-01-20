@interface DMCEnrollmentFlowUIPresenterBase
- (DMCActivityViewController)activityController;
- (DMCDismissalAwareNavigationController)navigationController;
- (DMCEnrollmentFlowUIPresenterBase)initWithBaseViewController:(id)a3;
- (DMCPINEntryViewController)pinEntryViewController;
- (UIViewController)baseViewController;
- (id)dismissedCompletionBlock;
- (id)passcodeCompletionHandler;
- (void)dealloc;
- (void)didAcceptEnteredPIN:(id)a3;
- (void)didCancelEnteringPIN;
- (void)dismissWithCompletion:(id)a3;
- (void)presentActivityPageWithText:(id)a3 showButtomView:(BOOL)a4;
- (void)pushViewController:(id)a3;
- (void)pushViewController:(id)a3 foundationViewController:(id)a4;
- (void)requestDevicePasscodeWithDescriptionText:(id)a3 completionHandler:(id)a4;
- (void)setActivityController:(id)a3;
- (void)setBaseViewController:(id)a3;
- (void)setDismissedCompletionBlock:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setPasscodeCompletionHandler:(id)a3;
- (void)setPinEntryViewController:(id)a3;
@end

@implementation DMCEnrollmentFlowUIPresenterBase

- (DMCEnrollmentFlowUIPresenterBase)initWithBaseViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DMCEnrollmentFlowUIPresenterBase;
  v5 = [(DMCEnrollmentFlowUIPresenterBase *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_baseViewController, v4);
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[DMCEnrollmentFlowUIPresenterBase dealloc]";
    _os_log_impl(&dword_221CC5000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)DMCEnrollmentFlowUIPresenterBase;
  [(DMCEnrollmentFlowUIPresenterBase *)&v4 dealloc];
}

- (void)pushViewController:(id)a3
{
}

- (void)pushViewController:(id)a3 foundationViewController:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v7 = [(DMCEnrollmentFlowUIPresenterBase *)self navigationController];
    objc_super v8 = [v7 viewControllers];
    id v6 = [v8 objectAtIndexedSubscript:0];
  }
  v9 = [(DMCEnrollmentFlowUIPresenterBase *)self navigationController];

  if (v9)
  {
    v10 = [(DMCEnrollmentFlowUIPresenterBase *)self navigationController];
    [(UINavigationController *)v10 dmc_popToViewController:v6 pushViewController:v12 animated:1];
  }
  else
  {
    v10 = [[DMCDismissalAwareNavigationController alloc] initWithRootViewController:v12];
    if ([MEMORY[0x263F38B98] isPad]) {
      [(DMCDismissalAwareNavigationController *)v10 setModalPresentationStyle:2];
    }
    [(DMCDismissalAwareNavigationController *)v10 setDismissedCompletionBlock:self->_dismissedCompletionBlock];
    v11 = [(DMCEnrollmentFlowUIPresenterBase *)self baseViewController];
    [v11 presentViewController:v10 animated:1 completion:0];

    [(DMCEnrollmentFlowUIPresenterBase *)self setNavigationController:v10];
  }
}

- (void)setDismissedCompletionBlock:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x223C90320](a3, a2);
  id dismissedCompletionBlock = self->_dismissedCompletionBlock;
  self->_id dismissedCompletionBlock = v4;

  id v6 = [(DMCEnrollmentFlowUIPresenterBase *)self navigationController];
  [v6 setDismissedCompletionBlock:self->_dismissedCompletionBlock];
}

- (void)dismissWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__DMCEnrollmentFlowUIPresenterBase_dismissWithCompletion___block_invoke;
  v6[3] = &unk_2645E9348;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __58__DMCEnrollmentFlowUIPresenterBase_dismissWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  [v2 dismissViewControllerAnimated:1 completion:*(void *)(a1 + 40)];
}

- (void)requestDevicePasscodeWithDescriptionText:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  [(DMCEnrollmentFlowUIPresenterBase *)self setPasscodeCompletionHandler:a4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __95__DMCEnrollmentFlowUIPresenterBase_requestDevicePasscodeWithDescriptionText_completionHandler___block_invoke;
  v8[3] = &unk_2645E92D0;
  id v9 = v6;
  v10 = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __95__DMCEnrollmentFlowUIPresenterBase_requestDevicePasscodeWithDescriptionText_completionHandler___block_invoke(uint64_t a1)
{
  char v2 = [MEMORY[0x263F38B98] isPad];
  v3 = [DMCPINEntryViewController alloc];
  if (v2)
  {
    v13 = [(DMCPINEntryViewController *)v3 initWithStyle:0];
    [(DMCPINEntryViewController *)v13 setDelegate:*(void *)(a1 + 40)];
    [(DevicePINController *)v13 setHidesNavigationButtons:0];
    id v4 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v13];
    [v4 setModalPresentationStyle:2];
    [v4 setModalInPresentation:1];
    id v5 = [*(id *)(a1 + 40) navigationController];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [*(id *)(a1 + 40) baseViewController];
    }
    v11 = v7;

    [v11 presentViewController:v4 animated:1 completion:0];
    id v12 = [(DMCPINEntryViewController *)v13 navigationController];
    [v12 setNavigationBarHidden:0 animated:0];
  }
  else
  {
    v13 = [(DMCPINEntryViewController *)v3 initWithStyle:1];
    [(DMCPINEntryViewController *)v13 setDescriptionText:*(void *)(a1 + 32)];
    [(DMCPINEntryViewController *)v13 setDelegate:*(void *)(a1 + 40)];
    objc_super v8 = [*(id *)(a1 + 40) navigationController];

    id v9 = *(void **)(a1 + 40);
    if (v8)
    {
      v10 = [v9 navigationController];
      [v10 pushViewController:v13 animated:1];
    }
    else
    {
      [v9 pushViewController:v13];
    }
    [*(id *)(a1 + 40) setPinEntryViewController:v13];
  }
}

- (void)presentActivityPageWithText:(id)a3 showButtomView:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [[DMCActivityViewController alloc] initWithActivityText:v6 showBottomView:v4];

  [(DMCEnrollmentFlowUIPresenterBase *)self setActivityController:v7];
  [(DMCEnrollmentFlowUIPresenterBase *)self pushViewController:v7];
}

- (void)didAcceptEnteredPIN:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__DMCEnrollmentFlowUIPresenterBase_didAcceptEnteredPIN___block_invoke;
  block[3] = &unk_2645E90A0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  if ([MEMORY[0x263F38B98] isPad])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__DMCEnrollmentFlowUIPresenterBase_didAcceptEnteredPIN___block_invoke_2;
    v8[3] = &unk_2645E90A0;
    void v8[4] = self;
    id v5 = (void *)MEMORY[0x263EF83A0];
    dispatch_async(MEMORY[0x263EF83A0], v8);
  }
  id v6 = [(DMCEnrollmentFlowUIPresenterBase *)self passcodeCompletionHandler];

  if (v6)
  {
    id v7 = [(DMCEnrollmentFlowUIPresenterBase *)self passcodeCompletionHandler];
    ((void (**)(void, id, void))v7)[2](v7, v4, 0);

    [(DMCEnrollmentFlowUIPresenterBase *)self setPasscodeCompletionHandler:0];
  }
}

uint64_t __56__DMCEnrollmentFlowUIPresenterBase_didAcceptEnteredPIN___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) pinEntryViewController];
  v3 = [v2 view];
  [v3 setUserInteractionEnabled:0];

  id v4 = [*(id *)(a1 + 32) pinEntryViewController];
  [v4 setInProgress:1];

  id v5 = *(void **)(a1 + 32);
  return [v5 setPinEntryViewController:0];
}

void __56__DMCEnrollmentFlowUIPresenterBase_didAcceptEnteredPIN___block_invoke_2(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) navigationController];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) baseViewController];
  }
  id v5 = v4;

  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)didCancelEnteringPIN
{
  if ([MEMORY[0x263F38B98] isPad])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__DMCEnrollmentFlowUIPresenterBase_didCancelEnteringPIN__block_invoke;
    block[3] = &unk_2645E90A0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  v3 = [(DMCEnrollmentFlowUIPresenterBase *)self passcodeCompletionHandler];

  if (v3)
  {
    id v4 = [(DMCEnrollmentFlowUIPresenterBase *)self passcodeCompletionHandler];
    v4[2](v4, 0, 1);

    [(DMCEnrollmentFlowUIPresenterBase *)self setPasscodeCompletionHandler:0];
  }
}

void __56__DMCEnrollmentFlowUIPresenterBase_didCancelEnteringPIN__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) navigationController];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) baseViewController];
  }
  id v5 = v4;

  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (UIViewController)baseViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_baseViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setBaseViewController:(id)a3
{
}

- (DMCDismissalAwareNavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (DMCActivityViewController)activityController
{
  return self->_activityController;
}

- (void)setActivityController:(id)a3
{
}

- (id)dismissedCompletionBlock
{
  return self->_dismissedCompletionBlock;
}

- (id)passcodeCompletionHandler
{
  return self->_passcodeCompletionHandler;
}

- (void)setPasscodeCompletionHandler:(id)a3
{
}

- (DMCPINEntryViewController)pinEntryViewController
{
  return self->_pinEntryViewController;
}

- (void)setPinEntryViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinEntryViewController, 0);
  objc_storeStrong(&self->_passcodeCompletionHandler, 0);
  objc_storeStrong(&self->_dismissedCompletionBlock, 0);
  objc_storeStrong((id *)&self->_activityController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_destroyWeak((id *)&self->_baseViewController);
}

@end