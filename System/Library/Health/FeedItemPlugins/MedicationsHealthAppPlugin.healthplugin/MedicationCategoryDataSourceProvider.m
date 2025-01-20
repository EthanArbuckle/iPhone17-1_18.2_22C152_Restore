@interface MedicationCategoryDataSourceProvider
- (_TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider)init;
- (void)dayChanged;
- (void)timeZoneChanged;
@end

@implementation MedicationCategoryDataSourceProvider

- (void)timeZoneChanged
{
  v2 = self;
  sub_24107AFE4();
}

- (void)dayChanged
{
  v2 = self;
  sub_24107B690();
}

- (_TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider)init
{
  result = (_TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider_healthStore));
  sub_24101F178((uint64_t)self+ OBJC_IVAR____TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider_pinnedContentManager);
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider_scheduleControlObserver));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider_scheduleControlAddModifyObserver));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider_scheduleControl));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider__currentDate;
  v4 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263EFDE58];
  sub_24107FBD8(0, &qword_26B006EB8, MEMORY[0x263F07490], MEMORY[0x263EFDE58]);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v3, v5);
  v6 = (char *)self
     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider__currentDayDoseEvents;
  sub_24107FBD8(0, &qword_26B006EC0, (uint64_t (*)(uint64_t))sub_24103BA3C, v4);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self
     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider__currentDayScheduleItems;
  sub_24107FBD8(0, &qword_26B006EC8, (uint64_t (*)(uint64_t))sub_24103B990, v4);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self
      + OBJC_IVAR____TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider__onboardingCompleted;
  sub_24107E184();
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);

  swift_release();
}

@end