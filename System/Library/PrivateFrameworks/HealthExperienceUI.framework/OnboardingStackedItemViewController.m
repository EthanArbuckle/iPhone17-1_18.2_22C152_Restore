@interface OnboardingStackedItemViewController
- (void)nextButtonTapped:(id)a3;
- (void)viewDidLoad;
- (void)widthDesignationDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4;
@end

@implementation OnboardingStackedItemViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD3BADE8();
}

- (void)nextButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  sub_1AD3BBA1C();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)widthDesignationDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_1AD3BC5C0();
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35OnboardingStackedItemViewController_contentViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35OnboardingStackedItemViewController_titleToItemsTopConstraint));
  swift_bridgeObjectRelease();
}

@end