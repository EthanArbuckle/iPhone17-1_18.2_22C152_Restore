@interface NSBSettingsController
- (id)specifiers;
- (void)_setSelectedMetric:(unint64_t)a3;
- (void)preferencesObservedUpdate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation NSBSettingsController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)NSBSettingsController;
  [(NSBSettingsController *)&v6 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"STOCKS_TITLE" value:&stru_8580 table:@"StocksBridgeSettings"];
  [(NSBSettingsController *)self setTitle:v4];

  v5 = +[StocksSyncComplicationPreferences sharedPreferences];
  [v5 addPreferencesObserver:self];
}

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v27 = OBJC_IVAR___PSListController__specifiers;
    v29 = +[NSMutableArray array];
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:@"CURRENT_PRICE" value:&stru_8580 table:@"StocksBridgeSettings"];

    objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"POINTS_CHANGE" value:&stru_8580 table:@"StocksBridgeSettings"];

    v8 = +[NSBundle bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"PERCENTAGE_CHANGE" value:&stru_8580 table:@"StocksBridgeSettings"];

    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"MARKET_CAP" value:&stru_8580 table:@"StocksBridgeSettings"];

    v28 = (void *)v5;
    v12 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:3 edit:0];
    v32[0] = v12;
    v13 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:3 edit:0];
    v32[1] = v13;
    v14 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:3 edit:0];
    v32[2] = v14;
    v15 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];
    v32[3] = v15;
    v16 = +[NSArray arrayWithObjects:v32 count:4];

    v17 = +[StocksSyncComplicationPreferences sharedPreferences];
    id v18 = [v17 complicationDisplayMode];

    v19 = stocks_bridge_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v31 = v18;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Selected complication metric: %lu.", buf, 0xCu);
    }

    v20 = [v16 objectAtIndexedSubscript:v18];
    v21 = +[NSBundle bundleForClass:objc_opt_class()];
    v22 = [v21 localizedStringForKey:@"COMPLICATION_SHOWS" value:&stru_8580 table:@"StocksBridgeSettings"];

    v23 = +[PSSpecifier groupSpecifierWithName:v22];
    [v23 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    [v23 setProperty:v20 forKey:PSRadioGroupCheckedSpecifierKey];

    [v29 addObject:v23];
    [v29 addObjectsFromArray:v16];
    id v24 = [v29 copy];
    v25 = *(void **)&self->PSListController_opaque[v27];
    *(void *)&self->PSListController_opaque[v27] = v24;

    v3 = *(void **)&self->PSListController_opaque[v27];
  }

  return v3;
}

- (void)_setSelectedMetric:(unint64_t)a3
{
  v4 = stocks_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    unint64_t v7 = a3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Selecting complication metric: %lu.", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = +[StocksSyncComplicationPreferences sharedPreferences];
  [v5 setComplicationDisplayMode:a3];

  +[StocksSyncAppLauncher launchPhoneApp];
}

- (void)preferencesObservedUpdate:(id)a3
{
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = 0;

  [(NSBSettingsController *)self reloadSpecifiers];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NSBSettingsController;
  [(NSBSettingsController *)&v11 tableView:a3 didSelectRowAtIndexPath:v6];
  if (![v6 section])
  {
    unint64_t v7 = [(NSBSettingsController *)self indexForIndexPath:v6];
    v8 = +[NSBundle bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"CURRENT_PRICE" value:&stru_8580 table:@"StocksBridgeSettings"];

    v10 = [(NSBSettingsController *)self indexOfSpecifierID:v9];
    if (v7 >= v10) {
      [(NSBSettingsController *)self _setSelectedMetric:v7 - v10];
    }
  }
}

@end