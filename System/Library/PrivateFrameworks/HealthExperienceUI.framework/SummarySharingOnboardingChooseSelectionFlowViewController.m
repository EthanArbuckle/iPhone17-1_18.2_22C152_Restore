@interface SummarySharingOnboardingChooseSelectionFlowViewController
- (void)cancelButtonTapped:(id)a3;
- (void)manualFlowButtonTapped:(id)a3;
- (void)nextButtonTapped:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SummarySharingOnboardingChooseSelectionFlowViewController

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1AD5D16F0(a3);
}

- (void)nextButtonTapped:(id)a3
{
}

- (void)manualFlowButtonTapped:(id)a3
{
}

- (void)cancelButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  memset(v5, 0, 24);
  v5[3] = 12;
  char v6 = 0;
  swift_retain();
  sub_1AD26D924(self, (uint64_t)v5);

  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUI57SummarySharingOnboardingChooseSelectionFlowViewController_healthExperienceStore);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI57SummarySharingOnboardingChooseSelectionFlowViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI57SummarySharingOnboardingChooseSelectionFlowViewController_selectedContact));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI57SummarySharingOnboardingChooseSelectionFlowViewController____lazy_storage___setUpManuallyButton);
}

@end