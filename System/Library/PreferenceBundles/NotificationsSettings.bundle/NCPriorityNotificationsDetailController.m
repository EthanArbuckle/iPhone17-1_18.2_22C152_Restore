@interface NCPriorityNotificationsDetailController
- (NCPriorityNotificationsDetailControllerDelegate)delegate;
- (id)allowPrioritization:(id)a3;
- (id)specifiers;
- (void)setAllowPrioritization:(id)a3 specifier:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation NCPriorityNotificationsDetailController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = +[PSSpecifier groupSpecifierWithID:@"PRIORITIZE_NOTIFICATIONS_GROUP_ID"];
    v7 = +[BSPlatform sharedInstance];
    unsigned int v8 = [v7 deviceClass];

    v9 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v10 = v9;
    if (v8 == 2) {
      CFStringRef v11 = @"PRIORITIZE_NOTIFICATIONS_FOOTER_IPAD";
    }
    else {
      CFStringRef v11 = @"PRIORITIZE_NOTIFICATIONS_FOOTER_IPHONE";
    }
    v12 = [v9 localizedStringForKey:v11 value:&stru_419A0 table:@"NotificationsSettings"];

    [v6 setProperty:v12 forKey:PSFooterTextGroupKey];
    [v5 addObject:v6];
    v13 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v14 = [v13 localizedStringForKey:@"PRIORITIZE_NOTIFICATIONS" value:&stru_419A0 table:@"NotificationsSettings"];
    v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:"setAllowPrioritization:specifier:" get:"allowPrioritization:" detail:0 cell:6 edit:0];

    [v15 setIdentifier:@"PRIORITIZE_NOTIFICATIONS_ID"];
    [v5 addObject:v15];
    v16 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)allowPrioritization:(id)a3
{
  uint64_t v3 = +[NCSettingsGatewayController sharedInstance];
  if ([v3 effectiveGlobalHighlightsSetting] == (char *)&dword_0 + 2) {
    v4 = &__kCFBooleanTrue;
  }
  else {
    v4 = &__kCFBooleanFalse;
  }
  id v5 = v4;

  return v5;
}

- (void)setAllowPrioritization:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  v6 = +[NCSettingsGatewayController sharedInstance];
  [v6 setEffectiveGlobalHighlightsSetting:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained priorityNotificationsDetailController:self didUpdateSetting:v5];
}

- (NCPriorityNotificationsDetailControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCPriorityNotificationsDetailControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end