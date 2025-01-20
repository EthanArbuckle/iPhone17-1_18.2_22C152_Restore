@interface SummaryTabRelevanceEngineCoordinator
- (_TtC18HealthPlatformCore36SummaryTabRelevanceEngineCoordinator)init;
@end

@implementation SummaryTabRelevanceEngineCoordinator

- (_TtC18HealthPlatformCore36SummaryTabRelevanceEngineCoordinator)init
{
  result = (_TtC18HealthPlatformCore36SummaryTabRelevanceEngineCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthPlatformCore36SummaryTabRelevanceEngineCoordinator_dispatchQueue));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthPlatformCore36SummaryTabRelevanceEngineCoordinator____lazy_storage___primaryFeatures));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC18HealthPlatformCore36SummaryTabRelevanceEngineCoordinator_modelPath;
  uint64_t v4 = sub_1C1EAD258();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1C1DD5EAC((uint64_t)self + OBJC_IVAR____TtC18HealthPlatformCore36SummaryTabRelevanceEngineCoordinator_pretrainedModelURL);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthPlatformCore36SummaryTabRelevanceEngineCoordinator____lazy_storage___trainingContext));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthPlatformCore36SummaryTabRelevanceEngineCoordinator____lazy_storage___metricsRecorder));
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18HealthPlatformCore36SummaryTabRelevanceEngineCoordinator____lazy_storage___relevanceEngine);
}

@end