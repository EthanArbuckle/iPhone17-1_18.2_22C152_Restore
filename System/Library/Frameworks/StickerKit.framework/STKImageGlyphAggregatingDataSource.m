@interface STKImageGlyphAggregatingDataSource
- (BOOL)isEnabled;
- (BOOL)isReady;
- (NSArray)categories;
- (STKImageGlyphAggregatingDataSource)init;
- (STKImageGlyphAggregatingDataSource)initWithDataSources:(id)a3;
- (id)accessibilityTextForItem:(id)a3;
- (id)indexPathForCategory:(id)a3;
- (id)indexPathForIdentifier:(id)a3 ofType:(int64_t)a4;
- (id)indexPathForItem:(id)a3;
- (id)indexPathForItemAtIndex:(int64_t)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)sectionLayoutForSectionIndex:(int64_t)a3 environment:(id)a4;
- (id)snapshotIdentifiersInSection:(int64_t)a3;
- (int64_t)categoryIndexForIndexPath:(id)a3;
- (int64_t)glyphType;
- (int64_t)numberOfItems;
- (int64_t)numberOfItemsInCategory:(id)a3;
- (int64_t)numberOfItemsInCategoryIndex:(int64_t)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)configureWith:(id)a3;
- (void)deleteItem:(STKImageGlyph *)a3 completionHandler:(id)a4;
- (void)imageAtIndexPath:(NSIndexPath *)a3 completionHandler:(id)a4;
- (void)imageForImageGlyph:(STKImageGlyph *)a3 completionHandler:(id)a4;
- (void)moveItemFromIndex:(int64_t)a3 toIndex:(int64_t)a4 completionHandler:(id)a5;
- (void)moveItemFromIndexPath:(NSIndexPath *)a3 toIndexPath:(NSIndexPath *)a4 completionHandler:(id)a5;
- (void)refresh;
- (void)setGlyphType:(int64_t)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)stickerAtIndexPath:(NSIndexPath *)a3 completionHandler:(id)a4;
- (void)stickerForImageGlyph:(STKImageGlyph *)a3 completionHandler:(id)a4;
@end

@implementation STKImageGlyphAggregatingDataSource

- (BOOL)isEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR___STKImageGlyphAggregatingDataSource_isEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsEnabled:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___STKImageGlyphAggregatingDataSource_isEnabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isReady
{
  v2 = self;
  char v3 = sub_24524AEE8();

  return v3 & 1;
}

- (int64_t)glyphType
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___STKImageGlyphAggregatingDataSource_glyphType);
  swift_beginAccess();
  return *v2;
}

- (void)setGlyphType:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___STKImageGlyphAggregatingDataSource_glyphType);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (STKImageGlyphAggregatingDataSource)initWithDataSources:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ED1220);
  v4 = (objc_class *)sub_2453FFD18();
  *((unsigned char *)&self->super.isa + OBJC_IVAR___STKImageGlyphAggregatingDataSource_isEnabled) = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___STKImageGlyphAggregatingDataSource_glyphType) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___STKImageGlyphAggregatingDataSource_dataSources) = v4;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ImageGlyphAggregatingDataSource();
  return [(STKImageGlyphAggregatingDataSource *)&v6 init];
}

- (void)configureWith:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24524B5BC((uint64_t)v4);
}

- (void)refresh
{
  v2 = self;
  sub_24524B748();
}

- (NSArray)categories
{
  v2 = self;
  sub_24524B908();

  type metadata accessor for ImageGlyphCategory(0);
  char v3 = (void *)sub_2453FFCF8();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (int64_t)numberOfSections
{
  v2 = self;
  int64_t v3 = sub_24524BA58();

  return v3;
}

- (int64_t)numberOfItems
{
  v2 = self;
  int64_t v3 = sub_24524BA98();

  return v3;
}

- (id)sectionLayoutForSectionIndex:(int64_t)a3 environment:(id)a4
{
  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_245251878(a3);
  if (v8)
  {
    id v10 = objc_msgSend(v8, sel_sectionLayoutForSectionIndex_environment_, v9, a4);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    id v11 = objc_allocWithZone((Class)type metadata accessor for ImageGlyphUIConfiguration());
    id v12 = sub_24536AFA0(0, 3);
    id v10 = _s10StickerKit25ImageGlyphUIConfigurationC6layout3forSo25NSCollectionLayoutSectionCSo0hI11Environment_p_tF_0();
    swift_unknownObjectRelease();
  }

  return v10;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  id v4 = self;
  id v5 = sub_24524BDD8(a3);

  return (int64_t)v5;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  id v4 = self;
  id v5 = sub_24524BE20(a3);

  return (int64_t)v5;
}

- (id)itemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_2453FCDC8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FCD68();
  v8 = self;
  id v9 = sub_24524BFA8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v9;
}

- (id)snapshotIdentifiersInSection:(int64_t)a3
{
  uint64_t v4 = self;
  uint64_t v5 = sub_245251878(a3);
  if (v5)
  {
    v7 = (STKImageGlyphAggregatingDataSource *)objc_msgSend(v5, sel_snapshotIdentifiersInSection_, v6);
    sub_2453FFD18();

    swift_unknownObjectRelease();
    uint64_t v4 = v7;
  }

  v8 = (void *)sub_2453FFCF8();
  swift_bridgeObjectRelease();

  return v8;
}

- (void)stickerAtIndexPath:(NSIndexPath *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v7 - 8);
  id v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ED1208;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED1210;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED1218, (uint64_t)v14);
  swift_release();
}

- (id)accessibilityTextForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24524CACC(v4);
  uint64_t v7 = v6;

  if (v7)
  {
    uint64_t v8 = (void *)sub_2453FFB08();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)imageAtIndexPath:(NSIndexPath *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v7 - 8);
  id v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ED11E8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED11F0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED11F8, (uint64_t)v14);
  swift_release();
}

- (id)indexPathForItem:(id)a3
{
  return sub_245250564(self, (uint64_t)a2, a3, (void (*)(id))sub_24524D6EC);
}

- (void)deleteItem:(STKImageGlyph *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v7 - 8);
  id v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ED11C8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED11D0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED11D8, (uint64_t)v14);
  swift_release();
}

- (void)moveItemFromIndex:(int64_t)a3 toIndex:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
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
  v15[4] = &unk_268ED11A8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268ED11B0;
  v16[5] = v15;
  uint64_t v17 = self;
  sub_2453D38BC((uint64_t)v11, (uint64_t)&unk_268ED11B8, (uint64_t)v16);
  swift_release();
}

- (void)moveItemFromIndexPath:(NSIndexPath *)a3 toIndexPath:(NSIndexPath *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
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
  v15[4] = &unk_268ED1188;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268ED1190;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  v19 = self;
  sub_2453D38BC((uint64_t)v11, (uint64_t)&unk_268ED1198, (uint64_t)v16);
  swift_release();
}

- (void)stickerForImageGlyph:(STKImageGlyph *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ED1168;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED1170;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED1178, (uint64_t)v14);
  swift_release();
}

- (void)imageForImageGlyph:(STKImageGlyph *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ED1158;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED41F0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED2550, (uint64_t)v14);
  swift_release();
}

- (id)indexPathForCategory:(id)a3
{
  return sub_245250564(self, (uint64_t)a2, a3, (void (*)(id))sub_245250200);
}

- (id)indexPathForItemAtIndex:(int64_t)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEC80);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = self;
  sub_2452506AC(a3, v7);

  uint64_t v9 = sub_2453FCDC8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) != 1)
  {
    uint64_t v11 = (void *)sub_2453FCD58();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
  }

  return v11;
}

- (id)indexPathForIdentifier:(id)a3 ofType:(int64_t)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEC80);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FFB38();
  uint64_t v9 = self;
  sub_245250BE8((char **)a4, (uint64_t)v8);

  swift_bridgeObjectRelease();
  uint64_t v10 = sub_2453FCDC8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
  {
    uint64_t v12 = (void *)sub_2453FCD58();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  }

  return v12;
}

- (int64_t)numberOfItemsInCategory:(id)a3
{
  id v4 = *(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0x1D0);
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = (void *)v4(v5);
  if (v7)
  {
    id v8 = objc_msgSend(v7, sel_numberOfItemsInCategory_, v5);

    swift_unknownObjectRelease();
    return (int64_t)v8;
  }
  else
  {

    return 0;
  }
}

- (int64_t)numberOfItemsInCategoryIndex:(int64_t)a3
{
  id v4 = (void *)MEMORY[0x263F8EED0];
  id v5 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0xD8);
  uint64_t v6 = self;
  unint64_t v7 = v5();
  if (v7 >> 62) {
    int64_t v8 = sub_2454009D8();
  }
  else {
    int64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v9 = swift_bridgeObjectRelease();
  if (v8 <= a3)
  {
    int64_t v13 = 0;
    goto LABEL_10;
  }
  int64_t result = ((uint64_t (*)(uint64_t))v5)(v9);
  if ((result & 0xC000000000000001) != 0)
  {
    uint64_t v11 = (STKImageGlyphAggregatingDataSource *)MEMORY[0x24569EB30](a3, result);
    goto LABEL_8;
  }
  if (a3 < 0)
  {
    __break(1u);
  }
  else if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a3)
  {
    uint64_t v11 = (STKImageGlyphAggregatingDataSource *)*(id *)(result + 8 * a3 + 32);
LABEL_8:
    uint64_t v12 = v11;
    swift_bridgeObjectRelease();
    int64_t v13 = (*(uint64_t (**)(STKImageGlyphAggregatingDataSource *))((*v4 & (uint64_t)v6->super.isa) + 0x180))(v12);

    uint64_t v6 = v12;
LABEL_10:

    return v13;
  }
  __break(1u);
  return result;
}

- (int64_t)categoryIndexForIndexPath:(id)a3
{
  uint64_t v4 = sub_2453FCDC8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FCD68();
  int64_t v8 = self;
  int64_t v9 = sub_24525139C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (STKImageGlyphAggregatingDataSource)init
{
  int64_t result = (STKImageGlyphAggregatingDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end