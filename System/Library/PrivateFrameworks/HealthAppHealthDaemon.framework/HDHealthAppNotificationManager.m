@interface HDHealthAppNotificationManager
- (_TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager)init;
- (_TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager)initWithProfile:(id)a3;
- (_TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager)initWithProfile:(id)a3 userNotificationCenter:(id)a4;
- (id)createSharingReminderNotificationAndReturnError:(id *)a3;
- (void)removeNotificationWithIdentifier:(id)a3;
- (void)removeNotificationsWithIdentifiers:(id)a3;
@end

@implementation HDHealthAppNotificationManager

- (_TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager)initWithProfile:(id)a3
{
  sub_250D5E010();
  id v5 = objc_allocWithZone(MEMORY[0x263F1DFB0]);
  id v6 = a3;
  v7 = (void *)sub_250D5DFF0();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v5, sel_initWithBundleIdentifier_, v7);

  v9 = [(HDHealthAppNotificationManager *)self initWithProfile:v6 userNotificationCenter:v8];
  return v9;
}

- (_TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager)initWithProfile:(id)a3 userNotificationCenter:(id)a4
{
  id v7 = objc_allocWithZone(MEMORY[0x263F433B8]);
  id v8 = a3;
  v9 = (objc_class *)a4;
  v10 = self;
  v11 = (objc_class *)objc_msgSend(v7, sel_initWithProfile_, v8);
  *(Class *)((char *)&v10->super.isa
           + OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_summarySharingEntryManager) = v11;
  *(Class *)((char *)&v10->super.isa
           + OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_userNotificationCenter) = v9;
  v12 = v9;

  v15.receiver = v10;
  v15.super_class = (Class)type metadata accessor for HDHealthAppNotificationManager();
  v13 = [(HDHealthAppNotificationManager *)&v15 init];

  return v13;
}

- (id)createSharingReminderNotificationAndReturnError:(id *)a3
{
  v3 = self;
  v4 = (void *)sub_250D4F9C4();

  return v4;
}

- (void)removeNotificationWithIdentifier:(id)a3
{
  uint64_t v4 = sub_250D5E010();
  uint64_t v6 = v5;
  id v7 = self;
  sub_250D4FC20(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)removeNotificationsWithIdentifiers:(id)a3
{
  sub_250D5E090();
  uint64_t v4 = self;
  sub_250D4FDAC();

  swift_bridgeObjectRelease();
}

- (_TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager)init
{
  result = (_TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_summarySharingEntryManager));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_userNotificationCenter);
}

@end