@interface HDECGSampleSyncEntity
+ (Class)_syncedSampleTypeClass;
+ (Class)healthEntityClass;
+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4;
+ (id)_objectWithCodable:(id)a3 collection:(id)a4;
+ (id)_predicateForSyncSession:(id)a3;
+ (id)syncEntityIdentifier;
+ (int)nanoSyncObjectType;
@end

@implementation HDECGSampleSyncEntity

+ (int)nanoSyncObjectType
{
  return 47;
}

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:53];
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
  id v4 = a3;
  v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v6 = [v5 shouldReceiveECGSamples];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F2AF88] createWithCodable:v4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [a4 daemon];
  v7 = [v6 behavior];
  int v8 = [v7 supportsSampleExpiration];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v10 = [MEMORY[0x1E4F2AFB8] electrocardiogramType];
    v14[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    v12 = objc_msgSend(v9, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v11, v5, *MEMORY[0x1E4F2AB00]);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_predicateForSyncSession:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HDECGSampleSyncEntity;
  v3 = objc_msgSendSuper2(&v5, sel__predicateForSyncSession_, a3);

  return v3;
}

@end