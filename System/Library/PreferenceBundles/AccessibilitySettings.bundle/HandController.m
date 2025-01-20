@interface HandController
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (HandController)init;
- (LAContext)localAuthContext;
- (SEL)settingsGetter;
- (SEL)settingsSetter;
- (double)maximumValueForSpecifier:(id)a3;
- (double)minimumValueForSpecifier:(id)a3;
- (double)stepValueForSpecifier:(id)a3;
- (double)valueForSpecifier:(id)a3;
- (id)_doubleTapAction:(id)a3;
- (id)_longPressAction:(id)a3;
- (id)_orbAction:(id)a3;
- (id)_singleTapAction:(id)a3;
- (id)alwaysShowMenuEnabled:(id)a3;
- (id)alwaysShowSoftwareKeyboard:(id)a3;
- (id)customGesturesExplanatoryText;
- (id)customGesturesTitle;
- (id)dwellControlAutorevertAction:(id)a3;
- (id)dwellControlEnabled:(id)a3;
- (id)gameControllerEnabled:(id)a3;
- (id)getCurrentActionForHomeActionListController:(id)a3;
- (id)handEnabled:(id)a3;
- (id)idleOpacitySummary:(id)a3;
- (id)mouseBehavesLikeFinger:(id)a3;
- (id)mouseClickSoundsEnabled:(id)a3;
- (id)payWithAST:(id)a3;
- (id)selectSpecifier:(id)a3;
- (id)specifiers;
- (id)stringValueForSpecifier:(id)a3;
- (id)swaggleOpensMenu;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)touchSpeed;
- (id)useExtendedKeyboardPredictions:(id)a3;
- (id)virtualTrackpadEnabled:(id)a3;
- (unint64_t)maximumNumberOfCustomGestures;
- (void)_handleAssistiveTouchHardwareToggled:(id)a3;
- (void)_handleAssistiveTouchToggled:(id)a3;
- (void)_handleSettingsChange;
- (void)_orientationChange:(id)a3;
- (void)_presentASTAlwaysShowMenuDisabledConfirmationAlert;
- (void)_reloadAfterSecureIntentDismissal;
- (void)_updateASTAlwaysShowMenuGroupSpecifier:(id)a3;
- (void)_updateASTAlwaysShowMenuSpecifiers;
- (void)_updateAssistiveTouchControlItems:(id)a3 reload:(BOOL)a4;
- (void)actualSetHandEnabled:(BOOL)a3;
- (void)dealloc;
- (void)homeActionListController:(id)a3 selectedAction:(id)a4;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)secureIntentViewControllerDidCancel:(id)a3;
- (void)secureIntentViewControllerDidFinish:(id)a3;
- (void)setAlwaysShowMenuEnabled:(id)a3 specifier:(id)a4;
- (void)setAlwaysShowSoftwareKeyboard:(id)a3 specifier:(id)a4;
- (void)setDwellControlEnabled:(id)a3 specifier:(id)a4;
- (void)setGameControllerEnabled:(id)a3 specifier:(id)a4;
- (void)setHandEnabled:(id)a3 specifier:(id)a4;
- (void)setLocalAuthContext:(id)a3;
- (void)setMouseBehavesLikeFinger:(id)a3 specifier:(id)a4;
- (void)setMouseClickSoundsEnabled:(id)a3 specifier:(id)a4;
- (void)setPayWithAST:(id)a3 specifier:(id)a4;
- (void)setSwaggleOpensMenu:(id)a3 specifier:(id)a4;
- (void)setTouchSpeed:(id)a3;
- (void)setUseExtendedKeyboardPredictions:(id)a3 specifier:(id)a4;
- (void)specifier:(id)a3 setValue:(double)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HandController

- (HandController)init
{
  v50.receiver = self;
  v50.super_class = (Class)HandController;
  v2 = [(AXNamedItemsListController *)&v50 init];
  v3 = v2;
  if (v2)
  {
    [(HandController *)v2 _handleSettingsChange];
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"_handleAssistiveTouchToggled:" name:kAXSAssistiveTouchEnabledNotification object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_handleAssistiveTouchHardwareToggled, kAXSAssistiveTouchHardwareChangedNotification, 0, (CFNotificationSuspensionBehavior)1028);
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v3 selector:"_handleAssistiveTouchToggled:" name:kAXSAssistiveTouchScannerEnabledNotification object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v3 selector:"_handleSettingsChange" name:kAXSAssistiveTouchSettingsChangedNotification object:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v3 selector:"_orientationChange:" name:UIDeviceOrientationDidChangeNotification object:0];

    objc_initWeak(&location, v3);
    v9 = +[AXSettings sharedInstance];
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = __22__HandController_init__block_invoke;
    v47[3] = &unk_208798;
    objc_copyWeak(&v48, &location);
    [v9 registerUpdateBlock:v47 forRetrieveSelector:"assistiveTouchOpenMenuSwaggleEnabled" withListener:v3];

    objc_destroyWeak(&v48);
    v10 = +[AXSettings sharedInstance];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = __22__HandController_init__block_invoke_2;
    v45[3] = &unk_208798;
    objc_copyWeak(&v46, &location);
    [v10 registerUpdateBlock:v45 forRetrieveSelector:"assistiveTouchSpeed" withListener:v3];

    objc_destroyWeak(&v46);
    v11 = +[AXSettings sharedInstance];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = __22__HandController_init__block_invoke_3;
    v43[3] = &unk_208798;
    objc_copyWeak(&v44, &location);
    [v11 registerUpdateBlock:v43 forRetrieveSelector:"assistiveTouchIdleOpacity" withListener:v3];

    objc_destroyWeak(&v44);
    v12 = +[AXSettings sharedInstance];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = __22__HandController_init__block_invoke_4;
    v41[3] = &unk_208798;
    objc_copyWeak(&v42, &location);
    [v12 registerUpdateBlock:v41 forRetrieveSelector:"assistiveTouchSingleTapAction" withListener:v3];

    objc_destroyWeak(&v42);
    v13 = +[AXSettings sharedInstance];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = __22__HandController_init__block_invoke_5;
    v39[3] = &unk_208798;
    objc_copyWeak(&v40, &location);
    [v13 registerUpdateBlock:v39 forRetrieveSelector:"assistiveTouchDoubleTapAction" withListener:v3];

    objc_destroyWeak(&v40);
    v14 = +[AXSettings sharedInstance];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = __22__HandController_init__block_invoke_6;
    v37[3] = &unk_208798;
    objc_copyWeak(&v38, &location);
    [v14 registerUpdateBlock:v37 forRetrieveSelector:"assistiveTouchLongPressAction" withListener:v3];

    objc_destroyWeak(&v38);
    if (AXForceTouchAvailableAndEnabled())
    {
      v15 = +[AXSettings sharedInstance];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = __22__HandController_init__block_invoke_7;
      v35[3] = &unk_208798;
      objc_copyWeak(&v36, &location);
      [v15 registerUpdateBlock:v35 forRetrieveSelector:"assistiveTouchOrbAction" withListener:v3];

      objc_destroyWeak(&v36);
    }
    v16 = +[AXSettings sharedInstance];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = __22__HandController_init__block_invoke_8;
    v33[3] = &unk_208798;
    objc_copyWeak(&v34, &location);
    [v16 registerUpdateBlock:v33 forRetrieveSelector:"assistiveTouchMouseDwellControlEnabled" withListener:v3];

    objc_destroyWeak(&v34);
    v17 = +[AXSettings sharedInstance];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = __22__HandController_init__block_invoke_9;
    v31[3] = &unk_208798;
    objc_copyWeak(&v32, &location);
    [v17 registerUpdateBlock:v31 forRetrieveSelector:"assistiveTouchMouseDwellControlAutorevertAction" withListener:v3];

    objc_destroyWeak(&v32);
    v18 = +[AXSettings sharedInstance];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __22__HandController_init__block_invoke_10;
    v29[3] = &unk_208798;
    objc_copyWeak(&v30, &location);
    [v18 registerUpdateBlock:v29 forRetrieveSelector:"assistiveTouchMouseDwellControlAutorevertEnabled" withListener:v3];

    objc_destroyWeak(&v30);
    v19 = +[AXSettings sharedInstance];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __22__HandController_init__block_invoke_11;
    v27[3] = &unk_208798;
    objc_copyWeak(&v28, &location);
    [v19 registerUpdateBlock:v27 forRetrieveSelector:"assistiveTouchMouseDwellControlMovementToleranceRadius" withListener:v3];

    objc_destroyWeak(&v28);
    v20 = +[AXSettings sharedInstance];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __22__HandController_init__block_invoke_12;
    v25[3] = &unk_208798;
    objc_copyWeak(&v26, &location);
    [v20 registerUpdateBlock:v25 forRetrieveSelector:"assistiveTouchAlwaysShowMenuEnabled" withListener:v3];

    objc_destroyWeak(&v26);
    if (AXDeviceSupportsVirtualTrackpad())
    {
      v21 = +[AXSettings sharedInstance];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = __22__HandController_init__block_invoke_13;
      v23[3] = &unk_208798;
      objc_copyWeak(&v24, &location);
      [v21 registerUpdateBlock:v23 forRetrieveSelector:"assistiveTouchVirtualTrackpadEnabled" withListener:v3];

      objc_destroyWeak(&v24);
    }
    objc_destroyWeak(&location);
  }
  return v3;
}

void __22__HandController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleSettingsChange];
}

void __22__HandController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleSettingsChange];
}

void __22__HandController_init__block_invoke_3(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 specifierForKey:@"IdleOpacity"];
  [v2 reloadSpecifier:v1 animated:1];
}

void __22__HandController_init__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"TapSpecifier" animated:0];
}

void __22__HandController_init__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"DoubleTapSpecifier" animated:0];
}

void __22__HandController_init__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"LongPressSpecifier" animated:0];
}

void __22__HandController_init__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"ForceTouchSpecifier" animated:0];
}

void __22__HandController_init__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"DwellEnabledSpecifier" animated:0];
}

void __22__HandController_init__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"DwellAutorevertSpecifier" animated:0];
}

void __22__HandController_init__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"DwellAutorevertSpecifier" animated:0];
}

void __22__HandController_init__block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"DwellToleranceSpecifier" animated:0];
}

void __22__HandController_init__block_invoke_12(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateASTAlwaysShowMenuSpecifiers];
}

void __22__HandController_init__block_invoke_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"ASTVirtualTrackpadCellID" animated:0];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)HandController;
  [(HandController *)&v5 dealloc];
}

- (id)specifiers
{
  id v2 = self;
  v3 = *(void **)&self->super.super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v110 = OBJC_IVAR___PSListController__specifiers;
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    objc_super v5 = [(HandController *)v2 loadSpecifiersFromPlistName:@"HandSettings" target:v2 bundle:v4];

    v114 = objc_msgSend(v5, "ax_firstObjectUsingBlock:", &__block_literal_global_32);
    v6 = [v114 propertyForKey:@"content"];
    id v7 = [v6 mutableCopy];

    uint64_t v8 = AXTeachableFeatureAssistiveTouch;
    v111 = +[AXTeachableMomentsManager teachableItemsForFeature:AXTeachableFeatureAssistiveTouch];
    v112 = v7;
    v118 = v2;
    id obj = v5;
    if ([v111 count])
    {
      uint64_t v116 = v8;
      v9 = objc_opt_new();
      long long v125 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      long long v128 = 0u;
      id v10 = v111;
      id v11 = [v10 countByEnumeratingWithState:&v125 objects:v138 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v126;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v126 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v125 + 1) + 8 * i);
            v136[0] = @"headerLabel";
            v16 = [v15 itemTitle];
            v137[0] = v16;
            v136[1] = @"contentLabel";
            v17 = [v15 itemDescription];
            v136[2] = @"alreadyLocalized";
            v137[1] = v17;
            v137[2] = &__kCFBooleanTrue;
            v18 = +[NSDictionary dictionaryWithObjects:v137 forKeys:v136 count:3];
            [v9 addObject:v18];
          }
          id v12 = [v10 countByEnumeratingWithState:&v125 objects:v138 count:16];
        }
        while (v12);
      }

      v133[0] = @"sectionLabel";
      v19 = +[AXTeachableMomentsManager notificationTitleForFeature:v116];
      v133[1] = @"alreadyLocalized";
      v134[0] = v19;
      v134[1] = &__kCFBooleanTrue;
      v20 = +[NSDictionary dictionaryWithObjects:v134 forKeys:v133 count:2];
      v135 = v20;
      v21 = +[NSArray arrayWithObjects:&v135 count:1];

      v22 = [v21 arrayByAddingObjectsFromArray:v9];

      v131[0] = @"moreLabel";
      v131[1] = @"additionalTitleLabel";
      v132[0] = @"AssistiveTouchWhatsNewLabel";
      v132[1] = @"AIR_TOUCH_TITLE";
      v131[2] = @"additionalContent";
      v131[3] = @"symbolName";
      v132[2] = v22;
      v132[3] = @"hand.point.up.left.fill";
      v23 = +[NSDictionary dictionaryWithObjects:v132 forKeys:v131 count:4];
      [v7 setObject:v23 atIndexedSubscript:1];

      id v2 = v118;
      objc_super v5 = obj;
    }
    [v114 setProperty:v7 forKey:@"content"];
    v113 = +[NSMutableArray arrayWithArray:v5];
    id v24 = +[NSMutableArray array];
    v25 = settingsLocString(@"ACTIONS_TITLE", @"HandSettings");
    id v26 = +[PSSpecifier groupSpecifierWithName:v25];

    v27 = settingsLocString(@"ACTIONS_FOOTER", @"HandSettings");
    uint64_t v115 = PSFooterTextGroupKey;
    objc_msgSend(v26, "setProperty:forKey:", v27);

    [v26 setIdentifier:@"ActionsGroupSpecifier"];
    v108 = v26;
    [v24 addObject:v26];
    id v28 = settingsLocString(@"SINGLE_TAP_ACTION", @"HandSettings");
    v29 = +[PSSpecifier preferenceSpecifierNamed:v28 target:v2 set:0 get:"_singleTapAction:" detail:objc_opt_class() cell:2 edit:0];

    [v29 setProperty:&off_229870 forKey:@"HomeAction"];
    [v29 setIdentifier:@"TapSpecifier"];
    v107 = v29;
    [v24 addObject:v29];
    id v30 = settingsLocString(@"DOUBLE_TAP_ACTION", @"HandSettings");
    v31 = +[PSSpecifier preferenceSpecifierNamed:v30 target:v2 set:0 get:"_doubleTapAction:" detail:objc_opt_class() cell:2 edit:0];

    uint64_t v32 = PSSpecifierIsSearchableKey;
    [v31 setProperty:&__kCFBooleanFalse forKey:PSSpecifierIsSearchableKey];
    [v31 setProperty:&off_229888 forKey:@"HomeAction"];
    [v31 setIdentifier:@"DoubleTapSpecifier"];
    v106 = v31;
    [v24 addObject:v31];
    v33 = settingsLocString(@"LONG_PRESS_ACTION", @"HandSettings");
    id v34 = +[PSSpecifier preferenceSpecifierNamed:v33 target:v2 set:0 get:"_longPressAction:" detail:objc_opt_class() cell:2 edit:0];

    [v34 setProperty:&__kCFBooleanFalse forKey:v32];
    [v34 setProperty:&off_2298A0 forKey:@"HomeAction"];
    [v34 setIdentifier:@"LongPressSpecifier"];
    v105 = v34;
    [v24 addObject:v34];
    if (AXHasCapability())
    {
      v35 = settingsLocString(@"FORCE_TOUCH_AST_ACTION_TITLE", @"Accessibility");
      id v36 = +[PSSpecifier preferenceSpecifierNamed:v35 target:v2 set:0 get:"_orbAction:" detail:objc_opt_class() cell:2 edit:0];
      [v36 setProperty:&off_2298B8 forKey:@"HomeAction"];
      [v36 setProperty:&__kCFBooleanFalse forKey:v32];
      [v36 setIdentifier:@"ForceTouchSpecifier"];
      [v24 addObject:v36];
    }
    id v37 = [obj indexOfObjectPassingTest:&__block_literal_global_444];
    if (v37 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v38 = v37;
      v39 = [(CustomGestureController *)v2 customGestureSpecifiers];
      id v40 = [v24 arrayByAddingObjectsFromArray:v39];

      v41 = [obj objectAtIndexedSubscript:v38];
      objc_msgSend(v113, "ps_insertObjectsFromArray:afterObject:", v40, v41);
    }
    v109 = v24;
    id v42 = +[AXSettings sharedInstance];
    unsigned int v43 = [v42 laserEnabled];

    if (v43)
    {
      id v44 = [v113 specifierForID:@"ASTMousePointerCustomization"];
      [v113 removeObject:v44];

      v45 = [v113 specifierForID:@"ASTMouseZoomOptions"];
      [v113 removeObject:v45];
    }
    id v46 = +[NSMutableArray array];
    v47 = +[PSSpecifier groupSpecifierWithName:0];
    id v48 = settingsLocString(@"MOUSE_POINTER_DWELL_CONTROL_FOOTER", @"HandSettings");
    [v47 setProperty:v48 forKey:v115];

    [v47 setIdentifier:@"DwellGroupFooterSpecifier"];
    v103 = v47;
    [v46 addObject:v47];
    v49 = settingsLocString(@"MOUSE_POINTER_DWELL_CONTROL", @"HandSettings");
    objc_super v50 = +[PSSpecifier preferenceSpecifierNamed:v49 target:v2 set:"setDwellControlEnabled:specifier:" get:"dwellControlEnabled:" detail:0 cell:6 edit:0];

    [v50 setIdentifier:@"DwellEnabledSpecifier"];
    v102 = v50;
    [v46 addObject:v50];
    v51 = settingsLocString(@"MOUSE_POINTER_DWELL_AUTOREVERT", @"HandSettings");
    v52 = +[PSSpecifier preferenceSpecifierNamed:v51 target:v2 set:0 get:"dwellControlAutorevertAction:" detail:objc_opt_class() cell:2 edit:0];

    [v52 setIdentifier:@"DwellAutorevertSpecifier"];
    v101 = v52;
    [v46 addObject:v52];
    v53 = settingsLocString(@"MOUSE_POINTER_DWELL_TOLERANCE", @"HandSettings");
    v54 = +[PSSpecifier preferenceSpecifierNamed:v53 target:v2 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v54 setIdentifier:@"DwellToleranceSpecifier"];
    v100 = v54;
    [v46 addObject:v54];
    v55 = settingsLocString(@"MOUSE_POINTER_DWELL_HOT_CORNERS", @"HandSettings");
    v56 = +[PSSpecifier preferenceSpecifierNamed:v55 target:v2 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v56 setIdentifier:@"DwellCornersSpecifier"];
    v99 = v56;
    [v46 addObject:v56];
    v57 = AXParameterizedLocalizedString();
    v58 = +[PSSpecifier preferenceSpecifierNamed:v57 target:v2 set:"setUseExtendedKeyboardPredictions:specifier:" get:"useExtendedKeyboardPredictions:" detail:0 cell:6 edit:0];

    [v58 setIdentifier:@"DwellExtendedPredictionsSpecifier"];
    [v58 setProperty:objc_opt_class() forKey:PSCellClassKey];
    v98 = v58;
    [v46 addObject:v58];
    v59 = +[PSSpecifier ax_stepperSpecifierWithDelegate:v2];
    [v59 setIdentifier:@"DwellTimeoutSpecifier"];
    v97 = v59;
    [v46 addObject:v59];
    v104 = v46;
    [v113 addObjectsFromArray:v46];
    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    id obja = obj;
    id v60 = [obja countByEnumeratingWithState:&v121 objects:v130 count:16];
    if (v60)
    {
      id v61 = v60;
      uint64_t v62 = *(void *)v122;
      uint64_t v63 = PSKeyNameKey;
      uint64_t v117 = PSSliderRightImageKey;
      uint64_t v64 = PSSliderLeftImageKey;
      do
      {
        for (j = 0; j != v61; j = (char *)j + 1)
        {
          if (*(void *)v122 != v62) {
            objc_enumerationMutation(obja);
          }
          v66 = *(void **)(*((void *)&v121 + 1) + 8 * (void)j);
          v67 = [v66 propertyForKey:v63];
          if ([v67 isEqualToString:@"AlwaysShowMenuGroup"]) {
            [(HandController *)v118 _updateASTAlwaysShowMenuGroupSpecifier:v66];
          }
          if ([v67 isEqualToString:@"TouchSpeed"])
          {
            v68 = AXHareImage();
            [v66 setProperty:v68 forKey:v117];

            v69 = AXTortoiseImage();
            [v66 setProperty:v69 forKey:v64];
          }
        }
        id v61 = [obja countByEnumeratingWithState:&v121 objects:v130 count:16];
      }
      while (v61);
    }

    v70 = +[PSSpecifier emptyGroupSpecifier];
    uint64_t v71 = PSIDKey;
    [v70 setProperty:@"SOUND_ACTIONS_GROUP" forKey:PSIDKey];
    v72 = settingsLocString(@"SOUND_ACTION_FOOTER", @"Accessibility");
    [v70 setProperty:v72 forKey:v115];

    [v113 addObject:v70];
    v73 = settingsLocString(@"SOUND_ACTIONS", @"Accessibility");
    v74 = +[PSSpecifier preferenceSpecifierNamed:v73 target:v118 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v74 setProperty:@"SOUND_ACTIONS" forKey:v71];
    [v113 addObject:v74];
    if (AXHasCapability())
    {
      if (AXDeviceIsPad()) {
        v75 = @"APPLE_PAY_IPAD";
      }
      else {
        v75 = @"APPLE_PAY";
      }
      v76 = settingsLocString(v75, @"HandSettings");
      v77 = +[PSSpecifier groupSpecifierWithName:v76];

      if (AXDeviceHasTopTouchIDButton())
      {
        v78 = settingsLocStringTopTouchIDButton(@"APPLE_PAY_IPAD_TOUCHID");
        [v77 setName:v78];
      }
      [v77 setIdentifier:@"APPLE_PAY"];
      v79 = +[BiometricKit manager];
      v80 = [v79 identities:0];
      id v81 = [v80 count];

      int IsPad = AXDeviceIsPad();
      v83 = @"APPLE_PAY_FOOTER";
      if (IsPad) {
        v83 = @"APPLE_PAY_FOOTER_IPAD";
      }
      CFStringRef v84 = @"APPLE_PAY_FOOTER_PASSCODE_IPAD";
      if (!IsPad) {
        CFStringRef v84 = @"APPLE_PAY_FOOTER_PASSCODE";
      }
      if (!v81) {
        v83 = (__CFString *)v84;
      }
      v85 = v83;
      v86 = settingsLocString(v85, @"HandSettings");
      if (AXDeviceHasTopTouchIDButton())
      {
        uint64_t v87 = settingsLocStringTopTouchIDButton(@"APPLE_PAY_FOOTER_PASSCODE_IPAD_TOUCHID");

        v86 = (void *)v87;
      }
      if (UIAccessibilityIsSwitchControlRunning())
      {
        v88 = settingsLocString(@"APPLE_PAY_FOOTER_SC_ON_ADDITION", @"HandSettings");
        v129[0] = v86;
        v129[1] = v88;
        v89 = +[NSArray arrayWithObjects:v129 count:2];
        uint64_t v90 = [v89 componentsJoinedByString:@"\n\n"];

        v86 = (void *)v90;
      }
      [v77 setProperty:v86 forKey:v115];

      [v113 addObject:v77];
      v91 = settingsLocString(@"APPLE_PAY_LABEL", @"HandSettings");
      v92 = +[PSSpecifier preferenceSpecifierNamed:v91 target:v118 set:"setPayWithAST:specifier:" get:"payWithAST:" detail:0 cell:6 edit:0];

      [v92 setIdentifier:@"APPLE_PAY_SWITCH"];
      [v113 addObject:v92];
    }
    [(HandController *)v118 setupLongTitleSpecifiers:v113];
    if ((AXHasCapability() & 1) == 0)
    {
      id v93 = [v113 indexOfSpecifierWithID:@"ASTVirtualTrackpadFooterID"];
      if (v93 < [v113 count]) {
        [v113 removeObjectAtIndex:v93];
      }
      id v94 = [v113 indexOfSpecifierWithID:@"ASTVirtualTrackpadCellID"];
      if (v94 < [v113 count]) {
        [v113 removeObjectAtIndex:v94];
      }
    }
    v95 = *(void **)&v118->super.super.AXUISettingsBaseListController_opaque[v110];
    *(void *)&v118->super.super.AXUISettingsBaseListController_opaque[v110] = v113;

    v3 = *(void **)&v118->super.super.AXUISettingsBaseListController_opaque[v110];
  }

  return v3;
}

BOOL __28__HandController_specifiers__block_invoke(id a1, PSSpecifier *a2)
{
  id v2 = [(PSSpecifier *)a2 identifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"EnableAssistiveTouchGroup"];

  return v3;
}

BOOL __28__HandController_specifiers__block_invoke_441(id a1, PSSpecifier *a2, unint64_t a3, BOOL *a4)
{
  v4 = -[PSSpecifier propertyForKey:](a2, "propertyForKey:", PSIDKey, a4);
  unsigned __int8 v5 = [v4 isEqualToString:@"AssistiveTouchCustomize"];

  return v5;
}

- (id)selectSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HandController;
  v4 = [(HandController *)&v6 selectSpecifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setDelegate:self];
  }

  return v4;
}

- (void)_updateASTAlwaysShowMenuSpecifiers
{
  unsigned __int8 v3 = [(HandController *)self specifierForKey:@"AlwaysShowMenu"];
  [(HandController *)self reloadSpecifier:v3];

  id v4 = [(HandController *)self specifierForKey:@"AlwaysShowMenuGroup"];
  [(HandController *)self _updateASTAlwaysShowMenuGroupSpecifier:v4];
}

- (void)_updateASTAlwaysShowMenuGroupSpecifier:(id)a3
{
  id v8 = a3;
  id v4 = +[AXSettings sharedInstance];
  unsigned int v5 = [v4 assistiveTouchAlwaysShowMenuEnabled];

  if (v5) {
    objc_super v6 = @"AlwaysShowMenuEnabledFooterText";
  }
  else {
    objc_super v6 = @"AlwaysShowMenuDisabledFooterText";
  }
  id v7 = settingsLocString(v6, @"HandSettings");
  [v8 setProperty:v7 forKey:PSFooterTextGroupKey];

  [(HandController *)self reloadSpecifier:v8];
}

- (id)_singleTapAction:(id)a3
{
  unsigned __int8 v3 = +[AXSettings sharedInstance];
  id v4 = [v3 assistiveTouchSingleTapAction];

  if (v4)
  {
    unsigned int v5 = AXUIAssistiveTouchStringForName();
    objc_super v6 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
  }
  else
  {
    objc_super v6 = AXParameterizedLocalizedString();
  }

  return v6;
}

- (id)_doubleTapAction:(id)a3
{
  unsigned __int8 v3 = +[AXSettings sharedInstance];
  id v4 = [v3 assistiveTouchDoubleTapAction];

  if (v4)
  {
    unsigned int v5 = AXUIAssistiveTouchStringForName();
    objc_super v6 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
  }
  else
  {
    objc_super v6 = AXParameterizedLocalizedString();
  }

  return v6;
}

- (id)_longPressAction:(id)a3
{
  unsigned __int8 v3 = +[AXSettings sharedInstance];
  id v4 = [v3 assistiveTouchLongPressAction];

  if (v4)
  {
    unsigned int v5 = AXUIAssistiveTouchStringForName();
    objc_super v6 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
  }
  else
  {
    objc_super v6 = AXParameterizedLocalizedString();
  }

  return v6;
}

- (id)_orbAction:(id)a3
{
  unsigned __int8 v3 = +[AXSettings sharedInstance];
  id v4 = [v3 assistiveTouchOrbAction];

  if (v4)
  {
    unsigned int v5 = AXUIAssistiveTouchStringForName();
    objc_super v6 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
  }
  else
  {
    objc_super v6 = AXParameterizedLocalizedString();
  }

  return v6;
}

- (id)idleOpacitySummary:(id)a3
{
  unsigned __int8 v3 = +[AXSettings sharedInstance];
  [v3 assistiveTouchIdleOpacity];
  id v4 = AXFormatFloatWithPercentage();

  return v4;
}

- (id)virtualTrackpadEnabled:(id)a3
{
  unsigned __int8 v3 = @"OFF";
  if (AXDeviceSupportsVirtualTrackpad())
  {
    id v4 = +[AXSettings sharedInstance];
    if ([v4 assistiveTouchVirtualTrackpadEnabled]) {
      unsigned __int8 v3 = @"ON";
    }
  }

  return settingsLocString(v3, @"Accessibility");
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HandController;
  [(CustomGestureController *)&v5 viewWillAppear:a3];
  if (!_AXSInUnitTestMode())
  {
    id v4 = [(HandController *)self specifiers];
    [(HandController *)self _updateAssistiveTouchControlItems:v4 reload:0];
  }
}

- (SEL)settingsGetter
{
  return "assistiveTouchCustomGestures";
}

- (SEL)settingsSetter
{
  return "setAssistiveTouchCustomGestures:";
}

- (id)customGesturesTitle
{
  return settingsLocString(@"CustomGestureHeading", @"HandSettings");
}

- (id)customGesturesExplanatoryText
{
  return settingsLocString(@"CustomGestureInstructionalText", @"HandSettings");
}

- (unint64_t)maximumNumberOfCustomGestures
{
  return 7;
}

- (void)_updateAssistiveTouchControlItems:(id)a3 reload:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = [(CustomGestureController *)self specifierForKey:@"HandEnabled" withSpecifiers:a3];
  int v6 = _AXSAssistiveTouchScannerEnabled();
  id v7 = +[NSNumber numberWithBool:v6 == 0];
  [v10 setProperty:v7 forKey:PSEnabledKey];

  if (v4) {
    [(HandController *)self reloadSpecifier:v10];
  }
  BOOL v8 = v6 == 0;
  v9 = [v10 propertyForKey:PSTableCellKey];
  [v9 setCellEnabled:v8];
}

- (void)_handleAssistiveTouchHardwareToggled:(id)a3
{
  id v4 = [(HandController *)self specifiers];
  [(HandController *)self _updateAssistiveTouchControlItems:v4 reload:1];
}

- (void)_handleAssistiveTouchToggled:(id)a3
{
  id v4 = [(HandController *)self specifiers];
  [(HandController *)self _updateAssistiveTouchControlItems:v4 reload:1];
}

- (void)_handleSettingsChange
{
  unsigned __int8 v3 = *(void **)&self->super.super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->super.super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers] = 0;

  [(HandController *)self reloadSpecifiers];
  id v4 = *(void **)&self->super.super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table];

  [v4 reloadData];
}

- (void)_orientationChange:(id)a3
{
}

- (id)mouseBehavesLikeFinger:(id)a3
{
  unsigned __int8 v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchMouseBehavesLikeFinger]);

  return v4;
}

- (void)setMouseBehavesLikeFinger:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchMouseBehavesLikeFinger:v4];
}

- (id)alwaysShowMenuEnabled:(id)a3
{
  unsigned __int8 v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchAlwaysShowMenuEnabled]);

  return v4;
}

- (void)setAlwaysShowMenuEnabled:(id)a3 specifier:(id)a4
{
  id v5 = [a3 BOOLValue];
  int v6 = +[AXSettings sharedInstance];
  id v7 = [v6 assistiveTouchMouseDwellControlCornerCustomization];
  BOOL v8 = [v7 allValues];
  unsigned int v9 = [v8 containsObject:AXAssistiveTouchIconTypeOpenMenu];

  if ((v5 & 1) != 0
    || (+[AXSettings sharedInstance],
        id v10 = objc_claimAutoreleasedReturnValue(),
        unsigned int v11 = [v10 assistiveTouchMouseDwellControlEnabled],
        v10,
        ((v11 ^ 1 | v9) & 1) != 0))
  {
    id v12 = +[AXSettings sharedInstance];
    [v12 setAssistiveTouchAlwaysShowMenuEnabled:v5];

    id v13 = [(HandController *)self specifiers];
    [(HandController *)self _updateAssistiveTouchControlItems:v13 reload:1];
  }
  else
  {
    [(HandController *)self _presentASTAlwaysShowMenuDisabledConfirmationAlert];
  }
}

- (id)mouseClickSoundsEnabled:(id)a3
{
  unsigned __int8 v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchMouseClickSoundsEnabled]);

  return v4;
}

- (void)setMouseClickSoundsEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchMouseClickSoundsEnabled:v4];
}

- (id)alwaysShowSoftwareKeyboard:(id)a3
{
  unsigned __int8 v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchMouseAlwaysShowSoftwareKeyboardEnabled]);

  return v4;
}

- (void)setAlwaysShowSoftwareKeyboard:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchMouseAlwaysShowSoftwareKeyboardEnabled:v4];
}

- (id)gameControllerEnabled:(id)a3
{
  unsigned __int8 v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchGameControllerEnabled]);

  return v4;
}

- (void)setGameControllerEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchGameControllerEnabled:v4];
}

- (id)handEnabled:(id)a3
{
  BOOL v3 = _AXSAssistiveTouchEnabled() != 0;

  return +[NSNumber numberWithBool:v3];
}

- (void)setHandEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  int v6 = +[AXSettings sharedInstance];
  if ([v6 laserEnabled] && (objc_msgSend(v5, "BOOLValue") & 1) == 0)
  {
    BOOL v8 = +[AXSpringBoardServer server];
    unsigned int v7 = [v8 currentDevicesHaveAssistiveTouchCustomActions];
  }
  else
  {
    unsigned int v7 = 0;
  }

  BOOL v9 = ([v5 BOOLValue] & 1) == 0
    && _AXSAssistiveTouchEnabled()
    && _AXSAssistiveTouchHardwareEnabled() != 0;
  if (([v5 BOOLValue] & 1) == 0)
  {
    id v13 = +[AXSpringBoardServer server];
    unsigned int v10 = [v13 connectedDevicesRequireAssistiveTouch];

    if (!v7) {
      goto LABEL_11;
    }
LABEL_14:
    v14 = +[AXSpringBoardServer server];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __43__HandController_setHandEnabled_specifier___block_invoke;
    v17[3] = &unk_20A810;
    v17[4] = self;
    id v18 = v5;
    [v14 showAlert:23 withHandler:v17];

    id v12 = v18;
    goto LABEL_15;
  }
  unsigned int v10 = 0;
  if (v7) {
    goto LABEL_14;
  }
LABEL_11:
  if ((v9 | v10) != 1)
  {
    -[HandController actualSetHandEnabled:](self, "actualSetHandEnabled:", [v5 BOOLValue]);
    goto LABEL_17;
  }
  unsigned int v11 = +[AXSpringBoardServer server];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __43__HandController_setHandEnabled_specifier___block_invoke_2;
  v15[3] = &unk_20A810;
  v15[4] = self;
  id v16 = v5;
  [v11 showAlert:10 withHandler:v15];

  id v12 = v16;
LABEL_15:

LABEL_17:
}

id __43__HandController_setHandEnabled_specifier___block_invoke(id result, uint64_t a2)
{
  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_4:
    id v2 = (void *)*((void *)result + 4);
    return [v2 reloadSpecifierID:@"EnableAssistiveTouchSpecifier" animated:1];
  }
  if (a2 != 1)
  {
    if (a2) {
      return result;
    }
    goto LABEL_4;
  }
  BOOL v3 = (void *)*((void *)result + 4);
  id v4 = [*((id *)result + 5) BOOLValue];

  return [v3 actualSetHandEnabled:v4];
}

id __43__HandController_setHandEnabled_specifier___block_invoke_2(id result, uint64_t a2)
{
  if (a2)
  {
    if (a2 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v2 = (void *)*((void *)result + 4);
      return [v2 reloadSpecifierID:@"EnableAssistiveTouchSpecifier" animated:1];
    }
  }
  else
  {
    BOOL v3 = (void *)*((void *)result + 4);
    id v4 = [*((id *)result + 5) BOOLValue];
    return [v3 actualSetHandEnabled:v4];
  }
  return result;
}

- (void)actualSetHandEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchMouseDwellControlShowPrompt:v3];

  _AXSAssistiveTouchSetEnabled();
  _AXSAssistiveTouchSetUIEnabled();
  if (v3)
  {
    _AXSHomeButtonSetRestingUnlock();
    _AXLogWithFacility();
  }

  [(HandController *)self _handleAssistiveTouchToggled:0];
}

- (id)swaggleOpensMenu
{
  id v2 = +[AXSettings sharedInstance];
  BOOL v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 assistiveTouchOpenMenuSwaggleEnabled]);

  return v3;
}

- (void)setSwaggleOpensMenu:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = +[AXSettings sharedInstance];
  id v5 = [v4 BOOLValue];

  [v6 setAssistiveTouchOpenMenuSwaggleEnabled:v5];
}

- (id)touchSpeed
{
  id v2 = +[AXSettings sharedInstance];
  [v2 assistiveTouchSpeed];
  *(float *)&double v3 = v3;
  id v4 = +[NSNumber numberWithFloat:v3];

  return v4;
}

- (void)setTouchSpeed:(id)a3
{
  id v3 = a3;
  id v6 = +[AXSettings sharedInstance];
  [v3 floatValue];
  float v5 = v4;

  [v6 setAssistiveTouchSpeed:v5];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)HandController;
  float v4 = [(HandController *)&v12 tableView:a3 cellForRowAtIndexPath:a4];
  float v5 = [v4 specifier];
  id v6 = [v5 propertyForKey:PSKeyNameKey];
  if ([v6 isEqualToString:@"TouchSpeed"])
  {
    unsigned int v7 = [v4 control];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v7 setEnabled:1];
    }
  }
  BOOL v8 = [v5 identifier];
  unsigned int v9 = [v8 isEqualToString:@"APPLE_PAY_SWITCH"];

  if (v9)
  {
    unsigned int v10 = [v4 titleLabel];
    [v10 setNumberOfLines:0];
  }

  return v4;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  float v4 = [a3 cellForRowAtIndexPath:a4];
  float v5 = [v4 specifier];
  id v6 = [v5 propertyForKey:PSKeyNameKey];

  LOBYTE(v5) = [v6 isEqualToString:@"TouchSpeed"] ^ 1;
  return (char)v5;
}

- (id)getCurrentActionForHomeActionListController:(id)a3
{
  switch((unint64_t)[a3 homeActionType])
  {
    case 1uLL:
      id v3 = +[AXSettings sharedInstance];
      uint64_t v4 = [v3 assistiveTouchSingleTapAction];
      goto LABEL_7;
    case 2uLL:
      id v3 = +[AXSettings sharedInstance];
      uint64_t v4 = [v3 assistiveTouchDoubleTapAction];
      goto LABEL_7;
    case 3uLL:
      id v3 = +[AXSettings sharedInstance];
      uint64_t v4 = [v3 assistiveTouchLongPressAction];
      goto LABEL_7;
    case 4uLL:
      id v3 = +[AXSettings sharedInstance];
      uint64_t v4 = [v3 assistiveTouchOrbAction];
LABEL_7:
      float v5 = (void *)v4;

      break;
    default:
      float v5 = 0;
      break;
  }

  return v5;
}

- (void)homeActionListController:(id)a3 selectedAction:(id)a4
{
  id v6 = a4;
  switch((unint64_t)[a3 homeActionType])
  {
    case 1uLL:
      float v5 = +[AXSettings sharedInstance];
      [v5 setAssistiveTouchSingleTapAction:v6];
      goto LABEL_6;
    case 2uLL:
      float v5 = +[AXSettings sharedInstance];
      [v5 setAssistiveTouchDoubleTapAction:v6];
      goto LABEL_6;
    case 3uLL:
      float v5 = +[AXSettings sharedInstance];
      [v5 setAssistiveTouchLongPressAction:v6];
      goto LABEL_6;
    case 4uLL:
      float v5 = +[AXSettings sharedInstance];
      [v5 setAssistiveTouchOrbAction:v6];
LABEL_6:

      break;
    default:
      break;
  }
}

- (double)valueForSpecifier:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  [v3 assistiveTouchMouseDwellControlActivationTimeout];
  double v5 = v4;

  return v5;
}

- (void)specifier:(id)a3 setValue:(double)a4
{
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchMouseDwellControlActivationTimeout:a4];
}

- (double)stepValueForSpecifier:(id)a3
{
  return 0.05;
}

- (double)minimumValueForSpecifier:(id)a3
{
  return kAXSAssistiveTouchMouseDwellControlActivationTimeoutMin;
}

- (double)maximumValueForSpecifier:(id)a3
{
  return kAXSAssistiveTouchMouseDwellControlActivationTimeoutMax;
}

- (id)stringValueForSpecifier:(id)a3
{
  [(HandController *)self valueForSpecifier:a3];
  id v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  double v4 = AXFormatNumberWithOptions();

  return v4;
}

- (id)dwellControlEnabled:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  double v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchMouseDwellControlEnabled]);

  return v4;
}

- (void)setDwellControlEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  uint64_t v6 = [v5 assistiveTouchAlwaysShowMenuEnabled] | v4;
  unsigned int v7 = +[AXSettings sharedInstance];
  [v7 setAssistiveTouchAlwaysShowMenuEnabled:v6];

  BOOL v8 = +[AXSettings sharedInstance];
  [v8 setAssistiveTouchMouseDwellControlShowPrompt:1];

  id v9 = +[AXSettings sharedInstance];
  [v9 setAssistiveTouchMouseDwellControlEnabled:v4];
}

- (id)dwellControlAutorevertAction:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  unsigned int v4 = [v3 assistiveTouchMouseDwellControlAutorevertEnabled];

  if (v4)
  {
    id v5 = +[AXSettings sharedInstance];
    uint64_t v6 = [v5 assistiveTouchMouseDwellControlAutorevertAction];

    unsigned int v7 = AXUIAssistiveTouchStringForName();
    BOOL v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
  }
  else
  {
    BOOL v8 = settingsLocString(@"FEATURE_OFF", @"HandSettings");
  }

  return v8;
}

- (void)setPayWithAST:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue])
  {
    if (!self->_localAuthContext)
    {
      id v5 = (LAContext *)objc_alloc_init((Class)LAContext);
      localAuthContext = self->_localAuthContext;
      self->_localAuthContext = v5;
    }
    v14 = [[SecureIntentViewController alloc] initWithSource:1 context:self->_localAuthContext delegate:self];
    [(HandController *)self presentModalViewController:v14 withTransition:3];
  }
  else
  {
    unsigned int v7 = settingsLocString(@"APPLE_PAY_DISABLE_ALERT_TITLE", @"HandSettings");
    BOOL v8 = settingsLocString(@"APPLE_PAY_DISABLE_ALERT_BODY", @"HandSettings");
    id v9 = +[UIAlertController alertControllerWithTitle:v7 message:v8 preferredStyle:1];

    unsigned int v10 = settingsLocString(@"APPLE_PAY_DISABLE_ALERT_ACCEPT", @"HandSettings");
    unsigned int v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:&__block_literal_global_620];

    objc_super v12 = settingsLocString(@"APPLE_PAY_DISABLE_ALERT_CANCEL", @"HandSettings");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __42__HandController_setPayWithAST_specifier___block_invoke_629;
    v15[3] = &unk_208B68;
    v15[4] = self;
    id v13 = +[UIAlertAction actionWithTitle:v12 style:1 handler:v15];

    [v9 addAction:v11];
    [v9 addAction:v13];
    [v9 setPreferredAction:v11];
    [(HandController *)self presentViewController:v9 animated:1 completion:0];
  }
}

void __42__HandController_setPayWithAST_specifier___block_invoke(id a1, UIAlertAction *a2)
{
  id v2 = AXLogSettings();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __42__HandController_setPayWithAST_specifier___block_invoke_cold_1(v2);
  }

  id v3 = [objc_alloc((Class)LAStorage) initWithDomain:0 authenticationContext:0];
  [v3 removeObjectForKey:1 completionHandler:&__block_literal_global_625];
}

void __42__HandController_setPayWithAST_specifier___block_invoke_622(id a1, NSError *a2)
{
  id v2 = a2;
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

id __42__HandController_setPayWithAST_specifier___block_invoke_629(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifierID:@"APPLE_PAY_SWITCH"];
}

- (id)payWithAST:(id)a3
{
  id v3 = [objc_alloc((Class)LAStorage) initWithDomain:0 authenticationContext:0];
  id v10 = 0;
  id v4 = [v3 BOOLForKey:1 error:&v10];
  id v5 = v10;
  if (v5)
  {
    uint64_t v6 = AXLogSettings();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[HandController payWithAST:]((uint64_t)v5, v6);
    }
  }
  unsigned int v7 = AXLogSettings();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[HandController payWithAST:]((char)v4, v7);
  }

  BOOL v8 = +[NSNumber numberWithBool:v4];

  return v8;
}

- (void)secureIntentViewControllerDidFinish:(id)a3
{
}

id __54__HandController_secureIntentViewControllerDidFinish___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadAfterSecureIntentDismissal];
}

- (void)secureIntentViewControllerDidCancel:(id)a3
{
}

id __54__HandController_secureIntentViewControllerDidCancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadAfterSecureIntentDismissal];
}

- (void)presentationControllerWillDismiss:(id)a3
{
}

id __52__HandController_presentationControllerWillDismiss___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadAfterSecureIntentDismissal];
}

- (void)_reloadAfterSecureIntentDismissal
{
}

- (void)_presentASTAlwaysShowMenuDisabledConfirmationAlert
{
  id v3 = settingsLocString(@"IMPORTANT", @"Accessibility");
  id v4 = settingsLocString(@"MOUSE_POINTER_DWELL_ALWAYS_SHOW_MENU_DISABLE", @"HandSettings");
  id v5 = +[UIAlertController alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  uint64_t v6 = settingsLocString(@"MOUSE_POINTER_DWELL_ALWAYS_SHOW_MENU_DISABLE_CONFIRM", @"HandSettings");
  unsigned int v7 = +[UIAlertAction actionWithTitle:v6 style:0 handler:&__block_literal_global_640];

  [v5 addAction:v7];
  BOOL v8 = settingsLocString(@"MOUSE_POINTER_DWELL_ALWAYS_SHOW_MENU_DISABLE_CANCEL", @"HandSettings");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __68__HandController__presentASTAlwaysShowMenuDisabledConfirmationAlert__block_invoke_2;
  v10[3] = &unk_208B68;
  v10[4] = self;
  id v9 = +[UIAlertAction actionWithTitle:v8 style:1 handler:v10];

  [v5 addAction:v9];
  [(HandController *)self presentViewController:v5 animated:1 completion:0];
}

void __68__HandController__presentASTAlwaysShowMenuDisabledConfirmationAlert__block_invoke(id a1, UIAlertAction *a2)
{
  id v2 = +[AXSettings sharedInstance];
  [v2 setAssistiveTouchAlwaysShowMenuEnabled:0];
}

id __68__HandController__presentASTAlwaysShowMenuDisabledConfirmationAlert__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateASTAlwaysShowMenuSpecifiers];
}

- (void)setUseExtendedKeyboardPredictions:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchShouldUseExtendedKeyboardPredictions:v4];
}

- (id)useExtendedKeyboardPredictions:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchShouldUseExtendedKeyboardPredictions]);

  return v4;
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

  objc_storeStrong((id *)&self->_scannerController, 0);
}

void __42__HandController_setPayWithAST_specifier___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Disabling LAStorageKeyDoublePressDisabled", v1, 2u);
}

void __42__HandController_setPayWithAST_specifier___block_invoke_622_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unable to un-set LAStorageKeyDoublePressDisabled: %@", (uint8_t *)&v2, 0xCu);
}

- (void)payWithAST:(char)a1 .cold.1(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Local Auth Storage LAStorageKeyDoublePressDisabled: %d", (uint8_t *)v2, 8u);
}

- (void)payWithAST:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unable to query Local Auth Storage: %@", (uint8_t *)&v2, 0xCu);
}

@end