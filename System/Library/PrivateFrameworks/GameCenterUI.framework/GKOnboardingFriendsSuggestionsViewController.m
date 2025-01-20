@interface GKOnboardingFriendsSuggestionsViewController
- (GKOnboardingFriendsSuggestionsViewController)initWithCoder:(id)a3;
- (GKOnboardingFriendsSuggestionsViewController)initWithGameBundleId:(id)a3;
- (GKOnboardingFriendsSuggestionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (void)loadView;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation GKOnboardingFriendsSuggestionsViewController

- (GKOnboardingFriendsSuggestionsViewController)initWithGameBundleId:(id)a3
{
  if (a3)
  {
    uint64_t v3 = sub_1AF7AE0E0();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (GKOnboardingFriendsSuggestionsViewController *)OnboardingFriendsSuggestionsViewController.init(gameBundleId:)(v3, v4);
}

- (GKOnboardingFriendsSuggestionsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF3B63A8();
}

- (void)loadView
{
  v2 = self;
  OnboardingFriendsSuggestionsViewController.loadView()();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  OnboardingFriendsSuggestionsViewController.viewWillAppear(_:)(a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  uint64_t v4 = self;
  OnboardingFriendsSuggestionsViewController.viewIsAppearing(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  OnboardingFriendsSuggestionsViewController.viewWillDisappear(_:)(a3);
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  uint64_t v4 = self;
  OnboardingFriendsSuggestionsViewController.contentScrollView(for:)(v5, a3);
  v7 = v6;

  return v7;
}

- (GKOnboardingFriendsSuggestionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1AF7AE0E0();
  }
  id v5 = a4;
  OnboardingFriendsSuggestionsViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GKOnboardingFriendsSuggestionsViewController_hostingController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GKOnboardingFriendsSuggestionsViewController_game));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GKOnboardingFriendsSuggestionsViewController_dataUpdateDelegate));
  sub_1AF3BAF18((uint64_t)self + OBJC_IVAR___GKOnboardingFriendsSuggestionsViewController____lazy_storage___metricsContext, &qword_1E9AC4558);
}

@end