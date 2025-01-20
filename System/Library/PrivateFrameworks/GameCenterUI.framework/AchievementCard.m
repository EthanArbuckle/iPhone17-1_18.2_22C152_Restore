@interface AchievementCard
- (BOOL)canBecomeFocused;
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (NSDate)accessibilityAchievementCompletedDate;
- (_TtC12GameCenterUI15AchievementCard)initWithCoder:(id)a3;
- (_TtC12GameCenterUI15AchievementCard)initWithFrame:(CGRect)a3;
- (_TtC12GameCenterUI16AchievementBadge)accessibilityBadge;
- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)didTap;
- (void)layoutSubviews;
@end

@implementation AchievementCard

- (_TtC12GameCenterUI15AchievementCard)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI15AchievementCard *)AchievementCard.init(frame:)();
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v2 = self;
  AchievementCard._dynamicUserInterfaceTraitDidChange()();
}

- (_TtC12GameCenterUI15AchievementCard)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF6CC840();
}

- (void)layoutSubviews
{
  v2 = self;
  AchievementCard.layoutSubviews()();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  CGSize v6 = AchievementCard.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  v5 = self;
  double v6 = sub_1AF6CF590();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  swift_unknownObjectRelease();

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (BOOL)canBecomeFocused
{
  return AchievementCard.canBecomeFocused.getter() & 1;
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel
{
  id v2 = sub_1AF6CD4B0();

  return (_TtC12GameCenterUI16DynamicTypeLabel *)v2;
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilitySubtitleLabel
{
  id v2 = sub_1AF6CD4F0();

  return (_TtC12GameCenterUI16DynamicTypeLabel *)v2;
}

- (NSDate)accessibilityAchievementCompletedDate
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC4D60);
  MEMORY[0x1F4188790](v2 - 8);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF6CD5F0((uint64_t)v4);
  uint64_t v5 = sub_1AF7A98B0();
  double v6 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) != 1)
  {
    double v6 = (void *)sub_1AF7A9830();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }

  return (NSDate *)v6;
}

- (_TtC12GameCenterUI16AchievementBadge)accessibilityBadge
{
  id v2 = sub_1AF6CD6B8();

  return (_TtC12GameCenterUI16AchievementBadge *)v2;
}

- (void)didTap
{
  id v2 = self;
  sub_1AF6CDA98();
}

- (void).cxx_destruct
{
  uint64_t v3 = *(CALayer **)((char *)&self->super._layerRetained + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style);
  v4 = *(NSArray **)((char *)&self->super._subviewCache + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style);
  uint64_t v5 = *(UIWindow **)((char *)&self->super._window + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style);
  double v6 = *(NSArray **)((char *)&self->super._gestureRecognizers + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style);
  double v7 = *(UIViewController **)((char *)&self->super._viewDelegate + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style);
  uint64_t v8 = *(void **)((char *)&self->super._viewFlags + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style);
  double v9 = *(void **)((char *)&self->super._viewFlags + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style + 16);
  sub_1AF3DB200(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style), *(void **)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style), *(uint64_t *)((char *)&self->super._cachedTraitCollection + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style), *(uint64_t *)((char *)&self->super._swiftAnimationInfo + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style), *((unsigned char *)&self->super._traitChangeRegistry + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_style));

  sub_1AF36C2A0((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_metrics);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI15AchievementCard____lazy_storage___highlightView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI15AchievementCard____lazy_storage___focusBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_backgroundView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_friendsWhoAchievedThis));
  sub_1AF6CAFD8((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_model);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_tapGestureRecognizer));
  uint64_t v10 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12GameCenterUI15AchievementCard_tapHandler);

  sub_1AF368930(v10);
}

@end