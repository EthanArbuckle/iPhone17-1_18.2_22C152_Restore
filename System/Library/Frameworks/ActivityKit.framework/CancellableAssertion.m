@interface CancellableAssertion
- (_TtC11ActivityKit20CancellableAssertion)init;
- (void)cancel;
@end

@implementation CancellableAssertion

- (void)cancel
{
  v2 = self;
  swift_retain();
  sub_242FDBD60();

  swift_release();
}

- (_TtC11ActivityKit20CancellableAssertion)init
{
  result = (_TtC11ActivityKit20CancellableAssertion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end