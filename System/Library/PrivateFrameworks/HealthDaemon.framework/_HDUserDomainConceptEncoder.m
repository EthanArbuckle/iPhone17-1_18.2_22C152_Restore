@interface _HDUserDomainConceptEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDUserDomainConceptEncoder

- (id)orderedProperties
{
  int64_t v2 = [(HDEntityEncoder *)self purpose];
  v3 = &unk_1F17EACC8;
  if (!v2) {
    v3 = &unk_1F17EACB0;
  }
  id v4 = v3;

  return v4;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2B630]) _initBareObject];

  return v3;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v8 = a3;
  v9 = [(HDEntityEncoder *)self transaction];
  id v10 = v8;
  id v35 = v9;
  v31 = self;
  uint64_t v11 = HDSQLiteColumnWithNameAsUUID();
  uint64_t v12 = HDSQLiteColumnWithNameAsString();
  uint64_t v13 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v14 = HDSQLiteColumnWithNameAsBoolean();
  HDSQLiteColumnWithNameAsDouble();
  double v16 = v15;
  HDSQLiteColumnWithNameAsDouble();
  double v18 = v17;
  v36 = (void *)HDSQLiteColumnWithNameAsInt64();
  v19 = (void *)HDSQLiteColumnWithNameAsInt64();
  v20 = (void *)HDSQLiteColumnWithNameAsInt64();
  v21 = HDSQLiteColumnWithNameAsString();
  uint64_t v22 = HDSQLiteColumnWithNameAsInt64();
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F2B690]) initWithCode:v13 schema:v12];
  [v10 _setIdentifier:v23];

  v34 = (void *)v11;
  [v10 _setUUID:v11];
  [v10 _setDeleted:v14];
  [v10 _setCreationTimestamp:v16];
  [v10 _setModificationTimestamp:v18];
  v37[0] = v36;
  v37[1] = v19;
  v37[2] = v20;
  [v10 _setOperatingSystemVersion:v37];
  [v10 _setBuild:v21];
  objc_msgSend(v10, "setHealthd_use_only_syncEntityIdentity:", v22);
  if (v14)
  {
    LOBYTE(v24) = 1;
    v26 = (void *)v11;
    v25 = v35;
    v27 = (void *)v12;
  }
  else
  {
    v37[0] = 0;
    int v24 = +[HDUserDomainConceptEntity _inflateLinkCollection:row:error:]((uint64_t)v31, v37, (uint64_t)a5, (uint64_t)a6);
    id v28 = v37[0];
    v29 = v28;
    if (v24)
    {
      if (v28) {
        [v10 _setLinkCollection:v28];
      }
      v25 = v35;
      LOBYTE(v24) = objc_msgSend(v31, "retrievePrivateDataEntitiesForUserDomainConcept:persistentID:transaction:error:", v10, a4, v35, a6, v31);
    }
    else
    {
      v25 = v35;
    }
    v27 = (void *)v12;
    v26 = v34;
  }
  return v24;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v8 = [(HDEntityEncoder *)self profile];
  v9 = [(HDEntityEncoder *)self transaction];
  id v53 = v8;
  id v10 = v9;
  uint64_t v11 = self;
  uint64_t v12 = objc_alloc_init(HDCodableUserDomainConcept);
  uint64_t v13 = HDSQLiteColumnWithNameAsData();
  [(HDCodableUserDomainConcept *)v12 setUuid:v13];

  uint64_t v14 = HDSQLiteColumnWithNameAsInt64();
  v52 = HDSQLiteColumnWithNameAsString();
  v51 = (void *)[objc_alloc(MEMORY[0x1E4F2B690]) initWithCode:v14 schema:v52];
  double v15 = [v51 codableRepresentationForSync];
  [(HDCodableUserDomainConcept *)v12 setIdentifier:v15];

  [(HDCodableUserDomainConcept *)v12 setDeleted:HDSQLiteColumnWithNameAsBoolean()];
  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableUserDomainConcept setCreationDate:](v12, "setCreationDate:");
  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableUserDomainConcept setModificationDate:](v12, "setModificationDate:");
  [(HDCodableUserDomainConcept *)v12 setMajorVersion:HDSQLiteColumnWithNameAsInt64()];
  [(HDCodableUserDomainConcept *)v12 setMinorVersion:HDSQLiteColumnWithNameAsInt64()];
  [(HDCodableUserDomainConcept *)v12 setPatchVersion:HDSQLiteColumnWithNameAsInt64()];
  double v16 = HDSQLiteColumnWithNameAsString();
  [(HDCodableUserDomainConcept *)v12 setBuild:v16];

  double v17 = HDSQLiteColumnWithNameAsData();
  [(HDCodableUserDomainConcept *)v12 setLinksData:v17];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v18 = [v11 privateDataEntities];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v54 objects:v79 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v55;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v55 != v20) {
          objc_enumerationMutation(v18);
        }
        if (![*(id *)(*((void *)&v54 + 1) + 8 * i) addPropertyDataToCodable:v12 userDomainConceptID:a3 transaction:v10 error:a5])
        {
          v37 = 0;
          goto LABEL_39;
        }
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v54 objects:v79 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }

  uint64_t v22 = [v53 daemon];
  v23 = [v22 userDomainConceptEntityRegistry];
  int v24 = (void *)[v23 userDomainConceptEntityClassForTypeIdentifier:v51];

  if (!v24
    || v24 == objc_opt_class()
    || ![v24 encodesCodableUserDomainConceptSubclassData])
  {
    goto LABEL_33;
  }
  id v25 = v10;
  id v26 = v53;
  self;
  v27 = [v24 entityEncoderForProfile:v26 transaction:v25 purpose:0 encodingOptions:0 authorizationFilter:0];

  id v28 = v27;
  id v29 = v25;
  self;
  v49 = (objc_class *)[v28 entityClass];
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__185;
  v77 = __Block_byref_object_dispose__185;
  id v78 = 0;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__185;
  v71 = __Block_byref_object_dispose__185;
  id v72 = 0;
  v50 = (void *)[[v49 alloc] initWithPersistentID:a3];
  v30 = [v28 orderedProperties];
  v31 = [v29 protectedDatabase];
  v62[0] = (id)MEMORY[0x1E4F143A8];
  v62[1] = (id)3221225472;
  v62[2] = __97__HDUserDomainConceptEntity__codableSubclassForForUserDomainConceptID_encoder_transaction_error___block_invoke;
  v62[3] = &unk_1E630BCA0;
  v64 = &v73;
  id v32 = v28;
  id v63 = v32;
  v65 = &v67;
  int64_t v66 = a3;
  LOBYTE(v28) = [v50 getValuesForProperties:v30 database:v31 error:a5 handler:v62];

  if (v28)
  {
    if (v74[5])
    {
      id v48 = v32;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      v33 = [(objc_class *)v49 privateDataEntities];
      uint64_t v34 = [v33 countByEnumeratingWithState:&v58 objects:buf count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v59;
        while (2)
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v59 != v35) {
              objc_enumerationMutation(v33);
            }
            if (([*(id *)(*((void *)&v58 + 1) + 8 * j) addPropertyDataToCodable:v74[5] userDomainConceptID:a3 transaction:v29 error:a5] & 1) == 0)
            {

              id v32 = v48;
              goto LABEL_30;
            }
          }
          uint64_t v34 = [v33 countByEnumeratingWithState:&v58 objects:buf count:16];
          if (v34) {
            continue;
          }
          break;
        }
      }

      id v32 = v48;
      v37 = (HDCodableUserDomainConcept *)(id)v74[5];
      goto LABEL_31;
    }
    id v38 = (id)v68[5];
    v39 = v38;
    if (v38)
    {
      if (a5) {
        *a5 = v38;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
LABEL_30:
  v37 = 0;
LABEL_31:

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v73, 8);

  if (!v37) {
    goto LABEL_40;
  }
  v40 = [(HDCodableUserDomainConcept *)v37 data];
  [(HDCodableUserDomainConcept *)v12 setTypeData:v40];

LABEL_33:
  uint64_t v41 = HDSQLiteColumnWithNameAsInt64();
  v42 = [v53 syncIdentityManager];
  v62[0] = 0;
  v43 = [v42 identityForEntityID:v41 transaction:v10 error:v62];
  id v18 = v62[0];

  if (v43)
  {
    v44 = [v43 identity];
    v45 = [v44 codableSyncIdentity];
    [(HDCodableUserDomainConcept *)v12 setSyncIdentity:v45];

    v37 = v12;
  }
  else
  {
    _HKInitializeLogging();
    v46 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v81 = v18;
      _os_log_fault_impl(&dword_1BCB7D000, v46, OS_LOG_TYPE_FAULT, "Unable to fetch sync identity from HDUserDomainConceptEntity %{public}@", buf, 0xCu);
    }
    v37 = 0;
  }

LABEL_39:
LABEL_40:

  return v37;
}

@end