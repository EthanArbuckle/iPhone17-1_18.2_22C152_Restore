@interface HPRFHeartRateSettingsController
+ (id)_cachedInstallStateByAppID;
- (BOOL)_areIrregularRhythmNotificationsTurnedOn;
- (BOOL)_isAppInstalled:(id)a3;
- (BOOL)suppressSendToNotificationCenterOption;
- (HKFeatureStatusManager)aFibBurdenStatusManager;
- (HKFeatureStatusManager)cardioFitnessStatusManager;
- (HKFeatureStatusManager)electrocardiogramStatusManager;
- (HKFeatureStatusManager)heartRateNotificationsStatusManager;
- (HKFeatureStatusManager)irregularRhythmNotificationsManager;
- (HKHealthStore)primaryHealthStore;
- (HKHeartRhythmAvailability)availabilityManager;
- (HKWatchAppAvailability)appAvailability;
- (HPRFHeartRateSettingsController)init;
- (NPSManager)syncManager;
- (NSString)aFibBurdenFooterURL;
- (NSString)cardioFitnessFooterURL;
- (NSString)electrocardiogramFooterURL;
- (NSString)irregularRhythmNotificationsFooterURL;
- (NSUserDefaults)heartRhythmDefaults;
- (NSUserDefaults)notificationDefaults;
- (id)_aFibBurdenGroupSpecifierWithFooter:(id)a3;
- (id)_aFibBurdenOnboardingSpecifier;
- (id)_aFibBurdenSwitchSpecifier;
- (id)_atrialFibrillationDetectionOnboardingSpecifier;
- (id)_atrialFibrillationDetectionSwitchSpecifier;
- (id)_bradycardiaSpecifier;
- (id)_cardioFitnessGroupSpecifierWithFooter:(id)a3;
- (id)_cardioFitnessNotificationsSwitchSpecifier;
- (id)_cardioFitnessOnboardingSpecifier;
- (id)_electrocardiogramAppInstallSpecifier;
- (id)_electrocardiogramGroupSpecifierWithFooter:(id)a3;
- (id)_electrocardiogramHealthRoomSpecifier;
- (id)_electrocardiogramOnboardingSpecifier;
- (id)_heartAgeGatingSpecifier;
- (id)_irregularRhythmNotificationsGroupSpecifierWithHeaderText:(id)a3 footer:(id)a4;
- (id)_irregularRhythmNotificationsSpecifiersWithFeatureStatus:(id)a3;
- (id)_setUpAFibBurdenFeatureStatusManager;
- (id)_setUpCardioFitnessFeatureStatusManager;
- (id)_setUpElectrocardiogramFeatureStatusManager;
- (id)_setUpHeartRateNotificationsFeatureStatusManager;
- (id)_setUpHeartRhythmAvailability;
- (id)_setUpHeartRhythmAvailabilityWithProfileIdentifier:(id)a3;
- (id)_tachycardiaSpecifier;
- (id)aFibBurdenEnabledValueWithSpecifier:(id)a3;
- (id)applicationBundleIdentifier;
- (id)atrialFibrillationDetectionEnabledValueWithSpecifier:(id)a3;
- (id)bundle;
- (id)cardioFitnessNotificationsEnabledValueWithSpecifier:(id)a3;
- (id)localizedPaneTitle;
- (id)notificationCoalescingTitles;
- (id)notificationCoalescingValue:(id)a3;
- (id)notificationCoalescingValues;
- (id)specifiers;
- (int64_t)_atrialFibrillationDetectionRescindedStatus;
- (int64_t)appInstallStateForAppBundleID:(id)a3;
- (void)_aFibBurdenFooterLinkTapped;
- (void)_aFibBurdenOnboardingButtonTapped;
- (void)_atrialFibrillationDetectionHealthRoomButtonTapped;
- (void)_cardioFitnessAboutLinkTapped;
- (void)_cardioFitnessOnboardingButtonTapped;
- (void)_electrocardiogramAppInstallButtonTapped;
- (void)_electrocardiogramFooterLinkTapped;
- (void)_electrocardiogramHealthRoomButtonTapped;
- (void)_electrocardiogramOnboardingButtonTapped;
- (void)_electrocardiogramRecordingRemotelyDisabledLinkTapped;
- (void)_electrocardiogramRecordingSeedExpiredLinkTapped;
- (void)_irregularRhythmNotificationsLinkTapped;
- (void)_openFeatureRemoteDisabledURL;
- (void)_privacySettingsLinkTapped;
- (void)dealloc;
- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4;
- (void)heartRhythmAvailabilityDidUpdate;
- (void)setAFibBurdenEnabledValue:(id)a3 specifier:(id)a4;
- (void)setAFibBurdenFooterURL:(id)a3;
- (void)setAFibBurdenStatusManager:(id)a3;
- (void)setAppAvailability:(id)a3;
- (void)setAtrialFibrillationDetectionEnabledValue:(id)a3 specifier:(id)a4;
- (void)setAvailabilityManager:(id)a3;
- (void)setCardioFitnessFooterURL:(id)a3;
- (void)setCardioFitnessNotificationsEnabledValue:(id)a3 specifier:(id)a4;
- (void)setCardioFitnessStatusManager:(id)a3;
- (void)setElectrocardiogramFooterURL:(id)a3;
- (void)setElectrocardiogramStatusManager:(id)a3;
- (void)setHeartRateNotificationsStatusManager:(id)a3;
- (void)setHeartRhythmDefaults:(id)a3;
- (void)setIrregularRhythmNotificationsFooterURL:(id)a3;
- (void)setIrregularRhythmNotificationsManager:(id)a3;
- (void)setNotificationCoalescingValue:(id)a3 specifier:(id)a4;
- (void)setNotificationDefaults:(id)a3;
- (void)setPrimaryHealthStore:(id)a3;
- (void)setSyncManager:(id)a3;
- (void)setUpWatchAppAvailabilityForAppBundleID:(id)a3 device:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)watchAppAvailability:(id)a3 appInstallStateDidChange:(int64_t)a4;
@end

@implementation HPRFHeartRateSettingsController

- (HPRFHeartRateSettingsController)init
{
  v38.receiver = self;
  v38.super_class = (Class)HPRFHeartRateSettingsController;
  v3 = [(HPRFHeartRateSettingsController *)&v38 init];
  if (v3)
  {
    v4 = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
    primaryHealthStore = v3->_primaryHealthStore;
    v3->_primaryHealthStore = v4;

    id v6 = objc_alloc((Class)NSUserDefaults);
    v7 = (NSUserDefaults *)[v6 initWithSuiteName:kHKHeartRateNotificationsPreferencesDomain];
    notificationDefaults = v3->_notificationDefaults;
    v3->_notificationDefaults = v7;

    id v9 = objc_alloc((Class)NSUserDefaults);
    v10 = (NSUserDefaults *)[v9 initWithSuiteName:kHKHeartRhythmDefaultsDomain];
    heartRhythmDefaults = v3->_heartRhythmDefaults;
    v3->_heartRhythmDefaults = v10;

    v12 = +[NRPairedDeviceRegistry hprf_activeSatelliteDevice];
    if (v12)
    {
      availabilityManager = (HKHeartRhythmAvailability *)[objc_alloc((Class)HKProfileStore) initWithHealthStore:v3->_primaryHealthStore];
      v14 = [v12 pairingID];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_5EC4;
      v35[3] = &unk_186D0;
      id v36 = v12;
      v37 = v3;
      [(HKHeartRhythmAvailability *)availabilityManager fetchProfileIdentifierForNRDeviceUUID:v14 completion:v35];
    }
    else
    {
      uint64_t v15 = [(HPRFHeartRateSettingsController *)v3 _setUpHeartRhythmAvailability];
      availabilityManager = v3->_availabilityManager;
      v3->_availabilityManager = (HKHeartRhythmAvailability *)v15;
    }

    v16 = +[NRPairedDeviceRegistry hprf_activeDevice];
    if (v16)
    {
      [(HPRFHeartRateSettingsController *)v3 setUpWatchAppAvailabilityForAppBundleID:HKElectrocardiogramAppBundleID device:v16];
    }
    else
    {
      _HKInitializeLogging();
      v17 = (void *)HKLogDefault;
      if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR)) {
        sub_E01C((uint64_t)v3, v17, a2);
      }
    }
    uint64_t v18 = objc_opt_new();
    syncManager = v3->_syncManager;
    v3->_syncManager = (NPSManager *)v18;

    id v20 = objc_alloc((Class)HKFeatureStatusManager);
    v21 = (HKFeatureStatusManager *)[v20 initWithFeatureIdentifier:HKFeatureIdentifierIrregularRhythmNotifications healthStore:v3->_primaryHealthStore];
    irregularRhythmNotificationsManager = v3->_irregularRhythmNotificationsManager;
    v3->_irregularRhythmNotificationsManager = v21;

    [(HKFeatureStatusManager *)v3->_irregularRhythmNotificationsManager registerObserver:v3 queue:&_dispatch_main_q];
    uint64_t v23 = [(HPRFHeartRateSettingsController *)v3 _setUpAFibBurdenFeatureStatusManager];
    aFibBurdenStatusManager = v3->_aFibBurdenStatusManager;
    v3->_aFibBurdenStatusManager = (HKFeatureStatusManager *)v23;

    aFibBurdenFooterURL = v3->_aFibBurdenFooterURL;
    v3->_aFibBurdenFooterURL = 0;

    uint64_t v26 = [(HPRFHeartRateSettingsController *)v3 _setUpCardioFitnessFeatureStatusManager];
    cardioFitnessStatusManager = v3->_cardioFitnessStatusManager;
    v3->_cardioFitnessStatusManager = (HKFeatureStatusManager *)v26;

    cardioFitnessFooterURL = v3->_cardioFitnessFooterURL;
    v3->_cardioFitnessFooterURL = 0;

    uint64_t v29 = [(HPRFHeartRateSettingsController *)v3 _setUpElectrocardiogramFeatureStatusManager];
    electrocardiogramStatusManager = v3->_electrocardiogramStatusManager;
    v3->_electrocardiogramStatusManager = (HKFeatureStatusManager *)v29;

    electrocardiogramFooterURL = v3->_electrocardiogramFooterURL;
    v3->_electrocardiogramFooterURL = 0;

    uint64_t v32 = [(HPRFHeartRateSettingsController *)v3 _setUpHeartRateNotificationsFeatureStatusManager];
    heartRateNotificationsStatusManager = v3->_heartRateNotificationsStatusManager;
    v3->_heartRateNotificationsStatusManager = (HKFeatureStatusManager *)v32;
  }
  return v3;
}

- (void)dealloc
{
  availabilityManager = self->_availabilityManager;
  if (availabilityManager) {
    [(HKHeartRhythmAvailability *)availabilityManager removeHeartRhythmAvailabilityObserver:self];
  }
  appAvailability = self->_appAvailability;
  if (appAvailability) {
    [(HKWatchAppAvailability *)appAvailability removeObserver:self];
  }
  cardioFitnessStatusManager = self->_cardioFitnessStatusManager;
  if (cardioFitnessStatusManager) {
    [(HKFeatureStatusManager *)cardioFitnessStatusManager unregisterObserver:self];
  }
  electrocardiogramStatusManager = self->_electrocardiogramStatusManager;
  if (electrocardiogramStatusManager) {
    [(HKFeatureStatusManager *)electrocardiogramStatusManager unregisterObserver:self];
  }
  aFibBurdenStatusManager = self->_aFibBurdenStatusManager;
  if (aFibBurdenStatusManager) {
    [(HKFeatureStatusManager *)aFibBurdenStatusManager unregisterObserver:self];
  }
  heartRateNotificationsStatusManager = self->_heartRateNotificationsStatusManager;
  if (heartRateNotificationsStatusManager) {
    [(HKFeatureStatusManager *)heartRateNotificationsStatusManager unregisterObserver:self];
  }
  v9.receiver = self;
  v9.super_class = (Class)HPRFHeartRateSettingsController;
  [(HPRFHeartRateSettingsController *)&v9 dealloc];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4 = [a3 preferredContentSizeCategory];
  v5 = [(HPRFHeartRateSettingsController *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];

  if (v4 != v6)
  {
    [(HPRFHeartRateSettingsController *)self reload];
  }
}

- (id)_setUpAFibBurdenFeatureStatusManager
{
  v3 = self->_primaryHealthStore;
  id v4 = objc_alloc((Class)HKFeatureStatusManager);
  id v5 = [v4 initWithFeatureIdentifier:HKFeatureIdentifierAFibBurden healthStore:v3 countryCodeSource:1];

  [v5 registerObserver:self queue:&_dispatch_main_q];

  return v5;
}

- (id)_setUpCardioFitnessFeatureStatusManager
{
  v3 = self->_primaryHealthStore;
  id v4 = objc_alloc((Class)HKFeatureStatusManager);
  id v5 = [v4 initWithFeatureIdentifier:HKFeatureIdentifierCardioFitness healthStore:v3 countryCodeSource:1];

  [v5 registerObserver:self queue:&_dispatch_main_q];

  return v5;
}

- (id)_setUpElectrocardiogramFeatureStatusManager
{
  v3 = self->_primaryHealthStore;
  id v4 = objc_alloc((Class)HKFeatureStatusManager);
  id v5 = [v4 initWithFeatureIdentifier:HKFeatureIdentifierElectrocardiogramRecording healthStore:v3 countryCodeSource:1];

  [v5 registerObserver:self queue:&_dispatch_main_q];

  return v5;
}

- (id)_setUpHeartRhythmAvailability
{
  v3 = self->_primaryHealthStore;
  id v4 = [objc_alloc((Class)HKHeartRhythmAvailability) initWithHealthStore:v3];

  [v4 addHeartRhythmAvailabilityObserver:self];

  return v4;
}

- (id)_setUpHeartRateNotificationsFeatureStatusManager
{
  v3 = self->_primaryHealthStore;
  id v4 = objc_alloc((Class)HKFeatureStatusManager);
  id v5 = [v4 initWithFeatureIdentifier:HKFeatureIdentifierHighHeartRateNotifications healthStore:v3];

  [v5 registerObserver:self queue:&_dispatch_main_q];

  return v5;
}

- (id)_setUpHeartRhythmAvailabilityWithProfileIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)HKHealthStore);
  [v5 setProfileIdentifier:v4];

  [v5 resume];
  id v6 = [objc_alloc((Class)HKHeartRhythmAvailability) initWithHealthStore:v5];
  [v6 addHeartRhythmAvailabilityObserver:self];

  return v6;
}

- (id)localizedPaneTitle
{
  return (id)HKHeartRateLocalizedString();
}

- (id)bundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (id)applicationBundleIdentifier
{
  return @"com.apple.HeartRate";
}

- (BOOL)suppressSendToNotificationCenterOption
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)HPRFHeartRateSettingsController;
  [(HPRFHeartRateSettingsController *)&v14 viewWillAppear:a3];
  id v4 = [(HPRFHeartRateSettingsController *)self specifierForID:@"HEART_NOTIFICATION_TACHYCARDIA_GROUP_ID"];
  id v5 = [(id)objc_opt_class() footerText];
  uint64_t v6 = PSFooterTextGroupKey;
  [v4 setObject:v5 forKeyedSubscript:PSFooterTextGroupKey];

  [(HPRFHeartRateSettingsController *)self reloadSpecifier:v4];
  v7 = [(HPRFHeartRateSettingsController *)self specifierForID:@"HEART_NOTIFICATION_TACHYCARDIA_ID"];
  v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[_HKHeartSettingsUtilities isBackgroundHeartRateEnabled]);
  uint64_t v9 = PSEnabledKey;
  [v7 setObject:v8 forKeyedSubscript:PSEnabledKey];

  [(HPRFHeartRateSettingsController *)self reloadSpecifier:v7];
  v10 = [(HPRFHeartRateSettingsController *)self specifierForID:@"HEART_NOTIFICATION_BRADYCARDIA_GROUP_ID"];
  v11 = [(id)objc_opt_class() footerText];
  [v10 setObject:v11 forKeyedSubscript:v6];

  [(HPRFHeartRateSettingsController *)self reloadSpecifier:v10];
  v12 = [(HPRFHeartRateSettingsController *)self specifierForID:@"HEART_NOTIFICATION_BRADYCARDIA_ID"];
  v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[_HKHeartSettingsUtilities isBackgroundHeartRateEnabled]);
  [v12 setObject:v13 forKeyedSubscript:v9];

  [(HPRFHeartRateSettingsController *)self reloadSpecifier:v12];
}

- (int64_t)_atrialFibrillationDetectionRescindedStatus
{
  uint64_t v2 = [(HKFeatureStatusManager *)self->_irregularRhythmNotificationsManager featureAvailabilityProviding];
  id v7 = 0;
  v3 = [v2 onboardedCountryCodeSupportedStateWithError:&v7];
  id v4 = v7;

  if (v3)
  {
    [v3 integerValue];
    int64_t v5 = HKFeatureAvailabilityRescindedStatusFromHKFeatureAvailabilityOnboardedCountrySupportedState();
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHeartRhythm, OS_LOG_TYPE_ERROR)) {
      sub_E1E0();
    }
    int64_t v5 = 0;
  }

  return v5;
}

- (id)specifiers
{
  if (!self->_availabilityManager)
  {
    id v12 = &__NSArray0__struct;
    goto LABEL_88;
  }
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v4) {
    goto LABEL_87;
  }
  int64_t v5 = [(HPRFHeartRateSettingsController *)self localizedPaneTitle];
  [(HPRFHeartRateSettingsController *)self setTitle:v5];

  uint64_t v6 = +[NSMutableArray array];
  electrocardiogramStatusManager = self->_electrocardiogramStatusManager;
  id v155 = 0;
  uint64_t v8 = [(HKFeatureStatusManager *)electrocardiogramStatusManager featureStatusWithError:&v155];
  id v9 = v155;
  if (v8)
  {
    id v10 = objc_alloc((Class)HKHRElectrocardiogramRecordingBridgeSettings);
    id v11 = objc_msgSend(v10, "initWithFeatureStatus:isAppInstalled:", v8, -[HPRFHeartRateSettingsController _isAppInstalled:](self, "_isAppInstalled:", HKElectrocardiogramAppBundleID));
  }
  else
  {
    _HKInitializeLogging();
    v13 = (void *)HKLogHeartRate;
    if (os_log_type_enabled(HKLogHeartRate, OS_LOG_TYPE_ERROR)) {
      sub_E530(v13, v9);
    }
    id v11 = 0;
  }
  objc_super v14 = +[PSSpecifier groupSpecifierWithID:@"HEADER"];
  uint64_t v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  [v14 setProperty:v16 forKey:PSHeaderCellClassGroupKey];

  v147 = v11;
  v148 = (void *)v6;
  v145 = v9;
  if (v11)
  {
    v17 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 settingVisible]);
    [v14 setObject:v17 forKeyedSubscript:@"ElectrocardiogramSupported"];
  }
  else
  {
    [v14 setObject:&__kCFBooleanFalse forKeyedSubscript:@"ElectrocardiogramSupported"];
  }
  availabilityManager = self->_availabilityManager;
  v19 = +[NRPairedDeviceRegistry hprf_activePrimaryOrSatelliteDevice];
  id v20 = +[NSDate date];
  v21 = +[NSNumber numberWithBool:[(HKHeartRhythmAvailability *)availabilityManager isHeartAgeGatingEnabledOnWatch:v19 currentDate:v20]];
  v149 = v14;
  [v14 setObject:v21 forKeyedSubscript:@"HeartAgeGatingEnabled"];

  id v22 = objc_alloc_init((Class)NSMutableString);
  unsigned int v23 = +[NRPairedDeviceRegistry hprf_activeDeviceIsSatelliteDevice];
  v146 = (void *)v8;
  if (+[_HKHeartSettingsUtilities isHeartRateEnabled] & 1) != 0|| (v23)
  {
    id v31 = [v22 copy];
    uint64_t v29 = v149;
    [v149 setProperty:v31 forKey:PSFooterTextGroupKey];
  }
  else
  {
    v24 = HKHeartRateLocalizedString();
    [v22 appendFormat:@"\n\n%@", v24];

    v25 = (objc_class *)objc_opt_class();
    uint64_t v26 = NSStringFromClass(v25);
    [v149 setObject:v26 forKeyedSubscript:PSFooterCellClassGroupKey];

    [v149 setObject:v22 forKeyedSubscript:PSFooterHyperlinkViewTitleKey];
    v27 = HKHeartRateLocalizedString();
    v162.location = (NSUInteger)[v22 rangeOfString:v27];
    v28 = NSStringFromRange(v162);
    [v149 setObject:v28 forKeyedSubscript:PSFooterHyperlinkViewLinkRangeKey];

    uint64_t v29 = v149;
    v30 = +[NSValue valueWithNonretainedObject:self];
    [v149 setObject:v30 forKeyedSubscript:PSFooterHyperlinkViewTargetKey];

    [v149 setObject:@"_privacySettingsLinkTapped" forKeyedSubscript:PSFooterHyperlinkViewActionKey];
  }
  uint64_t v32 = v148;
  [v148 addObject:v29];
  v33 = self->_availabilityManager;
  v34 = +[NRPairedDeviceRegistry hprf_activeDevice];
  v35 = +[NSDate date];
  LODWORD(v33) = [(HKHeartRhythmAvailability *)v33 isHeartAgeGatingEnabledOnWatch:v34 currentDate:v35];

  if (v33)
  {
    uint64_t v36 = +[NSArray arrayWithArray:v148];
    uint64_t v37 = v3;
    objc_super v38 = *(void **)&self->BPSNotificationAppController_opaque[v3];
    *(void *)&self->BPSNotificationAppController_opaque[v3] = v36;

    id v12 = *(id *)&self->BPSNotificationAppController_opaque[v3];
    int v39 = 0;
    v40 = v147;
  }
  else
  {
    uint64_t v37 = v3;
    v40 = v147;
    if (!v23)
    {
      uint64_t v32 = v148;
      v43 = v149;
      if (v147)
      {
        if ([v147 settingVisible])
        {
          v44 = [v147 footer];
          v45 = [(HPRFHeartRateSettingsController *)self _electrocardiogramGroupSpecifierWithFooter:v44];

          [v148 addObject:v45];
          if ([v147 showOnboarding])
          {
            v46 = [(HPRFHeartRateSettingsController *)self _electrocardiogramOnboardingSpecifier];
            v47 = v147;
            v48 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v147 userInteractionEnabled]);
            [v46 setObject:v48 forKeyedSubscript:PSEnabledKey];

            [v148 addObject:v46];
          }
          else
          {
            v46 = [(HPRFHeartRateSettingsController *)self _electrocardiogramAppInstallSpecifier];
            v47 = v147;
            v53 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v147 userInteractionEnabled]);
            [v46 setObject:v53 forKeyedSubscript:PSEnabledKey];

            [v148 addObject:v46];
            v54 = [(HPRFHeartRateSettingsController *)self _electrocardiogramHealthRoomSpecifier];
            [v148 addObject:v54];
          }
          v40 = v47;
          v43 = v149;
        }
        else
        {
          _HKInitializeLogging();
          v49 = (void *)HKLogHeartRate;
          if (os_log_type_enabled(HKLogHeartRate, OS_LOG_TYPE_DEFAULT))
          {
            v50 = v49;
            v51 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v158 = v51;
            id v52 = v51;
            _os_log_impl(&dword_0, v50, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Omitting Electrocardiogram section. Feature is unavailable", buf, 0xCu);
          }
        }
      }
      cardioFitnessStatusManager = self->_cardioFitnessStatusManager;
      id v154 = 0;
      uint64_t v56 = [(HKFeatureStatusManager *)cardioFitnessStatusManager featureStatusWithError:&v154];
      id v142 = v154;
      v144 = (void *)v56;
      if (v56)
      {
        id v57 = [objc_alloc((Class)HKHRCardioFitnessNotificationSettingsFactory) initWithFeatureStatus:v56];
        v58 = [v57 bridgeSettings];

        if ([v58 settingVisible])
        {
          v59 = [v58 footer];
          v60 = [(HPRFHeartRateSettingsController *)self _cardioFitnessGroupSpecifierWithFooter:v59];

          [v148 addObject:v60];
          unsigned int v61 = [v58 showOnboarding];
          _HKInitializeLogging();
          v62 = (void *)HKLogHeartRate;
          BOOL v63 = os_log_type_enabled(HKLogHeartRate, OS_LOG_TYPE_DEFAULT);
          if (v61)
          {
            if (v63)
            {
              v64 = v62;
              v65 = objc_opt_class();
              *(_DWORD *)buf = 138543362;
              v158 = v65;
              id v66 = v65;
              _os_log_impl(&dword_0, v64, OS_LOG_TYPE_DEFAULT, "[%{public}@]: CardioFitness not onboarded. Showing onboarding specifier", buf, 0xCu);
            }
            uint64_t v67 = [(HPRFHeartRateSettingsController *)self _cardioFitnessOnboardingSpecifier];
          }
          else
          {
            if (v63)
            {
              v72 = v62;
              v73 = objc_opt_class();
              *(_DWORD *)buf = 138543362;
              v158 = v73;
              id v74 = v73;
              _os_log_impl(&dword_0, v72, OS_LOG_TYPE_DEFAULT, "[%{public}@]: CardioFitness onboarded. Showing notification toggle", buf, 0xCu);
            }
            uint64_t v67 = [(HPRFHeartRateSettingsController *)self _cardioFitnessNotificationsSwitchSpecifier];
          }
          v75 = (void *)v67;
          v76 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v58 settingEnabled]);
          [v75 setObject:v76 forKeyedSubscript:PSEnabledKey];

          [v148 addObject:v75];
          v43 = v149;
        }
        else
        {
          _HKInitializeLogging();
          v68 = (void *)HKLogHeartRate;
          if (os_log_type_enabled(HKLogHeartRate, OS_LOG_TYPE_DEFAULT))
          {
            v69 = v68;
            v70 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v158 = v70;
            id v71 = v70;
            _os_log_impl(&dword_0, v69, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Omitting CardioFitness section. Notifications unavailable", buf, 0xCu);

            v43 = v149;
          }
        }
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(HKLogHeartRate, OS_LOG_TYPE_ERROR)) {
          sub_E47C();
        }
      }
      irregularRhythmNotificationsManager = self->_irregularRhythmNotificationsManager;
      id v153 = 0;
      uint64_t v78 = [(HKFeatureStatusManager *)irregularRhythmNotificationsManager featureStatusWithError:&v153];
      id v141 = v153;
      v137 = (void *)v78;
      if (v78)
      {
        v143 = [(HPRFHeartRateSettingsController *)self _irregularRhythmNotificationsSpecifiersWithFeatureStatus:v78];
        objc_msgSend(v148, "addObjectsFromArray:");
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(HKLogHeartRate, OS_LOG_TYPE_ERROR)) {
          sub_E3D8();
        }
        v143 = &__NSArray0__struct;
      }
      heartRateNotificationsStatusManager = self->_heartRateNotificationsStatusManager;
      id v152 = 0;
      v80 = [(HKFeatureStatusManager *)heartRateNotificationsStatusManager featureStatusWithError:&v152];
      id v140 = v152;
      _HKInitializeLogging();
      v81 = (void *)HKLogHeartRate;
      v136 = v80;
      if (v80)
      {
        if (os_log_type_enabled(HKLogHeartRate, OS_LOG_TYPE_DEFAULT))
        {
          v82 = v81;
          v83 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v158 = v83;
          __int16 v159 = 2112;
          v160 = v80;
          id v84 = v83;
          _os_log_impl(&dword_0, v82, OS_LOG_TYPE_DEFAULT, "[%@]: Loading notifications section with status %@", buf, 0x16u);
        }
        v85 = [v80 objectForKeyedSubscript:HKFeatureAvailabilityContextSettingsVisibility];
        unsigned __int8 v86 = [v85 areAllRequirementsSatisfied];

        if (v86)
        {
          v87 = HKHeartRateLocalizedString();
          if (+[_HKHeartSettingsUtilities isWristDetectionEnabled])
          {
            v88 = 0;
          }
          else
          {
            v88 = HKHeartRateLocalizedString();
          }
          if ([v143 count])
          {

            v87 = 0;
            v88 = 0;
          }
          v138 = v87;
          v89 = +[PSSpecifier groupSpecifierWithID:@"HEART_NOTIFICATION_TACHYCARDIA_GROUP_ID" name:v87];
          v132 = v88;
          if (v88)
          {
            v90 = HKHeartRateLocalizedString();
            [v89 setObject:v90 forKeyedSubscript:PSHeaderDetailTextGroupKey];
          }
          v91 = [(id)objc_opt_class() footerText];
          uint64_t v92 = PSFooterTextGroupKey;
          [v89 setObject:v91 forKeyedSubscript:PSFooterTextGroupKey];

          v131 = v89;
          [v148 addObject:v89];
          v93 = [(HPRFHeartRateSettingsController *)self _tachycardiaSpecifier];
          v94 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[_HKHeartSettingsUtilities isBackgroundHeartRateEnabled]);
          uint64_t v95 = PSEnabledKey;
          [v93 setObject:v94 forKeyedSubscript:PSEnabledKey];

          [v148 addObject:v93];
          if (+[_HKHeartSettingsUtilities isBradycardiaDetectionSupportedOnActiveWatch])
          {
            v96 = +[PSSpecifier groupSpecifierWithID:@"HEART_NOTIFICATION_BRADYCARDIA_GROUP_ID" name:0];
            v97 = [(id)objc_opt_class() footerText];
            [v96 setObject:v97 forKeyedSubscript:v92];

            [v148 addObject:v96];
            v98 = [(HPRFHeartRateSettingsController *)self _bradycardiaSpecifier];
            v99 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[_HKHeartSettingsUtilities isBackgroundHeartRateEnabled]);
            [v98 setObject:v99 forKeyedSubscript:v95];

            [v148 addObject:v98];
          }

          v40 = v147;
          v43 = v149;
        }
      }
      else if (os_log_type_enabled(HKLogHeartRate, OS_LOG_TYPE_ERROR))
      {
        sub_E324();
      }
      aFibBurdenStatusManager = self->_aFibBurdenStatusManager;
      id v151 = 0;
      v101 = [(HKFeatureStatusManager *)aFibBurdenStatusManager featureStatusWithError:&v151];
      id v139 = v151;
      _HKInitializeLogging();
      v102 = HKHRAFibBurdenLogForCategory();
      v103 = v102;
      if (v101)
      {
        if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
        {
          v104 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v158 = v104;
          __int16 v159 = 2112;
          v160 = v101;
          id v105 = v104;
          _os_log_impl(&dword_0, v103, OS_LOG_TYPE_DEFAULT, "[%@]: Loading AFibBurden section with status %@", buf, 0x16u);
        }
        id v106 = [objc_alloc((Class)HKHRAFibBurdenNotificationSettingsFactory) initWithFeatureStatus:v101];
        v103 = [v106 bridgeSettings];

        if ([v103 settingVisible])
        {
          v133 = v101;
          v107 = [v103 footer];
          v108 = [(HPRFHeartRateSettingsController *)self _aFibBurdenGroupSpecifierWithFooter:v107];

          [v148 addObject:v108];
          unsigned int v109 = [v103 showOnboarding];
          _HKInitializeLogging();
          v110 = HKHRAFibBurdenLogForCategory();
          BOOL v111 = os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT);
          if (v109)
          {
            if (v111)
            {
              v112 = objc_opt_class();
              *(_DWORD *)buf = 138412290;
              v158 = v112;
              id v113 = v112;
              _os_log_impl(&dword_0, v110, OS_LOG_TYPE_DEFAULT, "[%@]: AFibBurden not onboarded. Showing onboarding specifier", buf, 0xCu);
            }
            uint64_t v114 = [(HPRFHeartRateSettingsController *)self _aFibBurdenOnboardingSpecifier];
          }
          else
          {
            if (v111)
            {
              v118 = objc_opt_class();
              *(_DWORD *)buf = 138412290;
              v158 = v118;
              id v119 = v118;
              _os_log_impl(&dword_0, v110, OS_LOG_TYPE_DEFAULT, "[%@]: AFibBurden onboarded. Showing toggle", buf, 0xCu);
            }
            uint64_t v114 = [(HPRFHeartRateSettingsController *)self _aFibBurdenSwitchSpecifier];
          }
          v120 = (void *)v114;
          v121 = +[NSNumber numberWithBool:[v103 settingEnabled]];
          [v120 setObject:v121 forKeyedSubscript:PSEnabledKey];

          [v148 addObject:v120];
          v43 = v149;
          v101 = v133;
        }
        else
        {
          _HKInitializeLogging();
          v108 = HKHRAFibBurdenLogForCategory();
          if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
          {
            v115 = objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v158 = v115;
            id v134 = v22;
            v116 = v101;
            id v117 = v115;
            _os_log_impl(&dword_0, v108, OS_LOG_TYPE_DEFAULT, "[%@]: Omitting AFibBurden section. Feature unavailable", buf, 0xCu);

            v101 = v116;
            id v22 = v134;
          }
        }

        id v12 = v144;
      }
      else
      {
        id v12 = v144;
        if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
          sub_E270();
        }
      }

      if (+[_HKHeartSettingsUtilities isBackgroundHeartRateEnabled])
      {
        v150.receiver = self;
        v150.super_class = (Class)HPRFHeartRateSettingsController;
        id v122 = [(HPRFHeartRateSettingsController *)&v150 specifiers];
        v123 = +[PSSpecifier groupSpecifierWithID:@"NOTIFICATION_COALESCING_GROUP_ID"];
        id v135 = v22;
        v124 = v101;
        v43 = v149;
        v125 = +[PSSpecifier preferenceSpecifierNamed:@"HEART_NOTIFICATION_COALESCING_TITLE" target:self set:"setNotificationCoalescingValue:specifier:" get:"notificationCoalescingValue:" detail:objc_opt_class() cell:2 edit:0];
        v126 = HKHeartRateLocalizedString();
        [v125 setName:v126];

        [v125 setIdentifier:@"NOTIFICATION_COALESCING_ID"];
        [v125 setProperty:@"notificationCoalescingTitles" forKey:PSTitlesDataSourceKey];
        [v125 setProperty:@"notificationCoalescingValues" forKey:PSValuesDataSourceKey];
        v156[0] = v123;
        v156[1] = v125;
        v127 = +[NSArray arrayWithObjects:v156 count:2];
        [v148 addObjectsFromArray:v127];

        uint64_t v32 = v148;
        v101 = v124;
        id v22 = v135;

        id v12 = v144;
      }
      uint64_t v128 = +[NSArray arrayWithArray:v32];
      v129 = *(void **)&self->BPSNotificationAppController_opaque[v37];
      *(void *)&self->BPSNotificationAppController_opaque[v37] = v128;

      int v39 = 1;
      goto LABEL_85;
    }
    uint64_t v32 = v148;
    uint64_t v41 = +[NSArray arrayWithArray:v148];
    v42 = *(void **)&self->BPSNotificationAppController_opaque[v37];
    *(void *)&self->BPSNotificationAppController_opaque[v37] = v41;

    id v12 = *(id *)&self->BPSNotificationAppController_opaque[v37];
    int v39 = 0;
  }
  v43 = v149;
LABEL_85:

  if (!v39) {
    goto LABEL_88;
  }
  id v4 = *(void **)&self->BPSNotificationAppController_opaque[v37];
LABEL_87:
  id v12 = v4;
LABEL_88:

  return v12;
}

- (void)_privacySettingsLinkTapped
{
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  uint64_t v2 = +[NSURL URLWithString:@"bridge:root=PRIVACY_ID"];
  [v3 openSensitiveURL:v2 withOptions:0];
}

- (id)notificationCoalescingTitles
{
  uint64_t v2 = HKHeartRateLocalizedString();
  v7[0] = v2;
  id v3 = HKHeartRateLocalizedString();
  v7[1] = v3;
  id v4 = HKHeartRateLocalizedString();
  v7[2] = v4;
  int64_t v5 = +[NSArray arrayWithObjects:v7 count:3];

  return v5;
}

- (id)notificationCoalescingValues
{
  return &off_19398;
}

- (id)notificationCoalescingValue:(id)a3
{
  id v3 = [(HPRFHeartRateSettingsController *)self sectionInfo];
  id v4 = [v3 objectForKey:BPSNanoBulletinCoalescingBehavior];

  if (v4) {
    int64_t v5 = v4;
  }
  else {
    int64_t v5 = &off_192F0;
  }
  uint64_t v6 = v5;

  return v6;
}

- (void)setNotificationCoalescingValue:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(HPRFHeartRateSettingsController *)self sectionInfo];
  [v6 setObject:v5 forKey:BPSNanoBulletinCoalescingBehavior];

  [(HPRFHeartRateSettingsController *)self writeSectionState];
}

- (void)_electrocardiogramRecordingRemotelyDisabledLinkTapped
{
}

- (void)_electrocardiogramRecordingSeedExpiredLinkTapped
{
  id v4 = +[UIApplication sharedApplication];
  uint64_t v2 = +[_HKHeartSettingsUtilities seedExpiredLinkURL];
  id v3 = +[NSURL URLWithString:v2];
  [v4 openURL:v3 withCompletionHandler:0];
}

- (void)_openFeatureRemoteDisabledURL
{
  id v3 = +[UIApplication sharedApplication];
  uint64_t v2 = +[NSURL URLWithString:HKElectrocardiogramRemoteDisabledSupportURL];
  [v3 openURL:v2 withCompletionHandler:0];
}

- (id)_electrocardiogramGroupSpecifierWithFooter:(id)a3
{
  id v4 = a3;
  id v5 = HKHeartRateLocalizedString();
  uint64_t v6 = +[PSSpecifier groupSpecifierWithID:@"ELECTROCARDIOGRAM_GROUP_ID" name:v5];

  id v7 = [v4 linkURL];
  [(HPRFHeartRateSettingsController *)self setElectrocardiogramFooterURL:v7];

  uint64_t v8 = [v4 footerLink];
  if (v8 && ([v4 linkURL], id v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    id v10 = [v4 footerText];
    id v11 = +[NSString stringWithFormat:@"%@\n%@", v10, v8];

    id v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v6 setObject:v13 forKeyedSubscript:PSFooterCellClassGroupKey];

    [v6 setObject:v11 forKeyedSubscript:PSFooterHyperlinkViewTitleKey];
    v19.location = (NSUInteger)[v11 rangeOfString:v8];
    objc_super v14 = NSStringFromRange(v19);
    [v6 setObject:v14 forKeyedSubscript:PSFooterHyperlinkViewLinkRangeKey];

    uint64_t v15 = +[NSValue valueWithNonretainedObject:self];
    [v6 setObject:v15 forKeyedSubscript:PSFooterHyperlinkViewTargetKey];

    v16 = NSStringFromSelector("_electrocardiogramFooterLinkTapped");
    [v6 setObject:v16 forKeyedSubscript:PSFooterHyperlinkViewActionKey];
  }
  else
  {
    id v11 = [v4 footerText];
    [v6 setObject:v11 forKeyedSubscript:PSFooterTextGroupKey];
  }

  return v6;
}

- (void)_electrocardiogramFooterLinkTapped
{
  id v3 = [(HPRFHeartRateSettingsController *)self electrocardiogramFooterURL];

  if (v3)
  {
    id v7 = +[LSApplicationWorkspace defaultWorkspace];
    id v4 = [(HPRFHeartRateSettingsController *)self electrocardiogramFooterURL];
    id v5 = +[NSURL URLWithString:v4];
    [v7 openSensitiveURL:v5 withOptions:0];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v6 = (void *)HKLogHeartRate;
    if (os_log_type_enabled(HKLogHeartRate, OS_LOG_TYPE_FAULT)) {
      sub_E5DC(v6);
    }
  }
}

- (id)_electrocardiogramOnboardingSpecifier
{
  id v3 = HKHeartRateLocalizedString();
  id v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v4 setIdentifier:@"ELECTROCARDIOGRAM_ONBOARDING_BUTTON"];
  [v4 setButtonAction:"_electrocardiogramOnboardingButtonTapped"];
  id v5 = NSStringFromSelector("_electrocardiogramOnboardingButtonTapped");
  [v4 setObject:v5 forKeyedSubscript:PSButtonActionKey];

  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];

  return v4;
}

- (id)_electrocardiogramHealthRoomSpecifier
{
  id v3 = HKHeartRateLocalizedString();
  id v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v4 setIdentifier:@"ELECTROCARDIOGRAM_HEALTH_ROOM_BUTTON"];
  [v4 setButtonAction:"_electrocardiogramHealthRoomButtonTapped"];
  id v5 = NSStringFromSelector("_electrocardiogramHealthRoomButtonTapped");
  [v4 setObject:v5 forKeyedSubscript:PSButtonActionKey];

  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];

  return v4;
}

- (id)_electrocardiogramAppInstallSpecifier
{
  id v3 = HKHeartRateLocalizedString();
  id v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:0 get:0 detail:0 cell:-1 edit:0];

  [v4 setIdentifier:@"ELECTROCARDIOGRAM_APP_INSTALL_BUTTON"];
  [v4 setProperty:objc_opt_class() forKey:PSCellClassKey];
  uint64_t v5 = HKElectrocardiogramAppBundleID;
  [v4 setProperty:HKElectrocardiogramAppBundleID forKey:@"HPRFAppBundleID"];
  [v4 setProperty:v5 forKey:PSLazyIconAppID];
  [v4 setProperty:&__kCFBooleanTrue forKey:PSLazyIconLoading];
  uint64_t v6 = NSStringFromSelector("_electrocardiogramAppInstallButtonTapped");
  [v4 setObject:v6 forKeyedSubscript:@"HPRFAppInstallAction"];

  return v4;
}

- (void)_electrocardiogramHealthRoomButtonTapped
{
  id v3 = +[UIApplication sharedApplication];
  uint64_t v2 = +[NSURL _hk_urlForElectrocardiogramType];
  [v3 openURL:v2 withCompletionHandler:0];
}

- (void)_electrocardiogramOnboardingButtonTapped
{
  uint64_t v2 = +[NSSet setWithObject:HKElectrocardiogramOnboardingVersionCompletedDefaultKey];
  HKSynchronizeNanoPreferencesUserDefaults();

  id v4 = +[UIApplication sharedApplication];
  id v3 = +[NSURL _hk_urlForElectrocardiogramType];
  [v4 openURL:v3 withCompletionHandler:0];
}

- (void)_electrocardiogramAppInstallButtonTapped
{
  _HKInitializeLogging();
  id v3 = HKLogHeartRhythm;
  if (os_log_type_enabled(HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446210;
    id v7 = "-[HPRFHeartRateSettingsController _electrocardiogramAppInstallButtonTapped]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "[%{public}s]: App install button tapped", (uint8_t *)&v6, 0xCu);
  }
  id v4 = [(HPRFHeartRateSettingsController *)self availabilityManager];
  [v4 updateOnboardingCompletionVersionCache];

  uint64_t v5 = [(HPRFHeartRateSettingsController *)self availabilityManager];
  [v5 updateElectrocardiogramWatchAppInstallIsAllowed];
}

- (id)_irregularRhythmNotificationsSpecifiersWithFeatureStatus:(id)a3
{
  id v4 = HKHRIrregularRhythmNotificationsBridgeSettingsWithFeatureStatus();
  if ([v4 isSettingHidden])
  {
    uint64_t v5 = &__NSArray0__struct;
  }
  else
  {
    int v6 = [v4 headerText];
    id v7 = [v4 footer];
    uint64_t v8 = [(HPRFHeartRateSettingsController *)self _irregularRhythmNotificationsGroupSpecifierWithHeaderText:v6 footer:v7];

    if ([v4 shouldLinkToOnboarding]) {
      [(HPRFHeartRateSettingsController *)self _atrialFibrillationDetectionOnboardingSpecifier];
    }
    else {
    id v9 = [(HPRFHeartRateSettingsController *)self _atrialFibrillationDetectionSwitchSpecifier];
    }
    id v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isUserInteractionEnabled]);
    [v9 setObject:v10 forKeyedSubscript:PSEnabledKey];

    v12[0] = v8;
    v12[1] = v9;
    uint64_t v5 = +[NSArray arrayWithObjects:v12 count:2];
  }

  return v5;
}

- (id)_irregularRhythmNotificationsGroupSpecifierWithHeaderText:(id)a3 footer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = HKHeartRateLocalizedString();
  id v9 = +[PSSpecifier groupSpecifierWithID:@"ATRIAL_FIBRILLATION_GROUP_ID" name:v8];

  if (v6) {
    [v9 setObject:v6 forKeyedSubscript:PSHeaderDetailTextGroupKey];
  }
  uint64_t v10 = [v7 linkText];
  if (v10
    && (id v11 = (void *)v10,
        [v7 linkURL],
        id v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        v12))
  {
    v13 = [v7 linkURL];
    irregularRhythmNotificationsFooterURL = self->_irregularRhythmNotificationsFooterURL;
    self->_irregularRhythmNotificationsFooterURL = v13;

    uint64_t v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v9 setObject:v16 forKeyedSubscript:PSFooterCellClassGroupKey];

    v17 = [v7 text];
    [v9 setObject:v17 forKeyedSubscript:PSFooterHyperlinkViewTitleKey];

    uint64_t v18 = [v7 text];
    NSRange v19 = [v7 linkText];
    v27.location = (NSUInteger)[v18 rangeOfString:v19];
    id v20 = NSStringFromRange(v27);
    [v9 setObject:v20 forKeyedSubscript:PSFooterHyperlinkViewLinkRangeKey];

    v21 = +[NSValue valueWithNonretainedObject:self];
    [v9 setObject:v21 forKeyedSubscript:PSFooterHyperlinkViewTargetKey];

    id v22 = NSStringFromSelector("_irregularRhythmNotificationsLinkTapped");
    unsigned int v23 = &PSFooterHyperlinkViewActionKey;
  }
  else
  {
    v24 = self->_irregularRhythmNotificationsFooterURL;
    self->_irregularRhythmNotificationsFooterURL = 0;

    id v22 = [v7 text];
    unsigned int v23 = &PSFooterTextGroupKey;
  }
  [v9 setObject:v22 forKeyedSubscript:*v23];

  return v9;
}

- (void)_irregularRhythmNotificationsLinkTapped
{
  if (self->_irregularRhythmNotificationsFooterURL)
  {
    id v5 = +[LSApplicationWorkspace defaultWorkspace];
    id v3 = +[NSURL URLWithString:self->_irregularRhythmNotificationsFooterURL];
    [v5 openSensitiveURL:v3 withOptions:0];
  }
  else
  {
    _HKInitializeLogging();
    id v4 = (void *)HKLogHeartRate;
    if (os_log_type_enabled(HKLogHeartRate, OS_LOG_TYPE_FAULT)) {
      sub_E66C(v4);
    }
  }
}

- (id)_atrialFibrillationDetectionOnboardingSpecifier
{
  id v3 = +[_HKHeartSettingsUtilities irregularHeartRhythmSetupTitleDescription];
  id v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v4 setIdentifier:@"ATRIAL_FIBRILLATION_ONBOARDING_BUTTON"];
  [v4 setObject:@"_atrialFibrillationDetectionHealthRoomButtonTapped" forKeyedSubscript:PSButtonActionKey];
  [v4 setButtonAction:"_atrialFibrillationDetectionHealthRoomButtonTapped"];
  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];

  return v4;
}

- (id)_atrialFibrillationDetectionSwitchSpecifier
{
  id v3 = +[_HKHeartSettingsUtilities irregularHeartRhythmTitleDescription];
  id v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:"setAtrialFibrillationDetectionEnabledValue:specifier:" get:"atrialFibrillationDetectionEnabledValueWithSpecifier:" detail:0 cell:6 edit:0];

  [v4 setIdentifier:@"ATRIAL_FIBRILLATION_HEALTH_ROOM_BUTTON"];

  return v4;
}

- (void)_atrialFibrillationDetectionHealthRoomButtonTapped
{
  id v3 = +[UIApplication sharedApplication];
  uint64_t v2 = +[NSURL _hk_urlForAtrialFibrillationEventType];
  [v3 openURL:v2 withCompletionHandler:0];
}

- (void)setAtrialFibrillationDetectionEnabledValue:(id)a3 specifier:(id)a4
{
  id v5 = [a3 BOOLValue];
  uint64_t v6 = objc_opt_class();
  id v7 = [(HKFeatureStatusManager *)self->_irregularRhythmNotificationsManager featureAvailabilityProviding];
  uint64_t v8 = +[NSNumber numberWithBool:v5];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_8D84;
  v9[3] = &unk_186F0;
  v9[4] = v6;
  [v7 setFeatureSettingNumber:v8 forKey:HKFeatureSettingsKeyEnabled completion:v9];
}

- (id)atrialFibrillationDetectionEnabledValueWithSpecifier:(id)a3
{
  BOOL v3 = [(HPRFHeartRateSettingsController *)self _areIrregularRhythmNotificationsTurnedOn];

  return +[NSNumber numberWithBool:v3];
}

- (BOOL)_areIrregularRhythmNotificationsTurnedOn
{
  irregularRhythmNotificationsManager = self->_irregularRhythmNotificationsManager;
  id v8 = 0;
  BOOL v3 = [(HKFeatureStatusManager *)irregularRhythmNotificationsManager featureStatusWithError:&v8];
  id v4 = v8;
  if (v3)
  {
    id v5 = HKHRIrregularRhythmNotificationsBridgeSettingsWithFeatureStatus();
    unsigned __int8 v6 = [v5 areNotificationsOn];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHeartRate, OS_LOG_TYPE_ERROR)) {
      sub_E780();
    }
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)_tachycardiaSpecifier
{
  if (+[_HKHeartSettingsUtilities isBackgroundHeartRateEnabled])uint64_t v2 = 2; {
  else
  }
    uint64_t v2 = -1;
  BOOL v3 = HKHeartRateLocalizedString();
  uint64_t v4 = objc_opt_class();
  id v5 = +[PSSpecifier preferenceSpecifierNamed:v3 target:v4 set:0 get:"localizedThresholdHeartRateString" detail:objc_opt_class() cell:v2 edit:0];

  [v5 setIdentifier:@"HEART_NOTIFICATION_TACHYCARDIA_ID"];

  return v5;
}

- (id)_bradycardiaSpecifier
{
  if (+[_HKHeartSettingsUtilities isBackgroundHeartRateEnabled])uint64_t v2 = 2; {
  else
  }
    uint64_t v2 = -1;
  BOOL v3 = HKHeartRateLocalizedString();
  uint64_t v4 = objc_opt_class();
  id v5 = +[PSSpecifier preferenceSpecifierNamed:v3 target:v4 set:0 get:"localizedThresholdHeartRateString" detail:objc_opt_class() cell:v2 edit:0];

  [v5 setIdentifier:@"HEART_NOTIFICATION_BRADYCARDIA_ID"];

  return v5;
}

- (id)_aFibBurdenGroupSpecifierWithFooter:(id)a3
{
  id v4 = a3;
  id v5 = +[_HKHeartSettingsUtilities aFibBurdenSectionTitle];
  unsigned __int8 v6 = +[PSSpecifier groupSpecifierWithID:@"AFIB_BURDEN_GROUP_ID" name:v5];

  id v7 = [v4 footerText];
  id v8 = [v4 footerLink];
  id v9 = [v4 linkURL];
  [(HPRFHeartRateSettingsController *)self setAFibBurdenFooterURL:v9];

  if (v8 && ([v4 linkURL], uint64_t v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [v6 setObject:v12 forKeyedSubscript:PSFooterCellClassGroupKey];

    [v6 setObject:v7 forKeyedSubscript:PSFooterHyperlinkViewTitleKey];
    v18.location = (NSUInteger)[v7 rangeOfString:v8];
    v13 = NSStringFromRange(v18);
    [v6 setObject:v13 forKeyedSubscript:PSFooterHyperlinkViewLinkRangeKey];

    objc_super v14 = +[NSValue valueWithNonretainedObject:self];
    [v6 setObject:v14 forKeyedSubscript:PSFooterHyperlinkViewTargetKey];

    uint64_t v15 = NSStringFromSelector("_aFibBurdenFooterLinkTapped");
    [v6 setObject:v15 forKeyedSubscript:PSFooterHyperlinkViewActionKey];
  }
  else
  {
    [v6 setObject:v7 forKeyedSubscript:PSFooterTextGroupKey];
  }

  return v6;
}

- (id)_aFibBurdenOnboardingSpecifier
{
  BOOL v3 = +[_HKHeartSettingsUtilities aFibBurdenSetupTitleDescription];
  id v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v4 setIdentifier:@"AFIB_BURDEN_ONBOARDING_BUTTON_ID"];
  [v4 setButtonAction:"_aFibBurdenOnboardingButtonTapped"];
  id v5 = NSStringFromSelector("_aFibBurdenOnboardingButtonTapped");
  [v4 setObject:v5 forKeyedSubscript:PSButtonActionKey];

  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];

  return v4;
}

- (id)_aFibBurdenSwitchSpecifier
{
  BOOL v3 = +[_HKHeartSettingsUtilities aFibBurdenTitleDescription];
  id v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:"setAFibBurdenEnabledValue:specifier:" get:"aFibBurdenEnabledValueWithSpecifier:" detail:0 cell:6 edit:0];

  [v4 setIdentifier:@"AFIB_BURDEN_SWITCH_ID"];
  [v4 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];

  return v4;
}

- (void)_aFibBurdenOnboardingButtonTapped
{
  id v3 = +[UIApplication sharedApplication];
  uint64_t v2 = HKHRAFibBurdenOnboardingDeepLink();
  [v3 openURL:v2 withCompletionHandler:0];
}

- (void)_aFibBurdenFooterLinkTapped
{
  id v3 = [(HPRFHeartRateSettingsController *)self aFibBurdenFooterURL];

  if (v3)
  {
    id v7 = +[LSApplicationWorkspace defaultWorkspace];
    id v4 = [(HPRFHeartRateSettingsController *)self aFibBurdenFooterURL];
    id v5 = +[NSURL URLWithString:v4];
    [v7 openSensitiveURL:v5 withOptions:0];
  }
  else
  {
    _HKInitializeLogging();
    unsigned __int8 v6 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_E810((uint64_t)self, v6);
    }
  }
}

- (void)setAFibBurdenEnabledValue:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(HKFeatureStatusManager *)self->_aFibBurdenStatusManager featureAvailabilityProviding];
  uint64_t v9 = HKFeatureSettingsKeyEnabled;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_96DC;
  v10[3] = &unk_18740;
  objc_copyWeak(&v11, &location);
  [v8 setFeatureSettingNumber:v6 forKey:v9 completion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)aFibBurdenEnabledValueWithSpecifier:(id)a3
{
  aFibBurdenStatusManager = self->_aFibBurdenStatusManager;
  id v14 = 0;
  id v4 = [(HKFeatureStatusManager *)aFibBurdenStatusManager featureStatusWithError:&v14];
  id v5 = v14;
  if (v4)
  {
    id v6 = [objc_alloc((Class)HKHRAFibBurdenNotificationSettingsFactory) initWithFeatureStatus:v4];
    id v7 = [v6 bridgeSettings];
    unsigned int v8 = [v7 settingEnabled];

    uint64_t v9 = [v4 requirementsEvaluationByContext];
    uint64_t v10 = [v9 objectForKeyedSubscript:HKFeatureAvailabilityContextUsage];
    unsigned int v11 = [v10 isRequirementSatisfiedWithIdentifier:HKFeatureAvailabilityRequirementIdentifierFeatureIsOn];

    id v12 = +[NSNumber numberWithInt:v8 & v11];
  }
  else
  {
    _HKInitializeLogging();
    id v6 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_E958(v5, v6);
    }
    id v12 = &__kCFBooleanFalse;
  }

  return v12;
}

- (id)_cardioFitnessGroupSpecifierWithFooter:(id)a3
{
  id v4 = a3;
  id v5 = +[_HKHeartSettingsUtilities cardioFitnessSectionTitle];
  id v6 = +[PSSpecifier groupSpecifierWithID:@"CARDIO_FITNESS_GROUP_ID" name:v5];

  id v7 = [v4 footerText];
  unsigned int v8 = [v4 footerLink];
  uint64_t v9 = [v4 linkURL];
  [(HPRFHeartRateSettingsController *)self setCardioFitnessFooterURL:v9];

  if (v8 && ([v4 linkURL], uint64_t v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    unsigned int v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [v6 setObject:v12 forKeyedSubscript:PSFooterCellClassGroupKey];

    [v6 setObject:v7 forKeyedSubscript:PSFooterHyperlinkViewTitleKey];
    v18.id location = (NSUInteger)[v7 rangeOfString:v8];
    v13 = NSStringFromRange(v18);
    [v6 setObject:v13 forKeyedSubscript:PSFooterHyperlinkViewLinkRangeKey];

    id v14 = +[NSValue valueWithNonretainedObject:self];
    [v6 setObject:v14 forKeyedSubscript:PSFooterHyperlinkViewTargetKey];

    uint64_t v15 = NSStringFromSelector("_cardioFitnessAboutLinkTapped");
    [v6 setObject:v15 forKeyedSubscript:PSFooterHyperlinkViewActionKey];
  }
  else
  {
    [v6 setObject:v7 forKeyedSubscript:PSFooterTextGroupKey];
  }

  return v6;
}

- (id)_cardioFitnessOnboardingSpecifier
{
  id v3 = +[_HKHeartSettingsUtilities cardioFitnessSetupTitleDescription];
  id v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v4 setIdentifier:@"CARDIO_FITNESS_ONBOARDING_BUTTON_ID"];
  [v4 setButtonAction:"_cardioFitnessOnboardingButtonTapped"];
  id v5 = NSStringFromSelector("_cardioFitnessOnboardingButtonTapped");
  [v4 setObject:v5 forKeyedSubscript:PSButtonActionKey];

  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];

  return v4;
}

- (id)_cardioFitnessNotificationsSwitchSpecifier
{
  id v3 = +[_HKHeartSettingsUtilities cardioFitnessTitleDescription];
  id v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:"setCardioFitnessNotificationsEnabledValue:specifier:" get:"cardioFitnessNotificationsEnabledValueWithSpecifier:" detail:0 cell:6 edit:0];

  [v4 setIdentifier:@"CARDIO_FITNESS_NOTIFICATION_SWITCH_ID"];
  [v4 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];

  return v4;
}

- (void)_cardioFitnessOnboardingButtonTapped
{
  id v3 = +[UIApplication sharedApplication];
  uint64_t v2 = HKHRCardioFitnessEventOnboardingDeepLink();
  [v3 openURL:v2 withCompletionHandler:0];
}

- (void)_cardioFitnessAboutLinkTapped
{
  id v3 = [(HPRFHeartRateSettingsController *)self cardioFitnessFooterURL];

  if (v3)
  {
    id v7 = +[LSApplicationWorkspace defaultWorkspace];
    id v4 = [(HPRFHeartRateSettingsController *)self cardioFitnessFooterURL];
    id v5 = +[NSURL URLWithString:v4];
    [v7 openSensitiveURL:v5 withOptions:0];
  }
  else
  {
    _HKInitializeLogging();
    id v6 = (void *)HKLogHeartRate;
    if (os_log_type_enabled(HKLogHeartRate, OS_LOG_TYPE_FAULT)) {
      sub_E9F4(v6);
    }
  }
}

- (void)setCardioFitnessNotificationsEnabledValue:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  unsigned int v8 = [(HKFeatureStatusManager *)self->_cardioFitnessStatusManager featureAvailabilityProviding];
  uint64_t v9 = HKFeatureSettingsKeyEnabled;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_9F80;
  v10[3] = &unk_18740;
  objc_copyWeak(&v11, &location);
  [v8 setFeatureSettingNumber:v6 forKey:v9 completion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)cardioFitnessNotificationsEnabledValueWithSpecifier:(id)a3
{
  cardioFitnessStatusManager = self->_cardioFitnessStatusManager;
  id v15 = 0;
  id v4 = [(HKFeatureStatusManager *)cardioFitnessStatusManager featureStatusWithError:&v15];
  id v5 = v15;
  if (v4)
  {
    id v6 = [objc_alloc((Class)HKHRCardioFitnessNotificationSettingsFactory) initWithFeatureStatus:v4];
    id v7 = [v6 bridgeSettings];
    unsigned int v8 = [v7 settingEnabled];

    uint64_t v9 = [v4 requirementsEvaluationByContext];
    uint64_t v10 = [v9 objectForKeyedSubscript:HKFeatureAvailabilityContextUsage];
    unsigned int v11 = [v10 isRequirementSatisfiedWithIdentifier:HKFeatureAvailabilityRequirementIdentifierFeatureIsOn];

    id v12 = +[NSNumber numberWithInt:v8 & v11];
  }
  else
  {
    _HKInitializeLogging();
    v13 = (void *)HKLogHeartRate;
    if (os_log_type_enabled(HKLogHeartRate, OS_LOG_TYPE_ERROR)) {
      sub_EB44(v13, v5);
    }
    id v12 = &__kCFBooleanFalse;
  }

  return v12;
}

- (void)heartRhythmAvailabilityDidUpdate
{
  _HKInitializeLogging();
  id v3 = HKLogHeartRhythm;
  if (os_log_type_enabled(HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v6 = "-[HPRFHeartRateSettingsController heartRhythmAvailabilityDidUpdate]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "[%{public}s]: Heart rhythm availability update notification received.", buf, 0xCu);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A300;
  block[3] = &unk_18768;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)HKLogHeartRate;
  if (os_log_type_enabled(HKLogHeartRate, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    unsigned int v8 = objc_opt_class();
    id v9 = v8;
    uint64_t v10 = [v5 featureIdentifier];
    int v11 = 138543618;
    id v12 = v8;
    __int16 v13 = 2114;
    id v14 = v10;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ onboarding status updated.", (uint8_t *)&v11, 0x16u);
  }
  [(HPRFHeartRateSettingsController *)self reloadSpecifiers];
}

- (id)_heartAgeGatingSpecifier
{
  uint64_t v2 = +[PSSpecifier groupSpecifierWithID:@"HEART_AGE_GATING_GROUP_ID"];
  id v3 = HKHeartRateLocalizedString();
  [v2 setObject:v3 forKeyedSubscript:PSFooterTextGroupKey];

  return v2;
}

- (void)setUpWatchAppAvailabilityForAppBundleID:(id)a3 device:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  appAvailability = self->_appAvailability;
  if (appAvailability)
  {
    uint64_t v10 = [(HKWatchAppAvailability *)appAvailability bundleID];
    unsigned __int8 v11 = [v10 isEqualToString:v7];

    if (v11) {
      goto LABEL_7;
    }
    [(HKWatchAppAvailability *)self->_appAvailability removeObserver:self];
  }
  _HKInitializeLogging();
  id v12 = (void *)HKLogDefault;
  if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = v12;
    id v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138544130;
    unsigned int v23 = self;
    __int16 v24 = 2114;
    v25 = v14;
    __int16 v26 = 2112;
    id v27 = v7;
    __int16 v28 = 2112;
    id v29 = v8;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Setting up watch app availability for app bundle identifier(%@) on watch(%@)", buf, 0x2Au);
  }
  id v15 = (HKWatchAppAvailability *)[objc_alloc((Class)HKWatchAppAvailability) initWithBundleID:v7];
  v16 = self->_appAvailability;
  self->_appAvailability = v15;

  [(HKWatchAppAvailability *)self->_appAvailability addObserver:self queue:&_dispatch_main_q];
  objc_initWeak((id *)buf, self);
  v17 = self->_appAvailability;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_A6E0;
  v18[3] = &unk_187B8;
  objc_copyWeak(&v21, (id *)buf);
  id v19 = v7;
  id v20 = self;
  [(HKWatchAppAvailability *)v17 appInstallStateOnWatch:v8 completion:v18];

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
LABEL_7:
}

+ (id)_cachedInstallStateByAppID
{
  if (qword_1E758 != -1) {
    dispatch_once(&qword_1E758, &stru_187D8);
  }
  uint64_t v2 = (void *)qword_1E750;

  return v2;
}

- (BOOL)_isAppInstalled:(id)a3
{
  id v5 = a3;
  if (v5 && (appAvailability = self->_appAvailability) != 0)
  {
    id v7 = [(HKWatchAppAvailability *)appAvailability bundleID];
    int64_t v8 = [(HPRFHeartRateSettingsController *)self appInstallStateForAppBundleID:v7];

    BOOL v9 = (unint64_t)(v8 + 1) >= 5 || (((_BYTE)v8 + 1) & 0x1F) == 3;
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v10 = (void *)HKLogDefault;
    if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR))
    {
      id v12 = v10;
      __int16 v13 = NSStringFromSelector(a2);
      int v14 = 138543874;
      id v15 = self;
      __int16 v16 = 2114;
      v17 = v13;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_error_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] -> Failed to retrieve app install state for app bundle identifier(%@) ", (uint8_t *)&v14, 0x20u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (int64_t)appInstallStateForAppBundleID:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _cachedInstallStateByAppID];
  uint64_t v5 = [v4 objectForKey:v3];

  if (v5) {
    id v6 = (_UNKNOWN **)v5;
  }
  else {
    id v6 = &off_19320;
  }
  id v7 = [v6 integerValue];

  return (int64_t)v7;
}

- (void)watchAppAvailability:(id)a3 appInstallStateDidChange:(int64_t)a4
{
  id v7 = a3;
  _HKInitializeLogging();
  int64_t v8 = (void *)HKLogDefault;
  if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = v8;
    uint64_t v10 = NSStringFromSelector(a2);
    unsigned __int8 v11 = +[NSNumber numberWithInteger:a4];
    id v12 = [v7 bundleID];
    *(_DWORD *)buf = 138544130;
    __int16 v18 = self;
    __int16 v19 = 2114;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    __int16 v24 = v12;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> App install state did change(%@) for app with bundle identifier(%@)", buf, 0x2Au);
  }
  __int16 v13 = [(id)objc_opt_class() _cachedInstallStateByAppID];
  int v14 = +[NSNumber numberWithInteger:a4];
  id v15 = [v7 bundleID];
  [v13 setObject:v14 forKey:v15];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_AC78;
  block[3] = &unk_18768;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (HKFeatureStatusManager)heartRateNotificationsStatusManager
{
  return self->_heartRateNotificationsStatusManager;
}

- (void)setHeartRateNotificationsStatusManager:(id)a3
{
}

- (HKHealthStore)primaryHealthStore
{
  return self->_primaryHealthStore;
}

- (void)setPrimaryHealthStore:(id)a3
{
}

- (HKHeartRhythmAvailability)availabilityManager
{
  return self->_availabilityManager;
}

- (void)setAvailabilityManager:(id)a3
{
}

- (HKWatchAppAvailability)appAvailability
{
  return self->_appAvailability;
}

- (void)setAppAvailability:(id)a3
{
}

- (NSUserDefaults)notificationDefaults
{
  return self->_notificationDefaults;
}

- (void)setNotificationDefaults:(id)a3
{
}

- (NSUserDefaults)heartRhythmDefaults
{
  return self->_heartRhythmDefaults;
}

- (void)setHeartRhythmDefaults:(id)a3
{
}

- (NPSManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
}

- (HKFeatureStatusManager)electrocardiogramStatusManager
{
  return self->_electrocardiogramStatusManager;
}

- (void)setElectrocardiogramStatusManager:(id)a3
{
}

- (NSString)electrocardiogramFooterURL
{
  return self->_electrocardiogramFooterURL;
}

- (void)setElectrocardiogramFooterURL:(id)a3
{
}

- (HKFeatureStatusManager)irregularRhythmNotificationsManager
{
  return self->_irregularRhythmNotificationsManager;
}

- (void)setIrregularRhythmNotificationsManager:(id)a3
{
}

- (NSString)irregularRhythmNotificationsFooterURL
{
  return self->_irregularRhythmNotificationsFooterURL;
}

- (void)setIrregularRhythmNotificationsFooterURL:(id)a3
{
}

- (HKFeatureStatusManager)cardioFitnessStatusManager
{
  return self->_cardioFitnessStatusManager;
}

- (void)setCardioFitnessStatusManager:(id)a3
{
}

- (NSString)cardioFitnessFooterURL
{
  return self->_cardioFitnessFooterURL;
}

- (void)setCardioFitnessFooterURL:(id)a3
{
}

- (HKFeatureStatusManager)aFibBurdenStatusManager
{
  return self->_aFibBurdenStatusManager;
}

- (void)setAFibBurdenStatusManager:(id)a3
{
}

- (NSString)aFibBurdenFooterURL
{
  return self->_aFibBurdenFooterURL;
}

- (void)setAFibBurdenFooterURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aFibBurdenFooterURL, 0);
  objc_storeStrong((id *)&self->_aFibBurdenStatusManager, 0);
  objc_storeStrong((id *)&self->_cardioFitnessFooterURL, 0);
  objc_storeStrong((id *)&self->_cardioFitnessStatusManager, 0);
  objc_storeStrong((id *)&self->_irregularRhythmNotificationsFooterURL, 0);
  objc_storeStrong((id *)&self->_irregularRhythmNotificationsManager, 0);
  objc_storeStrong((id *)&self->_electrocardiogramFooterURL, 0);
  objc_storeStrong((id *)&self->_electrocardiogramStatusManager, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_heartRhythmDefaults, 0);
  objc_storeStrong((id *)&self->_notificationDefaults, 0);
  objc_storeStrong((id *)&self->_appAvailability, 0);
  objc_storeStrong((id *)&self->_availabilityManager, 0);
  objc_storeStrong((id *)&self->_primaryHealthStore, 0);

  objc_storeStrong((id *)&self->_heartRateNotificationsStatusManager, 0);
}

@end