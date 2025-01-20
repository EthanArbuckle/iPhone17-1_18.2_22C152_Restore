@interface MedicalRecordChartDataSource
- (NSString)displayName;
- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)init;
- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)initWithConcept:(id)a3 dataTransformer:(id)a4 unit:(id)a5 preferredColors:(id)a6 collapseIntoRangePoints:(BOOL)a7 type:(int64_t)a8;
- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4;
- (id)chartDisplayTypeWithVerticalAxis:(id)a3;
@end

@implementation MedicalRecordChartDataSource

- (NSString)displayName
{
  sub_1C2398F9C((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI28MedicalRecordChartDataSource_chartDefining, (uint64_t)v10);
  uint64_t v3 = v11;
  if (v11)
  {
    uint64_t v4 = v12;
    __swift_project_boxed_opaque_existential_1Tm(v10, v11);
    v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v6 = self;
    v5(v3, v4);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);
  }
  else
  {
    v7 = self;
    sub_1C239986C((uint64_t)v10, (uint64_t (*)(void))sub_1C2399000);
  }
  v8 = (void *)sub_1C254F430();
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)initWithConcept:(id)a3 dataTransformer:(id)a4 unit:(id)a5 preferredColors:(id)a6 collapseIntoRangePoints:(BOOL)a7 type:(int64_t)a8
{
  id v14 = a3;
  swift_unknownObjectRetain();
  id v15 = a5;
  id v16 = a6;
  v17 = (_TtC15HealthRecordsUI28MedicalRecordChartDataSource *)sub_1C2399264(a3, (uint64_t)a4, v15, a6, a7, a8);

  swift_unknownObjectRelease();
  return v17;
}

- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4
{
  int64_t index = a3->index;
  int64_t zoom = a3->zoom;
  int64_t resolution = a3->resolution;
  if (a4)
  {
    v8 = self;
    swift_unknownObjectRetain();
    sub_1C25501E0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  id v10 = sub_1C239605C(index, zoom, resolution);

  sub_1C239986C((uint64_t)v12, (uint64_t (*)(void))sub_1C224E400);
  return v10;
}

- (id)chartDisplayTypeWithVerticalAxis:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1C2396920((uint64_t)v4);

  return v6;
}

- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)init
{
  result = (_TtC15HealthRecordsUI28MedicalRecordChartDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C239986C((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI28MedicalRecordChartDataSource_chartDefining, (uint64_t (*)(void))sub_1C2399000);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28MedicalRecordChartDataSource_unit));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28MedicalRecordChartDataSource_preferredColors));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28MedicalRecordChartDataSource_chartableXRange));
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI28MedicalRecordChartDataSource_chartableYRange);
}

@end