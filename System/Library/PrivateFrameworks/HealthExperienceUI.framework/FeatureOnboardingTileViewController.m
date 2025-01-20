@interface FeatureOnboardingTileViewController
- (_TtC18HealthExperienceUI35FeatureOnboardingTileViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI35FeatureOnboardingTileViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation FeatureOnboardingTileViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD4D1DE4();
}

- (_TtC18HealthExperienceUI35FeatureOnboardingTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC18HealthExperienceUI35FeatureOnboardingTileViewController *)FeatureOnboardingTileViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC18HealthExperienceUI35FeatureOnboardingTileViewController)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI35FeatureOnboardingTileViewController *)FeatureOnboardingTileViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1AD353CB0((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI35FeatureOnboardingTileViewController_context);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35FeatureOnboardingTileViewController_headerImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35FeatureOnboardingTileViewController____lazy_storage___headerImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35FeatureOnboardingTileViewController____lazy_storage___headerTitle));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35FeatureOnboardingTileViewController____lazy_storage___bulletStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35FeatureOnboardingTileViewController____lazy_storage___buttonStack));
  swift_bridgeObjectRelease();
}

@end