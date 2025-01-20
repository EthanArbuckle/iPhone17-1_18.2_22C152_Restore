@interface HPRFSessionTrackerAppCyclingPowerZoneViewController
+ (id)numberFormatter;
- (FIUIFormattingManager)formattingManager;
- (HPRFSessionTrackerAppCyclingPowerZoneViewController)initWithConfiguration:(id)a3 zoneIndex:(unint64_t)a4 updateDelegate:(id)a5;
- (PSSpecifier)lowerBoundSpecifier;
- (PSSpecifier)upperBoundSpecifier;
- (UITapGestureRecognizer)tapGesture;
- (WOCyclingPowerZone)zone;
- (WOCyclingPowerZonesConfiguration)configuration;
- (WOCyclingPowerZonesConfigurationUpdateDelegate)updateDelegate;
- (id)_lowerBoundForSpecifier:(id)a3;
- (id)_upperBoundForSpecifier:(id)a3;
- (id)applicationBundleIdentifier;
- (id)localizedPaneTitle;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (unint64_t)zoneIndex;
- (void)_didBeginEditing:(id)a3;
- (void)_insertLowerDisplayBoundSpecifiers:(id)a3;
- (void)_insertUpperDisplayBoundSpecifiers:(id)a3;
- (void)_pressedTableView;
- (void)_setLowerBound:(id)a3 specifier:(id)a4;
- (void)_setUpperBound:(id)a3 specifier:(id)a4;
- (void)setConfiguration:(id)a3;
- (void)setFormattingManager:(id)a3;
- (void)setLowerBoundSpecifier:(id)a3;
- (void)setTapGesture:(id)a3;
- (void)setUpdateDelegate:(id)a3;
- (void)setUpperBoundSpecifier:(id)a3;
- (void)setZoneIndex:(unint64_t)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HPRFSessionTrackerAppCyclingPowerZoneViewController

- (HPRFSessionTrackerAppCyclingPowerZoneViewController)initWithConfiguration:(id)a3 zoneIndex:(unint64_t)a4 updateDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HPRFSessionTrackerAppCyclingPowerZoneViewController;
  v11 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a3);
    v12->_zoneIndex = a4;
    objc_storeWeak((id *)&v12->_updateDelegate, v10);
    v13 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v12 action:"_pressedTableView"];
    tapGesture = v12->_tapGesture;
    v12->_tapGesture = v13;
  }
  return v12;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HPRFSessionTrackerAppCyclingPowerZoneViewController;
  [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)&v7 viewWillAppear:a3];
  v4 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self table];
  v5 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self tapGesture];
  [v4 addGestureRecognizer:v5];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_didBeginEditing:" name:UITextFieldTextDidBeginEditingNotification object:0];

  [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self reloadSpecifiers];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HPRFSessionTrackerAppCyclingPowerZoneViewController;
  [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)&v6 viewWillDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UITextFieldTextDidBeginEditingNotification object:0];

  v5 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self table];
  [v5 endEditing:1];
}

- (id)localizedPaneTitle
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_ZONE_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, (char *)[(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self zoneIndex] + 1);

  return v5;
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
  v4 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self localizedPaneTitle];
  [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self setTitle:v4];

  [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self _insertLowerDisplayBoundSpecifiers:v3];
  [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self _insertUpperDisplayBoundSpecifiers:v3];
  uint64_t v5 = OBJC_IVAR___PSListController__specifiers;
  objc_super v6 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers] = v3;
  id v7 = v3;

  id v8 = *(id *)&self->BPSNotificationAppController_opaque[v5];
  return v8;
}

- (void)_insertLowerDisplayBoundSpecifiers:(id)a3
{
  id v22 = a3;
  v4 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self zone];
  uint64_t v5 = [v4 lowerBound];

  if (v5)
  {
    objc_super v6 = +[PSSpecifier groupSpecifierWithID:@"CYCLING_POWER_ZONE_LOWER_BOUND_GROUP_ID"];
    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_ZONE_LOWER_BOUND_HEADER" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    [v6 setName:v8];

    id v9 = [(id)objc_opt_class() numberFormatter];
    id v10 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self zone];
    [v10 percentageLowerBound];
    v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v12 = [v9 stringFromNumber:v11];

    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_ZONE_LOWER_BOUND_FOOTER" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v12);

    [v6 setProperty:v15 forKey:PSFooterTextGroupKey];
    [v6 setProperty:&off_34458 forKey:PSFooterAlignmentGroupKey];
    [v22 addObject:v6];
    objc_super v16 = +[NSBundle bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_EDIT_FTP_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:"_setLowerBound:specifier:" get:"_lowerBoundForSpecifier:" detail:0 cell:8 edit:0];
    [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self setLowerBoundSpecifier:v18];

    v19 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self lowerBoundSpecifier];
    [v19 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];

    v20 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self lowerBoundSpecifier];
    [v20 setProperty:&__kCFBooleanTrue forKey:PSNumberKeyboardKey];

    v21 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self lowerBoundSpecifier];
    [v22 addObject:v21];
  }
}

- (id)_lowerBoundForSpecifier:(id)a3
{
  v4 = [(id)objc_opt_class() numberFormatter];
  uint64_t v5 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self zone];
  objc_super v6 = [v5 lowerBound];
  id v7 = +[HKUnit wattUnit];
  [v6 doubleValueForUnit:v7];
  id v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v9 = [v4 stringFromNumber:v8];

  return v9;
}

- (void)_setLowerBound:(id)a3 specifier:(id)a4
{
  id v13 = a3;
  if ([v13 length])
  {
    uint64_t v5 = [(id)objc_opt_class() numberFormatter];
    objc_super v6 = [v5 numberFromString:v13];

    if (v6)
    {
      id v7 = [v6 integerValue];
      uint64_t v8 = (uint64_t)v7 - 1;
      if ((uint64_t)v7 <= 1) {
        uint64_t v8 = 1;
      }
      double v9 = (double)v8;
      unint64_t v10 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self zoneIndex];
      v11 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self configuration];
      v12 = +[WOCyclingPowerZonesConfigurationEditor changeLowerBoundTo:v10 zoneIndex:v11 using:v9];
      [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self setConfiguration:v12];
    }
  }
  [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self reloadSpecifiers];
}

- (void)_insertUpperDisplayBoundSpecifiers:(id)a3
{
  id v22 = a3;
  v4 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self zone];
  uint64_t v5 = [v4 upperBound];

  if (v5)
  {
    objc_super v6 = +[PSSpecifier groupSpecifierWithID:@"CYCLING_POWER_ZONE_UPPER_BOUND_GROUP_ID"];
    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_ZONE_UPPER_BOUND_HEADER" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    [v6 setName:v8];

    double v9 = [(id)objc_opt_class() numberFormatter];
    unint64_t v10 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self zone];
    [v10 percentageUpperBound];
    v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v12 = [v9 stringFromNumber:v11];

    id v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_ZONE_UPPER_BOUND_FOOTER" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v12);

    [v6 setProperty:v15 forKey:PSFooterTextGroupKey];
    [v6 setProperty:&off_34458 forKey:PSFooterAlignmentGroupKey];
    [v22 addObject:v6];
    objc_super v16 = +[NSBundle bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_EDIT_FTP_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:"_setUpperBound:specifier:" get:"_upperBoundForSpecifier:" detail:0 cell:8 edit:0];
    [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self setUpperBoundSpecifier:v18];

    v19 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self upperBoundSpecifier];
    [v19 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];

    v20 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self upperBoundSpecifier];
    [v20 setProperty:&__kCFBooleanTrue forKey:PSNumberKeyboardKey];

    v21 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self upperBoundSpecifier];
    [v22 addObject:v21];
  }
}

- (id)_upperBoundForSpecifier:(id)a3
{
  v4 = [(id)objc_opt_class() numberFormatter];
  uint64_t v5 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self zone];
  objc_super v6 = [v5 upperBound];
  id v7 = +[HKUnit wattUnit];
  [v6 doubleValueForUnit:v7];
  uint64_t v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  double v9 = [v4 stringFromNumber:v8];

  return v9;
}

- (void)_setUpperBound:(id)a3 specifier:(id)a4
{
  id v13 = a3;
  if ([v13 length])
  {
    uint64_t v5 = [(id)objc_opt_class() numberFormatter];
    objc_super v6 = [v5 numberFromString:v13];

    if (v6)
    {
      id v7 = [v6 integerValue];
      if ((uint64_t)v7 <= 1) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = (uint64_t)v7;
      }
      double v9 = (double)v8;
      unint64_t v10 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self zoneIndex];
      v11 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self configuration];
      v12 = +[WOCyclingPowerZonesConfigurationEditor changeUpperBoundTo:v10 zoneIndex:v11 using:v9];
      [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self setConfiguration:v12];
    }
  }
  [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self reloadSpecifiers];
}

- (WOCyclingPowerZone)zone
{
  v3 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self configuration];
  v4 = [v3 zones];
  uint64_t v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", -[HPRFSessionTrackerAppCyclingPowerZoneViewController zoneIndex](self, "zoneIndex"));

  return (WOCyclingPowerZone *)v5;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
  id v5 = a3;
  id v6 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self updateDelegate];
  [v6 updateWithConfiguration:v5];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HPRFSessionTrackerAppCyclingPowerZoneViewController;
  v4 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)&v8 tableView:a3 cellForRowAtIndexPath:a4];
  if ([v4 tag] == &dword_8)
  {
    id v5 = [v4 editableTextField];
    [v5 setReturnKeyGoesToNextResponder:0];
    [v5 setReturnKeyType:9];
    [v5 setKeyboardType:4];
    id v6 = [v5 traitCollection];
    objc_msgSend(v5, "setTextAlignment:", 2 * (objc_msgSend(v6, "layoutDirection") == 0));
  }

  return v4;
}

- (void)_didBeginEditing:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C418;
  block[3] = &unk_31018;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_pressedTableView
{
  id v2 = [(HPRFSessionTrackerAppCyclingPowerZoneViewController *)self table];
  [v2 endEditing:1];
}

+ (id)numberFormatter
{
  if (qword_3D068 != -1) {
    dispatch_once(&qword_3D068, &stru_310D8);
  }
  id v2 = (void *)qword_3D060;

  return v2;
}

- (WOCyclingPowerZonesConfiguration)configuration
{
  return self->_configuration;
}

- (unint64_t)zoneIndex
{
  return self->_zoneIndex;
}

- (void)setZoneIndex:(unint64_t)a3
{
  self->_zoneIndex = a3;
}

- (WOCyclingPowerZonesConfigurationUpdateDelegate)updateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelegate);

  return (WOCyclingPowerZonesConfigurationUpdateDelegate *)WeakRetained;
}

- (void)setUpdateDelegate:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upperBoundSpecifier, 0);
  objc_storeStrong((id *)&self->_lowerBoundSpecifier, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_destroyWeak((id *)&self->_updateDelegate);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end