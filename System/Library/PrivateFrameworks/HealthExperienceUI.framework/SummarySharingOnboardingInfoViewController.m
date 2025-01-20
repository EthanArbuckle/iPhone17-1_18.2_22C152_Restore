@interface SummarySharingOnboardingInfoViewController
- (void)cancelButtonTapped:(id)a3;
- (void)nextButtonTapped:(id)a3;
- (void)viewDidLoad;
@end

@implementation SummarySharingOnboardingInfoViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD531904();
}

- (void)nextButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  sub_1AD531C28();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)cancelButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  if (*(Class *)((char *)&v4->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI42SummarySharingOnboardingInfoViewController_selectionFlowContext))
  {
    memset(v5, 0, 24);
    v5[3] = 12;
    char v6 = 0;
    swift_retain();
    sub_1AD26D924(v4, (uint64_t)v5);

    swift_release();
  }
  else
  {
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUI42SummarySharingOnboardingInfoViewController_healthExperienceStore);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI42SummarySharingOnboardingInfoViewController_healthStore);
}

@end