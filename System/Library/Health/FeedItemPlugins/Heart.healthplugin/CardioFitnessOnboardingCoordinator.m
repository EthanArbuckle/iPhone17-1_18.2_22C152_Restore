@interface CardioFitnessOnboardingCoordinator
- (_TtC5Heart34CardioFitnessOnboardingCoordinator)init;
- (void)presentationControllerWillDismiss:(id)a3;
@end

@implementation CardioFitnessOnboardingCoordinator

- (_TtC5Heart34CardioFitnessOnboardingCoordinator)init
{
  result = (_TtC5Heart34CardioFitnessOnboardingCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_240A484BC((uint64_t)self + OBJC_IVAR____TtC5Heart34CardioFitnessOnboardingCoordinator_rootViewController);

  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Heart34CardioFitnessOnboardingCoordinator_analyticsManager);
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_240B31FA8();
}

@end