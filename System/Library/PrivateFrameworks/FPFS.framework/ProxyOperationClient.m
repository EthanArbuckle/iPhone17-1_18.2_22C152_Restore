@interface ProxyOperationClient
- (_TtC9libfssyncP33_7F4FBB69DAA1D0B2DA22684CBB0F5CB320ProxyOperationClient)init;
- (id)proxifiedDescription;
- (void)cancel;
- (void)operationDidProgressWithInfo:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)setCancellationHandler:(id)a3;
@end

@implementation ProxyOperationClient

- (id)proxifiedDescription
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9libfssyncP33_7F4FBB69DAA1D0B2DA22684CBB0F5CB320ProxyOperationClient_client);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_proxifiedDescription);
  sub_24DCC97E8();

  v5 = (void *)sub_24DCC97B8();
  swift_bridgeObjectRelease();

  return v5;
}

- (void)setCancellationHandler:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_24D5A41D0((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void)cancel
{
}

- (void)operationDidProgressWithInfo:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = sub_24DCC9578();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  v10 = self;
  id v11 = a4;
  sub_24D5A4330(v8, a4, (uint64_t)sub_24D4C5D6C, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (_TtC9libfssyncP33_7F4FBB69DAA1D0B2DA22684CBB0F5CB320ProxyOperationClient)init
{
  result = (_TtC9libfssyncP33_7F4FBB69DAA1D0B2DA22684CBB0F5CB320ProxyOperationClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end