@interface AssistantBridgeAppDetailController
- (AssistantBridgeAppDetailController)init;
- (BOOL)appHasCustomSettingsWithBundleId:(id)a3;
- (id)_appName;
- (id)_bundleId;
- (id)_iOSBundleToMirrorWithBundleId:(id)a3;
- (id)inAppShowSiriSuggestionsEnabled:(id)a3;
- (id)specifiers;
- (void)dealloc;
- (void)setAppHasCustomSettingsWithBundleId:(id)a3 hasCustomSettings:(BOOL)a4;
- (void)setInAppShowSiriSuggestionsEnabled:(BOOL)a3 bundleId:(id)a4;
- (void)setInAppShowSiriSuggestionsEnabled:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation AssistantBridgeAppDetailController

- (AssistantBridgeAppDetailController)init
{
  v8.receiver = self;
  v8.super_class = (Class)AssistantBridgeAppDetailController;
  v2 = [(AssistantBridgeAppDetailController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_notifyToken = -1;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_7D50;
    handler[3] = &unk_10568;
    v7 = v2;
    if (notify_register_dispatch("com.apple.suggestions.settingsChanged", &v3->_notifyToken, (dispatch_queue_t)&_dispatch_main_q, handler))
    {
      v4 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        sub_A88C(v4);
      }
    }
  }
  return v3;
}

- (void)dealloc
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1) {
    notify_cancel(notifyToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)AssistantBridgeAppDetailController;
  [(AssistantBridgeAppDetailController *)&v4 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v37 = +[PSSpecifier groupSpecifierWithID:@"APPDETAIL_MIRROR_GROUP_ID"];
    [v37 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"ASSISTANTBRIDGE_APPDETAIL_MIRROR" value:&stru_10A70 table:@"AssistantBridgeSettings"];
    v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:3 edit:0];
    mirrorRadio = self->_mirrorRadio;
    self->_mirrorRadio = v7;

    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"ASSISTANTBRIDGE_APPDETAIL_CUSTOM" value:&stru_10A70 table:@"AssistantBridgeSettings"];
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:3 edit:0];
    customRadio = self->_customRadio;
    self->_customRadio = v11;

    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"SIRIANDSEARCH_PERAPP_INAPP_HEADER" value:&stru_10A70 table:@"AssistantBridgeSettings"];
    v15 = [(AssistantBridgeAppDetailController *)self _appName];
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15);
    v17 = +[PSSpecifier groupSpecifierWithName:v16];
    inAppGroup = self->_inAppGroup;
    self->_inAppGroup = v17;

    v19 = self->_inAppGroup;
    v20 = +[NSBundle bundleForClass:objc_opt_class()];
    v21 = [v20 localizedStringForKey:@"SIRIANDSEARCH_PERAPP_INAPP_SHOWONLY_FOOTER" value:&stru_10A70 table:@"AssistantBridgeSettings"];
    v22 = [(AssistantBridgeAppDetailController *)self _appName];
    v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v22);
    [(PSSpecifier *)v19 setProperty:v23 forKey:PSFooterTextGroupKey];

    v24 = +[NSBundle bundleForClass:objc_opt_class()];
    v25 = [v24 localizedStringForKey:@"SIRIANDSEARCH_PERAPP_INAPP_SHOWSUGGESTIONS_TOGGLE" value:&stru_10A70 table:@"AssistantBridgeSettings"];
    v26 = +[PSSpecifier preferenceSpecifierNamed:v25 target:self set:"setInAppShowSiriSuggestionsEnabled:specifier:" get:"inAppShowSiriSuggestionsEnabled:" detail:0 cell:6 edit:0];
    showToggle = self->_showToggle;
    self->_showToggle = v26;

    [(PSSpecifier *)self->_showToggle setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    v28 = [(AssistantBridgeAppDetailController *)self _bundleId];
    LODWORD(v25) = [(AssistantBridgeAppDetailController *)self appHasCustomSettingsWithBundleId:v28];

    if (v25)
    {
      [v37 setProperty:self->_customRadio forKey:PSRadioGroupCheckedSpecifierKey];
      v29 = self->_mirrorRadio;
      v39[0] = v37;
      v39[1] = v29;
      v30 = self->_inAppGroup;
      v39[2] = self->_customRadio;
      v39[3] = v30;
      v39[4] = self->_showToggle;
      v31 = v39;
      uint64_t v32 = 5;
    }
    else
    {
      [v37 setProperty:self->_mirrorRadio forKey:PSRadioGroupCheckedSpecifierKey];
      v33 = self->_mirrorRadio;
      v38[0] = v37;
      v38[1] = v33;
      v38[2] = self->_customRadio;
      v31 = v38;
      uint64_t v32 = 3;
    }
    uint64_t v34 = +[NSArray arrayWithObjects:v31 count:v32];
    v35 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v34;

    objc_super v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AssistantBridgeAppDetailController *)self indexForIndexPath:v7];
  v9 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  v10 = [v9 identifier];
  v11 = [(PSSpecifier *)self->_mirrorRadio identifier];
  unsigned int v12 = [v10 isEqualToString:v11];

  if (v12)
  {
    v13 = [(AssistantBridgeAppDetailController *)self _bundleId];
    [(AssistantBridgeAppDetailController *)self setAppHasCustomSettingsWithBundleId:v13 hasCustomSettings:0];

    showToggle = self->_showToggle;
    v23[0] = self->_inAppGroup;
    v23[1] = showToggle;
    v15 = +[NSArray arrayWithObjects:v23 count:2];
    [(AssistantBridgeAppDetailController *)self removeContiguousSpecifiers:v15 animated:1];
LABEL_5:

    goto LABEL_6;
  }
  v16 = [v9 identifier];
  v17 = [(PSSpecifier *)self->_customRadio identifier];
  unsigned int v18 = [v16 isEqualToString:v17];

  if (v18)
  {
    v19 = [(AssistantBridgeAppDetailController *)self _bundleId];
    [(AssistantBridgeAppDetailController *)self setAppHasCustomSettingsWithBundleId:v19 hasCustomSettings:1];

    v20 = self->_showToggle;
    v22[0] = self->_inAppGroup;
    v22[1] = v20;
    v15 = +[NSArray arrayWithObjects:v22 count:2];
    [(AssistantBridgeAppDetailController *)self insertContiguousSpecifiers:v15 afterSpecifier:self->_customRadio animated:1];
    goto LABEL_5;
  }
LABEL_6:
  v21.receiver = self;
  v21.super_class = (Class)AssistantBridgeAppDetailController;
  [(AssistantBridgeAppDetailController *)&v21 tableView:v6 didSelectRowAtIndexPath:v7];
}

- (id)inAppShowSiriSuggestionsEnabled:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_A994();
  }
  v5 = [(AssistantBridgeAppDetailController *)self _bundleId];
  id v6 = (void *)CFPreferencesCopyAppValue(@"NanoAppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  uint64_t v7 = [v6 containsObject:v5] ^ 1;

  id v8 = +[NSNumber numberWithBool:v7];

  return v8;
}

- (void)setInAppShowSiriSuggestionsEnabled:(id)a3 specifier:(id)a4
{
  id v5 = [a3 BOOLValue];
  id v6 = [(AssistantBridgeAppDetailController *)self _bundleId];
  [(AssistantBridgeAppDetailController *)self setInAppShowSiriSuggestionsEnabled:v5 bundleId:v6];
}

- (void)setInAppShowSiriSuggestionsEnabled:(BOOL)a3 bundleId:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_AA14();
  }
  id v6 = v5;
  uint64_t v7 = (void *)CFPreferencesCopyAppValue(@"NanoAppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  id v8 = v7;
  if (v7) {
    id v9 = [v7 mutableCopy];
  }
  else {
    id v9 = (id)objc_opt_new();
  }
  v10 = v9;
  if (v4)
  {
    [v9 removeObject:v6];
  }
  else if (([v9 containsObject:v6] & 1) == 0)
  {
    [v10 addObject:v6];
  }
  CFPreferencesSetAppValue(@"NanoAppCanShowSiriSuggestionsBlacklist", v10, @"com.apple.suggestions");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.suggestions.settingsChanged", 0, 0, 1u);

  id v12 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"NanoAppCanShowSiriSuggestionsBlacklist", 0);
  v13 = objc_opt_new();
  [v13 synchronizeUserDefaultsDomain:@"com.apple.suggestions" keys:v12];
}

- (id)_bundleId
{
  v2 = [(AssistantBridgeAppDetailController *)self specifier];
  uint64_t v3 = [v2 propertyForKey:PSIDKey];

  return v3;
}

- (id)_appName
{
  return [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] name];
}

- (BOOL)appHasCustomSettingsWithBundleId:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_AA88();
  }
  id v4 = v3;
  id v5 = (void *)CFPreferencesCopyAppValue(@"AppHasCustomBridgeSettings", @"com.apple.suggestions");
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)setAppHasCustomSettingsWithBundleId:(id)a3 hasCustomSettings:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_AB08();
  }
  id v7 = v6;
  id v8 = (void *)CFPreferencesCopyAppValue(@"AppHasCustomBridgeSettings", @"com.apple.suggestions");
  id v9 = v8;
  if (v8) {
    id v10 = [v8 mutableCopy];
  }
  else {
    id v10 = (id)objc_opt_new();
  }
  v11 = v10;
  if (v4)
  {
    if (([v10 containsObject:v7] & 1) == 0) {
      [v11 addObject:v7];
    }
  }
  else
  {
    [v10 removeObject:v7];
  }
  CFPreferencesSetAppValue(@"AppHasCustomBridgeSettings", v11, @"com.apple.suggestions");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.suggestions.settingsChanged", 0, 0, 1u);

  if (v4)
  {
    [(AssistantBridgeAppDetailController *)self setInAppShowSiriSuggestionsEnabled:1 bundleId:v7];
  }
  else
  {
    v13 = [(AssistantBridgeAppDetailController *)self _iOSBundleToMirrorWithBundleId:v7];
    v14 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
    uint64_t v15 = [v14 containsObject:v13] ^ 1;

    [(AssistantBridgeAppDetailController *)self setInAppShowSiriSuggestionsEnabled:v15 bundleId:v7];
  }
  id v16 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"AppHasCustomBridgeSettings", 0);
  v17 = objc_opt_new();
  [v17 synchronizeUserDefaultsDomain:@"com.apple.suggestions" keys:v16];
}

- (id)_iOSBundleToMirrorWithBundleId:(id)a3
{
  id v5 = a3;
  id v6 = [&off_112F0 objectForKeyedSubscript:v5];
  if (!v6)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"AssistantBridgeAppDetailController.m", 174, @"Unexpected watchOS bundle id %@", v5 object file lineNumber description];
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showToggle, 0);
  objc_storeStrong((id *)&self->_inAppGroup, 0);
  objc_storeStrong((id *)&self->_customRadio, 0);

  objc_storeStrong((id *)&self->_mirrorRadio, 0);
}

@end