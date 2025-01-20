@interface DBUserAlertModalViewController
- (DBUserAlertModalViewController)initWithAlert:(id)a3;
- (URTAlert)alert;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation DBUserAlertModalViewController

- (DBUserAlertModalViewController)initWithAlert:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DBUserAlertModalViewController;
  v6 = [(DBUserAlertModalViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_alert, a3);
  }

  return v7;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = [(DBUserAlertModalViewController *)self alert];
  id v5 = (void *)MEMORY[0x263F82418];
  v6 = [v4 title];
  v7 = [v4 message];
  v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__DBUserAlertModalViewController_viewDidAppear___block_invoke;
  aBlock[3] = &unk_2649B44D0;
  id v17 = v8;
  id v9 = v8;
  v10 = (void (**)(void *, void *, uint64_t, void))_Block_copy(aBlock);
  v11 = [v4 cancelAction];
  v10[2](v10, v11, 1, 0);

  v12 = [v4 otherAction];
  v10[2](v10, v12, 0, 0);

  v13 = [v4 defaultAction];
  v10[2](v10, v13, 0, 1);

  v14 = DBLogForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    __int16 v15 = 0;
    _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_INFO, "presenting modal user alert", (uint8_t *)&v15, 2u);
  }

  [(DBUserAlertModalViewController *)self presentViewController:v9 animated:1 completion:0];
}

void __48__DBUserAlertModalViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v7 = a2;
  v8 = v7;
  if (v7)
  {
    id v9 = (void *)MEMORY[0x263F82400];
    v10 = [v7 title];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __48__DBUserAlertModalViewController_viewDidAppear___block_invoke_2;
    v12[3] = &unk_2649B44A8;
    id v13 = v8;
    v11 = [v9 actionWithTitle:v10 style:a3 handler:v12];

    [*(id *)(a1 + 32) addAction:v11];
    if (a4) {
      [*(id *)(a1 + 32) setPreferredAction:v11];
    }
  }
}

void __48__DBUserAlertModalViewController_viewDidAppear___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = DBLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "handling alert button action: %@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = [*(id *)(a1 + 32) handler];

  if (v5)
  {
    v6 = [*(id *)(a1 + 32) handler];
    v6[2](v6, *(void *)(a1 + 32));
  }
}

- (URTAlert)alert
{
  return self->_alert;
}

- (void).cxx_destruct
{
}

@end