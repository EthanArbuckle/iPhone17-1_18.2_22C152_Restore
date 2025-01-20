@interface StickerPhotosCreationResult
- (BOOL)isLive;
- (NSArray)representations;
- (NSUUID)stickerUUID;
- (STKSticker)sticker;
- (_TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult)init;
- (void)setIsLive:(BOOL)a3;
- (void)setRepresentations:(id)a3;
- (void)setSticker:(id)a3;
- (void)setStickerUUID:(id)a3;
@end

@implementation StickerPhotosCreationResult

- (STKSticker)sticker
{
  return (STKSticker *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_sticker));
}

- (void)setSticker:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_sticker);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_sticker) = (Class)a3;
  id v3 = a3;
}

- (NSUUID)stickerUUID
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ECEC40);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self
     + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_stickerUUID;
  swift_beginAccess();
  sub_245212DC4((uint64_t)v6, (uint64_t)v5);
  uint64_t v7 = sub_2453FCCB8();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_2453FCC78();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSUUID *)v9;
}

- (void)setStickerUUID:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ECEC40);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_2453FCC98();
    uint64_t v8 = sub_2453FCCB8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_2453FCCB8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self
      + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_stickerUUID;
  swift_beginAccess();
  uint64_t v11 = self;
  sub_2452285BC((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();
}

- (NSArray)representations
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_representations))
  {
    sub_2453FF878();
    swift_bridgeObjectRetain();
    v2 = (void *)sub_2453FFCF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSArray *)v2;
}

- (void)setRepresentations:(id)a3
{
  if (a3)
  {
    sub_2453FF878();
    uint64_t v4 = (objc_class *)sub_2453FFD18();
  }
  else
  {
    uint64_t v4 = 0;
  }
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_representations) = v4;

  swift_bridgeObjectRelease();
}

- (BOOL)isLive
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_isLive);
}

- (void)setIsLive:(BOOL)a3
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_isLive) = a3;
}

- (_TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_sticker) = 0;
  uint64_t v4 = (char *)self
     + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_stickerUUID;
  uint64_t v5 = sub_2453FCCB8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_representations) = 0;
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_isLive) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(StickerPhotosCreationResult *)&v7 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_sticker));
  sub_245203CD8((uint64_t)self+ OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_stickerUUID, (uint64_t *)&unk_268ECEC40);

  swift_bridgeObjectRelease();
}

@end