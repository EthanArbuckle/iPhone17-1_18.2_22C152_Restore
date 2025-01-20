@interface HDFitnessFriendAchievementSyncEntity
+ (BOOL)supportsSyncStore:(id)a3;
+ (Class)_syncedSampleTypeClass;
+ (Class)healthEntityClass;
+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4;
+ (id)syncEntityIdentifier;
@end

@implementation HDFitnessFriendAchievementSyncEntity

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:49];
}

+ (Class)healthEntityClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSyncStore:(id)a3
{
  return 0;
}

+ (Class)_syncedSampleTypeClass
{
  return 0;
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  v6 = [v4 currentCalendar];
  v7 = [MEMORY[0x1E4F2B448] fitnessFriendAchievementType];
  v11[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v9 = objc_msgSend(v6, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v8, v5, 11);

  return v9;
}

@end