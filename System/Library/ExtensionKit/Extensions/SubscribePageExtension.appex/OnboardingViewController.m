@interface OnboardingViewController
- (_TtC22SubscribePageExtension24OnboardingViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension24OnboardingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation OnboardingViewController

- (_TtC22SubscribePageExtension24OnboardingViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC22SubscribePageExtension24OnboardingViewController_navController;
  id v6 = objc_allocWithZone((Class)UINavigationController);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC22SubscribePageExtension24OnboardingViewController *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1006FD95C();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1006FE134(a3);
}

- (_TtC22SubscribePageExtension24OnboardingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22SubscribePageExtension24OnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24OnboardingViewController_navController));

  swift_release();
}

@end