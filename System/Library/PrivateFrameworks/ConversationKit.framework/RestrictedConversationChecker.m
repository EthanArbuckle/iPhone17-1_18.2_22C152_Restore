@interface RestrictedConversationChecker
- (_TtC15ConversationKit29RestrictedConversationChecker)init;
- (void)conversationManager:(id)a3 migratingFromConversation:(id)a4 toConversation:(id)a5;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
@end

@implementation RestrictedConversationChecker

- (_TtC15ConversationKit29RestrictedConversationChecker)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit29RestrictedConversationChecker_callFilterController));
  swift_bridgeObjectRelease();
}

- (void)conversationManager:(id)a3 migratingFromConversation:(id)a4 toConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  RestrictedConversationChecker.conversationManager(_:migratingFrom:to:)();
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  RestrictedConversationChecker.conversationManager(_:removedActiveConversation:)((int)v8, v7);
}

@end