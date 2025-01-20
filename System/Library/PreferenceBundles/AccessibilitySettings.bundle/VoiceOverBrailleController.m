@interface VoiceOverBrailleController
- (BOOL)shouldAddBTLEDevice:(id)a3;
- (BOOL)shouldAddClassicDevice:(id)a3;
- (VoiceOverBrailleController)init;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_brailleAutoEnableBluetooth:(id)a3;
- (id)_brailleDisplayAlertDuration:(id)a3;
- (id)_brailleDisplayAutoAdvance:(id)a3;
- (id)_brailleDisplayDebounceTimeout:(id)a3;
- (id)_stringForBrailleMode:(int64_t)a3;
- (id)alwaysUseNemethEnabled:(id)a3;
- (id)bluetoothPowerAlertMessage;
- (id)bluetoothPoweredOffFooter;
- (id)brailleDisplayInput:(id)a3;
- (id)brailleDisplayOutput:(id)a3;
- (id)brailleFormattingEnabled:(id)a3;
- (id)brailleTableCount:(id)a3;
- (id)contractedBrailleEnabled:(id)a3;
- (id)detailSpecifiersForDevice:(id)a3 withTarget:(id)a4;
- (id)devicesGroupName;
- (id)eightDotBrailleEnabled:(id)a3;
- (id)gradeTwoAutoTranslatedEnabled:(id)a3;
- (id)pairedDeviceSpecifiers;
- (id)panningAutoturnReadingContent:(id)a3;
- (id)perkinsChordKeyboardInputEnabled:(id)a3;
- (id)postDevicesSpecifiersGroup;
- (id)softwareKeyboardWithBrailleEnabled:(id)a3;
- (id)soundCurtainEnabled:(id)a3;
- (id)specifiers;
- (id)syncTablesEnabled:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)wordWrapEnabled:(id)a3;
- (int64_t)axDeviceControllerType;
- (void)_bluetoothDeviceLoadFailedTimerFireMethod:(id)a3;
- (void)_connectToBrailleClient:(BOOL)a3;
- (void)_handleBrailleConfigurationChanged;
- (void)_handleFailedToLoadBluetoothDevice:(id)a3;
- (void)_handleSettingsChange:(id)a3;
- (void)_setBrailleAutoEnableBluetooth:(id)a3 specifier:(id)a4;
- (void)_startDeviceLoadFailedTimer;
- (void)_stopDeviceLoadFailedTimer;
- (void)_tipLoaded:(id)a3;
- (void)_updateBrailleWritingCell;
- (void)dealloc;
- (void)deviceConnected:(id)a3;
- (void)handleBrailleConfigurationChanged:(id)a3;
- (void)handleBrailleDidDisconnect:(id)a3;
- (void)handleBrailleDidReconnect:(id)a3;
- (void)handleFailedToLoadBluetoothDevice:(id)a3;
- (void)handleSettingsChange:(id)a3;
- (void)loadSettings;
- (void)setAlwaysUseNemethEnabled:(id)a3 specifier:(id)a4;
- (void)setBluetoothIsBusy:(BOOL)a3;
- (void)setBrailleFormattingEnabled:(id)a3 specifier:(id)a4;
- (void)setContractedBrailleEnabled:(id)a3 specifier:(id)a4;
- (void)setEightDotBrailleEnabled:(id)a3 specifier:(id)a4;
- (void)setGradeTwoAutoTransateEnabled:(id)a3 specifier:(id)a4;
- (void)setPanningAutoturnReadingContent:(id)a3 specifier:(id)a4;
- (void)setPerkinsChordKeyboardInputEnabled:(id)a3 specifier:(id)a4;
- (void)setSoftwareKeyboardWithBrailleEnabled:(id)a3 specifier:(id)a4;
- (void)setSoundCurtainEnabled:(id)a3 specifier:(id)a4;
- (void)setSyncTablesEnabled:(id)a3 specifier:(id)a4;
- (void)setWordWrapEnabled:(id)a3 specifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation VoiceOverBrailleController

- (VoiceOverBrailleController)init
{
  v45.receiver = self;
  v45.super_class = (Class)VoiceOverBrailleController;
  v2 = [(AXBluetoothDevicesController *)&v45 init];
  v3 = v2;
  if (v2)
  {
    [(AXBluetoothDevicesController *)v2 setAuthorizedServices:8224];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_handleSettingsChange, kAXSVoiceOverTouchBrailleMasterStatusCellIndexChangedNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v5, v3, (CFNotificationCallback)_handleSettingsChange, kAXSVoiceOverTouchBrailleVirtualStatusAlignmentChangedNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v3, (CFNotificationCallback)_handleSettingsChange, kAXSVoiceOverTouchBrailleContractionModeChangedNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v7 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v7, v3, (CFNotificationCallback)_handleSettingsChange, kAXSVoiceOverTouchBrailleEightDotModeChangedNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v8 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v8, v3, (CFNotificationCallback)_handleSettingsChange, kAXSVoiceOverTouchBrailleTableIdentifierChangedNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v9, v3, (CFNotificationCallback)_handleSettingsChange, kAXSVoiceOverTouchBrailleLanguageRotorChangedNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v10 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v10, v3, (CFNotificationCallback)_handleSettingsChange, kAXSVoiceOverTouchTactileGraphicsDisplayChangedNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v3 selector:"_coreBluetoothReady:" name:VOSBluetoothCoreBluetoothManagerReadyNotification object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v3 selector:"_tipLoaded:" name:@"AXTipLoaded" object:0];

    objc_initWeak(&location, v3);
    v13 = +[AXSettings sharedInstance];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = __34__VoiceOverBrailleController_init__block_invoke;
    v42[3] = &unk_208798;
    objc_copyWeak(&v43, &location);
    [v13 registerUpdateBlock:v42 forRetrieveSelector:"voiceOverBrailleTableIdentifier" withListener:v3];

    objc_destroyWeak(&v43);
    v14 = +[AXSettings sharedInstance];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = __34__VoiceOverBrailleController_init__block_invoke_2;
    v40[3] = &unk_208798;
    objc_copyWeak(&v41, &location);
    [v14 registerUpdateBlock:v40 forRetrieveSelector:"voiceOverBrailleAlertDisplayDuration" withListener:v3];

    objc_destroyWeak(&v41);
    v15 = +[AXSettings sharedInstance];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = __34__VoiceOverBrailleController_init__block_invoke_3;
    v38[3] = &unk_208798;
    objc_copyWeak(&v39, &location);
    [v15 registerUpdateBlock:v38 forRetrieveSelector:"voiceOverBrailleAlertShowUntilDismissed" withListener:v3];

    objc_destroyWeak(&v39);
    v16 = +[AXSettings sharedInstance];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = __34__VoiceOverBrailleController_init__block_invoke_4;
    v36[3] = &unk_208798;
    objc_copyWeak(&v37, &location);
    [v16 registerUpdateBlock:v36 forRetrieveSelector:"voiceOverBrailleAlertsEnabled" withListener:v3];

    objc_destroyWeak(&v37);
    v17 = +[AXSettings sharedInstance];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = __34__VoiceOverBrailleController_init__block_invoke_5;
    v34[3] = &unk_208798;
    objc_copyWeak(&v35, &location);
    [v17 registerUpdateBlock:v34 forRetrieveSelector:"voiceOverTouchBrailleDisplayOutputMode" withListener:v3];

    objc_destroyWeak(&v35);
    v18 = +[AXSettings sharedInstance];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = __34__VoiceOverBrailleController_init__block_invoke_6;
    v32[3] = &unk_208798;
    objc_copyWeak(&v33, &location);
    [v18 registerUpdateBlock:v32 forRetrieveSelector:"voiceOverTouchBrailleDisplayInputMode" withListener:v3];

    objc_destroyWeak(&v33);
    v19 = +[AXSettings sharedInstance];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = __34__VoiceOverBrailleController_init__block_invoke_7;
    v30[3] = &unk_208798;
    objc_copyWeak(&v31, &location);
    [v19 registerUpdateBlock:v30 forRetrieveSelector:"voiceOverBrailleKeyDebounceTimeout" withListener:v3];

    objc_destroyWeak(&v31);
    v20 = +[AXSettings sharedInstance];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = __34__VoiceOverBrailleController_init__block_invoke_8;
    v28[3] = &unk_208798;
    objc_copyWeak(&v29, &location);
    [v20 registerUpdateBlock:v28 forRetrieveSelector:"voiceOverBrailleAutoAdvanceDuration" withListener:v3];

    objc_destroyWeak(&v29);
    v21 = +[AXSettings sharedInstance];
    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    v25 = __34__VoiceOverBrailleController_init__block_invoke_9;
    v26 = &unk_208798;
    objc_copyWeak(&v27, &location);
    [v21 registerUpdateBlock:&v23 forRetrieveSelector:"voiceOverAlwaysTurnOnBluetooth" withListener:v3];

    objc_destroyWeak(&v27);
    [(VoiceOverBrailleController *)v3 loadSettings];
    objc_destroyWeak(&location);
  }
  return v3;
}

void __34__VoiceOverBrailleController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleSettingsChange:0];
}

void __34__VoiceOverBrailleController_init__block_invoke_2(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 specifierForID:@"voiceOverBrailleAlertDisplayDuration"];
  [v2 reloadSpecifier:v1 animated:0];
}

void __34__VoiceOverBrailleController_init__block_invoke_3(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 specifierForID:@"voiceOverBrailleAlertDisplayDuration"];
  [v2 reloadSpecifier:v1 animated:0];
}

void __34__VoiceOverBrailleController_init__block_invoke_4(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 specifierForID:@"voiceOverBrailleAlertDisplayDuration"];
  [v2 reloadSpecifier:v1 animated:0];
}

void __34__VoiceOverBrailleController_init__block_invoke_5(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 specifierForID:@"BrailleDisplayOutput"];
  [v2 reloadSpecifier:v1 animated:1];
}

void __34__VoiceOverBrailleController_init__block_invoke_6(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 specifierForID:@"BrailleDisplayInput"];
  [v2 reloadSpecifier:v1 animated:1];
}

void __34__VoiceOverBrailleController_init__block_invoke_7(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 specifierForID:@"voiceOverBrailleDebounceTimeout"];
  [v2 reloadSpecifier:v1 animated:1];
}

void __34__VoiceOverBrailleController_init__block_invoke_8(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 specifierForID:@"voiceOverBrailleAutoAdvance"];
  [v2 reloadSpecifier:v1 animated:1];
}

void __34__VoiceOverBrailleController_init__block_invoke_9(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 specifierForID:@"voiceOverAlwaysTurnOnBluetooth"];
  [v2 reloadSpecifier:v1 animated:1];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  [(VoiceOverBrailleController *)self _connectToBrailleClient:0];
  [(VoiceOverBrailleController *)self _stopDeviceLoadFailedTimer];
  v4.receiver = self;
  v4.super_class = (Class)VoiceOverBrailleController;
  [(AXBluetoothDevicesController *)&v4 dealloc];
}

- (int64_t)axDeviceControllerType
{
  return 1;
}

- (void)loadSettings
{
  v3 = [(AXBluetoothDevicesController *)self mainSpecifiersGroup];

  if (!v3)
  {
    objc_super v4 = [(VoiceOverBrailleController *)self loadSpecifiersFromPlistName:@"VoiceOverBrailleOptions" target:self];
    id v28 = +[NSMutableArray arrayWithArray:v4];

    v5 = AXUILocalizedStringForKey();
    id v27 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:"_brailleDisplayAlertDuration:" detail:objc_opt_class() cell:2 edit:0];

    uint64_t v6 = PSIDKey;
    [v27 setProperty:@"voiceOverBrailleAlertDisplayDuration" forKey:PSIDKey];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = PSCellClassKey;
    [v27 setProperty:v7 forKey:PSCellClassKey];
    [v28 addObject:v27];
    v9 = settingsLocString(@"BRAILLE_DISPLAY_KEY_DEBOUNCE_TIMEOUT", @"VoiceOverBrailleOptions");
    v26 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:"_brailleDisplayDebounceTimeout:" detail:objc_opt_class() cell:2 edit:0];

    [v26 setProperty:@"voiceOverBrailleDebounceTimeout" forKey:v6];
    [v26 setProperty:objc_opt_class() forKey:v8];
    [v28 addObject:v26];
    v10 = settingsLocString(@"BRAILLE_DISPLAY_AUTO_ADVANCE", @"VoiceOverBrailleOptions");
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:"_brailleDisplayAutoAdvance:" detail:objc_opt_class() cell:2 edit:0];

    [v11 setProperty:@"voiceOverBrailleAutoAdvance" forKey:v6];
    [v11 setProperty:objc_opt_class() forKey:v8];
    [v28 addObject:v11];
    v12 = +[PSSpecifier emptyGroupSpecifier];
    v13 = settingsLocString(@"ENTER_BRAILLE_CHORDS_ON_KEYBOARD_FOOTER", @"VoiceOverBrailleOptions");
    uint64_t v14 = PSFooterTextGroupKey;
    [v12 setProperty:v13 forKey:PSFooterTextGroupKey];

    [v28 addObject:v12];
    v15 = settingsLocString(@"ENTER_BRAILLE_CHORDS_ON_KEYBOARD", @"VoiceOverBrailleOptions");
    v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:"setPerkinsChordKeyboardInputEnabled:specifier:" get:"perkinsChordKeyboardInputEnabled:" detail:0 cell:6 edit:0];

    [v16 setProperty:@"ENTER_BRAILLE_CHORDS_ON_KEYBOARD" forKey:v6];
    [v28 addObject:v16];
    v17 = +[PSSpecifier emptyGroupSpecifier];

    v18 = AXLocStringKeyForModel();
    v19 = settingsLocString(v18, @"VoiceOverSettings");
    [v17 setProperty:v19 forKey:v14];

    [v28 addObject:v17];
    v20 = settingsLocString(@"SOUND_CURTAIN", @"VoiceOverSettings");
    v21 = +[PSSpecifier preferenceSpecifierNamed:v20 target:self set:"setSoundCurtainEnabled:specifier:" get:"soundCurtainEnabled:" detail:0 cell:6 edit:0];

    [v21 setProperty:@"SOUND_CURTAIN" forKey:v6];
    [v28 addObject:v21];
    v22 = +[PSSpecifier emptyGroupSpecifier];
    v23 = settingsLocString(@"BRAILLE_BLUETOOTH_AUTO_ENABLE_FOOTER", @"VoiceOverBrailleOptions");
    [v22 setProperty:v23 forKey:v14];

    [v28 addObject:v22];
    uint64_t v24 = settingsLocString(@"BRAILLE_BLUETOOTH_AUTO_ENABLE", @"VoiceOverBrailleOptions");
    v25 = +[PSSpecifier preferenceSpecifierNamed:v24 target:self set:"_setBrailleAutoEnableBluetooth:specifier:" get:"_brailleAutoEnableBluetooth:" detail:0 cell:6 edit:0];

    [v25 setProperty:@"voiceOverAlwaysTurnOnBluetooth" forKey:v6];
    [v28 addObject:v25];
    [(AXBluetoothDevicesController *)self setMainSpecifiersGroup:v28];
  }
}

- (id)perkinsChordKeyboardInputEnabled:(id)a3
{
  v3 = +[AXSettings sharedInstance];
  objc_super v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverTouchPerkinsChordKeyboardInputEnabled]);

  return v4;
}

- (void)setPerkinsChordKeyboardInputEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverTouchPerkinsChordKeyboardInputEnabled:v4];
}

- (id)soundCurtainEnabled:(id)a3
{
  v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverSoundCurtain]);

  return v4;
}

- (void)setSoundCurtainEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 BOOLValue])
  {
    uint64_t v8 = settingsLocString(@"SOUND_CURTAIN", @"VoiceOverSettings");
    v9 = settingsLocString(@"CONFIRM_SOUND_CURTAIN_MESSAGE", @"VoiceOverSettings");
    v10 = +[UIAlertController alertControllerWithTitle:v8 message:v9 preferredStyle:1];

    objc_initWeak(&location, self);
    v11 = AXUILocalizedStringForKey();
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __63__VoiceOverBrailleController_setSoundCurtainEnabled_specifier___block_invoke;
    v18[3] = &unk_208F50;
    objc_copyWeak(&v19, &location);
    v12 = +[UIAlertAction actionWithTitle:v11 style:1 handler:v18];

    [v10 addAction:v12];
    v13 = AXUILocalizedStringForKey();
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __63__VoiceOverBrailleController_setSoundCurtainEnabled_specifier___block_invoke_2;
    v16[3] = &unk_208B68;
    id v17 = v6;
    uint64_t v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:v16];

    [v10 addAction:v14];
    [(VoiceOverBrailleController *)self presentViewController:v10 animated:1 completion:0];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    id v15 = [v6 BOOLValue];
    v10 = +[AXSettings sharedInstance];
    [v10 setVoiceOverSoundCurtain:v15];
  }
}

void __63__VoiceOverBrailleController_setSoundCurtainEnabled_specifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"SOUND_CURTAIN"];
}

void __63__VoiceOverBrailleController_setSoundCurtainEnabled_specifier___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) BOOLValue];
  id v2 = +[AXSettings sharedInstance];
  [v2 setVoiceOverSoundCurtain:v1];
}

- (id)_brailleAutoEnableBluetooth:(id)a3
{
  v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverAlwaysTurnOnBluetooth]);

  return v4;
}

- (void)_setBrailleAutoEnableBluetooth:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverAlwaysTurnOnBluetooth:v4];
}

- (id)brailleTableCount:(id)a3
{
  v3 = +[AXSettings sharedInstance];
  id v4 = [v3 voiceOverBrailleLanguageRotorItems];
  int v5 = [v4 count];

  if (v5 <= 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v5;
  }
  return +[NSString localizedStringWithFormat:@"%d", v6];
}

- (id)detailSpecifiersForDevice:(id)a3 withTarget:(id)a4
{
  id v6 = a3;
  id v7 = [(VoiceOverBrailleController *)self loadSpecifiersFromPlistName:@"BrailleBluetoothDeviceConfig" target:a4];
  uint64_t v8 = +[NSArray arrayWithArray:v7];

  v9 = [v8 objectAtIndex:1];
  CFStringRef v12 = @"bt-device";
  id v13 = v6;
  v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];

  [v9 setUserInfo:v10];

  return v8;
}

- (id)postDevicesSpecifiersGroup
{
  return &__NSArray0__struct;
}

- (void)_tipLoaded:(id)a3
{
  if (!self->_tipLoaded) {
    AXPerformBlockOnMainThread();
  }
}

void __41__VoiceOverBrailleController__tipLoaded___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) specifierForID:@"Braille_TipKit"];
  v3 = [*(id *)(a1 + 32) cellForSpecifier:v2];
  [v3 instrinsicContentHeight];
  *(void *)(*(void *)(a1 + 32) + 304) = v4;

  [*(id *)(a1 + 32) reloadSpecifier:v2];
  *(unsigned char *)(*(void *)(a1 + 32) + 298) = 1;
  int v5 = AXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 304)];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Tip loaded, resetting specifier, height: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(VoiceOverBrailleController *)self specifierForIndexPath:v7];
  v9 = [v8 propertyForKey:PSCellClassKey];
  unsigned int v10 = [v9 isEqual:objc_opt_class()];

  if (v10)
  {
    double tipHeight = self->_tipHeight;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)VoiceOverBrailleController;
    [(VoiceOverBrailleController *)&v14 tableView:v6 heightForRowAtIndexPath:v7];
    double tipHeight = v12;
  }

  return tipHeight;
}

- (id)specifiers
{
  v40.receiver = self;
  v40.super_class = (Class)VoiceOverBrailleController;
  v3 = [(AXBluetoothDevicesController *)&v40 specifiers];
  uint64_t v4 = objc_opt_new();
  if ([v3 count])
  {
    uint64_t v5 = 0;
    uint64_t v6 = PSIDKey;
    uint64_t v36 = PSCellClassKey;
    while (1)
    {
      id v7 = [v3 objectAtIndexedSubscript:v5];
      uint64_t v8 = +[NSUserDefaults standardUserDefaults];
      unsigned int v9 = [v8 BOOLForKey:@"BrailleTipKitSeenKey"];

      if (v9)
      {
        unsigned int v10 = [v7 propertyForKey:v6];
        unsigned __int8 v11 = [v10 isEqualToString:@"Braille_TipKitGroup"];

        if (v11) {
          goto LABEL_24;
        }
      }
      double v12 = [v7 propertyForKey:v6];
      unsigned int v13 = [v12 isEqualToString:@"Braille_TipKit"];

      if (!v13) {
        break;
      }
      if ((v9 & 1) == 0)
      {
        objc_initWeak(&location, self);
        [v7 setProperty:objc_opt_class() forKey:v36];
        objc_super v14 = settingsLocString(@"Braille_Tip_Title", @"VoiceOverSettings");
        [v7 setProperty:v14 forKey:@"Title"];

        id v15 = settingsLocString(@"Braille_Tip_Description", @"VoiceOverSettings");
        [v7 setProperty:v15 forKey:@"Description"];

        [v7 setProperty:&off_229858 forKey:@"tipType"];
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = __40__VoiceOverBrailleController_specifiers__block_invoke;
        v37[3] = &unk_208798;
        objc_copyWeak(&v38, &location);
        v16 = objc_retainBlock(v37);
        [v7 setProperty:v16 forKey:@"CloseCallback"];

        id v17 = +[NSBundle bundleForClass:objc_opt_class()];
        v18 = +[UIImage imageNamed:@"AccessibilityIcon" inBundle:v17];
        [v7 setProperty:v18 forKey:@"Icon"];

        [v7 setProperty:&__kCFBooleanFalse forKey:@"IconIgnoresInvertColors"];
        objc_destroyWeak(&v38);
        objc_destroyWeak(&location);
LABEL_23:
        [v4 addObject:v7];
      }
LABEL_24:

      if (++v5 >= (unint64_t)[v3 count]) {
        goto LABEL_25;
      }
    }
    id v19 = [v7 propertyForKey:v6];
    unsigned int v20 = [v19 isEqualToString:@"BRAILLE_SYNC_TABLES"];

    if (v20)
    {
      if ((VOSCustomBrailleEnabled() & 1) == 0) {
        goto LABEL_24;
      }
    }
    else
    {
      v21 = [v7 propertyForKey:v6];
      unsigned int v22 = [v21 isEqualToString:@"BrailleDisplayOutput"];

      if (v22)
      {
        if (VOSCustomBrailleEnabled())
        {
          v23 = +[AXSettings sharedInstance];
          unsigned int v24 = [v23 voiceOverTouchBrailleDisplaySyncInputOutputTables];

          if (v24) {
            settingsLocString(@"BrailleDisplaySyncedInputOutputTitle", @"VoiceOverBrailleOptions");
          }
          else {
          v25 = settingsLocString(@"BrailleDisplayOutputTitle", @"VoiceOverBrailleOptions");
          }
          [v7 setName:v25];
        }
      }
      else
      {
        v26 = [v7 propertyForKey:v6];
        unsigned int v27 = [v26 isEqualToString:@"BrailleDisplayInput"];

        if (v27)
        {
          if (VOSCustomBrailleEnabled())
          {
            id v41 = v7;
            id v28 = +[NSArray arrayWithObjects:&v41 count:1];
            [(VoiceOverBrailleController *)self setDetailItems:v28];
          }
        }
        else
        {
          id v29 = [v7 propertyForKey:v6];
          unsigned int v30 = [v29 isEqualToString:@"GRADE2_AUTO_TRANSLATE"];

          if (v30 && !VOSCustomBrailleEnabled()) {
            goto LABEL_24;
          }
        }
      }
    }
    goto LABEL_23;
  }
LABEL_25:
  if (VOSCustomBrailleEnabled())
  {
    id v31 = +[AXSettings sharedInstance];
    id v32 = [v31 voiceOverTouchBrailleDisplaySyncInputOutputTables];
  }
  else
  {
    id v32 = 0;
  }
  uint64_t v33 = [(VoiceOverBrailleController *)self specifiersByRemovingDetailItemsFromOriginalSpecifiers:v4 ifHidden:v32];
  v34 = *(void **)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers] = v33;

  return v4;
}

void __40__VoiceOverBrailleController_specifiers__block_invoke(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  AXPerformBlockAsynchronouslyOnMainThread();
  objc_destroyWeak(&v1);
}

void __40__VoiceOverBrailleController_specifiers__block_invoke_2(uint64_t a1)
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  [v2 setBool:1 forKey:@"BrailleTipKitSeenKey"];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];

  UIAccessibilityNotifications v4 = UIAccessibilityLayoutChangedNotification;

  UIAccessibilityPostNotification(v4, 0);
}

- (id)pairedDeviceSpecifiers
{
  v55.receiver = self;
  v55.super_class = (Class)VoiceOverBrailleController;
  id v2 = [(AXBluetoothDevicesController *)&v55 pairedDeviceSpecifiers];
  id v43 = [v2 mutableCopy];

  uint64_t v36 = (void *)_AXSVoiceOverTouchCopyTactileGraphicsDisplay();
  if (v36)
  {
    id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:v36];
    if (v3)
    {
      UIAccessibilityNotifications v4 = +[VOSBluetoothManager sharedInstance];
      uint64_t v5 = [v4 centralManager];
      id v58 = v3;
      uint64_t v6 = +[NSArray arrayWithObjects:&v58 count:1];
      id v7 = [v5 retrievePeripheralsWithIdentifiers:v6];

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v8 = v7;
      id v9 = [v8 countByEnumeratingWithState:&v51 objects:v57 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v52;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v52 != v11) {
              objc_enumerationMutation(v8);
            }
            unsigned int v13 = [(AXBluetoothDevicesController *)self getDeviceForPeripheral:*(void *)(*((void *)&v51 + 1) + 8 * i)];
            v49[0] = _NSConcreteStackBlock;
            v49[1] = 3221225472;
            v49[2] = __52__VoiceOverBrailleController_pairedDeviceSpecifiers__block_invoke;
            v49[3] = &unk_20A748;
            id v14 = v13;
            id v50 = v14;
            if ((objc_msgSend(v43, "ax_containsObjectUsingBlock:", v49) & 1) == 0)
            {
              id v15 = [(AXBluetoothDevicesController *)self specifierForDevice:v14];
              [v43 addObject:v15];
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v51 objects:v57 count:16];
        }
        while (v10);
      }
    }
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = [(SCROBrailleClient *)self->_brailleClient driverConfiguration];
  id v16 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v46;
    uint64_t v40 = PSTitleKey;
    uint64_t v38 = PSDetailControllerClassKey;
    uint64_t v39 = PSIDKey;
    uint64_t v37 = *(void *)v46;
    do
    {
      id v19 = 0;
      id v41 = v17;
      do
      {
        if (*(void *)v46 != v18) {
          objc_enumerationMutation(obj);
        }
        unsigned int v20 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v19);
        v21 = [v20 objectForKey:kSCROBrailleDisplayBrailleVendorProductId];
        uint64_t v22 = [v20 objectForKey:kSCROBrailleDisplayBluetoothAddress];
        v23 = (void *)v22;
        if (v21) {
          BOOL v24 = v22 == 0;
        }
        else {
          BOOL v24 = 0;
        }
        if (v24)
        {
          v25 = objc_opt_new();
          v26 = [v20 objectForKey:kSCROBrailleDisplayBrailleProductName];
          if (!v26)
          {
            v26 = [v20 objectForKey:kSCROBrailleDisplayBrailleManufacturerName];
          }
          unsigned int v27 = settingsLocString(@"USB_BRAILLE", @"VoiceOverBrailleOptions");
          id v28 = AXCFormattedString();

          objc_msgSend(v25, "setName:", v28, v26);
          [v25 setIdentifier:v21];
          [v25 setAddress:v21];
          id v29 = +[PSSpecifier preferenceSpecifierNamed:v28 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
          id v30 = [objc_allocWithZone((Class)NSMutableDictionary) init];
          [v30 setObject:v28 forKey:v40];
          [v30 setObject:v21 forKey:v39];
          id v31 = (objc_class *)objc_opt_class();
          id v32 = NSStringFromClass(v31);
          [v30 setObject:v32 forKey:v38];

          [v29 setProperties:v30];
          id v33 = [objc_allocWithZone((Class)NSMutableDictionary) init];
          [v33 setObject:v25 forKey:@"bt-device"];
          [v29 setUserInfo:v33];
          [v43 addObject:v29];

          uint64_t v18 = v37;
          id v17 = v41;
        }

        id v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
    }
    while (v17);
  }

  v34 = [v43 sortedArrayUsingComparator:&__block_literal_global_31];

  return v34;
}

id __52__VoiceOverBrailleController_pairedDeviceSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 propertyForKey:@"bt-device"];
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

int64_t __52__VoiceOverBrailleController_pairedDeviceSpecifiers__block_invoke_2(id a1, PSSpecifier *a2, PSSpecifier *a3)
{
  id v4 = a3;
  uint64_t v5 = [(PSSpecifier *)a2 name];
  uint64_t v6 = [(PSSpecifier *)v4 name];

  id v7 = [v5 localizedCompare:v6];
  return (int64_t)v7;
}

- (id)_brailleDisplayAlertDuration:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  unsigned __int8 v4 = [v3 voiceOverBrailleAlertsEnabled];

  if ((v4 & 1) == 0)
  {
    id v7 = @"OFF";
    goto LABEL_5;
  }
  uint64_t v5 = +[AXSettings sharedInstance];
  unsigned int v6 = [v5 voiceOverBrailleAlertShowUntilDismissed];

  if (v6)
  {
    id v7 = @"FOREVER_TIME_BRAILLE_ALERTS";
LABEL_5:
    id v8 = settingsLocString(v7, @"Accessibility");
    goto LABEL_7;
  }
  id v9 = +[AXSettings sharedInstance];
  [v9 voiceOverBrailleAlertDisplayDuration];
  id v8 = AXLocalizedTimeSummary();

LABEL_7:

  return v8;
}

- (id)_brailleDisplayDebounceTimeout:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  [v3 voiceOverBrailleKeyDebounceTimeout];
  unsigned __int8 v4 = AXLocalizedTimeSummary();

  return v4;
}

- (id)_brailleDisplayAutoAdvance:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  [v3 voiceOverBrailleAutoAdvanceDuration];
  unsigned __int8 v4 = AXLocalizedTimeSummary();

  return v4;
}

- (id)brailleDisplayOutput:(id)a3
{
  int v4 = VOSCustomBrailleEnabled();
  uint64_t v5 = +[AXSettings sharedInstance];
  unsigned int v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 voiceOverTouchBrailleDisplayOutputTableIdentifier];

    id v8 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v7];
    id v9 = [v8 localizedName];

    unsigned int v6 = (void *)v7;
  }
  else
  {
    id v9 = -[VoiceOverBrailleController _stringForBrailleMode:](self, "_stringForBrailleMode:", [v5 voiceOverTouchBrailleDisplayOutputMode]);
  }

  return v9;
}

- (id)_stringForBrailleMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
  {
    int v4 = 0;
  }
  else
  {
    int v4 = settingsLocString(*(&off_20A7B0 + a3 - 1), @"VoiceOverBrailleOptions");
  }
  return v4;
}

- (id)brailleDisplayInput:(id)a3
{
  int v4 = VOSCustomBrailleEnabled();
  uint64_t v5 = +[AXSettings sharedInstance];
  unsigned int v6 = v5;
  if (v4)
  {
    unsigned int v7 = [v5 voiceOverTouchBrailleDisplaySyncInputOutputTables];

    if (v7)
    {
      id v8 = +[AXSettings sharedInstance];
      id v9 = [v8 voiceOverTouchBrailleDisplayOutputTableIdentifier];
      id v10 = +[AXSettings sharedInstance];
      [v10 setVoiceOverTouchBrailleDisplayInputTableIdentifier:v9];
    }
    uint64_t v11 = +[AXSettings sharedInstance];
    unsigned int v6 = [v11 voiceOverTouchBrailleDisplayInputTableIdentifier];

    id v12 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v6];
    unsigned int v13 = [v12 localizedName];
  }
  else
  {
    unsigned int v13 = -[VoiceOverBrailleController _stringForBrailleMode:](self, "_stringForBrailleMode:", [v5 voiceOverTouchBrailleDisplayInputMode]);
  }

  return v13;
}

- (id)panningAutoturnReadingContent:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  int v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverTouchBraillePanningAutoTurnsReadingContent]);

  return v4;
}

- (void)setPanningAutoturnReadingContent:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverTouchBraillePanningAutoTurnsReadingContent:v4];
}

- (id)brailleFormattingEnabled:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverBrailleFormattingEnabled]);

  return v4;
}

- (void)setBrailleFormattingEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverBrailleFormattingEnabled:v4];
}

- (id)wordWrapEnabled:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverBrailleWordWrapEnabled]);

  return v4;
}

- (void)setWordWrapEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverBrailleWordWrapEnabled:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VoiceOverBrailleController;
  [(AXBluetoothDevicesController *)&v4 viewDidAppear:a3];
  [(AXBluetoothDevicesController *)self setScanningEnabled:1];
  [(AXBluetoothDevicesController *)self showBluetoothPowerAlert:1];
  [(VoiceOverBrailleController *)self _connectToBrailleClient:1];
  [(VoiceOverBrailleController *)self _handleBrailleConfigurationChanged];
  [(VoiceOverBrailleController *)self _updateBrailleWritingCell];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VoiceOverBrailleController;
  [(VoiceOverBrailleController *)&v7 viewWillAppear:a3];
  VOSCrystalMigrateBrailleTableReplacements();
  VOSRepairBrailleTableSettings();
  objc_super v4 = [(VoiceOverBrailleController *)self specifierForID:@"BrailleDisplayOutput"];
  [(VoiceOverBrailleController *)self reloadSpecifier:v4];

  id v5 = [(VoiceOverBrailleController *)self specifierForID:@"BrailleDisplayInput"];
  [(VoiceOverBrailleController *)self reloadSpecifier:v5];

  unsigned int v6 = [(VoiceOverBrailleController *)self specifierForID:@"BrailleGesturesInput"];
  [(VoiceOverBrailleController *)self reloadSpecifier:v6];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(VoiceOverBrailleController *)self _stopDeviceLoadFailedTimer];
  [(VoiceOverBrailleController *)self _updateBrailleWritingCell];
  v5.receiver = self;
  v5.super_class = (Class)VoiceOverBrailleController;
  [(VoiceOverBrailleController *)&v5 viewWillDisappear:v3];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)VoiceOverBrailleController;
  objc_super v4 = [(AXBluetoothDevicesController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  objc_super v5 = [v4 textLabel];
  [v5 setNumberOfLines:0];

  return v4;
}

- (id)devicesGroupName
{
  return settingsLocString(@"DEVICES", @"VoiceOverBrailleOptions");
}

- (id)bluetoothPoweredOffFooter
{
  return settingsLocString(@"BLUETOOTH_OFF", @"VoiceOverBrailleOptions");
}

- (id)bluetoothPowerAlertMessage
{
  return settingsLocString(@"BLUETOOTH_POWER_PROMPT", @"VoiceOverBrailleOptions");
}

- (id)syncTablesEnabled:(id)a3
{
  BOOL v3 = +[AXSettings sharedInstance];
  objc_super v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverTouchBrailleDisplaySyncInputOutputTables]);

  return v4;
}

- (void)setSyncTablesEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AXSettings sharedInstance];
  unsigned int v9 = [v8 voiceOverTouchBrailleDisplaySyncInputOutputTables];

  unsigned int v10 = [v6 BOOLValue];
  if (v9 != v10)
  {
    unsigned int v11 = v10;
    id v12 = +[AXSettings sharedInstance];
    unsigned int v13 = v12;
    if (v11)
    {
      id v14 = [v12 voiceOverTouchBrailleDisplayInputTableIdentifier];
      id v15 = +[AXSettings sharedInstance];
      id v16 = [v15 voiceOverTouchBrailleDisplayOutputTableIdentifier];
      unsigned int v17 = [v14 isEqualToString:v16];

      if (!v17)
      {
        v21 = settingsLocString(@"BRAILLE_IO_SYNC_CHANGES_INPUT_TITLE", @"VoiceOverSettings");
        uint64_t v22 = settingsLocString(@"BRAILLE_IO_SYNC_CHANGES_INPUT_MESSAGE", @"VoiceOverSettings");
        v23 = +[UIAlertController alertControllerWithTitle:v21 message:v22 preferredStyle:1];

        objc_initWeak(&location, self);
        BOOL v24 = AXUILocalizedStringForKey();
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = __61__VoiceOverBrailleController_setSyncTablesEnabled_specifier___block_invoke;
        v30[3] = &unk_208F50;
        objc_copyWeak(&v31, &location);
        v25 = +[UIAlertAction actionWithTitle:v24 style:1 handler:v30];

        [v23 addAction:v25];
        v26 = AXUILocalizedStringForKey();
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = __61__VoiceOverBrailleController_setSyncTablesEnabled_specifier___block_invoke_2;
        v28[3] = &unk_20A790;
        void v28[4] = self;
        char v29 = v11;
        unsigned int v27 = +[UIAlertAction actionWithTitle:v26 style:0 handler:v28];

        [v23 addAction:v27];
        [(VoiceOverBrailleController *)self presentViewController:v23 animated:1 completion:0];

        objc_destroyWeak(&v31);
        objc_destroyWeak(&location);

        goto LABEL_8;
      }
      uint64_t v18 = +[AXSettings sharedInstance];
      [v18 setVoiceOverTouchBrailleDisplaySyncInputOutputTables:1];

      id v19 = self;
      uint64_t v20 = 1;
    }
    else
    {
      [v12 setVoiceOverTouchBrailleDisplaySyncInputOutputTables:0];

      id v19 = self;
      uint64_t v20 = 0;
    }
    [(VoiceOverBrailleController *)v19 setDetailItemsHidden:v20];
    [(AXBluetoothDevicesController *)self reloadSpecifiers];
  }
LABEL_8:
}

void __61__VoiceOverBrailleController_setSyncTablesEnabled_specifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"BRAILLE_SYNC_TABLES"];
}

id __61__VoiceOverBrailleController_setSyncTablesEnabled_specifier___block_invoke_2(uint64_t a1)
{
  id v2 = +[AXSettings sharedInstance];
  [v2 setVoiceOverTouchBrailleDisplaySyncInputOutputTables:1];

  BOOL v3 = +[AXSettings sharedInstance];
  objc_super v4 = [v3 voiceOverTouchBrailleDisplayOutputTableIdentifier];
  objc_super v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverTouchBrailleDisplayInputTableIdentifier:v4];

  [*(id *)(a1 + 32) setDetailItemsHidden:*(unsigned __int8 *)(a1 + 40)];
  id v6 = *(void **)(a1 + 32);

  return [v6 reloadSpecifiers];
}

- (id)gradeTwoAutoTranslatedEnabled:(id)a3
{
  BOOL v3 = +[AXSettings sharedInstance];
  objc_super v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverBrailleGradeTwoAutoTranslateEnabled]);

  return v4;
}

- (void)setGradeTwoAutoTransateEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverBrailleGradeTwoAutoTranslateEnabled:v4];
}

- (id)softwareKeyboardWithBrailleEnabled:(id)a3
{
  BOOL v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverShowSoftwareKeyboardWithBraille]);

  return v4;
}

- (void)setSoftwareKeyboardWithBrailleEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverShowSoftwareKeyboardWithBraille:v4];
}

- (void)handleSettingsChange:(id)a3
{
}

- (void)_handleSettingsChange:(id)a3
{
  id v24 = a3;
  if (([v24 isEqualToString:kAXSVoiceOverTouchBrailleContractionModeChangedNotification] & 1) == 0
    && ([v24 isEqualToString:kAXSVoiceOverTouchBrailleEightDotModeChangedNotification] & 1) == 0
    && ![v24 isEqualToString:kAXSVoiceOverTouchBrailleTableIdentifierChangedNotification])
  {
    if ([v24 isEqualToString:kAXSVoiceOverTouchTactileGraphicsDisplayChangedNotification])-[AXBluetoothDevicesController reloadSpecifiers](self, "reloadSpecifiers"); {
    else
    }
      [(VoiceOverBrailleController *)self reloadSpecifierID:@"tableIdentifier" animated:1];
    goto LABEL_19;
  }
  id v4 = (void *)_AXSVoiceOverTouchCopyBrailleTableIdentifier();
  id v5 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v4];
  v23 = v5;
  if (v4)
  {
    id v6 = v5;
    unsigned int v7 = [v5 supportsTranslationModeContracted];
    unsigned int v8 = [v6 supportsTranslationMode8Dot];
    if (!v7)
    {
      uint64_t v9 = 0;
      BOOL v10 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    unsigned int v8 = 1;
  }
  BOOL v10 = _AXSVoiceOverTouchBrailleContractionMode() == 0;
  uint64_t v9 = 1;
LABEL_9:
  BOOL v11 = 0;
  if (!v10 && v8) {
    BOOL v11 = _AXSVoiceOverTouchBrailleEightDotMode() != 0;
  }
  id v12 = [(VoiceOverBrailleController *)self specifierForID:@"CONTRACTION_MODE"];
  uint64_t v13 = PSEnabledKey;
  id v14 = [v12 propertyForKey:PSEnabledKey];
  unsigned int v15 = [v14 BOOLValue];

  id v16 = +[NSNumber numberWithBool:v9];
  [v12 setProperty:v16 forKey:v13];

  [(VoiceOverBrailleController *)self beginUpdates];
  if (self->_isContractedBrailleEnabled != v10 || v9 != v15) {
    [(VoiceOverBrailleController *)self reloadSpecifierID:@"CONTRACTION_MODE" animated:1];
  }
  unsigned int v17 = [(VoiceOverBrailleController *)self specifierForID:@"EIGHTDOT_MODE"];
  uint64_t v18 = [v17 propertyForKey:v13];
  unsigned int v19 = [v18 BOOLValue];

  uint64_t v20 = +[NSNumber numberWithBool:v8 & !v10];
  [v17 setProperty:v20 forKey:v13];

  if (v11 != self->_isEightDotBrailleEnabled
    || ([v17 propertyForKey:v13],
        v21 = objc_claimAutoreleasedReturnValue(),
        unsigned int v22 = [v21 BOOLValue],
        v21,
        v19 != v22))
  {
    [(VoiceOverBrailleController *)self reloadSpecifier:v17 animated:1];
  }
  [(VoiceOverBrailleController *)self _updateBrailleWritingCell];
  [(VoiceOverBrailleController *)self endUpdates];

LABEL_19:
}

- (void)_updateBrailleWritingCell
{
  BOOL v3 = _AXSVoiceOverTouchBrailleContractionMode() == 0;
  id v4 = [(VoiceOverBrailleController *)self specifierForID:@"WRITING_CONTRACTION_MODE"];
  id v5 = +[NSNumber numberWithBool:v3];
  [v4 setProperty:v5 forKey:PSEnabledKey];

  [(VoiceOverBrailleController *)self reloadSpecifierID:@"WRITING_CONTRACTION_MODE"];
}

- (BOOL)shouldAddClassicDevice:(id)a3
{
  id v3 = a3;
  if (![v3 paired])
  {
LABEL_7:
    unsigned int v8 = +[VOSBluetoothManager sharedInstance];
    unsigned __int8 v6 = [v8 isValidBrailleDevice:v3];

    goto LABEL_8;
  }
  id v4 = +[VOSBluetoothManager sharedInstance];
  unsigned __int8 v5 = [v4 isPairedDeviceBrailleDisplay:v3];

  if ((v5 & 1) == 0)
  {
    unsigned int v7 = AXLogBrailleHW();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Item is paired, but not in list, check if valid: %@", (uint8_t *)&v10, 0xCu);
    }

    goto LABEL_7;
  }
  unsigned __int8 v6 = 1;
LABEL_8:

  return v6;
}

- (BOOL)shouldAddBTLEDevice:(id)a3
{
  id v4 = a3;
  if ([v4 paired])
  {
    unsigned __int8 v5 = +[VOSBluetoothManager sharedInstance];
    unsigned __int8 v6 = [v5 isPairedDeviceBrailleDisplay:v4];
  }
  else
  {
    unsigned int v7 = [v4 name];
    unsigned __int8 v8 = [v7 containsString:@"AirPods"];

    if (v8)
    {
      unsigned __int8 v6 = 0;
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)VoiceOverBrailleController;
      unsigned __int8 v6 = [(AXBluetoothDevicesController *)&v10 shouldAddBTLEDevice:v4];
    }
  }

  return v6;
}

- (void)deviceConnected:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = AXLogBrailleHW();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Device connected: %@", (uint8_t *)&v8, 0xCu);
  }

  if ([v4 isClassicDevice])
  {
    unsigned __int8 v6 = [v4 address];
    [(SCROBrailleClient *)self->_brailleClient loadDisplayWithBluetoothDeviceAddress:v6];
LABEL_9:
    [(VoiceOverBrailleController *)self _startDeviceLoadFailedTimer];

    goto LABEL_10;
  }
  if ([v4 isBTLEDevice])
  {
    unsigned __int8 v6 = [v4 identifier];
    unsigned int v7 = AXLogBrailleHW();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Handling LE device: %@ %@", (uint8_t *)&v8, 0x16u);
    }

    [(SCROBrailleClient *)self->_brailleClient loadTactileGraphicsDisplayWithBLEIdentifier:v6];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_startDeviceLoadFailedTimer
{
  bluetoothDeviceLoadFailedTimer = self->_bluetoothDeviceLoadFailedTimer;
  if (bluetoothDeviceLoadFailedTimer) {
    [(NSTimer *)bluetoothDeviceLoadFailedTimer invalidate];
  }
  self->_bluetoothDeviceLoadFailedTimer = +[NSTimer scheduledTimerWithTimeInterval:self target:"_bluetoothDeviceLoadFailedTimerFireMethod:" selector:0 userInfo:0 repeats:30.0];

  _objc_release_x1();
}

- (void)_stopDeviceLoadFailedTimer
{
  [(NSTimer *)self->_bluetoothDeviceLoadFailedTimer invalidate];
  bluetoothDeviceLoadFailedTimer = self->_bluetoothDeviceLoadFailedTimer;
  self->_bluetoothDeviceLoadFailedTimer = 0;
}

- (void)_bluetoothDeviceLoadFailedTimerFireMethod:(id)a3
{
  bluetoothDeviceLoadFailedTimer = self->_bluetoothDeviceLoadFailedTimer;
  self->_bluetoothDeviceLoadFailedTimer = 0;

  id v5 = [(PSSpecifier *)self->super._currentDeviceSpecifier identifier];
  [(VoiceOverBrailleController *)self _handleFailedToLoadBluetoothDevice:v5];
}

- (id)contractedBrailleEnabled:(id)a3
{
  id v4 = (void *)_AXSVoiceOverTouchCopyBrailleTableIdentifier();
  id v5 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v4];
  unsigned __int8 v6 = v5;
  BOOL v7 = (!v4 || [v5 supportsTranslationModeContracted])
    && _AXSVoiceOverTouchBrailleContractionMode() == 0;
  self->_isContractedBrailleEnabled = v7;
  int v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:");

  return v8;
}

- (void)setContractedBrailleEnabled:(id)a3 specifier:(id)a4
{
  unsigned int v5 = [a3 BOOLValue];
  self->_isContractedBrailleEnabled = v5;
  uint64_t v6 = v5 ^ 1;

  __AXSVoiceOverTouchSetBrailleContractionMode(v6);
}

- (id)eightDotBrailleEnabled:(id)a3
{
  id v4 = (void *)_AXSVoiceOverTouchCopyBrailleTableIdentifier();
  id v5 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v4];
  uint64_t v6 = v5;
  if (v4)
  {
    if ([v5 supportsTranslationModeContracted]) {
      BOOL v7 = _AXSVoiceOverTouchBrailleContractionMode() == 0;
    }
    else {
      BOOL v7 = 0;
    }
    char v9 = [v6 supportsTranslationMode8Dot] ^ 1;
  }
  else
  {
    uint64_t v8 = _AXSVoiceOverTouchBrailleContractionMode();
    char v9 = 0;
    BOOL v7 = v8 == 0;
  }
  BOOL v10 = 0;
  if (!v7 && (v9 & 1) == 0) {
    BOOL v10 = _AXSVoiceOverTouchBrailleEightDotMode() != 0;
  }
  self->_isEightDotBrailleEnabled = v10;
  id v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:");

  return v11;
}

- (void)setEightDotBrailleEnabled:(id)a3 specifier:(id)a4
{
  self->_isEightDotBrailleEnabled = [a3 BOOLValue];

  __AXSVoiceOverTouchSetBrailleEightDotMode();
}

- (id)alwaysUseNemethEnabled:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverAlwaysUseNemethCodeForMathEnabled]);

  return v4;
}

- (void)setAlwaysUseNemethEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = +[AXSettings sharedInstance];
  id v5 = [v4 BOOLValue];

  [v6 setVoiceOverAlwaysUseNemethCodeForMathEnabled:v5];
}

- (void)setBluetoothIsBusy:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VoiceOverBrailleController;
  -[AXBluetoothDevicesController setBluetoothIsBusy:](&v5, "setBluetoothIsBusy:");
  if (!a3) {
    [(VoiceOverBrailleController *)self _stopDeviceLoadFailedTimer];
  }
}

- (void)_connectToBrailleClient:(BOOL)a3
{
  brailleClient = self->_brailleClient;
  if (a3)
  {
    if (!brailleClient)
    {
      id v6 = (SCROBrailleClient *)[objc_allocWithZone((Class)SCROBrailleClient) initWithDelegate:self];
      BOOL v7 = self->_brailleClient;
      self->_brailleClient = v6;

      [(SCROBrailleClient *)self->_brailleClient setKeepConnectionAlive:1];
      uint64_t v8 = self->_brailleClient;
      [(SCROBrailleClient *)v8 setDisplayDescriptorCallbackEnabled:0];
    }
  }
  else
  {
    [(SCROBrailleClient *)brailleClient setDelegate:0];
    [(SCROBrailleClient *)self->_brailleClient setKeepConnectionAlive:0];
    objc_super v5 = self->_brailleClient;
    self->_brailleClient = 0;
  }
}

- (void)handleBrailleConfigurationChanged:(id)a3
{
}

- (void)_handleBrailleConfigurationChanged
{
  [(VoiceOverBrailleController *)self beginUpdates];
  [(AXBluetoothDevicesController *)self updatePairedDevices];

  [(VoiceOverBrailleController *)self endUpdates];
}

- (void)handleBrailleDidDisconnect:(id)a3
{
}

- (void)handleBrailleDidReconnect:(id)a3
{
}

- (void)handleFailedToLoadBluetoothDevice:(id)a3
{
}

- (void)_handleFailedToLoadBluetoothDevice:(id)a3
{
  id v15 = a3;
  if ([(AXBluetoothDevicesController *)self bluetoothIsBusy])
  {
    id v4 = [(PSSpecifier *)self->super._currentDeviceSpecifier identifier];
    unsigned int v5 = [v4 isEqualToString:v15];

    if (v5)
    {
      [(VoiceOverBrailleController *)self setBluetoothIsBusy:0];
      [(VoiceOverBrailleController *)self reloadSpecifierID:v15 animated:0];
      id v6 = [(NSMutableDictionary *)self->super._devicesDict objectForKey:v15];
      if (v6)
      {
        BOOL v7 = [(VoiceOverBrailleController *)self rootController];
        uint64_t v8 = [v7 presentedViewController];

        if (!v8)
        {
          alert = self->super._alert;
          if (alert)
          {
            [(VoiceOverBluetoothAlert *)alert dismiss];
            BOOL v10 = self->super._alert;
            self->super._alert = 0;
          }
          id v11 = (VoiceOverBluetoothAlert *)[objc_allocWithZone((Class)VoiceOverBluetoothAlert) initWithDevice:v6];
          id v12 = self->super._alert;
          self->super._alert = v11;

          uint64_t v13 = self->super._alert;
          id v14 = +[NSNumber numberWithUnsignedInteger:VOBTDriverLoadingError];
          [(VoiceOverBluetoothAlert *)v13 showAlertWithResult:v14];
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothDeviceLoadFailedTimer, 0);

  objc_storeStrong((id *)&self->_brailleClient, 0);
}

@end