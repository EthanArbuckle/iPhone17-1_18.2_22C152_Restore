@interface MedicationDoseDaySummaryProvider
- (NSString)debugDescription;
- (_TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider)init;
- (void)dealloc;
- (void)scheduleControlDidRescheduleItems;
@end

@implementation MedicationDoseDaySummaryProvider

- (void)dealloc
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider_observerQuery);
  if (v3)
  {
    v4 = *(Class *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider_healthStore);
    v5 = self;
    objc_msgSend(v4, sel_stopQuery_, v3);
  }
  else
  {
    v6 = self;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MedicationDoseDaySummaryProvider();
  [(MedicationDoseDaySummaryProvider *)&v7 dealloc];
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider__daySummary;
  sub_1C2B193B4(0, &qword_1EBF10B38, MEMORY[0x1E4F1AC70]);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider_healthStore));
  v5 = (char *)self + OBJC_IVAR____TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider_date;
  uint64_t v6 = sub_1C2B73710();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider_scheduleControl));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider_observerQuery));
  objc_super v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider_doseEventPredicate);
}

- (NSString)debugDescription
{
  swift_getObjectType();
  uint64_t v3 = self;
  sub_1C2B74CD0();
  sub_1C2B740A0();
  swift_bridgeObjectRelease();
  sub_1C2B740A0();
  sub_1C2B74970();

  uint64_t v4 = (void *)sub_1C2B73F60();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider)init
{
  result = (_TtC27HealthMedicationsExperience32MedicationDoseDaySummaryProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)scheduleControlDidRescheduleItems
{
  uint64_t v3 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCFE8];
  sub_1C2B19308(0, (unint64_t *)&unk_1EBF11290, MEMORY[0x1E4FBCFE8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v10 - v5;
  uint64_t v7 = sub_1C2B74310();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = self;
  v9 = self;
  sub_1C2B12364((uint64_t)v6, (uint64_t)&unk_1EA32BDD0, (uint64_t)v8);
  swift_release();
  sub_1C2B18F74((uint64_t)v6, (unint64_t *)&unk_1EBF11290, v3);
}

@end