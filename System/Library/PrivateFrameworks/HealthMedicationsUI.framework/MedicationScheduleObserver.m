@interface MedicationScheduleObserver
- (_TtC19HealthMedicationsUI26MedicationScheduleObserver)init;
- (void)dealloc;
- (void)scheduleControlDidRescheduleItems;
@end

@implementation MedicationScheduleObserver

- (void)dealloc
{
  v2 = self;
  MedicationScheduleObserver.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationScheduleObserver_scheduleControl));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationScheduleObserver_healthStore));
  sub_1C1F40148((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationScheduleObserver_dateInterval, (unint64_t *)&unk_1EBF0B1B0, MEMORY[0x1E4F26E60]);
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationScheduleObserver__scheduleItems;
  sub_1C1F3F578(0, (unint64_t *)&unk_1EA2C33C0, (uint64_t (*)(uint64_t))sub_1C1F3F800, MEMORY[0x1E4F1AC70]);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)scheduleControlDidRescheduleItems
{
  v2 = self;
  sub_1C1F3D39C();
}

- (_TtC19HealthMedicationsUI26MedicationScheduleObserver)init
{
  result = (_TtC19HealthMedicationsUI26MedicationScheduleObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end