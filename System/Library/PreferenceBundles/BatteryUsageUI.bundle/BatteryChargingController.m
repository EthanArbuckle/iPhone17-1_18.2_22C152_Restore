@interface BatteryChargingController
- (BOOL)setTempFooter;
- (BOOL)shouldShowHighLight:(float)a3;
- (BOOL)shouldShowRCLCard;
- (BatteryChargingController)init;
- (NSMutableDictionary)interactionAnalyticsDictionary;
- (NSMutableDictionary)recommendationAnalyticsDictionary;
- (OS_os_log)BHUILog;
- (PSSpecifier)groupSpecifier;
- (PowerUISmartChargeClient)chargingClient;
- (float)getHighlightValue;
- (float)getSegmentedControlValue;
- (id)chargingLimitGroup;
- (id)chargingLimitSlider;
- (id)cleanEnergyChargingGroupSpecifier;
- (id)defaults;
- (id)getCleanChargingSwitchState;
- (id)localizedObcFooter;
- (id)obcToggleGroup;
- (id)recommendedChargingLimitCard;
- (id)refreshSmartChargingSwitchState:(id)a3;
- (id)specifiers;
- (int)priorLimit;
- (unint64_t)cleanChargingState;
- (unint64_t)curChargingMode;
- (unint64_t)manualChargingState;
- (unint64_t)optimizedChargingState;
- (unint64_t)smartChargingState;
- (unint64_t)state;
- (void)applicationWillSuspend;
- (void)closeRCLCard;
- (void)logRecommendationAnalytics;
- (void)moveToValue:(unint64_t)a3;
- (void)reloadSpecifierID:(id)a3;
- (void)removeRCLCard;
- (void)setAboutChargingLimitLink;
- (void)setAboutCleanEnergyChargingLink;
- (void)setAsRecommended;
- (void)setBHUILog:(id)a3;
- (void)setChargeLimit:(unint64_t)a3;
- (void)setChargingClient:(id)a3;
- (void)setCleanChargingState:(unint64_t)a3;
- (void)setCleanChargingSwitchState:(id)a3;
- (void)setCurChargingMode:(unint64_t)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setInteractionAnalyticsDictionary:(id)a3;
- (void)setLearnMoreLink;
- (void)setManualChargingState:(unint64_t)a3;
- (void)setOptimizedChargingState:(unint64_t)a3;
- (void)setPriorLimit:(int)a3;
- (void)setRecommendationAnalyticsDictionary:(id)a3;
- (void)setSegmentedControlValue:(float)a3;
- (void)setSetTempFooter:(BOOL)a3;
- (void)setSmartChargingState:(unint64_t)a3;
- (void)setSmartChargingSwitchState:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)showLimitToFullAlert;
- (void)showOBCToOffAlert;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5;
- (void)updateCleanEnergyChargingState;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BatteryChargingController

- (id)chargingLimitGroup
{
  v3 = +[NSMutableArray array];
  v4 = [(BatteryChargingController *)self defaults];
  [v4 doubleForKey:@"PRIOR_MCL_LIMIT_KEY"];
  [(BatteryChargingController *)self setPriorLimit:(int)v5];

  v6 = +[PSSpecifier groupSpecifierWithName:0];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (v7 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    v7 = BatteryUILocalization(@"CHARGING_LIMIT_FOOTER");
  }
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (v8 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    v8 = BatteryUILocalization(@"CHARGING_LIMIT_LINK");
  }
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8);

  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  [v6 setProperty:v11 forKey:PSFooterCellClassGroupKey];

  [v6 setProperty:v9 forKey:PSFooterHyperlinkViewTitleKey];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (v12 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    v12 = BatteryUILocalization(@"CHARGING_LIMIT_LINK");
  }
  v41 = v9;
  v46.location = (NSUInteger)[v9 rangeOfString:v12];
  v13 = NSStringFromRange(v46);
  [v6 setProperty:v13 forKey:PSFooterHyperlinkViewLinkRangeKey];

  v14 = +[NSValue valueWithNonretainedObject:self];
  [v6 setProperty:v14 forKey:PSFooterHyperlinkViewTargetKey];

  [v6 setProperty:@"setAboutChargingLimitLink" forKey:PSFooterHyperlinkViewActionKey];
  v43 = v3;
  [v3 addObject:v6];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (v15 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    v15 = BatteryUILocalization(@"CHARGING_LIMIT_HEADER");
  }
  v42 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:0 edit:0];

  v16 = +[NSCalendar currentCalendar];
  id v17 = objc_alloc_init((Class)NSDateFormatter);
  v18 = +[NSLocale currentLocale];
  [v17 setLocale:v18];

  if (+[PLBatteryUIUtilities is24HourClock]) {
    CFStringRef v19 = @"H:mm";
  }
  else {
    CFStringRef v19 = @"h:mm a";
  }
  [v17 setLocalizedDateFormatFromTemplate:v19];
  id v20 = objc_alloc_init((Class)NSDateComponents);
  [v20 setHour:6];
  v40 = v16;
  v39 = [v16 dateFromComponents:v20];
  v21 = objc_msgSend(v17, "stringFromDate:");
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (v22 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    v22 = BatteryUILocalization(@"CHARGING_LIMIT_TEMP_DISABLE_FOOTER");
  }
  v23 = +[PLBatteryUIUtilities localizedStringWithPercentage:(double)[(BatteryChargingController *)self priorLimit]];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v23, v21);
  v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v25 = [(BatteryChargingController *)self chargingClient];
  uint64_t v44 = 0;
  v26 = (char *)[v25 isMCLCurrentlyEnabled:&v44];

  if (v26 == (unsigned char *)&dword_0 + 3 && [(BatteryChargingController *)self priorLimit])
  {
    uint64_t v27 = PSFooterTextGroupKey;
    v28 = v42;
    v29 = v42;
    CFStringRef v30 = v24;
  }
  else
  {
    uint64_t v27 = PSFooterTextGroupKey;
    CFStringRef v30 = @" ";
    v28 = v42;
    v29 = v42;
  }
  [v29 setObject:v30 forKeyedSubscript:v27];
  [v43 addObject:v28];
  v31 = [(BatteryChargingController *)self chargingLimitSlider];
  [v43 addObject:v31];
  unsigned int v32 = [(BatteryChargingController *)self shouldShowRCLCard];
  v33 = [(BatteryChargingController *)self recommendationAnalyticsDictionary];
  v34 = v33;
  if (v32)
  {
    [v33 setObject:&__kCFBooleanTrue forKeyedSubscript:@"isShownRecommendation"];

    v35 = [(BatteryChargingController *)self recommendedChargingLimitCard];
    [v43 addObject:v35];
  }
  else
  {
    v36 = [v33 objectForKeyedSubscript:@"isShownRecommendation"];

    if (v36) {
      goto LABEL_28;
    }
    v35 = [(BatteryChargingController *)self recommendationAnalyticsDictionary];
    [v35 setObject:&__kCFBooleanFalse forKeyedSubscript:@"isShownRecommendation"];
  }

LABEL_28:
  v37 = [(BatteryChargingController *)self obcToggleGroup];
  [v43 addObjectsFromArray:v37];

  return v43;
}

- (void)setAboutChargingLimitLink
{
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (uint64_t v2 = _CFPreferencesCopyValueWithContainer()) == 0))
  {
    uint64_t v2 = BatteryUILocalization(@"CHARGING_LIMIT_URL");
  }
  id v5 = (id)v2;
  v3 = +[NSURL URLWithString:v2];
  v4 = +[UIApplication sharedApplication];
  [v4 openURL:v3 options:&__NSDictionary0__struct completionHandler:&stru_BE7A8];
}

- (id)defaults
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.batteryui.charging"];

  return v2;
}

- (id)chargingLimitSlider
{
  v3 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
  [v3 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v3 setIdentifier:@"CHARGING_LIMIT_SLIDER_CELL"];
  [v3 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  [v3 setProperty:&off_C94D0 forKey:@"PLSegmentedLabelSliderCellMaxValueKey"];
  [v3 setProperty:&off_C94E8 forKey:@"PLSegmentedLabelSliderCellMinValueKey"];
  [v3 setProperty:&off_C9500 forKey:@"PLSegmentedLabelSliderCellSegmentCountKey"];
  v4 = +[NSNumber numberWithDouble:UITableViewAutomaticDimension];
  [v3 setProperty:v4 forKey:PSTableCellHeightKey];

  [v3 setProperty:self forKey:@"PLSegmentedLabelSliderCellDelegateKey"];

  return v3;
}

- (float)getSegmentedControlValue
{
  v3 = [(BatteryChargingController *)self chargingClient];
  id v16 = 0;
  uint64_t v4 = (uint64_t)[v3 getMCLLimitWithError:&v16];
  id v5 = v16;

  if (v5)
  {
    v6 = [(BatteryChargingController *)self BHUILog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_8B358();
    }

LABEL_11:
    float v7 = 0.0;
    goto LABEL_12;
  }
  if ((v4 - 80) > 0x14 || (_BYTE)v4 != 5 * ((205 * v4) >> 10))
  {
    v8 = [(BatteryChargingController *)self BHUILog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_8B2EC(v4, v8, v9, v10, v11, v12, v13, v14);
    }

    goto LABEL_11;
  }
  float v7 = (float)v4;
LABEL_12:

  return v7;
}

- (void)setSegmentedControlValue:(float)a3
{
  if (a3 > 100.0 || a3 < 80.0 || (-858993459 * (int)a3 + 429496729) >= 0x33333333)
  {
    float v7 = [(BatteryChargingController *)self BHUILog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_8B3C0(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    [(BatteryChargingController *)self getSegmentedControlValue];
    if (v15 != a3)
    {
      if (a3 == 100.0)
      {
        id v16 = [(BatteryChargingController *)self BHUILog];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17[0] = 67109120;
          v17[1] = 100;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "MCL limit being set to MAX: %d", (uint8_t *)v17, 8u);
        }

        [(BatteryChargingController *)self showLimitToFullAlert];
      }
      else
      {
        [(BatteryChargingController *)self setChargeLimit:(unint64_t)a3];
      }
    }
  }
}

- (void)setChargeLimit:(unint64_t)a3
{
  if ([(BatteryChargingController *)self shouldShowRCLCard]) {
    [(BatteryChargingController *)self removeRCLCard];
  }
  if (a3 == 100)
  {
    BOOL v5 = 1;
  }
  else
  {
    [(BatteryChargingController *)self getSegmentedControlValue];
    BOOL v5 = v6 == 100.0;
  }
  float v7 = [(BatteryChargingController *)self defaults];
  [v7 setDouble:@"PRIOR_MCL_LIMIT_KEY" forKey:(double)a3];

  uint64_t v8 = [(BatteryChargingController *)self chargingClient];
  id v20 = 0;
  unsigned int v9 = [v8 setMCLLimit:a3 error:&v20];
  id v10 = v20;

  uint64_t v11 = [(BatteryChargingController *)self BHUILog];
  uint64_t v12 = v11;
  if (!v9 || v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_8B434();
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v22 = a3;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "MCL set to %d", buf, 8u);
    }

    uint64_t v13 = +[NSNumber numberWithInt:a3];
    uint64_t v14 = [(BatteryChargingController *)self interactionAnalyticsDictionary];
    [v14 setObject:v13 forKeyedSubscript:@"value"];

    float v15 = [(BatteryChargingController *)self interactionAnalyticsDictionary];
    id v16 = [v15 objectForKeyedSubscript:@"action"];

    if (!v16)
    {
      id v17 = [(BatteryChargingController *)self interactionAnalyticsDictionary];
      [v17 setObject:@"sliderInteracted" forKeyedSubscript:@"action"];
    }
    block[5] = _NSConcreteStackBlock;
    block[6] = 3221225472;
    block[7] = sub_E6F8;
    block[8] = &unk_BE5D0;
    block[9] = self;
    AnalyticsSendEventLazy();
    if (v5)
    {
      dispatch_time_t v18 = dispatch_time(0, 500000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_E770;
      block[3] = &unk_BE810;
      block[4] = self;
      dispatch_after(v18, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (float)getHighlightValue
{
  if (+[BatteryUIResourceClass inDemoMode])
  {
    v3 = +[PLBatteryUIUtilities getDefaultValueForKey:@"BUICTL_RecommendedChargeLimit"];
    if (v3)
    {
      id v4 = v3;
      float v5 = (float)(int)[v3 intValue];
      goto LABEL_11;
    }
  }
  float v6 = [(BatteryChargingController *)self chargingClient];
  id v17 = 0;
  float v7 = (char *)[v6 currentRecommendedChargeLimitWithError:&v17];
  id v4 = v17;

  if (v4)
  {
    uint64_t v8 = [(BatteryChargingController *)self BHUILog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_8B508();
    }
LABEL_10:

    float v5 = 0.0;
    goto LABEL_11;
  }
  unsigned int v9 = [(BatteryChargingController *)self BHUILog];
  uint64_t v8 = v9;
  if ((unint64_t)(v7 - 101) <= 0xFFFFFFFFFFFFFFEALL)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_8B49C((uint64_t)v7, v8, v10, v11, v12, v13, v14, v15);
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v19 = (int)v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Recommended limit returned as: %d", buf, 8u);
  }

  float v5 = (float)(unint64_t)v7;
LABEL_11:

  return v5;
}

- (id)recommendedChargingLimitCard
{
  v3 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
  [v3 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v3 setIdentifier:@"CHARGING_LIMIT_RECOMMENDATION_CARD"];
  [v3 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (id v4 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v4 = BatteryUILocalization(@"RECOMMENDED_CHARGE_LIMIT");
  }
  [v3 setProperty:v4 forKey:@"ClosableActionCardViewCellTitleKey"];

  [(BatteryChargingController *)self getHighlightValue];
  float v6 = v5;
  id v7 = objc_alloc((Class)NSString);
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (uint64_t v8 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    uint64_t v8 = BatteryUILocalization(@"RECOMMENDED_CHARGE_LIMIT_INFO");
  }
  unsigned int v9 = +[PLBatteryUIUtilities localizedStringWithPercentage:(double)(int)v6];
  id v10 = objc_msgSend(v7, "initWithFormat:", v8, v9);

  [v3 setProperty:v10 forKey:@"ClosableActionCardViewCellSubtitleKey"];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (uint64_t v11 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    uint64_t v11 = BatteryUILocalization(@"SET_RECOMMENDED_CHARGE_LIMIT");
  }
  [v3 setProperty:v11 forKey:@"ClosableActionCardViewCellActionTitleKey"];

  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_EDC0;
  v19[3] = &unk_BE838;
  objc_copyWeak(&v20, &location);
  uint64_t v12 = objc_retainBlock(v19);
  [v3 setProperty:v12 forKey:@"ClosableActionCardViewCellActionKey"];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  _DWORD v17[2] = sub_EE00;
  v17[3] = &unk_BE838;
  objc_copyWeak(&v18, &location);
  uint64_t v13 = objc_retainBlock(v17);
  [v3 setProperty:v13 forKey:@"ClosableActionCardViewCellCloseKey"];

  uint64_t v14 = +[NSNumber numberWithDouble:UITableViewAutomaticDimension];
  [v3 setProperty:v14 forKey:PSTableCellHeightKey];

  uint64_t v15 = [(BatteryChargingController *)self BHUILog];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v23 = (int)v6;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Recommended charge limit card shown with: %d", buf, 8u);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v3;
}

- (void)setAsRecommended
{
  v3 = [(BatteryChargingController *)self interactionAnalyticsDictionary];
  [v3 setObject:@"setToRecommendationTapped" forKeyedSubscript:@"action"];

  [(BatteryChargingController *)self getHighlightValue];
  [(BatteryChargingController *)self moveToValue:(unint64_t)v4];

  [(BatteryChargingController *)self removeRCLCard];
}

- (void)closeRCLCard
{
}

- (void)moveToValue:(unint64_t)a3
{
  id v6 = [(BatteryChargingController *)self specifierForID:@"CHARGING_LIMIT_SLIDER_CELL"];
  float v5 = +[NSNumber numberWithUnsignedInteger:a3];
  [v6 setProperty:v5 forKey:@"PLSegmentedLabelSliderCellMoveToValueKey"];

  [(BatteryChargingController *)self reloadSpecifierID:@"CHARGING_LIMIT_SLIDER_CELL"];
}

- (void)removeRCLCard
{
  [(BatteryChargingController *)self removeSpecifierID:@"CHARGING_LIMIT_RECOMMENDATION_CARD" animated:0];
  [(BatteryChargingController *)self getHighlightValue];
  float v4 = v3;
  float v5 = [(BatteryChargingController *)self defaults];
  double v6 = v4;
  [v5 setDouble:@"HAS_DISMISSED_CHARGE_LIMIT_RECOMMENDATION" forKey:v6];

  id v7 = [(BatteryChargingController *)self BHUILog];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    double v9 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Removed RCL banner with recommendation value: %f", (uint8_t *)&v8, 0xCu);
  }
}

- (BOOL)shouldShowRCLCard
{
  [(BatteryChargingController *)self getHighlightValue];
  float v4 = v3;
  float v5 = [(BatteryChargingController *)self defaults];
  [v5 doubleForKey:@"HAS_DISMISSED_CHARGE_LIMIT_RECOMMENDATION"];
  double v7 = v6;

  if (v4 == 0.0)
  {
    BOOL v9 = 1;
  }
  else
  {
    float v8 = v7;
    BOOL v9 = v4 == v8;
  }
  if (v9)
  {
    id v10 = [(BatteryChargingController *)self BHUILog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      double v14 = v4;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Recommendation not shown for value: %f", (uint8_t *)&v13, 0xCu);
    }

    return 0;
  }
  else
  {
    [(BatteryChargingController *)self getSegmentedControlValue];
    return v4 < v11;
  }
}

- (BOOL)shouldShowHighLight:(float)a3
{
  [(BatteryChargingController *)self getHighlightValue];
  return v4 < a3 && v4 != 0.0;
}

- (id)obcToggleGroup
{
  float v3 = +[NSMutableArray array];
  float v4 = +[PSSpecifier groupSpecifierWithID:@"OBC_TOGGLE_GROUP"];
  [v3 addObject:v4];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (float v5 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    float v5 = BatteryUILocalization(@"SC_TITLE");
  }
  double v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:"setSmartChargingSwitchState:" get:"refreshSmartChargingSwitchState:" detail:0 cell:6 edit:0];

  [v6 setIdentifier:@"OBC_TOGGLE_SPECIFIER"];
  [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
  [v3 addObject:v6];

  return v3;
}

- (id)refreshSmartChargingSwitchState:(id)a3
{
  id v4 = a3;
  [(BatteryChargingController *)self getSegmentedControlValue];
  double v6 = +[NSNumber numberWithInt:(int)v5 == 100];
  [v4 setObject:v6 forKeyedSubscript:PSEnabledKey];

  double v7 = [(BatteryChargingController *)self chargingClient];
  id v17 = 0;
  id v8 = [v7 isSmartChargingCurrentlyEnabled:&v17];
  id v9 = v17;
  [(BatteryChargingController *)self setSmartChargingState:v8];

  if (v9)
  {
    id v10 = [(BatteryChargingController *)self BHUILog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_8B570();
    }
  }
  float v11 = [(BatteryChargingController *)self specifierForID:@"OBC_TOGGLE_GROUP"];
  uint64_t v12 = [(BatteryChargingController *)self localizedObcFooter];
  [v11 setObject:v12 forKeyedSubscript:PSFooterTextGroupKey];

  if ((char *)[(BatteryChargingController *)self smartChargingState] == (char *)&dword_0 + 1)
  {
    [(BatteryChargingController *)self getSegmentedControlValue];
    BOOL v14 = v13 == 100.0;
  }
  else
  {
    BOOL v14 = 0;
  }
  uint64_t v15 = +[NSNumber numberWithInt:v14];

  return v15;
}

- (id)localizedObcFooter
{
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (float v3 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    float v3 = BatteryUILocalization(@"CHARGING_OPTIMIZED_BATTERY_CHARGING_FOOTER_WITH_CHARGE_LIMIT");
  }
  id v4 = +[PLBatteryUIUtilities localizedStringWithPercentage:100.0];
  float v5 = +[PLBatteryUIUtilities localizedStringWithPercentage:80.0];
  double v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v4, v5);

  if ((char *)[(BatteryChargingController *)self smartChargingState] == (char *)&dword_0 + 3)
  {
    double v7 = +[NSCalendar currentCalendar];
    id v8 = objc_alloc_init((Class)NSDateFormatter);
    id v9 = +[NSLocale currentLocale];
    [v8 setLocale:v9];

    if (+[PLBatteryUIUtilities is24HourClock]) {
      CFStringRef v10 = @"H:mm";
    }
    else {
      CFStringRef v10 = @"h:mm a";
    }
    [v8 setLocalizedDateFormatFromTemplate:v10];
    id v11 = objc_alloc_init((Class)NSDateComponents);
    [v11 setHour:6];
    uint64_t v12 = [v7 dateFromComponents:v11];
    float v13 = [v8 stringFromDate:v12];
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (BOOL v14 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      BOOL v14 = BatteryUILocalization(@"SC_FOOTER_TEXT_TEMP_DISABLE_ADDITION");
    }
    uint64_t v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v13);

    uint64_t v16 = +[NSString stringWithFormat:@"%@ %@", v6, v15];

    double v6 = (void *)v16;
  }

  return v6;
}

- (void)setSmartChargingSwitchState:(id)a3
{
  if ([a3 BOOLValue])
  {
    id v4 = [(BatteryChargingController *)self BHUILog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "User enabled smart charging", buf, 2u);
    }

    float v5 = [(BatteryChargingController *)self chargingClient];
    id v11 = 0;
    unsigned int v6 = [v5 enableSmartCharging:&v11];
    id v7 = v11;

    id v8 = [(BatteryChargingController *)self BHUILog];
    id v9 = v8;
    if (!v6 || v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_8AE98();
      }

      ADClientAddValueForScalarKey();
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CFStringRef v10 = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Smart charging enabled", v10, 2u);
      }

      ADClientAddValueForScalarKey();
      ADClientSetValueForScalarKey();
    }
    [(BatteryChargingController *)self reloadSpecifierID:@"OBC_TOGGLE_GROUP"];
  }
  else
  {
    [(BatteryChargingController *)self showOBCToOffAlert];
  }
}

- (void)showLimitToFullAlert
{
  id v3 = objc_alloc((Class)NSString);
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (id v4 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v4 = BatteryUILocalization(@"CHARGING_LIMIT_TO_FULL_ALERT_BODY");
  }
  float v5 = +[PLBatteryUIUtilities localizedStringWithPercentage:100.0];
  id v6 = objc_msgSend(v3, "initWithFormat:", v4, v5);

  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (id v7 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v7 = BatteryUILocalization(@"CHARGING_LIMIT_TO_FULL_ALERT_TITLE");
  }
  id v8 = +[UIAlertController alertControllerWithTitle:v7 message:v6 preferredStyle:1];

  id v9 = objc_alloc((Class)NSString);
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (CFStringRef v10 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    CFStringRef v10 = BatteryUILocalization(@"CHARGING_LIMIT_TO_FULL_ALERT_SET_TO_FULL");
  }
  id v11 = +[PLBatteryUIUtilities localizedStringWithPercentage:100.0];
  id v12 = objc_msgSend(v9, "initWithFormat:", v10, v11);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_FE98;
  v20[3] = &unk_BE5F8;
  v20[4] = self;
  float v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:v20];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (BOOL v14 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    BOOL v14 = BatteryUILocalization(@"CHARGING_LIMIT_TO_FULL_ALERT_CANCEL");
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_FF74;
  v19[3] = &unk_BE5F8;
  void v19[4] = self;
  uint64_t v15 = +[UIAlertAction actionWithTitle:v14 style:0 handler:v19];

  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (uint64_t v16 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    uint64_t v16 = BatteryUILocalization(@"CHARGING_LIMIT_TO_FULL_ALERT_ALLOW_ONCE");
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10064;
  v18[3] = &unk_BE5F8;
  v18[4] = self;
  id v17 = +[UIAlertAction actionWithTitle:v16 style:0 handler:v18];

  [v8 addAction:v17];
  [v8 addAction:v13];
  [v8 addAction:v15];
  [v8 setPreferredAction:v17];
  [(BatteryChargingController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)logRecommendationAnalytics
{
  id v3 = [(BatteryChargingController *)self recommendationAnalyticsDictionary];
  id v4 = [v3 objectForKeyedSubscript:@"isShownRecommendation"];

  if (v4)
  {
    [(BatteryChargingController *)self getSegmentedControlValue];
    id v6 = +[NSNumber numberWithInt:(int)v5];
    id v7 = [(BatteryChargingController *)self recommendationAnalyticsDictionary];
    [v7 setObject:v6 forKeyedSubscript:@"setValue"];

    [(BatteryChargingController *)self getHighlightValue];
    id v9 = +[NSNumber numberWithInt:(int)v8];
    CFStringRef v10 = [(BatteryChargingController *)self recommendationAnalyticsDictionary];
    [v10 setObject:v9 forKeyedSubscript:@"recommendationValue"];

    id v11 = [(BatteryChargingController *)self recommendationAnalyticsDictionary];
    id v12 = [v11 copy];

    id v13 = v12;
    AnalyticsSendEventLazy();
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(BatteryChargingController *)self logRecommendationAnalytics];
  v5.receiver = self;
  v5.super_class = (Class)BatteryChargingController;
  [(BatteryChargingController *)&v5 viewWillDisappear:v3];
}

- (void)applicationWillSuspend
{
  [(BatteryChargingController *)self logRecommendationAnalytics];
  v3.receiver = self;
  v3.super_class = (Class)BatteryChargingController;
  [(BatteryChargingController *)&v3 applicationWillSuspend];
}

- (void)reloadSpecifierID:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BatteryChargingController *)self specifierForID:@"CHARGING_LIMIT_SLIDER_CELL"];
  id v6 = [(BatteryChargingController *)self cachedCellForSpecifierID:@"CHARGING_LIMIT_SLIDER_CELL"];
  [v6 frame];
  float v8 = +[NSNumber numberWithDouble:v7];
  uint64_t v9 = PSTableCellHeightKey;
  [v5 setObject:v8 forKeyedSubscript:PSTableCellHeightKey];

  v11.receiver = self;
  v11.super_class = (Class)BatteryChargingController;
  [(BatteryChargingController *)&v11 reloadSpecifierID:v4];

  CFStringRef v10 = +[NSNumber numberWithDouble:UITableViewAutomaticDimension];
  [v5 setObject:v10 forKeyedSubscript:v9];
}

- (BatteryChargingController)init
{
  v13.receiver = self;
  v13.super_class = (Class)BatteryChargingController;
  id v2 = [(BatteryChargingController *)&v13 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.batteryui.health", "");
    if (!v3)
    {
      os_log_t v3 = (os_log_t)&_os_log_default;
      id v4 = &_os_log_default;
    }
    BHUILog = v2->_BHUILog;
    v2->_BHUILog = (OS_os_log *)v3;
    id v6 = v3;

    id v7 = objc_alloc((Class)PowerUISmartChargeClient);
    float v8 = (PowerUISmartChargeClient *)[v7 initWithClientName:PowerUISmartChargeClientSettings];
    chargingClient = v2->_chargingClient;
    v2->_chargingClient = v8;

    CFStringRef v10 = objc_opt_new();
    [(BatteryChargingController *)v2 setInteractionAnalyticsDictionary:v10];

    objc_super v11 = objc_opt_new();
    [(BatteryChargingController *)v2 setRecommendationAnalyticsDictionary:v11];
  }
  return v2;
}

- (void)updateCleanEnergyChargingState
{
  os_log_t v3 = [(BatteryChargingController *)self chargingClient];
  id v8 = 0;
  id v4 = [v3 isCECCurrentlyEnabled:&v8];
  id v5 = v8;

  id v6 = [(BatteryChargingController *)self BHUILog];
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_8B6C8();
    }

    [(BatteryChargingController *)self setSmartChargingState:1];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v10 = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Got clean energy charging state: %lu", buf, 0xCu);
    }

    [(BatteryChargingController *)self setCleanChargingState:v4];
  }
}

- (void)showOBCToOffAlert
{
  os_log_t v3 = [(BatteryChargingController *)self BHUILog];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (id v4 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v4 = BatteryUILocalization(@"SC_ALERT_TITLE");
  }
  id v5 = +[UIAlertController alertControllerWithTitle:v4 message:0 preferredStyle:1];

  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (id v6 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v6 = BatteryUILocalization(@"SC_ALERT_DISABLE");
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  _DWORD v17[2] = sub_14428;
  v17[3] = &unk_BE5F8;
  void v17[4] = self;
  id v7 = +[UIAlertAction actionWithTitle:v6 style:0 handler:v17];

  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (id v8 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v8 = BatteryUILocalization(@"SC_ALERT_LEAVE_ON");
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_14538;
  v14[3] = &unk_BE988;
  id v9 = v3;
  id v15 = v9;
  uint64_t v16 = self;
  id v10 = +[UIAlertAction actionWithTitle:v8 style:0 handler:v14];

  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (objc_super v11 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    objc_super v11 = BatteryUILocalization(@"SC_ALERT_TEMP_DISABLE");
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_145AC;
  v13[3] = &unk_BE5F8;
  v13[4] = self;
  id v12 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v13];

  [v5 addAction:v12];
  [v5 addAction:v7];
  [v5 addAction:v10];
  [v5 setPreferredAction:v12];
  [(BatteryChargingController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if ([v7 section])
    {
      id v8 = [(BatteryChargingController *)self BHUILog];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_8BA24(v7);
      }
LABEL_46:

      goto LABEL_47;
    }
    v47.receiver = self;
    v47.super_class = (Class)BatteryChargingController;
    [(BatteryChargingController *)&v47 tableView:v6 didSelectRowAtIndexPath:v7];
    id v9 = [(BatteryChargingController *)self BHUILog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_8B9AC(v7);
    }

    unint64_t v10 = [(BatteryChargingController *)self state];
    objc_super v11 = &objc_loadWeakRetained_ptr;
    if ([v7 row])
    {
      if ([v7 row] == (char *)&dword_0 + 1)
      {
        id v12 = [(BatteryChargingController *)self BHUILog];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          sub_8B8DC();
        }

        if (!+[BatteryUIResourceClass inDemoMode]
          || (+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", @"FIXED_FOOTER"), +[BatteryUIResourceClass containerPath], (objc_super v13 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
        {
          BOOL v14 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"FIXED_FOOTER"];
          objc_super v13 = BatteryUILocalization(v14);
        }
        id v15 = +[NSNumberFormatter localizedStringFromNumber:&off_CA770 numberStyle:3];
        id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v15);

        [(BatteryChargingController *)self setState:1];
        AnalyticsSendEventLazy();
        goto LABEL_37;
      }
      if ([v7 row] != (char *)&dword_0 + 2)
      {
        id v8 = &stru_C3A18;
LABEL_37:
        v28 = [(BatteryChargingController *)self groupSpecifier];
        [v28 setProperty:v8 forKey:PSFooterTextGroupKey];

        v29 = v11[304];
        if (!+[BatteryUIResourceClass inDemoMode]
          || (+[BatteryUIResourceClass containerPath],
              (CFStringRef v30 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
        {
          CFStringRef v30 = BatteryUILocalization(@"LEARN_MORE_LINK");
        }
        v31 = [v29 stringWithFormat:@"%@ %@", v8, v30];

        unsigned int v32 = [(BatteryChargingController *)self BHUILog];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          sub_8B834();
        }

        v33 = [(BatteryChargingController *)self groupSpecifier];
        v34 = (objc_class *)objc_opt_class();
        v35 = NSStringFromClass(v34);
        [v33 setProperty:v35 forKey:PSFooterCellClassGroupKey];

        v36 = [(BatteryChargingController *)self groupSpecifier];
        [v36 setProperty:v31 forKey:PSFooterHyperlinkViewTitleKey];

        v37 = [(BatteryChargingController *)self groupSpecifier];
        if (!+[BatteryUIResourceClass inDemoMode]
          || (+[BatteryUIResourceClass containerPath],
              (v38 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
        {
          v38 = BatteryUILocalization(@"LEARN_MORE_LINK");
        }
        v48.id location = (NSUInteger)[v31 rangeOfString:v38];
        v39 = NSStringFromRange(v48);
        [v37 setProperty:v39 forKey:PSFooterHyperlinkViewLinkRangeKey];

        v40 = [(BatteryChargingController *)self groupSpecifier];
        v41 = +[NSValue valueWithNonretainedObject:self];
        [v40 setProperty:v41 forKey:PSFooterHyperlinkViewTargetKey];

        v42 = [(BatteryChargingController *)self groupSpecifier];
        [v42 setProperty:@"setLearnMoreLink" forKey:PSFooterHyperlinkViewActionKey];

        v43 = [(BatteryChargingController *)self groupSpecifier];
        [(BatteryChargingController *)self reloadSpecifier:v43];

        id v8 = v31;
        goto LABEL_46;
      }
      v21 = [(BatteryChargingController *)self BHUILog];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_8B978();
      }

      [(BatteryChargingController *)self setSetTempFooter:0];
      if (!+[BatteryUIResourceClass inDemoMode]
        || (+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", @"OFF_FOOTER"), +[BatteryUIResourceClass containerPath], (id v8 = _CFPreferencesCopyValueWithContainer()) == 0))
      {
        int v22 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"OFF_FOOTER"];
        id v8 = BatteryUILocalization(v22);
      }
      if (!v10)
      {
        uint64_t v44 = [(BatteryChargingController *)self BHUILog];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
          sub_8B910();
        }

        [(BatteryChargingController *)self showOBCToOffAlert];
        goto LABEL_46;
      }
      int v23 = [(BatteryChargingController *)self chargingClient];
      id v46 = 0;
      unsigned int v24 = [v23 disableSmartCharging:&v46];
      uint64_t v17 = (uint64_t)v46;

      v25 = [(BatteryChargingController *)self chargingClient];
      id v45 = 0;
      unsigned int v26 = [v25 disableMCL:&v45];
      uint64_t v18 = (uint64_t)v45;

      objc_super v11 = &objc_loadWeakRetained_ptr;
      if (!v24 || !v26 || v17 | v18)
      {
        uint64_t v27 = [(BatteryChargingController *)self BHUILog];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          sub_8B944();
        }
      }
      int v19 = self;
      uint64_t v20 = 2;
    }
    else
    {
      uint64_t v16 = [(BatteryChargingController *)self BHUILog];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_8B8A8();
      }

      if (!+[BatteryUIResourceClass inDemoMode]
        || (+[BatteryUIResourceClass containerPath],
            (uint64_t v17 = _CFPreferencesCopyValueWithContainer()) == 0))
      {
        uint64_t v17 = BatteryUILocalization(@"SC_FOOTER_TEXT");
      }
      uint64_t v18 = +[NSNumberFormatter localizedStringFromNumber:&off_CA770 numberStyle:3];
      id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v18);
      int v19 = self;
      uint64_t v20 = 0;
    }
    [(BatteryChargingController *)v19 setState:v20];

    goto LABEL_37;
  }
LABEL_47:
}

- (void)setLearnMoreLink
{
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", @"LEARN_MORE_URL"), +[BatteryUIResourceClass containerPath], (id v5 = (id)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v2 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"LEARN_MORE_URL"];
    BatteryUILocalization(v2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  os_log_t v3 = +[NSURL URLWithString:v5];
  id v4 = +[UIApplication sharedApplication];
  [v4 openURL:v3 options:&__NSDictionary0__struct completionHandler:&stru_BEA08];
}

- (id)cleanEnergyChargingGroupSpecifier
{
  os_log_t v3 = +[NSMutableArray array];
  id v4 = [(BatteryChargingController *)self chargingClient];
  if ([v4 isCECSupported])
  {
    CFStringRef v30 = v4;
    id v5 = +[PSSpecifier groupSpecifierWithID:0];
    [v3 addObject:v5];
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v6 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v6 = BatteryUILocalization(@"CLEAN_ENERGY_TITLE");
    }
    id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"setCleanChargingSwitchState:" get:"getCleanChargingSwitchState" detail:0 cell:6 edit:0];

    [v7 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v8 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v8 = BatteryUILocalization(@"CLEAN_ENERGY_FOOTER");
    }
    if ((char *)[(BatteryChargingController *)self cleanChargingState] == (char *)&dword_0 + 3)
    {
      v28 = v7;
      v29 = v3;
      id v9 = +[NSCalendar currentCalendar];
      id v10 = objc_alloc_init((Class)NSDateFormatter);
      objc_super v11 = +[NSLocale currentLocale];
      [v10 setLocale:v11];

      if (+[PLBatteryUIUtilities is24HourClock]) {
        CFStringRef v12 = @"H:mm";
      }
      else {
        CFStringRef v12 = @"h:mm a";
      }
      [v10 setLocalizedDateFormatFromTemplate:v12];
      id v13 = objc_alloc_init((Class)NSDateComponents);
      [v13 setHour:6];
      uint64_t v27 = v9;
      BOOL v14 = [v9 dateFromComponents:v13];
      id v15 = [v10 stringFromDate:v14];
      if (!+[BatteryUIResourceClass inDemoMode]
        || (+[BatteryUIResourceClass containerPath],
            (uint64_t v16 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
      {
        uint64_t v16 = BatteryUILocalization(@"CEC_FOOTER_TEXT_TEMP_DISABLE_ADDITION");
      }
      uint64_t v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v15);

      uint64_t v18 = +[NSString stringWithFormat:@"%@ %@", v8, v17];

      id v8 = (void *)v18;
      id v7 = v28;
      os_log_t v3 = v29;
    }
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (int v19 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      int v19 = BatteryUILocalization(@"CEC_LINK");
    }
    uint64_t v20 = +[NSString stringWithFormat:@"%@ %@", v8, v19];

    v21 = (objc_class *)objc_opt_class();
    int v22 = NSStringFromClass(v21);
    [v5 setProperty:v22 forKey:PSFooterCellClassGroupKey];

    [v5 setProperty:v20 forKey:PSFooterHyperlinkViewTitleKey];
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (int v23 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      int v23 = BatteryUILocalization(@"CEC_LINK");
    }
    v32.id location = (NSUInteger)[v20 rangeOfString:v23];
    unsigned int v24 = NSStringFromRange(v32);
    [v5 setProperty:v24 forKey:PSFooterHyperlinkViewLinkRangeKey];

    v25 = +[NSValue valueWithNonretainedObject:self];
    [v5 setProperty:v25 forKey:PSFooterHyperlinkViewTargetKey];

    [v5 setProperty:@"setAboutCleanEnergyChargingLink" forKey:PSFooterHyperlinkViewActionKey];
    [v3 addObject:v7];

    id v4 = v30;
  }
  else if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG))
  {
    sub_8BA9C();
  }

  return v3;
}

- (void)setAboutCleanEnergyChargingLink
{
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (os_log_t v3 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    os_log_t v3 = BatteryUILocalization(@"CEC_URL");
  }
  if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
    sub_8BAD0();
  }
  id v4 = +[NSURL URLWithString:v3];
  id v5 = +[UIApplication sharedApplication];
  [v5 openURL:v4 options:&__NSDictionary0__struct completionHandler:&stru_BEA48];
}

- (id)getCleanChargingSwitchState
{
  if ((char *)[(BatteryChargingController *)self cleanChargingState] == (char *)&dword_0 + 1) {
    return &off_C9530;
  }
  else {
    return &off_C9518;
  }
}

- (void)setCleanChargingSwitchState:(id)a3
{
  unsigned int v4 = [a3 BOOLValue];
  id v5 = [(BatteryChargingController *)self BHUILog];
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "User enabled clean energy charging", buf, 2u);
    }

    id v7 = [(BatteryChargingController *)self chargingClient];
    id v36 = 0;
    unsigned int v8 = [v7 enableCEC:&v36];
    id v9 = v36;

    id v10 = [(BatteryChargingController *)self BHUILog];
    objc_super v11 = v10;
    if (!v8 || v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_8BB44();
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Clean energy charging enabled", buf, 2u);
    }

    [(BatteryChargingController *)self reloadSpecifiers];
  }
  else
  {
    CFStringRef v12 = [(BatteryChargingController *)self chargingClient];
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v13 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v13 = BatteryUILocalization(@"CEC_ALERT_TITLE");
    }
    id v9 = +[UIAlertController alertControllerWithTitle:v13 message:0 preferredStyle:1];

    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (BOOL v14 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      BOOL v14 = BatteryUILocalization(@"CEC_ALERT_DISABLE");
    }
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_15BD8;
    v32[3] = &unk_BEA90;
    id v15 = v6;
    v33 = v15;
    id v16 = v12;
    id v34 = v16;
    v35 = self;
    uint64_t v17 = +[UIAlertAction actionWithTitle:v14 style:0 handler:v32];

    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (uint64_t v18 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      uint64_t v18 = BatteryUILocalization(@"CEC_ALERT_LEAVE_ON");
    }
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_15CEC;
    v29[3] = &unk_BE988;
    int v19 = v15;
    CFStringRef v30 = v19;
    v31 = self;
    uint64_t v20 = +[UIAlertAction actionWithTitle:v18 style:0 handler:v29];

    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (v21 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      v21 = BatteryUILocalization(@"CEC_ALERT_TEMP_DISABLE");
    }
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_15D58;
    v25[3] = &unk_BEA90;
    unsigned int v26 = v19;
    id v27 = v16;
    v28 = self;
    id v22 = v16;
    int v23 = v19;
    unsigned int v24 = +[UIAlertAction actionWithTitle:v21 style:0 handler:v25];

    [v9 addAction:v24];
    [v9 addAction:v17];
    [v9 addAction:v20];
    [v9 setPreferredAction:v24];
    [(BatteryChargingController *)self presentViewController:v9 animated:1 completion:0];
  }
}

- (id)specifiers
{
  os_log_t v3 = [(BatteryChargingController *)self BHUILog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_8BD60();
  }

  uint64_t v4 = OBJC_IVAR___PSListController__specifiers;
  id v5 = *(void **)&self->PSListItemsController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v5)
  {
    id v6 = +[NSMutableArray array];
    v61.receiver = self;
    v61.super_class = (Class)BatteryChargingController;
    id v7 = [(BatteryChargingController *)&v61 specifiers];
    [v6 addObjectsFromArray:v7];

    unsigned int v8 = [v6 firstObject];
    id v9 = [(BatteryChargingController *)self chargingClient];
    id v60 = 0;
    id v10 = [v9 isMCLCurrentlyEnabled:&v60];
    id v58 = v60;
    [(BatteryChargingController *)self setManualChargingState:v10];

    objc_super v11 = [(BatteryChargingController *)self chargingClient];
    id v59 = 0;
    id v12 = [v11 isSmartChargingCurrentlyEnabled:&v59];
    id v57 = v59;
    [(BatteryChargingController *)self setSmartChargingState:v12];

    id v13 = [(BatteryChargingController *)self BHUILog];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_8BCB0(self, v13);
    }

    BOOL v14 = PLHighlightableSegmentableSlider;
    if ([(BatteryChargingController *)self manualChargingState])
    {
      id v15 = [(BatteryChargingController *)self BHUILog];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_8BC7C();
      }

      if (!+[BatteryUIResourceClass inDemoMode]
        || (+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", @"FIXED_FOOTER"), +[BatteryUIResourceClass containerPath], (id v16 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
      {
        int v23 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"FIXED_FOOTER"];
        id v16 = BatteryUILocalization(v23);
      }
      uint64_t v20 = +[NSNumberFormatter localizedStringFromNumber:&off_CA770 numberStyle:3];
      v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v20);
      uint64_t v22 = 1;
      BOOL v14 = PLHighlightableSegmentableSlider;
    }
    else
    {
      unint64_t v17 = [(BatteryChargingController *)self smartChargingState];
      uint64_t v18 = [(BatteryChargingController *)self BHUILog];
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
      if (v17 == 1)
      {
        if (v19) {
          sub_8BC14();
        }

        if (!+[BatteryUIResourceClass inDemoMode]
          || (+[BatteryUIResourceClass containerPath],
              (id v16 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
        {
          id v16 = BatteryUILocalization(@"SC_FOOTER_TEXT");
        }
        uint64_t v20 = +[NSNumberFormatter localizedStringFromNumber:&off_CA770 numberStyle:3];
        v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v20);
        uint64_t v22 = 0;
      }
      else
      {
        if (v19) {
          sub_8BC48();
        }

        if (!+[BatteryUIResourceClass inDemoMode]
          || (+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", @"OFF_FOOTER"), +[BatteryUIResourceClass containerPath], (v21 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
        {
          id v36 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"OFF_FOOTER"];
          v21 = BatteryUILocalization(v36);
        }
        v37 = [(BatteryChargingController *)self BHUILog];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v38 = [(BatteryChargingController *)self smartChargingState];
          *(_DWORD *)buf = 134217984;
          unint64_t v63 = v38;
          _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "Smart charging temp disabled: %lu", buf, 0xCu);
        }

        if ((char *)[(BatteryChargingController *)self smartChargingState] != (char *)&dword_0 + 3)
        {
          uint64_t v22 = 2;
LABEL_22:
          [(BatteryChargingController *)self setState:v22];
          if (![&v14[40] inDemoMode]
            || ([&v14[40] containerPath], (unsigned int v24 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
          {
            unsigned int v24 = BatteryUILocalization(@"LEARN_MORE_LINK");
          }
          v25 = +[NSString stringWithFormat:@"%@ %@", v21, v24];

          unsigned int v26 = (objc_class *)objc_opt_class();
          id v27 = NSStringFromClass(v26);
          [v8 setProperty:v27 forKey:PSFooterCellClassGroupKey];

          [v8 setProperty:v25 forKey:PSFooterHyperlinkViewTitleKey];
          if (![&v14[40] inDemoMode]
            || ([&v14[40] containerPath], (v28 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
          {
            v28 = BatteryUILocalization(@"LEARN_MORE_LINK");
          }
          v65.id location = (NSUInteger)[v25 rangeOfString:v28];
          v29 = NSStringFromRange(v65);
          [v8 setProperty:v29 forKey:PSFooterHyperlinkViewLinkRangeKey];

          CFStringRef v30 = +[NSValue valueWithNonretainedObject:self];
          [v8 setProperty:v30 forKey:PSFooterHyperlinkViewTargetKey];

          [v8 setProperty:@"setLearnMoreLink" forKey:PSFooterHyperlinkViewActionKey];
          if (_os_feature_enabled_impl())
          {
            v31 = [(BatteryChargingController *)self chargingLimitGroup];
            [v6 addObjectsFromArray:v31];
          }
          if (+[PLBatteryUIBackendModel shouldShowChargingController])
          {
            [(BatteryChargingController *)self updateCleanEnergyChargingState];
            NSRange v32 = [(BatteryChargingController *)self cleanEnergyChargingGroupSpecifier];
            [v6 addObjectsFromArray:v32];
          }
          [(BatteryChargingController *)self setGroupSpecifier:v8];
          v33 = *(void **)&self->PSListItemsController_opaque[v4];
          *(void *)&self->PSListItemsController_opaque[v4] = v6;
          id v34 = v6;

          id v5 = *(void **)&self->PSListItemsController_opaque[v4];
          goto LABEL_33;
        }
        v39 = [(BatteryChargingController *)self BHUILog];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v63) = 3;
          _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, "Smart Charging Temp state: %d", buf, 8u);
        }

        if (!+[BatteryUIResourceClass inDemoMode]
          || (+[BatteryUIResourceClass containerPath],
              (id v16 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
        {
          id v16 = BatteryUILocalization(@"SC_FOOTER_TEXT");
        }
        uint64_t v20 = +[NSNumberFormatter localizedStringFromNumber:&off_CA770 numberStyle:3];
        v55 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v20);

        id v40 = objc_alloc_init((Class)NSDateComponents);
        v41 = [(BatteryChargingController *)self BHUILog];
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v63 = (unint64_t)v40;
          _os_log_impl(&dword_0, v41, OS_LOG_TYPE_DEFAULT, "Components: %@", buf, 0xCu);
        }

        [v40 setHour:6];
        v42 = [(BatteryChargingController *)self BHUILog];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          id v43 = [v40 hour];
          *(_DWORD *)buf = 134217984;
          unint64_t v63 = (unint64_t)v43;
          _os_log_impl(&dword_0, v42, OS_LOG_TYPE_DEFAULT, "Components Hours: %ld", buf, 0xCu);
        }
        v56 = v40;

        uint64_t v44 = +[NSCalendar currentCalendar];
        id v45 = [(BatteryChargingController *)self BHUILog];
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v63 = (unint64_t)v44;
          _os_log_impl(&dword_0, v45, OS_LOG_TYPE_DEFAULT, "Calendar: %@", buf, 0xCu);
        }

        id v46 = objc_alloc_init((Class)NSDateFormatter);
        objc_super v47 = +[NSLocale currentLocale];
        [v46 setLocale:v47];

        if (+[PLBatteryUIUtilities is24HourClock]) {
          CFStringRef v48 = @"H:mm";
        }
        else {
          CFStringRef v48 = @"h:mm a";
        }
        [v46 setLocalizedDateFormatFromTemplate:v48];
        v54 = v44;
        v52 = [v44 dateFromComponents:v56];
        v53 = v46;
        v49 = objc_msgSend(v46, "stringFromDate:");
        if (!+[BatteryUIResourceClass inDemoMode]
          || (+[BatteryUIResourceClass containerPath],
              (v50 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
        {
          v50 = BatteryUILocalization(@"SC_FOOTER_TEXT_TEMP_DISABLE_ADDITION");
        }
        v51 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v50, v49);

        v21 = +[NSString stringWithFormat:@"%@ %@", v55, v51];

        BOOL v14 = PLHighlightableSegmentableSlider;
        uint64_t v22 = 2;
      }
    }

    goto LABEL_22;
  }
LABEL_33:

  return v5;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setAccessibilityIdentifier:@"LEARN_MORE_FOOTER"];
  }
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)BatteryChargingController;
  [(BatteryChargingController *)&v2 viewDidLoad];
  AnalyticsSendEventLazy();
  notify_post((const char *)[@"com.apple.powerlogd.logBatteryChargingUIVisit" UTF8String]);
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)BatteryChargingController;
  [(BatteryChargingController *)&v10 viewDidAppear:a3];
  uint64_t v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Battery/CHARGING_OPTIONS_IDENTIFIER"];
  id v5 = objc_alloc((Class)_NSLocalizedStringResource);
  id v6 = +[NSLocale currentLocale];
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v8 = [v7 bundleURL];
  id v9 = [v5 initWithKey:@"CHARGING_TITLE_CHARGING" table:@"BatteryUI" locale:v6 bundleURL:v8];

  [(BatteryChargingController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.battery" title:v9 localizedNavigationComponents:&__NSArray0__struct deepLink:v4];
}

- (OS_os_log)BHUILog
{
  return (OS_os_log *)objc_getProperty(self, a2, 216, 1);
}

- (void)setBHUILog:(id)a3
{
}

- (PSSpecifier)groupSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 224, 1);
}

- (void)setGroupSpecifier:(id)a3
{
}

- (PowerUISmartChargeClient)chargingClient
{
  return (PowerUISmartChargeClient *)objc_getProperty(self, a2, 232, 1);
}

- (void)setChargingClient:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)setTempFooter
{
  return self->_setTempFooter;
}

- (void)setSetTempFooter:(BOOL)a3
{
  self->_setTempFooter = a3;
}

- (unint64_t)manualChargingState
{
  return self->_manualChargingState;
}

- (void)setManualChargingState:(unint64_t)a3
{
  self->_manualChargingState = a3;
}

- (unint64_t)optimizedChargingState
{
  return self->_optimizedChargingState;
}

- (void)setOptimizedChargingState:(unint64_t)a3
{
  self->_optimizedChargingState = a3;
}

- (unint64_t)smartChargingState
{
  return self->_smartChargingState;
}

- (void)setSmartChargingState:(unint64_t)a3
{
  self->_smartChargingState = a3;
}

- (unint64_t)curChargingMode
{
  return self->_curChargingMode;
}

- (void)setCurChargingMode:(unint64_t)a3
{
  self->_curChargingMode = a3;
}

- (unint64_t)cleanChargingState
{
  return self->_cleanChargingState;
}

- (void)setCleanChargingState:(unint64_t)a3
{
  self->_cleanChargingState = a3;
}

- (int)priorLimit
{
  return self->_priorLimit;
}

- (void)setPriorLimit:(int)a3
{
  self->_priorLimit = a3;
}

- (NSMutableDictionary)interactionAnalyticsDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 288, 1);
}

- (void)setInteractionAnalyticsDictionary:(id)a3
{
}

- (NSMutableDictionary)recommendationAnalyticsDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 296, 1);
}

- (void)setRecommendationAnalyticsDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendationAnalyticsDictionary, 0);
  objc_storeStrong((id *)&self->_interactionAnalyticsDictionary, 0);
  objc_storeStrong((id *)&self->_chargingClient, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);

  objc_storeStrong((id *)&self->_BHUILog, 0);
}

@end