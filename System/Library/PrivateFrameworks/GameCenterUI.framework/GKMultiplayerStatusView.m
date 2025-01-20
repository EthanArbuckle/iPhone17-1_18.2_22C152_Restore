@interface GKMultiplayerStatusView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityStatusLabel;
- (_TtC12GameCenterUI23GKMultiplayerStatusView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI23GKMultiplayerStatusView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation GKMultiplayerStatusView

- (_TtC12GameCenterUI23GKMultiplayerStatusView)initWithCoder:(id)a3
{
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  GKMultiplayerStatusView.measurements(fitting:in:)();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  swift_unknownObjectRelease();

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  GKMultiplayerStatusView.layoutSubviews()();
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityStatusLabel
{
  id v2 = sub_1AF4C2224();

  return (_TtC12GameCenterUI16DynamicTypeLabel *)v2;
}

- (_TtC12GameCenterUI23GKMultiplayerStatusView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI23GKMultiplayerStatusView_label));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI23GKMultiplayerStatusView_accessoryView);
}

@end