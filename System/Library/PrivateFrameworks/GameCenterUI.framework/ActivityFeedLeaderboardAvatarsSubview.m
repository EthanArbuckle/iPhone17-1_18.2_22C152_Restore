@interface ActivityFeedLeaderboardAvatarsSubview
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview)initWithCoder:(id)a3;
- (_TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview)initWithFrame:(CGRect)a3;
- (void)didTap;
- (void)layoutSubviews;
@end

@implementation ActivityFeedLeaderboardAvatarsSubview

- (_TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview *)sub_1AF5CCD64(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF5CD200();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_1AF5CD484();
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
  sub_1AF5CD610();
}

- (void)didTap
{
  v2 = self;
  sub_1AF5CE7D0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview_avatarBackgroundImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview_messageLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview_scoreLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview_emojiLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview_tapGestureRecognizer));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview_tapHandler);

  sub_1AF368930(v3);
}

@end