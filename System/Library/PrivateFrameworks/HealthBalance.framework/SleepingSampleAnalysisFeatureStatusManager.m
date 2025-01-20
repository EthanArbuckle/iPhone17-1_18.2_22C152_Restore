@interface SleepingSampleAnalysisFeatureStatusManager
- (_TtC13HealthBalance42SleepingSampleAnalysisFeatureStatusManager)init;
- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4;
@end

@implementation SleepingSampleAnalysisFeatureStatusManager

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  swift_unknownObjectRetain();
  id v7 = a4;
  v8 = self;
  SleepingSampleAnalysisFeatureStatusManager.featureStatusProviding(_:didUpdate:)(a3);
  swift_unknownObjectRelease();
}

- (_TtC13HealthBalance42SleepingSampleAnalysisFeatureStatusManager)init
{
  result = (_TtC13HealthBalance42SleepingSampleAnalysisFeatureStatusManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13HealthBalance42SleepingSampleAnalysisFeatureStatusManager_observationQueue));
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC13HealthBalance42SleepingSampleAnalysisFeatureStatusManager___observationRegistrar;
  uint64_t v4 = sub_250E24920();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end