@interface HDCDASampleSyncEntity
+ (BOOL)supportsSpeculativeNanoSyncChanges;
+ (Class)_syncedSampleTypeClass;
+ (Class)healthEntityClass;
+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4;
+ (id)_objectWithCodable:(id)a3 collection:(id)a4;
+ (id)syncEntityIdentifier;
+ (int)nanoSyncObjectType;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
@end

@implementation HDCDASampleSyncEntity

+ (int)nanoSyncObjectType
{
  return 23;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 0;
}

+ (BOOL)supportsSpeculativeNanoSyncChanges
{
  return 0;
}

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:22];
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
  return (id)objc_msgSend(MEMORY[0x1E4F2AC90], "createWithCodable:", a3, a4);
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
    v10 = [MEMORY[0x1E4F2AF78] documentTypeForIdentifier:*MEMORY[0x1E4F29A80]];
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

@end