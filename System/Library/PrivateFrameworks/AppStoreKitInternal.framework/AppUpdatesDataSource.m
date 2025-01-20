@interface AppUpdatesDataSource
- (_TtC19AppStoreKitInternal20AppUpdatesDataSource)init;
- (void)appQuery:(id)a3 resultsDidChange:(id)a4;
@end

@implementation AppUpdatesDataSource

- (void)appQuery:(id)a3 resultsDidChange:(id)a4
{
  sub_1E15E9E84(0, (unint64_t *)&unk_1EBF36880);
  unint64_t v6 = sub_1E1D5C248();
  id v8 = a3;
  v7 = self;
  sub_1E16EFC0C(v6);
  swift_bridgeObjectRelease();
}

- (_TtC19AppStoreKitInternal20AppUpdatesDataSource)init
{
  result = (_TtC19AppStoreKitInternal20AppUpdatesDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal20AppUpdatesDataSource_updatesQuery));
  sub_1E15B07DC((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal20AppUpdatesDataSource_lastServerReloadTime, &qword_1EBF36F90);
  swift_bridgeObjectRelease();
}

@end