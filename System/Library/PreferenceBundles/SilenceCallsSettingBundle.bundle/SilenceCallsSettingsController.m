@interface SilenceCallsSettingsController
- (BOOL)supportsCallBlockingForSubscriptionContext:(id)a3;
- (OS_dispatch_queue)queue;
- (PSListController)parentListController;
- (PSSpecifier)activeSpecifier;
- (SilenceCallsSettingsController)init;
- (TPSCarrierBundleController)carrierBundleController;
- (TUConfigurationProvider)configurationProvider;
- (TUFeatureFlags)tuFeatureFlags;
- (id)getBooleanFromUserDefaults:(id)a3 default:(id)a4;
- (id)getOnlyAllowContacts:(id)a3;
- (id)informationalUrlForSubscriptionContext:(id)a3;
- (id)localizationTableName;
- (id)localizedStringForKey:(id)a3;
- (id)objectForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5;
- (id)specifiers;
- (id)stringForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5;
- (void)carrierBundleController:(id)a3 carrierBundleDidChangeForSubscriptionContext:(id)a4;
- (void)configurationChanged;
- (void)emitNavigationEvent;
- (void)setActiveSpecifier:(id)a3;
- (void)setOnlyAllowContacts:(id)a3 specifier:(id)a4;
- (void)setValueInUserDefaults:(id)a3 forKey:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SilenceCallsSettingsController

- (SilenceCallsSettingsController)init
{
  v8.receiver = self;
  v8.super_class = (Class)SilenceCallsSettingsController;
  v2 = [(SilenceCallsSettingsController *)&v8 init];
  if (v2)
  {
    v3 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    tuFeatureFlags = v2->_tuFeatureFlags;
    v2->_tuFeatureFlags = v3;

    if ([(TUFeatureFlags *)v2->_tuFeatureFlags deviceExpertMigrationEnabled])
    {
      v5 = (TUConfigurationProvider *)objc_alloc_init((Class)TUConfigurationProvider);
      configurationProvider = v2->_configurationProvider;
      v2->_configurationProvider = v5;

      [(TUConfigurationProvider *)v2->_configurationProvider setDelegate:v2];
    }
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SilenceCallsSettingsController;
  [(SilenceCallsSettingsController *)&v7 viewDidAppear:a3];
  v4 = [(SilenceCallsSettingsController *)self specifier];
  v5 = [v4 target];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(SilenceCallsSettingsController *)self emitNavigationEvent];
  }
}

- (void)emitNavigationEvent
{
  v3 = [(SilenceCallsSettingsController *)self specifier];
  v4 = [v3 target];
  v5 = [v4 parentListController];
  v6 = [v5 specifierID];

  id v7 = objc_alloc((Class)_NSLocalizedStringResource);
  objc_super v8 = +[NSLocale currentLocale];
  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 bundleURL];
  id v11 = [v7 initWithKey:@"Apps" table:0 locale:v8 bundleURL:v10];

  id v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v11, 0);
  if ([v6 isEqualToString:@"com.apple.preferences.facetime"])
  {
    id v26 = TUBundleIdentifierFaceTimeApplication;
    id v13 = objc_alloc((Class)_NSLocalizedStringResource);
    v14 = +[NSLocale currentLocale];
    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    v16 = [v15 bundleURL];
    CFStringRef v17 = @"FaceTime";
  }
  else
  {
    id v26 = TUBundleIdentifierPhoneApplication;
    id v13 = objc_alloc((Class)_NSLocalizedStringResource);
    v14 = +[NSLocale currentLocale];
    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    v16 = [v15 bundleURL];
    CFStringRef v17 = @"Phone";
  }
  id v18 = [v13 initWithKey:v17 table:0 locale:v14 bundleURL:v16];
  [v12 addObject:v18];

  v19 = +[NSString stringWithFormat:@"settings-navigation://com.apple.Settings.Apps/%@/%@", v26, @"SILENCE_CALLS"];
  v20 = +[NSURL URLWithString:v19];
  id v21 = objc_alloc((Class)_NSLocalizedStringResource);
  v22 = +[NSLocale currentLocale];
  v23 = +[NSBundle bundleForClass:objc_opt_class()];
  v24 = [v23 bundleURL];
  id v25 = [v21 initWithKey:@"Silence Unknown Callers" table:0 locale:v22 bundleURL:v24];

  [(SilenceCallsSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:v26 title:v25 localizedNavigationComponents:v12 deepLink:v20];
}

- (BOOL)supportsCallBlockingForSubscriptionContext:(id)a3
{
  id v4 = a3;
  id v12 = 0;
  v5 = [(SilenceCallsSettingsController *)self stringForKeyHierarchy:&off_8638 subscriptionContext:v4 error:&v12];
  id v6 = v12;
  id v7 = v6;
  if (v5)
  {
    objc_super v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v4;
      v9 = "Retrieved call blocking value '%@' for subscription %@";
LABEL_7:
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0x16u);
    }
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    objc_super v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v7;
      v9 = "Retrieving call blocking value for subscription %@ failed with error %@";
      goto LABEL_7;
    }
  }

LABEL_9:
  if ([v5 isEqualToIgnoringCase:@"Enabled"]) {
    unsigned __int8 v10 = 1;
  }
  else {
    unsigned __int8 v10 = [v5 isEqualToIgnoringCase:@"Dynamic"];
  }

  return v10;
}

- (id)informationalUrlForSubscriptionContext:(id)a3
{
  id v4 = a3;
  id v11 = 0;
  v5 = [(SilenceCallsSettingsController *)self stringForKeyHierarchy:&off_8650 subscriptionContext:v4 error:&v11];
  id v6 = v11;
  id v7 = v6;
  if (v5)
  {
    objc_super v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v4;
      v9 = "Retrieved informational url value '%@' for subscription %@";
LABEL_7:
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0x16u);
    }
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    objc_super v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      id v15 = v7;
      v9 = "Retrieving informational url value for subscription %@ failed with error %@";
      goto LABEL_7;
    }
  }

LABEL_9:

  return v5;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = (TPSCarrierBundleController *)objc_alloc_init((Class)TPSCarrierBundleController);
    carrierBundleController = self->_carrierBundleController;
    self->_carrierBundleController = v5;

    [(TPSCarrierBundleController *)self->_carrierBundleController addDelegate:self queue:self->_queue];
    id v7 = [(SilenceCallsSettingsController *)self loadSpecifiersFromPlistName:@"SilenceCallsSettings" target:self];
    objc_super v8 = +[PSSpecifier groupSpecifierWithID:@"SpamEnabledSettingsGroup" name:&stru_83A8];
    v9 = [(SilenceCallsSettingsController *)self localizedStringForKey:@"CALL_SILENCING_EXPLANATION"];
    [v8 setProperty:v9 forKey:PSFooterTextGroupKey];

    [v7 addObject:v8];
    unsigned __int8 v10 = [(SilenceCallsSettingsController *)self localizedStringForKey:@"SILENCE_CALLS_TOGGLE_TITLE"];
    id v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:"setOnlyAllowContacts:specifier:" get:"getOnlyAllowContacts:" detail:0 cell:6 edit:0];

    if (v11) {
      [v7 addObject:v11];
    }
    id v12 = [v7 copy];
    id v13 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v12;

    id v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)localizationTableName
{
  return @"SilenceCallsSettingsBundle";
}

- (id)localizedStringForKey:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [(SilenceCallsSettingsController *)self localizationTableName];
  id v7 = [v5 localizedStringForKey:v4 value:&stru_83A8 table:v6];

  return v7;
}

- (id)getOnlyAllowContacts:(id)a3
{
  id v4 = [(SilenceCallsSettingsController *)self tuFeatureFlags];
  unsigned int v5 = [v4 deviceExpertMigrationEnabled];

  id v6 = [(SilenceCallsSettingsController *)self specifier];
  id v7 = [v6 target];
  objc_super v8 = [v7 parentListController];
  v9 = [v8 specifierID];
  unsigned int v10 = [v9 isEqualToString:@"com.apple.preferences.facetime"];

  if (v5)
  {
    id v11 = [(SilenceCallsSettingsController *)self configurationProvider];
    id v12 = v11;
    if (v10) {
      id v13 = [v11 isSilenceUnknownCallersEnabledForFaceTime];
    }
    else {
      id v13 = [v11 isSilenceUnknownCallersEnabledForPhone];
    }
    id v16 = +[NSNumber numberWithBool:v13];
  }
  else if (v10)
  {
    uint64_t v14 = TUCallFilteringPreferencesSilenceUnknownFaceTimeCallersKey;
    id v15 = +[NSNumber numberWithBool:TUSilenceUnknownFaceTimeCallersDefaultValue()];
    id v16 = [(SilenceCallsSettingsController *)self getBooleanFromUserDefaults:v14 default:v15];
  }
  else
  {
    id v16 = [(SilenceCallsSettingsController *)self getBooleanFromUserDefaults:TUCallFilteringPreferencesContactsOnlyKey default:&off_85F0];
  }

  return v16;
}

- (void)setOnlyAllowContacts:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(SilenceCallsSettingsController *)self tuFeatureFlags];
  unsigned __int8 v7 = [v6 deviceExpertMigrationEnabled];

  objc_super v8 = [(SilenceCallsSettingsController *)self specifier];
  v9 = [v8 target];
  unsigned int v10 = [v9 parentListController];
  id v11 = [v10 specifierID];
  unsigned int v12 = [v11 isEqualToString:@"com.apple.preferences.facetime"];

  id v13 = PHDefaultLog();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v12)
    {
      if (v14)
      {
        int v19 = 138412290;
        id v20 = v5;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "User toggled Silence Unknown Callers FaceTime switch to %@", (uint8_t *)&v19, 0xCu);
      }

      id v15 = [v5 BOOLValue];
      id v16 = [(SilenceCallsSettingsController *)self configurationProvider];
      [v16 setSilenceUnknownCallersEnabledForFaceTime:v15];
    }
    else
    {
      if (v14)
      {
        int v19 = 138412290;
        id v20 = v5;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "User toggled Silence Unknown Callers switch to %@", (uint8_t *)&v19, 0xCu);
      }

      id v18 = [v5 BOOLValue];
      id v16 = [(SilenceCallsSettingsController *)self configurationProvider];
      [v16 setSilenceUnknownCallersEnabledForPhone:v18];
    }
  }
  else
  {
    if (v12)
    {
      if (v14)
      {
        int v19 = 138412290;
        id v20 = v5;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "User toggled Silence Unknown Callers FaceTime switch to %@", (uint8_t *)&v19, 0xCu);
      }

      CFStringRef v17 = &TUCallFilteringPreferencesSilenceUnknownFaceTimeCallersKey;
    }
    else
    {
      if (v14)
      {
        int v19 = 138412290;
        id v20 = v5;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "User toggled Silence Unknown Callers switch to %@", (uint8_t *)&v19, 0xCu);
      }

      CFStringRef v17 = &TUCallFilteringPreferencesContactsOnlyKey;
    }
    [(SilenceCallsSettingsController *)self setValueInUserDefaults:v5 forKey:*v17];
  }
}

- (id)getBooleanFromUserDefaults:(id)a3 default:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)NSUserDefaults);
  id v8 = [v7 initWithSuiteName:TUBundleIdentifierTelephonyUtilitiesFramework];
  v9 = [v8 objectForKey:v6];

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
  uint64_t v8 = TUBundleIdentifierTelephonyUtilitiesFramework;
  id v9 = [v7 initWithSuiteName:TUBundleIdentifierTelephonyUtilitiesFramework];
  [v9 setValue:v6 forKey:v5];

  unsigned int v10 = +[NSNotificationCenter defaultCenter];
  [v10 postNotificationName:@"SilenceCallsSettingsChangedNotification" object:0];

  id v12 = (id)objc_opt_new();
  id v11 = +[NSSet setWithObject:v5];

  [v12 synchronizeUserDefaultsDomain:v8 keys:v11];
}

- (id)objectForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)CTBundle) initWithBundleType:1];
  id v11 = [(SilenceCallsSettingsController *)self carrierBundleController];
  id v12 = [v11 telephonyClient];
  id v13 = [v12 copyCarrierBundleValue:v8 keyHierarchy:v9 bundleType:v10 error:a5];

  return v13;
}

- (id)stringForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5
{
  id v5 = [(SilenceCallsSettingsController *)self objectForKeyHierarchy:a3 subscriptionContext:a4 error:a5];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (void)carrierBundleController:(id)a3 carrierBundleDidChangeForSubscriptionContext:(id)a4
{
  id v4 = a4;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Carrier bundle changed for subscription context %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)configurationChanged
{
  [(SilenceCallsSettingsController *)self reloadSpecifiers];
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"SilenceCallsSettingsChangedNotification" object:0];
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

- (TPSCarrierBundleController)carrierBundleController
{
  return self->_carrierBundleController;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TUFeatureFlags)tuFeatureFlags
{
  return self->_tuFeatureFlags;
}

- (TUConfigurationProvider)configurationProvider
{
  return self->_configurationProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationProvider, 0);
  objc_storeStrong((id *)&self->_tuFeatureFlags, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_carrierBundleController, 0);
  objc_destroyWeak((id *)&self->_parentListController);

  objc_storeStrong((id *)&self->_activeSpecifier, 0);
}

@end