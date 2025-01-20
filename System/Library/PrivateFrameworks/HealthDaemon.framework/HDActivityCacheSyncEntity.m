@interface HDActivityCacheSyncEntity
+ (Class)_syncedSampleTypeClass;
+ (Class)healthEntityClass;
+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4;
+ (id)_objectWithCodable:(id)a3 collection:(id)a4;
+ (id)syncEntityIdentifier;
+ (int)nanoSyncObjectType;
@end

@implementation HDActivityCacheSyncEntity

+ (Class)healthEntityClass
{
  return (Class)objc_opt_class();
}

+ (int)nanoSyncObjectType
{
  return 4;
}

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:1];
}

+ (Class)_syncedSampleTypeClass
{
  return (Class)objc_opt_class();
}

+ (id)_objectWithCodable:(id)a3 collection:(id)a4
{
  id v5 = a4;
  v6 = [MEMORY[0x1E4F2AB98] createWithCodable:a3];
  if (![v6 version])
  {
    v7 = [v5 provenance];
    v8 = [v7 originBuild];
    if (objc_msgSend(v8, "hk_compareBuildVersionWithString:", @"20A6") < 0)
    {
      v9 = [v5 provenance];
      v10 = [v9 originBuild];
      uint64_t v11 = objc_msgSend(v10, "hk_compareBuildVersionWithString:", @"20R57");

      if (v11 < 0)
      {
        uint64_t v12 = 1;
        goto LABEL_6;
      }
    }
    else
    {
    }
    uint64_t v12 = 2;
LABEL_6:
    [v6 _setVersion:v12];
  }

  return v6;
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [a4 daemon];
  v7 = [v6 behavior];
  int v8 = [v7 supportsSampleExpiration];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v10 = [MEMORY[0x1E4F2B448] activityCacheType];
    v14[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    uint64_t v12 = objc_msgSend(v9, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v11, v5, *MEMORY[0x1E4F2AAF8]);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

@end