@interface HDWorkoutSyncEntity
+ (Class)_syncedSampleTypeClass;
+ (Class)healthEntityClass;
+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4;
+ (id)_objectWithCodable:(id)a3 collection:(id)a4;
+ (id)_predicateForSampleAgeInSyncSession:(id)a3 sampleTypeClass:(Class)a4;
+ (id)syncEntityIdentifier;
+ (int)nanoSyncObjectType;
@end

@implementation HDWorkoutSyncEntity

+ (Class)healthEntityClass
{
  return (Class)objc_opt_class();
}

+ (int)nanoSyncObjectType
{
  return 3;
}

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:5];
}

+ (Class)_syncedSampleTypeClass
{
  return (Class)objc_opt_class();
}

+ (id)_objectWithCodable:(id)a3 collection:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F2B718], "createWithCodable:", a3, a4);
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [a4 daemon];
  v7 = [v6 behavior];
  int v8 = [v7 supportsSampleExpiration];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v10 = [MEMORY[0x1E4F2B800] workoutType];
    v16[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    v12 = objc_msgSend(v9, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v11, v5, *MEMORY[0x1E4F2AB30]);

    v13 = HDDataEntityPredicateForObjectsFromAppleWatchSources(0);
    v14 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v12 otherPredicate:v13];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)_predicateForSampleAgeInSyncSession:(id)a3 sampleTypeClass:(Class)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___HDWorkoutSyncEntity;
  v7 = objc_msgSendSuper2(&v11, sel__predicateForSampleAgeInSyncSession_sampleTypeClass_, v5, v6);

  if (v7)
  {
    int v8 = HDDataEntityPredicateForObjectsFromAppleWatchSources(1);
    v9 = [MEMORY[0x1E4F65D58] disjunctionWithPredicate:v7 otherPredicate:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end