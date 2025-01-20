@interface IMSPICollaborationMessageListener
- (IMSPICollaborationMessageListener)init;
- (IMSPICollaborationMessageListener)initWithListenerID:(id)a3;
- (IMSPICollaborationMessageListenerDelegate)delegate;
- (void)didReceiveCollaborationMessage:(id)a3 inChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6;
- (void)setDelegate:(id)a3;
- (void)startListening;
- (void)stopListening;
@end

@implementation IMSPICollaborationMessageListener

- (IMSPICollaborationMessageListenerDelegate)delegate
{
  v2 = (void *)MEMORY[0x1A62649D0]((char *)self + OBJC_IVAR___IMSPICollaborationMessageListener_delegate, a2);

  return (IMSPICollaborationMessageListenerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (IMSPICollaborationMessageListener)initWithListenerID:(id)a3
{
  return (IMSPICollaborationMessageListener *)sub_1A4CAC3F0();
}

- (void)startListening
{
  v2 = self;
  sub_1A4CAC500();
}

- (void)stopListening
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMSPICollaborationMessageListener_connection) = 0;
  v2 = self;
  swift_unknownObjectRelease();
  id v3 = objc_msgSend(self, sel_sharedController);
  id v4 = objc_msgSend(v3, sel_listener);

  objc_msgSend(v4, sel_removeHandler_, v2);
}

- (void)didReceiveCollaborationMessage:(id)a3 inChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6
{
  uint64_t v6 = a5;
  sub_1A4CBB0CC();
  sub_1A4CBB0CC();
  id v9 = a3;
  v14 = self;
  v10 = [(IMSPICollaborationMessageListener *)v14 delegate];
  if (v10)
  {
    v11 = v10;
    if ([(IMSPICollaborationMessageListenerDelegate *)v10 respondsToSelector:sel_collaborationMessageListener_receivedMessage_inChat_style_accountID_])
    {
      v12 = (void *)sub_1A4CBB0BC();
      v13 = (void *)sub_1A4CBB0BC();
      [(IMSPICollaborationMessageListenerDelegate *)v11 collaborationMessageListener:v14 receivedMessage:v9 inChat:v12 style:v6 accountID:v13];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

- (IMSPICollaborationMessageListener)init
{
  result = (IMSPICollaborationMessageListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A4CAC9A0((uint64_t)self + OBJC_IVAR___IMSPICollaborationMessageListener_delegate);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

@end