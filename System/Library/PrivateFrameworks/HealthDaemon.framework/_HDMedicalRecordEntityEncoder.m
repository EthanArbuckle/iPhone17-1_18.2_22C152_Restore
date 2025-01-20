@interface _HDMedicalRecordEntityEncoder
+ (void)_resetConceptIndexDueToError:(void *)a3 profile:;
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (_HDMedicalRecordEntityEncoder)initWithHealthEntityClass:(Class)a3 profile:(id)a4 transaction:(id)a5 purpose:(int64_t)a6 encodingOptions:(id)a7 authorizationFilter:(id)a8;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)orderedProperties;
@end

@implementation _HDMedicalRecordEntityEncoder

- (_HDMedicalRecordEntityEncoder)initWithHealthEntityClass:(Class)a3 profile:(id)a4 transaction:(id)a5 purpose:(int64_t)a6 encodingOptions:(id)a7 authorizationFilter:(id)a8
{
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)_HDMedicalRecordEntityEncoder;
  v15 = [(HDEntityEncoder *)&v18 initWithHealthEntityClass:a3 profile:a4 transaction:a5 purpose:a6 encodingOptions:v14 authorizationFilter:a8];
  if (v15)
  {
    v16 = [v14 objectForKeyedSubscript:@"SkipApplyingConceptIndex"];
    v15->_skipApplyingConceptIndex = [v16 BOOLValue];
  }
  return v15;
}

- (id)orderedProperties
{
  v8[12] = *MEMORY[0x1E4F143B8];
  v8[0] = @"note";
  v8[1] = @"entered_in_error";
  v8[2] = @"modified_date";
  v8[3] = @"fhir_identifier";
  v8[4] = @"original_fhir_resource_rowid";
  v8[5] = @"original_signed_clinical_data_rowid";
  v8[6] = @"locale";
  v8[7] = @"extraction_version";
  v8[8] = @"sort_date";
  v8[9] = @"sort_date_key_path";
  v8[10] = @"country";
  v8[11] = @"state";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:12];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2B1A0]) _init];

  return v3;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v9 = [(_HDMedicalRecordEntityEncoder *)self createBareObjectWithRow:a4];
  if ([(_HDMedicalRecordEntityEncoder *)self applyPropertiesToObject:v9 persistentID:a3 row:a4 error:a5])
  {
    if (self->_skipApplyingConceptIndex)
    {
LABEL_38:
      id v30 = v9;
      goto LABEL_47;
    }
    v10 = [(HDEntityEncoder *)self profile];
    id v43 = 0;
    id v11 = v9;
    id v12 = v10;
    uint64_t v13 = self;
    v42 = v11;
    id v14 = [v11 UUID];
    v15 = +[HDConceptIndexEntity conceptIndexEntriesForSampleUUID:v14 type:0 profile:v12 error:&v43];

    if (v15)
    {
      v41 = [v12 ontologyConceptManager];
      if (![v15 count] || v41)
      {
        if ([v15 count])
        {
          v40 = objc_msgSend(v15, "hk_mapToSet:", &__block_literal_global_176);
          if ([v40 count] == 1)
          {
            id obja = [v40 anyObject];
            v17 = (void *)MEMORY[0x1E4F1CAD0];
            uint64_t v18 = objc_msgSend(v15, "hk_map:", &__block_literal_global_445);
            v19 = [v17 setWithArray:v18];

            uint64_t v55 = 0;
            v56 = &v55;
            uint64_t v57 = 0x3032000000;
            v58 = __Block_byref_object_copy__146;
            v59 = __Block_byref_object_dispose__146;
            id v60 = 0;
            v20 = [v12 ontologyDatabase];
            uint64_t v53 = v13;
            id v54 = 0;
            v48[0] = MEMORY[0x1E4F143A8];
            v48[1] = 3221225472;
            v48[2] = __74___HDMedicalRecordEntityEncoder__applyConceptIndexToObject_profile_error___block_invoke_3;
            v48[3] = &unk_1E6306AA0;
            v52 = &v55;
            id v49 = v15;
            id v35 = v19;
            id v50 = v35;
            id v37 = obja;
            id v51 = v37;
            LOBYTE(v18) = [v20 performTransactionWithError:&v54 transactionHandler:v48];
            id v36 = v54;

            if (v18)
            {
              long long v46 = 0u;
              long long v47 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              id obj = (id)v56[5];
              uint64_t v21 = [obj countByEnumeratingWithState:&v44 objects:buf count:16];
              if (v21)
              {
                uint64_t v22 = *(void *)v45;
                while (2)
                {
                  for (uint64_t i = 0; i != v21; ++i)
                  {
                    if (*(void *)v45 != v22) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v24 = *(void *)(*((void *)&v44 + 1) + 8 * i);
                    v25 = objc_msgSend((id)v56[5], "objectForKeyedSubscript:", v24, v35);
                    LODWORD(v24) = [v42 applyConcepts:v25 forKeyPath:v24 error:&v43];

                    if (!v24)
                    {
                      char v16 = 0;
                      goto LABEL_31;
                    }
                  }
                  uint64_t v21 = [obj countByEnumeratingWithState:&v44 objects:buf count:16];
                  char v16 = 1;
                  if (v21) {
                    continue;
                  }
                  break;
                }
              }
              else
              {
                char v16 = 1;
              }
LABEL_31:
              id v28 = obj;
            }
            else
            {
              if (objc_msgSend(v36, "hk_isHealthKitErrorWithCode:", 1001)) {
                +[_HDMedicalRecordEntityEncoder _resetConceptIndexDueToError:profile:](v13, v36, v12);
              }
              id v28 = v36;
              if (v28)
              {
                id v28 = v28;
                char v16 = 0;
                id v43 = v28;
              }
              else
              {
                char v16 = 0;
              }
            }

            _Block_object_dispose(&v55, 8);
            id v27 = v35;
          }
          else
          {
            v26 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 1001, @"Concept index spans multiple ontology versions.");
            +[_HDMedicalRecordEntityEncoder _resetConceptIndexDueToError:profile:](v13, v26, v12);
            id v27 = v26;
            if (v27)
            {
              id v27 = v27;
              char v16 = 0;
              id v43 = v27;
            }
            else
            {
              char v16 = 0;
            }
            id v37 = v27;
          }
        }
        else
        {
          char v16 = 1;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v43, 3, @"Unable to lookup concepts without an ontology manager");
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }

    id v29 = v43;
    if (v16)
    {

      goto LABEL_38;
    }
    _HKInitializeLogging();
    v31 = *MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349314;
      int64_t v62 = a3;
      __int16 v63 = 2114;
      id v64 = v29;
      _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "Failed to apply concept index to medical record entity with persistent ID %{public}lld: %{public}@", buf, 0x16u);
    }
    id v32 = v29;
    v33 = v32;
    if (v32)
    {
      if (a5) {
        *a5 = v32;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  id v30 = 0;
LABEL_47:

  return v30;
}

+ (void)_resetConceptIndexDueToError:(void *)a3 profile:
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  self;
  _HKInitializeLogging();
  v6 = HKLogHealthOntology();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = HKSensitiveLogItem();
    int v9 = 138543362;
    v10 = v8;
    _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Resetting concept index due to error %{public}@", (uint8_t *)&v9, 0xCu);
  }
  v7 = [v5 conceptIndexManager];

  [v7 resetWithReindex];
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = [(HDEntityEncoder *)self superclassEncoder];
  LODWORD(a4) = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  if (a4)
  {
    id v12 = HDSQLiteColumnWithNameAsString();
    [v10 _setNote:v12];

    [v10 _setEnteredInError:HDSQLiteColumnWithNameAsBoolean()];
    uint64_t v13 = HDSQLiteColumnWithNameAsDate();
    [v10 _setModifiedDate:v13];

    [v10 _setExtractionVersion:HDSQLiteColumnWithNameAsInt64()];
    id v14 = HDSQLiteColumnWithNameAsString();
    id v39 = 0;
    v15 = [MEMORY[0x1E4F2AFC8] FHIRIdentifierWithString:v14 error:&v39];
    id v16 = v39;
    v38 = v16;
    if (v15)
    {
      v17 = (void *)[objc_alloc(MEMORY[0x1E4F2B1A8]) initWithFHIRIdentifier:v15];
      [v10 _setOriginIdentifier:v17];
LABEL_4:

      HDSQLiteColumnWithNameAsString();
      uint64_t v18 = (HDOriginalSignedClinicalDataRecordEntity *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:v18];
        [v10 _setLocale:v19];
      }
      v20 = HDSQLiteColumnWithNameAsDate();
      uint64_t v21 = HDSQLiteColumnWithNameAsString();
      uint64_t v22 = (void *)v21;
      if (v20 && v21)
      {
        v23 = [MEMORY[0x1E4F2B478] semanticDateWithKeyPath:v21 date:v20];
        [v10 _setSortDate:v23];
      }
      uint64_t v24 = HDSQLiteColumnWithNameAsString();
      if (v24)
      {
        [v10 _setCountry:v24];
      }
      else
      {
        _HKInitializeLogging();
        v31 = *MEMORY[0x1E4F29F38];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "Attempting to apply properties to HDMedicalRecord, but country was nil", buf, 2u);
        }
      }
      [v10 _setState:HDSQLiteColumnWithNameAsInt64()];

      BOOL v25 = 1;
      goto LABEL_18;
    }
    v26 = v16;
    uint64_t v27 = HDSQLiteColumnWithNameAsInt64();
    if (v27 < 1)
    {
      _HKInitializeLogging();
      v33 = (void *)*MEMORY[0x1E4F29F38];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR))
      {
        id v35 = v33;
        id v36 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v41 = v36;
        __int16 v42 = 2114;
        id v43 = v26;
        id v37 = v36;
        _os_log_error_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_ERROR, "%{public}@ invalid origin identifier, error: %{public}@", buf, 0x16u);
      }
      v34 = v26;
      uint64_t v18 = v34;
      if (v34)
      {
        if (a6)
        {
          uint64_t v18 = v34;
          BOOL v25 = 0;
          *a6 = v18;
LABEL_18:

          goto LABEL_19;
        }
        _HKLogDroppedError();
      }
    }
    else
    {
      uint64_t v28 = v27;
      uint64_t v18 = [(HDSQLiteEntity *)[HDOriginalSignedClinicalDataRecordEntity alloc] initWithPersistentID:v27];
      id v29 = [(HDEntityEncoder *)self database];
      v17 = [(HDSQLiteEntity *)v18 UUIDForProperty:@"sync_identifier" database:v29];

      if (v17)
      {

        id v30 = (void *)[objc_alloc(MEMORY[0x1E4F2B1A8]) initWithSignedClinicalDataRecordIdentifier:v17];
        [v10 _setOriginIdentifier:v30];

        goto LABEL_4;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a6, 100, @"There is no original signed clinical data record with persistent id %lld", v28);
    }
    BOOL v25 = 0;
    goto LABEL_18;
  }
  BOOL v25 = 0;
LABEL_19:

  return v25;
}

@end