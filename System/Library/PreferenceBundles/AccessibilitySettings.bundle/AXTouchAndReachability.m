@interface AXTouchAndReachability
- (AXTouchAndReachability)init;
- (BOOL)_vibrationVibratesForEmergencies;
- (id)backTapEnabled:(id)a3;
- (id)callAudioRouting:(id)a3;
- (id)forceTouchEnabled:(id)a3;
- (id)handEnabled:(id)a3;
- (id)phoneLockButton:(id)a3;
- (id)reachabilityEnabled:(id)a3;
- (id)shakeToUndo:(id)a3;
- (id)specifiers;
- (id)tapToWake:(id)a3;
- (id)touchAccommodationsEnabled:(id)a3;
- (id)vibrationEnabled:(id)a3;
- (void)_easyReachChanged:(id)a3;
- (void)_vibrationVibratesForEmergencies;
- (void)setPhoneLockButton:(id)a3 specifier:(id)a4;
- (void)setReachabilityEnabled:(id)a3 specifier:(id)a4;
- (void)setShakeToUndo:(id)a3 specifier:(id)a4;
- (void)setTapToWake:(id)a3 specifier:(id)a4;
- (void)setVibrationEnabled:(id)a3 specifier:(id)a4;
@end

@implementation AXTouchAndReachability

- (AXTouchAndReachability)init
{
  v16.receiver = self;
  v16.super_class = (Class)AXTouchAndReachability;
  v2 = [(AccessibilitySettingsBaseController *)&v16 init];
  if (v2)
  {
    v2->_easyReachCache = SBSIsReachabilityEnabled() != 0;
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_easyReachChanged:" name:@"AXEasyReachModeChanged" object:0];

    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)_accessibilityiTunesSettings_1, kAXSShakeToUndoDisabledPreferenceDidChangeNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v5 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v5, v2, (CFNotificationCallback)_accessibilityiTunesSettings_1, kAXSForceTouchEnabledPreferenceNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v6 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v6, v2, (CFNotificationCallback)_accessibilityiTunesSettings_1, kAXSVibrationDisabledPreferenceDidChangeNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v7 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v7, v2, (CFNotificationCallback)_accessibilityiTunesSettings_1, kAXSAssistiveTouchEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v8 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v8, v2, (CFNotificationCallback)_accessibilityiTunesSettings_1, kAXSBackTapEnabledDidChangeNotification, 0, (CFNotificationSuspensionBehavior)1028);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_defaultRouteChanged, kAXSDefaultRouteChangedNotification, 0, (CFNotificationSuspensionBehavior)1028);
    objc_initWeak(&location, v2);
    v10 = +[AXSettings sharedInstance];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __30__AXTouchAndReachability_init__block_invoke;
    v13[3] = &unk_208798;
    objc_copyWeak(&v14, &location);
    [v10 registerUpdateBlock:v13 forRetrieveSelector:"touchAccommodationsEnabled" withListener:v2];

    objc_destroyWeak(&v14);
    v11 = v2;
    objc_destroyWeak(&location);
  }

  return v2;
}

void __30__AXTouchAndReachability_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiersFromNotification];
}

- (void)_easyReachChanged:(id)a3
{
  self->_easyReachCache = SBSIsReachabilityEnabled() != 0;
  id v4 = [(AXTouchAndReachability *)self specifierForID:@"REACHABILITY"];
  [(AXTouchAndReachability *)self reloadSpecifier:v4];
}

- (id)specifiers
{
  v3 = *(void **)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v69 = OBJC_IVAR___PSListController__specifiers;
    id v4 = [objc_allocWithZone((Class)NSMutableArray) init];
    v5 = +[PSSpecifier groupSpecifierWithName:0];
    uint64_t v6 = AXInBuddySetupKey;
    [v5 setProperty:&__kCFBooleanTrue forKey:AXInBuddySetupKey];
    uint64_t v7 = PSIDKey;
    [v5 setProperty:@"AIR_TOUCH_FOOTER" forKey:PSIDKey];
    v8 = AXLocStringKeyForModel();
    v9 = settingsLocString(v8, @"HandSettings");
    uint64_t v10 = PSFooterTextGroupKey;
    [v5 setProperty:v9 forKey:PSFooterTextGroupKey];

    [v4 addObject:v5];
    v11 = settingsLocString(@"AIR_TOUCH_TITLE", @"Accessibility");
    uint64_t v12 = v7;
    v13 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:"handEnabled:" detail:objc_opt_class() cell:2 edit:0];

    [v13 setProperty:&__kCFBooleanTrue forKey:v6];
    [v13 setProperty:@"AIR_TOUCH_TITLE" forKey:v7];
    [v4 addObject:v13];
    if (AXHasCapability())
    {
      id v14 = +[PSSpecifier groupSpecifierWithName:0];

      [v14 setProperty:&__kCFBooleanTrue forKey:v6];
      [v4 addObject:v14];
      AXLocStringKeyForHomeButton();
      uint64_t v15 = v10;
      v17 = uint64_t v16 = v12;
      v18 = settingsLocString(v17, @"Accessibility");
      [v14 setProperty:v18 forKey:v15];

      v19 = settingsLocString(@"REACHABILITY", @"Accessibility");
      v13 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:"setReachabilityEnabled:specifier:" get:"reachabilityEnabled:" detail:0 cell:6 edit:0];

      uint64_t v20 = v16;
      uint64_t v21 = v16;
      uint64_t v10 = v15;
      [v13 setProperty:@"REACHABILITY" forKey:v21];
      [v13 setProperty:&__kCFBooleanTrue forKey:v6];
      [v4 addObject:v13];
    }
    else
    {
      uint64_t v20 = v7;
    }
    v22 = +[PSSpecifier emptyGroupSpecifier];

    [v22 setProperty:&__kCFBooleanFalse forKey:v6];
    [v4 addObject:v22];
    if (AXDeviceHasForcePress3dTouch()) {
      v23 = @"FORCE_TOUCH_FOOTER";
    }
    else {
      v23 = @"HAPTIC_TOUCH_FOOTER";
    }
    v24 = settingsLocString(v23, @"Accessibility");
    [v22 setProperty:v24 forKey:v10];

    if (AXDeviceHasForcePress3dTouch()) {
      v25 = @"FORCE_TOUCH_AND_HAPTIC_TOUCH";
    }
    else {
      v25 = @"HAPTIC_TOUCH";
    }
    v26 = settingsLocString(v25, @"Accessibility");
    v27 = +[PSSpecifier preferenceSpecifierNamed:v26 target:self set:0 get:"forceTouchEnabled:" detail:objc_opt_class() cell:2 edit:0];

    [v27 setProperty:@"ForceTouch" forKey:PSKeyNameKey];
    uint64_t v28 = v10;
    uint64_t v29 = v20;
    [v27 setObject:@"ForceTouch" forKeyedSubscript:v20];
    [v27 setProperty:&__kCFBooleanFalse forKey:v6];
    [v4 addObject:v27];
    v30 = +[PSSpecifier emptyGroupSpecifier];

    [v4 addObject:v30];
    [v30 setProperty:&__kCFBooleanTrue forKey:v6];
    v31 = settingsLocString(@"TOUCH_ACCOMMODATIONS_FOOTER", @"Accessibility");
    uint64_t v73 = v28;
    [v30 setProperty:v31 forKey:v28];

    v32 = settingsLocString(@"TOUCH_ACCOMMODATIONS", @"Accessibility");
    v71 = self;
    v33 = +[PSSpecifier preferenceSpecifierNamed:v32 target:self set:0 get:"touchAccommodationsEnabled:" detail:objc_opt_class() cell:2 edit:0];

    [v33 setProperty:&__kCFBooleanTrue forKey:v6];
    [v33 setProperty:@"TOUCH_ACCOMMODATIONS" forKey:v29];
    [v4 addObject:v33];
    if ((AXHasCapability() & 1) != 0 || AXHasCapability())
    {
      int v34 = AXHasCapability();
      v35 = +[PSSpecifier emptyGroupSpecifier];

      [v35 setProperty:&__kCFBooleanTrue forKey:v6];
      [v4 addObject:v35];
      v36 = settingsLocString(@"TAP_TO_WAKE_TITLE_FOOTER", @"Accessibility");
      if (v34)
      {
        uint64_t v37 = settingsLocString(@"TAP_TOUCH_TO_WAKE_TITLE_FOOTER", @"Accessibility-D73");

        v36 = (void *)v37;
      }
      [v35 setProperty:v36 forKey:v73];
      v38 = settingsLocString(@"TAP_TO_WAKE_TITLE", @"Accessibility");
      if (v34)
      {
        uint64_t v39 = settingsLocString(@"TAP_TOUCH_TO_WAKE_TITLE", @"Accessibility-D73");

        v38 = (void *)v39;
      }
      v33 = +[PSSpecifier preferenceSpecifierNamed:v38 target:self set:"setTapToWake:specifier:" get:"tapToWake:" detail:0 cell:6 edit:0];

      [v33 setProperty:&__kCFBooleanTrue forKey:v6];
      [v33 setProperty:@"TAP_TO_WAKE_TITLE" forKey:v29];
      [v4 addObject:v33];
    }
    v40 = +[PSSpecifier emptyGroupSpecifier];

    v41 = AXLocStringKeyForModel();
    v42 = settingsLocString(v41, @"Accessibility");
    [v40 setProperty:v42 forKey:v73];

    [v40 setProperty:&__kCFBooleanTrue forKey:v6];
    [v4 addObject:v40];
    v43 = settingsLocString(@"SHAKE_TO_UNDO", @"Accessibility");
    v44 = +[PSSpecifier preferenceSpecifierNamed:v43 target:self set:"setShakeToUndo:specifier:" get:"shakeToUndo:" detail:0 cell:6 edit:0];

    [v44 setProperty:&__kCFBooleanTrue forKey:v6];
    [v44 setProperty:@"SHAKE_TO_UNDO" forKey:v29];
    [v4 addObject:v44];
    v45 = self;
    if (AXHasCapability())
    {
      v46 = +[PSSpecifier emptyGroupSpecifier];

      if ([(AXTouchAndReachability *)self _vibrationVibratesForEmergencies]) {
        v47 = @"DisableVibrationFooterTextFormat";
      }
      else {
        v47 = @"DisableVibrationFooterTextFormat_ExceptEmergencies";
      }
      v70 = settingsLocString(v47, @"Accessibility");
      v48 = +[UIDevice currentDevice];
      v49 = [v48 localizedModel];
      v50 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v70, v49);
      [v46 setProperty:v50 forKey:v73];

      [v46 setProperty:&__kCFBooleanTrue forKey:v6];
      [v4 addObject:v46];
      v51 = settingsLocString(@"VIBRATION", @"Accessibility");
      v44 = +[PSSpecifier preferenceSpecifierNamed:v51 target:v71 set:"setVibrationEnabled:specifier:" get:"vibrationEnabled:" detail:0 cell:6 edit:0];

      [v44 setProperty:&__kCFBooleanTrue forKey:v6];
      v45 = v71;
      [v44 setProperty:@"VIBRATION" forKey:v29];
      [v4 addObject:v44];
    }
    v52 = +[PSSpecifier emptyGroupSpecifier];

    objc_msgSend(v52, "setProperty:forKey:");
    [v4 addObject:v52];
    if (AXDeviceHasTopButton()) {
      v53 = @"LOCK_BUTTON_IGNORE_FOOTER_TOP";
    }
    else {
      v53 = @"LOCK_BUTTON_IGNORE_FOOTER_SIDE";
    }
    v72 = settingsLocString(v53, @"Accessibility");
    objc_msgSend(v52, "setProperty:forKey:");
    v54 = settingsLocString(@"LOCK_BUTTON_IGNORE_TITLE", @"Accessibility");
    v55 = +[PSSpecifier preferenceSpecifierNamed:v54 target:v45 set:"setPhoneLockButton:specifier:" get:"phoneLockButton:" detail:0 cell:6 edit:0];

    [v55 setProperty:@"LockButtonIgnore" forKey:v29];
    [v55 setProperty:&__kCFBooleanFalse forKey:v6];
    uint64_t v56 = objc_opt_class();
    uint64_t v57 = PSCellClassKey;
    [v55 setProperty:v56 forKey:PSCellClassKey];
    [v4 addObject:v55];
    +[PSSpecifier emptyGroupSpecifier];
    v59 = v58 = v45;

    [v59 setProperty:&__kCFBooleanFalse forKey:v6];
    [v4 addObject:v59];
    v60 = settingsLocString(@"CALL_AUDIO_ROUTING_FOOTER", @"CallAudioRoutingSettings");
    [v59 setProperty:v60 forKey:v73];

    v61 = settingsLocString(@"CALL_AUDIO_ROUTING_TITLE", @"Accessibility");
    v62 = +[PSSpecifier preferenceSpecifierNamed:v61 target:v58 set:0 get:"callAudioRouting:" detail:objc_opt_class() cell:2 edit:0];

    [v62 setProperty:@"CALL_AUDIO_ROUTING" forKey:v29];
    [v62 setProperty:objc_opt_class() forKey:v57];
    [v62 setProperty:&__kCFBooleanFalse forKey:v6];
    [v4 addObject:v62];
    if (AXHasCapability())
    {
      v63 = +[PSSpecifier emptyGroupSpecifier];

      [v63 setProperty:&__kCFBooleanFalse forKey:v6];
      v64 = settingsLocString(@"BACK_TAP_FOOTER", @"Accessibility");
      [v63 setProperty:v64 forKey:v73];

      [v4 addObject:v63];
      v65 = settingsLocString(@"BACK_TAP", @"Accessibility");
      v62 = +[PSSpecifier preferenceSpecifierNamed:v65 target:v58 set:0 get:"backTapEnabled:" detail:objc_opt_class() cell:2 edit:0];

      [v62 setProperty:&__kCFBooleanFalse forKey:v6];
      [v62 setProperty:@"BackTap" forKey:v29];
      [v4 addObject:v62];
    }
    [(AXTouchAndReachability *)v58 filterBuddy:v4];
    id v66 = [v4 copy];
    v67 = *(void **)&v58->super.AXUISettingsListController_opaque[v69];
    *(void *)&v58->super.AXUISettingsListController_opaque[v69] = v66;

    v3 = *(void **)&v58->super.AXUISettingsListController_opaque[v69];
  }

  return v3;
}

- (id)phoneLockButton:(id)a3
{
  BOOL v3 = _AXSPhoneLockToEndCallEnabled() == 0;

  return +[NSNumber numberWithInt:v3];
}

- (void)setPhoneLockButton:(id)a3 specifier:(id)a4
{
  uint64_t v4 = [a3 BOOLValue] ^ 1;

  __AXSPhoneLockToEndCallSetEnabled(v4);
}

- (id)backTapEnabled:(id)a3
{
  BOOL v3 = +[AXSettings sharedInstance];
  if ([v3 backTapEnabled]) {
    uint64_t v4 = @"ON";
  }
  else {
    uint64_t v4 = @"OFF";
  }
  v5 = settingsLocString(v4, @"Accessibility");

  return v5;
}

- (BOOL)_vibrationVibratesForEmergencies
{
  if (!_CTServerConnectionCreate()) {
    return 1;
  }
  unint64_t CellBroadcastOverrideAccessibilityVibrationSetting = _CTServerConnectionGetCellBroadcastOverrideAccessibilityVibrationSetting();
  int v3 = CellBroadcastOverrideAccessibilityVibrationSetting;
  unint64_t v4 = HIDWORD(CellBroadcastOverrideAccessibilityVibrationSetting);
  v5 = AXLogCommon();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(AXTouchAndReachability *)v3 _vibrationVibratesForEmergencies];
    }

    return 1;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    int v9 = 0;
    __int16 v10 = 1024;
    int v11 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "override accessibility setting didSucceed: %d, isAccessibilityVibrationSettingOverridenForAlerts: %d", buf, 0xEu);
  }

  return 1;
}

- (id)callAudioRouting:(id)a3
{
  unsigned int v3 = _AXSDefaultRouteForCall();
  if (v3 > 2)
  {
    unint64_t v4 = 0;
  }
  else
  {
    unint64_t v4 = settingsLocString(off_209D60[v3], @"CallAudioRoutingSettings");
  }

  return v4;
}

- (id)handEnabled:(id)a3
{
  if (_AXSAssistiveTouchEnabled()) {
    unsigned int v3 = @"ON";
  }
  else {
    unsigned int v3 = @"OFF";
  }

  return settingsLocString(v3, @"Accessibility");
}

- (void)setVibrationEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v4 = [a3 BOOLValue] ^ 1;

  __AXSSetVibrationDisabled(v4);
}

- (id)vibrationEnabled:(id)a3
{
  BOOL v3 = _AXSVibrationDisabled() == 0;

  return +[NSNumber numberWithInt:v3];
}

- (id)shakeToUndo:(id)a3
{
  BOOL v3 = _AXSShakeToUndoDisabled() == 0;

  return +[NSNumber numberWithInt:v3];
}

- (void)setShakeToUndo:(id)a3 specifier:(id)a4
{
  uint64_t v4 = [a3 BOOLValue] ^ 1;

  __AXSSetShakeToUndoDisabled(v4);
}

- (void)setTapToWake:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSUserDefaults);
  id v7 = [v5 initWithSuiteName:AX_SpringBoardBundleName];
  id v6 = [v4 BOOLValue];

  [v7 setBool:v6 forKey:@"SBSupportTapToWake"];
}

- (id)tapToWake:(id)a3
{
  id v3 = objc_alloc((Class)NSUserDefaults);
  id v4 = [v3 initWithSuiteName:AX_SpringBoardBundleName];
  id v5 = [v4 objectForKey:@"SBSupportTapToWake"];
  id v6 = v5;
  if (!v5) {
    id v5 = &__kCFBooleanTrue;
  }
  id v7 = v5;

  return v7;
}

- (id)touchAccommodationsEnabled:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  if ([v3 touchAccommodationsEnabled]) {
    id v4 = @"ON";
  }
  else {
    id v4 = @"OFF";
  }
  id v5 = settingsLocString(v4, @"Accessibility");

  return v5;
}

- (id)forceTouchEnabled:(id)a3
{
  if (AXDeviceHasForcePress3dTouch())
  {
    if (_AXSForceTouchEnabled()) {
      id v3 = @"ON";
    }
    else {
      id v3 = @"OFF";
    }
    id v4 = settingsLocString(v3, @"Accessibility");
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)setReachabilityEnabled:(id)a3 specifier:(id)a4
{
  self->_easyReachCache = [a3 BOOLValue];
  SBSSetReachabilityEnabled();
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"AXEasyReachModeChanged" object:0];
}

- (id)reachabilityEnabled:(id)a3
{
  return +[NSNumber numberWithBool:self->_easyReachCache];
}

- (void)_vibrationVibratesForEmergencies
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "error getting override accessibility setting: domain: %d error: %d", (uint8_t *)v3, 0xEu);
}

@end