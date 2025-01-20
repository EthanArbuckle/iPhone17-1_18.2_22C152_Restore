@interface NotificationReceiverObjCShim
- (_TtC13AppProtection28NotificationReceiverObjCShim)init;
- (void)receivedNotification:(id)a3;
@end

@implementation NotificationReceiverObjCShim

- (void)receivedNotification:(id)a3
{
  uint64_t v4 = sub_247DD2630();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247DD25F0();
  v9 = self;
  sub_247D752CC((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (_TtC13AppProtection28NotificationReceiverObjCShim)init
{
  result = (_TtC13AppProtection28NotificationReceiverObjCShim *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end