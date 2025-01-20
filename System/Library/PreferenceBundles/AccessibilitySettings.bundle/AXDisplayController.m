@interface AXDisplayController
- (AXDisplayController)init;
- (PSSpecifier)reduceWhitePointIntensitySpecifier;
- (PSSpecifier)reduceWhitePointSpecifier;
- (id)autoBrightnessEnabled:(id)a3;
- (id)classicInvertEnabled:(id)a3;
- (id)colorFiltersEnabled:(id)a3;
- (id)grayscaleEnabled:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)whitePointEnabled:(id)a3;
- (id)whitepointIntensity:(id)a3;
- (void)_updateFilterOptionSpecifiers;
- (void)reloadSpecifiers;
- (void)setAutoBrightnessEnabled:(id)a3 specifier:(id)a4;
- (void)setClassicInvertEnabled:(id)a3 specifier:(id)a4;
- (void)setGrayscaleEnabled:(id)a3 specifier:(id)a4;
- (void)setReduceWhitePointIntensitySpecifier:(id)a3;
- (void)setReduceWhitePointSpecifier:(id)a3;
- (void)setWhitePointEnabled:(id)a3 specifier:(id)a4;
- (void)setWhitepointIntensity:(id)a3 specifier:(id)a4;
@end

@implementation AXDisplayController

- (AXDisplayController)init
{
  v24.receiver = self;
  v24.super_class = (Class)AXDisplayController;
  v2 = [(AccessibilitySettingsBaseController *)&v24 init];
  if (v2)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)_accessibilityiTunesSettings_2, kAXSEnhanceBackgroundContrastChangedNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v4 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v4, v2, (CFNotificationCallback)_accessibilityiTunesSettings_2, kAXSReduceMotionChangedNotification, 0, (CFNotificationSuspensionBehavior)1028);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef v6 = (const __CFString *)kMADisplayFilterSettingsChangedNotification;
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_accessibilityiTunesSettings_2, kMADisplayFilterSettingsChangedNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v7 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v7, v2, (CFNotificationCallback)_accessibilityiTunesSettings_2, kAXSAutoBrightnessChangedNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v8 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v8, v2, (CFNotificationCallback)_accessibilityiTunesSettings_2, kAXSReduceWhitePointEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v9, v2, (CFNotificationCallback)_accessibilityiTunesSettings_2, kAXSDefaultRouteChangedNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v10 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v10, v2, (CFNotificationCallback)_accessibilityiTunesSettings_2, kAXSDarkenSystemColorsEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v11 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v11, v2, (CFNotificationCallback)_accessibilityiTunesSettings_2, kAXSDifferentiateWithoutColorChangedNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v12 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v12, v2, (CFNotificationCallback)_accessibilityiTunesSettings_2, kAXSInvertColorsEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v13 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v13, v2, (CFNotificationCallback)_accessibilityiTunesSettings_2, v6, 0, (CFNotificationSuspensionBehavior)1028);
    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v2 selector:"reloadSpecifiersFromNotification" name:@"DidPostContentSizeChanged" object:0];

    objc_initWeak(&location, v2);
    v15 = +[AXSettings sharedInstance];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __27__AXDisplayController_init__block_invoke;
    v21[3] = &unk_208798;
    objc_copyWeak(&v22, &location);
    [v15 registerUpdateBlock:v21 forRetrieveSelector:"classicInvertColors" withListener:v2];

    objc_destroyWeak(&v22);
    v16 = +[AXSettings sharedInstance];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __27__AXDisplayController_init__block_invoke_2;
    v19[3] = &unk_208798;
    objc_copyWeak(&v20, &location);
    [v16 registerUpdateBlock:v19 forRetrieveSelector:"classicInvertColors" withListener:v2];

    objc_destroyWeak(&v20);
    v17 = v2;
    objc_destroyWeak(&location);
  }

  return v2;
}

void __27__AXDisplayController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiersFromNotification];
}

void __27__AXDisplayController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"CLASSIC_INVERT"];
}

- (id)specifiers
{
  if (!self->_helper)
  {
    v3 = (AXDisplayTextMotionSpecifiersHelper *)objc_opt_new();
    helper = self->_helper;
    self->_helper = v3;

    [(AXDisplayTextMotionSpecifiersHelper *)self->_helper setSettingsController:self];
  }
  uint64_t v5 = OBJC_IVAR___PSListController__specifiers;
  CFStringRef v6 = *(void **)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v6)
  {
    id v7 = [objc_allocWithZone((Class)NSMutableArray) init];
    v8 = [(AXDisplayTextMotionSpecifiersHelper *)self->_helper displayTextSpecifiersIncludingSmartInvert:1 isPerApp:0];
    [v7 axSafelyAddObjectsFromArray:v8];

    if ([(AccessibilitySettingsBaseController *)self isSettingAvailableOnPlatform])
    {
      uint64_t v49 = v5;
      v9 = CAGradientLayer_ptr;
      v10 = +[PSSpecifier emptyGroupSpecifier];
      v11 = settingsLocString(@"ClassicInvertColorsFooter", @"Accessibility");
      uint64_t v12 = PSFooterTextGroupKey;
      [v10 setProperty:v11 forKey:PSFooterTextGroupKey];

      uint64_t v13 = AXInBuddySetupKey;
      [v10 setProperty:&__kCFBooleanTrue forKey:AXInBuddySetupKey];
      [v7 addObject:v10];
      v14 = settingsLocString(@"CLASSIC_INVERT", @"Accessibility");
      v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:"setClassicInvertEnabled:specifier:" get:"classicInvertEnabled:" detail:0 cell:6 edit:0];

      uint64_t v16 = PSIDKey;
      [v15 setProperty:@"CLASSIC_INVERT" forKey:PSIDKey];
      [v15 setProperty:&__kCFBooleanTrue forKey:v13];
      [v7 addObject:v15];
      v17 = +[AXSettings sharedInstance];
      unsigned int v18 = [v17 supportsAdvancedDisplayFilters];

      v19 = +[PSSpecifier emptyGroupSpecifier];

      if (v18)
      {
        id v20 = settingsLocString(@"DISPLAY_FILTER_COLOR_DESCRIPTION", @"DisplayFilterSettings");
        [v19 setProperty:v20 forKey:v12];

        [v19 setProperty:&__kCFBooleanTrue forKey:v13];
        [v7 addObject:v19];
        settingsLocString(@"DISPLAY_FILTER_COLOR", @"DisplayFilterSettings");
        id v22 = v21 = v12;
        v23 = +[PSSpecifier preferenceSpecifierNamed:v22 target:self set:0 get:"colorFiltersEnabled:" detail:objc_opt_class() cell:2 edit:0];

        [v23 setProperty:&__kCFBooleanTrue forKey:v13];
        objc_super v24 = v23;
        CFStringRef v25 = @"DISPLAY_FILTER_COLOR";
        v9 = CAGradientLayer_ptr;
        uint64_t v26 = v16;
      }
      else
      {
        [v19 setProperty:0 forKey:v12];
        [v7 addObject:v19];
        uint64_t v21 = v12;
        v27 = settingsLocString(@"GRAY_SCALE", @"Accessibility");
        v23 = +[PSSpecifier preferenceSpecifierNamed:v27 target:self set:"setGrayscaleEnabled:specifier:" get:"grayscaleEnabled:" detail:0 cell:6 edit:0];

        CFStringRef v25 = (const __CFString *)&__kCFBooleanTrue;
        objc_super v24 = v23;
        uint64_t v26 = v13;
      }
      [v24 setProperty:v25 forKey:v26];
      [v7 addObject:v23];
      v28 = [v9[120] emptyGroupSpecifier];

      v29 = settingsLocString(@"ReduceWhitePointFooterText", @"Accessibility");
      uint64_t v48 = v21;
      [v28 setProperty:v29 forKey:v21];

      [v28 setProperty:&__kCFBooleanTrue forKey:v13];
      [v7 addObject:v28];
      v30 = v9[120];
      v31 = settingsLocString(@"REDUCE_WHITE_POINT", @"Accessibility");
      v32 = [v30 preferenceSpecifierNamed:v31 target:self set:"setWhitePointEnabled:specifier:" get:"whitePointEnabled:" detail:0 cell:6 edit:0];

      [v32 setProperty:@"WHITE_POINT" forKey:v16];
      [v32 setProperty:&__kCFBooleanTrue forKey:v13];
      [(AXDisplayController *)self setReduceWhitePointSpecifier:v32];
      [v7 addObject:v32];
      v33 = [v9[120] preferenceSpecifierNamed:0 target:self set:"setWhitepointIntensity:specifier:" get:"whitepointIntensity:" detail:0 cell:5 edit:0];
      [v33 setProperty:@"WHITE_POINT_INTENSITY" forKey:v16];
      [v33 setProperty:objc_opt_class() forKey:PSCellClassKey];
      [v33 setProperty:&__kCFBooleanTrue forKey:v13];
      [(AXDisplayController *)self setReduceWhitePointIntensitySpecifier:v33];
      v34 = [(AXDisplayController *)self reduceWhitePointSpecifier];
      v35 = [(AXDisplayController *)self whitePointEnabled:v34];
      uint64_t v36 = v16;
      unsigned int v37 = [v35 BOOLValue];

      if (v37)
      {
        v38 = [(AXDisplayController *)self reduceWhitePointIntensitySpecifier];
        [v7 addObject:v38];
      }
      if (MGGetBoolAnswer())
      {
        v39 = [v9[120] emptyGroupSpecifier];

        v40 = AXLocStringKeyForHomeButton();
        v41 = settingsLocString(v40, @"DisplayFilterSettings");
        [v39 setProperty:v41 forKey:v48];

        [v39 setProperty:&__kCFBooleanFalse forKey:v13];
        [v7 addObject:v39];
        v42 = v9[120];
        v43 = settingsLocString(@"AUTO_BRIGHTNESS", @"DisplayFilterSettings");
        v32 = [v42 preferenceSpecifierNamed:v43 target:self set:"setAutoBrightnessEnabled:specifier:" get:"autoBrightnessEnabled:" detail:0 cell:6 edit:0];

        [v32 setProperty:&__kCFBooleanFalse forKey:v13];
        v44 = +[NSNumber numberWithBool:BKSDisplayBrightnessIsBrightnessLevelControlAvailable()];
        [v32 setProperty:v44 forKey:PSEnabledKey];

        [v32 setProperty:@"AUTO_BRIGHTNESS" forKey:v36];
        [v7 addObject:v32];
      }
      uint64_t v5 = v49;
    }
    [(AXDisplayController *)self filterBuddy:v7];
    id v45 = [v7 copy];
    v46 = *(void **)&self->super.AXUISettingsListController_opaque[v5];
    *(void *)&self->super.AXUISettingsListController_opaque[v5] = v45;

    CFStringRef v6 = *(void **)&self->super.AXUISettingsListController_opaque[v5];
  }

  return v6;
}

- (void)reloadSpecifiers
{
  v3.receiver = self;
  v3.super_class = (Class)AXDisplayController;
  [(AXDisplayController *)&v3 reloadSpecifiers];
  [(AXDisplayController *)self _updateFilterOptionSpecifiers];
}

- (void)_updateFilterOptionSpecifiers
{
  objc_super v3 = [(AXDisplayController *)self reduceWhitePointSpecifier];
  v4 = [(AXDisplayController *)self whitePointEnabled:v3];
  unsigned __int8 v5 = [v4 BOOLValue];

  if (v5)
  {
    CFStringRef v6 = [(AXDisplayController *)self specifiers];
    id v7 = [(AXDisplayController *)self reduceWhitePointIntensitySpecifier];
    unsigned __int8 v8 = [v6 containsObject:v7];

    if (v8) {
      return;
    }
    id v9 = [(AXDisplayController *)self reduceWhitePointIntensitySpecifier];
    -[AXDisplayController insertSpecifier:afterSpecifierID:animated:](self, "insertSpecifier:afterSpecifierID:animated:");
  }
  else
  {
    id v9 = [(AXDisplayController *)self reduceWhitePointIntensitySpecifier];
    -[AXDisplayController removeSpecifier:animated:](self, "removeSpecifier:animated:");
  }
}

- (id)grayscaleEnabled:(id)a3
{
  uint64_t v3 = _AXSGrayscaleEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setGrayscaleEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  __AXSGrayscaleSetEnabled(v4);
}

- (id)colorFiltersEnabled:(id)a3
{
  if (MADisplayFilterPrefGetCategoryEnabled()) {
    uint64_t v3 = @"ON";
  }
  else {
    uint64_t v3 = @"OFF";
  }

  return settingsLocString(v3, @"Accessibility");
}

- (void)setAutoBrightnessEnabled:(id)a3 specifier:(id)a4
{
  [a3 BOOLValue];
  BKSDisplayBrightnessSetAutoBrightnessEnabled();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v5 = (const __CFString *)kAXSAutoBrightnessChangedNotification;

  CFNotificationCenterPostNotification(DarwinNotifyCenter, v5, 0, 0, 1u);
}

- (id)autoBrightnessEnabled:(id)a3
{
  uint64_t v3 = _AXSAutoBrightnessEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setClassicInvertEnabled:(id)a3 specifier:(id)a4
{
  id v5 = [a3 BOOLValue];
  CFStringRef v6 = +[AXSettings sharedInstance];
  [v6 setClassicInvertColors:v5];

  [(AXDisplayController *)self reloadSpecifierID:@"smartInvert"];
}

- (id)classicInvertEnabled:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = [v3 classicInvertColors];

  return +[NSNumber numberWithBool:v4];
}

- (id)whitepointIntensity:(id)a3
{
  MADisplayFilterPrefGetReduceWhitePointIntensity();

  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
}

- (void)setWhitepointIntensity:(id)a3 specifier:(id)a4
{
  id v4 = [a3 floatValue];
  v5.n128_f64[0] = v5.n128_f32[0];

  _MADisplayFilterPrefSetReduceWhitePointIntensity(v4, v5);
}

- (id)whitePointEnabled:(id)a3
{
  BOOL v3 = _AXSReduceWhitePointEnabled() != 0;

  return +[NSNumber numberWithBool:v3];
}

- (void)setWhitePointEnabled:(id)a3 specifier:(id)a4
{
  [a3 BOOLValue];
  _AXSSetReduceWhitePointEnabled();

  [(AXDisplayController *)self _updateFilterOptionSpecifiers];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)AXDisplayController;
  id v4 = [(AXDisplayController *)&v10 tableView:a3 cellForRowAtIndexPath:a4];
  __n128 v5 = [v4 specifier];
  CFStringRef v6 = [v5 propertyForKey:PSKeyNameKey];
  unsigned int v7 = [v6 isEqualToString:@"OnOffLabels"];

  if (v7)
  {
    unsigned __int8 v8 = [v4 control];
    [v8 _setAlwaysShowsOnOffLabel:1];
  }

  return v4;
}

- (PSSpecifier)reduceWhitePointIntensitySpecifier
{
  return self->_reduceWhitePointIntensitySpecifier;
}

- (void)setReduceWhitePointIntensitySpecifier:(id)a3
{
}

- (PSSpecifier)reduceWhitePointSpecifier
{
  return self->_reduceWhitePointSpecifier;
}

- (void)setReduceWhitePointSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reduceWhitePointSpecifier, 0);
  objc_storeStrong((id *)&self->_reduceWhitePointIntensitySpecifier, 0);

  objc_storeStrong((id *)&self->_helper, 0);
}

@end