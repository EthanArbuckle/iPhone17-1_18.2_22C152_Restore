@interface HDStateOfMindSyncEntity
+ (BOOL)supportsSyncStore:(id)a3;
+ (Class)_syncedSampleTypeClass;
+ (Class)healthEntityClass;
+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4;
+ (id)_objectWithCodable:(id)a3 collection:(id)a4;
+ (id)syncEntityIdentifier;
@end

@implementation HDStateOfMindSyncEntity

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:64];
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
  return (id)objc_msgSend(MEMORY[0x1E4F2B590], "createWithCodable:", a3, a4);
}

+ (BOOL)supportsSyncStore:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x1E4F2B860], "sharedBehavior", a3);
  v4 = [v3 features];
  char v5 = [v4 chamomile];

  return v5;
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [a4 daemon];
  v7 = [v6 behavior];
  if ([v7 supportsSampleExpiration])
  {
    v8 = [MEMORY[0x1E4F2B860] sharedBehavior];
    v9 = [v8 features];
    int v10 = [v9 chamomile];

    if (v10)
    {
      v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      v12 = [MEMORY[0x1E4F2B448] stateOfMindType];
      v16[0] = v12;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      v14 = objc_msgSend(v11, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v13, v5, *MEMORY[0x1E4F2AB28]);

      goto LABEL_6;
    }
  }
  else
  {
  }
  v14 = 0;
LABEL_6:

  return v14;
}

@end