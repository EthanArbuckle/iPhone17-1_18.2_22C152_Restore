@interface Conversation
- (NSArray)turns;
- (_TtC26DeepThoughtBiomeFoundation12Conversation)init;
- (_TtC26DeepThoughtBiomeFoundation12Conversation)initWithTurns:(id)a3;
- (id)debugString;
@end

@implementation Conversation

- (NSArray)turns
{
  type metadata accessor for ConversationTurn(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_24C9FFE40();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (_TtC26DeepThoughtBiomeFoundation12Conversation)initWithTurns:(id)a3
{
  type metadata accessor for ConversationTurn(0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC26DeepThoughtBiomeFoundation12Conversation_turns) = (Class)sub_24C9FFE50();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for Conversation();
  return [(Conversation *)&v5 init];
}

- (id)debugString
{
  return sub_24C9E43A8(self, (uint64_t)a2, (void (*)(void))sub_24C9E41B0);
}

- (_TtC26DeepThoughtBiomeFoundation12Conversation)init
{
  result = (_TtC26DeepThoughtBiomeFoundation12Conversation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end