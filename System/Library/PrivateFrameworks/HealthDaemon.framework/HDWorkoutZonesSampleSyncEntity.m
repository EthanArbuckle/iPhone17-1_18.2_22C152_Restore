@interface HDWorkoutZonesSampleSyncEntity
+ (BOOL)supportsSyncStore:(id)a3;
+ (Class)_syncedSampleTypeClass;
+ (Class)healthEntityClass;
+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4;
+ (id)_objectWithCodable:(id)a3 collection:(id)a4;
+ (id)syncEntityIdentifier;
@end

@implementation HDWorkoutZonesSampleSyncEntity

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:66];
}

+ (Class)healthEntityClass
{
  return (Class)objc_opt_class();
}

+ (Class)_syncedSampleTypeClass
{
  return (Class)objc_opt_class();
}

+ (id)_objectWithCodable:(id)a3 collection:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F2B810], "createWithCodable:", a3, a4);
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  return 0;
}

+ (BOOL)supportsSyncStore:(id)a3
{
  return 1;
}

@end