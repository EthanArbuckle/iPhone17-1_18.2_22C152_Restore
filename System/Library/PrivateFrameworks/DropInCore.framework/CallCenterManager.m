@interface CallCenterManager
- (_TtC10DropInCore17CallCenterManager)init;
- (void)callStatusChangedWithNotification:(id)a3;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 updatedIncomingPendingConversations:(id)a4;
- (void)dealloc;
- (void)serverDisconnectedForConversationManager:(id)a3;
- (void)uplinkMutedChangedWithNotification:(id)a3;
@end

@implementation CallCenterManager

- (void)dealloc
{
  v2 = self;
  sub_24D0E891C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_24D05C8DC((uint64_t)self + OBJC_IVAR____TtC10DropInCore17CallCenterManager_delegate);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10DropInCore17CallCenterManager_conversationProviderManager));
  swift_unknownObjectRelease();
  swift_release();

  sub_24D0F01C0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_168();
  v3();
  sub_24D0F0190();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_168();
  v4();

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10DropInCore17CallCenterManager_activeCall);
}

- (_TtC10DropInCore17CallCenterManager)init
{
}

- (void)conversationManager:(id)a3 updatedIncomingPendingConversations:(id)a4
{
  sub_24D05BAFC(0, (unint64_t *)&unk_2698530E0);
  sub_24D0F06E0();
  id v6 = a3;
  v7 = self;
  sub_24D0EAAE4();

  swift_bridgeObjectRelease();
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_24D0EAD0C();
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_24D0EB4D4();
}

- (void)serverDisconnectedForConversationManager:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24D0EB8E0();
}

- (void)uplinkMutedChangedWithNotification:(id)a3
{
}

- (void)callStatusChangedWithNotification:(id)a3
{
}

@end