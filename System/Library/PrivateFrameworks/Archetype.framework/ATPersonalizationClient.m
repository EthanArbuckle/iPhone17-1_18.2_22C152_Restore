@interface ATPersonalizationClient
- (_TtC9Archetype23ATPersonalizationClient)init;
- (void)currentLocationWithEffectiveBundleIdentifier:(NSString *)a3 completionHandler:(id)a4;
- (void)freeNowWithExcludeAllDayEvents:(BOOL)a3 completionHandler:(id)a4;
- (void)topPlayedMediaWithK:(int64_t)a3 start:(int64_t)a4 end:(int64_t)a5 mediaType:(NSString *)a6 completionHandler:(id)a7;
@end

@implementation ATPersonalizationClient

- (_TtC9Archetype23ATPersonalizationClient)init
{
  return (_TtC9Archetype23ATPersonalizationClient *)ATPersonalizationClient.init()();
}

- (void)freeNowWithExcludeAllDayEvents:(BOOL)a3 completionHandler:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D118);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  uint64_t v10 = swift_allocObject();
  *(unsigned char *)(v10 + 16) = a3;
  *(void *)(v10 + 24) = v9;
  *(void *)(v10 + 32) = self;
  uint64_t v11 = sub_24867FD78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26931D188;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26931D190;
  v13[5] = v12;
  v14 = self;
  sub_24867E5C0((uint64_t)v8, (uint64_t)&unk_26931D198, (uint64_t)v13);
  swift_release();
}

- (void)topPlayedMediaWithK:(int64_t)a3 start:(int64_t)a4 end:(int64_t)a5 mediaType:(NSString *)a6 completionHandler:(id)a7
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D118);
  MEMORY[0x270FA5388]();
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = _Block_copy(a7);
  v16 = (void *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = a5;
  v16[5] = a6;
  v16[6] = v15;
  v16[7] = self;
  uint64_t v17 = sub_24867FD78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_26931D168;
  v18[5] = v16;
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_26931D170;
  v19[5] = v18;
  v20 = a6;
  v21 = self;
  sub_24867E5C0((uint64_t)v14, (uint64_t)&unk_26931D178, (uint64_t)v19);
  swift_release();
}

- (void)currentLocationWithEffectiveBundleIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D118);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = sub_24867FD78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26931D128;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26931D138;
  v13[5] = v12;
  v14 = a3;
  uint64_t v15 = self;
  sub_24867E5C0((uint64_t)v8, (uint64_t)&unk_26931D148, (uint64_t)v13);
  swift_release();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end