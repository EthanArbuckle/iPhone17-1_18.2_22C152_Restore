@interface RCSMessageSender
- (BOOL)sendAsGroupMessage;
- (CTXPCServiceSubscriptionContext)context;
- (IMDChat)chat;
- (IMDTelephonyServiceSession)session;
- (IMMessageItem)message;
- (NSArray)recipients;
- (RCSMessageSender)init;
- (RCSMessageSender)initWithSession:(id)a3 message:(id)a4 chat:(id)a5 style:(unsigned __int8)a6 recipients:(id)a7 context:(id)a8;
- (RCSServiceSession)rcsSession;
- (unsigned)style;
- (void)buildWith:(id)a3 parts:(id)a4 completion:(id)a5;
- (void)deriveConfiguration;
- (void)prepareWithCompletion:(id)a3;
- (void)sendWithCompletion:(id)a3;
- (void)setContext:(id)a3;
- (void)setSendAsGroupMessage:(BOOL)a3;
@end

@implementation RCSMessageSender

- (IMDTelephonyServiceSession)session
{
  return (IMDTelephonyServiceSession *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR___RCSMessageSender_session));
}

- (RCSServiceSession)rcsSession
{
  return (RCSServiceSession *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR___RCSMessageSender_rcsSession));
}

- (IMMessageItem)message
{
  return (IMMessageItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR___RCSMessageSender_message));
}

- (IMDChat)chat
{
  return (IMDChat *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___RCSMessageSender_chat));
}

- (unsigned)style
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___RCSMessageSender_style);
}

- (NSArray)recipients
{
  swift_bridgeObjectRetain();
  sub_551C(&qword_128730);
  v2 = (void *)sub_F7400();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (CTXPCServiceSubscriptionContext)context
{
  return (CTXPCServiceSubscriptionContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                    + OBJC_IVAR___RCSMessageSender_context));
}

- (void)setContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___RCSMessageSender_context);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___RCSMessageSender_context) = (Class)a3;
  id v3 = a3;
}

- (BOOL)sendAsGroupMessage
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___RCSMessageSender_sendAsGroupMessage);
}

- (void)setSendAsGroupMessage:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___RCSMessageSender_sendAsGroupMessage) = a3;
}

- (RCSMessageSender)initWithSession:(id)a3 message:(id)a4 chat:(id)a5 style:(unsigned __int8)a6 recipients:(id)a7 context:(id)a8
{
  sub_551C(&qword_128730);
  uint64_t v13 = sub_F7410();
  return (RCSMessageSender *)sub_72F34(a3, (uint64_t)a4, (uint64_t)a5, a6, v13, (uint64_t)a8);
}

- (void)deriveConfiguration
{
  v6 = self;
  v2 = [(RCSMessageSender *)v6 session];
  id v3 = [(RCSMessageSender *)v6 chat];
  unsigned int v4 = [(IMDTelephonyServiceSession *)v2 isGroupMessagingEnabledFor:v3];

  if ([(RCSMessageSender *)v6 style] == 45) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v4;
  }
  [(RCSMessageSender *)v6 setSendAsGroupMessage:v5];
}

- (void)prepareWithCompletion:(id)a3
{
  unsigned int v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_73174((uint64_t)sub_75F4C, v5);

  swift_release();
}

- (void)buildWith:(id)a3 parts:(id)a4 completion:(id)a5
{
  uint64_t v8 = sub_551C((uint64_t *)&unk_128000);
  __chkstk_darwin(v8 - 8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  uint64_t v13 = sub_F7520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = sub_75F6C;
  v14[7] = v12;
  id v15 = a3;
  v16 = self;
  id v17 = v15;
  swift_retain();
  sub_74FCC((uint64_t)v10, (uint64_t)&unk_129030, (uint64_t)v14);

  swift_release();
  swift_release();
}

- (void)sendWithCompletion:(id)a3
{
  uint64_t v5 = sub_551C((uint64_t *)&unk_128000);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = sub_F7520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_75D00;
  v11[6] = v9;
  uint64_t v12 = self;
  swift_retain();
  sub_9EAC((uint64_t)v7, (uint64_t)&unk_129020, (uint64_t)v11);

  swift_release();
  swift_release();
}

- (RCSMessageSender)init
{
  result = (RCSMessageSender *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E944((uint64_t)self + OBJC_IVAR___RCSMessageSender_compatibilityTransformer, &qword_129040);
}

@end