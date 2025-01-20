@interface SharedMedicationsChartDataSouce
- (_TtC26MedicationsHealthAppPlugin31SharedMedicationsChartDataSouce)init;
- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4;
@end

@implementation SharedMedicationsChartDataSouce

- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4
{
  int64_t var1 = a3->var1;
  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain();
    sub_2411614D0();
    v7 = (_TtC26MedicationsHealthAppPlugin31SharedMedicationsChartDataSouce *)swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  id v8 = sub_2410EB5F4((uint64_t)v7, var1);

  sub_2410EC024((uint64_t)v10, (uint64_t (*)(void))sub_24104D3F8);

  return v8;
}

- (_TtC26MedicationsHealthAppPlugin31SharedMedicationsChartDataSouce)init
{
  result = (_TtC26MedicationsHealthAppPlugin31SharedMedicationsChartDataSouce *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2410EC024((uint64_t)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin31SharedMedicationsChartDataSouce_medication, type metadata accessor for SharedMedicationsFeedItemData);
  swift_bridgeObjectRelease();

  swift_release();
}

@end