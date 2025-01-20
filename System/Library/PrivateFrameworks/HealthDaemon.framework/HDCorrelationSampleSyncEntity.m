@interface HDCorrelationSampleSyncEntity
+ (Class)_syncedSampleTypeClass;
+ (Class)healthEntityClass;
+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4;
+ (id)_objectWithCodable:(id)a3 collection:(id)a4;
+ (id)_predicateForSyncSession:(id)a3;
+ (id)syncEntityIdentifier;
+ (int)nanoSyncObjectType;
@end

@implementation HDCorrelationSampleSyncEntity

+ (Class)healthEntityClass
{
  return (Class)objc_opt_class();
}

+ (int)nanoSyncObjectType
{
  return 13;
}

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:3];
}

+ (Class)_syncedSampleTypeClass
{
  return (Class)objc_opt_class();
}

+ (id)_objectWithCodable:(id)a3 collection:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F2AE50], "createWithCodable:", a3, a4);
}

+ (id)_predicateForSyncSession:(id)a3
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___HDCorrelationSampleSyncEntity;
  v3 = objc_msgSendSuper2(&v10, sel__predicateForSyncSession_, a3);
  v4 = [MEMORY[0x1E4F2B2C0] _allTypesOfClass:objc_opt_class()];
  v5 = HDSampleEntityPredicateForDataTypes(v4);

  v6 = HDDataEntityPredicateForType(1);
  v7 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v5 otherPredicate:v6];
  v8 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v3 otherPredicate:v7];

  return v8;
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  id v5 = a3;
  v6 = [a4 daemon];
  v7 = [v6 behavior];
  int v8 = [v7 supportsSampleExpiration];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    objc_super v10 = [MEMORY[0x1E4F2B2C0] _allTypesOfClass:objc_opt_class()];
    v11 = objc_msgSend(v9, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v10, v5, *MEMORY[0x1E4F2AB00]);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end