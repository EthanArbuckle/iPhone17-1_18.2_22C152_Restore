@interface HealthRecordsNotifications
- (_TtC15HealthRecordsUI26HealthRecordsNotifications)init;
- (void)notificationAlertIfNecessaryWithCompletion:(id)a3;
@end

@implementation HealthRecordsNotifications

- (_TtC15HealthRecordsUI26HealthRecordsNotifications)init
{
  v2 = self;
  if ((MEMORY[0x1E4FBC860] & 0xC000000000000000) != 0 && sub_1C2550620()) {
    unint64_t v3 = sub_1C2418588(MEMORY[0x1E4FBC860]);
  }
  else {
    unint64_t v3 = MEMORY[0x1E4FBC870];
  }
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC15HealthRecordsUI26HealthRecordsNotifications_cancellables) = (Class)v3;
  sub_1C254CE60();
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC15HealthRecordsUI26HealthRecordsNotifications_notificationManager) = (Class)sub_1C254CE50();

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for HealthRecordsNotifications();
  return [(HealthRecordsNotifications *)&v5 init];
}

- (void)notificationAlertIfNecessaryWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1C24160D4((uint64_t)sub_1C22989C4, v5);

  swift_release();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

@end