@interface ActivityFeedAchievementView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityLabel;
- (_TtC12GameCenterUI27ActivityFeedAchievementView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI27ActivityFeedAchievementView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
@end

@implementation ActivityFeedAchievementView

- (_TtC12GameCenterUI27ActivityFeedAchievementView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI27ActivityFeedAchievementView *)sub_1AF7460FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI27ActivityFeedAchievementView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF74673C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_1AF746B7C();
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
  sub_1AF746CD8();
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_1AF7485EC();
  uint64_t v4 = v3;

  if (v4)
  {
    double v5 = (void *)sub_1AF7AE0A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1AF7AE0E0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  double v7 = self;
  sub_1AF406D14(v4, v6);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27ActivityFeedAchievementView_contentBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27ActivityFeedAchievementView_sharedView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27ActivityFeedAchievementView_achievementCardContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27ActivityFeedAchievementView_achievementConfettiView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end