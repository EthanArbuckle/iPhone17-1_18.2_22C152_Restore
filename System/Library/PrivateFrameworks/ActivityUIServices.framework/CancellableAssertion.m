@interface CancellableAssertion
- (_TtC18ActivityUIServices20CancellableAssertion)init;
- (void)invalidate;
@end

@implementation CancellableAssertion

- (void)invalidate
{
  v2 = self;
  swift_retain();
  sub_23C990E90();

  swift_release();
}

- (_TtC18ActivityUIServices20CancellableAssertion)init
{
  result = (_TtC18ActivityUIServices20CancellableAssertion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end