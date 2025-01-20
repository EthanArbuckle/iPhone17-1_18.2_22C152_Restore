@interface WalkingSteadinessOnboardingCoordinator
- (_TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator)init;
- (void)presentationControllerWillDismiss:(id)a3;
@end

@implementation WalkingSteadinessOnboardingCoordinator

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E0AD2E64();
}

- (_TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator)init
{
  result = (_TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1E0ACD748((uint64_t)self + OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_rootViewController);
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_analyticsManager);
}

@end