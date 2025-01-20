@interface ActivityFeedLeaderboardListSubview
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12GameCenterUI34ActivityFeedLeaderboardListSubview)initWithCoder:(id)a3;
- (_TtC12GameCenterUI34ActivityFeedLeaderboardListSubview)initWithFrame:(CGRect)a3;
- (void)didTap;
- (void)layoutSubviews;
@end

@implementation ActivityFeedLeaderboardListSubview

- (_TtC12GameCenterUI34ActivityFeedLeaderboardListSubview)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI34ActivityFeedLeaderboardListSubview *)sub_1AF65B210(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI34ActivityFeedLeaderboardListSubview)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF65B46C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_1AF65B5A4();
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
  sub_1AF65B828();
}

- (void)didTap
{
  v2 = self;
  sub_1AF65CC18();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI34ActivityFeedLeaderboardListSubview_tapGestureRecognizer));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12GameCenterUI34ActivityFeedLeaderboardListSubview_tapHandler);

  sub_1AF368930(v3);
}

@end