@interface GKWelcomeOnboardingViewController
- (GKWelcomeOnboardingViewController)initWithCoder:(id)a3;
- (GKWelcomeOnboardingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation GKWelcomeOnboardingViewController

- (void)viewDidLoad
{
  v2 = self;
  WelcomeOnboardingViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  WelcomeOnboardingViewController.viewDidAppear(_:)(a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4 = self;
  WelcomeOnboardingViewController.viewIsAppearing(_:)(a3);
}

- (GKWelcomeOnboardingViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (GKWelcomeOnboardingViewController *)WelcomeOnboardingViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (GKWelcomeOnboardingViewController)initWithCoder:(id)a3
{
  return (GKWelcomeOnboardingViewController *)WelcomeOnboardingViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1AF5C90B0(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR___GKWelcomeOnboardingViewController____lazy_storage___privacyLinkController));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___GKWelcomeOnboardingViewController____lazy_storage___welcomeOnboardingView);
}

@end