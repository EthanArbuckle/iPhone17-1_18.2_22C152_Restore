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
  id v4 = [v2 proxifiedDescription];
  _sSo28NSFileProviderItemIdentifiera9libfssyncE15parseableStringSSvg_0();

  NSString v5 = sub_10096BC00();
  swift_bridgeObjectRelease();

  return v5;
}

- (void)setCancellationHandler:(id)a3
{
  swift_unknownObjectRetain();
  NSString v5 = self;
  sub_10020F4C8((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void)cancel
{
}

- (void)operationDidProgressWithInfo:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = sub_10096B9C0();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  v10 = self;
  id v11 = a4;
  sub_10020F628(v8, a4, (uint64_t)sub_10012F588, v9);

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