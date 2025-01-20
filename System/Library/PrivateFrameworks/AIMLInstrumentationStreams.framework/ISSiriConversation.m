@interface ISSiriConversation
- (ISSiriConversation)init;
- (ISSiriConversation)initWithTurns:(id)a3;
- (NSArray)turns;
- (NSDate)date;
- (NSUUID)firstTurnId;
- (double)timestamp;
@end

@implementation ISSiriConversation

- (NSArray)turns
{
  type metadata accessor for SiriTurn();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22AEAA0E8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (double)timestamp
{
  unint64_t v3 = *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___ISSiriConversation_turns);
  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v5 = self;
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_9;
  }
  v10 = self;
  swift_bridgeObjectRetain();
  if (!sub_22AEAA6D8()) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v3 & 0xC000000000000001) != 0)
  {
LABEL_9:
    v7 = (char *)MEMORY[0x230F35410](0, v3);
    goto LABEL_6;
  }
  if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = (char *)*(id *)(v3 + 32);
LABEL_6:
    v8 = v7;
    swift_bridgeObjectRelease();
    double v9 = *(double *)&v8[OBJC_IVAR___ISEventGraph_timestamp];

    return v9;
  }
  __break(1u);
  return result;
}

- (NSDate)date
{
  uint64_t v3 = sub_22AEA9328();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___ISSiriConversation_turns);
  if (!(v8 >> 62))
  {
    uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v10 = self;
    double result = (NSDate *)swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_11;
  }
  v15 = self;
  swift_bridgeObjectRetain();
  double result = (NSDate *)sub_22AEAA6D8();
  if (!result) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v8 & 0xC000000000000001) != 0)
  {
LABEL_11:
    id v12 = (id)MEMORY[0x230F35410](0, v8);
    goto LABEL_6;
  }
  if (!*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    return result;
  }
  id v12 = *(id *)(v8 + 32);
LABEL_6:
  v13 = v12;
  swift_bridgeObjectRelease();

  sub_22AEA9298();
  v14 = (void *)sub_22AEA92C8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return (NSDate *)v14;
}

- (NSUUID)firstTurnId
{
  uint64_t v3 = sub_22AEA93B8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = self;
  sub_22A7591E8();

  uint64_t v9 = (void *)sub_22AEA9368();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return (NSUUID *)v9;
}

- (ISSiriConversation)initWithTurns:(id)a3
{
  type metadata accessor for SiriTurn();
  uint64_t v3 = sub_22AEAA0F8();
  return (ISSiriConversation *)SiriConversation.init(turns:)(v3);
}

- (ISSiriConversation)init
{
  double result = (ISSiriConversation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end