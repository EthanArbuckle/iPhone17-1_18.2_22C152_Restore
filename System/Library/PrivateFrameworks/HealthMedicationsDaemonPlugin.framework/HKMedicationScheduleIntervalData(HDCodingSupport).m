@interface HKMedicationScheduleIntervalData(HDCodingSupport)
+ (id)hd_medicationScheduleIntervalDataFromCodable:()HDCodingSupport;
- (HDCodableMedicationScheduleIntervalData)hd_codableFromIntervalData;
@end

@implementation HKMedicationScheduleIntervalData(HDCodingSupport)

- (HDCodableMedicationScheduleIntervalData)hd_codableFromIntervalData
{
  v2 = objc_alloc_init(HDCodableMedicationScheduleIntervalData);
  -[HDCodableMedicationScheduleIntervalData setDayOfWeek:](v2, "setDayOfWeek:", [a1 daysOfWeek]);
  v3 = [a1 startTimeComponent];
  v4 = objc_msgSend(v3, "hk_codableDateComponents");
  [(HDCodableMedicationScheduleIntervalData *)v2 setStartTimeComponents:v4];

  v5 = [a1 cycleIndex];

  if (v5)
  {
    v6 = [a1 cycleIndex];
    -[HDCodableMedicationScheduleIntervalData setCycleIndex:](v2, "setCycleIndex:", (int)[v6 intValue]);
  }
  v7 = [a1 cycleIntervalDays];

  if (v7)
  {
    v8 = [a1 cycleIntervalDays];
    -[HDCodableMedicationScheduleIntervalData setCycleIntervalDays:](v2, "setCycleIntervalDays:", (int)[v8 intValue]);
  }
  v9 = [a1 dose];

  if (v9)
  {
    v10 = [a1 dose];
    [v10 doubleValue];
    -[HDCodableMedicationScheduleIntervalData setDose:](v2, "setDose:");
  }
  return v2;
}

+ (id)hd_medicationScheduleIntervalDataFromCodable:()HDCodingSupport
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F66B48]);
  v5 = (void *)MEMORY[0x1E4F1C9D8];
  v6 = [v3 startTimeComponents];
  v7 = objc_msgSend(v5, "hk_dateComponentsWithCodableDateComponents:", v6);
  uint64_t v8 = [v3 dayOfWeek];
  int v9 = [v3 hasCycleIndex];
  if (v9)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v3, "cycleIndex"));
  }
  else
  {
    v10 = 0;
  }
  int v11 = [v3 hasCycleIntervalDays];
  if (v11)
  {
    v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v3, "cycleIntervalDays"));
  }
  else
  {
    v12 = 0;
  }
  if (([v3 hasDose] & 1) == 0)
  {
    v15 = (void *)[v4 initWithStartTimeComponent:v7 daysOfWeek:v8 cycleIndex:v10 cycleIntervalDays:v12 dose:0];
    if (!v11) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v13 = (void *)MEMORY[0x1E4F28ED0];
  [v3 dose];
  v14 = objc_msgSend(v13, "numberWithDouble:");
  v15 = (void *)[v4 initWithStartTimeComponent:v7 daysOfWeek:v8 cycleIndex:v10 cycleIntervalDays:v12 dose:v14];

  if (v11) {
LABEL_11:
  }

LABEL_12:
  if (v9) {

  }
  return v15;
}

@end