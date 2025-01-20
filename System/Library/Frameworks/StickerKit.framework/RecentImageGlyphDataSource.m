@interface RecentImageGlyphDataSource
- (BOOL)isEnabled;
- (BOOL)isReady;
- (NSArray)categories;
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
- (void)setIsReady:(BOOL)a3;
- (void)stickerAtIndexPath:(NSIndexPath *)a3 completionHandler:(id)a4;
- (void)stickerForImageGlyph:(STKImageGlyph *)a3 completionHandler:(id)a4;
@end

@implementation RecentImageGlyphDataSource

- (NSArray)categories
{
  swift_retain();
  sub_2453CDE58();
  swift_release();
  type metadata accessor for ImageGlyphCategory(0);
  v2 = (void *)sub_2453FFCF8();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (BOOL)isEnabled
{
  return self->isEnabled[0];
}

- (void)setIsEnabled:(BOOL)a3
{
  self->isEnabled[0] = a3;
}

- (BOOL)isReady
{
  return self->isReady[0];
}

- (void)setIsReady:(BOOL)a3
{
  self->isReady[0] = a3;
}

- (int64_t)glyphType
{
  return *(void *)&self->glyphType[6];
}

- (void)setGlyphType:(int64_t)a3
{
  *(void *)&self->glyphType[6] = a3;
}

- (id)indexPathForItemAtIndex:(int64_t)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEC80);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  unint64_t v7 = sub_2453D05D0();
  if (v7 >> 62) {
    int64_t v8 = sub_2454009D8();
  }
  else {
    int64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v8 <= a3)
  {
    uint64_t v9 = sub_2453FCDC8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  }
  else
  {
    MEMORY[0x24569B030](a3, 0);
    uint64_t v9 = sub_2453FCDC8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 0, 1, v9);
  }
  swift_release();
  sub_2453FCDC8();
  uint64_t v10 = *(void *)(v9 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) != 1)
  {
    v11 = (void *)sub_2453FCD58();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v6, v9);
  }

  return v11;
}

- (id)indexPathForIdentifier:(id)a3 ofType:(int64_t)a4
{
  return 0;
}

- (void)configureWith:(id)a3
{
  uint64_t v5 = *(void *)&self->glyphType[6];
  id v6 = objc_allocWithZone((Class)type metadata accessor for ImageGlyphUIConfiguration());
  id v7 = a3;
  swift_retain();
  id v8 = sub_24536AFA0(a3, v5);
  id v9 = *(id *)&self->imageGlyphCache[5];
  *(void *)&self->imageGlyphCache[5] = v8;

  swift_release();
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  swift_retain();
  id v3 = sub_2453CE798();
  swift_release();

  return 1;
}

- (id)sectionLayoutForSectionIndex:(int64_t)a3 environment:(id)a4
{
  swift_unknownObjectRetain();
  swift_retain();
  id v4 = sub_2453CE798();
  id v5 = _s10StickerKit25ImageGlyphUIConfigurationC6layout3forSo25NSCollectionLayoutSectionCSo0hI11Environment_p_tF_0();
  swift_unknownObjectRelease();
  swift_release();

  return v5;
}

- (void)moveItemFromIndex:(int64_t)a3 toIndex:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268ED63F8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268ED6400;
  v16[5] = v15;
  swift_retain();
  sub_2453D38BC((uint64_t)v11, (uint64_t)&unk_268ED6408, (uint64_t)v16);
  swift_release();
}

- (void)moveItemFromIndexPath:(NSIndexPath *)a3 toIndexPath:(NSIndexPath *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268ED63D8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268ED63E0;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  swift_retain();
  sub_2453D38BC((uint64_t)v11, (uint64_t)&unk_268ED63E8, (uint64_t)v16);
  swift_release();
}

- (void)refresh
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v3 - 8);
  id v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  swift_retain();
  sub_2453FF5C8();
  swift_release();
  uint64_t v6 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = self;
  swift_retain();
  sub_245262154((uint64_t)v5, (uint64_t)&unk_268ED63C8, (uint64_t)v7);
  swift_release();
  swift_release();
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItems
{
  swift_retain();
  unint64_t v2 = sub_2453D05D0();
  if (v2 >> 62) {
    int64_t v3 = sub_2454009D8();
  }
  else {
    int64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_release();
  swift_bridgeObjectRelease();
  return v3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  if (a3) {
    return 0;
  }
  swift_retain();
  unint64_t v4 = sub_2453D05D0();
  if (v4 >> 62) {
    int64_t v3 = sub_2454009D8();
  }
  else {
    int64_t v3 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_release();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)itemAtIndexPath:(id)a3
{
  uint64_t v3 = sub_2453FCDC8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FCD68();
  swift_retain();
  id v7 = sub_2453D0EAC((uint64_t)v6);
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v7;
}

- (id)accessibilityTextForItem:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_2453DE6E8((uint64_t)v3);
  uint64_t v5 = v4;

  swift_release();
  if (v5)
  {
    uint64_t v6 = (void *)sub_2453FFB08();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)snapshotIdentifiersInSection:(int64_t)a3
{
  swift_retain();
  sub_2453D1238(a3);
  swift_release();
  uint64_t v4 = (void *)sub_2453FFCF8();
  swift_bridgeObjectRelease();

  return v4;
}

- (int64_t)numberOfItemsInCategory:(id)a3
{
  id v3 = a3;
  swift_retain();
  int64_t v4 = sub_2453D13E4(v3);

  swift_release();
  return v4;
}

- (int64_t)categoryIndexForIndexPath:(id)a3
{
  uint64_t v3 = sub_2453FCDC8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FCD68();
  swift_retain();
  if (sub_2453FCDA8() <= 0) {
    int64_t v7 = sub_2453FCDA8();
  }
  else {
    int64_t v7 = -1;
  }
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

- (id)indexPathForCategory:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEC80);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = a3;
  swift_retain();
  sub_2453D16CC(v7, (uint64_t)v6);

  swift_release();
  uint64_t v8 = sub_2453FCDC8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    uint64_t v10 = (void *)sub_2453FCD58();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }

  return v10;
}

- (void)deleteItem:(STKImageGlyph *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ED63A8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED63B0;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED63B8, (uint64_t)v14);
  swift_release();
}

- (id)indexPathForItem:(id)a3
{
  return 0;
}

- (void)stickerAtIndexPath:(NSIndexPath *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ED6388;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED6390;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED6398, (uint64_t)v14);
  swift_release();
}

- (void)imageAtIndexPath:(NSIndexPath *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ED6368;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED6370;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED6378, (uint64_t)v14);
  swift_release();
}

- (void)imageForImageGlyph:(STKImageGlyph *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ED6348;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED6350;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED6358, (uint64_t)v14);
  swift_release();
}

- (void)stickerForImageGlyph:(STKImageGlyph *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ED6318;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED41F0;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED2550, (uint64_t)v14);
  swift_release();
}

@end