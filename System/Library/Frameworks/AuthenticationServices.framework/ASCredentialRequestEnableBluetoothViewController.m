@interface ASCredentialRequestEnableBluetoothViewController
- (ASCAuthorizationPresentationContext)presentationContext;
- (ASCredentialRequestEnableBluetoothViewController)initWithPresentationContext:(id)a3 activity:(id)a4;
- (id)_message;
- (id)enableBluetoothHandler;
- (void)_enableBluetooth;
- (void)_setUpButtonPane;
- (void)_setUpMessagePane;
- (void)_setUpTitlePane;
- (void)setEnableBluetoothHandler:(id)a3;
- (void)viewDidLoad;
@end

@implementation ASCredentialRequestEnableBluetoothViewController

- (ASCredentialRequestEnableBluetoothViewController)initWithPresentationContext:(id)a3 activity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ASCredentialRequestEnableBluetoothViewController;
  v9 = [(ASCredentialRequestPaneViewController *)&v13 initRequiringTableView:0];
  v10 = (ASCredentialRequestEnableBluetoothViewController *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 133, a3);
    objc_storeStrong((id *)&v10->_authorizationActivity, a4);
    v11 = v10;
  }

  return v10;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)ASCredentialRequestEnableBluetoothViewController;
  [(ASCredentialRequestPaneViewController *)&v5 viewDidLoad];
  v3 = [(ASCredentialRequestPaneViewController *)self headerPaneContext];
  [v3 addEmptyViewWithSpacing:60.0];

  [(ASCredentialRequestEnableBluetoothViewController *)self _setUpTitlePane];
  [(ASCredentialRequestEnableBluetoothViewController *)self _setUpMessagePane];
  [(ASCredentialRequestEnableBluetoothViewController *)self _setUpButtonPane];
  v4 = [(ASCredentialRequestPaneViewController *)self headerPaneContext];
  [v4 addEmptyViewWithSpacing:0.0];

  [(ASCredentialRequestPaneViewController *)self sizeToFitPaneContent];
}

- (void)_setUpTitlePane
{
  _WBSLocalizedString();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = objc_alloc_init(MEMORY[0x263F828E0]);
  [v3 setAdjustsFontForContentSizeCategory:1];
  [v3 setAdjustsFontSizeToFitWidth:1];
  [v3 setMaximumContentSizeCategory:*MEMORY[0x263F83410]];
  v4 = [MEMORY[0x263F82760] _preferredFontForTextStyle:*MEMORY[0x263F835D0] weight:*MEMORY[0x263F83638]];
  [v3 setFont:v4];

  [v3 setText:v7];
  objc_super v5 = [[ASCredentialRequestSubPane alloc] initWithView:v3];
  v6 = [(ASCredentialRequestPaneViewController *)self headerPaneContext];
  [v6 addSubPane:v5 withCustomSpacingAfter:16.0];
}

- (void)_setUpMessagePane
{
  id v3 = [ASCredentialRequestInfoLabelSubPane alloc];
  v4 = [(ASCredentialRequestEnableBluetoothViewController *)self _message];
  v6 = [(ASCredentialRequestInfoLabelSubPane *)v3 initWithString:v4 labelType:0];

  objc_super v5 = [(ASCredentialRequestPaneViewController *)self headerPaneContext];
  [v5 addSubPane:v6 withCustomSpacingAfter:40.0];
}

- (void)_setUpButtonPane
{
  v6 = [[ASCredentialRequestConfirmButtonSubPane alloc] initWithActivity:self->_authorizationActivity];
  id v3 = _WBSLocalizedString();
  [(ASCredentialRequestConfirmButtonSubPane *)v6 setButtonText:v3];

  v4 = [(ASCredentialRequestConfirmButtonSubPane *)v6 authorizationButton];
  [v4 addTarget:self action:sel__enableBluetooth];

  objc_super v5 = [(ASCredentialRequestPaneViewController *)self headerPaneContext];
  [v5 addSubPane:v6 withCustomSpacingAfter:80.0];
}

- (id)_message
{
  id v3 = [(ASCAuthorizationPresentationContext *)self->_presentationContext cableAuthenticatorURL];

  if (v3)
  {
    v4 = [MEMORY[0x263F66290] currentDevice];
    [v4 deviceClass];
  }
  else
  {
    [(ASCAuthorizationPresentationContext *)self->_presentationContext isRegistrationRequest];
    objc_super v5 = [MEMORY[0x263F66290] currentDevice];
    [v5 deviceClass];
  }
  v6 = _WBSLocalizedString();

  return v6;
}

- (void)_enableBluetooth
{
  enableBluetoothHandler = (void (**)(void))self->_enableBluetoothHandler;
  if (enableBluetoothHandler) {
    enableBluetoothHandler[2]();
  }
}

- (ASCAuthorizationPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (id)enableBluetoothHandler
{
  return self->_enableBluetoothHandler;
}

- (void)setEnableBluetoothHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_enableBluetoothHandler, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);

  objc_storeStrong((id *)&self->_authorizationActivity, 0);
}

@end