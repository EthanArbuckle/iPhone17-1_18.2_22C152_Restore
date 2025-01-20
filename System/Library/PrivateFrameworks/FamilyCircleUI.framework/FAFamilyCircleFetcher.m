@interface FAFamilyCircleFetcher
- (_TtC14FamilyCircleUI21FAFamilyCircleFetcher)init;
- (void)fetchCachedFamilyCircleWithQualityOfService:(int64_t)a3 completionHandler:(id)a4;
- (void)forceFetchFamilyCircleWithQualityOfService:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation FAFamilyCircleFetcher

- (void)fetchCachedFamilyCircleWithQualityOfService:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AA85500);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_218CAF198();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_267BF0190;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267BF0198;
  v14[5] = v13;
  v15 = self;
  sub_218C50914((uint64_t)v9, (uint64_t)&unk_267BF01A0, (uint64_t)v14);
  swift_release();
}

- (void)forceFetchFamilyCircleWithQualityOfService:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AA85500);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_218CAF198();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_267BF0150;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267BEF290;
  v14[5] = v13;
  v15 = self;
  sub_218C50914((uint64_t)v9, (uint64_t)&unk_267BE8C80, (uint64_t)v14);
  swift_release();
}

- (_TtC14FamilyCircleUI21FAFamilyCircleFetcher)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(FAFamilyCircleFetcher *)&v3 init];
}

@end