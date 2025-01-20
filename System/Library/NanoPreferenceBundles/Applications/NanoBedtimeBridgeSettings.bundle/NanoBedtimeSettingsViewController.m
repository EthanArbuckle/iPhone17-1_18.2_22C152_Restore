@interface NanoBedtimeSettingsViewController
- (BOOL)_areSleepApneaNotificationsEnabled;
- (BOOL)_areSleepApneaNotificationsRescinded;
- (BOOL)_hasWindDown;
- (BOOL)_isAgeGated;
- (BOOL)_shouldShowSleepApneaNotificationsSettings;
- (BOOL)_useWatch;
- (HKFeatureStatus)sleepApneaFeatureStatus;
- (HKFeatureStatusManager)sleepApneaNotificationsFeatureStatusManager;
- (HKSPSleepStore)sleepStore;
- (HKWristDetectionSettingManager)wristDetectManager;
- (NSString)sleepApneaFooterURL;
- (NanoBedtimeSettingsViewController)init;
- (UNUserNotificationCenter)notificationCenter;
- (id)_areSleepApneaNotificationsEnabled:(id)a3;
- (id)_currentSleepEventRecord;
- (id)_currentSleepSchedule;
- (id)_currentSleepSettings;
- (id)_setUpSleepSpecifiers;
- (id)_sleepApneaButtonSpecifierWithFooter:(id)a3;
- (id)_sleepApneaGroupSpecifierWithBridgeSettings:(id)a3;
- (id)_sleepApneaSwitchSpecifierWithFooter:(id)a3;
- (id)_sleepFocusSpecifiers;
- (id)_sleepSettingsSpecifiers;
- (id)_sleepTrackingEnabled:(id)a3;
- (id)_useWatchForSleepSpecifiers;
- (id)_watchChargeReminder:(id)a3;
- (id)specifiers;
- (void)_didTapDontUseWatch:(id)a3;
- (void)_didTapSetUpNotificationsInHealth:(id)a3;
- (void)_didTapSleepApneaFooter;
- (void)_didTapUseWatch:(id)a3;
- (void)_enableSleepTracking:(id)a3;
- (void)_manageSettingsLinkTapped;
- (void)_manageSleepFocusMode:(id)a3;
- (void)_openSleepURLForRoute:(id)a3;
- (void)_openURL:(id)a3;
- (void)_passcodeSettingsLinkTapped;
- (void)_presentNotificationsWontFireAlertIfNeededWithTitle:(id)a3;
- (void)_setSleepTrackingEnabled:(id)a3 withSpecifier:(id)a4;
- (void)_setUpSleep:(id)a3;
- (void)_setUpSleepFocusMode:(id)a3;
- (void)_setWatchChargeReminder:(id)a3 withSpecifier:(id)a4;
- (void)_showSleepOptionsInHealth:(id)a3;
- (void)_sleepApneaNotificationsToggledTapped:(id)a3 specifier:(id)a4;
- (void)_updateSleepSettingsWithBlock:(id)a3;
- (void)currentTraitCollectionDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4;
- (void)dealloc;
- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4;
- (void)setSleepApneaFooterURL:(id)a3;
- (void)sleepStore:(id)a3 sleepEventRecordDidChange:(id)a4;
- (void)sleepStore:(id)a3 sleepFocusModeConfigurationDidUpdate:(id)a4;
- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4;
- (void)wristDetectionSettingManagerDidObserveWristDetectChange:(id)a3;
@end

@implementation NanoBedtimeSettingsViewController

- (NanoBedtimeSettingsViewController)init
{
  v27.receiver = self;
  v27.super_class = (Class)NanoBedtimeSettingsViewController;
  v2 = [(NanoBedtimeSettingsViewController *)&v27 init];
  if (v2)
  {
    v3 = (HKSPSleepStore *)[objc_alloc((Class)HKSPSleepStore) initWithIdentifier:@"NanoSleepBridgeSettings" healthStore:0 options:38];
    sleepStore = v2->_sleepStore;
    v2->_sleepStore = v3;

    [(HKSPSleepStore *)v2->_sleepStore addObserver:v2];
    v5 = (HKWristDetectionSettingManager *)objc_alloc_init((Class)HKWristDetectionSettingManager);
    wristDetectManager = v2->_wristDetectManager;
    v2->_wristDetectManager = v5;

    [(HKWristDetectionSettingManager *)v2->_wristDetectManager registerObserver:v2 queue:&_dispatch_main_q];
    id v7 = objc_alloc((Class)UNUserNotificationCenter);
    v8 = (UNUserNotificationCenter *)[v7 initWithBundleIdentifier:kHKHealthAppBundleIdentifier];
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = v8;

    v10 = +[_HKBehavior sharedBehavior];
    v11 = [v10 features];
    unsigned int v12 = [v11 nebula];

    if (v12)
    {
      id v13 = objc_alloc((Class)HKSPSleepHealthDataSource);
      v14 = v2->_sleepStore;
      id v15 = objc_alloc_init((Class)HKHealthStore);
      id v16 = [v13 initWithSleepStore:v14 healthDataSource:v15];

      id v17 = objc_alloc((Class)HKFeatureStatusManager);
      v18 = [v16 featureAvailabilityProvidingForFeatureIdentifier:HKFeatureIdentifierSleepApneaNotifications];
      v19 = (HKFeatureStatusManager *)[v17 initWithFeatureAvailabilityProviding:v18 healthDataSource:v16 countryCodeSource:1];
      sleepApneaNotificationsFeatureStatusManager = v2->_sleepApneaNotificationsFeatureStatusManager;
      v2->_sleepApneaNotificationsFeatureStatusManager = v19;

      [(HKFeatureStatusManager *)v2->_sleepApneaNotificationsFeatureStatusManager registerObserver:v2 queue:&_dispatch_main_q];
      uint64_t v21 = [(HKFeatureStatusManager *)v2->_sleepApneaNotificationsFeatureStatusManager featureStatusWithError:0];
      sleepApneaFeatureStatus = v2->_sleepApneaFeatureStatus;
      v2->_sleepApneaFeatureStatus = (HKFeatureStatus *)v21;

      sleepApneaFooterURL = v2->_sleepApneaFooterURL;
      v2->_sleepApneaFooterURL = 0;
    }
    uint64_t v28 = objc_opt_class();
    v24 = +[NSArray arrayWithObjects:&v28 count:1];
    id v25 = [(NanoBedtimeSettingsViewController *)v2 registerForTraitChanges:v24 withTarget:v2 action:"currentTraitCollectionDidChangeWithTraitEnvironment:previousTraitCollection:"];
  }
  return v2;
}

- (void)dealloc
{
  [(HKSPSleepStore *)self->_sleepStore removeObserver:self];
  [(HKWristDetectionSettingManager *)self->_wristDetectManager unregisterObserver:self];
  v3 = +[_HKBehavior sharedBehavior];
  v4 = [v3 features];
  unsigned int v5 = [v4 nebula];

  if (v5) {
    [(HKFeatureStatusManager *)self->_sleepApneaNotificationsFeatureStatusManager unregisterObserver:self];
  }
  v6.receiver = self;
  v6.super_class = (Class)NanoBedtimeSettingsViewController;
  [(NanoBedtimeSettingsViewController *)&v6 dealloc];
}

- (id)specifiers
{
  uint64_t v2 = OBJC_IVAR___PSListController__specifiers;
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3)
  {
LABEL_10:
    id v14 = v3;
    goto LABEL_11;
  }
  unsigned int v5 = objc_opt_new();
  objc_super v6 = +[PSSpecifier groupSpecifierWithID:@"SLEEP_HEADER_ID"];
  id v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 setProperty:v8 forKey:PSHeaderCellClassGroupKey];

  [v5 addObject:v6];
  v9 = [(NanoBedtimeSettingsViewController *)self _currentSleepEventRecord];
  if (v9)
  {
    v10 = v9;
    if ([v9 isCurrentSleepCoachingOnboardingCompleted]
      && ([v10 isCurrentSleepTrackingOnboardingCompleted] & 1) != 0)
    {
      if ([(NanoBedtimeSettingsViewController *)self _useWatch]) {
        [(NanoBedtimeSettingsViewController *)self _sleepSettingsSpecifiers];
      }
      else {
      uint64_t v11 = [(NanoBedtimeSettingsViewController *)self _useWatchForSleepSpecifiers];
      }
    }
    else
    {
      uint64_t v11 = [(NanoBedtimeSettingsViewController *)self _setUpSleepSpecifiers];
    }
    unsigned int v12 = (void *)v11;
    [v5 addObjectsFromArray:v11];

    id v13 = *(void **)&self->PSListController_opaque[v2];
    *(void *)&self->PSListController_opaque[v2] = v5;

    v3 = *(void **)&self->PSListController_opaque[v2];
    goto LABEL_10;
  }
  id v14 = *(id *)&self->PSListController_opaque[v2];

LABEL_11:

  return v14;
}

- (id)_setUpSleepSpecifiers
{
  v3 = objc_opt_new();
  v4 = +[PSSpecifier preferenceSpecifierNamed:&stru_C5E8 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  [v3 addObject:v4];
  unsigned int v5 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v6 = [v5 localizedStringForKey:@"SET_UP_SLEEP_TEXT" value:&stru_C5E8 table:0];
  id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v7 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v7 setButtonAction:"_setUpSleep:"];
  [v7 setIdentifier:@"SET_UP_SLEEP_CELL_ID"];
  [v3 addObject:v7];

  return v3;
}

- (id)_useWatchForSleepSpecifiers
{
  v3 = objc_opt_new();
  v4 = +[PSSpecifier preferenceSpecifierNamed:&stru_C5E8 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  [v3 addObject:v4];
  unsigned int v5 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v6 = [v5 localizedStringForKey:@"USE_FOR_SLEEP_TEXT" value:&stru_C5E8 table:0];
  id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v7 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v7 setButtonAction:"_didTapUseWatch:"];
  [v7 setIdentifier:@"SLEEP_USE_WATCH_ID"];
  [v3 addObject:v7];

  return v3;
}

- (id)_sleepSettingsSpecifiers
{
  v3 = objc_opt_new();
  v4 = +[PSSpecifier preferenceSpecifierNamed:&stru_C5E8 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  [v3 addObject:v4];
  unsigned int v5 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v6 = [v5 localizedStringForKey:@"WATCH_SLEEP_TRACKING_TEXT" value:&stru_C5E8 table:0];
  id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"_setSleepTrackingEnabled:withSpecifier:" get:"_sleepTrackingEnabled:" detail:0 cell:6 edit:0];

  [v7 setIdentifier:@"SLEEP_WATCH_TRACKING_ID"];
  uint64_t v8 = objc_opt_class();
  uint64_t v55 = PSCellClassKey;
  objc_msgSend(v7, "setProperty:forKey:", v8);
  v9 = +[NSNumber numberWithBool:[(HKWristDetectionSettingManager *)self->_wristDetectManager isWristDetectEnabled]];
  uint64_t v52 = PSEnabledKey;
  objc_msgSend(v7, "setProperty:forKey:", v9);

  LODWORD(v9) = [(HKWristDetectionSettingManager *)self->_wristDetectManager isWristDetectEnabled];
  v10 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v11 = v10;
  v54 = v4;
  if (v9)
  {
    unsigned int v12 = [v10 localizedStringForKey:@"WATCH_SLEEP_TRACKING_FOOTER" value:&stru_C5E8 table:@"Localizable-Lavender"];
    uint64_t v13 = PSFooterTextGroupKey;
    [v4 setProperty:v12 forKey:PSFooterTextGroupKey];
  }
  else
  {
    id v14 = [v10 localizedStringForKey:@"WATCH_SLEEP_TRACKING_FOOTER_DISABLED_LINK" value:&stru_C5E8 table:0];

    id v15 = +[NSBundle bundleForClass:objc_opt_class()];
    id v16 = [v15 localizedStringForKey:@"WATCH_SLEEP_TRACKING_FOOTER_DISABLED_TEXT" value:&stru_C5E8 table:0];
    id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v14);

    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    [v4 setProperty:v19 forKey:PSFooterCellClassGroupKey];

    [v4 setProperty:v17 forKey:PSFooterHyperlinkViewTitleKey];
    v59.location = (NSUInteger)[v17 rangeOfString:v14];
    v20 = NSStringFromRange(v59);
    [v4 setProperty:v20 forKey:PSFooterHyperlinkViewLinkRangeKey];

    uint64_t v21 = +[NSValue valueWithNonretainedObject:self];
    [v4 setProperty:v21 forKey:PSFooterHyperlinkViewTargetKey];

    v22 = NSStringFromSelector("_passcodeSettingsLinkTapped");
    [v4 setProperty:v22 forKey:PSFooterHyperlinkViewActionKey];

    uint64_t v13 = PSFooterTextGroupKey;
  }
  [v3 addObject:v7];
  v23 = +[PSSpecifier preferenceSpecifierNamed:&stru_C5E8 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  [v3 addObject:v23];
  v24 = +[NSBundle bundleForClass:objc_opt_class()];
  id v25 = [v24 localizedStringForKey:@"WAKE_UP_CHARGE_REMINDERS_TEXT" value:&stru_C5E8 table:0];
  v26 = +[PSSpecifier preferenceSpecifierNamed:v25 target:self set:"_setWatchChargeReminder:withSpecifier:" get:"_watchChargeReminder:" detail:0 cell:6 edit:0];

  [v26 setProperty:objc_opt_class() forKey:v55];
  [v26 setIdentifier:@"SLEEP_CHARGE_REMINDERS_ID"];
  objc_super v27 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v28 = [v27 localizedStringForKey:@"WAKE_UP_CHARGE_REMINDERS_FOOTER" value:&stru_C5E8 table:0];
  v53 = v23;
  [v23 setProperty:v28 forKey:v13];

  [v3 addObject:v26];
  v29 = +[_HKBehavior sharedBehavior];
  LODWORD(v28) = objc_msgSend(v29, "hksp_activePairedDeviceSupportsFocusMode");

  if (v28)
  {
    v30 = [(NanoBedtimeSettingsViewController *)self _sleepFocusSpecifiers];
    [v3 addObjectsFromArray:v30];
  }
  if (self->_sleepApneaFeatureStatus)
  {
    id v31 = [objc_alloc((Class)HKSHSleepApneaNotificationsBridgeSettingsFactory) initWithFeatureStatus:self->_sleepApneaFeatureStatus];
    v32 = [v31 bridgeSettings];

    if ([v32 settingVisible])
    {
      v33 = [(NanoBedtimeSettingsViewController *)self _sleepApneaGroupSpecifierWithBridgeSettings:v32];
      [v3 addObject:v33];
      unsigned int v34 = [v32 showOnboarding];
      v35 = [v32 footer];
      if (v34) {
        [(NanoBedtimeSettingsViewController *)self _sleepApneaButtonSpecifierWithFooter:v35];
      }
      else {
      v39 = [(NanoBedtimeSettingsViewController *)self _sleepApneaSwitchSpecifierWithFooter:v35];
      }

      v40 = +[NSNumber numberWithBool:[v32 settingEnabled]];
      [v39 setObject:v40 forKeyedSubscript:v52];

      [v3 addObject:v39];
    }
    else
    {
      v37 = HKSPLogForCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v57 = (id)objc_opt_class();
        id v38 = v57;
        _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "[%{public}@] Feature is hidden, not showing sleep apnea section.", buf, 0xCu);
      }
    }
  }
  else
  {
    v32 = HKSPLogForCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v57 = (id)objc_opt_class();
      id v36 = v57;
      _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "[%{public}@] Feature status is nil, not showing sleep apnea section.", buf, 0xCu);
    }
  }

  v41 = +[PSSpecifier preferenceSpecifierNamed:&stru_C5E8 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  [v3 addObject:v41];
  v42 = +[NSBundle bundleForClass:objc_opt_class()];
  v43 = [v42 localizedStringForKey:@"DONT_USE_FOR_SLEEP_TEXT" value:&stru_C5E8 table:0];
  v44 = +[PSConfirmationSpecifier preferenceSpecifierNamed:v43 target:0 set:0 get:0 detail:0 cell:13 edit:0];

  [v44 setProperty:objc_opt_class() forKey:v55];
  v45 = +[NSBundle bundleForClass:objc_opt_class()];
  v46 = [v45 localizedStringForKey:@"CANCEL" value:&stru_C5E8 table:0];
  [v44 setCancelButton:v46];

  v47 = +[NSBundle bundleForClass:objc_opt_class()];
  v48 = [v47 localizedStringForKey:@"TURN_OFF" value:&stru_C5E8 table:0];
  [v44 setTitle:v48];

  v49 = +[NSBundle bundleForClass:objc_opt_class()];
  v50 = [v49 localizedStringForKey:@"DONT_USE_WATCH_FOR_SLEEP_ALERT_TEXT" value:&stru_C5E8 table:0];
  [v44 setPrompt:v50];

  [v44 setObject:&__kCFBooleanTrue forKeyedSubscript:PSConfirmationDestructiveKey];
  [v44 setObject:@"SLEEP_DONT_USE_WATCH_ID" forKeyedSubscript:PSIDKey];
  [v44 setTarget:self];
  [v44 setConfirmationAction:"_didTapDontUseWatch:"];
  [v3 addObject:v44];

  return v3;
}

- (id)_sleepFocusSpecifiers
{
  v3 = objc_opt_new();
  v4 = [(NanoBedtimeSettingsViewController *)self sleepStore];
  unsigned int v5 = [v4 sleepFocusConfiguration];

  objc_super v6 = &HKSHUILocalizedString_ptr;
  id v7 = +[PSSpecifier preferenceSpecifierNamed:&stru_C5E8 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  [v3 addObject:v7];
  unsigned int v8 = [v5 hasSleepFocusMode];
  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = v9;
  if (!v8)
  {
    uint64_t v11 = [v9 localizedStringForKey:@"SET_UP_SLEEP_FOCUS_MODE" value:&stru_C5E8 table:0];

    v20 = "_setUpSleepFocusMode:";
    id v15 = +[NSBundle bundleForClass:objc_opt_class()];
    if ([v5 mirrorsFocusModes]) {
      CFStringRef v21 = @"SET_UP_SLEEP_FOCUS_MODE_FOOTER";
    }
    else {
      CFStringRef v21 = @"SET_UP_SLEEP_FOCUS_MODE_FOOTER_NO_MIRROR";
    }
    uint64_t v13 = [v15 localizedStringForKey:v21 value:&stru_C5E8 table:0];
    goto LABEL_11;
  }
  uint64_t v11 = [v9 localizedStringForKey:@"MANAGE_SLEEP_FOCUS_MODE" value:&stru_C5E8 table:0];

  unsigned int v12 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v13 = [v12 localizedStringForKey:@"MANAGE_SLEEP_FOCUS_MODE_FOOTER" value:&stru_C5E8 table:0];

  id v14 = +[NRPairedDeviceRegistry sharedInstance];
  id v15 = [v14 getActivePairedDevice];

  id v16 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"0E581E21-36BA-4770-9408-0467585E8495"];
  if (![v15 supportsCapability:v16]) {
    goto LABEL_5;
  }
  id v17 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"A97647CC-89CB-4C3C-A144-18371D6DD41F"];
  unsigned __int8 v18 = [v15 supportsCapability:v17];

  objc_super v6 = &HKSHUILocalizedString_ptr;
  if ((v18 & 1) == 0)
  {
    id v16 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v19 = [v16 localizedStringForKey:@"MANAGE_SLEEP_FOCUS_MODE_FOOTER_ELTON_DEVICE" value:&stru_C5E8 table:0];

    uint64_t v13 = (void *)v19;
LABEL_5:
  }
  v20 = "_manageSleepFocusMode:";
LABEL_11:

  v22 = [v6[72] preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v22 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v22 setIdentifier:@"SLEEP_SET_UP_SLEEP_FOCUS_ID"];
  [v22 setButtonAction:v20];
  [v3 addObject:v22];
  [v7 setProperty:v13 forKey:PSFooterTextGroupKey];

  return v3;
}

- (void)_setUpSleepFocusMode:(id)a3
{
  HKSPSleepFocusOnboardingURL();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NanoBedtimeSettingsViewController *)self _openURL:v4];
}

- (void)_manageSleepFocusMode:(id)a3
{
  HKSPSleepFocusConfigurationURL();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NanoBedtimeSettingsViewController *)self _openURL:v4];
}

- (void)_setSleepTrackingEnabled:(id)a3 withSpecifier:(id)a4
{
  id v5 = a3;
  if ([(NanoBedtimeSettingsViewController *)self _isAgeGated]
    && [v5 BOOLValue])
  {
    id v6 = objc_alloc_init((Class)UIAlertController);
    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v8 = [v7 localizedStringForKey:@"SLEEP_TRACKING_AGE_GATING_ALERT_CONFIRM" value:&stru_C5E8 table:0];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_63B0;
    v18[3] = &unk_C358;
    v18[4] = self;
    id v19 = v5;
    v9 = +[UIAlertAction actionWithTitle:v8 style:0 handler:v18];
    [v6 addAction:v9];

    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v11 = [v10 localizedStringForKey:@"SLEEP_TRACKING_AGE_GATING_ALERT_CANCEL" value:&stru_C5E8 table:0];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_63BC;
    v17[3] = &unk_C380;
    v17[4] = self;
    unsigned int v12 = +[UIAlertAction actionWithTitle:v11 style:2 handler:v17];
    [v6 addAction:v12];

    uint64_t v13 = +[NSBundle bundleForClass:objc_opt_class()];
    id v14 = [v13 localizedStringForKey:@"SLEEP_TRACKING_AGE_GATING_ALERT_TITLE" value:&stru_C5E8 table:0];
    [v6 setTitle:v14];

    id v15 = +[NSBundle bundleForClass:objc_opt_class()];
    id v16 = [v15 localizedStringForKey:@"SLEEP_TRACKING_AGE_GATING_ALERT_MESSAGE" value:&stru_C5E8 table:0];
    [v6 setMessage:v16];

    [(NanoBedtimeSettingsViewController *)self presentViewController:v6 animated:1 completion:0];
  }
  else
  {
    [(NanoBedtimeSettingsViewController *)self _enableSleepTracking:v5];
  }
}

- (void)_enableSleepTracking:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_6458;
  v5[3] = &unk_C3A8;
  id v6 = a3;
  id v4 = v6;
  [(NanoBedtimeSettingsViewController *)self _updateSleepSettingsWithBlock:v5];
}

- (id)_sleepTrackingEnabled:(id)a3
{
  if ([(HKWristDetectionSettingManager *)self->_wristDetectManager isWristDetectEnabled])
  {
    id v4 = [(NanoBedtimeSettingsViewController *)self _currentSleepSettings];
    id v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 sleepTracking]);
  }
  else
  {
    id v5 = &__kCFBooleanFalse;
  }

  return v5;
}

- (BOOL)_isAgeGated
{
  id v2 = objc_alloc((Class)NSUserDefaults);
  id v3 = [v2 initWithSuiteName:kHKAgeGatingDomain];
  unsigned __int8 v4 = [v3 BOOLForKey:kHKAgeGatingKeyEnableSleepTracking];

  return v4;
}

- (void)_passcodeSettingsLinkTapped
{
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  id v2 = +[NSURL URLWithString:@"bridge:root=PASSCODE_ID"];
  [v3 openSensitiveURL:v2 withOptions:0];
}

- (void)_manageSettingsLinkTapped
{
  HKSPSleepFocusConfigurationURL();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(NanoBedtimeSettingsViewController *)self _openURL:v3];
}

- (void)_setWatchChargeReminder:(id)a3 withSpecifier:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_672C;
  v7[3] = &unk_C3A8;
  id v5 = a3;
  id v8 = v5;
  [(NanoBedtimeSettingsViewController *)self _updateSleepSettingsWithBlock:v7];
  if ([v5 BOOLValue])
  {
    id v6 = HKSHUILocalizedString();
    [(NanoBedtimeSettingsViewController *)self _presentNotificationsWontFireAlertIfNeededWithTitle:v6];
  }
}

- (id)_watchChargeReminder:(id)a3
{
  id v3 = [(NanoBedtimeSettingsViewController *)self _currentSleepSettings];
  unsigned __int8 v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 chargingReminders]);

  return v4;
}

- (BOOL)_useWatch
{
  id v2 = [(NanoBedtimeSettingsViewController *)self _currentSleepSettings];
  unsigned __int8 v3 = [v2 watchSleepFeaturesEnabled];

  return v3;
}

- (void)_didTapDontUseWatch:(id)a3
{
  [(NanoBedtimeSettingsViewController *)self _updateSleepSettingsWithBlock:&stru_C3E8];

  [(NanoBedtimeSettingsViewController *)self reloadSpecifiers];
}

- (void)_didTapUseWatch:(id)a3
{
  [(NanoBedtimeSettingsViewController *)self _updateSleepSettingsWithBlock:&stru_C408];

  [(NanoBedtimeSettingsViewController *)self reloadSpecifiers];
}

- (void)_setUpSleep:(id)a3
{
  id v6 = [(NanoBedtimeSettingsViewController *)self _currentSleepEventRecord];
  if ([v6 isCurrentSleepCoachingOnboardingCompleted]
    && ![v6 isCurrentSleepTrackingOnboardingCompleted])
  {
    unsigned __int8 v4 = (id *)&HKSPSleepLaunchURLRouteOnboardSleepTracking;
  }
  else
  {
    unsigned __int8 v4 = (id *)&HKSPSleepLaunchURLRouteOnboardSleepCoaching;
  }
  id v5 = *v4;
  [(NanoBedtimeSettingsViewController *)self _openSleepURLForRoute:v5];
}

- (void)_showSleepOptionsInHealth:(id)a3
{
}

- (void)_presentNotificationsWontFireAlertIfNeededWithTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(NanoBedtimeSettingsViewController *)self notificationCenter];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6A04;
  v7[3] = &unk_C458;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [v5 getNotificationSettingsWithCompletionHandler:v7];
}

- (void)_openSleepURLForRoute:(id)a3
{
  HKSPSleepURL();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NanoBedtimeSettingsViewController *)self _openURL:v4];
}

- (void)_openURL:(id)a3
{
  id v3 = a3;
  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (id)_currentSleepSchedule
{
  sleepStore = self->_sleepStore;
  id v9 = 0;
  id v3 = [(HKSPSleepStore *)sleepStore currentSleepScheduleWithError:&v9];
  id v4 = v9;
  if (v4)
  {
    id v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = v4;
      id v8 = v7;
      _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "[%{public}@] failed to get sleep schedule with error %{public}@", buf, 0x16u);
    }
  }

  return v3;
}

- (id)_currentSleepSettings
{
  sleepStore = self->_sleepStore;
  id v9 = 0;
  id v3 = [(HKSPSleepStore *)sleepStore currentSleepSettingsWithError:&v9];
  id v4 = v9;
  if (!v3)
  {
    id v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = v4;
      id v8 = v7;
      _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "[%{public}@] failed to get sleep settings with error %{public}@", buf, 0x16u);
    }
  }

  return v3;
}

- (id)_currentSleepEventRecord
{
  sleepStore = self->_sleepStore;
  id v9 = 0;
  id v3 = [(HKSPSleepStore *)sleepStore currentSleepEventRecordWithError:&v9];
  id v4 = v9;
  if (!v3)
  {
    id v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = v4;
      id v8 = v7;
      _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "[%{public}@] failed to get sleep event record with error %{public}@", buf, 0x16u);
    }
  }

  return v3;
}

- (void)_updateSleepSettingsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HKSPSleepStore *)self->_sleepStore currentSleepSettingsFuture];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_7048;
  v8[3] = &unk_C480;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 addCompletionBlock:v8];
}

- (BOOL)_hasWindDown
{
  id v2 = [(NanoBedtimeSettingsViewController *)self _currentSleepSchedule];
  [v2 windDownTime];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (BOOL)_shouldShowSleepApneaNotificationsSettings
{
  id v2 = [(HKFeatureStatus *)self->_sleepApneaFeatureStatus objectForKeyedSubscript:HKFeatureAvailabilityContextSettingsVisibility];
  unsigned __int8 v3 = [v2 areAllRequirementsSatisfied];

  return v3;
}

- (BOOL)_areSleepApneaNotificationsEnabled
{
  sleepApneaFeatureStatus = self->_sleepApneaFeatureStatus;
  if (sleepApneaFeatureStatus)
  {
    unsigned __int8 v3 = [(HKFeatureStatus *)sleepApneaFeatureStatus onboardingRecord];
    BOOL v4 = [v3 featureSettings];
    id v5 = [v4 numberForKey:HKFeatureSettingsKeyEnabled];

    LOBYTE(v3) = [v5 BOOLValue];
    LOBYTE(sleepApneaFeatureStatus) = (_BYTE)v3;
  }
  return (char)sleepApneaFeatureStatus;
}

- (id)_areSleepApneaNotificationsEnabled:(id)a3
{
  BOOL v3 = [(NanoBedtimeSettingsViewController *)self _areSleepApneaNotificationsEnabled];

  return +[NSNumber numberWithBool:v3];
}

- (BOOL)_areSleepApneaNotificationsRescinded
{
  sleepApneaFeatureStatus = self->_sleepApneaFeatureStatus;
  if (sleepApneaFeatureStatus)
  {
    BOOL v3 = [(HKFeatureStatus *)sleepApneaFeatureStatus objectForKeyedSubscript:HKFeatureAvailabilityContextSettingsUserInteractionEnabled];
    unsigned int v4 = [v3 areAllRequirementsSatisfied] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)_sleepApneaNotificationsToggledTapped:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(HKFeatureStatusManager *)self->_sleepApneaNotificationsFeatureStatusManager featureAvailabilityProviding];
  uint64_t v7 = HKFeatureSettingsKeyEnabled;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_73E8;
  v9[3] = &unk_C4A8;
  id v10 = v5;
  id v8 = v5;
  [v6 setFeatureSettingNumber:v8 forKey:v7 completion:v9];
}

- (void)_didTapSetUpNotificationsInHealth:(id)a3
{
}

- (void)_didTapSleepApneaFooter
{
  BOOL v3 = [(NanoBedtimeSettingsViewController *)self sleepApneaFooterURL];

  if (v3)
  {
    id v4 = objc_alloc((Class)NSURL);
    id v6 = [(NanoBedtimeSettingsViewController *)self sleepApneaFooterURL];
    id v5 = [v4 initWithString:v6];
    [(NanoBedtimeSettingsViewController *)self _openURL:v5];
  }
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  id v5 = (HKFeatureStatus *)a4;
  id v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = (id)objc_opt_class();
    id v7 = v10;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Feature status did change", (uint8_t *)&v9, 0xCu);
  }
  sleepApneaFeatureStatus = self->_sleepApneaFeatureStatus;
  self->_sleepApneaFeatureStatus = v5;

  [(NanoBedtimeSettingsViewController *)self reloadSpecifiers];
}

- (id)_sleepApneaGroupSpecifierWithBridgeSettings:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"SLEEP_APNEA_GROUP_SPECIFIER_NAME" value:&stru_C5E8 table:@"Localizable-Nebula"];
  id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:0 set:0 get:0 detail:0 cell:0 edit:0];

  id v8 = [v4 footer];

  int v9 = [v8 footerText];
  id v10 = [v8 footerLink];

  if (v10)
  {
    uint64_t v11 = [v8 linkURL];
    [(NanoBedtimeSettingsViewController *)self setSleepApneaFooterURL:v11];

    [v7 setObject:v9 forKeyedSubscript:PSFooterHyperlinkViewTitleKey];
    __int16 v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v7 setObject:v13 forKeyedSubscript:PSFooterCellClassGroupKey];

    id v14 = [v8 footerLink];
    v20.location = (NSUInteger)[v9 rangeOfString:v14];
    id v15 = NSStringFromRange(v20);
    [v7 setObject:v15 forKeyedSubscript:PSFooterHyperlinkViewLinkRangeKey];

    id v16 = NSStringFromSelector("_didTapSleepApneaFooter");
    [v7 setObject:v16 forKeyedSubscript:PSFooterHyperlinkViewActionKey];

    id v17 = +[NSValue valueWithNonretainedObject:self];
    [v7 setObject:v17 forKeyedSubscript:PSFooterHyperlinkViewTargetKey];
  }
  else
  {
    [v7 setProperty:v9 forKey:PSFooterTextGroupKey];
  }
  [v7 setProperty:objc_opt_class() forKey:PSCellClassKey];

  return v7;
}

- (id)_sleepApneaSwitchSpecifierWithFooter:(id)a3
{
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"SLEEP_APNEA_SWITCH_LABEL" value:&stru_C5E8 table:@"Localizable-Nebula"];
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:"_sleepApneaNotificationsToggledTapped:specifier:" get:"_areSleepApneaNotificationsEnabled:" detail:0 cell:6 edit:0];

  [v6 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];

  return v6;
}

- (id)_sleepApneaButtonSpecifierWithFooter:(id)a3
{
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"SLEEP_APNEA_SET_UP_IN_HEALTH" value:&stru_C5E8 table:@"Localizable-Nebula"];
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v6 setButtonAction:"_didTapSetUpNotificationsInHealth:"];

  return v6;
}

- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4
{
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = (id)objc_opt_class();
    id v6 = v8;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sleep settings did change externally", (uint8_t *)&v7, 0xCu);
  }
  [(NanoBedtimeSettingsViewController *)self reloadSpecifiers];
}

- (void)sleepStore:(id)a3 sleepFocusModeConfigurationDidUpdate:(id)a4
{
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = (id)objc_opt_class();
    id v6 = v8;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sleep focus mode did update", (uint8_t *)&v7, 0xCu);
  }
  [(NanoBedtimeSettingsViewController *)self reloadSpecifiers];
}

- (void)sleepStore:(id)a3 sleepEventRecordDidChange:(id)a4
{
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = (id)objc_opt_class();
    id v6 = v8;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sleep event record did change externally", (uint8_t *)&v7, 0xCu);
  }
  [(NanoBedtimeSettingsViewController *)self reloadSpecifiers];
}

- (void)currentTraitCollectionDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  id v6 = a3;
  int v7 = [a4 preferredContentSizeCategory];
  id v8 = [v6 traitCollection];

  int v9 = [v8 preferredContentSizeCategory];

  if (v7 != v9)
  {
    [(NanoBedtimeSettingsViewController *)self reloadSpecifiers];
  }
}

- (void)wristDetectionSettingManagerDidObserveWristDetectChange:(id)a3
{
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v5 = v7;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] wrist detect settings did change", (uint8_t *)&v6, 0xCu);
  }
  [(NanoBedtimeSettingsViewController *)self reloadSpecifiers];
}

- (HKSPSleepStore)sleepStore
{
  return self->_sleepStore;
}

- (HKWristDetectionSettingManager)wristDetectManager
{
  return self->_wristDetectManager;
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (HKFeatureStatusManager)sleepApneaNotificationsFeatureStatusManager
{
  return self->_sleepApneaNotificationsFeatureStatusManager;
}

- (HKFeatureStatus)sleepApneaFeatureStatus
{
  return self->_sleepApneaFeatureStatus;
}

- (NSString)sleepApneaFooterURL
{
  return self->_sleepApneaFooterURL;
}

- (void)setSleepApneaFooterURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepApneaFooterURL, 0);
  objc_storeStrong((id *)&self->_sleepApneaFeatureStatus, 0);
  objc_storeStrong((id *)&self->_sleepApneaNotificationsFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_wristDetectManager, 0);

  objc_storeStrong((id *)&self->_sleepStore, 0);
}

@end