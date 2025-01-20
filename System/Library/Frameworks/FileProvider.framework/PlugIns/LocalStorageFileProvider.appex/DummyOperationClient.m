@interface DummyOperationClient
- (_TtC9libfssync20DummyOperationClient)init;
- (id)proxifiedDescription;
- (void)operationDidProgressWithInfo:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)setCancellationHandler:(id)a3;
@end

@implementation DummyOperationClient

- (id)proxifiedDescription
{
  NSString v2 = sub_10096BC00();

  return v2;
}

- (void)setCancellationHandler:(id)a3
{
  *(void *)&self->FPOperation_opaque[OBJC_IVAR____TtC9libfssync20DummyOperationClient_cancellationHandler] = a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (void)operationDidProgressWithInfo:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = sub_10096B9C0();
  _Block_copy(v7);
  v9 = self;
  id v10 = a4;
  sub_100242A4C(v8, (uint64_t)a4, (uint64_t)v9, (uint64_t)v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (_TtC9libfssync20DummyOperationClient)init
{
  result = (_TtC9libfssync20DummyOperationClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_unknownObjectRelease();
}

@end