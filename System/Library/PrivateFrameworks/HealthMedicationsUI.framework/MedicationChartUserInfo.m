@interface MedicationChartUserInfo
- (_TtC19HealthMedicationsUI23MedicationChartUserInfo)init;
@end

@implementation MedicationChartUserInfo

- (_TtC19HealthMedicationsUI23MedicationChartUserInfo)init
{
  result = (_TtC19HealthMedicationsUI23MedicationChartUserInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI23MedicationChartUserInfo_statisticsInterval;
  uint64_t v4 = sub_1C21476D0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI23MedicationChartUserInfo_medication);
}

@end