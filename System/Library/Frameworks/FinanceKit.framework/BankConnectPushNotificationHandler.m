@interface BankConnectPushNotificationHandler
+ (id)makeHandler;
- (_TtC10FinanceKit34BankConnectPushNotificationHandler)init;
- (void)handlePushNotificationWithPayload:(id)a3;
@end

@implementation BankConnectPushNotificationHandler

+ (id)makeHandler
{
  if (qword_26B0C5D00 != -1) {
    swift_once();
  }
  uint64_t v2 = *((void *)off_26B0C5CF8 + 2);
  v3 = (objc_class *)type metadata accessor for BankConnectPushNotificationHandler();
  v4 = (char *)objc_allocWithZone(v3);
  *(void *)&v4[OBJC_IVAR____TtC10FinanceKit34BankConnectPushNotificationHandler_store] = v2;
  v7.receiver = v4;
  v7.super_class = v3;
  swift_retain();
  id v5 = objc_msgSendSuper2(&v7, sel_init);

  return v5;
}

- (void)handlePushNotificationWithPayload:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_2439581A0();
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  uint64_t v5 = qword_26B0C7DF8;
  v6 = self;
  if (v5 != -1) {
    swift_once();
  }
  objc_super v7 = _os_activity_create(&dword_243363000, "bankConnect/notificationHandler", (os_activity_t)qword_26B0C7DF0, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  sub_243417B40((uint64_t)v6, v4);
  os_activity_scope_leave(&state);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (_TtC10FinanceKit34BankConnectPushNotificationHandler)init
{
  result = (_TtC10FinanceKit34BankConnectPushNotificationHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end