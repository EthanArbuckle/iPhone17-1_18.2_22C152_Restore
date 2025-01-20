@interface IMChipList
+ (id)merge:(id)a3 with:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)replied;
- (IMChipList)init;
- (IMChipList)initWithChipArray:(id)a3;
- (IMChipList)initWithChipArray:(id)a3 replied:(BOOL)a4;
- (IMChipList)initWithChipList:(id)a3;
- (IMChipList)initWithChipList:(id)a3 replied:(BOOL)a4;
- (IMChipList)initWithDictionary:(id)a3;
- (NSArray)chipList;
- (id)dictionaryRepresentation;
- (id)messageItem;
- (id)suggestedActions;
- (id)suggestedReplies;
@end

@implementation IMChipList

- (NSArray)chipList
{
  type metadata accessor for IMChip();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A09F4068();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (BOOL)replied
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___IMChipList_replied);
}

- (IMChipList)initWithChipList:(id)a3
{
  type metadata accessor for IMChip();
  sub_1A09F4078();
  v4 = (void *)sub_1A09F4068();
  swift_bridgeObjectRelease();
  v5 = [(IMChipList *)self initWithChipList:v4 replied:0];

  return v5;
}

- (IMChipList)initWithChipList:(id)a3 replied:(BOOL)a4
{
  type metadata accessor for IMChip();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMChipList_chipList) = (Class)sub_1A09F4078();
  *((unsigned char *)&self->super.isa + OBJC_IVAR___IMChipList_replied) = a4;
  v7.receiver = self;
  v7.super_class = (Class)IMChipList;
  return [(IMChipList *)&v7 init];
}

- (IMChipList)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMChipList *)IMChipList.init(dictionary:)(v3);
}

- (IMChipList)initWithChipArray:(id)a3
{
  sub_1A07856F8(&qword_1E94FDD10);
  sub_1A09F4078();
  v4 = (void *)sub_1A09F4068();
  swift_bridgeObjectRelease();
  v5 = [(IMChipList *)self initWithChipArray:v4 replied:0];

  return v5;
}

- (IMChipList)initWithChipArray:(id)a3 replied:(BOOL)a4
{
  sub_1A07856F8(&qword_1E94FDD10);
  uint64_t v5 = sub_1A09F4078();
  return (IMChipList *)sub_1A092D39C(v5, a4);
}

- (id)dictionaryRepresentation
{
  v2 = self;
  sub_1A092D608();

  uint64_t v3 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v3;
}

- (id)suggestedReplies
{
  return sub_1A092DB20(self, (uint64_t)a2, (uint64_t)off_1E5A0F208, (void (*)(void))type metadata accessor for IMChipReply);
}

- (id)suggestedActions
{
  return sub_1A092DB20(self, (uint64_t)a2, (uint64_t)off_1E5A0F1F8, (void (*)(void))type metadata accessor for IMChipAction);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A09F4588();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = IMChipList.isEqual(_:)((uint64_t)v8);

  sub_1A0783C7C((uint64_t)v8);
  return v6 & 1;
}

- (id)messageItem
{
  v2 = self;
  id v3 = sub_1A092E528();

  return v3;
}

+ (id)merge:(id)a3 with:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _sSo10IMChipListC17IMSharedUtilitiesE5merge_4withABSgAF_AFtFZ_0(a3, a4);

  return v8;
}

- (IMChipList)init
{
  result = (IMChipList *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end