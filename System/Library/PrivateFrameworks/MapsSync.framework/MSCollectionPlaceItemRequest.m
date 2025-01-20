@interface MSCollectionPlaceItemRequest
- (MSCollectionPlaceItemRequest)init;
- (MSCollectionPlaceItemRequest)initWithStore:(id)a3;
- (id)fetchSyncAndReturnError:(id *)a3;
- (id)fetchSyncWithOptions:(id)a3 error:(id *)a4;
- (void)countWithCompletionHandler:(id)a3;
- (void)countWithOptions:(_TtC8MapsSync20MapsSyncQueryOptions *)a3 completionHandler:(id)a4;
- (void)fetchWithCompletionHandler:(id)a3;
- (void)fetchWithOptions:(_TtC8MapsSync20MapsSyncQueryOptions *)a3 completionHandler:(id)a4;
- (void)fetchWithSearchTerm:(NSString *)a3 sortDescriptors:(NSArray *)a4 range:(_TtC8MapsSync13MapsSyncRange *)a5 completionHandler:(id)a6;
@end

@implementation MSCollectionPlaceItemRequest

- (void)fetchWithSearchTerm:(NSString *)a3 sortDescriptors:(NSArray *)a4 range:(_TtC8MapsSync13MapsSyncRange *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670788);
  MEMORY[0x1F4188790](v11 - 8);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_1A709D5F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1E96E72A8;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1E96E72B0;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_1A709B8A0((uint64_t)v13, (uint64_t)&unk_1E96E7178, (uint64_t)v18);
  swift_release();
}

- (MSCollectionPlaceItemRequest)init
{
  if (qword_1EB6705E0 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_1EB670750;
  return [(MSCollectionPlaceItemRequest *)self initWithStore:v3];
}

- (MSCollectionPlaceItemRequest)initWithStore:(id)a3
{
  uint64_t v5 = type metadata accessor for CollectionPlaceItem();
  type metadata accessor for MapsSyncRequest();
  v6 = (objc_class *)swift_allocObject();
  *((void *)v6 + 2) = a3;
  *((void *)v6 + 3) = v5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MSCollectionPlaceItemRequest__request) = v6;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CollectionPlaceItemRequest();
  id v7 = a3;
  return [(MSCollectionPlaceItemRequest *)&v9 init];
}

- (id)fetchSyncAndReturnError:(id *)a3
{
  uint64_t v3 = self;
  sub_1A703933C();

  type metadata accessor for CollectionPlaceItem();
  v4 = (void *)sub_1A709D4C8();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)fetchSyncWithOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  sub_1A703933C();

  type metadata accessor for CollectionPlaceItem();
  id v7 = (void *)sub_1A709D4C8();
  swift_bridgeObjectRelease();
  return v7;
}

- (void)fetchWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670788);
  MEMORY[0x1F4188790](v5 - 8);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1A709D5F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E96E8800;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E96E71D0;
  v12[5] = v11;
  v13 = self;
  sub_1A709B8A0((uint64_t)v7, (uint64_t)&unk_1E96E71D8, (uint64_t)v12);
  swift_release();
}

- (void)fetchWithOptions:(_TtC8MapsSync20MapsSyncQueryOptions *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670788);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1A709D5F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E96E87F0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E96E71B0;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_1A709B8A0((uint64_t)v9, (uint64_t)&unk_1E96E71B8, (uint64_t)v14);
  swift_release();
}

- (void)countWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670788);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1A709D5F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E96E87E0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E96E7190;
  v12[5] = v11;
  v13 = self;
  sub_1A709B8A0((uint64_t)v7, (uint64_t)&unk_1E96E7198, (uint64_t)v12);
  swift_release();
}

- (void)countWithOptions:(_TtC8MapsSync20MapsSyncQueryOptions *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670788);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1A709D5F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E96E87D0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E96E72B0;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_1A709B8A0((uint64_t)v9, (uint64_t)&unk_1E96E7178, (uint64_t)v14);
  swift_release();
}

- (void).cxx_destruct
{
}

@end