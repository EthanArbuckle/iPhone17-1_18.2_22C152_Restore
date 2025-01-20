@interface AccessibilitySettingsController
+ (void)formatSearchEntries:(id)a3 parent:(id)a4;
- (AccessibilitySettingsController)init;
- (BOOL)_shouldUseGraphicsRecipes;
- (id)_airPodDevices;
- (id)_customGraphicIconWithSymbol:(id)a3 systemColor:(int64_t)a4;
- (id)_customGraphicIconWithSymbol:(id)a3 systemColor:(int64_t)a4 bundleURL:(id)a5;
- (id)_customGraphicIconWithSymbol:(id)a3 systemColor:(int64_t)a4 useHierarchical:(BOOL)a5;
- (id)_graphicIconForBundleIdentifier:(id)a3;
- (id)_iconImageFromISIcon:(id)a3;
- (id)_iconImageWithBackgroundForSymbolImage:(id)a3 backgroundColor:(id)a4;
- (id)_predefinedGraphicIconNamed:(id)a3;
- (id)_prepareAirPodSpecifierForDevices:(id)a3;
- (id)_roundedSettingsIcon:(id)a3;
- (id)_tableCellImageForImage:(id)a3;
- (id)adaptiveVoiceShortcutsEnabled:(id)a3;
- (id)commandAndControlEnabled:(id)a3;
- (id)descriptiveVideoEnabled:(id)a3;
- (id)guidedAccessEnabled:(id)a3;
- (id)hapticMusicEnabled:(id)a3;
- (id)hoverTextEnabled:(id)a3;
- (id)liveSpeechEnabled:(id)a3;
- (id)onDeviceEyeTrackingEnabled:(id)a3;
- (id)rttEnabled:(id)a3;
- (id)scatEnabled:(id)a3;
- (id)soundDetectionIsRunning:(id)a3;
- (id)specifierForKey:(id)a3;
- (id)specifierTitle:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tripleClickStatus:(id)a3;
- (id)voiceOverTouchEnabled:(id)a3;
- (id)zoomTouchEnabled:(id)a3;
- (void)_handleInvertColorsEnabled:(BOOL)a3 specifier:(id)a4;
- (void)_monitorForPairedAirPods;
- (void)_monitorPencilSupport;
- (void)_orientationChange:(id)a3;
- (void)_setPencilSpecifierShown:(BOOL)a3;
- (void)_showAirPodsSpecifierWithAirPods:(id)a3;
- (void)confirmDisablingWithString:(id)a3 forKey:(id)a4 confirmedBlock:(id)a5 canceledBlock:(id)a6 inWindow:(id)a7;
- (void)connectedPointerDevicesDidChange:(id)a3;
- (void)dealloc;
- (void)deviceMonitorDidDetectDeviceEvent:(id)a3;
- (void)disableOption:(id)a3;
- (void)handleReloadSpecifiers;
- (void)handleTeachableMomentsNotification;
- (void)showPersonalVoiceController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeActive;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation AccessibilitySettingsController

- (AccessibilitySettingsController)init
{
  v63.receiver = self;
  v63.super_class = (Class)AccessibilitySettingsController;
  v2 = [(AccessibilitySettingsBaseController *)&v63 init];
  if (v2)
  {
    +[AccessibilitySettingsControllerUtilities initializeTipKit];
    if (+[NSThread isMainThread])
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_accessibilityiTunesSettings, kAXSiTunesAccessibilityStatusChangedNotification, 0, (CFNotificationSuspensionBehavior)1028);
      v4 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v4, v2, (CFNotificationCallback)_accessibilityiTunesSettings, kAXSVoiceOverTouchEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
      v5 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v5, v2, (CFNotificationCallback)_accessibilityiTunesSettings, kAXSPreferredFontSizeChangedNotification, 0, (CFNotificationSuspensionBehavior)1028);
      v6 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v6, v2, (CFNotificationCallback)_accessibilityiTunesSettings, kAXSZoomTouchEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
      v7 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v7, v2, (CFNotificationCallback)_accessibilityiTunesSettings, kAXSInvertColorsEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
      v8 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v8, v2, (CFNotificationCallback)_accessibilityiTunesSettings, kAXSGrayscaleEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
      v9 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v9, v2, (CFNotificationCallback)_accessibilityiTunesSettings, kAXSTripleHomeEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
      v10 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v10, v2, (CFNotificationCallback)_accessibilityiTunesSettings, kAXSAssistiveTouchEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)_accessibilityiTunesSettings, kAXSAssistiveTouchScannerEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
      v12 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver(v12, v2, (CFNotificationCallback)_accessibilityiTunesSettings, kAXSCommandAndControlEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
      v13 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver(v13, v2, (CFNotificationCallback)_accessibilityiTunesSettings, kAXSFullKeyboardAccessEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
      v14 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver(v14, v2, (CFNotificationCallback)_accessibilityiTunesSettings, kAXSPhotosensitiveMitigationEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
      v15 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver(v15, v2, (CFNotificationCallback)_accessibilityiTunesSettings, kAXSClarityUIEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
      v16 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver(v16, v2, (CFNotificationCallback)_accessibilityiTunesSettings, kAXSHoverTextEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
      v17 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v17, v2, (CFNotificationCallback)_accessibilityiTunesSettings, kAXSHomeClickSpeedChangedNotification, 0, (CFNotificationSuspensionBehavior)1028);
      v18 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v18, v2, (CFNotificationCallback)_accessibilityiTunesSettings, @"com.apple.mediaaccessibility.audibleMediaSettingsChanged", 0, (CFNotificationSuspensionBehavior)1028);
      v19 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver(v19, v2, (CFNotificationCallback)_accessibilityiTunesSettings, kAXSAssistiveTouchScannerEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
      v20 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver(v20, v2, (CFNotificationCallback)_accessibilityiTunesSettings, kAXSVisualAlertEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
      v21 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver(v21, v2, (CFNotificationCallback)_accessibilityiTunesSettings, kAXSHapticMusicPreferenceDidChangeNotification, 0, (CFNotificationSuspensionBehavior)1028);
      v22 = +[NSNotificationCenter defaultCenter];
      [v22 addObserver:v2 selector:"_orientationChange:" name:UIDeviceOrientationDidChangeNotification object:0];

      v23 = +[RTTServer sharedInstance];
      [v23 primeRTTServer];

      id v24 = +[RTTTelephonyUtilities sharedUtilityProvider];
      id v25 = objc_alloc_init((Class)AXSpeechSettingsModelController);
      [v25 refreshAssetCatalog:1 downloadSamplesIfNeeded:0 restartMigrationIfNeeded:1];

      objc_initWeak(&location, v2);
      v26 = +[AXSettings sharedInstance];
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = __39__AccessibilitySettingsController_init__block_invoke;
      v60[3] = &unk_208798;
      objc_copyWeak(&v61, &location);
      id v27 = objc_loadWeakRetained(&location);
      [v26 registerUpdateBlock:v60 forRetrieveSelector:"touchAccommodationsEnabled" withListener:v27];

      objc_destroyWeak(&v61);
      v28 = +[RTTSettings sharedInstance];
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = __39__AccessibilitySettingsController_init__block_invoke_2;
      v58[3] = &unk_208798;
      objc_copyWeak(&v59, &location);
      [v28 registerUpdateBlock:v58 forRetrieveSelector:"TTYSoftwareEnabled" withListener:v2];

      v29 = +[RTTSettings sharedInstance];
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = __39__AccessibilitySettingsController_init__block_invoke_4;
      v56[3] = &unk_208798;
      objc_copyWeak(&v57, &location);
      [v29 registerUpdateBlock:v56 forRetrieveSelector:"TTYHardwareEnabled" withListener:v2];

      v30 = +[AXSDSettings sharedInstance];
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = __39__AccessibilitySettingsController_init__block_invoke_6;
      v54[3] = &unk_208798;
      objc_copyWeak(&v55, &location);
      [v30 registerUpdateBlock:v54 forRetrieveSelector:"soundDetectionState" withListener:v2];

      [(AccessibilitySettingsController *)v2 _monitorPencilSupport];
      v31 = AXAssetAndDataClient();
      v32 = +[AXAccessQueue mainAccessQueue];
      [v31 sendAsynchronousMessage:&__NSDictionary0__struct withIdentifier:3 targetAccessQueue:v32 completion:0];

      objc_destroyWeak(&v55);
      objc_destroyWeak(&v57);
      objc_destroyWeak(&v59);
      objc_destroyWeak(&location);
    }
    v33 = settingsLocString(@"PencilTitle", @"Accessibility");
    uint64_t v34 = +[PSSpecifier preferenceSpecifierNamed:v33 target:0 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    pencilSpecifier = v2->_pencilSpecifier;
    v2->_pencilSpecifier = (PSSpecifier *)v34;

    v36 = v2->_pencilSpecifier;
    v37 = [(AccessibilitySettingsBaseController *)v2 imageForKey:@"Pencil"];
    [(PSSpecifier *)v36 setProperty:v37 forKey:PSIconImageKey];

    v38 = +[AXAirPodSettingsManager sharedInstance];
    v39 = [v38 titleForSettings];
    uint64_t v40 = +[PSSpecifier preferenceSpecifierNamed:v39 target:0 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    airPodSpecifier = v2->_airPodSpecifier;
    v2->_airPodSpecifier = (PSSpecifier *)v40;

    [(PSSpecifier *)v2->_airPodSpecifier setProperty:@"AIRPODS" forKey:PSIDKey];
    [(PSSpecifier *)v2->_airPodSpecifier ax_applyCustomAccessibilityGraphicIconNamed:@"airpods"];
    v52[1] = _NSConcreteStackBlock;
    v52[2] = (id)3221225472;
    v52[3] = __39__AccessibilitySettingsController_init__block_invoke_7;
    v52[4] = &unk_2087C0;
    v42 = v2;
    v53 = v42;
    AXPerformBlockAsynchronouslyOnMainThread();
    v43 = +[AXPointerDeviceManager sharedInstance];
    [v43 addObserver:v42];

    objc_initWeak(&location, v42);
    v44 = +[AXSettings sharedInstance];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = __39__AccessibilitySettingsController_init__block_invoke_8;
    v51[3] = &unk_208798;
    objc_copyWeak(v52, &location);
    id v45 = objc_loadWeakRetained(&location);
    [v44 registerUpdateBlock:v51 forRetrieveSelector:"isAdaptiveVoiceShortcutsEnabled" withListener:v45];

    objc_destroyWeak(v52);
    if (AXDeviceSupportsOnDeviceEyeTracking())
    {
      v46 = +[AXSettings sharedInstance];
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = __39__AccessibilitySettingsController_init__block_invoke_9;
      v49[3] = &unk_208798;
      objc_copyWeak(&v50, &location);
      [v46 registerUpdateBlock:v49 forRetrieveSelector:"assistiveTouchMouseOnDeviceEyeTrackingEnabled" withListener:v42];

      objc_destroyWeak(&v50);
    }
    v47 = v42;
    objc_destroyWeak(&location);
  }
  return v2;
}

void __39__AccessibilitySettingsController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __39__AccessibilitySettingsController_init__block_invoke_2(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  AXPerformBlockAsynchronouslyOnMainThread();
  objc_destroyWeak(&v1);
}

void __39__AccessibilitySettingsController_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __39__AccessibilitySettingsController_init__block_invoke_4(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  AXPerformBlockAsynchronouslyOnMainThread();
  objc_destroyWeak(&v1);
}

void __39__AccessibilitySettingsController_init__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __39__AccessibilitySettingsController_init__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

id __39__AccessibilitySettingsController_init__block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _monitorForPairedAirPods];
}

void __39__AccessibilitySettingsController_init__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __39__AccessibilitySettingsController_init__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveEveryObserver(LocalCenter, self);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  [(AXDeviceMonitor *)self->_pencilMonitor invalidate];
  v6 = +[AXPointerDeviceManager sharedInstance];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)AccessibilitySettingsController;
  [(AccessibilitySettingsBaseController *)&v7 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AccessibilitySettingsController;
  [(AccessibilitySettingsController *)&v10 viewDidAppear:a3];
  id v4 = objc_alloc((Class)_NSLocalizedStringResource);
  v5 = +[NSLocale currentLocale];
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v7 = [v6 bundleURL];
  id v8 = [v4 initWithKey:@"ROOT_LEVEL_TITLE" table:@"Accessibility" locale:v5 bundleURL:v7];

  v9 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Accessibility"];
  [(AccessibilitySettingsController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.accessibility" title:v8 localizedNavigationComponents:&__NSArray0__struct deepLink:v9];
}

- (void)_monitorPencilSupport
{
  v3 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", &off_228FD0, 0);
  [v3 addObject:&off_228FE8];
  v12[0] = @"DeviceUsagePage";
  v12[1] = @"PrimaryUsage";
  v13[0] = &off_229000;
  v13[1] = &off_229018;
  v12[2] = @"ProductIDArray";
  v13[2] = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  id v5 = objc_alloc((Class)AXDeviceMonitor);
  v6 = +[NSRunLoop mainRunLoop];
  objc_super v7 = (AXDeviceMonitor *)[v5 initWithMatchingDictionary:v4 callbackRunLoop:v6];
  pencilMonitor = self->_pencilMonitor;
  self->_pencilMonitor = v7;

  [(AXDeviceMonitor *)self->_pencilMonitor setDelegate:self];
  [(AXDeviceMonitor *)self->_pencilMonitor begin];
  v9 = AXLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Monitoring for pencils: %@", buf, 0xCu);
  }
}

- (id)_airPodDevices
{
  v2 = +[AXAirPodSettingsManager sharedInstance];
  v3 = [v2 pairedAirPods];

  return v3;
}

- (void)_monitorForPairedAirPods
{
  id v3 = [(AccessibilitySettingsController *)self _airPodDevices];
  [(AccessibilitySettingsController *)self _showAirPodsSpecifierWithAirPods:v3];
}

- (id)_prepareAirPodSpecifierForDevices:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    [v4 count];
    [(PSSpecifier *)self->_airPodSpecifier setDetailControllerClass:objc_opt_class()];
    id v5 = AXLogAirPodSettings();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Loading class for AirPods: %@", (uint8_t *)&v8, 0xCu);
    }

    [(PSSpecifier *)self->_airPodSpecifier setProperty:v4 forKey:@"AirPods"];
    v6 = self->_airPodSpecifier;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_showAirPodsSpecifierWithAirPods:(id)a3
{
  id v4 = a3;
  if (AXHasCapability())
  {
    id v5 = [(AccessibilitySettingsController *)self specifiers];
    id v6 = [v5 indexOfObjectPassingTest:&__block_literal_global];

    if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_super v7 = AXLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[AccessibilitySettingsController _showAirPodsSpecifierWithAirPods:](v7);
      }
    }
    id v8 = [(AccessibilitySettingsController *)self _prepareAirPodSpecifierForDevices:v4];
    if (([*(id *)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers] containsObject:self->_airPodSpecifier] & 1) == 0)-[AccessibilitySettingsController insertSpecifier:atIndex:animated:](self, "insertSpecifier:atIndex:animated:", self->_airPodSpecifier, v6, 1); {
  }
    }
  else
  {
    [(AccessibilitySettingsController *)self removeSpecifier:self->_airPodSpecifier animated:1];
  }
}

BOOL __68__AccessibilitySettingsController__showAirPodsSpecifierWithAirPods___block_invoke(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v4 = objc_msgSend(a2, "properties", a3, a4);
  id v5 = [v4 objectForKey:PSIDKey];
  unsigned __int8 v6 = [v5 isEqualToString:@"GENERAL_HEADING"];

  return v6;
}

- (void)willBecomeActive
{
  v3.receiver = self;
  v3.super_class = (Class)AccessibilitySettingsController;
  [(AccessibilitySettingsController *)&v3 willBecomeActive];
  [(AccessibilitySettingsController *)self deviceMonitorDidDetectDeviceEvent:self->_pencilMonitor];
}

- (void)deviceMonitorDidDetectDeviceEvent:(id)a3
{
  if (self->_pencilMonitor == a3)
  {
    id v4 = [a3 copyDevices];
    id v5 = [v4 count];
    unsigned __int8 v6 = AXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Pencil devices: %@", (uint8_t *)&v10, 0xCu);
    }

    if (v5)
    {
      objc_super v7 = [v4 anyObject];

      id v8 = IOHIDDeviceGetProperty((IOHIDDeviceRef)v7, @"ProductID");
      id v9 = AXLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v8;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Found pencil product: %@", (uint8_t *)&v10, 0xCu);
      }

      if (v8) {
        [(PSSpecifier *)self->_pencilSpecifier setProperty:v8 forKey:@"ProductID"];
      }
    }
    [(AccessibilitySettingsController *)self _setPencilSpecifierShown:v5 != 0];
  }
}

- (void)connectedPointerDevicesDidChange:(id)a3
{
}

id __68__AccessibilitySettingsController_connectedPointerDevicesDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)_orientationChange:(id)a3
{
}

- (void)handleReloadSpecifiers
{
  int64_t ignoreNextAXNotificationCount = self->_ignoreNextAXNotificationCount;
  BOOL v4 = ignoreNextAXNotificationCount < 1;
  int64_t v5 = ignoreNextAXNotificationCount - 1;
  if (v4)
  {
    unsigned __int8 v6 = [(AccessibilitySettingsController *)self view];
    [v6 setNeedsLayout];

    [(AccessibilitySettingsController *)self reloadSpecifiers];
  }
  else
  {
    self->_int64_t ignoreNextAXNotificationCount = v5;
  }
}

+ (void)formatSearchEntries:(id)a3 parent:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = +[NSMutableArray array];
  +[NSMutableArray array];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __62__AccessibilitySettingsController_formatSearchEntries_parent___block_invoke;
  v11[3] = &unk_208828;
  id v12 = v7;
  id v13 = v5;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v14;
  id v9 = v5;
  id v10 = v7;
  [v6 enumerateObjectsUsingBlock:v11];
  [v6 removeObjectsInArray:v8];
  [v6 addObjectsFromArray:v10];
}

void __62__AccessibilitySettingsController_formatSearchEntries_parent___block_invoke(uint64_t a1, void *a2)
{
  id v23 = a2;
  objc_super v3 = [v23 identifier];
  unsigned int v4 = [v3 isEqualToString:@"HOME_CLICK_TITLE"];

  if (v4)
  {
    if (!AXSettingsRestFingerToOpenIsAvailable()) {
      goto LABEL_16;
    }
    id v5 = settingsLocString(@"RestingUnlockSetting", @"HomeClickSettings");
    id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:0 set:0 get:0 detail:0 cell:6 edit:0];

    id v7 = objc_alloc((Class)PSSearchEntry);
    id v8 = v6;
    id v9 = v23;
LABEL_10:
    id v14 = [v7 initWithSpecifier:v8 parent:v9];
    [*(id *)(a1 + 32) addObject:v14];
LABEL_11:

    goto LABEL_16;
  }
  id v10 = [v23 identifier];
  unsigned int v11 = [v10 isEqualToString:@"KEYBOARDS"];

  if (v11)
  {
    if (!AXDeviceHas3DTouch()) {
      goto LABEL_16;
    }
    if (AXDeviceHasLongPress3dTouch()) {
      id v12 = @"HAPTIC_TOUCH";
    }
    else {
      id v12 = @"FORCE_TOUCH";
    }
    id v13 = settingsLocString(v12, @"Accessibility");
    id v6 = +[PSSpecifier preferenceSpecifierNamed:v13 target:0 set:0 get:0 detail:0 cell:2 edit:0];

    id v7 = objc_alloc((Class)PSSearchEntry);
    id v9 = *(id *)(a1 + 40);
    id v8 = v6;
    goto LABEL_10;
  }
  v15 = [v23 identifier];
  unsigned int v16 = [v15 isEqualToString:@"GRAY_SCALE"];

  if (v16)
  {
    [*(id *)(a1 + 48) addObject:v23];
  }
  else
  {
    v17 = [v23 identifier];
    unsigned int v18 = [v17 isEqualToString:@"DISPLAY_FILTERS"];

    if (v18)
    {
      v19 = settingsLocString(@"DISPLAY_FILTER_COLOR_TITLE", @"DisplayFilterColorSettings");
      id v6 = +[PSSpecifier preferenceSpecifierNamed:v19 target:0 set:0 get:0 detail:0 cell:6 edit:0];

      id v14 = [objc_alloc((Class)PSSearchEntry) initWithSpecifier:v6 parent:v23];
      [*(id *)(a1 + 32) addObject:v14];
      v20 = settingsLocString(@"GRAYSCALE", @"DisplayFilterColorSettings");
      v21 = +[PSSpecifier preferenceSpecifierNamed:v20 target:0 set:0 get:0 detail:0 cell:6 edit:0];

      id v22 = [objc_alloc((Class)PSSearchEntry) initWithSpecifier:v21 parent:v14];
      [*(id *)(a1 + 32) addObject:v22];

      goto LABEL_11;
    }
  }
LABEL_16:
}

- (id)specifierTitle:(id)a3
{
  unsigned int v4 = settingsLocString(a3, @"AccessibilityTitles");
  id v5 = [(AccessibilitySettingsController *)self view];
  id v6 = _UIAdaptLocalizedStringForView();

  return v6;
}

- (BOOL)_shouldUseGraphicsRecipes
{
  return 1;
}

- (id)_customGraphicIconWithSymbol:(id)a3 systemColor:(int64_t)a4 useHierarchical:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = [objc_alloc((Class)IFSymbol) initWithSymbolName:v7 bundleURL:0];

  id v9 = [objc_alloc((Class)IFColor) initWithSystemColor:a4];
  id v10 = [objc_alloc((Class)IFColor) initWithSystemColor:11];
  id v11 = objc_alloc_init((Class)IFGraphicSymbolDescriptor);
  id v20 = v10;
  id v12 = +[NSArray arrayWithObjects:&v20 count:1];
  [v11 setSymbolColors:v12];

  id v19 = v9;
  id v13 = +[NSArray arrayWithObjects:&v19 count:1];
  [v11 setEnclosureColors:v13];

  if (v5) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 1;
  }
  [v11 setRenderingMode:v14];
  v15 = [v8 imageForGraphicSymbolDescriptor:v11];
  unsigned int v16 = +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", [v15 CGImage]);
  v17 = AXResizeImageWithSize();

  return v17;
}

- (id)_customGraphicIconWithSymbol:(id)a3 systemColor:(int64_t)a4 bundleURL:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [objc_alloc((Class)IFSymbol) initWithSymbolName:v8 bundleURL:v7];

  id v10 = [objc_alloc((Class)IFColor) initWithSystemColor:a4];
  id v11 = [objc_alloc((Class)IFColor) initWithSystemColor:11];
  id v12 = objc_alloc_init((Class)IFGraphicSymbolDescriptor);
  id v20 = v11;
  id v13 = +[NSArray arrayWithObjects:&v20 count:1];
  [v12 setSymbolColors:v13];

  id v19 = v10;
  uint64_t v14 = +[NSArray arrayWithObjects:&v19 count:1];
  [v12 setEnclosureColors:v14];

  [v12 setRenderingMode:1];
  v15 = [v9 imageForGraphicSymbolDescriptor:v12];
  unsigned int v16 = +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", [v15 CGImage]);
  v17 = AXResizeImageWithSize();

  return v17;
}

- (id)_customGraphicIconWithSymbol:(id)a3 systemColor:(int64_t)a4
{
  return [(AccessibilitySettingsController *)self _customGraphicIconWithSymbol:a3 systemColor:a4 useHierarchical:0];
}

- (id)_iconImageFromISIcon:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc((Class)ISImageDescriptor), "initWithSize:scale:", 29.0, 29.0, 3.0);
  BOOL v5 = [v3 imageForImageDescriptor:v4];

  id v6 = +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", [v5 CGImage]);
  id v7 = AXResizeImageWithSize();

  return v7;
}

- (id)_predefinedGraphicIconNamed:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)ISIcon) initWithType:v4];

  id v6 = [(AccessibilitySettingsController *)self _iconImageFromISIcon:v5];

  return v6;
}

- (id)_graphicIconForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)ISIcon) initWithBundleIdentifier:v4];

  id v6 = [(AccessibilitySettingsController *)self _iconImageFromISIcon:v5];

  return v6;
}

- (void)willMoveToParentViewController:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AccessibilitySettingsController;
  -[AccessibilitySettingsController willMoveToParentViewController:](&v8, "willMoveToParentViewController:");
  if (!a3)
  {
    id v5 = [(AccessibilitySettingsController *)self parentViewController];
    id v6 = [v5 navigationItem];
    [v6 setTitleView:0];

    id v7 = [(AccessibilitySettingsController *)self navigationItem];
    [v7 setTitleView:0];
  }
}

- (id)specifiers
{
  id v3 = *(void **)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3) {
    goto LABEL_77;
  }
  uint64_t v113 = OBJC_IVAR___PSListController__specifiers;
  id v4 = [objc_allocWithZone((Class)NSMutableArray) init];
  [(AccessibilitySettingsController *)self setTitle:0];
  id v5 = +[PSSpecifier groupSpecifierWithID:@"ACCESSIBILITY_PLACARD_GROUP"];
  [v4 addObject:v5];
  id v6 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:4 edit:0];

  uint64_t v7 = objc_opt_class();
  uint64_t v114 = PSCellClassKey;
  objc_msgSend(v6, "setProperty:forKey:", v7);
  uint64_t v8 = PSIDKey;
  [v6 setProperty:@"ACCESSIBILITY_PLACARD" forKey:PSIDKey];
  [v4 addObject:v6];
  id v9 = settingsLocString(@"ROOT_LEVEL_TITLE", @"Accessibility");
  id v10 = [(AccessibilitySettingsController *)self navigationItem];
  [v10 setBackButtonTitle:v9];

  id v11 = [(AccessibilitySettingsController *)self specifierTitle:@"VISION"];
  id v12 = +[PSSpecifier groupSpecifierWithName:v11];

  [v12 setProperty:@"VISION" forKey:v8];
  [v4 addObject:v12];
  unsigned __int8 v111 = [(AccessibilitySettingsController *)self _shouldUseGraphicsRecipes];
  if ([(AccessibilitySettingsBaseController *)self isSettingAvailableOnPlatform])
  {
    id v13 = [(AccessibilitySettingsController *)self specifierTitle:@"VOICEOVER_TITLE"];
    uint64_t v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:"voiceOverTouchEnabled:" detail:objc_opt_class() cell:2 edit:0];

    [v14 setProperty:@"VOICEOVER_TITLE" forKey:v8];
    [v14 setProperty:@"VoiceOverSettings" forKey:PSSpecifierSearchPlistKey];
    objc_msgSend(v14, "ax_applyCustomAccessibilityGraphicIconNamed:", @"voiceover");
    [v4 addObject:v14];
    v15 = [(AccessibilitySettingsController *)self specifierTitle:@"ZOOM_TITLE"];
    id v12 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:"zoomTouchEnabled:" detail:objc_opt_class() cell:2 edit:0];

    [v12 setProperty:@"ZOOM_TITLE" forKey:v8];
    objc_msgSend(v12, "ax_applyCustomAccessibilityGraphicIconNamed:", @"zoom");
    [v4 addObject:v12];
  }
  if (AXHasCapability())
  {
    unsigned int v16 = [(AccessibilitySettingsController *)self specifierTitle:@"HOVERTEXT_TITLE"];
    v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:0 get:"hoverTextEnabled:" detail:objc_opt_class() cell:2 edit:0];

    [v17 setProperty:@"HOVERTEXT_TITLE" forKey:v8];
    objc_msgSend(v17, "ax_applyCustomAccessibilityGraphicIconNamed:", @"hovertext");
    [v17 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    [v4 addObject:v17];
    id v12 = v17;
  }
  unsigned int v18 = [(AccessibilitySettingsController *)self specifierTitle:@"DISPLAY_AND_TEXT"];
  id v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  [v19 setProperty:@"DISPLAY_AND_TEXT" forKey:v8];
  objc_msgSend(v19, "ax_applyCustomAccessibilityGraphicIconNamed:", @"text.size");
  [v19 setProperty:objc_opt_class() forKey:v114];
  [v4 addObject:v19];
  id v20 = [(AccessibilitySettingsController *)self specifierTitle:@"MOTION_TITLE"];
  v21 = +[PSSpecifier preferenceSpecifierNamed:v20 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  [v21 setProperty:@"MOTION_TITLE" forKey:v8];
  objc_msgSend(v21, "ax_applyCustomAccessibilityGraphicIconNamed:", @"motion");
  [v4 addObject:v21];
  id v22 = [(AccessibilitySettingsController *)self specifierTitle:@"SPEECH_TITLE"];
  id v23 = +[PSSpecifier preferenceSpecifierNamed:v22 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  [v23 setProperty:@"SPEECH_TITLE" forKey:v8];
  objc_msgSend(v23, "ax_applyCustomAccessibilityGraphicIconNamed:", @"spoken.content");
  uint64_t v24 = PSSpecifierSearchPlistKey;
  [v23 setProperty:@"SpeechSettings" forKey:PSSpecifierSearchPlistKey];
  [v23 setProperty:objc_opt_class() forKey:v114];
  [v4 addObject:v23];
  if ([(AccessibilitySettingsBaseController *)self isSettingAvailableOnPlatform])
  {
    id v25 = [(AccessibilitySettingsController *)self specifierTitle:@"DESCRIPTIVE_VIDEO_SETTING"];
    v26 = +[PSSpecifier preferenceSpecifierNamed:v25 target:self set:0 get:"descriptiveVideoEnabled:" detail:objc_opt_class() cell:2 edit:0];

    [v26 setProperty:@"DESCRIPTIVE_VIDEO" forKey:v8];
    objc_msgSend(v26, "ax_applyCustomAccessibilityGraphicIconNamed:", @"audio.descriptions");
    [v4 addObject:v26];
    id v23 = v26;
  }
  id v27 = [(AccessibilitySettingsController *)self specifierTitle:@"MOBILITY_HEADING"];
  v28 = +[PSSpecifier groupSpecifierWithName:v27];

  [v28 setProperty:@"MOBILITY_HEADING" forKey:v8];
  [v4 addObject:v28];
  v29 = [(AccessibilitySettingsController *)self specifierTitle:@"TOUCH"];
  v30 = +[PSSpecifier preferenceSpecifierNamed:v29 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  [v30 setProperty:@"TOUCH_REACHABILITY_TITLE" forKey:v8];
  objc_msgSend(v30, "ax_applyCustomAccessibilityGraphicIconNamed:", @"touch");
  [v4 addObject:v30];
  if (AXDeviceHasPearl())
  {
    v31 = [(AccessibilitySettingsController *)self specifierTitle:@"FACE_ID"];
    v32 = +[PSSpecifier preferenceSpecifierNamed:v31 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    objc_msgSend(v32, "ax_applyCustomAccessibilityGraphicIconNamed:", @"faceid");
    [v32 setProperty:@"FACE_ID" forKey:v8];
    [v4 addObject:v32];
    v30 = v32;
  }
  if ([(AccessibilitySettingsBaseController *)self isSettingAvailableOnPlatform])
  {
    v33 = [(AccessibilitySettingsController *)self specifierTitle:@"ScannerSwitchTitle"];
    uint64_t v34 = +[PSSpecifier preferenceSpecifierNamed:v33 target:self set:0 get:"scatEnabled:" detail:objc_opt_class() cell:2 edit:0];

    objc_msgSend(v34, "ax_applyCustomAccessibilityGraphicIconNamed:", @"switch.control");
    [v34 setProperty:@"ScannerSwitchTitle" forKey:v8];
    [v4 addObject:v34];
    v30 = v34;
  }
  if (specifiers_onceToken != -1) {
    dispatch_once(&specifiers_onceToken, &__block_literal_global_531);
  }
  v35 = [(AccessibilitySettingsController *)self specifierTitle:@"CommandAndControlTitle"];
  v36 = +[PSSpecifier preferenceSpecifierNamed:v35 target:self set:0 get:"commandAndControlEnabled:" detail:specifiers_CACSettingsControllerClass cell:2 edit:0];

  [v36 setProperty:@"CommandAndControlTitle" forKey:v8];
  v37 = +[NSBundle bundleForClass:objc_opt_class()];
  v112 = +[UIImage imageNamed:@"Command&Control" inBundle:v37];

  objc_msgSend(v36, "ax_applyCustomAccessibilityGraphicIconNamed:", @"voice.control");
  [v4 addObject:v36];
  if (AXHasCapability())
  {
    v38 = [(AccessibilitySettingsController *)self specifierTitle:@"OnDeviceEyeTrackingTitle"];
    v39 = +[PSSpecifier preferenceSpecifierNamed:v38 target:self set:0 get:"onDeviceEyeTrackingEnabled:" detail:objc_opt_class() cell:2 edit:0];

    [v39 setProperty:@"OnDeviceEyeTracking" forKey:v8];
    objc_msgSend(v39, "ax_applyCustomAccessibilityGraphicIconNamed:", @"eye.tracking");
    [v4 addObject:v39];
    v36 = v39;
  }
  if ([(AccessibilitySettingsBaseController *)self isSettingAvailableOnPlatform])
  {
    uint64_t v40 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    int v41 = AXHasCapability();
    int v42 = AXHasCapability();
    CFStringRef v43 = @"home.button";
    if (v42) {
      CFStringRef v43 = @"side.button";
    }
    if (v41) {
      CFStringRef v44 = @"top.button";
    }
    else {
      CFStringRef v44 = v43;
    }
    objc_msgSend(v40, "ax_applyCustomAccessibilityGraphicIconNamed:", v44);
    if (AXHasCapability())
    {
      uint64_t v45 = settingsLocString(@"TOP_CLICK_TITLE", @"Accessibility");
    }
    else
    {
      if (AXHasCapability()) {
        CFStringRef v46 = @"SIDE_CLICK_TITLE";
      }
      else {
        CFStringRef v46 = @"HOME_CLICK_TITLE";
      }
      uint64_t v45 = [(AccessibilitySettingsController *)self specifierTitle:v46];
    }
    v47 = (void *)v45;
    [v40 setName:v45];

    if (AXHasCapability())
    {
      v48 = settingsLocStringTopTouchIDButton(@"TOP_TOUCH_CLICK_TITLE");
      [v40 setName:v48];
    }
    [v40 setProperty:@"HOME_CLICK_TITLE" forKey:v8];
    [v4 addObject:v40];
  }
  else
  {
    uint64_t v40 = v36;
  }
  if (AXHasCapability())
  {
    v49 = settingsLocString(@"CAMERA_BUTTON_TITLE", @"Accessibility");
    id v50 = +[PSSpecifier preferenceSpecifierNamed:v49 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    if (v111)
    {
      v51 = +[NSBundle bundleForClass:objc_opt_class()];
      v52 = [v51 bundleURL];
      v53 = [(AccessibilitySettingsController *)self _customGraphicIconWithSymbol:@"Icon-D94" systemColor:7 bundleURL:v52];
      [v50 setProperty:v53 forKey:PSIconImageKey];
    }
    else
    {
      v51 = [(AccessibilitySettingsBaseController *)self imageForKey:@"Icon-D94"];
      [v50 setProperty:v51 forKey:PSIconImageKey];
    }

    [v50 setProperty:@"CAMERA_CONTROL" forKey:v8];
    [v4 addObject:v50];
  }
  else
  {
    id v50 = v40;
  }
  if (AXHasCapability())
  {
    v54 = settingsLocString(@"APPLE_WATCH_REMOTE_SCREEN", @"Accessibility");
    id v55 = +[PSSpecifier preferenceSpecifierNamed:v54 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v55 setProperty:0 forKey:v24];
    [v55 setProperty:@"APPLE_WATCH_REMOTE_SCREEN" forKey:v8];
    [v55 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    objc_msgSend(v55, "ax_applyCustomAccessibilityGraphicIconNamed:", @"applewatch.remote.mirroring");
    [v4 addObject:v55];
    id v50 = v55;
  }
  if (AXRuntimeCheck_SupportsNearbyDeviceControl())
  {
    v56 = settingsLocString(@"CONTROL_NEARBY_DEVICES", @"Accessibility");
    id v57 = +[PSSpecifier preferenceSpecifierNamed:v56 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v57 setProperty:0 forKey:v24];
    [v57 setProperty:@"CONTROL_NEARBY_DEVICES" forKey:v8];
    [v57 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    objc_msgSend(v57, "ax_applyCustomAccessibilityGraphicIconNamed:", @"control.nearby.devices");
    [v4 addObject:v57];
    id v50 = v57;
  }
  v58 = [(AccessibilitySettingsController *)self specifierTitle:@"HEARING"];
  id v59 = +[PSSpecifier groupSpecifierWithName:v58];

  [v59 setProperty:@"HEARING_HEADING" forKey:v8];
  [v4 addObject:v59];
  if ([(AccessibilitySettingsBaseController *)self isSettingAvailableOnPlatform])
  {
    v60 = [(AccessibilitySettingsBaseController *)self detailClassForFeature:1];
    if (v60)
    {
      id v61 = v60;
      v62 = [(AccessibilitySettingsController *)self specifierTitle:@"HEARING_AID_TITLE"];
      objc_super v63 = +[PSSpecifier preferenceSpecifierNamed:v62 target:self set:0 get:0 detail:v61 cell:2 edit:0];

      [v63 setProperty:@"HEARING_AID_TITLE" forKey:v8];
      objc_msgSend(v63, "ax_applyCustomAccessibilityGraphicIconNamed:", @"hearing.devices");
      [v4 addObject:v63];
      id v59 = v63;
    }
    v64 = settingsLocString(@"HEARING_CONTROL_CENTER_TITLE", @"Accessibility");
    v65 = +[PSSpecifier preferenceSpecifierNamed:v64 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v65 setIdentifier:@"HEARING_CONTROL_CENTER"];
    objc_msgSend(v65, "ax_applyCustomAccessibilityGraphicIconNamed:", @"hearing.control.center");
    [v4 addObject:v65];
    v66 = [(AccessibilitySettingsController *)self specifierTitle:@"SOUND_RECOGNITION_TITLE"];
    v67 = +[PSSpecifier preferenceSpecifierNamed:v66 target:self set:0 get:"soundDetectionIsRunning:" detail:objc_opt_class() cell:2 edit:0];

    [v67 setProperty:@"SOUND_RECOGNITION_TITLE" forKey:v8];
    objc_msgSend(v67, "ax_applyCustomAccessibilityGraphicIconNamed:", @"sound.recognition");
    [v67 setProperty:objc_opt_class() forKey:v114];
    [v4 addObject:v67];
    if (!AXHasCapability())
    {
      v68 = v67;
LABEL_57:
      v73 = [(AccessibilitySettingsController *)self specifierTitle:@"AUDIO_VISUAL_TITLE"];
      id v59 = +[PSSpecifier preferenceSpecifierNamed:v73 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

      objc_msgSend(v59, "ax_applyCustomAccessibilityGraphicIconNamed:", @"audio.visual");
      [v59 setProperty:@"AUDIO_VISUAL_TITLE" forKey:v8];
      [v4 addObject:v59];
      goto LABEL_58;
    }
    v68 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:"rttEnabled:" detail:objc_opt_class() cell:2 edit:0];

    [v68 setProperty:@"RTT" forKey:v8];
    objc_msgSend(v68, "ax_applyCustomAccessibilityGraphicIconNamed:", @"rtt.tty");
    [v68 setProperty:0 forKey:v24];
    [v68 setProperty:&off_22BC30 forKey:PSRequiredCapabilitiesKey];
    [v68 setProperty:&__kCFBooleanTrue forKey:PSSpecifierIsSearchableKey];
    [v4 addObject:v68];
    if (AXHasCapability())
    {
      v69 = @"RTT_LABEL";
    }
    else if (AXHasCapability())
    {
      v69 = @"TTY_RTT_LABEL";
    }
    else
    {
      if (!AXHasCapability())
      {
LABEL_54:
        if (AXDeviceIsPhone())
        {
          v71 = +[RTTTelephonyUtilities sharedUtilityProvider];
          id v72 = [v71 activeContextCount];

          if ((unint64_t)v72 >= 2) {
            [v68 setDetailControllerClass:objc_opt_class()];
          }
        }
        goto LABEL_57;
      }
      v69 = @"TTY_LABEL";
    }
    v70 = settingsLocString(v69, @"Accessibility");
    [v68 setName:v70];

    goto LABEL_54;
  }
LABEL_58:
  v74 = [(AccessibilitySettingsController *)self specifierTitle:@"SUBTITLES_CAPTIONING"];
  v75 = +[PSSpecifier preferenceSpecifierNamed:v74 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  [v75 setProperty:@"SUBTITLES_CAPTIONING" forKey:v8];
  objc_msgSend(v75, "ax_applyCustomAccessibilityGraphicIconNamed:", @"subtitles.captioning");
  [v4 addObject:v75];
  if (AXHasCapability())
  {
    v76 = AXUILocalizedStringForKey();
    v77 = +[PSSpecifier preferenceSpecifierNamed:v76 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v77 setIdentifier:@"LIVE_TRANSCRIPTION"];
    objc_msgSend(v77, "ax_applyCustomAccessibilityGraphicIconNamed:", @"live.captions");
    [v77 setProperty:objc_opt_class() forKey:v114];
    [v77 setProperty:&__kCFBooleanFalse forKey:AXInBuddySetupKey];
    [v4 addObject:v77];
    v75 = v77;
  }
  if (AXHasCapability())
  {
    v78 = AXUILocalizedStringForKeyWithTable();
    v79 = +[PSSpecifier preferenceSpecifierNamed:v78 target:self set:0 get:"hapticMusicEnabled:" detail:objc_opt_class() cell:2 edit:0];

    objc_msgSend(v79, "ax_applyCustomAccessibilityGraphicIconNamed:", @"music.haptics");
    [v79 setProperty:@"HAPTIC_MUSIC" forKey:v8];
    [v4 addObject:v79];
    v75 = v79;
  }
  v80 = [(AccessibilitySettingsController *)self specifierTitle:@"SPEECH_HEADING"];
  v81 = +[PSSpecifier groupSpecifierWithName:v80];

  [v81 setProperty:@"SPEECH_HEADING" forKey:v8];
  [v4 addObject:v81];
  if (AXDeviceSupportsLiveSpeech())
  {
    v82 = [(AccessibilitySettingsController *)self specifierTitle:@"LIVE_SPEECH_TITLE"];
    v83 = +[PSSpecifier preferenceSpecifierNamed:v82 target:self set:0 get:"liveSpeechEnabled:" detail:objc_opt_class() cell:2 edit:0];

    [v83 setProperty:@"LIVE_SPEECH_TITLE" forKey:v8];
    objc_msgSend(v83, "ax_applyCustomAccessibilityGraphicIconNamed:", @"live.speech");
    [v4 addObject:v83];
    v81 = v83;
  }
  if (AXHasCapability())
  {
    v84 = [(AccessibilitySettingsController *)self specifierTitle:@"PERSONAL_VOICE_TITLE"];
    v85 = +[PSSpecifier preferenceSpecifierNamed:v84 target:self set:0 get:0 detail:0 cell:2 edit:0];

    [v85 setControllerLoadAction:"showPersonalVoiceController:"];
    [v85 setProperty:@"PERSONAL_VOICE_TITLE" forKey:v8];
    objc_msgSend(v85, "ax_applyCustomAccessibilityGraphicIconNamed:", @"personal.voice");
    [v4 addObject:v85];
    v81 = v85;
  }
  if (AXHasCapability())
  {
    v86 = [(AccessibilitySettingsController *)self specifierTitle:@"ADAPTIVE_VOICE_SHORTCUTS_TITLE"];
    v87 = +[PSSpecifier preferenceSpecifierNamed:v86 target:self set:0 get:"adaptiveVoiceShortcutsEnabled:" detail:objc_opt_class() cell:2 edit:0];

    objc_msgSend(v87, "ax_applyCustomAccessibilityGraphicIconNamed:", @"vocal.shortcuts");
    [v87 setProperty:@"ADAPTIVE_VOICE_SHORTCUTS_TITLE" forKey:v8];
    [v4 addObject:v87];
    v81 = v87;
  }
  v88 = [(AccessibilitySettingsController *)self specifierTitle:@"ACCESSORIES_HEADING"];
  v89 = +[PSSpecifier groupSpecifierWithName:v88];

  [v89 setProperty:@"ACCESSORIES_HEADING" forKey:v8];
  [v4 addObject:v89];
  v90 = [(AccessibilitySettingsController *)self specifierTitle:@"KEYBOARDS"];
  v91 = +[PSSpecifier preferenceSpecifierNamed:v90 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  [v91 setProperty:0 forKey:v24];
  [v91 setProperty:@"KEYBOARDS" forKey:v8];
  objc_msgSend(v91, "ax_applyPredefinedGraphicIconNamed:", @"keyboard");
  [v4 addObject:v91];
  v92 = [(AccessibilitySettingsController *)self specifierTitle:@"APPLE_TV_REMOTE"];
  v93 = +[PSSpecifier preferenceSpecifierNamed:v92 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  objc_msgSend(v93, "ax_applyCustomAccessibilityGraphicIconNamed:", @"appletvremote");
  [v93 setProperty:@"APPLE_TV_REMOTE" forKey:v8];
  [v4 addObject:v93];
  if (AXUICanShowPointerControlSettings())
  {
    v94 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v94 setProperty:0 forKey:v24];
    v95 = settingsLocString(@"PointerControlTitle", @"Accessibility-hello");
    [v94 setName:v95];

    [v94 setProperty:@"POINTER_CONTROL" forKey:v8];
    objc_msgSend(v94, "ax_applyCustomAccessibilityGraphicIconNamed:", @"pointer.control");
    [v4 addObject:v94];
    v93 = v94;
  }
  v96 = [(AccessibilitySettingsController *)self _airPodDevices];
  v97 = [(AccessibilitySettingsController *)self _prepareAirPodSpecifierForDevices:v96];

  if (v97) {
    [v4 addObject:v97];
  }
  v98 = [(AccessibilitySettingsController *)self specifierTitle:@"GENERAL_HEADING"];
  v99 = +[PSSpecifier groupSpecifierWithName:v98];

  [v99 setProperty:@"GENERAL_HEADING" forKey:v8];
  [v4 addObject:v99];
  if ([(AccessibilitySettingsBaseController *)self isSettingAvailableOnPlatform])
  {
    v100 = [(AccessibilitySettingsController *)self specifierTitle:@"GUIDED_ACCESS_TITLE"];
    v101 = +[PSSpecifier preferenceSpecifierNamed:v100 target:self set:0 get:"guidedAccessEnabled:" detail:objc_opt_class() cell:2 edit:0];

    [v101 setProperty:@"GUIDED_ACCESS_TITLE" forKey:v8];
    objc_msgSend(v101, "ax_applyCustomAccessibilityGraphicIconNamed:", @"guided.access");
    [v4 addObject:v101];
    v102 = [(AccessibilitySettingsController *)self specifierTitle:@"CLARITY_UI_TITLE"];
    v103 = +[PSSpecifier preferenceSpecifierNamed:v102 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v103 setProperty:@"CLARITY_UI_TITLE" forKey:v8];
    [v103 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    objc_msgSend(v103, "ax_applyCustomAccessibilityGraphicIconNamed:", @"assistive.access");
    [v103 setObject:objc_opt_class() forKeyedSubscript:v114];
    [v4 addObject:v103];
    if (AXHasCapability())
    {
      v104 = [(AccessibilitySettingsController *)self specifierTitle:@"SIRI_SETTINGS_TITLE"];
      v105 = +[PSSpecifier preferenceSpecifierNamed:v104 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

      [v105 setProperty:@"SIRI_SETTINGS_TITLE" forKey:v8];
      [v105 setObject:&__kCFBooleanTrue forKeyedSubscript:PSLazyIconLoading];
      [v105 setObject:@"com.apple.siri" forKeyedSubscript:PSLazyIconAppID];
      [v4 addObject:v105];
      v103 = v105;
    }
    v106 = [(AccessibilitySettingsController *)self specifierTitle:@"TRIPLE_CLICK_TITLE"];
    v107 = +[PSSpecifier preferenceSpecifierNamed:v106 target:self set:0 get:"tripleClickStatus:" detail:objc_opt_class() cell:2 edit:0];

    [v107 setProperty:@"TRIPLE_CLICK_TITLE" forKey:v8];
    objc_msgSend(v107, "ax_applyPredefinedGraphicIconNamed:", @"accessibility");
    [v4 addObject:v107];
    v108 = [(AccessibilitySettingsController *)self specifierTitle:@"APP_AX_SETTINGS_TITLE"];
    v99 = +[PSSpecifier preferenceSpecifierNamed:v108 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v99 setProperty:@"APP_AX_SETTINGS_TITLE" forKey:v8];
    objc_msgSend(v99, "ax_applyCustomAccessibilityGraphicIconNamed:", @"per.app.settings");
    [v4 addObject:v99];
  }
  [(AccessibilitySettingsController *)self setupLongTitleSpecifiers:v4];
  v109 = *(void **)&self->super.AXUISettingsListController_opaque[v113];
  *(void *)&self->super.AXUISettingsListController_opaque[v113] = v4;

  id v3 = *(void **)&self->super.AXUISettingsListController_opaque[v113];
LABEL_77:

  return v3;
}

void __45__AccessibilitySettingsController_specifiers__block_invoke(id a1)
{
  id v1 = +[NSBundle bundleWithPath:@"/System/Library/PreferenceBundles/VoiceControlSettings.bundle"];
  [v1 load];
  specifiers_CACSettingsControllerClass = (uint64_t)[v1 principalClass];
}

- (id)hapticMusicEnabled:(id)a3
{
  if (_AXSHapticMusicEnabled()) {
    id v3 = @"ON";
  }
  else {
    id v3 = @"OFF";
  }

  return settingsLocString(v3, @"Accessibility");
}

- (id)rttEnabled:(id)a3
{
  id v3 = @"ON";
  if ((+[RTTTelephonyUtilities TTYHardwareEnabledForAnyActiveContext](RTTTelephonyUtilities, "TTYHardwareEnabledForAnyActiveContext", a3) & 1) == 0&& !+[RTTTelephonyUtilities TTYSoftwareEnabledForAnyActiveContext])
  {
    id v3 = @"OFF";
  }

  return settingsLocString(v3, @"Accessibility");
}

- (void)_setPencilSpecifierShown:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = OBJC_IVAR___PSListController__specifiers;
  if ([*(id *)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers] containsObject:self->_pencilSpecifier] == a3)
  {
    uint64_t v7 = AXLogCommon();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    __int16 v12 = 0;
    uint64_t v8 = "Already showing pencil";
    id v9 = (uint8_t *)&v12;
LABEL_12:
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, v8, v9, 2u);
    goto LABEL_13;
  }
  if (!v3)
  {
    [(AccessibilitySettingsController *)self removeSpecifier:self->_pencilSpecifier animated:1];
    uint64_t v7 = AXLogCommon();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    __int16 v10 = 0;
    uint64_t v8 = "Removing pencil specifier";
    id v9 = (uint8_t *)&v10;
    goto LABEL_12;
  }
  id v6 = [*(id *)&self->super.AXUISettingsListController_opaque[v5] indexOfObjectPassingTest:&__block_literal_global_839];
  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [(AccessibilitySettingsController *)self insertSpecifier:self->_pencilSpecifier atIndex:v6 animated:1];
    uint64_t v7 = AXLogCommon();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    uint64_t v8 = "Inserting pencil specifier";
    id v9 = buf;
    goto LABEL_12;
  }
  uint64_t v7 = AXLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    -[AccessibilitySettingsController _showAirPodsSpecifierWithAirPods:](v7);
  }
LABEL_13:
}

BOOL __60__AccessibilitySettingsController__setPencilSpecifierShown___block_invoke(id a1, PSSpecifier *a2, unint64_t a3, BOOL *a4)
{
  id v4 = -[PSSpecifier propertyForKey:](a2, "propertyForKey:", PSIDKey, a4);
  unsigned __int8 v5 = [v4 isEqualToString:@"HEARING_HEADING"];

  return v5;
}

- (id)specifierForKey:(id)a3
{
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *(id *)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    uint64_t v9 = PSKeyNameKey;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        __int16 v12 = objc_msgSend(v11, "properties", (void)v17);
        id v13 = [v12 objectForKey:v9];
        unsigned __int8 v14 = [v13 isEqualToString:v4];

        if (v14)
        {
          id v15 = v11;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_11:

  return v15;
}

- (id)_roundedSettingsIcon:(id)a3
{
  id v3 = a3;
  id v4 = AXSettingsBundle();
  id v5 = +[UIImage imageNamed:v3 inBundle:v4];

  id v6 = [v5 _applicationIconImageForFormat:0 precomposed:0];

  return v6;
}

- (id)_iconImageWithBackgroundForSymbolImage:(id)a3 backgroundColor:(id)a4
{
  return (id)_AXUIIconImageWithBackgroundForImage(a3, a4, CGPointZero.x, CGPointZero.y);
}

- (id)_tableCellImageForImage:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = +[UIScreen mainScreen];
    [v4 scale];
    double v6 = v5;

    double v11 = v6;
    +[UIImage _iconVariantForUIApplicationIconFormat:0 scale:&v11];
    id v7 = v3;
    [v7 CGImage];

    uint64_t v8 = (CGImage *)LICreateIconForImage();
    uint64_t v9 = +[UIImage imageWithCGImage:v8 scale:0 orientation:v11];
    CGImageRelease(v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)confirmDisablingWithString:(id)a3 forKey:(id)a4 confirmedBlock:(id)a5 canceledBlock:(id)a6 inWindow:(id)a7
{
  id v11 = a3;
  __int16 v12 = (void (**)(void))a5;
  id v13 = a6;
  id v14 = a7;
  int BooleaniTunesPreference = _AXSAccessibilityGetBooleaniTunesPreference();
  self->_didConfirmDisabling = 1;
  if (!BooleaniTunesPreference) {
    goto LABEL_3;
  }
  self->_didConfirmDisabling = 0;
  unsigned int v16 = settingsLocString(@"IMPORTANT", @"Accessibility");
  long long v17 = +[UIAlertController alertControllerWithTitle:v16 message:v11 preferredStyle:1];

  long long v18 = settingsLocString(@"CANCEL", @"Accessibility");
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __107__AccessibilitySettingsController_confirmDisablingWithString_forKey_confirmedBlock_canceledBlock_inWindow___block_invoke;
  v28[3] = &unk_2088D0;
  id v29 = v13;
  long long v19 = +[UIAlertAction actionWithTitle:v18 style:1 handler:v28];

  [v17 addAction:v19];
  long long v20 = settingsLocString(@"OK", @"Accessibility");
  id v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  id v25 = __107__AccessibilitySettingsController_confirmDisablingWithString_forKey_confirmedBlock_canceledBlock_inWindow___block_invoke_2;
  v26 = &unk_2088D0;
  id v27 = v12;
  v21 = +[UIAlertAction actionWithTitle:v20 style:0 handler:&v23];

  objc_msgSend(v17, "addAction:", v21, v23, v24, v25, v26);
  id v22 = [v14 rootViewController];
  [v22 presentViewController:v17 animated:1 completion:0];

  if (self->_didConfirmDisabling) {
LABEL_3:
  }
    v12[2](v12);
}

uint64_t __107__AccessibilitySettingsController_confirmDisablingWithString_forKey_confirmedBlock_canceledBlock_inWindow___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __107__AccessibilitySettingsController_confirmDisablingWithString_forKey_confirmedBlock_canceledBlock_inWindow___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)disableOption:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kAXSZoomTouchEnabledPreference])
  {
    +[ZoomController setZoomEnabled:0];
  }
  else if ([v3 isEqualToString:kAXSVoiceOverTouchEnabledPreference])
  {
    +[VoiceOverController setVoiceOverEnabled:0];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)AccessibilitySettingsController;
  id v6 = a4;
  id v7 = [(AccessibilitySettingsController *)&v18 tableView:a3 cellForRowAtIndexPath:v6];
  uint64_t v8 = -[AccessibilitySettingsController specifierForIndexPath:](self, "specifierForIndexPath:", v6, v18.receiver, v18.super_class);

  uint64_t v9 = [v8 propertyForKey:PSIconImageKey];
  if (v9)
  {
    uint64_t v10 = kISImageDescriptorTableUIName;
    id v11 = v7;
    __int16 v12 = +[ISImageDescriptor imageDescriptorNamed:v10];
    [v12 continuousCornerRadius];
    double v14 = v13;

    id v15 = [v11 iconImageView];
    [v15 _setContinuousCornerRadius:v14];

    unsigned int v16 = [v11 iconImageView];

    [v16 setClipsToBounds:1];
  }

  return v7;
}

- (void)_handleInvertColorsEnabled:(BOOL)a3 specifier:(id)a4
{
  id v6 = a4;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __72__AccessibilitySettingsController__handleInvertColorsEnabled_specifier___block_invoke;
  v18[3] = &unk_2088F8;
  v18[4] = self;
  BOOL v19 = a3;
  id v7 = objc_retainBlock(v18);
  uint64_t v8 = v7;
  if (a3)
  {
    ((void (*)(void *))v7[2])(v7);
  }
  else
  {
    uint64_t v9 = settingsLocString(@"CONFIRM_INVERT_COLORS_REMOVAL", @"Accessibility");
    uint64_t v10 = kAXSInvertColorsEnabledByiTunesPreference;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __72__AccessibilitySettingsController__handleInvertColorsEnabled_specifier___block_invoke_2;
    v16[3] = &unk_208920;
    id v17 = v8;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __72__AccessibilitySettingsController__handleInvertColorsEnabled_specifier___block_invoke_3;
    void v13[3] = &unk_208948;
    id v14 = v6;
    id v15 = self;
    id v11 = [(AccessibilitySettingsController *)self view];
    __int16 v12 = [v11 window];
    [(AccessibilitySettingsController *)self confirmDisablingWithString:v9 forKey:v10 confirmedBlock:v16 canceledBlock:v13 inWindow:v12];
  }
}

uint64_t __72__AccessibilitySettingsController__handleInvertColorsEnabled_specifier___block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 208);
  uint64_t result = _AXSInvertColorsSetEnabled();
  ++*(void *)(*(void *)(a1 + 32) + 208);
  return result;
}

uint64_t __72__AccessibilitySettingsController__handleInvertColorsEnabled_specifier___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __72__AccessibilitySettingsController__handleInvertColorsEnabled_specifier___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setProperty:&__kCFBooleanTrue forKey:PSValueKey];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);

  return [v2 reloadSpecifier:v3];
}

- (id)zoomTouchEnabled:(id)a3
{
  if (_AXSZoomTouchEnabled()) {
    uint64_t v3 = @"ON";
  }
  else {
    uint64_t v3 = @"OFF";
  }

  return settingsLocString(v3, @"Accessibility");
}

- (id)hoverTextEnabled:(id)a3
{
  if (_AXSHoverTextEnabled()) {
    uint64_t v3 = @"ON";
  }
  else {
    uint64_t v3 = @"OFF";
  }

  return settingsLocString(v3, @"Accessibility");
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AccessibilitySettingsController;
  -[AccessibilitySettingsBaseController viewWillAppear:](&v6, "viewWillAppear:");
  double v5 = [(AccessibilitySettingsController *)self specifierForKey:@"LARGER_TEXT"];
  [(AccessibilitySettingsController *)self reloadSpecifier:v5 animated:v3];

  AXPerformBlockAsynchronouslyOnMainThread();
  [(AccessibilitySettingsController *)self handleTeachableMomentsNotification];
}

id __50__AccessibilitySettingsController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deviceMonitorDidDetectDeviceEvent:*(void *)(*(void *)(a1 + 32) + 232)];
}

- (void)handleTeachableMomentsNotification
{
  if (_os_feature_enabled_impl())
  {
    v2 = dispatch_get_global_queue(0, 0);
    dispatch_async(v2, &__block_literal_global_866);
  }
}

void __69__AccessibilitySettingsController_handleTeachableMomentsNotification__block_invoke(id a1)
{
  id v1 = AXLogCommon();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_DEFAULT, "Initialize check for teachable accessibility moments.", v4, 2u);
  }

  id v2 = [objc_alloc((Class)AXUIClient) initWithIdentifier:@"AXAssetClient-teachableMoments" serviceBundleName:@"AXAssetAndDataServer"];
  BOOL v3 = +[AXAccessQueue mainAccessQueue];
  [v2 sendAsynchronousMessage:&__NSDictionary0__struct withIdentifier:15 targetAccessQueue:v3 completion:0];
}

- (id)descriptiveVideoEnabled:(id)a3
{
  BOOL v3 = (void *)MAAudibleMediaPrefCopyPreferDescriptiveVideo();
  if ([v3 BOOLValue]) {
    id v4 = @"ON";
  }
  else {
    id v4 = @"OFF";
  }
  double v5 = settingsLocString(v4, @"Accessibility");

  return v5;
}

- (id)guidedAccessEnabled:(id)a3
{
  if (_AXSGuidedAccessEnabled()) {
    BOOL v3 = @"ON";
  }
  else {
    BOOL v3 = @"OFF";
  }

  return settingsLocString(v3, @"Accessibility");
}

- (id)liveSpeechEnabled:(id)a3
{
  BOOL v3 = (const void *)_AXSTripleClickCopyOptions();
  int v4 = _AXSTripleClickContainsOption();
  if (v3) {
    CFRelease(v3);
  }
  if (v4) {
    double v5 = @"ON";
  }
  else {
    double v5 = @"OFF";
  }

  return settingsLocString(v5, @"Accessibility");
}

- (id)adaptiveVoiceShortcutsEnabled:(id)a3
{
  BOOL v3 = +[AXSettings sharedInstance];
  unsigned int v4 = [v3 isAdaptiveVoiceShortcutsEnabled];

  if (v4) {
    double v5 = @"ON";
  }
  else {
    double v5 = @"OFF";
  }

  return settingsLocString(v5, @"Accessibility");
}

- (id)voiceOverTouchEnabled:(id)a3
{
  if (_AXSVoiceOverTouchEnabled()) {
    BOOL v3 = @"ON";
  }
  else {
    BOOL v3 = @"OFF";
  }

  return settingsLocString(v3, @"Accessibility");
}

- (id)scatEnabled:(id)a3
{
  if (_AXSAssistiveTouchScannerEnabled()) {
    BOOL v3 = @"ON";
  }
  else {
    BOOL v3 = @"OFF";
  }

  return settingsLocString(v3, @"Accessibility");
}

- (id)commandAndControlEnabled:(id)a3
{
  if (_AXSCommandAndControlEnabled()) {
    BOOL v3 = @"ON";
  }
  else {
    BOOL v3 = @"OFF";
  }

  return settingsLocString(v3, @"Accessibility");
}

- (id)onDeviceEyeTrackingEnabled:(id)a3
{
  BOOL v3 = +[AXSettings sharedInstance];
  unsigned int v4 = [v3 assistiveTouchMouseOnDeviceEyeTrackingEnabled];

  if (v4) {
    double v5 = @"ON";
  }
  else {
    double v5 = @"OFF";
  }

  return settingsLocString(v5, @"Accessibility");
}

- (id)soundDetectionIsRunning:(id)a3
{
  BOOL v3 = +[AXSDSettings sharedInstance];
  if ([v3 soundDetectionEnabled]) {
    unsigned int v4 = @"ON";
  }
  else {
    unsigned int v4 = @"OFF";
  }
  double v5 = settingsLocString(v4, @"Accessibility");

  return v5;
}

- (id)tripleClickStatus:(id)a3
{
  BOOL v3 = (void *)_AXSTripleClickCopyOptions();
  if ([v3 count])
  {
    if ((unint64_t)[v3 count] < 2)
    {
      if (_AXSTripleClickContainsOption())
      {
        double v5 = +[AXSettings sharedInstance];
        objc_super v6 = (char *)[v5 voiceOverActivationWorkaround];

        if (v6 != (unsigned char *)&dword_0 + 3)
        {
          unsigned int v4 = @"TRIPLE_CLICK_VOICEOVER_SHORT";
          goto LABEL_23;
        }
      }
      else
      {
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_WHITEONBLACK_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_CLASSIC_INVERT_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_REDUCE_TRANSPARENCY_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_REDUCE_MOTION_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_BACKGROUND_SOUNDS_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_LEFT_RIGHT_BALANCE_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_INCREASE_CONTRAST_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          uint64_t v10 = +[AXBackBoardServer server];
          unsigned int v11 = [v10 supportsAccessibilityDisplayFilters];

          if (v11) {
            unsigned int v4 = @"TRIPLE_CLICK_COLOR_FILTER_SHORT";
          }
          else {
            unsigned int v4 = @"TRIPLE_CLICK_GRAYSCALE_SHORT";
          }
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_WHITE_POINT_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_ZOOM_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_LIVE_SPEECH_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_HOVERTEXT_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_HOVERTEXT_TYPING_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_SWITCHOVER_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_ASSISTIVETOUCH_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_GUIDEDACCESS_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_HEARING_AIDS_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_TOUCH_ACCOMMODATIONS_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_MAGNIFIER_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption()) {
          goto LABEL_55;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_COMMAND_AND_CONTROL_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_FULL_KEYBOARD_ACCESS_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
LABEL_55:
          uint64_t v8 = AXUIAssistiveTouchStringForName();
          goto LABEL_24;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_LIVE_TRANSCRIPTION_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_ON_DEVICE_EYE_TRACKING_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_CLARITY_UI_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_NEARBY_DEVICE_CONTROL_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_SPEAK_SCREEN_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_DIM_FLASHING_LIGHTS_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_MOTION_CUES_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_HAPTIC_MUSIC_SHORT";
          goto LABEL_23;
        }
        if (_AXSTripleClickContainsOption())
        {
          unsigned int v4 = @"TRIPLE_CLICK_CONVERSATION_BOOST_SHORT";
          goto LABEL_23;
        }
      }
      id v7 = 0;
      goto LABEL_25;
    }
    unsigned int v4 = @"TRIPLE_CLICK_ASK";
  }
  else
  {
    unsigned int v4 = @"TRIPLE_CLICK_OFF";
  }
LABEL_23:
  uint64_t v8 = settingsLocString(v4, @"TripleClickSettings");
LABEL_24:
  id v7 = (void *)v8;
LABEL_25:

  return v7;
}

- (void)showPersonalVoiceController:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  unsigned int v16 = &v15;
  uint64_t v17 = 0x2050000000;
  double v5 = (void *)getTTSVBUILoaderClass_softClass;
  uint64_t v18 = getTTSVBUILoaderClass_softClass;
  if (!getTTSVBUILoaderClass_softClass)
  {
    location[0] = _NSConcreteStackBlock;
    location[1] = (id)3221225472;
    location[2] = __getTTSVBUILoaderClass_block_invoke;
    location[3] = &unk_2089B8;
    location[4] = &v15;
    __getTTSVBUILoaderClass_block_invoke((uint64_t)location);
    double v5 = (void *)v16[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v15, 8);

  objc_initWeak(location, self);
  Class v7 = NSClassFromString(@"VBManagerViewBridge");
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  unsigned int v11 = __63__AccessibilitySettingsController_showPersonalVoiceController___block_invoke;
  __int16 v12 = &unk_208990;
  objc_copyWeak(&v13, location);
  uint64_t v8 = [(objc_class *)v7 makeVBManagerViewControllerWithAuthenticationCallback:&v9];
  -[AccessibilitySettingsController showController:](self, "showController:", v8, v9, v10, v11, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(location);
}

void __63__AccessibilitySettingsController_showPersonalVoiceController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = [NSClassFromString(@"VoiceManagementViewBridge") makeVoiceManagementViewControllerWithVoiceID:v6 voiceName:v5];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained showController:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airPodSpecifier, 0);
  objc_storeStrong((id *)&self->_pencilMonitor, 0);

  objc_storeStrong((id *)&self->_pencilSpecifier, 0);
}

- (void)_showAirPodsSpecifierWithAirPods:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "could not find place to insert pencil", v1, 2u);
}

@end