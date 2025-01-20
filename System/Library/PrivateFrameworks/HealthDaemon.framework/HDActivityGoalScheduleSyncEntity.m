@interface HDActivityGoalScheduleSyncEntity
+ (BOOL)supportsSyncStore:(id)a3;
+ (Class)_syncedSampleTypeClass;
+ (Class)healthEntityClass;
+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4;
+ (id)_objectWithCodable:(id)a3 collection:(id)a4;
+ (id)syncEntityIdentifier;
@end

@implementation HDActivityGoalScheduleSyncEntity

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:69];
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
  return (id)objc_msgSend(MEMORY[0x1E4F2ABA0], "createWithCodable:", a3, a4);
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  return 0;
}

+ (BOOL)supportsSyncStore:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x1E4F2B860], "sharedBehavior", a3);
  v4 = [v3 features];
  char v5 = [v4 scheduledGoals];

  return v5;
}

@end