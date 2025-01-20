@interface _HDDataEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (_HDDataEntityEncoder)initWithHealthEntityClass:(Class)a3 profile:(id)a4 transaction:(id)a5 purpose:(int64_t)a6 encodingOptions:(id)a7 authorizationFilter:(id)a8;
- (id)_copyBaseMetadataForRow:(uint64_t)a1;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)orderedProperties;
- (void)finish;
@end

@implementation _HDDataEntityEncoder

- (id)orderedProperties
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v7[0] = @"uuid";
  v7[1] = @"provenance";
  v7[2] = @"creation_date";
  v7[3] = @"external_sync_ids.object_code";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  v4 = v3;
  if (self->_includeAutomaticTimeZones)
  {
    uint64_t v5 = [v3 arrayByAddingObject:@"data_provenances.tz_name"];

    v4 = (void *)v5;
  }

  return v4;
}

- (id)_copyBaseMetadataForRow:(uint64_t)a1
{
  if (!a1 || !*(unsigned char *)(a1 + 96)) {
    return 0;
  }
  v1 = HDSQLiteColumnWithNameAsString();
  if ([v1 length])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v2 setObject:v1 forKeyedSubscript:*MEMORY[0x1E4F2BAC0]];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (void)finish
{
  [(HDSQLiteStatement *)self->_metadataValueStatement finish];
  v3.receiver = self;
  v3.super_class = (Class)_HDDataEntityEncoder;
  [(HDEntityEncoder *)&v3 finish];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_metadataKeyFilter, 0);
  objc_storeStrong((id *)&self->_dataProvenanceCache, 0);

  objc_storeStrong((id *)&self->_metadataValueStatement, 0);
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v8 = [(HDEntityEncoder *)self profile];
  v9 = [v8 metadataManager];

  id v10 = -[_HDDataEntityEncoder _copyBaseMetadataForRow:]((uint64_t)self);
  v11 = [v9 metadataForObjectID:a3 baseMetadata:v10 keyFilter:self->_metadataKeyFilter statement:self->_metadataValueStatement error:a5];

  if (v11)
  {
    v12 = objc_alloc_init(HDCodableHealthObject);
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableHealthObject setCreationDate:](v12, "setCreationDate:");
    v13 = HDSQLiteColumnWithNameAsData();
    [(HDCodableHealthObject *)v12 setUuid:v13];

    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0) {
      [(HDCodableHealthObject *)v12 setExternalSyncObjectCode:HDSQLiteColumnWithNameAsInt64()];
    }
    if ([v11 count])
    {
      v14 = objc_msgSend(v11, "hk_codableMetadata");
      [(HDCodableHealthObject *)v12 setMetadataDictionary:v14];
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (_HDDataEntityEncoder)initWithHealthEntityClass:(Class)a3 profile:(id)a4 transaction:(id)a5 purpose:(int64_t)a6 encodingOptions:(id)a7 authorizationFilter:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)_HDDataEntityEncoder;
  v17 = [(HDEntityEncoder *)&v28 initWithHealthEntityClass:a3 profile:v14 transaction:v15 purpose:a6 encodingOptions:v16 authorizationFilter:a8];
  if (v17)
  {
    uint64_t v18 = +[HDMetadataValueStatement metadataValueStatementWithTransaction:v15];
    metadataValueStatement = v17->_metadataValueStatement;
    v17->_metadataValueStatement = (HDMetadataValueStatement *)v18;

    v20 = [[HDDataProvenanceCache alloc] initWithProfile:v14 transaction:v15 purpose:a6];
    dataProvenanceCache = v17->_dataProvenanceCache;
    v17->_dataProvenanceCache = v20;

    v22 = [v16 objectForKeyedSubscript:@"IncludeAutomaticTimeZone"];
    v17->_includeAutomaticTimeZones = [v22 BOOLValue];

    v23 = [v16 objectForKeyedSubscript:@"IncludeContributorInformation"];
    v17->_includeContributorInformation = [v23 BOOLValue];

    v24 = [v16 objectForKeyedSubscript:@"ExcludePrivateMetadata"];
    int v25 = [v24 BOOLValue];

    if (v25)
    {
      id metadataKeyFilter = v17->_metadataKeyFilter;
      v17->_id metadataKeyFilter = &__block_literal_global_690;
    }
  }

  return v17;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F2B298]) _init];
  if ([(_HDDataEntityEncoder *)self applyPropertiesToObject:v9 persistentID:a3 row:a4 error:a5])
  {
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"HDDataEntity.m", 1597, @"Invalid parameter not satisfying: %@", @"[object isKindOfClass:[HKObject class]]" object file lineNumber description];
  }
  HDSQLiteColumnWithNameAsDouble();
  objc_msgSend(v9, "_setCreationTimestamp:");
  id v10 = HDSQLiteColumnWithNameAsUUID();
  [v9 _setUUID:v10];

  v11 = [NSNumber numberWithLongLong:HDSQLiteColumnWithNameAsInt64()];
  v12 = [(HDDataProvenanceCache *)self->_dataProvenanceCache provenanceWithID:v11];
  v13 = [(HDEntityEncoder *)self profile];
  dataProvenanceCache = self->_dataProvenanceCache;
  id v49 = 0;
  uint64_t v15 = [(HDDataProvenanceCache *)dataProvenanceCache sourceRevisionForProvenanceID:v11 dataProvenance:v12 profile:v13 error:&v49];
  id v16 = v49;
  v44 = (void *)v15;
  v45 = v12;
  if (v15)
  {
    v42 = a6;
    [v9 _setSourceRevision:v15];
    id v17 = [v12 deviceID];
    if (v17)
    {
      uint64_t v18 = self->_dataProvenanceCache;
      id v48 = v16;
      v19 = [(HDDataProvenanceCache *)v18 deviceForPersistentID:v17 profile:v13 error:&v48];
      id v20 = v48;

      if (!v19 && v20)
      {
        _HKInitializeLogging();
        v21 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v51 = v20;
          _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "Expected device not found. %{public}@", buf, 0xCu);
        }
        v22 = v42;
        if (v42)
        {
          v23 = v20;
LABEL_26:
          id v20 = v23;
          BOOL v26 = 0;
          id *v22 = v20;
          goto LABEL_47;
        }
        _HKLogDroppedError();
LABEL_42:
        BOOL v26 = 0;
        goto LABEL_47;
      }
      [v9 _setDevice:v19];

      v12 = v45;
    }
    else
    {
      id v20 = v16;
    }
    if (self->_includeContributorInformation)
    {
      v27 = self->_dataProvenanceCache;
      objc_super v28 = [v12 contributorReference];
      id v47 = v20;
      v29 = [(HDDataProvenanceCache *)v27 contributorForReference:v28 profile:v13 error:&v47];
      id v30 = v47;

      if (!v29 && v30)
      {
        _HKInitializeLogging();
        v31 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v51 = v30;
          _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "Expected contributor not found. %{public}@", buf, 0xCu);
        }
        v22 = v42;
        if (!v42)
        {
          _HKLogDroppedError();
          BOOL v26 = 0;
          id v20 = v30;
          goto LABEL_47;
        }
        v23 = v30;
        goto LABEL_26;
      }
      if (v29) {
        [v9 _setContributor:v29];
      }
    }
    else
    {
      id v30 = v20;
    }
    v32 = [v13 metadataManager];
    id v33 = -[_HDDataEntityEncoder _copyBaseMetadataForRow:]((uint64_t)self);
    id metadataKeyFilter = self->_metadataKeyFilter;
    metadataValueStatement = self->_metadataValueStatement;
    id v46 = v30;
    v36 = [v32 metadataForObjectID:a4 baseMetadata:v33 keyFilter:metadataKeyFilter statement:metadataValueStatement error:&v46];
    id v20 = v46;

    BOOL v26 = v36 != 0;
    if (v36)
    {
      if ([v36 count]) {
        [v9 _setMetadata:v36];
      }
    }
    else
    {
      _HKInitializeLogging();
      v37 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v51 = v20;
        _os_log_error_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_ERROR, "Error retrieving metadata: %{public}@", buf, 0xCu);
      }
      id v38 = v20;
      v39 = v38;
      if (v38)
      {
        if (v42) {
          id *v42 = v38;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v24 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v51 = v16;
      _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "sourceRevision not found. %{public}@", buf, 0xCu);
    }
    id v25 = v16;
    id v17 = v25;
    if (!v25)
    {
      id v20 = 0;
      goto LABEL_42;
    }
    if (a6)
    {
      id v17 = v25;
      BOOL v26 = 0;
      *a6 = v17;
    }
    else
    {
      _HKLogDroppedError();
      BOOL v26 = 0;
    }
    id v20 = v17;
  }
LABEL_47:

  return v26;
}

@end