@interface LAPSPasscodeOptionsAlertViewController
- (BOOL)_canShowWhileLocked;
- (LAPSPasscodeOptionsAlertViewController)initWithConfiguration:(id)a3;
- (LAPSPasscodeOptionsViewControllerDelegate)delegate;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addActionForPasscodeType:(id)a3;
- (void)_addActionForRecoveryEnabled:(BOOL)a3 restricted:(BOOL)a4;
- (void)_addActionWithTitle:(id)a3 style:(int64_t)a4 completion:(id)a5;
- (void)_dismiss;
- (void)_setActionWithTitle:(id)a3 enabled:(BOOL)a4;
- (void)_setup;
- (void)setDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation LAPSPasscodeOptionsAlertViewController

- (LAPSPasscodeOptionsAlertViewController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAPSPasscodeOptionsAlertViewController;
  v6 = [(LAPSPasscodeOptionsAlertViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_config, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)LAPSPasscodeOptionsAlertViewController;
  [(LAPSPasscodeOptionsAlertViewController *)&v3 viewDidLoad];
  [(LAPSPasscodeOptionsAlertViewController *)self _setup];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LAPSPasscodeOptionsAlertViewController;
  [(LAPSPasscodeOptionsAlertViewController *)&v5 viewDidDisappear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained passcodeOptionsViewControllerDidDisappear:self];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_setup
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(LAPSPasscodeOptionsAlertViewController *)self _addSectionDelimiter];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [(LAPSPasscodeOptionsViewControllerConfiguration *)self->_config allowedPasscodeTypes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [(LAPSPasscodeOptionsAlertViewController *)self _addActionForPasscodeType:*(void *)(*((void *)&v9 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  if ([(LAPSPasscodeOptionsViewControllerConfiguration *)self->_config isPasscodeRecoverySupported]&& [(LAPSPasscodeOptionsViewControllerConfiguration *)self->_config isPasscodeRecoveryOptionVisible])
  {
    [(LAPSPasscodeOptionsAlertViewController *)self _addActionForRecoveryEnabled:[(LAPSPasscodeOptionsViewControllerConfiguration *)self->_config isPasscodeRecoveryEnabled] restricted:[(LAPSPasscodeOptionsViewControllerConfiguration *)self->_config isPasscodeRecoveryRestricted]];
  }
  v8 = [(LAPSPasscodeOptionsViewControllerConfiguration *)self->_config cancelTitle];
  [(LAPSPasscodeOptionsAlertViewController *)self _addActionWithTitle:v8 style:1 completion:&__block_literal_global_6];
}

- (void)_addActionForPasscodeType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 localizedName];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__LAPSPasscodeOptionsAlertViewController__addActionForPasscodeType___block_invoke;
  v7[3] = &unk_26506F410;
  id v8 = v4;
  id v6 = v4;
  [(LAPSPasscodeOptionsAlertViewController *)self _addActionWithTitle:v5 style:0 completion:v7];
}

void __68__LAPSPasscodeOptionsAlertViewController__addActionForPasscodeType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 delegate];
  [v4 passcodeOptionsViewController:v3 didSelectPasscodeType:*(void *)(a1 + 32)];
}

- (void)_addActionForRecoveryEnabled:(BOOL)a3 restricted:(BOOL)a4
{
  BOOL v6 = [(LAPSPasscodeOptionsViewControllerConfiguration *)self->_config isPasscodeRecoveryEnabled];
  config = self->_config;
  if (v6) {
    [(LAPSPasscodeOptionsViewControllerConfiguration *)config passcodeRecoveryEnabledTitle];
  }
  else {
  id v8 = [(LAPSPasscodeOptionsViewControllerConfiguration *)config passcodeRecoveryDisabledTitle];
  }
  if ([(LAPSPasscodeOptionsViewControllerConfiguration *)self->_config isPasscodeRecoveryEnabled])
  {
    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __82__LAPSPasscodeOptionsAlertViewController__addActionForRecoveryEnabled_restricted___block_invoke;
  v10[3] = &__block_descriptor_33_e48_v16__0__LAPSPasscodeOptionsAlertViewController_8l;
  BOOL v11 = a3;
  [(LAPSPasscodeOptionsAlertViewController *)self _addActionWithTitle:v8 style:v9 completion:v10];
  [(LAPSPasscodeOptionsAlertViewController *)self _setActionWithTitle:v8 enabled:[(LAPSPasscodeOptionsViewControllerConfiguration *)self->_config isPasscodeRecoveryRestricted] ^ 1];
}

void __82__LAPSPasscodeOptionsAlertViewController__addActionForRecoveryEnabled_restricted___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 delegate];
  [v4 passcodeOptionsViewController:v3 didSetPasscodeRecoveryEnabled:*(unsigned char *)(a1 + 32) == 0];
}

- (void)_addActionWithTitle:(id)a3 style:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79__LAPSPasscodeOptionsAlertViewController__addActionWithTitle_style_completion___block_invoke;
  v11[3] = &unk_26506ECF8;
  objc_copyWeak(&v13, &location);
  id v10 = v9;
  id v12 = v10;
  [(LAPSPasscodeOptionsAlertViewController *)self _addActionWithTitle:v8 style:a4 handler:v11 shouldDismissHandler:&__block_literal_global_8];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

uint64_t __79__LAPSPasscodeOptionsAlertViewController__addActionWithTitle_style_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    [v4 _dismiss];
  }

  return MEMORY[0x270F9A758]();
}

uint64_t __79__LAPSPasscodeOptionsAlertViewController__addActionWithTitle_style_completion___block_invoke_2()
{
  return 0;
}

- (void)_setActionWithTitle:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [(LAPSPasscodeOptionsAlertViewController *)self actions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v13 = [v12 title];
        int v14 = [v13 isEqualToString:v6];

        if (v14) {
          [v12 setEnabled:v4];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)_dismiss
{
  id v3 = [(LAPSPasscodeOptionsAlertViewController *)self presentingViewController];

  if (v3)
  {
    [(LAPSPasscodeOptionsAlertViewController *)self dismissViewControllerAnimated:1 completion:&__block_literal_global_10];
  }
}

- (LAPSPasscodeOptionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LAPSPasscodeOptionsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_config, 0);
}

@end