@interface HDObjectAuthorizationEntity
+ (BOOL)resetAllObjectAuthorizationRecordsForProfile:(id)a3 error:(id *)a4;
+ (BOOL)resetAuthorizationForObjects:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)resetObjectAuthorizationRecordsForSource:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)setObjectAuthorizationRecords:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5 profile:(id)a6 error:(id *)a7;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_selectSQLIncludeSession:(uint64_t)a1;
+ (id)authorizationRecordsBySourceForSampleWithUUID:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)authorizationRecordsForSamples:(id)a3 sourceEntity:(id)a4 sessionIdentifier:(id)a5 profile:(id)a6 error:(id *)a7;
+ (id)authorizationStatusForSamplesOfType:(id)a3 sourceEntity:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (id)pruneWithProfile:(id)a3 nowDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
@end

@implementation HDObjectAuthorizationEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)databaseTable
{
  return @"object_authorizations";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 8;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_69;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"object";
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F65D20]) initWithEntityClass:objc_opt_class() property:@"uuid" deletionAction:2];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)uniquedColumns
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"object";
  v4[1] = @"source";
  v4[2] = @"sync_provenance";
  v4[3] = @"sync_identity";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];

  return v2;
}

+ (id)propertyForSyncProvenance
{
  return @"sync_provenance";
}

+ (id)propertyForSyncIdentity
{
  return @"sync_identity";
}

+ (BOOL)setObjectAuthorizationRecords:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5 profile:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a6;
  v13 = self;
  v14 = [v12 database];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __115__HDObjectAuthorizationEntity__setObjectAuthorizationRecords_syncProvenance_syncIdentity_skipErrors_profile_error___block_invoke;
  v23[3] = &unk_1E6305D70;
  id v24 = v11;
  v25 = v13;
  int64_t v26 = a4;
  int64_t v27 = a5;
  char v28 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __115__HDObjectAuthorizationEntity__setObjectAuthorizationRecords_syncProvenance_syncIdentity_skipErrors_profile_error___block_invoke_324;
  v18[3] = &unk_1E6305D98;
  int64_t v21 = a5;
  int64_t v22 = a4;
  id v19 = v24;
  id v20 = v12;
  id v15 = v12;
  id v16 = v24;
  LOBYTE(a7) = [v13 performWriteTransactionWithHealthDatabase:v14 error:a7 block:v23 inaccessibilityHandler:v18];

  return (char)a7;
}

uint64_t __115__HDObjectAuthorizationEntity__setObjectAuthorizationRecords_syncProvenance_syncIdentity_skipErrors_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v36[7] = *MEMORY[0x1E4F143B8];
  id v25 = a2;
  v36[0] = @"object";
  v36[1] = @"source";
  v36[2] = @"status";
  v36[3] = @"sync_provenance";
  v36[4] = @"sync_identity";
  v36[5] = @"modification_date";
  v36[6] = @"session";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:7];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    v23 = a3;
    uint64_t v10 = *(void *)v30;
    *(void *)&long long v8 = 138543362;
    long long v22 = v8;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v13 = *(void **)(a1 + 40);
        v14 = objc_msgSend(v25, "protectedDatabase", v22);
        id v28 = 0;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __115__HDObjectAuthorizationEntity__setObjectAuthorizationRecords_syncProvenance_syncIdentity_skipErrors_profile_error___block_invoke_2;
        v26[3] = &unk_1E6305D48;
        v26[4] = v12;
        *(CFAbsoluteTime *)&v26[5] = Current;
        long long v27 = *(_OWORD *)(a1 + 48);
        id v15 = [v13 insertOrReplaceEntity:1 database:v14 properties:v5 error:&v28 bindingHandler:v26];
        id v16 = v28;

        if (!v15)
        {
          _HKInitializeLogging();
          v17 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v22;
            id v34 = v16;
            _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "Failed to insert or update object authorization: %{public}@", buf, 0xCu);
          }
          id v18 = v16;
          id v19 = v18;
          if (v18)
          {
            if (v23) {
              void *v23 = v18;
            }
            else {
              _HKLogDroppedError();
            }
          }

          if (!*(unsigned char *)(a1 + 64))
          {

            uint64_t v20 = 0;
            goto LABEL_18;
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v20 = 1;
LABEL_18:

  return v20;
}

void __115__HDObjectAuthorizationEntity__setObjectAuthorizationRecords_syncProvenance_syncIdentity_skipErrors_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) modificationDate];
  if (v4 == 0.0) {
    double v5 = *(double *)(a1 + 40);
  }
  else {
    double v5 = v4;
  }
  v6 = [*(id *)(a1 + 32) objectUUID];
  MEMORY[0x1C1879EF0](a2, @"object", v6);

  uint64_t v7 = [*(id *)(a1 + 32) sourceUUID];
  MEMORY[0x1C1879EF0](a2, @"source", v7);

  MEMORY[0x1C1879E80](a2, @"status", [*(id *)(a1 + 32) status]);
  MEMORY[0x1C1879E80](a2, @"sync_provenance", *(void *)(a1 + 48));
  MEMORY[0x1C1879E80](a2, @"sync_identity", *(void *)(a1 + 56));
  MEMORY[0x1C1879E50](a2, @"modification_date", v5);
  id v8 = [*(id *)(a1 + 32) sessionUUID];
  MEMORY[0x1C1879EF0](a2, @"session", v8);
}

uint64_t __115__HDObjectAuthorizationEntity__setObjectAuthorizationRecords_syncProvenance_syncIdentity_skipErrors_profile_error___block_invoke_324(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v5 = objc_alloc_init(HDObjectAuthorizationJournalEntry);
  [(HDObjectAuthorizationJournalEntry *)v5 setRecords:*(void *)(a1 + 32)];
  [(HDObjectAuthorizationJournalEntry *)v5 setSyncIdentity:*(void *)(a1 + 48)];
  [(HDObjectAuthorizationJournalEntry *)v5 setSyncProvenance:*(void *)(a1 + 56)];
  v6 = [*(id *)(a1 + 40) database];
  uint64_t v7 = [v6 addJournalEntry:v5 error:a3];

  return v7;
}

+ (BOOL)resetObjectAuthorizationRecordsForSource:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v9 database];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__HDObjectAuthorizationEntity_resetObjectAuthorizationRecordsForSource_profile_error___block_invoke;
  v14[3] = &unk_1E62F4200;
  id v15 = v8;
  id v16 = v9;
  id v17 = a1;
  id v11 = v9;
  id v12 = v8;
  LOBYTE(a5) = [a1 performWriteTransactionWithHealthDatabase:v10 error:a5 block:v14];

  return (char)a5;
}

uint64_t __86__HDObjectAuthorizationEntity_resetObjectAuthorizationRecordsForSource_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [*(id *)(a1 + 32) sourceUUIDWithProfile:*(void *)(a1 + 40) error:a3];
  if (v6)
  {
    uint64_t v7 = NSString;
    id v8 = [*(id *)(a1 + 48) disambiguatedDatabaseTable];
    id v9 = [v7 stringWithFormat:@"DELETE FROM %@ WHERE %@ = ?", v8, @"source"];

    uint64_t v10 = [v5 protectedDatabase];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __86__HDObjectAuthorizationEntity_resetObjectAuthorizationRecordsForSource_profile_error___block_invoke_2;
    v13[3] = &unk_1E62F43C8;
    id v14 = v6;
    uint64_t v11 = [v10 executeSQL:v9 error:a3 bindingHandler:v13 enumerationHandler:0];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t __86__HDObjectAuthorizationEntity_resetObjectAuthorizationRecordsForSource_profile_error___block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)resetAllObjectAuthorizationRecordsForProfile:(id)a3 error:(id *)a4
{
  v6 = [a3 database];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__HDObjectAuthorizationEntity_resetAllObjectAuthorizationRecordsForProfile_error___block_invoke;
  v8[3] = &__block_descriptor_40_e35_B24__0__HDDatabaseTransaction_8__16l;
  v8[4] = a1;
  LOBYTE(a4) = [a1 performWriteTransactionWithHealthDatabase:v6 error:a4 block:v8];

  return (char)a4;
}

uint64_t __82__HDObjectAuthorizationEntity_resetAllObjectAuthorizationRecordsForProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v4 = NSString;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 disambiguatedDatabaseTable];
  id v8 = [v4 stringWithFormat:@"DELETE FROM %@", v7];

  id v9 = [v6 protectedDatabase];

  uint64_t v10 = [v9 executeSQL:v8 error:a3 bindingHandler:0 enumerationHandler:0];
  return v10;
}

+ (BOOL)resetAuthorizationForObjects:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__HDObjectAuthorizationEntity_resetAuthorizationForObjects_profile_error___block_invoke;
  v12[3] = &unk_1E62F9068;
  id v13 = v8;
  id v14 = a1;
  id v10 = v8;
  LOBYTE(a5) = [a1 performWriteTransactionWithHealthDatabase:v9 error:a5 block:v12];

  return (char)a5;
}

uint64_t __74__HDObjectAuthorizationEntity_resetAuthorizationForObjects_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = NSString;
  id v6 = *(void **)(a1 + 40);
  id v7 = a2;
  id v8 = [v6 disambiguatedDatabaseTable];
  id v9 = [v5 stringWithFormat:@"DELETE FROM %@ WHERE %@ IN (?)", v8, @"object"];

  id v10 = [v7 protectedDatabase];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__HDObjectAuthorizationEntity_resetAuthorizationForObjects_profile_error___block_invoke_2;
  v13[3] = &unk_1E62F43C8;
  id v14 = *(id *)(a1 + 32);
  uint64_t v11 = [v10 executeSQL:v9 error:a3 bindingHandler:v13 enumerationHandler:0];

  return v11;
}

uint64_t __74__HDObjectAuthorizationEntity_resetAuthorizationForObjects_profile_error___block_invoke_2()
{
  return HDSQLiteBindFoundationValuesToStatement();
}

BOOL __90__HDObjectAuthorizationEntity__insertCodableObjectAuthorizations_syncStore_profile_error___block_invoke(void *a1, void *a2, uint64_t *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)a1[4];
  id v6 = a2;
  id v7 = [v5 syncIdentityManager];
  uint64_t v8 = [v7 concreteIdentityForIdentity:a1[5] shouldCreate:1 transaction:v6 error:a3];

  uint64_t v9 = *(void *)(a1[6] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (!v11)
  {
    _HKInitializeLogging();
    id v12 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
    {
      uint64_t v14 = *a3;
      int v15 = 138543362;
      uint64_t v16 = v14;
      _os_log_fault_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_FAULT, "HDObjectAuthorizationSyncEntity ConcreteSyncIdentity from received codable is nil %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
  return v11 != 0;
}

+ (id)authorizationStatusForSamplesOfType:(id)a3 sourceEntity:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__HDObjectAuthorizationEntity_authorizationStatusForSamplesOfType_sourceEntity_profile_error___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v12 = authorizationStatusForSamplesOfType_sourceEntity_profile_error__onceToken;
  id v13 = a5;
  if (v12 != -1) {
    dispatch_once(&authorizationStatusForSamplesOfType_sourceEntity_profile_error__onceToken, block);
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v15 = [v13 database];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __94__HDObjectAuthorizationEntity_authorizationStatusForSamplesOfType_sourceEntity_profile_error___block_invoke_2;
  v23[3] = &unk_1E62F5A88;
  id v24 = v11;
  id v25 = v10;
  id v26 = v14;
  id v16 = v14;
  id v17 = v10;
  id v18 = v11;
  int v19 = [a1 performReadTransactionWithHealthDatabase:v15 error:a6 block:v23];

  if (v19) {
    uint64_t v20 = v16;
  }
  else {
    uint64_t v20 = 0;
  }
  id v21 = v20;

  return v21;
}

void __94__HDObjectAuthorizationEntity_authorizationStatusForSamplesOfType_sourceEntity_profile_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  id v6 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v2 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v3 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v4 = [v1 stringWithFormat:@"SELECT %@, %@, %@, %@                                                     FROM %@ as oa                                                     INNER JOIN %@ obj ON oa.%@ = obj.%@                                                     INNER JOIN %@ spl ON obj.%@ = spl.%@                                                     WHERE oa.%@ = ? AND spl.%@ = ?", @"object", @"source", @"status", @"modification_date", v6, v2, @"object", @"uuid", v3, @"data_id", @"data_id", @"source", @"data_type"];
  id v5 = (void *)authorizationStatusForSamplesOfType_sourceEntity_profile_error__selectSQL;
  authorizationStatusForSamplesOfType_sourceEntity_profile_error__selectSQL = v4;
}

uint64_t __94__HDObjectAuthorizationEntity_authorizationStatusForSamplesOfType_sourceEntity_profile_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v6 unprotectedDatabase];
  uint64_t v8 = [v5 UUIDForProperty:@"uuid" database:v7];

  uint64_t v9 = [v6 protectedDatabase];

  uint64_t v10 = authorizationStatusForSamplesOfType_sourceEntity_profile_error__selectSQL;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __94__HDObjectAuthorizationEntity_authorizationStatusForSamplesOfType_sourceEntity_profile_error___block_invoke_3;
  v16[3] = &unk_1E62F2900;
  id v17 = v8;
  id v18 = *(id *)(a1 + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __94__HDObjectAuthorizationEntity_authorizationStatusForSamplesOfType_sourceEntity_profile_error___block_invoke_4;
  v14[3] = &unk_1E62F3D38;
  id v15 = *(id *)(a1 + 48);
  id v11 = v8;
  uint64_t v12 = [v9 executeSQL:v10 error:a3 bindingHandler:v16 enumerationHandler:v14];

  return v12;
}

uint64_t __94__HDObjectAuthorizationEntity_authorizationStatusForSamplesOfType_sourceEntity_profile_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_int64 v4 = [*(id *)(a1 + 40) code];

  return sqlite3_bind_int64(a2, 2, v4);
}

uint64_t __94__HDObjectAuthorizationEntity_authorizationStatusForSamplesOfType_sourceEntity_profile_error___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F2B2B8]);
  id v5 = MEMORY[0x1C1879F90](a2, 0);
  [v4 setObjectUUID:v5];

  id v6 = MEMORY[0x1C1879F90](a2, 1);
  [v4 setSourceUUID:v6];

  [v4 setStatus:HDSQLiteColumnAsInt64()];
  MEMORY[0x1C1879F40](a2, 3);
  objc_msgSend(v4, "setModificationDate:");
  [*(id *)(a1 + 32) addObject:v4];

  return 1;
}

+ (id)authorizationRecordsForSamples:(id)a3 sourceEntity:(id)a4 sessionIdentifier:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__HDObjectAuthorizationEntity_authorizationRecordsForSamples_sourceEntity_sessionIdentifier_profile_error___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v15 = qword_1EBA18DC0;
  id v16 = a6;
  if (v15 != -1) {
    dispatch_once(&qword_1EBA18DC0, block);
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v18 = [v13 persistentID];
  int v19 = &_MergedGlobals_1;
  if (v14) {
    int v19 = &qword_1EBA18DB8;
  }
  id v20 = (id)*v19;
  id v21 = [v16 database];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __107__HDObjectAuthorizationEntity_authorizationRecordsForSamples_sourceEntity_sessionIdentifier_profile_error___block_invoke_2;
  v31[3] = &unk_1E6305DC0;
  id v32 = v13;
  id v33 = v12;
  id v34 = v14;
  id v35 = v20;
  id v36 = v17;
  uint64_t v37 = v18;
  id v22 = v17;
  id v23 = v20;
  id v24 = v14;
  id v25 = v12;
  id v26 = v13;
  int v27 = [a1 performReadTransactionWithHealthDatabase:v21 error:a7 block:v31];

  if (v27) {
    id v28 = v22;
  }
  else {
    id v28 = 0;
  }
  id v29 = v28;

  return v29;
}

void __107__HDObjectAuthorizationEntity_authorizationRecordsForSamples_sourceEntity_sessionIdentifier_profile_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[HDObjectAuthorizationEntity _selectSQLIncludeSession:](*(void *)(a1 + 32), 0);
  v3 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v2;

  uint64_t v4 = +[HDObjectAuthorizationEntity _selectSQLIncludeSession:](*(void *)(a1 + 32), 1);
  id v5 = (void *)qword_1EBA18DB8;
  qword_1EBA18DB8 = v4;
}

+ (id)_selectSQLIncludeSession:(uint64_t)a1
{
  v3 = self;
  uint64_t v4 = @"IS";
  if (a2) {
    uint64_t v4 = @"=";
  }
  id v5 = NSString;
  id v6 = v4;
  id v7 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v8 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v9 = *MEMORY[0x1E4F65C70];
  uint64_t v10 = [v3 disambiguatedDatabaseTable];
  id v11 = [v5 stringWithFormat:@"SELECT %@, %@, dp.%@                                            FROM %@ AS o                                            INNER JOIN %@ dp ON o.%@ = dp.%@                                            LEFT JOIN %@ oa ON o.%@ = oa.%@ AND oa.%@ = ? AND oa.%@ %@ ?                                            WHERE o.%@ = ?", @"status", @"modification_date", @"source_id", v7, v8, @"provenance", v9, v10, @"uuid", @"object", @"source", @"session", v6, @"uuid"];

  return v11;
}

uint64_t __107__HDObjectAuthorizationEntity_authorizationRecordsForSamples_sourceEntity_sessionIdentifier_profile_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = *(void **)(a1 + 32);
  id v23 = v4;
  id v6 = [v4 unprotectedDatabase];
  id v7 = [v5 UUIDForProperty:@"uuid" database:v6];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v21 = *(void *)v32;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v31 + 1) + 8 * v10);
        id v12 = objc_alloc_init(MEMORY[0x1E4F2B2B8]);
        [v12 setSourceUUID:v7];
        id v13 = [v11 UUID];
        [v12 setObjectUUID:v13];

        [v12 setSessionUUID:*(void *)(a1 + 48)];
        [v12 setStatus:0];
        id v14 = [v23 protectedDatabase];
        uint64_t v15 = *(void *)(a1 + 56);
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __107__HDObjectAuthorizationEntity_authorizationRecordsForSamples_sourceEntity_sessionIdentifier_profile_error___block_invoke_3;
        v27[3] = &unk_1E62F2DF0;
        id v28 = v7;
        id v29 = *(id *)(a1 + 48);
        long long v30 = v11;
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __107__HDObjectAuthorizationEntity_authorizationRecordsForSamples_sourceEntity_sessionIdentifier_profile_error___block_invoke_4;
        v24[3] = &unk_1E62FB620;
        uint64_t v16 = *(void *)(a1 + 72);
        id v25 = v12;
        uint64_t v26 = v16;
        id v17 = v12;
        LODWORD(v11) = [v14 executeSQL:v15 error:a3 bindingHandler:v27 enumerationHandler:v24];

        [*(id *)(a1 + 64) addObject:v17];
        if (!v11)
        {
          uint64_t v18 = 0;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v9 != v10);
      uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v18 = 1;
LABEL_11:

  return v18;
}

void __107__HDObjectAuthorizationEntity_authorizationRecordsForSamples_sourceEntity_sessionIdentifier_profile_error___block_invoke_3(uint64_t a1)
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  id v2 = [*(id *)(a1 + 48) UUID];
  HDSQLiteBindFoundationValueToStatement();
}

uint64_t __107__HDObjectAuthorizationEntity_authorizationRecordsForSamples_sourceEntity_sessionIdentifier_profile_error___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = HDSQLiteColumnAsInt64();
  if ((MEMORY[0x1C1879FC0](a2, 0) & 1) == 0)
  {
    uint64_t v5 = HDSQLiteColumnAsInt64();
    goto LABEL_5;
  }
  if (v4 == *(void *)(a1 + 40))
  {
    uint64_t v5 = 2;
LABEL_5:
    [*(id *)(a1 + 32) setStatus:v5];
  }
  MEMORY[0x1C1879F40](a2, 1);
  objc_msgSend(*(id *)(a1 + 32), "setModificationDate:");
  return 1;
}

+ (id)authorizationRecordsBySourceForSampleWithUUID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v10 = a4;
  id v11 = objc_alloc_init(v9);
  id v12 = [v10 database];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __91__HDObjectAuthorizationEntity_authorizationRecordsBySourceForSampleWithUUID_profile_error___block_invoke;
  v18[3] = &unk_1E62F4200;
  id v20 = v11;
  id v21 = a1;
  id v19 = v8;
  id v13 = v11;
  id v14 = v8;
  LODWORD(a5) = [a1 performReadTransactionWithHealthDatabase:v12 error:a5 block:v18];

  if (a5) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;

  return v16;
}

uint64_t __91__HDObjectAuthorizationEntity_authorizationRecordsBySourceForSampleWithUUID_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = NSString;
  id v6 = *(void **)(a1 + 48);
  id v7 = a2;
  id v8 = [v6 disambiguatedDatabaseTable];
  uint64_t v9 = [v5 stringWithFormat:@"SELECT %@, %@, %@ from %@ AS oa WHERE oa.%@ = ?", @"source", @"modification_date", @"status", v8, @"object"];

  id v10 = [v7 protectedDatabase];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__HDObjectAuthorizationEntity_authorizationRecordsBySourceForSampleWithUUID_profile_error___block_invoke_2;
  v16[3] = &unk_1E62F43C8;
  id v17 = *(id *)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__HDObjectAuthorizationEntity_authorizationRecordsBySourceForSampleWithUUID_profile_error___block_invoke_3;
  v13[3] = &unk_1E62F3D60;
  id v14 = *(id *)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  uint64_t v11 = [v10 executeSQL:v9 error:a3 bindingHandler:v16 enumerationHandler:v13];

  return v11;
}

uint64_t __91__HDObjectAuthorizationEntity_authorizationRecordsBySourceForSampleWithUUID_profile_error___block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __91__HDObjectAuthorizationEntity_authorizationRecordsBySourceForSampleWithUUID_profile_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F2B2B8]);
  [v4 setObjectUUID:*(void *)(a1 + 32)];
  uint64_t v5 = MEMORY[0x1C1879F90](a2, 0);
  [v4 setSourceUUID:v5];

  MEMORY[0x1C1879F40](a2, 1);
  objc_msgSend(v4, "setModificationDate:");
  [v4 setStatus:HDSQLiteColumnAsInt64()];
  id v6 = *(void **)(a1 + 40);
  id v7 = [v4 sourceUUID];
  [v6 setObject:v4 forKeyedSubscript:v7];

  return 1;
}

+ (id)pruneWithProfile:(id)a3 nowDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
  id v12 = objc_msgSend(v11, "hk_dateBySubtractingDays:fromDate:", *MEMORY[0x1E4F299B8], v10);

  [v12 timeIntervalSinceReferenceDate];
  id v13 = (void *)MEMORY[0x1E4F65D00];
  id v14 = objc_msgSend(NSNumber, "numberWithDouble:");
  id v15 = [v13 predicateWithProperty:@"modification_date" lessThanValue:v14];

  id v16 = [MEMORY[0x1E4F65D48] isNotNullPredicateWithProperty:@"session"];
  id v17 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v15 otherPredicate:v16];

  uint64_t v26 = 0;
  int v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  uint64_t v18 = [v9 database];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __68__HDObjectAuthorizationEntity_pruneWithProfile_nowDate_limit_error___block_invoke;
  v22[3] = &unk_1E62F6778;
  id v19 = v17;
  id v24 = &v26;
  unint64_t v25 = a5;
  id v23 = v19;
  LODWORD(a6) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v18 error:a6 block:v22];

  if (a6)
  {
    id v20 = [NSNumber numberWithInt:*((unsigned int *)v27 + 6)];
  }
  else
  {
    id v20 = 0;
  }

  _Block_object_dispose(&v26, 8);

  return v20;
}

uint64_t __68__HDObjectAuthorizationEntity_pruneWithProfile_nowDate_limit_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 protectedDatabase];
  id v6 = +[HDSQLiteEntity queryWithDatabase:v5 predicate:a1[4] limit:a1[6] orderingTerms:0 groupBy:0];
  uint64_t v7 = [v6 deleteAllEntitiesWithError:a3];
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = [v5 getChangesCount];

  return v7;
}

@end