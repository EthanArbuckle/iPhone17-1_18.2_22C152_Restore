@interface IMStickerTapback
+ (BOOL)isValidAssociatedMessageType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (IMStickerTapback)counterpart;
- (IMStickerTapback)initWithAssociatedMessageType:(int64_t)a3;
- (IMStickerTapback)initWithCoder:(id)a3;
- (IMStickerTapback)initWithIMRemoteObjectSerializedDictionary:(id)a3;
- (IMStickerTapback)initWithTransferGUID:(id)a3 isRemoved:(BOOL)a4;
- (IMStickerTapback)removedTapbackCounterpart;
- (IMStickerTapback)visibleTapbackCounterpart;
- (NSString)transferGUID;
- (id)actionStringFormatWithAdaptiveImageGlyphAvailable:(BOOL)a3;
- (id)adaptiveImageGlyphForPreviewStringWithAdaptiveImageGlyphProvider:(id)a3;
- (id)reactionStringWithAdaptiveImageGlyph:(id)a3 isCommSafetySensitiveProvider:(id)a4;
@end

@implementation IMStickerTapback

- (NSString)transferGUID
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A09F3DE8();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (IMStickerTapback)counterpart
{
  v2 = self;
  unsigned int v3 = [(IMTapback *)v2 isRemoved];
  v4 = &selRef_visibleTapbackCounterpart;
  if (!v3) {
    v4 = &selRef_removedTapbackCounterpart;
  }
  id v5 = [v2 *v4];

  return (IMStickerTapback *)v5;
}

- (IMStickerTapback)removedTapbackCounterpart
{
  v2 = self;
  if (![(IMTapback *)v2 isRemoved])
  {
    unsigned int v3 = [(IMStickerTapback *)v2 transferGUID];
    sub_1A09F3E18();

    id v4 = objc_allocWithZone((Class)IMStickerTapback);
    id v5 = (void *)sub_1A09F3DE8();
    swift_bridgeObjectRelease();
    v6 = (IMStickerTapback *)objc_msgSend(v4, sel_initWithTransferGUID_isRemoved_, v5, 1);

    v2 = v6;
  }

  return v2;
}

- (IMStickerTapback)visibleTapbackCounterpart
{
  v2 = self;
  if ([(IMTapback *)v2 isRemoved])
  {
    unsigned int v3 = [(IMStickerTapback *)v2 transferGUID];
    sub_1A09F3E18();

    id v4 = objc_allocWithZone((Class)IMStickerTapback);
    id v5 = (void *)sub_1A09F3DE8();
    swift_bridgeObjectRelease();
    v6 = (IMStickerTapback *)objc_msgSend(v4, sel_initWithTransferGUID_isRemoved_, v5, 0);

    v2 = v6;
  }

  return v2;
}

- (IMStickerTapback)initWithTransferGUID:(id)a3 isRemoved:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = sub_1A09F3E18();
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___IMStickerTapback__transferGuid);
  uint64_t *v7 = v6;
  v7[1] = v8;
  if (v4) {
    uint64_t v9 = 3007;
  }
  else {
    uint64_t v9 = 2007;
  }
  v11.receiver = self;
  v11.super_class = (Class)IMStickerTapback;
  return [(IMTapback *)&v11 initWithAssociatedMessageType:v9];
}

- (IMStickerTapback)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1A09F46A8();
  swift_bridgeObjectRelease();
  result = (IMStickerTapback *)sub_1A09F47A8();
  __break(1u);
  return result;
}

- (IMStickerTapback)initWithIMRemoteObjectSerializedDictionary:(id)a3
{
  sub_1A09F46A8();
  swift_bridgeObjectRelease();
  result = (IMStickerTapback *)sub_1A09F47A8();
  __break(1u);
  return result;
}

- (id)actionStringFormatWithAdaptiveImageGlyphAvailable:(BOOL)a3
{
  BOOL v4 = self;
  id v5 = (void *)IMStickerTapback.actionStringFormat(withAdaptiveImageGlyphAvailable:)(a3);

  return v5;
}

- (id)reactionStringWithAdaptiveImageGlyph:(id)a3 isCommSafetySensitiveProvider:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  id v9 = sub_1A092AAF8(a3, v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  return v9;
}

- (id)adaptiveImageGlyphForPreviewStringWithAdaptiveImageGlyphProvider:(id)a3
{
  BOOL v4 = (uint64_t (**)(void *, void *))_Block_copy(a3);
  id v5 = self;
  uint64_t v6 = [(IMStickerTapback *)v5 transferGUID];
  sub_1A09F3E18();

  id v7 = (void *)sub_1A09F3DE8();
  id v8 = (id)v4[2](v4, v7);
  swift_bridgeObjectRelease();

  _Block_release(v4);

  return v8;
}

+ (BOOL)isValidAssociatedMessageType:(int64_t)a3
{
  return sub_1A0929A3C(a3, (uint64_t)&unk_1EF2BDF88) & 1;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    BOOL v4 = self;
    swift_unknownObjectRetain();
    sub_1A09F4588();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  char v6 = IMStickerTapback.isEqual(_:)((uint64_t)v8);

  sub_1A0783C7C((uint64_t)v8);
  return v6 & 1;
}

- (IMStickerTapback)initWithAssociatedMessageType:(int64_t)a3
{
  result = (IMStickerTapback *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end