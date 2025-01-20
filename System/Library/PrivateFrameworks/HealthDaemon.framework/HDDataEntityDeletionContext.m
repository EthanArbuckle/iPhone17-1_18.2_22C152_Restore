@interface HDDataEntityDeletionContext
- (BOOL)callWillDeleteWithProfileTransaction;
- (BOOL)deleteObjectWithPersistentID:(int64_t)a3 entityClass:(Class)a4 error:(id *)a5;
- (BOOL)deleteObjectWithPersistentID:(int64_t)a3 objectUUID:(id)a4 entityClass:(Class)a5 objectType:(id)a6 provenanceIdentifier:(id)a7 deletionDate:(id)a8 deletedSampleIntervals:(id)a9 error:(id *)a10;
- (BOOL)insertDeletedObjects;
- (BOOL)preserveExactStartAndEndDates;
- (HDDataEntityDeletionContext)initWithProfile:(id)a3 transaction:(id)a4;
- (HDDatabaseTransaction)transaction;
- (NSNumber)lastInsertedDeletedObjectPersistentID;
- (NSSet)deletedObjectTypeSet;
- (_HDObjectDeletionInfo)deleteInfoForObjectWithUUID:(SEL)a3 error:(id)a4;
- (id)recursiveDeleteAuthorizationBlock;
- (unint64_t)deletedObjectCount;
- (void)finish;
- (void)setCallWillDeleteWithProfileTransaction:(BOOL)a3;
- (void)setInsertDeletedObjects:(BOOL)a3;
- (void)setPreserveExactStartAndEndDates:(BOOL)a3;
- (void)setRecursiveDeleteAuthorizationBlock:(id)a3;
@end

@implementation HDDataEntityDeletionContext

- (void)setInsertDeletedObjects:(BOOL)a3
{
  self->_insertDeletedObjects = a3;
}

- (void)setRecursiveDeleteAuthorizationBlock:(id)a3
{
}

- (BOOL)deleteObjectWithPersistentID:(int64_t)a3 entityClass:(Class)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v9 = NSStringFromClass(a4);
  id v10 = [(NSMutableDictionary *)self->_deleteStatementsByClassName objectForKeyedSubscript:v9];
  v11 = [(HDDatabaseTransaction *)self->_transaction databaseForEntityClass:a4];
  v28 = v9;
  if (!v10)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v12 = [(objc_class *)a4 deleteStatementsForRelatedEntitiesWithTransaction:self->_transaction];
    [v10 addObjectsFromArray:v12];

    uint64_t v13 = [(objc_class *)a4 baseDataEntityClass];
    if ([(objc_class *)a4 isSubclassOfClass:v13])
    {
      Class v14 = a4;
      do
      {
        v15 = [(objc_class *)v14 deleteStatementWithProperty:@"data_id" database:v11];
        [v10 addObject:v15];
        Class v14 = (Class)[(objc_class *)v14 superclass];
      }
      while (([(objc_class *)v14 isSubclassOfClass:v13] & 1) != 0);
    }
    v9 = v28;
    [(NSMutableDictionary *)self->_deleteStatementsByClassName setObject:v10 forKeyedSubscript:v28];
  }
  if (self->_callWillDeleteWithProfileTransaction)
  {
    v16 = (void *)[[a4 alloc] initWithPersistentID:a3];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      char v18 = [v16 willDeleteWithProfile:WeakRetained transaction:self->_transaction error:a5];

      if ((v18 & 1) == 0)
      {

        BOOL v19 = 0;
        goto LABEL_25;
      }
    }
    else
    {
      [v16 willDeleteFromDatabase:v11];
    }
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v20 = v10;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    v27 = v11;
    uint64_t v23 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __78__HDDataEntityDeletionContext_deleteObjectWithPersistentID_entityClass_error___block_invoke;
        v29[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
        v29[4] = a3;
        if (![v25 performStatementWithError:a5 bindingHandler:v29])
        {
          BOOL v19 = 0;
          goto LABEL_22;
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v22) {
        continue;
      }
      break;
    }
    BOOL v19 = 1;
LABEL_22:
    v11 = v27;
    v9 = v28;
  }
  else
  {
    BOOL v19 = 1;
  }

LABEL_25:
  return v19;
}

- (void)finish
{
}

- (NSNumber)lastInsertedDeletedObjectPersistentID
{
  return self->_lastInsertedDeletedObjectPersistentID;
}

- (unint64_t)deletedObjectCount
{
  return self->_deletedObjectCount;
}

- (NSSet)deletedObjectTypeSet
{
  return &self->_deletedObjectTypeSet->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastInsertedDeletedObjectPersistentID, 0);
  objc_storeStrong(&self->_recursiveDeleteAuthorizationBlock, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_deleteInfoSQL, 0);
  objc_storeStrong((id *)&self->_startAndEndDatesSQL, 0);
  objc_storeStrong((id *)&self->_deletedObjectTypeSet, 0);
  objc_storeStrong((id *)&self->_localSourceIDsByOriginalSourceID, 0);
  objc_storeStrong((id *)&self->_deletedObjectProvenanceIDsByOriginalProvenanceID, 0);
  objc_storeStrong((id *)&self->_deleteStatementsByClassName, 0);

  objc_destroyWeak((id *)&self->_profile);
}

- (HDDataEntityDeletionContext)initWithProfile:(id)a3 transaction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HDDataEntityDeletionContext.m", 44, @"Invalid parameter not satisfying: %@", @"profile != nil" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)HDDataEntityDeletionContext;
  v9 = [(HDDataEntityDeletionContext *)&v18 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_profile, v7);
    objc_storeStrong((id *)&v10->_transaction, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deleteStatementsByClassName = v10->_deleteStatementsByClassName;
    v10->_deleteStatementsByClassName = v11;

    v10->_deletedObjectCount = 0;
    uint64_t v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    deletedObjectTypeSet = v10->_deletedObjectTypeSet;
    v10->_deletedObjectTypeSet = v13;

    lastInsertedDeletedObjectPersistentID = v10->_lastInsertedDeletedObjectPersistentID;
    v10->_lastInsertedDeletedObjectPersistentID = 0;

    *(_WORD *)&v10->_preserveExactStartAndEndDates = 256;
  }

  return v10;
}

- (_HDObjectDeletionInfo)deleteInfoForObjectWithUUID:(SEL)a3 error:(id)a4
{
  id v8 = a4;
  if (!self->_deleteInfoSQL)
  {
    v26 = +[HDDataEntity disambiguatedSQLForProperty:@"data_id"];
    v25 = +[HDDataEntity disambiguatedSQLForProperty:@"data_provenances.source_id"];
    v9 = +[HDDataEntity disambiguatedSQLForProperty:@"provenance"];
    id v10 = +[HDDataEntity disambiguatedSQLForProperty:@"uuid"];
    v11 = +[HDDataEntity disambiguatedSQLForProperty:@"type"];
    v12 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    id v27 = v8;
    uint64_t v13 = a5;
    Class v14 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    v15 = +[HDDataProvenanceEntity databaseTable];
    [NSString stringWithFormat:@"SELECT %@, %@, %@ FROM %@ INNER JOIN %@ AS %@ ON %@.%@=%@.ROWID WHERE ((%@ = ?) AND (%@ = ?))", v26, v25, v9, v12, v14, v15, v12, @"provenance", v15, v10, v11, 0];
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    deleteInfoSQL = self->_deleteInfoSQL;
    self->_deleteInfoSQL = v16;

    a5 = v13;
    id v8 = v27;
  }
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x4010000000;
  v34 = &unk_1BD44B655;
  long long v35 = 0u;
  long long v36 = 0u;
  objc_super v18 = [(HDDatabaseTransaction *)self->_transaction databaseForEntityClass:objc_opt_class()];
  BOOL v19 = self->_deleteInfoSQL;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __65__HDDataEntityDeletionContext_deleteInfoForObjectWithUUID_error___block_invoke;
  v29[3] = &unk_1E62F43C8;
  id v20 = v8;
  id v30 = v20;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __65__HDDataEntityDeletionContext_deleteInfoForObjectWithUUID_error___block_invoke_2;
  v28[3] = &unk_1E62F3640;
  v28[4] = &v31;
  char v21 = [v18 executeSQL:v19 error:a5 bindingHandler:v29 enumerationHandler:v28];
  uint64_t v22 = v32;
  *((unsigned char *)v32 + 32) = v21;
  long long v23 = *((_OWORD *)v22 + 3);
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v22 + 2);
  *(_OWORD *)&retstr->var2 = v23;

  _Block_object_dispose(&v31, 8);
  return result;
}

uint64_t __65__HDDataEntityDeletionContext_deleteInfoForObjectWithUUID_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();

  return sqlite3_bind_int64(a2, 2, 1);
}

uint64_t __65__HDDataEntityDeletionContext_deleteInfoForObjectWithUUID_error___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = HDSQLiteColumnAsInt64();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = HDSQLiteColumnAsInt64();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = HDSQLiteColumnAsInt64();
  return 0;
}

uint64_t __78__HDDataEntityDeletionContext_deleteObjectWithPersistentID_entityClass_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __125__HDDataEntityDeletionContext__deleteAssociatedObjectsForPersistentID_entityClass_deletionDate_deletedSampleIntervals_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  v15 = *(void **)(a1 + 32);
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a3;
  [v15 addObject:v18];
  [*(id *)(a1 + 40) addObject:v16];

  uint64_t v20 = [*(id *)(a1 + 48) deleteObjectWithPersistentID:a2 objectUUID:v19 entityClass:a4 objectType:v18 provenanceIdentifier:v17 deletionDate:*(void *)(a1 + 56) deletedSampleIntervals:*(void *)(a1 + 64) error:a8];
  return v20;
}

- (BOOL)deleteObjectWithPersistentID:(int64_t)a3 objectUUID:(id)a4 entityClass:(Class)a5 objectType:(id)a6 provenanceIdentifier:(id)a7 deletionDate:(id)a8 deletedSampleIntervals:(id)a9 error:(id *)a10
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v100 = a4;
  id v98 = a6;
  id v97 = a7;
  id v101 = a8;
  id v102 = a9;
  if (!self->_recursiveDeleteAuthorizationBlock)
  {
LABEL_9:
    v26 = objc_opt_class();
    location = (id *)&self->_profile;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v96 = [v26 attachmentObjectIdentifierForSampleWithUUID:v100 profile:WeakRetained transaction:self->_transaction error:a10];

    uint64_t v108 = 0;
    uint64_t v109 = 0;
    char v107 = 1;
    v99 = [(HDDatabaseTransaction *)self->_transaction databaseForEntityClass:a5];
    id v105 = 0;
    id v106 = 0;
    int v28 = +[HDDataExternalSyncIdentifierEntity populateSyncInfoForObjectID:a3 database:v99 localSourceIDOut:&v109 externalSyncObjectCodeOut:&v108 syncIdentifierOut:&v106 syncVersionOut:&v105 deletedOut:&v107 errorOut:a10];
    id v29 = v106;
    id v95 = v105;
    if (!v28)
    {
      v38 = v29;
LABEL_92:

      goto LABEL_93;
    }
    if (v29)
    {
      if (v107)
      {
        _HKInitializeLogging();
        id v30 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = a3;
          _os_log_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_DEFAULT, "Attempted to delete the object with ID '%lld' which external sync already considers to be deleted", buf, 0xCu);
        }
      }
    }
    if (self->_insertDeletedObjects)
    {
      id v31 = v99;
      uint64_t v119 = 0;
      v120 = (double *)&v119;
      uint64_t v121 = 0x2020000000;
      uint64_t v122 = 0;
      uint64_t v115 = 0;
      v116 = (double *)&v115;
      uint64_t v117 = 0x2020000000;
      uint64_t v118 = 0;
      startAndEndDatesSQL = self->_startAndEndDatesSQL;
      if (!startAndEndDatesSQL)
      {
        id v33 = v29;
        id v34 = [NSString alloc];
        long long v35 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
        long long v36 = (NSString *)[v34 initWithFormat:@"SELECT %@, %@ FROM %@ WHERE %@ = ?", @"start_date", @"end_date", v35, @"data_id"];
        v37 = self->_startAndEndDatesSQL;
        self->_startAndEndDatesSQL = v36;

        startAndEndDatesSQL = self->_startAndEndDatesSQL;
        id v29 = v33;
      }
      id v110 = (id)MEMORY[0x1E4F143A8];
      uint64_t v111 = 3221225472;
      uint64_t v112 = (uint64_t)__123__HDDataEntityDeletionContext__startAndEndDatesForSampleWithPersistentID_startTimestampOut_endTimestampOut_database_error___block_invoke;
      v113 = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
      int64_t v114 = a3;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __123__HDDataEntityDeletionContext__startAndEndDatesForSampleWithPersistentID_startTimestampOut_endTimestampOut_database_error___block_invoke_2;
      v124 = &unk_1E62F5978;
      v125 = &v119;
      v126 = &v115;
      int v28 = [v31 executeSQL:startAndEndDatesSQL error:a10 bindingHandler:&v110 enumerationHandler:buf];
      v38 = v29;
      double v39 = 0.0;
      double v40 = 0.0;
      if (v28)
      {
        double v39 = v120[3];
        double v40 = v116[3];
      }
      _Block_object_dispose(&v115, 8);
      _Block_object_dispose(&v119, 8);

      if (!v28) {
        goto LABEL_92;
      }
    }
    else
    {
      v38 = v29;
      double v39 = 0.0;
      double v40 = 0.0;
    }
    if (![(HDDataEntityDeletionContext *)self deleteObjectWithPersistentID:a3 entityClass:a5 error:a10])
    {
LABEL_91:
      LOBYTE(v28) = 0;
      goto LABEL_92;
    }
    if (v102) {
      [v102 insertIntervalWithStartTime:v39 endTime:v40];
    }
    if (!v101 || !v97 || !self->_insertDeletedObjects)
    {
LABEL_89:
      id v81 = objc_loadWeakRetained(location);
      v82 = [v81 attachmentManager];
      v83 = [v98 attachmentSchemaIdentifier];
      int v84 = [v82 removeAttachmentReferencesWithObjectIdentifier:v96 schemaIdentifier:v83 transaction:self->_transaction error:a10];

      if (v84)
      {
        ++self->_deletedObjectCount;
        [(NSMutableSet *)self->_deletedObjectTypeSet addObject:v98];
        LOBYTE(v28) = 1;
        goto LABEL_92;
      }
      goto LABEL_91;
    }
    v89 = [MEMORY[0x1E4F2AEF0] _deletedObjectWithUUID:v100 metadata:0];
    v90 = (void *)[(objc_class *)a5 _deletedEntityClass];
    if (!v90)
    {
      v86 = [MEMORY[0x1E4F28B00] currentHandler];
      [v86 handleFailureInMethod:a2, self, @"HDDataEntityDeletionContext.m", 287, @"Invalid parameter not satisfying: %@", @"deletedEntityClass != Nil" object file lineNumber description];
    }
    id v104 = 0;
    id v41 = v97;
    deletedObjectProvenanceIDsByOriginalProvenanceID = self->_deletedObjectProvenanceIDsByOriginalProvenanceID;
    if (deletedObjectProvenanceIDsByOriginalProvenanceID)
    {
      v43 = v41;
      v44 = -[NSMutableDictionary objectForKeyedSubscript:](deletedObjectProvenanceIDsByOriginalProvenanceID, "objectForKeyedSubscript:");
      if (v44)
      {
        id v45 = v44;
        goto LABEL_62;
      }
    }
    else
    {
      v43 = v41;
      v46 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v47 = self->_deletedObjectProvenanceIDsByOriginalProvenanceID;
      self->_deletedObjectProvenanceIDsByOriginalProvenanceID = v46;
    }
    id v48 = objc_loadWeakRetained(location);
    v88 = [v48 dataProvenanceManager];

    v49 = [v88 originProvenanceForPersistentID:v43 transaction:self->_transaction error:&v104];
    v93 = v49;
    v50 = v49;
    if (!v49)
    {
      id v45 = 0;
      goto LABEL_61;
    }
    if (![v49 syncProvenance])
    {
      uint64_t v51 = [v93 syncIdentity];
      id v52 = objc_loadWeakRetained(location);
      LOBYTE(v51) = v51 == [v52 currentSyncIdentityPersistentID];

      if (v51) {
        goto LABEL_39;
      }
    }
    v54 = [v93 sourceID];
    id v110 = 0;
    id v55 = v54;
    localSourceIDsByOriginalSourceID = self->_localSourceIDsByOriginalSourceID;
    if (localSourceIDsByOriginalSourceID)
    {
      uint64_t v57 = [(NSMutableDictionary *)localSourceIDsByOriginalSourceID objectForKeyedSubscript:v55];
      if (v57)
      {
LABEL_48:

        unint64_t v63 = (unint64_t)v110;
        if (v57 || !v63)
        {
          if (v57 | v63)
          {
            v65 = (void *)[v93 copy];
            [v65 setSyncProvenance:0];
            [v65 setSourceID:v57];
            id v66 = objc_loadWeakRetained(location);
            objc_msgSend(v65, "setSyncIdentity:", objc_msgSend(v66, "currentSyncIdentityPersistentID"));

            v67 = [v88 provenanceEntityForProvenance:v65 error:&v104];
            v68 = v67;
            if (v67)
            {
              objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v67, "persistentID"));
              id v53 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              id v53 = 0;
            }

            if (!v53) {
              goto LABEL_60;
            }
            goto LABEL_59;
          }
          _HKInitializeLogging();
          v64 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v43;
            _os_log_impl(&dword_1BCB7D000, v64, OS_LOG_TYPE_INFO, "Unable to find localSourceID for originalProvenanceID (%@), so we'll keep using the originalProvenanceID", buf, 0xCu);
          }
LABEL_39:
          id v53 = v43;
LABEL_59:
          [(NSMutableDictionary *)self->_deletedObjectProvenanceIDsByOriginalProvenanceID setObject:v53 forKeyedSubscript:v43];
LABEL_60:
          v50 = v93;
          id v45 = v53;
          goto LABEL_61;
        }
        id v104 = (id) v63;

        id v45 = 0;
        v50 = v93;
LABEL_61:

LABEL_62:
        id v94 = v104;
        if (!v45)
        {
          _HKInitializeLogging();
          v76 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v43;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v94;
            _os_log_impl(&dword_1BCB7D000, v76, OS_LOG_TYPE_INFO, "Failed to get deleted object provenance for original provenance %{public}@: %{public}@", buf, 0x16u);
          }
          id v77 = v94;
          id v70 = v77;
          if (v77)
          {
            if (a10)
            {
              id v70 = v77;
              *a10 = v70;
            }
            else
            {
              _HKLogDroppedError();
            }
          }
          int v75 = 1;
LABEL_88:

          if (v75) {
            goto LABEL_91;
          }
          goto LABEL_89;
        }
        if (!self->_preserveExactStartAndEndDates)
        {
          double v39 = (double)((uint64_t)v39 / 86400) * 86400.0;
          double v40 = (double)((uint64_t)v40 / 86400 + 1) * 86400.0;
        }
        id v103 = 0;
        v69 = [v90 insertDeletedObject:v89 dataType:v98 provenanceIdentifier:v45 deletionDate:v101 persistStartAndEndDates:1 startTimestamp:v99 endTimestamp:v39 inDatabase:v40 error:&v103];
        id v70 = v103;
        if (v69)
        {
          uint64_t v71 = [v69 longLongValue];
          lastInsertedDeletedObjectPersistentID = self->_lastInsertedDeletedObjectPersistentID;
          if (!lastInsertedDeletedObjectPersistentID
            || v71 > [(NSNumber *)lastInsertedDeletedObjectPersistentID longLongValue])
          {
            objc_storeStrong((id *)&self->_lastInsertedDeletedObjectPersistentID, v69);
          }
          if (!v38
            || (id v73 = objc_loadWeakRetained(location),
                LOBYTE(v87) = 1,
                BOOL v74 = +[HDDataExternalSyncIdentifierEntity insertSyncIdentifierWithProfile:v73 database:v99 objectID:v71 localSourceID:v109 externalSyncObjectCode:v108 syncIdentifier:v38 syncVersion:v95 deleted:v87 errorOut:a10], v73, v74))
          {
            int v75 = 0;
LABEL_87:

            goto LABEL_88;
          }
        }
        else
        {
          _HKInitializeLogging();
          v78 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v90;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = a5;
            *(_WORD *)&buf[22] = 2114;
            v124 = v70;
            _os_log_impl(&dword_1BCB7D000, v78, OS_LOG_TYPE_INFO, "Failed to insert deleted object with entity class %{public}@ after deleting an object of class %{public}@: %{public}@", buf, 0x20u);
          }
          id v79 = v70;
          v80 = v79;
          if (v79)
          {
            if (a10) {
              *a10 = v79;
            }
            else {
              _HKLogDroppedError();
            }
          }
        }
        int v75 = 1;
        goto LABEL_87;
      }
    }
    else
    {
      v58 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v59 = self->_localSourceIDsByOriginalSourceID;
      self->_localSourceIDsByOriginalSourceID = v58;
    }
    id v60 = objc_loadWeakRetained(location);
    v61 = [v60 sourceManager];
    v62 = [v61 localSourceForSourceID:v55 copyIfNecessary:1 error:&v110];

    if (v62)
    {
      uint64_t v57 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v62, "persistentID"));
      [(NSMutableDictionary *)self->_localSourceIDsByOriginalSourceID setObject:v57 forKeyedSubscript:v55];
    }
    else
    {
      uint64_t v57 = 0;
    }
    goto LABEL_48;
  }
  id v16 = v101;
  id v17 = v102;
  id v18 = [(HDDatabaseTransaction *)self->_transaction databaseForEntityClass:a5];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v110 = 0;
  uint64_t v111 = (uint64_t)&v110;
  uint64_t v112 = 0x2020000000;
  v113 = 0;
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __125__HDDataEntityDeletionContext__deleteAssociatedObjectsForPersistentID_entityClass_deletionDate_deletedSampleIntervals_error___block_invoke;
  v124 = &unk_1E63014C0;
  v130 = &v110;
  char v21 = (uint64_t *)v19;
  v125 = v21;
  uint64_t v22 = (uint64_t *)v20;
  v126 = v22;
  v127 = self;
  id v23 = v16;
  id v128 = v23;
  id v24 = v17;
  id v129 = v24;
  if ([(objc_class *)a5 enumerateAssociatedObjectsForIdentifier:a3 inDatabase:v18 error:a10 associatedObjectHandler:buf])
  {
    if (!*(void *)(v111 + 24) || ((*((uint64_t (**)(void))self->_recursiveDeleteAuthorizationBlock + 2))() & 1) != 0)
    {
      int v25 = 1;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a10, 3, @"object not found");
    [v18 requireRollback];
  }
  int v25 = 0;
LABEL_8:

  _Block_object_dispose(&v110, 8);
  if (v25) {
    goto LABEL_9;
  }
  LOBYTE(v28) = 0;
LABEL_93:

  return v28;
}

uint64_t __123__HDDataEntityDeletionContext__startAndEndDatesForSampleWithPersistentID_startTimestampOut_endTimestampOut_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __123__HDDataEntityDeletionContext__startAndEndDatesForSampleWithPersistentID_startTimestampOut_endTimestampOut_database_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = MEMORY[0x1C1879F40](a2, 0);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = MEMORY[0x1C1879F40](a2, 1);
  return 1;
}

void __37__HDDataEntityDeletionContext_finish__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) finish];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (HDDatabaseTransaction)transaction
{
  return self->_transaction;
}

- (id)recursiveDeleteAuthorizationBlock
{
  return self->_recursiveDeleteAuthorizationBlock;
}

- (BOOL)insertDeletedObjects
{
  return self->_insertDeletedObjects;
}

- (BOOL)preserveExactStartAndEndDates
{
  return self->_preserveExactStartAndEndDates;
}

- (void)setPreserveExactStartAndEndDates:(BOOL)a3
{
  self->_preserveExactStartAndEndDates = a3;
}

- (BOOL)callWillDeleteWithProfileTransaction
{
  return self->_callWillDeleteWithProfileTransaction;
}

- (void)setCallWillDeleteWithProfileTransaction:(BOOL)a3
{
  self->_callWillDeleteWithProfileTransaction = a3;
}

@end