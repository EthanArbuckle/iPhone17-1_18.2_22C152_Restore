@interface HearingLevelClassificationDateRangeDataSourceDelegate
- (_TtC8HealthUIP33_092EC19E3FD96CFEDE476DA46BB43D0653HearingLevelClassificationDateRangeDataSourceDelegate)init;
- (id)dataForDateRange:(id)a3 timeScope:(int64_t)a4;
@end

@implementation HearingLevelClassificationDateRangeDataSourceDelegate

- (id)dataForDateRange:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_1E0E689D4(v6, (void *)a4);

  sub_1E0DFAB14();
  v8 = (void *)sub_1E0ECD320();
  swift_bridgeObjectRelease();
  return v8;
}

- (_TtC8HealthUIP33_092EC19E3FD96CFEDE476DA46BB43D0653HearingLevelClassificationDateRangeDataSourceDelegate)init
{
  result = (_TtC8HealthUIP33_092EC19E3FD96CFEDE476DA46BB43D0653HearingLevelClassificationDateRangeDataSourceDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUIP33_092EC19E3FD96CFEDE476DA46BB43D0653HearingLevelClassificationDateRangeDataSourceDelegate_applicationItems));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8HealthUIP33_092EC19E3FD96CFEDE476DA46BB43D0653HearingLevelClassificationDateRangeDataSourceDelegate_dBHL);
}

@end