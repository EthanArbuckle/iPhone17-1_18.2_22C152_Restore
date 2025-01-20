@interface DSPrivateRelayController
+ (void)initialize;
- (DSNavigationDelegate)delegate;
- (DSPrivateRelayController)init;
- (OBBoldTrayButton)enableButton;
- (OBLinkTrayButton)linkButton;
- (id)enableButtonTitle;
- (id)privateRelayDetailText;
- (unint64_t)proxyServiceStatus;
- (void)learnMorePressed;
- (void)setDelegate:(id)a3;
- (void)setEnableButton:(id)a3;
- (void)setLinkButton:(id)a3;
- (void)setPrivateRelayEnabledWithHandler:(id)a3;
- (void)setProxyServiceStatus:(unint64_t)a3;
- (void)shouldShowWithCompletion:(id)a3;
- (void)turnOnPrivateRelay;
- (void)viewDidLoad;
@end

@implementation DSPrivateRelayController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    DSLogPrivateRelay = (uint64_t)os_log_create("com.apple.DigitalSeparation", "DSPrivateRelayController");
    MEMORY[0x270F9A758]();
  }
}

- (DSPrivateRelayController)init
{
  v3 = DSUILocStringForKey(@"PRIVATE_RELAY_TITLE");
  v4 = +[DSUIUtilities valueForUnfinalizedString:v3];
  v5 = [MEMORY[0x263F827E8] systemImageNamed:@"network.badge.shield.half.filled"];
  v8.receiver = self;
  v8.super_class = (Class)DSPrivateRelayController;
  v6 = [(DSPrivateRelayController *)&v8 initWithTitle:v4 detailText:0 icon:v5];

  return v6;
}

- (void)shouldShowWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = sharedWorkQueue();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke;
  v7[3] = &unk_264C6EDF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F3A368] isPrivateRelayRestricted])
  {
    v2 = DSLogPrivateRelay;
    if (os_log_type_enabled((os_log_t)DSLogPrivateRelay, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235BFC000, v2, OS_LOG_TYPE_INFO, "Private Relay restricted by ScreenTime/MDM", buf, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = (void *)MEMORY[0x263F58270];
    id v4 = sharedWorkQueue();
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_298;
    v6[3] = &unk_264C6EDC8;
    id v5 = *(id *)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    id v7 = v5;
    [v3 getPrivacyProxyAccountType:v4 completionHandler:v6];
  }
}

void __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_298(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)DSLogPrivateRelay, OS_LOG_TYPE_ERROR)) {
      __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_298_cold_1();
    }
    goto LABEL_6;
  }
  if (a2 != 2)
  {
LABEL_6:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_7;
  }
  id v6 = (void *)MEMORY[0x263F58270];
  id v7 = sharedWorkQueue();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_299;
  v9[3] = &unk_264C6EDA0;
  id v8 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v8;
  [v6 getServiceStatus:v7 completionHandler:v9];

LABEL_7:
}

void __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_299(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)DSLogPrivateRelay, OS_LOG_TYPE_ERROR)) {
    __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_299_cold_1();
  }
  uint64_t v7 = [v5 serviceStatus];
  [*(id *)(a1 + 32) setProxyServiceStatus:v7];
  if (v7 == 6)
  {
    id v8 = DSLogPrivateRelay;
    if (os_log_type_enabled((os_log_t)DSLogPrivateRelay, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235BFC000, v8, OS_LOG_TYPE_INFO, "User has Private Relay access but is in an unsupported region", buf, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v9 = (void *)MEMORY[0x263F58270];
    id v10 = sharedWorkQueue();
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_300;
    v11[3] = &unk_264C6ED78;
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = v7;
    [v9 getGeohashSharingPreference:v10 completionHandler:v11];
  }
}

void __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_300(uint64_t a1, unsigned int a2, void *a3)
{
  id v5 = a3;
  if (v5 && os_log_type_enabled((os_log_t)DSLogPrivateRelay, OS_LOG_TYPE_ERROR)) {
    __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_300_cold_1();
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6 == 1) {
    unsigned int v7 = a2;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v6) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 1;
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v8);
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)DSPrivateRelayController;
  [(DSOBWelcomeController *)&v11 viewDidLoad];
  v3 = [(DSPrivateRelayController *)self headerView];
  id v4 = [(DSPrivateRelayController *)self privateRelayDetailText];
  [v3 setDetailText:v4];

  id v5 = [(DSPrivateRelayController *)self enableButtonTitle];
  uint64_t v6 = +[DSUIUtilities setUpBoldButtonForController:self title:v5 target:self selector:sel_turnOnPrivateRelay];
  [(DSPrivateRelayController *)self setEnableButton:v6];

  unsigned int v7 = DSUILocStringForKey(@"SKIP");
  uint64_t v8 = [(DSPrivateRelayController *)self delegate];
  v9 = +[DSUIUtilities setUpLinkButtonForController:self title:v7 target:v8 selector:sel_pushNextPane];
  [(DSPrivateRelayController *)self setLinkButton:v9];

  id v10 = +[DSUIUtilities setUpLearnMoreButtonForController:self selector:sel_learnMorePressed];
}

- (void)turnOnPrivateRelay
{
  v3 = [(DSPrivateRelayController *)self buttonTray];
  [v3 showButtonsBusy];

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__DSPrivateRelayController_turnOnPrivateRelay__block_invoke;
  v4[3] = &unk_264C6EAC0;
  objc_copyWeak(&v5, &location);
  [(DSPrivateRelayController *)self setPrivateRelayEnabledWithHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __46__DSPrivateRelayController_turnOnPrivateRelay__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)DSLogPrivateRelay, OS_LOG_TYPE_ERROR)) {
      __46__DSPrivateRelayController_turnOnPrivateRelay__block_invoke_cold_1();
    }
    uint64_t v6 = DSUILocStringForKey(@"PRIVATE_RELAY_FAILURE_TITLE");
    unsigned int v7 = +[DSUIUtilities valueForUnfinalizedString:v6];
    uint64_t v8 = DSUILocStringForKey(@"PRIVATE_RELAY_FAILURE_DETAIL");
    v9 = +[DSUIUtilities valueForUnfinalizedString:v8];
    void v11[4] = v5;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __46__DSPrivateRelayController_turnOnPrivateRelay__block_invoke_322;
    v12[3] = &unk_264C6E848;
    v12[4] = v5;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __46__DSPrivateRelayController_turnOnPrivateRelay__block_invoke_2;
    v11[3] = &unk_264C6E848;
    [v5 presentErrorAlertWithTitle:v7 message:v9 continueHandler:v12 tryAgainHandler:v11];
  }
  else
  {
    id v10 = [WeakRetained buttonTray];
    [v10 showButtonsAvailable];

    uint64_t v6 = [v5 delegate];
    [v6 pushNextPane];
  }
}

void __46__DSPrivateRelayController_turnOnPrivateRelay__block_invoke_322(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) buttonTray];
  [v2 showButtonsAvailable];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 pushNextPane];
}

uint64_t __46__DSPrivateRelayController_turnOnPrivateRelay__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) turnOnPrivateRelay];
}

- (void)setPrivateRelayEnabledWithHandler:(id)a3
{
  id v3 = a3;
  id v4 = sharedWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__DSPrivateRelayController_setPrivateRelayEnabledWithHandler___block_invoke;
  block[3] = &unk_264C6EBA8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __62__DSPrivateRelayController_setPrivateRelayEnabledWithHandler___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F58270];
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __62__DSPrivateRelayController_setPrivateRelayEnabledWithHandler___block_invoke_2;
  v2[3] = &unk_264C6EBF8;
  id v3 = *(id *)(a1 + 32);
  [v1 setUserTier:2 queue:MEMORY[0x263EF83A0] completionHandler:v2];
}

void __62__DSPrivateRelayController_setPrivateRelayEnabledWithHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v2();
  }
  else
  {
    id v3 = (void *)MEMORY[0x263F58270];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __62__DSPrivateRelayController_setPrivateRelayEnabledWithHandler___block_invoke_3;
    v4[3] = &unk_264C6EBF8;
    id v5 = *(id *)(a1 + 32);
    [v3 setGeohashSharingPreference:0 queue:MEMORY[0x263EF83A0] completionHandler:v4];
  }
}

uint64_t __62__DSPrivateRelayController_setPrivateRelayEnabledWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)learnMorePressed
{
  id v5 = [(DSPrivateRelayController *)self delegate];
  id v3 = DSUILocStringForKey(@"PRIVATE_RELAY_LEARN_MORE_URL");
  id v4 = +[DSUIUtilities valueForUnfinalizedString:v3];
  [v5 learnMorePressedForController:self withURL:v4];
}

- (id)enableButtonTitle
{
  if ([(DSPrivateRelayController *)self proxyServiceStatus] == 1) {
    v2 = @"ENABLE_BROAD_IP_TITLE";
  }
  else {
    v2 = @"ENABLE_PRIVATE_RELAY_TITLE";
  }
  id v3 = DSUILocStringForKey(v2);
  id v4 = +[DSUIUtilities valueForUnfinalizedString:v3];

  return v4;
}

- (id)privateRelayDetailText
{
  if ([(DSPrivateRelayController *)self proxyServiceStatus] == 1) {
    v2 = @"PRIVATE_RELAY_USER_HAS_LOCALIZED_ADDRESS_DETAIL";
  }
  else {
    v2 = @"PRIVATE_RELAY_SUBSCRIPTION_TURNED_OFF_DETAIL";
  }
  id v3 = DSUILocStringForKey(v2);
  id v4 = +[DSUIUtilities valueForUnfinalizedString:v3];

  return v4;
}

- (DSNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OBBoldTrayButton)enableButton
{
  return self->_enableButton;
}

- (void)setEnableButton:(id)a3
{
}

- (OBLinkTrayButton)linkButton
{
  return self->_linkButton;
}

- (void)setLinkButton:(id)a3
{
}

- (unint64_t)proxyServiceStatus
{
  return self->_proxyServiceStatus;
}

- (void)setProxyServiceStatus:(unint64_t)a3
{
  self->_proxyServiceStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_enableButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_298_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "An error occurred while getting Private Relay account type: %@", v2, v3, v4, v5, v6);
}

void __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_299_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "An error occurred while getting Private Relay service status: %@", v2, v3, v4, v5, v6);
}

void __53__DSPrivateRelayController_shouldShowWithCompletion___block_invoke_300_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "An error occurred while getting Private Relay IP Address setting: %@", v2, v3, v4, v5, v6);
}

void __46__DSPrivateRelayController_turnOnPrivateRelay__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "Error enabling private relay: %@", v2, v3, v4, v5, v6);
}

@end