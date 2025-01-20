@interface HDLocationSeriesSyncEntity
+ (BOOL)supportsSpeculativeNanoSyncChanges;
+ (Class)_syncedSampleTypeClass;
+ (Class)healthEntityClass;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4;
+ (id)_objectWithCodable:(id)a3 collection:(id)a4;
+ (id)_predicateForSyncSession:(id)a3;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int)nanoSyncObjectType;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
@end

@implementation HDLocationSeriesSyncEntity

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();

  return (id)[v3 setWithObject:v4];
}

+ (Class)healthEntityClass
{
  return (Class)objc_opt_class();
}

+ (int)nanoSyncObjectType
{
  return 18;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (BOOL)supportsSpeculativeNanoSyncChanges
{
  return 0;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:18];
}

+ (Class)_syncedSampleTypeClass
{
  return (Class)objc_opt_class();
}

+ (id)_objectWithCodable:(id)a3 collection:(id)a4
{
  uint64_t v4 = (void *)MEMORY[0x1E4F2B7A0];
  id v5 = a3;
  v6 = [v4 createWithCodable:v5];
  [v6 _setCodableWorkoutRoute:v5];

  return v6;
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
    v10 = [MEMORY[0x1E4F2B498] workoutRouteType];
    v16[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    v12 = objc_msgSend(v9, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v11, v5, *MEMORY[0x1E4F2AB00]);

    v13 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"frozen" notEqualToValue:&unk_1F17EF108];
    v14 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v12 otherPredicate:v13];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)_predicateForSyncSession:(id)a3
{
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___HDLocationSeriesSyncEntity;
  id v3 = a3;
  uint64_t v4 = objc_msgSendSuper2(&v13, sel__predicateForSyncSession_, v3);
  id v5 = objc_msgSend(v3, "syncStore", v13.receiver, v13.super_class);

  v6 = [v5 profile];
  v7 = [v6 daemon];
  int v8 = [v7 behavior];
  int v9 = [v8 supportsWorkoutRouteSmoothing];

  if (v9)
  {
    v10 = +[HDMetadataValueEntityPredicate predicateWithMetadataKey:*MEMORY[0x1E4F2BBF0] exists:0];
    id v11 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v4 otherPredicate:v10];
  }
  else
  {
    id v11 = v4;
  }

  return v11;
}

@end