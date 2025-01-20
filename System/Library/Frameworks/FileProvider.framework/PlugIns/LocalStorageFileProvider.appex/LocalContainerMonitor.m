@interface LocalContainerMonitor
- (_TtC24LocalStorageFileProvider21LocalContainerMonitor)init;
- (void)appRegistry:(id)a3 didRemoveAppsWithBundleIDs:(id)a4;
- (void)appRegistry:(id)a3 didUpdateApps:(id)a4;
@end

@implementation LocalContainerMonitor

- (void)appRegistry:(id)a3 didUpdateApps:(id)a4
{
  sub_100011348(0, &qword_100ACBC08);
  uint64_t v6 = sub_10096C0A0();
  id v7 = a3;
  v8 = self;
  sub_1000804A4(v6);

  swift_bridgeObjectRelease();
}

- (void)appRegistry:(id)a3 didRemoveAppsWithBundleIDs:(id)a4
{
  uint64_t v6 = sub_10096C0A0();
  id v7 = a3;
  v8 = self;
  sub_10008068C(v6);

  swift_bridgeObjectRelease();
}

- (_TtC24LocalStorageFileProvider21LocalContainerMonitor)init
{
  result = (_TtC24LocalStorageFileProvider21LocalContainerMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100028918((uint64_t)self + OBJC_IVAR____TtC24LocalStorageFileProvider21LocalContainerMonitor_domain, (uint64_t (*)(void))type metadata accessor for LocalDomain);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24LocalStorageFileProvider21LocalContainerMonitor_appRegistry));
  v3 = (char *)self + OBJC_IVAR____TtC24LocalStorageFileProvider21LocalContainerMonitor_version;
  uint64_t v4 = sub_10096B180();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC24LocalStorageFileProvider21LocalContainerMonitor_queue);
}

@end