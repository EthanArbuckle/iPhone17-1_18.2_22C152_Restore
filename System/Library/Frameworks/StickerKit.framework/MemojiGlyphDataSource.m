@interface MemojiGlyphDataSource
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
- (int64_t)numberOfSections;
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

@implementation MemojiGlyphDataSource

- (BOOL)isEnabled
{
  return (self->_deviceIsLocked[0] & 1) == 0;
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
  *(void *)&self->categories[6] = sub_2453FFD18();
  swift_retain();
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)configureWith:(id)a3
{
  uint64_t v5 = *(void *)&self->glyphType[6];
  id v6 = objc_allocWithZone((Class)type metadata accessor for ImageGlyphUIConfiguration());
  id v7 = a3;
  swift_retain();
  id v8 = sub_24536AFA0(a3, v5);
  id v9 = *(id *)&self->$__lazy_storage_$_uiConfig[6];
  *(void *)&self->$__lazy_storage_$_uiConfig[6] = v8;

  swift_release();
}

- (void)refresh
{
  swift_retain();
  self->_deviceIsLocked[0] = MKBGetDeviceLockState() - 1 < 2;
  sub_24533D9D8();

  swift_release();
}

- (int64_t)numberOfSections
{
  return *(void *)(*(void *)&self->puppetNames[6] + 16);
}

- (int64_t)numberOfItems
{
  uint64_t v2 = *(void *)(*(void *)&self->puppetNames[6] + 16);
  uint64_t v3 = *(void *)(*(void *)&self->poses[6] + 16);
  int64_t result = v2 * v3;
  if ((unsigned __int128)(v2 * (__int128)v3) >> 64 != (v2 * v3) >> 63) {
    __break(1u);
  }
  return result;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return *(void *)(*(void *)&self->poses[6] + 16);
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  return sub_24533ACB4((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(uint64_t))sub_24533A9EC);
}

- (id)itemAtIndexPath:(id)a3
{
  return sub_24533AF68((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_24533ACF8);
}

- (id)accessibilityTextForItem:(id)a3
{
  return sub_24533B440((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_24533B078);
}

- (id)snapshotIdentifiersInSection:(int64_t)a3
{
  return sub_24533B588((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_24533B4D8);
}

- (id)indexPathForCategory:(id)a3
{
  return sub_24533BE3C((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_24533B608);
}

- (id)indexPathForIdentifier:(id)a3 ofType:(int64_t)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEC80);
  MEMORY[0x270FA5388](v6 - 8);
  id v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2453FFB38();
  if (a4 != 2 || (uint64_t v11 = sub_2453AC2BC(v9, v10, *(void **)&self->puppetNames[6]), (v12 & 1) != 0))
  {
    uint64_t v14 = sub_2453FCDC8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 1, 1, v14);
  }
  else
  {
    uint64_t v13 = v11;
    swift_retain();
    MEMORY[0x24569B030](0, v13);
    uint64_t v14 = sub_2453FCDC8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 0, 1, v14);
    swift_release();
  }
  swift_bridgeObjectRelease();
  sub_2453FCDC8();
  uint64_t v15 = *(void *)(v14 - 8);
  v16 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14) != 1)
  {
    v16 = (void *)sub_2453FCD58();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v8, v14);
  }

  return v16;
}

- (int64_t)numberOfItemsInCategory:(id)a3
{
  uint64_t v3 = *(void *)(*(void *)&self->puppetNames[6] + 16);
  uint64_t v4 = *(void *)(*(void *)&self->poses[6] + 16);
  int64_t result = v3 * v4;
  if ((unsigned __int128)(v3 * (__int128)v4) >> 64 != (v3 * v4) >> 63) {
    __break(1u);
  }
  return result;
}

- (id)sectionLayoutForSectionIndex:(int64_t)a3 environment:(id)a4
{
  return sub_24533BA00((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t))sub_24533A9EC);
}

- (id)indexPathForItemAtIndex:(int64_t)a3
{
  return sub_24533BB78((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_24533BA80);
}

- (id)indexPathForItem:(id)a3
{
  return sub_24533BE3C((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_24533BCB4);
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
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ED42A8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED42B0;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED42B8, (uint64_t)v14);
  swift_release();
}

- (void)moveItemFromIndex:(int64_t)a3 toIndex:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268ED4288;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268ED4290;
  v16[5] = v15;
  swift_retain();
  sub_2453D38BC((uint64_t)v11, (uint64_t)&unk_268ED4298, (uint64_t)v16);
  swift_release();
}

- (void)moveItemFromIndexPath:(NSIndexPath *)a3 toIndexPath:(NSIndexPath *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268ED4268;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268ED4270;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_2453D38BC((uint64_t)v11, (uint64_t)&unk_268ED4278, (uint64_t)v16);
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
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ED4248;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED4250;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED4258, (uint64_t)v14);
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
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ED4228;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED4230;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED4238, (uint64_t)v14);
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
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ED4208;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED4210;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED4218, (uint64_t)v14);
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
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ED41E8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED41F0;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED2550, (uint64_t)v14);
  swift_release();
}

@end