@interface HKMCPregnancyDatesFactory
+ (BOOL)isPregnancyDurationPhysiologicallyPossibleForPregnancyStartDate:(id)a3;
+ (BOOL)isPregnancyDurationPhysiologicallyPossibleForPregnancyStartDate:(id)a3 pregnancyEndDate:(id)a4;
+ (id)calculatePhysiologicalWashoutFromPregnancySample:(id)a3;
+ (id)calculatePregnancyStartForEstimatedDueDate:(id)a3;
+ (id)gestationalAgeCompactStringOnDate:(id)a3 pregnancySample:(id)a4;
+ (id)gestationalAgeCompactStringOnDate:(id)a3 pregnancyStartDate:(id)a4 startTimeZoneName:(id)a5;
+ (id)gestationalAgeInComponentsOnDate:(id)a3 pregnancyStartDate:(id)a4 startTimeZoneName:(id)a5;
+ (id)gestationalAgeStringOnDate:(id)a3 pregnancySample:(id)a4;
+ (id)gestationalAgeStringOnDate:(id)a3 pregnancyStartDate:(id)a4 startTimeZoneName:(id)a5;
+ (int64_t)estimatedDueDateNumberOfDays;
+ (int64_t)maximumNumberOfWeeksPregnant;
+ (int64_t)recentPregnancyEndThresholdInDays;
+ (int64_t)recentPregnancyStartThresholdInDays;
- (HKMCPregnancyDatesFactory)init;
- (HKMCPregnancyDatesFactory)initWithPregnancySample:(id)a3 state:(int64_t)a4;
@end

@implementation HKMCPregnancyDatesFactory

+ (int64_t)recentPregnancyEndThresholdInDays
{
  return 28;
}

+ (int64_t)recentPregnancyStartThresholdInDays
{
  return 21;
}

- (HKMCPregnancyDatesFactory)initWithPregnancySample:(id)a3 state:(int64_t)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HKMCPregnancyDatesFactory_pregnancySample) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HKMCPregnancyDatesFactory_state) = (Class)a4;
  v6.receiver = self;
  v6.super_class = (Class)HKMCPregnancyDatesFactory;
  id v4 = a3;
  return [(HKMCPregnancyDatesFactory *)&v6 init];
}

+ (id)calculatePregnancyStartForEstimatedDueDate:(id)a3
{
  uint64_t v3 = sub_19C2D98F8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  v9 = (char *)&v13 - v8;
  sub_19C2D98B8();
  sub_19C2D9858();
  v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v7, v3);
  v11 = (void *)sub_19C2D9868();
  v10(v9, v3);

  return v11;
}

+ (int64_t)estimatedDueDateNumberOfDays
{
  return 280;
}

+ (id)gestationalAgeStringOnDate:(id)a3 pregnancySample:(id)a4
{
  return sub_19C29C1FC((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_gestationalAgeStringOnDate_pregnancyStartDate_startTimeZoneName_);
}

+ (id)gestationalAgeStringOnDate:(id)a3 pregnancyStartDate:(id)a4 startTimeZoneName:(id)a5
{
  return sub_19C29C398((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(char *, char *, uint64_t, uint64_t))_sSo25HKMCPregnancyDatesFactoryC9HealthKitE20gestationalAgeString2on14pregnancyStart17startTimeZoneNameSS10Foundation4DateV_AJSStFZ_0);
}

+ (id)gestationalAgeCompactStringOnDate:(id)a3 pregnancySample:(id)a4
{
  return sub_19C29C1FC((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_gestationalAgeCompactStringOnDate_pregnancyStartDate_startTimeZoneName_);
}

+ (id)gestationalAgeCompactStringOnDate:(id)a3 pregnancyStartDate:(id)a4 startTimeZoneName:(id)a5
{
  return sub_19C29C398((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(char *, char *, uint64_t, uint64_t))_sSo25HKMCPregnancyDatesFactoryC9HealthKitE27gestationalAgeCompactString2on14pregnancyStart17startTimeZoneNameSS10Foundation4DateV_AJSStFZ_0);
}

+ (id)gestationalAgeInComponentsOnDate:(id)a3 pregnancyStartDate:(id)a4 startTimeZoneName:(id)a5
{
  uint64_t v30 = sub_19C2D98F8();
  uint64_t v5 = *(void *)(v30 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v30);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  v10 = (char *)&v29 - v9;
  sub_19C2A183C(0, (unint64_t *)&qword_1E93FB098, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
  uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  v16 = (char *)&v29 - v15;
  sub_19C2D98B8();
  sub_19C2D98B8();
  uint64_t v17 = sub_19C2D9ED8();
  unint64_t v19 = v18;
  type metadata accessor for HKMCPregnancyDatesFactory();
  static HKMCPregnancyDatesFactory.calculateGestationalAgeComponentsForDisplay(fromPregnancyStart:startTimeZoneName:end:)(v17, v19, (uint64_t)v10, (uint64_t)v14);
  uint64_t v20 = sub_19C2D9598();
  uint64_t v21 = *(void *)(v20 - 8);
  v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
  if (v22(v14, 1, v20) == 1)
  {
    sub_19C29E7B4((uint64_t)v14, (unint64_t *)&qword_1E93FB098, MEMORY[0x1E4F26F90]);
    uint64_t v23 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v16, v14, v20);
    uint64_t v23 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56))(v16, v23, 1, v20);
  swift_bridgeObjectRelease();
  v24 = *(void (**)(char *, uint64_t))(v5 + 8);
  v25 = v8;
  uint64_t v26 = v30;
  v24(v25, v30);
  v24(v10, v26);
  if (v22(v16, 1, v20) == 1)
  {
    v27 = 0;
  }
  else
  {
    v27 = (void *)sub_19C2D9518();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v16, v20);
  }

  return v27;
}

+ (int64_t)maximumNumberOfWeeksPregnant
{
  return 44;
}

+ (BOOL)isPregnancyDurationPhysiologicallyPossibleForPregnancyStartDate:(id)a3
{
  uint64_t v3 = sub_19C2D98F8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v13 - v8;
  sub_19C2D98B8();
  sub_19C2D98E8();
  BOOL v10 = _sSo25HKMCPregnancyDatesFactoryC9HealthKitE42isPregnancyDurationPhysiologicallyPossible3for16pregnancyEndDateSb10Foundation0N0V_AItFZ_0((uint64_t)v9, (uint64_t)v7);
  uint64_t v11 = *(void (**)(char *, uint64_t))(v4 + 8);
  v11(v7, v3);
  v11(v9, v3);
  return v10;
}

+ (BOOL)isPregnancyDurationPhysiologicallyPossibleForPregnancyStartDate:(id)a3 pregnancyEndDate:(id)a4
{
  uint64_t v4 = sub_19C2D98F8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  BOOL v10 = (char *)&v14 - v9;
  sub_19C2D98B8();
  sub_19C2D98B8();
  BOOL v11 = _sSo25HKMCPregnancyDatesFactoryC9HealthKitE42isPregnancyDurationPhysiologicallyPossible3for16pregnancyEndDateSb10Foundation0N0V_AItFZ_0((uint64_t)v10, (uint64_t)v8);
  uint64_t v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  v12(v10, v4);
  return v11;
}

+ (id)calculatePhysiologicalWashoutFromPregnancySample:(id)a3
{
  sub_19C2A183C(0, (unint64_t *)&qword_1EB30F9D0, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v12 - v5;
  id v7 = a3;
  static HKMCPregnancyDatesFactory.calculatePhysiologicalWashout(for:)(v7, (uint64_t)v6);

  uint64_t v8 = sub_19C2D98F8();
  uint64_t v9 = *(void *)(v8 - 8);
  BOOL v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    BOOL v10 = (void *)sub_19C2D9868();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }

  return v10;
}

- (HKMCPregnancyDatesFactory)init
{
  result = (HKMCPregnancyDatesFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end