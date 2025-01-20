@interface ConversationTurn
- (_TtC26DeepThoughtBiomeFoundation16ConversationTurn)init;
- (id)debugString;
@end

@implementation ConversationTurn

- (_TtC26DeepThoughtBiomeFoundation16ConversationTurn)init
{
  return (_TtC26DeepThoughtBiomeFoundation16ConversationTurn *)ConversationTurn.init()();
}

- (id)debugString
{
  return sub_24C9E43A8(self, (uint64_t)a2, (void (*)(void))sub_24C9DFF60);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC26DeepThoughtBiomeFoundation16ConversationTurn_turnID;
  uint64_t v4 = sub_24C9FF6A0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_24C9CEAF8((uint64_t)self + OBJC_IVAR____TtC26DeepThoughtBiomeFoundation16ConversationTurn_clockID, &qword_2698038F0);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end