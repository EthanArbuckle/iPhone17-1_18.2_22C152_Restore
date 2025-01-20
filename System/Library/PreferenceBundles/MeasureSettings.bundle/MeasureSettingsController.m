@interface MeasureSettingsController
+ (id)measureUnitsSpecifierID;
- (PSSystemPolicyForApp)policy;
- (id)measureSettingsSpecifiers;
- (id)specifierIDForValue:(id)a3;
- (id)specifiers;
- (void)configureUnitsRadioSelector;
- (void)emitNavigationEvent;
- (void)setAppPolicy;
- (void)setPolicy:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MeasureSettingsController

+ (id)measureUnitsSpecifierID
{
  return @"MEASURE_UNITS";
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)MeasureSettingsController;
  [(MeasureSettingsController *)&v5 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"MEASURE" value:&stru_41B8 table:@"Localizable"];
  [(MeasureSettingsController *)self setTitle:v4];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    [(MeasureSettingsController *)self setAppPolicy];
    uint64_t v5 = [(MeasureSettingsController *)self measureSettingsSpecifiers];
    v6 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    [(MeasureSettingsController *)self configureUnitsRadioSelector];
    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)setAppPolicy
{
  self->_policy = (PSSystemPolicyForApp *)[objc_alloc((Class)PSSystemPolicyForApp) initWithBundleIdentifier:@"com.apple.measure"];

  _objc_release_x1();
}

- (id)measureSettingsSpecifiers
{
  [(MeasureSettingsController *)self loadSpecifiersFromPlistName:@"MeasureSettings" target:self];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v8 = +[NSBundle bundleForClass:objc_opt_class()];
        v9 = [v7 name];
        v10 = [v8 localizedStringForKey:v9 value:&stru_41B8 table:@"Localizable"];
        id v11 = [v10 copy];
        [v7 setName:v11];
      }
      id v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
  v12 = [(PSSystemPolicyForApp *)self->_policy specifiersForPolicyOptions:42008576 force:0];
  v13 = [v12 arrayByAddingObjectsFromArray:obj];

  return v13;
}

- (void)configureUnitsRadioSelector
{
  id v3 = [(id)objc_opt_class() measureUnitsSpecifierID];
  id v4 = [(MeasureSettingsController *)self indexOfSpecifierID:v3];

  id v8 = [(MeasureSettingsController *)self specifierAtIndex:v4];
  +[SharedDefaults setupSpecifier:v8];
  uint64_t v5 = [(MeasureSettingsController *)self readPreferenceValue:v8];
  v6 = [(MeasureSettingsController *)self specifierIDForValue:v5];
  v7 = [(MeasureSettingsController *)self specifierForID:v6];
  [v8 setProperty:v7 forKey:PSRadioGroupCheckedSpecifierKey];
}

- (id)specifierIDForValue:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    if (sub_2B80()) {
      goto LABEL_3;
    }
LABEL_5:
    CFStringRef v5 = @"Imperial";
    goto LABEL_6;
  }
  if (![v3 integerValue]) {
    goto LABEL_5;
  }
LABEL_3:
  CFStringRef v5 = @"Metric";
LABEL_6:

  return (id)v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)MeasureSettingsController;
  id v6 = a4;
  [(MeasureSettingsController *)&v13 tableView:a3 didSelectRowAtIndexPath:v6];
  v7 = objc_msgSend((id)objc_opt_class(), "measureUnitsSpecifierID", v13.receiver, v13.super_class);
  id v8 = [(MeasureSettingsController *)self indexOfSpecifierID:v7];

  v9 = [(MeasureSettingsController *)self specifierAtIndex:v8];
  id v10 = [(MeasureSettingsController *)self indexForIndexPath:v6];

  id v11 = [(MeasureSettingsController *)self specifierAtIndex:v10];
  v12 = [v11 propertyForKey:PSValueKey];
  [(MeasureSettingsController *)self setPreferenceValue:v12 specifier:v9];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MeasureSettingsController;
  [(MeasureSettingsController *)&v4 viewDidAppear:a3];
  [(MeasureSettingsController *)self emitNavigationEvent];
}

- (void)emitNavigationEvent
{
  id v3 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.measure"];
  id v4 = objc_alloc((Class)_NSLocalizedStringResource);
  CFStringRef v5 = +[NSLocale currentLocale];
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 bundleURL];
  id v8 = [v4 initWithKey:@"MEASURE" table:@"Localizable" locale:v5 bundleURL:v7];

  id v9 = objc_alloc((Class)_NSLocalizedStringResource);
  id v10 = +[NSLocale currentLocale];
  id v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 bundleURL];
  id v13 = [v9 initWithKey:@"APPS" table:@"Localizable" locale:v10 bundleURL:v12];

  id v15 = v13;
  v14 = +[NSArray arrayWithObjects:&v15 count:1];
  [(MeasureSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.measure" title:v8 localizedNavigationComponents:v14 deepLink:v3];
}

- (PSSystemPolicyForApp)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end