@interface SilenceCallsSettingsBundleController
- (PSListController)parentListController;
- (PSSpecifier)activeSpecifier;
- (SilenceCallsSettingsBundleController)initWithParentListController:(id)a3;
- (TUConfigurationProvider)configurationProvider;
- (TUFeatureFlags)tuFeatureFlags;
- (id)getBooleanFromUserDefaults:(id)a3 default:(id)a4;
- (id)getSilenceLabel:(id)a3;
- (id)getSilenceUnknownCallersEnabled;
- (id)localizationTableName;
- (id)localizedStringForKey:(id)a3;
- (id)specifiersWithSpecifier:(id)a3;
- (void)configurationChanged;
- (void)handleSettingDidChangeNotification:(id)a3;
- (void)refreshView;
- (void)setActiveSpecifier:(id)a3;
@end

@implementation SilenceCallsSettingsBundleController

- (SilenceCallsSettingsBundleController)initWithParentListController:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SilenceCallsSettingsBundleController;
  v3 = [(SilenceCallsSettingsBundleController *)&v10 initWithParentListController:a3];
  if (v3)
  {
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"handleSettingDidChangeNotification:" name:@"SilenceCallsSettingsChangedNotification" object:0];

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
  v5 = [(SilenceCallsSettingsBundleController *)self activeSpecifier];

  if (!v5)
  {
    v6 = [(SilenceCallsSettingsBundleController *)self localizedStringForKey:@"SILENCE_CALLS_TOGGLE_TITLE"];
    v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:"getSilenceLabel:" detail:objc_opt_class() cell:2 edit:0];

    if (v7)
    {
      [v7 setIdentifier:@"SILENCE_CALLS"];
      [v4 addObject:v7];
    }
    [(SilenceCallsSettingsBundleController *)self setActiveSpecifier:v7];
  }
  id v8 = [v4 copy];

  return v8;
}

- (id)localizationTableName
{
  return @"SilenceCallsSettingsBundle";
}

- (id)localizedStringForKey:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [(SilenceCallsSettingsBundleController *)self localizationTableName];
  v7 = [v5 localizedStringForKey:v4 value:&stru_83A8 table:v6];

  return v7;
}

- (PSListController)parentListController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSBundleController_opaque[OBJC_IVAR___PSBundleController__parent]);

  return (PSListController *)WeakRetained;
}

- (void)refreshView
{
  id v4 = [(SilenceCallsSettingsBundleController *)self parentListController];
  v3 = [(SilenceCallsSettingsBundleController *)self activeSpecifier];
  [v4 reloadSpecifier:v3];
}

- (void)handleSettingDidChangeNotification:(id)a3
{
}

- (id)getSilenceLabel:(id)a3
{
  id v4 = [(SilenceCallsSettingsBundleController *)self getSilenceUnknownCallersEnabled];
  if ([v4 BOOLValue]) {
    CFStringRef v5 = @"SILENCE_CALLS_ON";
  }
  else {
    CFStringRef v5 = @"SILENCE_CALLS_OFF";
  }
  v6 = [(SilenceCallsSettingsBundleController *)self localizedStringForKey:v5];

  return v6;
}

- (id)getSilenceUnknownCallersEnabled
{
  v3 = [(SilenceCallsSettingsBundleController *)self activeSpecifier];
  id v4 = [v3 target];
  CFStringRef v5 = [v4 parentListController];
  v6 = [v5 specifierID];
  unsigned int v7 = [v6 isEqualToString:@"com.apple.preferences.facetime"];

  id v8 = [(SilenceCallsSettingsBundleController *)self tuFeatureFlags];
  unsigned int v9 = [v8 deviceExpertMigrationEnabled];

  if (v7)
  {
    if (!v9)
    {
      uint64_t v13 = TUCallFilteringPreferencesSilenceUnknownFaceTimeCallersKey;
      objc_super v10 = +[NSNumber numberWithBool:TUSilenceUnknownFaceTimeCallersDefaultValue()];
      uint64_t v12 = [(SilenceCallsSettingsBundleController *)self getBooleanFromUserDefaults:v13 default:v10];
      goto LABEL_8;
    }
    objc_super v10 = [(SilenceCallsSettingsBundleController *)self configurationProvider];
    id v11 = [v10 isSilenceUnknownCallersEnabledForFaceTime];
LABEL_6:
    uint64_t v12 = +[NSNumber numberWithBool:v11];
LABEL_8:
    v14 = (void *)v12;

    goto LABEL_10;
  }
  if (v9)
  {
    objc_super v10 = [(SilenceCallsSettingsBundleController *)self configurationProvider];
    id v11 = [v10 isSilenceUnknownCallersEnabledForPhone];
    goto LABEL_6;
  }
  v14 = [(SilenceCallsSettingsBundleController *)self getBooleanFromUserDefaults:TUCallFilteringPreferencesContactsOnlyKey default:&off_85D8];
LABEL_10:

  return v14;
}

- (id)getBooleanFromUserDefaults:(id)a3 default:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)NSUserDefaults);
  id v8 = [v7 initWithSuiteName:TUBundleIdentifierTelephonyUtilitiesFramework];
  unsigned int v9 = [v8 objectForKey:v6];

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