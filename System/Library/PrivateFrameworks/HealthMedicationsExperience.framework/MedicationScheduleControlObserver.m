@interface MedicationScheduleControlObserver
- (_TtC27HealthMedicationsExperience33MedicationScheduleControlObserver)init;
- (void)scheduleControl:(id)a3 didAddOrModifySchedules:(id)a4;
- (void)scheduleControlDidRescheduleItems;
@end

@implementation MedicationScheduleControlObserver

- (void)scheduleControlDidRescheduleItems
{
  if ((*((unsigned char *)&self->super.isa
        + OBJC_IVAR____TtC27HealthMedicationsExperience33MedicationScheduleControlObserver_observerOptions) & 1) != 0)
  {
    sub_1C2B5BD70();
    sub_1C2B5BE54();
    v3 = self;
    sub_1C2B73C80();
  }
}

- (void)scheduleControl:(id)a3 didAddOrModifySchedules:(id)a4
{
  if ((*((unsigned char *)&self->super.isa
        + OBJC_IVAR____TtC27HealthMedicationsExperience33MedicationScheduleControlObserver_observerOptions) & 2) != 0)
  {
    sub_1C2B5BD70();
    sub_1C2B5BE54();
    id v6 = a3;
    v7 = self;
    sub_1C2B73C80();
  }
}

- (_TtC27HealthMedicationsExperience33MedicationScheduleControlObserver)init
{
  result = (_TtC27HealthMedicationsExperience33MedicationScheduleControlObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end