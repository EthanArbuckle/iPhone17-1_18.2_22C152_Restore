@interface ASCredentialRequestEnableICloudKeychainViewController
- (ASCredentialRequestEnableICloudKeychainViewController)init;
- (void)_turnOnICloudKeychain;
- (void)viewDidLoad;
@end

@implementation ASCredentialRequestEnableICloudKeychainViewController

- (ASCredentialRequestEnableICloudKeychainViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)ASCredentialRequestEnableICloudKeychainViewController;
  v2 = [(ASCredentialRequestPaneViewController *)&v6 initRequiringTableView:1];
  if (v2)
  {
    v3 = [MEMORY[0x263F662C8] sharedMonitor];
    v2->_canKeychainSyncBeEnabled = [v3 canKeychainSyncBeEnabled];

    v4 = v2;
  }

  return v2;
}

- (void)viewDidLoad
{
  v18[1] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)ASCredentialRequestEnableICloudKeychainViewController;
  [(ASCredentialRequestPaneViewController *)&v17 viewDidLoad];
  if (self->_canKeychainSyncBeEnabled)
  {
    v3 = _WBSLocalizedString();
    [MEMORY[0x263F662A0] isAppleAccountBrandingEnabled];
    v4 = _WBSLocalizedString();
    v5 = 0;
  }
  else
  {
    v4 = _WBSLocalizedString();
    v5 = +[ASCredentialRequestIconGenerator passwordManagerIcon];
    v3 = 0;
  }
  objc_super v6 = [[ASCredentialRequestInfoLabelSubPane alloc] initWithString:v4 labelStyle:3];
  v7 = [(ASCredentialRequestPaneViewController *)self headerPaneContext];
  [v7 addIcon:v5 iconStyle:0 title:v3 titleStyle:2 subtitlePane:v6 subtitleStyle:3 subtitleBottomSpacing:&unk_26CAA5598];

  if (self->_canKeychainSyncBeEnabled)
  {
    v8 = [ASCredentialRequestButtonContinue alloc];
    v9 = -[ASCredentialRequestButtonContinue initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    v10 = _WBSLocalizedString();
    [(ASCredentialRequestButton *)v9 setButtonText:v10];

    [(ASCredentialRequestButton *)v9 addTarget:self action:sel__turnOnICloudKeychain];
    v11 = (void *)MEMORY[0x263F08938];
    v12 = [(ASCredentialRequestButtonContinue *)v9 heightAnchor];
    +[ASViewServiceInterfaceUtilities continueButtonHeight];
    v13 = objc_msgSend(v12, "constraintEqualToConstant:");
    v18[0] = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    [v11 activateConstraints:v14];

    v15 = [(ASCredentialRequestPaneViewController *)self paneFooterStackView];
    [v15 addArrangedSubview:v9];

    v16 = [(ASCredentialRequestPaneViewController *)self footerPaneContext];
    [v16 addEmptyViewWithSpacing:3.40282347e38];
  }
}

- (void)_turnOnICloudKeychain
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.KeychainSync"];
  v3 = [MEMORY[0x263F01880] defaultWorkspace];
  uint64_t v5 = *MEMORY[0x263F3F5E8];
  v6[0] = MEMORY[0x263EFFA88];
  v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v3 openSensitiveURL:v2 withOptions:v4];
}

@end