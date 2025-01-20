@interface VoiceOverController
+ (void)setVoiceOverEnabled:(BOOL)a3;
- (BOOL)_shouldEnableVoiceOverSwitch;
- (BOOL)cachedBrailleDisplayIsPaired:(id)a3;
- (VoiceOverController)init;
- (double)lastSpeechRateAdjustmentTime;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_generateVOPracticeSpecifiers;
- (id)_generateVOTutorialSpecifiers;
- (id)brailleDisplayNameForSpecifier:(id)a3;
- (id)captionPanelForSpecifier:(id)a3;
- (id)cursorStyleForSpecifier:(id)a3;
- (id)doubleTapInterval:(id)a3;
- (id)navigateImagesPreferenceForSpecifier:(id)a3;
- (id)navigationStyle:(id)a3;
- (id)screenCurtainEnabled:(id)a3;
- (id)soundEffectsEnabled:(id)a3;
- (id)speakingRate:(id)a3;
- (id)speakingRateInRotor:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)voiceOverCursorOptionDescription:(id)a3;
- (id)voiceOverDelayUntilSpeakInterval:(id)a3;
- (id)voiceOverIgnoreTrackpad:(id)a3;
- (id)voiceOverSpeakUnderPointerDescription:(id)a3;
- (id)voiceOverTouchEnabled:(id)a3;
- (void)_bluetoothBrailleDisplayChange;
- (void)_changeVOActivationSpecifierIntoButtonCell:(id)a3;
- (void)_changeVOActivationSpecifierIntoSwitchCell:(id)a3;
- (void)_handleEnablingVoiceOverWithActivationBlock:(id)a3 cancelBlock:(id)a4;
- (void)_manageGestureHelpButton;
- (void)_tipLoaded:(id)a3;
- (void)_traitCollectionDidChange:(id)a3;
- (void)_updateSpecifierItemInfo:(id)a3 parentInfo:(id)a4 index:(int64_t)a5;
- (void)_updateTutorialButtonForOneness;
- (void)_updateVOTTutorialSpecifier:(id)a3;
- (void)connectedPointerDevicesDidChange:(id)a3;
- (void)cursorStyleSetPreference:(id)a3 specifier:(id)a4;
- (void)dealloc;
- (void)displayVoiceOverTutorialView;
- (void)reload;
- (void)setCaptionPanel:(id)a3 specifier:(id)a4;
- (void)setLastSpeechRateAdjustmentTime:(double)a3;
- (void)setScreenCurtainEnabled:(id)a3 specifier:(id)a4;
- (void)setSoundEffectsEnabled:(id)a3 specifier:(id)a4;
- (void)setSpeakingRate:(id)a3 specifier:(id)a4;
- (void)setSpeakingRateInRotor:(id)a3 specifier:(id)a4;
- (void)setVoiceOverIgnoreTrackpad:(id)a3 specifier:(id)a4;
- (void)setVoiceOverTouchEnabled:(id)a3 specifier:(id)a4;
- (void)startGestureHelp:(id)a3;
- (void)startVoiceOverTutorial:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)voiceOverActivateWorkaround:(id)a3;
@end

@implementation VoiceOverController

- (VoiceOverController)init
{
  v46.receiver = self;
  v46.super_class = (Class)VoiceOverController;
  v2 = [(VoiceOverController *)&v46 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_reloadSettings, kAXSVoiceOverTouchEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, v2, (CFNotificationCallback)_reloadSettings, kAXSVoiceOverTouchEnabledThroughAccessoryNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v5, v2, (CFNotificationCallback)_reloadSettingsSpeakingRate, @"_AXNotification_VoiceOverDefaultVoiceSelections", 0, (CFNotificationSuspensionBehavior)1028);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v2, (CFNotificationCallback)_handleContinuityDisplayStateChanged, kAXSContinuityDisplayStateChangedNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_coreBluetoothReady:" name:VOSBluetoothCoreBluetoothManagerReadyNotification object:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"_tipLoaded:" name:@"AXTipLoaded" object:0];

    objc_initWeak(&location, v2);
    v9 = +[AXSettings sharedInstance];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = __27__VoiceOverController_init__block_invoke;
    v43[3] = &unk_208798;
    objc_copyWeak(&v44, &location);
    [v9 registerUpdateBlock:v43 forRetrieveSelector:"voiceOverPitchChangeEnabled" withListener:v2];

    objc_destroyWeak(&v44);
    v10 = +[AXSettings sharedInstance];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = __27__VoiceOverController_init__block_invoke_2;
    v41[3] = &unk_208798;
    objc_copyWeak(&v42, &location);
    [v10 registerUpdateBlock:v41 forRetrieveSelector:"voiceOverPhoneticsFeedback" withListener:v2];

    objc_destroyWeak(&v42);
    v11 = +[AXSettings sharedInstance];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = __27__VoiceOverController_init__block_invoke_3;
    v39[3] = &unk_208798;
    objc_copyWeak(&v40, &location);
    [v11 registerUpdateBlock:v39 forRetrieveSelector:"voiceOverHintsEnabled" withListener:v2];

    objc_destroyWeak(&v40);
    v12 = +[AXSettings sharedInstance];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = __27__VoiceOverController_init__block_invoke_4;
    v37[3] = &unk_208798;
    objc_copyWeak(&v38, &location);
    [v12 registerUpdateBlock:v37 forRetrieveSelector:"voiceOverNavigateImagesOption" withListener:v2];

    objc_destroyWeak(&v38);
    v13 = +[AXSettings sharedInstance];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = __27__VoiceOverController_init__block_invoke_5;
    v35[3] = &unk_208798;
    objc_copyWeak(&v36, &location);
    [v13 registerUpdateBlock:v35 forRetrieveSelector:"voiceOverActivationWorkaround" withListener:v2];

    objc_destroyWeak(&v36);
    v14 = +[AXSettings sharedInstance];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = __27__VoiceOverController_init__block_invoke_6;
    v33[3] = &unk_208798;
    objc_copyWeak(&v34, &location);
    [v14 registerUpdateBlock:v33 forRetrieveSelector:"voiceOverSoundEffectsEnabled" withListener:v2];

    objc_destroyWeak(&v34);
    v15 = +[AXSettings sharedInstance];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = __27__VoiceOverController_init__block_invoke_7;
    v31[3] = &unk_208798;
    objc_copyWeak(&v32, &location);
    [v15 registerUpdateBlock:v31 forRetrieveSelector:"voiceOverDoubleTapInterval" withListener:v2];

    objc_destroyWeak(&v32);
    v16 = +[AXSettings sharedInstance];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __27__VoiceOverController_init__block_invoke_8;
    v29[3] = &unk_208798;
    objc_copyWeak(&v30, &location);
    [v16 registerUpdateBlock:v29 forRetrieveSelector:"voiceOverKeyboardModifierChoice" withListener:v2];

    objc_destroyWeak(&v30);
    v17 = +[AXSettings sharedInstance];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __27__VoiceOverController_init__block_invoke_9;
    v27[3] = &unk_208798;
    objc_copyWeak(&v28, &location);
    [v17 registerUpdateBlock:v27 forRetrieveSelector:"voiceOverNavigationStyle" withListener:v2];

    objc_destroyWeak(&v28);
    v18 = +[AXSettings sharedInstance];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __27__VoiceOverController_init__block_invoke_10;
    v25[3] = &unk_208798;
    objc_copyWeak(&v26, &location);
    [v18 registerUpdateBlock:v25 forRetrieveSelector:"voiceOverBrailleDisplays" withListener:v2];

    objc_destroyWeak(&v26);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)_reloadSettings, kAXSAssistiveTouchScannerEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v20 = +[AXSettings sharedInstance];
    unsigned int v21 = [v20 laserEnabled];

    if (v21)
    {
      v22 = +[AXPointerDeviceManager sharedInstance];
      [v22 addObserver:v2];
    }
    v23 = v2;
    objc_destroyWeak(&location);
  }

  return v2;
}

void __27__VoiceOverController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reload];
}

void __27__VoiceOverController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reload];
}

void __27__VoiceOverController_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reload];
}

void __27__VoiceOverController_init__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reload];
}

void __27__VoiceOverController_init__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reload];
}

void __27__VoiceOverController_init__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reload];
}

void __27__VoiceOverController_init__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reload];
}

void __27__VoiceOverController_init__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reload];
}

void __27__VoiceOverController_init__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reload];
}

void __27__VoiceOverController_init__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reload];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveEveryObserver(LocalCenter, self);
  v5 = +[AXPointerDeviceManager sharedInstance];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)VoiceOverController;
  [(VoiceOverController *)&v6 dealloc];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)VoiceOverController;
  [(VoiceOverController *)&v12 viewDidLoad];
  objc_initWeak(&location, self);
  uint64_t v13 = objc_opt_class();
  v3 = +[NSArray arrayWithObjects:&v13 count:1];
  objc_super v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  v8 = __34__VoiceOverController_viewDidLoad__block_invoke;
  v9 = &unk_208A18;
  objc_copyWeak(&v10, &location);
  id v4 = [(VoiceOverController *)self registerForTraitChanges:v3 withHandler:&v6];

  id v5 = +[VOSBluetoothManager sharedInstance];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __34__VoiceOverController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _traitCollectionDidChange:v4];
}

- (void)_tipLoaded:(id)a3
{
  if (!self->_tipLoaded) {
    AXPerformBlockOnMainThread();
  }
}

void __34__VoiceOverController__tipLoaded___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) specifierForID:@"VO_TipKit"];
  v3 = [*(id *)(a1 + 32) cellForSpecifier:v2];
  [v3 instrinsicContentHeight];
  *(void *)(*(void *)(a1 + 32) + 224) = v4;

  [*(id *)(a1 + 32) reloadSpecifier:v2];
  *(unsigned char *)(*(void *)(a1 + 32) + 217) = 1;
  id v5 = AXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 224)];
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Tip loaded, resetting specifier, height: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VoiceOverController;
  [(VoiceOverController *)&v4 viewWillAppear:a3];
  [(VoiceOverController *)self _updateSpecifiers];
}

- (void)_traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(VoiceOverController *)self traitCollection];
  objc_super v6 = [v5 preferredContentSizeCategory];
  int v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7)
  {
    [(VoiceOverController *)self _updateSpecifiers];
  }
}

- (void)_manageGestureHelpButton
{
  if (_AXSVoiceOverTouchEnabled())
  {
    v3 = [(VoiceOverController *)self specifierForID:@"VoiceOverTouchGestureHelpEnabled"];

    if (!v3)
    {
      [(VoiceOverController *)self beginUpdates];
      id v4 = [(VoiceOverController *)self _generateVOPracticeSpecifiers];
      [(VoiceOverController *)self insertContiguousSpecifiers:v4 afterSpecifierID:@"VoiceOverTouchEnabled"];

      [(VoiceOverController *)self endUpdates];
    }
  }
  else
  {
    id v5 = [(VoiceOverController *)self specifierForID:@"VoiceOverTouchGestureHelpEnabledGroup"];
    uint64_t v6 = [(VoiceOverController *)self specifierForID:@"VoiceOverTouchGestureHelpEnabled"];
    int v7 = (void *)v6;
    if (v5 && v6)
    {
      [(VoiceOverController *)self beginUpdates];
      v9[0] = v5;
      v9[1] = v7;
      v8 = +[NSArray arrayWithObjects:v9 count:2];
      [(VoiceOverController *)self removeContiguousSpecifiers:v8 animated:1];

      [(VoiceOverController *)self endUpdates];
    }
  }
}

- (id)_generateVOPracticeSpecifiers
{
  v3 = +[PSSpecifier emptyGroupSpecifier];
  uint64_t v4 = PSIDKey;
  [v3 setProperty:@"VoiceOverTouchGestureHelpEnabledGroup" forKey:PSIDKey];
  id v5 = settingsLocString(@"VOICEOVER_GESTURE_HELP_BUTTON_TITLE", @"VoiceOverSettings");
  uint64_t v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v6 setProperty:@"VoiceOverTouchGestureHelpEnabled" forKey:v4];
  [v6 setButtonAction:"startGestureHelp:"];
  v9[0] = v3;
  v9[1] = v6;
  int v7 = +[NSArray arrayWithObjects:v9 count:2];

  return v7;
}

- (id)_generateVOTutorialSpecifiers
{
  v3 = +[PSSpecifier emptyGroupSpecifier];
  uint64_t v4 = PSIDKey;
  [v3 setProperty:@"VoiceOverTouchTutorialEnabledGroup" forKey:PSIDKey];
  id v5 = settingsLocString(@"VOICEOVER_TUTORIAL_BUTTON_TITLE", @"VoiceOverSettings");
  uint64_t v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v6 setProperty:@"VoiceOverTouchTutorialEnabled" forKey:v4];
  [v6 setButtonAction:"startVoiceOverTutorial:"];
  int v7 = +[AXSpringBoardServer server];
  uint64_t v8 = [v7 isContinuitySessionActive] ^ 1;

  v9 = +[NSNumber numberWithBool:v8];
  [v6 setProperty:v9 forKey:PSEnabledKey];

  v12[0] = v3;
  v12[1] = v6;
  id v10 = +[NSArray arrayWithObjects:v12 count:2];

  return v10;
}

- (BOOL)_shouldEnableVoiceOverSwitch
{
  if (_AXSAssistiveTouchScannerEnabled()) {
    return 0;
  }
  if (_AXSVoiceOverTouchEnabled()) {
    return _AXSVoiceOverTouchEnabledThroughAccessory() == 0;
  }
  return 1;
}

- (void)reload
{
  if (self->_ignoreNextReload)
  {
    self->_ignoreNextReload = 0;
  }
  else
  {
    v3 = +[AXSettings sharedInstance];
    uint64_t v4 = (char *)[v3 voiceOverActivationWorkaround];

    if ((unint64_t)(v4 - 1) <= 1)
    {
      int v5 = _AXSVoiceOverTouchEnabled();
      uint64_t v6 = [(VoiceOverController *)self specifierForID:@"VoiceOverTouchEnabled"];
      if (v5) {
        [(VoiceOverController *)self _changeVOActivationSpecifierIntoSwitchCell:v6];
      }
      else {
        [(VoiceOverController *)self _changeVOActivationSpecifierIntoButtonCell:v6];
      }
    }
    int v7 = [(VoiceOverController *)self specifierForID:@"VoiceOverTouchEnabled"];
    uint64_t v8 = +[NSNumber numberWithBool:[(VoiceOverController *)self _shouldEnableVoiceOverSwitch]];
    [v7 setProperty:v8 forKey:PSEnabledKey];

    v9.receiver = self;
    v9.super_class = (Class)VoiceOverController;
    [(VoiceOverController *)&v9 reload];
    [(VoiceOverController *)self _manageGestureHelpButton];
    [(VoiceOverController *)self _manageVoiceOverTutorialButton];
  }
}

- (void)_bluetoothBrailleDisplayChange
{
  v3 = AXLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "BRAILLE DISPLAY CHANGE: ", v5, 2u);
  }

  uint64_t v4 = [(VoiceOverController *)self specifierForKey:@"braille"];
  [(VoiceOverController *)self reloadSpecifier:v4 animated:0];
}

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v77 = OBJC_IVAR___PSListController__specifiers;
    id v84 = [objc_allocWithZone((Class)NSMutableArray) init];
    val = self;
    uint64_t v4 = [(VoiceOverController *)self loadSpecifiersFromPlistName:@"VoiceOverSettings" target:self];
    char v92 = AXHasCapability();
    v90 = +[NSSet setWithArray:&off_22BC48];
    v87 = +[NSSet setWithArray:&off_22BC60];
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id obj = v4;
    id v93 = [obj countByEnumeratingWithState:&v97 objects:v101 count:16];
    if (v93)
    {
      uint64_t v91 = *(void *)v98;
      uint64_t v89 = PSKeyNameKey;
      uint64_t v88 = PSSpecifierIsSearchableKey;
      uint64_t v5 = PSIDKey;
      uint64_t v83 = PSCellClassKey;
      uint64_t v81 = PSFooterTextGroupKey;
      uint64_t v82 = PSEnabledKey;
      uint64_t v79 = PSSliderLeftImageKey;
      uint64_t v80 = PSSliderRightImageKey;
      uint64_t v78 = PSDetailControllerClassKey;
      do
      {
        for (i = 0; i != v93; i = (char *)i + 1)
        {
          if (*(void *)v98 != v91) {
            objc_enumerationMutation(obj);
          }
          int v7 = *(void **)(*((void *)&v97 + 1) + 8 * i);
          if ((v92 & 1) == 0)
          {
            uint64_t v8 = [*(id *)(*((void *)&v97 + 1) + 8 * i) propertyForKey:v89];
            unsigned int v9 = [v8 isEqualToString:@"NeuralVoiceOver"];

            if (v9)
            {
              [v7 setProperty:&__kCFBooleanFalse forKey:v88];
              continue;
            }
          }
          id v10 = [v7 propertyForKey:v5];
          if ([v90 containsObject:v10] && (AXDeviceSupportsVoicesRotor() & 1) == 0
            || [v87 containsObject:v10] && AXDeviceSupportsVoicesRotor())
          {
            [v7 setProperty:&__kCFBooleanFalse forKey:v88];
          }
          else if (![v10 isEqualToString:@"VoiceOverDelayUntilSpeak"] {
                 || AXHasCapability())
          }
          {
            v11 = +[NSUserDefaults standardUserDefaults];
            unsigned int v12 = [v11 BOOLForKey:@"LiveRecognitionTipKitSeen_18_0"];

            if (!v12
              || ([v7 propertyForKey:v5],
                  uint64_t v13 = objc_claimAutoreleasedReturnValue(),
                  unsigned __int8 v14 = [v13 isEqualToString:@"VO_TipKitGroup"],
                  v13,
                  (v14 & 1) == 0))
            {
              v15 = [v7 propertyForKey:v5];
              unsigned int v16 = [v15 isEqualToString:@"VO_TipKit"];

              if (!v16) {
                goto LABEL_24;
              }
              if ((v12 & 1) == 0)
              {
                objc_initWeak(&location, val);
                [v7 setProperty:objc_opt_class() forKey:v83];
                v17 = settingsLocString(@"VO_REAL_WORLD_DETECTION", @"VoiceOverSettings");
                [v7 setProperty:v17 forKey:@"Title"];

                v18 = AXLocStringKeyForModel();
                v19 = settingsLocString(v18, @"VoiceOverSettings");
                [v7 setProperty:v19 forKey:@"Description"];

                [v7 setProperty:&off_229030 forKey:@"tipType"];
                if (UIAccessibilityIsVoiceOverRunning())
                {
                  v20 = settingsLocString(@"LiveRecognition_Tip_URLText", @"VoiceOverSettings");
                  [v7 setProperty:v20 forKey:@"URLText"];
                }
                [v7 setProperty:&__block_literal_global_0 forKey:@"ButtonCallback"];
                v94[0] = _NSConcreteStackBlock;
                v94[1] = 3221225472;
                v94[2] = __33__VoiceOverController_specifiers__block_invoke_3;
                v94[3] = &unk_208798;
                objc_copyWeak(&v95, &location);
                unsigned int v21 = objc_retainBlock(v94);
                [v7 setProperty:v21 forKey:@"CloseCallback"];

                v22 = +[NSBundle bundleForClass:objc_opt_class()];
                v23 = +[UIImage imageNamed:@"live-recognition-tip" inBundle:v22];
                [v7 setProperty:v23 forKey:@"Icon"];

                [v7 setProperty:&__kCFBooleanTrue forKey:@"IconIgnoresInvertColors"];
                objc_destroyWeak(&v95);
                objc_destroyWeak(&location);
LABEL_24:
                v24 = [v7 propertyForKey:v5];
                unsigned int v25 = [v24 isEqualToString:@"QuickSettingsGroup"];

                if (v25)
                {
                  id v26 = +[VOSCommandResolver resolverForCurrentHost];
                  id v27 = [objc_alloc((Class)VOSCommandManager) initPreferringUserProfile];
                  id v28 = +[VOSCommand ToggleSettingsHUD];
                  v29 = [v27 gestureBindingsForCommand:v28 withResolver:v26];
                  id v30 = [v29 anyObject];

                  if (v30)
                  {
                    v31 = settingsLocString(@"QUICK_SETTINGS_USAGE_HINT", @"VoiceOverSettings");
                    id v32 = [v30 localizedName];
                    v33 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v31, v32);

                    [v7 setProperty:v33 forKey:v81];
                  }
                }
                id v34 = [v7 propertyForKey:v5];
                unsigned int v35 = [v34 isEqualToString:@"NavigationStyle"];

                if (!v35 || _os_feature_enabled_impl())
                {
                  [v84 addObject:v7];
                  id v36 = [v7 propertyForKey:v5];
                  unsigned int v37 = [v36 isEqualToString:@"VoiceOverTouchEnabled"];

                  if (v37)
                  {
                    id v38 = +[NSNumber numberWithBool:[(VoiceOverController *)val _shouldEnableVoiceOverSwitch]];
                    [v7 setProperty:v38 forKey:v82];

                    v39 = +[AXSettings sharedInstance];
                    id v40 = (char *)[v39 voiceOverActivationWorkaround];

                    if ((unint64_t)(v40 - 1) > 1)
                    {
                      if (v40 == (unsigned char *)&dword_0 + 3)
                      {
                        v41 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
                        id v42 = settingsLocString(@"VOICEOVER_ACTIVATION_DISABLED", @"VoiceOverSettings");
                        [v41 setProperty:v42 forKey:v81];

                        [v84 insertObject:v41 atIndex:0];
                        [v7 setProperty:&__kCFBooleanFalse forKey:v82];
                        [v84 removeObject:v7];
                        [v84 insertObject:v7 atIndex:1];
                      }
                    }
                    else if (!_AXSVoiceOverTouchEnabled())
                    {
                      [(VoiceOverController *)val _changeVOActivationSpecifierIntoButtonCell:v7];
                    }
                  }
                  v43 = [v7 propertyForKey:v89];
                  unsigned int v44 = [v43 isEqualToString:@"VoiceOverTouchSpeakingRate"];

                  if (v44)
                  {
                    v45 = AXHareImage();
                    [v7 setProperty:v45 forKey:v80];

                    objc_super v46 = AXTortoiseImage();
                    [v7 setProperty:v46 forKey:v79];
                  }
                  v47 = [v7 propertyForKey:v5];
                  unsigned int v48 = [v47 isEqualToString:@"VOEnabledGroup"];

                  if (v48) {
                    [(VoiceOverController *)val _updateVOTTutorialSpecifier:v7];
                  }
                  if ([v7 cellType] == (char *)&dword_0 + 2
                    || [v7 cellType] == (char *)&dword_0 + 1)
                  {
                    [v7 setProperty:objc_opt_class() forKey:v83];
                  }
                  v49 = [v7 propertyForKey:v5];
                  if ([v49 isEqualToString:@"Braille"])
                  {
                    unsigned int v50 = [(VoiceOverController *)val inSetup];

                    if (v50) {
                      [v7 setProperty:objc_opt_class() forKey:v78];
                    }
                  }
                  else
                  {
                  }
                }
              }
            }
          }
        }
        id v93 = [obj countByEnumeratingWithState:&v97 objects:v101 count:16];
      }
      while (v93);
    }

    v51 = +[AXSettings sharedInstance];
    unsigned int v52 = [v51 laserEnabled];

    if (v52)
    {
      v53 = +[AXPointerDeviceManager sharedInstance];
      v54 = [v53 connectedDevices];
      BOOL v55 = [v54 count] == 0;

      if (!v55)
      {
        v56 = [v84 lastObject];
        id v57 = [v56 cellType];

        if (v57)
        {
          v58 = +[PSSpecifier emptyGroupSpecifier];
          [v58 setProperty:@"pointerGroup" forKey:PSIDKey];
          [v84 addObject:v58];
        }
        BOOL v59 = v57 == 0;
        v60 = [v84 lastObject];
        v61 = settingsLocString(@"VoiceOverPointerSectionTitle", @"Accessibility-hello");
        [v60 setName:v61];

        v62 = settingsLocString(@"VoiceOverCursorOption", @"Accessibility-hello");
        v63 = +[PSSpecifier preferenceSpecifierNamed:v62 target:val set:0 get:"voiceOverCursorOptionDescription:" detail:objc_opt_class() cell:2 edit:0];

        uint64_t v64 = objc_opt_class();
        uint64_t v65 = PSCellClassKey;
        [v63 setProperty:v64 forKey:PSCellClassKey];
        [v84 addObject:v63];
        v66 = settingsLocString(@"VoiceOverSpeakUnderPointer", @"Accessibility-hello");
        v67 = +[PSSpecifier preferenceSpecifierNamed:v66 target:val set:0 get:"voiceOverSpeakUnderPointerDescription:" detail:objc_opt_class() cell:2 edit:0];

        [v67 setProperty:objc_opt_class() forKey:v65];
        [v84 addObject:v67];
        v68 = settingsLocString(@"IgnoreTrackpad", @"Accessibility-hello");
        v69 = +[PSSpecifier preferenceSpecifierNamed:v68 target:val set:"setVoiceOverIgnoreTrackpad:specifier:" get:"voiceOverIgnoreTrackpad:" detail:0 cell:6 edit:0];

        [v84 addObject:v69];
        if (v59)
        {
          v70 = +[PSSpecifier emptyGroupSpecifier];
          [v70 setProperty:@"lastGroup" forKey:PSIDKey];
          [v84 addObject:v70];
        }
      }
    }
    [(VoiceOverController *)val filterBuddy:v84];
    v71 = (char *)[v84 indexOfSpecifierWithID:@"VoiceOverTouchEnabled"];
    v72 = [(VoiceOverController *)val _generateVOTutorialSpecifiers];
    v73 = v71 + 1;
    [v84 insertObjects:v72 atIndex:v73];

    if (_AXSVoiceOverTouchEnabled())
    {
      v74 = [(VoiceOverController *)val _generateVOPracticeSpecifiers];
      [v84 insertObjects:v74 atIndex:v73];
    }
    v75 = *(void **)&val->AXUISettingsBaseListController_opaque[v77];
    *(void *)&val->AXUISettingsBaseListController_opaque[v77] = v84;

    v3 = *(void **)&val->AXUISettingsBaseListController_opaque[v77];
  }

  return v3;
}

void __33__VoiceOverController_specifiers__block_invoke(id a1)
{
}

void __33__VoiceOverController_specifiers__block_invoke_2(id a1)
{
  id v1 = +[AXPISystemActionHelper sharedInstance];
  [v1 activateDetectionMode];
}

void __33__VoiceOverController_specifiers__block_invoke_3(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  AXPerformBlockAsynchronouslyOnMainThread();
  objc_destroyWeak(&v1);
}

void __33__VoiceOverController_specifiers__block_invoke_4(uint64_t a1)
{
  v2 = +[NSUserDefaults standardUserDefaults];
  [v2 setBool:1 forKey:@"LiveRecognitionTipKitSeen_18_0"];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];

  UIAccessibilityNotifications v4 = UIAccessibilityLayoutChangedNotification;

  UIAccessibilityPostNotification(v4, 0);
}

- (void)_updateTutorialButtonForOneness
{
  id v6 = [(VoiceOverController *)self specifierForID:@"VoiceOverTouchTutorialEnabled"];
  v3 = +[AXSpringBoardServer server];
  uint64_t v4 = [v3 isContinuitySessionActive] ^ 1;

  uint64_t v5 = +[NSNumber numberWithBool:v4];
  [v6 setProperty:v5 forKey:PSEnabledKey];

  [(VoiceOverController *)self reloadSpecifier:v6];
}

- (void)setVoiceOverIgnoreTrackpad:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverIgnoreTrackpad:v4];
}

- (id)voiceOverIgnoreTrackpad:(id)a3
{
  v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverIgnoreTrackpad]);

  return v4;
}

- (void)connectedPointerDevicesDidChange:(id)a3
{
}

id __56__VoiceOverController_connectedPointerDevicesDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSpecifiers];
}

- (id)voiceOverCursorOptionDescription:(id)a3
{
  uint64_t v3 = _AXSPointerVoiceOverCursorOption();

  return +[AXPointerControllerVoiceOverCursorOptions localizedNameForVoiceOverCursorOption:v3];
}

- (id)voiceOverSpeakUnderPointerDescription:(id)a3
{
  if (_AXSVoiceOverSpeakUnderPointerEnabled())
  {
    _AXSVoiceOverSpeakUnderPointerDelay();
    AXLocalizedTimeSummary();
  }
  else
  {
    settingsLocString(@"VoiceOverSpeakUnderPointerDisabled", @"Accessibility-hello");
  uint64_t v3 = };

  return v3;
}

- (void)_updateSpecifierItemInfo:(id)a3 parentInfo:(id)a4 index:(int64_t)a5
{
  id v6 = a3;
  id v7 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = [&off_22BC78 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    v19 = v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(&off_22BC78);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v13 = [v6 objectForKey:v12];
        if ([&off_22BC90 containsObject:v13])
        {
          id v14 = [v6 mutableCopy];
          v15 = +[NSString stringWithFormat:@"%@_IPAD", v13, v19];
          [v14 setObject:v15 forKey:v12];
        }
        else
        {
          id v14 = 0;
        }
        unsigned int v16 = [v6 objectForKeyedSubscript:@"additionalContent"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = [v16 mutableCopy];
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v23[0] = __65__VoiceOverController__updateSpecifierItemInfo_parentInfo_index___block_invoke;
          v23[1] = &unk_208A80;
          v23[2] = self;
          id v24 = v17;
          id v18 = v17;
          [v18 enumerateObjectsUsingBlock:v22];
          if (!v14) {
            id v14 = [v6 mutableCopy];
          }
          [v14 setObject:v18 forKey:@"additionalContent"];
        }
        if (v14) {
          [v7 replaceObjectAtIndex:a5 withObject:v14];
        }
      }
      id v9 = [&off_22BC78 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }
}

id __65__VoiceOverController__updateSpecifierItemInfo_parentInfo_index___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _updateSpecifierItemInfo:a2 parentInfo:*(void *)(a1 + 40) index:a3];
}

- (void)_updateVOTTutorialSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [v4 propertyForKey:@"content"];
  id v6 = [v5 mutableCopy];

  if (AXDeviceIsPad())
  {
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = __51__VoiceOverController__updateVOTTutorialSpecifier___block_invoke;
    v49[3] = &unk_208A80;
    v49[4] = self;
    id v50 = v6;
    [v50 enumerateObjectsUsingBlock:v49];
  }
  else
  {
    if (AXDeviceHasHomeButton())
    {
      id v7 = &__block_literal_global_550;
LABEL_9:
      id v9 = [v6 indexesOfObjectsPassingTest:v7];
      [v6 removeObjectsAtIndexes:v9];

      goto LABEL_10;
    }
    id v8 = [v6 indexesOfObjectsPassingTest:&__block_literal_global_540];
    [v6 removeObjectsAtIndexes:v8];
  }
  if (!MGGetBoolAnswer() || !SBSIsReachabilityEnabled())
  {
    id v7 = &__block_literal_global_545;
    goto LABEL_9;
  }
LABEL_10:
  if ([v6 count] == &dword_4)
  {
    v39 = v6;
    id v40 = v4;
    uint64_t v10 = AXTeachableFeatureVoiceOver;
    v11 = +[AXTeachableMomentsManager teachableItemsForFeature:AXTeachableFeatureVoiceOver];
    uint64_t v12 = AXTeachableFeatureBraille;
    uint64_t v13 = +[AXTeachableMomentsManager teachableItemsForFeature:AXTeachableFeatureBraille];
    id v14 = objc_opt_new();
    if ([v11 count])
    {
      uint64_t v38 = v12;
      v61[0] = @"sectionLabel";
      v15 = +[AXTeachableMomentsManager notificationTitleForFeature:v10];
      v61[1] = @"alreadyLocalized";
      v62[0] = v15;
      v62[1] = &__kCFBooleanTrue;
      unsigned int v16 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];
      [v14 addObject:v16];

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v17 = v11;
      id v18 = [v17 countByEnumeratingWithState:&v45 objects:v60 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v46;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v46 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            v58[0] = @"headerLabel";
            v23 = [v22 itemTitle];
            v59[0] = v23;
            v58[1] = @"contentLabel";
            id v24 = [v22 itemDescription];
            v58[2] = @"alreadyLocalized";
            v59[1] = v24;
            v59[2] = &__kCFBooleanTrue;
            long long v25 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:3];
            [v14 addObject:v25];
          }
          id v19 = [v17 countByEnumeratingWithState:&v45 objects:v60 count:16];
        }
        while (v19);
      }

      uint64_t v12 = v38;
    }
    if ([v13 count])
    {
      v56[0] = @"sectionLabel";
      long long v26 = +[AXTeachableMomentsManager notificationTitleForFeature:v12];
      v56[1] = @"alreadyLocalized";
      v57[0] = v26;
      v57[1] = &__kCFBooleanTrue;
      long long v27 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];
      [v14 addObject:v27];

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v28 = v13;
      id v29 = [v28 countByEnumeratingWithState:&v41 objects:v55 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = *(void *)v42;
        do
        {
          for (j = 0; j != v30; j = (char *)j + 1)
          {
            if (*(void *)v42 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = *(void **)(*((void *)&v41 + 1) + 8 * (void)j);
            v53[0] = @"headerLabel";
            id v34 = [v33 itemTitle];
            v54[0] = v34;
            v53[1] = @"contentLabel";
            unsigned int v35 = [v33 itemDescription];
            v53[2] = @"alreadyLocalized";
            v54[1] = v35;
            v54[2] = &__kCFBooleanTrue;
            id v36 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:3];
            [v14 addObject:v36];
          }
          id v30 = [v28 countByEnumeratingWithState:&v41 objects:v55 count:16];
        }
        while (v30);
      }
    }
    id v6 = v39;
    if ([v14 count])
    {
      v51[0] = @"moreLabel";
      v51[1] = @"additionalTitleLabel";
      v52[0] = @"VoiceOverTouchWhatsNewLabel";
      v52[1] = @"VOICEOVER_TITLE";
      v51[2] = @"additionalContent";
      v51[3] = @"symbolName";
      v52[2] = v14;
      v52[3] = @"voiceover";
      unsigned int v37 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:4];
      [v39 addObject:v37];
    }
    id v4 = v40;
  }
  [v4 setProperty:v6 forKey:@"content"];
}

id __51__VoiceOverController__updateVOTTutorialSpecifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _updateSpecifierItemInfo:a2 parentInfo:*(void *)(a1 + 40) index:a3];
}

BOOL __51__VoiceOverController__updateVOTTutorialSpecifier___block_invoke_2(id a1, NSDictionary *a2, unint64_t a3, BOOL *a4)
{
  id v4 = [(NSDictionary *)a2 objectForKey:@"contentLabel", a4];
  unsigned __int8 v5 = [v4 isEqualToString:@"DOCK_INSTRUCTION"];

  return v5;
}

BOOL __51__VoiceOverController__updateVOTTutorialSpecifier___block_invoke_3(id a1, NSDictionary *a2, unint64_t a3, BOOL *a4)
{
  id v4 = [(NSDictionary *)a2 objectForKey:@"contentLabel", a4];
  unsigned __int8 v5 = [v4 isEqualToString:@"REACHABILITY_INSTRUCTION"];

  return v5;
}

BOOL __51__VoiceOverController__updateVOTTutorialSpecifier___block_invoke_4(id a1, NSDictionary *a2, unint64_t a3, BOOL *a4)
{
  id v4 = [(NSDictionary *)a2 objectForKey:@"contentLabel", a4];
  if (([v4 isEqualToString:@"HOME_INSTRUCTION"] & 1) != 0
    || ([v4 isEqualToString:@"APP_SWITCHER_INSTRUCTION"] & 1) != 0
    || ([v4 isEqualToString:@"REACHABILITY_INSTRUCTION"] & 1) != 0
    || ([v4 isEqualToString:@"CC_SWITCHER_INSTRUCTION"] & 1) != 0
    || ([v4 isEqualToString:@"NC_SWITCHER_INSTRUCTION"] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    unsigned __int8 v5 = [v4 isEqualToString:@"DOCK_INSTRUCTION"];
  }

  return v5;
}

- (void)_changeVOActivationSpecifierIntoButtonCell:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PSSpecifier_cellType) != 13)
  {
    *(void *)((char *)a3 + OBJC_IVAR___PSSpecifier_cellType) = 13;
    id v3 = a3;
    [v3 setButtonAction:"voiceOverActivateWorkaround:"];
    [v3 setProperty:@"PSButtonCell" forKey:PSTableCellClassKey];
    [v3 setProperty:&off_229048 forKey:@"mode"];
    [v3 removePropertyForKey:PSGetterKey];
    [v3 removePropertyForKey:PSSetterKey];
    NSStringFromSelector((SEL)[v3 buttonAction]);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v3 setProperty:v4 forKey:PSButtonActionKey];
  }
}

- (void)_changeVOActivationSpecifierIntoSwitchCell:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PSSpecifier_cellType) != 6)
  {
    *(void *)((char *)a3 + OBJC_IVAR___PSSpecifier_cellType) = 6;
    *(void *)((char *)a3 + OBJC_IVAR___PSSpecifier_getter) = "voiceOverTouchEnabled:";
    *(void *)((char *)a3 + OBJC_IVAR___PSSpecifier_setter) = "setVoiceOverTouchEnabled:specifier:";
    id v4 = (char *)a3;
    [v4 setTarget:self];
    [v4 setProperty:@"PSSwitchCell" forKey:PSTableCellClassKey];
    unsigned __int8 v5 = NSStringFromSelector(*(SEL *)&v4[OBJC_IVAR___PSSpecifier_getter]);
    [v4 setProperty:v5 forKey:PSGetterKey];

    NSStringFromSelector(*(SEL *)&v4[OBJC_IVAR___PSSpecifier_setter]);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v4 setProperty:v6 forKey:PSSetterKey];
  }
}

- (void)voiceOverActivateWorkaround:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = (char *)[v3 voiceOverActivationWorkaround];

  if (v4 == (unsigned char *)&dword_0 + 2)
  {
    unsigned __int8 v5 = (const __CFString **)&AXStartListeningForVoiceOverVibrationActivationNotification;
  }
  else
  {
    if (v4 != (unsigned char *)&dword_0 + 1) {
      return;
    }
    unsigned __int8 v5 = (const __CFString **)&AXStartVoiceOverSwipeDetectionActivationNotification;
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v7 = *v5;

  CFNotificationCenterPostNotification(DarwinNotifyCenter, v7, 0, 0, 1u);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VoiceOverController *)self specifierForIndexPath:v7];
  id v9 = [v8 propertyForKey:PSCellClassKey];
  unsigned int v10 = [v9 isEqual:objc_opt_class()];

  if (v10)
  {
    double tipHeight = self->_tipHeight;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)VoiceOverController;
    [(VoiceOverController *)&v14 tableView:v6 heightForRowAtIndexPath:v7];
    double tipHeight = v12;
  }

  return tipHeight;
}

+ (void)setVoiceOverEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    if (+[UIApplication isRunningInStoreDemoMode])_AXSVoiceOverTouchSetUsageConfirmed(); {
    _AXSVoiceOverTouchUserHasReadNoHomeButtonGestureDescription();
    }
    _AXSVoiceOverTouchSetEnabled();
    _AXSVoiceOverTouchSetUIEnabled();
  }
  else
  {
    _AXSVoiceOverTouchSetEnabled();
    _AXSVoiceOverTouchSetUIEnabled();
    if (!_AXSCanDisableApplicationAccessibility()) {
      return;
    }
  }

  __AXSApplicationAccessibilitySetEnabled(v3);
}

- (void)_handleEnablingVoiceOverWithActivationBlock:(id)a3 cancelBlock:(id)a4
{
  id v6 = (void (**)(void))a3;
  id v7 = a4;
  if ((+[AXLanguageManager voiceOverSupportedInCurrentLanguage] & 1) != 0|| _AXSVoiceOverTouchUsageConfirmed())
  {
    v6[2](v6);
  }
  else
  {
    id v8 = settingsLocString(@"VoiceOverNotSupportedInLanguageTitle", @"VoiceOverSettings");
    id v9 = settingsLocString(@"VoiceOverNotSupportedInLanguageMessage", @"VoiceOverSettings");
    unsigned int v10 = +[AXLanguageManager sharedInstance];
    v11 = [v10 dialectForSystemLanguage];
    double v12 = [v11 languageNameInNativeLocale];
    uint64_t v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v12);
    objc_super v14 = +[UIAlertController alertControllerWithTitle:v8 message:v13 preferredStyle:1];

    v15 = settingsLocString(@"CANCEL", @"Accessibility");
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __79__VoiceOverController__handleEnablingVoiceOverWithActivationBlock_cancelBlock___block_invoke;
    v24[3] = &unk_2088D0;
    id v25 = v7;
    unsigned int v16 = +[UIAlertAction actionWithTitle:v15 style:1 handler:v24];

    [v14 addAction:v16];
    id v17 = settingsLocString(@"OK", @"Accessibility");
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    void v22[2] = __79__VoiceOverController__handleEnablingVoiceOverWithActivationBlock_cancelBlock___block_invoke_2;
    v22[3] = &unk_2088D0;
    v23 = v6;
    id v18 = +[UIAlertAction actionWithTitle:v17 style:0 handler:v22];

    [v14 addAction:v18];
    id v19 = [(VoiceOverController *)self view];
    uint64_t v20 = [v19 window];
    unsigned int v21 = [v20 rootViewController];
    [v21 presentViewController:v14 animated:1 completion:0];
  }
}

uint64_t __79__VoiceOverController__handleEnablingVoiceOverWithActivationBlock_cancelBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79__VoiceOverController__handleEnablingVoiceOverWithActivationBlock_cancelBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setVoiceOverTouchEnabled:(id)a3 specifier:(id)a4
{
  unsigned __int8 v5 = [a3 BOOLValue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __58__VoiceOverController_setVoiceOverTouchEnabled_specifier___block_invoke;
  v15[3] = &unk_2088F8;
  v15[4] = self;
  unsigned __int8 v16 = v5;
  id v6 = objc_retainBlock(v15);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __58__VoiceOverController_setVoiceOverTouchEnabled_specifier___block_invoke_2;
  v13[3] = &__block_descriptor_33_e5_v8__0l;
  unsigned __int8 v14 = v5;
  id v7 = objc_retainBlock(v13);
  if ([(VoiceOverController *)self inSetup])
  {
    [(VoiceOverController *)self _handleEnablingVoiceOverWithActivationBlock:v7 cancelBlock:v6];
  }
  else
  {
    id v8 = [(VoiceOverController *)self parentController];
    id v9 = settingsLocString(@"CONFIRM_VOT_REMOVAL", @"Accessibility");
    uint64_t v10 = kAXSVoiceOverTouchEnabledByiTunesPreference;
    v11 = [(VoiceOverController *)self view];
    double v12 = [v11 window];
    [v8 confirmDisablingWithString:v9 forKey:v10 confirmedBlock:v7 canceledBlock:v6 inWindow:v12];
  }
}

void __58__VoiceOverController_setVoiceOverTouchEnabled_specifier___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) specifierForKey:@"VoiceOverTouchEnabled"];
  v2 = +[NSNumber numberWithInt:*(unsigned char *)(a1 + 40) == 0];
  [v3 setProperty:v2 forKey:PSValueKey];

  [*(id *)(a1 + 32) reloadSpecifier:v3];
}

id __58__VoiceOverController_setVoiceOverTouchEnabled_specifier___block_invoke_2(uint64_t a1)
{
  return +[VoiceOverController setVoiceOverEnabled:*(unsigned __int8 *)(a1 + 32)];
}

- (void)startGestureHelp:(id)a3
{
  if (!self->_gestureHelpViewController)
  {
    id v4 = (VoiceOverGestureHelpViewController *)[objc_allocWithZone((Class)VoiceOverGestureHelpViewController) init];
    gestureHelpViewController = self->_gestureHelpViewController;
    self->_gestureHelpViewController = v4;
  }
  id v6 = [[VoiceOverGestureHelpNavigationController alloc] initWithRootViewController:self->_gestureHelpViewController];
  [(VoiceOverController *)self presentViewController:v6 animated:1 completion:&__block_literal_global_621];
}

- (void)displayVoiceOverTutorialView
{
  if (AXDeviceSupportsVoiceOverOnboarding())
  {
    id v2 = +[AXSpringBoardServer server];
    [v2 launchOnboardingViewService:@"voiceover"];
  }
}

- (void)startVoiceOverTutorial:(id)a3
{
  if (_AXSVoiceOverTouchEnabled())
  {
    [(VoiceOverController *)self displayVoiceOverTutorialView];
  }
  else
  {
    id v4 = settingsLocString(@"VOICEOVER_TUTORIAL_ALERT_TITLE", @"VoiceOverSettings");
    unsigned __int8 v5 = settingsLocString(@"VOICEOVER_TUTORIAL_ALERT_TEXT", @"VoiceOverSettings");
    id v6 = +[UIAlertController alertControllerWithTitle:v4 message:v5 preferredStyle:0];

    id v7 = settingsLocString(@"VOICEOVER_TUTORIAL_ALERT_LAUNCH_WITH_VO_ON_BUTTON", @"VoiceOverSettings");
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __46__VoiceOverController_startVoiceOverTutorial___block_invoke;
    v17[3] = &unk_208B68;
    v17[4] = self;
    id v8 = +[UIAlertAction actionWithTitle:v7 style:0 handler:v17];

    [v6 addAction:v8];
    id v9 = settingsLocString(@"VOICEOVER_TUTORIAL_ALERT_LAUNCH_WITH_VO_OFF_BUTTON", @"VoiceOverSettings");
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __46__VoiceOverController_startVoiceOverTutorial___block_invoke_2;
    v16[3] = &unk_208B68;
    v16[4] = self;
    uint64_t v10 = +[UIAlertAction actionWithTitle:v9 style:0 handler:v16];

    [v6 addAction:v10];
    v11 = settingsLocString(@"CANCEL", @"Accessibility");
    double v12 = +[UIAlertAction actionWithTitle:v11 style:1 handler:0];

    [v6 addAction:v12];
    uint64_t v13 = [(VoiceOverController *)self view];
    unsigned __int8 v14 = [v13 window];
    v15 = [v14 rootViewController];
    [v15 presentViewController:v6 animated:1 completion:0];
  }
}

id __46__VoiceOverController_startVoiceOverTutorial___block_invoke(uint64_t a1)
{
  _AXSVoiceOverTouchSetUsageConfirmed();
  _AXSVoiceOverTouchSetUserHasReadNoHomeButtonGestureDescription();
  _AXSVoiceOverTouchSetEnabled();
  id v2 = *(void **)(a1 + 32);

  return [v2 displayVoiceOverTutorialView];
}

id __46__VoiceOverController_startVoiceOverTutorial___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) displayVoiceOverTutorialView];
}

- (id)voiceOverTouchEnabled:(id)a3
{
  uint64_t v3 = _AXSVoiceOverTouchEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setSpeakingRate:(id)a3 specifier:(id)a4
{
  self->_ignoreNextReload = 1;
  id v5 = a3;
  [(VoiceOverController *)self setLastSpeechRateAdjustmentTime:CFAbsoluteTimeGetCurrent()];
  [v5 floatValue];
  int v7 = v6;

  id v9 = +[AXSettings sharedInstance];
  LODWORD(v8) = v7;
  [v9 setVoiceOverSpeakingRate:v8];
}

- (id)speakingRate:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  [v3 voiceOverSpeakingRate];
  id v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  return v4;
}

- (void)setSoundEffectsEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverSoundEffectsEnabled:v4];
}

- (id)soundEffectsEnabled:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverSoundEffectsEnabled]);

  return v4;
}

- (BOOL)cachedBrailleDisplayIsPaired:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = +[VOSBluetoothManager sharedInstance];
  int v6 = [v5 pairedDevices];
  [v4 axSafelyAddObjectsFromArray:v6];

  int v7 = +[VOSBluetoothManager sharedInstance];
  double v8 = [v7 pairedBTLEDevices];
  [v4 axSafelyAddObjectsFromArray:v8];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __52__VoiceOverController_cachedBrailleDisplayIsPaired___block_invoke;
  v11[3] = &unk_208B90;
  id v12 = v3;
  id v9 = v3;
  LOBYTE(v7) = objc_msgSend(v4, "ax_containsObjectUsingBlock:", v11);

  return (char)v7;
}

id __52__VoiceOverController_cachedBrailleDisplayIsPaired___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 address];
  id v4 = [*(id *)(a1 + 32) objectForKey:kSCROBrailleDisplayBluetoothAddress];
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)brailleDisplayNameForSpecifier:(id)a3
{
  id v4 = +[NSMutableArray array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = +[AXSettings sharedInstance];
  int v6 = [v5 voiceOverBrailleDisplays];

  id v7 = [v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v35;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v12 = [v11 objectForKey:kSCROBrailleDisplayBluetoothName];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [(VoiceOverController *)self cachedBrailleDisplayIsPaired:v11])
        {
          [v4 addObject:v12];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v8);
  }

  uint64_t v13 = (void *)_AXSVoiceOverTouchCopyTactileGraphicsDisplay();
  if (v13)
  {
    id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:v13];
    if (v14)
    {
      v15 = +[VOSBluetoothManager sharedInstance];
      unsigned __int8 v16 = [v15 centralManager];
      id v39 = v14;
      id v17 = +[NSArray arrayWithObjects:&v39 count:1];
      id v18 = [v16 retrievePeripheralsWithIdentifiers:v17];

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v19 = v18;
      id v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v31;
        do
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(void *)v31 != v22) {
              objc_enumerationMutation(v19);
            }
            id v24 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
            id v25 = objc_msgSend(v24, "name", (void)v30);
            unsigned __int8 v26 = [v4 containsObject:v25];

            if ((v26 & 1) == 0)
            {
              long long v27 = [v24 name];
              [v4 addObject:v27];
            }
          }
          id v21 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v21);
      }
    }
  }
  id v28 = +[NSListFormatter localizedStringByJoiningStrings:](NSListFormatter, "localizedStringByJoiningStrings:", v4, (void)v30);

  return v28;
}

- (void)setCaptionPanel:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setEnableVoiceOverCaptions:v4];
}

- (id)captionPanelForSpecifier:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 enableVoiceOverCaptions]);

  return v4;
}

- (void)setScreenCurtainEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  __AXSVoiceOverTouchSetScreenCurtainEnabled(v4);
}

- (id)screenCurtainEnabled:(id)a3
{
  uint64_t v3 = _AXSVoiceOverTouchScreenCurtainEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)cursorStyleSetPreference:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverLargeCursorEnabled:v4];
}

- (id)cursorStyleForSpecifier:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverLargeCursorEnabled]);

  return v4;
}

- (id)navigateImagesPreferenceForSpecifier:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = (char *)[v3 voiceOverNavigateImagesOption];

  CFStringRef v5 = @"NAV_IMG_NEVER";
  if (v4 == (unsigned char *)&dword_0 + 2) {
    CFStringRef v5 = @"NAV_IMG_W_DESCRIPTIONS_SHORT";
  }
  if (v4 == (unsigned char *)&dword_0 + 1) {
    int v6 = @"NAV_IMG_ALWAYS";
  }
  else {
    int v6 = (__CFString *)v5;
  }
  id v7 = settingsLocString(v6, @"VoiceOverSettings");

  return v7;
}

- (void)setSpeakingRateInRotor:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverSpeakingRateInRotorEnabled:v4];
}

- (id)speakingRateInRotor:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverSpeakingRateInRotorEnabled]);

  return v4;
}

- (id)voiceOverDelayUntilSpeakInterval:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  [v3 voiceOverDelayUntilSpeakUnderTouch];
  id v4 = AXLocalizedTimeSummary();

  return v4;
}

- (id)doubleTapInterval:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  [v3 voiceOverDoubleTapInterval];
  id v4 = AXLocalizedTimeSummary();

  return v4;
}

- (id)navigationStyle:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = (char *)[v3 voiceOverNavigationStyle];

  if (!v4)
  {
    id v5 = @"NAVIGATION_STYLE_FLAT";
    goto LABEL_5;
  }
  if (v4 == (unsigned char *)&dword_0 + 1)
  {
    id v5 = @"NAVIGATION_STYLE_GROUPS";
LABEL_5:
    int v6 = settingsLocString(v5, @"VoiceOverSettings");
    goto LABEL_7;
  }
  int v6 = 0;
LABEL_7:

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)VoiceOverController;
  id v4 = [(VoiceOverController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  id v5 = [v4 textLabel];
  [v5 setNumberOfLines:0];

  return v4;
}

- (double)lastSpeechRateAdjustmentTime
{
  return self->_lastSpeechRateAdjustmentTime;
}

- (void)setLastSpeechRateAdjustmentTime:(double)a3
{
  self->_lastSpeechRateAdjustmentTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureHelpViewController, 0);
  objc_storeStrong((id *)&self->_voiceOverGestureHelpSpacerSpecifier, 0);
  objc_storeStrong((id *)&self->_voiceOverGestureHelpSpecifier, 0);

  objc_storeStrong((id *)&self->_voiceOverOnSpecifier, 0);
}

@end