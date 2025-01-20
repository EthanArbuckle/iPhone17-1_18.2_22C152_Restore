@interface HighlightAlertStateSyncManager
- (NSString)description;
- (_TtC15HighlightAlerts30HighlightAlertStateSyncManager)init;
- (void)deviceKeyValueStoreDidUpdateForStorageGroup:(id)a3;
@end

@implementation HighlightAlertStateSyncManager

- (_TtC15HighlightAlerts30HighlightAlertStateSyncManager)init
{
  result = (_TtC15HighlightAlerts30HighlightAlertStateSyncManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_240C18518((uint64_t)self + OBJC_IVAR____TtC15HighlightAlerts30HighlightAlertStateSyncManager_updateDelegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15HighlightAlerts30HighlightAlertStateSyncManager_contextSyncStore));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15HighlightAlerts30HighlightAlertStateSyncManager_cloudSyncControl);
}

- (NSString)description
{
  v2 = self;
  sub_240C260B4();

  v3 = (void *)sub_240C862A0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)deviceKeyValueStoreDidUpdateForStorageGroup:(id)a3
{
  sub_240C06734(0, &qword_26AFDFAC0);
  unint64_t v4 = sub_240C863C0();
  v5 = self;
  sub_240C28B24(v4);

  swift_bridgeObjectRelease();
}

@end