@interface GKOnboardingProfileCreationViewController
- (GKOnboardingProfileCreationViewController)initWithCoder:(id)a3;
- (GKOnboardingProfileCreationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GKOnboardingProfileCreationViewController

- (void)loadView
{
  v2 = self;
  OnboardingProfileCreationViewController.loadView()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  OnboardingProfileCreationViewController.viewWillAppear(_:)(a3);
}

- (GKOnboardingProfileCreationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1AF7AE0E0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (GKOnboardingProfileCreationViewController *)OnboardingProfileCreationViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (GKOnboardingProfileCreationViewController)initWithCoder:(id)a3
{
  return (GKOnboardingProfileCreationViewController *)OnboardingProfileCreationViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GKOnboardingProfileCreationViewController_hostingController));
}

@end