@interface HomeMatterServicesCoordinator
- (_TtC13HomeKitDaemon29HomeMatterServicesCoordinator)init;
- (void)startWithCompletionHandler:(id)a3;
- (void)stopWithCompletionHandler:(id)a3;
@end

@implementation HomeMatterServicesCoordinator

- (void)startWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686D95D0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2302DDE70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2686D9EC0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2686D9EC8;
  v12[5] = v11;
  v13 = self;
  sub_22F6C83BC((uint64_t)v7, (uint64_t)&unk_2686D9ED0, (uint64_t)v12);
  swift_release();
}

- (void)stopWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686D95D0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2302DDE70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2686D9EB0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2686D8770;
  v12[5] = v11;
  v13 = self;
  sub_22F6C83BC((uint64_t)v7, (uint64_t)&unk_2686D98D0, (uint64_t)v12);
  swift_release();
}

- (_TtC13HomeKitDaemon29HomeMatterServicesCoordinator)init
{
  result = (_TtC13HomeKitDaemon29HomeMatterServicesCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC13HomeKitDaemon29HomeMatterServicesCoordinator_matterServer;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end