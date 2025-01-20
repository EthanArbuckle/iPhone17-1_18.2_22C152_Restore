@interface NCScreenSharingSettingsListController
- (id)allowNotifications:(id)a3;
- (id)specifiers;
- (void)setAllowNotifications:(id)a3 specifier:(id)a4;
@end

@implementation NCScreenSharingSettingsListController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = +[PSSpecifier groupSpecifierWithID:@"SCREEN_SHARING_ALLOW_NOTIFICATIONS_GROUP_ID"];
    v7 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v8 = [v7 localizedStringForKey:@"SCREEN_SHARING_ALLOW_NOTIFICATIONS_FOOTER" value:&stru_419A0 table:@"NotificationsSettings"];
    [v6 setProperty:v8 forKey:PSFooterTextGroupKey];

    [v5 addObject:v6];
    v9 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v10 = [v9 localizedStringForKey:@"ALLOW_NOTIFICATIONS" value:&stru_419A0 table:@"NotificationsSettings"];
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:"setAllowNotifications:specifier:" get:"allowNotifications:" detail:0 cell:6 edit:0];

    [v11 setIdentifier:@"SCREEN_SHARING_ALLOW_NOTIFICATION_ID"];
    [v5 addObject:v11];
    v12 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)allowNotifications:(id)a3
{
  BOOL v3 = NCGetAllowNotificationsDuringScreenSharing();

  return +[NSNumber numberWithBool:v3];
}

- (void)setAllowNotifications:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  NCSetAllowNotificationsDuringScreenSharing((uint64_t)v4);
}

@end