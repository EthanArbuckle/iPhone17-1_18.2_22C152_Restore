@interface ActivityFeedLeaderboardView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12GameCenterUI27ActivityFeedLeaderboardView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI27ActivityFeedLeaderboardView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ActivityFeedLeaderboardView

- (_TtC12GameCenterUI27ActivityFeedLeaderboardView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI27ActivityFeedLeaderboardView *)sub_1AF729530(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI27ActivityFeedLeaderboardView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF729714();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_1AF72983C();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF7299A0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27ActivityFeedLeaderboardView_contentBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27ActivityFeedLeaderboardView_sharedView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27ActivityFeedLeaderboardView_leaderboardListSubview));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27ActivityFeedLeaderboardView_leaderboardAvatarsSubview));

  swift_bridgeObjectRelease();
}

@end