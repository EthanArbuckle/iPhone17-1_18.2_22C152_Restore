@interface CallRecordingSettingsViewController
+ (id)localizationTableName;
+ (id)localizedStringForKey:(id)a3;
- (CallRecordingSettingsViewController)init;
- (PSListController)parentListController;
- (PSSpecifier)activeSpecifier;
- (TUConfigurationProvider)configurationProvider;
- (id)getBooleanFromUserDefaults:(id)a3 default:(id)a4;
- (id)getCallRecordingEnabled:(id)a3;
- (id)specifiers;
- (void)configurationChanged;
- (void)emitNavigationEvent;
- (void)setActiveSpecifier:(id)a3;
- (void)setCallRecordingEnabled:(id)a3 specifier:(id)a4;
- (void)setValueInUserDefaults:(id)a3 forKey:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CallRecordingSettingsViewController

- (CallRecordingSettingsViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CallRecordingSettingsViewController;
  v2 = [(CallRecordingSettingsViewController *)&v6 init];
  if (v2)
  {
    v3 = (TUConfigurationProvider *)objc_alloc_init((Class)TUConfigurationProvider);
    configurationProvider = v2->_configurationProvider;
    v2->_configurationProvider = v3;

    [(TUConfigurationProvider *)v2->_configurationProvider setDelegate:v2];
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CallRecordingSettingsViewController;
  [(CallRecordingSettingsViewController *)&v4 viewDidAppear:a3];
  [(CallRecordingSettingsViewController *)self emitNavigationEvent];
}

- (void)emitNavigationEvent
{
  uint64_t v3 = TUBundleIdentifierPhoneApplication;
  v21 = +[NSString stringWithFormat:@"settings-navigation://com.apple.Settings.Apps/%@/%@", TUBundleIdentifierPhoneApplication, @"CALL_RECORDING"];
  v20 = +[NSURL URLWithString:v21];
  id v4 = objc_alloc((Class)_NSLocalizedStringResource);
  v5 = +[NSLocale currentLocale];
  objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 bundleURL];
  id v8 = [v4 initWithKey:@"Call Recording" table:0 locale:v5 bundleURL:v7];

  id v9 = objc_alloc((Class)_NSLocalizedStringResource);
  v10 = +[NSLocale currentLocale];
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
  [(CallRecordingSettingsViewController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:v3 title:v8 localizedNavigationComponents:v19 deepLink:v20];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(CallRecordingSettingsViewController *)self loadSpecifiersFromPlistName:@"CallRecordingSettings" target:self];
    objc_super v6 = +[PSSpecifier groupSpecifierWithID:@"CallRecordingSettingsGroup" name:&stru_8430];
    v7 = objc_alloc_init(_TtC27CallRecordingSettingsBundle34GenerativeModelAvailabilityControl);
    if ([(GenerativeModelAvailabilityControl *)v7 getAvailability]
      || (TUCallTranscriptionSupported() & 1) == 0)
    {
      if (TUCallTranscriptionSupported()) {
        CFStringRef v8 = @"CALL_RECORDING_EXPLANATION_WITH_TRANSCRIPTION";
      }
      else {
        CFStringRef v8 = @"CALL_RECORDING_EXPLANATION";
      }
    }
    else
    {
      CFStringRef v8 = @"CALL_RECORDING_EXPLANATION_WITH_TRANSCRIPTION_AND_SUMMARIZATION";
    }
    id v9 = +[CallRecordingSettingsViewController localizedStringForKey:v8];
    [v6 setProperty:v9 forKey:PSFooterTextGroupKey];

    if (v6)
    {
      [v5 addObject:v6];
      v10 = +[CallRecordingSettingsViewController localizedStringForKey:@"CALL_RECORDING_TOGGLE_TITLE"];
      v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:"setCallRecordingEnabled:specifier:" get:"getCallRecordingEnabled:" detail:0 cell:6 edit:0];
      if (v11) {
        [v5 addObject:v11];
      }
    }
    id v12 = [v5 copy];
    id v13 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v12;

    id v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

+ (id)localizationTableName
{
  return @"CallRecordingSettings";
}

+ (id)localizedStringForKey:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v6 = [a1 localizationTableName];
  v7 = [v5 localizedStringForKey:v4 value:&stru_8430 table:v6];

  return v7;
}

- (id)getCallRecordingEnabled:(id)a3
{
  uint64_t v3 = [(CallRecordingSettingsViewController *)self getBooleanFromUserDefaults:TUCallRecordingDisabledKey default:&off_85A8];
  id v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 BOOLValue] ^ 1);

  return v4;
}

- (void)setCallRecordingEnabled:(id)a3 specifier:(id)a4
{
  v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a3 BOOLValue] ^ 1);
  [(CallRecordingSettingsViewController *)self setValueInUserDefaults:v5 forKey:TUCallRecordingDisabledKey];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"CallRecordingSettingsChangedNotification" object:0];
}

- (id)getBooleanFromUserDefaults:(id)a3 default:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)NSUserDefaults);
  id v8 = [v7 initWithSuiteName:TUBundleIdentifierTelephonyUtilitiesFramework];
  id v9 = [v8 objectForKey:v6];

  if (v9) {
    v10 = v9;
  }
  else {
    v10 = v5;
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
  [v9 postNotificationName:@"CallRecordingSettingsChangedNotification" object:0];
}

- (void)configurationChanged
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"CallRecordingSettingsChangedNotification" object:0];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationProvider, 0);
  objc_destroyWeak((id *)&self->_parentListController);

  objc_storeStrong((id *)&self->_activeSpecifier, 0);
}

@end