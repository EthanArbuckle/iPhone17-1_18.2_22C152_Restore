@interface OnboardingLocationPrivacyViewController
- (_TtC20ProductPageExtension39OnboardingLocationPrivacyViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC20ProductPageExtension39OnboardingLocationPrivacyViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
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
  sub_100284DA4();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1002852C0();
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
  v2 = *(void (**)(void))&self->OBWelcomeController_opaque[OBJC_IVAR____TtC20ProductPageExtension39OnboardingLocationPrivacyViewController_continueCallback];
  id v3 = self;
  v2();
}

- (void)didTapManage
{
  v2 = *(void (**)(void))&self->OBWelcomeController_opaque[OBJC_IVAR____TtC20ProductPageExtension39OnboardingLocationPrivacyViewController_manageCallback];
  id v3 = self;
  v2();
}

- (_TtC20ProductPageExtension39OnboardingLocationPrivacyViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC20ProductPageExtension39OnboardingLocationPrivacyViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC20ProductPageExtension39OnboardingLocationPrivacyViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC20ProductPageExtension39OnboardingLocationPrivacyViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  id v3 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC20ProductPageExtension39OnboardingLocationPrivacyViewController_iconView];
}

@end