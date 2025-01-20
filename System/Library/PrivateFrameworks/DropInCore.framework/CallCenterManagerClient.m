@interface CallCenterManagerClient
- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
@end

@implementation CallCenterManagerClient

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC10DropInCore23CallCenterManagerClient_logger;
  sub_24D0F01C0();
  OUTLINED_FUNCTION_11_0();
  v6 = *(void (**)(char *, uint64_t))(v5 + 8);

  v6(v3, v4);
}

- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_24D070134();
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_24D07040C();
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_24D071174((uint64_t)v6, (uint64_t)v7);
}

@end