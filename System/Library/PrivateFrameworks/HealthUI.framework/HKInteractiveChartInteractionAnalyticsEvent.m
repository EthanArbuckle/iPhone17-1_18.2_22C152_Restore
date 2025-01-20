@interface HKInteractiveChartInteractionAnalyticsEvent
- (BOOL)isEventSubmissionIHAGated;
- (NSString)eventName;
- (_TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent)init;
- (_TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent)initWithShowMoreDataForDataType:(id)a3;
- (_TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent)initWithShowMoreDataForDisplayType:(id)a3;
- (id)initFor:(id)a3 timeScopeSelected:(int64_t)a4;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation HKInteractiveChartInteractionAnalyticsEvent

- (id)initFor:(id)a3 timeScopeSelected:(int64_t)a4
{
  id v5 = a3;
  id v6 = sub_1E0E7B450(v5, a4);

  return v6;
}

- (_TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent)initWithShowMoreDataForDisplayType:(id)a3
{
  id v3 = a3;
  v4 = (_TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent *)sub_1E0E7B358(v3);

  return v4;
}

- (_TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent)initWithShowMoreDataForDataType:(id)a3
{
  id v3 = a3;
  v4 = (_TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent *)sub_1E0E7B610(v3);

  return v4;
}

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (NSString)eventName
{
  v2 = (void *)sub_1E0ECD190();
  return (NSString *)v2;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  sub_1E0E3F50C(MEMORY[0x1E4FBC860]);
  v4 = (void *)sub_1E0ECCFC0();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = self;
  sub_1E0E7B824();

  v7 = (void *)sub_1E0ECCFC0();
  swift_bridgeObjectRelease();
  return v7;
}

- (_TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent)init
{
  result = (_TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end