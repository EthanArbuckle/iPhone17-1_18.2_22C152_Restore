@interface iFBAPreferencesViewController
- (BOOL)hideTouchID;
- (BOOL)isWarningsOn;
- (NSString)devicesId;
- (UILabel)allowCellUploadsLabel;
- (UILabel)myBetaDevicesLabel;
- (UILabel)requireTouchIDCellLabel;
- (UILabel)resetWarningsLabel;
- (UILabel)showOnHomeScreenLabel;
- (UILabel)touchIDTimeoutLabel;
- (UILabel)useTouchIDSwitchCellLabel;
- (UISwitch)allowCellUploads;
- (UISwitch)touchIDSwitch;
- (UITableViewCell)resetWarningsCell;
- (UITableViewCell)touchIDCell;
- (UITableViewCell)usernameCell;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)userImage;
- (id)versionFooter;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)configureUserCell;
- (void)dealloc;
- (void)didResetWarnings:(id)a3;
- (void)didSwitchCellularAccess:(id)a3;
- (void)didTapDone:(id)a3;
- (void)didTapSignOut:(id)a3;
- (void)didToggleTouchID:(id)a3;
- (void)resetWarnings;
- (void)setAllowCellUploads:(id)a3;
- (void)setAllowCellUploadsLabel:(id)a3;
- (void)setDevicesId:(id)a3;
- (void)setHideTouchID:(BOOL)a3;
- (void)setMyBetaDevicesLabel:(id)a3;
- (void)setRequireTouchIDCellLabel:(id)a3;
- (void)setResetWarningsCell:(id)a3;
- (void)setResetWarningsLabel:(id)a3;
- (void)setShowOnHomeScreenLabel:(id)a3;
- (void)setTouchIDCell:(id)a3;
- (void)setTouchIDSwitch:(id)a3;
- (void)setTouchIDTimeoutLabel:(id)a3;
- (void)setUseTouchIDSwitchCellLabel:(id)a3;
- (void)setUsernameCell:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation iFBAPreferencesViewController

- (void)viewDidLoad
{
  v58.receiver = self;
  v58.super_class = (Class)iFBAPreferencesViewController;
  [(iFBAPreferencesViewController *)&v58 viewDidLoad];
  v3 = +[UIColor labelColor];
  v4 = [(iFBAPreferencesViewController *)self useTouchIDSwitchCellLabel];
  [v4 setTextColor:v3];

  v5 = +[UIColor labelColor];
  v6 = [(iFBAPreferencesViewController *)self requireTouchIDCellLabel];
  [v6 setTextColor:v5];

  v7 = +[UIColor secondaryLabelColor];
  v8 = [(iFBAPreferencesViewController *)self touchIDTimeoutLabel];
  [v8 setTextColor:v7];

  v9 = +[UIColor labelColor];
  v10 = [(iFBAPreferencesViewController *)self allowCellUploadsLabel];
  [v10 setTextColor:v9];

  v11 = +[UIColor labelColor];
  v12 = [(iFBAPreferencesViewController *)self myBetaDevicesLabel];
  [v12 setTextColor:v11];

  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  [(iFBAPreferencesViewController *)self setDevicesId:v14];

  v15 = [(iFBAPreferencesViewController *)self tableView];
  [v15 setEstimatedSectionHeaderHeight:0.0];

  v16 = [(iFBAPreferencesViewController *)self tableView];
  [v16 setEstimatedSectionFooterHeight:0.0];

  v17 = [(iFBAPreferencesViewController *)self tableView];
  [v17 setRowHeight:UITableViewAutomaticDimension];

  v18 = [(iFBAPreferencesViewController *)self tableView];
  [v18 setEstimatedRowHeight:44.0];

  v19 = +[NSBundle mainBundle];
  v20 = [v19 localizedStringForKey:@"TOUCH_ID_PREFERENCE" value:&stru_1000F6658 table:0];
  v21 = [(iFBAPreferencesViewController *)self useTouchIDSwitchCellLabel];
  [v21 setText:v20];

  v22 = +[NSBundle mainBundle];
  v23 = [v22 localizedStringForKey:@"TOUCH_ID_REQUIRE" value:&stru_1000F6658 table:0];
  v24 = [(iFBAPreferencesViewController *)self requireTouchIDCellLabel];
  [v24 setText:v23];

  if (+[iFBKUtils deviceSupportsFaceID])
  {
    v25 = +[NSBundle mainBundle];
    v26 = [v25 localizedStringForKey:@"FACE_ID_PREFERENCE" value:&stru_1000F6658 table:0];
    v27 = [(iFBAPreferencesViewController *)self useTouchIDSwitchCellLabel];
    [v27 setText:v26];

    v28 = +[NSBundle mainBundle];
    v29 = [v28 localizedStringForKey:@"FACE_ID_REQUIRE" value:&stru_1000F6658 table:0];
    v30 = [(iFBAPreferencesViewController *)self requireTouchIDCellLabel];
    [v30 setText:v29];
  }
  v31 = +[NSBundle mainBundle];
  v32 = [v31 localizedStringForKey:@"PREFERENCES" value:&stru_1000F6658 table:0];
  v33 = [(iFBAPreferencesViewController *)self navigationItem];
  [v33 setTitle:v32];

  id v34 = objc_alloc((Class)UIBarButtonItem);
  v35 = +[NSBundle mainBundle];
  v36 = [v35 localizedStringForKey:@"DONE" value:&stru_1000F6658 table:0];
  id v37 = [v34 initWithTitle:v36 style:2 target:self action:"didTapDone:"];
  v38 = [(iFBAPreferencesViewController *)self navigationItem];
  [v38 setRightBarButtonItem:v37];

  v39 = +[NSNotificationCenter defaultCenter];
  v40 = [(iFBAPreferencesViewController *)self tableView];
  [v39 addObserver:v40 selector:"reloadData" name:UIContentSizeCategoryDidChangeNotification object:0];

  v41 = [(iFBAPreferencesViewController *)self tableView];
  [v41 setDelegate:self];

  v42 = [(iFBAPreferencesViewController *)self tableView];
  [v42 setDataSource:self];

  if ([(iFBAPreferencesViewController *)self isWarningsOn]) {
    +[iFBAConstants tintColor];
  }
  else {
  v43 = +[UIColor secondaryLabelColor];
  }
  v44 = [(iFBAPreferencesViewController *)self resetWarningsCell];
  v45 = [v44 textLabel];
  [v45 setTextColor:v43];

  v46 = [(iFBAPreferencesViewController *)self resetWarningsCell];
  [v46 setSelectionStyle:0];

  v47 = [(iFBAPreferencesViewController *)self resetWarningsCell];
  unint64_t v48 = (unint64_t)[v47 accessibilityTraits];
  [v47 setAccessibilityTraits:UIAccessibilityTraitButton | v48];

  v49 = objc_opt_new();
  id v57 = 0;
  unsigned __int8 v50 = [v49 canEvaluatePolicy:1 error:&v57];
  id v51 = v57;

  if (+[iFBAConstants supportsBiometricsLock] && (v50 & 1) == 0) {
    [v51 code];
  }
  -[iFBAPreferencesViewController setHideTouchID:](self, "setHideTouchID:");
  if (v51 && [v51 code] == (id)-7)
  {
    v52 = [(iFBAPreferencesViewController *)self touchIDSwitch];
    [v52 setOn:0];
  }
  else
  {
    v52 = +[NSUserDefaults standardUserDefaults];
    id v53 = [v52 BOOLForKey:@"UseTouchIDLogin"];
    v54 = [(iFBAPreferencesViewController *)self touchIDSwitch];
    [v54 setOn:v53];
  }
  [(iFBAPreferencesViewController *)self configureUserCell];
  v55 = +[UIColor tintColor];
  v56 = [(iFBAPreferencesViewController *)self resetWarningsLabel];
  [v56 setTextColor:v55];
}

- (void)configureUserCell
{
  id v18 = +[UIListContentConfiguration subtitleCellConfiguration];
  v3 = +[FBKData sharedInstance];
  v4 = [v3 currentUser];

  v5 = [v4 fullName];
  [v18 setText:v5];

  v6 = +[UIColor labelColor];
  v7 = [v18 textProperties];
  [v7 setColor:v6];

  v8 = [v4 username];
  [v18 setSecondaryText:v8];

  v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  v10 = [v18 secondaryTextProperties];
  [v10 setFont:v9];

  v11 = +[UIColor secondaryLabelColor];
  v12 = [v18 secondaryTextProperties];
  [v12 setColor:v11];

  [v18 setDirectionalLayoutMargins:10.0, 0.0, 10.0, 0.0];
  v13 = [(iFBAPreferencesViewController *)self userImage];
  [v18 setImage:v13];

  v14 = [v18 imageProperties];
  [v14 setCornerRadius:22.0];

  v15 = [v18 imageProperties];
  [v15 setMaximumSize:44.0, 44.0];

  v16 = [(iFBAPreferencesViewController *)self usernameCell];
  [v16 setUserInteractionEnabled:0];

  v17 = [(iFBAPreferencesViewController *)self usernameCell];
  [v17 setContentConfiguration:v18];
}

- (id)userImage
{
  v2 = +[FBKData sharedInstance];
  v3 = [v2 currentUser];

  v4 = [v3 username];
  v5 = +[FBAAvatarHelper contactImageForEmailAddress:v4];

  if (!v5)
  {
    v6 = [v3 givenName];
    v7 = [v3 familyName];
    v5 = +[FBAAvatarHelper monogramAvatarImageForPreferredName:v6 familyName:v7];
  }

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)iFBAPreferencesViewController;
  id v6 = -[iFBAPreferencesViewController tableView:numberOfRowsInSection:](&v10, "tableView:numberOfRowsInSection:", a3);
  if (a4 == 2)
  {
    if ([(iFBAPreferencesViewController *)self hideTouchID])
    {
      return (int64_t)v6 - 2;
    }
    else
    {
      v7 = [(iFBAPreferencesViewController *)self touchIDSwitch];
      unsigned int v8 = [v7 isOn];

      return (int64_t)v6 - (v8 ^ 1);
    }
  }
  return (int64_t)v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)iFBAPreferencesViewController;
  [(iFBAPreferencesViewController *)&v16 viewWillAppear:a3];
  v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"CELL_FILE_UPLOADS" value:&stru_1000F6658 table:0];
  id v6 = [(iFBAPreferencesViewController *)self allowCellUploadsLabel];
  [v6 setText:v5];

  v7 = +[NSUserDefaults standardUserDefaults];
  id v8 = [v7 BOOLForKey:FBKAllowCellularFileUploads];

  v9 = [(iFBAPreferencesViewController *)self allowCellUploads];
  [v9 setOn:v8 animated:0];

  objc_super v10 = +[NSUserDefaults standardUserDefaults];
  id v11 = [v10 integerForKey:@"TouchIDTimeoutDuration"];

  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"After %lu minutes" value:&stru_1000F6658 table:@"Plurals"];
  v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, sub_10003FAF4((uint64_t)v11));
  v15 = [(iFBAPreferencesViewController *)self touchIDTimeoutLabel];
  [v15 setText:v14];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)iFBAPreferencesViewController;
  [(iFBAPreferencesViewController *)&v4 viewWillDisappear:a3];
  v3 = +[NSUserDefaults standardUserDefaults];
  [v3 synchronize];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)iFBAPreferencesViewController;
  [(iFBAPreferencesViewController *)&v4 dealloc];
}

- (void)didTapDone:(id)a3
{
}

- (void)didTapSignOut:(id)a3
{
  id v4 = a3;
  id v6 = +[FBKData sharedInstance];
  v5 = [v6 loginManager];
  [v5 logOut];

  +[FBKFileManager deleteAllDraftDirectories];
  [(iFBAPreferencesViewController *)self didTapDone:v4];
}

- (void)didSwitchCellularAccess:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v3 isOn];

  [v4 setBool:v5 forKey:FBKAllowCellularFileUploads];
  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 synchronize];
}

- (void)didResetWarnings:(id)a3
{
  if ([(iFBAPreferencesViewController *)self isWarningsOn])
  {
    id v4 = +[NSBundle mainBundle];
    id v5 = [v4 localizedStringForKey:@"RESET_WARNINGS" value:&stru_1000F6658 table:0];
    id v6 = +[NSBundle mainBundle];
    v7 = [v6 localizedStringForKey:@"RESET_WARNINGS_MESSAGE" value:&stru_1000F6658 table:0];
    id v8 = +[UIAlertController alertControllerWithTitle:v5 message:v7 preferredStyle:1];

    v9 = +[NSBundle mainBundle];
    objc_super v10 = [v9 localizedStringForKey:@"YES" value:&stru_1000F6658 table:0];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100036804;
    v15[3] = &unk_1000F2540;
    v15[4] = self;
    id v11 = +[UIAlertAction actionWithTitle:v10 style:2 handler:v15];
    [v8 addAction:v11];

    v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"NO" value:&stru_1000F6658 table:0];
    v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:0];
    [v8 addAction:v14];

    [(iFBAPreferencesViewController *)self presentViewController:v8 animated:1 completion:0];
  }
}

- (void)didToggleTouchID:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v26 = 0;
  unsigned __int8 v6 = [v5 canEvaluatePolicy:1 error:&v26];
  id v7 = v26;

  if ((v6 & 1) != 0 || [v7 code] != (id)-7)
  {
    v20 = +[NSUserDefaults standardUserDefaults];
    [v20 setBool:[v4 isOn] forKey:@"UseTouchIDLogin"];

    v9 = [(iFBAPreferencesViewController *)self tableView];
    [v9 reloadData];
  }
  else
  {
    id v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"TOUCH_ID_NOT_ENROLLED" value:&stru_1000F6658 table:0];

    objc_super v10 = +[NSBundle mainBundle];
    id v11 = [v10 localizedStringForKey:@"TOUCH_ID_NOT_ENROLLED_MESSAGE" value:&stru_1000F6658 table:0];

    if (+[iFBKUtils deviceSupportsFaceID])
    {
      v12 = +[NSBundle mainBundle];
      uint64_t v13 = [v12 localizedStringForKey:@"FACE_ID_NOT_ENROLLED" value:&stru_1000F6658 table:0];

      v14 = +[NSBundle mainBundle];
      uint64_t v15 = [v14 localizedStringForKey:@"FACE_ID_NOT_ENROLLED_MESSAGE" value:&stru_1000F6658 table:0];

      v9 = (void *)v13;
      id v11 = (void *)v15;
    }
    objc_super v16 = +[UIAlertController alertControllerWithTitle:v9 message:v11 preferredStyle:1];
    v17 = +[NSBundle mainBundle];
    id v18 = [v17 localizedStringForKey:@"OK" value:&stru_1000F6658 table:0];
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_100036AF0;
    v24 = &unk_1000F2540;
    id v25 = v4;
    v19 = +[UIAlertAction actionWithTitle:v18 style:0 handler:&v21];
    [v16 addAction:v19, v21, v22, v23, v24];

    [(iFBAPreferencesViewController *)self presentViewController:v16 animated:1 completion:0];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = [v19 cellForRowAtIndexPath:v6];
  id v8 = [v7 reuseIdentifier];
  unsigned int v9 = [v8 isEqualToString:@"FBAResetWarningsCell"];

  if (v9)
  {
    [(iFBAPreferencesViewController *)self didResetWarnings:v7];
    [v19 deselectRowAtIndexPath:v6 animated:1];
  }
  objc_super v10 = [v7 reuseIdentifier];
  id v11 = [(iFBAPreferencesViewController *)self devicesId];
  unsigned int v12 = [v10 isEqualToString:v11];

  if (v12)
  {
    uint64_t v13 = [(iFBAPreferencesViewController *)self storyboard];
    v14 = [(iFBAPreferencesViewController *)self devicesId];
    uint64_t v15 = [v13 instantiateViewControllerWithIdentifier:v14];

    [v15 setContext:1];
    objc_super v16 = [(iFBAPreferencesViewController *)self navigationController];
    [v16 pushViewController:v15 animated:1];
  }
  v17 = [v7 reuseIdentifier];
  unsigned int v18 = [v17 isEqualToString:@"SignoutCell"];

  if (v18)
  {
    [v19 deselectRowAtIndexPath:v6 animated:1];
    [(iFBAPreferencesViewController *)self didTapSignOut:v7];
  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 4)
  {
    id v8 = [(iFBAPreferencesViewController *)self versionFooter];
  }
  else if (a4 == 1)
  {
    id v7 = +[NSBundle mainBundle];
    id v8 = [v7 localizedStringForKey:@"CELLULAR_DATA_INFO_FOOTER", @"When enabled, supported devices will use cellular data to upload files.", 0 value table];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)versionFooter
{
  if (FBKIsInternalInstall())
  {
    v2 = +[NSBundle mainBundle];
    id v3 = [v2 objectForInfoDictionaryKey:kCFBundleVersionKey];

    id v4 = +[NSBundle mainBundle];
    id v5 = [v4 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];

    id v6 = +[NSBundle mainBundle];
    id v7 = [v6 objectForInfoDictionaryKey:kCFBundleNameKey];

    if (v3 && [v3 length]) {
      +[NSString stringWithFormat:@"\n%@ %@ (%@)", v7, v5, v3];
    }
    else {
    id v8 = +[NSString stringWithFormat:@"\n%@ %@", v7, v5, v10];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100036F48;
  v9[3] = &unk_1000F2D18;
  v9[4] = self;
  id v7 = a4;
  [v7 animateAlongsideTransition:v9 completion:&stru_1000F3830];
  v8.receiver = self;
  v8.super_class = (Class)iFBAPreferencesViewController;
  -[iFBAPreferencesViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
}

- (BOOL)isWarningsOn
{
  v2 = +[NSUserDefaults standardUserDefaults];
  if ([v2 BOOLForKey:FBKSuppressPrivacyNoticePreferencesKey])
  {
    BOOL v3 = 1;
  }
  else
  {
    id v4 = [v2 objectForKey:FBKSuppressPrivacyNoticePreferencesUserKey];
    if (v4) {
      BOOL v3 = 1;
    }
    else {
      BOOL v3 = [v2 integerForKey:FBKAgreedLegalVersionKey] != 0;
    }
  }
  return v3;
}

- (void)resetWarnings
{
  BOOL v3 = +[NSUserDefaults standardUserDefaults];
  uint64_t v4 = FBKSuppressPrivacyNoticePreferencesKey;
  [v3 removeObjectForKey:FBKSuppressPrivacyNoticePreferencesKey];

  id v5 = +[NSUserDefaults standardUserDefaults];
  uint64_t v6 = FBKSuppressPrivacyNoticePreferencesUserKey;
  [v5 removeObjectForKey:FBKSuppressPrivacyNoticePreferencesUserKey];

  id v7 = +[NSUserDefaults standardUserDefaults];
  uint64_t v8 = FBKAgreedLegalVersionKey;
  [v7 removeObjectForKey:FBKAgreedLegalVersionKey];

  unsigned int v9 = +[NSUserDefaults standardUserDefaults];
  uint64_t v10 = FBKSuppressMakeVisibleQuestion;
  [v9 removeObjectForKey:FBKSuppressMakeVisibleQuestion];

  id v11 = +[iFBAConstants sharedUserDefaults];
  [v11 removeObjectForKey:v4];

  unsigned int v12 = +[iFBAConstants sharedUserDefaults];
  [v12 removeObjectForKey:v6];

  uint64_t v13 = +[iFBAConstants sharedUserDefaults];
  [v13 removeObjectForKey:v8];

  v14 = +[iFBAConstants sharedUserDefaults];
  [v14 removeObjectForKey:v10];

  uint64_t v15 = +[iFBAConstants sharedUserDefaults];
  [v15 removeObjectForKey:v4];

  objc_super v16 = +[NSUserDefaults standardUserDefaults];
  [v16 synchronize];

  id v19 = +[UIColor labelColor];
  v17 = [(iFBAPreferencesViewController *)self resetWarningsCell];
  unsigned int v18 = [v17 textLabel];
  [v18 setTextColor:v19];
}

- (UISwitch)allowCellUploads
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_allowCellUploads);

  return (UISwitch *)WeakRetained;
}

- (void)setAllowCellUploads:(id)a3
{
}

- (UILabel)allowCellUploadsLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_allowCellUploadsLabel);

  return (UILabel *)WeakRetained;
}

- (void)setAllowCellUploadsLabel:(id)a3
{
}

- (UITableViewCell)resetWarningsCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resetWarningsCell);

  return (UITableViewCell *)WeakRetained;
}

- (void)setResetWarningsCell:(id)a3
{
}

- (UITableViewCell)usernameCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_usernameCell);

  return (UITableViewCell *)WeakRetained;
}

- (void)setUsernameCell:(id)a3
{
}

- (UITableViewCell)touchIDCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchIDCell);

  return (UITableViewCell *)WeakRetained;
}

- (void)setTouchIDCell:(id)a3
{
}

- (UILabel)touchIDTimeoutLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchIDTimeoutLabel);

  return (UILabel *)WeakRetained;
}

- (void)setTouchIDTimeoutLabel:(id)a3
{
}

- (UISwitch)touchIDSwitch
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchIDSwitch);

  return (UISwitch *)WeakRetained;
}

- (void)setTouchIDSwitch:(id)a3
{
}

- (BOOL)hideTouchID
{
  return self->_hideTouchID;
}

- (void)setHideTouchID:(BOOL)a3
{
  self->_hideTouchID = a3;
}

- (UILabel)useTouchIDSwitchCellLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_useTouchIDSwitchCellLabel);

  return (UILabel *)WeakRetained;
}

- (void)setUseTouchIDSwitchCellLabel:(id)a3
{
}

- (UILabel)requireTouchIDCellLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_requireTouchIDCellLabel);

  return (UILabel *)WeakRetained;
}

- (void)setRequireTouchIDCellLabel:(id)a3
{
}

- (UILabel)myBetaDevicesLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_myBetaDevicesLabel);

  return (UILabel *)WeakRetained;
}

- (void)setMyBetaDevicesLabel:(id)a3
{
}

- (UILabel)showOnHomeScreenLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_showOnHomeScreenLabel);

  return (UILabel *)WeakRetained;
}

- (void)setShowOnHomeScreenLabel:(id)a3
{
}

- (UILabel)resetWarningsLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resetWarningsLabel);

  return (UILabel *)WeakRetained;
}

- (void)setResetWarningsLabel:(id)a3
{
}

- (NSString)devicesId
{
  return self->_devicesId;
}

- (void)setDevicesId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicesId, 0);
  objc_destroyWeak((id *)&self->_resetWarningsLabel);
  objc_destroyWeak((id *)&self->_showOnHomeScreenLabel);
  objc_destroyWeak((id *)&self->_myBetaDevicesLabel);
  objc_destroyWeak((id *)&self->_requireTouchIDCellLabel);
  objc_destroyWeak((id *)&self->_useTouchIDSwitchCellLabel);
  objc_destroyWeak((id *)&self->_touchIDSwitch);
  objc_destroyWeak((id *)&self->_touchIDTimeoutLabel);
  objc_destroyWeak((id *)&self->_touchIDCell);
  objc_destroyWeak((id *)&self->_usernameCell);
  objc_destroyWeak((id *)&self->_resetWarningsCell);
  objc_destroyWeak((id *)&self->_allowCellUploadsLabel);

  objc_destroyWeak((id *)&self->_allowCellUploads);
}

@end