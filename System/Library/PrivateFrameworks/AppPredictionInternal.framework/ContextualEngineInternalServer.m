@interface ContextualEngineInternalServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC21AppPredictionInternal30ContextualEngineInternalServer)init;
- (void)fetchAllSnapshotsWithCompletion:(id)a3;
- (void)fetchSnapshotOverrideWithCompletion:(id)a3;
- (void)overrideWithSnapshot:(ATXContextualSuggestionSnapshot *)a3 completion:(id)a4;
- (void)updateWithCompletion:(id)a3;
@end

@implementation ContextualEngineInternalServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1D13991F4(v7);

  return v9 & 1;
}

- (void)fetchAllSnapshotsWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBD23A30);
  MEMORY[0x1F4188790](v5 - 8, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = sub_1D13F27D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA64DC58;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA64DC60;
  v13[5] = v12;
  v14 = self;
  sub_1D1399050((uint64_t)v8, (uint64_t)&unk_1EA64DC68, (uint64_t)v13);
  swift_release();
}

- (void)fetchSnapshotOverrideWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBD23A30);
  MEMORY[0x1F4188790](v5 - 8, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = sub_1D13F27D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA64DC38;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA64DC40;
  v13[5] = v12;
  v14 = self;
  sub_1D1399050((uint64_t)v8, (uint64_t)&unk_1EA64DC48, (uint64_t)v13);
  swift_release();
}

- (void)overrideWithSnapshot:(ATXContextualSuggestionSnapshot *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBD23A30);
  MEMORY[0x1F4188790](v7 - 8, v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_1D13F27D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA64DC18;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA64DC20;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_1D1399050((uint64_t)v10, (uint64_t)&unk_1EA64DC28, (uint64_t)v15);
  swift_release();
}

- (void)updateWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBD23A30);
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = sub_1D13F27D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA64DBD8;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA64DBE8;
  v13[5] = v12;
  v14 = self;
  sub_1D1399050((uint64_t)v8, (uint64_t)&unk_1EA64DBF8, (uint64_t)v13);
  swift_release();
}

- (_TtC21AppPredictionInternal30ContextualEngineInternalServer)init
{
  result = (_TtC21AppPredictionInternal30ContextualEngineInternalServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21AppPredictionInternal30ContextualEngineInternalServer____lazy_storage___xpcListener));
  sub_1D1396120((uint64_t)self + OBJC_IVAR____TtC21AppPredictionInternal30ContextualEngineInternalServer_delegate);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21AppPredictionInternal30ContextualEngineInternalServer_suggestionStore);
}

@end