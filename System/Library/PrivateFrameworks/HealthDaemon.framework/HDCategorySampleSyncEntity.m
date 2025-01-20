@interface HDCategorySampleSyncEntity
+ (Class)_syncedSampleTypeClass;
+ (Class)healthEntityClass;
+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4;
+ (id)_categoryTypesDerivedFromQuantitySamples;
+ (id)_objectWithCodable:(id)a3 collection:(id)a4;
+ (id)_predicateForCategoryTypesToSync;
+ (id)_predicateForSyncSession:(id)a3;
+ (id)syncEntityIdentifier;
+ (int)nanoSyncObjectType;
@end

@implementation HDCategorySampleSyncEntity

+ (Class)healthEntityClass
{
  return (Class)objc_opt_class();
}

+ (int)nanoSyncObjectType
{
  return 1;
}

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:2];
}

+ (Class)_syncedSampleTypeClass
{
  return (Class)objc_opt_class();
}

+ (id)_objectWithCodable:(id)a3 collection:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 sample];
  [v6 dataType];

  if (_HKValidDataTypeCode())
  {
    v7 = [MEMORY[0x1E4F2ACB0] createWithCodable:v5];
  }
  else
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = [v5 sample];
      int v12 = 138543618;
      id v13 = a1;
      __int16 v14 = 2048;
      uint64_t v15 = [v10 dataType];
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignorning unknown data type code %lld", (uint8_t *)&v12, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  v70[23] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [a4 daemon];
  v7 = [v6 behavior];
  int v8 = [v7 supportsSampleExpiration];

  if (v8)
  {
    v58 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v56 = [MEMORY[0x1E4F2B448] dataTypeWithCode:95];
    v70[0] = v56;
    v54 = [MEMORY[0x1E4F2B448] dataTypeWithCode:96];
    v70[1] = v54;
    v52 = [MEMORY[0x1E4F2B448] dataTypeWithCode:91];
    v70[2] = v52;
    v51 = [MEMORY[0x1E4F2B448] dataTypeWithCode:97];
    v70[3] = v51;
    v50 = [MEMORY[0x1E4F2B448] dataTypeWithCode:90];
    v70[4] = v50;
    v49 = [MEMORY[0x1E4F2B448] dataTypeWithCode:92];
    v70[5] = v49;
    v48 = [MEMORY[0x1E4F2B448] dataTypeWithCode:243];
    v70[6] = v48;
    v47 = [MEMORY[0x1E4F2B448] dataTypeWithCode:244];
    v70[7] = v47;
    v46 = [MEMORY[0x1E4F2B448] dataTypeWithCode:157];
    v70[8] = v46;
    v45 = [MEMORY[0x1E4F2B448] dataTypeWithCode:158];
    v70[9] = v45;
    v44 = [MEMORY[0x1E4F2B448] dataTypeWithCode:159];
    v70[10] = v44;
    v43 = [MEMORY[0x1E4F2B448] dataTypeWithCode:160];
    v70[11] = v43;
    v42 = [MEMORY[0x1E4F2B448] dataTypeWithCode:161];
    v70[12] = v42;
    v41 = [MEMORY[0x1E4F2B448] dataTypeWithCode:162];
    v70[13] = v41;
    v9 = [MEMORY[0x1E4F2B448] dataTypeWithCode:163];
    v70[14] = v9;
    v10 = [MEMORY[0x1E4F2B448] dataTypeWithCode:164];
    v70[15] = v10;
    v11 = [MEMORY[0x1E4F2B448] dataTypeWithCode:165];
    v70[16] = v11;
    int v12 = [MEMORY[0x1E4F2B448] dataTypeWithCode:166];
    v70[17] = v12;
    id v13 = [MEMORY[0x1E4F2B448] dataTypeWithCode:167];
    v70[18] = v13;
    __int16 v14 = [MEMORY[0x1E4F2B448] dataTypeWithCode:168];
    v70[19] = v14;
    [MEMORY[0x1E4F2B448] dataTypeWithCode:169];
    uint64_t v15 = v61 = v5;
    v70[20] = v15;
    uint64_t v16 = [MEMORY[0x1E4F2B448] dataTypeWithCode:170];
    v70[21] = v16;
    v17 = [MEMORY[0x1E4F2B448] dataTypeWithCode:171];
    v70[22] = v17;
    v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:23];

    v18 = [MEMORY[0x1E4F2ACB8] _categoryTypeWithCode:63];
    v69 = v18;
    v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];

    v19 = [MEMORY[0x1E4F2B448] dataTypeWithCode:178];
    v68[0] = v19;
    v20 = [MEMORY[0x1E4F2B448] dataTypeWithCode:199];
    v68[1] = v20;
    v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];

    v21 = [MEMORY[0x1E4F2B448] dataTypeWithCode:192];
    v67[0] = v21;
    v22 = [MEMORY[0x1E4F2B448] dataTypeWithCode:191];
    v67[1] = v22;
    v23 = [MEMORY[0x1E4F2B448] dataTypeWithCode:193];
    v67[2] = v23;
    v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:3];

    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__HDCategorySampleSyncEntity__basePruningPredicateForDate_profile___block_invoke;
    aBlock[3] = &unk_1E630E480;
    id v63 = v58;
    id v26 = v61;
    id v64 = v26;
    id v65 = v24;
    id v66 = v25;
    id v27 = v25;
    id v28 = v24;
    id v59 = v58;
    v29 = (void (**)(void *, void *, void))_Block_copy(aBlock);
    v29[2](v29, v60, *MEMORY[0x1E4F2AB10]);
    v29[2](v29, v57, *MEMORY[0x1E4F2AB20]);
    v29[2](v29, v55, *MEMORY[0x1E4F2AAE8]);
    v30 = [MEMORY[0x1E4F2B448] dataTypeWithCode:190];
    [v27 addObject:v30];
    [v27 addObjectsFromArray:v53];
    v31 = objc_msgSend(v59, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", 0, v26, *MEMORY[0x1E4F2AB00]);
    v32 = (void *)MEMORY[0x1E4F65D08];
    v33 = HDSampleEntityPredicateForDataTypes(v27);
    v34 = [v32 negatedPredicate:v33];
    v35 = [v32 compoundPredicateWithPredicate:v31 otherPredicate:v34];

    [v28 addObject:v35];
    v36 = (void *)MEMORY[0x1E4F65D08];
    v37 = (void *)[v28 copy];
    v38 = v36;
    id v5 = v61;
    v39 = [v38 predicateMatchingAnyPredicates:v37];
  }
  else
  {
    v39 = 0;
  }

  return v39;
}

void __67__HDCategorySampleSyncEntity__basePruningPredicateForDate_profile___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a2;
  objc_msgSend(v5, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v7, v6, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 48) addObject:v8];
  [*(id *)(a1 + 56) addObjectsFromArray:v7];
}

+ (id)_predicateForSyncSession:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F65D58];
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___HDCategorySampleSyncEntity;
  id v5 = objc_msgSendSuper2(&v9, sel__predicateForSyncSession_, a3);
  uint64_t v6 = [a1 _predicateForCategoryTypesToSync];
  id v7 = [v4 compoundPredicateWithPredicate:v5 otherPredicate:v6];

  return v7;
}

+ (id)_categoryTypesDerivedFromQuantitySamples
{
  v3[1] = *MEMORY[0x1E4F143B8];
  self;
  v0 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F297C8]];
  v3[0] = v0;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];

  return v1;
}

+ (id)_predicateForCategoryTypesToSync
{
  v2 = (void *)MEMORY[0x1E4F65D08];
  v3 = +[HDCategorySampleSyncEntity _categoryTypesDerivedFromQuantitySamples]();
  v4 = HDSampleEntityPredicateForDataTypes(v3);
  id v5 = [v2 negatedPredicate:v4];

  return v5;
}

@end