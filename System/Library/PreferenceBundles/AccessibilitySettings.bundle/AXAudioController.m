@interface AXAudioController
- (ADASManager)headphoneLevelManager;
- (AXAudioController)init;
- (AXDispatchTimer)balanceTimer;
- (BOOL)adjustingBalance;
- (BOOL)spatialAudioEnabled;
- (id)alwaysShowVolumeControlEnabled:(id)a3;
- (id)audioLeftRightBalance:(id)a3;
- (id)comfortSoundsEnabled:(id)a3;
- (id)extendedVoiceIsolationEnabled:(id)a3;
- (id)headphoneNotificationsEnabled:(id)a3;
- (id)ledFlashEnabled:(id)a3;
- (id)mixToUplink:(id)a3;
- (id)monoAudioEnabled:(id)a3;
- (id)personalAudioEnabled:(id)a3;
- (id)phoneNoiseEnabled:(id)a3;
- (id)specifiers;
- (id)startupSound:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)confirmationViewAcceptedForSpecifier:(id)a3;
- (void)confirmationViewCancelledForSpecifier:(id)a3;
- (void)setAdjustingBalance:(BOOL)a3;
- (void)setAlwaysShowVolumeControlEnabled:(id)a3 specifier:(id)a4;
- (void)setAudioLeftRightBalance:(id)a3 specifier:(id)a4;
- (void)setBalanceTimer:(id)a3;
- (void)setExtendedVoiceIsolationEnabled:(id)a3 specifier:(id)a4;
- (void)setHeadphoneLevelManager:(id)a3;
- (void)setHeadphoneNotificationsEnabled:(id)a3 specifier:(id)a4;
- (void)setMonoAudioEnabled:(id)a3 specifier:(id)a4;
- (void)setPhoneNoiseEnabled:(id)a3 specifier:(id)a4;
- (void)setSpatialAudioEnabled:(BOOL)a3;
- (void)setStartupSound:(id)a3 specifier:(id)a4;
- (void)showAudioAccommodationsLearnMore;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXAudioController

- (AXAudioController)init
{
  v20.receiver = self;
  v20.super_class = (Class)AXAudioController;
  v2 = [(AccessibilitySettingsBaseController *)&v20 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = +[PASettings sharedInstance];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __25__AXAudioController_init__block_invoke;
    v17[3] = &unk_208798;
    objc_copyWeak(&v18, &location);
    [v3 registerUpdateBlock:v17 forRetrieveSelector:"personalMediaConfiguration" withListener:v2];

    v4 = +[AXSettings sharedInstance];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __25__AXAudioController_init__block_invoke_3;
    v15[3] = &unk_208798;
    objc_copyWeak(&v16, &location);
    [v4 registerUpdateBlock:v15 forRetrieveSelector:"leftRightBalanceEnabled" withListener:v2];

    objc_destroyWeak(&v16);
    v5 = (AXDispatchTimer *)objc_alloc_init((Class)AXDispatchTimer);
    balanceTimer = v2->_balanceTimer;
    v2->_balanceTimer = v5;

    v7 = (ADASManager *)objc_alloc_init((Class)ADASManager);
    headphoneLevelManager = v2->_headphoneLevelManager;
    v2->_headphoneLevelManager = v7;

    v9 = +[HUComfortSoundsSettings sharedInstance];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __25__AXAudioController_init__block_invoke_4;
    v13[3] = &unk_208798;
    objc_copyWeak(&v14, &location);
    [v9 registerUpdateBlock:v13 forRetrieveSelector:"comfortSoundsEnabled" withListener:v2];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_accessibilityiTunesSettings_0, kAXSVisualAlertEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v11 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v11, v2, (CFNotificationCallback)_accessibilityiTunesSettings_0, kAXSAllowsMixToUplinkDidChangeNotification, 0, (CFNotificationSuspensionBehavior)1028);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __25__AXAudioController_init__block_invoke(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  AXPerformBlockAsynchronouslyOnMainThread();
  objc_destroyWeak(&v1);
}

void __25__AXAudioController_init__block_invoke_2(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained specifierForID:@"AXPAEnableSpecID"];

  id v3 = objc_loadWeakRetained(v1);
  [v3 reloadSpecifier:v4];
}

void __25__AXAudioController_init__block_invoke_3(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v3 = [WeakRetained adjustingBalance];

  if ((v3 & 1) == 0)
  {
    id v4 = objc_loadWeakRetained(v1);
    [v4 reloadSpecifierID:@"LeftRightBalance"];
  }
}

void __25__AXAudioController_init__block_invoke_4(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  AXPerformBlockAsynchronouslyOnMainThread();
  objc_destroyWeak(&v1);
}

void __25__AXAudioController_init__block_invoke_5(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained specifierForID:@"AXCSEnableSpecID"];

  id v3 = objc_loadWeakRetained(v1);
  [v3 reloadSpecifier:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AXAudioController;
  [(AccessibilitySettingsBaseController *)&v8 viewWillAppear:a3];
  id v4 = +[PASettings sharedInstance];
  v5 = [v4 personalMediaConfiguration];
  BOOL v6 = v5 == 0;

  v7 = [(AXAudioController *)self specifierForID:@"AXPAEnableSpecID"];
  if ((v6 ^ (v7 != 0))) {
    [(AXAudioController *)self reloadSpecifier:v7];
  }
  else {
    [(AXAudioController *)self reloadSpecifiers];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXAudioController;
  [(AXAudioController *)&v4 viewDidDisappear:a3];
  id v3 = +[HUUtilities sharedUtilities];
  [v3 updateHearingFeatureUsage];
}

- (id)specifiers
{
  uint64_t v81 = OBJC_IVAR___PSListController__specifiers;
  id v3 = *(void **)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3) {
    goto LABEL_37;
  }
  id v4 = [objc_allocWithZone((Class)NSMutableArray) init];
  v5 = settingsLocString(@"AUDIO_HEADING", @"Accessibility");
  BOOL v6 = +[PSSpecifier groupSpecifierWithName:v5];

  uint64_t v7 = settingsLocString(@"PERSONAL_AUDIO_FOOTER", @"Accessibility");
  uint64_t v8 = settingsLocString(@"PERSONAL_AUDIO_LEARN_MORE", @"Accessibility");
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8);
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  [v6 setProperty:v11 forKey:PSFooterCellClassGroupKey];

  [v6 setProperty:v9 forKey:PSFooterHyperlinkViewTitleKey];
  v83.id location = (NSUInteger)[v9 rangeOfString:v8];
  v12 = NSStringFromRange(v83);
  [v6 setProperty:v12 forKey:PSFooterHyperlinkViewLinkRangeKey];

  v13 = +[NSValue valueWithNonretainedObject:self];
  [v6 setProperty:v13 forKey:PSFooterHyperlinkViewTargetKey];

  id v14 = NSStringFromSelector("showAudioAccommodationsLearnMore");
  [v6 setProperty:v14 forKey:PSFooterHyperlinkViewActionKey];

  [v6 setIdentifier:@"AXPAAudioGroupSpecID"];
  [v4 addObject:v6];
  v15 = [(AccessibilitySettingsBaseController *)self detailClassForFeature:2];
  v79 = (void *)v8;
  v80 = (void *)v7;
  v78 = v9;
  if (v15)
  {
    id v16 = v15;
    settingsLocString(@"PERSONAL_AUDIO", @"Accessibility");
    id v18 = v17 = CAGradientLayer_ptr;
    v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:"personalAudioEnabled:" detail:v16 cell:2 edit:0];

    [v19 setIdentifier:@"AXPAEnableSpecID"];
    [v19 setProperty:@"AXPAEnableSpecID" forKey:PSIDKey];
    [v4 addObject:v19];
    BOOL v6 = v19;
  }
  else
  {
    v17 = CAGradientLayer_ptr;
  }
  objc_super v20 = v4;
  v21 = +[HUComfortSoundsSettings sharedInstance];
  unsigned __int8 v22 = [v21 comfortSoundsAvailable];

  if (v22)
  {
    v23 = +[PSSpecifier emptyGroupSpecifier];

    v24 = hearingLocString();
    uint64_t v25 = PSFooterTextGroupKey;
    objc_msgSend(v23, "setProperty:forKey:", v24);

    [v4 addObject:v23];
    v26 = [(AccessibilitySettingsBaseController *)self detailClassForFeature:3];
    if (v26)
    {
      v27 = v26;
      v28 = hearingLocString();
      BOOL v6 = +[PSSpecifier preferenceSpecifierNamed:v28 target:self set:0 get:"comfortSoundsEnabled:" detail:v27 cell:2 edit:0];

      [v6 setIdentifier:@"AXCSEnableSpecID"];
      [v6 setProperty:@"AXCSEnableSpecID" forKey:PSIDKey];
      [v20 addObject:v6];
    }
    else
    {
      BOOL v6 = v23;
    }
    uint64_t v29 = v25;
  }
  else
  {
    uint64_t v29 = PSFooterTextGroupKey;
  }
  v30 = +[PSSpecifier emptyGroupSpecifier];

  v31 = settingsLocString(@"MONO_AUDIO_FOOTER", @"Accessibility");
  [v30 setProperty:v31 forKey:v29];

  [v20 addObject:v30];
  v32 = settingsLocString(@"MONO_AUDIO", @"Accessibility");
  v33 = +[PSSpecifier preferenceSpecifierNamed:v32 target:self set:"setMonoAudioEnabled:specifier:" get:"monoAudioEnabled:" detail:0 cell:6 edit:0];

  [v33 setIdentifier:@"AXPAMonoSpecID"];
  [v20 addObject:v33];
  v34 = +[PSSpecifier emptyGroupSpecifier];

  v35 = settingsLocString(@"ALWAYS_SHOW_VOLUME_CONTROL_FOOTER", @"Accessibility");
  [v34 setProperty:v35 forKey:v29];

  [v20 addObject:v34];
  v36 = settingsLocString(@"ALWAYS_SHOW_VOLUME_CONTROL", @"Accessibility");
  v37 = +[PSSpecifier preferenceSpecifierNamed:v36 target:self set:"setAlwaysShowVolumeControlEnabled:specifier:" get:"alwaysShowVolumeControlEnabled:" detail:0 cell:6 edit:0];

  [v37 setIdentifier:@"AXPAAlwaysShowVolumeControlSpecID"];
  [v20 addObject:v37];
  if (AXHasCapability())
  {
    v38 = +[PSSpecifier emptyGroupSpecifier];

    v39 = settingsLocString(@"EXTENDED_VOICE_ISOLATON_DETAILS", @"Accessibility");
    [v38 setProperty:v39 forKey:v29];

    [v20 addObject:v38];
    v40 = settingsLocString(@"EXTENDED_VOICE_ISOLATON_TITLE", @"Accessibility");
    v37 = +[PSSpecifier preferenceSpecifierNamed:v40 target:self set:"setExtendedVoiceIsolationEnabled:specifier:" get:"extendedVoiceIsolationEnabled:" detail:0 cell:6 edit:0];

    [v37 setIdentifier:@"ExtendedVoiceIsolationSpecID"];
    [v20 addObject:v37];
  }
  v41 = +[AVAudioSession sharedInstance];
  unsigned int v42 = [v41 isEarpieceActiveNoiseCancelationEnabled];

  if (v42)
  {
    v43 = +[PSSpecifier emptyGroupSpecifier];

    v44 = settingsLocString(@"EARPIECE_NOISE_CANCELLATION_FOOTER", @"Accessibility");
    [v43 setProperty:v44 forKey:v29];

    [v20 addObject:v43];
    v45 = settingsLocString(@"EARPIECE_NOISE_TITLE", @"Accessibility");
    v37 = +[PSSpecifier preferenceSpecifierNamed:v45 target:self set:"setPhoneNoiseEnabled:specifier:" get:"phoneNoiseEnabled:" detail:0 cell:6 edit:0];

    [v37 setIdentifier:@"AXPANoiseSpecID"];
    [v37 setProperty:&off_22BDE0 forKey:PSRequiredCapabilitiesKey];
    [v37 setProperty:&__kCFBooleanTrue forKey:PSSpecifierIsSearchableKey];
    [v20 addObject:v37];
  }
  if (AXHasCapability())
  {
    v46 = +[PSSpecifier emptyGroupSpecifier];

    v47 = settingsLocString(@"STARTUP_SOUND_FOOTER", @"Accessibility-D73");
    [v46 setProperty:v47 forKey:v29];

    [v20 addObject:v46];
    v48 = settingsLocString(@"STARTUP_SOUND", @"Accessibility-D73");
    v37 = +[PSSpecifier preferenceSpecifierNamed:v48 target:self set:"setStartupSound:specifier:" get:"startupSound:" detail:0 cell:6 edit:0];

    [v37 setProperty:@"StartupSound" forKey:PSIDKey];
    [v20 addObject:v37];
  }
  if (AXHasCapability())
  {
    v49 = [(ADASManager *)self->_headphoneLevelManager getPreferenceFor:ADAFPreferenceKeyHAENotificationIsMandatory];
    if (v49 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      unsigned int v50 = [v49 BOOLValue];
    }
    else {
      unsigned int v50 = 0;
    }
    v51 = [(ADASManager *)self->_headphoneLevelManager getPreferenceFor:ADAFPreferenceKeyHAEEnableHKWrite];
    if (v51 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if ((([v51 BOOLValue] | v50) & 1) == 0)
      {
LABEL_25:
        v17 = CAGradientLayer_ptr;
LABEL_31:

        goto LABEL_32;
      }
    }
    else if (!v50)
    {
      goto LABEL_25;
    }
    uint64_t v77 = v29;
    v52 = v20;
    if (AXDeviceIsPod()) {
      v53 = @"HEADPHONE_NOTIFICATIONS_FOOTER_iPOD";
    }
    else {
      v53 = @"HEADPHONE_NOTIFICATIONS_FOOTER_iPHONE";
    }
    v54 = +[PSSpecifier emptyGroupSpecifier];

    v55 = settingsLocString(v53, @"Accessibility");
    [v54 setProperty:v55 forKey:v77];

    uint64_t v56 = PSIDKey;
    [v54 setProperty:@"AXHeadphoneNotificationsGroupSpecID" forKey:PSIDKey];
    [v52 addObject:v54];
    v57 = settingsLocString(@"HEADPHONE_NOTIFICATIONS_TITLE", @"Accessibility");
    v37 = +[PSSpecifier preferenceSpecifierNamed:v57 target:self set:"setHeadphoneNotificationsEnabled:specifier:" get:"headphoneNotificationsEnabled:" detail:0 cell:6 edit:0];

    v17 = CAGradientLayer_ptr;
    [v37 setProperty:objc_opt_class() forKey:PSCellClassKey];
    uint64_t v58 = v56;
    objc_super v20 = v52;
    uint64_t v29 = v77;
    [v37 setProperty:@"AXHeadphoneNotificationsSpecID" forKey:v58];
    [v20 addObject:v37];
    goto LABEL_31;
  }
LABEL_32:
  v59 = v17[120];
  v60 = settingsLocString(@"BALANCE", @"Accessibility");
  v61 = [v59 groupSpecifierWithName:v60];

  v62 = settingsLocString(@"LEFT_RIGHT_BALANCE_DETAILS", @"Accessibility");
  [v61 setProperty:v62 forKey:v29];

  [v61 setIdentifier:@"AXPABalanceSpecID"];
  [v20 addObject:v61];
  v63 = [v17[120] preferenceSpecifierNamed:0 target:self set:"setAudioLeftRightBalance:specifier:" get:"audioLeftRightBalance:" detail:0 cell:5 edit:0];

  [v63 setProperty:&__kCFBooleanTrue forKey:PSSliderIsContinuous];
  uint64_t v64 = PSIDKey;
  [v63 setProperty:@"LeftRightBalance" forKey:PSIDKey];
  [v63 setProperty:kAXSLeftRightBalancePreference forKey:PSKeyNameKey];
  [v63 setProperty:objc_opt_class() forKey:PSCellClassKey];
  v65 = settingsLocString(@"LEFT_RIGHT_BALANCE_SPOKEN", @"Accessibility");
  [v63 setProperty:v65 forKey:@"accessibilityLabel"];

  [v20 addObject:v63];
  if (AXHasCapability())
  {
    v66 = [v17[120] emptyGroupSpecifier];

    settingsLocString(@"MIX_TO_UPLINK_FOOTER", @"Accessibility");
    v68 = v67 = v17;
    [v66 setProperty:v68 forKey:v29];

    [v20 addObject:v66];
    v69 = v67[120];
    v70 = settingsLocString(@"MIX_TO_UPLINK_TITLE", @"Accessibility");
    v63 = [v69 preferenceSpecifierNamed:v70 target:self set:0 get:"mixToUplink:" detail:objc_opt_class() cell:2 edit:0];

    [v63 setProperty:@"MIX_TO_UPLINK" forKey:v64];
    [v20 addObject:v63];
  }
  if (AXHasCapability())
  {
    v71 = settingsLocString(@"VISUAL_HEADING", @"Accessibility");
    v72 = +[PSSpecifier groupSpecifierWithName:v71];

    [v72 setProperty:@"VISUAL_HEADING" forKey:v64];
    [v20 addObject:v72];
    v73 = settingsLocString(@"FLASH_LED", @"Accessibility");
    v63 = +[PSSpecifier preferenceSpecifierNamed:v73 target:self set:0 get:"ledFlashEnabled:" detail:objc_opt_class() cell:2 edit:0];

    [v63 setProperty:@"LED_FLASH" forKey:v64];
    [v20 addObject:v63];
  }
  [(AXAudioController *)self setupLongTitleSpecifiers:v20];
  id v74 = [v20 copy];
  v75 = *(void **)&self->super.AXUISettingsListController_opaque[v81];
  *(void *)&self->super.AXUISettingsListController_opaque[v81] = v74;

  id v3 = *(void **)&self->super.AXUISettingsListController_opaque[v81];
LABEL_37:

  return v3;
}

- (id)mixToUplink:(id)a3
{
  if (_AXSAllowsMixToUplink()) {
    id v3 = @"ON";
  }
  else {
    id v3 = @"OFF";
  }

  return settingsLocString(v3, @"Accessibility");
}

- (void)setStartupSound:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setStartupSoundEnabled:v4];
}

- (id)startupSound:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 startupSoundEnabled]);

  return v4;
}

- (id)personalAudioEnabled:(id)a3
{
  id v3 = +[PASettings sharedInstance];
  if ([v3 personalMediaEnabled]) {
    id v4 = @"ON";
  }
  else {
    id v4 = @"OFF";
  }
  id v5 = settingsLocString(v4, @"Accessibility");

  return v5;
}

- (id)comfortSoundsEnabled:(id)a3
{
  id v3 = +[HUComfortSoundsSettings sharedInstance];
  if ([v3 comfortSoundsEnabled]) {
    id v4 = @"ON";
  }
  else {
    id v4 = @"OFF";
  }
  id v5 = settingsLocString(v4, @"Accessibility");

  return v5;
}

- (id)ledFlashEnabled:(id)a3
{
  if (_AXSVisualAlertEnabled()) {
    id v3 = @"ON";
  }
  else {
    id v3 = @"OFF";
  }

  return settingsLocString(v3, @"Accessibility");
}

- (id)audioLeftRightBalance:(id)a3
{
  _AXSLeftRightAudioBalance();
  AXSLinearValueForLogarithmicValue();

  return +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
}

- (void)setAudioLeftRightBalance:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  self->_adjustingBalance = 1;
  [(AXDispatchTimer *)self->_balanceTimer cancel];
  objc_initWeak(&location, self);
  balanceTimer = self->_balanceTimer;
  unsigned __int8 v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  v24 = __56__AXAudioController_setAudioLeftRightBalance_specifier___block_invoke;
  uint64_t v25 = &unk_208798;
  objc_copyWeak(&v26, &location);
  [(AXDispatchTimer *)balanceTimer afterDelay:&v22 processBlock:0.5];
  objc_msgSend(v6, "floatValue", v22, v23, v24, v25);
  AXSLogarithmicValueForLinearValue();
  float v10 = v9;
  [v6 floatValue];
  float v12 = v11;
  if (fabsf(v11 + -0.5) < 0.003
    && ([(UISlider *)self->_leftRightSlider isTracking] & 1) == 0)
  {
    float v12 = 0.5;
    float v10 = 0.0;
    LODWORD(v13) = 0.5;
    [(UISlider *)self->_leftRightSlider setValue:1 animated:v13];
  }
  id v14 = [(AXAudioController *)self cellForSpecifier:v7];
  v15 = v14;
  double v16 = v12 + -0.5;
  if (v12 < 0.5) {
    double v16 = -(0.5 - v12);
  }
  [v14 setDisplayValue:v16 + v16];

  if (fabs(v10) < 0.1)
  {
    hapticGenerator = self->_hapticGenerator;
    if (!hapticGenerator)
    {
      id v18 = (UIImpactFeedbackGenerator *)[objc_alloc((Class)UIImpactFeedbackGenerator) initWithStyle:1];
      v19 = self->_hapticGenerator;
      self->_hapticGenerator = v18;

      hapticGenerator = self->_hapticGenerator;
    }
    [(UIImpactFeedbackGenerator *)hapticGenerator impactOccurred];
  }
  objc_super v20 = +[AXSettings sharedInstance];
  [v20 setLeftRightBalanceEnabled:v10 != 0.0];

  v21 = +[AXSettings sharedInstance];
  [v21 setLeftRightBalanceValue:v10];

  _AXSSetLeftRightAudioBalance();
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __56__AXAudioController_setAudioLeftRightBalance_specifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAdjustingBalance:0];
}

- (void)setPhoneNoiseEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  [v5 BOOLValue];
  _AXSEarpieceNoiseCancellationSetEnabled();
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    if (AXHACHearingAidComplianceEnabled()) {
      [(AccessibilitySettingsBaseController *)self handleHACorNoiseCancellationToggle];
    }
    AXHACHearingAidComplianceSetEnabled();
  }
  id v7 = [(AXAudioController *)self specifierForKey:@"HearingAidCompliance"];
  [(AXAudioController *)self reloadSpecifier:v7 animated:1];
}

- (id)phoneNoiseEnabled:(id)a3
{
  uint64_t v3 = _AXSEarpieceNoiseCancellationEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setHeadphoneNotificationsEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  unsigned int v6 = [(ADASManager *)self->_headphoneLevelManager getPreferenceFor:ADAFPreferenceKeyHAENotificationIsMandatory];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v7 = [v6 BOOLValue];
  }
  else {
    unsigned int v7 = 0;
  }
  if ([v5 BOOLValue])
  {
    headphoneLevelManager = self->_headphoneLevelManager;
    uint64_t v9 = ADAFPreferenceKeyHAENotificationFeatureEnabled;
    float v10 = &__kCFBooleanTrue;
LABEL_10:
    id v18 = [(ADASManager *)headphoneLevelManager setPreferenceFor:v9 value:v10];
    goto LABEL_11;
  }
  if (!v7)
  {
    headphoneLevelManager = self->_headphoneLevelManager;
    uint64_t v9 = ADAFPreferenceKeyHAENotificationFeatureEnabled;
    float v10 = &__kCFBooleanFalse;
    goto LABEL_10;
  }
  float v11 = settingsLocString(@"HEADPHONE_NOTIFICATIONS_ALERT_TITLE", @"Accessibility");
  float v12 = settingsLocString(@"HEADPHONE_NOTIFICATIONS_ALERT_MESSAGE", @"Accessibility");
  double v13 = +[UIAlertController alertControllerWithTitle:v11 message:v12 preferredStyle:1];

  id v14 = settingsLocString(@"HEADPHONE_NOTIFICATIONS_ALERT_OPTION_ON", @"Accessibility");
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __64__AXAudioController_setHeadphoneNotificationsEnabled_specifier___block_invoke;
  v20[3] = &unk_208B68;
  v20[4] = self;
  v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:v20];
  [v13 addAction:v15];

  double v16 = settingsLocString(@"HEADPHONE_NOTIFICATIONS_ALERT_OPTION_OFF", @"Accessibility");
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __64__AXAudioController_setHeadphoneNotificationsEnabled_specifier___block_invoke_2;
  v19[3] = &unk_208B68;
  v19[4] = self;
  v17 = +[UIAlertAction actionWithTitle:v16 style:0 handler:v19];
  [v13 addAction:v17];

  [(AXAudioController *)self presentViewController:v13 animated:1 completion:0];
LABEL_11:
}

id __64__AXAudioController_setHeadphoneNotificationsEnabled_specifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifierID:@"AXHeadphoneNotificationsSpecID" animated:1];
}

id __64__AXAudioController_setHeadphoneNotificationsEnabled_specifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 224) setPreferenceFor:ADAFPreferenceKeyHAENotificationFeatureEnabled value:&__kCFBooleanFalse];
}

- (id)headphoneNotificationsEnabled:(id)a3
{
  return [(ADASManager *)self->_headphoneLevelManager getPreferenceFor:ADAFPreferenceKeyHAENotificationFeatureEnabled];
}

- (void)confirmationViewAcceptedForSpecifier:(id)a3
{
  _AXSMonoAudioSetEnabled();

  [(AXAudioController *)self setSpatialAudioEnabled:0];
}

- (void)confirmationViewCancelledForSpecifier:(id)a3
{
}

- (void)setMonoAudioEnabled:(id)a3 specifier:(id)a4
{
  id v10 = a3;
  if ([v10 BOOLValue]
    && [(AXAudioController *)self spatialAudioEnabled])
  {
    id v5 = objc_alloc_init((Class)PSConfirmationSpecifier);
    unsigned int v6 = settingsLocString(@"TURN_ON", @"Accessibility");
    [v5 setTitle:v6];

    unsigned int v7 = settingsLocString(@"MONO_SPATIAL_ALERT_PROMPT", @"Accessibility");
    [v5 setPrompt:v7];

    uint64_t v8 = settingsLocString(@"OK", @"Accessibility");
    [v5 setOkButton:v8];

    uint64_t v9 = settingsLocString(@"CANCEL", @"Accessibility");
    [v5 setCancelButton:v9];

    [(AXAudioController *)self showConfirmationViewForSpecifier:v5];
  }
  else
  {
    [v10 BOOLValue];
    _AXSMonoAudioSetEnabled();
  }
}

- (id)monoAudioEnabled:(id)a3
{
  uint64_t v3 = _AXSMonoAudioEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setAlwaysShowVolumeControlEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  __AXSAlwaysShowVolumeControlSetEnabled(v4);
}

- (id)alwaysShowVolumeControlEnabled:(id)a3
{
  uint64_t v3 = _AXSAlwaysShowVolumeControlEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (id)extendedVoiceIsolationEnabled:(id)a3
{
  uint64_t v3 = _AXSExtendedVoiceIsolationMediaModesEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setExtendedVoiceIsolationEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  [v4 BOOLValue];
  _AXSSetExtendedVoiceIsolationMediaModesEnabled();
  unsigned __int8 v5 = [v4 BOOLValue];

  if ((v5 & 1) == 0)
  {
    id v12 = 0;
    uint64_t v13 = 0;
    unsigned __int8 v6 = +[AVAudioApplication getEnhanceDialogueLevel:&v13 error:&v12];
    id v7 = v12;
    if (v6)
    {
      if (v13 != 3)
      {
LABEL_12:

        return;
      }
      id v11 = v7;
      unsigned __int8 v8 = +[AVAudioApplication setEnhanceDialogueLevel:2 error:&v11];
      id v9 = v11;

      if (v8)
      {
        id v7 = v9;
        goto LABEL_12;
      }
      id v10 = AXLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[AXAudioController setExtendedVoiceIsolationEnabled:specifier:]((uint64_t)v9, v10);
      }
      id v7 = v9;
    }
    else
    {
      id v10 = AXLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[AXAudioController setExtendedVoiceIsolationEnabled:specifier:]((uint64_t)v7, v10);
      }
    }

    goto LABEL_12;
  }
}

- (BOOL)spatialAudioEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.springboard");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"spatial-audio-accessory-feature", @"com.apple.springboard", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (void)setSpatialAudioEnabled:(BOOL)a3
{
  BOOL v3 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!a3) {
    BOOL v3 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetAppValue(@"spatial-audio-accessory-feature", *v3, @"com.apple.springboard");

  CFPreferencesAppSynchronize(@"com.apple.springboard");
}

- (void)showAudioAccommodationsLearnMore
{
  v2 = (void *)UIApp;
  +[NSURL URLWithString:@"https://support.apple.com/ht211218?cid=mc-ols-audio-article_ht211218-ios_ui-06042020"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 openURL:v3 withCompletionHandler:0];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v14 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v6 = [v14 specifier];
    id v7 = [v6 properties];
    unsigned __int8 v8 = [v7 objectForKey:PSKeyNameKey];
    unsigned int v9 = [v8 isEqualToString:kAXSLeftRightBalancePreference];

    if (v9)
    {
      id v10 = +[UIColor colorWithRed:0.654901961 green:0.654901961 blue:0.654901961 alpha:1.0];
      [(UISlider *)self->_leftRightSlider setMinimumTrackTintColor:v10];

      id v11 = +[AXSettings sharedInstance];
      [v11 leftRightBalanceValue];
      AXSLinearValueForLogarithmicValue();
      if (v12 >= 0.5) {
        double v13 = v12 + -0.5;
      }
      else {
        double v13 = -(0.5 - v12);
      }
      [v14 setDisplayValue:v13 + v13];
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)AXAudioController;
  unsigned __int8 v5 = [(AXAudioController *)&v13 tableView:a3 cellForRowAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v6 = [v5 specifier];
    id v7 = [v6 properties];
    unsigned __int8 v8 = [v7 objectForKey:PSKeyNameKey];
    unsigned int v9 = [v8 isEqualToString:kAXSLeftRightBalancePreference];

    if (v9)
    {
      id v10 = [v5 control];
      leftRightSlider = self->_leftRightSlider;
      self->_leftRightSlider = v10;
    }
  }

  return v5;
}

- (ADASManager)headphoneLevelManager
{
  return self->_headphoneLevelManager;
}

- (void)setHeadphoneLevelManager:(id)a3
{
}

- (AXDispatchTimer)balanceTimer
{
  return self->_balanceTimer;
}

- (void)setBalanceTimer:(id)a3
{
}

- (BOOL)adjustingBalance
{
  return self->_adjustingBalance;
}

- (void)setAdjustingBalance:(BOOL)a3
{
  self->_adjustingBalance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balanceTimer, 0);
  objc_storeStrong((id *)&self->_headphoneLevelManager, 0);
  objc_storeStrong((id *)&self->_hapticGenerator, 0);

  objc_storeStrong((id *)&self->_leftRightSlider, 0);
}

- (void)setExtendedVoiceIsolationEnabled:(uint64_t)a1 specifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "setEnhanceDialogueLevel: SPI call failed: %@", (uint8_t *)&v2, 0xCu);
}

- (void)setExtendedVoiceIsolationEnabled:(uint64_t)a1 specifier:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "getEnhanceDialogueLevel SPI call failed: %@", (uint8_t *)&v2, 0xCu);
}

@end