@interface DSPasscodeChangedController
- (DSAlternateDeviceAccessManager)accessManager;
- (DSNavigationDelegate)delegate;
- (DSPasscodeChangedController)init;
- (void)finishFlow;
- (void)reviewAccessPressed;
- (void)setAccessManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation DSPasscodeChangedController

- (DSPasscodeChangedController)init
{
  v3 = (void *)MEMORY[0x263F82818];
  v4 = [MEMORY[0x263F825C8] systemBlueColor];
  v5 = [v3 configurationWithHierarchicalColor:v4];

  v6 = DSUILocStringForKey(@"PASSCODE_CHANGED");
  v7 = DSUILocStringForKey(@"PASSCODE_CHANGED_DETAIL");
  v8 = [MEMORY[0x263F827E8] systemImageNamed:@"checkmark.circle.fill" withConfiguration:v5];
  v14.receiver = self;
  v14.super_class = (Class)DSPasscodeChangedController;
  v9 = [(DSPasscodeChangedController *)&v14 initWithTitle:v6 detailText:v7 icon:v8];

  if (v9)
  {
    os_log_t v10 = os_log_create("com.apple.DigitalSeparation", "DSPasscodeChangedController");
    v11 = (void *)DSLog_6;
    DSLog_6 = (uint64_t)v10;

    v12 = +[DSAlternateDeviceAccessManager sharedManager];
    [(DSPasscodeChangedController *)v9 setAccessManager:v12];
  }
  return v9;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)DSPasscodeChangedController;
  [(DSOBWelcomeController *)&v8 viewDidLoad];
  v3 = [MEMORY[0x263F5B8B8] accessoryButton];
  v4 = DSUILocStringForKey(@"REVIEW_ACCESS");
  [v3 setTitle:v4 forState:0];

  [v3 addTarget:self action:sel_reviewAccessPressed forControlEvents:64];
  v5 = [(DSPasscodeChangedController *)self headerView];
  [v5 addAccessoryButton:v3];

  v6 = DSUILocStringForKey(@"DONE");
  id v7 = +[DSUIUtilities setUpBoldButtonForController:self title:v6 target:self selector:sel_finishFlow];
}

- (void)reviewAccessPressed
{
  id v2 = [(DSPasscodeChangedController *)self delegate];
  [v2 pushPaneAfterPaneType:objc_opt_class()];
}

- (void)finishFlow
{
  v3 = [(DSPasscodeChangedController *)self accessManager];
  [v3 sendSummaryAnalyticsWithReviewAction:0 resetAction:0 exit:0];

  id v4 = [(DSPasscodeChangedController *)self presentingViewController];
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

@end