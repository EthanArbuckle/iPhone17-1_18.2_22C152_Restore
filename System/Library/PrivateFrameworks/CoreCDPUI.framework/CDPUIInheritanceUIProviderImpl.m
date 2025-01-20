@interface CDPUIInheritanceUIProviderImpl
- (AKInheritanceAccessKey)accessKey;
- (BOOL)accessCodeScanner:(id)a3 didScanCode:(id)a4;
- (BOOL)manualAccessCodeEntry:(id)a3 shouldFinishWithAccessCode:(id)a4;
- (CDPUIInheritanceUIProviderImpl)initWithPresentingViewController:(id)a3;
- (OBNavigationController)navigationController;
- (UIViewController)presentingViewController;
- (id)_buildViewController;
- (id)_cameraLabel;
- (id)_cameraView;
- (id)_contentStackView;
- (id)completion;
- (void)_dismissViewControllerWithAccessKey:(id)a3 error:(id)a4;
- (void)_keyOptionsTapped:(id)a3;
- (void)_presentWelcomePage;
- (void)_showEnterCodeLaterAlert;
- (void)_showManualCodeEntryPage;
- (void)_skipTapped:(id)a3;
- (void)accessCodeScanner:(id)a3 didFailToStarCapture:(id)a4;
- (void)manualAccessCodeEntryDidCancel:(id)a3;
- (void)promptForAccessCodeForAccessKey:(id)a3 completion:(id)a4;
- (void)setAccessKey:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)welcomeViewController:(id)a3 didCompleteWithError:(id)a4;
@end

@implementation CDPUIInheritanceUIProviderImpl

- (CDPUIInheritanceUIProviderImpl)initWithPresentingViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDPUIInheritanceUIProviderImpl;
  v6 = [(CDPUIInheritanceUIProviderImpl *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_presentingViewController, a3);
  }

  return v7;
}

- (void)promptForAccessCodeForAccessKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  [(CDPUIInheritanceUIProviderImpl *)self setCompletion:a4];
  [(CDPUIInheritanceUIProviderImpl *)self setAccessKey:v6];

  id v10 = [(CDPUIInheritanceUIProviderImpl *)self _buildViewController];
  v7 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  [v10 setModalPresentationStyle:2 * ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)];
  objc_super v9 = [(CDPUIInheritanceUIProviderImpl *)self presentingViewController];
  [v9 presentViewController:v10 animated:1 completion:0];
}

- (id)_buildViewController
{
  v42[4] = *MEMORY[0x263EF8340];
  v41 = [MEMORY[0x263F34328] sharedInstance];
  v40 = CDPLocalizedString();
  v3 = NSString;
  v4 = CDPLocalizedString();
  id v5 = [v41 primaryAccountFirstName];
  v39 = [v3 stringWithValidatedFormat:v4, @"%@", 0, v5 validFormatSpecifiers error];

  id v6 = (void *)[objc_alloc(MEMORY[0x263F5B918]) initWithTitle:v40 detailText:v39 symbolName:0];
  v7 = [(CDPUIInheritanceUIProviderImpl *)self _contentStackView];
  uint64_t v8 = [v6 contentView];
  [v8 addSubview:v7];

  v29 = (void *)MEMORY[0x263F08938];
  v35 = [v7 leadingAnchor];
  v36 = [v6 contentView];
  v34 = [v36 leadingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v42[0] = v33;
  v31 = [v7 trailingAnchor];
  v32 = [v6 contentView];
  v30 = [v32 trailingAnchor];
  v28 = [v31 constraintEqualToAnchor:v30];
  v42[1] = v28;
  v38 = v7;
  objc_super v9 = [v7 topAnchor];
  id v10 = [v6 contentView];
  v11 = [v10 topAnchor];
  v12 = [v9 constraintEqualToAnchor:v11 constant:10.0];
  v42[2] = v12;
  v13 = [v7 bottomAnchor];
  v14 = [v6 contentView];
  v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v42[3] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:4];
  [v29 activateConstraints:v17];

  v18 = [MEMORY[0x263F5B8D0] linkButton];
  v19 = CDPLocalizedString();
  [v18 setTitle:v19 forState:0];

  [v18 addTarget:self action:sel__keyOptionsTapped_ forControlEvents:64];
  v20 = [v6 buttonTray];
  [v20 addButton:v18];

  v21 = (void *)[objc_alloc(MEMORY[0x263F5B8E0]) initWithRootViewController:v6];
  [(CDPUIInheritanceUIProviderImpl *)self setNavigationController:v21];

  id v22 = objc_alloc(MEMORY[0x263F824A8]);
  v23 = CDPLocalizedString();
  v24 = (void *)[v22 initWithTitle:v23 style:0 target:self action:sel__skipTapped_];
  v25 = [v6 navigationItem];
  [v25 setLeftBarButtonItem:v24];

  v26 = [(CDPUIInheritanceUIProviderImpl *)self navigationController];

  return v26;
}

- (id)_contentStackView
{
  v17[2] = *MEMORY[0x263EF8340];
  v3 = [(CDPUIInheritanceUIProviderImpl *)self _cameraView];
  v4 = [(CDPUIInheritanceUIProviderImpl *)self _cameraLabel];
  id v5 = objc_alloc(MEMORY[0x263F82BF8]);
  v17[0] = v3;
  v17[1] = v4;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  v7 = (void *)[v5 initWithArrangedSubviews:v6];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 setAxis:1];
  [v7 setSpacing:15.0];
  uint64_t v8 = (void *)MEMORY[0x263F08938];
  objc_super v9 = [v3 widthAnchor];
  id v10 = [v9 constraintLessThanOrEqualToConstant:308.0];
  v16[0] = v10;
  v11 = [v3 widthAnchor];
  v12 = [v3 heightAnchor];
  v13 = [v11 constraintEqualToAnchor:v12 multiplier:1.4];
  v16[1] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  [v8 activateConstraints:v14];

  return v7;
}

- (id)_cameraView
{
  v3 = [CDPUIInheritanceAccessCodeScannerView alloc];
  v4 = -[CDPUIInheritanceAccessCodeScannerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(CDPUIInheritanceAccessCodeScannerView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CDPUIInheritanceAccessCodeScannerView *)v4 setDelegate:self];

  return v4;
}

- (id)_cameraLabel
{
  id v2 = objc_alloc(MEMORY[0x263F828E0]);
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v4 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [v3 setTextColor:v4];

  [v3 setTextAlignment:1];
  [v3 setNumberOfLines:0];
  id v5 = CDPLocalizedString();
  [v3 setText:v5];

  id v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
  [v3 setFont:v6];

  return v3;
}

- (void)_keyOptionsTapped:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2187CF000, v5, OS_LOG_TYPE_DEFAULT, "User asked for access code options.", (uint8_t *)buf, 2u);
  }

  id v6 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  objc_initWeak(buf, self);
  v7 = (void *)MEMORY[0x263F82400];
  uint64_t v8 = CDPLocalizedString();
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __52__CDPUIInheritanceUIProviderImpl__keyOptionsTapped___block_invoke;
  v22[3] = &unk_26433D4C0;
  objc_copyWeak(&v23, buf);
  objc_super v9 = [v7 actionWithTitle:v8 style:0 handler:v22];

  id v10 = (void *)MEMORY[0x263F82400];
  v11 = CDPLocalizedString();
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = __52__CDPUIInheritanceUIProviderImpl__keyOptionsTapped___block_invoke_2;
  v20 = &unk_26433D4C0;
  objc_copyWeak(&v21, buf);
  v12 = [v10 actionWithTitle:v11 style:0 handler:&v17];

  v13 = (void *)MEMORY[0x263F82400];
  v14 = CDPLocalizedString();
  v15 = objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, 0, v17, v18, v19, v20);

  [v6 addAction:v9];
  [v6 addAction:v12];
  [v6 addAction:v15];
  v16 = [(CDPUIInheritanceUIProviderImpl *)self navigationController];
  [v16 presentViewController:v6 animated:1 completion:0];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(buf);
}

void __52__CDPUIInheritanceUIProviderImpl__keyOptionsTapped___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showManualCodeEntryPage];
}

void __52__CDPUIInheritanceUIProviderImpl__keyOptionsTapped___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showEnterCodeLaterAlert];
}

- (void)_showManualCodeEntryPage
{
  id v4 = objc_alloc_init(CDPUIManualAccessCodeEntryViewController);
  [(CDPUIManualAccessCodeEntryViewController *)v4 setDelegate:self];
  v3 = [(CDPUIInheritanceUIProviderImpl *)self navigationController];
  [v3 pushViewController:v4 animated:1];
}

- (void)_showEnterCodeLaterAlert
{
  v3 = [MEMORY[0x263F34328] sharedInstance];
  id v4 = NSString;
  id v5 = CDPLocalizedString();
  id v6 = [v3 primaryAccountFirstName];
  v7 = [v4 stringWithValidatedFormat:v5, @"%@", 0, v6 validFormatSpecifiers error];

  uint64_t v8 = CDPLocalizedString();
  objc_super v9 = [MEMORY[0x263F82418] alertControllerWithTitle:v8 message:v7 preferredStyle:1];
  objc_initWeak(&location, self);
  id v10 = (void *)MEMORY[0x263F82400];
  v11 = CDPLocalizedString();
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __58__CDPUIInheritanceUIProviderImpl__showEnterCodeLaterAlert__block_invoke;
  void v17[3] = &unk_26433D4C0;
  objc_copyWeak(&v18, &location);
  v12 = [v10 actionWithTitle:v11 style:0 handler:v17];

  v13 = (void *)MEMORY[0x263F82400];
  v14 = CDPLocalizedString();
  v15 = [v13 actionWithTitle:v14 style:1 handler:0];

  [v9 addAction:v12];
  [v9 addAction:v15];
  v16 = [(CDPUIInheritanceUIProviderImpl *)self navigationController];
  [v16 presentViewController:v9 animated:1 completion:0];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __58__CDPUIInheritanceUIProviderImpl__showEnterCodeLaterAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _skipTapped:0];
}

- (void)_skipTapped:(id)a3
{
  objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5308);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(CDPUIInheritanceUIProviderImpl *)self _dismissViewControllerWithAccessKey:0 error:v4];
}

- (void)_dismissViewControllerWithAccessKey:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__1;
  v15[4] = __Block_byref_object_dispose__1;
  v16 = self;
  uint64_t v8 = [(CDPUIInheritanceUIProviderImpl *)v16 presentingViewController];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __76__CDPUIInheritanceUIProviderImpl__dismissViewControllerWithAccessKey_error___block_invoke;
  v11[3] = &unk_26433DD18;
  v14 = v15;
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 dismissViewControllerAnimated:1 completion:v11];

  _Block_object_dispose(v15, 8);
}

void __76__CDPUIInheritanceUIProviderImpl__dismissViewControllerWithAccessKey_error___block_invoke(void *a1)
{
  id v2 = [*(id *)(*(void *)(a1[6] + 8) + 40) completion];

  if (v2)
  {
    v3 = [*(id *)(*(void *)(a1[6] + 8) + 40) completion];
    v3[2](v3, a1[4], a1[5]);

    [*(id *)(*(void *)(a1[6] + 8) + 40) setCompletion:0];
  }
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

- (void)_presentWelcomePage
{
  id v3 = [(CDPUIInheritanceUIProviderImpl *)self accessKey];
  [(CDPUIInheritanceUIProviderImpl *)self _dismissViewControllerWithAccessKey:v3 error:0];
}

- (BOOL)manualAccessCodeEntry:(id)a3 shouldFinishWithAccessCode:(id)a4
{
  id v5 = a4;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CDPUIInheritanceUIProviderImpl manualAccessCodeEntry:shouldFinishWithAccessCode:](v6);
  }

  id v7 = [(CDPUIInheritanceUIProviderImpl *)self accessKey];
  [v7 setWrappedKeyString:v5];

  uint64_t v8 = [(CDPUIInheritanceUIProviderImpl *)self accessKey];
  [v8 setWrappingKeyString:v5];

  id v9 = objc_alloc_init(MEMORY[0x263F34398]);
  id v10 = [(CDPUIInheritanceUIProviderImpl *)self accessKey];
  int v11 = [v9 isInheritanceAccessKeyValid:v10];

  id v12 = _CDPLogSystem();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2187CF000, v12, OS_LOG_TYPE_DEFAULT, "Manual key is valid.", buf, 2u);
    }

    [(CDPUIInheritanceUIProviderImpl *)self _presentWelcomePage];
  }
  else
  {
    if (v13)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_2187CF000, v12, OS_LOG_TYPE_DEFAULT, "Entered code is not a valid inheritance key.", v15, 2u);
    }
  }
  return v11;
}

- (void)manualAccessCodeEntryDidCancel:(id)a3
{
  id v4 = [(CDPUIInheritanceUIProviderImpl *)self navigationController];
  id v3 = (id)[v4 popViewControllerAnimated:1];
}

- (BOOL)accessCodeScanner:(id)a3 didScanCode:(id)a4
{
  id v5 = a4;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2187CF000, v6, OS_LOG_TYPE_DEFAULT, "Successfully scanned the access key, checking if it's a valid inheritance key.", buf, 2u);
  }

  id v7 = [(CDPUIInheritanceUIProviderImpl *)self accessKey];
  [v7 setWrappingKeyString:v5];

  id v8 = objc_alloc_init(MEMORY[0x263F34398]);
  id v9 = [(CDPUIInheritanceUIProviderImpl *)self accessKey];
  int v10 = [v8 isInheritanceAccessKeyValid:v9];

  int v11 = _CDPLogSystem();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_2187CF000, v11, OS_LOG_TYPE_DEFAULT, "Scanned code is valid.", v15, 2u);
    }

    [(CDPUIInheritanceUIProviderImpl *)self _presentWelcomePage];
  }
  else
  {
    if (v12)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2187CF000, v11, OS_LOG_TYPE_DEFAULT, "Scanned code is not a valid inheritance key.", v14, 2u);
    }
  }
  return v10;
}

- (void)accessCodeScanner:(id)a3 didFailToStarCapture:(id)a4
{
  id v5 = a4;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[CDPUIInheritanceUIProviderImpl accessCodeScanner:didFailToStarCapture:]((uint64_t)v5, v6);
  }

  [(CDPUIInheritanceUIProviderImpl *)self _dismissViewControllerWithAccessKey:0 error:v5];
}

- (void)welcomeViewController:(id)a3 didCompleteWithError:(id)a4
{
  id v5 = a4;
  id v9 = v5;
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
  }
  else
  {
    uint64_t v8 = [(CDPUIInheritanceUIProviderImpl *)self accessKey];
    id v6 = 0;
    id v7 = (void *)v8;
  }
  [(CDPUIInheritanceUIProviderImpl *)self _dismissViewControllerWithAccessKey:v7 error:v6];
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (OBNavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (AKInheritanceAccessKey)accessKey
{
  return self->_accessKey;
}

- (void)setAccessKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessKey, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);

  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

- (void)manualAccessCodeEntry:(os_log_t)log shouldFinishWithAccessCode:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2187CF000, log, OS_LOG_TYPE_DEBUG, "Manual code was entered, checking if it's a valid inheritance key.", v1, 2u);
}

- (void)accessCodeScanner:(uint64_t)a1 didFailToStarCapture:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2187CF000, a2, OS_LOG_TYPE_ERROR, "Error scanning the code: %@", (uint8_t *)&v2, 0xCu);
}

@end