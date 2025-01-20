@interface _HKFitnessFriendActivitySnapshot(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport;
- (HDCodableFitnessFriendActivitySnapshot)codableRepresentationForSync;
@end

@implementation _HKFitnessFriendActivitySnapshot(HDCodingSupport)

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4 = a3;
  v5 = [a1 codableRepresentationForSync];
  if (v5) {
    [v4 addFitnessFriendActivitySnapshots:v5];
  }

  return v5 != 0;
}

- (HDCodableFitnessFriendActivitySnapshot)codableRepresentationForSync
{
  v2 = objc_alloc_init(HDCodableFitnessFriendActivitySnapshot);
  v12.receiver = a1;
  v12.super_class = (Class)&off_1F187A0F0;
  v3 = objc_msgSendSuper2(&v12, sel_codableRepresentationForSync);
  [(HDCodableFitnessFriendActivitySnapshot *)v2 setSample:v3];
  id v4 = [a1 friendUUID];
  v5 = objc_msgSend(v4, "hk_dataForUUIDBytes");
  [(HDCodableFitnessFriendActivitySnapshot *)v2 setFriendUUID:v5];

  v6 = [a1 sourceUUID];
  v7 = objc_msgSend(v6, "hk_dataForUUIDBytes");
  [(HDCodableFitnessFriendActivitySnapshot *)v2 setSourceUUID:v7];

  [a1 activeHours];
  -[HDCodableFitnessFriendActivitySnapshot setActiveHours:](v2, "setActiveHours:");
  [a1 activeHoursGoal];
  -[HDCodableFitnessFriendActivitySnapshot setActiveHoursGoal:](v2, "setActiveHoursGoal:");
  [a1 briskMinutes];
  -[HDCodableFitnessFriendActivitySnapshot setBriskMinutes:](v2, "setBriskMinutes:");
  [a1 briskMinutesGoal];
  -[HDCodableFitnessFriendActivitySnapshot setBriskMinutesGoal:](v2, "setBriskMinutesGoal:");
  [a1 energyBurned];
  -[HDCodableFitnessFriendActivitySnapshot setEnergyBurned:](v2, "setEnergyBurned:");
  [a1 energyBurnedGoal];
  -[HDCodableFitnessFriendActivitySnapshot setEnergyBurnedGoal:](v2, "setEnergyBurnedGoal:");
  [a1 mmv];
  -[HDCodableFitnessFriendActivitySnapshot setMmv:](v2, "setMmv:");
  [a1 mmg];
  -[HDCodableFitnessFriendActivitySnapshot setMmg:](v2, "setMmg:");
  -[HDCodableFitnessFriendActivitySnapshot setAmm:](v2, "setAmm:", [a1 amm]);
  [a1 walkingAndRunningDistance];
  -[HDCodableFitnessFriendActivitySnapshot setWalkingAndRunningDistance:](v2, "setWalkingAndRunningDistance:");
  [a1 stepCount];
  -[HDCodableFitnessFriendActivitySnapshot setStepCount:](v2, "setStepCount:");
  -[HDCodableFitnessFriendActivitySnapshot setSnapshotIndex:](v2, "setSnapshotIndex:", [a1 snapshotIndex]);
  v8 = [a1 snapshotUploadedDate];
  [v8 timeIntervalSinceReferenceDate];
  -[HDCodableFitnessFriendActivitySnapshot setUploadedDate:](v2, "setUploadedDate:");

  [a1 pushCount];
  -[HDCodableFitnessFriendActivitySnapshot setPushCount:](v2, "setPushCount:");
  -[HDCodableFitnessFriendActivitySnapshot setWheelchairUse:](v2, "setWheelchairUse:", [a1 wheelchairUse]);
  v9 = [a1 timeZoneOffsetFromUTCForNoon];

  if (v9)
  {
    v10 = [a1 timeZoneOffsetFromUTCForNoon];
    -[HDCodableFitnessFriendActivitySnapshot setTimeZoneOffsetFromUTCForNoon:](v2, "setTimeZoneOffsetFromUTCForNoon:", [v10 integerValue]);
  }

  return v2;
}

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

@end