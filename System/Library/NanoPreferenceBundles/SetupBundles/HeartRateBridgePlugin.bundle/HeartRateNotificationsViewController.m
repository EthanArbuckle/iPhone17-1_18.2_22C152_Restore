@interface HeartRateNotificationsViewController
+ (BOOL)controllerNeedsToRunForBuddyControllerDelegate:(id)a3;
- (BOOL)wantsLightenBlendedScreen;
- (HeartRateNotificationsViewController)init;
- (NSUserDefaults)userDefaults;
- (id)imageResource;
- (id)imageResourceBundleIdentifier;
- (id)okayButtonTitle;
- (id)titleString;
- (void)_resetHeartRateNotificationSettings;
- (void)_setBradycardiaEnabled:(BOOL)a3;
- (void)_setTachycardiaEnabled:(BOOL)a3;
- (void)okayButtonPressed:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HeartRateNotificationsViewController

- (HeartRateNotificationsViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)HeartRateNotificationsViewController;
  v2 = [(HeartRateNotificationsViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(HeartRateNotificationsViewController *)v2 setStyle:32];
  }
  return v3;
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)HeartRateNotificationsViewController;
  [(HeartRateNotificationsViewController *)&v20 viewDidLoad];
  _HKInitializeLogging();
  v3 = HKLogHeartRate;
  if (os_log_type_enabled(HKLogHeartRate, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Heart Rate Notifications View Controller is loading", v19, 2u);
  }
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v5 = +[UIImage imageNamed:@"WatchBuddy_HighHeartRate_FeatureList_Up" inBundle:v4];

  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"HR_HIGH_NOTIFICATIONS_FEATURE_TITLE" value:&stru_4190 table:@"Localizable"];
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"HR_HIGH_NOTIFICATIONS_FEATURE_MESSAGE" value:&stru_4190 table:@"Localizable"];
  [(HeartRateNotificationsViewController *)self addBulletedListItemWithTitle:v7 description:v9 image:v5];

  v10 = +[NSBundle bundleForClass:objc_opt_class()];
  v11 = +[UIImage imageNamed:@"WatchBuddy_HighHeartRate_FeatureList_Down" inBundle:v10];

  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"HR_LOW_NOTIFICATIONS_FEATURE_TITLE" value:&stru_4190 table:@"Localizable"];
  v14 = +[NSBundle bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"HR_LOW_NOTIFICATIONS_FEATURE_MESSAGE" value:&stru_4190 table:@"Localizable"];
  [(HeartRateNotificationsViewController *)self addBulletedListItemWithTitle:v13 description:v15 image:v11];

  id v16 = objc_alloc((Class)NSUserDefaults);
  v17 = (NSUserDefaults *)[v16 initWithSuiteName:kHKHeartRateNotificationsPreferencesDomain];
  userDefaults = self->_userDefaults;
  self->_userDefaults = v17;

  [(HeartRateNotificationsViewController *)self _setTachycardiaEnabled:1];
  [(HeartRateNotificationsViewController *)self _setBradycardiaEnabled:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HeartRateNotificationsViewController;
  [(HeartRateNotificationsViewController *)&v4 viewWillDisappear:a3];
  if ([(HeartRateNotificationsViewController *)self isMovingFromParentViewController])[(HeartRateNotificationsViewController *)self _resetHeartRateNotificationSettings]; {
}
  }

+ (BOOL)controllerNeedsToRunForBuddyControllerDelegate:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[NRPairedDeviceRegistry sharedInstance];
  objc_super v5 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
  v6 = [v4 getDevicesMatching:v5];
  v7 = [v6 firstObject];

  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2A57E5FF-A774-4903-B58D-41F01654BC76"];
  unsigned int v9 = [v7 supportsCapability:v8];

  id v10 = objc_alloc((Class)NSUserDefaults);
  id v11 = [v10 initWithSuiteName:kHKHeartRateNotificationsPreferencesDomain];
  uint64_t v12 = [v11 objectForKey:kHKHeartRateKeyEnableStationaryDiscordanceDetection];
  uint64_t v13 = [v11 objectForKey:kHKHeartRateKeyEnableBradycardiaDetection];
  if (v12 | v13) {
    unsigned int v14 = 0;
  }
  else {
    unsigned int v14 = v9;
  }
  v15 = [v3 setupFlowUserInfo];

  id v16 = [v15 objectForKeyedSubscript:BPSPairingFlowFamilyMember];

  if (v16)
  {
    unsigned int v17 = v14 & ~[v16 isChildAccount];
  }
  else
  {
    id v18 = objc_alloc((Class)NSUserDefaults);
    id v19 = [v18 initWithSuiteName:kHKAgeGatingDomain];
    unsigned int v17 = v14 & ~[v19 BOOLForKey:HKIsAgeGatedUserDefaultsHeartSensingKey];
  }
  return v17;
}

- (BOOL)wantsLightenBlendedScreen
{
  return 1;
}

- (id)imageResource
{
  return @"WatchBuddy_HighHeartRate";
}

- (id)imageResourceBundleIdentifier
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)titleString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"HR_MODE_GETTING_STARTED_TITLE" value:&stru_4190 table:@"Localizable"];

  return v3;
}

- (id)okayButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"HR_MODE_GETTING_STARTED_GET_STARTED" value:&stru_4190 table:@"Localizable"];

  return v3;
}

- (void)okayButtonPressed:(id)a3
{
  id v4 = [(HeartRateNotificationsViewController *)self delegate];
  [v4 buddyControllerDone:self];
}

- (void)_setTachycardiaEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = kHKHeartRateKeyEnableStationaryDiscordanceDetection;
  [(NSUserDefaults *)self->_userDefaults setBool:a3 forKey:kHKHeartRateKeyEnableStationaryDiscordanceDetection];
  uint64_t v6 = kHKHeartRateKeyStationaryDiscordanceMinimumBPM;
  if (v3)
  {
    [(NSUserDefaults *)self->_userDefaults setInteger:_HKHeartSettingsTachycardiaThresholdHeartRateDefault forKey:kHKHeartRateKeyStationaryDiscordanceMinimumBPM];
    HKHRSubmitNotificationsEnabledSignal();
  }
  v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, 0);
  id v8 = +[_HKBehavior sharedBehavior];
  unsigned int v9 = [v8 tinkerModeEnabled];

  if (v9)
  {
    _HKInitializeLogging();
    id v10 = HKLogHeartRate;
    if (os_log_type_enabled(HKLogHeartRate, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Tinker is enabled, do not sync tachycardia keys to guardian", buf, 2u);
    }
  }
  else
  {
    id v11 = objc_alloc_init((Class)NPSManager);
    [v11 synchronizeUserDefaultsDomain:kHKHeartRateNotificationsPreferencesDomain keys:v7];
  }
}

- (void)_setBradycardiaEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = kHKHeartRateKeyEnableBradycardiaDetection;
  [(NSUserDefaults *)self->_userDefaults setBool:a3 forKey:kHKHeartRateKeyEnableBradycardiaDetection];
  uint64_t v6 = kHKHeartRateKeyBradycardiaThresholdBPM;
  if (v3)
  {
    [(NSUserDefaults *)self->_userDefaults setInteger:_HKHeartSettingsBradycardiaThresholdHeartRateDefault forKey:kHKHeartRateKeyBradycardiaThresholdBPM];
    HKHRSubmitNotificationsEnabledSignal();
  }
  v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, 0);
  id v8 = +[_HKBehavior sharedBehavior];
  unsigned int v9 = [v8 tinkerModeEnabled];

  if (v9)
  {
    _HKInitializeLogging();
    id v10 = HKLogHeartRate;
    if (os_log_type_enabled(HKLogHeartRate, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Tinker is enabled, do not sync bradycardia keys to guardian", buf, 2u);
    }
  }
  else
  {
    id v11 = objc_alloc_init((Class)NPSManager);
    [v11 synchronizeUserDefaultsDomain:kHKHeartRateNotificationsPreferencesDomain keys:v7];
  }
}

- (void)_resetHeartRateNotificationSettings
{
  [(NSUserDefaults *)self->_userDefaults removeObjectForKey:kHKHeartRateKeyEnableStationaryDiscordanceDetection];
  [(NSUserDefaults *)self->_userDefaults removeObjectForKey:kHKHeartRateKeyStationaryDiscordanceMinimumBPM];
  [(NSUserDefaults *)self->_userDefaults removeObjectForKey:kHKHeartRateKeyEnableBradycardiaDetection];
  userDefaults = self->_userDefaults;
  uint64_t v4 = kHKHeartRateKeyBradycardiaThresholdBPM;

  [(NSUserDefaults *)userDefaults removeObjectForKey:v4];
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
}

@end