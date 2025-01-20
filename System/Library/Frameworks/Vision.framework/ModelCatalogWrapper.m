@interface ModelCatalogWrapper
- (_TtC19ModelCatalogWrapper19ModelCatalogWrapper)init;
- (id)foregroundBackgroundSegmentationModelBundleURLAndReturnError:(id *)a3;
- (void)downloadForegroundBackgroundSegmentationModelBundleWithCompletionHandler:(id)a3;
@end

@implementation ModelCatalogWrapper

- (void)downloadForegroundBackgroundSegmentationModelBundleWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95EF780);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1A409649C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E95F12A8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E95F12B0;
  v12[5] = v11;
  v13 = self;
  sub_1A3DAD230((uint64_t)v7, (uint64_t)&unk_1E95F12B8, (uint64_t)v12);
  swift_release();
}

- (id)foregroundBackgroundSegmentationModelBundleURLAndReturnError:(id *)a3
{
  id v3 = sub_1A3E35A58();

  return v3;
}

- (_TtC19ModelCatalogWrapper19ModelCatalogWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ModelCatalogWrapper();
  return [(ModelCatalogWrapper *)&v3 init];
}

@end