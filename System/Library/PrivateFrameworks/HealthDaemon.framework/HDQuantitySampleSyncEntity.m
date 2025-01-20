@interface HDQuantitySampleSyncEntity
+ (Class)_syncedSampleTypeClass;
+ (Class)healthEntityClass;
+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4;
+ (id)_headphoneAudioExposureSamplesExpirationPredicateForNowDate:(uint64_t)a1;
+ (id)_objectWithCodable:(id)a3 collection:(id)a4;
+ (id)_predicateForSampleAgeInSyncSession:(id)a3 sampleTypeClass:(Class)a4;
+ (id)_sedentaryAndBackgroundHeartRateContextPredicate;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (id)syncEntityIdentifier;
+ (int)nanoSyncObjectType;
@end

@implementation HDQuantitySampleSyncEntity

+ (Class)healthEntityClass
{
  return (Class)objc_opt_class();
}

+ (int)nanoSyncObjectType
{
  return 2;
}

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:4];
}

+ (Class)_syncedSampleTypeClass
{
  return (Class)objc_opt_class();
}

+ (id)_objectWithCodable:(id)a3 collection:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 sample];
  uint64_t v9 = [v8 dataType];

  if ((_HKValidDataTypeCode() & 1) == 0)
  {
    _HKInitializeLogging();
    v16 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = [v6 sample];
      int v25 = 138543618;
      id v26 = a1;
      __int16 v27 = 2048;
      uint64_t v28 = [v18 dataType];
      _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignorning unknown data type code %lld", (uint8_t *)&v25, 0x16u);
    }
    goto LABEL_12;
  }
  if (v9 == 258)
  {
    v10 = [v7 provenance];
    v11 = [v10 originBuild];
    if (!objc_msgSend(v11, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", @"20R0", @"20R279"))
    {
      v12 = [v7 provenance];
      v13 = [v12 originBuild];
      v14 = v13;
      v15 = @"20A275";
LABEL_11:
      char v19 = objc_msgSend(v13, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", @"20A0", v15);

      if (v19) {
        goto LABEL_12;
      }
LABEL_13:
      v21 = [MEMORY[0x1E4F2B388] createWithCodable:v6];
      v22 = v21;
      if (v21)
      {
        id v23 = v21;
      }
      else
      {
        id v23 = [MEMORY[0x1E4F2B388] migrateCodableObject:v6];
      }
      v20 = v23;

      goto LABEL_17;
    }
  }
  else
  {
    if (v9 != 272) {
      goto LABEL_13;
    }
    v10 = [v7 provenance];
    v11 = [v10 originBuild];
    if (!objc_msgSend(v11, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", @"20R0", @"20R239"))
    {
      v12 = [v7 provenance];
      v13 = [v12 originBuild];
      v14 = v13;
      v15 = @"20A236";
      goto LABEL_11;
    }
  }

LABEL_12:
  v20 = 0;
LABEL_17:

  return v20;
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  v97[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 daemon];
  uint64_t v9 = [v8 behavior];
  int v10 = [v9 supportsSampleExpiration];

  if (v10)
  {
    id v82 = a1;
    uint64_t v11 = [MEMORY[0x1E4F2B448] dataTypeWithCode:249];
    v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v85 = (void *)v11;
    uint64_t v94 = v11;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
    uint64_t v81 = objc_msgSend(v12, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v13, v6, *MEMORY[0x1E4F2AB38]);

    v14 = [MEMORY[0x1E4F2B448] dataTypeWithCode:90];
    v93[0] = v14;
    v15 = [MEMORY[0x1E4F2B448] dataTypeWithCode:256];
    v93[1] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:2];

    v17 = [v7 daemon];
    v18 = [v17 behavior];
    char v19 = [v18 features];
    int v20 = [v19 extendedLocalWatchData];

    if (v20)
    {
      v21 = [MEMORY[0x1E4F2B3B8] _quantityTypeWithCode:139];
      v92[0] = v21;
      v22 = [MEMORY[0x1E4F2B3B8] _quantityTypeWithCode:14];
      v92[1] = v22;
      id v23 = [MEMORY[0x1E4F2B3B8] _quantityTypeWithCode:61];
      v92[2] = v23;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:3];
      uint64_t v25 = [v16 arrayByAddingObjectsFromArray:v24];

      v16 = (void *)v25;
    }
    v83 = v16;
    v30 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v84 = objc_msgSend(v30, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v16, v6, *MEMORY[0x1E4F2AB10]);

    v31 = [MEMORY[0x1E4F2B3B8] calorieGoal];
    v91[0] = v31;
    v32 = [MEMORY[0x1E4F2B3B8] moveMinuteGoal];
    v91[1] = v32;
    v33 = [MEMORY[0x1E4F2B3B8] _quantityTypeWithCode:105];
    v91[2] = v33;
    v34 = [MEMORY[0x1E4F2B3B8] _quantityTypeWithCode:104];
    v91[3] = v34;
    v35 = [MEMORY[0x1E4F2B3B8] sleepDurationGoalType];
    v91[4] = v35;
    v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:5];

    uint64_t v36 = [MEMORY[0x1E4F2B448] dataTypeWithCode:118];
    v37 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v90 = v36;
    uint64_t v38 = v36;
    v80 = (void *)v36;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
    v74 = objc_msgSend(v37, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v39, v6, *MEMORY[0x1E4F2AB18]);

    v40 = [MEMORY[0x1E4F2B448] dataTypeWithCode:298];
    v89[0] = v40;
    v41 = [MEMORY[0x1E4F2B448] dataTypeWithCode:304];
    v89[1] = v41;
    uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:2];

    v43 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v77 = (void *)v42;
    v79 = objc_msgSend(v43, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v42, v6, *MEMORY[0x1E4F2AB40]);

    v44 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v73 = *MEMORY[0x1E4F2AB00];
    v75 = objc_msgSend(v44, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", 0, v6);

    v45 = [MEMORY[0x1E4F2B448] dataTypeWithCode:5];
    v88[0] = v45;
    v88[1] = v85;
    v88[2] = v38;
    v46 = [MEMORY[0x1E4F2B448] dataTypeWithCode:283];
    v88[3] = v46;
    v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:4];

    v48 = [v47 arrayByAddingObjectsFromArray:v16];

    v49 = [v48 arrayByAddingObjectsFromArray:v78];

    v76 = [v49 arrayByAddingObjectsFromArray:v42];

    v50 = (void *)MEMORY[0x1E4F65D08];
    v51 = HDSampleEntityPredicateForDataTypes(v76);
    v52 = [v50 negatedPredicate:v51];
    v72 = [v50 compoundPredicateWithPredicate:v75 otherPredicate:v52];

    v70 = (void *)MEMORY[0x1E4F65D08];
    uint64_t v28 = (void *)v81;
    v87[0] = v72;
    v87[1] = v81;
    v87[2] = v74;
    v87[3] = v84;
    v71 = +[HDQuantitySampleSyncEntity _headphoneAudioExposureSamplesExpirationPredicateForNowDate:]((uint64_t)v82, v6);
    v87[4] = v71;
    id v53 = v6;
    self;
    v69 = +[HDQuantitySampleSyncEntity _sedentaryAndBackgroundHeartRateContextPredicate]();
    v54 = [MEMORY[0x1E4F65D08] negatedPredicate:v69];
    v55 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v56 = [MEMORY[0x1E4F2B3B8] heartRateType];
    v97[0] = v56;
    v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:1];
    v58 = objc_msgSend(v55, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v57, v53, *MEMORY[0x1E4F2AAF0]);

    v59 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v60 = [MEMORY[0x1E4F2B3B8] heartRateType];
    v96 = v60;
    v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v96 count:1];
    v62 = objc_msgSend(v59, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v61, v53, v73);

    v63 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v54 otherPredicate:v62];
    v64 = (void *)MEMORY[0x1E4F65D08];
    v95[0] = v58;
    v95[1] = v63;
    v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:2];
    v66 = [v64 predicateMatchingAnyPredicates:v65];

    v87[5] = v66;
    v87[6] = v79;
    v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:7];
    uint64_t v29 = [v70 predicateMatchingAnyPredicates:v67];

    __int16 v27 = v85;
  }
  else
  {
    id v26 = (void *)MEMORY[0x1E4F65D08];
    __int16 v27 = +[HDQuantitySampleSyncEntity _headphoneAudioExposureSamplesExpirationPredicateForNowDate:]((uint64_t)a1, v6);
    v86 = v27;
    uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
    uint64_t v29 = [v26 predicateMatchingAnyPredicates:v28];
  }

  return v29;
}

+ (id)_headphoneAudioExposureSamplesExpirationPredicateForNowDate:(uint64_t)a1
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  v3 = [MEMORY[0x1E4F2B3B8] dataTypeWithCode:173];
  v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v11[0] = v3;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v6 = objc_msgSend(v4, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v5, v2, *MEMORY[0x1E4F29E10]);

  id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:MEMORY[0x1E4F1CC38]];
  v8 = +[HDMetadataValueEntityPredicate predicateWithMetadataKey:*MEMORY[0x1E4F2BB00] allowedValues:v7];
  uint64_t v9 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v6 otherPredicate:v8];

  return v9;
}

+ (id)_sedentaryAndBackgroundHeartRateContextPredicate
{
  self;
  v0 = _HKBackgroundAndSedentaryPrivateHeartRateContexts();
  v1 = +[HDMetadataValueEntityPredicate predicateWithMetadataKey:*MEMORY[0x1E4F2BB28] allowedValues:v0];

  return v1;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  if (a3 < 12)
  {
    v4 = 0;
  }
  else
  {
    v4 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  }
  return v4;
}

+ (id)_predicateForSampleAgeInSyncSession:(id)a3 sampleTypeClass:(Class)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___HDQuantitySampleSyncEntity;
  id v7 = objc_msgSendSuper2(&v17, sel__predicateForSampleAgeInSyncSession_sampleTypeClass_, v5, v6);
  if (v7)
  {
    v8 = +[HDQuantitySampleSyncEntity _sedentaryAndBackgroundHeartRateContextPredicate]();
    uint64_t v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    int v10 = [MEMORY[0x1E4F2B3B8] heartRateType];
    v18[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    v12 = [v5 startDate];
    v13 = objc_msgSend(v9, "hd_predicateForSamplesWithTypes:endingAfterDate:minusDays:", v11, v12, *MEMORY[0x1E4F2AAF0]);

    v14 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v8 otherPredicate:v13];
    v15 = [MEMORY[0x1E4F65D58] disjunctionWithPredicate:v7 otherPredicate:v14];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end