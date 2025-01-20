@interface TUCallScreeningSettingsViewController
+ (id)localizationTableName;
+ (id)localizedStringForKey:(id)a3;
- (PSListController)parentListController;
- (PSSpecifier)activeSpecifier;
- (TUCallScreeningSettingsViewController)init;
- (TUConfigurationProvider)configurationProvider;
- (TUFeatureFlags)tuFeatureFlags;
- (_TtC27CallScreeningSettingsBundle32TUCallScreeningAnalyticsReporter)analyticsReporter;
- (id)getBooleanFromUserDefaults:(id)a3 default:(id)a4;
- (id)getCallScreeningEnabled:(id)a3;
- (id)specifiers;
- (void)configurationChanged;
- (void)emitNavigationEvent;
- (void)setActiveSpecifier:(id)a3;
- (void)setCallScreeningEnabled:(id)a3 specifier:(id)a4;
- (void)setValueInUserDefaults:(id)a3 forKey:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation TUCallScreeningSettingsViewController

- (TUCallScreeningSettingsViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)TUCallScreeningSettingsViewController;
  v2 = [(TUCallScreeningSettingsViewController *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC27CallScreeningSettingsBundle32TUCallScreeningAnalyticsReporter);
    analyticsReporter = v2->_analyticsReporter;
    v2->_analyticsReporter = v3;

    v5 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    tuFeatureFlags = v2->_tuFeatureFlags;
    v2->_tuFeatureFlags = v5;

    if ([(TUFeatureFlags *)v2->_tuFeatureFlags deviceExpertMigrationEnabled])
    {
      v7 = (TUConfigurationProvider *)objc_alloc_init((Class)TUConfigurationProvider);
      configurationProvider = v2->_configurationProvider;
      v2->_configurationProvider = v7;

      [(TUConfigurationProvider *)v2->_configurationProvider setDelegate:v2];
    }
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TUCallScreeningSettingsViewController;
  [(TUCallScreeningSettingsViewController *)&v7 viewDidAppear:a3];
  v4 = [(TUCallScreeningSettingsViewController *)self specifier];
  v5 = [v4 target];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(TUCallScreeningSettingsViewController *)self emitNavigationEvent];
  }
}

- (void)emitNavigationEvent
{
  uint64_t v3 = TUBundleIdentifierPhoneApplication;
  v21 = +[NSString stringWithFormat:@"settings-navigation://com.apple.Settings.Apps/%@/%@", TUBundleIdentifierPhoneApplication, @"CALL_SCREENING"];
  v20 = +[NSURL URLWithString:v21];
  id v4 = objc_alloc((Class)_NSLocalizedStringResource);
  v5 = +[NSLocale currentLocale];
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v7 = [v6 bundleURL];
  id v8 = [v4 initWithKey:@"Live Voicemail" table:0 locale:v5 bundleURL:v7];

  id v9 = objc_alloc((Class)_NSLocalizedStringResource);
  objc_super v10 = +[NSLocale currentLocale];
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 bundleURL];
  id v13 = [v9 initWithKey:@"Apps" table:0 locale:v10 bundleURL:v12];

  id v14 = objc_alloc((Class)_NSLocalizedStringResource);
  v15 = +[NSLocale currentLocale];
  v16 = +[NSBundle bundleForClass:objc_opt_class()];
  v17 = [v16 bundleURL];
  id v18 = [v14 initWithKey:@"Phone" table:0 locale:v15 bundleURL:v17];

  v22[0] = v13;
  v22[1] = v18;
  v19 = +[NSArray arrayWithObjects:v22 count:2];
  [(TUCallScreeningSettingsViewController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:v3 title:v8 localizedNavigationComponents:v19 deepLink:v20];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(TUCallScreeningSettingsViewController *)self loadSpecifiersFromPlistName:@"CallScreeningSettings" target:self];
    v6 = +[PSSpecifier groupSpecifierWithID:@"CallScreeningSettingsGroup" name:&stru_85E8];
    objc_super v7 = +[TUCallScreeningSettingsViewController localizedStringForKey:@"CALL_SCREENING_EXPLANATION"];
    [v6 setProperty:v7 forKey:PSFooterTextGroupKey];

    if (v6)
    {
      [v5 addObject:v6];
      id v8 = +[TUCallScreeningSettingsViewController localizedStringForKey:@"CALL_SCREENING_TOGGLE_TITLE"];
      id v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:"setCallScreeningEnabled:specifier:" get:"getCallScreeningEnabled:" detail:0 cell:6 edit:0];
      if (v9) {
        [v5 addObject:v9];
      }
    }
    id v10 = [v5 copy];
    v11 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v10;

    id v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

+ (id)localizationTableName
{
  return @"CallScreeningSettings";
}

+ (id)localizedStringForKey:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [a1 localizationTableName];
  objc_super v7 = [v5 localizedStringForKey:v4 value:&stru_85E8 table:v6];

  return v7;
}

- (id)getCallScreeningEnabled:(id)a3
{
  id v4 = [(TUCallScreeningSettingsViewController *)self tuFeatureFlags];
  unsigned int v5 = [v4 deviceExpertMigrationEnabled];

  if (v5)
  {
    v6 = [(TUCallScreeningSettingsViewController *)self configurationProvider];
    +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isCallScreeningEnabled]);
  }
  else
  {
    v6 = [(TUCallScreeningSettingsViewController *)self getBooleanFromUserDefaults:TUCallScreeningDisabledKey default:&off_8720];
    +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 BOOLValue] ^ 1);
  objc_super v7 = };

  return v7;
}

- (void)setCallScreeningEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  v6 = [(TUCallScreeningSettingsViewController *)self analyticsReporter];
  objc_msgSend(v6, "logLiveVoiceMailToggleWithToggledTo:", objc_msgSend(v5, "BOOLValue"));

  objc_super v7 = [(TUCallScreeningSettingsViewController *)self tuFeatureFlags];
  unsigned int v8 = [v7 deviceExpertMigrationEnabled];

  if (v8)
  {
    id v9 = [v5 BOOLValue];

    id v12 = [(TUCallScreeningSettingsViewController *)self configurationProvider];
    [v12 setCallScreeningEnabled:v9];
  }
  else
  {
    unsigned int v10 = [v5 BOOLValue];

    v11 = +[NSNumber numberWithInt:v10 ^ 1];
    [(TUCallScreeningSettingsViewController *)self setValueInUserDefaults:v11 forKey:TUCallScreeningDisabledKey];

    id v12 = +[NSNotificationCenter defaultCenter];
    [v12 postNotificationName:@"TUCallScreeningSettingsChangedNotification" object:0];
  }
}

- (id)getBooleanFromUserDefaults:(id)a3 default:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)NSUserDefaults);
  id v8 = [v7 initWithSuiteName:TUBundleIdentifierTelephonyUtilitiesFramework];
  id v9 = [v8 objectForKey:v6];

  if (v9) {
    unsigned int v10 = v9;
  }
  else {
    unsigned int v10 = v5;
  }
  id v11 = v10;

  return v11;
}

- (void)setValueInUserDefaults:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)NSUserDefaults);
  id v8 = [v7 initWithSuiteName:TUBundleIdentifierTelephonyUtilitiesFramework];
  [v8 setValue:v6 forKey:v5];

  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 postNotificationName:@"TUCallScreeningSettingsChangedNotification" object:0];
}

- (void)configurationChanged
{
  [(TUCallScreeningSettingsViewController *)self reloadSpecifiers];
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"TUCallScreeningSettingsChangedNotification" object:0];
}

- (PSSpecifier)activeSpecifier
{
  return self->_activeSpecifier;
}

- (void)setActiveSpecifier:(id)a3
{
}

- (PSListController)parentListController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentListController);

  return (PSListController *)WeakRetained;
}

- (TUConfigurationProvider)configurationProvider
{
  return self->_configurationProvider;
}

- (TUFeatureFlags)tuFeatureFlags
{
  return self->_tuFeatureFlags;
}

- (_TtC27CallScreeningSettingsBundle32TUCallScreeningAnalyticsReporter)analyticsReporter
{
  return self->_analyticsReporter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_tuFeatureFlags, 0);
  objc_storeStrong((id *)&self->_configurationProvider, 0);
  objc_destroyWeak((id *)&self->_parentListController);

  objc_storeStrong((id *)&self->_activeSpecifier, 0);
}

@end