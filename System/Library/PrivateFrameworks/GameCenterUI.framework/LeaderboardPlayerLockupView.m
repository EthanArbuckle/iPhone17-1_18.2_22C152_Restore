@interface LeaderboardPlayerLockupView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUI27LeaderboardPlayerLockupView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI27LeaderboardPlayerLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LeaderboardPlayerLockupView

- (_TtC12GameCenterUI27LeaderboardPlayerLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI27LeaderboardPlayerLockupView *)sub_1AF3A30A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI27LeaderboardPlayerLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF3A352C();
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
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  double v7 = self;
  double v8 = sub_1AF3A3A34(width, height);
  double v10 = v9;
  double v12 = v11;
  swift_unknownObjectRelease();

  double v13 = 0.0;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.var3 = v13;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF3A3B5C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27LeaderboardPlayerLockupView_movementArrowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27LeaderboardPlayerLockupView_ordinalLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27LeaderboardPlayerLockupView_avatarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27LeaderboardPlayerLockupView_playerHandleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27LeaderboardPlayerLockupView_detailLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI27LeaderboardPlayerLockupView_separatorView);
}

@end