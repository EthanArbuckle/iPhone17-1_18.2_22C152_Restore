@interface AFibBurdenOnboardingResultsViewController
- (_TtC5Heart41AFibBurdenOnboardingResultsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC5Heart41AFibBurdenOnboardingResultsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)dealloc;
- (void)hxui_cancelButtonTapped;
- (void)hxui_primaryFooterButtonTapped;
- (void)viewControllerDidLeaveAdaptiveModal;
- (void)viewControllerWillEnterAdaptiveModal;
- (void)viewDidLoad;
@end

@implementation AFibBurdenOnboardingResultsViewController

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Heart41AFibBurdenOnboardingResultsViewController_scrollViewObserver);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Heart41AFibBurdenOnboardingResultsViewController_scrollViewObserver) = 0;
  v3 = self;

  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for AFibBurdenOnboardingResultsViewController();
  [(AFibBurdenOnboardingResultsViewController *)&v4 dealloc];
}

- (void).cxx_destruct
{
  sub_240A484BC((uint64_t)self + OBJC_IVAR____TtC5Heart41AFibBurdenOnboardingResultsViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart41AFibBurdenOnboardingResultsViewController_continueButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart41AFibBurdenOnboardingResultsViewController_scrollViewObserver));

  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_240B47F38();
}

- (void)hxui_primaryFooterButtonTapped
{
  v3 = (char *)self + OBJC_IVAR____TtC5Heart41AFibBurdenOnboardingResultsViewController_delegate;
  if (MEMORY[0x24560BA20]((char *)self + OBJC_IVAR____TtC5Heart41AFibBurdenOnboardingResultsViewController_delegate, a2))
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
  v3 = (char *)self + OBJC_IVAR____TtC5Heart41AFibBurdenOnboardingResultsViewController_delegate;
  if (MEMORY[0x24560BA20]((char *)self + OBJC_IVAR____TtC5Heart41AFibBurdenOnboardingResultsViewController_delegate, a2))
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 16);
    v6 = self;
    v5();

    sub_240BB50A0();
  }
}

- (_TtC5Heart41AFibBurdenOnboardingResultsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC5Heart41AFibBurdenOnboardingResultsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Heart41AFibBurdenOnboardingResultsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC5Heart41AFibBurdenOnboardingResultsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)viewControllerWillEnterAdaptiveModal
{
  v2 = self;
  sub_240B499A0();
}

- (void)viewControllerDidLeaveAdaptiveModal
{
  v2 = self;
  id v3 = [(OBBaseWelcomeController *)v2 navigationItem];
  objc_msgSend(v3, sel_setRightBarButtonItem_, 0);
}

@end