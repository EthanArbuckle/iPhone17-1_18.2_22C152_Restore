@interface STKImageGlyph
+ (id)fromSticker:(id)a3 isAnimated:(BOOL)a4;
+ (id)fromStickerIdentifier:(id)a3;
+ (id)imageGlyphForGlyphIdentifier:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSString)avatarIdentifier;
- (NSString)debugDescription;
- (NSString)emojiString;
- (NSString)identifier;
- (NSString)poseIdentifier;
- (NSString)toString;
- (NSUUID)stickerUUID;
- (STKImageGlyph)init;
- (id)accessibilityCaption;
- (id)createStickerWithAllRepresentations;
- (id)createStickerWithMetadataOnly;
- (id)searchText;
- (int64_t)stickerSourceType;
- (int64_t)type;
- (unint64_t)stickerEffectType;
- (void)createEmojiImageTextAttachmentWithCompletionHandler:(id)a3;
- (void)createUIStickerWithCompletionHandler:(id)a3;
- (void)createUIStickerWithLoadAllRepresentations:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation STKImageGlyph

- (NSString)identifier
{
  return (NSString *)sub_24538DBA4(self, (uint64_t)a2, (void (*)(void))sub_245388D94);
}

- (NSUUID)stickerUUID
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ECEC40);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245203C74((uint64_t)self + OBJC_IVAR___STKImageGlyph_stickerUUID, (uint64_t)v5, (uint64_t *)&unk_268ECEC40);
  uint64_t v6 = sub_2453FCCB8();
  uint64_t v7 = *(void *)(v6 - 8);
  v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    v8 = (void *)sub_2453FCC78();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }

  return (NSUUID *)v8;
}

- (unint64_t)stickerEffectType
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___STKImageGlyph_stickerEffectType);
}

- (int64_t)stickerSourceType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___STKImageGlyph_stickerSourceType);
}

- (NSString)avatarIdentifier
{
  return (NSString *)sub_2453892BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKImageGlyph_avatarIdentifier);
}

- (NSString)poseIdentifier
{
  return (NSString *)sub_2453892BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKImageGlyph_poseIdentifier);
}

- (NSString)emojiString
{
  return (NSString *)sub_2453892BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKImageGlyph_emojiString);
}

- (int64_t)type
{
  v2 = self;
  int64_t v3 = sub_2453893A0();

  return v3;
}

- (BOOL)isEmpty
{
  v2 = self;
  BOOL v3 = sub_24538951C();

  return v3;
}

+ (id)fromSticker:(id)a3 isAnimated:(BOOL)a4
{
  id v5 = a3;
  id v6 = sub_2453904BC((uint64_t)v5, a4);

  return v6;
}

+ (id)fromStickerIdentifier:(id)a3
{
  uint64_t v3 = sub_2453FCCB8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FCC98();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ECEC40);
  __n128 v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t, __n128))(v4 + 16))(v10, v6, v3, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v10, 0, 1, v3);
  char v19 = 0;
  memset(v18, 0, sizeof(v18));
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEC80);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2453FCDC8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  id v15 = objc_allocWithZone((Class)type metadata accessor for ImageGlyph(0));
  id v16 = ImageGlyph.init(stickerUUID:stickerEffectType:stickerSourceType:avatarIdentifier:poseIdentifier:emoji:emojiString:indexPath:)((uint64_t)v10, 0, 0, 0, 0, 0, 0, (uint64_t *)v18, 0, 0, (uint64_t)v13);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v16;
}

+ (id)imageGlyphForGlyphIdentifier:(id)a3
{
  uint64_t v3 = sub_2453FFB38();
  uint64_t v5 = _s10StickerKit10ImageGlyphC05imageD03forACSgSS_tFZ_0(v3, v4);
  swift_bridgeObjectRelease();

  return v5;
}

- (NSString)toString
{
  return (NSString *)sub_24538CF08(self, (uint64_t)a2, (void (*)(void))sub_245389C98);
}

- (void)createUIStickerWithLoadAllRepresentations:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ED5308;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED5310;
  v14[5] = v13;
  id v15 = self;
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED5318, (uint64_t)v14);
  swift_release();
}

- (void)createUIStickerWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_268ED52F8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_268ED41F0;
  v12[5] = v11;
  v13 = self;
  sub_2453D38BC((uint64_t)v7, (uint64_t)&unk_268ED2550, (uint64_t)v12);
  swift_release();
}

- (id)createStickerWithMetadataOnly
{
  return sub_24538B148(self, (uint64_t)a2, MEMORY[0x263F798E0]);
}

- (id)createStickerWithAllRepresentations
{
  return sub_24538B148(self, (uint64_t)a2, MEMORY[0x263F798D8]);
}

- (void)createEmojiImageTextAttachmentWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_2453FF778();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F798D8], v5);
  uint64_t v11 = self;
  uint64_t v12 = (void *)sub_24538B414((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v12)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = sub_24520E598;
    *(void *)(v13 + 24) = v10;
    id v14 = v12;
    swift_retain();
    sub_24526A2A0((uint64_t)sub_245393978, v13);

    swift_release();
    swift_release();
  }
  else
  {

    swift_release();
  }
}

- (id)searchText
{
  return sub_24538CF08(self, (uint64_t)a2, (void (*)(void))sub_24538C32C);
}

- (id)accessibilityCaption
{
  return sub_24538CF08(self, (uint64_t)a2, (void (*)(void))sub_24538C92C);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    unint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_24538CF88((uint64_t)v8);

  sub_245203CD8((uint64_t)v8, &qword_268ECEFA0);
  return v6 & 1;
}

- (NSString)debugDescription
{
  return (NSString *)sub_24538DBA4(self, (uint64_t)a2, (void (*)(void))sub_24538D120);
}

- (STKImageGlyph)init
{
  result = (STKImageGlyph *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_245203CD8((uint64_t)self + OBJC_IVAR___STKImageGlyph_stickerUUID, (uint64_t *)&unk_268ECEC40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24522493C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___STKImageGlyph_emoji), *(void *)&self->_anon_0[OBJC_IVAR___STKImageGlyph_emoji], *(void *)&self->stickerEffectType[OBJC_IVAR___STKImageGlyph_emoji], *(void *)&self->stickerSourceType[OBJC_IVAR___STKImageGlyph_emoji], *(void *)&self->avatarIdentifier[OBJC_IVAR___STKImageGlyph_emoji], *(void *)&self->avatarIdentifier[OBJC_IVAR___STKImageGlyph_emoji + 8], self->poseIdentifier[OBJC_IVAR___STKImageGlyph_emoji]);
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___STKImageGlyph_loadedSticker);
}

@end