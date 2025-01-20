@interface MockUNUserNotificationCenter
- (_TtC14HealthPlatform28MockUNUserNotificationCenter)initWithBundleIdentifier:(id)a3;
- (_TtC14HealthPlatform28MockUNUserNotificationCenter)initWithBundleIdentifier:(id)a3 queue:(id)a4;
- (id)deliveredNotifications;
- (id)notificationSettings;
- (id)pendingNotificationRequests;
- (void)addNotificationRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)getDeliveredNotificationsWithCompletionHandler:(id)a3;
- (void)getNotificationSettingsWithCompletionHandler:(id)a3;
- (void)getPendingNotificationRequestsWithCompletionHandler:(id)a3;
- (void)removeAllDeliveredNotifications;
- (void)removeAllPendingNotificationRequests;
- (void)removeDeliveredNotificationsWithIdentifiers:(id)a3;
- (void)removePendingNotificationRequestsWithIdentifiers:(id)a3;
@end

@implementation MockUNUserNotificationCenter

- (_TtC14HealthPlatform28MockUNUserNotificationCenter)initWithBundleIdentifier:(id)a3 queue:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1C277B850();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  return (_TtC14HealthPlatform28MockUNUserNotificationCenter *)sub_1C26B5EFC(v5, v7, a4);
}

- (void)addNotificationRequest:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = (void (*)(void))sub_1C26B9D50;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_1C26B6060(v8, v6, v7);
  sub_1C261AE94((uint64_t)v6);
}

- (void)getPendingNotificationRequestsWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC14HealthPlatform28MockUNUserNotificationCenter_mockNotificationState);
  uint64_t v6 = (void *)(v5 + 16);
  uint64_t v7 = (os_unfair_lock_s *)(v5 + 40);
  id v8 = self;
  os_unfair_lock_lock(v7);
  sub_1C26BA6DC(v6);
  os_unfair_lock_unlock(v7);

  swift_release();
}

- (id)pendingNotificationRequests
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC14HealthPlatform28MockUNUserNotificationCenter_mockNotificationState);
  v3 = (void *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 40);
  uint64_t v5 = self;
  os_unfair_lock_lock(v4);
  sub_1C2607FD4(v3, &v8);
  os_unfair_lock_unlock(v4);

  sub_1C2644ED8(0, (unint64_t *)&qword_1EBB82FC0);
  uint64_t v6 = (void *)sub_1C277BA30();
  swift_bridgeObjectRelease();

  return v6;
}

- (void)getDeliveredNotificationsWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  uint64_t v5 = *(os_unfair_lock_s **)((char *)&self->super.super.isa
                            + OBJC_IVAR____TtC14HealthPlatform28MockUNUserNotificationCenter_mockNotificationState);
  uint64_t v6 = (uint64_t)&v5[4];
  uint64_t v7 = v5 + 10;
  uint64_t v8 = self;
  os_unfair_lock_lock(v7);
  sub_1C26B9CD8(v6);
  os_unfair_lock_unlock(v7);

  swift_release();
}

- (id)deliveredNotifications
{
  uint64_t v2 = *(os_unfair_lock_s **)((char *)&self->super.super.isa
                            + OBJC_IVAR____TtC14HealthPlatform28MockUNUserNotificationCenter_mockNotificationState);
  uint64_t v3 = (uint64_t)&v2[4];
  v4 = v2 + 10;
  uint64_t v5 = self;
  os_unfair_lock_lock(v4);
  sub_1C26B7908(v3, &v8);
  os_unfair_lock_unlock(v4);

  sub_1C2644ED8(0, &qword_1EA304850);
  uint64_t v6 = (void *)sub_1C277BA30();
  swift_bridgeObjectRelease();

  return v6;
}

- (void)removePendingNotificationRequestsWithIdentifiers:(id)a3
{
  sub_1C277BA40();
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC14HealthPlatform28MockUNUserNotificationCenter_mockNotificationState);
  uint64_t v5 = (unint64_t *)(v4 + 16);
  uint64_t v6 = (os_unfair_lock_s *)(v4 + 40);
  uint64_t v7 = self;
  os_unfair_lock_lock(v6);
  sub_1C26BA73C(v5);
  os_unfair_lock_unlock(v6);

  swift_bridgeObjectRelease();
}

- (void)removeDeliveredNotificationsWithIdentifiers:(id)a3
{
  sub_1C277BA40();
  uint64_t v4 = *(os_unfair_lock_s **)((char *)&self->super.super.isa
                            + OBJC_IVAR____TtC14HealthPlatform28MockUNUserNotificationCenter_mockNotificationState);
  uint64_t v5 = (uint64_t)&v4[4];
  uint64_t v6 = v4 + 10;
  uint64_t v7 = self;
  os_unfair_lock_lock(v6);
  sub_1C26BA724(v5);
  os_unfair_lock_unlock(v6);

  swift_bridgeObjectRelease();
}

- (void)removeAllPendingNotificationRequests
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC14HealthPlatform28MockUNUserNotificationCenter_mockNotificationState);
  uint64_t v3 = (void *)(v2 + 16);
  uint64_t v4 = (os_unfair_lock_s *)(v2 + 40);
  uint64_t v5 = self;
  os_unfair_lock_lock(v4);
  sub_1C26B7CE4(v3);
  os_unfair_lock_unlock(v4);
}

- (void)removeAllDeliveredNotifications
{
  uint64_t v2 = *(os_unfair_lock_s **)((char *)&self->super.super.isa
                            + OBJC_IVAR____TtC14HealthPlatform28MockUNUserNotificationCenter_mockNotificationState);
  uint64_t v3 = (uint64_t)&v2[4];
  uint64_t v4 = v2 + 10;
  uint64_t v5 = self;
  os_unfair_lock_lock(v4);
  sub_1C26B7D9C(v3);
  os_unfair_lock_unlock(v4);
}

- (void)getNotificationSettingsWithCompletionHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_1C26B9B14((char *)v5, (void (**)(void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (id)notificationSettings
{
  uint64_t v3 = (void **)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC14HealthPlatform28MockUNUserNotificationCenter_customNotificationSettings);
  swift_beginAccess();
  uint64_t v4 = *v3;
  if (*v3)
  {
    uint64_t v5 = self;
    id v6 = v4;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)type metadata accessor for MockUNUserNotificationCenter();
    uint64_t v7 = self;
    id v6 = [(MockUNUserNotificationCenter *)&v10 notificationSettings];
  }
  id v8 = v4;

  return v6;
}

- (_TtC14HealthPlatform28MockUNUserNotificationCenter)initWithBundleIdentifier:(id)a3
{
  result = (_TtC14HealthPlatform28MockUNUserNotificationCenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14HealthPlatform28MockUNUserNotificationCenter_customNotificationSettings));

  swift_release();
}

@end