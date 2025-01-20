@interface VTUITinkerSiriOptinViewController
+ (BOOL)controllerNeedsToRun;
- (BOOL)languageSupported;
- (VTUITinkerSiriOptinViewController)init;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)imageResource;
- (id)learnMoreButtonTitle;
- (id)okayButtonTitle;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)alternateButtonPressed:(id)a3;
- (void)applyConfirmedOptin:(BOOL)a3;
- (void)learnMoreButtonPressed:(id)a3;
- (void)okayButtonPressed:(id)a3;
- (void)setLanguageSupported:(BOOL)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation VTUITinkerSiriOptinViewController

+ (BOOL)controllerNeedsToRun
{
  return 1;
}

- (VTUITinkerSiriOptinViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)VTUITinkerSiriOptinViewController;
  v2 = [(VTUITinkerSiriOptinViewController *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_languageSupported = 1;
    [(VTUITinkerSiriOptinViewController *)v2 setStyle:90];
  }
  return v3;
}

- (id)titleString
{
  if (self->_languageSupported)
  {
    v2 = [(VTUITinkerSiriOptinViewController *)self delegate];
    v3 = [v2 setupFlowUserInfo];
    v4 = [v3 objectForKey:BPSPairingFlowFamilyMember];
    objc_super v5 = [v4 firstName];
    v6 = [v5 localizedCapitalizedString];

    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"SIRI_TINKER_TITLE_%@" value:&stru_8458 table:@"Localizable"];
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v6);
  }
  else
  {
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v9 = [v6 localizedStringForKey:@"SIRI_FYI_NOT_SUPPORTED_TITLE" value:&stru_8458 table:@"Localizable"];
  }

  return v9;
}

- (id)detailString
{
  v3 = [(VTUITinkerSiriOptinViewController *)self delegate];
  v4 = [v3 setupFlowUserInfo];
  objc_super v5 = [v4 objectForKey:BPSPairingFlowFamilyMember];
  v6 = [v5 firstName];
  v7 = [v6 localizedCapitalizedString];

  LODWORD(v4) = self->_languageSupported;
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = v8;
  if (v4)
  {
    v10 = [v8 localizedStringForKey:@"SIRI_DETAIL_TINKER_%@_%@" value:&stru_8458 table:@"Localizable"];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v7, v7);
  }
  else
  {
    v10 = [v8 localizedStringForKey:@"SIRI_FYI_NOT_SUPPORTED_BODY_TINKER_%@" value:&stru_8458 table:@"Localizable"];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v7, v13);
  v11 = };

  return v11;
}

- (id)imageResource
{
  v2 = +[BPSBridgeAppContext shared];
  v3 = [v2 activeDevice];
  v4 = VTUISiriScreenStringForDevice();

  return v4;
}

- (void)suggestedButtonPressed:(id)a3
{
}

- (void)alternateButtonPressed:(id)a3
{
}

- (void)okayButtonPressed:(id)a3
{
  id v4 = [(VTUITinkerSiriOptinViewController *)self delegate];
  [v4 buddyControllerDone:self];
}

- (void)learnMoreButtonPressed:(id)a3
{
  id v4 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:OBPrivacyAskSiriIdentifier];
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (void)applyConfirmedOptin:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(VTUITinkerSiriOptinViewController *)self delegate];
    [v4 buddyControllerDone:self nextControllerClass:objc_opt_class()];
  }
  else
  {
    VTUITinkerSetSiriEnabled(0);
    id v4 = [(VTUITinkerSiriOptinViewController *)self delegate];
    [v4 buddyControllerDone:self];
  }
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"SIRI_ACCEPT" value:&stru_8458 table:@"Localizable"];

  return v3;
}

- (id)okayButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"OK" value:&stru_8458 table:@"Localizable"];

  return v3;
}

- (id)alternateButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"SIRI_DECLINE" value:&stru_8458 table:@"Localizable"];

  return v3;
}

- (id)learnMoreButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"ABOUT_SIRI" value:&stru_8458 table:@"Localizable"];

  return v3;
}

- (BOOL)languageSupported
{
  return self->_languageSupported;
}

- (void)setLanguageSupported:(BOOL)a3
{
  self->_languageSupported = a3;
}

@end