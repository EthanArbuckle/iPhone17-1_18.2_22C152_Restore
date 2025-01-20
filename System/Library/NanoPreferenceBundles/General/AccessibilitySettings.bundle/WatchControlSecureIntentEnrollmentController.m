@interface WatchControlSecureIntentEnrollmentController
- (void)_cancelEnrollment;
- (void)_continueEnrollment;
- (void)_dismissEnrollment;
- (void)connectedDevicesDidChange:(id)a3;
- (void)didReceiveIncomingData:(id)a3;
- (void)viewDidLoad;
@end

@implementation WatchControlSecureIntentEnrollmentController

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)WatchControlSecureIntentEnrollmentController;
  [(OBNavigationController *)&v21 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x263F5B918]);
  v4 = settingsLocString(@"SIDE_BUTTON_ALERT_TITLE", @"AccessibilitySettings-watchcontrol");
  v5 = settingsLocString(@"SIDE_BUTTON_ALERT_MESSAGE", @"AccessibilitySettings-watchcontrol");
  v6 = (OBWelcomeController *)[v3 initWithTitle:v4 detailText:v5 icon:0];
  welcomeController = self->_welcomeController;
  self->_welcomeController = v6;

  v8 = [MEMORY[0x263F5B898] boldButton];
  continueButton = self->_continueButton;
  self->_continueButton = v8;

  v10 = self->_continueButton;
  v11 = settingsLocString(@"SIDE_BUTTON_ALERT_BUTTON_CONTINUE", @"AccessibilitySettings-watchcontrol");
  [(OBTrayButton *)v10 setTitle:v11 forState:0];

  [(OBTrayButton *)self->_continueButton addTarget:self action:sel__continueEnrollment forEvents:64];
  v12 = [(OBWelcomeController *)self->_welcomeController buttonTray];
  [v12 addButton:self->_continueButton];

  v13 = [MEMORY[0x263F5B910] buttonWithType:1];
  notNowButton = self->_notNowButton;
  self->_notNowButton = v13;

  v15 = self->_notNowButton;
  v16 = settingsLocString(@"SIDE_BUTTON_ALERT_BUTTON_CANCEL", @"AccessibilitySettings-watchcontrol");
  [(OBTrayButton *)v15 setTitle:v16 forState:0];

  [(OBTrayButton *)self->_notNowButton addTarget:self action:sel__cancelEnrollment forEvents:64];
  v17 = [(OBWelcomeController *)self->_welcomeController buttonTray];
  [v17 addButton:self->_notNowButton];

  v18 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelEnrollment];
  v19 = [(OBWelcomeController *)self->_welcomeController navigationItem];
  [v19 setLeftBarButtonItem:v18];

  [(OBNavigationController *)self pushViewController:self->_welcomeController animated:1];
  v20 = [MEMORY[0x263F214B0] sharedInstance];
  [v20 registerForIncomingData:self];
}

- (void)_continueEnrollment
{
  +[AccessibilityBridgeBaseController setGizmoAccessibilityPref:MEMORY[0x263EFFA88] forKey:@"WatchControlRequestEnrollmentAlert"];
  id v5 = (id)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v5];
  v4 = [(OBWelcomeController *)self->_welcomeController navigationItem];
  [v4 setRightBarButtonItem:v3];

  [v5 startAnimating];
  [(OBTrayButton *)self->_continueButton setEnabled:0];
  [(OBTrayButton *)self->_notNowButton setEnabled:0];
  self->_didStartEnrollment = 1;
}

- (void)_cancelEnrollment
{
}

uint64_t __65__WatchControlSecureIntentEnrollmentController__cancelEnrollment__block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[1448])
  {
    id v3 = [MEMORY[0x263F214B0] sharedInstance];
    id v4 = (id)[v3 publishMessage:&unk_26FB00870 priority:2 requestingResponse:0];

    v2 = *(unsigned char **)(a1 + 32);
  }

  return [v2 _dismissEnrollment];
}

- (void)_dismissEnrollment
{
}

uint64_t __66__WatchControlSecureIntentEnrollmentController__dismissEnrollment__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F214B0] sharedInstance];
  [v2 deregisterForIncomingData:*(void *)(a1 + 32)];

  id v3 = *(void **)(a1 + 32);

  return [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)didReceiveIncomingData:(id)a3
{
  id v6 = [a3 objectForKeyedSubscript:*MEMORY[0x263F214A0]];
  id v4 = [v6 objectForKeyedSubscript:@"ASTDoubleClickAlertDismissed"];
  int v5 = [v4 BOOLValue];

  if (v5) {
    [(WatchControlSecureIntentEnrollmentController *)self _dismissEnrollment];
  }
}

- (void)connectedDevicesDidChange:(id)a3
{
  if (![a3 count])
  {
    [(WatchControlSecureIntentEnrollmentController *)self _cancelEnrollment];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notNowButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);

  objc_storeStrong((id *)&self->_welcomeController, 0);
}

@end