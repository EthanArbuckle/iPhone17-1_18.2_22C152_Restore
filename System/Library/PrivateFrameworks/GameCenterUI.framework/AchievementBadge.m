@interface AchievementBadge
- (BOOL)accessibilityIsAchievementCompleted;
- (BOOL)accessibilityIsAchievementInProgress;
- (BOOL)accessibilityIsAchievementLocked;
- (_TtC12GameCenterUI16AchievementBadge)initWithCoder:(id)a3;
- (_TtC12GameCenterUI16AchievementBadge)initWithFrame:(CGRect)a3;
- (double)accessibilityProgress;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)layoutSubviews;
@end

@implementation AchievementBadge

- (_TtC12GameCenterUI16AchievementBadge)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF71E660();
}

- (void)layoutSubviews
{
  v2 = self;
  AchievementBadge.layoutSubviews()();
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v2 = self;
  AchievementBadge._dynamicUserInterfaceTraitDidChange()();
}

- (BOOL)accessibilityIsAchievementLocked
{
  return sub_1AF71F51C();
}

- (BOOL)accessibilityIsAchievementCompleted
{
  return sub_1AF71F590();
}

- (BOOL)accessibilityIsAchievementInProgress
{
  return sub_1AF71F5F8();
}

- (double)accessibilityProgress
{
  return sub_1AF71F65C();
}

- (_TtC12GameCenterUI16AchievementBadge)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_style);
  v4 = *(void **)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_style);
  v5 = *(FBSSceneIdentityToken **)((char *)&self->super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_style);
  v6 = *(NSMutableArray **)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_style);
  v7 = *(UITraitCollection **)((char *)&self->super._cachedTraitCollection
                             + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_style);
  v8 = *(id *)((char *)&self->super._swiftAnimationInfo + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_style);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge____lazy_storage___progressNumberFont));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge____lazy_storage___progressPercentageFont));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge____lazy_storage___numberFormatter));
  sub_1AF3EB814(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_status), *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_status), *(unint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_status));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_innerShadow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_outerFoilLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_outerFoilRing));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_progressBarLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_iconImageView));
  v9 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12GameCenterUI16AchievementBadge_progressLabel);
}

@end