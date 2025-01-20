@interface MapsInsightsExtensionModel
- (void)mapsInsightsFor:(NSArray *)a3 completionHandler:(id)a4;
@end

@implementation MapsInsightsExtensionModel

- (void)mapsInsightsFor:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B0C7F80);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_243958800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268D9BF20;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268DA2C50;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_243937CA0((uint64_t)v9, (uint64_t)&unk_268D9CA90, (uint64_t)v14);
  swift_release();
}

@end