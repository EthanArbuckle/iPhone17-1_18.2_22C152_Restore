@interface VideoMessageController
- (_TtC15ConversationKit22VideoMessageController)init;
- (void)momentsController:(id)a3 didFinishProcessingRawVideoMessage:(id)a4;
@end

@implementation VideoMessageController

- (_TtC15ConversationKit22VideoMessageController)init
{
}

- (void).cxx_destruct
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<VideoMessageController.State>);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_26_2();
  v3();
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22VideoMessageController_mostRecentActiveConversation, &demangling cache variable for type metadata for Conversation?);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit22VideoMessageController_mostRecentLocalHandle));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit22VideoMessageController_videoMessageSendSoundPlayer));
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22VideoMessageController_currentRecordingUUID, (uint64_t *)&demangling cache variable for type metadata for UUID?);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<URL?>);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_26_2();
  v4();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit22VideoMessageController_latestVideoMessageSandboxURL));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit22VideoMessageController__momentsController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22VideoMessageController_callCenter);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)momentsController:(id)a3 didFinishProcessingRawVideoMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  VideoMessageController.momentsController(_:didFinishProcessingRawVideoMessage:)();
}

@end