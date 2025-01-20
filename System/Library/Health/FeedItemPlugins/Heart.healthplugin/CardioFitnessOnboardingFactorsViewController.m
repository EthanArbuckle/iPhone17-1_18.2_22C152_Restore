@interface CardioFitnessOnboardingFactorsViewController
- (_TtC5Heart44CardioFitnessOnboardingFactorsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC5Heart44CardioFitnessOnboardingFactorsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)hxui_cancelButtonTapped;
- (void)hxui_primaryFooterButtonTapped;
- (void)viewDidLoad;
@end

@implementation CardioFitnessOnboardingFactorsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_240AC4368();
}

- (void)hxui_primaryFooterButtonTapped
{
  uint64_t v3 = MEMORY[0x24560BA20]((char *)self + OBJC_IVAR____TtC5Heart44CardioFitnessOnboardingFactorsViewController_delegate, a2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = self;
    sub_240B62E80(v5, v4);

    sub_240BB50A0();
  }
}

- (void)hxui_cancelButtonTapped
{
  if (MEMORY[0x24560BA20]((char *)self + OBJC_IVAR____TtC5Heart44CardioFitnessOnboardingFactorsViewController_delegate, a2))
  {
    uint64_t v3 = self;
    sub_240AC4C38();

    sub_240BB50A0();
  }
}

- (_TtC5Heart44CardioFitnessOnboardingFactorsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC5Heart44CardioFitnessOnboardingFactorsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Heart44CardioFitnessOnboardingFactorsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC5Heart44CardioFitnessOnboardingFactorsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end