@interface OnboardingCollectionViewControllerWithNextButton
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation OnboardingCollectionViewControllerWithNextButton

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD66E430();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1AD66EB2C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI48OnboardingCollectionViewControllerWithNextButton_collectionViewController_));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI48OnboardingCollectionViewControllerWithNextButton_contentViewHeightConstraint));
  swift_release();
}

@end