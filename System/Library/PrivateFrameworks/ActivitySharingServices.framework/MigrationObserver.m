@interface MigrationObserver
- (BOOL)isReadyToProcessChanges;
- (_TtC23ActivitySharingServices17MigrationObserver)init;
- (void)cloudKitManager:(id)a3 didBeginUpdatesForFetchWithType:(int64_t)a4;
- (void)cloudKitManager:(id)a3 didDeleteRecordIDs:(id)a4 changesProcessedHandler:(id)a5;
- (void)cloudKitManager:(id)a3 didDeleteRecordIDsForSelf:(id)a4 changesProcessedHandler:(id)a5;
- (void)cloudKitManager:(id)a3 didReceiveNewMigrationAvailableItems:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6;
- (void)cloudKitManager:(id)a3 didReceiveNewMigrationAvailableItemsForSelf:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6;
- (void)dealloc;
@end

@implementation MigrationObserver

- (void)dealloc
{
  v3 = (void *)*__swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC23ActivitySharingServices17MigrationObserver_cloudKitCoordinator), *(void *)&self->cloudKitCoordinator[OBJC_IVAR____TtC23ActivitySharingServices17MigrationObserver_cloudKitCoordinator+ 16]);
  v4 = self;
  objc_msgSend(v3, sel_removeObserver_, v4);
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for MigrationObserver();
  [(MigrationObserver *)&v5 dealloc];
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23ActivitySharingServices17MigrationObserver_cloudKitCoordinator);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ActivitySharingServices17MigrationObserver_contactsManager));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23ActivitySharingServices17MigrationObserver_migrationAvailableItemStore);
  v3 = (char *)self + OBJC_IVAR____TtC23ActivitySharingServices17MigrationObserver_relationshipDowngradeService;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (_TtC23ActivitySharingServices17MigrationObserver)init
{
  result = (_TtC23ActivitySharingServices17MigrationObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)isReadyToProcessChanges
{
  return 1;
}

- (void)cloudKitManager:(id)a3 didBeginUpdatesForFetchWithType:(int64_t)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12F4D0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a4)
  {
    uint64_t v10 = sub_2476B2BE8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
    v11 = (void *)swift_allocObject();
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = self;
    v12 = self;
    id v13 = a3;
    sub_247675354((uint64_t)v9, (uint64_t)&unk_26925A730, (uint64_t)v11);

    swift_release();
  }
}

- (void)cloudKitManager:(id)a3 didDeleteRecordIDsForSelf:(id)a4 changesProcessedHandler:(id)a5
{
}

- (void)cloudKitManager:(id)a3 didDeleteRecordIDs:(id)a4 changesProcessedHandler:(id)a5
{
}

- (void)cloudKitManager:(id)a3 didReceiveNewMigrationAvailableItemsForSelf:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6
{
  uint64_t v8 = _Block_copy(a6);
  sub_247589018(0, (unint64_t *)&qword_26B12F518);
  uint64_t v9 = sub_2476B2B48();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  id v11 = a3;
  v12 = self;
  sub_24762AE84(v9, (uint64_t)sub_24762B730, v10, "Handling migration available items for self: %s", (uint64_t)&unk_26FBAC6A0, (uint64_t)&unk_26925A6F0);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)cloudKitManager:(id)a3 didReceiveNewMigrationAvailableItems:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6
{
  uint64_t v8 = _Block_copy(a6);
  sub_247589018(0, (unint64_t *)&qword_26B12F518);
  uint64_t v9 = sub_2476B2B48();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  id v11 = a3;
  v12 = self;
  sub_24762AE84(v9, (uint64_t)sub_24762A4B0, v10, "Handling migration available items from remote: %s", (uint64_t)&unk_26FBAC650, (uint64_t)&unk_26925A6C0);

  swift_bridgeObjectRelease();
  swift_release();
}

@end