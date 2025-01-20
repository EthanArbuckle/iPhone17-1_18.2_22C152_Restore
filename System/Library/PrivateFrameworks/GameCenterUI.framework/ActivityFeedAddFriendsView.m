@interface ActivityFeedAddFriendsView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12GameCenterUI26ActivityFeedAddFriendsView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI26ActivityFeedAddFriendsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ActivityFeedAddFriendsView

- (_TtC12GameCenterUI26ActivityFeedAddFriendsView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI26ActivityFeedAddFriendsView *)sub_1AF646118(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI26ActivityFeedAddFriendsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF6462C4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_1AF6463B8();
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
  sub_1AF64651C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26ActivityFeedAddFriendsView_contentBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26ActivityFeedAddFriendsView_emptyStateView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI26ActivityFeedAddFriendsView_friendSuggestionView);
}

@end