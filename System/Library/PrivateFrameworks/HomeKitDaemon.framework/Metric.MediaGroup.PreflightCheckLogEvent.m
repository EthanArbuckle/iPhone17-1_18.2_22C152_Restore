@interface Metric.MediaGroup.PreflightCheckLogEvent
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (_TtCOO13HomeKitDaemon6Metric10MediaGroup22PreflightCheckLogEvent)initWithHomeUUID:(id)a3;
- (_TtCOO13HomeKitDaemon6Metric10MediaGroup22PreflightCheckLogEvent)initWithStartTime:(double)a3 homeUUID:(id)a4;
- (unint64_t)coreAnalyticsEventOptions;
- (void)setCoreAnalyticsEventOptions:(unint64_t)a3;
@end

@implementation Metric.MediaGroup.PreflightCheckLogEvent

- (unint64_t)coreAnalyticsEventOptions
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtCOO13HomeKitDaemon6Metric10MediaGroup22PreflightCheckLogEvent_coreAnalyticsEventOptions);
}

- (void)setCoreAnalyticsEventOptions:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCOO13HomeKitDaemon6Metric10MediaGroup22PreflightCheckLogEvent_coreAnalyticsEventOptions) = (Class)a3;
}

- (NSString)coreAnalyticsEventName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2302DDB90();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v2 = self;
  sub_22F668C38();

  sub_22F5357F8();
  v3 = (void *)sub_2302DDAE0();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (_TtCOO13HomeKitDaemon6Metric10MediaGroup22PreflightCheckLogEvent)initWithHomeUUID:(id)a3
{
  uint64_t v3 = sub_2302DD2B0();
  MEMORY[0x270FA5388](v3 - 8);
  sub_2302DD270();
  result = (_TtCOO13HomeKitDaemon6Metric10MediaGroup22PreflightCheckLogEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtCOO13HomeKitDaemon6Metric10MediaGroup22PreflightCheckLogEvent)initWithStartTime:(double)a3 homeUUID:(id)a4
{
  uint64_t v4 = sub_2302DD2B0();
  MEMORY[0x270FA5388](v4 - 8);
  sub_2302DD270();
  result = (_TtCOO13HomeKitDaemon6Metric10MediaGroup22PreflightCheckLogEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end