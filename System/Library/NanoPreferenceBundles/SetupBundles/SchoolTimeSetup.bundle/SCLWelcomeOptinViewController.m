@interface SCLWelcomeOptinViewController
- (BOOL)legacyButtonStyles;
- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate;
- (NSBundle)stringsBundle;
- (SCLSetupPrincipleClass)flowController;
- (SCLWelcomeOptinViewController)init;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)familyMember;
- (id)imageResource;
- (id)imageResourceBundleIdentifier;
- (id)privacyBundles;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)alternateButtonPressed:(id)a3;
- (void)setFlowController:(id)a3;
- (void)setMiniFlowDelegate:(id)a3;
- (void)setStringsBundle:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
- (void)viewDidLoad;
@end

@implementation SCLWelcomeOptinViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)SCLWelcomeOptinViewController;
  [(SCLWelcomeOptinViewController *)&v2 viewDidLoad];
}

- (SCLWelcomeOptinViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCLWelcomeOptinViewController;
  objc_super v2 = [(SCLWelcomeOptinViewController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
    stringsBundle = v2->_stringsBundle;
    v2->_stringsBundle = (NSBundle *)v3;

    [(SCLWelcomeOptinViewController *)v2 setStyle:74];
  }
  return v2;
}

- (id)familyMember
{
  objc_super v2 = [(SCLWelcomeOptinViewController *)self flowController];
  uint64_t v3 = [v2 delegate];

  if (v3)
  {
    v4 = [v3 setupFlowUserInfo];
    v5 = v4;
    if (v4)
    {
      objc_super v6 = [v4 objectForKey:BPSPairingFlowFamilyMember];
      if (v6) {
        goto LABEL_13;
      }
      v7 = scl_pairing_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_58C8((uint64_t)v5, v7);
      }
    }
    else
    {
      v7 = scl_pairing_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_5884(v7);
      }
      objc_super v6 = 0;
    }
  }
  else
  {
    v5 = scl_pairing_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_5840(v5);
    }
    objc_super v6 = 0;
  }
LABEL_13:

  return v6;
}

- (id)titleString
{
  uint64_t v3 = [(SCLWelcomeOptinViewController *)self stringsBundle];
  v4 = [v3 localizedStringForKey:@"SCHOOLTIME_ONBOARDING_TITLE" value:&stru_83D0 table:@"SchoolTimeSetup"];

  v5 = [(SCLWelcomeOptinViewController *)self familyMember];
  objc_super v6 = [v5 firstName];
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6);

  return v7;
}

- (id)detailString
{
  uint64_t v3 = [(SCLWelcomeOptinViewController *)self stringsBundle];
  v4 = [v3 localizedStringForKey:@"SCHOOLTIME_ONBOARDING_DETAIL" value:&stru_83D0 table:@"SchoolTimeSetup"];

  v5 = [(SCLWelcomeOptinViewController *)self familyMember];
  objc_super v6 = [v5 firstName];
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6);

  return v7;
}

- (id)suggestedButtonTitle
{
  objc_super v2 = [(SCLWelcomeOptinViewController *)self stringsBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"SCHOOLTIME_ONBOARDING_SUGGESTED_BUTTON_TITLE" value:&stru_83D0 table:@"SchoolTimeSetup"];

  return v3;
}

- (id)alternateButtonTitle
{
  objc_super v2 = [(SCLWelcomeOptinViewController *)self stringsBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"SCHOOLTIME_ONBOARDING_SETUP_LATER_BUTTON_TITLE" value:&stru_83D0 table:@"SchoolTimeSetup"];

  return v3;
}

- (id)imageResource
{
  return @"Screen-Schooltime";
}

- (id)imageResourceBundleIdentifier
{
  objc_super v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 bundleIdentifier];

  return v3;
}

- (void)suggestedButtonPressed:(id)a3
{
  id v3 = [(SCLWelcomeOptinViewController *)self flowController];
  [v3 showSettingsConfiguration];
}

- (void)alternateButtonPressed:(id)a3
{
  id v3 = [(SCLWelcomeOptinViewController *)self flowController];
  [v3 skipSettingsConfiguration];
}

- (BOOL)legacyButtonStyles
{
  return 1;
}

- (id)privacyBundles
{
  uint64_t v4 = OBPrivacyFamilySetupIdentifier;
  objc_super v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_miniFlowDelegate);

  return (BPSSetupMiniFlowControllerDelegate *)WeakRetained;
}

- (void)setMiniFlowDelegate:(id)a3
{
}

- (SCLSetupPrincipleClass)flowController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowController);

  return (SCLSetupPrincipleClass *)WeakRetained;
}

- (void)setFlowController:(id)a3
{
}

- (NSBundle)stringsBundle
{
  return self->_stringsBundle;
}

- (void)setStringsBundle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringsBundle, 0);
  objc_destroyWeak((id *)&self->_flowController);

  objc_destroyWeak((id *)&self->_miniFlowDelegate);
}

@end