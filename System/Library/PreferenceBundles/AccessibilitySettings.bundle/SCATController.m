@interface SCATController
- (BOOL)_isUsingHeadSwitch;
- (BOOL)_shouldDisableSwitch;
- (BOOL)cursorColorSelectionController:(id)a3 allowsCursorColor:(int64_t)a4;
- (LAContext)localAuthContext;
- (NSArray)cachedAutoScanningOptionsSpecifiers;
- (NSArray)cachedDwellScanningOptionsSpecifiers;
- (NSArray)cachedManualScanningOptionsSpecifiers;
- (NSArray)cachedSpeechOptionsSpecifiers;
- (NSMutableArray)cachedPointPickerOptionsSpecifiers;
- (SCATController)init;
- (id)_autoScanningOptionsSpecifiers;
- (id)_dwellScanningOptionsSpecifiers;
- (id)_localizedSummaryForDelay:(double)a3;
- (id)_manualScanningOptionsSpecifiers;
- (id)_pointPickerSpecifiers;
- (id)_scanTimeoutSpecifier;
- (id)_summaryForListOfItems:(id)a3;
- (id)actionRepeatSummary:(id)a3;
- (id)alwaysTapKeyboardKeysEnabled:(id)a3;
- (id)autoscanDelaySummary:(id)a3;
- (id)compactMenuEnabled:(id)a3;
- (id)cursorColorDescription:(id)a3;
- (id)cursorHighVisibility:(id)a3;
- (id)customGesturesSummary:(id)a3;
- (id)delayAfterInputSummary:(id)a3;
- (id)dwellTimeSummary:(id)a3;
- (id)firstLaunchScanningMode:(id)a3;
- (id)headMovementSummary:(id)a3;
- (id)headScanningSummary:(id)a3;
- (id)holdDurationSummary:(id)a3;
- (id)inputCoalescingSummary:(id)a3;
- (id)itemGroupingEnabled:(id)a3;
- (id)longPressSummary:(id)a3;
- (id)payWithSwitchControl:(id)a3;
- (id)pointPickerSelectionStyleSummary:(id)a3;
- (id)recipesSummary:(id)a3;
- (id)restartScanningAtCurrentKey:(id)a3;
- (id)scanByElements:(id)a3;
- (id)scanCyclesSummary:(id)a3;
- (id)scanLocationAfterTapSummary:(id)a3;
- (id)scanTimeoutSummary:(id)a3;
- (id)scanningStyle:(id)a3;
- (id)selectActionDelaySummary:(id)a3;
- (id)selectSpecifier:(id)a3;
- (id)soundEnabled:(id)a3;
- (id)specifiers;
- (id)speechEnabled:(id)a3;
- (id)switchScanningEnabled:(id)a3;
- (id)switchesSummary:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tapBehaviorSummary:(id)a3;
- (id)useExtendedKeyboardPredictions:(id)a3;
- (int64_t)selectedColorForSelectionController:(id)a3;
- (void)_preferencesDidChange:(id)a3;
- (void)_reloadAfterSecureIntentDismissal;
- (void)cursorColorSelectionController:(id)a3 selectedCursorColor:(int64_t)a4;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)secureIntentViewControllerDidCancel:(id)a3;
- (void)secureIntentViewControllerDidFinish:(id)a3;
- (void)setAlwaysTapKeyboardKeysEnabled:(id)a3 specifier:(id)a4;
- (void)setCachedAutoScanningOptionsSpecifiers:(id)a3;
- (void)setCachedDwellScanningOptionsSpecifiers:(id)a3;
- (void)setCachedManualScanningOptionsSpecifiers:(id)a3;
- (void)setCachedPointPickerOptionsSpecifiers:(id)a3;
- (void)setCachedSpeechOptionsSpecifiers:(id)a3;
- (void)setCompactMenuEnabled:(id)a3 specifier:(id)a4;
- (void)setCursorHighVisibility:(id)a3 specifier:(id)a4;
- (void)setItemGroupingEnabled:(id)a3 specifier:(id)a4;
- (void)setLocalAuthContext:(id)a3;
- (void)setPayWithSwitchControl:(id)a3 specifier:(id)a4;
- (void)setRestartScanningAtCurrentKey:(id)a3 specifier:(id)a4;
- (void)setScanByElements:(id)a3 specifier:(id)a4;
- (void)setSoundEnabled:(id)a3 specifier:(id)a4;
- (void)setSwitchScanningEnabled:(id)a3 specifier:(id)a4;
- (void)setUseExtendedKeyboardPredictions:(id)a3 specifier:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SCATController

- (SCATController)init
{
  v45.receiver = self;
  v45.super_class = (Class)SCATController;
  v2 = [(SCATController *)&v45 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = +[AXSettings sharedInstance];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = __22__SCATController_init__block_invoke;
    v42[3] = &unk_208798;
    objc_copyWeak(&v43, &location);
    [v3 registerUpdateBlock:v42 forRetrieveSelector:"assistiveTouchStepInterval" withListener:v2];

    objc_destroyWeak(&v43);
    v4 = +[AXSettings sharedInstance];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = __22__SCATController_init__block_invoke_2;
    v40[3] = &unk_208798;
    objc_copyWeak(&v41, &location);
    [v4 registerUpdateBlock:v40 forRetrieveSelector:"switchControlAutoTapTimeout" withListener:v2];

    objc_destroyWeak(&v41);
    v5 = +[AXSettings sharedInstance];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = __22__SCATController_init__block_invoke_3;
    v38[3] = &unk_208798;
    objc_copyWeak(&v39, &location);
    [v5 registerUpdateBlock:v38 forRetrieveSelector:"assistiveTouchScanTimeout" withListener:v2];

    objc_destroyWeak(&v39);
    v6 = +[AXSettings sharedInstance];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = __22__SCATController_init__block_invoke_4;
    v36[3] = &unk_208798;
    objc_copyWeak(&v37, &location);
    [v6 registerUpdateBlock:v36 forRetrieveSelector:"assistiveTouchScannerSpeechEnabled" withListener:v2];

    objc_destroyWeak(&v37);
    v7 = +[AXSettings sharedInstance];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = __22__SCATController_init__block_invoke_5;
    v34[3] = &unk_208798;
    objc_copyWeak(&v35, &location);
    [v7 registerUpdateBlock:v34 forRetrieveSelector:"assistiveTouchScannerSoundEnabled" withListener:v2];

    objc_destroyWeak(&v35);
    v8 = +[AXSettings sharedInstance];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = __22__SCATController_init__block_invoke_6;
    v32[3] = &unk_208798;
    objc_copyWeak(&v33, &location);
    [v8 registerUpdateBlock:v32 forRetrieveSelector:"assistiveTouchScannerCompactMenuEnabled" withListener:v2];

    objc_destroyWeak(&v33);
    v9 = +[AXSettings sharedInstance];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = __22__SCATController_init__block_invoke_7;
    v30[3] = &unk_208798;
    objc_copyWeak(&v31, &location);
    [v9 registerUpdateBlock:v30 forRetrieveSelector:"assistiveTouchGroupElementsEnabled" withListener:v2];

    objc_destroyWeak(&v31);
    v10 = +[AXSettings sharedInstance];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = __22__SCATController_init__block_invoke_8;
    v28[3] = &unk_208798;
    objc_copyWeak(&v29, &location);
    [v10 registerUpdateBlock:v28 forRetrieveSelector:"assistiveTouchSwitches" withListener:v2];

    objc_destroyWeak(&v29);
    v11 = +[AXSettings sharedInstance];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = __22__SCATController_init__block_invoke_9;
    v26[3] = &unk_208798;
    objc_copyWeak(&v27, &location);
    [v11 registerUpdateBlock:v26 forRetrieveSelector:"assistiveTouchSavedGestures" withListener:v2];

    objc_destroyWeak(&v27);
    if (AXShouldShowSwitchControlHeadTrackingModeFromSettings())
    {
      v12 = +[AXSettings sharedInstance];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = __22__SCATController_init__block_invoke_10;
      v24[3] = &unk_208798;
      objc_copyWeak(&v25, &location);
      [v12 registerUpdateBlock:v24 forRetrieveSelector:"switchControlUseCameraForPointMode" withListener:v2];

      objc_destroyWeak(&v25);
    }
    v13 = +[AXSettings sharedInstance];
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = __22__SCATController_init__block_invoke_11;
    v22 = &unk_208798;
    objc_copyWeak(&v23, &location);
    [v13 registerUpdateBlock:&v19 forRetrieveSelector:"switchControlFirstLaunchScanningMode" withListener:v2];

    objc_destroyWeak(&v23);
    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v2 selector:"_preferencesDidChange:" name:kAXSVoiceOverTouchEnabledNotification object:0];

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v2 selector:"_preferencesDidChange:" name:kAXSAssistiveTouchEnabledNotification object:0];

    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v2 selector:"_preferencesDidChange:" name:kAXSAssistiveTouchScannerEnabledNotification object:0];

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v2 selector:"_preferencesDidChange:" name:kAXSFullKeyboardAccessEnabledNotification object:0];

    objc_destroyWeak(&location);
  }
  return v2;
}

void __22__SCATController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"ScanningSpeedIdentifier" animated:0];
}

void __22__SCATController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"SelectActionDelayIdentifier" animated:0];
}

void __22__SCATController_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"ScanTimeoutIdentifier" animated:0];
}

void __22__SCATController_init__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"SpeechIdentifier" animated:0];
}

void __22__SCATController_init__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"SoundIdentifier" animated:0];
}

void __22__SCATController_init__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"CompactMenuIdentifier" animated:0];
}

void __22__SCATController_init__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"ItemGroupingIdentifier" animated:0];
}

void __22__SCATController_init__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"SwitchesIdentifier" animated:0];
}

void __22__SCATController_init__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"CustomGesturesIdentifier" animated:0];
}

void __22__SCATController_init__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"CameraPointPickerSwitch"];
}

void __22__SCATController_init__block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"FirstLaunchScanningModeIdentifier" animated:0];
}

- (BOOL)_shouldDisableSwitch
{
  return _AXSAssistiveTouchEnabled()
      || _AXSVoiceOverTouchEnabled()
      || _AXSFullKeyboardAccessEnabled() != 0;
}

- (void)_preferencesDidChange:(id)a3
{
  id v5 = [(SCATController *)self specifierForID:@"EnablingCell"];
  v4 = +[NSNumber numberWithInt:[(SCATController *)self _shouldDisableSwitch] ^ 1];
  [v5 setProperty:v4 forKey:PSEnabledKey];

  [(SCATController *)self reloadSpecifiers];
}

- (id)selectSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCATController;
  v4 = [(SCATController *)&v6 selectSpecifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setDelegate:self];
  }

  return v4;
}

- (id)specifiers
{
  v2 = self;
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3) {
    goto LABEL_43;
  }
  uint64_t v154 = OBJC_IVAR___PSListController__specifiers;
  v4 = objc_opt_new();
  id v5 = +[PSSpecifier emptyGroupSpecifier];
  [v4 addObject:v5];
  objc_super v6 = AXLocStringKeyForModel();
  uint64_t v7 = AXParameterizedLocalizedString();

  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  [v5 setProperty:v9 forKey:PSFooterCellClassGroupKey];

  v10 = +[NSBundle bundleWithIdentifier:@"com.apple.accessibility.AccessibilityUIUtilities"];
  v11 = [v10 bundlePath];
  [v5 setProperty:v11 forKey:@"bundlePath"];

  v172[0] = @"contentLabel";
  v172[1] = @"alreadyLocalized";
  v157 = (void *)v7;
  v173[0] = v7;
  v173[1] = &__kCFBooleanTrue;
  v12 = +[NSDictionary dictionaryWithObjects:v173 forKeys:v172 count:2];
  v174 = v12;
  v13 = +[NSArray arrayWithObjects:&v174 count:1];
  id v14 = [v13 mutableCopy];

  uint64_t v15 = AXTeachableFeatureSwitchControl;
  v158 = +[AXTeachableMomentsManager teachableItemsForFeature:AXTeachableFeatureSwitchControl];
  v155 = v4;
  v156 = v5;
  v159 = v14;
  if ([v158 count])
  {
    v152 = v2;
    v170[0] = @"moreLabel";
    v16 = AXParameterizedLocalizedString();
    v171[0] = v16;
    v170[1] = @"additionalTitleLabel";
    v17 = AXParameterizedLocalizedString();
    v171[1] = v17;
    v171[2] = &__kCFBooleanTrue;
    v170[2] = @"alreadyLocalized";
    v170[3] = @"symbolName";
    v171[3] = @"square.grid.2x2";
    v18 = +[NSDictionary dictionaryWithObjects:v171 forKeys:v170 count:4];
    id v150 = [v18 mutableCopy];

    v19 = objc_opt_new();
    v168[0] = @"sectionLabel";
    uint64_t v20 = +[AXTeachableMomentsManager notificationTitleForFeature:v15];
    v168[1] = @"alreadyLocalized";
    v169[0] = v20;
    v169[1] = &__kCFBooleanTrue;
    v21 = +[NSDictionary dictionaryWithObjects:v169 forKeys:v168 count:2];
    [v19 addObject:v21];

    long long v162 = 0u;
    long long v163 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    id v22 = v158;
    id v23 = [v22 countByEnumeratingWithState:&v160 objects:v167 count:16];
    if (v23)
    {
      id v24 = v23;
      CFStringRef v25 = @"alreadyLocalized";
      uint64_t v26 = *(void *)v161;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v161 != v26) {
            objc_enumerationMutation(v22);
          }
          v28 = *(void **)(*((void *)&v160 + 1) + 8 * i);
          v165[0] = @"headerLabel";
          id v29 = [v28 itemTitle];
          v166[0] = v29;
          v165[1] = @"contentLabel";
          v30 = [v28 itemDescription];
          v165[2] = v25;
          v166[1] = v30;
          v166[2] = &__kCFBooleanTrue;
          +[NSDictionary dictionaryWithObjects:v166 forKeys:v165 count:3];
          v32 = CFStringRef v31 = v25;
          [v19 addObject:v32];

          CFStringRef v25 = v31;
        }
        id v24 = [v22 countByEnumeratingWithState:&v160 objects:v167 count:16];
      }
      while (v24);
    }

    [v150 setObject:v19 forKey:@"additionalContent"];
    id v14 = v159;
    [v159 addObject:v150];

    v2 = v152;
    v4 = v155;
    id v5 = v156;
  }
  [v5 setProperty:v14 forKey:@"content"];
  id v33 = AXParameterizedLocalizedString();
  v34 = +[PSSpecifier preferenceSpecifierNamed:v33 target:v2 set:"setSwitchScanningEnabled:specifier:" get:"switchScanningEnabled:" detail:0 cell:6 edit:0];

  [v34 setProperty:@"EnablingCell" forKey:PSIDKey];
  [v4 addObject:v34];
  v153 = v34;
  if ([(SCATController *)v2 _shouldDisableSwitch])
  {
    [v34 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
    if (_AXSAssistiveTouchEnabled()
      || _AXSVoiceOverTouchEnabled()
      || _AXSFullKeyboardAccessEnabled())
    {
      uint64_t v35 = AXParameterizedLocalizedString();
      if (v35)
      {
        v36 = (void *)v35;
        uint64_t v37 = +[NSString stringWithFormat:@"%@\n\n%@", v157, v35];

        [v5 setProperty:v37 forKey:PSFooterTextGroupKey];
        v157 = (void *)v37;
      }
    }
  }
  v151 = +[PSSpecifier emptyGroupSpecifier];
  objc_msgSend(v4, "addObject:");
  v38 = AXParameterizedLocalizedString();
  id v39 = +[PSSpecifier preferenceSpecifierNamed:v38 target:v2 set:0 get:"switchesSummary:" detail:objc_opt_class() cell:2 edit:0];

  [v39 setIdentifier:@"SwitchesIdentifier"];
  v149 = v39;
  [v4 addObject:v39];
  v40 = AXParameterizedLocalizedString();
  id v41 = +[PSSpecifier preferenceSpecifierNamed:v40 target:v2 set:0 get:"recipesSummary:" detail:objc_opt_class() cell:2 edit:0];

  [v41 setIdentifier:@"RecipesIdentifier"];
  v148 = v41;
  [v4 addObject:v41];
  v147 = +[PSSpecifier emptyGroupSpecifier];
  objc_msgSend(v4, "addObject:");
  v42 = AXParameterizedLocalizedString();
  id v43 = +[PSSpecifier preferenceSpecifierNamed:v42 target:v2 set:0 get:"scanningStyle:" detail:objc_opt_class() cell:2 edit:0];

  [v43 setIdentifier:@"ScanningStyleIdentifier"];
  v146 = v43;
  [v4 addObject:v43];
  v44 = AXParameterizedLocalizedString();
  objc_super v45 = +[PSSpecifier preferenceSpecifierNamed:v44 target:v2 set:0 get:"firstLaunchScanningMode:" detail:objc_opt_class() cell:2 edit:0];

  [v45 setIdentifier:@"FirstLaunchScanningModeIdentifier"];
  v145 = v45;
  [v4 addObject:v45];
  v46 = AXParameterizedLocalizedString();
  v47 = +[PSSpecifier groupSpecifierWithName:v46];

  [v47 setIdentifier:@"TimingIdentifier"];
  v144 = v47;
  [v4 addObject:v47];
  v143 = +[AXSettings sharedInstance];
  v48 = (char *)[v143 switchControlScanningStyle];
  if (v48 == (unsigned char *)&dword_0 + 2)
  {
    uint64_t v49 = [(SCATController *)v2 _dwellScanningOptionsSpecifiers];
    goto LABEL_23;
  }
  if (v48 == (unsigned char *)&dword_0 + 1)
  {
    uint64_t v49 = [(SCATController *)v2 _manualScanningOptionsSpecifiers];
    goto LABEL_23;
  }
  if (!v48)
  {
    uint64_t v49 = [(SCATController *)v2 _autoScanningOptionsSpecifiers];
LABEL_23:
    v50 = (void *)v49;
    [v4 addObjectsFromArray:v49];
  }
  v51 = AXParameterizedLocalizedString();
  v52 = +[PSSpecifier preferenceSpecifierNamed:v51 target:v2 set:0 get:"actionRepeatSummary:" detail:objc_opt_class() cell:2 edit:0];

  [v52 setIdentifier:@"ActionRepeatIdentifier"];
  v142 = v52;
  [v4 addObject:v52];
  v53 = AXParameterizedLocalizedString();
  v54 = +[PSSpecifier preferenceSpecifierNamed:v53 target:v2 set:0 get:"longPressSummary:" detail:objc_opt_class() cell:2 edit:0];

  [v54 setIdentifier:@"LongPressIdentifier"];
  v141 = v54;
  [v4 addObject:v54];
  v140 = +[PSSpecifier emptyGroupSpecifier];
  objc_msgSend(v4, "addObject:");
  v55 = AXParameterizedLocalizedString();
  v56 = +[PSSpecifier preferenceSpecifierNamed:v55 target:v2 set:0 get:"tapBehaviorSummary:" detail:objc_opt_class() cell:2 edit:0];

  [v56 setObject:&__kCFBooleanTrue forKeyedSubscript:PSEnabledKey];
  [v56 setIdentifier:@"TapBehaviorIdentifier"];
  v139 = v56;
  [v4 addObject:v56];
  v57 = AXParameterizedLocalizedString();
  v58 = +[PSSpecifier preferenceSpecifierNamed:v57 target:v2 set:0 get:"scanLocationAfterTapSummary:" detail:objc_opt_class() cell:2 edit:0];

  [v58 setIdentifier:@"ScanLocationIdentifier"];
  v138 = v58;
  [v4 addObject:v58];
  v59 = AXParameterizedLocalizedString();
  v60 = +[PSSpecifier groupSpecifierWithName:v59];

  [v60 setIdentifier:@"SwitchKeyboardIdentifier"];
  v137 = v60;
  [v4 addObject:v60];
  v61 = AXParameterizedLocalizedString();
  v62 = +[PSSpecifier preferenceSpecifierNamed:v61 target:v2 set:"setRestartScanningAtCurrentKey:specifier:" get:"restartScanningAtCurrentKey:" detail:0 cell:6 edit:0];

  [v62 setIdentifier:@"RestartScanAtCurrentIdentifier"];
  uint64_t v63 = objc_opt_class();
  uint64_t v64 = PSCellClassKey;
  [v62 setProperty:v63 forKey:PSCellClassKey];
  v136 = v62;
  [v4 addObject:v62];
  v65 = +[AXSettings sharedInstance];
  v66 = (char *)[v65 switchControlTapBehavior];

  if (v66 != (unsigned char *)&dword_0 + 2)
  {
    v67 = AXParameterizedLocalizedString();
    v68 = +[PSSpecifier preferenceSpecifierNamed:v67 target:v2 set:"setAlwaysTapKeyboardKeysEnabled:specifier:" get:"alwaysTapKeyboardKeysEnabled:" detail:0 cell:6 edit:0];

    [v68 setIdentifier:@"AlwaysTapKeyboardIdentifier"];
    [v68 setProperty:objc_opt_class() forKey:v64];
    [v4 addObject:v68];
  }
  v69 = AXParameterizedLocalizedString();
  v70 = +[PSSpecifier preferenceSpecifierNamed:v69 target:v2 set:"setUseExtendedKeyboardPredictions:specifier:" get:"useExtendedKeyboardPredictions:" detail:0 cell:6 edit:0];

  [v70 setIdentifier:@"UseExtendedKeyboardPredictionsIdentifier"];
  [v70 setProperty:objc_opt_class() forKey:v64];
  v135 = v70;
  [v4 addObject:v70];
  v71 = AXParameterizedLocalizedString();
  v72 = +[PSSpecifier groupSpecifierWithName:v71];

  [v72 setIdentifier:@"SwitchStabilityIdentifier"];
  v134 = v72;
  [v4 addObject:v72];
  v73 = AXParameterizedLocalizedString();
  v74 = +[PSSpecifier preferenceSpecifierNamed:v73 target:v2 set:0 get:"holdDurationSummary:" detail:objc_opt_class() cell:2 edit:0];

  [v74 setIdentifier:@"HoldDurationIdentifier"];
  v133 = v74;
  [v4 addObject:v74];
  v75 = AXParameterizedLocalizedString();
  v76 = +[PSSpecifier preferenceSpecifierNamed:v75 target:v2 set:0 get:"inputCoalescingSummary:" detail:objc_opt_class() cell:2 edit:0];

  [v76 setIdentifier:@"IgnoreRepeatIdentifier"];
  v132 = v76;
  [v4 addObject:v76];
  if ([(SCATController *)v2 _isUsingHeadSwitch])
  {
    v77 = AXParameterizedLocalizedString();
    v78 = +[PSSpecifier preferenceSpecifierNamed:v77 target:v2 set:0 get:"headMovementSummary:" detail:objc_opt_class() cell:2 edit:0];

    [v4 addObject:v78];
  }
  v79 = AXParameterizedLocalizedString();
  v80 = +[PSSpecifier groupSpecifierWithName:v79];

  [v80 setIdentifier:@"AxisSelectionGroupIdentifier"];
  v131 = v80;
  [v4 addObject:v80];
  v81 = [(SCATController *)v2 _pointPickerSpecifiers];
  [v4 addObjectsFromArray:v81];

  v82 = AXParameterizedLocalizedString();
  v83 = +[PSSpecifier groupSpecifierWithName:v82];

  [v83 setIdentifier:@"AudioGroupIdentifier"];
  v130 = v83;
  [v4 addObject:v83];
  v84 = AXParameterizedLocalizedString();
  v85 = +[PSSpecifier preferenceSpecifierNamed:v84 target:v2 set:"setSoundEnabled:specifier:" get:"soundEnabled:" detail:0 cell:6 edit:0];

  [v85 setIdentifier:@"SoundIdentifier"];
  v129 = v85;
  [v4 addObject:v85];
  v86 = AXParameterizedLocalizedString();
  v87 = +[PSSpecifier preferenceSpecifierNamed:v86 target:v2 set:0 get:"speechEnabled:" detail:objc_opt_class() cell:2 edit:0];

  [v87 setIdentifier:@"SpeechIdentifier"];
  v128 = v87;
  [v4 addObject:v87];
  v127 = +[PSSpecifier emptyGroupSpecifier];
  objc_msgSend(v4, "addObject:");
  v88 = AXParameterizedLocalizedString();
  v89 = +[PSSpecifier preferenceSpecifierNamed:v88 target:v2 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  [v89 setIdentifier:@"CustomizeMenuIdentifier"];
  v126 = v89;
  [v4 addObject:v89];
  v90 = +[PSSpecifier emptyGroupSpecifier];
  v91 = AXParameterizedLocalizedString();
  uint64_t v122 = PSFooterTextGroupKey;
  objc_msgSend(v90, "setProperty:forKey:", v91);

  v125 = v90;
  [v4 addObject:v90];
  v92 = AXParameterizedLocalizedString();
  v93 = +[PSSpecifier preferenceSpecifierNamed:v92 target:v2 set:"setItemGroupingEnabled:specifier:" get:"itemGroupingEnabled:" detail:0 cell:6 edit:0];

  [v93 setIdentifier:@"ItemGroupingIdentifier"];
  v124 = v93;
  [v4 addObject:v93];
  v94 = AXParameterizedLocalizedString();
  v95 = +[PSSpecifier groupSpecifierWithName:v94];

  [v95 setIdentifier:@"VisualGroupIdentifier"];
  [v4 addObject:v95];
  v96 = AXParameterizedLocalizedString();
  v97 = +[PSSpecifier preferenceSpecifierNamed:v96 target:v2 set:"setCursorHighVisibility:specifier:" get:"cursorHighVisibility:" detail:0 cell:6 edit:0];

  [v97 setIdentifier:@"CursorVisibilityIdentifier"];
  [v4 addObject:v97];
  v98 = AXParameterizedLocalizedString();
  +[PSSpecifier preferenceSpecifierNamed:v98 target:v2 set:0 get:"cursorColorDescription:" detail:objc_opt_class() cell:2 edit:0];
  v100 = v99 = v4;

  [v100 setProperty:&stru_20F6B8 forKey:PSSpecifierSearchPlistKey];
  [v100 setProperty:&__kCFBooleanFalse forKey:PSSpecifierIsSearchableKey];
  [v100 setIdentifier:@"CursorColorIdentifier"];
  [v99 addObject:v100];
  v123 = +[PSSpecifier emptyGroupSpecifier];
  objc_msgSend(v99, "addObject:");
  v101 = AXParameterizedLocalizedString();
  v102 = +[PSSpecifier preferenceSpecifierNamed:v101 target:v2 set:0 get:"customGesturesSummary:" detail:objc_opt_class() cell:2 edit:0];

  [v102 setIdentifier:@"CustomGesturesIdentifier"];
  [v99 addObject:v102];
  if (AXHasCapability())
  {
    AXDeviceIsPad();
    v103 = AXParameterizedLocalizedString();
    v104 = +[PSSpecifier groupSpecifierWithName:v103];

    if (AXDeviceHasTopTouchIDButton())
    {
      v105 = settingsLocStringTopTouchIDButton(@"APPLE_PAY_IPAD_TOUCHID");
      [v104 setName:v105];
    }
    [v104 setIdentifier:@"APPLE_PAY"];
    v106 = +[BiometricKit manager];
    v107 = [v106 identities:0];
    id v108 = [v107 count];

    int IsPad = AXDeviceIsPad();
    v110 = @"APPLE_PAY_FOOTER";
    if (IsPad) {
      v110 = @"APPLE_PAY_FOOTER_IPAD";
    }
    CFStringRef v111 = @"APPLE_PAY_FOOTER_PASSCODE_IPAD";
    if (!IsPad) {
      CFStringRef v111 = @"APPLE_PAY_FOOTER_PASSCODE";
    }
    if (!v108) {
      v110 = (__CFString *)v111;
    }
    v121 = v110;
    v112 = AXParameterizedLocalizedString();
    if (AXDeviceHasTopTouchIDButton())
    {
      uint64_t v113 = settingsLocStringTopTouchIDButton(@"APPLE_PAY_FOOTER_PASSCODE_IPAD_TOUCHID");

      v112 = (void *)v113;
    }
    if (_AXSAssistiveTouchEnabled())
    {
      v114 = AXParameterizedLocalizedString();
      v164[0] = v112;
      v164[1] = v114;
      v115 = +[NSArray arrayWithObjects:v164 count:2];
      uint64_t v116 = [v115 componentsJoinedByString:@"\n\n"];

      v112 = (void *)v116;
    }
    id v5 = v156;
    [v104 setProperty:v112 forKey:v122];

    v99 = v155;
    [v155 addObject:v104];
    v117 = AXParameterizedLocalizedString();
    v118 = +[PSSpecifier preferenceSpecifierNamed:v117 target:v2 set:"setPayWithSwitchControl:specifier:" get:"payWithSwitchControl:" detail:0 cell:6 edit:0];

    [v118 setIdentifier:@"APPLE_PAY_SWITCH"];
    [v155 addObject:v118];
  }
  v119 = *(void **)&v2->AXUISettingsBaseListController_opaque[v154];
  *(void *)&v2->AXUISettingsBaseListController_opaque[v154] = v99;

  v3 = *(void **)&v2->AXUISettingsBaseListController_opaque[v154];
LABEL_43:

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCATController;
  [(SCATController *)&v4 viewWillAppear:a3];
  [(SCATController *)self reloadSpecifiers];
}

- (id)_scanTimeoutSpecifier
{
  v3 = AXParameterizedLocalizedString();
  objc_super v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:0 get:"scanTimeoutSummary:" detail:objc_opt_class() cell:2 edit:0];

  return v4;
}

- (id)_autoScanningOptionsSpecifiers
{
  cachedAutoScanningOptionsSpecifiers = self->_cachedAutoScanningOptionsSpecifiers;
  if (!cachedAutoScanningOptionsSpecifiers)
  {
    objc_super v4 = (NSArray *)objc_opt_new();
    id v5 = AXParameterizedLocalizedString();
    objc_super v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:"autoscanDelaySummary:" detail:objc_opt_class() cell:2 edit:0];

    [v6 setIdentifier:@"ScanningSpeedIdentifier"];
    uint64_t v7 = AXParameterizedLocalizedString();
    [v6 setAccessibilityLabel:v7];

    [(NSArray *)v4 addObject:v6];
    v8 = AXParameterizedLocalizedString();
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:"delayAfterInputSummary:" detail:objc_opt_class() cell:2 edit:0];

    [v9 setIdentifier:@"DelayAfterInputIdentifier"];
    [(NSArray *)v4 addObject:v9];
    v10 = AXParameterizedLocalizedString();
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:"scanCyclesSummary:" detail:objc_opt_class() cell:2 edit:0];

    [v11 setIdentifier:@"ScanCyclesIdentifier"];
    [v11 setProperty:&__kCFBooleanFalse forKey:PSSpecifierIsSearchableKey];
    [(NSArray *)v4 addObject:v11];
    v12 = self->_cachedAutoScanningOptionsSpecifiers;
    self->_cachedAutoScanningOptionsSpecifiers = v4;

    cachedAutoScanningOptionsSpecifiers = self->_cachedAutoScanningOptionsSpecifiers;
  }

  return cachedAutoScanningOptionsSpecifiers;
}

- (id)_manualScanningOptionsSpecifiers
{
  cachedManualScanningOptionsSpecifiers = self->_cachedManualScanningOptionsSpecifiers;
  if (!cachedManualScanningOptionsSpecifiers)
  {
    objc_super v4 = (NSArray *)objc_opt_new();
    id v5 = [(SCATController *)self _scanTimeoutSpecifier];
    [(NSArray *)v4 addObject:v5];
    objc_super v6 = self->_cachedManualScanningOptionsSpecifiers;
    self->_cachedManualScanningOptionsSpecifiers = v4;

    cachedManualScanningOptionsSpecifiers = self->_cachedManualScanningOptionsSpecifiers;
  }

  return cachedManualScanningOptionsSpecifiers;
}

- (id)_dwellScanningOptionsSpecifiers
{
  v3 = [(SCATController *)self cachedDwellScanningOptionsSpecifiers];

  if (!v3)
  {
    objc_super v4 = +[NSMutableArray array];
    id v5 = AXParameterizedLocalizedString();
    objc_super v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:"dwellTimeSummary:" detail:objc_opt_class() cell:2 edit:0];

    [v4 addObject:v6];
    uint64_t v7 = [(SCATController *)self _scanTimeoutSpecifier];
    [v4 addObject:v7];
    [(SCATController *)self setCachedDwellScanningOptionsSpecifiers:v4];
  }

  return [(SCATController *)self cachedDwellScanningOptionsSpecifiers];
}

- (BOOL)_isUsingHeadSwitch
{
  v2 = SCATSwitchesWithSource();
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)_pointPickerSpecifiers
{
  cachedPointPickerOptionsSpecifiers = self->_cachedPointPickerOptionsSpecifiers;
  if (!cachedPointPickerOptionsSpecifiers)
  {
    objc_super v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v5 = self->_cachedPointPickerOptionsSpecifiers;
    self->_cachedPointPickerOptionsSpecifiers = v4;

    objc_super v6 = AXParameterizedLocalizedString();
    uint64_t v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:"pointPickerSelectionStyleSummary:" detail:objc_opt_class() cell:2 edit:0];

    [v7 setIdentifier:@"AxisSweepIdentifier"];
    [(NSMutableArray *)self->_cachedPointPickerOptionsSpecifiers addObject:v7];
    if (AXShouldShowSwitchControlHeadTrackingModeFromSettings())
    {
      v8 = AXParameterizedLocalizedString();
      v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:"headScanningSummary:" detail:objc_opt_class() cell:2 edit:0];

      [v9 setProperty:@"CameraPointPickerSwitch" forKey:PSIDKey];
      [(NSMutableArray *)self->_cachedPointPickerOptionsSpecifiers addObject:v9];
    }
    cachedPointPickerOptionsSpecifiers = self->_cachedPointPickerOptionsSpecifiers;
  }

  return cachedPointPickerOptionsSpecifiers;
}

- (id)cursorHighVisibility:(id)a3
{
  BOOL v3 = +[AXSettings sharedInstance];
  objc_super v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchScannerCursorHighVisibilityEnabled]);

  return v4;
}

- (void)setCursorHighVisibility:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchScannerCursorHighVisibilityEnabled:v4];
}

- (id)cursorColorDescription:(id)a3
{
  BOOL v3 = +[AXSettings sharedInstance];
  [v3 assistiveTouchCursorColor];
  id v4 = AXAssistiveTouchScannerColorDescription();

  return v4;
}

- (id)switchScanningEnabled:(id)a3
{
  BOOL v3 = _AXSAssistiveTouchScannerEnabled() != 0;

  return +[NSNumber numberWithBool:v3];
}

- (void)setSwitchScanningEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [v6 BOOLValue];
  v9 = (void *)_AXSTripleClickCopyOptions();
  if (v8)
  {
    _AXSAssistiveTouchScannerSetEnabled();
    v10 = AXAssetAndDataClient();
    v11 = +[AXAccessQueue mainAccessQueue];
    [v10 sendAsynchronousMessage:&__NSDictionary0__struct withIdentifier:12 targetAccessQueue:v11 completion:0];

    if (([v9 containsObject:&off_22A830] & 1) == 0)
    {
      _AXSTripleClickAddOption();
      v12 = +[AXSettings sharedInstance];
      [v12 setAssistiveTouchScannerAddedTripleClickAutomatically:1];
    }
  }
  else
  {
    v13 = AXUILocalizedStringForKey();
    id v14 = AXUILocalizedStringForKey();
    uint64_t v15 = +[UIAlertController alertControllerWithTitle:v13 message:v14 preferredStyle:1];

    v16 = AXUILocalizedStringForKey();
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = __53__SCATController_setSwitchScanningEnabled_specifier___block_invoke;
    v26[3] = &unk_20A790;
    unsigned __int8 v28 = v8;
    id v27 = v9;
    v17 = +[UIAlertAction actionWithTitle:v16 style:0 handler:v26];

    objc_initWeak(&location, self);
    v18 = AXUILocalizedStringForKey();
    uint64_t v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    id v22 = __53__SCATController_setSwitchScanningEnabled_specifier___block_invoke_733;
    id v23 = &unk_208F50;
    objc_copyWeak(&v24, &location);
    v19 = +[UIAlertAction actionWithTitle:v18 style:1 handler:&v20];

    objc_msgSend(v15, "addAction:", v17, v20, v21, v22, v23);
    [v15 addAction:v19];
    [(SCATController *)self presentViewController:v15 animated:1 completion:0];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

void __53__SCATController_setSwitchScanningEnabled_specifier___block_invoke(uint64_t a1)
{
  _AXSAssistiveTouchScannerSetEnabled();
  v2 = +[AXSettings sharedInstance];
  unsigned int v3 = [v2 assistiveTouchScannerAddedTripleClickAutomatically];

  if (v3)
  {
    if ([*(id *)(a1 + 32) containsObject:&off_22A830])
    {
      id v4 = [*(id *)(a1 + 32) mutableCopy];
      [v4 removeObject:&off_22A830];
      _AXSSetTripleClickOptions();
    }
    id v5 = +[AXSettings sharedInstance];
    [v5 setAssistiveTouchScannerAddedTripleClickAutomatically:0];
  }
}

void __53__SCATController_setSwitchScanningEnabled_specifier___block_invoke_733(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (id)switchesSummary:(id)a3
{
  id v3 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  id v4 = +[AXSettings sharedInstance];
  id v5 = [v4 assistiveTouchSwitches];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __34__SCATController_switchesSummary___block_invoke;
  v8[3] = &unk_20BDE0;
  v8[4] = v9;
  [v5 enumerateObjectsUsingBlock:v8];

  id v6 = AXFormatInteger();

  _Block_object_dispose(v9, 8);

  return v6;
}

id __34__SCATController_switchesSummary___block_invoke(uint64_t a1, void *a2)
{
  id result = [a2 isEnabled];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

- (id)_localizedSummaryForDelay:(double)a3
{
  return (id)AXLocalizedTimeSummary();
}

- (id)selectActionDelaySummary:(id)a3
{
  id v4 = +[AXSettings sharedInstance];
  if ([v4 switchControlTapBehavior] == (char *)&dword_0 + 1)
  {
    id v5 = +[AXSettings sharedInstance];
    [v5 switchControlAutoTapTimeout];
    id v6 = -[SCATController _localizedSummaryForDelay:](self, "_localizedSummaryForDelay:");
  }
  else
  {
    id v6 = AXParameterizedLocalizedString();
  }

  return v6;
}

- (id)holdDurationSummary:(id)a3
{
  id v4 = +[AXSettings sharedInstance];
  if ([v4 assistiveTouchInputHoldEnabled])
  {
    [v4 assistiveTouchInputHoldDuration];
    -[SCATController _localizedSummaryForDelay:](self, "_localizedSummaryForDelay:");
  }
  else
  {
    AXParameterizedLocalizedString();
  id v5 = };

  return v5;
}

- (id)autoscanDelaySummary:(id)a3
{
  id v4 = +[AXSettings sharedInstance];
  [v4 assistiveTouchStepInterval];
  id v5 = -[SCATController _localizedSummaryForDelay:](self, "_localizedSummaryForDelay:");

  return v5;
}

- (id)inputCoalescingSummary:(id)a3
{
  id v4 = +[AXSettings sharedInstance];
  if ([v4 assistiveTouchInputCoalescingEnabled])
  {
    [v4 assistiveTouchInputCoalescingDuration];
    -[SCATController _localizedSummaryForDelay:](self, "_localizedSummaryForDelay:");
  }
  else
  {
    AXParameterizedLocalizedString();
  id v5 = };

  return v5;
}

- (id)headMovementSummary:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  [v3 assistiveTouchHeadMovementSensitivity];
  id v4 = SCATLocalizedHeadMovementSummary();

  return v4;
}

- (id)actionRepeatSummary:(id)a3
{
  id v4 = +[AXSettings sharedInstance];
  if ([v4 assistiveTouchActionRepeatEnabled])
  {
    [v4 assistiveTouchActionRepeatInterval];
    -[SCATController _localizedSummaryForDelay:](self, "_localizedSummaryForDelay:");
  }
  else
  {
    AXParameterizedLocalizedString();
  id v5 = };

  return v5;
}

- (id)longPressSummary:(id)a3
{
  id v4 = +[AXSettings sharedInstance];
  if ([v4 assistiveTouchLongPressEnabled])
  {
    [v4 assistiveTouchLongPressDuration];
    -[SCATController _localizedSummaryForDelay:](self, "_localizedSummaryForDelay:");
  }
  else
  {
    AXParameterizedLocalizedString();
  id v5 = };

  return v5;
}

- (id)tapBehaviorSummary:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = [v3 switchControlTapBehavior];

  if ((unint64_t)v4 <= 2)
  {
    id v5 = AXParameterizedLocalizedString();
  }

  return v5;
}

- (id)scanLocationAfterTapSummary:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = [v3 switchControlScanAfterTapLocation];

  if ((unint64_t)v4 <= 1)
  {
    id v5 = AXParameterizedLocalizedString();
  }

  return v5;
}

- (id)delayAfterInputSummary:(id)a3
{
  id v4 = +[AXSettings sharedInstance];
  if ([v4 assistiveTouchDelayAfterInputEnabled])
  {
    [v4 assistiveTouchDelayAfterInput];
    -[SCATController _localizedSummaryForDelay:](self, "_localizedSummaryForDelay:");
  }
  else
  {
    AXParameterizedLocalizedString();
  id v5 = };

  return v5;
}

- (id)headScanningSummary:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  [v3 switchControlUseCameraForPointMode];
  id v4 = AXParameterizedLocalizedString();

  return v4;
}

- (id)scanTimeoutSummary:(id)a3
{
  id v4 = +[AXSettings sharedInstance];
  if ([v4 assistiveTouchScanTimeoutEnabled])
  {
    [v4 assistiveTouchScanTimeout];
    -[SCATController _localizedSummaryForDelay:](self, "_localizedSummaryForDelay:");
  }
  else
  {
    AXParameterizedLocalizedString();
  id v5 = };

  return v5;
}

- (id)dwellTimeSummary:(id)a3
{
  id v4 = +[AXSettings sharedInstance];
  [v4 switchControlDwellTime];
  id v5 = -[SCATController _localizedSummaryForDelay:](self, "_localizedSummaryForDelay:");

  return v5;
}

- (id)_summaryForListOfItems:(id)a3
{
  if ([a3 count]) {
    AXFormatInteger();
  }
  else {
  id v3 = AXParameterizedLocalizedString();
  }

  return v3;
}

- (id)customGesturesSummary:(id)a3
{
  id v4 = +[AXSettings sharedInstance];
  id v5 = [v4 assistiveTouchSavedGestures];
  id v6 = [(SCATController *)self _summaryForListOfItems:v5];

  return v6;
}

- (id)scanningStyle:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  if ((unint64_t)[v3 switchControlScanningStyle] > 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = AXParameterizedLocalizedString();
  }

  return v4;
}

- (id)firstLaunchScanningMode:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[AXSettings sharedInstance];
  id v5 = objc_msgSend(v3, "switchControlLocStringForFirstLaunchScanningMode:", objc_msgSend(v4, "switchControlFirstLaunchScanningMode"));

  return v5;
}

- (id)scanByElements:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 assistiveTouchScanningMode] == 0);

  return v4;
}

- (void)setScanByElements:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = +[AXSettings sharedInstance];
  unsigned int v5 = [v4 BOOLValue];

  [v6 setAssistiveTouchScanningMode:v5 ^ 1];
}

- (id)itemGroupingEnabled:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchGroupElementsEnabled]);

  return v4;
}

- (void)setItemGroupingEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchGroupElementsEnabled:v4];
}

- (id)compactMenuEnabled:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchScannerCompactMenuEnabled]);

  return v4;
}

- (void)setCompactMenuEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchScannerCompactMenuEnabled:v4];
}

- (id)scanCyclesSummary:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  [v3 assistiveTouchScanCycles];
  id v4 = AXFormatInteger();

  return v4;
}

- (id)soundEnabled:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchScannerSoundEnabled]);

  return v4;
}

- (void)setSoundEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchScannerSoundEnabled:v4];
}

- (id)speechEnabled:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  [v3 assistiveTouchScannerSpeechEnabled];
  id v4 = AXParameterizedLocalizedString();

  return v4;
}

- (id)recipesSummary:(id)a3
{
  id v4 = +[AXSettings sharedInstance];
  id v5 = [v4 switchControlRecipes];
  id v6 = [(SCATController *)self _summaryForListOfItems:v5];

  return v6;
}

- (void)setAlwaysTapKeyboardKeysEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setSwitchControlShouldAlwaysActivateKeyboardKeys:v4];
}

- (id)alwaysTapKeyboardKeysEnabled:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 switchControlShouldAlwaysActivateKeyboardKeys]);

  return v4;
}

- (void)setRestartScanningAtCurrentKey:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setSwitchControlRestartScanningAtCurrentKey:v4];
}

- (id)restartScanningAtCurrentKey:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 switchControlRestartScanningAtCurrentKey]);

  return v4;
}

- (void)setUseExtendedKeyboardPredictions:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setSwitchControlShouldUseExtendedKeyboardPredictions:v4];
}

- (id)useExtendedKeyboardPredictions:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 switchControlShouldUseExtendedKeyboardPredictions]);

  return v4;
}

- (id)pointPickerSelectionStyleSummary:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  unsigned int v4 = [v3 assistiveTouchScannerPointPickerModeEnabled];

  if (v4
    && (+[AXSettings sharedInstance],
        id v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 switchControlPointPickerSelectionStyle],
        v5,
        (unint64_t)v6 > 2))
  {
    id v7 = 0;
  }
  else
  {
    id v7 = AXParameterizedLocalizedString();
  }

  return v7;
}

- (void)setPayWithSwitchControl:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue])
  {
    if (!self->_localAuthContext)
    {
      id v5 = (LAContext *)objc_alloc_init((Class)LAContext);
      localAuthContext = self->_localAuthContext;
      self->_localAuthContext = v5;
    }
    v16 = [[SecureIntentViewController alloc] initWithSource:0 context:self->_localAuthContext delegate:self];
    if ((AXDeviceIsPad() & 1) == 0)
    {
      id v7 = [(SCATController *)self view];
      unsigned __int8 v8 = [v7 window];
      [v8 setAutorotates:0 forceUpdateInterfaceOrientation:1];
    }
    -[SCATController presentModalViewController:withTransition:](self, "presentModalViewController:withTransition:", v16, 3, v16);
  }
  else
  {
    v9 = AXParameterizedLocalizedString();
    v10 = AXParameterizedLocalizedString();
    v11 = +[UIAlertController alertControllerWithTitle:v9 message:v10 preferredStyle:1];

    v12 = AXParameterizedLocalizedString();
    v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:&__block_literal_global_64];

    id v14 = AXParameterizedLocalizedString();
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __52__SCATController_setPayWithSwitchControl_specifier___block_invoke_797;
    v18[3] = &unk_208B68;
    v18[4] = self;
    uint64_t v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:v18];

    [v11 addAction:v13];
    [v11 addAction:v15];
    [v11 setPreferredAction:v13];
    [(SCATController *)self presentViewController:v11 animated:1 completion:0];
  }
}

void __52__SCATController_setPayWithSwitchControl_specifier___block_invoke(id a1, UIAlertAction *a2)
{
  v2 = AXLogSettings();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __42__HandController_setPayWithAST_specifier___block_invoke_cold_1(v2);
  }

  id v3 = [objc_alloc((Class)LAStorage) initWithDomain:0 authenticationContext:0];
  [v3 removeObjectForKey:1 completionHandler:&__block_literal_global_793];
}

void __52__SCATController_setPayWithSwitchControl_specifier___block_invoke_790(id a1, NSError *a2)
{
  v2 = a2;
  if (v2)
  {
    id v3 = AXLogSettings();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __42__HandController_setPayWithAST_specifier___block_invoke_622_cold_1((uint64_t)v2, v3);
    }
  }
  else
  {
    _AXSAccessibilitySetSecureIntentProvider();
  }
}

id __52__SCATController_setPayWithSwitchControl_specifier___block_invoke_797(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifierID:@"APPLE_PAY_SWITCH"];
}

- (id)payWithSwitchControl:(id)a3
{
  id v3 = [objc_alloc((Class)LAStorage) initWithDomain:0 authenticationContext:0];
  id v10 = 0;
  id v4 = [v3 BOOLForKey:1 error:&v10];
  id v5 = v10;
  if (v5)
  {
    id v6 = AXLogSettings();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[HandController payWithAST:]((uint64_t)v5, v6);
    }
  }
  id v7 = AXLogSettings();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[HandController payWithAST:]((char)v4, v7);
  }

  unsigned __int8 v8 = +[NSNumber numberWithBool:v4];

  return v8;
}

- (void)secureIntentViewControllerDidFinish:(id)a3
{
}

id __54__SCATController_secureIntentViewControllerDidFinish___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadAfterSecureIntentDismissal];
}

- (void)secureIntentViewControllerDidCancel:(id)a3
{
}

id __54__SCATController_secureIntentViewControllerDidCancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadAfterSecureIntentDismissal];
}

- (void)presentationControllerWillDismiss:(id)a3
{
}

id __52__SCATController_presentationControllerWillDismiss___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadAfterSecureIntentDismissal];
}

- (void)_reloadAfterSecureIntentDismissal
{
  [(SCATController *)self reloadSpecifierID:@"APPLE_PAY_SWITCH" animated:1];
  if ((AXDeviceIsPad() & 1) == 0)
  {
    id v4 = [(SCATController *)self view];
    id v3 = [v4 window];
    [v3 setAutorotates:1 forceUpdateInterfaceOrientation:0];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SCATController;
  id v4 = [(SCATController *)&v10 tableView:a3 cellForRowAtIndexPath:a4];
  id v5 = [v4 specifier];
  id v6 = [v5 identifier];
  unsigned int v7 = [v6 isEqualToString:@"APPLE_PAY_SWITCH"];

  if (v7)
  {
    unsigned __int8 v8 = [v4 titleLabel];
    [v8 setNumberOfLines:0];
  }

  return v4;
}

- (void)cursorColorSelectionController:(id)a3 selectedCursorColor:(int64_t)a4
{
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchCursorColor:a4];
}

- (int64_t)selectedColorForSelectionController:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = [v3 assistiveTouchCursorColor];

  return (int64_t)v4;
}

- (BOOL)cursorColorSelectionController:(id)a3 allowsCursorColor:(int64_t)a4
{
  return (unint64_t)a4 > 2;
}

- (NSArray)cachedAutoScanningOptionsSpecifiers
{
  return self->_cachedAutoScanningOptionsSpecifiers;
}

- (void)setCachedAutoScanningOptionsSpecifiers:(id)a3
{
}

- (NSArray)cachedManualScanningOptionsSpecifiers
{
  return self->_cachedManualScanningOptionsSpecifiers;
}

- (void)setCachedManualScanningOptionsSpecifiers:(id)a3
{
}

- (NSArray)cachedDwellScanningOptionsSpecifiers
{
  return self->_cachedDwellScanningOptionsSpecifiers;
}

- (void)setCachedDwellScanningOptionsSpecifiers:(id)a3
{
}

- (NSArray)cachedSpeechOptionsSpecifiers
{
  return self->_cachedSpeechOptionsSpecifiers;
}

- (void)setCachedSpeechOptionsSpecifiers:(id)a3
{
}

- (NSMutableArray)cachedPointPickerOptionsSpecifiers
{
  return self->_cachedPointPickerOptionsSpecifiers;
}

- (void)setCachedPointPickerOptionsSpecifiers:(id)a3
{
}

- (LAContext)localAuthContext
{
  return self->_localAuthContext;
}

- (void)setLocalAuthContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localAuthContext, 0);
  objc_storeStrong((id *)&self->_cachedPointPickerOptionsSpecifiers, 0);
  objc_storeStrong((id *)&self->_cachedSpeechOptionsSpecifiers, 0);
  objc_storeStrong((id *)&self->_cachedDwellScanningOptionsSpecifiers, 0);
  objc_storeStrong((id *)&self->_cachedManualScanningOptionsSpecifiers, 0);

  objc_storeStrong((id *)&self->_cachedAutoScanningOptionsSpecifiers, 0);
}

@end