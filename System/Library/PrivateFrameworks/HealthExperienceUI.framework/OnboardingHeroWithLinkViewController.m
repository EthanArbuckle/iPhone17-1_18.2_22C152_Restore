@interface OnboardingHeroWithLinkViewController
- (_TtC18HealthExperienceUI36OnboardingHeroWithLinkViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC18HealthExperienceUI36OnboardingHeroWithLinkViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)viewDidLoad;
@end

@implementation OnboardingHeroWithLinkViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD492B68();
}

- (_TtC18HealthExperienceUI36OnboardingHeroWithLinkViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC18HealthExperienceUI36OnboardingHeroWithLinkViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI36OnboardingHeroWithLinkViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC18HealthExperienceUI36OnboardingHeroWithLinkViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI36OnboardingHeroWithLinkViewController_heroView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI36OnboardingHeroWithLinkViewController_linkButtonAction));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI36OnboardingHeroWithLinkViewController_underLinkButtonContentView);
}

@end