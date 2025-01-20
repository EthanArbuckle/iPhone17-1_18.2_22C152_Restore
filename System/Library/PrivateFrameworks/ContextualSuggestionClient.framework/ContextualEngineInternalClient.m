@interface ContextualEngineInternalClient
- (_TtC26ContextualSuggestionClient30ContextualEngineInternalClient)init;
- (void)fetchAllSnapshotsWithCompletion:(id)a3;
- (void)fetchSnapshotOverrideWithCompletion:(id)a3;
- (void)overrideWithSnapshot:(ATXContextualSuggestionSnapshot *)a3 completion:(id)a4;
- (void)updateWithCompletion:(id)a3;
@end

@implementation ContextualEngineInternalClient

- (void)fetchAllSnapshotsWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17A390);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24A7B3498();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2697BA068;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2697BA070;
  v12[5] = v11;
  swift_retain();
  sub_24A7857A8((uint64_t)v7, (uint64_t)&unk_2697BA078, (uint64_t)v12);
  swift_release();
}

- (void)fetchSnapshotOverrideWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17A390);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24A7B3498();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2697BA048;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2697BA050;
  v12[5] = v11;
  swift_retain();
  sub_24A7857A8((uint64_t)v7, (uint64_t)&unk_2697BA058, (uint64_t)v12);
  swift_release();
}

- (void)overrideWithSnapshot:(ATXContextualSuggestionSnapshot *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17A390);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_24A7B3498();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2697BA028;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2697BA030;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_24A7857A8((uint64_t)v9, (uint64_t)&unk_2697BA038, (uint64_t)v14);
  swift_release();
}

- (void)updateWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17A390);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24A7B3498();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2697B9FE8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2697B9FF8;
  v12[5] = v11;
  swift_retain();
  sub_24A7857A8((uint64_t)v7, (uint64_t)&unk_2697BA008, (uint64_t)v12);
  swift_release();
}

- (_TtC26ContextualSuggestionClient30ContextualEngineInternalClient)init
{
  swift_defaultActor_initialize();
  *(void *)&self->_anon_60[8] = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ContextualEngineInternalClient();
  return [(ContextualEngineInternalClient *)&v4 init];
}

@end