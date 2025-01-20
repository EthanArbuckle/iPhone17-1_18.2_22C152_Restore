@interface ConversationControlsNoticeCoordinator
- (_TtC15ConversationKit37ConversationControlsNoticeCoordinator)init;
@end

@implementation ConversationControlsNoticeCoordinator

- (_TtC15ConversationKit37ConversationControlsNoticeCoordinator)init
{
  return (_TtC15ConversationKit37ConversationControlsNoticeCoordinator *)ConversationControlsNoticeCoordinator.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit37ConversationControlsNoticeCoordinator_conversationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit37ConversationControlsNoticeCoordinator_unblockTimer));
  v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit37ConversationControlsNoticeCoordinator__activeNotice;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Notice?>);
  OUTLINED_FUNCTION_0();
  (*(void (**)(char *))(v4 + 8))(v3);
  swift_bridgeObjectRelease();
}

@end