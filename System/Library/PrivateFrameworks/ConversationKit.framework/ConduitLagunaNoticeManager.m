@interface ConduitLagunaNoticeManager
- (_TtC15ConversationKit26ConduitLagunaNoticeManager)init;
- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4 fromOldConversation:(id)a5;
- (void)neighborhoodActivityConduit:(id)a3 splitSessionEnded:(id)a4;
- (void)neighborhoodActivityConduit:(id)a3 splitSessionStarted:(id)a4;
- (void)neighborhoodActivityConduit:(id)a3 suggestionUpdated:(id)a4;
@end

@implementation ConduitLagunaNoticeManager

- (void)neighborhoodActivityConduit:(id)a3 splitSessionStarted:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  ConduitLagunaNoticeManager.neighborhoodActivityConduit(_:splitSessionStarted:)();
}

- (void)neighborhoodActivityConduit:(id)a3 splitSessionEnded:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  ConduitLagunaNoticeManager.neighborhoodActivityConduit(_:splitSessionEnded:)();
}

- (void)neighborhoodActivityConduit:(id)a3 suggestionUpdated:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  ConduitLagunaNoticeManager.neighborhoodActivityConduit(_:suggestionUpdated:)();
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  ConduitLagunaNoticeManager.conversationManager(_:stateChangedFor:fromOldConversation:)();
}

- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  ConduitLagunaNoticeManager.conversationManager(_:remoteMembersChangedFor:)();
}

- (_TtC15ConversationKit26ConduitLagunaNoticeManager)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit26ConduitLagunaNoticeManager_pushBannerInfo, &demangling cache variable for type metadata for ConduitLagunaNoticeManager.PushBannerInfo?);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15ConversationKit26ConduitLagunaNoticeManager_callCenter);
}

@end