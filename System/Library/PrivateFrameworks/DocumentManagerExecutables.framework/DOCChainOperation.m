@interface DOCChainOperation
- (_TtC26DocumentManagerExecutables17DOCChainOperation)init;
- (void)main;
@end

@implementation DOCChainOperation

- (void)main
{
  v2 = self;
  DOCChainOperation.main()();
}

- (_TtC26DocumentManagerExecutables17DOCChainOperation)init
{
  result = (_TtC26DocumentManagerExecutables17DOCChainOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCChainOperation_operationQueue));
  sub_22BDD473C((uint64_t)self + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCChainOperation_latestOperationResult);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCChainOperation_latestOperationError);
}

@end