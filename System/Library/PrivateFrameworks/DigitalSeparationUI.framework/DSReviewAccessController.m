@interface DSReviewAccessController
- (DSAlternateDeviceAccessManager)accessManager;
- (DSNavigationDelegate)delegate;
- (DSReviewAccessController)init;
- (id)_descriptionTextForDeviceNameList:(id)a3 format:(id)a4;
- (void)cancelReset;
- (void)goToSafetyCheck;
- (void)presentErrorAlert:(id)a3;
- (void)presentMoreOptions;
- (void)resetAllDeviceAccess;
- (void)setAccessManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation DSReviewAccessController

- (DSReviewAccessController)init
{
  v3 = (void *)MEMORY[0x263F82818];
  v4 = [MEMORY[0x263F825C8] systemBlueColor];
  v5 = [v3 configurationWithHierarchicalColor:v4];

  v6 = DSUILocStringForKey(@"REVIEW_ACCESS");
  v7 = DSUILocStringForKey(@"REVIEW_ACCESS_DETAIL");
  v8 = [MEMORY[0x263F827E8] systemImageNamed:@"person.crop.circle.badge.exclamationmark" withConfiguration:v5];
  v14.receiver = self;
  v14.super_class = (Class)DSReviewAccessController;
  v9 = [(DSReviewAccessController *)&v14 initWithTitle:v6 detailText:v7 icon:v8];

  if (v9)
  {
    os_log_t v10 = os_log_create("com.apple.DigitalSeparation", "DSReviewAccessController");
    v11 = (void *)DSLog_12;
    DSLog_12 = (uint64_t)v10;

    v12 = +[DSAlternateDeviceAccessManager sharedManager];
    [(DSReviewAccessController *)v9 setAccessManager:v12];
  }
  return v9;
}

- (void)viewDidLoad
{
  v31.receiver = self;
  v31.super_class = (Class)DSReviewAccessController;
  [(DSOBWelcomeController *)&v31 viewDidLoad];
  v3 = DSUILocStringForKey(@"RESET_ALL");
  id v4 = +[DSUIUtilities setUpBoldButtonForController:self title:v3 target:self selector:sel_resetAllDeviceAccess];

  v5 = DSUILocStringForKey(@"MORE_OPTIONS");
  id v6 = +[DSUIUtilities setUpLinkButtonForController:self title:v5 target:self selector:sel_presentMoreOptions];

  v7 = [(DSReviewAccessController *)self accessManager];
  v8 = [v7 mirroringDevices];

  if ([v8 count])
  {
    v9 = DSUILocStringForKey(@"REVIEW_ACCESS_BULLET_MIRRORING_DETAIL");
    os_log_t v10 = [(DSReviewAccessController *)self _descriptionTextForDeviceNameList:v8 format:v9];

    v11 = DSUILocStringForKey(@"REVIEW_ACCESS_BULLET_MIRRORING");
    v12 = [MEMORY[0x263F827E8] systemImageNamed:@"macbook.and.iphone"];
    [(DSReviewAccessController *)self addBulletedListItemWithTitle:v11 description:v10 image:v12];
  }
  v13 = [(DSReviewAccessController *)self accessManager];
  objc_super v14 = [v13 syncingDevices];

  if ([v14 count])
  {
    v15 = DSUILocStringForKey(@"REVIEW_ACCESS_BULLET_PAIRING_DETAIL");
    v16 = [(DSReviewAccessController *)self _descriptionTextForDeviceNameList:v14 format:v15];

    v17 = DSUILocStringForKey(@"REVIEW_ACCESS_BULLET_PAIRING");
    v18 = [MEMORY[0x263F827E8] systemImageNamed:@"arrow.triangle.2.circlepath"];
    [(DSReviewAccessController *)self addBulletedListItemWithTitle:v17 description:v16 image:v18];
  }
  v19 = [(DSReviewAccessController *)self accessManager];
  int v20 = [v19 hasAlternateFaceID];

  if (v20)
  {
    v21 = DSUILocStringForKey(@"REVIEW_ACCESS_BULLET_ALT_BIO");
    v22 = DSUILocStringForKey(@"REVIEW_ACCESS_BULLET_ALT_FACEID_DETAIL");
    v23 = (void *)MEMORY[0x263F827E8];
    v24 = @"faceid";
LABEL_9:
    v27 = [v23 systemImageNamed:v24];
    [(DSReviewAccessController *)self addBulletedListItemWithTitle:v21 description:v22 image:v27];

    goto LABEL_10;
  }
  v25 = [(DSReviewAccessController *)self accessManager];
  int v26 = [v25 hasAlternateTouchID];

  if (v26)
  {
    v21 = DSUILocStringForKey(@"REVIEW_ACCESS_BULLET_ALT_BIO");
    v22 = DSUILocStringForKey(@"REVIEW_ACCESS_BULLET_ALT_TOUCHID_DETAIL");
    v23 = (void *)MEMORY[0x263F827E8];
    v24 = @"touchid";
    goto LABEL_9;
  }
LABEL_10:
  v28 = DSUILocStringForKey(@"REVIEW_ACCESS_BULLET_PASSCODE");
  v29 = DSUILocStringForKey(@"REVIEW_ACCESS_BULLET_PASSCODE_DETAIL");
  v30 = [MEMORY[0x263F827E8] _systemImageNamed:@"dots.below.lock"];
  [(DSReviewAccessController *)self addBulletedListItemWithTitle:v28 description:v29 image:v30];
}

- (id)_descriptionTextForDeviceNameList:(id)a3 format:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 count] - 1;
  v8 = NSString;
  v9 = DSLocStringForKey();
  os_log_t v10 = [v6 firstObject];

  v11 = objc_msgSend(v8, "localizedStringWithFormat:", v9, v10, v7);

  v12 = objc_msgSend(NSString, "localizedStringWithFormat:", v5, v11);

  return v12;
}

- (void)resetAllDeviceAccess
{
  v3 = [(DSReviewAccessController *)self buttonTray];
  [v3 showButtonsBusy];

  id v4 = DSLog_12;
  if (os_log_type_enabled((os_log_t)DSLog_12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235BFC000, v4, OS_LOG_TYPE_INFO, "Resetting all alternative device access methods", buf, 2u);
  }
  id v5 = [(DSReviewAccessController *)self accessManager];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__DSReviewAccessController_resetAllDeviceAccess__block_invoke;
  v6[3] = &unk_264C6F008;
  v6[4] = self;
  [v5 resetAllAccessMethodsWithCompletion:v6];
}

void __48__DSReviewAccessController_resetAllDeviceAccess__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__DSReviewAccessController_resetAllDeviceAccess__block_invoke_2;
  v5[3] = &unk_264C6ED28;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __48__DSReviewAccessController_resetAllDeviceAccess__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) buttonTray];
  [v2 showButtonsAvailable];

  if (*(void *)(a1 + 40))
  {
    id v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "presentErrorAlert:");
  }
  else
  {
    id v4 = DSLog_12;
    if (os_log_type_enabled((os_log_t)DSLog_12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_235BFC000, v4, OS_LOG_TYPE_INFO, "Successfully reset alternative device access methods", v6, 2u);
    }
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 pushPaneAfterPaneType:objc_opt_class()];
  }
}

- (void)presentErrorAlert:(id)a3
{
  id v4 = a3;
  id v5 = DSLog_12;
  if (os_log_type_enabled((os_log_t)DSLog_12, OS_LOG_TYPE_ERROR)) {
    -[DSReviewAccessController presentErrorAlert:]((uint64_t)v4, v5);
  }
  id v6 = [(DSReviewAccessController *)self delegate];
  [v6 pushPaneAfterPaneType:objc_opt_class()];
}

- (void)presentMoreOptions
{
  id v3 = (void *)MEMORY[0x263F82418];
  id v4 = DSUILocStringForKey(@"MORE_OPTIONS_ALERT");
  id v5 = [v3 alertControllerWithTitle:0 message:v4 preferredStyle:0];

  id v6 = (void *)MEMORY[0x263F82400];
  uint64_t v7 = DSUILocStringForKey(@"GO_TO_SAFETY_CHECK");
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __46__DSReviewAccessController_presentMoreOptions__block_invoke;
  v16[3] = &unk_264C6E848;
  v16[4] = self;
  v8 = [v6 actionWithTitle:v7 style:0 handler:v16];

  v9 = (void *)MEMORY[0x263F82400];
  os_log_t v10 = DSUILocStringForKey(@"CANCEL_RESET_ACCESS");
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __46__DSReviewAccessController_presentMoreOptions__block_invoke_2;
  v15[3] = &unk_264C6E848;
  v15[4] = self;
  v11 = [v9 actionWithTitle:v10 style:0 handler:v15];

  v12 = (void *)MEMORY[0x263F82400];
  v13 = DSUILocStringForKey(@"CANCEL");
  objc_super v14 = [v12 actionWithTitle:v13 style:1 handler:&__block_literal_global_15];

  [v5 addAction:v8];
  [v5 addAction:v11];
  [v5 addAction:v14];
  [(DSReviewAccessController *)self presentViewController:v5 animated:1 completion:0];
}

uint64_t __46__DSReviewAccessController_presentMoreOptions__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) goToSafetyCheck];
}

uint64_t __46__DSReviewAccessController_presentMoreOptions__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelReset];
}

- (void)goToSafetyCheck
{
  id v3 = [(DSReviewAccessController *)self accessManager];
  [v3 sendSummaryAnalyticsWithReviewAction:1 resetAction:0 exit:1];

  id v4 = [(DSReviewAccessController *)self delegate];
  [v4 goToCustomizeSharing];
}

- (void)cancelReset
{
  id v3 = [(DSReviewAccessController *)self accessManager];
  [v3 sendSummaryAnalyticsWithReviewAction:1 resetAction:0 exit:0];

  id v4 = [(DSReviewAccessController *)self presentingViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (DSNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DSAlternateDeviceAccessManager)accessManager
{
  return self->_accessManager;
}

- (void)setAccessManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)presentErrorAlert:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235BFC000, a2, OS_LOG_TYPE_ERROR, "Error resetting device access methods: %@", (uint8_t *)&v2, 0xCu);
}

@end