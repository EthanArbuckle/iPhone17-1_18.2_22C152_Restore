@interface BuddyPhoneNumberPermissionController
+ (BOOL)controllerAffectedByTapFreeSetup;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
+ (void)_registerPhoneNumberPermissionEnabled:(BOOL)a3 buddyPreferences:(id)a4;
+ (void)skippedByCloudConfigWithEnvironment:(id)a3;
- (BOOL)controllerNeedsToRun;
- (BOOL)includeAppleAccountCheck;
- (BOOL)includeCellularDataCheck;
- (BYCapabilities)capabilities;
- (BYPreferencesController)buddyPreferences;
- (BYRunState)runState;
- (BuddyPhoneNumberPermissionController)init;
- (OBAnimationController)animationController;
- (void)_continueTapped;
- (void)_notNowTapped;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setAnimationController:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setIncludeAppleAccountCheck:(BOOL)a3;
- (void)setIncludeCellularDataCheck:(BOOL)a3;
- (void)setRunState:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyPhoneNumberPermissionController

- (BuddyPhoneNumberPermissionController)init
{
  id location = self;
  v9[1] = (id)a2;
  v2 = +[NSBundle mainBundle];
  v9[0] = [(NSBundle *)v2 localizedStringForKey:@"PHONE_NUMBER_PERMISSION_TITLE" value:&stru_1002B4E18 table:@"Localizable"];

  v3 = +[NSBundle mainBundle];
  id v8 = [(NSBundle *)v3 localizedStringForKey:@"PHONE_NUMBER_PERMISSION_INFO_WITHOUT_WIRELESS_DATA_NOTICE" value:&stru_1002B4E18 table:@"Localizable"];

  id v4 = location;
  id location = 0;
  v7.receiver = v4;
  v7.super_class = (Class)BuddyPhoneNumberPermissionController;
  id location = [(BuddyPhoneNumberPermissionController *)&v7 initWithTitle:v9[0] detailText:v8 icon:0];
  objc_storeStrong(&location, location);
  if (location)
  {
    *((unsigned char *)location + 16) = 1;
    *((unsigned char *)location + 17) = 0;
  }
  v5 = (BuddyPhoneNumberPermissionController *)location;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v9, 0);
  objc_storeStrong(&location, 0);
  return v5;
}

- (void)viewDidLoad
{
  v16 = self;
  SEL v15 = a2;
  v14.receiver = self;
  v14.super_class = (Class)BuddyPhoneNumberPermissionController;
  [(BuddyPhoneNumberPermissionController *)&v14 viewDidLoad];
  id v2 = [(BuddyPhoneNumberPermissionController *)v16 headerView];
  [v2 setIconInheritsTint:0];

  id v3 = [(BuddyPhoneNumberPermissionController *)v16 headerView];
  LODWORD(v4) = 0;
  [v3 setTitleHyphenationFactor:v4];

  id v5 = [(BuddyPhoneNumberPermissionController *)v16 buttonTray];
  v17[0] = BYPrivacyiMessageFaceTimeIdentifier;
  v17[1] = BYPrivacyFaceTimeIdentifier;
  v17[2] = BYPrivacyMessagesIdentifier;
  v6 = +[NSArray arrayWithObjects:v17 count:3];
  [v5 setPrivacyLinkForBundles:v6];

  objc_super v7 = v16;
  id v8 = +[NSBundle mainBundle];
  v9 = [(NSBundle *)v8 localizedStringForKey:@"PHONE_NUMBER_PERMISSION_ALLOW" value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddyWelcomeController *)v7 addBoldButton:v9 action:"_continueTapped"];

  v10 = v16;
  v11 = +[NSBundle mainBundle];
  v12 = [(NSBundle *)v11 localizedStringForKey:@"PHONE_NUMBER_PERMISSION_NOTNOW" value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddyWelcomeController *)v10 addLinkButton:v12 action:"_notNowTapped"];

  id v13 = [(BuddyPhoneNumberPermissionController *)v16 buddy_animationController:@"iMessageFaceTime"];
  [(BuddyPhoneNumberPermissionController *)v16 setAnimationController:v13];
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyPhoneNumberPermissionController;
  [(BuddyPhoneNumberPermissionController *)&v4 viewWillAppear:a3];
  id v3 = [(BuddyPhoneNumberPermissionController *)v7 animationController];
  [(OBAnimationController *)v3 startAnimation];
}

+ (BOOL)controllerAffectedByTapFreeSetup
{
  return 1;
}

- (BOOL)controllerNeedsToRun
{
  v43 = self;
  SEL v42 = a2;
  BOOL v41 = 1;
  id v2 = [(BuddyPhoneNumberPermissionController *)self buddyPreferences];
  unsigned __int8 v3 = [(BYPreferencesController *)v2 BOOLForKey:@"PhoneNumberPermissionPresentedKey"];

  char v40 = v3 & 1;
  objc_super v4 = [(BuddyPhoneNumberPermissionController *)v43 runState];
  char v5 = [(BYRunState *)v4 hasCompletedInitialRun] ^ 1;

  char v39 = v5 & 1;
  SEL v6 = [(BuddyPhoneNumberPermissionController *)v43 capabilities];
  unsigned __int8 v7 = [(BYCapabilities *)v6 mgHasCellularTelephony];

  char v38 = v7 & 1;
  char v37 = 0;
  char v35 = 0;
  unsigned __int8 v8 = 0;
  if ([(BuddyPhoneNumberPermissionController *)v43 includeCellularDataCheck])
  {
    v36 = [(BuddyPhoneNumberPermissionController *)v43 capabilities];
    char v35 = 1;
    unsigned __int8 v8 = [(BYCapabilities *)v36 mgHasCellularData];
  }
  if (v35) {

  }
  char v37 = v8 & 1;
  if ((v39 & 1) == 0)
  {
    id location = (id)_BYLoggingFacility();
    os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      v9 = location;
      os_log_type_t v10 = v33;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Phone Number Permission skipped because we're in mini-buddy", buf, 2u);
    }
    objc_storeStrong(&location, 0);
    return 0;
  }
  if (v40)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = oslog;
      os_log_type_t v12 = v30;
      sub_10004B24C(v29);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Phone Number Permission already presented, skipping", v29, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    return 0;
  }
  if ((v37 & 1) == 0 && (v38 & 1) == 0)
  {
    os_log_t v28 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v28;
      os_log_type_t v14 = v27;
      sub_10004B24C(v26);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Phone Number Permission needs cellular data/telephony, skipping", v26, 2u);
    }
    objc_storeStrong((id *)&v28, 0);
    return 0;
  }
  char v24 = 0;
  char v22 = 0;
  BOOL v15 = 0;
  if ([(BuddyPhoneNumberPermissionController *)v43 includeAppleAccountCheck])
  {
    id v25 = +[ACAccountStore defaultStore];
    char v24 = 1;
    id v23 = [v25 aa_primaryAppleAccount];
    char v22 = 1;
    BOOL v15 = v23 != 0;
  }
  if (v22) {

  }
  if (v24) {
  if (!v15)
  }
    return v41;
  os_log_t v21 = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v21;
    os_log_type_t v17 = v20;
    sub_10004B24C(v19);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Phone Number Permission is only shown if there's no Apple ID signed in", (uint8_t *)v19, 2u);
  }
  objc_storeStrong((id *)&v21, 0);
  return 0;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = dispatch_get_global_queue(0, 0);
  objc_super v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  unsigned __int8 v7 = sub_1001AF740;
  unsigned __int8 v8 = &unk_1002B0D70;
  id v9 = location[0];
  dispatch_async(v3, &v4);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupiMessageAndFaceTime;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

+ (void)skippedByCloudConfigWithEnvironment:(id)a3
{
  id v6 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4[1] = v6;
  v4[0] = location[0];
  unsigned __int8 v3 = dispatch_get_global_queue(2, 0);
  IDSRegistrationControlGetStateForRegistrationType();

  objc_storeStrong(v4, 0);
  objc_storeStrong(location, 0);
}

+ (void)_registerPhoneNumberPermissionEnabled:(BOOL)a3 buddyPreferences:(id)a4
{
  id v25 = a1;
  SEL v24 = a2;
  BOOL v23 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  [location setObject:&__kCFBooleanTrue forKey:@"PhoneNumberPermissionPresentedKey"];
  if (v23)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v4 = oslog;
      os_log_type_t v5 = v20;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "User agreed to share phonenumber, registering enable state with IDS", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v6 = dispatch_get_global_queue(2, 0);
    IDSRegistrationControlEnableRegistrationType();

    unsigned __int8 v7 = dispatch_get_global_queue(2, 0);
    unsigned __int8 v8 = (const void *)_CTServerConnectionCreateOnTargetQueue();

    CFTypeRef cf = v8;
    if (v8)
    {
      v27[0] = kCTWiFiDataUsagePolicy;
      v28[0] = kCTCellularDataUsagePolicyAlwaysAllow;
      v27[1] = kCTCellularDataUsagePolicy;
      v28[1] = kCTCellularDataUsagePolicyAlwaysAllow;
      id v17 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
      memset(&v16[1], 0, sizeof(os_log_t));
      v16[1] = (os_log_t)_CTServerConnectionSetCellularUsagePolicy();
      if (HIDWORD(v16[1]))
      {
        v16[0] = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v16[0], OS_LOG_TYPE_DEFAULT))
        {
          sub_10004F3FC((uint64_t)v26, SHIDWORD(v16[1]), (int)v16[1]);
          _os_log_impl((void *)&_mh_execute_header, v16[0], v15, "Could not enable data usage for FaceTime. error: %d domain: (%d)", v26, 0xEu);
        }
        objc_storeStrong((id *)v16, 0);
      }
      CFRelease(cf);
      objc_storeStrong(&v17, 0);
    }
  }
  else
  {
    os_log_t v14 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v14;
      os_log_type_t v10 = v13;
      sub_10004B24C(v12);
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "User declined to share phonenumber, registering disable state with IDS", (uint8_t *)v12, 2u);
    }
    objc_storeStrong((id *)&v14, 0);
    v11 = dispatch_get_global_queue(2, 0);
    IDSRegistrationControlDisableRegistrationType();
  }
  objc_storeStrong(&location, 0);
}

- (void)_continueTapped
{
  id v2 = objc_opt_class();
  unsigned __int8 v3 = [(BuddyPhoneNumberPermissionController *)self buddyPreferences];
  [v2 _registerPhoneNumberPermissionEnabled:1 buddyPreferences:v3];

  objc_super v4 = [(BuddyWelcomeController *)self delegate];
  [(BFFFlowItemDelegate *)v4 flowItemDone:self];
}

- (void)_notNowTapped
{
  id v2 = objc_opt_class();
  unsigned __int8 v3 = [(BuddyPhoneNumberPermissionController *)self buddyPreferences];
  [v2 _registerPhoneNumberPermissionEnabled:0 buddyPreferences:v3];

  objc_super v4 = [(BuddyWelcomeController *)self delegate];
  [(BFFFlowItemDelegate *)v4 flowItemDone:self];
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
}

- (BOOL)includeAppleAccountCheck
{
  return self->_includeAppleAccountCheck;
}

- (void)setIncludeAppleAccountCheck:(BOOL)a3
{
  self->_includeAppleAccountCheck = a3;
}

- (BOOL)includeCellularDataCheck
{
  return self->_includeCellularDataCheck;
}

- (void)setIncludeCellularDataCheck:(BOOL)a3
{
  self->_includeCellularDataCheck = a3;
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end