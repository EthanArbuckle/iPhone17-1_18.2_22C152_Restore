@interface HFActivityLogCoordinator_Swift
- (HFActivityLogCoordinator_Swift)init;
- (HFActivityLogCoordinator_Swift)initWithHome:(id)a3;
- (void)eventsExistWithCompletionHandler:(id)a3;
@end

@implementation HFActivityLogCoordinator_Swift

- (HFActivityLogCoordinator_Swift)initWithHome:(id)a3
{
  id v3 = a3;
  v4 = (HFActivityLogCoordinator_Swift *)sub_20BA7B56C(v3);

  return v4;
}

- (void)eventsExistWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E3E0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_20BCE7870();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2676AEEB0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2676AEEB8;
  v12[5] = v11;
  swift_retain();
  sub_20BAC5AB0((uint64_t)v7, (uint64_t)&unk_2676AEEC0, (uint64_t)v12);
  swift_release();
}

- (HFActivityLogCoordinator_Swift)init
{
  swift_defaultActor_initialize();
  result = (HFActivityLogCoordinator_Swift *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end