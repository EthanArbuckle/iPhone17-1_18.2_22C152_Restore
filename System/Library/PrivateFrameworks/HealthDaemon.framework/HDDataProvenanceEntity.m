@interface HDDataProvenanceEntity
+ (BOOL)validateEntityWithProfile:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)deviceIDsForSourceIDs:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)insertOrLookupDataProvenanceForSyncProvenance:(int64_t)a3 syncIdentity:(int64_t)a4 originProductType:(id)a5 originSystemBuild:(id)a6 originOSVersion:(id *)a7 localProductType:(id)a8 localSystemBuild:(id)a9 sourceVersion:(id)a10 timeZoneName:(id)a11 sourceID:(id)a12 deviceID:(id)a13 contributorID:(id)a14 transaction:(id)a15 error:(id *)a16;
+ (id)originProvenanceForPersistentID:(int64_t)a3 database:(id)a4 error:(id *)a5;
+ (id)sourceIDsWithProvenanceFromSourceIDs:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
@end

@implementation HDDataProvenanceEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)originProvenanceForPersistentID:(int64_t)a3 database:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  id v17 = 0;
  v10[4] = &v12;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__HDDataProvenanceEntity_originProvenanceForPersistentID_database_error___block_invoke;
  v11[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v11[4] = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__HDDataProvenanceEntity_originProvenanceForPersistentID_database_error___block_invoke_2;
  v10[3] = &unk_1E62F3640;
  [v7 executeSQL:@"SELECT sync_provenance, origin_product_type, origin_build, source_version, tz_name, source_id, device_id, contributor_id, origin_major_version, origin_minor_version, origin_patch_version, sync_identity FROM data_provenances WHERE ROWID = ?", a5, v11, v10 error bindingHandler enumerationHandler];
  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

uint64_t __73__HDDataProvenanceEntity_originProvenanceForPersistentID_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

BOOL __73__HDDataProvenanceEntity_originProvenanceForPersistentID_database_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = HDSQLiteColumnAsInt64();
  v6 = MEMORY[0x1C1879F80](a2, 1);
  id v7 = MEMORY[0x1C1879F80](a2, 2);
  uint64_t v8 = MEMORY[0x1C1879F80](a2, 3);
  uint64_t v29 = MEMORY[0x1C1879F80](a2, 4);
  uint64_t v28 = MEMORY[0x1C1879F70](a2, 5);
  v27 = MEMORY[0x1C1879F70](a2, 6);
  v9 = MEMORY[0x1C1879F70](a2, 7);
  uint64_t v10 = HDSQLiteColumnAsInt64();
  uint64_t v11 = HDSQLiteColumnAsInt64();
  uint64_t v12 = HDSQLiteColumnAsInt64();
  uint64_t v13 = HDSQLiteColumnAsInt64();
  if (v9)
  {
    uint64_t v14 = v13;
    uint64_t v15 = +[HDContributorReference contributorReferenceForPersistentID:v9];
    uint64_t v16 = v5;
    uint64_t v17 = a1;
    v18 = (void *)v15;
    v30[0] = v10;
    v30[1] = v11;
    v30[2] = v12;
    uint64_t v19 = +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:v16 syncIdentity:v14 productType:v6 systemBuild:v7 operatingSystemVersion:v30 sourceVersion:v8 timeZoneName:v29 sourceID:v28 deviceID:v27 contributorReference:v15];
    uint64_t v20 = *(void *)(*(void *)(v17 + 32) + 8);
    v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    v22 = (void *)v8;
    v23 = (void *)v29;
    v24 = (void *)v28;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"Failure retrieving contributor identifier");
    v22 = (void *)v8;
    v24 = (void *)v28;
    v23 = (void *)v29;
  }

  return v9 != 0;
}

+ (id)databaseTable
{
  return @"data_provenances";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 16;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_3;
}

+ (id)uniquedColumns
{
  v4[14] = *MEMORY[0x1E4F143B8];
  v4[0] = @"sync_provenance";
  v4[1] = @"origin_product_type";
  v4[2] = @"origin_build";
  v4[3] = @"local_product_type";
  v4[4] = @"local_build";
  v4[5] = @"source_id";
  v4[6] = @"device_id";
  v4[7] = @"contributor_id";
  v4[8] = @"source_version";
  v4[9] = @"tz_name";
  v4[10] = @"origin_major_version";
  v4[11] = @"origin_minor_version";
  v4[12] = @"origin_patch_version";
  v4[13] = @"sync_identity";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:14];

  return v2;
}

+ (id)insertOrLookupDataProvenanceForSyncProvenance:(int64_t)a3 syncIdentity:(int64_t)a4 originProductType:(id)a5 originSystemBuild:(id)a6 originOSVersion:(id *)a7 localProductType:(id)a8 localSystemBuild:(id)a9 sourceVersion:(id)a10 timeZoneName:(id)a11 sourceID:(id)a12 deviceID:(id)a13 contributorID:(id)a14 transaction:(id)a15 error:(id *)a16
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  id v26 = a14;
  v27 = v23;
  id v73 = a15;
  if (v18)
  {
    if (v19) {
      goto LABEL_3;
    }
  }
  else
  {
    v55 = [MEMORY[0x1E4F28B00] currentHandler];
    [v55 handleFailureInMethod:a2, a1, @"HDDataProvenanceEntity.m", 135, @"Invalid parameter not satisfying: %@", @"originProductType != nil" object file lineNumber description];

    if (v19)
    {
LABEL_3:
      if (v20) {
        goto LABEL_4;
      }
      goto LABEL_42;
    }
  }
  v56 = [MEMORY[0x1E4F28B00] currentHandler];
  [v56 handleFailureInMethod:a2, a1, @"HDDataProvenanceEntity.m", 136, @"Invalid parameter not satisfying: %@", @"originSystemBuild != nil" object file lineNumber description];

  if (v20)
  {
LABEL_4:
    if (v21) {
      goto LABEL_5;
    }
    goto LABEL_43;
  }
LABEL_42:
  v57 = [MEMORY[0x1E4F28B00] currentHandler];
  [v57 handleFailureInMethod:a2, a1, @"HDDataProvenanceEntity.m", 137, @"Invalid parameter not satisfying: %@", @"localProductType != nil" object file lineNumber description];

  if (v21)
  {
LABEL_5:
    if (v22) {
      goto LABEL_6;
    }
    goto LABEL_44;
  }
LABEL_43:
  v58 = [MEMORY[0x1E4F28B00] currentHandler];
  [v58 handleFailureInMethod:a2, a1, @"HDDataProvenanceEntity.m", 138, @"Invalid parameter not satisfying: %@", @"localSystemBuild != nil" object file lineNumber description];

  if (v22)
  {
LABEL_6:
    if (v27) {
      goto LABEL_7;
    }
    goto LABEL_45;
  }
LABEL_44:
  v59 = [MEMORY[0x1E4F28B00] currentHandler];
  [v59 handleFailureInMethod:a2, a1, @"HDDataProvenanceEntity.m", 139, @"Invalid parameter not satisfying: %@", @"sourceVersion != nil" object file lineNumber description];

  if (v27)
  {
LABEL_7:
    if (v24) {
      goto LABEL_8;
    }
    goto LABEL_46;
  }
LABEL_45:
  v60 = [MEMORY[0x1E4F28B00] currentHandler];
  [v60 handleFailureInMethod:a2, a1, @"HDDataProvenanceEntity.m", 140, @"Invalid parameter not satisfying: %@", @"timeZoneName != nil" object file lineNumber description];

  if (v24)
  {
LABEL_8:
    if (v25) {
      goto LABEL_9;
    }
LABEL_47:
    v62 = [MEMORY[0x1E4F28B00] currentHandler];
    [v62 handleFailureInMethod:a2, a1, @"HDDataProvenanceEntity.m", 142, @"Invalid parameter not satisfying: %@", @"deviceID != nil" object file lineNumber description];

    if (v26) {
      goto LABEL_10;
    }
    goto LABEL_48;
  }
LABEL_46:
  v61 = [MEMORY[0x1E4F28B00] currentHandler];
  [v61 handleFailureInMethod:a2, a1, @"HDDataProvenanceEntity.m", 141, @"Invalid parameter not satisfying: %@", @"sourceID != nil" object file lineNumber description];

  if (!v25) {
    goto LABEL_47;
  }
LABEL_9:
  if (v26) {
    goto LABEL_10;
  }
LABEL_48:
  v63 = [MEMORY[0x1E4F28B00] currentHandler];
  [v63 handleFailureInMethod:a2, a1, @"HDDataProvenanceEntity.m", 143, @"Invalid parameter not satisfying: %@", @"contributorID != nil" object file lineNumber description];

LABEL_10:
  if (!v73)
  {
    v64 = [MEMORY[0x1E4F28B00] currentHandler];
    [v64 handleFailureInMethod:a2, a1, @"HDDataProvenanceEntity.m", 144, @"Invalid parameter not satisfying: %@", @"transaction != nil" object file lineNumber description];
  }
  uint64_t v94 = 0;
  v95 = &v94;
  uint64_t v96 = 0x3032000000;
  v97 = __Block_byref_object_copy__11;
  v98 = __Block_byref_object_dispose__11;
  id v99 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __248__HDDataProvenanceEntity_insertOrLookupDataProvenanceForSyncProvenance_syncIdentity_originProductType_originSystemBuild_originOSVersion_localProductType_localSystemBuild_sourceVersion_timeZoneName_sourceID_deviceID_contributorID_transaction_error___block_invoke;
  aBlock[3] = &unk_1E62F4C48;
  int64_t v90 = a3;
  id v66 = v18;
  id v81 = v66;
  id v68 = v19;
  id v82 = v68;
  id v70 = v20;
  id v83 = v70;
  id v28 = v21;
  id v84 = v28;
  id v29 = v24;
  id v85 = v29;
  id v30 = v25;
  id v86 = v30;
  id v31 = v26;
  id v87 = v31;
  id v32 = v22;
  id v88 = v32;
  id v33 = v27;
  id v89 = v33;
  long long v91 = *(_OWORD *)&a7->var0;
  int64_t var2 = a7->var2;
  int64_t v93 = a4;
  v34 = _Block_copy(aBlock);
  v35 = [v73 protectedDatabase];
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __248__HDDataProvenanceEntity_insertOrLookupDataProvenanceForSyncProvenance_syncIdentity_originProductType_originSystemBuild_originOSVersion_localProductType_localSystemBuild_sourceVersion_timeZoneName_sourceID_deviceID_contributorID_transaction_error___block_invoke_2;
  v78[3] = &unk_1E62F4C70;
  id v36 = v34;
  id v79 = v36;
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __248__HDDataProvenanceEntity_insertOrLookupDataProvenanceForSyncProvenance_syncIdentity_originProductType_originSystemBuild_originOSVersion_localProductType_localSystemBuild_sourceVersion_timeZoneName_sourceID_deviceID_contributorID_transaction_error___block_invoke_3;
  v77[3] = &unk_1E62F3640;
  v77[4] = &v94;
  char v37 = [v35 executeSQL:@"SELECT ROWID FROM data_provenances WHERE sync_provenance = ? AND origin_product_type = ? AND origin_build = ? AND local_product_type = ? AND local_build = ? AND source_id = ? AND device_id = ? AND contributor_id = ? AND source_version = ? AND tz_name = ? AND origin_major_version = ? AND origin_minor_version = ? AND origin_patch_version = ? AND sync_identity = ?" error:a16 bindingHandler:v78 enumerationHandler:v77];

  if (v37)
  {
    v38 = (void *)v95[5];
    if (v38)
    {
      id v39 = v38;
    }
    else
    {
      uint64_t v42 = [v29 longLongValue];
      id v43 = [v73 unprotectedDatabase];
      self;
      uint64_t v101 = 0;
      v102 = &v101;
      uint64_t v103 = 0x2020000000;
      uint64_t v104 = 0;
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v106 = __66__HDDataProvenanceEntity__derivedFlagsForSourceID_database_error___block_invoke_2;
      v107 = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
      uint64_t v108 = v42;
      v100[0] = MEMORY[0x1E4F143A8];
      v100[1] = 3221225472;
      v100[2] = __66__HDDataProvenanceEntity__derivedFlagsForSourceID_database_error___block_invoke_3;
      v100[3] = &unk_1E62F3640;
      v100[4] = &v101;
      if ([v43 executeCachedStatementForKey:&_derivedFlagsForSourceID_database_error__lookupKey error:a16 SQLGenerator:&__block_literal_global_15 bindingHandler:&buf enumerationHandler:v100])
      {
        v44 = [NSNumber numberWithLongLong:v102[3]];
      }
      else
      {
        v44 = 0;
      }
      _Block_object_dispose(&v101, 8);

      if (v44)
      {
        v45 = [v73 protectedDatabase];
        v74[0] = MEMORY[0x1E4F143A8];
        v74[1] = 3221225472;
        v74[2] = __248__HDDataProvenanceEntity_insertOrLookupDataProvenanceForSyncProvenance_syncIdentity_originProductType_originSystemBuild_originOSVersion_localProductType_localSystemBuild_sourceVersion_timeZoneName_sourceID_deviceID_contributorID_transaction_error___block_invoke_382;
        v74[3] = &unk_1E62F4C98;
        id v76 = v36;
        id v75 = v44;
        int v46 = [v45 executeSQL:@"INSERT INTO data_provenances (sync_provenance, origin_product_type, origin_build, local_product_type, local_build, source_id, device_id, contributor_id, source_version, tz_name, origin_major_version, origin_minor_version, origin_patch_version, sync_identity, derived_flags) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", a16, v74, 0 error bindingHandler enumerationHandler];

        if (v46)
        {
          v47 = [v73 protectedDatabase];
          uint64_t v48 = [v47 lastInsertRowID];
          v49 = (void *)v95[5];
          v95[5] = v48;
        }
        else
        {
          _HKInitializeLogging();
          v52 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
          {
            v53 = a16;
            if (a16) {
              v53 = *a16;
            }
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v53;
            _os_log_impl(&dword_1BCB7D000, v52, OS_LOG_TYPE_INFO, "Unable to insert data provenance : %{public}@", (uint8_t *)&buf, 0xCu);
          }
        }
        id v39 = (id)v95[5];
      }
      else
      {
        _HKInitializeLogging();
        v50 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
        {
          v51 = a16;
          if (a16) {
            v51 = *a16;
          }
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v51;
          _os_log_impl(&dword_1BCB7D000, v50, OS_LOG_TYPE_INFO, "Unable to look up derived flags: %{public}@", (uint8_t *)&buf, 0xCu);
        }
        id v39 = 0;
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v40 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
    {
      v41 = a16;
      if (a16) {
        v41 = *a16;
      }
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v41;
      _os_log_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_INFO, "Unable to look up data provenance: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    id v39 = 0;
  }

  _Block_object_dispose(&v94, 8);

  return v39;
}

uint64_t __248__HDDataProvenanceEntity_insertOrLookupDataProvenanceForSyncProvenance_syncIdentity_originProductType_originSystemBuild_originOSVersion_localProductType_localSystemBuild_sourceVersion_timeZoneName_sourceID_deviceID_contributorID_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 104));
  HDSQLiteBindStringToStatement();
  HDSQLiteBindStringToStatement();
  HDSQLiteBindStringToStatement();
  HDSQLiteBindStringToStatement();
  sqlite3_bind_int64(a2, 6, [*(id *)(a1 + 64) longLongValue]);
  sqlite3_bind_int64(a2, 7, [*(id *)(a1 + 72) longLongValue]);
  sqlite3_bind_int64(a2, 8, [*(id *)(a1 + 80) longLongValue]);
  HDSQLiteBindStringToStatement();
  HDSQLiteBindStringToStatement();
  sqlite3_bind_int64(a2, 11, *(void *)(a1 + 112));
  sqlite3_bind_int64(a2, 12, *(void *)(a1 + 120));
  sqlite3_bind_int64(a2, 13, *(void *)(a1 + 128));
  sqlite3_int64 v4 = *(void *)(a1 + 136);

  return sqlite3_bind_int64(a2, 14, v4);
}

uint64_t __248__HDDataProvenanceEntity_insertOrLookupDataProvenanceForSyncProvenance_syncIdentity_originProductType_originSystemBuild_originOSVersion_localProductType_localSystemBuild_sourceVersion_timeZoneName_sourceID_deviceID_contributorID_transaction_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __248__HDDataProvenanceEntity_insertOrLookupDataProvenanceForSyncProvenance_syncIdentity_originProductType_originSystemBuild_originOSVersion_localProductType_localSystemBuild_sourceVersion_timeZoneName_sourceID_deviceID_contributorID_transaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F70](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

uint64_t __248__HDDataProvenanceEntity_insertOrLookupDataProvenanceForSyncProvenance_syncIdentity_originProductType_originSystemBuild_originOSVersion_localProductType_localSystemBuild_sourceVersion_timeZoneName_sourceID_deviceID_contributorID_transaction_error___block_invoke_382(uint64_t a1, sqlite3_stmt *a2)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  sqlite3_int64 v4 = [*(id *)(a1 + 32) longLongValue];

  return sqlite3_bind_int64(a2, 15, v4);
}

+ (id)deviceIDsForSourceIDs:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v10 = a4;
  id v11 = objc_alloc_init(v9);
  uint64_t v12 = [v10 database];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__HDDataProvenanceEntity_deviceIDsForSourceIDs_profile_error___block_invoke;
  v17[3] = &unk_1E62F4200;
  id v18 = v8;
  id v20 = a1;
  id v13 = v11;
  id v19 = v13;
  id v14 = v8;
  LODWORD(a5) = [a1 performReadTransactionWithHealthDatabase:v12 error:a5 block:v17];

  if (a5) {
    uint64_t v15 = (void *)[v13 copy];
  }
  else {
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t __62__HDDataProvenanceEntity_deviceIDsForSourceIDs_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F65D10];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  id v8 = [v5 containsPredicateWithProperty:@"source_id" values:v6];
  v9 = *(void **)(a1 + 48);
  id v10 = [v7 protectedDatabase];

  id v11 = [v9 queryWithDatabase:v10 predicate:v8];

  v17[0] = @"device_id";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__HDDataProvenanceEntity_deviceIDsForSourceIDs_profile_error___block_invoke_2;
  v15[3] = &unk_1E62F4CC0;
  id v16 = *(id *)(a1 + 40);
  uint64_t v13 = [v11 enumeratePersistentIDsAndProperties:v12 error:a3 enumerationHandler:v15];

  return v13;
}

uint64_t __62__HDDataProvenanceEntity_deviceIDsForSourceIDs_profile_error___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = HDSQLiteColumnWithNameAsNumber();
  [v1 addObject:v2];

  return 1;
}

uint64_t __93__HDDataProvenanceEntity__validateUnprotectedDatabaseReferencesOnProfile_error_errorHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 protectedDatabase];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __93__HDDataProvenanceEntity__validateUnprotectedDatabaseReferencesOnProfile_error_errorHandler___block_invoke_2;
  v12[3] = &unk_1E62F4CE8;
  uint64_t v15 = *(void *)(a1 + 48);
  id v13 = v5;
  long long v11 = *(_OWORD *)(a1 + 32);
  id v7 = (id)v11;
  long long v14 = v11;
  id v8 = v5;
  uint64_t v9 = [v6 executeSQL:@"SELECT ROWID, sync_provenance, source_id, device_id FROM data_provenances", a3, 0, v12 error bindingHandler enumerationHandler];

  return v9;
}

uint64_t __93__HDDataProvenanceEntity__validateUnprotectedDatabaseReferencesOnProfile_error_errorHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v68[4] = *MEMORY[0x1E4F143B8];
  sqlite3_int64 v4 = MEMORY[0x1C1879F70](a2, 0);
  uint64_t v5 = HDSQLiteColumnAsInt64();
  uint64_t v6 = MEMORY[0x1C1879F70](a2, 2);
  id v7 = MEMORY[0x1C1879F70](a2, 3);
  if (!v4)
  {
    v58 = [MEMORY[0x1E4F28B00] currentHandler];
    [v58 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 56), @"HDDataProvenanceEntity.m", 348, @"Invalid parameter not satisfying: %@", @"rowID != nil" object file lineNumber description];

    if (v6) {
      goto LABEL_3;
    }
LABEL_21:
    v59 = [MEMORY[0x1E4F28B00] currentHandler];
    [v59 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 56), @"HDDataProvenanceEntity.m", 349, @"Invalid parameter not satisfying: %@", @"sourceID != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v6) {
    goto LABEL_21;
  }
LABEL_3:
  v62 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 120, @"Record in data_provenances points to non existent record in another table");
  id v8 = [NSNumber numberWithLongLong:v5];
  uint64_t v9 = +[HDSQLiteEntity entityWithPersistentID:v8];

  id v10 = [*(id *)(a1 + 32) unprotectedDatabase];
  v61 = v9;
  char v11 = [v9 existsInDatabase:v10];

  if ((v11 & 1) == 0 && v5)
  {
    v67[0] = *MEMORY[0x1E4F29B38];
    uint64_t v12 = [*(id *)(a1 + 56) databaseTable];
    id v13 = (void *)v12;
    if (v12) {
      long long v14 = (__CFString *)v12;
    }
    else {
      long long v14 = @"No database table name found";
    }
    uint64_t v15 = *MEMORY[0x1E4F28A50];
    v68[0] = v14;
    v68[1] = v62;
    uint64_t v16 = *MEMORY[0x1E4F29B48];
    v67[1] = v15;
    v67[2] = v16;
    uint64_t v17 = NSString;
    id v18 = [NSNumber numberWithLongLong:v5];
    +[HDSyncStoreEntity databaseTable];
    v20 = id v19 = v7;
    id v21 = [*(id *)(a1 + 56) databaseTable];
    id v22 = [v17 stringWithFormat:@"Cannot find rowid:%@ in table:%@ for rowid:%@ in table:%@", v18, v20, v4, v21];
    v67[3] = *MEMORY[0x1E4F29B30];
    v68[2] = v22;
    v68[3] = v4;
    id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:4];

    id v7 = v19;
    id v24 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:userInfo:", 120, v23);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  id v25 = +[HDSQLiteEntity entityWithPersistentID:v6];
  id v26 = [*(id *)(a1 + 32) unprotectedDatabase];
  char v27 = [v25 existsInDatabase:v26];

  if ((v27 & 1) == 0)
  {
    v65[0] = *MEMORY[0x1E4F29B38];
    uint64_t v28 = [*(id *)(a1 + 56) databaseTable];
    id v29 = (void *)v28;
    if (v28) {
      id v30 = (__CFString *)v28;
    }
    else {
      id v30 = @"No database table name found";
    }
    uint64_t v31 = *MEMORY[0x1E4F28A50];
    v66[0] = v30;
    v66[1] = v62;
    uint64_t v32 = *MEMORY[0x1E4F29B48];
    v65[1] = v31;
    v65[2] = v32;
    id v33 = NSString;
    v34 = +[HDSourceEntity databaseTable];
    v35 = [*(id *)(a1 + 56) databaseTable];
    id v36 = [v33 stringWithFormat:@"Cannot find rowid:%@ in table:%@ for rowid:%@ in table:%@", v6, v34, v4, v35];
    v65[3] = *MEMORY[0x1E4F29B30];
    v66[2] = v36;
    v66[3] = v4;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:4];
    v38 = char v37 = v7;

    id v39 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:userInfo:", 120, v38);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    id v7 = v37;
  }
  v40 = +[HDSQLiteEntity entityWithPersistentID:v7];
  v41 = [*(id *)(a1 + 32) unprotectedDatabase];
  char v42 = [v40 existsInDatabase:v41];

  if ((v42 & 1) == 0)
  {
    v63[0] = *MEMORY[0x1E4F29B38];
    uint64_t v43 = [*(id *)(a1 + 56) databaseTable];
    v44 = (void *)v43;
    if (v43) {
      v45 = (__CFString *)v43;
    }
    else {
      v45 = @"No database table name found";
    }
    uint64_t v46 = *MEMORY[0x1E4F28A50];
    v64[0] = v45;
    v64[1] = v62;
    uint64_t v47 = *MEMORY[0x1E4F29B48];
    v63[1] = v46;
    v63[2] = v47;
    uint64_t v48 = NSString;
    v49 = +[HDDeviceEntity databaseTable];
    [*(id *)(a1 + 56) databaseTable];
    uint64_t v60 = a1;
    v50 = v25;
    v51 = v6;
    v53 = v52 = v7;
    v54 = [v48 stringWithFormat:@"Cannot find rowid:%@ in table:%@ for rowid:%@ in table:%@", v52, v49, v4, v53];
    v63[3] = *MEMORY[0x1E4F29B30];
    v64[2] = v54;
    v64[3] = v4;
    v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:4];

    id v7 = v52;
    uint64_t v6 = v51;
    id v25 = v50;

    v56 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:userInfo:", 120, v55);
    (*(void (**)(void))(*(void *)(v60 + 40) + 16))();
  }
  return 1;
}

+ (id)sourceIDsWithProvenanceFromSourceIDs:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v10 = a4;
  id v11 = objc_alloc_init(v9);
  uint64_t v12 = [v10 database];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __77__HDDataProvenanceEntity_sourceIDsWithProvenanceFromSourceIDs_profile_error___block_invoke;
  v17[3] = &unk_1E62F4200;
  id v18 = v8;
  id v20 = a1;
  id v13 = v11;
  id v19 = v13;
  id v14 = v8;
  LODWORD(a5) = [a1 performReadTransactionWithHealthDatabase:v12 error:a5 block:v17];

  if (a5) {
    uint64_t v15 = (void *)[v13 copy];
  }
  else {
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t __77__HDDataProvenanceEntity_sourceIDsWithProvenanceFromSourceIDs_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F65D10];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  id v8 = [v5 containsPredicateWithProperty:@"source_id" values:v6];
  uint64_t v9 = *(void **)(a1 + 48);
  id v10 = [v7 protectedDatabase];

  id v11 = [v9 queryWithDatabase:v10 predicate:v8];

  v17[0] = @"source_id";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__HDDataProvenanceEntity_sourceIDsWithProvenanceFromSourceIDs_profile_error___block_invoke_2;
  v15[3] = &unk_1E62F4CC0;
  id v16 = *(id *)(a1 + 40);
  uint64_t v13 = [v11 enumeratePersistentIDsAndProperties:v12 error:a3 enumerationHandler:v15];

  return v13;
}

uint64_t __77__HDDataProvenanceEntity_sourceIDsWithProvenanceFromSourceIDs_profile_error___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = HDSQLiteColumnWithNameAsNumber();
  [v1 addObject:v2];

  return 1;
}

id __66__HDDataProvenanceEntity__derivedFlagsForSourceID_database_error___block_invoke()
{
  v0 = NSString;
  v1 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v2 = [v0 stringWithFormat:@"SELECT (%@ LIKE 'Watch%%') FROM %@ WHERE %@=? LIMIT 1", @"product_type", v1, *MEMORY[0x1E4F65C70], 0];

  return v2;
}

uint64_t __66__HDDataProvenanceEntity__derivedFlagsForSourceID_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __66__HDDataProvenanceEntity__derivedFlagsForSourceID_database_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x1C1879F00](a2, 0)) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= 1uLL;
  }
  return 1;
}

+ (BOOL)validateEntityWithProfile:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = self;
  id v10 = [v8 database];

  id v11 = +[HDDatabaseTransactionContext contextForReadingProtectedData];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__HDDataProvenanceEntity__validateUnprotectedDatabaseReferencesOnProfile_error_errorHandler___block_invoke;
  v14[3] = &unk_1E62F4D10;
  id v16 = sel__validateUnprotectedDatabaseReferencesOnProfile_error_errorHandler_;
  uint64_t v17 = v9;
  id v15 = v7;
  id v12 = v7;
  LOBYTE(a4) = [v10 performTransactionWithContext:v11 error:a4 block:v14 inaccessibilityHandler:0];

  return (char)a4;
}

@end