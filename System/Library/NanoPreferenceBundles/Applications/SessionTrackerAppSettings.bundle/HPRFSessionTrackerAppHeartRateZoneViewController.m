@interface HPRFSessionTrackerAppHeartRateZoneViewController
+ (id)zoneValueFormatter;
- (FIUIFormattingManager)formattingManager;
- (HPRFSessionTrackerAppHeartRateZoneViewController)initWithDelegate:(id)a3 zone:(id)a4;
- (HPRFSessionTrackerAppHeartRateZoneViewControllerDelegate)delegate;
- (PSSpecifier)lowerBoundSpecifier;
- (PSSpecifier)upperBoundSpecifier;
- (UITapGestureRecognizer)tapGesture;
- (WOHeartRateZone)zone;
- (id)_lowerBoundForSpecifier:(id)a3;
- (id)_upperBoundForSpecifier:(id)a3;
- (id)applicationBundleIdentifier;
- (id)localizedPaneTitle;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_didBeginEditing:(id)a3;
- (void)_pressedTableView;
- (void)_setLowerBound:(id)a3 specifier:(id)a4;
- (void)_setUpperBound:(id)a3 specifier:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setFormattingManager:(id)a3;
- (void)setLowerBoundSpecifier:(id)a3;
- (void)setTapGesture:(id)a3;
- (void)setUpperBoundSpecifier:(id)a3;
- (void)setZone:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HPRFSessionTrackerAppHeartRateZoneViewController

- (HPRFSessionTrackerAppHeartRateZoneViewController)initWithDelegate:(id)a3 zone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HPRFSessionTrackerAppHeartRateZoneViewController;
  v8 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_zone, a4);
    v10 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v9 action:"_pressedTableView"];
    tapGesture = v9->_tapGesture;
    v9->_tapGesture = v10;
  }
  return v9;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HPRFSessionTrackerAppHeartRateZoneViewController;
  [(HPRFSessionTrackerAppHeartRateZoneViewController *)&v7 viewWillAppear:a3];
  v4 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self table];
  v5 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self tapGesture];
  [v4 addGestureRecognizer:v5];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_didBeginEditing:" name:UITextFieldTextDidBeginEditingNotification object:0];

  [(HPRFSessionTrackerAppHeartRateZoneViewController *)self reloadSpecifiers];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HPRFSessionTrackerAppHeartRateZoneViewController;
  [(HPRFSessionTrackerAppHeartRateZoneViewController *)&v6 viewWillDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UITextFieldTextDidBeginEditingNotification object:0];

  v5 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self table];
  [v5 endEditing:1];
}

- (id)localizedPaneTitle
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"HEART_RATE_CONFIGURATION_ZONE_DETAIL" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  v5 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self zone];
  objc_super v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, (char *)[v5 zoneIndex] + 1);

  return v6;
}

- (id)applicationBundleIdentifier
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)specifiers
{
  v3 = objc_opt_new();
  v4 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self localizedPaneTitle];
  [(HPRFSessionTrackerAppHeartRateZoneViewController *)self setTitle:v4];

  v5 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self zone];
  objc_super v6 = [v5 lowerDisplayBound];

  if (v6)
  {
    objc_super v7 = +[PSSpecifier groupSpecifierWithID:@"ZONE_LOWER_BOUND_GROUP_ID"];
    v8 = +[NSBundle bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"HEART_RATE_CONFIGURATION_START_OF_ZONE_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    [v7 setName:v9];

    [v3 addObject:v7];
    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"HEART_RATE_CONFIGURATION_BEATS_PER_MINUTE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:"_setLowerBound:specifier:" get:"_lowerBoundForSpecifier:" detail:0 cell:8 edit:0];
    [(HPRFSessionTrackerAppHeartRateZoneViewController *)self setLowerBoundSpecifier:v12];

    objc_super v13 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self lowerBoundSpecifier];
    [v13 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];

    v14 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self lowerBoundSpecifier];
    [v14 setProperty:&__kCFBooleanTrue forKey:PSNumberKeyboardKey];

    v15 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self lowerBoundSpecifier];
    [v3 addObject:v15];
  }
  v16 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self zone];
  v17 = [v16 upperDisplayBound];

  if (v17)
  {
    v18 = +[PSSpecifier groupSpecifierWithID:@"ZONE_UPPER_BOUND_GROUP_ID"];
    v19 = +[NSBundle bundleForClass:objc_opt_class()];
    v20 = [v19 localizedStringForKey:@"HEART_RATE_CONFIGURATION_END_OF_ZONE_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    [v18 setName:v20];

    [v3 addObject:v18];
    v21 = +[NSBundle bundleForClass:objc_opt_class()];
    v22 = [v21 localizedStringForKey:@"HEART_RATE_CONFIGURATION_BEATS_PER_MINUTE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    v23 = +[PSSpecifier preferenceSpecifierNamed:v22 target:self set:"_setUpperBound:specifier:" get:"_upperBoundForSpecifier:" detail:0 cell:8 edit:0];
    [(HPRFSessionTrackerAppHeartRateZoneViewController *)self setUpperBoundSpecifier:v23];

    v24 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self upperBoundSpecifier];
    [v24 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];

    v25 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self upperBoundSpecifier];
    [v25 setProperty:&__kCFBooleanTrue forKey:PSNumberKeyboardKey];

    v26 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self upperBoundSpecifier];
    [v3 addObject:v26];
  }
  uint64_t v27 = OBJC_IVAR___PSListController__specifiers;
  v28 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers] = v3;
  id v29 = v3;

  id v30 = *(id *)&self->BPSNotificationAppController_opaque[v27];
  return v30;
}

+ (id)zoneValueFormatter
{
  if (qword_3D098 != -1) {
    dispatch_once(&qword_3D098, &stru_312B8);
  }
  v2 = (void *)qword_3D090;

  return v2;
}

- (id)_lowerBoundForSpecifier:(id)a3
{
  v4 = [(id)objc_opt_class() zoneValueFormatter];
  v5 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self zone];
  objc_super v6 = [v5 lowerDisplayBound];
  objc_super v7 = +[HKUnit _countPerMinuteUnit];
  [v6 doubleValueForUnit:v7];
  v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v9 = [v4 stringFromNumber:v8];

  return v9;
}

- (void)_setLowerBound:(id)a3 specifier:(id)a4
{
  id v18 = a3;
  if ([v18 length])
  {
    v5 = [(id)objc_opt_class() zoneValueFormatter];
    objc_super v6 = [v5 numberFromString:v18];

    if (v6)
    {
      double v7 = (double)(uint64_t)[v6 integerValue];
      v8 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self zone];
      [v8 lowerBoundMinimum];
      double v10 = v9;

      if (v10 > v7) {
        double v7 = v10;
      }
      v11 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self zone];
      [v11 lowerBoundMaximum];
      double v13 = v12;

      if (v7 < v13) {
        double v13 = v7;
      }
      v14 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self zone];
      v15 = [v14 zoneByMutatingLowerBound:v13];

      v16 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self delegate];
      v17 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self zone];
      [v16 updateZone:v17 withNewZone:v15];

      [(HPRFSessionTrackerAppHeartRateZoneViewController *)self setZone:v15];
    }
  }
  [(HPRFSessionTrackerAppHeartRateZoneViewController *)self reloadSpecifiers];
}

- (id)_upperBoundForSpecifier:(id)a3
{
  v4 = [(id)objc_opt_class() zoneValueFormatter];
  v5 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self zone];
  objc_super v6 = [v5 upperDisplayBound];
  double v7 = +[HKUnit _countPerMinuteUnit];
  [v6 doubleValueForUnit:v7];
  v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  double v9 = [v4 stringFromNumber:v8];

  return v9;
}

- (void)_setUpperBound:(id)a3 specifier:(id)a4
{
  id v18 = a3;
  if ([v18 length])
  {
    v5 = [(id)objc_opt_class() zoneValueFormatter];
    objc_super v6 = [v5 numberFromString:v18];

    if (v6)
    {
      double v7 = (double)(uint64_t)[v6 integerValue] + 1.0;
      v8 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self zone];
      [v8 upperBoundMinimum];
      double v10 = v9;

      if (v7 < v10) {
        double v7 = v10;
      }
      v11 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self zone];
      [v11 upperBoundMaximum];
      double v13 = v12;

      if (v7 < v13) {
        double v13 = v7;
      }
      v14 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self zone];
      v15 = [v14 zoneByMutatingUpperBound:v13];

      v16 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self delegate];
      v17 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self zone];
      [v16 updateZone:v17 withNewZone:v15];

      [(HPRFSessionTrackerAppHeartRateZoneViewController *)self setZone:v15];
    }
  }
  [(HPRFSessionTrackerAppHeartRateZoneViewController *)self reloadSpecifiers];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HPRFSessionTrackerAppHeartRateZoneViewController;
  v4 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)&v8 tableView:a3 cellForRowAtIndexPath:a4];
  if ([v4 tag] == &dword_8)
  {
    v5 = [v4 editableTextField];
    [v5 setReturnKeyGoesToNextResponder:0];
    [v5 setReturnKeyType:9];
    [v5 setKeyboardType:4];
    objc_super v6 = [v5 traitCollection];
    objc_msgSend(v5, "setTextAlignment:", 2 * (objc_msgSend(v6, "layoutDirection") == 0));
  }

  return v4;
}

- (void)_didBeginEditing:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_127E0;
  block[3] = &unk_31018;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_pressedTableView
{
  id v2 = [(HPRFSessionTrackerAppHeartRateZoneViewController *)self table];
  [v2 endEditing:1];
}

- (HPRFSessionTrackerAppHeartRateZoneViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HPRFSessionTrackerAppHeartRateZoneViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PSSpecifier)lowerBoundSpecifier
{
  return self->_lowerBoundSpecifier;
}

- (void)setLowerBoundSpecifier:(id)a3
{
}

- (PSSpecifier)upperBoundSpecifier
{
  return self->_upperBoundSpecifier;
}

- (void)setUpperBoundSpecifier:(id)a3
{
}

- (WOHeartRateZone)zone
{
  return self->_zone;
}

- (void)setZone:(id)a3
{
}

- (FIUIFormattingManager)formattingManager
{
  return self->_formattingManager;
}

- (void)setFormattingManager:(id)a3
{
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setTapGesture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_upperBoundSpecifier, 0);
  objc_storeStrong((id *)&self->_lowerBoundSpecifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end