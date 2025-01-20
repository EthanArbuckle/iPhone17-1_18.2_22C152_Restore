@interface HDQuantitySampleValueEnumerator
+ (BOOL)orderedQuantityValuesBySeriesForPredicate:(id)a3 profile:(id)a4 options:(int64_t)a5 error:(id *)a6 handler:(id)a7;
+ (BOOL)orderedQuantityValuesBySeriesForPredicate:(id)a3 transaction:(id)a4 options:(int64_t)a5 error:(id *)a6 handler:(id)a7;
+ (BOOL)orderedQuantityValuesForPredicate:(id)a3 profile:(id)a4 options:(int64_t)a5 error:(id *)a6 handler:(id)a7;
+ (BOOL)orderedQuantityValuesForPredicate:(id)a3 transaction:(id)a4 options:(int64_t)a5 error:(id *)a6 handler:(id)a7;
+ (id)_propertiesForEnumeration;
+ (id)_queryForEnumerationWithPredicate:(void *)a3 transaction:(char)a4 options:;
+ (uint64_t)_enumerateWithEnumerator:(void *)a3 endTime:(void *)a4 error:(void *)a5 handler:;
@end

@implementation HDQuantitySampleValueEnumerator

+ (BOOL)orderedQuantityValuesBySeriesForPredicate:(id)a3 profile:(id)a4 options:(int64_t)a5 error:(id *)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v14 = [a4 database];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __107__HDQuantitySampleValueEnumerator_orderedQuantityValuesBySeriesForPredicate_profile_options_error_handler___block_invoke;
  v18[3] = &unk_1E62F4160;
  id v21 = a1;
  int64_t v22 = a5;
  id v19 = v12;
  id v20 = v13;
  id v15 = v13;
  id v16 = v12;
  LOBYTE(a6) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v14 error:a6 block:v18];

  return (char)a6;
}

uint64_t __107__HDQuantitySampleValueEnumerator_orderedQuantityValuesBySeriesForPredicate_profile_options_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 48) orderedQuantityValuesBySeriesForPredicate:*(void *)(a1 + 32) transaction:a2 options:*(void *)(a1 + 56) error:a3 handler:*(void *)(a1 + 40)];
}

+ (BOOL)orderedQuantityValuesBySeriesForPredicate:(id)a3 transaction:(id)a4 options:(int64_t)a5 error:(id *)a6 handler:(id)a7
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v31 = a7;
  v32 = v12;
  v29 = v11;
  int64_t v33 = a5;
  id v13 = +[HDQuantitySampleValueEnumerator _queryForEnumerationWithPredicate:transaction:options:]((uint64_t)a1, v11, v12, a5);
  v14 = +[HDQuantitySampleValueEnumerator _propertiesForEnumeration]();
  uint64_t v30 = [v14 indexOfObject:*MEMORY[0x1E4F65C70]];
  uint64_t v15 = [v14 indexOfObject:@"uuid"];
  uint64_t v16 = [v14 indexOfObject:@"data_type"];
  uint64_t v17 = [v14 indexOfObject:@"quantity"];
  uint64_t v18 = [v14 indexOfObject:@"data_provenances.source_id"];
  uint64_t v19 = [v14 indexOfObject:@"start_date"];
  uint64_t v20 = [v14 indexOfObject:@"end_date"];
  uint64_t v21 = [v14 indexOfObject:@"count"];
  uint64_t v22 = [v14 indexOfObject:@"hfd_key"];
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __111__HDQuantitySampleValueEnumerator_orderedQuantityValuesBySeriesForPredicate_transaction_options_error_handler___block_invoke;
  v35[3] = &unk_1E63057E0;
  uint64_t v39 = v30;
  uint64_t v40 = v15;
  uint64_t v41 = v16;
  uint64_t v42 = v17;
  uint64_t v43 = v19;
  uint64_t v44 = v20;
  uint64_t v45 = v18;
  uint64_t v46 = v21;
  uint64_t v47 = v22;
  int64_t v48 = v33;
  id v23 = v31;
  id v37 = v23;
  id v24 = v32;
  id v36 = v24;
  v38 = &v49;
  char v25 = [v13 enumerateProperties:v14 error:a6 enumerationHandler:v35];
  if (v50[3] >= 1)
  {
    _HKInitializeLogging();
    v26 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = v50[3];
      *(_DWORD *)buf = 134217984;
      uint64_t v54 = v28;
      _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "Skipped %ld missing sample histories during enumeration", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v49, 8);
  return v25;
}

+ (id)_queryForEnumerationWithPredicate:(void *)a3 transaction:(char)a4 options:
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  self;
  v8 = objc_opt_class();
  v9 = [v7 databaseForEntityClass:v8];

  if ((a4 & 4) == 0)
  {
    v10 = [v8 additionalPredicateForEnumeration];
    uint64_t v11 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v6 otherPredicate:v10];

    id v6 = (id)v11;
  }
  id v12 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"start_date" entityClass:objc_opt_class() ascending:1];
  v18[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];

  if ((a4 & 2) != 0)
  {
    v14 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"uuid" entityClass:objc_opt_class() ascending:1];
    uint64_t v15 = [v13 arrayByAddingObject:v14];

    id v13 = (void *)v15;
  }
  uint64_t v16 = [v8 queryWithDatabase:v9 predicate:v6 limit:0 orderingTerms:v13 groupBy:0];

  return v16;
}

+ (id)_propertiesForEnumeration
{
  v2[9] = *MEMORY[0x1E4F143B8];
  self;
  v2[0] = *MEMORY[0x1E4F65C70];
  v2[1] = @"uuid";
  v2[2] = @"data_type";
  v2[3] = @"quantity";
  v2[4] = @"data_provenances.source_id";
  v2[5] = @"start_date";
  v2[6] = @"end_date";
  v2[7] = @"count";
  v2[8] = @"hfd_key";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:9];

  return v0;
}

uint64_t __111__HDQuantitySampleValueEnumerator_orderedQuantityValuesBySeriesForPredicate_transaction_options_error_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = HDSQLiteColumnAsInt64();
  uint64_t v9 = MEMORY[0x1C1879F10](a3, *(void *)(a1 + 64));
  uint64_t v10 = HDSQLiteColumnAsInt64();
  double v11 = MEMORY[0x1C1879F40](a3, *(void *)(a1 + 80));
  double v12 = MEMORY[0x1C1879F40](a3, *(void *)(a1 + 88));
  double v13 = MEMORY[0x1C1879F40](a3, *(void *)(a1 + 96));
  uint64_t v14 = HDSQLiteColumnAsInt64();
  if (MEMORY[0x1C1879FC0](a3, *(void *)(a1 + 112))) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = HDSQLiteColumnAsInt64();
  }
  int v16 = MEMORY[0x1C1879FC0](a3, *(void *)(a1 + 120));
  if ((*(unsigned char *)(a1 + 128) & 1) != 0 && !v16)
  {
    uint64_t v31 = HDSQLiteColumnAsInt64();
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x2020000000;
    char v60 = 0;
    uint64_t v51 = 0;
    uint64_t v52 = &v51;
    uint64_t v53 = 0x3032000000;
    uint64_t v54 = __Block_byref_object_copy__135;
    uint64_t v55 = __Block_byref_object_dispose__135;
    id v56 = 0;
    uint64_t v47 = 0;
    int64_t v48 = &v47;
    uint64_t v49 = 0x2020000000;
    uint64_t v50 = 0;
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x2020000000;
    *(double *)&v46[3] = v12;
    uint64_t v17 = v8;
    id v18 = v7;
    id v45 = 0;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __111__HDQuantitySampleValueEnumerator_orderedQuantityValuesBySeriesForPredicate_transaction_options_error_handler___block_invoke_279;
    v32[3] = &unk_1E63057B8;
    v34 = v46;
    v35 = &v57;
    uint64_t v19 = *(void *)(a1 + 32);
    id v20 = *(id *)(a1 + 40);
    uint64_t v39 = v10;
    uint64_t v40 = v9;
    double v41 = v12;
    double v42 = v13;
    uint64_t v43 = v14;
    uint64_t v44 = v15;
    id v33 = v20;
    id v36 = &v47;
    id v37 = &v51;
    uint64_t v38 = v17;
    uint64_t v21 = v19;
    id v7 = v18;
    BOOL v22 = +[HDQuantitySampleSeriesEntity enumerateRawDataWithTransaction:v21 HFDKey:v31 error:&v45 handler:v32];
    id v23 = v45;
    if (v22)
    {
      if (!v48[3])
      {
        _HKInitializeLogging();
        v29 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134349056;
          uint64_t v62 = v31;
          _os_log_debug_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_DEBUG, "Skipping missing quantity sample history during enumeration: %{public}lld", buf, 0xCu);
        }
        ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        uint64_t v25 = (*(uint64_t (**)(double, double, double, double, double))(*(void *)(a1 + 40) + 16))(v12, v13, v11, v12, v13);
        goto LABEL_22;
      }
      id v24 = v52;
      if (*((unsigned char *)v58 + 24) && !v52[5])
      {
        uint64_t v25 = 1;
LABEL_22:

        _Block_object_dispose(v46, 8);
        _Block_object_dispose(&v47, 8);
        _Block_object_dispose(&v51, 8);

        _Block_object_dispose(&v57, 8);
        goto LABEL_23;
      }
    }
    else
    {
      id v24 = v52;
    }
    v26 = (void *)v24[5];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = v27;
      if (a4) {
        *a4 = v27;
      }
      else {
        _HKLogDroppedError();
      }
    }
    uint64_t v25 = 0;
    goto LABEL_22;
  }
  uint64_t v25 = (*(uint64_t (**)(double, double, double, double, double))(*(void *)(a1 + 40) + 16))(v12, v13, v11, v12, v13);
LABEL_23:

  return v25;
}

uint64_t __111__HDQuantitySampleValueEnumerator_orderedQuantityValuesBySeriesForPredicate_transaction_options_error_handler___block_invoke_279(uint64_t a1, double a2, double a3, float a4, __n128 a5)
{
  a5.n128_f64[0] = a2;
  if (a4 == -1.0) {
    a5.n128_u64[0] = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  double v7 = -0.0;
  if (a4 != -1.0) {
    double v7 = a4;
  }
  double v8 = v7 + a2;
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v9 + 40);
  char v10 = (*(uint64_t (**)(double, double, double, __n128, double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 96), *(double *)(a1 + 104), a3, a5, v7 + a2);
  objc_storeStrong((id *)(v9 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v10;
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

+ (BOOL)orderedQuantityValuesForPredicate:(id)a3 profile:(id)a4 options:(int64_t)a5 error:(id *)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  uint64_t v14 = [a4 database];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __99__HDQuantitySampleValueEnumerator_orderedQuantityValuesForPredicate_profile_options_error_handler___block_invoke;
  v18[3] = &unk_1E62F4160;
  id v21 = a1;
  int64_t v22 = a5;
  id v19 = v12;
  id v20 = v13;
  id v15 = v13;
  id v16 = v12;
  LOBYTE(a6) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v14 error:a6 block:v18];

  return (char)a6;
}

uint64_t __99__HDQuantitySampleValueEnumerator_orderedQuantityValuesForPredicate_profile_options_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 48) orderedQuantityValuesForPredicate:*(void *)(a1 + 32) transaction:a2 options:*(void *)(a1 + 56) error:a3 handler:*(void *)(a1 + 40)];
}

+ (BOOL)orderedQuantityValuesForPredicate:(id)a3 transaction:(id)a4 options:(int64_t)a5 error:(id *)a6 handler:(id)a7
{
  char v8 = a5;
  id v11 = a3;
  id v32 = a4;
  id v34 = a7;
  uint64_t v28 = v11;
  id v33 = +[HDQuantitySampleValueEnumerator _queryForEnumerationWithPredicate:transaction:options:]((uint64_t)a1, v11, v32, v8 | 2);
  id v12 = +[HDQuantitySampleValueEnumerator _propertiesForEnumeration]();
  uint64_t v31 = [v12 indexOfObject:*MEMORY[0x1E4F65C70]];
  uint64_t v30 = [v12 indexOfObject:@"uuid"];
  uint64_t v29 = [v12 indexOfObject:@"data_type"];
  uint64_t v13 = [v12 indexOfObject:@"quantity"];
  uint64_t v14 = [v12 indexOfObject:@"data_provenances.source_id"];
  uint64_t v15 = [v12 indexOfObject:@"start_date"];
  uint64_t v16 = [v12 indexOfObject:@"end_date"];
  uint64_t v17 = [v12 indexOfObject:@"count"];
  uint64_t v18 = [v12 indexOfObject:@"hfd_key"];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v52 = 0;
  uint64_t v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 1;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __103__HDQuantitySampleValueEnumerator_orderedQuantityValuesForPredicate_transaction_options_error_handler___block_invoke_2;
  v36[3] = &unk_1E6305828;
  uint64_t v42 = v31;
  uint64_t v43 = v30;
  uint64_t v44 = v29;
  uint64_t v45 = v13;
  uint64_t v46 = v15;
  uint64_t v47 = v16;
  uint64_t v48 = v14;
  uint64_t v49 = v17;
  uint64_t v50 = v18;
  id v20 = v32;
  id v37 = v20;
  id v21 = v19;
  id v38 = v21;
  id v39 = &__block_literal_global_165;
  id v51 = a1;
  id v22 = v34;
  id v40 = v22;
  double v41 = &v52;
  if ([v33 enumerateProperties:v12 error:a6 enumerationHandler:v36])
  {
    if (*((unsigned char *)v53 + 24))
    {
      while (1)
      {
        if (!objc_msgSend(v21, "count", v28)) {
          goto LABEL_10;
        }
        id v23 = objc_msgSend(v21, "hk_firstSortedObjectWithComparison:", &__block_literal_global_165);
        [v23 nextDatumTime];
        uint64_t v25 = +[HDQuantitySampleValueEnumerator _enumerateWithEnumerator:endTime:error:handler:](v24, (uint64_t)a1, v23, a6, v22);
        if ([v23 done]) {
          [v21 removeObject:v23];
        }
        if (!v25) {
          break;
        }
        if (v25 == 1)
        {
          BOOL v26 = 1;
          goto LABEL_13;
        }
      }
      BOOL v26 = 0;
LABEL_13:

      goto LABEL_14;
    }
LABEL_10:
    BOOL v26 = 1;
  }
  else
  {
    BOOL v26 = 0;
  }
LABEL_14:

  _Block_object_dispose(&v52, 8);
  return v26;
}

uint64_t __103__HDQuantitySampleValueEnumerator_orderedQuantityValuesForPredicate_transaction_options_error_handler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

BOOL __103__HDQuantitySampleValueEnumerator_orderedQuantityValuesForPredicate_transaction_options_error_handler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = HDSQLiteColumnAsInt64();
  uint64_t v28 = MEMORY[0x1C1879F10](a3, *(void *)(a1 + 80));
  uint64_t v8 = HDSQLiteColumnAsInt64();
  double v9 = MEMORY[0x1C1879F40](a3, *(void *)(a1 + 96));
  double v10 = MEMORY[0x1C1879F40](a3, *(void *)(a1 + 104));
  double v11 = MEMORY[0x1C1879F40](a3, *(void *)(a1 + 112));
  uint64_t v12 = HDSQLiteColumnAsInt64();
  if (MEMORY[0x1C1879FC0](a3, *(void *)(a1 + 128))) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = HDSQLiteColumnAsInt64();
  }
  int v14 = MEMORY[0x1C1879FC0](a3, *(void *)(a1 + 136));
  if (v14)
  {
    uint64_t v15 = v7;
    BOOL v16 = 0;
    while ([*(id *)(a1 + 40) count])
    {
      objc_msgSend(*(id *)(a1 + 40), "hk_firstSortedObjectWithComparison:", *(void *)(a1 + 48));
      uint64_t v17 = (HDQuantitySampleSeriesDataEnumerator *)objc_claimAutoreleasedReturnValue();
      if (!v14 || (double v22 = v10, [*(id *)(a1 + 40) count] != 1))
      {
        [(HDQuantitySampleSeriesDataEnumerator *)v17 nextDatumTime];
        if (v10 >= v23) {
          double v22 = v23;
        }
        else {
          double v22 = v10;
        }
      }
      [(HDQuantitySampleSeriesDataEnumerator *)v17 nextDatumTime];
      if (v22 < v24)
      {

        break;
      }
      unint64_t v25 = +[HDQuantitySampleValueEnumerator _enumerateWithEnumerator:endTime:error:handler:](v22, *(void *)(a1 + 144), v17, a4, *(void **)(a1 + 56));
      if ([(HDQuantitySampleSeriesDataEnumerator *)v17 done]) {
        [*(id *)(a1 + 40) removeObject:v17];
      }
      if (v25 <= 1)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
        goto LABEL_27;
      }
LABEL_15:
    }
    if ((v14 | v16) == 1 && *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      if (v16) {
        uint64_t v27 = 1;
      }
      else {
        uint64_t v27 = v13;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void *, double, double, double, double, double))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v15, v8, v28, v12, v27, 0, a4, v10, v11, v9, v10, v11);
    }
    return *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) != 0;
  }
  else
  {
    uint64_t v15 = v7;
    uint64_t v17 = [[HDQuantitySampleSeriesDataEnumerator alloc] initWithTransaction:*(void *)(a1 + 32) persistentID:v7 dataTypeCode:v8 UUIDBytes:v28 startTime:v13 endTime:v12 count:v10 sourceID:v11 HFDKey:HDSQLiteColumnAsInt64() bufferSize:119];
    id v29 = 0;
    BOOL v18 = [(HDQuantitySampleSeriesDataEnumerator *)v17 primeEnumeratorWithError:&v29];
    id v19 = v29;
    id v20 = v19;
    if (v18)
    {
      BOOL v16 = [(HDQuantitySampleSeriesDataEnumerator *)v17 done];
      if (!v16) {
        [*(id *)(a1 + 40) addObject:v17];
      }

      goto LABEL_15;
    }
    id v21 = v19;
    if (v21)
    {
      if (a4) {
        *a4 = v21;
      }
      else {
        _HKLogDroppedError();
      }
    }

LABEL_27:
    return 0;
  }
}

+ (uint64_t)_enumerateWithEnumerator:(void *)a3 endTime:(void *)a4 error:(void *)a5 handler:
{
  id v8 = a3;
  id v9 = a5;
  self;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  unint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__135;
  uint64_t v28 = __Block_byref_object_dispose__135;
  id v29 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __82__HDQuantitySampleValueEnumerator__enumerateWithEnumerator_endTime_error_handler___block_invoke;
  v18[3] = &unk_1E6305850;
  id v21 = &v34;
  double v22 = &v30;
  id v10 = v9;
  id v20 = v10;
  id v11 = v8;
  id v19 = v11;
  double v23 = &v24;
  int v12 = [v11 enumerateDataToTime:a4 error:v18 handler:a1];
  uint64_t v13 = (void *)v25[5];
  if (!v12)
  {
    if (!v13)
    {
LABEL_11:
      uint64_t v14 = 0;
      goto LABEL_12;
    }
LABEL_7:
    id v15 = v13;
    BOOL v16 = v15;
    if (a4) {
      *a4 = v15;
    }
    else {
      _HKLogDroppedError();
    }

    goto LABEL_11;
  }
  if (v13) {
    goto LABEL_7;
  }
  if (*((unsigned char *)v35 + 24) && !*((unsigned char *)v31 + 24)) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = 3;
  }
LABEL_12:

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v14;
}

uint64_t __82__HDQuantitySampleValueEnumerator__enumerateWithEnumerator_endTime_error_handler___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = [*(id *)(a1 + 32) persistentID];
  uint64_t v12 = [*(id *)(a1 + 32) dataTypeCode];
  uint64_t v13 = [*(id *)(a1 + 32) UUIDBytesPtr];
  [*(id *)(a1 + 32) startTime];
  double v15 = v14;
  [*(id *)(a1 + 32) endTime];
  double v17 = v16;
  uint64_t v18 = [*(id *)(a1 + 32) sourceID];
  uint64_t v19 = [*(id *)(a1 + 32) count];
  uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v20 + 40);
  LOBYTE(a2) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id *, double, double, double, double, double))(v10 + 16))(v10, v11, v12, v13, v18, v19, a2, &obj, v15, v17, a5, a3, a4);
  objc_storeStrong((id *)(v20 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

@end