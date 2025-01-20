@interface LeaderboardMovementLockupView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUI29LeaderboardMovementLockupView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI29LeaderboardMovementLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LeaderboardMovementLockupView

- (_TtC12GameCenterUI29LeaderboardMovementLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI29LeaderboardMovementLockupView *)sub_1AF630D1C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI29LeaderboardMovementLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF6310EC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_1AF3A39CC();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  double v5 = self;
  double v6 = sub_1AF63134C();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  swift_unknownObjectRelease();

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF631F38();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29LeaderboardMovementLockupView_gradientBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29LeaderboardMovementLockupView_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29LeaderboardMovementLockupView_detailLabel));

  swift_bridgeObjectRelease();
}

@end