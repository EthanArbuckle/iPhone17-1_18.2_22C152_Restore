@interface HDSampleEntity
+ (BOOL)_validateEntityWithEnumerator:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5;
+ (BOOL)enumerateAssociatedObjectsForIdentifier:(int64_t)a3 inDatabase:(id)a4 error:(id *)a5 associatedObjectHandler:(id)a6;
+ (BOOL)requiresSampleTypePredicate;
+ (BOOL)validateEntitiesOfTypes:(id)a3 profile:(id)a4 error:(id *)a5 validationErrorHandler:(id)a6;
+ (Class)_deletedEntityClass;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)anySampleOfType:(id)a3 profile:(id)a4 encodingOptions:(id)a5 predicate:(id)a6 error:(id *)a7;
+ (id)columnNamesForTimeOffset;
+ (id)databaseTable;
+ (id)dateIntervalsForSampleTypes:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)entityEnumeratorWithType:(id)a3 profile:(id)a4;
+ (id)entityEnumeratorWithTypes:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)indices;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
+ (id)maxAnchorForSamplesWithType:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)minimumSampleStartDateForProfile:(id)a3 error:(id *)a4;
+ (id)mostRecentSampleWithType:(id)a3 profile:(id)a4 encodingOptions:(id)a5 predicate:(id)a6 anchor:(id *)a7 error:(id *)a8;
+ (id)objectInsertionFilterForProfile:(id)a3;
+ (id)oldestSampleWithType:(id)a3 profile:(id)a4 encodingOptions:(id)a5 predicate:(id)a6 error:(id *)a7;
+ (id)orderingTermForSortDescriptor:(id)a3;
+ (id)populatedSampleTypes:(id)a3 inDateInterval:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)sampleCountsByTypeForProfile:(id)a3 error:(id *)a4;
+ (id)sampleTypesForSamplesMatchingPredicate:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)samplesWithType:(id)a3 profile:(id)a4 encodingOptions:(id)a5 predicate:(id)a6 limit:(unint64_t)a7 anchor:(id *)a8 error:(id *)a9;
+ (id)sourceIDsForSamplesWithType:(id)a3 profile:(id)a4 predicate:(id)a5 error:(id *)a6;
+ (id)syntheticQuantityColumnName;
+ (int64_t)countOfSamplesWithType:(id)a3 profile:(id)a4 matchingPredicate:(id)a5 withError:(id *)a6;
+ (int64_t)preferredEntityType;
+ (void)deleteSamplesWithPredicate:(id)a3 limit:(unint64_t)a4 deletionContext:(id)a5 completionHandler:(id)a6;
+ (void)deleteSamplesWithPredicate:(id)a3 limit:(unint64_t)a4 generateDeletedObjects:(BOOL)a5 transaction:(id)a6 profile:(id)a7 recursiveDeleteAuthorizationBlock:(id)a8 completionHandler:(id)a9;
+ (void)deleteSamplesWithTypes:(id)a3 sourceEntities:(id)a4 profile:(id)a5 recursiveDeleteAuthorizationBlock:(id)a6 completionHandler:(id)a7;
@end

@implementation HDSampleEntity

+ (id)objectInsertionFilterForProfile:(id)a3
{
  v3 = [a3 daemon];
  v4 = [v3 behavior];
  int v5 = [v4 supportsSampleExpiration];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v7 = *MEMORY[0x1E4F2AB00];
    v8 = [MEMORY[0x1E4F1C9C8] date];
    v9 = objc_msgSend(v6, "hk_startOfDateBySubtractingDays:fromDate:", v7, v8);

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__HDSampleEntity_objectInsertionFilterForProfile___block_invoke;
    aBlock[3] = &unk_1E62FB6C0;
    id v14 = v9;
    id v10 = v9;
    v11 = _Block_copy(aBlock);
  }
  else
  {
    v11 = &__block_literal_global_409;
  }

  return v11;
}

uint64_t __50__HDSampleEntity_objectInsertionFilterForProfile___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  int v5 = [a2 endDate];
  uint64_t v6 = objc_msgSend(v5, "hk_isAfterOrEqualToDate:", *(void *)(a1 + 32));

  if ((v6 & 1) == 0) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a3, 3, @"The provided object's end date is too early.");
  }
  return v6;
}

+ (id)samplesWithType:(id)a3 profile:(id)a4 encodingOptions:(id)a5 predicate:(id)a6 limit:(unint64_t)a7 anchor:(id *)a8 error:(id *)a9
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  v19 = [MEMORY[0x1E4F1CA48] array];
  v20 = [a1 entityEnumeratorWithType:v15 profile:v16];
  [v20 setPredicate:v18];
  [v20 addEncodingOptionsFromDictionary:v17];
  [v20 setLimitCount:a7];
  v21 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:*MEMORY[0x1E4F65C70] entityClass:objc_opt_class() ascending:1];
  v39[0] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
  [v20 setOrderingTerms:v22];

  if (a8)
  {
    [v20 setAnchor:*a8];
    uint64_t v23 = [*a8 longLongValue];
    v36[3] = v23;
  }
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  v31 = __87__HDSampleEntity_samplesWithType_profile_encodingOptions_predicate_limit_anchor_error___block_invoke;
  v32 = &unk_1E62F2FB8;
  id v24 = v19;
  id v33 = v24;
  v34 = &v35;
  int v25 = [v20 enumerateWithError:a9 handler:&v29];
  if (a8)
  {
    objc_msgSend(NSNumber, "numberWithLongLong:", v36[3], v29, v30, v31, v32);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v25) {
    v26 = v24;
  }
  else {
    v26 = 0;
  }
  id v27 = v26;

  _Block_object_dispose(&v35, 8);

  return v27;
}

+ (id)entityEnumeratorWithType:(id)a3 profile:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[HDDataEntityEnumerator _initWithObjectType:entityClass:profile:]([HDDataEntityEnumerator alloc], "_initWithObjectType:entityClass:profile:", v6, objc_msgSend((id)objc_msgSend(v6, "dataObjectClass"), "hd_dataEntityClass"), v5);

  return v7;
}

+ (id)anySampleOfType:(id)a3 profile:(id)a4 encodingOptions:(id)a5 predicate:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__60;
  id v24 = __Block_byref_object_dispose__60;
  id v25 = 0;
  id v16 = [a1 entityEnumeratorWithType:v12 profile:v13];
  [v16 setPredicate:v15];
  [v16 addEncodingOptionsFromDictionary:v14];
  [v16 setLimitCount:1];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__HDSampleEntity_anySampleOfType_profile_encodingOptions_predicate_error___block_invoke;
  v19[3] = &unk_1E62F2FE0;
  v19[4] = &v20;
  [v16 enumerateWithError:a7 handler:v19];
  id v17 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v17;
}

+ (id)mostRecentSampleWithType:(id)a3 profile:(id)a4 encodingOptions:(id)a5 predicate:(id)a6 anchor:(id *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__60;
  id v33 = __Block_byref_object_dispose__60;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__60;
  id v27 = __Block_byref_object_dispose__60;
  id v28 = 0;
  id v18 = [a1 entityEnumeratorWithType:v14 profile:v15];
  [v18 setPredicate:v17];
  [v18 addEncodingOptionsFromDictionary:v16];
  v19 = HDSampleEntityOrderingTermsForRecentness();
  [v18 setOrderingTerms:v19];

  [v18 setLimitCount:1];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __90__HDSampleEntity_mostRecentSampleWithType_profile_encodingOptions_predicate_anchor_error___block_invoke;
  v22[3] = &unk_1E62FB558;
  v22[4] = &v29;
  v22[5] = &v23;
  [v18 enumerateWithError:a8 handler:v22];
  if (a7) {
    *a7 = (id) v24[5];
  }
  id v20 = (id)v30[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v20;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = objc_opt_class();
  if (([v15 isEqual:objc_opt_class()] & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDSampleEntity.m", 100, @"Subclasses must override %s", "+[HDSampleEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __80__HDSampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v22[3] = &unk_1E62F2900;
  id v23 = v14;
  id v24 = v12;
  id v16 = v12;
  id v17 = v14;
  if ([v13 executeSQL:@"INSERT INTO samples (data_id, data_type, start_date, end_date) VALUES (?, ?, ?, ?)", a7, v22, 0 error bindingHandler enumerationHandler])id v18 = v17; {
  else
  }
    id v18 = 0;
  id v19 = v18;

  return v19;
}

+ (BOOL)requiresSampleTypePredicate
{
  return objc_opt_class() == (void)a1;
}

uint64_t __87__HDSampleEntity_samplesWithType_profile_encodingOptions_predicate_limit_anchor_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5) {
    [*(id *)(a1 + 32) addObject:v5];
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void *)(v6 + 24) < a3) {
    *(void *)(v6 + 24) = a3;
  }

  return 1;
}

uint64_t __74__HDSampleEntity_anySampleOfType_profile_encodingOptions_predicate_error___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

+ (int64_t)countOfSamplesWithType:(id)a3 profile:(id)a4 matchingPredicate:(id)a5 withError:(id *)a6
{
  v9 = (void *)MEMORY[0x1E4F65D58];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = HDSampleEntityPredicateForDataType(v12);
  id v14 = [v9 compoundPredicateWithPredicate:v13 otherPredicate:v10];

  id v15 = (void *)[v12 dataObjectClass];
  id v16 = objc_msgSend(v15, "hd_dataEntityClass");
  id v17 = [v11 database];

  int64_t v18 = [v16 countOfObjectsWithPredicate:v14 healthDatabase:v17 error:a6];
  return v18;
}

uint64_t __90__HDSampleEntity_mostRecentSampleWithType_profile_encodingOptions_predicate_anchor_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = a2;
  uint64_t v7 = [NSNumber numberWithLongLong:a3];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return 0;
}

+ (id)oldestSampleWithType:(id)a3 profile:(id)a4 encodingOptions:(id)a5 predicate:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__60;
  uint64_t v25 = __Block_byref_object_dispose__60;
  id v26 = 0;
  id v16 = [a1 entityEnumeratorWithType:v12 profile:v13];
  [v16 setPredicate:v15];
  [v16 addEncodingOptionsFromDictionary:v14];
  id v17 = HDSampleEntityOrderingTermsForOldness();
  [v16 setOrderingTerms:v17];

  [v16 setLimitCount:1];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__HDSampleEntity_oldestSampleWithType_profile_encodingOptions_predicate_error___block_invoke;
  v20[3] = &unk_1E62F2FE0;
  v20[4] = &v21;
  [v16 enumerateWithError:a7 handler:v20];
  id v18 = (id)v22[5];

  _Block_object_dispose(&v21, 8);

  return v18;
}

uint64_t __79__HDSampleEntity_oldestSampleWithType_profile_encodingOptions_predicate_error___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

+ (id)databaseTable
{
  return @"samples";
}

+ (Class)_deletedEntityClass
{
  return (Class)objc_opt_class();
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_29;
}

+ (id)indices
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v3 = objc_opt_class();
  v18[0] = @"data_type";
  v18[1] = @"start_date";
  v18[2] = @"end_date";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  id v5 = (void *)[v2 initWithEntity:v3 name:@"type_dates" columns:v4];
  v19[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v7 = objc_opt_class();
  v17[0] = @"data_type";
  v17[1] = @"end_date";
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v9 = (void *)[v6 initWithEntity:v7 name:@"type_end" columns:v8];
  v19[1] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v11 = objc_opt_class();
  v16[0] = @"data_type";
  v16[1] = @"data_id";
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  id v13 = (void *)[v10 initWithEntity:v11 name:@"type_anchor" columns:v12];
  v19[2] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];

  return v14;
}

uint64_t __80__HDSampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) longLongValue]);
  v4 = [*(id *)(a1 + 40) sampleType];
  sqlite3_bind_int64(a2, 2, [v4 code]);

  [*(id *)(a1 + 40) _startTimestamp];
  sqlite3_bind_double(a2, 3, v5);
  [*(id *)(a1 + 40) _endTimestamp];

  return sqlite3_bind_double(a2, 4, v6);
}

+ (id)orderingTermForSortDescriptor:(id)a3
{
  id v4 = a3;
  double v5 = [v4 key];
  uint64_t v6 = [v4 ascending];
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A9B8]])
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F65D50];
    uint64_t v8 = objc_opt_class();
    v9 = @"start_date";
LABEL_5:
    id v10 = v7;
LABEL_6:
    uint64_t v11 = [v10 orderingTermWithProperty:v9 entityClass:v8 ascending:v6];
    goto LABEL_7;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A9A0]])
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F65D50];
    uint64_t v8 = objc_opt_class();
    v9 = @"end_date";
    goto LABEL_5;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A280]])
  {
    id v14 = (void *)MEMORY[0x1E4F65D50];
    uint64_t v8 = objc_opt_class();
    id v10 = v14;
    v9 = @"data_id";
    goto LABEL_6;
  }
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___HDSampleEntity;
  uint64_t v11 = objc_msgSendSuper2(&v15, sel_orderingTermForSortDescriptor_, v4);
LABEL_7:
  id v12 = (void *)v11;

  return v12;
}

+ (id)maxAnchorForSamplesWithType:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v8 = HDSampleEntityPredicateForDataType(a3);
  v9 = [v7 database];

  id v10 = +[HDHealthEntity maxRowIDForPredicate:v8 healthDatabase:v9 error:a5];

  return v10;
}

+ (void)deleteSamplesWithTypes:(id)a3 sourceEntities:(id)a4 profile:(id)a5 recursiveDeleteAuthorizationBlock:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = (void (**)(id, uint64_t, void, uint64_t, uint64_t, uint64_t, id))a7;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  char v65 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__60;
  v60 = __Block_byref_object_dispose__60;
  id v61 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__60;
  v54 = __Block_byref_object_dispose__60;
  id v55 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__60;
  v48 = __Block_byref_object_dispose__60;
  id v49 = 0;
  if ([v13 count] || objc_msgSend(v14, "count"))
  {
    if ([v14 count])
    {
      id v18 = HDDataEntityPredicateForSourceEntitySet(7, v14);
    }
    else
    {
      id v18 = 0;
    }
    id v26 = v13;
    if ([v13 count])
    {
      id v19 = HDSampleEntityPredicateForDataTypes(v13);
      id v20 = v14;
    }
    else
    {
      id v20 = v14;
      id v19 = 0;
    }
    uint64_t v21 = objc_msgSend(v15, "database", v26);
    id v43 = 0;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __116__HDSampleEntity_deleteSamplesWithTypes_sourceEntities_profile_recursiveDeleteAuthorizationBlock_completionHandler___block_invoke;
    v33[3] = &unk_1E62FB5A8;
    id v22 = v19;
    id v34 = v22;
    id v23 = v18;
    id v35 = v23;
    id v42 = a1;
    id v36 = v15;
    id v37 = v16;
    uint64_t v38 = &v62;
    v39 = &v56;
    v40 = &v50;
    v41 = &v44;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __116__HDSampleEntity_deleteSamplesWithTypes_sourceEntities_profile_recursiveDeleteAuthorizationBlock_completionHandler___block_invoke_3;
    v28[3] = &unk_1E62FB5D0;
    id v29 = v20;
    id v30 = v27;
    v32 = &v62;
    id v31 = v36;
    uint64_t v24 = [a1 performWriteTransactionWithHealthDatabase:v21 error:&v43 block:v33 inaccessibilityHandler:v28];
    id v25 = v43;

    if (v17) {
      v17[2](v17, v24, *((unsigned __int8 *)v63 + 24), v57[5], v51[5], v45[5], v25);
    }

    id v14 = v20;
    id v13 = v27;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Invalid arguments to delete; source entities or types must be non-empty."");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    v17[2](v17, 0, 0, 0, 0, 0, v23);
    id v25 = 0;
  }

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);
}

BOOL __116__HDSampleEntity_deleteSamplesWithTypes_sourceEntities_profile_recursiveDeleteAuthorizationBlock_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:*(void *)(a1 + 32) otherPredicate:*(void *)(a1 + 40)];
  id v7 = (void *)MEMORY[0x1E4F65D08];
  uint64_t v8 = HDDataEntityPredicateForType(1);
  v9 = [v7 compoundPredicateWithPredicate:v6 otherPredicate:v8];

  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__60;
  id v25 = __Block_byref_object_dispose__60;
  id v26 = 0;
  uint64_t v10 = *MEMORY[0x1E4F65DE0];
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __116__HDSampleEntity_deleteSamplesWithTypes_sourceEntities_profile_recursiveDeleteAuthorizationBlock_completionHandler___block_invoke_2;
  void v18[3] = &unk_1E62FB580;
  v18[4] = *(void *)(a1 + 64);
  v18[5] = &v21;
  long long v19 = *(_OWORD *)(a1 + 72);
  id v13 = *(void **)(a1 + 96);
  uint64_t v20 = *(void *)(a1 + 88);
  [v13 deleteSamplesWithPredicate:v9 limit:v10 generateDeletedObjects:1 transaction:v5 profile:v11 recursiveDeleteAuthorizationBlock:v12 completionHandler:v18];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    BOOL v14 = 1;
  }
  else
  {
    id v15 = (id)v22[5];
    id v16 = v15;
    if (v15)
    {
      if (a3) {
        *a3 = v15;
      }
      else {
        _HKLogDroppedError();
      }
    }

    BOOL v14 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) != 0;
  }
  _Block_object_dispose(&v21, 8);

  return v14;
}

void __116__HDSampleEntity_deleteSamplesWithTypes_sourceEntities_profile_recursiveDeleteAuthorizationBlock_completionHandler___block_invoke_2(void *a1, char a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7)
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v23 = a7;
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  if ((a2 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a7);
  }
  uint64_t v15 = *(void *)(a1[6] + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v12;
  id v17 = v12;

  uint64_t v18 = *(void *)(a1[7] + 8);
  long long v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v13;
  id v20 = v13;

  uint64_t v21 = *(void *)(a1[8] + 8);
  id v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v14;
}

uint64_t __116__HDSampleEntity_deleteSamplesWithTypes_sourceEntities_profile_recursiveDeleteAuthorizationBlock_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_msgSend(*(id *)(a1 + 32), "hk_map:", &__block_literal_global_65);
  uint64_t v6 = -[_HDSampleTypesDeletionEntry initWithSourceIDs:types:]([_HDSampleTypesDeletionEntry alloc], v5, *(void **)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  id v7 = [*(id *)(a1 + 48) database];
  uint64_t v8 = [v7 addJournalEntry:v6 error:a3];

  return v8;
}

uint64_t __116__HDSampleEntity_deleteSamplesWithTypes_sourceEntities_profile_recursiveDeleteAuthorizationBlock_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 persistentID];

  return [v2 numberWithLongLong:v3];
}

+ (void)deleteSamplesWithPredicate:(id)a3 limit:(unint64_t)a4 generateDeletedObjects:(BOOL)a5 transaction:(id)a6 profile:(id)a7 recursiveDeleteAuthorizationBlock:(id)a8 completionHandler:(id)a9
{
  BOOL v12 = a5;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a3;
  uint64_t v21 = [[HDDataEntityDeletionContext alloc] initWithProfile:v18 transaction:v19];

  [(HDDataEntityDeletionContext *)v21 setInsertDeletedObjects:v12];
  [(HDDataEntityDeletionContext *)v21 setRecursiveDeleteAuthorizationBlock:v17];

  [a1 deleteSamplesWithPredicate:v20 limit:a4 deletionContext:v21 completionHandler:v16];
  [(HDDataEntityDeletionContext *)v21 finish];
}

+ (void)deleteSamplesWithPredicate:(id)a3 limit:(unint64_t)a4 deletionContext:(id)a5 completionHandler:(id)a6
{
  v40[3] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void (**)(void, void, void, void, void, void, void))v13;
  if (v11)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    id v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, a1, @"HDSampleEntity.m", 297, @"Invalid parameter not satisfying: %@", @"predicate" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v32 = [MEMORY[0x1E4F28B00] currentHandler];
  [v32 handleFailureInMethod:a2, a1, @"HDSampleEntity.m", 298, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  uint64_t v15 = [v12 transaction];
  id v16 = [v15 databaseForEntityClass:a1];
  id v17 = [a1 queryWithDatabase:v16 predicate:v11 limit:a4 orderingTerms:0 groupBy:0];

  v40[0] = @"data_type";
  v40[1] = @"uuid";
  v40[2] = @"provenance";
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
  id v19 = [MEMORY[0x1E4F1C9C8] date];
  id v20 = objc_alloc_init(MEMORY[0x1E4F2AEE8]);
  id v39 = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __85__HDSampleEntity_deleteSamplesWithPredicate_limit_deletionContext_completionHandler___block_invoke;
  v35[3] = &unk_1E62FB5F8;
  id v21 = v12;
  id v36 = v21;
  id v22 = v19;
  id v37 = v22;
  id v23 = v20;
  id v38 = v23;
  int v24 = [v17 enumeratePersistentIDsAndProperties:v18 error:&v39 enumerationHandler:v35];
  id v25 = v39;
  [v21 finish];
  if (v14)
  {
    if (v24)
    {
      id v26 = [v21 lastInsertedDeletedObjectPersistentID];
      id v33 = v18;
      id v27 = v17;
      uint64_t v28 = [v21 deletedObjectCount];
      [v21 deletedObjectTypeSet];
      id v29 = v34 = v11;
      uint64_t v30 = v28;
      id v17 = v27;
      id v18 = v33;
      ((void (**)(void, uint64_t, void *, uint64_t, void *, id, id))v14)[2](v14, 1, v26, v30, v29, v23, v25);

      id v11 = v34;
    }
    else
    {
      ((void (**)(void, void, void, void, void, void, id))v14)[2](v14, 0, 0, 0, 0, 0, v25);
    }
  }
}

uint64_t __85__HDSampleEntity_deleteSamplesWithPredicate_limit_deletionContext_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v9 = [MEMORY[0x1E4F2B448] dataTypeWithCode:HDSQLiteColumnAsInt64()];
  uint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "dataObjectClass"), "hd_dataEntityClass");
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = MEMORY[0x1C1879F90](a4, 1);
    id v13 = MEMORY[0x1C1879F70](a4, 2);
    uint64_t v14 = [*(id *)(a1 + 32) deleteObjectWithPersistentID:a2 objectUUID:v12 entityClass:v11 objectType:v9 provenanceIdentifier:v13 deletionDate:*(void *)(a1 + 40) deletedSampleIntervals:*(void *)(a1 + 48) error:a5];
  }
  else
  {
    uint64_t v14 = 1;
  }

  return v14;
}

+ (BOOL)enumerateAssociatedObjectsForIdentifier:(int64_t)a3 inDatabase:(id)a4 error:(id *)a5 associatedObjectHandler:(id)a6
{
  v21[5] = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  id v10 = a4;
  uint64_t v11 = HDAssociationEntityPredicateForChildObjectsAssociatedWithParentObject(a3);
  v21[0] = @"data_id";
  v21[1] = @"data_type";
  v21[2] = @"uuid";
  v21[3] = @"provenance";
  v21[4] = @"data_provenances.source_id";
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:5];
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __99__HDSampleEntity_enumerateAssociatedObjectsForIdentifier_inDatabase_error_associatedObjectHandler___block_invoke;
  id v19 = &unk_1E62F4138;
  id v20 = v9;
  id v13 = v9;
  uint64_t v14 = _Block_copy(&aBlock);
  LOBYTE(a5) = +[HDSQLiteEntity enumerateQueryResultsFromColumns:properties:predicate:groupBy:orderingTerms:limit:database:error:enumerationHandler:](HDSampleEntity, "enumerateQueryResultsFromColumns:properties:predicate:groupBy:orderingTerms:limit:database:error:enumerationHandler:", v12, v12, v11, 0, 0, 0, v10, a5, v14, aBlock, v17, v18, v19);

  return (char)a5;
}

uint64_t __99__HDSampleEntity_enumerateAssociatedObjectsForIdentifier_inDatabase_error_associatedObjectHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  HDSQLiteColumnAsInt64();
  id v5 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:HDSQLiteColumnAsInt64()];
  objc_msgSend((id)objc_msgSend(v5, "dataObjectClass"), "hd_dataEntityClass");
  uint64_t v6 = MEMORY[0x1C1879F90](a3, 2);
  id v7 = MEMORY[0x1C1879F70](a3, 3);
  uint64_t v8 = MEMORY[0x1C1879F70](a3, 4);
  uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v9;
}

+ (id)entityEnumeratorWithTypes:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_msgSend(v7, "hk_map:", &__block_literal_global_361_1);
  id v10 = v9;
  if (!v9 || ![v9 count])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"Unable to determine entity class for object types (%@)", v7, v13);
    goto LABEL_6;
  }
  if ((unint64_t)[v10 count] >= 2)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"Attempt to query across object types (%@) with incompatible entity classes (%@)", v7, v10);
LABEL_6:
    id v11 = 0;
    goto LABEL_8;
  }
  id v11 = -[HDDataEntityEnumerator _initWithObjectTypes:entityClass:profile:]([HDDataEntityEnumerator alloc], "_initWithObjectTypes:entityClass:profile:", v7, [v10 anyObject], v8);
LABEL_8:

  return v11;
}

uint64_t __58__HDSampleEntity_entityEnumeratorWithTypes_profile_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 dataObjectClass];

  return objc_msgSend(v2, "hd_dataEntityClass");
}

+ (id)sourceIDsForSamplesWithType:(id)a3 profile:(id)a4 predicate:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = HDSampleEntityPredicateForDataType(a3);
  uint64_t v13 = v12;
  if (v11)
  {
    id v14 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v11 otherPredicate:v12];
  }
  else
  {
    id v14 = v12;
  }
  uint64_t v15 = [a1 sourceIDsForObjectsOfType:1 profile:v10 predicate:v14 error:a6];

  return v15;
}

+ (id)sampleCountsByTypeForProfile:(id)a3 error:(id *)a4
{
  id v7 = NSString;
  id v8 = a3;
  uint64_t v9 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  objc_msgSend(v7, "stringWithFormat:", @"SELECT %@, COUNT(%@) FROM %@ GROUP BY %@;",
    @"data_type",
    @"data_type",
    v9,
  id v10 = @"data_type");

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v12 = [v8 database];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53__HDSampleEntity_sampleCountsByTypeForProfile_error___block_invoke;
  void v18[3] = &unk_1E62F5200;
  id v19 = v10;
  id v20 = v11;
  id v21 = a1;
  SEL v22 = a2;
  id v13 = v11;
  id v14 = v10;
  LODWORD(a4) = [a1 performReadTransactionWithHealthDatabase:v12 error:a4 block:v18];

  if (a4) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;

  return v16;
}

uint64_t __53__HDSampleEntity_sampleCountsByTypeForProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 48)];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__HDSampleEntity_sampleCountsByTypeForProfile_error___block_invoke_3;
  v11[3] = &unk_1E62FB620;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  id v12 = v7;
  uint64_t v13 = v8;
  uint64_t v9 = [v5 executeSQL:v6 error:a3 bindingHandler:&__block_literal_global_374 enumerationHandler:v11];

  return v9;
}

uint64_t __53__HDSampleEntity_sampleCountsByTypeForProfile_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = HDSQLiteColumnAsInt64();
  if (_HKValidDataTypeCode())
  {
    id v5 = MEMORY[0x1C1879F70](a2, 1);
    if ([v5 integerValue] >= 1)
    {
      uint64_t v6 = [MEMORY[0x1E4F2B448] dataTypeWithCode:v4];
      [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
    }
  }
  else
  {
    _HKInitializeLogging();
    id v7 = (void *)*MEMORY[0x1E4F29F18];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR)) {
      return 1;
    }
    uint64_t v9 = *(const char **)(a1 + 40);
    id v5 = v7;
    id v10 = NSStringFromSelector(v9);
    int v11 = 138543618;
    id v12 = v10;
    __int16 v13 = 2048;
    uint64_t v14 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@ unknown data type code %ld", (uint8_t *)&v11, 0x16u);
  }
  return 1;
}

+ (id)dateIntervalsForSampleTypes:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = NSString;
  id v9 = a4;
  id v10 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  int v11 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v12 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  __int16 v13 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v14 = [v8 stringWithFormat:@"SELECT (SELECT %@ FROM %@ INNER JOIN %@ USING(%@) WHERE %@ = ? AND %@ = ? ORDER BY %@ ASC LIMIT 1) AS min, (SELECT %@ FROM %@ INNER JOIN %@ USING(%@) WHERE %@ = ? AND %@ = ? ORDER BY %@ DESC LIMIT 1) AS max", @"start_date", v10, v11, @"data_id", @"data_type", @"type", @"end_date", @"end_date", v12, v13, @"data_id", @"data_type", @"type", @"end_date", 0];

  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__HDSampleEntity_dateIntervalsForSampleTypes_profile_error___block_invoke;
  aBlock[3] = &unk_1E62FB670;
  id v33 = v14;
  id v34 = v15;
  SEL v35 = a2;
  id v16 = v15;
  id v17 = v14;
  id v18 = _Block_copy(aBlock);
  id v19 = [v9 database];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __60__HDSampleEntity_dateIntervalsForSampleTypes_profile_error___block_invoke_382;
  v28[3] = &unk_1E62FB698;
  id v30 = v18;
  id v31 = a1;
  id v29 = v7;
  id v20 = v18;
  id v21 = v7;
  int v22 = [a1 performReadTransactionWithHealthDatabase:v19 error:a5 block:v28];

  if (v22) {
    id v23 = v16;
  }
  else {
    id v23 = 0;
  }
  id v24 = v23;

  return v24;
}

uint64_t __60__HDSampleEntity_dateIntervalsForSampleTypes_profile_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a1 + 32);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __60__HDSampleEntity_dateIntervalsForSampleTypes_profile_error___block_invoke_2;
  v16[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v16[4] = a2;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__HDSampleEntity_dateIntervalsForSampleTypes_profile_error___block_invoke_3;
  v12[3] = &unk_1E62FB648;
  uint64_t v14 = a2;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v13 = v8;
  uint64_t v15 = v9;
  uint64_t v10 = [a3 executeSQL:v7 error:a4 bindingHandler:v16 enumerationHandler:v12];

  return v10;
}

uint64_t __60__HDSampleEntity_dateIntervalsForSampleTypes_profile_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_bind_int64(a2, 2, 1);
  sqlite3_bind_int64(a2, 3, *(void *)(a1 + 32));

  return sqlite3_bind_int64(a2, 4, 1);
}

uint64_t __60__HDSampleEntity_dateIntervalsForSampleTypes_profile_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((MEMORY[0x1C1879FC0](a2, 0) & 1) == 0)
  {
    uint64_t v4 = [MEMORY[0x1E4F2B448] dataTypeWithCode:*(void *)(a1 + 40)];
    id v5 = MEMORY[0x1C1879F30](a2, 0);
    uint64_t v6 = MEMORY[0x1C1879F30](a2, 1);
    if (v4)
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v5 endDate:v6];
      [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v4];
    }
    else
    {
      _HKInitializeLogging();
      id v8 = (void *)*MEMORY[0x1E4F29F18];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      uint64_t v10 = *(const char **)(a1 + 48);
      uint64_t v7 = v8;
      int v11 = NSStringFromSelector(v10);
      uint64_t v12 = *(void *)(a1 + 40);
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2048;
      uint64_t v16 = v12;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "%{public}@ unknown data type code %ld", (uint8_t *)&v13, 0x16u);
    }
LABEL_6:
  }
  return 1;
}

uint64_t __60__HDSampleEntity_dateIntervalsForSampleTypes_profile_error___block_invoke_382(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 48)];
  if ([*(id *)(a1 + 32) count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          if (!(*(unsigned int (**)(void, uint64_t, void *, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "code", (void)v15), v5, a3))
          {
            uint64_t v11 = 0;
            goto LABEL_12;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    uint64_t v11 = 1;
LABEL_12:
  }
  else
  {
    uint64_t v12 = 0;
    do
    {
      uint64_t v11 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
      if (!v11) {
        break;
      }
    }
    while (v12++ != 316);
  }

  return v11;
}

+ (id)populatedSampleTypes:(id)a3 inDateInterval:(id)a4 profile:(id)a5 error:(id *)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v33 = a5;
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * i), "code"));
        [v11 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v14);
  }

  long long v18 = NSString;
  id v19 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v20 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v21 = [v11 componentsJoinedByString:@","];
  int v22 = [v18 stringWithFormat:@"SELECT COUNT(%@), %@ FROM %@ INNER JOIN %@ USING(%@) WHERE %@ = ? AND (%@ > ?) AND (%@ < ?) AND %@ IN (%@) GROUP BY %@", @"start_date", @"data_type", v19, v20, @"data_id", @"type", @"start_date", @"start_date", @"data_type", v21, @"data_type"];

  id v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
  id v24 = [v33 database];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __68__HDSampleEntity_populatedSampleTypes_inDateInterval_profile_error___block_invoke;
  v34[3] = &unk_1E62F2E18;
  id v35 = v22;
  id v36 = v10;
  id v37 = v23;
  id v38 = a1;
  id v25 = v23;
  id v26 = v10;
  id v27 = v22;
  int v28 = [a1 performReadTransactionWithHealthDatabase:v24 error:a6 block:v34];

  if (v28) {
    id v29 = v25;
  }
  else {
    id v29 = 0;
  }
  id v30 = v29;

  return v30;
}

uint64_t __68__HDSampleEntity_populatedSampleTypes_inDateInterval_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 56)];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__HDSampleEntity_populatedSampleTypes_inDateInterval_profile_error___block_invoke_2;
  v11[3] = &unk_1E62F43C8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__HDSampleEntity_populatedSampleTypes_inDateInterval_profile_error___block_invoke_3;
  v9[3] = &unk_1E62F3D38;
  id v10 = *(id *)(a1 + 48);
  uint64_t v7 = [v5 executeUncachedSQL:v6 error:a3 bindingHandler:v11 enumerationHandler:v9];

  return v7;
}

void __68__HDSampleEntity_populatedSampleTypes_inDateInterval_profile_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, 1);
  uint64_t v4 = [*(id *)(a1 + 32) startDate];
  [v4 timeIntervalSinceReferenceDate];
  sqlite3_bind_double(a2, 2, v5);

  id v7 = [*(id *)(a1 + 32) endDate];
  [v7 timeIntervalSinceReferenceDate];
  sqlite3_bind_double(a2, 3, v6);
}

uint64_t __68__HDSampleEntity_populatedSampleTypes_inDateInterval_profile_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnAsInt64();
  uint64_t v3 = HDSQLiteColumnAsInt64();
  if (v2)
  {
    uint64_t v4 = [MEMORY[0x1E4F2B448] dataTypeWithCode:v3];
    if (v4) {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }
  return 1;
}

+ (id)sampleTypesForSamplesMatchingPredicate:(id)a3 profile:(id)a4 error:(id *)a5
{
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v8);
  id v12 = [a1 predicateMatchingPreferredEntityTypeIfRequiredWithPredicate:v10];

  uint64_t v13 = [v9 database];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__HDSampleEntity_sampleTypesForSamplesMatchingPredicate_profile_error___block_invoke;
  v19[3] = &unk_1E62F4200;
  id v21 = v11;
  id v22 = a1;
  id v20 = v12;
  id v14 = v11;
  id v15 = v12;
  LODWORD(a5) = [a1 performReadTransactionWithHealthDatabase:v13 error:a5 block:v19];

  if (a5) {
    long long v16 = v14;
  }
  else {
    long long v16 = 0;
  }
  id v17 = v16;

  return v17;
}

BOOL __71__HDSampleEntity_sampleTypesForSamplesMatchingPredicate_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v5 = [a2 databaseForEntityClass:*(void *)(a1 + 48)];
  double v6 = [*(id *)(a1 + 48) distinctProperty:@"data_type" predicate:*(void *)(a1 + 32) database:v5 error:a3];
  id v7 = v6;
  if (v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [MEMORY[0x1E4F2B2C0] dataTypeWithNumber:*(void *)(*((void *)&v14 + 1) + 8 * v11)];
          if (v12) {
            [*(id *)(a1 + 40) addObject:v12];
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }

  return v7 != 0;
}

+ (id)minimumSampleStartDateForProfile:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[HDSampleEntity dateIntervalsForSampleTypes:0 profile:a3 error:a4];
  double v5 = [v4 allValues];
  double v6 = v5;
  if (!v5) {
    goto LABEL_16;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = (void *)[v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v7) {
    goto LABEL_17;
  }
  uint64_t v8 = *(void *)v22;
  double v9 = 1.79769313e308;
  do
  {
    for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v22 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      id v12 = [v11 startDate];
      [v12 timeIntervalSinceReferenceDate];
      if (v13 == 2.22507386e-308)
      {
      }
      else
      {
        long long v14 = [v11 startDate];
        [v14 timeIntervalSinceReferenceDate];
        double v16 = v15;

        if (v16 >= 0.0)
        {
          long long v17 = [v11 startDate];
          [v17 timeIntervalSinceReferenceDate];
          double v19 = v18;

          if (v9 >= v19) {
            double v9 = v19;
          }
        }
      }
    }
    id v7 = (void *)[v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v7);
  if (v9 != 1.79769313e308)
  {
    id v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v9];
  }
  else
  {
LABEL_16:
    id v7 = 0;
  }
LABEL_17:

  return v7;
}

+ (BOOL)validateEntitiesOfTypes:(id)a3 profile:(id)a4 error:(id *)a5 validationErrorHandler:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        double v18 = objc_msgSend(a1, "entityEnumeratorWithType:profile:", *(void *)(*((void *)&v22 + 1) + 8 * i), v11, (void)v22);
        int v19 = [a1 _validateEntityWithEnumerator:v18 error:a5 validationErrorHandler:v12];

        if (!v19)
        {
          BOOL v20 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  BOOL v20 = 1;
LABEL_11:

  return v20;
}

+ (BOOL)_validateEntityWithEnumerator:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__HDSampleEntity__validateEntityWithEnumerator_error_validationErrorHandler___block_invoke;
  v11[3] = &unk_1E62F6F18;
  id v12 = v8;
  id v13 = a1;
  id v9 = v8;
  LOBYTE(a4) = [a3 enumerateWithError:a4 handler:v11];

  return (char)a4;
}

uint64_t __77__HDSampleEntity__validateEntityWithEnumerator_error_validationErrorHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v26[5] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = HKDefaultObjectValidationConfiguration();
    id v8 = objc_msgSend(v5, "_validateWithConfiguration:", v6, v7);
    if (v8)
    {
      v25[0] = *MEMORY[0x1E4F29B38];
      uint64_t v9 = [*(id *)(a1 + 40) databaseTable];
      id v10 = (void *)v9;
      id v11 = @"No database table name found";
      if (v9) {
        id v11 = (__CFString *)v9;
      }
      uint64_t v12 = *MEMORY[0x1E4F28A50];
      v26[0] = v11;
      v26[1] = v8;
      uint64_t v13 = *MEMORY[0x1E4F29B40];
      v25[1] = v12;
      v25[2] = v13;
      uint64_t v14 = [v5 UUID];
      uint64_t v15 = [v14 UUIDString];
      uint64_t v16 = (void *)v15;
      long long v17 = @"No UUID found";
      if (v15) {
        long long v17 = (__CFString *)v15;
      }
      v26[2] = v17;
      v25[3] = *MEMORY[0x1E4F29B30];
      double v18 = [NSNumber numberWithLongLong:a3];
      v26[3] = v18;
      v25[4] = *MEMORY[0x1E4F29B48];
      uint64_t v19 = [v5 _valueDescription];
      BOOL v20 = (void *)v19;
      long long v21 = @"N/A";
      if (v19) {
        long long v21 = (__CFString *)v19;
      }
      v26[4] = v21;
      long long v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:5];

      long long v23 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:userInfo:", 120, v22);
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }

  return 1;
}

+ (id)syntheticQuantityColumnName
{
  return 0;
}

+ (int64_t)preferredEntityType
{
  return 1;
}

uint64_t __50__HDSampleEntity_objectInsertionFilterForProfile___block_invoke_2()
{
  return 1;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [(HDEntityEncoder *)[_HDSampleEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (id)columnNamesForTimeOffset
{
  v4[2] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    v4[0] = @"start_date";
    v4[1] = @"end_date";
    uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

@end