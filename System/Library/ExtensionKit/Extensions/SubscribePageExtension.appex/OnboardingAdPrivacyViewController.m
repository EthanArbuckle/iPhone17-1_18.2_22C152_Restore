@interface OnboardingAdPrivacyViewController
- (_TtC22SubscribePageExtension33OnboardingAdPrivacyViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC22SubscribePageExtension33OnboardingAdPrivacyViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (unint64_t)supportedInterfaceOrientations;
- (void)didTapLearnMore;
- (void)didTapTurnOff;
- (void)didTapTurnOn;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation OnboardingAdPrivacyViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1003842C8();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100384B38();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(OnboardingAdPrivacyViewController *)v2 traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)didTapLearnMore
{
  v2 = self;
  NSString v3 = sub_1007675C0();
  id v4 = [self presenterForPrivacySplashWithIdentifier:v3];

  if (v4) {
    [v4 setPresentingViewController:v2];
  }
  [v4 present];
}

- (void)didTapTurnOn
{
  v2 = *(void (**)(void))&self->OBWelcomeController_opaque[OBJC_IVAR____TtC22SubscribePageExtension33OnboardingAdPrivacyViewController_buttonsCallback];
  NSString v3 = self;
  v2();
}

- (void)didTapTurnOff
{
  v2 = *(void (**)(void))&self->OBWelcomeController_opaque[OBJC_IVAR____TtC22SubscribePageExtension33OnboardingAdPrivacyViewController_buttonsCallback];
  NSString v3 = self;
  v2();
}

- (_TtC22SubscribePageExtension33OnboardingAdPrivacyViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC22SubscribePageExtension33OnboardingAdPrivacyViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension33OnboardingAdPrivacyViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC22SubscribePageExtension33OnboardingAdPrivacyViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  NSString v3 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC22SubscribePageExtension33OnboardingAdPrivacyViewController_adPrivacyHeaderIconView];
}

@end