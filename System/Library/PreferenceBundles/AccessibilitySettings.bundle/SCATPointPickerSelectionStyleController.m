@interface SCATPointPickerSelectionStyleController
- (double)maximumValueForSpecifier:(id)a3;
- (double)minimumValueForSpecifier:(id)a3;
- (double)stepValueForSpecifier:(id)a3;
- (double)valueForSpecifier:(id)a3;
- (id)pointPickerEnabled:(id)a3;
- (id)specifiers;
- (id)stringValueForSpecifier:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)unitsStringForSpecifier:(id)a3;
- (int64_t)keyboardTypeForSpecifier:(id)a3;
- (void)setPointPickerEnabled:(id)a3 specifier:(id)a4;
- (void)specifier:(id)a3 setValue:(double)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SCATPointPickerSelectionStyleController

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v24 = OBJC_IVAR___PSListController__specifiers;
    v4 = AXParameterizedLocalizedString();
    v23 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"setPointPickerEnabled:specifier:" get:"pointPickerEnabled:" detail:0 cell:6 edit:0];

    v5 = AXParameterizedLocalizedString();
    v6 = +[PSSpecifier groupSpecifierWithName:v5];

    v7 = AXParameterizedLocalizedString();
    uint64_t v8 = PSFooterTextGroupKey;
    [v6 setProperty:v7 forKey:PSFooterTextGroupKey];

    uint64_t v9 = PSIDKey;
    [v6 setProperty:@"SelectionStyleGroup" forKey:PSIDKey];
    v10 = AXParameterizedLocalizedString();
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v11 setProperty:&off_229B58 forKey:@"PointPickerSelectionStyle"];
    [v11 setProperty:@"SelectionStyleRefined" forKey:v9];
    v12 = AXParameterizedLocalizedString();
    v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v13 setProperty:&off_229B70 forKey:@"PointPickerSelectionStyle"];
    [v13 setProperty:@"SelectionStyleSingle" forKey:v9];
    v14 = AXParameterizedLocalizedString();
    v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v15 setProperty:&off_229B88 forKey:@"PointPickerSelectionStyle"];
    [v15 setProperty:@"SelectionStylePrecise" forKey:v9];
    v16 = AXParameterizedLocalizedString();
    v17 = +[PSSpecifier groupSpecifierWithName:v16];

    v18 = AXParameterizedLocalizedString();
    [v17 setProperty:v18 forKey:v8];

    [v17 setProperty:@"AxisSweepSpeed" forKey:v9];
    v19 = +[PSSpecifier ax_stepperSpecifierWithDelegate:self];
    [v19 setProperty:@"AxisSweepTimeStepper" forKey:v9];
    v25[0] = v23;
    v25[1] = v6;
    v25[2] = v13;
    v25[3] = v11;
    v25[4] = v15;
    v25[5] = v17;
    v25[6] = v19;
    uint64_t v20 = +[NSArray arrayWithObjects:v25 count:7];
    v21 = *(void **)&self->AXUISettingsBaseListController_opaque[v24];
    *(void *)&self->AXUISettingsBaseListController_opaque[v24] = v20;

    v3 = *(void **)&self->AXUISettingsBaseListController_opaque[v24];
  }

  return v3;
}

- (id)pointPickerEnabled:(id)a3
{
  v3 = +[AXSettings sharedInstance];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchScannerPointPickerModeEnabled]);

  return v4;
}

- (void)setPointPickerEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchScannerPointPickerModeEnabled:v4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)SCATPointPickerSelectionStyleController;
  id v6 = a4;
  v7 = [(SCATPointPickerSelectionStyleController *)&v14 tableView:a3 cellForRowAtIndexPath:v6];
  uint64_t v8 = -[SCATPointPickerSelectionStyleController specifierForIndexPath:](self, "specifierForIndexPath:", v6, v14.receiver, v14.super_class);

  uint64_t v9 = [v8 propertyForKey:@"PointPickerSelectionStyle"];
  if (v9)
  {
    v10 = [v8 propertyForKey:@"PointPickerSelectionStyle"];
    id v11 = [v10 integerValue];

    v12 = +[AXSettings sharedInstance];
    objc_msgSend(v7, "setChecked:", objc_msgSend(v12, "switchControlPointPickerSelectionStyle") == v11);
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCATPointPickerSelectionStyleController;
  [(SCATPointPickerSelectionStyleController *)&v12 tableView:a3 didSelectRowAtIndexPath:v6];
  v7 = [(SCATPointPickerSelectionStyleController *)self specifierForIndexPath:v6];
  uint64_t v8 = [v7 propertyForKey:@"PointPickerSelectionStyle"];
  if (v8)
  {
    uint64_t v9 = [v7 propertyForKey:@"PointPickerSelectionStyle"];
    id v10 = [v9 integerValue];

    id v11 = +[AXSettings sharedInstance];
    [v11 setSwitchControlPointPickerSelectionStyle:v10];

    [(SCATPointPickerSelectionStyleController *)self updateTableCheckedSelection:v6];
  }
}

- (double)valueForSpecifier:(id)a3
{
  v3 = [a3 propertyForKey:PSIDKey];
  unsigned int v4 = [v3 isEqualToString:@"AxisSweepTimeStepper"];

  double v5 = 0.0;
  if (v4)
  {
    id v6 = +[AXSettings sharedInstance];
    [v6 assistiveTouchAxisSweepSpeed];
    double v5 = (double)assistiveTouchXYScannerNormalizedUserPreferenceForSpeed();
  }
  return v5;
}

- (void)specifier:(id)a3 setValue:(double)a4
{
  unsigned int v4 = [a3 propertyForKey:PSIDKey];
  unsigned int v5 = [v4 isEqualToString:@"AxisSweepTimeStepper"];

  if (v5)
  {
    assistiveTouchXYScannerSpeedForNormalizedUserPreference();
    double v7 = v6;
    id v8 = +[AXSettings sharedInstance];
    [v8 setAssistiveTouchAxisSweepSpeed:v7];
  }
}

- (double)stepValueForSpecifier:(id)a3
{
  v3 = [a3 propertyForKey:PSIDKey];
  unsigned int v4 = [v3 isEqualToString:@"AxisSweepTimeStepper"];

  double result = 0.0;
  if (v4) {
    return 1.0;
  }
  return result;
}

- (double)minimumValueForSpecifier:(id)a3
{
  v3 = [a3 propertyForKey:PSIDKey];
  unsigned int v4 = [v3 isEqualToString:@"AxisSweepTimeStepper"];

  double result = (double)kAXSAssistiveTouchAxisSweepSpeedMinUserPreference;
  if (!v4) {
    return 0.0;
  }
  return result;
}

- (double)maximumValueForSpecifier:(id)a3
{
  v3 = [a3 propertyForKey:PSIDKey];
  unsigned int v4 = [v3 isEqualToString:@"AxisSweepTimeStepper"];

  double result = (double)kAXSAssistiveTouchAxisSweepSpeedMaxUserPreference;
  if (!v4) {
    return 0.0;
  }
  return result;
}

- (id)unitsStringForSpecifier:(id)a3
{
  return &stru_20F6B8;
}

- (int64_t)keyboardTypeForSpecifier:(id)a3
{
  return 4;
}

- (id)stringValueForSpecifier:(id)a3
{
  [(SCATPointPickerSelectionStyleController *)self valueForSpecifier:a3];
  v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  unsigned int v4 = AXFormatNumberWithOptions();

  return v4;
}

@end