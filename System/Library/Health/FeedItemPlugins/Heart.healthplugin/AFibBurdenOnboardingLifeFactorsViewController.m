@interface AFibBurdenOnboardingLifeFactorsViewController
- (_TtC5Heart45AFibBurdenOnboardingLifeFactorsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC5Heart45AFibBurdenOnboardingLifeFactorsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)hxui_cancelButtonTapped;
- (void)hxui_primaryFooterButtonTapped;
- (void)viewControllerDidLeaveAdaptiveModal;
- (void)viewControllerWillEnterAdaptiveModal;
- (void)viewDidLoad;
@end

@implementation AFibBurdenOnboardingLifeFactorsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_240A9971C();
}

- (void)hxui_primaryFooterButtonTapped
{
  v3 = (char *)self + OBJC_IVAR____TtC5Heart45AFibBurdenOnboardingLifeFactorsViewController_delegate;
  if (MEMORY[0x24560BA20]((char *)self + OBJC_IVAR____TtC5Heart45AFibBurdenOnboardingLifeFactorsViewController_delegate, a2))
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 8);
    v6 = self;
    v5();

    sub_240BB50A0();
  }
}

- (void)hxui_cancelButtonTapped
{
  v3 = (char *)self + OBJC_IVAR____TtC5Heart45AFibBurdenOnboardingLifeFactorsViewController_delegate;
  if (MEMORY[0x24560BA20]((char *)self + OBJC_IVAR____TtC5Heart45AFibBurdenOnboardingLifeFactorsViewController_delegate, a2))
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 16);
    v6 = self;
    v5();

    sub_240BB50A0();
  }
}

- (_TtC5Heart45AFibBurdenOnboardingLifeFactorsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC5Heart45AFibBurdenOnboardingLifeFactorsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Heart45AFibBurdenOnboardingLifeFactorsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC5Heart45AFibBurdenOnboardingLifeFactorsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)viewControllerWillEnterAdaptiveModal
{
  v2 = self;
  sub_240A9A340();
}

- (void)viewControllerDidLeaveAdaptiveModal
{
  v2 = self;
  id v3 = [(OBBaseWelcomeController *)v2 navigationItem];
  objc_msgSend(v3, sel_setRightBarButtonItem_, 0);
}

@end