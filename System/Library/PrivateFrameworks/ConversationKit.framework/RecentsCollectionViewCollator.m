@interface RecentsCollectionViewCollator
- (_TtC15ConversationKit29RecentsCollectionViewCollator)init;
- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 didChangeActivatedLinks:(id)a4;
- (void)conversationManager:(id)a3 linkChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
- (void)dealloc;
@end

@implementation RecentsCollectionViewCollator

- (void)dealloc
{
  v2 = self;
  RecentsCollectionViewCollator.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit29RecentsCollectionViewCollator_updateQueue));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29RecentsCollectionViewCollator_recentsController);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit29RecentsCollectionViewCollator_conversationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit29RecentsCollectionViewCollator_dataSource));
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<Bool>);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_26_2();
  v3();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15ConversationKit29RecentsCollectionViewCollator_featureFlags);
}

- (_TtC15ConversationKit29RecentsCollectionViewCollator)init
{
}

- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  RecentsCollectionViewCollator.conversationManager(_:addedActiveConversation:)();
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  RecentsCollectionViewCollator.conversationManager(_:stateChangedFor:)();
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  RecentsCollectionViewCollator.conversationManager(_:removedActiveConversation:)();
}

- (void)conversationManager:(id)a3 didChangeActivatedLinks:(id)a4
{
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationLink);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  RecentsCollectionViewCollator.conversationManager(_:didChangeActivatedLinks:)((uint64_t)v8, v6);

  swift_bridgeObjectRelease();
}

- (void)conversationManager:(id)a3 linkChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  RecentsCollectionViewCollator.conversationManager(_:linkChangedFor:)();
}

@end