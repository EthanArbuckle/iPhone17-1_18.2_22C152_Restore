@interface BuddyProximityPasscodeValidationController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)_shouldSetPasscode;
- (BOOL)_sourceHasAppleID;
- (BOOL)isEphemeral;
- (BYPasscodeCacheManager)passcodeCacheManager;
- (BuddyPasscodeInputView)passcodeInputView;
- (BuddyProximityPasscodeValidationController)init;
- (MCProfileConnection)managedConfiguration;
- (NSLayoutConstraint)contentViewTopConstraint;
- (NSLayoutConstraint)passcodeInputViewBottomConstraint;
- (ProximitySetupController)proximitySetupController;
- (void)_footerButtonTapped:(id)a3;
- (void)_nextButtonTapped;
- (void)_updateActions;
- (void)_validatePasscode:(id)a3;
- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4;
- (void)passcodeInput:(id)a3 willChangeContents:(id)a4;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setContentViewTopConstraint:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setPasscodeCacheManager:(id)a3;
- (void)setPasscodeInputView:(id)a3;
- (void)setPasscodeInputViewBottomConstraint:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BuddyProximityPasscodeValidationController

- (BuddyProximityPasscodeValidationController)init
{
  SEL v5 = a2;
  id location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyProximityPasscodeValidationController;
  id location = [(BuddyProximityPasscodeValidationController *)&v4 initWithTitle:&stru_1002B4E18 detailText:0 icon:0];
  v2 = (BuddyProximityPasscodeValidationController *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)viewDidLoad
{
  v103 = self;
  SEL v102 = a2;
  v101.receiver = self;
  v101.super_class = (Class)BuddyProximityPasscodeValidationController;
  [(BuddyProximityPasscodeValidationController *)&v101 viewDidLoad];
  id v2 = [(BuddyProximityPasscodeValidationController *)v103 headerView];
  LODWORD(v3) = 1045220557;
  [v2 setTitleHyphenationFactor:v3];

  objc_super v4 = [(BuddyProximityPasscodeValidationController *)v103 proximitySetupController];
  id v100 = [(ProximitySetupController *)v4 deviceClass];

  id v5 = [(BuddyProximityPasscodeValidationController *)v103 headerView];
  v6 = +[NSBundle mainBundle];
  id v7 = +[BuddyLocalizationUtilities siblingDeviceSpecificLocalizedStringKeyForKey:@"PROXIMITY_PASSCODE_VALIDATION_TITLE" deviceClass:v100];
  v8 = [(NSBundle *)v6 localizedStringForKey:v7 value:&stru_1002B4E18 table:@"Localizable"];
  [v5 setTitle:v8];

  id location = 0;
  if ([(BuddyProximityPasscodeValidationController *)v103 _sourceHasAppleID]) {
    objc_storeStrong(&location, @"PROXIMITY_PASSCODE_VALIDATION_DESCRIPTION_START_APPLEID");
  }
  else {
    objc_storeStrong(&location, @"PROXIMITY_PASSCODE_VALIDATION_DESCRIPTION_START");
  }
  v9 = +[NSBundle mainBundle];
  id v10 = +[BuddyLocalizationUtilities siblingDeviceSpecificLocalizedStringKeyForKey:location deviceClass:v100];
  id v98 = [(NSBundle *)v9 localizedStringForKey:v10 value:&stru_1002B4E18 table:@"Localizable"];

  char v96 = 0;
  BOOL v11 = 0;
  if ([(BuddyProximityPasscodeValidationController *)v103 _shouldSetPasscode])
  {
    id v97 = +[UIScreen mainScreen];
    char v96 = 1;
    [v97 bounds];
    v95[2] = v12;
    v95[1] = v13;
    v95[4] = v14;
    v95[3] = v15;
    BOOL v11 = *(double *)&v14 > 568.01;
  }
  if (v96) {

  }
  if (v11)
  {
    v16 = +[NSBundle mainBundle];
    id v17 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"PROXIMITY_PASSCODE_VALIDATION_DESCRIPTION_END"];
    v18 = [(NSBundle *)v16 localizedStringForKey:v17 value:&stru_1002B4E18 table:@"Localizable"];
    v19 = +[NSString localizedStringWithFormat:@"%@\n\n%@", v98, v18];
    id v20 = v98;
    id v98 = v19;
  }
  id v21 = [(BuddyProximityPasscodeValidationController *)v103 headerView];
  [v21 setDetailText:v98];

  v22 = +[NSBundle mainBundle];
  v23 = [(NSBundle *)v22 localizedStringForKey:@"PROXIMITY_PASSCODE_VALIDATION_FOOTER_BUTTON" value:&stru_1002B4E18 table:@"Localizable"];
  v24 = [(BuddyProximityPasscodeValidationController *)v103 proximitySetupController];
  v25 = [(ProximitySetupController *)v24 deviceName];
  v95[0] = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v23, v25);

  id v94 = +[BuddyMultilineButton buttonWithType:1];
  [v94 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v26 = [v94 titleLabel];
  v27 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v26 setFont:v27];

  id v28 = [v94 titleLabel];
  [v28 setNumberOfLines:0];

  id v29 = [v94 titleLabel];
  [v29 setTextAlignment:1];

  *(void *)&long long v92 = sub_1001CA184();
  *((double *)&v92 + 1) = v30;
  *(double *)&long long v93 = v31;
  *((double *)&v93 + 1) = v32;
  long long v91 = v93;
  long long v90 = v92;
  [v94 setContentEdgeInsets:*(double *)&v92, v30, v31, v32];
  [v94 setTitle:v95[0] forState:0];
  [v94 addTarget:v103 action:"_footerButtonTapped:" forEvents:64];
  id v33 = [(BuddyProximityPasscodeValidationController *)v103 contentView];
  [v33 addSubview:v94];

  id v34 = [v94 widthAnchor];
  id v35 = [(BuddyProximityPasscodeValidationController *)v103 contentView];
  id v36 = [v35 widthAnchor];
  id v37 = [v34 constraintEqualToAnchor:v36 multiplier:1.0];
  v105[0] = v37;
  id v38 = [v94 bottomAnchor];
  id v39 = [(BuddyProximityPasscodeValidationController *)v103 contentView];
  id v40 = [v39 bottomAnchor];
  id v41 = [v38 constraintEqualToAnchor:v40];
  v105[1] = v41;
  v42 = +[NSArray arrayWithObjects:v105 count:2];
  +[NSLayoutConstraint activateConstraints:v42];

  id v89 = +[OBPrivacyLinkController linkWithBundleIdentifier:BYPrivacyAppleIDIdentifier];
  [v89 setModalPresentationStyle:2];
  [v89 setDisplayCaptionText:0];
  [v89 setDisplayLargeIcon:0];
  id v43 = [(BuddyProximityPasscodeValidationController *)v103 buttonTray];
  [v43 setPrivacyLinkController:v89];

  v44 = [(BuddyProximityPasscodeValidationController *)v103 proximitySetupController];
  v45 = [(ProximitySetupController *)v44 handshake];
  LODWORD(v23) = [(SASProximityHandshake *)v45 unlockType];

  int v88 = (int)v23;
  v46 = [(BuddyProximityPasscodeValidationController *)v103 proximitySetupController];
  v47 = [(ProximitySetupController *)v46 handshake];
  unsigned int v48 = [(SASProximityHandshake *)v47 simplePasscodeType];

  if (v88)
  {
    v51 = -[BuddyComplexPasscodeInputView initWithFrame:numericOnly:]([BuddyComplexPasscodeInputView alloc], "initWithFrame:numericOnly:", v88 == 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(BuddyProximityPasscodeValidationController *)v103 setPasscodeInputView:v51];
  }
  else
  {
    if (v48) {
      unsigned int v49 = 6;
    }
    else {
      unsigned int v49 = 4;
    }
    v50 = -[BuddySimplePasscodeInputView initWithFrame:numberOfEntryFields:]([BuddySimplePasscodeInputView alloc], "initWithFrame:numberOfEntryFields:", v49, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(BuddyProximityPasscodeValidationController *)v103 setPasscodeInputView:v50];
  }
  v52 = [(BuddyProximityPasscodeValidationController *)v103 passcodeInputView];
  [(BuddyPasscodeInputView *)v52 setTranslatesAutoresizingMaskIntoConstraints:0];

  v53 = v103;
  v54 = [(BuddyProximityPasscodeValidationController *)v103 passcodeInputView];
  [(BuddyPasscodeInputView *)v54 setDelegate:v53];

  id v55 = [(BuddyProximityPasscodeValidationController *)v103 contentView];
  v56 = [(BuddyProximityPasscodeValidationController *)v103 passcodeInputView];
  [v55 addSubview:v56];

  v57 = [(BuddyProximityPasscodeValidationController *)v103 passcodeInputView];
  objc_opt_class();
  LOBYTE(v56) = objc_opt_isKindOfClass();

  if (v56)
  {
    v58 = [(BuddyProximityPasscodeValidationController *)v103 passcodeInputView];
    id v59 = [(BuddyPasscodeInputView *)v58 leadingAnchor];
    id v60 = [(BuddyProximityPasscodeValidationController *)v103 contentView];
    id v61 = [v60 leadingAnchor];
    id v62 = [v59 constraintEqualToAnchor:v61];
    [v62 setActive:1];

    v63 = [(BuddyProximityPasscodeValidationController *)v103 passcodeInputView];
    id v64 = [(BuddyPasscodeInputView *)v63 trailingAnchor];
    id v65 = [(BuddyProximityPasscodeValidationController *)v103 contentView];
    id v66 = [v65 trailingAnchor];
    id v67 = [v64 constraintEqualToAnchor:v66];
    [v67 setActive:1];
  }
  v68 = +[UIApplication sharedApplication];
  +[BuddyPasscodeBaseViewController _passcodeInputVerticalPaddingForOrientation:[(UIApplication *)v68 activeInterfaceOrientation]];
  double v70 = v69;

  v71 = [(BuddyProximityPasscodeValidationController *)v103 passcodeInputView];
  id v72 = [(BuddyPasscodeInputView *)v71 topAnchor];
  id v73 = [(BuddyProximityPasscodeValidationController *)v103 contentView];
  id v74 = [v73 topAnchor];
  id v75 = [v72 constraintEqualToAnchor:v74 constant:v70];
  [(BuddyProximityPasscodeValidationController *)v103 setContentViewTopConstraint:v75];

  id v76 = [v94 topAnchor];
  v77 = [(BuddyProximityPasscodeValidationController *)v103 passcodeInputView];
  id v78 = [(BuddyPasscodeInputView *)v77 bottomAnchor];
  id v79 = [v76 constraintEqualToAnchor:v78 constant:v70];
  [(BuddyProximityPasscodeValidationController *)v103 setPasscodeInputViewBottomConstraint:v79];

  v80 = [(BuddyProximityPasscodeValidationController *)v103 passcodeInputView];
  id v81 = [(BuddyPasscodeInputView *)v80 centerXAnchor];
  id v82 = [(BuddyProximityPasscodeValidationController *)v103 contentView];
  id v83 = [v82 centerXAnchor];
  id v84 = [v81 constraintEqualToAnchor:v83];
  v104[0] = v84;
  v85 = [(BuddyProximityPasscodeValidationController *)v103 contentViewTopConstraint];
  v104[1] = v85;
  v86 = [(BuddyProximityPasscodeValidationController *)v103 passcodeInputViewBottomConstraint];
  v104[2] = v86;
  v87 = +[NSArray arrayWithObjects:v104 count:3];
  +[NSLayoutConstraint activateConstraints:v87];

  objc_storeStrong(&v89, 0);
  objc_storeStrong(&v94, 0);
  objc_storeStrong(v95, 0);
  objc_storeStrong(&v98, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v100, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BuddyProximityPasscodeValidationController;
  [(BuddyProximityPasscodeValidationController *)&v13 viewWillAppear:a3];
  double v3 = [(BuddyProximityPasscodeValidationController *)v16 passcodeInputView];
  [(BuddyPasscodeInputView *)v3 becomeFirstResponder];

  objc_super v4 = [(BuddyProximityPasscodeValidationController *)v16 proximitySetupController];
  id v5 = [(ProximitySetupController *)v4 handshake];
  unsigned int v6 = [(SASProximityHandshake *)v5 unlockType];

  if (v6)
  {
    id v8 = objc_alloc((Class)UIBarButtonItem);
    v9 = +[NSBundle mainBundle];
    id v10 = [(NSBundle *)v9 localizedStringForKey:@"NEXT" value:&stru_1002B4E18 table:@"Localizable"];
    id v12 = [v8 initWithTitle:v10 style:2 target:v16 action:"_nextButtonTapped"];

    id v11 = [(BuddyProximityPasscodeValidationController *)v16 navigationItem];
    [v11 setRightBarButtonItem:v12 animated:v14];

    objc_storeStrong(&v12, 0);
  }
  else
  {
    id v7 = [(BuddyProximityPasscodeValidationController *)v16 navigationItem];
    [v7 setRightBarButtonItem:0 animated:v14];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyProximityPasscodeValidationController;
  [(BuddyProximityPasscodeValidationController *)&v4 viewWillDisappear:a3];
  double v3 = [(BuddyProximityPasscodeValidationController *)v7 passcodeInputView];
  [(BuddyPasscodeInputView *)v3 resignFirstResponder];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  CGSize v14 = a3;
  objc_super v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v11.receiver = v13;
  v11.super_class = (Class)BuddyProximityPasscodeValidationController;
  -[BuddyProximityPasscodeValidationController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", location[0], v14.width, v14.height);
  id v4 = location[0];
  BOOL v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_1001CA554;
  v9 = &unk_1002B3348;
  id v10 = v13;
  [v4 animateAlongsideTransition:&v5 completion:0];
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)_updateActions
{
  id v2 = [(BuddyProximityPasscodeValidationController *)self passcodeInputView];
  id v3 = [(BuddyPasscodeInputView *)v2 passcode];
  BOOL v4 = [v3 length] != 0;

  id v5 = [(BuddyProximityPasscodeValidationController *)self navigationItem];
  id v6 = [v5 rightBarButtonItem];
  [v6 setEnabled:v4];

  id v7 = +[UIKeyboard activeKeyboard];
  [v7 setReturnKeyEnabled:v4];
}

- (void)_nextButtonTapped
{
  id v3 = [(BuddyProximityPasscodeValidationController *)self passcodeInputView];
  id v4 = [(BuddyPasscodeInputView *)v3 passcode];
  [(BuddyProximityPasscodeValidationController *)self _validatePasscode:v4];
}

- (void)_validatePasscode:(id)a3
{
  v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyProximityPasscodeValidationController *)v42 proximitySetupController];
  int v4 = [(ProximitySetupController *)v3 hasConnection];

  if (v4)
  {
    id v18 = [(BuddyProximityPasscodeValidationController *)v42 view];
    id v19 = [v18 window];
    [v19 setUserInteractionEnabled:0];

    id v20 = [(BuddyProximityPasscodeValidationController *)v42 navigationController];
    id v21 = [v20 topViewController];
    +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:v21 identifier:@"BUDDY_PROXIMITY_PASSCODE_VALIDATION_CONTROLLER"];

    v22 = dispatch_get_global_queue(0, 0);
    block = _NSConcreteStackBlock;
    int v24 = -1073741824;
    int v25 = 0;
    id v26 = sub_1001CAD8C;
    v27 = &unk_1002B12F0;
    id v28 = v42;
    id v29 = location[0];
    dispatch_async(v22, &block);

    objc_storeStrong(&v29, 0);
    objc_storeStrong((id *)&v28, 0);
    int v30 = 0;
  }
  else
  {
    id v5 = [(BuddyProximityPasscodeValidationController *)v42 proximitySetupController];
    id v40 = [(ProximitySetupController *)v5 deviceClass];

    id v6 = +[NSBundle mainBundle];
    id v7 = +[BuddyLocalizationUtilities siblingDeviceSpecificLocalizedStringKeyForKey:@"PROXIMITY_PASSCODE_VALIDATION_LOST_CONNECT_ALERT_TITLE" deviceClass:v40];
    id v39 = [(NSBundle *)v6 localizedStringForKey:v7 value:&stru_1002B4E18 table:@"Localizable"];

    id v38 = 0;
    if ([(BuddyProximityPasscodeValidationController *)v42 _sourceHasAppleID])
    {
      id v8 = +[NSBundle mainBundle];
      v9 = [(NSBundle *)v8 localizedStringForKey:@"PROXIMITY_PASSCODE_VALIDATION_LOST_CONNECT_ALERT_DESCRIPTION_APPLEID" value:&stru_1002B4E18 table:@"Localizable"];
      id v10 = v38;
      id v38 = v9;
    }
    else
    {
      id v8 = +[NSBundle mainBundle];
      id v11 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"PROXIMITY_PASSCODE_VALIDATION_LOST_CONNECT_ALERT_DESCRIPTION"];
      id v12 = [(NSBundle *)v8 localizedStringForKey:v11 value:&stru_1002B4E18 table:@"Localizable"];
      id v13 = v38;
      id v38 = v12;
    }
    id v37 = +[UIAlertController alertControllerWithTitle:v39 message:v38 preferredStyle:1];
    id v14 = v37;
    SEL v15 = +[NSBundle mainBundle];
    v16 = [(NSBundle *)v15 localizedStringForKey:@"PROXIMITY_PASSCODE_VALIDATION_LOST_CONNECT_ALERT_BUTTON_CONTINUE" value:&stru_1002B4E18 table:@"Localizable"];
    double v31 = _NSConcreteStackBlock;
    int v32 = -1073741824;
    int v33 = 0;
    id v34 = sub_1001CAD1C;
    id v35 = &unk_1002B1040;
    id v36 = v42;
    id v17 = +[UIAlertAction actionWithTitle:v16 style:0 handler:&v31];
    [v14 addAction:v17];

    [(BuddyProximityPasscodeValidationController *)v42 presentViewController:v37 animated:1 completion:0];
    int v30 = 1;
    objc_storeStrong((id *)&v36, 0);
    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v39, 0);
    objc_storeStrong(&v40, 0);
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_shouldSetPasscode
{
  id v2 = [(BuddyProximityPasscodeValidationController *)self managedConfiguration];
  unsigned __int8 v3 = [(MCProfileConnection *)v2 isPasscodeSet];

  char v8 = v3 & 1;
  id v4 = +[BuddyCloudConfigManager sharedManager];
  unsigned __int8 v5 = [v4 hasCloudConfiguration];

  BOOL v6 = 0;
  if ((v8 & 1) == 0) {
    return !(v5 & 1);
  }
  return v6;
}

- (BOOL)_sourceHasAppleID
{
  id v2 = [(BuddyProximityPasscodeValidationController *)self proximitySetupController];
  unsigned __int8 v3 = [(ProximitySetupController *)v2 information];
  id v4 = [(SASProximityInformation *)v3 appleID];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)_footerButtonTapped:(id)a3
{
  id v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = [(BuddyProximityPasscodeValidationController *)v40 proximitySetupController];
  id v38 = [(ProximitySetupController *)v3 deviceClass];

  id v4 = +[NSBundle mainBundle];
  id v5 = +[BuddyLocalizationUtilities siblingDeviceSpecificLocalizedStringKeyForKey:@"PROXIMITY_PASSCODE_VALIDATION_FORGOT_ALERT_TITLE" deviceClass:v38];
  id v37 = [(NSBundle *)v4 localizedStringForKey:v5 value:&stru_1002B4E18 table:@"Localizable"];

  id v36 = 0;
  id v35 = 0;
  if ([(BuddyProximityPasscodeValidationController *)v40 _sourceHasAppleID])
  {
    BOOL v6 = +[NSBundle mainBundle];
    id v7 = +[BuddyLocalizationUtilities siblingDeviceSpecificLocalizedStringKeyForKey:@"PROXIMITY_PASSCODE_VALIDATION_FORGOT_ALERT_DESCRIPTION_APPLEID" deviceClass:v38];
    char v8 = [(NSBundle *)v6 localizedStringForKey:v7 value:&stru_1002B4E18 table:@"Localizable"];
    id v9 = v36;
    id v36 = v8;

    id v10 = +[NSBundle mainBundle];
    id v11 = [(NSBundle *)v10 localizedStringForKey:@"PROXIMITY_PASSCODE_VALIDATION_FORGOT_ALERT_BUTTON_SIGN_IN_MANUALLY" value:&stru_1002B4E18 table:@"Localizable"];
  }
  else
  {
    id v13 = +[NSBundle mainBundle];
    id v14 = (id)SFLocalizableWAPIStringKeyForKey();
    id v15 = +[BuddyLocalizationUtilities siblingDeviceSpecificLocalizedStringKeyForKey:v14 deviceClass:v38];
    v16 = [(NSBundle *)v13 localizedStringForKey:v15 value:&stru_1002B4E18 table:@"Localizable"];
    id v17 = v36;
    id v36 = v16;

    id v18 = +[NSBundle mainBundle];
    id v19 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"PROXIMITY_PASSCODE_VALIDATION_FORGOT_ALERT_DESCRIPTION_END"];
    id v20 = [(NSBundle *)v18 localizedStringForKey:v19 value:&stru_1002B4E18 table:@"Localizable"];
    id v21 = +[NSString localizedStringWithFormat:@"%@%@", v36, v20];
    id v22 = v36;
    id v36 = v21;

    id v10 = +[NSBundle mainBundle];
    id v11 = [(NSBundle *)v10 localizedStringForKey:@"PROXIMITY_PASSCODE_VALIDATION_FORGOT_ALERT_BUTTON_SET_UP_MANUALLY" value:&stru_1002B4E18 table:@"Localizable"];
  }
  id v12 = v35;
  id v35 = v11;

  id v34 = +[UIAlertController alertControllerWithTitle:v37 message:v36 preferredStyle:1];
  v23 = +[NSBundle mainBundle];
  int v24 = [(NSBundle *)v23 localizedStringForKey:@"PROXIMITY_PASSCODE_VALIDATION_FORGOT_ALERT_BUTTON_TRY" value:&stru_1002B4E18 table:@"Localizable"];
  int v25 = +[UIAlertAction actionWithTitle:v24 style:1 handler:0];
  [v34 addAction:v25];

  id v26 = v34;
  id v28 = _NSConcreteStackBlock;
  int v29 = -1073741824;
  int v30 = 0;
  double v31 = sub_1001CBA58;
  int v32 = &unk_1002B1040;
  int v33 = v40;
  v27 = +[UIAlertAction actionWithTitle:v35 style:0 handler:&v28];
  [v26 addAction:v27];

  [(BuddyProximityPasscodeValidationController *)v40 presentViewController:v34 animated:1 completion:0];
  objc_storeStrong((id *)&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = [(BuddyProximityPasscodeValidationController *)v15 proximitySetupController];
  char v4 = ![(ProximitySetupController *)v3 hasConnection];

  if (v4)
  {
    if (location[0]) {
      (*((void (**)(id, void))location[0] + 2))(location[0], 0);
    }
    int v13 = 1;
  }
  else
  {
    id v5 = [(BuddyProximityPasscodeValidationController *)v15 proximitySetupController];
    BOOL v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    id v9 = sub_1001CBD70;
    id v10 = &unk_1002B1668;
    id v11 = v15;
    id v12 = location[0];
    [(ProximitySetupController *)v5 waitForIntent:&v6];

    objc_storeStrong(&v12, 0);
    objc_storeStrong((id *)&v11, 0);
    int v13 = 0;
  }
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (BOOL)isEphemeral
{
  return 1;
}

- (void)passcodeInput:(id)a3 willChangeContents:(id)a4
{
  int v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(BuddyProximityPasscodeValidationController *)v7 _updateActions];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  id v5 = [location[0] passcodeField];
  [v5 forceDisplayIfNeeded];

  [(BuddyProximityPasscodeValidationController *)v8 _validatePasscode:v6];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (BuddyPasscodeInputView)passcodeInputView
{
  return (BuddyPasscodeInputView *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPasscodeInputView:(id)a3
{
}

- (NSLayoutConstraint)contentViewTopConstraint
{
  return self->_contentViewTopConstraint;
}

- (void)setContentViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)passcodeInputViewBottomConstraint
{
  return self->_passcodeInputViewBottomConstraint;
}

- (void)setPasscodeInputViewBottomConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end