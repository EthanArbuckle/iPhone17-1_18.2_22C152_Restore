@interface AvatarGlyphDataSource
- (BOOL)isEnabled;
- (NSArray)categories;
- (_TtC10StickerKit21AvatarGlyphDataSource)initWithDataSources:(id)a3;
- (id)accessibilityTextForItem:(id)a3;
- (id)indexPathForCategory:(id)a3;
- (id)indexPathForIdentifier:(id)a3 ofType:(int64_t)a4;
- (id)indexPathForItem:(id)a3;
- (int64_t)glyphType;
- (int64_t)numberOfItemsInCategory:(id)a3;
- (void)configureWith:(id)a3;
@end

@implementation AvatarGlyphDataSource

- (BOOL)isEnabled
{
  v2 = self;
  v3 = (char *)sub_245335218();
  v4 = (unsigned __int8 *)(*(void *)&v3[OBJC_IVAR____TtC10StickerKit25ImageGlyphUIConfiguration_viewConfiguration]
                         + OBJC_IVAR___STKImageGlyphViewConfiguration_doesSupportImageGlyph);
  swift_beginAccess();
  LODWORD(v4) = *v4;

  if (v4 == 1)
  {
    unint64_t v5 = sub_24524B2E0();
    if (v5 >> 62) {
      uint64_t v6 = sub_2454009D8();
    }
    else {
      uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }

    swift_bridgeObjectRelease();
    return v6 != 0;
  }
  else
  {

    return 0;
  }
}

- (int64_t)glyphType
{
  return 2;
}

- (NSArray)categories
{
  v2 = self;
  sub_2453350F4();

  type metadata accessor for ImageGlyphCategory(0);
  v3 = (void *)sub_2453FFCF8();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (void)configureWith:(id)a3
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for ImageGlyphUIConfiguration());
  id v6 = a3;
  v9 = self;
  v7 = (objc_class *)sub_24536AFA0(a3, 2);
  v8 = *(Class *)((char *)&v9->super.super.isa
                + OBJC_IVAR____TtC10StickerKit21AvatarGlyphDataSource____lazy_storage___uiConfig);
  *(Class *)((char *)&v9->super.super.isa
           + OBJC_IVAR____TtC10StickerKit21AvatarGlyphDataSource____lazy_storage___uiConfig) = v7;

  sub_24524B5BC((uint64_t)v6);
}

- (id)indexPathForCategory:(id)a3
{
  return sub_2453368B0(self, (uint64_t)a2, a3, (void (*)(id))sub_245335A10);
}

- (int64_t)numberOfItemsInCategory:(id)a3
{
  id v4 = a3;
  id v5 = self;
  int64_t v6 = sub_245335C60(v4);

  return v6;
}

- (id)indexPathForIdentifier:(id)a3 ofType:(int64_t)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEC80);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2453FFB38();
  uint64_t v11 = v10;
  v12 = self;
  sub_245335E18(v9, v11, a4, (uint64_t)v8);

  swift_bridgeObjectRelease();
  uint64_t v13 = sub_2453FCDC8();
  uint64_t v14 = *(void *)(v13 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v8, 1, v13) != 1)
  {
    v15 = (void *)sub_2453FCD58();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v13);
  }

  return v15;
}

- (id)indexPathForItem:(id)a3
{
  return sub_2453368B0(self, (uint64_t)a2, a3, (void (*)(id))sub_245336398);
}

- (id)accessibilityTextForItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_2453369F8((uint64_t)v4);
  uint64_t v7 = v6;

  if (v7)
  {
    v8 = (void *)sub_2453FFB08();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (_TtC10StickerKit21AvatarGlyphDataSource)initWithDataSources:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ED1220);
  uint64_t v3 = sub_2453FFD18();
  return (_TtC10StickerKit21AvatarGlyphDataSource *)sub_245336DE0(v3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10StickerKit21AvatarGlyphDataSource____lazy_storage___uiConfig));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10StickerKit21AvatarGlyphDataSource____lazy_storage___puppetQueue));
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10StickerKit21AvatarGlyphDataSource_avtStore);
}

@end