@interface TUCallScreeningSettingsBundleController
+ (id)localizationTableName;
+ (id)localizedStringForKey:(id)a3;
- (PSListController)parentListController;
- (PSSpecifier)activeSpecifier;
- (TUCallScreeningSettingsBundleController)initWithParentListController:(id)a3;
- (TUConfigurationProvider)configurationProvider;
- (TUFeatureFlags)tuFeatureFlags;
- (id)getBooleanFromUserDefaults:(id)a3 default:(id)a4;
- (id)getCallScreeningEnabled;
- (id)getCallScreeningLabel:(id)a3;
- (id)specifiersWithSpecifier:(id)a3;
- (void)configurationChanged;
- (void)handleSettingDidChangeNotification:(id)a3;
- (void)refreshView;
- (void)setActiveSpecifier:(id)a3;
@end

@implementation TUCallScreeningSettingsBundleController

- (TUCallScreeningSettingsBundleController)initWithParentListController:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TUCallScreeningSettingsBundleController;
  v3 = [(TUCallScreeningSettingsBundleController *)&v10 initWithParentListController:a3];
  if (v3)
  {
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"handleSettingDidChangeNotification:" name:@"TUCallScreeningSettingsChangedNotification" object:0];

    v5 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    tuFeatureFlags = v3->_tuFeatureFlags;
    v3->_tuFeatureFlags = v5;

    if ([(TUFeatureFlags *)v3->_tuFeatureFlags deviceExpertMigrationEnabled])
    {
      v7 = (TUConfigurationProvider *)objc_alloc_init((Class)TUConfigurationProvider);
      configurationProvider = v3->_configurationProvider;
      v3->_configurationProvider = v7;

      [(TUConfigurationProvider *)v3->_configurationProvider setDelegate:v3];
    }
  }
  return v3;
}

- (id)specifiersWithSpecifier:(id)a3
{
  v4 = +[NSMutableArray array];
  v5 = [(TUCallScreeningSettingsBundleController *)self tuFeatureFlags];
  if ([v5 deviceExpertMigrationEnabled])
  {
    v6 = [(TUCallScreeningSettingsBundleController *)self configurationProvider];
    unsigned __int8 v7 = [v6 isCallScreeningAvailable];

    if ((v7 & 1) == 0) {
      goto LABEL_9;
    }
  }
  else
  {
    int v8 = TUCallScreeningActivatable();

    if (!v8) {
      goto LABEL_9;
    }
  }
  v9 = [(TUCallScreeningSettingsBundleController *)self activeSpecifier];

  if (!v9)
  {
    objc_super v10 = +[TUCallScreeningSettingsBundleController localizedStringForKey:@"CALL_SCREENING_TOGGLE_TITLE"];
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:"getCallScreeningLabel:" detail:objc_opt_class() cell:2 edit:0];
    v12 = v11;
    if (v11)
    {
      [v11 setIdentifier:@"CALL_SCREENING"];
      [v4 addObject:v12];
    }
    [(TUCallScreeningSettingsBundleController *)self setActiveSpecifier:v12];
  }
LABEL_9:
  id v13 = [v4 copy];

  return v13;
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
  unsigned __int8 v7 = [v5 localizedStringForKey:v4 value:&stru_85E8 table:v6];

  return v7;
}

- (PSListController)parentListController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSBundleController_opaque[OBJC_IVAR___PSBundleController__parent]);

  return (PSListController *)WeakRetained;
}

- (void)refreshView
{
  id v4 = [(TUCallScreeningSettingsBundleController *)self parentListController];
  v3 = [(TUCallScreeningSettingsBundleController *)self activeSpecifier];
  [v4 reloadSpecifier:v3];
}

- (void)handleSettingDidChangeNotification:(id)a3
{
}

- (id)getCallScreeningLabel:(id)a3
{
  v3 = [(TUCallScreeningSettingsBundleController *)self getCallScreeningEnabled];
  if ([v3 BOOLValue]) {
    CFStringRef v4 = @"CALL_SCREENING_ON";
  }
  else {
    CFStringRef v4 = @"CALL_SCREENING_OFF";
  }
  v5 = +[TUCallScreeningSettingsBundleController localizedStringForKey:v4];

  return v5;
}

- (id)getCallScreeningEnabled
{
  v3 = [(TUCallScreeningSettingsBundleController *)self tuFeatureFlags];
  unsigned int v4 = [v3 deviceExpertMigrationEnabled];

  if (v4)
  {
    v5 = [(TUCallScreeningSettingsBundleController *)self configurationProvider];
    +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isCallScreeningEnabled]);
  }
  else
  {
    v5 = [(TUCallScreeningSettingsBundleController *)self getBooleanFromUserDefaults:TUCallScreeningDisabledKey default:&off_8708];
    +[NSNumber numberWithInt:v5 == 0];
  v6 = };

  return v6;
}

- (id)getBooleanFromUserDefaults:(id)a3 default:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)NSUserDefaults);
  id v8 = [v7 initWithSuiteName:TUBundleIdentifierTelephonyUtilitiesFramework];
  v9 = [v8 objectForKey:v6];

  if (v9) {
    objc_super v10 = v9;
  }
  else {
    objc_super v10 = v5;
  }
  id v11 = v10;

  return v11;
}

- (void)configurationChanged
{
}

- (PSSpecifier)activeSpecifier
{
  return self->_activeSpecifier;
}

- (void)setActiveSpecifier:(id)a3
{
}

- (TUConfigurationProvider)configurationProvider
{
  return self->_configurationProvider;
}

- (TUFeatureFlags)tuFeatureFlags
{
  return self->_tuFeatureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuFeatureFlags, 0);
  objc_storeStrong((id *)&self->_configurationProvider, 0);

  objc_storeStrong((id *)&self->_activeSpecifier, 0);
}

@end