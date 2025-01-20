@interface ConversationUtils
+ (id)conversationTurnTypeToStringWithTurnType:(int64_t)a3;
+ (int64_t)stringToConversationTurnTypeWithTypeString:(id)a3;
- (_TtC26DeepThoughtBiomeFoundation17ConversationUtils)init;
@end

@implementation ConversationUtils

+ (id)conversationTurnTypeToStringWithTurnType:(int64_t)a3
{
  v3 = (void *)sub_24C9FFBF0();
  swift_bridgeObjectRelease();

  return v3;
}

+ (int64_t)stringToConversationTurnTypeWithTypeString:(id)a3
{
  uint64_t v4 = sub_24C9FFC20();
  uint64_t v5 = v3;
  if (v4 == 0xD000000000000015 && v3 == 0x800000024CA0B590 || (sub_24CA00450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (v4 == 0xD000000000000018 && v5 == 0x800000024CA0B570)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_24CA00450();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

- (_TtC26DeepThoughtBiomeFoundation17ConversationUtils)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ConversationUtils();
  return [(ConversationUtils *)&v3 init];
}

@end