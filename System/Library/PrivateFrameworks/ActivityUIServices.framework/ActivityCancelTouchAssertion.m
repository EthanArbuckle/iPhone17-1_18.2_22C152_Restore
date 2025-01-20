@interface ActivityCancelTouchAssertion
- (_TtC18ActivityUIServices28ActivityCancelTouchAssertion)init;
- (void)dealloc;
- (void)invalidate;
@end

@implementation ActivityCancelTouchAssertion

- (void)dealloc
{
  char v2 = *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices28ActivityCancelTouchAssertion_isInvalidated);
  v3 = self;
  v4 = v3;
  if ((v2 & 1) == 0) {
    [(ActivityCancelTouchAssertion *)v3 invalidate];
  }
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for ActivityCancelTouchAssertion();
  [(ActivityCancelTouchAssertion *)&v5 dealloc];
}

- (void).cxx_destruct
{
}

- (_TtC18ActivityUIServices28ActivityCancelTouchAssertion)init
{
  result = (_TtC18ActivityUIServices28ActivityCancelTouchAssertion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)invalidate
{
  char v2 = self;
  sub_23C9610B8();
}

@end