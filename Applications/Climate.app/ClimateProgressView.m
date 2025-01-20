@interface ClimateProgressView
- (_TtC7Climate19ClimateProgressView)initWithCoder:(id)a3;
- (_TtC7Climate19ClimateProgressView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation ClimateProgressView

- (_TtC7Climate19ClimateProgressView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100031CA8();
}

- (_TtC7Climate19ClimateProgressView)initWithFrame:(CGRect)a3
{
  result = (_TtC7Climate19ClimateProgressView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Climate19ClimateProgressView_progressColorConfig);
  v4 = *(void **)&self->currentValue[OBJC_IVAR____TtC7Climate19ClimateProgressView_progressColorConfig];
  v5 = *(void **)&self->contentView[OBJC_IVAR____TtC7Climate19ClimateProgressView_progressColorConfig + 4];
  swift_bridgeObjectRelease();

  v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Climate19ClimateProgressView_centerSymbolYConstraint);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

@end