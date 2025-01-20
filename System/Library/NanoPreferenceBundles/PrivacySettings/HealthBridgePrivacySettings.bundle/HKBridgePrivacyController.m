@interface HKBridgePrivacyController
+ (BOOL)shouldShowSmartStackPrivacySwitch;
- (BOOL)_doesDeviceSupportOxygenSaturationRecording;
- (BOOL)_hasOxygenSaturationRecordingBeenOnboarded;
- (BOOL)_isOxygenSaturationRecordingRemoteDisabled;
- (BOOL)_isRespiratoryRateEnabled;
- (BOOL)_isRespiratoryRateRescinded;
- (BOOL)_isWristTemperatureEnabledWithFeatureStatus:(id)a3;
- (BOOL)_isWristTemperatureRescindedWithFeatureStatus:(id)a3;
- (BOOL)_shouldShowOxygenSaturationSection;
- (BOOL)_shouldShowRespiratoryRateSection;
- (BOOL)_shouldShowWristTemperatureSectionWithFeatureStatus:(id)a3;
- (BOOL)hasRegisteredObservers;
- (HKBridgePrivacyController)init;
- (HKFeatureAvailabilityStore)oxygenSaturationFeatureAvailabilityStore;
- (HKFeatureStatusManager)respiratoryRateStatusManager;
- (HKFeatureStatusManager)wristTemperatureStatusManager;
- (HKRPOxygenSaturationSettings)oxygenSaturationSettings;
- (id)_footerTextForGroupID:(id)a3;
- (id)_wristTemperatureGroupSpecifierWithFeatureStatus:(id)a3;
- (id)_wristTemperatureSpecifiers;
- (id)_wristTemperatureSwitchSpecifierWithFeatureStatus:(id)a3;
- (id)fitnessTrackingEnabled:(id)a3;
- (id)heartRateEnabled:(id)a3;
- (id)oxygenSaturationEnabled:(id)a3;
- (id)respiratoryRateEnabled:(id)a3;
- (id)smartStackAudioEnabled:(id)a3;
- (id)specifiers;
- (id)wristTemperatureEnabled:(id)a3;
- (void)_didTapRespiratoryRateRescindedLearnMore;
- (void)_didTapWristTemperatureRescindedLearnMore;
- (void)_registerObservers;
- (void)_unregisterObservers;
- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3;
- (void)featureAvailabilityProvidingDidUpdatePairedDeviceCapability:(id)a3;
- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4;
- (void)oxygenSaturationSettingsDidChange:(id)a3;
- (void)privacyDefaultsDidChange;
- (void)resetMotionCalibrationConfirmed:(id)a3;
- (void)setFitnessTrackingEnabled:(id)a3 specifier:(id)a4;
- (void)setHasRegisteredObservers:(BOOL)a3;
- (void)setHeartRateEnabled:(id)a3 specifier:(id)a4;
- (void)setNoiseEnabled:(id)a3 specifier:(id)a4;
- (void)setOxygenSaturationEnabled:(id)a3 specifier:(id)a4;
- (void)setRespiratoryRateEnabled:(id)a3 specifier:(id)a4;
- (void)setSmartStackAudioEnabled:(id)a3 specifier:(id)a4;
- (void)setWristTemperatureEnabled:(id)a3 specifier:(id)a4;
- (void)showSettingsPrivacyPane;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HKBridgePrivacyController

- (HKBridgePrivacyController)init
{
  v19.receiver = self;
  v19.super_class = (Class)HKBridgePrivacyController;
  v2 = [(HKBridgePrivacyController *)&v19 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)HKHealthStore);
    id v4 = [objc_alloc((Class)FIUIUnitManager) initWithHealthStore:v3];
    v5 = (FIUIFormattingManager *)[objc_alloc((Class)FIUIFormattingManager) initWithUnitManager:v4];
    formattingManager = v2->_formattingManager;
    v2->_formattingManager = v5;

    v2->_activityMoveMode = FIActivityMoveModeWithHealthStore();
    uint64_t v7 = +[HKRPOxygenSaturationSettings standardSettings];
    oxygenSaturationSettings = v2->_oxygenSaturationSettings;
    v2->_oxygenSaturationSettings = (HKRPOxygenSaturationSettings *)v7;

    id v9 = objc_alloc((Class)HKFeatureAvailabilityStore);
    v10 = (HKFeatureAvailabilityStore *)[v9 initWithFeatureIdentifier:HKFeatureIdentifierOxygenSaturationRecording healthStore:v3];
    oxygenSaturationFeatureAvailabilityStore = v2->_oxygenSaturationFeatureAvailabilityStore;
    v2->_oxygenSaturationFeatureAvailabilityStore = v10;

    id v12 = objc_alloc((Class)HKFeatureStatusManager);
    v13 = (HKFeatureStatusManager *)[v12 initWithFeatureIdentifier:HKFeatureIdentifierRespiratoryRateMeasurements healthStore:v3];
    respiratoryRateStatusManager = v2->_respiratoryRateStatusManager;
    v2->_respiratoryRateStatusManager = v13;

    id v15 = objc_alloc((Class)HKFeatureStatusManager);
    v16 = (HKFeatureStatusManager *)[v15 initWithFeatureIdentifier:HKFeatureIdentifierSleepingWristTemperatureMeasurements healthStore:v3];
    wristTemperatureStatusManager = v2->_wristTemperatureStatusManager;
    v2->_wristTemperatureStatusManager = v16;
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKBridgePrivacyController;
  [(HKBridgePrivacyController *)&v4 viewWillAppear:a3];
  [(HKBridgePrivacyController *)self _registerObservers];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(HKBridgePrivacyController *)self _unregisterObservers];
  v5.receiver = self;
  v5.super_class = (Class)HKBridgePrivacyController;
  [(HKBridgePrivacyController *)&v5 viewDidDisappear:v3];
}

- (void)_registerObservers
{
  if (![(HKBridgePrivacyController *)self hasRegisteredObservers])
  {
    if ([(HKBridgePrivacyController *)self _doesDeviceSupportOxygenSaturationRecording])
    {
      [(HKFeatureAvailabilityStore *)self->_oxygenSaturationFeatureAvailabilityStore registerObserver:self queue:&_dispatch_main_q];
      [(HKRPOxygenSaturationSettings *)self->_oxygenSaturationSettings addObserver:self queue:&_dispatch_main_q];
    }
    [(HKFeatureStatusManager *)self->_respiratoryRateStatusManager registerObserver:self queue:&_dispatch_main_q];
    [(HKFeatureStatusManager *)self->_wristTemperatureStatusManager registerObserver:self queue:&_dispatch_main_q];

    BOOL v3 = +[NHSSPrivacyDefaults sharedInstance];
    [v3 addObserver:self];

    [(HKBridgePrivacyController *)self setHasRegisteredObservers:1];
  }
}

- (void)_unregisterObservers
{
  if ([(HKBridgePrivacyController *)self hasRegisteredObservers])
  {
    [(HKFeatureAvailabilityStore *)self->_oxygenSaturationFeatureAvailabilityStore unregisterObserver:self];
    [(HKRPOxygenSaturationSettings *)self->_oxygenSaturationSettings removeObserver:self];
    [(HKFeatureStatusManager *)self->_respiratoryRateStatusManager unregisterObserver:self];
    [(HKFeatureStatusManager *)self->_wristTemperatureStatusManager unregisterObserver:self];
    BOOL v3 = +[NHSSPrivacyDefaults sharedInstance];
    [v3 removeObserver:self];

    [(HKBridgePrivacyController *)self setHasRegisteredObservers:0];
  }
}

- (id)_footerTextForGroupID:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"HEART_RATE_ENABLED_GROUP_ID"])
  {
    unsigned int v5 = +[HKHeartRhythmAvailability isElectrocardiogramSupportedOnAnyWatch];
    v6 = @"HEART_RATE_ENABLED_FOOTER";
    if (v5) {
      v6 = @"HEART_RATE_ENABLED_FOOTER_ECG";
    }
    int64_t activityMoveMode = self->_activityMoveMode;
    v8 = v6;
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    formattingManager = self->_formattingManager;
    if (activityMoveMode == 2) {
      [(FIUIFormattingManager *)formattingManager localizationKeyForMoveMinutesBaseKey:v8];
    }
    else {
    v13 = [(FIUIFormattingManager *)formattingManager localizationKeyForEnergyBaseKey:v8];
    }

    v14 = [v9 localizedStringForKey:v13 value:&stru_C3E8 table:@"Privacy"];

    goto LABEL_20;
  }
  if ([v4 isEqualToString:@"ENVIRONMENTAL_AUDIO_ENABLED_GROUP_ID"])
  {
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = v11;
    CFStringRef v12 = @"ENVIRONMENTAL_AUDIO_ENABLED_FOOTER";
LABEL_18:
    uint64_t v15 = [v11 localizedStringForKey:v12 value:&stru_C3E8 table:@"Privacy"];
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"SMART_STACK_AUDIO_ENABLED_GROUP_ID"])
  {
    id v9 = +[NHSSPrivacyDefaults sharedInstance];
    uint64_t v15 = [v9 localizedMicrophonePermissionSwitchFootnote];
LABEL_19:
    v14 = (void *)v15;
LABEL_20:

    goto LABEL_21;
  }
  if ([v4 isEqualToString:@"FITNESS_TRACKING_ENABLED_GROUP_ID"])
  {
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = v11;
    CFStringRef v12 = @"FITNESS_TRACKING_ENABLED_FOOTER";
    goto LABEL_18;
  }
  if ([v4 isEqualToString:@"OXYGEN_SATURATION_ENABLED_GROUP_ID"])
  {
    v14 = [(HKRPOxygenSaturationSettings *)self->_oxygenSaturationSettings aboutBloodOxygenFooter];
    goto LABEL_21;
  }
  if ([v4 isEqualToString:@"TIME_IN_DAYLIGHT_ENABLED_GROUP_ID"])
  {
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = v11;
    CFStringRef v12 = @"TIME_IN_DAYLIGHT_ENABLED_FOOTER";
    goto LABEL_18;
  }
  v14 = 0;
LABEL_21:

  return v14;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    unsigned int v5 = [(HKBridgePrivacyController *)self loadSpecifiersFromPlistName:@"Privacy" target:self];
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v86 objects:v93 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v87;
      uint64_t v9 = PSFooterTextGroupKey;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v87 != v8) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v86 + 1) + 8 * i);
          CFStringRef v12 = [v11 identifier];
          v13 = [(HKBridgePrivacyController *)self _footerTextForGroupID:v12];
          [v11 setProperty:v13 forKey:v9];
        }
        id v7 = [v5 countByEnumeratingWithState:&v86 objects:v93 count:16];
      }
      while (v7);
    }
    v14 = [v5 specifierForID:@"OXYGEN_SATURATION_ENABLED_SWITCH_ID"];
    uint64_t v15 = (char *)[v5 indexOfObject:v14];

    v16 = [(HKBridgePrivacyController *)self _wristTemperatureSpecifiers];
    v17 = v16;
    if (v15 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      [v5 addObjectsFromArray:v16];
    }
    else if ([v16 count])
    {
      unint64_t v18 = 0;
      do
      {
        objc_super v19 = [v17 objectAtIndexedSubscript:v18];
        [v5 insertObject:v19 atIndex:&v15[v18 + 1]];

        ++v18;
      }
      while (v18 < (unint64_t)[v17 count]);
    }

    v20 = +[PSSpecifier groupSpecifierWithID:@"PRIVACY_SETTINGS"];
    v21 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v22 = [v21 localizedStringForKey:@"PRIVACY_SETTINGS" value:&stru_C3E8 table:@"Privacy"];

    v23 = +[NSBundle bundleForClass:objc_opt_class()];
    v24 = [v23 localizedStringForKey:@"SHARED_SETTINGS_DESCRIPTION" value:&stru_C3E8 table:@"Privacy"];

    v85 = (void *)v22;
    id v25 = [v24 rangeOfString:v22 options:5];
    NSUInteger v27 = v26;
    v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    uint64_t v82 = PSFooterCellClassGroupKey;
    objc_msgSend(v20, "setProperty:forKey:", v29);

    v84 = v24;
    uint64_t v80 = PSFooterHyperlinkViewTitleKey;
    objc_msgSend(v20, "setProperty:forKey:", v24);
    v95.location = (NSUInteger)v25;
    v95.length = v27;
    v30 = NSStringFromRange(v95);
    uint64_t v83 = PSFooterHyperlinkViewLinkRangeKey;
    objc_msgSend(v20, "setProperty:forKey:", v30);

    v31 = +[NSValue valueWithNonretainedObject:self];
    uint64_t v81 = PSFooterHyperlinkViewTargetKey;
    objc_msgSend(v20, "setProperty:forKey:", v31);

    uint64_t v32 = NSStringFromSelector("showSettingsPrivacyPane");
    uint64_t v79 = PSFooterHyperlinkViewActionKey;
    objc_msgSend(v20, "setProperty:forKey:", v32);

    [v5 insertObject:v20 atIndex:0];
    v33 = +[BPSBridgeAppContext shared];
    v34 = [v33 activeDevice];
    LOBYTE(v32) = BPSDeviceHasCapabilityForString();

    if (v32)
    {
      v35 = [v5 specifierForID:@"ENVIRONMENTAL_AUDIO_ENABLED_SWITCH_ID"];
      [v35 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    }
    else
    {
      v35 = [v5 specifierForID:@"ENVIRONMENTAL_AUDIO_ENABLED_GROUP_ID"];
      v36 = [v5 specifierForID:@"ENVIRONMENTAL_AUDIO_ENABLED_SWITCH_ID"];
      v37 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v35, v36, 0);
      [v5 removeObjectsInArray:v37];
    }
    if ([(id)objc_opt_class() shouldShowSmartStackPrivacySwitch])
    {
      v38 = [v5 specifierForID:@"SMART_STACK_AUDIO_ENABLED_SWITCH_ID"];
      v39 = +[NHSSPrivacyDefaults sharedInstance];
      v40 = [v39 localizedMicrophonePermissionSwitchName];
      [v38 setName:v40];

      [v38 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    }
    else
    {
      v38 = [v5 specifierForID:@"SMART_STACK_AUDIO_ENABLED_GROUP_ID"];
      v41 = [v5 specifierForID:@"SMART_STACK_AUDIO_ENABLED_SWITCH_ID"];
      v42 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v38, v41, 0);
      [v5 removeObjectsInArray:v42];
    }
    v43 = +[BPSBridgeAppContext shared];
    v44 = [v43 activeDevice];
    char HasCapabilityForString = BPSDeviceHasCapabilityForString();

    if (HasCapabilityForString)
    {
      v46 = [v5 specifierForID:@"HeadphoneAudio"];
      [v46 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    }
    else
    {
      id v47 = [v5 specifierForID:@"HEADPHONE_AUDIO_MEASUREMENTS_GROUP_ID"];
      v46 = [v5 specifierForID:@"HeadphoneAudio"];
      [v5 removeObject:v46];
    }

    if ([(HKBridgePrivacyController *)self _shouldShowOxygenSaturationSection])
    {
      v48 = [v5 specifierForID:@"OXYGEN_SATURATION_ENABLED_SWITCH_ID"];
      v49 = [(HKRPOxygenSaturationSettings *)self->_oxygenSaturationSettings backgroundRecordingsTitle];
      [v48 setName:v49];

      [v48 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    }
    else
    {
      v48 = [v5 specifierForID:@"OXYGEN_SATURATION_ENABLED_GROUP_ID"];
      v92[0] = v48;
      v50 = [v5 specifierForID:@"OXYGEN_SATURATION_ENABLED_SWITCH_ID"];
      v92[1] = v50;
      v51 = +[NSArray arrayWithObjects:v92 count:2];
      [v5 removeObjectsInArray:v51];
    }
    v52 = +[BPSBridgeAppContext shared];
    v53 = [v52 activeDevice];
    char v54 = BPSDeviceHasCapabilityForString();

    if (v54)
    {
      v55 = [v5 specifierForID:@"TIME_IN_DAYLIGHT_ENABLED_SWITCH_ID"];
      [v55 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    }
    else
    {
      v55 = [v5 specifierForID:@"TIME_IN_DAYLIGHT_ENABLED_GROUP_ID"];
      v91[0] = v55;
      v56 = [v5 specifierForID:@"TIME_IN_DAYLIGHT_ENABLED_SWITCH_ID"];
      v91[1] = v56;
      v57 = +[NSArray arrayWithObjects:v91 count:2];
      [v5 removeObjectsInArray:v57];
    }
    v58 = [v5 specifierForID:@"RESPIRATORY_RATE_GROUP_ID"];
    v59 = [v5 specifierForID:@"RESPIRATORY_RATE_LABEL"];
    if ([(HKBridgePrivacyController *)self _shouldShowRespiratoryRateSection])
    {
      unsigned int v60 = [(HKBridgePrivacyController *)self _isRespiratoryRateRescinded];
      char v61 = v60;
      v62 = +[NSNumber numberWithBool:v60 ^ 1];
      [v59 setProperty:v62 forKey:PSEnabledKey];

      v63 = +[NSBundle bundleForClass:objc_opt_class()];
      v64 = v63;
      if (v61)
      {
        uint64_t v77 = [v63 localizedStringForKey:@"RESPIRATORY_RATE_RESCINDED_FOOTER_LEARN_MORE" value:&stru_C3E8 table:@"Privacy"];

        uint64_t v78 = v3;
        v65 = +[NSBundle bundleForClass:objc_opt_class()];
        v66 = [v65 localizedStringForKey:@"RESPIRATORY_RATE_RESCINDED_FOOTER_FORMAT" value:&stru_C3E8 table:@"Privacy"];
        v67 = +[NSBundle bundleForClass:objc_opt_class()];
        v68 = [v67 localizedStringForKey:@"RESPIRATORY_RATE_RESCINDED_FOOTER_TEXT" value:&stru_C3E8 table:@"Privacy"];
        v69 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v66, v68, v77);

        uint64_t v3 = v78;
        v70 = (objc_class *)objc_opt_class();
        v71 = NSStringFromClass(v70);
        [v58 setObject:v71 forKeyedSubscript:v82];

        [v58 setObject:v69 forKeyedSubscript:v80];
        v96.location = (NSUInteger)[v69 rangeOfString:v77];
        v72 = NSStringFromRange(v96);
        [v58 setObject:v72 forKeyedSubscript:v83];

        v73 = +[NSValue valueWithNonretainedObject:self];
        [v58 setObject:v73 forKeyedSubscript:v81];

        [v58 setObject:@"_didTapRespiratoryRateRescindedLearnMore" forKeyedSubscript:v79];
        v64 = (void *)v77;
      }
      else
      {
        v74 = [v63 localizedStringForKey:@"RESPIRATORY_RATE_FOOTER" value:&stru_C3E8 table:@"Privacy"];
        [v58 setObject:v74 forKeyedSubscript:PSFooterTextGroupKey];
      }
    }
    else
    {
      v90[0] = v58;
      v90[1] = v59;
      v64 = +[NSArray arrayWithObjects:v90 count:2];
      [v5 removeObjectsInArray:v64];
    }

    v75 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    id v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)showSettingsPrivacyPane
{
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  v2 = +[NSURL URLWithString:@"prefs:root=Privacy"];
  [v3 openSensitiveURL:v2 withOptions:0];
}

- (void)resetMotionCalibrationConfirmed:(id)a3
{
  id v7 = 0;
  unsigned __int8 v3 = +[CMNatalimeter resetCalibrationDataWithError:&v7];
  id v4 = v7;
  _HKInitializeLogging();
  unsigned int v5 = HKLogDefault;
  if (v3)
  {
    if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[Fitness] Reset motion calibration data", v6, 2u);
    }
  }
  else if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR))
  {
    sub_8890((uint64_t)v4, v5);
  }
}

- (id)fitnessTrackingEnabled:(id)a3
{
  uint64_t v3 = FIIsFitnessTrackingEnabled();

  return +[NSNumber numberWithBool:v3];
}

- (void)setFitnessTrackingEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  _FISetFitnessTrackingEnabled(v4);
}

- (id)heartRateEnabled:(id)a3
{
  uint64_t v3 = FIUIIsHeartRateEnabled();

  return +[NSNumber numberWithBool:v3];
}

- (void)setHeartRateEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  _FIUISetHeartRateEnabled(v4);
}

- (id)respiratoryRateEnabled:(id)a3
{
  BOOL v3 = [(HKBridgePrivacyController *)self _isRespiratoryRateEnabled];

  return +[NSNumber numberWithBool:v3];
}

- (void)setRespiratoryRateEnabled:(id)a3 specifier:(id)a4
{
  respiratoryRateStatusManager = self->_respiratoryRateStatusManager;
  id v5 = a3;
  id v6 = [(HKFeatureStatusManager *)respiratoryRateStatusManager featureAvailabilityProviding];
  [v6 setFeatureSettingNumber:v5 forKey:HKFeatureSettingsKeyEnabled completion:&stru_C388];
}

- (void)setNoiseEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[HUNoiseSettings sharedInstance];
  [v5 setNoiseEnabled:v4];

  id v6 = +[HUNoiseSettings sharedInstance];
  unsigned int v7 = [v6 onboardingCompleted];

  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v4 == 0;
  }
  if (!v8)
  {
    uint64_t v9 = +[HUNoiseSettings sharedInstance];
    [v9 setOnboardingCompleted:1];

    id v10 = +[HUNoiseSettings sharedInstance];
    [v10 setNotificationsEnabled:1];
  }
}

- (void)setSmartStackAudioEnabled:(id)a3 specifier:(id)a4
{
  unsigned int v4 = [a3 BOOLValue];
  id v5 = +[NHSSPrivacyDefaults sharedInstance];
  id v7 = v5;
  if (v4) {
    uint64_t v6 = 1735552628;
  }
  else {
    uint64_t v6 = 1684369017;
  }
  [v5 setMicrophonePermission:v6];
}

- (id)smartStackAudioEnabled:(id)a3
{
  BOOL v3 = +[NHSSPrivacyDefaults sharedInstance];
  id v4 = [v3 microphonePermission];
  id v5 = &off_CB18;
  if (v4 == (id)1735552628) {
    id v5 = &off_CB00;
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)wristTemperatureEnabled:(id)a3
{
  id v4 = [(HKFeatureStatusManager *)self->_wristTemperatureStatusManager featureStatusWithError:0];
  if (v4)
  {
    id v5 = +[NSNumber numberWithBool:[(HKBridgePrivacyController *)self _isWristTemperatureEnabledWithFeatureStatus:v4]];
  }
  else
  {
    id v5 = &__kCFBooleanFalse;
  }

  return v5;
}

- (void)setWristTemperatureEnabled:(id)a3 specifier:(id)a4
{
  wristTemperatureStatusManager = self->_wristTemperatureStatusManager;
  id v5 = a3;
  id v6 = [(HKFeatureStatusManager *)wristTemperatureStatusManager featureAvailabilityProviding];
  [v6 setFeatureSettingNumber:v5 forKey:HKFeatureSettingsKeyEnabled completion:&stru_C3A8];
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
}

- (void)featureAvailabilityProvidingDidUpdatePairedDeviceCapability:(id)a3
{
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
}

- (void)oxygenSaturationSettingsDidChange:(id)a3
{
}

- (id)oxygenSaturationEnabled:(id)a3
{
  BOOL v4 = ([(HKRPOxygenSaturationSettings *)self->_oxygenSaturationSettings oxygenSaturationDisabled] & 1) == 0&& [(HKBridgePrivacyController *)self _hasOxygenSaturationRecordingBeenOnboarded];

  return +[NSNumber numberWithInt:v4];
}

- (void)setOxygenSaturationEnabled:(id)a3 specifier:(id)a4
{
  id v5 = [a3 BOOLValue];
  [(HKRPOxygenSaturationSettings *)self->_oxygenSaturationSettings setOxygenSaturationDisabled:v5 ^ 1];
  oxygenSaturationSettings = self->_oxygenSaturationSettings;

  [(HKRPOxygenSaturationSettings *)oxygenSaturationSettings setBackgroundRecordingsEnabled:v5];
}

- (BOOL)_shouldShowOxygenSaturationSection
{
  BOOL v3 = [(HKBridgePrivacyController *)self _doesDeviceSupportOxygenSaturationRecording];
  if (v3)
  {
    BOOL v3 = [(HKBridgePrivacyController *)self _hasOxygenSaturationRecordingBeenOnboarded];
    if (v3) {
      LOBYTE(v3) = ![(HKBridgePrivacyController *)self _isOxygenSaturationRecordingRemoteDisabled];
    }
  }
  return v3;
}

- (BOOL)_doesDeviceSupportOxygenSaturationRecording
{
  int v2 = HKFeatureFlagBloodOxygenSaturationEnabled();
  if (v2)
  {
    if (HKRPShouldSkipHardwareCheck())
    {
      LOBYTE(v2) = 1;
    }
    else
    {
      BOOL v3 = +[BPSBridgeAppContext shared];
      BOOL v4 = [v3 activeDevice];
      char HasCapabilityForString = BPSDeviceHasCapabilityForString();

      LOBYTE(v2) = HasCapabilityForString;
    }
  }
  return v2;
}

- (BOOL)_hasOxygenSaturationRecordingBeenOnboarded
{
  int v2 = [(HKFeatureAvailabilityStore *)self->_oxygenSaturationFeatureAvailabilityStore isCurrentOnboardingVersionCompletedWithError:0];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)_isOxygenSaturationRecordingRemoteDisabled
{
  return [(HKFeatureAvailabilityStore *)self->_oxygenSaturationFeatureAvailabilityStore hk_isRescindedDisabled];
}

- (BOOL)_shouldShowRespiratoryRateSection
{
  respiratoryRateStatusManager = self->_respiratoryRateStatusManager;
  id v13 = 0;
  unsigned __int8 v3 = [(HKFeatureStatusManager *)respiratoryRateStatusManager featureStatusWithError:&v13];
  id v4 = v13;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:HKFeatureAvailabilityContextUsage];
    id v6 = [v5 objectForKeyedSubscript:HKFeatureAvailabilityRequirementIdentifierCapabilityIsSupportedOnActiveRemoteDevice];
    unsigned int v7 = [v6 BOOLValue];

    BOOL v8 = [v5 objectForKeyedSubscript:HKFeatureAvailabilityRequirementIdentifierNotAgeGatedForUserDefaultsKey];
    unsigned int v9 = [v8 BOOLValue];

    unsigned int v10 = [v3 isOnboardingRecordPresent] & v7 & v9;
  }
  else
  {
    _HKInitializeLogging();
    v11 = HKLogDefault;
    if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR)) {
      sub_8908((uint64_t)v4, v11);
    }
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)_isRespiratoryRateRescinded
{
  int v2 = [(HKFeatureStatusManager *)self->_respiratoryRateStatusManager featureStatusWithError:0];
  unsigned __int8 v3 = [v2 objectForKeyedSubscript:HKFeatureAvailabilityContextUsage];
  id v4 = [v3 objectForKeyedSubscript:HKFeatureAvailabilityRequirementIdentifierCountryIsSupportedOnActiveRemoteDevice];
  unsigned __int8 v5 = [v4 BOOLValue];

  id v6 = [v3 objectForKeyedSubscript:HKFeatureAvailabilityRequirementIdentifierFeatureIsNotRemotelyDisabled];
  unsigned __int8 v7 = [v6 BOOLValue];

  return v5 & v7 ^ 1;
}

- (BOOL)_isRespiratoryRateEnabled
{
  if ([(HKBridgePrivacyController *)self _isRespiratoryRateRescinded]) {
    return 0;
  }
  id v4 = [(HKFeatureStatusManager *)self->_respiratoryRateStatusManager featureStatusWithError:0];
  unsigned __int8 v5 = [v4 onboardingRecord];
  id v6 = [v5 featureSettings];
  unsigned __int8 v7 = [v6 numberForKey:HKFeatureSettingsKeyEnabled];

  unsigned __int8 v8 = [v7 BOOLValue];
  if (v7) {
    BOOL v3 = v8;
  }
  else {
    BOOL v3 = 1;
  }

  return v3;
}

- (void)_didTapRespiratoryRateRescindedLearnMore
{
  int v2 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"RESPIRATORY_RATE_RESCINDED_FOOTER_LEARN_MORE_URL" value:&stru_C3E8 table:@"Privacy"];
  id v5 = +[NSURL URLWithString:v3];

  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  [v4 openURL:v5 withOptions:0];
}

- (id)_wristTemperatureSpecifiers
{
  BOOL v3 = [(HKFeatureStatusManager *)self->_wristTemperatureStatusManager featureStatusWithError:0];
  if (v3
    && [(HKBridgePrivacyController *)self _shouldShowWristTemperatureSectionWithFeatureStatus:v3])
  {
    id v4 = [(HKBridgePrivacyController *)self _wristTemperatureGroupSpecifierWithFeatureStatus:v3];
    v8[0] = v4;
    id v5 = [(HKBridgePrivacyController *)self _wristTemperatureSwitchSpecifierWithFeatureStatus:v3];
    v8[1] = v5;
    id v6 = +[NSArray arrayWithObjects:v8 count:2];
  }
  else
  {
    id v6 = &__NSArray0__struct;
  }

  return v6;
}

- (id)_wristTemperatureGroupSpecifierWithFeatureStatus:(id)a3
{
  id v4 = a3;
  id v5 = +[PSSpecifier groupSpecifierWithID:@"WRIST_TEMPERATURE_GROUP_ID"];
  unsigned int v6 = [(HKBridgePrivacyController *)self _isWristTemperatureRescindedWithFeatureStatus:v4];

  unsigned __int8 v7 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v8 = v7;
  if (v6)
  {
    uint64_t v9 = [v7 localizedStringForKey:@"WRIST_TEMPERATURE_RESCINDED_FOOTER_LEARN_MORE" value:&stru_C3E8 table:@"Privacy-Kali"];

    unsigned int v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"WRIST_TEMPERATURE_RESCINDED_FOOTER_FORMAT" value:&stru_C3E8 table:@"Privacy-Kali"];
    CFStringRef v12 = +[NSBundle bundleForClass:objc_opt_class()];
    id v13 = [v12 localizedStringForKey:@"WRIST_TEMPERATURE_RESCINDED_FOOTER_TEXT" value:&stru_C3E8 table:@"Privacy-Kali"];
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v13, v9);

    [v5 setObject:v14 forKeyedSubscript:PSFooterHyperlinkViewTitleKey];
    uint64_t v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v5 setObject:v16 forKeyedSubscript:PSFooterCellClassGroupKey];

    v22.location = (NSUInteger)[v14 rangeOfString:v9];
    v17 = NSStringFromRange(v22);
    [v5 setObject:v17 forKeyedSubscript:PSFooterHyperlinkViewLinkRangeKey];

    unint64_t v18 = +[NSValue valueWithNonretainedObject:self];
    [v5 setObject:v18 forKeyedSubscript:PSFooterHyperlinkViewTargetKey];

    objc_super v19 = NSStringFromSelector("_didTapWristTemperatureRescindedLearnMore");
    [v5 setObject:v19 forKeyedSubscript:PSFooterHyperlinkViewActionKey];

    unsigned __int8 v8 = (void *)v9;
  }
  else
  {
    v14 = [v7 localizedStringForKey:@"WRIST_TEMPERATURE_FOOTER" value:&stru_C3E8 table:@"Privacy-Kali"];
    [v5 setObject:v14 forKeyedSubscript:PSFooterTextGroupKey];
  }

  return v5;
}

- (id)_wristTemperatureSwitchSpecifierWithFeatureStatus:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v6 = [v5 localizedStringForKey:@"WRIST_TEMPERATURE_LABEL" value:&stru_C3E8 table:@"Privacy-Kali"];
  unsigned __int8 v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"setWristTemperatureEnabled:specifier:" get:"wristTemperatureEnabled:" detail:0 cell:6 edit:0];

  [v7 setIdentifier:@"WRIST_TEMPERATURE_SWITCH_ID"];
  LODWORD(self) = [(HKBridgePrivacyController *)self _isWristTemperatureRescindedWithFeatureStatus:v4];

  unsigned __int8 v8 = +[NSNumber numberWithBool:self ^ 1];
  [v7 setProperty:v8 forKey:PSEnabledKey];

  return v7;
}

- (BOOL)_shouldShowWristTemperatureSectionWithFeatureStatus:(id)a3
{
  BOOL v3 = [a3 objectForKeyedSubscript:HKFeatureAvailabilityContextSettingsVisibility];
  unsigned __int8 v4 = [v3 areAllRequirementsSatisfied];

  return v4;
}

- (BOOL)_isWristTemperatureRescindedWithFeatureStatus:(id)a3
{
  BOOL v3 = [a3 objectForKeyedSubscript:HKFeatureAvailabilityContextSettingsUserInteractionEnabled];
  char v4 = [v3 areAllRequirementsSatisfied] ^ 1;

  return v4;
}

- (BOOL)_isWristTemperatureEnabledWithFeatureStatus:(id)a3
{
  id v4 = a3;
  if ([(HKBridgePrivacyController *)self _isWristTemperatureRescindedWithFeatureStatus:v4])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    unsigned int v6 = [v4 onboardingRecord];
    unsigned __int8 v7 = [v6 featureSettings];
    unsigned __int8 v8 = [v7 numberForKey:HKFeatureSettingsKeyEnabled];

    if (v8) {
      unsigned __int8 v5 = [v8 BOOLValue];
    }
    else {
      unsigned __int8 v5 = 1;
    }
  }
  return v5;
}

- (void)_didTapWristTemperatureRescindedLearnMore
{
  int v2 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"WRIST_TEMPERATURE_RESCINDED_FOOTER_LEARN_MORE_URL" value:&stru_C3E8 table:@"Privacy-Kali"];
  id v5 = +[NSURL URLWithString:v3];

  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  [v4 openURL:v5 withOptions:0];
}

- (void)privacyDefaultsDidChange
{
  BOOL v3 = [(HKBridgePrivacyController *)self specifiers];
  id v4 = [v3 specifierForID:@"SMART_STACK_AUDIO_ENABLED_SWITCH_ID"];

  [(HKBridgePrivacyController *)self reloadSpecifier:v4];
}

+ (BOOL)shouldShowSmartStackPrivacySwitch
{
  int v2 = +[BPSBridgeAppContext shared];
  BOOL v3 = [v2 activeDevice];
  char HasCapabilityForString = BPSDeviceHasCapabilityForString();

  return HasCapabilityForString & (_os_feature_enabled_impl() ^ 1);
}

- (HKRPOxygenSaturationSettings)oxygenSaturationSettings
{
  return self->_oxygenSaturationSettings;
}

- (HKFeatureAvailabilityStore)oxygenSaturationFeatureAvailabilityStore
{
  return self->_oxygenSaturationFeatureAvailabilityStore;
}

- (HKFeatureStatusManager)respiratoryRateStatusManager
{
  return self->_respiratoryRateStatusManager;
}

- (HKFeatureStatusManager)wristTemperatureStatusManager
{
  return self->_wristTemperatureStatusManager;
}

- (BOOL)hasRegisteredObservers
{
  return self->_hasRegisteredObservers;
}

- (void)setHasRegisteredObservers:(BOOL)a3
{
  self->_hasRegisteredObservers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wristTemperatureStatusManager, 0);
  objc_storeStrong((id *)&self->_respiratoryRateStatusManager, 0);
  objc_storeStrong((id *)&self->_oxygenSaturationFeatureAvailabilityStore, 0);
  objc_storeStrong((id *)&self->_oxygenSaturationSettings, 0);

  objc_storeStrong((id *)&self->_formattingManager, 0);
}

@end