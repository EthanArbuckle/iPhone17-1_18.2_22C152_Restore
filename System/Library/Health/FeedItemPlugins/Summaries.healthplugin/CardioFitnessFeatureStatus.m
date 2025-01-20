@interface CardioFitnessFeatureStatus
- (_TtC9Summaries26CardioFitnessFeatureStatus)init;
- (void)featureStatusManager:(id)a3 didUpdateOnboardingStatus:(id)a4;
@end

@implementation CardioFitnessFeatureStatus

- (_TtC9Summaries26CardioFitnessFeatureStatus)init
{
  result = (_TtC9Summaries26CardioFitnessFeatureStatus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9Summaries26CardioFitnessFeatureStatus__status;
  sub_241AC4B68(0, &qword_26B02EAD0, (uint64_t (*)(uint64_t))sub_241AC4B34, MEMORY[0x263EFDE58]);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9Summaries26CardioFitnessFeatureStatus_statusManager);
}

- (void)featureStatusManager:(id)a3 didUpdateOnboardingStatus:(id)a4
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v6 = a4;
  v7 = self;
  sub_241CDA650();
}

@end