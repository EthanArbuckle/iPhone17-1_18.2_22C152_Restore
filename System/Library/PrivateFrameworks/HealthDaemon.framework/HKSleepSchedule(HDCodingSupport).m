@interface HKSleepSchedule(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport;
- (HDCodableSleepSchedule)codableRepresentationForSync;
@end

@implementation HKSleepSchedule(HDCodingSupport)

+ (id)createWithCodable:()HDCodingSupport
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = (void *)[[a1 alloc] _init];
    if ([v5 applyToObject:v6])
    {
      uint64_t v7 = HKDefaultObjectValidationConfigurationIgnoringAllOptions();
      v9 = objc_msgSend(v6, "_validateWithConfiguration:", v7, v8);
      if (v9) {
        v10 = 0;
      }
      else {
        v10 = v6;
      }
      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (HDCodableSleepSchedule)codableRepresentationForSync
{
  v2 = objc_alloc_init(HDCodableSleepSchedule);
  v14.receiver = a1;
  v14.super_class = (Class)&off_1F187CF88;
  v3 = objc_msgSendSuper2(&v14, sel_codableRepresentationForSync);
  [(HDCodableSleepSchedule *)v2 setSample:v3];

  unint64_t v4 = [a1 weekdays];
  [(HDCodableSleepSchedule *)v2 setMonday:v4 & 1];
  [(HDCodableSleepSchedule *)v2 setTuesday:(v4 >> 1) & 1];
  [(HDCodableSleepSchedule *)v2 setWednesday:(v4 >> 2) & 1];
  [(HDCodableSleepSchedule *)v2 setThursday:(v4 >> 3) & 1];
  [(HDCodableSleepSchedule *)v2 setFriday:(v4 >> 4) & 1];
  [(HDCodableSleepSchedule *)v2 setSaturday:(v4 >> 5) & 1];
  [(HDCodableSleepSchedule *)v2 setSunday:(v4 >> 6) & 1];
  id v5 = [a1 wakeTimeComponents];

  if (v5)
  {
    v6 = [a1 wakeTimeComponents];
    -[HDCodableSleepSchedule setWakeHour:](v2, "setWakeHour:", [v6 hour]);

    uint64_t v7 = [a1 wakeTimeComponents];
    -[HDCodableSleepSchedule setWakeMinute:](v2, "setWakeMinute:", [v7 minute]);
  }
  uint64_t v8 = [a1 bedTimeComponents];

  if (v8)
  {
    v9 = [a1 bedTimeComponents];
    -[HDCodableSleepSchedule setBedHour:](v2, "setBedHour:", [v9 hour]);

    v10 = [a1 bedTimeComponents];
    -[HDCodableSleepSchedule setBedMinute:](v2, "setBedMinute:", [v10 minute]);
  }
  id v11 = [a1 overrideDayIndex];

  if (v11)
  {
    v12 = [a1 overrideDayIndex];
    -[HDCodableSleepSchedule setOverrideDayIndex:](v2, "setOverrideDayIndex:", [v12 integerValue]);
  }

  return v2;
}

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4 = a3;
  id v5 = [a1 codableRepresentationForSync];
  if (v5) {
    [v4 addSleepSchedules:v5];
  }

  return v5 != 0;
}

@end