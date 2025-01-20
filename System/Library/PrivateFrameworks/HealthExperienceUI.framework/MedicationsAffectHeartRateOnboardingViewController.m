@interface MedicationsAffectHeartRateOnboardingViewController
- (void)hxui_primaryFooterButtonTapped;
- (void)viewDidLoad;
@end

@implementation MedicationsAffectHeartRateOnboardingViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD281164();
}

- (void)hxui_primaryFooterButtonTapped
{
  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI50MedicationsAffectHeartRateOnboardingViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x1B3E68580](v3))
  {
    uint64_t v4 = *((void *)v3 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v7 = self;
    v6(ObjectType, v4);

    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI50MedicationsAffectHeartRateOnboardingViewController_healthStore));
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI50MedicationsAffectHeartRateOnboardingViewController_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI50MedicationsAffectHeartRateOnboardingViewController_primaryButtonTintColorOverride));
  sub_1AD24D3D8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI50MedicationsAffectHeartRateOnboardingViewController_delegate);
  swift_bridgeObjectRelease();
}

@end