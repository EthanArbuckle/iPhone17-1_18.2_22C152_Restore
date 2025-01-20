@interface IMEmojiTapback
+ (BOOL)isValidAssociatedMessageType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (IMEmojiTapback)counterpart;
- (IMEmojiTapback)initWithAssociatedMessageType:(int64_t)a3;
- (IMEmojiTapback)initWithCoder:(id)a3;
- (IMEmojiTapback)initWithEmoji:(id)a3 isRemoved:(BOOL)a4;
- (IMEmojiTapback)initWithIMRemoteObjectSerializedDictionary:(id)a3;
- (IMEmojiTapback)removedTapbackCounterpart;
- (IMEmojiTapback)visibleTapbackCounterpart;
- (NSString)associatedMessageEmoji;
- (NSString)description;
- (id)actionStringFormatWithAdaptiveImageGlyphAvailable:(BOOL)a3;
- (id)reactionStringWithAdaptiveImageGlyph:(id)a3 isCommSafetySensitiveProvider:(id)a4;
@end

@implementation IMEmojiTapback

- (NSString)associatedMessageEmoji
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A09F3DE8();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (IMEmojiTapback)counterpart
{
  v2 = self;
  unsigned int v3 = [(IMTapback *)v2 isRemoved];
  v4 = &selRef_visibleTapbackCounterpart;
  if (!v3) {
    v4 = &selRef_removedTapbackCounterpart;
  }
  id v5 = [v2 *v4];

  return (IMEmojiTapback *)v5;
}

- (IMEmojiTapback)removedTapbackCounterpart
{
  v2 = self;
  if (![(IMTapback *)v2 isRemoved])
  {
    id v3 = objc_allocWithZone((Class)IMEmojiTapback);
    swift_bridgeObjectRetain();
    v4 = (void *)sub_1A09F3DE8();
    swift_bridgeObjectRelease();
    id v5 = (IMEmojiTapback *)objc_msgSend(v3, sel_initWithEmoji_isRemoved_, v4, 1);

    v2 = v5;
  }

  return v2;
}

- (IMEmojiTapback)visibleTapbackCounterpart
{
  v2 = self;
  if ([(IMTapback *)v2 isRemoved])
  {
    id v3 = objc_allocWithZone((Class)IMEmojiTapback);
    swift_bridgeObjectRetain();
    v4 = (void *)sub_1A09F3DE8();
    swift_bridgeObjectRelease();
    id v5 = (IMEmojiTapback *)objc_msgSend(v3, sel_initWithEmoji_isRemoved_, v4, 0);

    v2 = v5;
  }

  return v2;
}

- (IMEmojiTapback)initWithEmoji:(id)a3 isRemoved:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = sub_1A09F3E18();
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___IMEmojiTapback_emoji);
  uint64_t *v7 = v6;
  v7[1] = v8;
  if (v4) {
    uint64_t v9 = 3006;
  }
  else {
    uint64_t v9 = 2006;
  }
  v11.receiver = self;
  v11.super_class = (Class)IMEmojiTapback;
  return [(IMTapback *)&v11 initWithAssociatedMessageType:v9];
}

- (IMEmojiTapback)initWithCoder:(id)a3
{
  return (IMEmojiTapback *)IMEmojiTapback.init(coder:)(a3);
}

- (IMEmojiTapback)initWithIMRemoteObjectSerializedDictionary:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_1A09F3D08();
  }
  else {
    uint64_t v3 = 0;
  }
  return (IMEmojiTapback *)IMEmojiTapback.init(imRemoteObjectSerializedDictionary:)(v3);
}

- (id)actionStringFormatWithAdaptiveImageGlyphAvailable:(BOOL)a3
{
  uint64_t v3 = self;
  id v4 = _sSo14IMEmojiTapbackC17IMSharedUtilitiesE18actionStringFormat31withAdaptiveImageGlyphAvailableSo022IMTapbackSummaryActionfG0CSgSb_tF_0();

  return v4;
}

- (id)reactionStringWithAdaptiveImageGlyph:(id)a3 isCommSafetySensitiveProvider:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  id v7 = a3;
  uint64_t v8 = self;
  uint64_t v9 = [(IMEmojiTapback *)v8 associatedMessageEmoji];
  sub_1A09F3E18();

  id v10 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
  objc_super v11 = (void *)sub_1A09F3DE8();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v10, sel_initWithString_, v11);

  _Block_release(v6);

  return v12;
}

- (NSString)description
{
  v2 = self;
  IMEmojiTapback.description.getter();

  uint64_t v3 = (void *)sub_1A09F3DE8();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

+ (BOOL)isValidAssociatedMessageType:(int64_t)a3
{
  return sub_1A0929A3C(a3, (uint64_t)&unk_1EF2BDF28) & 1;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1A09F4588();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  char v6 = IMEmojiTapback.isEqual(_:)((uint64_t)v8);

  sub_1A0783C7C((uint64_t)v8);
  return v6 & 1;
}

- (IMEmojiTapback)initWithAssociatedMessageType:(int64_t)a3
{
  result = (IMEmojiTapback *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end