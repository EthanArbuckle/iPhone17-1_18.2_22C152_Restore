@interface OnboardingPageViewController
- (_TtC19CoreDynamicUIPlugin28OnboardingPageViewController)init;
- (_TtC19CoreDynamicUIPlugin28OnboardingPageViewController)initWithCoder:(id)a3;
- (_TtC19CoreDynamicUIPlugin28OnboardingPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation OnboardingPageViewController

- (_TtC19CoreDynamicUIPlugin28OnboardingPageViewController)initWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_45358();
}

- (_TtC19CoreDynamicUIPlugin28OnboardingPageViewController)init
{
}

- (_TtC19CoreDynamicUIPlugin28OnboardingPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_8F9D0();
  }
  id v5 = a4;
  sub_4612C();
}

- (void).cxx_destruct
{
  swift_release();
  sub_2ED2C((uint64_t)&self->AMSUICommonViewController_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin28OnboardingPageViewController_destination]);
  swift_unknownObjectRelease();
  v3 = *(void **)&self->AMSUICommonViewController_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin28OnboardingPageViewController_account];
}

@end