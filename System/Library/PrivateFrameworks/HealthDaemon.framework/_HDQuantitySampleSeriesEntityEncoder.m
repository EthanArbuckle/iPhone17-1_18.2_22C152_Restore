@interface _HDQuantitySampleSeriesEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (BOOL)generateCodableRepresentationsForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 maxBytesPerRepresentation:(int64_t)a5 error:(id *)a6 handler:(id)a7;
- (id)_codableQuantitySampleForPersistentID:(uint64_t)a3 row:(uint64_t)a4 error:;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)orderedProperties;
@end

@implementation _HDQuantitySampleSeriesEntityEncoder

- (id)orderedProperties
{
  v8[8] = *MEMORY[0x1E4F143B8];
  v8[0] = @"count";
  v8[1] = @"insertion_era";
  v8[2] = @"hfd_key";
  v8[3] = @"min";
  v8[4] = @"max";
  v8[5] = @"most_recent";
  v8[6] = @"most_recent_date";
  v8[7] = @"most_recent_duration";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:8];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  int v9 = HDSQLiteColumnWithName();
  if (MEMORY[0x1C1879FC0](a4, v9))
  {
    v10 = 0;
  }
  else
  {
    v10 = [MEMORY[0x1E4F2B3B8] dataTypeWithCode:HDSQLiteColumnAsInt64()];
  }
  v11 = objc_msgSend(objc_alloc((Class)objc_msgSend(v10, "dataObjectClass")), "_init");
  if ([(_HDQuantitySampleSeriesEntityEncoder *)self applyPropertiesToObject:v11 persistentID:a3 row:a4 error:a5])
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
  v11 = [(HDEntityEncoder *)self superclassEncoder];
  char v12 = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  if ((v12 & 1) != 0 && (HDSQLiteColumnWithNameIsNull() & 1) == 0)
  {
    [v10 _setCount:HDSQLiteColumnWithNameAsInt64()];
    [v10 _setFrozen:HDSQLiteColumnWithNameIsNull()];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v10;
      v14 = [v13 quantity];
      v15 = [v14 _unit];

      uint64_t v16 = (int)HDSQLiteColumnWithName();
      if ((MEMORY[0x1C1879FC0](a5, v16) & 1) == 0)
      {
        v17 = (void *)MEMORY[0x1E4F2B370];
        MEMORY[0x1C1879F40](a5, v16);
        v18 = objc_msgSend(v17, "quantityWithUnit:doubleValue:", v15);
        [v13 _setMinimumQuantity:v18];
      }
      uint64_t v19 = (int)HDSQLiteColumnWithName();
      if ((MEMORY[0x1C1879FC0](a5, v19) & 1) == 0)
      {
        v20 = (void *)MEMORY[0x1E4F2B370];
        MEMORY[0x1C1879F40](a5, v19);
        v21 = objc_msgSend(v20, "quantityWithUnit:doubleValue:", v15);
        [v13 _setMaximumQuantity:v21];
      }
      uint64_t v22 = (int)HDSQLiteColumnWithName();
      if ((MEMORY[0x1C1879FC0](a5, v22) & 1) == 0)
      {
        v23 = (void *)MEMORY[0x1E4F2B370];
        MEMORY[0x1C1879F40](a5, v22);
        v24 = objc_msgSend(v23, "quantityWithUnit:doubleValue:", v15);
        [v13 _setMostRecentQuantity:v24];
      }
      v25 = HDSQLiteColumnWithNameAsDate();
      if (v25)
      {
        uint64_t v26 = (int)HDSQLiteColumnWithName();
        double v27 = 0.0;
        if ((MEMORY[0x1C1879FC0](a5, v26) & 1) == 0) {
          double v27 = MEMORY[0x1C1879F40](a5, v26);
        }
        v28 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v25 duration:v27];
        [v13 _setMostRecentQuantityDateInterval:v28];
      }
    }
  }

  return v12;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  int v9 = HDSQLiteColumnWithNameAsNumber();
  if (v9)
  {
    id v10 = -[_HDQuantitySampleSeriesEntityEncoder _codableQuantitySampleForPersistentID:row:error:](self, a3, (uint64_t)a4, (uint64_t)a5);
    uint64_t v11 = [v9 longLongValue];
    id v12 = v10;
    id v13 = v12;
    if (self)
    {
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x2020000000;
      uint64_t v30 = 0;
      v14 = [(HDEntityEncoder *)self transaction];
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __78___HDQuantitySampleSeriesEntityEncoder_addSeriesDataForHFDKey_toSample_error___block_invoke;
      v24 = &unk_1E6304520;
      uint64_t v26 = &v27;
      id v15 = v13;
      id v25 = v15;
      BOOL v16 = +[HDQuantitySeriesDataEntity enumerateSeries:v11 transaction:v14 error:a5 handler:&v21];

      if (v16)
      {
        objc_msgSend(v15, "setCount:", v28[3], v21, v22, v23, v24);
        [v15 setFinal:1];
        v17 = v15;
      }
      else
      {
        v17 = 0;
      }

      _Block_object_dispose(&v27, 8);
    }
    else
    {

      v17 = 0;
    }
    id v18 = v17;
  }
  else
  {
    id v13 = [(HDEntityEncoder *)self superclassEncoder];
    id v18 = [v13 codableRepresentationForPersistentID:a3 row:a4 error:a5];
  }
  uint64_t v19 = v18;

  return v19;
}

- (id)_codableQuantitySampleForPersistentID:(uint64_t)a3 row:(uint64_t)a4 error:
{
  if (a1)
  {
    v7 = [a1 superclassEncoder];
    v8 = [v7 codableRepresentationForPersistentID:a2 row:a3 error:a4];

    if (v8)
    {
      [v8 setFrozen:HDSQLiteColumnWithNameIsNull()];
      uint64_t v9 = (int)HDSQLiteColumnWithName();
      if ((MEMORY[0x1C1879FC0](a3, v9) & 1) == 0)
      {
        MEMORY[0x1C1879F40](a3, v9);
        objc_msgSend(v8, "setMin:");
      }
      uint64_t v10 = (int)HDSQLiteColumnWithName();
      if ((MEMORY[0x1C1879FC0](a3, v10) & 1) == 0)
      {
        MEMORY[0x1C1879F40](a3, v10);
        objc_msgSend(v8, "setMax:");
      }
      uint64_t v11 = (int)HDSQLiteColumnWithName();
      if ((MEMORY[0x1C1879FC0](a3, v11) & 1) == 0)
      {
        MEMORY[0x1C1879F40](a3, v11);
        objc_msgSend(v8, "setMostRecent:");
      }
      uint64_t v12 = (int)HDSQLiteColumnWithName();
      if ((MEMORY[0x1C1879FC0](a3, v12) & 1) == 0)
      {
        MEMORY[0x1C1879F40](a3, v12);
        objc_msgSend(v8, "setMostRecentDate:");
      }
      uint64_t v13 = (int)HDSQLiteColumnWithName();
      if ((MEMORY[0x1C1879FC0](a3, v13) & 1) == 0)
      {
        MEMORY[0x1C1879F40](a3, v13);
        objc_msgSend(v8, "setMostRecentDuration:");
      }
      id v14 = v8;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)generateCodableRepresentationsForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 maxBytesPerRepresentation:(int64_t)a5 error:(id *)a6 handler:(id)a7
{
  id v12 = a7;
  uint64_t v13 = HDSQLiteColumnWithNameAsNumber();
  if (v13)
  {
    v37 = v13;
    v36 = -[_HDQuantitySampleSeriesEntityEncoder _codableQuantitySampleForPersistentID:row:error:](self, a3, (uint64_t)a4, (uint64_t)a6);
    uint64_t v14 = [v13 longLongValue];
    id v15 = v36;
    id v39 = v12;
    if (!self)
    {
      char v32 = 0;
      goto LABEL_24;
    }
    id v38 = v15;
    BOOL v16 = [v15 data];
    uint64_t v17 = [v16 length];

    id v18 = [(HDEntityEncoder *)self transaction];
    v76[0] = 0;
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __127___HDQuantitySampleSeriesEntityEncoder_generateCodableRepresentationsForHFDKey_sample_maxBytesPerRepresentation_error_handler___block_invoke;
    v74[3] = &unk_1E6304548;
    id v19 = v15;
    id v75 = v19;
    BOOL v20 = +[HDQuantitySeriesDataEntity getRangeAndCountForSeriesIdentifier:v14 transaction:v18 error:v76 handler:v74];
    id v21 = v76[0];

    if (!v20)
    {
      id v33 = v21;
      id v25 = v33;
      uint64_t v13 = v37;
      id v15 = v38;
      if (v33)
      {
        if (a6) {
          *a6 = v33;
        }
        else {
          _HKLogDroppedError();
        }
      }

      char v32 = 0;
      goto LABEL_23;
    }
    uint64_t v68 = 0;
    v69 = &v68;
    uint64_t v70 = 0x3032000000;
    v71 = __Block_byref_object_copy__126;
    v72 = __Block_byref_object_dispose__126;
    id v73 = (id)[v19 copy];
    uint64_t v64 = 0;
    v65 = &v64;
    uint64_t v66 = 0x2020000000;
    uint64_t v67 = v17;
    uint64_t v60 = 0;
    v61 = &v60;
    uint64_t v62 = 0x2020000000;
    char v63 = 1;
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x2020000000;
    char v59 = 0;
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__126;
    v56 = __Block_byref_object_dispose__126;
    id v57 = 0;
    uint64_t v22 = [(HDEntityEncoder *)self transaction];
    id v51 = v21;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __127___HDQuantitySampleSeriesEntityEncoder_generateCodableRepresentationsForHFDKey_sample_maxBytesPerRepresentation_error_handler___block_invoke_2;
    v41[3] = &unk_1E6304570;
    v44 = &v64;
    v45 = &v68;
    int64_t v49 = a5;
    v46 = v58;
    id v23 = v39;
    id v43 = v23;
    v47 = &v52;
    v48 = &v60;
    id v42 = v19;
    uint64_t v50 = v17;
    BOOL v24 = +[HDQuantitySeriesDataEntity enumerateSeries:v14 transaction:v22 error:&v51 handler:v41];
    id v25 = v51;

    id v15 = v38;
    if (v24)
    {
      uint64_t v13 = v37;
      if (*((unsigned char *)v61 + 24))
      {
        uint64_t v26 = (void *)v69[5];
        if (!v26) {
          goto LABEL_8;
        }
        [v26 setFinal:1];
        uint64_t v27 = v69[5];
        uint64_t v28 = v65[3];
        uint64_t v29 = (id *)(v53 + 5);
        id obj = (id)v53[5];
        uint64_t v30 = (*((uint64_t (**)(id, uint64_t, uint64_t, uint64_t, id *))v23 + 2))(v23, v27, v28, 1, &obj);
        objc_storeStrong(v29, obj);
        BOOL v31 = v30 == 2;
        *((unsigned char *)v61 + 24) = v30 != 2;
        id v15 = v38;
        if (!v31)
        {
LABEL_8:
          char v32 = 1;
LABEL_20:

          _Block_object_dispose(&v52, 8);
          _Block_object_dispose(v58, 8);
          _Block_object_dispose(&v60, 8);
          _Block_object_dispose(&v64, 8);
          _Block_object_dispose(&v68, 8);

LABEL_23:
LABEL_24:

          goto LABEL_25;
        }
      }
      id v34 = (id)v53[5];
      if (v34)
      {
        if (!a6)
        {
          _HKLogDroppedError();
          goto LABEL_19;
        }
        goto LABEL_18;
      }
    }
    else
    {
      id v34 = v25;
      uint64_t v13 = v37;
      if (v34)
      {
        if (a6)
        {
LABEL_18:
          id v34 = v34;
          *a6 = v34;
          goto LABEL_19;
        }
        _HKLogDroppedError();
      }
    }
LABEL_19:

    char v32 = 0;
    goto LABEL_20;
  }
  id v15 = [(HDEntityEncoder *)self superclassEncoder];
  char v32 = [v15 generateCodableRepresentationsForPersistentID:a3 row:a4 maxBytesPerRepresentation:a5 error:a6 handler:v12];
LABEL_25:

  return v32;
}

@end