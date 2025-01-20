@interface STKStickersOnDemandReindexer
+ (void)reindexStickersIfNecessaryWithCompletionHandler:(id)a3;
- (STKStickersOnDemandReindexer)init;
@end

@implementation STKStickersOnDemandReindexer

+ (void)reindexStickersIfNecessaryWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = a1;
  uint64_t v10 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_268ED5EB8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_268ED41F0;
  v12[5] = v11;
  sub_2453D38BC((uint64_t)v7, (uint64_t)&unk_268ED2550, (uint64_t)v12);
  swift_release();
}

- (STKStickersOnDemandReindexer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StickersOnDemandReindexer();
  return [(STKStickersOnDemandReindexer *)&v3 init];
}

@end