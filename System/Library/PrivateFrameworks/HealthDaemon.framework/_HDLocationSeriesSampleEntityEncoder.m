@interface _HDLocationSeriesSampleEntityEncoder
- (BOOL)_enumerateCodableSeries:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 handler:;
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (BOOL)generateCodableRepresentationsForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 maxBytesPerRepresentation:(int64_t)a5 error:(id *)a6 handler:(id)a7;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)orderedProperties;
@end

@implementation _HDLocationSeriesSampleEntityEncoder

- (id)orderedProperties
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"frozen";
  v8[1] = @"count";
  v8[2] = @"hfd_key";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v9 = [(HDEntityEncoder *)self superclassEncoder];
  v10 = [v9 codableRepresentationForPersistentID:a3 row:a4 error:a5];

  if (v10)
  {
    v11 = objc_alloc_init(HDCodableLocationSeries);
    [(HDCodableLocationSeries *)v11 setSample:v10];
    [(HDCodableLocationSeries *)v11 setFrozen:HDSQLiteColumnWithNameAsBoolean()];
    v12 = HDSQLiteColumnWithNameAsNumber();
    v13 = [(HDEntityEncoder *)self transaction];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __87___HDLocationSeriesSampleEntityEncoder_codableRepresentationForPersistentID_row_error___block_invoke;
    v19[3] = &unk_1E63042C0;
    v14 = v11;
    v20 = v14;
    BOOL v15 = -[_HDLocationSeriesSampleEntityEncoder _enumerateCodableSeries:transaction:error:handler:]((uint64_t)self, v12, v13, (uint64_t)a5, v19);

    if (v15) {
      v16 = v14;
    }
    else {
      v16 = 0;
    }
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)_enumerateCodableSeries:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 handler:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1)
  {
    uint64_t v12 = [v9 longLongValue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __90___HDLocationSeriesSampleEntityEncoder__enumerateCodableSeries_transaction_error_handler___block_invoke;
    v15[3] = &unk_1E63041A8;
    id v16 = v11;
    BOOL v13 = +[HDLocationSeriesDataEntity enumerateSeries:v12 transaction:v10 error:a4 handler:v15];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)generateCodableRepresentationsForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 maxBytesPerRepresentation:(int64_t)a5 error:(id *)a6 handler:(id)a7
{
  id v13 = a7;
  v14 = [(HDEntityEncoder *)self superclassEncoder];
  BOOL v15 = [v14 codableRepresentationForPersistentID:a3 row:a4 error:a6];

  if (v15)
  {
    SEL v33 = a2;
    uint64_t v16 = HDSQLiteColumnWithNameAsBoolean();
    uint64_t v17 = [v15 encodedByteCount];
    HDSQLiteColumnWithNameAsNumber();
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2020000000;
    uint64_t v61 = v17;
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__125;
    v34 = v56 = __Block_byref_object_dispose__125;
    v57 = objc_alloc_init(HDCodableLocationSeries);
    [(id)v53[5] setSample:v15];
    [(id)v53[5] setFrozen:v16];
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__125;
    v50 = __Block_byref_object_dispose__125;
    id v51 = 0;
    v18 = [(HDEntityEncoder *)self transaction];
    id v45 = 0;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __130___HDLocationSeriesSampleEntityEncoder_generateCodableRepresentationsForPersistentID_row_maxBytesPerRepresentation_error_handler___block_invoke;
    v36[3] = &unk_1E63042E8;
    v39 = &v58;
    int64_t v42 = a5;
    id v19 = v13;
    id v38 = v19;
    v40 = &v52;
    v41 = &v46;
    char v44 = v16;
    id v37 = v15;
    uint64_t v43 = v17;
    LOBYTE(v16) = -[_HDLocationSeriesSampleEntityEncoder _enumerateCodableSeries:transaction:error:handler:]((uint64_t)self, v34, v18, (uint64_t)&v45, v36);
    id v20 = v45;

    if (v16 & 1) != 0 || (objc_msgSend(v20, "hk_isHealthKitErrorWithCode:", 1100))
    {
      v22 = (id *)(v47 + 5);
      v21 = (void *)v47[5];
      if (!v21)
      {
        uint64_t v25 = v53[5];
        if (!v25
          || (uint64_t v26 = v59[3],
              id obj = 0,
              uint64_t v27 = (*((uint64_t (**)(id, uint64_t, uint64_t, uint64_t, id *))v19 + 2))(v19, v25, v26, 1, &obj),
              objc_storeStrong(v22, obj),
              !v27))
        {
          BOOL v24 = 1;
          goto LABEL_17;
        }
        v28 = (void *)v47[5];
        if (v28)
        {
          id v23 = v28;
        }
        else
        {
          uint64_t v31 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), v33, @"Failed to lookup HFD series for location sample."");
          v32 = (void *)v47[5];
          v47[5] = v31;

          id v23 = (id)v47[5];
          if (!v23) {
            goto LABEL_16;
          }
        }
        if (!a6)
        {
          _HKLogDroppedError();
          goto LABEL_16;
        }
        id v29 = v23;
        id v23 = v29;
        goto LABEL_15;
      }
      id v23 = v21;
      if (!a6) {
        goto LABEL_6;
      }
    }
    else
    {
      id v23 = v20;
      if (!v23) {
        goto LABEL_16;
      }
      if (!a6)
      {
LABEL_6:
        _HKLogDroppedError();
LABEL_16:

        BOOL v24 = 0;
LABEL_17:

        _Block_object_dispose(&v46, 8);
        _Block_object_dispose(&v52, 8);

        _Block_object_dispose(&v58, 8);
        goto LABEL_18;
      }
    }
    id v29 = v23;
LABEL_15:
    *a6 = v29;
    goto LABEL_16;
  }
  BOOL v24 = 0;
LABEL_18:

  return v24;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  int v9 = HDSQLiteColumnWithName();
  if (MEMORY[0x1C1879FC0](a4, v9))
  {
    id v10 = 0;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F2B448] dataTypeWithCode:HDSQLiteColumnAsInt64()];
  }
  id v11 = objc_msgSend(objc_alloc((Class)objc_msgSend(v10, "dataObjectClass")), "_init");
  if ([(_HDLocationSeriesSampleEntityEncoder *)self applyPropertiesToObject:v11 persistentID:a3 row:a4 error:a5])
  {
    id v12 = v11;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = [(HDEntityEncoder *)self superclassEncoder];
  char v12 = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  if (v12)
  {
    [v10 _setFrozen:HDSQLiteColumnWithNameAsBoolean()];
    [v10 _setCount:HDSQLiteColumnWithNameAsInt64()];
  }

  return v12;
}

@end