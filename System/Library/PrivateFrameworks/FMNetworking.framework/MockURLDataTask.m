@interface MockURLDataTask
- (_TtC12FMNetworking15MockURLDataTask)init;
- (void)resume;
@end

@implementation MockURLDataTask

- (void)resume
{
  v2 = *(void (**)(void))((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC12FMNetworking15MockURLDataTask_executionBlock);
  v3 = self;
  v2();
}

- (_TtC12FMNetworking15MockURLDataTask)init
{
  result = (_TtC12FMNetworking15MockURLDataTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end