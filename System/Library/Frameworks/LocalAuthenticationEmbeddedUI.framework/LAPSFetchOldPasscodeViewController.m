@interface LAPSFetchOldPasscodeViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (LAPSFetchOldPasscodeViewController)initWithInput:(id)a3 completion:(id)a4;
- (LAPSFetchOldPasscodeViewControllerDelegate)delegate;
- (id)navigationItem;
- (void)_addChildVC:(id)a3;
- (void)_deactivate;
- (void)_invokeHandlerWithError:(id)a3;
- (void)_invokeHandlerWithOutput:(id)a3;
- (void)_invokeHandlerWithOutput:(id)a3 error:(id)a4;
- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3;
- (void)finishWithPasscode:(id)a3;
- (void)passcodeViewController:(id)a3 didCancelWithError:(id)a4;
- (void)passcodeViewController:(id)a3 verifyPasscode:(id)a4;
- (void)setDelegate:(id)a3;
- (void)showPasscodeValidationError:(id)a3 completion:(id)a4;
- (void)startBackoffWithTimeout:(int64_t)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation LAPSFetchOldPasscodeViewController

- (LAPSFetchOldPasscodeViewController)initWithInput:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)LAPSFetchOldPasscodeViewController;
  v9 = [(LAPSFetchOldPasscodeViewController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_input, a3);
    uint64_t v11 = MEMORY[0x2455CBB70](v8);
    id handler = v10->_handler;
    v10->_id handler = (id)v11;
  }
  return v10;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)LAPSFetchOldPasscodeViewController;
  [(LAPSFetchOldPasscodeViewController *)&v7 viewDidLoad];
  v3 = [(LAPSFetchOldPasscodeViewController *)self view];
  v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__LAPSFetchOldPasscodeViewController_viewDidLoad__block_invoke;
  v6[3] = &unk_26506E880;
  v6[4] = self;
  v5 = __49__LAPSFetchOldPasscodeViewController_viewDidLoad__block_invoke((uint64_t)v6);
  [(LAPSFetchOldPasscodeViewController *)self _addChildVC:v5];
}

LAPSPasscodeViewController *__49__LAPSFetchOldPasscodeViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  v2 = [LAPSPasscodeViewController alloc];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__LAPSFetchOldPasscodeViewController_viewDidLoad__block_invoke_2;
  v6[3] = &unk_26506E858;
  v6[4] = *(void *)(a1 + 32);
  v3 = __49__LAPSFetchOldPasscodeViewController_viewDidLoad__block_invoke_2((uint64_t)v6);
  v4 = [(LAPSPasscodeViewController *)v2 initWithConfiguration:v3];

  [(LAPSPasscodeViewController *)v4 setDelegate:*(void *)(a1 + 32)];
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 1000), v4);

  return v4;
}

LAPSPasscodeViewControllerConfiguration *__49__LAPSFetchOldPasscodeViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  v2 = objc_alloc_init(LAPSPasscodeViewControllerConfiguration);
  v3 = [*(id *)(*(void *)(a1 + 32) + 976) title];
  [(LAPSPasscodeViewControllerConfiguration *)v2 setTitle:v3];

  v4 = [*(id *)(*(void *)(a1 + 32) + 976) prompt];
  [(LAPSPasscodeViewControllerConfiguration *)v2 setPrompt:v4];

  v5 = [*(id *)(*(void *)(a1 + 32) + 976) nextButton];
  [(LAPSPasscodeViewControllerConfiguration *)v2 setNextButton:v5];

  v6 = [*(id *)(*(void *)(a1 + 32) + 976) passcodeType];
  [(LAPSPasscodeViewControllerConfiguration *)v2 setPasscodeType:v6];

  objc_super v7 = [*(id *)(*(void *)(a1 + 32) + 976) errorMessage];
  [(LAPSPasscodeViewControllerConfiguration *)v2 setErrorMessage:v7];

  -[LAPSPasscodeViewControllerConfiguration setShouldAvoidBecomingFirstResponderOnStart:](v2, "setShouldAvoidBecomingFirstResponderOnStart:", [*(id *)(*(void *)(a1 + 32) + 976) backoffTimeout] > 0);

  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LAPSFetchOldPasscodeViewController;
  [(LAPSFetchOldPasscodeViewController *)&v4 viewWillAppear:a3];
  if ([(LAPSFetchOldPasscodeViewControllerInput *)self->_input backoffTimeout] >= 1) {
    [(LAPSFetchOldPasscodeViewController *)self startBackoffWithTimeout:[(LAPSFetchOldPasscodeViewControllerInput *)self->_input backoffTimeout]];
  }
}

- (BOOL)becomeFirstResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentChildVC);
  char v3 = [WeakRetained becomeFirstResponder];

  return v3;
}

- (BOOL)resignFirstResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentChildVC);
  char v3 = [WeakRetained resignFirstResponder];

  return v3;
}

- (id)navigationItem
{
  char v3 = [(LAPSFetchOldPasscodeViewController *)self parentViewController];
  objc_super v4 = [v3 navigationItem];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)LAPSFetchOldPasscodeViewController;
    id v6 = [(LAPSFetchOldPasscodeViewController *)&v9 navigationItem];
  }
  objc_super v7 = v6;

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)LAPSFetchOldPasscodeViewController;
  id v4 = a3;
  [(LAPSFetchOldPasscodeViewController *)&v9 _preferredContentSizeDidChangeForChildViewController:v4];
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  double v6 = v5;
  double v8 = v7;

  -[LAPSFetchOldPasscodeViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)startBackoffWithTimeout:(int64_t)a3
{
  objc_initWeak(&location, self);
  double v5 = [LAPSPasscodeBackoffTimerController alloc];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__LAPSFetchOldPasscodeViewController_startBackoffWithTimeout___block_invoke;
  v10[3] = &unk_26506ED98;
  objc_copyWeak(&v11, &location);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__LAPSFetchOldPasscodeViewController_startBackoffWithTimeout___block_invoke_2;
  v8[3] = &unk_26506ED48;
  objc_copyWeak(&v9, &location);
  double v6 = [(LAPSPasscodeBackoffTimerController *)v5 initWithTimeout:a3 updateHandler:v10 completionHandler:v8];
  timer = self->_timer;
  self->_timer = v6;

  [(LAPSPasscodeBackoffTimerController *)self->_timer start];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __62__LAPSFetchOldPasscodeViewController_startBackoffWithTimeout___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v4 = [WeakRetained delegate];
    double v5 = [v4 fetchOldPasscodeViewController:v9 backoffMessageForTimeout:a2];

    id v6 = objc_loadWeakRetained(v9 + 125);
    [v6 setHeader:v5];

    id v7 = objc_loadWeakRetained(v9 + 125);
    [v7 unfocus];

    id v8 = objc_loadWeakRetained(v9 + 125);
    [v8 clear];

    [v9 resignFirstResponder];
    id WeakRetained = v9;
  }
}

void __62__LAPSFetchOldPasscodeViewController_startBackoffWithTimeout___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 125;
    id v7 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 125);
    id v4 = [v7[122] prompt];
    [v3 setHeader:v4];

    id v5 = objc_loadWeakRetained(v2);
    [v5 clear];

    id v6 = objc_loadWeakRetained(v2);
    [v6 focus];

    [v7 becomeFirstResponder];
    id WeakRetained = v7;
  }
}

- (void)showPasscodeValidationError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeVC);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__LAPSFetchOldPasscodeViewController_showPasscodeValidationError_completion___block_invoke;
  v11[3] = &unk_26506EDC0;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [WeakRetained shakeWithCompletion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __77__LAPSFetchOldPasscodeViewController_showPasscodeValidationError_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained + 125;
    id v8 = WeakRetained;
    id v4 = objc_loadWeakRetained(WeakRetained + 125);
    [v4 hideSpinner];

    id v5 = objc_loadWeakRetained(v3);
    [v5 clear];

    id v6 = objc_loadWeakRetained(v3);
    [v6 setErrorMessage:*(void *)(a1 + 32)];

    id v7 = objc_loadWeakRetained(v3);
    [v7 focus];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v8;
  }
}

- (void)finishWithPasscode:(id)a3
{
  id v6 = a3;
  id v4 = v6;
  id v5 = objc_alloc_init(LAPSFetchOldPasscodeViewControllerOutput);
  [(LAPSFetchOldPasscodeViewControllerOutput *)v5 setPasscode:v6];
  [(LAPSFetchOldPasscodeViewController *)self _invokeHandlerWithOutput:v5];
}

LAPSFetchOldPasscodeViewControllerOutput *__57__LAPSFetchOldPasscodeViewController_finishWithPasscode___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(LAPSFetchOldPasscodeViewControllerOutput);
  [(LAPSFetchOldPasscodeViewControllerOutput *)v2 setPasscode:*(void *)(a1 + 32)];

  return v2;
}

- (void)passcodeViewController:(id)a3 verifyPasscode:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [v10 unfocus];
  [v10 showSpinner];
  id v7 = [(LAPSFetchOldPasscodeViewControllerInput *)self->_input passcodeType];
  id v8 = [v6 type];
  if (([v7 isEqual:v8] & 1) == 0) {
    -[LAPSFetchOldPasscodeViewController passcodeViewController:verifyPasscode:]();
  }

  id v9 = [(LAPSFetchOldPasscodeViewController *)self delegate];
  [v9 fetchOldPasscodeViewController:self verifyPasscode:v6];
}

- (void)passcodeViewController:(id)a3 didCancelWithError:(id)a4
{
}

- (void)_addChildVC:(id)a3
{
  id obj = a3;
  [(LAPSFetchOldPasscodeViewController *)self addChildViewController:obj];
  id v4 = [(LAPSFetchOldPasscodeViewController *)self view];
  id v5 = [obj view];
  [v4 addSubview:v5];

  id v6 = [obj view];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v7 = [obj view];
  id v8 = [v7 topAnchor];
  id v9 = [(LAPSFetchOldPasscodeViewController *)self view];
  id v10 = [v9 topAnchor];
  id v11 = [v8 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  id v12 = [obj view];
  id v13 = [v12 bottomAnchor];
  id v14 = [(LAPSFetchOldPasscodeViewController *)self view];
  v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  v17 = [obj view];
  v18 = [v17 leadingAnchor];
  v19 = [(LAPSFetchOldPasscodeViewController *)self view];
  v20 = [v19 leadingAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  v22 = [obj view];
  v23 = [v22 trailingAnchor];
  v24 = [(LAPSFetchOldPasscodeViewController *)self view];
  v25 = [v24 trailingAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  [v26 setActive:1];

  [obj didMoveToParentViewController:self];
  objc_storeWeak((id *)&self->_currentChildVC, obj);
}

- (void)_invokeHandlerWithOutput:(id)a3
{
}

- (void)_invokeHandlerWithError:(id)a3
{
}

- (void)_invokeHandlerWithOutput:(id)a3 error:(id)a4
{
  id handler = self->_handler;
  if (handler)
  {
    id v7 = a4;
    id v8 = a3;
    id v10 = (void (**)(id, id, id))[handler copy];
    id v9 = self->_handler;
    self->_id handler = 0;

    [(LAPSFetchOldPasscodeViewController *)self _deactivate];
    v10[2](v10, v8, v7);
  }
}

- (void)_deactivate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeVC);
  [WeakRetained unfocus];
}

- (LAPSFetchOldPasscodeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LAPSFetchOldPasscodeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_handler, 0);
  objc_destroyWeak((id *)&self->_passcodeVC);
  objc_destroyWeak((id *)&self->_currentChildVC);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_input, 0);
}

- (void)passcodeViewController:verifyPasscode:.cold.1()
{
}

@end