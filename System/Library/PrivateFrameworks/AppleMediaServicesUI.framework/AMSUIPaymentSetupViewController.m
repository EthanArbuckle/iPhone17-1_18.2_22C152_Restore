@interface AMSUIPaymentSetupViewController
- (AMSUIPaymentSetupViewController)initWithPaymentSetupRequest:(id)a3;
- (AMSUIPaymentSetupViewControllerDelegate)delegate;
- (PKPaymentSetupRequest)paymentSetupRequest;
- (UIViewController)childViewController;
- (void)_setup;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)loadView;
- (void)setChildViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation AMSUIPaymentSetupViewController

- (AMSUIPaymentSetupViewController)initWithPaymentSetupRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIPaymentSetupViewController;
  v6 = [(AMSUIPaymentSetupViewController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_paymentSetupRequest, a3);
    [(AMSUIPaymentSetupViewController *)v7 _setup];
  }

  return v7;
}

- (void)_setup
{
  [(AMSUIPaymentSetupViewController *)self setModalPresentationStyle:5];
  id v3 = objc_alloc((Class)getPKPaymentSetupViewControllerClass[0]());
  id v6 = [(AMSUIPaymentSetupViewController *)self paymentSetupRequest];
  v4 = (UIViewController *)[v3 initWithPaymentSetupRequest:v6];
  childViewController = self->_childViewController;
  self->_childViewController = v4;
}

- (void)loadView
{
  id v4 = objc_alloc_init(MEMORY[0x263F82E00]);
  id v3 = [MEMORY[0x263F825C8] clearColor];
  [v4 setBackgroundColor:v3];

  [v4 setUserInteractionEnabled:0];
  [(AMSUIPaymentSetupViewController *)self setView:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUIPaymentSetupViewController;
  [(AMSUIPaymentSetupViewController *)&v6 viewDidAppear:a3];
  id v4 = [(AMSUIPaymentSetupViewController *)self childViewController];

  if (v4)
  {
    id v5 = [(AMSUIPaymentSetupViewController *)self childViewController];
    [(AMSUIPaymentSetupViewController *)self presentViewController:v5 animated:1 completion:0];
  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(AMSUIPaymentSetupViewController *)self setChildViewController:0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__AMSUIPaymentSetupViewController_dismissViewControllerAnimated_completion___block_invoke;
  v9[3] = &unk_2643E33B0;
  v9[4] = self;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)AMSUIPaymentSetupViewController;
  id v7 = v6;
  [(AMSUIPaymentSetupViewController *)&v8 dismissViewControllerAnimated:v4 completion:v9];
}

uint64_t __76__AMSUIPaymentSetupViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentingViewController];
  [v2 dismissViewControllerAnimated:0 completion:0];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 paymentSetupViewControllerDidDismiss];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (AMSUIPaymentSetupViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSUIPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPaymentSetupRequest)paymentSetupRequest
{
  return self->_paymentSetupRequest;
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (void)setChildViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_paymentSetupRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end