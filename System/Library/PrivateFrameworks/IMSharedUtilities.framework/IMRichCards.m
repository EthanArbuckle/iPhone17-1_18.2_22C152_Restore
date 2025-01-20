@interface IMRichCards
- (BOOL)isEqual:(id)a3;
- (IMRichCards)init;
- (IMRichCards)initWithCardArray:(id)a3;
- (IMRichCards)initWithCards:(id)a3;
- (IMRichCards)initWithDictionary:(id)a3;
- (NSArray)cards;
- (id)dictionaryRepresentation;
- (id)previewText;
- (id)suggestedActionsList;
- (id)suggestedRepliesList;
- (void)updateUrlToTransferMap:(id)a3;
@end

@implementation IMRichCards

- (NSArray)cards
{
  type metadata accessor for IMRichCard(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A09F4068();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (IMRichCards)initWithCards:(id)a3
{
  type metadata accessor for IMRichCard(0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCards_cards) = (Class)sub_1A09F4078();
  v5.receiver = self;
  v5.super_class = (Class)IMRichCards;
  return [(IMRichCards *)&v5 init];
}

- (IMRichCards)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMRichCards *)IMRichCards.init(dictionary:)(v3);
}

- (IMRichCards)initWithCardArray:(id)a3
{
  sub_1A07856F8(&qword_1E94FDD10);
  uint64_t v3 = sub_1A09F4078();
  return (IMRichCards *)sub_1A09E9EE8(v3);
}

- (id)dictionaryRepresentation
{
  v2 = self;
  sub_1A09EA130();

  uint64_t v3 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v3;
}

- (id)suggestedRepliesList
{
  return sub_1A09EA834(self, (uint64_t)a2, (void (*)(void))sub_1A09EA3D8, &qword_1E94FE6C8);
}

- (id)suggestedActionsList
{
  return sub_1A09EA834(self, (uint64_t)a2, (void (*)(void))sub_1A09EA5E4, &qword_1E94F9B18);
}

- (void)updateUrlToTransferMap:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1A09EA8AC((uint64_t)v4);
}

- (id)previewText
{
  v2 = self;
  sub_1A09EAA34();
  uint64_t v4 = v3;

  if (v4)
  {
    objc_super v5 = (void *)sub_1A09F3DE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1A09F4588();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    objc_super v5 = self;
  }
  char v6 = IMRichCards.isEqual(_:)((uint64_t)v8);

  sub_1A0783C7C((uint64_t)v8);
  return v6 & 1;
}

- (IMRichCards)init
{
  result = (IMRichCards *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end