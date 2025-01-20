@interface GPServiceSideExportedObject
- (void)didFinishServiceConfiguration;
- (void)setIsLoadingRecipe:(BOOL)a3;
- (void)setPromptElements:(id)a3;
- (void)setRecipeData:(id)a3;
- (void)setSourceImage:(id)a3;
- (void)startUpscaling;
@end

@implementation GPServiceSideExportedObject

- (void)didFinishServiceConfiguration
{
}

- (void)setPromptElements:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3BD50);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243EB156C(0, (unint64_t *)&qword_268E39740);
  uint64_t v7 = sub_2443BA7C0();
  uint64_t v8 = sub_2443BA9E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  sub_2443BA950();
  swift_retain_n();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_2443BA940();
  v10 = (void *)swift_allocObject();
  uint64_t v11 = MEMORY[0x263F8F500];
  v10[2] = v9;
  v10[3] = v11;
  v10[4] = self;
  v10[5] = v7;
  sub_243EACE30((uint64_t)v6, (uint64_t)&unk_268E40190, (uint64_t)v10);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)setIsLoadingRecipe:(BOOL)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3BD50);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2443BA9E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_2443BA950();
  swift_retain_n();
  uint64_t v9 = sub_2443BA940();
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = MEMORY[0x263F8F500];
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = v11;
  *(void *)(v10 + 32) = self;
  *(unsigned char *)(v10 + 40) = a3;
  sub_243EACFFC((uint64_t)v7, (uint64_t)&unk_268E40188, v10);
  swift_release();
  swift_release();
}

- (void)setRecipeData:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3BD50);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if (a3)
  {
    id v8 = a3;
    uint64_t v9 = sub_2443B5380();
    unint64_t v11 = v10;
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v11 = 0xF000000000000000;
  }
  uint64_t v12 = sub_2443BA9E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  sub_2443BA950();
  swift_retain();
  sub_243EE0D98(v9, v11);
  uint64_t v13 = sub_2443BA940();
  v14 = (void *)swift_allocObject();
  uint64_t v15 = MEMORY[0x263F8F500];
  v14[2] = v13;
  v14[3] = v15;
  v14[4] = self;
  v14[5] = v9;
  v14[6] = v11;
  sub_243EACE30((uint64_t)v7, (uint64_t)&unk_268E40180, (uint64_t)v14);
  swift_release();
  sub_243ECBC24(v9, v11);
  swift_release();
}

- (void)setSourceImage:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3BD50);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2443BA9E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_2443BA950();
  id v9 = a3;
  swift_retain_n();
  id v10 = v9;
  uint64_t v11 = sub_2443BA940();
  uint64_t v12 = (void *)swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8F500];
  v12[2] = v11;
  v12[3] = v13;
  v12[4] = a3;
  v12[5] = self;
  sub_243EACE30((uint64_t)v7, (uint64_t)&unk_268E40178, (uint64_t)v12);

  swift_release();
  swift_release();
}

- (void)startUpscaling
{
}

@end