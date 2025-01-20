@interface DeviceAppStateDataSource
- (_TtC19AppStoreKitInternal24DeviceAppStateDataSource)init;
- (void)appQuery:(id)a3 resultsDidChange:(id)a4;
@end

@implementation DeviceAppStateDataSource

- (void)appQuery:(id)a3 resultsDidChange:(id)a4
{
  sub_1E15E9E84(0, (unint64_t *)&unk_1EBF36880);
  uint64_t v6 = sub_1E1D5C248();
  id v7 = a3;
  v8 = self;
  sub_1E19BE8B8(v6);

  swift_bridgeObjectRelease();
}

- (_TtC19AppStoreKitInternal24DeviceAppStateDataSource)init
{
  result = (_TtC19AppStoreKitInternal24DeviceAppStateDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal24DeviceAppStateDataSource_logger;
  uint64_t v4 = sub_1E1D5B958();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal24DeviceAppStateDataSource_appQuery));
  sub_1E15F6A98((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal24DeviceAppStateDataSource_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal24DeviceAppStateDataSource_accessQueue));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal24DeviceAppStateDataSource_greenTeaLogger));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end