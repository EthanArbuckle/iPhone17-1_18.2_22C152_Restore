@interface FeatureOnboardingBulletListItemView
- (_TtC18HealthExperienceUI35FeatureOnboardingBulletListItemView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI35FeatureOnboardingBulletListItemView)initWithFrame:(CGRect)a3;
- (void)buttonWasTapped;
- (void)updateConstraints;
@end

@implementation FeatureOnboardingBulletListItemView

- (_TtC18HealthExperienceUI35FeatureOnboardingBulletListItemView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s18HealthExperienceUI35FeatureOnboardingBulletListItemViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)updateConstraints
{
  v2 = self;
  sub_1AD455338();
}

- (void)buttonWasTapped
{
  v2 = self;
  sub_1AD455494();
}

- (_TtC18HealthExperienceUI35FeatureOnboardingBulletListItemView)initWithFrame:(CGRect)a3
{
  result = (_TtC18HealthExperienceUI35FeatureOnboardingBulletListItemView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35FeatureOnboardingBulletListItemView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35FeatureOnboardingBulletListItemView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35FeatureOnboardingBulletListItemView_descriptionLabel));
  sub_1AD453B8C(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI35FeatureOnboardingBulletListItemView_buttonConfiguration), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI35FeatureOnboardingBulletListItemView_buttonConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35FeatureOnboardingBulletListItemView_button));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end