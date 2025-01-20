@interface LeaderboardLockupView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUI21LeaderboardLockupView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI21LeaderboardLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LeaderboardLockupView

- (_TtC12GameCenterUI21LeaderboardLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI21LeaderboardLockupView *)sub_1AF7772C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI21LeaderboardLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF777568();
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
  sub_1AF777810();
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
  sub_1AF777C1C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI21LeaderboardLockupView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI21LeaderboardLockupView_subtitleLabel));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end