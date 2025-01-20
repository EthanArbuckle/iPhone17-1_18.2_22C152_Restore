@interface AuthenticationWithOnboardingViewController
- (CGSize)preferredContentSize;
- (_TtC12GameCenterUI42AuthenticationWithOnboardingViewController)initWithCoder:(id)a3;
- (_TtC12GameCenterUI42AuthenticationWithOnboardingViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC12GameCenterUI42AuthenticationWithOnboardingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC12GameCenterUI42AuthenticationWithOnboardingViewController)initWithRootViewController:(id)a3;
- (void)onboardingFlowFinishedWithAction:(unint64_t)a3;
- (void)setPreferredContentSize:(CGSize)a3;
@end

@implementation AuthenticationWithOnboardingViewController

- (CGSize)preferredContentSize
{
  v2 = self;
  sub_1AF3F00AC();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = self;
  sub_1AF3F01B8(width, height);
}

- (_TtC12GameCenterUI42AuthenticationWithOnboardingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF3F0284();
}

- (_TtC12GameCenterUI42AuthenticationWithOnboardingViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
}

- (_TtC12GameCenterUI42AuthenticationWithOnboardingViewController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  sub_1AF3F1184();
}

- (_TtC12GameCenterUI42AuthenticationWithOnboardingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1AF7AE0E0();
  }
  id v5 = a4;
  sub_1AF3F11C8();
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)onboardingFlowFinishedWithAction:(unint64_t)a3
{
  double v4 = self;
  sub_1AF3F1294(a3);
}

@end