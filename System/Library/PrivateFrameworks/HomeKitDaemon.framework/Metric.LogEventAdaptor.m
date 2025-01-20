@interface Metric.LogEventAdaptor
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (_TtCO13HomeKitDaemon6Metric15LogEventAdaptor)initWithHomeUUID:(id)a3;
- (_TtCO13HomeKitDaemon6Metric15LogEventAdaptor)initWithStartTime:(double)a3 homeUUID:(id)a4;
- (unint64_t)coreAnalyticsEventOptions;
- (void)setCoreAnalyticsEventOptions:(unint64_t)a3;
@end

@implementation Metric.LogEventAdaptor

- (unint64_t)coreAnalyticsEventOptions
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtCO13HomeKitDaemon6Metric15LogEventAdaptor_coreAnalyticsEventOptions);
}

- (void)setCoreAnalyticsEventOptions:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCO13HomeKitDaemon6Metric15LogEventAdaptor_coreAnalyticsEventOptions) = (Class)a3;
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
  v3 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCO13HomeKitDaemon6Metric15LogEventAdaptor_event);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  uint64_t v8 = v6(v4, v5);
  sub_22F6A0754(v8, (void (*)(uint64_t, uint64_t, unsigned char *))sub_22F60EC84);

  swift_bridgeObjectRelease();
  sub_22F54F4F8(0, (unint64_t *)&qword_2686D6CF0);
  v9 = (void *)sub_2302DDAE0();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v9;
}

- (_TtCO13HomeKitDaemon6Metric15LogEventAdaptor)initWithHomeUUID:(id)a3
{
  uint64_t v3 = sub_2302DD2B0();
  MEMORY[0x270FA5388](v3 - 8);
  sub_2302DD270();
  result = (_TtCO13HomeKitDaemon6Metric15LogEventAdaptor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtCO13HomeKitDaemon6Metric15LogEventAdaptor)initWithStartTime:(double)a3 homeUUID:(id)a4
{
  uint64_t v4 = sub_2302DD2B0();
  MEMORY[0x270FA5388](v4 - 8);
  sub_2302DD270();
  result = (_TtCO13HomeKitDaemon6Metric15LogEventAdaptor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtCO13HomeKitDaemon6Metric15LogEventAdaptor_event;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end