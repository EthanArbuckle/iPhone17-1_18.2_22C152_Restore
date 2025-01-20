@interface TaskLimitersObjC
- (_TtC14ACSEFoundation16TaskLimitersObjC)init;
- (void)performClosureNoParamsWithIdentifier:(id)a3 task:(id)a4 completion:(id)a5;
- (void)performWithIdentifier:(id)a3 task:(id)a4 completion:(id)a5;
@end

@implementation TaskLimitersObjC

- (void)performWithIdentifier:(id)a3 task:(id)a4 completion:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B121CD8);
  MEMORY[0x270FA5388](v8 - 8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = _Block_copy(a5);
  uint64_t v13 = sub_246D3E098();
  uint64_t v15 = v14;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v11;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v12;
  uint64_t v18 = sub_246D3E178();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v10, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = self;
  v19[5] = v13;
  v19[6] = v15;
  v19[7] = sub_246D3D5A0;
  v19[8] = v16;
  v19[9] = sub_246D3D5A8;
  v19[10] = v17;
  v20 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_246D3BFCC((uint64_t)v10, (uint64_t)&unk_2691E2AB8, (uint64_t)v19);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)performClosureNoParamsWithIdentifier:(id)a3 task:(id)a4 completion:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B121CD8);
  MEMORY[0x270FA5388](v8 - 8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = _Block_copy(a5);
  uint64_t v13 = sub_246D3E098();
  uint64_t v15 = v14;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v11;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v12;
  uint64_t v18 = sub_246D3E178();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v10, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = self;
  v19[5] = v13;
  v19[6] = v15;
  v19[7] = sub_246D3D534;
  v19[8] = v16;
  v19[9] = sub_246D3D574;
  v19[10] = v17;
  v20 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_246D2CCEC((uint64_t)v10, (uint64_t)&unk_2691E2AB0, (uint64_t)v19);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC14ACSEFoundation16TaskLimitersObjC)init
{
  uint64_t v3 = OBJC_IVAR____TtC14ACSEFoundation16TaskLimitersObjC_taskLimiters;
  type metadata accessor for TaskLimiters();
  v4 = (objc_class *)swift_allocObject();
  v5 = self;
  swift_defaultActor_initialize();
  *((void *)v4 + 14) = MEMORY[0x263F8EE80];
  *(Class *)((char *)&self->super.isa + v3) = v4;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for TaskLimitersObjC();
  return [(TaskLimitersObjC *)&v7 init];
}

- (void).cxx_destruct
{
}

@end