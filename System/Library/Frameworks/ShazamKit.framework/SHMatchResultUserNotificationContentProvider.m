@interface SHMatchResultUserNotificationContentProvider
+ (id)notificationActionForMatch;
+ (id)notificationCategories;
- (SHAttribution)attribution;
- (SHMatchResultUserNotificationContentProvider)initWithAttribution:(id)a3;
- (id)notificationContentForNoMatch;
- (void)notificationContentForMediaItem:(id)a3 completionHandler:(id)a4;
- (void)setAttribution:(id)a3;
@end

@implementation SHMatchResultUserNotificationContentProvider

- (SHMatchResultUserNotificationContentProvider)initWithAttribution:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHMatchResultUserNotificationContentProvider;
  v6 = [(SHMatchResultUserNotificationContentProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_attribution, a3);
  }

  return v7;
}

- (void)notificationContentForMediaItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)UNMutableNotificationContent);
  objc_super v9 = [v6 title];
  [v8 setTitle:v9];

  [v8 setShouldBackgroundDefaultAction:1];
  [v8 setThreadIdentifier:@"com.apple.ShazamNotifications.main-thread"];
  [v8 setShouldIgnoreDoNotDisturb:1];
  [v8 setShouldIgnoreDowntime:1];
  v10 = +[UNNotificationSound defaultSound];
  [v8 setSound:v10];

  [v8 setShouldAuthenticateDefaultAction:1];
  v11 = [v6 artist];
  if (v11) {
    [v8 setBody:v11];
  }
  v12 = [v6 appleMusicURL];

  if (v12) {
    CFStringRef v13 = @"com.apple.ShazamNotifications.category.actionable";
  }
  else {
    CFStringRef v13 = @"com.apple.ShazamNotifications.category.default";
  }
  [v8 setCategoryIdentifier:v13];
  v14 = [(SHMatchResultUserNotificationContentProvider *)self attribution];
  v15 = [v14 bundleIdentifier];
  v16 = +[SHMatchResultUserNotificationPayload userInfoPayloadForMediaItem:v6 bundleIdentifier:v15];
  [v8 setUserInfo:v16];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100013DB0;
  v19[3] = &unk_1000752B0;
  id v20 = v8;
  id v21 = v7;
  id v17 = v7;
  id v18 = v8;
  +[SHMatchResultUserNotificationAttachmentProvider notificationAttachmentForMediaItem:v6 completionHandler:v19];
}

+ (id)notificationCategories
{
  v2 = [(id)objc_opt_class() notificationActionForMatch];
  id v8 = v2;
  v3 = +[NSArray arrayWithObjects:&v8 count:1];
  v4 = +[UNNotificationCategory categoryWithIdentifier:@"com.apple.ShazamNotifications.category.actionable" actions:v3 intentIdentifiers:&__NSArray0__struct options:4];

  id v5 = +[UNNotificationCategory categoryWithIdentifier:@"com.apple.ShazamNotifications.category.default" actions:&__NSArray0__struct intentIdentifiers:&__NSArray0__struct options:4];
  id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, 0);

  return v6;
}

+ (id)notificationActionForMatch
{
  v2 = +[SHLocalization localizedStringForKey:@"SHAZAM_MODULE_NOTIFICATION_ACTION_TITLE"];
  v3 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.ShazamNotifications", @"apple-music-action"];
  v4 = +[UNNotificationActionIcon iconWithSystemImageName:@"music.square.fill"];
  id v5 = +[UNNotificationAction actionWithIdentifier:v3 title:v2 options:0 icon:v4];

  return v5;
}

- (id)notificationContentForNoMatch
{
  id v3 = objc_alloc_init((Class)UNMutableNotificationContent);
  v4 = +[NSString localizedUserNotificationStringForKey:@"SHAZAM_MODULE_NOTIFICATION_NO_MATCH_SUBTITLE" arguments:0];
  [v3 setTitle:v4];

  id v5 = +[NSString localizedUserNotificationStringForKey:@"SHAZAM_MODULE_NOTIFICATION_NO_MATCH_BODY" arguments:0];
  [v3 setBody:v5];

  [v3 setThreadIdentifier:@"com.apple.ShazamNotifications.main-thread"];
  id v6 = +[NSDate dateWithTimeIntervalSinceNow:60.0];
  [v3 setExpirationDate:v6];

  [v3 setShouldIgnoreDoNotDisturb:1];
  [v3 setShouldIgnoreDowntime:1];
  [v3 setShouldHideDate:1];
  [v3 setShouldSuppressDefaultAction:1];
  id v7 = +[UNNotificationSound defaultSound];
  [v3 setSound:v7];

  id v8 = [(SHMatchResultUserNotificationContentProvider *)self attribution];
  objc_super v9 = [v8 bundleIdentifier];
  v10 = +[SHMatchResultUserNotificationPayload userInfoPayloadForMediaItem:0 bundleIdentifier:v9];
  [v3 setUserInfo:v10];

  return v3;
}

- (SHAttribution)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(id)a3
{
}

- (void).cxx_destruct
{
}

@end