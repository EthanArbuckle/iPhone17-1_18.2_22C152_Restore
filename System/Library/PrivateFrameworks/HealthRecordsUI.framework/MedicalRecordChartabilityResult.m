@interface MedicalRecordChartabilityResult
- (BOOL)shouldProduceAtLeastOneOverlay;
- (NSArray)seriesDataSources;
- (NSDate)latestChartableDate;
- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)masterDataSource;
- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)noRangeDataSource;
- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)outOfRangeDataSource;
- (_TtC15HealthRecordsUI31MedicalRecordChartabilityResult)init;
- (_TtP15HealthRecordsUI31MedicalRecordChartConfiguration_)configuration;
@end

@implementation MedicalRecordChartabilityResult

- (_TtP15HealthRecordsUI31MedicalRecordChartConfiguration_)configuration
{
  v2 = (void *)swift_unknownObjectRetain();
  return (_TtP15HealthRecordsUI31MedicalRecordChartConfiguration_ *)v2;
}

- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)masterDataSource
{
  return (_TtC15HealthRecordsUI28MedicalRecordChartDataSource *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC15HealthRecordsUI31MedicalRecordChartabilityResult_masterDataSource);
}

- (NSArray)seriesDataSources
{
  type metadata accessor for MedicalRecordChartDataSource();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1C254F700();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)outOfRangeDataSource
{
  return (_TtC15HealthRecordsUI28MedicalRecordChartDataSource *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC15HealthRecordsUI31MedicalRecordChartabilityResult_outOfRangeDataSource);
}

- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)noRangeDataSource
{
  return (_TtC15HealthRecordsUI28MedicalRecordChartDataSource *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC15HealthRecordsUI31MedicalRecordChartabilityResult_noRangeDataSource);
}

- (NSDate)latestChartableDate
{
  sub_1C2298A7C(0, (unint64_t *)&qword_1EBB6F550, 255, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v10 - v4;
  sub_1C21EA654((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI31MedicalRecordChartabilityResult_latestChartableDate, (uint64_t)&v10 - v4);
  uint64_t v6 = sub_1C254CAD0();
  uint64_t v7 = *(void *)(v6 - 8);
  v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    v8 = (void *)sub_1C254CA50();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  return (NSDate *)v8;
}

- (BOOL)shouldProduceAtLeastOneOverlay
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI31MedicalRecordChartabilityResult_outOfRangeDataSource)
    || *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI31MedicalRecordChartabilityResult_noRangeDataSource))
  {
    return 1;
  }
  unint64_t v3 = *(unint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15HealthRecordsUI31MedicalRecordChartabilityResult_seriesDataSources);
  if (v3 >> 62)
  {
    v5 = self;
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1C2550620();

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  return v4 > 1;
}

- (_TtC15HealthRecordsUI31MedicalRecordChartabilityResult)init
{
  result = (_TtC15HealthRecordsUI31MedicalRecordChartabilityResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI31MedicalRecordChartabilityResult_masterDataSource));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI31MedicalRecordChartabilityResult_outOfRangeDataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI31MedicalRecordChartabilityResult_noRangeDataSource));
  unint64_t v3 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI31MedicalRecordChartabilityResult_latestChartableDate;
  sub_1C22178C0((uint64_t)v3);
}

@end