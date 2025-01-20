@interface BuddyAppleIDSignInController
+ (id)federatedAuthSignInControllerInNavigationController:(id)a3 mode:(int)a4 passcodeCacheManager:(id)a5;
- (BOOL)_scrollViewContentIsUnderTray;
- (BOOL)enabled;
- (BOOL)isUsernameEditable;
- (BOOL)showsInfoSection;
- (BOOL)showsPasswordAsField;
- (BOOL)showsUsernameAsField;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BuddyAppleIDSignInController)initWithMode:(int)a3;
- (NSLayoutConstraint)headerTopOffsetConstraint;
- (NSString)detailText;
- (NSString)footerText;
- (NSString)username;
- (OBAnimationController)animationController;
- (OBBoldTrayButton)continueButton;
- (double)headerViewBottomToTableViewTopPadding;
- (double)rowHeight;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_serverFriendlyDisplayNameForCurrentUserName:(id)a3;
- (id)_subTitleText;
- (id)_subtitleTextForMode:(int)a3;
- (id)_titleText;
- (id)_titleTextForAuthMode:(int)a3;
- (id)_userFriendlyDisplayNameForCurrentUserName:(id)a3;
- (id)appearanceHandler;
- (id)authModeHandler;
- (id)credentialRecoveryHandler;
- (id)handler;
- (id)loginOptionsAction;
- (id)loginOptionsConstructor;
- (id)passwordCell;
- (id)proximityLoginHandler;
- (id)stringWithUsernameFormattedIntoString:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)topSectionFooterView;
- (id)usernameCell;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_continueButtonTapped;
- (void)_loginOptionsTapped:(id)a3;
- (void)_setContinueButtonEnabledOrDisabled;
- (void)_signInToAccount;
- (void)_textChanged:(id)a3;
- (void)addFooterLinkWithTitle:(id)a3 handler:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)removeFooterLinkAtIndex:(unint64_t)a3;
- (void)setAnimationController:(id)a3;
- (void)setAppearanceHandler:(id)a3;
- (void)setAuthModeHandler:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setCredentialRecoveryHandler:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFooterText:(id)a3;
- (void)setHandler:(id)a3;
- (void)setHeaderTopOffsetConstraint:(id)a3;
- (void)setIsUsernameEditable:(BOOL)a3;
- (void)setKeyboardFrame:(CGRect)a3;
- (void)setLoginOptionsAction:(id)a3;
- (void)setLoginOptionsConstructor:(id)a3;
- (void)setProximityLoginHandler:(id)a3;
- (void)setShowsInfoSection:(BOOL)a3;
- (void)setShowsPasswordAsField:(BOOL)a3;
- (void)setShowsPasswordAsField:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowsUsernameAsField:(BOOL)a3;
- (void)setUsername:(id)a3;
- (void)setiForgotText:(id)a3 handler:(id)a4;
- (void)viewControllerSpinnerManagerDidStopAnimatingSpinner:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyAppleIDSignInController

+ (id)federatedAuthSignInControllerInNavigationController:(id)a3 mode:(int)a4 passcodeCacheManager:(id)a5
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned int v23 = a4;
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  v7 = [BuddyAppleIDSignInController alloc];
  id v21 = [(BuddyAppleIDSignInController *)v7 initWithMode:v23];
  objc_initWeak(&from, v21);
  id v8 = v21;
  v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  v14 = sub_100129A94;
  v15 = &unk_1002B3648;
  objc_copyWeak(&v18, &from);
  id v16 = location[0];
  id v17 = v22;
  unsigned int v19 = v23;
  [v8 setAuthModeHandler:&v11];
  id v9 = v21;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (BuddyAppleIDSignInController)initWithMode:(int)a3
{
  id location = self;
  SEL v18 = a2;
  unsigned int v17 = a3;
  id v4 = [(BuddyAppleIDSignInController *)self _titleTextForAuthMode:a3];
  id v5 = [location _subtitleTextForMode:v17];
  id location = 0;
  v16.receiver = self;
  v16.super_class = (Class)BuddyAppleIDSignInController;
  id location = [(BuddyAppleIDSignInController *)&v16 initWithTitle:v4 detailText:v5 icon:0 adoptTableViewScrollView:1];
  objc_storeStrong(&location, location);

  if (location)
  {
    *((_DWORD *)location + 10) = v17;
    *((unsigned char *)location + 49) = 1;
    *((unsigned char *)location + 45) = 1;
    *((unsigned char *)location + 46) = 0;
    *((unsigned char *)location + 47) = 1;
    v6 = dispatch_get_global_queue(25, 0);
    block = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    int v12 = sub_100129F04;
    int v13 = &unk_1002B2D50;
    unsigned int v15 = v17;
    id v14 = location;
    dispatch_async(v6, &block);

    objc_storeStrong(&v14, 0);
  }
  v7 = (BuddyAppleIDSignInController *)location;
  objc_storeStrong(&location, 0);
  return v7;
}

- (void)dealloc
{
  id v5 = self;
  SEL v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v2 removeObserver:v5];

  v3.receiver = v5;
  v3.super_class = (Class)BuddyAppleIDSignInController;
  [(BuddyAppleIDSignInController *)&v3 dealloc];
}

- (id)_titleText
{
  return -[BuddyAppleIDSignInController _titleTextForAuthMode:](self, "_titleTextForAuthMode:", self->_mode, a2, self);
}

- (id)_titleTextForAuthMode:(int)a3
{
  switch(a3)
  {
    case 1:
    case 4:
      objc_super v3 = +[NSBundle bundleForClass:objc_opt_class()];
      int v10 = [(NSBundle *)v3 localizedStringForKey:@"APPLE_ID_TITLE" value:&stru_1002B4E18 table:@"AppleIDAuth"];

      break;
    case 2:
      id v5 = +[NSBundle bundleForClass:objc_opt_class()];
      int v10 = [(NSBundle *)v5 localizedStringForKey:@"TWO_ACCOUNTS_ICLOUD_SIGN_IN_TITLE" value:&stru_1002B4E18 table:@"AppleIDAuth"];

      break;
    case 3:
      v6 = +[NSBundle bundleForClass:objc_opt_class()];
      int v10 = [(NSBundle *)v6 localizedStringForKey:@"TWO_ACCOUNTS_ITUNES_SIGN_IN_TITLE" value:&stru_1002B4E18 table:@"AppleIDAuth"];

      break;
    case 5:
      SEL v4 = +[NSBundle bundleForClass:objc_opt_class()];
      int v10 = [(NSBundle *)v4 localizedStringForKey:@"ICLOUD_TITLE" value:&stru_1002B4E18 table:@"AppleIDAuth"];

      break;
    case 6:
      int v10 = 0;
      break;
    case 7:
      v7 = +[NSBundle bundleForClass:objc_opt_class()];
      int v10 = [(NSBundle *)v7 localizedStringForKey:@"SOFTWARE_UPDATE_SIGN_IN_TITLE" value:&stru_1002B4E18 table:@"AppleIDAuth"];

      break;
    case 8:
      id v8 = +[NSBundle bundleForClass:objc_opt_class()];
      int v10 = [(NSBundle *)v8 localizedStringForKey:@"SIGN_IN_WORK_ACCOUNT" value:&stru_1002B4E18 table:@"AppleIDAuth"];

      break;
    default:
      break;
  }

  return v10;
}

- (id)stringWithUsernameFormattedIntoString:(id)a3
{
  v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v36 = 0;
  if ([location[0] length])
  {
    id v35 = objc_alloc_init((Class)NSMutableParagraphStyle);
    [v35 setAlignment:1];
    [v35 setLineBreakMode:0];
    id v34 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout];
    id v33 = 0;
    id v3 = location[0];
    id obj = 0;
    SEL v4 = [(BuddyAppleIDSignInController *)v38 username];
    id v5 = +[NSString stringWithValidatedFormat:v3, @"%@", &obj, v4 validFormatSpecifiers error];
    objc_storeStrong(&v33, obj);
    id v32 = v5;

    if (!v32)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v29 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        char v27 = 0;
        char v25 = 0;
        if (_BYIsInternalInstall())
        {
          v6 = (NSString *)v33;
        }
        else if (v33)
        {
          id v28 = [v33 domain];
          char v27 = 1;
          v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v28, [v33 code]);
          id v26 = v6;
          char v25 = 1;
        }
        else
        {
          v6 = 0;
        }
        sub_10004BB7C((uint64_t)buf, (uint64_t)v6);
        _os_log_error_impl((void *)&_mh_execute_header, oslog, v29, "Failed to format username into string: %{public}@", buf, 0xCu);
        if (v25) {

        }
        if (v27) {
      }
        }
      objc_storeStrong((id *)&oslog, 0);
    }
    id v7 = objc_alloc((Class)NSMutableAttributedString);
    id v8 = v32;
    v39[0] = NSParagraphStyleAttributeName;
    v40[0] = v35;
    v39[1] = NSFontAttributeName;
    id v9 = +[UIFont fontWithDescriptor:v34 size:0.0];
    v40[1] = v9;
    int v10 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
    id v11 = [v7 initWithString:v8 attributes:v10];
    id v12 = v36;
    id v36 = v11;

    id v13 = [v36 string];
    id v14 = [(BuddyAppleIDSignInController *)v38 username];
    id v15 = [v13 rangeOfString:v14];
    uint64_t v24 = v16;
    id v23 = v15;

    if (v24)
    {
      id v17 = [v34 fontDescriptorWithSymbolicTraits:2];
      id v22 = +[UIFont fontWithDescriptor:v17 size:0.0];

      [v36 addAttribute:NSFontAttributeName value:v22 range:v23];
      SEL v18 = [(BuddyAppleIDSignInController *)v38 username];
      id v21 = +[AKUsernameFormatter formattedUsernameFromUsername:v18];

      [v36 replaceCharactersInRange:v23 withString:v24];
      objc_storeStrong(&v21, 0);
      objc_storeStrong(&v22, 0);
    }
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v34, 0);
    objc_storeStrong(&v35, 0);
  }
  id v19 = v36;
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
  return v19;
}

- (id)_subtitleTextForMode:(int)a3
{
  v43 = self;
  SEL v42 = a2;
  int v41 = a3;
  id v40 = 0;
  if (a3 == 1)
  {
    id v3 = +[UIDevice currentDevice];
    unsigned __int8 v4 = [(UIDevice *)v3 sf_isChinaRegionCellularDevice];

    id v5 = objc_alloc((Class)NSAttributedString);
    if (v4)
    {
      v6 = +[NSBundle bundleForClass:objc_opt_class()];
      id v7 = [(NSBundle *)v6 localizedStringForKey:@"APPLEID_SIGN_IN_CELLULAR_NOTICE" value:&stru_1002B4E18 table:@"AppleIDAuth"];
    }
    else
    {
      v6 = +[NSBundle bundleForClass:objc_opt_class()];
      id v7 = [(NSBundle *)v6 localizedStringForKey:@"APPLEID_SIGN_IN_TEXT" value:&stru_1002B4E18 table:@"AppleIDAuth"];
    }
    id v8 = [v5 initWithString:v7];
    id v9 = v40;
    id v40 = v8;
  }
  else
  {
    switch(v41)
    {
      case 2:
        id v33 = objc_alloc((Class)NSAttributedString);
        id v34 = +[NSBundle bundleForClass:objc_opt_class()];
        id v35 = [(NSBundle *)v34 localizedStringForKey:@"TWO_ACCOUNTS_ICLOUD_SIGN_IN_TEXT" value:&stru_1002B4E18 table:@"AppleIDAuth"];
        id v36 = [v33 initWithString:v35];
        id v37 = v40;
        id v40 = v36;

        break;
      case 3:
        id v28 = objc_alloc((Class)NSAttributedString);
        os_log_type_t v29 = +[NSBundle bundleForClass:objc_opt_class()];
        v30 = [(NSBundle *)v29 localizedStringForKey:@"TWO_ACCOUNTS_ITUNES_SIGN_IN_TEXT" value:&stru_1002B4E18 table:@"AppleIDAuth"];
        id v31 = [v28 initWithString:v30];
        id v32 = v40;
        id v40 = v31;

        break;
      case 4:
        int v10 = [(BuddyAppleIDSignInController *)v43 username];
        NSUInteger v11 = [(NSString *)v10 length];

        if (v11)
        {
          id v12 = +[NSBundle bundleForClass:objc_opt_class()];
          id v13 = [(NSBundle *)v12 localizedStringForKey:@"ICLOUD_UPGRADE_TEXT_%@" value:&stru_1002B4E18 table:@"AppleIDAuth"];
          id v14 = [(BuddyAppleIDSignInController *)v43 stringWithUsernameFormattedIntoString:v13];
          id v15 = v40;
          id v40 = v14;
        }
        break;
      case 5:
        id v23 = objc_alloc((Class)NSAttributedString);
        uint64_t v24 = +[NSBundle bundleForClass:objc_opt_class()];
        char v25 = [(NSBundle *)v24 localizedStringForKey:@"APPLE_ACCOUNT_SIGN_IN_TEXT" value:&stru_1002B4E18 table:@"AppleIDAuth"];
        id v26 = [v23 initWithString:v25];
        id v27 = v40;
        id v40 = v26;

        break;
      case 7:
        uint64_t v16 = [(BuddyAppleIDSignInController *)v43 username];
        NSUInteger v17 = [(NSString *)v16 length];

        if (v17)
        {
          id v18 = objc_alloc((Class)NSAttributedString);
          id v19 = +[NSBundle bundleForClass:objc_opt_class()];
          v20 = [(NSBundle *)v19 localizedStringForKey:@"SOFTWARE_UPDATE_SUBTITLE_TEXT" value:&stru_1002B4E18 table:@"AppleIDAuth"];
          id v21 = [v18 initWithString:v20];
          id v22 = v40;
          id v40 = v21;
        }
        break;
      default:
        break;
    }
  }
  id v38 = [v40 string];
  objc_storeStrong(&v40, 0);

  return v38;
}

- (id)_subTitleText
{
  v2 = [(BuddyAppleIDSignInController *)self detailText];

  if (v2) {
    id v5 = [(BuddyAppleIDSignInController *)self detailText];
  }
  else {
    id v5 = (NSString *)[(BuddyAppleIDSignInController *)self _subtitleTextForMode:self->_mode];
  }

  return v5;
}

- (void)setiForgotText:(id)a3 handler:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(BFFLinkLabelFooterView *)v7->_topSectionFooterView removeAllLinks];
  if ([location[0] length] && v5) {
    [(BuddyAppleIDSignInController *)v7 addFooterLinkWithTitle:location[0] handler:v5];
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)addFooterLinkWithTitle:(id)a3 handler:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  id v5 = [(BuddyAppleIDSignInController *)v8 topSectionFooterView];
  [v5 addLinkWithTitle:location[0] handler:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)removeFooterLinkAtIndex:(unint64_t)a3
{
}

- (void)setFooterText:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyAppleIDSignInController *)v5 topSectionFooterView];
  [v3 setLabelText:location[0]];

  objc_storeStrong(location, 0);
}

- (NSString)footerText
{
  return (NSString *)[(BFFLinkLabelFooterView *)self->_topSectionFooterView labelText];
}

- (id)topSectionFooterView
{
  if (!self->_topSectionFooterView)
  {
    v2 = [objc_alloc((Class)BFFLinkLabelFooterView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, a2];
    topSectionFooterView = self->_topSectionFooterView;
    self->_topSectionFooterView = v2;
  }
  unsigned __int8 v4 = self->_topSectionFooterView;

  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  if (a3 != self->_enabled)
  {
    self->_enabled = a3;
    id v3 = [(UITableViewCell *)self->_usernameCell editableTextField];
    [v3 setEnabled:a3];

    id v4 = [(UITableViewCell *)self->_passwordCell editableTextField];
    [v4 setEnabled:a3];

    [(BFFLinkLabelFooterView *)self->_topSectionFooterView setEnabled:a3];
    if (a3)
    {
      +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:@"BUDDY_APPLEID_SIGN_IN_PAGE"];
    }
    else
    {
      id v5 = [(BuddyAppleIDSignInController *)self navigationController];
      id v6 = [v5 topViewController];
      +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:v6 identifier:@"BUDDY_APPLEID_SIGN_IN_PAGE"];
    }
  }
}

- (double)rowHeight
{
  v2 = +[UIScreen mainScreen];
  [(UIScreen *)v2 bounds];
  BOOL v4 = v3 <= 568.01;

  char v11 = 0;
  char v9 = 0;
  BOOL v5 = 0;
  if (!v4)
  {
    id v12 = +[UIApplication sharedApplication];
    char v11 = 1;
    int v10 = [(UIApplication *)v12 preferredContentSizeCategory];
    char v9 = 1;
    BOOL v5 = !UIContentSizeCategoryIsAccessibilityCategory(v10);
  }
  if (v9) {

  }
  if (v11) {
  if (!v5)
  }
    return -1.0;
  id v6 = +[BFFStyle sharedStyle];
  [v6 tallRowHeight];
  double v13 = v7;

  return v13;
}

- (void)loadView
{
  v48 = self;
  SEL v47 = a2;
  v46.receiver = self;
  v46.super_class = (Class)BuddyAppleIDSignInController;
  [(BuddyAppleIDSignInController *)&v46 loadView];
  id v2 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(BuddyAppleIDSignInController *)v48 setTableView:v2];

  id v3 = [(BuddyAppleIDSignInController *)v48 tableView];
  [v3 setSectionHeaderHeight:0.0];

  long long v4 = *(_OWORD *)&UIEdgeInsetsZero.top;
  long long v45 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  long long v44 = v4;
  id v5 = [(BuddyAppleIDSignInController *)v48 tableView];
  long long v43 = v45;
  long long v42 = v44;
  [v5 setSeparatorInset:v44, v45];

  id v6 = [(BuddyAppleIDSignInController *)v48 tableView];
  [v6 setContentInsetAdjustmentBehavior:2];

  double v7 = v48;
  id v8 = [(BuddyAppleIDSignInController *)v48 tableView];
  [v8 setDelegate:v7];

  char v9 = v48;
  id v10 = [(BuddyAppleIDSignInController *)v48 tableView];
  [v10 setDataSource:v9];

  id v11 = [(BuddyAppleIDSignInController *)v48 tableView];
  [v11 setRowHeight:UITableViewAutomaticDimension];

  id v12 = [(BuddyAppleIDSignInController *)v48 tableView];
  [v12 setEstimatedSectionFooterHeight:0.0];

  id v13 = [(BuddyAppleIDSignInController *)v48 tableView];
  [v13 setEstimatedSectionHeaderHeight:0.0];

  id v14 = [(BuddyAppleIDSignInController *)v48 tableView];
  [v14 setAllowsSelectionDuringEditing:1];

  id v15 = [(BuddyAppleIDSignInController *)v48 tableView];
  [v15 setSectionFooterHeight:0.0];

  id v16 = [(BuddyAppleIDSignInController *)v48 tableView];
  [(BuddyAppleIDSignInController *)v48 rowHeight];
  [v16 setRowHeight:];

  BOOL v17 = 0;
  if (v48->_mode != 4) {
    BOOL v17 = v48->_mode != 6;
  }
  [(BuddyAppleIDSignInController *)v48 setShowsUsernameAsField:v17];
  v48->_showsPasswordAsField = !v48->_showsUsernameAsField;
  BOOL v18 = 1;
  if (v48->_mode != 1)
  {
    BOOL v18 = 1;
    if (v48->_mode != 5) {
      BOOL v18 = v48->_mode == 4;
    }
  }
  [(BuddyAppleIDSignInController *)v48 setShowsInfoSection:v18];
  objc_initWeak(&location, v48);
  if (v48->_mode == 6 || v48->_mode == 4)
  {
    BOOL v40 = 0;
    BOOL v40 = v48->_mode == 4;
    id v19 = v48;
    v20 = +[NSBundle bundleForClass:objc_opt_class()];
    id v21 = [(NSBundle *)v20 localizedStringForKey:@"SKIP_LINK" value:&stru_1002B4E18 table:@"AppleIDAuth"];
    id v33 = _NSConcreteStackBlock;
    int v34 = -1073741824;
    int v35 = 0;
    id v36 = sub_10012BDC0;
    id v37 = &unk_1002B3670;
    BOOL v39 = v40;
    objc_copyWeak(&v38, &location);
    [(BuddyAppleIDSignInController *)v19 addFooterLinkWithTitle:v21 handler:&v33];

    if (!v40)
    {
      id v22 = [(BuddyAppleIDSignInController *)v48 topSectionFooterView];
      [v22 setWantsSideBySideLayout:1];
    }
    objc_destroyWeak(&v38);
  }
  else if (v48->_mode == 3)
  {
    id v23 = v48;
    uint64_t v24 = +[NSBundle bundleForClass:objc_opt_class()];
    char v25 = [(NSBundle *)v24 localizedStringForKey:@"SKIP_LINK" value:&stru_1002B4E18 table:@"AppleIDAuth"];
    id v28 = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472;
    v30 = sub_10012C1A8;
    id v31 = &unk_1002B0CA8;
    objc_copyWeak(&v32, &location);
    [(BuddyAppleIDSignInController *)v23 addFooterLinkWithTitle:v25 handler:&v28];

    objc_destroyWeak(&v32);
  }
  if (v48->_mode == 5)
  {
    id v26 = [(BuddyAppleIDSignInController *)v48 topSectionFooterView];
    [v26 setFlexibleHeight:10.0];
  }
  id v27 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v27 addObserver:v48 selector:"_textChanged:" name:UITextFieldTextDidChangeNotification object:0];

  objc_destroyWeak(&location);
}

- (void)viewDidLoad
{
  id v32 = self;
  SEL v31 = a2;
  v30.receiver = self;
  v30.super_class = (Class)BuddyAppleIDSignInController;
  [(BuddyAppleIDSignInController *)&v30 viewDidLoad];
  if (v32->_mode != 8)
  {
    id v2 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"State 1" darkStateName:@"Dark 1" transitionDuration:0.01 transitionSpeed:1.0];
    v34[0] = v2;
    id v3 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"State 2" darkStateName:@"Dark 2" transitionDuration:1.0 transitionSpeed:0.7];
    v34[1] = v3;
    id location = +[NSArray arrayWithObjects:v34 count:2];

    id v4 = [(BuddyAppleIDSignInController *)v32 buddy_animationController:@"AppleID" animatedStates:location startAtFirstState:1];
    [(BuddyAppleIDSignInController *)v32 setAnimationController:v4];

    id v5 = [(BuddyAppleIDSignInController *)v32 headerView];
    id v6 = [v5 animationView];
    [v6 defaultScale];
    double v8 = v7 + 0.0299999993;
    id v9 = [(BuddyAppleIDSignInController *)v32 headerView];
    id v10 = [v9 animationView];
    [v10 setScale:v8];

    objc_storeStrong(&location, 0);
  }
  id v11 = +[OBBoldTrayButton boldButton];
  [(BuddyAppleIDSignInController *)v32 setContinueButton:v11];

  id v12 = [(BuddyAppleIDSignInController *)v32 continueButton];
  id v13 = +[NSBundle bundleForClass:objc_opt_class()];
  id v14 = [(NSBundle *)v13 localizedStringForKey:@"CONTINUE" value:&stru_1002B4E18 table:@"AppleIDAuth"];
  [(OBBoldTrayButton *)v12 setTitle:v14 forState:0];

  id v15 = [(BuddyAppleIDSignInController *)v32 continueButton];
  [(OBBoldTrayButton *)v15 addTarget:v32 action:"_continueButtonTapped" forEvents:64];

  [(BuddyAppleIDSignInController *)v32 _setContinueButtonEnabledOrDisabled];
  if (v32->_mode == 2 || v32->_mode == 3)
  {
    [(BuddyAppleIDSignInController *)v32 setShouldAdjustScrollViewInsetForKeyboard:1];
  }
  else
  {
    id v16 = [(BuddyAppleIDSignInController *)v32 buttonTray];
    uint64_t v33 = BYPrivacyAppleIDIdentifier;
    BOOL v17 = +[NSArray arrayWithObjects:&v33 count:1];
    [v16 setPrivacyLinkForBundles:v17];

    [(BuddyAppleIDSignInController *)v32 setShouldAdjustScrollViewInsetForKeyboard:1];
    id v18 = [(BuddyAppleIDSignInController *)v32 buttonTray];
    id v19 = [(BuddyAppleIDSignInController *)v32 continueButton];
    [v18 addButton:v19];
  }
  id v20 = [(BuddyAppleIDSignInController *)v32 loginOptionsConstructor];

  if (v20)
  {
    id v28 = +[OBLinkTrayButton linkButton];
    id v27 = 0;
    id v21 = (uint64_t (**)(id, id *))[(BuddyAppleIDSignInController *)v32 loginOptionsConstructor];
    id obj = 0;
    id v22 = (id)v21[2](v21, &obj);
    objc_storeStrong(&v27, obj);
    [(BuddyAppleIDSignInController *)v32 setLoginOptionsAction:v22];

    [v28 setTitle:v27 forState:0];
    [v28 addTarget:v32 action:"_loginOptionsTapped:" forEvents:64];
    id v23 = [(BuddyAppleIDSignInController *)v32 buttonTray];
    [v23 addButton:v28];

    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
  }
  id v24 = [(BuddyAppleIDSignInController *)v32 _titleText];
  id v25 = [(BuddyAppleIDSignInController *)v32 navigationItem];
  [v25 setBackButtonTitle:v24];
}

- (void)viewWillAppear:(BOOL)a3
{
  id v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10005A060(buf, v11->_mode);
    _os_log_impl((void *)&_mh_execute_header, oslog, v7, "SignInController showing mode %i", buf, 8u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v6.receiver = v11;
  v6.super_class = (Class)BuddyAppleIDSignInController;
  [(BuddyAppleIDSignInController *)&v6 viewWillAppear:v9];
  id v3 = [(BuddyAppleIDSignInController *)v11 view];
  [v3 setNeedsLayout];

  id v4 = [(BuddyAppleIDSignInController *)v11 view];
  [v4 layoutIfNeeded];

  id v5 = [(BuddyAppleIDSignInController *)v11 animationController];
  [(OBAnimationController *)v5 startAnimation];
}

- (void)viewDidAppear:(BOOL)a3
{
  id v15 = self;
  SEL v14 = a2;
  BOOL v13 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BuddyAppleIDSignInController;
  [(BuddyAppleIDSignInController *)&v12 viewDidAppear:a3];
  if (v15->_mode != 1 && v15->_mode != 5 && v15->_mode != 4)
  {
    id v3 = [(UITableViewCell *)v15->_usernameCell editableTextField];
    id v4 = [v3 text];
    BOOL v5 = 1;
    if (![v4 length]) {
      BOOL v5 = v15->_usernameCell == 0;
    }

    if (v5) {
      id v6 = [(UITableViewCell *)v15->_passwordCell editableTextField];
    }
    else {
      id v6 = [(UITableViewCell *)v15->_usernameCell editableTextField];
    }
    [v6 becomeFirstResponder];
  }
  char v10 = 0;
  BOOL v7 = 0;
  if (sub_10012CF30())
  {
    id v11 = +[UIScreen mainScreen];
    char v10 = 1;
    [(UIScreen *)v11 bounds];
    BOOL v7 = v8 <= 480.01;
  }
  if (v10) {

  }
  if (v7)
  {
    id v9 = [(BuddyAppleIDSignInController *)v15 tableView];
    [v9 flashScrollIndicators];
  }
  if (v15->_appearanceHandler) {
    (*((void (**)(void))v15->_appearanceHandler + 2))();
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  [(BuddyAppleIDSignInController *)self setEnabled:1];
  v3.receiver = v6;
  v3.super_class = (Class)BuddyAppleIDSignInController;
  [(BuddyAppleIDSignInController *)&v3 viewDidDisappear:v4];
}

- (void)_loginOptionsTapped:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_super v3 = (void (**)(void))[(BuddyAppleIDSignInController *)v5 loginOptionsAction];
  v3[2](v3);

  objc_storeStrong(location, 0);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return UITableViewAutomaticDimension;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  char v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a4)
  {
    int64_t v11 = 0;
  }
  else
  {
    unsigned __int8 v5 = [(BuddyAppleIDSignInController *)v10 showsUsernameAsField];
    unsigned __int8 v6 = 0;
    if (v5) {
      unsigned __int8 v6 = [(BuddyAppleIDSignInController *)v10 showsPasswordAsField];
    }
    if (v6) {
      unsigned int v7 = 2;
    }
    else {
      unsigned int v7 = 1;
    }
    int64_t v11 = v7;
  }
  objc_storeStrong(location, 0);
  return v11;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  int64_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v9 = a4;
  if (a4)
  {
    if (v9 == 1)
    {
      id v7 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
      objc_super v12 = (BFFLinkLabelFooterView *)v7;
      int v8 = 1;
      objc_storeStrong(&v7, 0);
    }
    else
    {
      objc_super v12 = 0;
      int v8 = 1;
    }
  }
  else
  {
    objc_super v12 = v11->_topSectionFooterView;
    int v8 = 1;
  }
  objc_storeStrong(location, 0);
  unsigned __int8 v5 = v12;

  return v5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0.0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  v57 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v55 = a4;
  if (a4)
  {
    [(BuddyAppleIDSignInController *)v57 keyboardFrame];
    v60.size.height = CGRectZero.size.height;
    v60.size.width = CGRectZero.size.width;
    v60.origin.y = CGRectZero.origin.y;
    v60.origin.x = CGRectZero.origin.x;
    if (CGRectEqualToRect(v59, v60))
    {
      double v58 = 0.0;
    }
    else
    {
      id v19 = [location[0] tableFooterView];
      id v20 = [(BuddyAppleIDSignInController *)v57 buttonTray];
      id v21 = [v20 superview];
      BOOL v22 = v19 == v21;

      if (v55 != 1 || v22 || (sub_10012DA04() & 1) == 0) {
        goto LABEL_21;
      }
      id v23 = [(BuddyAppleIDSignInController *)v57 view];
      [v23 layoutMargins];

      id v24 = [(BuddyAppleIDSignInController *)v57 navigationController];
      id v25 = [v24 navigationBar];
      [v25 bounds];
      double v51 = v26;

      double v50 = 0.0;
      id v27 = [location[0] tableFooterView];
      [v27 bounds];
      double v29 = v28;

      if (v29 == 0.0)
      {
        id v30 = [(BuddyAppleIDSignInController *)v57 buttonTray];
        [v30 bounds];
        double v50 = v31;
      }
      id v32 = [location[0] tableHeaderView];
      [v32 bounds];
      double v34 = v33;

      double v49 = v34;
      id v35 = [(BuddyAppleIDSignInController *)v57 usernameCell];
      [v35 bounds];
      double v37 = v36;

      double v48 = 0.0;
      if (v57->_showsPasswordAsField)
      {
        id v38 = [(BuddyAppleIDSignInController *)v57 passwordCell];
        [v38 bounds];
        double v48 = v39;
      }
      [(BFFLinkLabelFooterView *)v57->_topSectionFooterView bounds];
      double v47 = v51 + v49 + v37 + v48 + v40 + v50;
      id v41 = [(BuddyAppleIDSignInController *)v57 view];
      [v41 bounds];
      double v43 = v42;

      if (v43 > v47)
      {
        id v44 = [(BuddyAppleIDSignInController *)v57 view];
        [v44 bounds];
        double v58 = v45 - v47;
      }
      else
      {
LABEL_21:
        double v58 = 0.0;
      }
    }
  }
  else
  {
    memset(__b, 0, sizeof(__b));
    [(BFFLinkLabelFooterView *)v57->_topSectionFooterView margins];
    __b[0] = v5;
    __b[1] = v6;
    __b[2] = v7;
    __b[3] = v8;
    [location[0] _backgroundInset];
    __b[1] = v9;
    [location[0] _backgroundInset];
    __b[3] = v10;
    char v11 = sub_10012CF30();
    char v52 = 0;
    BOOL v12 = 0;
    if (v11)
    {
      v53 = +[UIScreen mainScreen];
      char v52 = 1;
      [(UIScreen *)v53 bounds];
      BOOL v12 = v13 <= 480.01;
    }
    if (v12) {
      int v14 = 4;
    }
    else {
      int v14 = 16;
    }
    __b[0] = (double)v14;
    if (v52) {

    }
    -[BFFLinkLabelFooterView setMargins:](v57->_topSectionFooterView, "setMargins:", __b[0], __b[1], __b[2], __b[3]);
    [location[0] bounds];
    [location[0] separatorInset];
    [location[0] layoutMargins];
    [location[0] layoutMargins];
    topSectionFooterView = v57->_topSectionFooterView;
    [location[0] bounds];
    sub_10012D9D0();
    -[BFFLinkLabelFooterView sizeThatFits:](topSectionFooterView, "sizeThatFits:", v16, v17);
    double v58 = v18;
  }
  objc_storeStrong(location, 0);
  return v58;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v12 = 0;
  if (![(BuddyAppleIDSignInController *)v15 showsUsernameAsField]) {
    goto LABEL_5;
  }
  if ([v13 row])
  {
    if ([v13 row] != (id)1) {
      goto LABEL_6;
    }
LABEL_5:
    id v7 = [(BuddyAppleIDSignInController *)v15 passwordCell];
    id v8 = v12;
    id v12 = v7;

    goto LABEL_6;
  }
  id v5 = [(BuddyAppleIDSignInController *)v15 usernameCell];
  id v6 = v12;
  id v12 = v5;

LABEL_6:
  double v9 = +[UIColor secondarySystemBackgroundColor];
  [v12 setBackgroundColor:v9];

  id v10 = v12;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (id)usernameCell
{
  id v13 = self;
  location[1] = (id)a2;
  if (!self->_usernameCell)
  {
    id v2 = [[BuddyAppleIDSignInTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
    usernameCell = v13->_usernameCell;
    v13->_usernameCell = &v2->super;

    [(UITableViewCell *)v13->_usernameCell setSelectionStyle:0];
    location[0] = [(UITableViewCell *)v13->_usernameCell editableTextField];
    BOOL v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = v4;
    if (v13->_phoneNumberSupported) {
      CFStringRef v6 = @"SIGN_IN_EMAIL_OR_PHONE";
    }
    else {
      CFStringRef v6 = @"SIGN_IN_EMAIL";
    }
    id v7 = [(NSBundle *)v4 localizedStringForKey:v6 value:&stru_1002B4E18 table:@"AppleIDAuth"];
    [location[0] setPlaceholder:v7];

    [location[0] setAutocorrectionType:1];
    [location[0] setAutocapitalizationType:0];
    [location[0] setDelegate:v13];
    [location[0] setKeyboardType:7];
    [location[0] setReturnKeyType:11];
    [location[0] setTextContentType:UITextContentTypeUsername];
    [location[0] setEnablesReturnKeyAutomatically:1];
    id v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [location[0] setFont:v8];

    id v9 = +[UIColor _labelColor];
    [location[0] setTextColor:v9];

    objc_storeStrong(location, 0);
  }
  id v10 = v13->_usernameCell;

  return v10;
}

- (void)setUsername:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyAppleIDSignInController *)v8 usernameCell];
  id v4 = [v3 editableTextField];
  [v4 setText:location[0]];

  [(BuddyAppleIDSignInController *)v8 _setContinueButtonEnabledOrDisabled];
  id v5 = [(BuddyAppleIDSignInController *)v8 headerView];
  id v6 = [(BuddyAppleIDSignInController *)v8 _subTitleText];
  [v5 setDetailText:v6];

  objc_storeStrong(location, 0);
}

- (NSString)username
{
  id v2 = [(BuddyAppleIDSignInController *)self usernameCell];
  id v3 = [v2 editableTextField];
  id v4 = [v3 text];

  return (NSString *)v4;
}

- (void)setIsUsernameEditable:(BOOL)a3
{
  if (self->_isUsernameEditable != a3)
  {
    self->_isUsernameEditable = a3;
    id v3 = [(BuddyAppleIDSignInController *)self usernameCell];
    id v4 = [v3 editableTextField];
    [v4 setUserInteractionEnabled:a3];
  }
}

- (id)passwordCell
{
  char v11 = self;
  location[1] = (id)a2;
  if (!self->_passwordCell)
  {
    id v2 = [[BuddyAppleIDSignInTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
    passwordCell = v11->_passwordCell;
    v11->_passwordCell = &v2->super;

    [(UITableViewCell *)v11->_passwordCell setSelectionStyle:0];
    location[0] = [(UITableViewCell *)v11->_passwordCell editableTextField];
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = [(NSBundle *)v4 localizedStringForKey:@"THIS_FIELD_REQUIRED" value:&stru_1002B4E18 table:@"AppleIDAuth"];
    [location[0] setPlaceholder:v5];

    [location[0] setSecureTextEntry:1];
    [location[0] setAutocorrectionType:1];
    [location[0] setAutocapitalizationType:0];
    [location[0] setDelegate:v11];
    [location[0] setReturnKeyType:11];
    [location[0] setEnablesReturnKeyAutomatically:1];
    id v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [location[0] setFont:v6];

    id v7 = +[UIColor _labelColor];
    [location[0] setTextColor:v7];

    [location[0] setReturnKeyType:11];
    objc_storeStrong(location, 0);
  }
  id v8 = v11->_passwordCell;

  return v8;
}

- (void)_continueButtonTapped
{
  if (self->_showsPasswordAsField)
  {
    [(BuddyAppleIDSignInController *)self _signInToAccount];
  }
  else
  {
    id v2 = [(BuddyAppleIDSignInController *)self username];
    id v3 = [(BuddyAppleIDSignInController *)self _userFriendlyDisplayNameForCurrentUserName:v2];
    [(BuddyAppleIDSignInController *)self setUsername:v3];

    id v4 = (void (**)(id, id))[(BuddyAppleIDSignInController *)self authModeHandler];
    id v5 = [(BuddyAppleIDSignInController *)self username];
    id v6 = [(BuddyAppleIDSignInController *)self _serverFriendlyDisplayNameForCurrentUserName:v5];
    v4[2](v4, v6);
  }
}

- (id)_serverFriendlyDisplayNameForCurrentUserName:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!v9->_phoneNumberSupported || ([location[0] containsString:@"@"] & 1) != 0)
  {
    id v10 = location[0];
  }
  else
  {
    id v7 = objc_alloc_init((Class)AAFPhoneNumberFormatter);
    id v6 = [v7 displayFormatFor:location[0]];
    id v5 = [v7 normalizedFormatFor:v6];
    id v10 = v5;
    objc_storeStrong(&v5, 0);
    objc_storeStrong(&v6, 0);
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(location, 0);
  id v3 = v10;

  return v3;
}

- (id)_userFriendlyDisplayNameForCurrentUserName:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!v9->_phoneNumberSupported
    || ([location[0] containsString:@"@"] & 1) != 0
    || ((id v7 = objc_alloc_init((Class)AAFPhoneNumberFormatter),
         id v6 = [v7 displayFormatFor:location[0]],
         ([v6 isEqualToString:location[0]] & 1) != 0)
      ? (int v5 = 0)
      : (v10 = v6, int v5 = 1),
        objc_storeStrong(&v6, 0),
        objc_storeStrong(&v7, 0),
        !v5))
  {
    id v10 = location[0];
  }
  objc_storeStrong(location, 0);
  id v3 = v10;

  return v3;
}

- (void)_signInToAccount
{
  id v9 = self;
  v8[1] = (id)a2;
  id v2 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_10012E6F4;
  id v7 = &unk_1002B0D20;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  double v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = location[0];
  id v4 = [(UITableViewCell *)v29->_usernameCell editableTextField];

  if (v3 == v4)
  {
    id v5 = [(UITableViewCell *)v29->_usernameCell editableTextField];
    id v6 = [v5 text];
    id v7 = +[NSCharacterSet whitespaceCharacterSet];
    id v8 = (NSString *)[v6 stringByTrimmingCharactersInSet:v7];
    lastEnteredUsername = v29->_lastEnteredUsername;
    v29->_lastEnteredUsername = v8;

    if (!v29->_showsPasswordAsField)
    {
      id v10 = v29;
      char v11 = v29;
      id v12 = [(BuddyAppleIDSignInController *)v29 username];
      id v13 = [(BuddyAppleIDSignInController *)v11 _userFriendlyDisplayNameForCurrentUserName:v12];
      [(BuddyAppleIDSignInController *)v10 setUsername:v13];

      int v14 = (void (**)(id, id))[(BuddyAppleIDSignInController *)v29 authModeHandler];
      id v15 = v29;
      double v16 = [(BuddyAppleIDSignInController *)v29 username];
      id v17 = [(BuddyAppleIDSignInController *)v15 _serverFriendlyDisplayNameForCurrentUserName:v16];
      v14[2](v14, v17);
    }
    goto LABEL_11;
  }
  id v18 = location[0];
  id v19 = [(UITableViewCell *)v29->_passwordCell editableTextField];

  if (v18 != v19)
  {
LABEL_11:
    char v30 = 1;
    goto LABEL_12;
  }
  id v20 = [(UITableViewCell *)v29->_passwordCell editableTextField];
  id v21 = [v20 text];
  id v22 = [v21 length];

  if (v22)
  {
    id v23 = [(UITableViewCell *)v29->_usernameCell editableTextField];
    id v24 = [v23 text];
    id v25 = [v24 length];

    if (v25)
    {
      [(BuddyAppleIDSignInController *)v29 _signInToAccount];
    }
    else
    {
      id v26 = [(UITableViewCell *)v29->_usernameCell editableTextField];
      [v26 becomeFirstResponder];
    }
    goto LABEL_11;
  }
  char v30 = 0;
LABEL_12:
  objc_storeStrong(location, 0);
  return v30 & 1;
}

- (void)setDetailText:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_detailText, location[0]);
  id v3 = [(BuddyAppleIDSignInController *)v6 headerView];
  id v4 = [(BuddyAppleIDSignInController *)v6 _subTitleText];
  [v3 setDetailText:v4];

  objc_storeStrong(location, 0);
}

- (void)viewControllerSpinnerManagerDidStopAnimatingSpinner:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyAppleIDSignInController *)v4 _setContinueButtonEnabledOrDisabled];
  objc_storeStrong(location, 0);
}

- (void)_textChanged:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = [location[0] object];
  id v7 = [(UITableViewCell *)v10->_passwordCell editableTextField];
  id v6 = [(UITableViewCell *)v10->_usernameCell editableTextField];
  if (v8 == v6 && v10->_showsPasswordAsField)
  {
    id v3 = [v6 text];
    id v4 = +[NSCharacterSet whitespaceCharacterSet];
    id v5 = [v3 stringByTrimmingCharactersInSet:v4];

    if (([v5 isEqualToString:v10->_lastEnteredUsername] & 1) == 0) {
      [(BuddyAppleIDSignInController *)v10 setShowsPasswordAsField:0 animated:1];
    }
    objc_storeStrong(&v5, 0);
  }
  if (v8 == v7 || v8 == v6) {
    [(BuddyAppleIDSignInController *)v10 _setContinueButtonEnabledOrDisabled];
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)_setContinueButtonEnabledOrDisabled
{
  id v15 = self;
  v14[1] = (id)a2;
  v14[0] = [(UITableViewCell *)self->_passwordCell editableTextField];
  id location = [(UITableViewCell *)v15->_usernameCell editableTextField];
  char v11 = 0;
  char v9 = 0;
  char v7 = 0;
  char v5 = 0;
  if (v15->_showsPasswordAsField
    || (id v12 = [location text],
        char v11 = 1,
        BOOL v2 = 1,
        ![v12 length]))
  {
    if (v15->_showsUsernameAsField
      || (id v10 = [v14[0] text],
          char v9 = 1,
          BOOL v2 = 1,
          ![v10 length]))
    {
      id v8 = [location text];
      char v7 = 1;
      BOOL v2 = 0;
      if ([v8 length])
      {
        id v6 = [v14[0] text];
        char v5 = 1;
        BOOL v2 = [v6 length] != 0;
      }
    }
  }
  if (v5) {

  }
  if (v7) {
  if (v9)
  }

  if (v11) {
  BOOL v3 = v2;
  }
  id v4 = [(BuddyAppleIDSignInController *)v15 continueButton];
  [(OBBoldTrayButton *)v4 setEnabled:v3];

  objc_storeStrong(&location, 0);
  objc_storeStrong(v14, 0);
}

- (void)setShowsPasswordAsField:(BOOL)a3
{
}

- (void)setShowsPasswordAsField:(BOOL)a3 animated:(BOOL)a4
{
  double v31 = self;
  SEL v30 = a2;
  BOOL v29 = a3;
  BOOL v28 = a4;
  if (a3 != self->_showsPasswordAsField)
  {
    v31->_showsPasswordAsField = v29;
    id v4 = +[NSIndexPath indexPathForRow:v31->_showsUsernameAsField inSection:0];
    id v32 = v4;
    id location = +[NSArray arrayWithObjects:&v32 count:1];

    id v26 = 0;
    if (v28) {
      uint64_t v5 = 100;
    }
    else {
      uint64_t v5 = 5;
    }
    id v26 = (void *)v5;
    if (v29 && v31->_showsUsernameAsField)
    {
      id v19 = _NSConcreteStackBlock;
      int v20 = -1073741824;
      int v21 = 0;
      id v22 = sub_10012F444;
      id v23 = &unk_1002B12F0;
      id v24 = v31;
      id v25 = location;
      id v13 = _NSConcreteStackBlock;
      int v14 = -1073741824;
      int v15 = 0;
      double v16 = sub_10012F4D8;
      id v17 = &unk_1002B0EC0;
      id v18 = v31;
      +[UIView animateWithDuration:&v19 animations:&v13 completion:0.2];
      objc_storeStrong((id *)&v18, 0);
      objc_storeStrong(&v25, 0);
      objc_storeStrong((id *)&v24, 0);
    }
    else
    {
      id v6 = _NSConcreteStackBlock;
      int v7 = -1073741824;
      int v8 = 0;
      char v9 = sub_10012F530;
      id v10 = &unk_1002B3698;
      char v11 = v31;
      v12[0] = location;
      v12[1] = v26;
      +[UIView animateWithDuration:&v6 animations:&stru_1002B36D8 completion:0.2];
      objc_storeStrong(v12, 0);
      objc_storeStrong((id *)&v11, 0);
    }
    objc_storeStrong(&location, 0);
  }
}

- (double)headerViewBottomToTableViewTopPadding
{
  double v16 = 0.0;
  id v2 = +[BYDevice currentDevice];
  id v3 = [v2 type];

  if (v3 == (id)1) {
    return 37.0;
  }
  id v4 = +[BYDevice currentDevice];
  id v5 = [v4 size];

  switch((unint64_t)v5)
  {
    case 0uLL:
    case 1uLL:
    case 3uLL:
    case 5uLL:
      double v16 = 26.0;
      break;
    case 2uLL:
      double v16 = 20.0;
      break;
    case 4uLL:
      double v16 = 37.0;
      break;
    case 6uLL:
      id v6 = +[UIScreen mainScreen];
      [(UIScreen *)v6 bounds];
      char v14 = 0;
      char v12 = 0;
      BOOL v8 = 0;
      if (v7 == 414.0)
      {
        int v15 = +[UIScreen mainScreen];
        char v14 = 1;
        [(UIScreen *)v15 bounds];
        BOOL v8 = 0;
        if (v9 == 896.0)
        {
          id v13 = +[UIScreen mainScreen];
          char v12 = 1;
          [(UIScreen *)v13 scale];
          BOOL v8 = v10 == 3.0;
        }
      }
      if (v12) {

      }
      if (v14) {
      if (v8)
      }
        double v16 = 37.0;
      else {
        double v16 = 26.0;
      }
      break;
    default:
      return v16;
  }
  return v16;
}

- (void)setKeyboardFrame:(CGRect)a3
{
  CGRect v8 = a3;
  double v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyAppleIDSignInController;
  -[BuddyAppleIDSignInController setKeyboardFrame:](&v5, "setKeyboardFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v3 = [(BuddyAppleIDSignInController *)v7 tableView];
  id v4 = +[NSIndexSet indexSetWithIndex:1];
  [v3 _reloadSectionHeaderFooters:v4 withRowAnimation:5];
}

- (BOOL)_scrollViewContentIsUnderTray
{
  id v2 = [(BuddyAppleIDSignInController *)self tableView];
  id v3 = [v2 tableFooterView];
  id v4 = [(BuddyAppleIDSignInController *)self buttonTray];
  id v5 = [v4 superview];
  BOOL v6 = v3 == v5;

  BOOL v25 = v6;
  if (sub_10012DA04()) {
    int v7 = 17;
  }
  else {
    int v7 = 12;
  }
  double v24 = (double)v7;
  id v8 = [(BuddyAppleIDSignInController *)self view];
  [(BFFLinkLabelFooterView *)self->_topSectionFooterView frame];
  double v20 = v9;
  double v19 = v10;
  double v22 = v11;
  double v21 = v12;
  id v13 = [(BuddyAppleIDSignInController *)self tableView];
  [v8 convertRect:v13 fromView:v19];
  CGFloat v14 = CGRectGetMaxY(v27) - v24;
  id v15 = [(BuddyAppleIDSignInController *)self buttonTray];
  [v15 frame];
  BOOL v17 = v14 > v16;

  BOOL v23 = v17;
  if (v25) {
    return 0;
  }
  return v23;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (id)appearanceHandler
{
  return self->_appearanceHandler;
}

- (void)setAppearanceHandler:(id)a3
{
}

- (id)authModeHandler
{
  return self->_authModeHandler;
}

- (void)setAuthModeHandler:(id)a3
{
}

- (id)proximityLoginHandler
{
  return self->_proximityLoginHandler;
}

- (void)setProximityLoginHandler:(id)a3
{
}

- (BOOL)showsUsernameAsField
{
  return self->_showsUsernameAsField;
}

- (void)setShowsUsernameAsField:(BOOL)a3
{
  self->_showsUsernameAsField = a3;
}

- (BOOL)showsPasswordAsField
{
  return self->_showsPasswordAsField;
}

- (BOOL)isUsernameEditable
{
  return self->_isUsernameEditable;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (BOOL)showsInfoSection
{
  return self->_showsInfoSection;
}

- (void)setShowsInfoSection:(BOOL)a3
{
  self->_showsInfoSection = a3;
}

- (id)loginOptionsConstructor
{
  return self->_loginOptionsConstructor;
}

- (void)setLoginOptionsConstructor:(id)a3
{
}

- (id)credentialRecoveryHandler
{
  return self->_credentialRecoveryHandler;
}

- (void)setCredentialRecoveryHandler:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSLayoutConstraint)headerTopOffsetConstraint
{
  return self->_headerTopOffsetConstraint;
}

- (void)setHeaderTopOffsetConstraint:(id)a3
{
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (id)loginOptionsAction
{
  return self->_loginOptionsAction;
}

- (void)setLoginOptionsAction:(id)a3
{
}

- (OBBoldTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end