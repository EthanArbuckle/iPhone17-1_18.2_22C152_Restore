@interface XPCClientProxy
- (_TtC11HomeKitCore14XPCClientProxy)init;
- (void)fetchModelsWithType:(int64_t)a3 completionHandler:(id)a4;
- (void)fetchModelsWithTypes:(id)a3 completionHandler:(id)a4;
- (void)registerObserver:(id)a3 modelTypes:(id)a4 completionHandler:(id)a5;
@end

@implementation XPCClientProxy

- (_TtC11HomeKitCore14XPCClientProxy)init
{
  result = (_TtC11HomeKitCore14XPCClientProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

- (void)fetchModelsWithType:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688D15B0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11HomeKitCore14XPCClientProxy_homesStore);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_236D90E24;
  *(void *)(v13 + 24) = v11;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a3;
  *(void *)(v14 + 24) = v12;
  uint64_t v15 = sub_236DB9C90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2688D35F0;
  v16[5] = v14;
  v16[6] = sub_236D90E2C;
  v16[7] = v13;
  v17 = self;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_236D795C0((uint64_t)v9, (uint64_t)&unk_2688D3600, (uint64_t)v16);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (void)fetchModelsWithTypes:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688D15B0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  uint64_t v10 = sub_236DB9B30();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  uint64_t v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11HomeKitCore14XPCClientProxy_homesStore);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_236D90B40;
  *(void *)(v13 + 24) = v11;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v10;
  *(void *)(v14 + 24) = v12;
  uint64_t v15 = sub_236DB9C90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v8, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2688D35C8;
  v16[5] = v14;
  v16[6] = sub_236D90B80;
  v16[7] = v13;
  v17 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_236D795C0((uint64_t)v8, (uint64_t)&unk_2688D35D8, (uint64_t)v16);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (void)registerObserver:(id)a3 modelTypes:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_236DB9B30();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  swift_unknownObjectRetain();
  uint64_t v10 = self;
  sub_236D8E3AC((uint64_t)a3, v8, (uint64_t)sub_236D8FBFC, v9);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
}

@end