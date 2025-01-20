@interface DSPasscodeController
+ (BOOL)isPasscodeSet;
- (DSNavigationDelegate)delegate;
- (DSPasscodeController)init;
- (OBBoldTrayButton)boldButton;
- (OBLinkTrayButton)linkButton;
- (id)detailText;
- (void)configureViews;
- (void)displayPasscodeChangeSheet;
- (void)passcodeChangePressed;
- (void)ratchetViewController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5;
- (void)setBoldButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLinkButton:(id)a3;
- (void)shouldShowWithCompletion:(id)a3;
- (void)startRatchetEvalInPresentationContext:(id)a3;
- (void)userDidTapCancelButton:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DSPasscodeController

- (DSPasscodeController)init
{
  v3 = [(DSPasscodeController *)self delegate];
  if (+[DSPasscodeController isPasscodeSet])
  {
    v4 = DSUILocStringForKey(@"DEVICE_PASSCODE");
    v5 = [(DSPasscodeController *)self detailText];
    v21.receiver = self;
    v21.super_class = (Class)DSPasscodeController;
    v6 = [(DSPasscodeController *)&v21 initWithTitle:v4 detailText:v5 symbolName:@"lock"];

    v7 = DSUILocStringForKey(@"DEVICE_PASSCODE_BOLD_BUTTON_TITLE");
    v8 = +[DSUIUtilities setUpBoldButtonForController:v6 title:v7 target:v6 selector:sel_passcodeChangePressed];
    [(DSPasscodeController *)v6 setBoldButton:v8];

    v9 = @"DEVICE_PASSCODE_LINK_BUTTON_TITLE";
  }
  else
  {
    v10 = DSUILocStringForKey(@"DEVICE_PASSCODE_CREATE");
    v11 = DSUILocStringForKey(@"DEVICE_PASSCODE_CREATE_DETAIL");
    v20.receiver = self;
    v20.super_class = (Class)DSPasscodeController;
    v6 = [(DSPasscodeController *)&v20 initWithTitle:v10 detailText:v11 symbolName:@"lock"];

    v12 = DSUILocStringForKey(@"DEVICE_PASSCODE_CREATE_BOLD_BUTTON_TITLE");
    v13 = +[DSUIUtilities setUpBoldButtonForController:v6 title:v12 target:v6 selector:sel_passcodeChangePressed];
    [(DSPasscodeController *)v6 setBoldButton:v13];

    v9 = @"DEVICE_PASSCODE_CREATE_LINK_BUTTON_TITLE";
  }
  v14 = DSUILocStringForKey(v9);
  v15 = +[DSUIUtilities setUpLinkButtonForController:v6 title:v14 target:v3 selector:sel_pushNextPane];
  [(DSPasscodeController *)v6 setLinkButton:v15];

  uint64_t v16 = objc_opt_class();
  if (v16 == objc_opt_class())
  {
    os_log_t v17 = os_log_create("com.apple.DigitalSeparation", "DSPasscodeController");
    v18 = (void *)DSLog_5;
    DSLog_5 = (uint64_t)v17;
  }
  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DSPasscodeController;
  [(DSPasscodeController *)&v4 viewWillAppear:a3];
  [(DSPasscodeController *)self configureViews];
}

- (void)configureViews
{
  id v25 = [(DSPasscodeController *)self delegate];
  BOOL v3 = +[DSPasscodeController isPasscodeSet];
  objc_super v4 = [(DSPasscodeController *)self headerView];
  if (v3)
  {
    v5 = DSUILocStringForKey(@"DEVICE_PASSCODE");
    [v4 setTitle:v5];

    v6 = [(DSPasscodeController *)self headerView];
    v7 = [(DSPasscodeController *)self detailText];
    [v6 setDetailText:v7];

    v8 = [(DSPasscodeController *)self boldButton];
    [v8 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];

    v9 = [(DSPasscodeController *)self boldButton];
    v10 = DSUILocStringForKey(@"DEVICE_PASSCODE_BOLD_BUTTON_TITLE");
    [v9 setTitle:v10 forState:0];

    v11 = [(DSPasscodeController *)self boldButton];
    [v11 addTarget:self action:sel_passcodeChangePressed forControlEvents:64];

    v12 = [(DSPasscodeController *)self linkButton];
    [v12 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];

    v13 = [(DSPasscodeController *)self linkButton];
    v14 = @"DEVICE_PASSCODE_LINK_BUTTON_TITLE";
  }
  else
  {
    v15 = DSUILocStringForKey(@"DEVICE_PASSCODE_CREATE");
    [v4 setTitle:v15];

    uint64_t v16 = [(DSPasscodeController *)self headerView];
    os_log_t v17 = DSUILocStringForKey(@"DEVICE_PASSCODE_CREATE_DETAIL");
    [v16 setDetailText:v17];

    v18 = [(DSPasscodeController *)self boldButton];
    [v18 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];

    v19 = [(DSPasscodeController *)self boldButton];
    objc_super v20 = DSUILocStringForKey(@"DEVICE_PASSCODE_CREATE_BOLD_BUTTON_TITLE");
    [v19 setTitle:v20 forState:0];

    objc_super v21 = [(DSPasscodeController *)self boldButton];
    [v21 addTarget:self action:sel_passcodeChangePressed forControlEvents:64];

    v22 = [(DSPasscodeController *)self linkButton];
    [v22 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];

    v13 = [(DSPasscodeController *)self linkButton];
    v14 = @"DEVICE_PASSCODE_CREATE_LINK_BUTTON_TITLE";
  }
  v23 = DSUILocStringForKey(v14);
  [v13 setTitle:v23 forState:0];

  v24 = [(DSPasscodeController *)self linkButton];
  [v24 addTarget:v25 action:sel_pushNextPane forControlEvents:64];
}

+ (BOOL)isPasscodeSet
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isPasscodeSet];

  return v3;
}

- (void)shouldShowWithCompletion:(id)a3
{
  id v3 = a3;
  objc_super v4 = sharedWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__DSPasscodeController_shouldShowWithCompletion___block_invoke;
  block[3] = &unk_264C6EBA8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __49__DSPasscodeController_shouldShowWithCompletion___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F3A368] isPasscodeModificationRestricted])
  {
    v2 = DSLog_5;
    if (os_log_type_enabled((os_log_t)DSLog_5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_235BFC000, v2, OS_LOG_TYPE_INFO, "Cannot reset passcode due to device restrictions", v5, 2u);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    objc_super v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v4();
  }
}

- (void)passcodeChangePressed
{
  if ([MEMORY[0x263F3A390] shouldShowBioRatchetFlow])
  {
    [(DSPasscodeController *)self startRatchetEvalInPresentationContext:self];
  }
  else
  {
    [(DSPasscodeController *)self displayPasscodeChangeSheet];
  }
}

- (void)displayPasscodeChangeSheet
{
  v8 = objc_alloc_init(DSPasscodePopupViewController);
  id v3 = [(DSPasscodeController *)self delegate];
  [(DSPasscodePopupViewController *)v8 setDelegate:v3];

  objc_super v4 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v8];
  [v4 setModalPresentationStyle:0];
  id v5 = [(DSPasscodeController *)self navigationController];
  [v5 presentViewController:v4 animated:1 completion:0];

  v6 = [(DSPasscodePopupViewController *)v8 navigationItem];
  id v7 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_userDidTapCancelButton_];
  [v6 setLeftBarButtonItem:v7];
}

- (void)userDidTapCancelButton:(id)a3
{
  objc_super v4 = DSLog_5;
  if (os_log_type_enabled((os_log_t)DSLog_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_235BFC000, v4, OS_LOG_TYPE_INFO, "User canceled passcode flow", v6, 2u);
  }
  id v5 = [(DSPasscodeController *)self navigationController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (id)detailText
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0
    && ([MEMORY[0x263F53C50] sharedConnection],
        objc_super v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isPasscodeRecoveryRestricted],
        v4,
        !v5))
  {
    v6 = @"DEVICE_PASSCODE_DETAIL_RECOVERY";
  }
  else
  {
    v6 = @"DEVICE_PASSCODE_DETAIL";
  }
  id v7 = DSUILocStringForKey(v6);
  return v7;
}

- (void)startRatchetEvalInPresentationContext:(id)a3
{
  v18[5] = *MEMORY[0x263EF8340];
  objc_super v4 = (objc_class *)MEMORY[0x263F10530];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = DSUIDTOLocStringForKey(@"RATCHET_ACTION_BUTTON_TITLE");
  [v6 setCountdownPrimaryActionTitle:v7];

  v8 = [(DSPasscodeController *)self delegate];
  v9 = [v8 deepLinkForCurrentFlowAndPane];

  v10 = (void *)MEMORY[0x263F10528];
  v17[0] = &unk_26E91FA70;
  v11 = DSUIDTOLocStringForKey(@"RATCHET_REASON_PASSCODE");
  v18[0] = v11;
  v17[1] = &unk_26E91FA88;
  v12 = DSUIDTOLocStringForKey(@"RATCHET_ENDED_DETAIL_PASSCODE");
  v18[1] = v12;
  v17[2] = &unk_26E91FAA0;
  v13 = [NSURL URLWithString:v9];
  v18[2] = v13;
  v18[3] = v5;
  v17[3] = &unk_26E91FAB8;
  v17[4] = &unk_26E91FAD0;
  v18[4] = MEMORY[0x263EFFA88];
  v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:5];
  v15 = [v10 makeViewControllerWithOptions:v14 configuration:v6];
  ratchetVC = self->_ratchetVC;
  self->_ratchetVC = v15;

  [(LARatchetViewController *)self->_ratchetVC setDelegate:self];
  [(LARatchetViewController *)self->_ratchetVC evaluateAndShowViewController];
}

- (void)ratchetViewController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [(DSPasscodeController *)self delegate];
  v12 = [v10 objectForKeyedSubscript:&unk_26E91FA88];

  if (v12)
  {
    [(DSPasscodeController *)self displayPasscodeChangeSheet];
    [v11 sendSummaryAnalyticsWithEventName:@"com.apple.DigitalSeparation.RatchedEnded"];
    if (v8)
    {
      v13 = [(DSPasscodeController *)self navigationController];
      v14 = [v13 viewControllers];
      v15 = (void *)[v14 mutableCopy];

      [v15 removeObject:v8];
      uint64_t v16 = [(DSPasscodeController *)self navigationController];
      [v16 setViewControllers:v15];
    }
  }
  else
  {
    os_log_t v17 = [v9 userInfo];
    v18 = [v17 objectForKeyedSubscript:*MEMORY[0x263F10460]];

    if ([v9 code] || !v18)
    {
      objc_super v20 = DSLog_5;
      if (os_log_type_enabled((os_log_t)DSLog_5, OS_LOG_TYPE_INFO))
      {
        int v27 = 138412290;
        id v28 = v9;
        _os_log_impl(&dword_235BFC000, v20, OS_LOG_TYPE_INFO, "Passcode Change Ratchet not armed. Reason: %@", (uint8_t *)&v27, 0xCu);
      }
      objc_super v21 = [(DSPasscodeController *)self navigationController];
      v22 = [v21 topViewController];
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = objc_opt_class();

      if (v23 == v24)
      {
        id v25 = [(DSPasscodeController *)self navigationController];
        id v26 = (id)[v25 popToViewController:self animated:0];

        [v11 pushNextPane];
      }
    }
    else if ([v18 rawValue] == 1)
    {
      v19 = DSLog_5;
      if (os_log_type_enabled((os_log_t)DSLog_5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_235BFC000, v19, OS_LOG_TYPE_INFO, "Passcode Change Ratchet initiated, timer counting down. User exiting Safety Check.", (uint8_t *)&v27, 2u);
      }
      [v11 exitFlowForRatchetWait];
    }
  }
}

- (DSNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OBBoldTrayButton)boldButton
{
  return self->_boldButton;
}

- (void)setBoldButton:(id)a3
{
}

- (OBLinkTrayButton)linkButton
{
  return self->_linkButton;
}

- (void)setLinkButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_boldButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ratchetVC, 0);
}

@end