@interface AsynchronousBlockOperation
- (NSString)debugDescription;
- (_TtC16HealthExperience26AsynchronousBlockOperation)init;
- (void)main;
@end

@implementation AsynchronousBlockOperation

- (void)main
{
  v2 = *(void (**)(void))((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC16HealthExperience26AsynchronousBlockOperation_workBlock);
  v3 = self;
  v2();
}

- (NSString)debugDescription
{
  v2 = self;
  sub_1C284EF80();

  v3 = (void *)sub_1C28CD6F0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC16HealthExperience26AsynchronousBlockOperation)init
{
  result = (_TtC16HealthExperience26AsynchronousBlockOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end