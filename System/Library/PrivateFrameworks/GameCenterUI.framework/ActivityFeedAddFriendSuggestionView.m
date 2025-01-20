@interface ActivityFeedAddFriendSuggestionView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12GameCenterUI35ActivityFeedAddFriendSuggestionView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI35ActivityFeedAddFriendSuggestionView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ActivityFeedAddFriendSuggestionView

- (_TtC12GameCenterUI35ActivityFeedAddFriendSuggestionView)initWithFrame:(CGRect)a3
{
  sub_1AF70B8E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC12GameCenterUI35ActivityFeedAddFriendSuggestionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF70BBB8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_1AF70BC94();
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
  sub_1AF70BED0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI35ActivityFeedAddFriendSuggestionView_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI35ActivityFeedAddFriendSuggestionView_stackView));

  swift_bridgeObjectRelease();
}

@end