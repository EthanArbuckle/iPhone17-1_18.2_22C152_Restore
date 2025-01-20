@interface VTUISiriOptinViewController
+ (BOOL)controllerNeedsToRun;
+ (BOOL)wantsUnifiedFYI;
- (BOOL)languageSupported;
- (VTUISiriOptinViewController)init;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)detailTitleString;
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

@implementation VTUISiriOptinViewController

+ (BOOL)wantsUnifiedFYI
{
  v2 = [sub_2E1C() sharedPreferences];
  unsigned __int8 v3 = [v2 assistantIsEnabled];

  return v3 & shouldShowSiriOptInPage();
}

+ (BOOL)controllerNeedsToRun
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v2 = (uint64_t (*)(void))off_CD60;
  v10 = off_CD60;
  if (!off_CD60)
  {
    unsigned __int8 v3 = (void *)sub_39EC();
    v8[3] = (uint64_t)dlsym(v3, "AFAssistantRestricted");
    off_CD60 = (_UNKNOWN *)v8[3];
    v2 = (uint64_t (*)(void))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2) {
    sub_5EB8();
  }
  if (v2()) {
    return 0;
  }
  v5 = [sub_2E1C() sharedPreferences];
  unsigned __int8 v6 = [v5 assistantIsEnabled];

  return v6 ^ shouldShowSiriOptInPage();
}

- (VTUISiriOptinViewController)init
{
  v11.receiver = self;
  v11.super_class = (Class)VTUISiriOptinViewController;
  v2 = [(VTUISiriOptinViewController *)&v11 init];
  if (v2)
  {
    unsigned __int8 v3 = [sub_2E1C() sharedPreferences];
    unsigned int v4 = [v3 assistantIsEnabled];

    int v5 = BPSShouldOfferSiriForDeviceLanguage();
    v2->_BOOL languageSupported = v5;
    if (!v4 || (v5 & 1) != 0)
    {
      if (!v5) {
        sub_5EDC();
      }
      [(VTUISiriOptinViewController *)v2 setStyle:90];
      unsigned __int8 v6 = pbb_bridge_log();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      BOOL languageSupported = v2->_languageSupported;
      *(_DWORD *)buf = 67109120;
      BOOL v13 = languageSupported;
      v8 = "Siri disabled on Phone; Setting FYI: NO, and _languageSupported: (%d); ";
    }
    else
    {
      [(VTUISiriOptinViewController *)v2 setStyle:96];
      unsigned __int8 v6 = pbb_bridge_log();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:

        return v2;
      }
      BOOL v7 = v2->_languageSupported;
      *(_DWORD *)buf = 67109120;
      BOOL v13 = v7;
      v8 = "Siri enabled on Phone; Setting FYI: (YES), and _languageSupported: (%d); ";
    }
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, v8, buf, 8u);
    goto LABEL_10;
  }
  return v2;
}

- (id)titleString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"SIRI_TITLE" value:&stru_8458 table:@"Localizable"];

  return v3;
}

- (id)detailString
{
  BOOL languageSupported = self->_languageSupported;
  unsigned __int8 v3 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v4 = v3;
  if (languageSupported) {
    CFStringRef v5 = @"SIRI_DETAIL";
  }
  else {
    CFStringRef v5 = @"SIRI_FYI_NOT_SUPPORTED_BODY";
  }
  unsigned __int8 v6 = [v3 localizedStringForKey:v5 value:&stru_8458 table:@"Localizable"];

  return v6;
}

- (id)imageResource
{
  v2 = +[BPSBridgeAppContext shared];
  unsigned __int8 v3 = [v2 activeDevice];
  unsigned int v4 = VTUISiriScreenStringForDevice();

  return v4;
}

- (void)suggestedButtonPressed:(id)a3
{
  unsigned int v4 = +[BPSBridgeAppContext shared];
  CFStringRef v5 = [v4 activeDevice];
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F06861AE-125A-424B-AF25-C1DAA8F7AEBC"];
  unsigned int v7 = [v5 supportsCapability:v6];

  if (v7)
  {
    [(VTUISiriOptinViewController *)self applyConfirmedOptin:1];
  }
  else
  {
    [(VTUISiriOptinViewController *)self showOptinConfirmationAlert:@"SIRI" optinChoice:1];
  }
}

- (void)alternateButtonPressed:(id)a3
{
}

- (void)okayButtonPressed:(id)a3
{
  id v4 = [(VTUISiriOptinViewController *)self delegate];
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
    id v4 = [(VTUISiriOptinViewController *)self delegate];
    [v4 buddyControllerDone:self nextControllerClass:objc_opt_class()];
  }
  else
  {
    VTUISetSiriEnabled(0);
    id v4 = [(VTUISiriOptinViewController *)self delegate];
    [v4 buddyControllerDone:self];
  }
}

- (id)suggestedButtonTitle
{
  if (self->_languageSupported)
  {
    v2 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned __int8 v3 = [v2 localizedStringForKey:@"SIRI_ACCEPT" value:&stru_8458 table:@"Localizable"];
  }
  else
  {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (id)okayButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"OK" value:&stru_8458 table:@"Localizable"];

  return v3;
}

- (id)alternateButtonTitle
{
  if (self->_languageSupported)
  {
    v2 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned __int8 v3 = [v2 localizedStringForKey:@"SIRI_DECLINE" value:&stru_8458 table:@"Localizable"];
  }
  else
  {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (id)learnMoreButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"ABOUT_SIRI" value:&stru_8458 table:@"Localizable"];

  return v3;
}

- (id)detailTitleString
{
  BOOL languageSupported = self->_languageSupported;
  unsigned __int8 v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = v3;
  if (languageSupported) {
    CFStringRef v5 = @"WHAT_IS_SIRI";
  }
  else {
    CFStringRef v5 = @"SIRI_FYI_NOT_SUPPORTED_TITLE";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_8458 table:@"Localizable"];

  return v6;
}

- (BOOL)languageSupported
{
  return self->_languageSupported;
}

- (void)setLanguageSupported:(BOOL)a3
{
  self->_BOOL languageSupported = a3;
}

@end