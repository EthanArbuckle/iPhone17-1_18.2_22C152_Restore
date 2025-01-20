@interface MapsSyncService
+ (_TtC8MapsSync15MapsSyncService)shared;
- (_TtC8MapsSync15MapsSyncService)init;
- (void)cloudKitSyncAllowedWithCompletionHandler:(id)a3;
- (void)prepareLibraryWithCompletionHandler:(id)a3;
@end

@implementation MapsSyncService

+ (_TtC8MapsSync15MapsSyncService)shared
{
  if (qword_1E96E6DB0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E96E6DC0;
  return (_TtC8MapsSync15MapsSyncService *)v2;
}

- (_TtC8MapsSync15MapsSyncService)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MapsSyncService();
  return [(MapsSyncService *)&v3 init];
}

- (void)prepareLibraryWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670788);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1A709D5F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E96E83F0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E96E83F8;
  v12[5] = v11;
  v13 = self;
  sub_1A709B8A0((uint64_t)v7, (uint64_t)&unk_1E96E8400, (uint64_t)v12);
  swift_release();
}

- (void)cloudKitSyncAllowedWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670788);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1A709D5F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E96E83E0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E96E72B0;
  v12[5] = v11;
  v13 = self;
  sub_1A709B8A0((uint64_t)v7, (uint64_t)&unk_1E96E7178, (uint64_t)v12);
  swift_release();
}

@end