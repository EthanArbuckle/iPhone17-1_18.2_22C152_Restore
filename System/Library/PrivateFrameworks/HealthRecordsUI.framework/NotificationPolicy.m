@interface NotificationPolicy
- (_TtC15HealthRecordsUI18NotificationPolicy)init;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation NotificationPolicy

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  v8 = (void (**)(void *, uint64_t))_Block_copy(a5);
  uint64_t v9 = qword_1EA2DD968;
  id v10 = a3;
  id v13 = a4;
  v11 = self;
  if (v9 != -1) {
    swift_once();
  }
  if (sub_1C252E624()) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = 27;
  }
  v8[2](v8, v12);
  _Block_release(v8);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = self;
  sub_1C23A948C(v11, sub_1C235FF18, v9);

  swift_release();
}

- (_TtC15HealthRecordsUI18NotificationPolicy)init
{
  result = (_TtC15HealthRecordsUI18NotificationPolicy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI18NotificationPolicy_notificationSyncStore));
  swift_bridgeObjectRelease();
}

@end