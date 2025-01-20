@interface SupervisedDeviceSectionModelProvider
- (_TtC11SettingsApp36SupervisedDeviceSectionModelProvider)init;
- (uint64_t)profileConnectionDidReceiveRestrictionChangedNotification:(void *)a3 userInfo:(uint64_t)a4;
- (void)dealloc;
@end

@implementation SupervisedDeviceSectionModelProvider

- (void)dealloc
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC11SettingsApp36SupervisedDeviceSectionModelProvider_setupObserver) != 1)
  {
    v7 = self;
    goto LABEL_5;
  }
  v3 = self;
  v4 = self;
  id v5 = [v3 sharedConnection];
  if (v5)
  {
    v6 = v5;
    [v5 unregisterObserver:v4];

LABEL_5:
    v8.receiver = self;
    v8.super_class = (Class)type metadata accessor for SupervisedDeviceSectionModelProvider();
    [(SupervisedDeviceSectionModelProvider *)&v8 dealloc];
    return;
  }
  __break(1u);
}

- (void).cxx_destruct
{
  sub_10003E2B4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11SettingsApp36SupervisedDeviceSectionModelProvider_id), *(void *)&self->id[OBJC_IVAR____TtC11SettingsApp36SupervisedDeviceSectionModelProvider_id], self->id[OBJC_IVAR____TtC11SettingsApp36SupervisedDeviceSectionModelProvider_id + 8]);
  v3 = (char *)self + OBJC_IVAR____TtC11SettingsApp36SupervisedDeviceSectionModelProvider_invalidator;

  sub_100042A1C((uint64_t)v3);
}

- (_TtC11SettingsApp36SupervisedDeviceSectionModelProvider)init
{
  result = (_TtC11SettingsApp36SupervisedDeviceSectionModelProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (uint64_t)profileConnectionDidReceiveRestrictionChangedNotification:(void *)a3 userInfo:(uint64_t)a4
{
  if (a4) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  sub_1000403E0(&a1[OBJC_IVAR____TtC11SettingsApp36SupervisedDeviceSectionModelProvider_invalidator], *(void *)&a1[OBJC_IVAR____TtC11SettingsApp36SupervisedDeviceSectionModelProvider_invalidator + 24]);
  id v6 = a3;
  v7 = a1;
  PassthroughSubject.send(_:)();

  return swift_bridgeObjectRelease();
}

@end