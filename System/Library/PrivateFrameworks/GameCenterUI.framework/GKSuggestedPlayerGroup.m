@interface GKSuggestedPlayerGroup
- (BOOL)fromPeopleSuggester;
- (BOOL)isNearby;
- (NSArray)players;
- (NSString)conversationIdentifier;
- (NSString)groupName;
- (NSString)messagesGroupIdentifier;
- (_TtC12GameCenterUI22GKSuggestedPlayerGroup)init;
- (int64_t)source;
- (void)setConversationIdentifier:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setMessagesGroupIdentifier:(id)a3;
- (void)setPlayers:(id)a3;
- (void)setSource:(int64_t)a3;
@end

@implementation GKSuggestedPlayerGroup

- (NSArray)players
{
  sub_1AF79648C();
  sub_1AF378DB4();
  v2 = (void *)sub_1AF7AE2A0();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (void)setPlayers:(id)a3
{
  sub_1AF378DB4();
  uint64_t v4 = sub_1AF7AE2B0();
  v5 = self;
  sub_1AF796534(v4);
}

- (NSString)groupName
{
  return (NSString *)sub_1AF796690((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1AF796600);
}

- (void)setGroupName:(id)a3
{
}

- (NSString)messagesGroupIdentifier
{
  return (NSString *)sub_1AF796690((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1AF7966EC);
}

- (void)setMessagesGroupIdentifier:(id)a3
{
}

- (int64_t)source
{
  return sub_1AF796858();
}

- (void)setSource:(int64_t)a3
{
}

- (NSString)conversationIdentifier
{
  return (NSString *)sub_1AF796690((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1AF79694C);
}

- (void)setConversationIdentifier:(id)a3
{
}

- (BOOL)fromPeopleSuggester
{
  return sub_1AF796A74();
}

- (BOOL)isNearby
{
  return sub_1AF796AD8();
}

- (_TtC12GameCenterUI22GKSuggestedPlayerGroup)init
{
  return (_TtC12GameCenterUI22GKSuggestedPlayerGroup *)GKSuggestedPlayerGroup.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end