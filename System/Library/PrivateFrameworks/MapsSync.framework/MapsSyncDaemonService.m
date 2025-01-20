@interface MapsSyncDaemonService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC9mapssyncd21MapsSyncDaemonService)init;
- (void)cloudKitAccountChangedWithNotification:(id)a3;
- (void)cloudKitContainerEventWithNotification:(id)a3;
- (void)cloudKitSyncAllowedWithCompletionHandler:(id)a3;
- (void)fetchSyncedAnalyticsIdentifierWithCompletion:(id)a3;
- (void)prepareLibraryWithCompletionHandler:(id)a3;
- (void)setSyncedAnalyticsIdentifier:(id)a3 deleteIdenifiers:(id)a4 completion:(id)a5;
@end

@implementation MapsSyncDaemonService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v7 = self;
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = [v7 interfaceWithProtocol:&OBJC_PROTOCOL____TtP9mapssyncd31MapsSyncDaemonCompositeProtocol_];
  [v9 setExportedInterface:v11];

  id v12 = [v7 interfaceWithProtocol:&OBJC_PROTOCOL____TtP9mapssyncd31MapsSyncDaemonCompositeProtocol_];
  [v9 setRemoteObjectInterface:v12];

  [v9 setExportedObject:v10];
  [v9 resume];

  return 1;
}

- (void)cloudKitContainerEventWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000CB84(v4);
}

- (void)cloudKitAccountChangedWithNotification:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_100048380);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10002EA38();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v9;
  id v11 = a3;
  id v12 = self;
  sub_10000D1C8((uint64_t)v7, (uint64_t)&unk_100047B28, (uint64_t)v10);

  swift_release();
}

- (void)fetchSyncedAnalyticsIdentifierWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_10000DB9C((uint64_t)sub_100013CF0, v5);

  swift_release();
}

- (void)setSyncedAnalyticsIdentifier:(id)a3 deleteIdenifiers:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  if (a3)
  {
    id v8 = a4;
    uint64_t v9 = self;
    id v10 = a3;
    a3 = (id)sub_10002E6A8();
    unint64_t v12 = v11;

    if (a4)
    {
LABEL_3:
      uint64_t v13 = sub_10002E9A8();

      goto LABEL_6;
    }
  }
  else
  {
    id v14 = a4;
    v15 = self;
    unint64_t v12 = 0xF000000000000000;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
LABEL_6:
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v7;
  sub_10000E59C((uint64_t)a3, v12, v13, (uint64_t)sub_100013CD4, v16);
  swift_release();
  swift_bridgeObjectRelease();
  sub_100013CDC((uint64_t)a3, v12);
}

- (void)prepareLibraryWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_100048380);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_10002EA38();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  unint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100047B08;
  v11[5] = v9;
  unint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100047B10;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_100012AB4((uint64_t)v7, (uint64_t)&unk_100047B18, (uint64_t)v12);
  swift_release();
}

- (void)cloudKitSyncAllowedWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_100048380);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_10002EA38();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  unint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100047AC8;
  v11[5] = v9;
  unint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100047AD8;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_100012AB4((uint64_t)v7, (uint64_t)&unk_100047AE8, (uint64_t)v12);
  swift_release();
}

- (_TtC9mapssyncd21MapsSyncDaemonService)init
{
  result = (_TtC9mapssyncd21MapsSyncDaemonService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

@end