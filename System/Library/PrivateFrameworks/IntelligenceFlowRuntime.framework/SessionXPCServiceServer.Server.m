@interface SessionXPCServiceServer.Server
- (_TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server)init;
- (void)attachAsObserverTo:(id)a3 with:(id)a4;
- (void)createSessionFromProtoEventsWithEventProtos:(id)a3 configData:(id)a4 xpcData:(id)a5 with:(id)a6;
- (void)dealloc;
- (void)detachObservationFrom:(id)a3 with:(id)a4;
- (void)endSessionWithId:(id)a3 with:(id)a4;
- (void)fetchSessionClientIdWithReply:(id)a3;
- (void)generateStatementIdWithId:(id)a3 with:(id)a4;
- (void)performSetupWithConfigData:(id)a3 reply:(id)a4;
- (void)postTransactionWithSessionId:(id)a3 eventProtos:(id)a4 with:(id)a5;
- (void)sendWithMessageData:(id)a3 with:(id)a4;
- (void)startSessionWithId:(id)a3 configData:(id)a4 xpcData:(id)a5 with:(id)a6;
- (void)updateTransactionHookAttachmentStatus:(id)a3 with:(id)a4;
@end

@implementation SessionXPCServiceServer.Server

- (void)performSetupWithConfigData:(id)a3 reply:(id)a4
{
}

- (void)startSessionWithId:(id)a3 configData:(id)a4 xpcData:(id)a5 with:(id)a6
{
  v8 = _Block_copy(a6);
  sub_253DF5270();
  id v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  uint64_t v11 = sub_253DEFDD0();
  unint64_t v13 = v12;

  *(void *)(swift_allocObject() + 16) = v8;
  sub_253DD2DA4();
  swift_release();
  sub_253D75D88(v11, v13);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)createSessionFromProtoEventsWithEventProtos:(id)a3 configData:(id)a4 xpcData:(id)a5 with:(id)a6
{
  v8 = _Block_copy(a6);
  sub_253DF53A0();
  id v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  uint64_t v11 = sub_253DEFDD0();
  unint64_t v13 = v12;

  *(void *)(swift_allocObject() + 16) = v8;
  sub_253DD4E70();
  swift_release();
  sub_253D75D88(v11, v13);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)postTransactionWithSessionId:(id)a3 eventProtos:(id)a4 with:(id)a5
{
  uint64_t v7 = sub_253DEFE90();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a5);
  sub_253DEFE70();
  sub_253DF53A0();
  *(void *)(swift_allocObject() + 16) = v11;
  unint64_t v12 = self;
  sub_253DD6938();

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)endSessionWithId:(id)a3 with:(id)a4
{
  uint64_t v6 = sub_253DEFE90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_253DEFE70();
  *(void *)(swift_allocObject() + 16) = v10;
  uint64_t v11 = self;
  sub_253DD82B8();

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)sendWithMessageData:(id)a3 with:(id)a4
{
}

- (void)generateStatementIdWithId:(id)a3 with:(id)a4
{
  uint64_t v6 = sub_253DEFE90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_253DEFE70();
  *(void *)(swift_allocObject() + 16) = v10;
  uint64_t v11 = self;
  sub_253DD82B8();

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)updateTransactionHookAttachmentStatus:(id)a3 with:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_253DD89EC(v8, (uint64_t)sub_253DDC190, v7);

  swift_release();
}

- (void)attachAsObserverTo:(id)a3 with:(id)a4
{
  uint64_t v6 = sub_253DEFE90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_253DEFE70();
  *(void *)(swift_allocObject() + 16) = v10;
  uint64_t v11 = self;
  sub_253DD934C();

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)detachObservationFrom:(id)a3 with:(id)a4
{
  uint64_t v6 = sub_253DEFE90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_253DEFE70();
  *(void *)(swift_allocObject() + 16) = v10;
  uint64_t v11 = self;
  sub_253DD934C();

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)fetchSessionClientIdWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  v5 = self;
  sub_253DD996C();

  swift_release();
}

- (void)dealloc
{
  v2 = self;
  sub_253DD9C24();
}

- (void).cxx_destruct
{
  sub_253DDBB88((uint64_t)self + OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_sessionClientId, MEMORY[0x263F4C718]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (_TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server)init
{
}

@end