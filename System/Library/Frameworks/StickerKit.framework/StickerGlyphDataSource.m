@interface StickerGlyphDataSource
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
- (void)fetchAnimatedIdentifiers;
- (void)fetchStickersWithCompletion:(id)a3;
- (void)imageAtIndexPath:(NSIndexPath *)a3 completionHandler:(id)a4;
- (void)imageForImageGlyph:(STKImageGlyph *)a3 completionHandler:(id)a4;
- (void)moveItemFromIndex:(int64_t)a3 toIndex:(int64_t)a4 completionHandler:(id)a5;
- (void)moveItemFromIndexPath:(NSIndexPath *)a3 toIndexPath:(NSIndexPath *)a4 completionHandler:(id)a5;
- (void)refresh;
- (void)setIsReady:(BOOL)a3;
- (void)stickerAtIndexPath:(NSIndexPath *)a3 completionHandler:(id)a4;
- (void)stickerForImageGlyph:(STKImageGlyph *)a3 completionHandler:(id)a4;
@end

@implementation StickerGlyphDataSource

- (BOOL)isEnabled
{
  swift_retain();
  v3 = (char *)sub_2452E8394();
  v4 = (unsigned __int8 *)(*(void *)&v3[OBJC_IVAR____TtC10StickerKit25ImageGlyphUIConfiguration_viewConfiguration]
                         + OBJC_IVAR___STKImageGlyphViewConfiguration_doesSupportImageGlyph);
  swift_beginAccess();
  LODWORD(v4) = *v4;

  if (v4 == 1)
  {
    unsigned __int8 v5 = self->_deviceIsLocked[0];
    swift_release();
    char v6 = v5 ^ 1;
  }
  else
  {
    swift_release();
    char v6 = 0;
  }
  return v6 & 1;
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
  return 1;
}

- (NSArray)categories
{
  return (NSArray *)sub_2452F1128((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_2452E8028);
}

- (void)configureWith:(id)a3
{
  uint64_t v5 = (*((uint64_t (**)(_TtC10StickerKit22StickerGlyphDataSource *, SEL))self->super.isa + 29))(self, a2);
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
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  int64_t v4 = *(void *)&self->_lastCount[6];
  swift_retain();
  if (v4 < 0)
  {
    sub_2452EAC1C();
    int64_t v4 = *(void *)&self->_lastCount[6];
  }
  swift_release();
  return v4;
}

- (int64_t)numberOfItems
{
  int64_t v3 = *(void *)&self->_lastCount[6];
  swift_retain();
  if (v3 < 0)
  {
    sub_2452EAC1C();
    int64_t v3 = *(void *)&self->_lastCount[6];
  }
  swift_release();
  return v3;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  swift_retain();
  id v3 = sub_2452E8394();
  swift_release();

  return 1;
}

- (id)sectionLayoutForSectionIndex:(int64_t)a3 environment:(id)a4
{
  swift_unknownObjectRetain();
  swift_retain();
  id v4 = sub_2452E8394();
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
  id v7 = sub_2452E8A84();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v7;
}

- (id)accessibilityTextForItem:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_2452E8E20((uint64_t)v3);
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
  sub_2452E9DC4(a3);
  swift_release();
  uint64_t v4 = (void *)sub_2453FFCF8();
  swift_bridgeObjectRelease();

  return v4;
}

- (id)indexPathForCategory:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEC80);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = (uint64_t (*)(uint64_t))*((void *)self->super.isa + 32);
  id v9 = a3;
  uint64_t v10 = swift_retain();
  unint64_t v11 = v8(v10);
  id v12 = v9;
  LOBYTE(v9) = sub_2452F1EB8(v11, (uint64_t)v12);
  swift_bridgeObjectRelease();

  if (v9)
  {
    MEMORY[0x24569B030](0, 0);
    uint64_t v13 = sub_2453FCDC8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 0, 1, v13);
  }
  else
  {
    uint64_t v13 = sub_2453FCDC8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 1, 1, v13);
  }

  swift_release();
  sub_2453FCDC8();
  uint64_t v14 = *(void *)(v13 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v7, 1, v13) != 1)
  {
    v15 = (void *)sub_2453FCD58();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v7, v13);
  }

  return v15;
}

- (id)indexPathForItemAtIndex:(int64_t)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEC80);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_2452EA578(a3, (uint64_t)v6);
  swift_release();
  uint64_t v7 = sub_2453FCDC8();
  uint64_t v8 = *(void *)(v7 - 8);
  id v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    id v9 = (void *)sub_2453FCD58();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }

  return v9;
}

- (id)indexPathForIdentifier:(id)a3 ofType:(int64_t)a4
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEC80);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2453FFB38();
  uint64_t v10 = v9;
  swift_retain();
  sub_2452EA788(v8, v10, a4, (uint64_t)v7);
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

- (int64_t)categoryIndexForIndexPath:(id)a3
{
  uint64_t v3 = sub_2453FCDC8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FCD68();
  if (sub_2453FCDA8() <= 0) {
    int64_t v7 = 0;
  }
  else {
    int64_t v7 = -1;
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

- (int64_t)numberOfItemsInCategory:(id)a3
{
  int64_t v4 = *(void *)&self->_lastCount[6];
  id v5 = a3;
  swift_retain();
  if (v4 < 0)
  {
    sub_2452EAC1C();
    int64_t v4 = *(void *)&self->_lastCount[6];
  }

  swift_release();
  return v4;
}

- (void)fetchAnimatedIdentifiers
{
}

- (void)fetchStickersWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v5 - 8);
  int64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_268ED3478;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_268ED3480;
  v12[5] = v11;
  swift_retain();
  sub_2453D38BC((uint64_t)v7, (uint64_t)&unk_268ED3488, (uint64_t)v12);
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
  v13[4] = &unk_268ED3458;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED3460;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED3468, (uint64_t)v14);
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
  v13[4] = &unk_268ED3438;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED3440;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED3448, (uint64_t)v14);
  swift_release();
}

- (id)indexPathForItem:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEC80);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = a3;
  swift_retain();
  sub_2452ED294((uint64_t)v7, (uint64_t)v6);

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
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ED3418;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED3420;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED3428, (uint64_t)v14);
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
  v15[4] = &unk_268ED33F8;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268ED3400;
  v16[5] = v15;
  swift_retain();
  sub_2453D38BC((uint64_t)v11, (uint64_t)&unk_268ED3408, (uint64_t)v16);
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
  v15[4] = &unk_268ED33D8;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268ED33E0;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  swift_retain();
  sub_2453D38BC((uint64_t)v11, (uint64_t)&unk_268ED33E8, (uint64_t)v16);
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
  v13[4] = &unk_268ED33B8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED33C0;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED33C8, (uint64_t)v14);
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
  v13[4] = &unk_268ED3398;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED33A0;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED33A8, (uint64_t)v14);
  swift_release();
}

@end