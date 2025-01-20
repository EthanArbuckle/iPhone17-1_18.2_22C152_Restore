@interface ClimateStatusBarView
- (_TtC7Climate20ClimateStatusBarView)initWithCoder:(id)a3;
- (_TtC7Climate20ClimateStatusBarView)initWithFrame:(CGRect)a3;
@end

@implementation ClimateStatusBarView

- (_TtC7Climate20ClimateStatusBarView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate20ClimateStatusBarView_temperatureIndicator) = 0;
  id v4 = a3;

  result = (_TtC7Climate20ClimateStatusBarView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC7Climate20ClimateStatusBarView)initWithFrame:(CGRect)a3
{
  result = (_TtC7Climate20ClimateStatusBarView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100057C04((uint64_t)self + OBJC_IVAR____TtC7Climate20ClimateStatusBarView_climateZone);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Climate20ClimateStatusBarView_temperatureIndicator);
}

@end