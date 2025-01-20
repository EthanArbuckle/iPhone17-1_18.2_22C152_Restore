@interface LAPSFetchNewPasscodeViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (LAPSFetchNewPasscodeViewController)initWithInput:(id)a3 completion:(id)a4;
- (LAPSFetchNewPasscodeViewControllerDelegate)delegate;
- (id)_currentChildVC;
- (id)navigationItem;
- (void)_deactivate;
- (void)_invokeHandlerWithError:(id)a3;
- (void)_invokeHandlerWithOutput:(id)a3;
- (void)_invokeHandlerWithOutput:(id)a3 error:(id)a4;
- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3;
- (void)_presentNewPasscodeVCWithTransitionStyle:(int64_t)a3;
- (void)_presentVerifyPasscodeVCWithTransitionStyle:(int64_t)a3;
- (void)_presentViewController:(id)a3 transitionStyle:(int64_t)a4;
- (void)clear;
- (void)continueWithPasscode:(id)a3;
- (void)finishWithPasscode:(id)a3;
- (void)passcodeViewController:(id)a3 didCancelWithError:(id)a4;
- (void)passcodeViewController:(id)a3 didSelectPasscodeType:(id)a4;
- (void)passcodeViewController:(id)a3 didSetPasscodeRecoveryEnabled:(BOOL)a4;
- (void)passcodeViewController:(id)a3 verifyPasscode:(id)a4;
- (void)restart;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation LAPSFetchNewPasscodeViewController

- (LAPSFetchNewPasscodeViewController)initWithInput:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)LAPSFetchNewPasscodeViewController;
  v9 = [(LAPSFetchNewPasscodeViewController *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_input, a3);
    uint64_t v11 = MEMORY[0x2455CBB70](v8);
    id handler = v10->_handler;
    v10->_id handler = (id)v11;

    uint64_t v13 = [v7 passcodeType];
    passcodeType = v10->_passcodeType;
    v10->_passcodeType = (LAPSPasscodeType *)v13;

    v10->_isPasscodeRecoveryEnabled = [v7 isPasscodeRecoveryEnabled];
    v15 = (LACUIContainerViewController *)objc_alloc_init(MEMORY[0x263F52538]);
    containerVC = v10->_containerVC;
    v10->_containerVC = v15;
  }
  return v10;
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)LAPSFetchNewPasscodeViewController;
  [(LAPSFetchNewPasscodeViewController *)&v28 viewDidLoad];
  v3 = [(LAPSFetchNewPasscodeViewController *)self view];
  v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  [(LAPSFetchNewPasscodeViewController *)self addChildViewController:self->_containerVC];
  v5 = [(LAPSFetchNewPasscodeViewController *)self view];
  v6 = [(LACUIContainerViewController *)self->_containerVC view];
  [v5 addSubview:v6];

  id v7 = [(LACUIContainerViewController *)self->_containerVC view];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v8 = [(LACUIContainerViewController *)self->_containerVC view];
  v9 = [v8 topAnchor];
  v10 = [(LAPSFetchNewPasscodeViewController *)self view];
  uint64_t v11 = [v10 topAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  [v12 setActive:1];

  uint64_t v13 = [(LACUIContainerViewController *)self->_containerVC view];
  v14 = [v13 bottomAnchor];
  v15 = [(LAPSFetchNewPasscodeViewController *)self view];
  v16 = [v15 bottomAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  objc_super v18 = [(LACUIContainerViewController *)self->_containerVC view];
  v19 = [v18 leadingAnchor];
  v20 = [(LAPSFetchNewPasscodeViewController *)self view];
  v21 = [v20 leadingAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  v23 = [(LACUIContainerViewController *)self->_containerVC view];
  v24 = [v23 trailingAnchor];
  v25 = [(LAPSFetchNewPasscodeViewController *)self view];
  v26 = [v25 trailingAnchor];
  v27 = [v24 constraintEqualToAnchor:v26];
  [v27 setActive:1];

  [(LACUIContainerViewController *)self->_containerVC didMoveToParentViewController:self];
  [(LAPSFetchNewPasscodeViewController *)self _presentNewPasscodeVCWithTransitionStyle:0];
}

- (BOOL)becomeFirstResponder
{
  return [(LACUIContainerViewController *)self->_containerVC becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
  return [(LACUIContainerViewController *)self->_containerVC resignFirstResponder];
}

- (id)navigationItem
{
  v3 = [(LAPSFetchNewPasscodeViewController *)self parentViewController];
  v4 = [v3 navigationItem];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)LAPSFetchNewPasscodeViewController;
    id v6 = [(LAPSFetchNewPasscodeViewController *)&v9 navigationItem];
  }
  id v7 = v6;

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)LAPSFetchNewPasscodeViewController;
  id v4 = a3;
  [(LAPSFetchNewPasscodeViewController *)&v9 _preferredContentSizeDidChangeForChildViewController:v4];
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  double v6 = v5;
  double v8 = v7;

  -[LAPSFetchNewPasscodeViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)continueWithPasscode:(id)a3
{
  objc_storeStrong((id *)&self->_passcode, a3);

  [(LAPSFetchNewPasscodeViewController *)self _presentVerifyPasscodeVCWithTransitionStyle:1];
}

- (void)restart
{
  [(LAPSFetchNewPasscodeViewController *)self clear];

  [(LAPSFetchNewPasscodeViewController *)self _presentNewPasscodeVCWithTransitionStyle:2];
}

- (void)clear
{
  v2 = self;
  passcode = self->_passcode;
  self->_passcode = 0;

  v2 = (LAPSFetchNewPasscodeViewController *)((char *)v2 + 1024);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  [WeakRetained clear];

  id v5 = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  [v5 focus];

  id v6 = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  [v6 hideSpinner];
}

- (void)finishWithPasscode:(id)a3
{
  id v4 = a3;
  [(LAPSFetchNewPasscodeViewController *)self resignFirstResponder];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  objc_super v9 = __57__LAPSFetchNewPasscodeViewController_finishWithPasscode___block_invoke;
  v10 = &unk_26506E7E0;
  id v11 = v4;
  v12 = self;
  id v5 = v4;
  id v6 = __57__LAPSFetchNewPasscodeViewController_finishWithPasscode___block_invoke((uint64_t)&v7);
  -[LAPSFetchNewPasscodeViewController _invokeHandlerWithOutput:](self, "_invokeHandlerWithOutput:", v6, v7, v8, v9, v10);
}

LAPSFetchNewPasscodeViewControllerOutput *__57__LAPSFetchNewPasscodeViewController_finishWithPasscode___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(LAPSFetchNewPasscodeViewControllerOutput);
  [(LAPSFetchNewPasscodeViewControllerOutput *)v2 setPasscode:*(void *)(a1 + 32)];
  [(LAPSFetchNewPasscodeViewControllerOutput *)v2 setIsPasscodeRecoveryEnabled:*(unsigned __int8 *)(*(void *)(a1 + 40) + 1008)];

  return v2;
}

- (void)_presentNewPasscodeVCWithTransitionStyle:(int64_t)a3
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke;
  v6[3] = &unk_26506E880;
  v6[4] = self;
  id v5 = __79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke((uint64_t)v6);
  [(LAPSFetchNewPasscodeViewController *)self _presentViewController:v5 transitionStyle:a3];
}

LAPSPasscodeViewController *__79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke(uint64_t a1)
{
  v2 = [LAPSPasscodeViewController alloc];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke_2;
  v6[3] = &unk_26506E858;
  v6[4] = *(void *)(a1 + 32);
  v3 = __79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke_2((uint64_t)v6);
  id v4 = [(LAPSPasscodeViewController *)v2 initWithConfiguration:v3];

  [(LAPSPasscodeViewController *)v4 setDelegate:*(void *)(a1 + 32)];
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 1024), v4);

  return v4;
}

LAPSPasscodeViewControllerConfiguration *__79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke_2(uint64_t a1)
{
  v2 = objc_alloc_init(LAPSPasscodeViewControllerConfiguration);
  v3 = [*(id *)(*(void *)(a1 + 32) + 976) title];
  [(LAPSPasscodeViewControllerConfiguration *)v2 setTitle:v3];

  id v4 = [*(id *)(*(void *)(a1 + 32) + 976) prompt];
  [(LAPSPasscodeViewControllerConfiguration *)v2 setPrompt:v4];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke_3;
  v10[3] = &unk_26506E808;
  v10[4] = *(void *)(a1 + 32);
  id v5 = __79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke_3((uint64_t)v10);
  [(LAPSPasscodeViewControllerConfiguration *)v2 setFooter:v5];

  [(LAPSPasscodeViewControllerConfiguration *)v2 setPasscodeType:*(void *)(*(void *)(a1 + 32) + 1000)];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 976) nextButton];
  [(LAPSPasscodeViewControllerConfiguration *)v2 setNextButton:v6];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke_4;
  v9[3] = &unk_26506E830;
  v9[4] = *(void *)(a1 + 32);
  uint64_t v7 = __79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke_4((uint64_t)v9);
  [(LAPSPasscodeViewControllerConfiguration *)v2 setOptionsConfiguration:v7];

  return v2;
}

__CFString *__79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke_3(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 976) isPasscodeRecoverySupported]
    || ([*(id *)(*(void *)(a1 + 32) + 976) isPasscodeRecoveryRestricted] & 1) != 0
    || ([*(id *)(*(void *)(a1 + 32) + 976) isPasscodeRecoveryMessageHidden] & 1) != 0)
  {
    v2 = &stru_26F31E768;
  }
  else
  {
    char v4 = [*(id *)(*(void *)(a1 + 32) + 976) isPasscodeRecoveryEnabled];
    id v5 = *(void **)(*(void *)(a1 + 32) + 976);
    if (v4) {
      [v5 footerRecoveryEnabled];
    }
    else {
    v2 = [v5 footerRecoveryDisabled];
    }
  }

  return v2;
}

LAPSPasscodeOptionsViewControllerConfiguration *__79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke_4(uint64_t a1)
{
  v2 = objc_alloc_init(LAPSPasscodeOptionsViewControllerConfiguration);
  v3 = [*(id *)(*(void *)(a1 + 32) + 976) passcodeOptionsTitle];
  [(LAPSPasscodeOptionsViewControllerConfiguration *)v2 setTitle:v3];

  char v4 = [*(id *)(*(void *)(a1 + 32) + 976) passcodeOptionsCancelTitle];
  [(LAPSPasscodeOptionsViewControllerConfiguration *)v2 setCancelTitle:v4];

  id v5 = [*(id *)(*(void *)(a1 + 32) + 976) passcodeRecoveryEnabledTitle];
  [(LAPSPasscodeOptionsViewControllerConfiguration *)v2 setPasscodeRecoveryEnabledTitle:v5];

  id v6 = [*(id *)(*(void *)(a1 + 32) + 976) passcodeRecoveryDisabledTitle];
  [(LAPSPasscodeOptionsViewControllerConfiguration *)v2 setPasscodeRecoveryDisabledTitle:v6];

  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 976) allowedPasscodeTypes];
  [(LAPSPasscodeOptionsViewControllerConfiguration *)v2 setAllowedPasscodeTypes:v7];

  [(LAPSPasscodeOptionsViewControllerConfiguration *)v2 setSelectedPasscodeType:*(void *)(*(void *)(a1 + 32) + 1000)];
  [(LAPSPasscodeOptionsViewControllerConfiguration *)v2 setIsPasscodeRecoveryEnabled:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1008)];
  -[LAPSPasscodeOptionsViewControllerConfiguration setIsPasscodeRecoveryOptionVisible:](v2, "setIsPasscodeRecoveryOptionVisible:", [*(id *)(*(void *)(a1 + 32) + 976) isPasscodeRecoveryOptionVisible]);
  -[LAPSPasscodeOptionsViewControllerConfiguration setIsPasscodeRecoverySupported:](v2, "setIsPasscodeRecoverySupported:", [*(id *)(*(void *)(a1 + 32) + 976) isPasscodeRecoverySupported]);
  -[LAPSPasscodeOptionsViewControllerConfiguration setIsPasscodeRecoveryRestricted:](v2, "setIsPasscodeRecoveryRestricted:", [*(id *)(*(void *)(a1 + 32) + 976) isPasscodeRecoveryRestricted]);
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 976) passcodeRecoveryTitle];
  [(LAPSPasscodeOptionsViewControllerConfiguration *)v2 setPasscodeRecoveryTitle:v8];

  return v2;
}

- (void)_presentVerifyPasscodeVCWithTransitionStyle:(int64_t)a3
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__LAPSFetchNewPasscodeViewController__presentVerifyPasscodeVCWithTransitionStyle___block_invoke;
  v6[3] = &unk_26506E880;
  v6[4] = self;
  id v5 = __82__LAPSFetchNewPasscodeViewController__presentVerifyPasscodeVCWithTransitionStyle___block_invoke((uint64_t)v6);
  [(LAPSFetchNewPasscodeViewController *)self _presentViewController:v5 transitionStyle:a3];
}

LAPSPasscodeViewController *__82__LAPSFetchNewPasscodeViewController__presentVerifyPasscodeVCWithTransitionStyle___block_invoke(uint64_t a1)
{
  v2 = [LAPSPasscodeViewController alloc];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__LAPSFetchNewPasscodeViewController__presentVerifyPasscodeVCWithTransitionStyle___block_invoke_2;
  v6[3] = &unk_26506E858;
  v6[4] = *(void *)(a1 + 32);
  v3 = __82__LAPSFetchNewPasscodeViewController__presentVerifyPasscodeVCWithTransitionStyle___block_invoke_2((uint64_t)v6);
  char v4 = [(LAPSPasscodeViewController *)v2 initWithConfiguration:v3];

  [(LAPSPasscodeViewController *)v4 setDelegate:*(void *)(a1 + 32)];
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 1024), v4);

  return v4;
}

LAPSPasscodeViewControllerConfiguration *__82__LAPSFetchNewPasscodeViewController__presentVerifyPasscodeVCWithTransitionStyle___block_invoke_2(uint64_t a1)
{
  v2 = objc_alloc_init(LAPSPasscodeViewControllerConfiguration);
  v3 = [*(id *)(*(void *)(a1 + 32) + 976) title];
  [(LAPSPasscodeViewControllerConfiguration *)v2 setTitle:v3];

  char v4 = [*(id *)(*(void *)(a1 + 32) + 976) verifyPrompt];
  [(LAPSPasscodeViewControllerConfiguration *)v2 setPrompt:v4];

  [(LAPSPasscodeViewControllerConfiguration *)v2 setPasscodeType:*(void *)(*(void *)(a1 + 32) + 1000)];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 976) verifyNextButton];
  [(LAPSPasscodeViewControllerConfiguration *)v2 setNextButton:v5];

  return v2;
}

- (void)_presentViewController:(id)a3 transitionStyle:(int64_t)a4
{
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
    v10 = (void (**)(id, id, id))[handler copy];
    id v9 = self->_handler;
    self->_id handler = 0;

    [(LAPSFetchNewPasscodeViewController *)self _deactivate];
    v10[2](v10, v8, v7);
  }
}

- (void)_deactivate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeVC);
  [WeakRetained unfocus];
}

- (id)_currentChildVC
{
  return (id)[(LACUIContainerViewController *)self->_containerVC currentViewController];
}

- (void)passcodeViewController:(id)a3 verifyPasscode:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ((id)objc_claimAutoreleasedReturnValue() ! = [(LAPSFetchNewPasscodeViewController *)self _currentChildVC]; {
    -[LAPSFetchNewPasscodeViewController passcodeViewController:verifyPasscode:]();
  }

  passcodeType = self->_passcodeType;
  if (passcodeType ! = [v6 type]; {
    -[LAPSFetchNewPasscodeViewController passcodeViewController:verifyPasscode:]();
  }

  [v11 unfocus];
  [v11 showSpinner];
  passcode = self->_passcode;
  id v9 = [(LAPSFetchNewPasscodeViewController *)self delegate];
  v10 = v9;
  if (passcode) {
    [v9 fetchNewPasscodeViewController:self verifyPasscode:self->_passcode matchesPasscode:v6];
  }
  else {
    [v9 fetchNewPasscodeViewController:self verifyPasscode:v6];
  }
}

- (void)passcodeViewController:(id)a3 didCancelWithError:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ((id)objc_claimAutoreleasedReturnValue() ! = [(LAPSFetchNewPasscodeViewController *)self _currentChildVC]; {
    -[LAPSFetchNewPasscodeViewController passcodeViewController:didCancelWithError:]();
  }

  [(LAPSFetchNewPasscodeViewController *)self _invokeHandlerWithError:v6];
}

- (void)passcodeViewController:(id)a3 didSelectPasscodeType:(id)a4
{
  id v8 = a3;
  id v6 = (LAPSPasscodeType *)a4;
  if ((id)objc_claimAutoreleasedReturnValue() ! = [(LAPSFetchNewPasscodeViewController *)self _currentChildVC]; {
    -[LAPSFetchNewPasscodeViewController passcodeViewController:didSelectPasscodeType:]();
  }

  passcodeType = self->_passcodeType;
  self->_passcodeType = v6;
}

- (void)passcodeViewController:(id)a3 didSetPasscodeRecoveryEnabled:(BOOL)a4
{
  id v8 = a3;
  if ((id)objc_claimAutoreleasedReturnValue() ! = [(LAPSFetchNewPasscodeViewController *)self _currentChildVC]; {
    -[LAPSFetchNewPasscodeViewController passcodeViewController:didSetPasscodeRecoveryEnabled:]();
  }

  if (![(LAPSFetchNewPasscodeViewControllerInput *)self->_input isPasscodeRecoverySupported]|| [(LAPSFetchNewPasscodeViewControllerInput *)self->_input isPasscodeRecoveryRestricted])
  {
    -[LAPSFetchNewPasscodeViewController passcodeViewController:didSetPasscodeRecoveryEnabled:]();
  }
  input = self->_input;
  if (a4) {
    [(LAPSFetchNewPasscodeViewControllerInput *)input footerRecoveryEnabled];
  }
  else {
  id v7 = [(LAPSFetchNewPasscodeViewControllerInput *)input footerRecoveryDisabled];
  }
  [v8 setFooter:v7];

  self->_isPasscodeRecoveryEnabled = a4;
}

- (LAPSFetchNewPasscodeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LAPSFetchNewPasscodeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_passcodeVC);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_passcodeType, 0);
  objc_storeStrong((id *)&self->_containerVC, 0);
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_input, 0);
}

- (void)passcodeViewController:verifyPasscode:.cold.1()
{
  __assert_rtn("-[LAPSFetchNewPasscodeViewController passcodeViewController:verifyPasscode:]", "LAPSFetchNewPasscodeViewController.m", 222, "_passcodeType == [passcode type]");
}

- (void)passcodeViewController:verifyPasscode:.cold.2()
{
  __assert_rtn("-[LAPSFetchNewPasscodeViewController passcodeViewController:verifyPasscode:]", "LAPSFetchNewPasscodeViewController.m", 221, "passcodeVC == [self _currentChildVC]");
}

- (void)passcodeViewController:didCancelWithError:.cold.1()
{
  __assert_rtn("-[LAPSFetchNewPasscodeViewController passcodeViewController:didCancelWithError:]", "LAPSFetchNewPasscodeViewController.m", 236, "passcodeVC == [self _currentChildVC]");
}

- (void)passcodeViewController:didSelectPasscodeType:.cold.1()
{
  __assert_rtn("-[LAPSFetchNewPasscodeViewController passcodeViewController:didSelectPasscodeType:]", "LAPSFetchNewPasscodeViewController.m", 242, "passcodeVC == [self _currentChildVC]");
}

- (void)passcodeViewController:didSetPasscodeRecoveryEnabled:.cold.1()
{
}

- (void)passcodeViewController:didSetPasscodeRecoveryEnabled:.cold.2()
{
  __assert_rtn("-[LAPSFetchNewPasscodeViewController passcodeViewController:didSetPasscodeRecoveryEnabled:]", "LAPSFetchNewPasscodeViewController.m", 248, "passcodeVC == [self _currentChildVC]");
}

@end