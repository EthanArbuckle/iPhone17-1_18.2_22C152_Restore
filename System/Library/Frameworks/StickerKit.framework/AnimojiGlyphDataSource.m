@interface AnimojiGlyphDataSource
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
- (int64_t)glyphType;
- (int64_t)numberOfItems;
- (int64_t)numberOfItemsInCategory:(id)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (uint64_t)categoryIndexForIndexPath:(uint64_t)a1;
- (void)configureWith:(id)a3;
- (void)deleteItem:(STKImageGlyph *)a3 completionHandler:(id)a4;
- (void)imageAtIndexPath:(NSIndexPath *)a3 completionHandler:(id)a4;
- (void)imageForImageGlyph:(STKImageGlyph *)a3 completionHandler:(id)a4;
- (void)moveItemFromIndex:(int64_t)a3 toIndex:(int64_t)a4 completionHandler:(id)a5;
- (void)moveItemFromIndexPath:(NSIndexPath *)a3 toIndexPath:(NSIndexPath *)a4 completionHandler:(id)a5;
- (void)refresh;
- (void)setCategories:(id)a3;
- (void)setGlyphType:(int64_t)a3;
- (void)setIsReady:(BOOL)a3;
- (void)stickerAtIndexPath:(NSIndexPath *)a3 completionHandler:(id)a4;
- (void)stickerForImageGlyph:(STKImageGlyph *)a3 completionHandler:(id)a4;
@end

@implementation AnimojiGlyphDataSource

- (BOOL)isEnabled
{
  return 1;
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
  return *(void *)&self->glyphType[7];
}

- (void)setGlyphType:(int64_t)a3
{
  *(void *)&self->glyphType[7] = a3;
}

- (NSArray)categories
{
  type metadata accessor for ImageGlyphCategory(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2453FFCF8();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (void)setCategories:(id)a3
{
  type metadata accessor for ImageGlyphCategory(0);
  *(void *)&self->categories[7] = sub_2453FFD18();
  swift_retain();
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)configureWith:(id)a3
{
  uint64_t v5 = *(void *)&self->glyphType[7];
  id v6 = objc_allocWithZone((Class)type metadata accessor for ImageGlyphUIConfiguration());
  id v7 = a3;
  swift_retain();
  id v8 = sub_24536AFA0(a3, v5);
  id v9 = *(id *)&self->$__lazy_storage_$_uiConfig[7];
  *(void *)&self->$__lazy_storage_$_uiConfig[7] = v8;

  swift_release();
}

- (void)refresh
{
  swift_retain();
  sub_2453372CC();

  swift_release();
}

- (int64_t)numberOfItems
{
  swift_retain();
  int64_t v2 = sub_245338220();
  swift_release();
  return v2;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  swift_retain();
  unint64_t v4 = sub_2453382E4(a3);
  swift_release();
  return v4;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  return sub_24533ACB4((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(uint64_t))sub_245337180);
}

- (id)sectionLayoutForSectionIndex:(int64_t)a3 environment:(id)a4
{
  return sub_24533BA00((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t))sub_245337180);
}

- (id)itemAtIndexPath:(id)a3
{
  return sub_24533AF68((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_245338418);
}

- (id)accessibilityTextForItem:(id)a3
{
  return sub_24533B440((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_2453386F8);
}

- (id)snapshotIdentifiersInSection:(int64_t)a3
{
  return sub_24533B588((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_245338AE0);
}

- (id)indexPathForCategory:(id)a3
{
  return sub_24533BE3C((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_245338BE0);
}

- (id)indexPathForItemAtIndex:(int64_t)a3
{
  return sub_24533BB78((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_245338E14);
}

- (id)indexPathForIdentifier:(id)a3 ofType:(int64_t)a4
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEC80);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2453FFB38();
  uint64_t v10 = v9;
  swift_retain();
  sub_245339078(v8, v10, a4, (uint64_t)v7);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_2453FCDC8();
  uint64_t v12 = *(void *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v7, 1, v11) != 1)
  {
    v13 = (void *)sub_2453FCD58();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v11);
  }

  return v13;
}

- (int64_t)numberOfItemsInCategory:(id)a3
{
  id v3 = a3;
  swift_retain();
  int64_t v4 = sub_245338220();

  swift_release();
  return v4;
}

- (id)indexPathForItem:(id)a3
{
  return sub_24533BE3C((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_2453393BC);
}

- (void)deleteItem:(STKImageGlyph *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v13[4] = &unk_268ED4388;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED4390;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED4398, (uint64_t)v14);
  swift_release();
}

- (void)moveItemFromIndex:(int64_t)a3 toIndex:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268ED4368;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268ED4370;
  v16[5] = v15;
  swift_retain();
  sub_2453D38BC((uint64_t)v11, (uint64_t)&unk_268ED4378, (uint64_t)v16);
  swift_release();
}

- (void)moveItemFromIndexPath:(NSIndexPath *)a3 toIndexPath:(NSIndexPath *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268ED4348;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268ED4350;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  swift_retain();
  sub_2453D38BC((uint64_t)v11, (uint64_t)&unk_268ED4358, (uint64_t)v16);
  swift_release();
}

- (void)stickerAtIndexPath:(NSIndexPath *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v13[4] = &unk_268ED4328;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED4330;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED4338, (uint64_t)v14);
  swift_release();
}

- (void)stickerForImageGlyph:(STKImageGlyph *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v13[4] = &unk_268ED4308;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED4310;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED4318, (uint64_t)v14);
  swift_release();
}

- (void)imageAtIndexPath:(NSIndexPath *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v13[4] = &unk_268ED42E8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED42F0;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED42F8, (uint64_t)v14);
  swift_release();
}

- (void)imageForImageGlyph:(STKImageGlyph *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v13[4] = &unk_268ED42C8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED42D0;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED42D8, (uint64_t)v14);
  swift_release();
}

- (uint64_t)categoryIndexForIndexPath:(uint64_t)a1
{
  uint64_t v2 = sub_2453FCDC8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FCD68();
  uint64_t v6 = *(void *)(*(void *)(a1 + 112) + 16);
  if (sub_2453FCDA8() < v6) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = -1;
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7;
}

@end