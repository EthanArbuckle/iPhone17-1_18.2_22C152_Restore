@interface AchievementBannerImageContainerView
- (_TtC12GameCenterUI35AchievementBannerImageContainerView)initWithAchievementImage:(id)a3;
- (_TtC12GameCenterUI35AchievementBannerImageContainerView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI35AchievementBannerImageContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AchievementBannerImageContainerView

- (_TtC12GameCenterUI35AchievementBannerImageContainerView)initWithAchievementImage:(id)a3
{
  return (_TtC12GameCenterUI35AchievementBannerImageContainerView *)AchievementBannerImageContainerView.init(achievementImage:)(a3);
}

- (_TtC12GameCenterUI35AchievementBannerImageContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF5747E8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF5748C8();
}

- (_TtC12GameCenterUI35AchievementBannerImageContainerView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI35AchievementBannerImageContainerView_achievementImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI35AchievementBannerImageContainerView_gameCenterImageView);
}

@end