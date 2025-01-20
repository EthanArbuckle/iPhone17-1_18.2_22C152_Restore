@interface OnboardingLocationPrivacyViewController
- (_TtC22SubscribePageExtension39OnboardingLocationPrivacyViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC22SubscribePageExtension39OnboardingLocationPrivacyViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (unint64_t)supportedInterfaceOrientations;
- (void)didTapContinue;
- (void)didTapManage;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation OnboardingLocationPrivacyViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1002C1E88();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1002C23A4();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(OnboardingLocationPrivacyViewController *)v2 traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)didTapContinue
{
  v2 = *(void (**)(void))&self->OBWelcomeController_opaque[OBJC_IVAR____TtC22SubscribePageExtension39OnboardingLocationPrivacyViewController_continueCallback];
  id v3 = self;
  v2();
}

- (void)didTapManage
{
  v2 = *(void (**)(void))&self->OBWelcomeController_opaque[OBJC_IVAR____TtC22SubscribePageExtension39OnboardingLocationPrivacyViewController_manageCallback];
  id v3 = self;
  v2();
}

- (_TtC22SubscribePageExtension39OnboardingLocationPrivacyViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC22SubscribePageExtension39OnboardingLocationPrivacyViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension39OnboardingLocationPrivacyViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC22SubscribePageExtension39OnboardingLocationPrivacyViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  id v3 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC22SubscribePageExtension39OnboardingLocationPrivacyViewController_iconView];
}

@end