@interface ElectrocardiogramOnboardingSessionSimulationHeroView
- (_TtC5Heart52ElectrocardiogramOnboardingSessionSimulationHeroView)initWithFrame:(CGRect)a3;
- (_TtC5Heart52ElectrocardiogramOnboardingSessionSimulationHeroView)initWithFrame:(CGRect)a3 isLargeDevice:(BOOL)a4;
@end

@implementation ElectrocardiogramOnboardingSessionSimulationHeroView

- (_TtC5Heart52ElectrocardiogramOnboardingSessionSimulationHeroView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ElectrocardiogramOnboardingSessionSimulationHeroView();
  v3 = -[HRElectrocardiogramSessionSimulationView initWithFrame:isLargeDevice:](&v5, sel_initWithFrame_isLargeDevice_, 0, 0.0, 0.0, 161.0, 197.0);
  [(HRElectrocardiogramSessionSimulationView *)v3 setTimeRemaining:11.0];
  return v3;
}

- (_TtC5Heart52ElectrocardiogramOnboardingSessionSimulationHeroView)initWithFrame:(CGRect)a3 isLargeDevice:(BOOL)a4
{
  result = (_TtC5Heart52ElectrocardiogramOnboardingSessionSimulationHeroView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end