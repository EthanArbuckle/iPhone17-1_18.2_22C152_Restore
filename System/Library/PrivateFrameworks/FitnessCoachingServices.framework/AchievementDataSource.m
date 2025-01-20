@interface AchievementDataSource
- (_TtC23FitnessCoachingServices21AchievementDataSource)init;
- (void)achievementsWithNames:(NSArray *)a3 completion:(id)a4;
- (void)monthlyChallengeForDate:(NSDate *)a3 calendar:(NSCalendar *)a4 completion:(id)a5;
@end

@implementation AchievementDataSource

- (_TtC23FitnessCoachingServices21AchievementDataSource)init
{
  result = (_TtC23FitnessCoachingServices21AchievementDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23FitnessCoachingServices21AchievementDataSource_query);
  swift_bridgeObjectRelease();
}

- (void)monthlyChallengeForDate:(NSDate *)a3 calendar:(NSCalendar *)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD746F0);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1D3C2F2E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA6B66A8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA6B66B0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1D3BEE56C((uint64_t)v11, (uint64_t)&unk_1EA6B66B8, (uint64_t)v16);
  swift_release();
}

- (void)achievementsWithNames:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD746F0);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1D3C2F2E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA6B6658;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA6B6668;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1D3BEE56C((uint64_t)v9, (uint64_t)&unk_1EA6B6678, (uint64_t)v14);
  swift_release();
}

@end