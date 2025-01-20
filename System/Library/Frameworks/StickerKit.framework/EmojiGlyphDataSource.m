@interface EmojiGlyphDataSource
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

@implementation EmojiGlyphDataSource

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

- (NSArray)categories
{
  swift_retain();
  sub_24520F504();
  swift_release();
  type metadata accessor for ImageGlyphCategory(0);
  v2 = (void *)sub_2453FFCF8();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
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
  sub_24520F768();

  swift_release();
}

- (int64_t)numberOfSections
{
  return *(void *)(*(void *)&self->emojiCategories[6] + 16);
}

- (int64_t)numberOfItems
{
  swift_retain();
  sub_24520F9BC();
  int64_t v3 = v2;
  swift_release();
  return v3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return sub_24520FB10(a3);
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  swift_retain();
  id v3 = sub_24520F428();
  swift_release();

  return 1;
}

- (id)sectionLayoutForSectionIndex:(int64_t)a3 environment:(id)a4
{
  swift_unknownObjectRetain();
  swift_retain();
  id v4 = sub_24520F428();
  id v5 = _s10StickerKit25ImageGlyphUIConfigurationC6layout3forSo25NSCollectionLayoutSectionCSo0hI11Environment_p_tF_0();
  swift_unknownObjectRelease();
  swift_release();

  return v5;
}

- (id)itemAtIndexPath:(id)a3
{
  uint64_t v3 = sub_2453FCDC8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FCD68();
  swift_retain();
  id v7 = (void *)sub_24520FC1C((uint64_t)v6);
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v7;
}

- (id)accessibilityTextForItem:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_245212C84((uint64_t)v3);
  uint64_t v5 = v4;

  swift_release();
  if (v5)
  {
    id v6 = (void *)sub_2453FFB08();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)snapshotIdentifiersInSection:(int64_t)a3
{
  swift_retain();
  sub_245210004(a3);
  swift_release();
  uint64_t v4 = (void *)sub_2453FFCF8();
  swift_bridgeObjectRelease();

  return v4;
}

- (id)indexPathForItemAtIndex:(int64_t)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEC80);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_245210390(a3, (uint64_t)v6);
  swift_release();
  uint64_t v7 = sub_2453FCDC8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    uint64_t v9 = (void *)sub_2453FCD58();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }

  return v9;
}

- (int64_t)numberOfItemsInCategory:(id)a3
{
  return sub_2452105BC((uint64_t)a3);
}

- (int64_t)categoryIndexForIndexPath:(id)a3
{
  uint64_t v4 = sub_2453FCDC8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FCD68();
  uint64_t v8 = *(void *)(*(void *)&self->emojiCategories[6] + 16);
  swift_retain();
  if (sub_2453FCDA8() >= v8) {
    int64_t v9 = -1;
  }
  else {
    int64_t v9 = sub_2453FCDA8();
  }
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (id)indexPathForCategory:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEC80);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2452123E8(*(void *)&self->emojiCategories[6], (uint64_t)a3);
  if (v9)
  {
    uint64_t v12 = sub_2453FCDC8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  }
  else
  {
    uint64_t v10 = v8;
    id v11 = a3;
    swift_retain();
    MEMORY[0x24569B030](0, v10);
    uint64_t v12 = sub_2453FCDC8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 0, 1, v12);

    swift_release();
  }
  sub_2453FCDC8();
  uint64_t v13 = *(void *)(v12 - 8);
  v14 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v7, 1, v12) != 1)
  {
    v14 = (void *)sub_2453FCD58();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v7, v12);
  }

  return v14;
}

- (id)indexPathForIdentifier:(id)a3 ofType:(int64_t)a4
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEC80);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2453FFB38();
  uint64_t v10 = v9;
  swift_retain();
  sub_245210988(v8, v10, a4, (unint64_t)v7);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_2453FCDC8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v7, 1, v11) != 1)
  {
    uint64_t v13 = (void *)sub_2453FCD58();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v11);
  }

  return v13;
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
  v13[4] = &unk_268ED0018;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED0020;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED0028, (uint64_t)v14);
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
  v15[4] = &unk_268ECFFF8;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268ED0000;
  v16[5] = v15;
  swift_retain();
  sub_2453D38BC((uint64_t)v11, (uint64_t)&unk_268ED0008, (uint64_t)v16);
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
  v15[4] = &unk_268ECFFD8;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268ECFFE0;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  swift_retain();
  sub_2453D38BC((uint64_t)v11, (uint64_t)&unk_268ECFFE8, (uint64_t)v16);
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
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ECFFB8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ECFFC0;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ECFFC8, (uint64_t)v14);
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
  v13[4] = &unk_268ECFF98;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ECFFA0;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ECFFA8, (uint64_t)v14);
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
  v13[4] = &unk_268ECFF78;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ECFF80;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ECFF88, (uint64_t)v14);
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
  v13[4] = &unk_268ECFF68;
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