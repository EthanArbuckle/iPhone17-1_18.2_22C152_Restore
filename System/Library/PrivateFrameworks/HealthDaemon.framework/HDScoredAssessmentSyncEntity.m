@interface HDScoredAssessmentSyncEntity
+ (BOOL)supportsSyncStore:(id)a3;
+ (Class)_syncedSampleTypeClass;
+ (Class)healthEntityClass;
+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4;
+ (id)_objectWithCodable:(id)a3 collection:(id)a4;
+ (id)syncEntityIdentifier;
@end

@implementation HDScoredAssessmentSyncEntity

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:65];
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
  v5 = [v4 sample];
  uint64_t v6 = [v5 dataType];

  if (_HKValidDataTypeCode())
  {
    v7 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:v6];
    v8 = (void *)[v7 dataObjectClass];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      v9 = [v8 createWithCodable:v4];
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 daemon];
  v7 = [v6 behavior];
  if (![v7 supportsSampleExpiration])
  {
    v11 = 0;
    goto LABEL_5;
  }
  v8 = [MEMORY[0x1E4F2B860] sharedBehavior];
  v9 = [v8 features];
  int v10 = [v9 chamomile];

  if (v10)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v7 = [MEMORY[0x1E4F2B2C0] _allScoredAssessmentTypes];
    v11 = objc_msgSend(v6, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v7, v5, *MEMORY[0x1E4F2AB00]);
LABEL_5:

    goto LABEL_7;
  }
  v11 = 0;
LABEL_7:

  return v11;
}

+ (BOOL)supportsSyncStore:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x1E4F2B860], "sharedBehavior", a3);
  id v4 = [v3 features];
  char v5 = [v4 chamomile];

  return v5;
}

@end