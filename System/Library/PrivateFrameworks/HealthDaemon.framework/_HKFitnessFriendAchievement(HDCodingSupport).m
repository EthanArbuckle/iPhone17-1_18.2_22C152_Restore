@interface _HKFitnessFriendAchievement(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport;
- (HDCodableFitnessFriendAchievement)codableRepresentationForSync;
@end

@implementation _HKFitnessFriendAchievement(HDCodingSupport)

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4 = a3;
  v5 = [a1 codableRepresentationForSync];
  if (v5) {
    [v4 addFitnessFriendAchievements:v5];
  }

  return v5 != 0;
}

- (HDCodableFitnessFriendAchievement)codableRepresentationForSync
{
  v2 = objc_alloc_init(HDCodableFitnessFriendAchievement);
  v11.receiver = a1;
  v11.super_class = (Class)&off_1F1879B80;
  v3 = objc_msgSendSuper2(&v11, sel_codableRepresentationForSync);
  [(HDCodableFitnessFriendAchievement *)v2 setSample:v3];
  id v4 = [a1 friendUUID];
  v5 = objc_msgSend(v4, "hk_dataForUUIDBytes");
  [(HDCodableFitnessFriendAchievement *)v2 setFriendUUID:v5];

  v6 = [a1 templateUniqueName];
  [(HDCodableFitnessFriendAchievement *)v2 setTemplateUniqueName:v6];

  v7 = [a1 completedDate];
  [v7 timeIntervalSinceReferenceDate];
  -[HDCodableFitnessFriendAchievement setCompletedDate:](v2, "setCompletedDate:");

  v8 = [a1 value];
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "hk_hasFloatingPointValue"))
    {
      [v9 doubleValue];
      -[HDCodableFitnessFriendAchievement setDoubleValue:](v2, "setDoubleValue:");
    }
    else
    {
      -[HDCodableFitnessFriendAchievement setIntValue:](v2, "setIntValue:", [v9 longLongValue]);
    }
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