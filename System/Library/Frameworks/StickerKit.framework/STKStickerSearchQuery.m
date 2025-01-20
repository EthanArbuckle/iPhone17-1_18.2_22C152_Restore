@interface STKStickerSearchQuery
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsEmoji;
- (BOOL)supportsGenmoji;
- (BOOL)supportsImages;
- (NSArray)multilingualSearchLocales;
- (NSString)autocorrectedQuery;
- (NSString)exactQuery;
- (NSString)locale;
- (STKStickerSearchQuery)init;
- (id)trimmedEmojiSearchQuery;
- (void)setAutocorrectedQuery:(id)a3;
- (void)setExactQuery:(id)a3;
- (void)setLocale:(id)a3;
- (void)setMultilingualSearchLocales:(id)a3;
- (void)setSupportsEmoji:(BOOL)a3;
- (void)setSupportsGenmoji:(BOOL)a3;
- (void)setSupportsImages:(BOOL)a3;
@end

@implementation STKStickerSearchQuery

- (NSString)exactQuery
{
  return (NSString *)sub_24532FBA8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKStickerSearchQuery_exactQuery);
}

- (void)setExactQuery:(id)a3
{
}

- (NSString)autocorrectedQuery
{
  return (NSString *)sub_24532FBA8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKStickerSearchQuery_autocorrectedQuery);
}

- (void)setAutocorrectedQuery:(id)a3
{
}

- (NSString)locale
{
  return (NSString *)sub_24532FBA8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKStickerSearchQuery_locale);
}

- (void)setLocale:(id)a3
{
}

- (NSArray)multilingualSearchLocales
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___STKStickerSearchQuery_multilingualSearchLocales);
  swift_beginAccess();
  if (*v2)
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_2453FFCF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return (NSArray *)v3;
}

- (void)setMultilingualSearchLocales:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_2453FFD18();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___STKStickerSearchQuery_multilingualSearchLocales);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (BOOL)supportsImages
{
  v2 = (BOOL *)self + OBJC_IVAR___STKStickerSearchQuery_supportsImages;
  swift_beginAccess();
  return *v2;
}

- (void)setSupportsImages:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___STKStickerSearchQuery_supportsImages;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)supportsGenmoji
{
  v2 = (BOOL *)self + OBJC_IVAR___STKStickerSearchQuery_supportsGenmoji;
  swift_beginAccess();
  return *v2;
}

- (void)setSupportsGenmoji:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___STKStickerSearchQuery_supportsGenmoji;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)supportsEmoji
{
  v2 = (BOOL *)self + OBJC_IVAR___STKStickerSearchQuery_supportsEmoji;
  swift_beginAccess();
  return *v2;
}

- (void)setSupportsEmoji:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___STKStickerSearchQuery_supportsEmoji;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = StickerSearchQuery.isEqual(_:)((uint64_t)v8);

  sub_245281718((uint64_t)v8);
  return v6 & 1;
}

- (id)trimmedEmojiSearchQuery
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___STKStickerSearchQuery_exactQuery);
  swift_beginAccess();
  uint64_t v4 = (void *)v3[1];
  if (v4)
  {
    v11[1] = *v3;
    v11[2] = v4;
    uint64_t v5 = sub_2453FC8B8();
    uint64_t v6 = *(void *)(v5 - 8);
    MEMORY[0x270FA5388](v5);
    v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    v9 = self;
    swift_bridgeObjectRetain();
    sub_2453FC858();
    sub_245203B68();
    sub_245400648();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

    swift_bridgeObjectRelease();
    uint64_t v4 = (void *)sub_2453FFB08();
    swift_bridgeObjectRelease();
  }

  return v4;
}

- (STKStickerSearchQuery)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___STKStickerSearchQuery_exactQuery);
  *uint64_t v4 = 0;
  v4[1] = 0;
  uint64_t v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR___STKStickerSearchQuery_autocorrectedQuery);
  void *v5 = 0;
  v5[1] = 0;
  uint64_t v6 = (Class *)((char *)&self->super.isa + OBJC_IVAR___STKStickerSearchQuery_locale);
  *uint64_t v6 = 0;
  v6[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___STKStickerSearchQuery_multilingualSearchLocales) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___STKStickerSearchQuery_supportsImages) = 1;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___STKStickerSearchQuery_supportsGenmoji) = 1;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___STKStickerSearchQuery_supportsEmoji) = 1;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(STKStickerSearchQuery *)&v8 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end