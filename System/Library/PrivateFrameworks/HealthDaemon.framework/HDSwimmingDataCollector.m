@interface HDSwimmingDataCollector
- (Class)sensorDatumClassForAggregator:(id)a3;
- (_TtC12HealthDaemon23HDSwimmingDataCollector)init;
- (id)identifierForDataAggregator:(id)a3;
- (id)sourceForDataAggregator:(id)a3;
- (void)historicalSwimmingDataDidUpdate:(id)a3 reference:(id)a4;
@end

@implementation HDSwimmingDataCollector

- (void)historicalSwimmingDataDidUpdate:(id)a3 reference:(id)a4
{
  type metadata accessor for HDCMSwimData();
  unint64_t v6 = sub_1BD2E47E0();
  id v7 = a4;
  v8 = self;
  sub_1BCBD7D14(v6, v7);

  swift_bridgeObjectRelease();
}

- (Class)sensorDatumClassForAggregator:(id)a3
{
  sub_1BCBD9D2C(0, (unint64_t *)&unk_1E9FBDE50);

  return (Class)swift_getObjCClassFromMetadata();
}

- (id)sourceForDataAggregator:(id)a3
{
  id v3 = objc_msgSend(self, sel__localDeviceSource);

  return v3;
}

- (id)identifierForDataAggregator:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BCBD99C0();

  unint64_t v6 = (void *)sub_1BD2E4760();
  swift_bridgeObjectRelease();

  return v6;
}

- (_TtC12HealthDaemon23HDSwimmingDataCollector)init
{
  result = (_TtC12HealthDaemon23HDSwimmingDataCollector *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
}

@end