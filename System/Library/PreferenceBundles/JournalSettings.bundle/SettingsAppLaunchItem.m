@interface SettingsAppLaunchItem
+ (id)healthAccessURL;
+ (id)notificationsAccessUrl;
- (_TtC15JournalSettings21SettingsAppLaunchItem)init;
@end

@implementation SettingsAppLaunchItem

+ (id)healthAccessURL
{
  return sub_12C218((uint64_t)a1, (uint64_t)a2, 1);
}

+ (id)notificationsAccessUrl
{
  return sub_12C218((uint64_t)a1, (uint64_t)a2, 0);
}

- (_TtC15JournalSettings21SettingsAppLaunchItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SettingsAppLaunchItem();
  return [(SettingsAppLaunchItem *)&v3 init];
}

@end