@interface RecentStickerGlyphDataSource
- (NSArray)categories;
- (int64_t)glyphType;
- (void)moveItemFromIndex:(int64_t)a3 toIndex:(int64_t)a4 completionHandler:(id)a5;
- (void)moveItemFromIndexPath:(NSIndexPath *)a3 toIndexPath:(NSIndexPath *)a4 completionHandler:(id)a5;
@end

@implementation RecentStickerGlyphDataSource

- (NSArray)categories
{
  return (NSArray *)sub_2452F1128((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_2452F1198);
}

- (int64_t)glyphType
{
  return 4;
}

- (void)moveItemFromIndex:(int64_t)a3 toIndex:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268ED32E8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268ED32F0;
  v16[5] = v15;
  swift_retain();
  sub_2453D38BC((uint64_t)v11, (uint64_t)&unk_268ED32F8, (uint64_t)v16);
  swift_release();
}

- (void)moveItemFromIndexPath:(NSIndexPath *)a3 toIndexPath:(NSIndexPath *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268ED32D8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268ED41F0;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  swift_retain();
  sub_2453D38BC((uint64_t)v11, (uint64_t)&unk_268ED2550, (uint64_t)v16);
  swift_release();
}

@end