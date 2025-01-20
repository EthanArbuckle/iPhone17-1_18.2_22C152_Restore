@interface RelevanceEngineMetricsBlockRecorder
- (BOOL)ignoreValidMetricCheck;
- (_TtC18HealthPlatformCore35RelevanceEngineMetricsBlockRecorder)init;
- (void)recordTrainingMetrics:(id)a3 forInteraction:(id)a4;
@end

@implementation RelevanceEngineMetricsBlockRecorder

- (_TtC18HealthPlatformCore35RelevanceEngineMetricsBlockRecorder)init
{
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC18HealthPlatformCore35RelevanceEngineMetricsBlockRecorder_callback);
  v4 = (objc_class *)type metadata accessor for RelevanceEngineMetricsBlockRecorder();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(RelevanceEngineMetricsBlockRecorder *)&v6 init];
}

- (void)recordTrainingMetrics:(id)a3 forInteraction:(id)a4
{
  sub_1C1E5B67C();
  uint64_t v5 = sub_1C1EAEC38();
  uint64_t v6 = sub_1C1EAED38();
  uint64_t v8 = v7;
  v9 = self;
  sub_1C1E5B2D4(v5, v6, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)ignoreValidMetricCheck
{
  return 1;
}

- (void).cxx_destruct
{
  sub_1C1E16DFC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18HealthPlatformCore35RelevanceEngineMetricsBlockRecorder_callback));
}

@end