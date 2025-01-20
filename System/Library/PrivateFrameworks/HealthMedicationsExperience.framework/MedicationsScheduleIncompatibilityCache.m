@interface MedicationsScheduleIncompatibilityCache
- (_TtC27HealthMedicationsExperience39MedicationsScheduleIncompatibilityCache)init;
- (void)scheduleControl:(id)a3 didAddOrModifySchedules:(id)a4;
@end

@implementation MedicationsScheduleIncompatibilityCache

- (_TtC27HealthMedicationsExperience39MedicationsScheduleIncompatibilityCache)init
{
  result = (_TtC27HealthMedicationsExperience39MedicationsScheduleIncompatibilityCache *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMedicationsExperience39MedicationsScheduleIncompatibilityCache_keyValueDomain));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMedicationsExperience39MedicationsScheduleIncompatibilityCache_healthStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMedicationsExperience39MedicationsScheduleIncompatibilityCache_scheduleControl));
  sub_1C2B19064(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC27HealthMedicationsExperience39MedicationsScheduleIncompatibilityCache_unitTestingCacheUpdateHandler));
  v3 = (char *)self
     + OBJC_IVAR____TtC27HealthMedicationsExperience39MedicationsScheduleIncompatibilityCache__incompatibilityCacheObject;
  sub_1C2B3382C();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (void)scheduleControl:(id)a3 didAddOrModifySchedules:(id)a4
{
  id v5 = a3;
  v6 = self;
  _s27HealthMedicationsExperience0B28ScheduleIncompatibilityCacheC15scheduleControl_14didAddOrModifyySo012HKMedicationdH0C_SaySo0mD0CGtF_0();
}

@end