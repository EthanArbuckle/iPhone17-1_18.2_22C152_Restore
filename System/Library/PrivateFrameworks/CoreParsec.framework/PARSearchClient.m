@interface PARSearchClient
- (NSXPCConnection)connection;
- (_TtC10CoreParsec15PARSearchClient)init;
- (unint64_t)request:(id)a3 request:(id)a4 reply:(id)a5;
- (void)bag:(id)a3 reply:(id)a4;
- (void)bagDidLoad:(id)a3 error:(id)a4;
- (void)clearEngagedResults:(id)a3 with:(id)a4 completion:(id)a5;
- (void)clearEngagementsFrom:(id)a3 to:(id)a4;
- (void)clearEngagementsWith:(id)a3 type:(id)a4;
- (void)dealloc;
- (void)didDeleteResource:(id)a3;
- (void)didDownloadResource:(id)a3;
- (void)didReceiveFeedbackData:(id)a3 agent:(id)a4;
- (void)fileHandleAndAttributesForResource:(id)a3 completion:(id)a4;
- (void)forceFetchBag:(id)a3 reply:(id)a4;
- (void)getImageMap:(id)a3;
- (void)listSessions:(id)a3;
- (void)reportFeedback:(id)a3 feedback:(id)a4 queryId:(unint64_t)a5;
- (void)updateParametersForSmartSearchV1:(id)a3 smartSearchV2:(id)a4;
@end

@implementation PARSearchClient

- (_TtC10CoreParsec15PARSearchClient)init
{
  return (_TtC10CoreParsec15PARSearchClient *)PARSearchClient.init()();
}

- (NSXPCConnection)connection
{
  id v2 = PARSearchClient.connection.getter();

  return (NSXPCConnection *)v2;
}

- (void)dealloc
{
  id v2 = self;
  PARSearchClient.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_19C81B8E4((uint64_t)self + OBJC_IVAR____TtC10CoreParsec15PARSearchClient_receivingStreamDelegate);

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10CoreParsec15PARSearchClient_connection);
}

- (void)bag:(id)a3 reply:(id)a4
{
}

- (void)forceFetchBag:(id)a3 reply:(id)a4
{
}

- (unint64_t)request:(id)a3 request:(id)a4 reply:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  id v12 = sub_19C8208C0((uint64_t)v9, v10, (uint64_t)v11, v8);
  _Block_release(v8);

  return (unint64_t)v12;
}

- (void)reportFeedback:(id)a3 feedback:(id)a4 queryId:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_19C7F6234();
}

- (void)listSessions:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_19C821C40((uint64_t)sub_19C826CF0, v5);

  swift_release();
}

- (void)fileHandleAndAttributesForResource:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  sub_19C899DF0();
  *(void *)(swift_allocObject() + 16) = v5;
  v6 = self;
  sub_19C821E90();

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)getImageMap:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_19C8223A8((uint64_t)v5, (void (**)(void, void))v4);
  _Block_release(v4);
}

- (void)clearEngagementsFrom:(id)a3 to:(id)a4
{
  uint64_t v5 = sub_19C898EC0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v5, v7, v8, v9, v10);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11, v14, v15, v16, v17);
  v19 = (char *)&v22 - v18;
  sub_19C898EA0();
  sub_19C898EA0();
  v20 = self;
  sub_19C823D9C();

  v21 = *(void (**)(char *, uint64_t))(v6 + 8);
  v21(v13, v5);
  v21(v19, v5);
}

- (void)clearEngagementsWith:(id)a3 type:(id)a4
{
  uint64_t v6 = sub_19C899DF0();
  uint64_t v8 = v7;
  id v9 = a4;
  uint64_t v10 = self;
  sub_19C823F78(v6, v8, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)clearEngagedResults:(id)a3 with:(id)a4 completion:(id)a5
{
  uint64_t v7 = (void (*)(void))_Block_copy(a5);
  sub_19C7F4430(0, (unint64_t *)&unk_1EB4D9B60);
  unint64_t v8 = sub_19C899F10();
  if (v7)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    uint64_t v7 = (void (*)(void))sub_19C81B404;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a4;
  uint64_t v11 = self;
  sub_19C824094(v8, (uint64_t)v10, v7, v9);
  sub_19C81B40C((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)updateParametersForSmartSearchV1:(id)a3 smartSearchV2:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  sub_19C8244EC((uint64_t)v6, (uint64_t)v7);
}

- (void)bagDidLoad:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  PARSearchClient.bagDidLoad(_:error:)();
}

- (void)didDownloadResource:(id)a3
{
}

- (void)didDeleteResource:(id)a3
{
}

- (void)didReceiveFeedbackData:(id)a3 agent:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = self;
    id v8 = a3;
    uint64_t v9 = sub_19C898E40();
    unint64_t v11 = v10;

    if (a4)
    {
LABEL_3:
      uint64_t v12 = sub_19C899DF0();
      uint64_t v14 = v13;

      goto LABEL_6;
    }
  }
  else
  {
    id v15 = a4;
    uint64_t v16 = self;
    uint64_t v9 = 0;
    unint64_t v11 = 0xF000000000000000;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
  uint64_t v14 = 0;
LABEL_6:
  PARSearchClient.didReceiveFeedbackData(_:agent:)(v9, v11, v12, v14);
  swift_bridgeObjectRelease();
  sub_19C7F47E4(v9, v11);
}

@end