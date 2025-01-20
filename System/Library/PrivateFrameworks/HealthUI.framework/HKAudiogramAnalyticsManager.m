@interface HKAudiogramAnalyticsManager
- (HKAudiogramAnalyticsManager)init;
- (HKAudiogramAnalyticsManager)initWithHealthStore:(id)a3;
- (void)submitPerformanceAnalyticsWithMetric:(id)a3;
@end

@implementation HKAudiogramAnalyticsManager

- (HKAudiogramAnalyticsManager)initWithHealthStore:(id)a3
{
  id v3 = a3;
  v4 = (HKAudiogramAnalyticsManager *)sub_1E0E9DF40(v3);

  return v4;
}

- (void)submitPerformanceAnalyticsWithMetric:(id)a3
{
  type metadata accessor for AudiogramPerformanceAnalytics.Event();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  *(void *)(v5 + 24) = &protocol witness table for AudiogramPerformanceAnalytics.Metric;
  id v6 = a3;
  v7 = self;
  sub_1E0E9DC30(v5, (uint64_t)v7);

  swift_release();
}

- (HKAudiogramAnalyticsManager)init
{
  result = (HKAudiogramAnalyticsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___HKAudiogramAnalyticsManager_queue);
}

@end