@interface JSUserNotifications
- (_TtC14amsengagementd19JSUserNotifications)init;
- (id)getAuthorizationStatus:(id)a3;
- (id)getNotificationSettings:(id)a3;
- (id)getNotificationSettingsForTopics:(id)a3;
@end

@implementation JSUserNotifications

- (_TtC14amsengagementd19JSUserNotifications)init
{
  return (_TtC14amsengagementd19JSUserNotifications *)sub_100054114();
}

- (id)getAuthorizationStatus:(id)a3
{
  return sub_100107FA0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_100105B10);
}

- (id)getNotificationSettings:(id)a3
{
  return sub_100107FA0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_100106188);
}

- (id)getNotificationSettingsForTopics:(id)a3
{
  return sub_100107FA0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_10010752C);
}

@end