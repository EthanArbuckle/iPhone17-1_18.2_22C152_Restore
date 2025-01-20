@interface Assets
+ (_TtP25CloudSubscriptionFeatures21AssetsStatusProviding_)shared;
- (_TtC25CloudSubscriptionFeatures6Assets)init;
- (void)assetStatusWithCompletionHandler:(id)a3;
- (void)resetCachedStatusWithCompletionHandler:(id)a3;
@end

@implementation Assets

+ (_TtP25CloudSubscriptionFeatures21AssetsStatusProviding_)shared
{
  if (qword_1EB5EA128 != -1) {
    swift_once();
  }
  v2 = (void *)swift_unknownObjectRetain();
  return (_TtP25CloudSubscriptionFeatures21AssetsStatusProviding_ *)v2;
}

- (void)resetCachedStatusWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v5 - 8, v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = sub_1A8D59E10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E979F248;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E979F250;
  v13[5] = v12;
  swift_retain();
  sub_1A8D18C04((uint64_t)v8, (uint64_t)&unk_1E979F258, (uint64_t)v13);
  swift_release();
}

- (void)assetStatusWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v5 - 8, v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = sub_1A8D59E10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E979F238;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E979ED78;
  v13[5] = v12;
  swift_retain();
  sub_1A8D18C04((uint64_t)v8, (uint64_t)&unk_1E979ED80, (uint64_t)v13);
  swift_release();
}

- (_TtC25CloudSubscriptionFeatures6Assets)init
{
  swift_defaultActor_initialize();
  result = (_TtC25CloudSubscriptionFeatures6Assets *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end