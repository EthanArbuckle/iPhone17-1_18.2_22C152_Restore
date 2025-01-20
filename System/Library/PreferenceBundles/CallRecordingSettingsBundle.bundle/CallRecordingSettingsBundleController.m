@interface CallRecordingSettingsBundleController
+ (id)localizationTableName;
+ (id)localizedStringForKey:(id)a3;
- (CallRecordingSettingsBundleController)initWithParentListController:(id)a3;
- (PSListController)parentListController;
- (PSSpecifier)activeSpecifier;
- (TUConfigurationProvider)configurationProvider;
- (id)getBooleanFromUserDefaults:(id)a3 default:(id)a4;
- (id)getCallRecordingLabel:(id)a3;
- (id)specifiersWithSpecifier:(id)a3;
- (void)handleSettingDidChangeNotification:(id)a3;
- (void)setActiveSpecifier:(id)a3;
@end

@implementation CallRecordingSettingsBundleController

- (CallRecordingSettingsBundleController)initWithParentListController:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CallRecordingSettingsBundleController;
  v3 = [(CallRecordingSettingsBundleController *)&v8 initWithParentListController:a3];
  if (v3)
  {
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"handleSettingDidChangeNotification:" name:@"CallRecordingSettingsChangedNotification" object:0];

    v5 = (TUConfigurationProvider *)objc_alloc_init((Class)TUConfigurationProvider);
    configurationProvider = v3->_configurationProvider;
    v3->_configurationProvider = v5;
  }
  return v3;
}

- (id)specifiersWithSpecifier:(id)a3
{
  v4 = +[NSMutableArray array];
  v5 = [(CallRecordingSettingsBundleController *)self configurationProvider];
  unsigned int v6 = [v5 isCallRecordingAvailable];

  if (v6)
  {
    v7 = [(CallRecordingSettingsBundleController *)self activeSpecifier];

    if (!v7)
    {
      objc_super v8 = +[CallRecordingSettingsBundleController localizedStringForKey:@"CALL_RECORDING_TOGGLE_TITLE"];
      v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:"getCallRecordingLabel:" detail:objc_opt_class() cell:2 edit:0];
      v10 = v9;
      if (v9)
      {
        [v9 setIdentifier:@"CALL_RECORDING"];
        [v4 addObject:v10];
      }
      [(CallRecordingSettingsBundleController *)self setActiveSpecifier:v10];
    }
  }
  id v11 = [v4 copy];

  return v11;
}

+ (id)localizationTableName
{
  return @"CallRecordingSettings";
}

+ (id)localizedStringForKey:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v6 = [a1 localizationTableName];
  v7 = [v5 localizedStringForKey:v4 value:&stru_8430 table:v6];

  return v7;
}

- (PSListController)parentListController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSBundleController_opaque[OBJC_IVAR___PSBundleController__parent]);

  return (PSListController *)WeakRetained;
}

- (void)handleSettingDidChangeNotification:(id)a3
{
  id v5 = [(CallRecordingSettingsBundleController *)self parentListController];
  id v4 = [(CallRecordingSettingsBundleController *)self activeSpecifier];
  [v5 reloadSpecifier:v4];
}

- (id)getCallRecordingLabel:(id)a3
{
  v3 = [(CallRecordingSettingsBundleController *)self getBooleanFromUserDefaults:TUCallRecordingDisabledKey default:&off_8590];
  if ([v3 BOOLValue]) {
    CFStringRef v4 = @"CALL_RECORDING_OFF";
  }
  else {
    CFStringRef v4 = @"CALL_RECORDING_ON";
  }
  id v5 = +[CallRecordingSettingsBundleController localizedStringForKey:v4];

  return v5;
}

- (id)getBooleanFromUserDefaults:(id)a3 default:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)NSUserDefaults);
  id v8 = [v7 initWithSuiteName:TUBundleIdentifierTelephonyUtilitiesFramework];
  v9 = [v8 objectForKey:v6];

  if (v9) {
    v10 = v9;
  }
  else {
    v10 = v5;
  }
  id v11 = v10;

  return v11;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationProvider, 0);

  objc_storeStrong((id *)&self->_activeSpecifier, 0);
}

@end