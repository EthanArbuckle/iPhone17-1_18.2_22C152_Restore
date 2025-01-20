@interface ActivityFeedLeaderboardRowView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12GameCenterUI30ActivityFeedLeaderboardRowView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI30ActivityFeedLeaderboardRowView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ActivityFeedLeaderboardRowView

- (_TtC12GameCenterUI30ActivityFeedLeaderboardRowView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI30ActivityFeedLeaderboardRowView *)sub_1AF408864(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI30ActivityFeedLeaderboardRowView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF408F00();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_1AF409100();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF409A50();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI30ActivityFeedLeaderboardRowView_contentBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI30ActivityFeedLeaderboardRowView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI30ActivityFeedLeaderboardRowView_nicknameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI30ActivityFeedLeaderboardRowView_pointsLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI30ActivityFeedLeaderboardRowView_accessoryView);
}

@end