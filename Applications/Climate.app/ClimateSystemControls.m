@interface ClimateSystemControls
- (_TtC7Climate21ClimateSystemControls)initWithCoder:(id)a3;
- (_TtC7Climate21ClimateSystemControls)initWithFrame:(CGRect)a3;
@end

@implementation ClimateSystemControls

- (_TtC7Climate21ClimateSystemControls)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7Climate21ClimateSystemControls____lazy_storage___controls) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate21ClimateSystemControls_areButtonsAlreadyVisible) = 0;
  id v4 = a3;

  result = (_TtC7Climate21ClimateSystemControls *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC7Climate21ClimateSystemControls)initWithFrame:(CGRect)a3
{
  result = (_TtC7Climate21ClimateSystemControls *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate21ClimateSystemControls_climate);
}

@end