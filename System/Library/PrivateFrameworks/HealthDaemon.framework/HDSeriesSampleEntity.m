@interface HDSeriesSampleEntity
+ (BOOL)deleteSeriesWithID:(id)a3 deleteSeriesData:(BOOL)a4 insertDeletedObject:(BOOL)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8;
+ (BOOL)migrateDataFromDataStore:(const void *)a3 to:(void *)a4 database:(id)a5 recoveryAnalytics:(id)a6 error:(id *)a7;
+ (BOOL)migrateDataToSQLFromStore:(const void *)a3 database:(id)a4 error:(id *)a5;
+ (BOOL)replaceObjectID:(id)a3 replacementObjectID:(id)a4 deleteOriginalSeriesData:(BOOL)a5 insertDeletedObject:(BOOL)a6 profile:(id)a7 transaction:(id)a8 error:(id *)a9;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)additionalPredicateForEnumeration;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)foreignKeys;
+ (id)freezeSeriesWithIdentifier:(id)a3 metadata:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
+ (id)objectInsertionFilterForProfile:(id)a3;
+ (id)seriesSampleWithID:(id)a3 profile:(id)a4 error:(id *)a5;
+ (uint64_t)_insertionEra;
+ (void)updateInsertionEra;
- (BOOL)canAddDatumInDatabase:(id)a3 error:(id *)a4;
- (BOOL)updateSampleCount:(int64_t)a3 withDatabase:(id)a4 error:(id *)a5;
- (id)HFDKeyWithDatabase:(id)a3 error:(id *)a4;
- (id)freezeWithTransaction:(id)a3 profile:(id)a4 error:(id *)a5;
@end

@implementation HDSeriesSampleEntity

+ (uint64_t)_insertionEra
{
  if (_MergedGlobals_203 != -1) {
    dispatch_once(&_MergedGlobals_203, &__block_literal_global_93);
  }
  return qword_1EBA18BE8;
}

+ (id)objectInsertionFilterForProfile:(id)a3
{
  id v4 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___HDSeriesSampleEntity;
  v5 = objc_msgSendSuper2(&v11, sel_objectInsertionFilterForProfile_, v4);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__HDSeriesSampleEntity_objectInsertionFilterForProfile___block_invoke;
  aBlock[3] = &unk_1E62FFC58;
  id v10 = v5;
  id v6 = v5;
  v7 = _Block_copy(aBlock);

  return v7;
}

uint64_t __56__HDSeriesSampleEntity_objectInsertionFilterForProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if ([v4 _isFrozen]) {
      uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__HDSeriesSampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v18[3] = &unk_1E62FFC80;
  id v19 = v12;
  id v20 = v11;
  id v21 = a1;
  id v13 = v11;
  id v14 = v12;
  if ([a5 executeSQL:@"INSERT INTO data_series (data_id, frozen, count, insertion_era, hfd_key, series_location) VALUES (?, ?, ?, ?, (COALESCE((SELECT MAX(hfd_key) + 1 FROM data_series), 1)), 2)", a7, v18, 0 error bindingHandler enumerationHandler])v15 = v14; {
  else
  }
    v15 = 0;
  id v16 = v15;

  return v16;
}

- (BOOL)updateSampleCount:(int64_t)a3 withDatabase:(id)a4 error:(id *)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v12[0] = @"count";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__HDSeriesSampleEntity_updateSampleCount_withDatabase_error___block_invoke;
  v11[3] = &__block_descriptor_40_e34_v16__0__HDSQLiteStatementBinder__8l;
  v11[4] = a3;
  LOBYTE(a5) = [(HDSQLiteEntity *)self updateProperties:v9 database:v8 error:a5 bindingHandler:v11];

  return (char)a5;
}

void __61__HDSeriesSampleEntity_updateSampleCount_withDatabase_error___block_invoke()
{
}

- (BOOL)canAddDatumInDatabase:(id)a3 error:(id *)a4
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v6[4] = &v8;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HDSeriesSampleEntity_canAddDatumInDatabase_error___block_invoke;
  v7[3] = &unk_1E62F52C8;
  v7[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__HDSeriesSampleEntity_canAddDatumInDatabase_error___block_invoke_2;
  v6[3] = &unk_1E62F5278;
  [a3 executeSQL:@"SELECT frozen FROM data_series WHERE data_id = ?" error:a4 bindingHandler:v7 enumerationHandler:v6];
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __52__HDSeriesSampleEntity_canAddDatumInDatabase_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) persistentID];

  return sqlite3_bind_int64(a2, 1, v3);
}

uint64_t __52__HDSeriesSampleEntity_canAddDatumInDatabase_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ((MEMORY[0x1C1879F00](a2, 0) & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return 0;
}

+ (id)databaseTable
{
  return @"data_series";
}

+ (BOOL)migrateDataFromDataStore:(const void *)a3 to:(void *)a4 database:(id)a5 recoveryAnalytics:(id)a6 error:(id *)a7
{
  return 1;
}

+ (BOOL)migrateDataToSQLFromStore:(const void *)a3 database:(id)a4 error:(id *)a5
{
  return 1;
}

void __37__HDSeriesSampleEntity__insertionEra__block_invoke()
{
  qword_1EBA18BE8 = (uint64_t)CFAbsoluteTimeGetCurrent();
}

+ (void)updateInsertionEra
{
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  {
    uint64_t v5 = a3;
    a3 = v5;
    if (v4)
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_0, 0, &dword_1BCB7D000);
      a3 = v5;
    }
  }
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)+[HDSeriesSampleEntity columnDefinitionsWithCount:]::columnDefinitions;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"data_id";
  v2 = +[HDDataEntity defaultForeignKey];
  v6[0] = v2;
  sqlite3_int64 v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)freezeSeriesWithIdentifier:(id)a3 metadata:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__89;
  v36 = __Block_byref_object_dispose__89;
  id v13 = v10;
  id v37 = v13;
  id v14 = [v12 database];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __74__HDSeriesSampleEntity_freezeSeriesWithIdentifier_metadata_profile_error___block_invoke;
  v26[3] = &unk_1E62FFBE0;
  id v31 = a1;
  id v27 = v13;
  id v28 = v12;
  id v29 = v11;
  v30 = &v32;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __74__HDSeriesSampleEntity_freezeSeriesWithIdentifier_metadata_profile_error___block_invoke_315;
  v21[3] = &unk_1E62FFC08;
  id v15 = v27;
  id v22 = v15;
  id v16 = v29;
  id v23 = v16;
  id v25 = a1;
  id v17 = v28;
  id v24 = v17;
  LODWORD(a6) = [a1 performWriteTransactionWithHealthDatabase:v14 error:a6 block:v26 inaccessibilityHandler:v21];

  if (a6) {
    v18 = (void *)v33[5];
  }
  else {
    v18 = 0;
  }
  id v19 = v18;

  _Block_object_dispose(&v32, 8);

  return v19;
}

uint64_t __74__HDSeriesSampleEntity_freezeSeriesWithIdentifier_metadata_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:*(void *)(a1 + 64)];
  v7 = *(void **)(a1 + 64);
  uint64_t v8 = HDDataEntityPredicateForDataUUID();
  v9 = [v7 anyInDatabase:v6 predicate:v8 error:a3];

  if (v9)
  {
    id v10 = [v9 freezeWithTransaction:v5 profile:*(void *)(a1 + 40) error:a3];

    if (v10)
    {
      id v11 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10, "persistentID"));
      id v12 = *(void **)(a1 + 48);
      if (!v12 || ![v12 count])
      {
        id v22 = 0;
        goto LABEL_11;
      }
      id v13 = [*(id *)(a1 + 64) seriesSampleWithID:v11 profile:*(void *)(a1 + 40) error:a3];
      id v14 = v13;
      if (!v13)
      {
        id v22 = 0;
        goto LABEL_24;
      }
      [v13 _setMetadata:*(void *)(a1 + 48)];
      id v15 = [v14 sourceRevision];
      id v16 = [v15 source];
      uint64_t v17 = [v16 _sourceID];

      v18 = *(void **)(a1 + 64);
      uint64_t v19 = *(void *)(a1 + 40);
      id v42 = 0;
      id v43 = 0;
      v40 = (void *)v17;
      uint64_t v20 = [v18 shouldInsertObject:v14 sourceID:v17 profile:v19 transaction:v5 objectToReplace:&v43 objectID:&v42 error:a3];
      id v21 = v43;
      v38 = v21;
      id v39 = v42;
      if (v20 == 1)
      {
        if ([*(id *)(a1 + 64) deleteSeriesWithID:v11 deleteSeriesData:1 insertDeletedObject:0 profile:*(void *)(a1 + 40) transaction:v5 error:a3])
        {
          uint64_t v34 = [v21 UUID];
          char v23 = 0;
          id v22 = 0;
          uint64_t v35 = *(void *)(*(void *)(a1 + 56) + 8);
          id v25 = *(void **)(v35 + 40);
          *(void *)(v35 + 40) = v34;
          uint64_t v24 = 1;
          goto LABEL_19;
        }
      }
      else if (v20 != 2)
      {
        id v22 = v39;
        id v37 = [*(id *)(a1 + 40) metadataManager];
        char v23 = objc_msgSend(v37, "insertMetadata:forObjectID:sourceID:externalSyncObjectCode:objectDeleted:error:", *(void *)(a1 + 48), v11, v17, objc_msgSend(v14, "_externalSyncObjectCode"), 0, a3);
        uint64_t v24 = 0;
        id v25 = v37;
LABEL_19:

        goto LABEL_21;
      }
      char v23 = 0;
      id v22 = 0;
      uint64_t v24 = 0;
LABEL_21:

      if ((v23 & 1) == 0)
      {
LABEL_25:

        goto LABEL_26;
      }
      if (v22
        && ([*(id *)(a1 + 64) replaceObjectID:v22 replacementObjectID:v11 deleteOriginalSeriesData:1 insertDeletedObject:1 profile:*(void *)(a1 + 40) transaction:v5 error:a3] & 1) == 0)
      {
LABEL_24:
        uint64_t v24 = 0;
        goto LABEL_25;
      }
LABEL_11:
      v26 = *(void **)(a1 + 64);
      uint64_t v27 = *(void *)(a1 + 32);
      uint64_t v28 = *(void *)(a1 + 40);
      id v41 = 0;
      id v29 = [v26 objectWithUUID:v27 encodingOptions:0 profile:v28 error:&v41];
      id v30 = v41;
      if (v29)
      {
        id v31 = [*(id *)(a1 + 40) dataManager];
        v46[0] = v29;
        uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
        [v31 shouldNotifyForDataObjects:v32 provenance:0 database:v6 anchor:v11];
      }
      else
      {
        _HKInitializeLogging();
        v33 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v45 = v30;
          _os_log_error_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_ERROR, "Failed to look up series after freezing: %{public}@", buf, 0xCu);
        }
      }

      uint64_t v24 = 1;
      goto LABEL_25;
    }
  }
  uint64_t v24 = 0;
LABEL_26:

  return v24;
}

uint64_t __74__HDSeriesSampleEntity_freezeSeriesWithIdentifier_metadata_profile_error___block_invoke_315(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [[_HDSeriesFreezeJournalEntry alloc] initWithSeriesUUID:*(void *)(a1 + 32) metadata:*(void *)(a1 + 40) class:objc_opt_class()];
  id v6 = [*(id *)(a1 + 48) database];
  uint64_t v7 = [v6 addJournalEntry:v5 error:a3];

  return v7;
}

+ (BOOL)deleteSeriesWithID:(id)a3 deleteSeriesData:(BOOL)a4 insertDeletedObject:(BOOL)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  BOOL v11 = a5;
  BOOL v12 = a4;
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__89;
  uint64_t v27 = __Block_byref_object_dispose__89;
  id v28 = 0;
  id v16 = [[HDDataEntityDeletionContext alloc] initWithProfile:v14 transaction:v15];
  [(HDDataEntityDeletionContext *)v16 setInsertDeletedObjects:v11];
  [(HDDataEntityDeletionContext *)v16 setCallWillDeleteWithProfileTransaction:v12];
  uint64_t v17 = HDDataEntityPredicateForRowID((uint64_t)v13, 1);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __106__HDSeriesSampleEntity_deleteSeriesWithID_deleteSeriesData_insertDeletedObject_profile_transaction_error___block_invoke;
  v22[3] = &unk_1E62FFC30;
  v22[4] = &v29;
  v22[5] = &v23;
  +[HDSampleEntity deleteSamplesWithPredicate:v17 limit:0 deletionContext:v16 completionHandler:v22];

  id v18 = (id)v24[5];
  uint64_t v19 = v18;
  if (v18)
  {
    if (a8) {
      *a8 = v18;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v20 = *((unsigned char *)v30 + 24);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v20;
}

void __106__HDSeriesSampleEntity_deleteSeriesWithID_deleteSeriesData_insertDeletedObject_profile_transaction_error___block_invoke(uint64_t a1, char a2, int a3, int a4, int a5, int a6, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

+ (id)seriesSampleWithID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v14 = 0;
  v9 = [a1 objectWithID:v8 encodingOptions:0 profile:a4 error:&v14];
  id v10 = v14;
  id v11 = v10;
  if (v9)
  {
    id v12 = v9;
    goto LABEL_10;
  }
  if (v10)
  {
    id v11 = v10;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Could not find series with ID %@", v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
LABEL_6:
    if (a5)
    {
      id v11 = v11;
      *a5 = v11;
    }
    else
    {
      _HKLogDroppedError();
    }
  }

LABEL_10:

  return v9;
}

+ (BOOL)replaceObjectID:(id)a3 replacementObjectID:(id)a4 deleteOriginalSeriesData:(BOOL)a5 insertDeletedObject:(BOOL)a6 profile:(id)a7 transaction:(id)a8 error:(id *)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  if (+[HDAssociationEntity copyAssociationsFromChildID:v15 toObjectID:a4 profile:v16 error:a9])
  {
    char v18 = [a1 deleteSeriesWithID:v15 deleteSeriesData:v12 insertDeletedObject:v11 profile:v16 transaction:v17 error:a9];
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (id)freezeWithTransaction:(id)a3 profile:(id)a4 error:(id *)a5
{
  return 0;
}

+ (id)additionalPredicateForEnumeration
{
  return (id)[MEMORY[0x1E4F65D00] predicateWithProperty:@"frozen" value:&unk_1F17ECBB8 comparisonType:2];
}

uint64_t __86__HDSeriesSampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) longLongValue]);
  sqlite3_bind_int(a2, 2, [*(id *)(a1 + 40) _isFrozen]);
  sqlite3_bind_int64(a2, 3, [*(id *)(a1 + 40) count]);
  sqlite3_int64 v4 = +[HDSeriesSampleEntity _insertionEra]();

  return sqlite3_bind_int64(a2, 4, v4);
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  return 0;
}

- (id)HFDKeyWithDatabase:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v16[0] = @"hfd_key";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__HDSeriesSampleEntity_HFDKeyWithDatabase_error___block_invoke;
  v11[3] = &unk_1E62FFCA8;
  v11[4] = &v12;
  BOOL v8 = [(HDSQLiteEntity *)self getValuesForProperties:v7 database:v6 error:a4 handler:v11];

  if (v8)
  {
    if (v13[3])
    {
      v9 = objc_msgSend(NSNumber, "numberWithLongLong:");
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 100, @"Unable to get %@ for %@ with persistentID %lld", @"hfd_key", objc_opt_class(), -[HDSQLiteEntity persistentID](self, "persistentID"));
  }
  v9 = 0;
LABEL_6:
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __49__HDSeriesSampleEntity_HFDKeyWithDatabase_error___block_invoke(uint64_t a1)
{
  uint64_t result = HDSQLiteColumnAsInt64();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end