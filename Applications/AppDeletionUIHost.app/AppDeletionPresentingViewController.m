@interface AppDeletionPresentingViewController
- (AppDeletionPresentingViewController)initWithAlertData:(id)a3 delegate:(id)a4;
- (AppDeletionUISceneDelegate)delegate;
- (BOOL)_constructBulletedList:(id)a3;
- (BOOL)constructAppDeletionController;
- (BOOL)isICloudOn;
- (BOOL)isSOSAvailable;
- (BOOL)isWatchPaired;
- (BOOL)showArchiveOption;
- (NSNumber)numAppsInstalled;
- (NSNumber)numMediaShared;
- (NSString)bundleID;
- (NSString)deletionStringsTableName;
- (NSString)localizedName;
- (OBWelcomeController)obViewController;
- (UITextView)textView;
- (_NSRange)hyperLinkRangeForMessages;
- (double)presentationHeightForSheet;
- (id)_headerImage;
- (id)_localizedStringForKey:(id)a3 withFormatHint:(id)a4;
- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5;
- (unint64_t)appType;
- (void)_addBlurredBackgroundToView:(id)a3;
- (void)_addButtonTrayAndDismissButtonToController:(id)a3;
- (void)presentSheetViewController:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHyperLinkRangeForMessages:(_NSRange)a3;
- (void)setObViewController:(id)a3;
- (void)setTextView:(id)a3;
- (void)viewDidLoad;
@end

@implementation AppDeletionPresentingViewController

- (AppDeletionPresentingViewController)initWithAlertData:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v54.receiver = self;
  v54.super_class = (Class)AppDeletionPresentingViewController;
  v8 = [(AppDeletionPresentingViewController *)&v54 init];
  if (!v8) {
    goto LABEL_35;
  }
  v9 = [v6 objectForKey:kCFBundleIdentifierKey];
  if (v9)
  {
    v10 = v9;
    objc_storeStrong((id *)&v8->_bundleID, v9);
    v11 = [v6 objectForKey:kCFBundleNameKey];
    if (v11)
    {
      v12 = v11;
      objc_storeStrong((id *)&v8->_localizedName, v11);
      v13 = [v6 objectForKey:@"RelevantAppData"];
      v14 = [v13 objectForKeyedSubscript:@"TestCrash"];
      v15 = v14;
      if (v14) {
        LOBYTE(v14) = [v14 BOOLValue];
      }
      byte_1000175C0 = (char)v14;
      v16 = [v13 objectForKey:@"SADAppType"];
      if (v16)
      {
        v52 = v16;
        v53 = v15;
        v8->_appType = (unint64_t)[v16 unsignedIntegerValue];
        v17 = [v13 objectForKey:@"ShowArchiveOption"];
        v51 = v17;
        if (v17) {
          v8->_showArchiveOption = [v17 BOOLValue];
        }
        else {
          v8->_showArchiveOption = 1;
        }
        v34 = [v13 objectForKey:@"IsICloudOn"];
        v49 = v34;
        if (v34) {
          v8->_isICloudOn = [v34 BOOLValue];
        }
        else {
          v8->_isICloudOn = 0;
        }
        uint64_t v35 = [v13 objectForKey:@"NumInstalledApps" v49];
        numAppsInstalled = v8->_numAppsInstalled;
        v8->_numAppsInstalled = (NSNumber *)v35;

        if (v8->_numAppsInstalled || v8->_appType != 4)
        {
          uint64_t v39 = [v13 objectForKey:@"SharedMedia"];
          numMediaShared = v8->_numMediaShared;
          v8->_numMediaShared = (NSNumber *)v39;

          v41 = [v13 objectForKey:@"TestSOSAvailable"];
          v37 = v41;
          if (v41)
          {
            v8->_isSOSAvailable = [v41 BOOLValue];
          }
          else
          {
            v42 = +[AppDeletionUISOSState sharedInstance];
            v8->_isSOSAvailable = [v42 sosIsAvailable];
          }
          v38 = v50;
          v43 = [v13 objectForKey:@"WatchIsPaired"];
          v44 = v43;
          if (v43) {
            v8->_isWatchPaired = [v43 BOOLValue];
          }
          else {
            v8->_isWatchPaired = 0;
          }
          v8->_hyperLinkRangeForMessages.location = 0;
          v8->_hyperLinkRangeForMessages.length = 0;
          objc_storeStrong((id *)&v8->_delegate, a4);
          obViewController = v8->_obViewController;
          v8->_obViewController = 0;

          textView = v8->_textView;
          v8->_textView = 0;

          unsigned int v33 = ![(AppDeletionPresentingViewController *)v8 constructAppDeletionController];
        }
        else
        {
          v37 = sub_1000072E4((uint64_t)off_100017300);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            sub_100008304();
          }
          unsigned int v33 = 1;
          v38 = v50;
        }

        v16 = v52;
        v15 = v53;
      }
      else
      {
        unsigned int v33 = 1;
      }

      if (v33) {
        goto LABEL_34;
      }
LABEL_35:
      v47 = v8;
      goto LABEL_36;
    }
    v25 = sub_1000072E4((uint64_t)off_100017300);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10000828C(v25, v26, v27, v28, v29, v30, v31, v32);
    }
  }
  else
  {
    v10 = sub_1000072E4((uint64_t)off_100017300);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100008214(v10, v18, v19, v20, v21, v22, v23, v24);
    }
  }

LABEL_34:
  v47 = 0;
LABEL_36:

  return v47;
}

- (NSString)deletionStringsTableName
{
  return (NSString *)@"AppDeletionAlert";
}

- (id)_localizedStringForKey:(id)a3 withFormatHint:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  v8 = [(AppDeletionPresentingViewController *)self deletionStringsBundle];
  v9 = [(AppDeletionPresentingViewController *)self deletionStringsTableName];
  if (v8)
  {
    CFStringRef v10 = CFBundleCopyLocalizedString(v8, v6, 0, v9);
    if (v10 == v6)
    {

      v12 = sub_1000072E4((uint64_t)off_100017300);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [(AppDeletionPresentingViewController *)self bundleID];
        int v15 = 136315906;
        v16 = "-[AppDeletionPresentingViewController _localizedStringForKey:withFormatHint:]";
        __int16 v17 = 2112;
        uint64_t v18 = v6;
        __int16 v19 = 2112;
        uint64_t v20 = v9;
        __int16 v21 = 2112;
        uint64_t v22 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: A value for the custom deletion message key %@ was not found in the strings file named %@ for the current language in app %@; using default value instead",
          (uint8_t *)&v15,
          0x2Au);
      }
    }
    else
    {
      v11 = (__CFString *)v10;
      if (v10) {
        goto LABEL_9;
      }
    }
  }
  v11 = (__CFString *)v7;
LABEL_9:

  return v11;
}

- (BOOL)_constructBulletedList:(id)a3
{
  id v4 = a3;
  switch([(AppDeletionPresentingViewController *)self appType])
  {
    case 1uLL:
      if ([(AppDeletionPresentingViewController *)self isICloudOn])
      {
        v5 = [(AppDeletionPresentingViewController *)self _localizedStringForKey:@"DELETION_SHEET_PHOTOS_BODY_BEFORE_FIRST_ICLOUD_ON" withFormatHint:@"Photos and videos you take will continue to sync to iCloud."];
        [v4 addBulletedListItemWithTitle:v5 description:&stru_100010590 symbolName:@"arrow.trianglehead.2.clockwise.rotate.90.icloud"];
      }
      id v6 = [(AppDeletionPresentingViewController *)self _localizedStringForKey:@"DELETION_SHEET_PHOTOS_BODY_FIRST" withFormatHint:@"Access to your photo library will not be removed for apps. You'll still be able to manage access in Settings."];
      [v4 addBulletedListItemWithTitle:v6 description:&stru_100010590 symbolName:@"photo.on.rectangle"];
      id v7 = [(AppDeletionPresentingViewController *)self _localizedStringForKey:@"DELETION_SHEET_PHOTOS_BODY_SECOND" withFormatHint:@"Memories will not be available."];
      v8 = +[UIColor systemRedColor];
      [v4 addBulletedListItemWithTitle:v7 description:&stru_100010590 symbolName:@"memories" tintColor:v8];

      v9 = [(AppDeletionPresentingViewController *)self _localizedStringForKey:@"DELETION_SHEET_PHOTOS_BODY_THIRD" withFormatHint:@"Hidden and recently deleted photos will not be available."];
      CFStringRef v10 = +[UIColor systemRedColor];
      [v4 addBulletedListItemWithTitle:v9 description:&stru_100010590 symbolName:@"eye.slash" tintColor:v10];

      goto LABEL_12;
    case 2uLL:
      uint64_t v20 = [(AppDeletionPresentingViewController *)self numAppsInstalled];
      id v6 = v20;
      if (v20 && [v20 unsignedIntegerValue])
      {
        __int16 v21 = [(AppDeletionPresentingViewController *)self _localizedStringForKey:@"DELETION_SHEET_APP_MARKETPLACE_BODY" withFormatHint:@"%lu apps you downloaded with “%@” will not receive updates."];
        id v22 = [v6 unsignedIntegerValue];
        uint64_t v23 = [(AppDeletionPresentingViewController *)self localizedName];
        uint64_t v24 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v21, v22, v23);

        v25 = +[UIColor systemRedColor];
        [v4 addBulletedListItemWithTitle:v24 description:&stru_100010590 symbolName:@"square.and.arrow.down.badge.xmark" tintColor:v25];
      }
      id v7 = [(AppDeletionPresentingViewController *)self _localizedStringForKey:@"DELETION_SHEET_APPSTORE_BODY_SECOND" withFormatHint:@"If you want to download built-in iPhone apps, you'll need to restore “App Store”."];
      [v4 addBulletedListItemWithTitle:v7 description:&stru_100010590 symbolName:@"appstore.app"];
      v9 = [(AppDeletionPresentingViewController *)self _localizedStringForKey:@"DELETION_SHEET_APPSTORE_BODY_THIRD" withFormatHint:@"You'll still be able to manage app subscriptions in Settings."];
      [v4 addBulletedListItemWithTitle:v9 description:&stru_100010590 symbolName:@"plus.arrow.trianglehead.clockwise"];
LABEL_12:

      goto LABEL_24;
    case 3uLL:
      if ([(AppDeletionPresentingViewController *)self isICloudOn])
      {
        CFStringRef v26 = @"DELETION_SHEET_MESSAGES_BODY_FIRST";
        CFStringRef v27 = @"This app and all messages on this iPhone will be deleted. Messages stored in iCloud will not be deleted.";
      }
      else
      {
        CFStringRef v26 = @"DELETION_SHEET_MESSAGES_BODY_FIRST_SHORT_ICLOUD_OFF";
        CFStringRef v27 = @"This app and all messages on this iPhone will be deleted.";
      }
      id v6 = [(AppDeletionPresentingViewController *)self _localizedStringForKey:v26 withFormatHint:v27];
      unsigned int v33 = +[UIColor systemRedColor];
      [v4 addBulletedListItemWithTitle:v6 description:&stru_100010590 symbolName:@"trash" tintColor:v33];

      v34 = [(AppDeletionPresentingViewController *)self numMediaShared];
      id v7 = v34;
      if (v34 && [v34 unsignedIntegerValue])
      {
        uint64_t v35 = [(AppDeletionPresentingViewController *)self _localizedStringForKey:@"DELETION_SHEET_MESSAGES_BODY_SECOND" withFormatHint:@"%ld photos and videos shared with you in “Messages” will be deleted and no longer appear in “Photos”."];
        v36 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v35, [v7 unsignedIntegerValue]);

        v37 = +[UIColor systemRedColor];
        [v4 addBulletedListItemWithTitle:v36 description:&stru_100010590 symbolName:@"shared.with.you" tintColor:v37];
      }
      v38 = [(AppDeletionPresentingViewController *)self _localizedStringForKey:@"DELETION_SHEET_MESSAGES_BODY_THIRD" withFormatHint:@"This iPhone will not be able to send or receive text messages, including verification codes used to confirm your identity for accounts."];
      uint64_t v39 = +[UIColor systemRedColor];
      [v4 addBulletedListItemWithTitle:v38 description:&stru_100010590 symbolName:@"exclamationmark.message" tintColor:v39];

      if ([(AppDeletionPresentingViewController *)self isSOSAvailable])
      {
        CFStringRef v40 = @"DELETION_SHEET_MESSAGES_BODY_FOURTH";
        CFStringRef v41 = @"Emergency SOS via satellite, government text alerts, and other emergency text services will not be available.";
      }
      else
      {
        CFStringRef v40 = @"DELETION_SHEET_MESSAGES_BODY_FOURTH_SOS_NOT_AVAILABLE";
        CFStringRef v41 = @"Government text alerts and other emergency text services will not be available.";
      }
      v42 = [(AppDeletionPresentingViewController *)self _localizedStringForKey:v40 withFormatHint:v41];
      v43 = +[UIColor systemRedColor];
      [v4 addBulletedListItemWithTitle:v42 description:&stru_100010590 symbolName:@"sos" tintColor:v43];

      v44 = [(AppDeletionPresentingViewController *)self _localizedStringForKey:@"DELETION_SHEET_MESSAGES_BODY_FIFTH" withFormatHint:@"Cellular charges may still apply."];
      v45 = +[UIColor systemRedColor];
      [v4 addBulletedListItemWithTitle:v44 description:&stru_100010590 symbolName:@"antenna.radiowaves.left.and.right" tintColor:v45];

LABEL_24:
      goto LABEL_25;
    case 4uLL:
      uint64_t v28 = [(AppDeletionPresentingViewController *)self _localizedStringForKey:@"DELETION_SHEET_APP_MARKETPLACE_BODY" withFormatHint:@"%lu apps downloaded with “%@” will not receive updates."];
      uint64_t v29 = [(AppDeletionPresentingViewController *)self numAppsInstalled];
      id v30 = [v29 unsignedIntegerValue];
      uint64_t v31 = [(AppDeletionPresentingViewController *)self localizedName];
      id v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v28, v30, v31);

      uint64_t v32 = +[UIColor systemRedColor];
      [v4 addBulletedListItemWithTitle:v6 description:&stru_100010590 symbolName:@"square.and.arrow.down.badge.xmark" tintColor:v32];

LABEL_25:
      BOOL v19 = 1;
      break;
    default:
      v11 = sub_1000072E4((uint64_t)off_100017300);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10000837C(v11, v12, v13, v14, v15, v16, v17, v18);
      }

      BOOL v19 = 0;
      break;
  }

  return v19;
}

- (id)_headerImage
{
  id v3 = [(AppDeletionPresentingViewController *)self bundleID];
  v51 = +[UIImage imageNamed:@"AlertBadgeIcon"];
  id v4 = [objc_alloc((Class)UIImageView) initWithImage:v51];
  id v50 = objc_alloc_init((Class)SBSHomeScreenService);
  v5 = [v50 homeScreenIconStyleConfiguration];
  v52 = v5;
  if (!v5)
  {
    v9 = v4;
    CFStringRef v10 = sub_1000072E4((uint64_t)off_100017300);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000083F4(v10, v11, v12, v13, v14, v15, v16, v17);
    }
LABEL_23:
    id v29 = 0;
    uint64_t v28 = 0;
    uint64_t v23 = 0;
    BOOL v19 = 0;
    goto LABEL_24;
  }
  id v6 = v5;
  id v49 = v3;
  id v3 = 0;
  uint64_t v7 = 0;
  switch((unint64_t)[v5 configurationType])
  {
    case 0uLL:
      v8 = [(AppDeletionPresentingViewController *)self traitCollection];
      uint64_t v7 = [v8 userInterfaceStyle] == (id)2;

      id v3 = 0;
      break;
    case 1uLL:
      break;
    case 2uLL:
      id v3 = 0;
      uint64_t v7 = 1;
      break;
    case 3uLL:
      uint64_t v18 = [v6 tintColor];
      id v3 = [v18 CGColor];

      uint64_t v7 = 2;
      break;
    default:
      v9 = v4;
      CFStringRef v10 = sub_1000072E4((uint64_t)off_100017300);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10000846C(v10, v34, v35, v36, v37, v38, v39, v40);
      }
      goto LABEL_23;
  }
  BOOL v19 = +[ISImageDescriptor imageDescriptorNamed:kISImageDescriptorHomeScreen];
  [v19 setAppearance:v7];
  if (v3)
  {
    id v20 = [objc_alloc((Class)IFColor) initWithCGColor:v3];
    [v19 setTintColor:v20];
  }
  id v3 = v49;
  id v21 = [objc_alloc((Class)ISIcon) initWithBundleIdentifier:v49];
  if (!v21)
  {
    v9 = v4;
    CFStringRef v10 = sub_1000072E4((uint64_t)off_100017300);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000084E4();
    }
    id v29 = 0;
    uint64_t v28 = 0;
    uint64_t v23 = 0;
LABEL_24:
    id v22 = 0;
    goto LABEL_30;
  }
  id v22 = v21;
  uint64_t v23 = [v21 imageForDescriptor:v19];
  if ([v23 placeholder])
  {
    uint64_t v24 = sub_1000072E4((uint64_t)off_100017300);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v55 = "-[AppDeletionPresentingViewController _headerImage]";
      __int16 v56 = 2112;
      id v57 = v49;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s: IconServices returned a placeholder icon for bundle with identifer %@", buf, 0x16u);
    }

    uint64_t v25 = [v22 prepareImageForDescriptor:v19];

    uint64_t v23 = (void *)v25;
  }
  id v26 = [v23 CGImage];
  if (v26)
  {
    id v27 = [objc_alloc((Class)UIImage) initWithCGImage:v26];
    if (v27)
    {
      uint64_t v28 = v27;
      id v29 = [objc_alloc((Class)UIImageView) initWithImage:v27];
      [v29 insertSubview:v4 atIndex:1];
      [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v4 leadingAnchor];
      v10 = id v30 = v4;
      v48 = [v29 leadingAnchor];
      v47 = [v10 constraintEqualToAnchor:v48 constant:66.0];
      v53[0] = v47;
      v46 = [v30 topAnchor];
      v45 = [v29 topAnchor];
      v44 = [v46 constraintEqualToAnchor:v45 constant:56.0];
      v53[1] = v44;
      v43 = [v30 widthAnchor];
      v42 = [v43 constraintEqualToConstant:29.0];
      v53[2] = v42;
      v9 = v30;
      uint64_t v31 = [v30 widthAnchor];
      uint64_t v32 = [v31 constraintEqualToConstant:29.0];
      v53[3] = v32;
      unsigned int v33 = +[NSArray arrayWithObjects:v53 count:4];
      +[NSLayoutConstraint activateConstraints:v33];

      id v3 = v49;
      goto LABEL_30;
    }
    v9 = v4;
    CFStringRef v10 = sub_1000072E4((uint64_t)off_100017300);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000085D4();
    }
  }
  else
  {
    v9 = v4;
    CFStringRef v10 = sub_1000072E4((uint64_t)off_100017300);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100008558();
    }
  }
  id v29 = 0;
  uint64_t v28 = 0;
LABEL_30:

  return v29;
}

- (void)_addButtonTrayAndDismissButtonToController:(id)a3
{
  id v4 = a3;
  v5 = +[UIButtonConfiguration filledButtonConfiguration];
  [v5 setCornerStyle:4];
  [v5 setButtonSize:3];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100005EAC;
  v38[3] = &unk_100010350;
  v38[4] = self;
  id v6 = +[UIAction actionWithHandler:v38];
  uint64_t v7 = +[OBBoldTrayButton buttonWithConfiguration:v5 primaryAction:v6];

  v8 = [(AppDeletionPresentingViewController *)self _localizedStringForKey:@"DELETION_SHEET_DELETE_BUTTON" withFormatHint:@"Delete App"];
  [v7 setTitle:v8 forState:0];
  v9 = +[UIColor systemRedColor];
  [v7 setTintColor:v9];

  CFStringRef v10 = [v4 buttonTray];
  [v10 addButton:v7];

  if ([(AppDeletionPresentingViewController *)self showArchiveOption])
  {
    uint64_t v11 = +[OBLinkTrayButton linkButton];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100005EF4;
    v37[3] = &unk_100010350;
    v37[4] = self;
    uint64_t v12 = +[UIAction actionWithHandler:v37];
    [v11 addAction:v12 forControlEvents:64];

    uint64_t v13 = [(AppDeletionPresentingViewController *)self _localizedStringForKey:@"DELETION_SHEET_REMOVE_FROM_HOME_SCREEN_BUTTON" withFormatHint:@"Remove from Home Screen"];
    [v11 setTitle:v13 forState:0];
    uint64_t v14 = [v4 buttonTray];
    [v14 addButton:v11];
  }
  uint64_t v15 = [v4 buttonTray];
  uint64_t v16 = [v15 buttonViewBottomConstraint];

  if (v16)
  {
    uint64_t v17 = [v4 buttonTray];
    uint64_t v18 = [v17 buttonViewBottomConstraint];

    [v18 setActive:0];
    LODWORD(v17) = [(AppDeletionPresentingViewController *)self showArchiveOption];
    [v18 firstItem];
    uint64_t v34 = v7;
    id v35 = v4;
    v20 = BOOL v19 = v5;
    id v21 = v8;
    id v22 = [v18 firstAttribute];
    id v23 = [v18 relation];
    uint64_t v24 = [v18 secondItem];
    id v25 = [v18 secondAttribute];
    double v26 = 8.0;
    if (!v17) {
      double v26 = 32.0;
    }
    id v27 = v22;
    v8 = v21;
    uint64_t v28 = +[NSLayoutConstraint constraintWithItem:v20 attribute:v27 relatedBy:v23 toItem:v24 attribute:v25 multiplier:1.0 constant:v26];

    v5 = v19;
    uint64_t v7 = v34;
    id v4 = v35;
    uint64_t v39 = v28;
    id v29 = +[NSArray arrayWithObjects:&v39 count:1];
    +[NSLayoutConstraint activateConstraints:v29];
  }
  id v30 = objc_alloc((Class)UIBarButtonItem);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100005F3C;
  v36[3] = &unk_100010350;
  v36[4] = self;
  uint64_t v31 = +[UIAction actionWithHandler:v36];
  id v32 = [v30 initWithBarButtonSystemItem:24 primaryAction:v31];
  unsigned int v33 = [v4 navigationItem];
  [v33 setRightBarButtonItem:v32];
}

- (BOOL)constructAppDeletionController
{
  id v3 = [(AppDeletionPresentingViewController *)self bundleID];
  unint64_t v4 = [(AppDeletionPresentingViewController *)self appType];
  v5 = sub_1000072E4((uint64_t)off_100017300);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v83 = "-[AppDeletionPresentingViewController constructAppDeletionController]";
    __int16 v84 = 2112;
    v85 = v3;
    __int16 v86 = 2048;
    unint64_t v87 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Attempting to construct the deletion sheet for %@ with type %lu", buf, 0x20u);
  }

  id v6 = [(AppDeletionPresentingViewController *)self _localizedStringForKey:@"DELETION_SHEET_TITLE_DELETE_WITH_NAME" withFormatHint:@"Delete “%@”?"];
  uint64_t v7 = [(AppDeletionPresentingViewController *)self localizedName];
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7);

  switch(v4)
  {
    case 1uLL:
      CFStringRef v9 = @"DELETION_SHEET_PHOTOS_TITLE_BODY";
      CFStringRef v10 = @"Deleting this app will not delete your photos and videos.";
      goto LABEL_13;
    case 2uLL:
      CFStringRef v9 = @"DELETION_SHEET_APPSTORE_TITLE_BODY";
      goto LABEL_12;
    case 3uLL:
      if ([(AppDeletionPresentingViewController *)self isWatchPaired])
      {
        CFStringRef v25 = @"DELETION_SHEET_MESSAGES_TITLE_BODY";
        CFStringRef v26 = @"Deleting this app will limit iPhone and Apple Watch functionality.";
      }
      else
      {
        CFStringRef v25 = @"DELETION_SHEET_MESSAGES_TITLE_BODY_WATCH_NOT_PAIRED";
        CFStringRef v26 = @"Deleting this app will limit iPhone functionality.";
      }
      id v27 = [(AppDeletionPresentingViewController *)self _localizedStringForKey:v25 withFormatHint:v26];
      id v21 = [(AppDeletionPresentingViewController *)self _localizedStringForKey:@"DELETION_SHEET_MESSAGES_TITLE_BODY_LEARN_MORE" withFormatHint:@"Learn more…"];
      id v23 = +[NSString stringWithFormat:@"%@ %@", v27, v21];

      goto LABEL_16;
    case 4uLL:
      CFStringRef v9 = @"DELETION_SHEET_ALTERNATE_APP_MARKETPLACE_FIRST";
LABEL_12:
      CFStringRef v10 = @"Deleting this app will not delete the apps you downloaded with it.";
LABEL_13:
      id v23 = [(AppDeletionPresentingViewController *)self _localizedStringForKey:v9 withFormatHint:v10];
      id v21 = 0;
LABEL_16:
      id v20 = [(AppDeletionPresentingViewController *)self _headerImage];
      if (v20)
      {
        v79 = self;
        unint64_t v61 = v4;
        v76 = v3;
        v75 = v8;
        v78 = v23;
        id v28 = [objc_alloc((Class)OBWelcomeController) initWithTitle:v8 detailText:v23 icon:0 contentLayout:2];
        id v29 = [v28 headerView];
        id v30 = [v29 customIconContainerView];
        [v30 addSubview:v20];

        [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
        v72 = [v20 widthAnchor];
        v70 = [v72 constraintEqualToConstant:80.0];
        v81[0] = v70;
        v68 = [v20 heightAnchor];
        v66 = [v68 constraintEqualToConstant:80.0];
        v81[1] = v66;
        v62 = [v20 centerXAnchor];
        v64 = [v28 headerView];
        uint64_t v31 = [v64 customIconContainerView];
        id v32 = [v31 centerXAnchor];
        unsigned int v33 = [v62 constraintEqualToAnchor:v32];
        v81[2] = v33;
        v74 = v20;
        [v20 centerYAnchor];
        uint64_t v34 = v77 = v21;
        id v35 = [v28 headerView];
        uint64_t v36 = [v35 customIconContainerView];
        uint64_t v37 = [v36 centerYAnchor];
        uint64_t v38 = [v34 constraintEqualToAnchor:v37];
        v81[3] = v38;
        uint64_t v39 = +[NSArray arrayWithObjects:v81 count:4];
        +[NSLayoutConstraint activateConstraints:v39];

        BOOL v19 = v28;
        id v21 = v77;

        uint64_t v40 = [v28 headerView];
        LODWORD(v41) = 1148846080;
        [v40 setContentCompressionResistancePriority:1 forAxis:v41];

        v42 = [v28 headerView];
        id v22 = [v42 detailLabel];

        if (v22 && v77)
        {
          id v43 = objc_alloc_init((Class)UITextView);
          id v73 = v28;
          v44 = [v28 headerView];
          [v44 insertSubview:v43 atIndex:1];

          [v43 setTranslatesAutoresizingMaskIntoConstraints:0];
          v71 = [v43 leadingAnchor];
          v69 = [v22 leadingAnchor];
          v67 = [v71 constraintEqualToAnchor:v69];
          v80[0] = v67;
          v65 = [v43 trailingAnchor];
          v63 = [v22 trailingAnchor];
          v45 = [v65 constraintEqualToAnchor:v63];
          v80[1] = v45;
          v46 = [v43 topAnchor];
          v47 = [v22 topAnchor];
          v48 = [v46 constraintEqualToAnchor:v47];
          v80[2] = v48;
          id v49 = [v43 bottomAnchor];
          id v50 = [v22 bottomAnchor];
          v51 = [v49 constraintEqualToAnchor:v50];
          v80[3] = v51;
          v52 = +[NSArray arrayWithObjects:v80 count:4];
          +[NSLayoutConstraint activateConstraints:v52];

          id v21 = v77;
          [(AppDeletionPresentingViewController *)v79 _addBlurredBackgroundToView:v43];
          id v53 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v78];
          objc_super v54 = [v53 string];
          id v55 = [v54 localizedStandardRangeOfString:v77];
          uint64_t v57 = v56;

          if (v55 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            -[AppDeletionPresentingViewController setHyperLinkRangeForMessages:](v79, "setHyperLinkRangeForMessages:", v55, v57);
            [v53 addAttribute:NSLinkAttributeName value:@"https://support.apple.com/121327?cid=mc-ols-apps-article_121327-settings_ui-09262024" range:v55, v57];
            [v43 setAttributedText:v53];
            [v43 setEditable:0];
            [v43 setDelegate:v79];
            [(AppDeletionPresentingViewController *)v79 setTextView:v43];
            [v22 setAlpha:0.0];
          }

          BOOL v19 = v73;
        }
        id v3 = v76;
        if ([(AppDeletionPresentingViewController *)v79 _constructBulletedList:v19])
        {
          BOOL v24 = 1;
          [v19 setModalPresentationStyle:1];
          [(AppDeletionPresentingViewController *)v79 _addButtonTrayAndDismissButtonToController:v19];
          [(AppDeletionPresentingViewController *)v79 setObViewController:v19];
          v58 = [(AppDeletionPresentingViewController *)v79 obViewController];
          v59 = [v58 view];
          [v59 layoutIfNeeded];

          uint64_t v11 = sub_1000072E4((uint64_t)off_100017300);
          id v20 = v74;
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v83 = "-[AppDeletionPresentingViewController constructAppDeletionController]";
            __int16 v84 = 2112;
            v85 = v76;
            __int16 v86 = 2048;
            unint64_t v87 = v61;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Successfully configured the deletion sheet for %@ with type %lu", buf, 0x20u);
            BOOL v24 = 1;
          }
          v8 = v75;
          id v23 = v78;
LABEL_26:
        }
        else
        {
          BOOL v24 = 0;
          id v20 = v74;
          v8 = v75;
          id v23 = v78;
        }
      }
      else
      {
        BOOL v19 = 0;
        id v22 = 0;
        BOOL v24 = 0;
      }

      return v24;
    default:
      uint64_t v11 = sub_1000072E4((uint64_t)off_100017300);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100008648(v11, v12, v13, v14, v15, v16, v17, v18);
      }
      BOOL v19 = 0;
      id v20 = 0;
      id v21 = 0;
      id v22 = 0;
      id v23 = 0;
      BOOL v24 = 0;
      goto LABEL_26;
  }
}

- (void)presentSheetViewController:(id)a3
{
  id v5 = a3;
  -[AppDeletionPresentingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:");
  if (byte_1000175C0)
  {
    unint64_t v4 = sub_1000072E4((uint64_t)off_100017300);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v7 = "-[AppDeletionPresentingViewController presentSheetViewController:]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Exiting, assuming this is a test for validating crash behavior", buf, 0xCu);
    }

    exit(1);
  }
}

- (void)_addBlurredBackgroundToView:(id)a3
{
  id v3 = a3;
  unint64_t v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];

  id v6 = +[UIBlurEffect effectWithStyle:9];
  id v5 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v6];
  [v3 bounds];
  [v5 setFrame:];
  [v3 insertSubview:v5 atIndex:0];
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)AppDeletionPresentingViewController;
  [(AppDeletionPresentingViewController *)&v24 viewDidLoad];
  id v3 = [(AppDeletionPresentingViewController *)self obViewController];
  unint64_t v4 = [v3 view];
  [(AppDeletionPresentingViewController *)self _addBlurredBackgroundToView:v4];

  id v5 = [(AppDeletionPresentingViewController *)self textView];
  id v6 = [v3 headerView];
  uint64_t v7 = [v6 detailLabel];

  v8 = [v7 font];
  [v5 setFont:v8];

  CFStringRef v9 = [v7 textColor];
  [v5 setTextColor:v9];

  [v5 setTextAlignment:[v7 textAlignment]];
  CFStringRef v10 = [v5 textContainer];
  [v10 setLineFragmentPadding:0.0];

  [v5 setTextContainerInset:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
  id v11 = [v7 numberOfLines];
  uint64_t v12 = [v5 textContainer];
  [v12 setMaximumNumberOfLines:v11];

  [v5 setShowsVerticalScrollIndicator:0];
  [v5 setShowsHorizontalScrollIndicator:0];
  [v5 bounds];
  [v5 setContentSize:v13, v14];
  uint64_t v15 = [v3 headerView];
  uint64_t v16 = [v15 customIconContainerView];

  id v17 = +[UIColor blackColor];
  id v18 = [v17 CGColor];
  BOOL v19 = [v16 layer];
  [v19 setShadowColor:v18];

  id v20 = [v16 layer];
  LODWORD(v21) = 1031127695;
  [v20 setShadowOpacity:v21];

  id v22 = [v16 layer];
  [v22 setShadowOffset:0.0, 8.0];

  id v23 = [v16 layer];
  [v23 setShadowRadius:14.0];

  [v16 setClipsToBounds:0];
}

- (double)presentationHeightForSheet
{
  id v3 = [(AppDeletionPresentingViewController *)self view];
  [v3 layoutIfNeeded];

  unint64_t v4 = [(AppDeletionPresentingViewController *)self view];
  [v4 frame];
  double v6 = v5;

  unsigned int v7 = [(AppDeletionPresentingViewController *)self showArchiveOption];
  if ((id)[(AppDeletionPresentingViewController *)self appType] == (id)3)
  {
    double v8 = 0.98;
  }
  else
  {
    if ((id)[(AppDeletionPresentingViewController *)self appType] == (id)1)
    {
LABEL_4:
      BOOL v9 = ![(AppDeletionPresentingViewController *)self isICloudOn];
      double v8 = 0.725;
      double v10 = 0.8;
    }
    else
    {
      unint64_t v13 = [(AppDeletionPresentingViewController *)self appType];
      double v8 = 0.625;
      switch(v13)
      {
        case 1uLL:
          goto LABEL_4;
        case 2uLL:
          double v14 = [(AppDeletionPresentingViewController *)self numAppsInstalled];
          BOOL v15 = [v14 unsignedIntegerValue] == 0;

          double v8 = dbl_10000A910[v15];
          goto LABEL_7;
        case 3uLL:
          uint64_t v16 = [(AppDeletionPresentingViewController *)self numMediaShared];
          id v17 = [v16 unsignedIntegerValue];

          double v8 = 0.98;
          if (v17) {
            goto LABEL_7;
          }
          BOOL v9 = ![(AppDeletionPresentingViewController *)self isICloudOn];
          double v8 = 0.835;
          double v10 = 0.865;
          break;
        case 4uLL:
          goto LABEL_7;
        default:
          double v8 = 0.735;
          goto LABEL_7;
      }
    }
    if (!v9) {
      double v8 = v10;
    }
  }
LABEL_7:
  double v11 = 0.9;
  if (v7) {
    double v11 = 1.0;
  }
  return v6 * v11 * v8;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v3 = [(AppDeletionPresentingViewController *)self delegate];
  [v3 communicateButtonPressWithButtonDisposition:4];
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  if (!objc_msgSend(a4, "contentType", a3))
  {
    double v6 = +[NSURL URLWithString:@"https://support.apple.com/121327?cid=mc-ols-apps-article_121327-settings_ui-09262024"];
    unsigned int v7 = +[LSApplicationWorkspace defaultWorkspace];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100006F30;
    v10[3] = &unk_100010378;
    id v11 = v6;
    uint64_t v12 = self;
    id v8 = v6;
    [v7 openURL:v8 configuration:0 completionHandler:v10];
  }
  return 0;
}

- (OBWelcomeController)obViewController
{
  return self->_obViewController;
}

- (void)setObViewController:(id)a3
{
}

- (AppDeletionUISceneDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unint64_t)appType
{
  return self->_appType;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (BOOL)isICloudOn
{
  return self->_isICloudOn;
}

- (BOOL)isSOSAvailable
{
  return self->_isSOSAvailable;
}

- (BOOL)isWatchPaired
{
  return self->_isWatchPaired;
}

- (NSNumber)numMediaShared
{
  return self->_numMediaShared;
}

- (NSNumber)numAppsInstalled
{
  return self->_numAppsInstalled;
}

- (_NSRange)hyperLinkRangeForMessages
{
  p_hyperLinkRangeForMessages = &self->_hyperLinkRangeForMessages;
  NSUInteger location = self->_hyperLinkRangeForMessages.location;
  NSUInteger length = p_hyperLinkRangeForMessages->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setHyperLinkRangeForMessages:(_NSRange)a3
{
  self->_hyperLinkRangeForMessages = a3;
}

- (BOOL)showArchiveOption
{
  return self->_showArchiveOption;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_numAppsInstalled, 0);
  objc_storeStrong((id *)&self->_numMediaShared, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_obViewController, 0);
}

@end