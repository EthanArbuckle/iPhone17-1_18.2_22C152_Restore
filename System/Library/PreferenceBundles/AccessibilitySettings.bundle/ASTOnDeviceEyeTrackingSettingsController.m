@interface ASTOnDeviceEyeTrackingSettingsController
- (ASTOnDeviceEyeTrackingSettingsController)init;
- (ASTOnDeviceEyeTrackingSettingsHelper)eyeTrackingSettingsHelper;
- (AXSSMotionTrackingCameraInput)eyeTracker;
- (BOOL)showingAutoHideSettings;
- (id)_calibrationStrategyName:(id)a3;
- (id)createGazeTrackingIntroductionGroupSpecifier;
- (id)dwellControlEnabled:(id)a3;
- (id)onDeviceEyeTrackingEnabled:(id)a3;
- (id)shouldShowUncalibratedPoints:(id)a3;
- (id)shouldUseGaussianBlur:(id)a3;
- (id)shouldUseMotionFilter:(id)a3;
- (id)shouldUseWeightedAverages:(id)a3;
- (id)specifiers;
- (void)_configureDwellControlFooter:(id)a3;
- (void)_resetButtonTapped:(id)a3;
- (void)_updateOnDeviceEyeTrackingSwitchForOneness;
- (void)_updateSpecifiersForAutoHide;
- (void)dealloc;
- (void)setDwellControlEnabled:(id)a3 specifier:(id)a4;
- (void)setEyeTracker:(id)a3;
- (void)setEyeTrackingSettingsHelper:(id)a3;
- (void)setOnDeviceEyeTrackingEnabled:(id)a3 specifier:(id)a4;
- (void)setShouldShowUncalibratedPoints:(id)a3 specifier:(id)a4;
- (void)setShouldUseGaussianBlur:(id)a3 specifier:(id)a4;
- (void)setShouldUseMotionFilter:(id)a3 specifier:(id)a4;
- (void)setShouldUseWeightedAverages:(id)a3 specifier:(id)a4;
- (void)setShowingAutoHideSettings:(BOOL)a3;
- (void)showMoreDwellControlOptions;
- (void)willBecomeActive;
@end

@implementation ASTOnDeviceEyeTrackingSettingsController

- (ASTOnDeviceEyeTrackingSettingsController)init
{
  v34.receiver = self;
  v34.super_class = (Class)ASTOnDeviceEyeTrackingSettingsController;
  v2 = [(ASTOnDeviceEyeTrackingSettingsController *)&v34 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = +[AXSettings sharedInstance];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = __48__ASTOnDeviceEyeTrackingSettingsController_init__block_invoke;
    v31[3] = &unk_208798;
    objc_copyWeak(&v32, &location);
    [v3 registerUpdateBlock:v31 forRetrieveSelector:"assistiveTouchMouseOnDeviceEyeTrackingEnabled" withListener:v2];

    objc_destroyWeak(&v32);
    v4 = +[AXSettings sharedInstance];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __48__ASTOnDeviceEyeTrackingSettingsController_init__block_invoke_2;
    v29[3] = &unk_208798;
    objc_copyWeak(&v30, &location);
    [v4 registerUpdateBlock:v29 forRetrieveSelector:"assistiveTouchMouseDwellControlEnabled" withListener:v2];

    objc_destroyWeak(&v30);
    v5 = +[AXSettings sharedInstance];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __48__ASTOnDeviceEyeTrackingSettingsController_init__block_invoke_3;
    v27[3] = &unk_208798;
    objc_copyWeak(&v28, &location);
    [v5 registerUpdateBlock:v27 forRetrieveSelector:"assistiveTouchMouseOnDeviceEyeTrackingShouldShowUncalibratedPoints" withListener:v2];

    objc_destroyWeak(&v28);
    v6 = +[AXSettings sharedInstance];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __48__ASTOnDeviceEyeTrackingSettingsController_init__block_invoke_4;
    v25[3] = &unk_208798;
    objc_copyWeak(&v26, &location);
    [v6 registerUpdateBlock:v25 forRetrieveSelector:"assistiveTouchOnDeviceEyeTrackingShouldUseWeightedAverages" withListener:v2];

    objc_destroyWeak(&v26);
    v7 = +[AXSettings sharedInstance];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = __48__ASTOnDeviceEyeTrackingSettingsController_init__block_invoke_5;
    v23[3] = &unk_208798;
    objc_copyWeak(&v24, &location);
    [v7 registerUpdateBlock:v23 forRetrieveSelector:"assistiveTouchOnDeviceEyeTrackingShouldUseMotionFilter" withListener:v2];

    objc_destroyWeak(&v24);
    v8 = +[AXSettings sharedInstance];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __48__ASTOnDeviceEyeTrackingSettingsController_init__block_invoke_6;
    v21[3] = &unk_208798;
    objc_copyWeak(&v22, &location);
    [v8 registerUpdateBlock:v21 forRetrieveSelector:"assistiveTouchOnDeviceEyeTrackingShouldUseGaussianBlur" withListener:v2];

    objc_destroyWeak(&v22);
    v9 = +[AXSettings sharedInstance];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __48__ASTOnDeviceEyeTrackingSettingsController_init__block_invoke_7;
    v19[3] = &unk_208798;
    objc_copyWeak(&v20, &location);
    [v9 registerUpdateBlock:v19 forRetrieveSelector:"assistiveTouchOnDeviceEyeTrackingAutoHideEnabled" withListener:v2];

    objc_destroyWeak(&v20);
    v10 = +[AXSettings sharedInstance];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __48__ASTOnDeviceEyeTrackingSettingsController_init__block_invoke_8;
    v17[3] = &unk_208798;
    objc_copyWeak(&v18, &location);
    [v10 registerUpdateBlock:v17 forRetrieveSelector:"assistiveTouchBubbleModeEnabled" withListener:v2];

    objc_destroyWeak(&v18);
    v11 = +[AXSettings sharedInstance];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __48__ASTOnDeviceEyeTrackingSettingsController_init__block_invoke_9;
    v15[3] = &unk_208798;
    objc_copyWeak(&v16, &location);
    [v11 registerUpdateBlock:v15 forRetrieveSelector:"assistiveTouchMouseOnDeviceEyeTrackingCalibrationStrategy" withListener:v2];

    objc_destroyWeak(&v16);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_handleContinuityDisplayStateChanged_1, kAXSContinuityDisplayStateChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v13 = v2;
    objc_destroyWeak(&location);
  }

  return v2;
}

void __48__ASTOnDeviceEyeTrackingSettingsController_init__block_invoke(uint64_t a1)
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 assistiveTouchMouseOnDeviceEyeTrackingEnabled];

  if ((v3 & 1) == 0)
  {
    v4 = +[ASTUIGazeEnrollmentManager sharedManager];
    [v4 resetGazeEnrollment];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"OnDeviceEyeTrackingEnabledSpecifier" animated:0];
}

void __48__ASTOnDeviceEyeTrackingSettingsController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"DWELL_CONTROL" animated:0];
}

void __48__ASTOnDeviceEyeTrackingSettingsController_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"OnDeviceEyeTrackingShowUncalibratedPointsSpecifier" animated:0];
}

void __48__ASTOnDeviceEyeTrackingSettingsController_init__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"OnDeviceEyeTrackingShouldUseWeightedAvergesSpecifier" animated:0];
}

void __48__ASTOnDeviceEyeTrackingSettingsController_init__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"OnDeviceEyeTrackingShouldUseMotionFilterSpecifier" animated:0];
}

void __48__ASTOnDeviceEyeTrackingSettingsController_init__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"OnDeviceEyeTrackingShouldUseGaussianBlurSpecifier" animated:0];
}

void __48__ASTOnDeviceEyeTrackingSettingsController_init__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSpecifiersForAutoHide];
}

void __48__ASTOnDeviceEyeTrackingSettingsController_init__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"SNAP_TO_ITEM" animated:0];
}

void __48__ASTOnDeviceEyeTrackingSettingsController_init__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"kCalibrationStrategySpecifier" animated:0];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)ASTOnDeviceEyeTrackingSettingsController;
  [(ASTOnDeviceEyeTrackingSettingsController *)&v4 dealloc];
}

- (void)willBecomeActive
{
  v5.receiver = self;
  v5.super_class = (Class)ASTOnDeviceEyeTrackingSettingsController;
  [(ASTOnDeviceEyeTrackingSettingsController *)&v5 willBecomeActive];
  if ([(ASTOnDeviceEyeTrackingSettingsController *)self showingAutoHideSettings])
  {
    unsigned __int8 v3 = [(ASTOnDeviceEyeTrackingSettingsController *)self eyeTrackingSettingsHelper];
    objc_super v4 = [v3 autoHideTimeoutAndSliderContiguousSpecs];
    [(ASTOnDeviceEyeTrackingSettingsController *)self removeContiguousSpecifiers:v4 animated:0];

    [(ASTOnDeviceEyeTrackingSettingsController *)self setShowingAutoHideSettings:0];
    [(ASTOnDeviceEyeTrackingSettingsController *)self _updateSpecifiersForAutoHide];
  }
}

- (id)specifiers
{
  unsigned __int8 v3 = [(ASTOnDeviceEyeTrackingSettingsController *)self eyeTracker];

  if (!v3)
  {
    objc_opt_class();
    objc_super v4 = [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
    objc_super v5 = __UIAccessibilityCastAsClass();

    v6 = [v5 objectForKeyedSubscript:@"AX_ON_DEVICE_EYE_TRACKER_KEY"];
    [(ASTOnDeviceEyeTrackingSettingsController *)self setEyeTracker:v6];
  }
  v7 = [(ASTOnDeviceEyeTrackingSettingsController *)self eyeTrackingSettingsHelper];

  if (!v7)
  {
    v8 = [ASTOnDeviceEyeTrackingSettingsHelper alloc];
    v9 = [(ASTOnDeviceEyeTrackingSettingsController *)self eyeTracker];
    v10 = [(ASTOnDeviceEyeTrackingSettingsHelper *)v8 initWithEyeTracker:v9];
    [(ASTOnDeviceEyeTrackingSettingsController *)self setEyeTrackingSettingsHelper:v10];
  }
  uint64_t v11 = OBJC_IVAR___PSListController__specifiers;
  v12 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v12)
  {
    id v13 = [objc_allocWithZone((Class)NSMutableArray) init];
    v14 = +[PSSpecifier groupSpecifierWithID:@"OnDeviceEyeTrackingGroup"];
    [v14 setObject:@"HandSettings" forKeyedSubscript:@"table"];
    v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    [v14 setObject:v16 forKeyedSubscript:PSFooterCellClassGroupKey];

    v17 = +[NSBundle bundleForClass:objc_opt_class()];
    id v18 = [v17 bundlePath];
    v65 = v14;
    [v14 setObject:v18 forKeyedSubscript:@"bundlePath"];

    v19 = +[NSLocale currentLocale];
    id v20 = [v19 objectForKey:NSLocaleMeasurementSystem];
    unsigned int v21 = [v20 isEqualToString:NSLocaleMeasurementSystemMetric];

    id v22 = @"EyeTrackingMenuFooter";
    int IsPad = AXDeviceIsPad();
    if (IsPad)
    {
      id v22 = +[NSString stringWithFormat:@"%@_iPad", @"EyeTrackingMenuFooter"];
    }
    if (v21)
    {
      uint64_t v24 = +[NSString stringWithFormat:@"%@_Metric", v22];

      id v22 = (__CFString *)v24;
    }
    v25 = @"EyeTrackingItem13";
    if (IsPad)
    {
      v25 = +[NSString stringWithFormat:@"%@_iPad", @"EyeTrackingItem13"];
    }
    uint64_t v63 = v11;
    if (v21)
    {
      uint64_t v26 = +[NSString stringWithFormat:@"%@_Metric", v25];

      v64 = (void *)v26;
    }
    else
    {
      v64 = v25;
    }
    CFStringRef v27 = @"EyeTrackingItem32";
    if (IsPad)
    {
      CFStringRef v27 = +[NSString stringWithFormat:@"%@_iPad", @"EyeTrackingItem32"];
    }
    CFStringRef v73 = @"contentLabel";
    v74 = v22;
    id v28 = +[NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];
    v75[0] = v28;
    v71[0] = @"moreLabel";
    v71[1] = @"additionalTitleLabel";
    v71[2] = @"additionalSubtitleLabel";
    v72[1] = @"EyeTrackingLearnMoreTitle";
    v72[2] = v22;
    v62 = v22;
    v71[3] = @"additionalContent";
    v72[0] = @"EyeTrackingLearnMore";
    v70[0] = &off_22C8A0;
    v70[1] = &off_22C8C8;
    v70[2] = &off_22C8F0;
    CFStringRef v68 = @"headerLabel";
    v69 = v64;
    v29 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
    v70[3] = v29;
    v70[4] = &off_22C918;
    v70[5] = &off_22C940;
    v70[6] = &off_22C968;
    v70[7] = &off_22C990;
    v70[8] = &off_22C9B8;
    CFStringRef v66 = @"headerLabel";
    CFStringRef v67 = v27;
    v61 = (__CFString *)v27;
    id v30 = +[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    v70[9] = v30;
    v70[10] = &off_22C9E0;
    v31 = +[NSArray arrayWithObjects:v70 count:11];
    v72[3] = v31;
    id v32 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:4];
    v75[1] = v32;
    v33 = +[NSArray arrayWithObjects:v75 count:2];
    [v65 setObject:v33 forKeyedSubscript:@"content"];

    [v13 addObject:v65];
    objc_super v34 = settingsLocString(@"ON_DEVICE_EYE_TRACKING_TOGGLE_TITLE", @"HandSettings");
    v35 = +[PSSpecifier preferenceSpecifierNamed:v34 target:self set:"setOnDeviceEyeTrackingEnabled:specifier:" get:"onDeviceEyeTrackingEnabled:" detail:0 cell:6 edit:0];

    [v35 setIdentifier:@"OnDeviceEyeTrackingEnabledSpecifier"];
    [v13 addObject:v35];
    v36 = [(ASTOnDeviceEyeTrackingSettingsController *)self eyeTrackingSettingsHelper];
    v37 = [v36 specifiers];
    [v13 axSafelyAddObjectsFromArray:v37];

    v38 = +[PSSpecifier emptyGroupSpecifier];
    [(ASTOnDeviceEyeTrackingSettingsController *)self _configureDwellControlFooter:v38];
    [v13 axSafelyAddObject:v38];
    v39 = settingsLocString(@"MOUSE_POINTER_DWELL_CONTROL", @"HandSettings");
    v40 = +[PSSpecifier preferenceSpecifierNamed:v39 target:self set:"setDwellControlEnabled:specifier:" get:"dwellControlEnabled:" detail:0 cell:6 edit:0];

    [v40 setProperty:@"DWELL_CONTROL" forKey:PSIDKey];
    [v13 axSafelyAddObject:v40];
    if (AXIsInternalInstall())
    {
      v41 = +[NSMutableArray array];
      v59 = +[PSSpecifier groupSpecifierWithName:@"Internal Settings"];
      [v41 addObject:v59];
      v42 = settingsLocString(@"ON_DEVICE_EYE_TRACKING_SHOW_UNCALIBRATED_POINTS", @"HandSettings");
      v58 = +[PSSpecifier preferenceSpecifierNamed:v42 target:self set:"setShouldShowUncalibratedPoints:specifier:" get:"shouldShowUncalibratedPoints:" detail:0 cell:6 edit:0];

      [v58 setIdentifier:@"OnDeviceEyeTrackingShowUncalibratedPointsSpecifier"];
      [v41 addObject:v58];
      v43 = settingsLocString(@"ON_DEVICE_EYE_TRACKING_USE_WEIGHTED_AVERAGES", @"HandSettings");
      v57 = +[PSSpecifier preferenceSpecifierNamed:v43 target:self set:"setShouldUseWeightedAverages:specifier:" get:"shouldUseWeightedAverages:" detail:0 cell:6 edit:0];

      [v57 setIdentifier:@"OnDeviceEyeTrackingShouldUseWeightedAvergesSpecifier"];
      [v41 addObject:v57];
      v44 = settingsLocString(@"ON_DEVICE_EYE_TRACKING_USE_MOTION_FILTER", @"HandSettings");
      +[PSSpecifier preferenceSpecifierNamed:v44 target:self set:"setShouldUseMotionFilter:specifier:" get:"shouldUseMotionFilter:" detail:0 cell:6 edit:0];
      v45 = v60 = v38;

      [v45 setIdentifier:@"OnDeviceEyeTrackingShouldUseMotionFilterSpecifier"];
      [v41 addObject:v45];
      v46 = settingsLocString(@"ON_DEVICE_EYE_TRACKING_USE_GAUSIAN_BLUR", @"HandSettings");
      v47 = +[PSSpecifier preferenceSpecifierNamed:v46 target:self set:"setShouldUseGaussianBlur:specifier:" get:"shouldUseGaussianBlur:" detail:0 cell:6 edit:0];

      [v47 setIdentifier:@"OnDeviceEyeTrackingShouldUseGaussianBlurSpecifier"];
      [v41 addObject:v47];
      settingsLocString(@"ON_DEVICE_EYE_TRACKING_STRATEGY", @"HandSettings");
      v48 = v13;
      v50 = v49 = v35;
      v51 = +[PSSpecifier preferenceSpecifierNamed:v50 target:self set:0 get:"_calibrationStrategyName:" detail:objc_opt_class() cell:2 edit:0];

      [v51 setIdentifier:@"kCalibrationStrategySpecifier"];
      [v41 addObject:v51];
      v52 = settingsLocString(@"ON_DEVICE_EYE_TRACKING_RESET", @"HandSettings");
      v53 = +[PSSpecifier deleteButtonSpecifierWithName:v52 target:self action:"_resetButtonTapped:"];

      v35 = v49;
      id v13 = v48;
      [v53 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
      [v41 addObject:v53];
      [v48 axSafelyAddObjectsFromArray:v41];

      v38 = v60;
    }
    id v54 = [v13 copy];
    v55 = *(void **)&self->AXUISettingsBaseListController_opaque[v63];
    *(void *)&self->AXUISettingsBaseListController_opaque[v63] = v54;

    [(ASTOnDeviceEyeTrackingSettingsController *)self _updateSpecifiersForAutoHide];
    [(ASTOnDeviceEyeTrackingSettingsController *)self _updateOnDeviceEyeTrackingSwitchForOneness];

    v12 = *(void **)&self->AXUISettingsBaseListController_opaque[v63];
  }

  return v12;
}

- (void)_updateOnDeviceEyeTrackingSwitchForOneness
{
  id v6 = [(ASTOnDeviceEyeTrackingSettingsController *)self specifierForID:@"OnDeviceEyeTrackingEnabledSpecifier"];
  unsigned __int8 v3 = +[AXSpringBoardServer server];
  uint64_t v4 = [v3 isContinuitySessionActive] ^ 1;

  objc_super v5 = +[NSNumber numberWithBool:v4];
  [v6 setProperty:v5 forKey:PSEnabledKey];

  [(ASTOnDeviceEyeTrackingSettingsController *)self reloadSpecifier:v6];
}

- (void)_resetButtonTapped:(id)a3
{
  uint64_t v4 = +[AXSettings sharedInstance];
  [v4 setAssistiveTouchMouseOnDeviceEyeTrackingEnabled:0];

  objc_super v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchMouseOnDeviceEyeTrackingOnboardingCompleted:0];

  id v6 = +[AXSettings sharedInstance];
  [v6 setAssistiveTouchOnDeviceEyeTrackingSmoothingBufferSize:kAXSAssistiveTouchOnDeviceEyeTrackingSmoothingBufferSizeDefault];

  v7 = +[AXSettings sharedInstance];
  [v7 setAssistiveTouchMouseDwellControlEnabled:0];

  v8 = +[AXSettings sharedInstance];
  [v8 setAssistiveTouchBubbleModeEnabled:0];

  v9 = +[ASTUIGazeEnrollmentManager sharedManager];
  [v9 resetGazeEnrollment];

  [(ASTOnDeviceEyeTrackingSettingsController *)self reloadSpecifiers];
}

- (id)createGazeTrackingIntroductionGroupSpecifier
{
  v2 = +[PSSpecifier emptyGroupSpecifier];
  unsigned __int8 v3 = settingsLocString(@"ON_DEVICE_EYE_TRACKING_SETUP_FOOTER", @"HandSettings");
  uint64_t v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v2 setProperty:v5 forKey:PSFooterCellClassGroupKey];

  [v2 setProperty:v3 forKey:PSFooterHyperlinkViewTitleKey];

  return v2;
}

- (void)_configureDwellControlFooter:(id)a3
{
  id v4 = a3;
  settingsLocString(@"ON_DEVICE_EYE_TRACKING_DWELL_CONTROL_FOOTER", @"Accessibility");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v5 = settingsLocString(@"AIR_TOUCH_TITLE", @"Accessibility");
  id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v5);
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v4 setProperty:v8 forKey:PSFooterCellClassGroupKey];

  [v4 setProperty:v6 forKey:PSFooterHyperlinkViewTitleKey];
  v14.id location = (NSUInteger)[v6 rangeOfString:v5];
  v9 = NSStringFromRange(v14);
  [v4 setProperty:v9 forKey:PSFooterHyperlinkViewLinkRangeKey];

  v10 = +[NSValue valueWithNonretainedObject:self];
  [v4 setProperty:v10 forKey:PSFooterHyperlinkViewTargetKey];

  uint64_t v11 = NSStringFromSelector("showMoreDwellControlOptions");
  [v4 setProperty:v11 forKey:PSFooterHyperlinkViewActionKey];
}

- (void)showMoreDwellControlOptions
{
  +[NSURL URLWithString:@"prefs:root=ACCESSIBILITY&path=TOUCH_REACHABILITY_TITLE/AIR_TOUCH_TITLE#DwellEnabledSpecifier"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = +[LSApplicationWorkspace defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

- (void)_updateSpecifiersForAutoHide
{
  id v3 = +[AXSettings sharedInstance];
  if ([v3 assistiveTouchOnDeviceEyeTrackingAutoHideEnabled])
  {
    unsigned __int8 v4 = [(ASTOnDeviceEyeTrackingSettingsController *)self showingAutoHideSettings];

    if ((v4 & 1) == 0)
    {
      objc_super v5 = [(ASTOnDeviceEyeTrackingSettingsController *)self eyeTrackingSettingsHelper];
      id v6 = [v5 autoHideTimeoutAndSliderContiguousSpecs];
      [(ASTOnDeviceEyeTrackingSettingsController *)self insertContiguousSpecifiers:v6 afterSpecifierID:@"AUTO_HIDE" animated:1];

      v7 = self;
      uint64_t v8 = 1;
LABEL_11:
      [(ASTOnDeviceEyeTrackingSettingsController *)v7 setShowingAutoHideSettings:v8];
      return;
    }
  }
  else
  {
  }
  id v12 = +[AXSettings sharedInstance];
  if (([v12 assistiveTouchOnDeviceEyeTrackingAutoHideEnabled] & 1) == 0)
  {
    unsigned int v9 = [(ASTOnDeviceEyeTrackingSettingsController *)self showingAutoHideSettings];

    if (!v9) {
      return;
    }
    v10 = [(ASTOnDeviceEyeTrackingSettingsController *)self eyeTrackingSettingsHelper];
    uint64_t v11 = [v10 autoHideTimeoutAndSliderContiguousSpecs];
    [(ASTOnDeviceEyeTrackingSettingsController *)self removeContiguousSpecifiers:v11 animated:1];

    v7 = self;
    uint64_t v8 = 0;
    goto LABEL_11;
  }
}

- (id)_calibrationStrategyName:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = [v3 assistiveTouchMouseOnDeviceEyeTrackingCalibrationStrategy];

  return +[ASTCalibrationStrategyListController nameForCalibrationStrategy:v4];
}

- (id)onDeviceEyeTrackingEnabled:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchMouseOnDeviceEyeTrackingEnabled]);

  return v4;
}

- (void)setOnDeviceEyeTrackingEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 BOOLValue])
  {
    uint64_t v8 = +[AXSettings sharedInstance];
    [v8 setAssistiveTouchMouseOnDeviceEyeTrackingEnabled:1];
  }
  else
  {
    unsigned int v9 = AXUILocalizedStringForKey();
    v10 = AXUILocalizedStringForKey();
    uint64_t v11 = +[UIAlertController alertControllerWithTitle:v9 message:v10 preferredStyle:1];

    id v12 = AXUILocalizedStringForKey();
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __84__ASTOnDeviceEyeTrackingSettingsController_setOnDeviceEyeTrackingEnabled_specifier___block_invoke;
    v19[3] = &__block_descriptor_33_e23_v16__0__UIAlertAction_8l;
    char v20 = 0;
    id v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:v19];

    objc_initWeak(&location, self);
    NSRange v14 = AXUILocalizedStringForKey();
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __84__ASTOnDeviceEyeTrackingSettingsController_setOnDeviceEyeTrackingEnabled_specifier___block_invoke_2;
    v16[3] = &unk_208F50;
    objc_copyWeak(&v17, &location);
    v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:v16];

    [v11 addAction:v13];
    [v11 addAction:v15];
    [(ASTOnDeviceEyeTrackingSettingsController *)self presentViewController:v11 animated:1 completion:0];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __84__ASTOnDeviceEyeTrackingSettingsController_setOnDeviceEyeTrackingEnabled_specifier___block_invoke(uint64_t a1)
{
  id v2 = +[AXSettings sharedInstance];
  [v2 setAssistiveTouchMouseOnDeviceEyeTrackingEnabled:*(unsigned __int8 *)(a1 + 32)];
}

void __84__ASTOnDeviceEyeTrackingSettingsController_setOnDeviceEyeTrackingEnabled_specifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (id)dwellControlEnabled:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchMouseDwellControlEnabled]);

  return v4;
}

- (void)setDwellControlEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  objc_super v5 = +[AXSettings sharedInstance];
  uint64_t v6 = [v5 assistiveTouchAlwaysShowMenuEnabled] | v4;
  id v7 = +[AXSettings sharedInstance];
  [v7 setAssistiveTouchAlwaysShowMenuEnabled:v6];

  uint64_t v8 = +[AXSettings sharedInstance];
  [v8 setAssistiveTouchMouseDwellControlShowPrompt:1];

  id v9 = +[AXSettings sharedInstance];
  [v9 setAssistiveTouchMouseDwellControlEnabled:v4];
}

- (id)shouldShowUncalibratedPoints:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchMouseOnDeviceEyeTrackingShouldShowUncalibratedPoints]);

  return v4;
}

- (void)setShouldShowUncalibratedPoints:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchMouseOnDeviceEyeTrackingShouldShowUncalibratedPoints:v4];
}

- (id)shouldUseWeightedAverages:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchOnDeviceEyeTrackingShouldUseWeightedAverages]);

  return v4;
}

- (void)setShouldUseWeightedAverages:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchOnDeviceEyeTrackingShouldUseWeightedAverages:v4];
}

- (id)shouldUseMotionFilter:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchOnDeviceEyeTrackingShouldUseMotionFilter]);

  return v4;
}

- (void)setShouldUseMotionFilter:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchOnDeviceEyeTrackingShouldUseMotionFilter:v4];
}

- (id)shouldUseGaussianBlur:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchOnDeviceEyeTrackingShouldUseGaussianBlur]);

  return v4;
}

- (void)setShouldUseGaussianBlur:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchOnDeviceEyeTrackingShouldUseGaussianBlur:v4];
}

- (ASTOnDeviceEyeTrackingSettingsHelper)eyeTrackingSettingsHelper
{
  return self->_eyeTrackingSettingsHelper;
}

- (void)setEyeTrackingSettingsHelper:(id)a3
{
}

- (AXSSMotionTrackingCameraInput)eyeTracker
{
  return self->_eyeTracker;
}

- (void)setEyeTracker:(id)a3
{
}

- (BOOL)showingAutoHideSettings
{
  return self->_showingAutoHideSettings;
}

- (void)setShowingAutoHideSettings:(BOOL)a3
{
  self->_showingAutoHideSettings = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eyeTracker, 0);

  objc_storeStrong((id *)&self->_eyeTrackingSettingsHelper, 0);
}

@end