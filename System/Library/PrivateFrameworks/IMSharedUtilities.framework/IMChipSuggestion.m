@interface IMChipSuggestion
- (IMChipSuggestion)init;
- (IMChipSuggestion)initWithDictionary:(id)a3;
- (IMChipSuggestion)initWithDisplayText:(id)a3 postback:(id)a4 inReplyToID:(id)a5;
- (NSString)displayText;
- (NSString)inReplyToID;
- (NSString)postback;
- (id)dictionaryRepresentation;
- (void)setDisplayText:(id)a3;
- (void)setInReplyToID:(id)a3;
- (void)setPostback:(id)a3;
@end

@implementation IMChipSuggestion

- (NSString)displayText
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A09F3DE8();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setDisplayText:(id)a3
{
  uint64_t v4 = sub_1A09F3E18();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___IMChipSuggestion_displayText);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (NSString)postback
{
  return (NSString *)sub_1A08A2C50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMChipSuggestion_postback);
}

- (void)setPostback:(id)a3
{
}

- (NSString)inReplyToID
{
  return (NSString *)sub_1A08A2C50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMChipSuggestion_inReplyToID);
}

- (void)setInReplyToID:(id)a3
{
}

- (IMChipSuggestion)initWithDisplayText:(id)a3 postback:(id)a4 inReplyToID:(id)a5
{
  uint64_t v7 = sub_1A09F3E18();
  uint64_t v9 = v8;
  if (!a4)
  {
    uint64_t v11 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v12 = 0;
    uint64_t v14 = 0;
    return (IMChipSuggestion *)sub_1A08CBF40(v7, v9, (uint64_t)a4, v11, v12, v14);
  }
  a4 = (id)sub_1A09F3E18();
  uint64_t v11 = v10;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v12 = sub_1A09F3E18();
  uint64_t v14 = v13;
  return (IMChipSuggestion *)sub_1A08CBF40(v7, v9, (uint64_t)a4, v11, v12, v14);
}

- (IMChipSuggestion)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMChipSuggestion *)IMChipSuggestion.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  v2 = self;
  sub_1A08CC388();

  uint64_t v3 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v3;
}

- (IMChipSuggestion)init
{
  result = (IMChipSuggestion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end