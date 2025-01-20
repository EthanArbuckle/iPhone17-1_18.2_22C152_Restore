@interface NSSQLiteConnection
+ (BOOL)_rekeyPersistentStoreAtURL:(void *)a3 options:(void *)a4 withKey:(uint64_t *)a5 error:;
+ (uint64_t)_destroyPersistentStoreAtURL:(void *)a3 options:(uint64_t *)a4 error:;
+ (uint64_t)_replacePersistentStoreAtURL:(void *)a3 destinationOptions:(void *)a4 withPersistentStoreFromURL:(void *)a5 sourceOptions:(uint64_t *)a6 error:;
+ (uint64_t)openAtPath:(uint64_t)a1 withKey:(const char *)a2 handle:(void *)a3 flags:(sqlite3 *)a4 module:(int)a5 checkpointOnClose:(char)a6;
+ (uint64_t)readMagicWordFromPath:(void *)a3 options:;
+ (void)initialize;
- (BOOL)_tableHasRows:(BOOL)result;
- (BOOL)addTombstoneColumnsForRange:(unint64_t)a3;
- (BOOL)addTransactionStringColumnsToTransactionTable;
- (BOOL)databaseIsEmpty;
- (BOOL)finishDeferredLightweightMigration:(uint64_t)a1;
- (BOOL)hasHistoryRows;
- (BOOL)hasHistoryTransactionWithNumber:(id *)a1;
- (BOOL)registerMigrationUpdateFunctionWithMigrator:(uint64_t)a1;
- (CFMutableArrayRef)copyRawIntegerRowsForSQL:(uint64_t)a1;
- (NSObject)_clearCachedStatements;
- (NSObject)_clearOtherStatements;
- (NSSQLitePrefetchRequestCache)prefetchRequestCache;
- (NSSQLiteStatementCache)statementCacheForEntity:(uint64_t)a1;
- allPeerRanges;
- (_PFSQLiteSnapshotWrapper)_currentQueryGenerationSnapshot:(_PFSQLiteSnapshotWrapper *)result;
- (_PFSQLiteSnapshotWrapper)currentQueryGenerationIdentifier;
- (id)_activeGenerations;
- (id)_setSaveRequest:(id *)result;
- (id)adapter;
- (id)createArrayOfPrimaryKeysAndEntityIDsForRowsWithoutRecordMetadataWithEntity:(id *)a3 metadataEntity:;
- (id)createMapOfEntityNameToPKMaxForEntitiesFromPKTable:(uint64_t)a1;
- (id)createMapOfEntityNameToPKMaxForEntitiesFromUBRangeTable:(uint64_t)a1;
- (id)fetchCachedModel;
- (id)fetchCreationSQLForType:(void *)a3 containing:;
- (id)fetchTableCreationSQL;
- (id)fetchTableCreationSQLContaining:(id)result;
- (id)fetchTableNames;
- (id)hasAncillaryEntitiesInHistory;
- (id)initAsQueryGenerationTrackingConnectionForSQLCore:(id)a3;
- (id)initForSQLCore:(id)a3;
- (id)newFetchUUIDSForSubentitiesRootedAt:(uint64_t)a1;
- (id)sqlStatement;
- (id)ubiquityTableValueForKey:(uint64_t)a1;
- (int)registerCurrentQueryGenerationWithStore:(id)a3;
- (sqlite3_int64)_fetchMaxPrimaryKeyForEntity:(uint64_t)a1;
- (sqlite3_int64)fetchMaxPrimaryKeyForEntity:(uint64_t)a1;
- (sqlite3_int64)generatePrimaryKeysForEntity:(unsigned int)a3 batch:;
- (uint64_t)_adoptQueryGenerationWithSnapshot:(uint64_t)a1;
- (uint64_t)_clearBindVariablesForInsertedRow;
- (uint64_t)_clearSaveGeneratedCachedStatements;
- (uint64_t)_countOfVMCachedStatements;
- (uint64_t)_createIndexesForEntities:(void *)a1;
- (uint64_t)_dropAllDATriggers;
- (uint64_t)_dropAllTriggers;
- (uint64_t)_dropKnownHistoryTrackingTables;
- (uint64_t)_dropTableWithName:(uint64_t)a1;
- (uint64_t)_ensureWalFileExists;
- (uint64_t)_hasHistoryTransactionStringTable;
- (uint64_t)_hasOldHistoryTrackingTables;
- (uint64_t)_hasOldHistoryTrackingTablesV0;
- (uint64_t)_hasOldHistoryTrackingTablesV1;
- (uint64_t)_hasPersistentHistoryTables;
- (uint64_t)_hasTableWithName:(int)a3 isTemp:;
- (uint64_t)_insertTransactionForRequestContext:(void *)a3 andStrings:;
- (uint64_t)_insertTransactionStringsForRequestContext:(uint64_t)a1;
- (uint64_t)_int64ResultForSQL:(uint64_t)a1;
- (uint64_t)_registerNewQueryGenerationSnapshot:(uint64_t)a1;
- (uint64_t)_restoreBusyTimeOutSettings;
- (uint64_t)_transactionsStringAndPKsForStrings:(uint64_t)a1;
- (uint64_t)_validateProperty:(void *)a1 withValue:(void *)a2;
- (uint64_t)_walCheckpoint;
- (uint64_t)addVMCachedStatement:(uint64_t)result;
- (uint64_t)adoptQueryGenerationWithIdentifier:(uint64_t)result;
- (uint64_t)canConnect;
- (uint64_t)createTablesForEntities:(uint64_t)result;
- (uint64_t)createTriggersForEntities:(uint64_t)result;
- (uint64_t)dedupeRowsForUniqueConstraintsInCloudKitMetadataEntity:(uint64_t)result;
- (uint64_t)deleteRow:(uint64_t)a3 forRequestContext:;
- (uint64_t)executeCorrelationChangesForValue1:(sqlite3_int64)a3 value2:(sqlite3_int64)a4 value3:(sqlite3_int64)a5 value4:;
- (uint64_t)fetchBufferResultSet:(uint64_t)a3 usingFetchPlan:;
- (uint64_t)fetchResultSet:(uint64_t)a3 usingFetchPlan:;
- (uint64_t)fetchUbiquityKnowledgeVector;
- (uint64_t)freeQueryGenerationWithIdentifier:(uint64_t)a1;
- (uint64_t)gatherHistoryChangesFromTable:(uint64_t)a1;
- (uint64_t)gatherObjectIDsFromTable:(uint64_t)a1;
- (uint64_t)hasAttributeChanges:(void *)a1;
- (uint64_t)hasIndexTrackingTable;
- (uint64_t)hasTransactionStringColumnsInTransactionTable;
- (uint64_t)insertArray:(uint64_t)a3 forEntity:(char)a4 includeOnConflict:;
- (uint64_t)insertDictionaryBlock:(id *)a3 forEntity:(int)a4 includeOnConflict:;
- (uint64_t)insertManagedObjectBlock:(void *)a3 forEntity:(int)a4 includeOnConflict:;
- (uint64_t)insertRow:(uint64_t)result;
- (uint64_t)logQueryPlanForStatement:(uint64_t)a1;
- (uint64_t)numberOfTombstones;
- (uint64_t)percentageUsedByPersistentHistory;
- (uint64_t)recreateIndices;
- (uint64_t)registerCurrentQueryGenerationWithStore:(uint64_t)a3 retries:;
- (uint64_t)saveCachedModel:(uint64_t)result;
- (uint64_t)selectCountWithStatement:(uint64_t)result;
- (uint64_t)setUpIndexTracking;
- (uint64_t)updateConstrainedValuesForRow:(uint64_t)result;
- (uint64_t)updateRow:(uint64_t)a3 forRequestContext:;
- (void)_batchInsertThrowWithErrorCode:(int)a1 andMessage:(void *)a2 forKey:(void *)a3 andValue:(uint64_t)a4 additionalDetail:(uint64_t)a5;
- (void)_clearTransactionCaches;
- (void)_createInsertStatementsForEntities:(void *)a1;
- (void)_dropOldHistoryTrackingTables;
- (void)_endFetch;
- (void)_ensureDatabaseOpen;
- (void)_ensureNoFetchInProgress;
- (void)_ensureNoStatementPrepared;
- (void)_ensureNoTransactionOpen;
- (void)_executeSQLString:(uint64_t)a1;
- (void)_finalizeStatement;
- (void)_forceDisconnectOnError;
- (void)_performBlock:(uint64_t)a1;
- (void)_performPostSaveTasks:(int)a3 andForceFullVacuum:;
- (void)addPeerRange:(void *)result;
- (void)addPeerRangeForPeerID:(uint64_t)a3 entityName:(uint64_t)a4 rangeStart:(uint64_t)a5 rangeEnd:(uint64_t)a6 peerRangeStart:(uint64_t)a7 peerRangeEnd:;
- (void)beginReadTransaction;
- (void)beginTransaction;
- (void)bindTempTableForBindIntarray:(uint64_t)a1;
- (void)bindTempTablesForStatementIfNecessary:(void *)result;
- (void)cacheCurrentDBStatementOn:(uint64_t)a1;
- (void)cacheUpdateConstrainedValuesStatement:(void *)key forEntity:;
- (void)cacheUpdateStatement:(void *)key forEntity:(const void *)a4 andDeltasMask:;
- (void)clearTempTablesBindingsForStatement:(uint64_t)a1;
- (void)commitTransaction;
- (void)configureUbiquityMetadataTable;
- (void)connect;
- (void)createIndexesForEntity:(void *)a1;
- (void)createManyToManyTablesForEntity:(void *)a1;
- (void)createMapOfEntityNameToPKMaxForEntities:(uint64_t)a1;
- (void)createMetadata;
- (void)createMissingHistoryTables;
- (void)createTableForEntity:(void *)a1;
- (void)currentStats;
- (void)dealloc;
- (void)derivedAttributeUpdatedInsertedRowInTable:(uint64_t)a3 withEntityID:(uint64_t)a4 primaryKey:(uint64_t)a5 columnName:(uint64_t)a6 newValue:;
- (void)derivedAttributeUpdatedRowInTable:(uint64_t)a3 withEntityID:(uint64_t)a4 primaryKey:(uint64_t)a5 columnName:(uint64_t)a6 newValue:;
- (void)didCreateSchema;
- (void)disconnect;
- (void)dropHistoryBeforeTransactionID:(id *)a1;
- (void)dropHistoryTrackingTables;
- (void)dropIndexTrackingTable;
- (void)dropUbiquityTables;
- (void)endFetchAndRecycleStatement:(uint64_t)a1;
- (void)execute;
- (void)executeAttributeUniquenessCheckSQLStatement:(void *)a3 returningColumns:;
- (void)executeMulticolumnUniquenessCheckSQLStatement:(void *)a3 returningColumns:;
- (void)fetchMetadata;
- (void)handleCorruptedDB:(uint64_t)a1;
- (void)harvestUsedIndexes;
- (void)insertChanges:(uint64_t)a3 type:(sqlite3_int64)a4 transactionID:(uint64_t)a5 context:;
- (void)insertUpdates:(sqlite3_int64)a3 transactionID:(void *)a4 updatedAttributes:;
- (void)newFetchedArray;
- (void)performAndWait:(uint64_t)a1;
- (void)prepareAndExecuteSQLStatement:(uint64_t)a1;
- (void)prepareInsertStatementForAncillaryEntity:(uint64_t)a1;
- (void)prepareInsertStatementForEntity:(uint64_t)a1 includeConstraints:(void *)a2 includeOnConflict:(int)a3 onConflictKeys:(void *)a4;
- (void)prepareSQLStatement:(uint64_t)a1;
- (void)processDeleteRequest:(uint64_t)a1;
- (void)processExternalDataReferenceFilesDeletedByRequest:(uint64_t)a1;
- (void)processInsertRequest:(uint64_t)a1;
- (void)processMigrationRequestForHash:(uint64_t)a3 stageLabel:;
- (void)processSaveRequest:(uint64_t)a1;
- (void)processUpdateRequest:(void *)a3 withOIDs:(void *)a4 forAttributes:;
- (void)releaseSQLStatement;
- (void)reopenQueryGenerationWithIdentifier:(void *)a3 error:;
- (void)replaceUbiquityKnowledgeVector:(void *)result;
- (void)resetSQLStatement;
- (void)rollbackTransaction;
- (void)saveMetadata:(void *)a1;
- (void)scheduleWALCheckpointAfter:(double)a3 retry:;
- (void)selectRowsWithStatement:(int)a3 cached:;
- (void)setColumnsToFetch:(void *)result;
- (void)setExclusiveLockingMode:(BOOL)a3;
- (void)setSecureDeleteMode:(uint64_t)a1;
- (void)setUbiquityTableValue:(uint64_t)a3 forKey:;
- (void)triggerUpdatedRowInTable:(uint64_t)a3 withEntityID:(uint64_t)a4 primaryKey:columnName:newValue:;
- (void)updateUbiquityKnowledgeForPeerWithID:(void *)a3 andTransactionNumber:;
- (void)updateUbiquityKnowledgeVector:(void *)result;
- (void)writeCorrelationChangesFromTracker:(uint64_t)a1;
- (void)writeCorrelationDeletesFromTracker:(uint64_t)a1;
- (void)writeCorrelationInsertsFromTracker:(uint64_t)a1;
- (void)writeCorrelationMasterReordersFromTracker:(uint64_t)a1;
- (void)writeCorrelationReordersFromTracker:(uint64_t)a1;
@end

@implementation NSSQLiteConnection

- (uint64_t)fetchResultSet:(uint64_t)a3 usingFetchPlan:
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v4 = result;
  v5 = *(NSObject **)(result + 8);
  if (v5) {
    dispatch_assert_queue_V2(v5);
  }
  int v6 = *(_DWORD *)(a3 + 16);
  if (!v6) {
    int v6 = 0x7FFFFFFF;
  }
  int v115 = v6;
  uint64_t v7 = *(void *)(a3 + 48);
  if (v7) {
    int v111 = *(unsigned char *)(v7 + 43) & 1;
  }
  else {
    int v111 = 0;
  }
  int v8 = *(_DWORD *)(a3 + 72);
  uint64_t v117 = [*(id *)(a3 + 40) model];
  if (v115 < 1)
  {
    result = 0;
    goto LABEL_127;
  }
  uint64_t v9 = 0;
  int v10 = 0;
  int v114 = v8 & 0x18;
  char v113 = v8;
  while ((*(unsigned char *)(v4 + 312) & 2) != 0)
  {
    fetchResultSetPrepareNextRow((int *)a2);
    uint64_t v11 = *(unsigned int *)(a2 + 24);
    if ((v11 & 0x80000000) != 0)
    {
      uint64_t v12 = 0;
      if ((v8 & 1) == 0)
      {
LABEL_13:
        uint64_t v13 = *(void *)(a3 + 40);
        if (v13) {
          unsigned int v14 = *(_DWORD *)(v13 + 184);
        }
        else {
          unsigned int v14 = 0;
        }
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v12 = *(void *)(*(void *)(a2 + 64) + 8 * v11) + *(void *)(a2 + 32);
      if ((v8 & 1) == 0) {
        goto LABEL_13;
      }
    }
    unsigned int v15 = sqlite3_column_int(*(sqlite3_stmt **)(v4 + 80), 0);
    if (!v15)
    {
      v107 = @"The database appears corrupt.  (invalid entity key)";
      goto LABEL_132;
    }
    unsigned int v14 = v15;
    if (v15 == *(_DWORD *)(v4 + 92))
    {
      uint64_t v13 = *(void *)(v4 + 104);
    }
    else
    {
      uint64_t v13 = (*(uint64_t (**)(uint64_t, char *, void))(a3 + 64))(v117, sel_entityForID_, v15);
      *(void *)(v4 + 104) = v13;
      *(_DWORD *)(v4 + 92) = v14;
    }
LABEL_20:
    *(_DWORD *)(v12 + 8) = v14;
    int v118 = v10;
    if (v114 == 16)
    {
      *(void *)(v12 + 24) = 0;
      if ((v8 & 2) == 0)
      {
        plan_for_entity = (int *)_sql_read_only_fetch_plan_for_entity((unint64_t *)v13);
        goto LABEL_26;
      }
    }
    else
    {
      sqlite3_int64 v17 = sqlite3_column_int64(*(sqlite3_stmt **)(v4 + 80), 1);
      *(void *)(v12 + 24) = v17;
      if (!v17)
      {
        v107 = @"The database appears corrupt.  (invalid primary key)";
LABEL_132:
        -[NSSQLiteConnection handleCorruptedDB:](v4, (uint64_t)v107);
      }
      if ((v8 & 2) == 0)
      {
        plan_for_entity = (int *)_sql_fetch_plan_for_entity((unint64_t *)v13);
LABEL_26:
        uint64_t v18 = *plan_for_entity;
        if (*(void *)(a2 + 80) - *(void *)(a2 + 88) + *(int *)(a2 + 16) < v18) {
          fetchResultSetReallocCurrentRow(a2, v18);
        }
        unint64_t v119 = plan_for_entity[1];
        if (v119)
        {
          uint64_t v116 = v12;
          unint64_t v19 = 0;
          v20 = plan_for_entity + 3;
          while (1)
          {
            unsigned int v21 = *((unsigned __int8 *)v20 + 8) - 2;
            if (v21 > 6) {
              uint64_t v22 = 3;
            }
            else {
              uint64_t v22 = qword_18AE54438[(char)v21];
            }
            uint64_t v23 = ~v22;
            uint64_t v24 = (v22 + *(void *)(a2 + 88)) & ~v22;
            if (*(void *)(a2 + 80) - v24 + *(int *)(a2 + 16) > 15)
            {
              *(void *)(a2 + 88) = v24;
            }
            else
            {
              fetchResultSetReallocCurrentRow(a2, 16);
              uint64_t v25 = *(void *)(a2 + 80);
              uint64_t v26 = (v22 + *(void *)(a2 + 88)) & v23;
              *(void *)(a2 + 88) = v26;
              if (v25 - v26 + *(int *)(a2 + 16) <= 15)
              {
                uint64_t v27 = [NSString stringWithUTF8String:"less space allocated for fetch result (%ld) than we asked for (%u)!"];
                _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, *(void *)(a2 + 80) - *(void *)(a2 + 88) + *(int *)(a2 + 16));
                v34 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  uint64_t v35 = *(void *)(a2 + 80) - *(void *)(a2 + 88) + *(int *)(a2 + 16);
                  *(_DWORD *)buf = 134218240;
                  uint64_t v121 = v35;
                  __int16 v122 = 1024;
                  int v123 = 16;
                  _os_log_fault_impl(&dword_18AB82000, v34, OS_LOG_TYPE_FAULT, "CoreData: less space allocated for fetch result (%ld) than we asked for (%u)!", buf, 0x12u);
                }
              }
            }
            [*(id *)(v20 + 3) propertyDescription];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              objc_msgSend((id)objc_msgSend(*(id *)(v20 + 3), "propertyDescription"), "isOptional");
            }
            switch(*((unsigned char *)v20 + 8))
            {
              case 1:
                int v62 = sqlite3_column_int(*(sqlite3_stmt **)(v4 + 80), *v20);
                int v63 = v62;
                v64 = *(unsigned char **)(a2 + 88);
                if ((v20[1] & 1) == 0) {
                  goto LABEL_98;
                }
                if (v62) {
                  BOOL v65 = 1;
                }
                else {
                  BOOL v65 = sqlite3_column_type(*(sqlite3_stmt **)(v4 + 80), *v20) != 5;
                }
                unsigned char *v64 = !v65;
                uint64_t v94 = *(void *)(a2 + 88) + 1;
                *(void *)(a2 + 88) = v94;
                if (*v64) {
                  goto LABEL_100;
                }
                v64 = (unsigned char *)((v94 + v22) & v23);
LABEL_98:
                *(_DWORD *)v64 = v63;
                v89 = v64 + 4;
                goto LABEL_99;
              case 2:
              case 3:
                sqlite3_int64 v45 = sqlite3_column_int64(*(sqlite3_stmt **)(v4 + 80), *v20);
                sqlite3_int64 v46 = v45;
                v47 = *(unsigned char **)(a2 + 88);
                if ((v20[1] & 1) == 0) {
                  goto LABEL_83;
                }
                if (v45) {
                  BOOL v48 = 1;
                }
                else {
                  BOOL v48 = sqlite3_column_type(*(sqlite3_stmt **)(v4 + 80), *v20) != 5;
                }
                unsigned char *v47 = !v48;
                uint64_t v88 = *(void *)(a2 + 88) + 1;
                *(void *)(a2 + 88) = v88;
                if (*v47) {
                  goto LABEL_100;
                }
                v47 = (unsigned char *)((v88 + v22) & v23);
LABEL_83:
                *(void *)v47 = v46;
                v89 = v47 + 8;
LABEL_99:
                *(void *)(a2 + 88) = v89;
                goto LABEL_100;
              case 4:
              case 5:
              case 6:
              case 9:
              case 0xC:
              case 0xD:
              case 0xE:
                v36 = sqlite3_column_text(*(sqlite3_stmt **)(v4 + 80), *v20);
                v37 = (const char *)v36;
                if ((v20[1] & 1) == 0) {
                  goto LABEL_48;
                }
                v38 = *(BOOL **)(a2 + 88);
                BOOL v39 = v36 && *v36 || sqlite3_column_type(*(sqlite3_stmt **)(v4 + 80), *v20) != 5;
                BOOL *v38 = !v39;
                uint64_t v40 = *(void *)(a2 + 88) + 1;
                *(void *)(a2 + 88) = v40;
                if (!*v38)
                {
                  *(void *)(a2 + 88) = (v40 + v22) & v23;
LABEL_48:
                  if (v37)
                  {
                    int v41 = strlen(v37) + 1;
                    v42 = *(int **)(a2 + 88);
                    int *v42 = v41;
                    v43 = v42 + 1;
                    *(void *)(a2 + 88) = v43;
                    size_t v44 = v41;
                    if (*(void *)(a2 + 80) - (void)v43 + *(int *)(a2 + 16) < v41)
                    {
                      fetchResultSetReallocCurrentRow(a2, v41);
                      v43 = *(void **)(a2 + 88);
                    }
                    memcpy(v43, v37, v44);
                    *(void *)(a2 + 88) += v44;
                  }
                  else
                  {
                    uint64_t v53 = [NSString stringWithFormat:@"Row (pk = %lld) for entity '%@' is missing mandatory text data for property '%@'", *(void *)(v116 + 24), objc_msgSend((id)objc_msgSend((id)_sqlEntityForEntityID(v117, *(unsigned int *)(v116 + 8)), "entityDescription"), "name"), objc_msgSend((id)objc_msgSend(*(id *)(v20 + 3), "propertyDescription"), "name")];
                    _NSCoreDataLog(1, @"%@\n", v54, v55, v56, v57, v58, v59, v53);
                    uint64_t v60 = *(unsigned int *)(a2 + 24);
                    if ((v60 & 0x80000000) != 0) {
                      uint64_t v61 = 0;
                    }
                    else {
                      uint64_t v61 = *(void *)(*(void *)(a2 + 64) + 8 * v60) + *(void *)(a2 + 32);
                    }
                    unint64_t v119 = 0;
                    *(_DWORD *)uint64_t v61 = -1;
                    *(void *)(v61 + 24) = 0;
                    *(_DWORD *)(v61 + 8) = 0;
                    --*(_DWORD *)a2;
                    *(void *)(a2 + 88) = v61;
                    uint64_t v9 = (v9 - 1);
                  }
                }
                goto LABEL_100;
              case 7:
              case 8:
                double v49 = sqlite3_column_double(*(sqlite3_stmt **)(v4 + 80), *v20);
                double v50 = v49;
                v51 = *(double **)(a2 + 88);
                if ((v20[1] & 1) == 0) {
                  goto LABEL_87;
                }
                BOOL v52 = v49 != 0.0 || sqlite3_column_type(*(sqlite3_stmt **)(v4 + 80), *v20) != 5;
                *(unsigned char *)v51 = !v52;
                uint64_t v90 = *(void *)(a2 + 88) + 1;
                *(void *)(a2 + 88) = v90;
                if (!*(unsigned char *)v51)
                {
                  v51 = (double *)((v90 + v22) & v23);
LABEL_87:
                  double *v51 = v50;
                  *(void *)(a2 + 88) = v51 + 1;
                }
                goto LABEL_100;
              case 0x10:
                if (!v111) {
                  goto LABEL_75;
                }
                if (objc_msgSend((id)objc_msgSend(*(id *)(v20 + 3), "propertyDescription"), "_isFileBackedFuture")) {
                  goto LABEL_75;
                }
                v66 = (const char *)sqlite3_column_blob(*(sqlite3_stmt **)(v4 + 80), *v20);
                int v67 = sqlite3_column_bytes(*(sqlite3_stmt **)(v4 + 80), *v20);
                size_t v68 = (v67 - 1);
                if (v67 < 1) {
                  goto LABEL_75;
                }
                unsigned int v109 = v67;
                result = [MEMORY[0x1E4F28CB8] defaultManager];
                int v69 = *(unsigned __int8 *)v66;
                unsigned int v110 = v9;
                if (v69 == 1)
                {
                  v76 = [_PFExternalReferenceData alloc];
                  uint64_t v95 = *(void *)(v4 + 16);
                  if (v95) {
                    uint64_t v78 = (*(_DWORD *)(v95 + 200) >> 2) & 7;
                  }
                  else {
                    uint64_t v78 = 0;
                  }
                  uint64_t v79 = v109;
                  v80 = v66;
                  uint64_t v81 = 0;
                  uint64_t v82 = 0;
                }
                else
                {
                  if (v69 == 3)
                  {
                    __break(1u);
                    return result;
                  }
                  v108 = v66;
                  uint64_t v70 = objc_msgSend((id)result, "stringWithFileSystemRepresentation:length:", v66 + 1, strnlen(v66 + 1, v68));
                  v71 = (void *)[*(id *)(v4 + 16) externalDataReferencesDirectory];
                  v72 = *(unint64_t **)(v4 + 16);
                  if (v72)
                  {
                    if (!atomic_load(v72 + 21)) {
                      [*(id *)(v4 + 16) externalDataReferencesDirectory];
                    }
                    v72 = (unint64_t *)atomic_load(v72 + 22);
                  }
                  uint64_t v74 = [v71 stringByAppendingPathComponent:v70];
                  uint64_t v75 = [v72 stringByAppendingPathComponent:v70];
                  v76 = [_PFExternalReferenceData alloc];
                  uint64_t v77 = *(void *)(v4 + 16);
                  if (v77) {
                    uint64_t v78 = (*(_DWORD *)(v77 + 200) >> 2) & 7;
                  }
                  else {
                    uint64_t v78 = 0;
                  }
                  uint64_t v79 = v109;
                  v80 = v108;
                  uint64_t v81 = v74;
                  uint64_t v82 = v75;
                }
                v96 = [(_PFExternalReferenceData *)v76 initWithStoreBytes:v80 length:v79 externalLocation:v81 safeguardLocation:v82 protectionLevel:v78];
                int v97 = [(_PFExternalReferenceData *)v96 length];
                int v98 = v97;
                v99 = *(unsigned char **)(a2 + 88);
                if ((v20[1] & 1) == 0) {
                  goto LABEL_111;
                }
                if (v97) {
                  BOOL v100 = 1;
                }
                else {
                  BOOL v100 = sqlite3_column_type(*(sqlite3_stmt **)(v4 + 80), *v20) != 5;
                }
                unsigned char *v99 = !v100;
                uint64_t v101 = *(void *)(a2 + 88) + 1;
                *(void *)(a2 + 88) = v101;
                if (!*v99)
                {
                  v99 = (unsigned char *)((v101 + v22) & v23);
LABEL_111:
                  *(_DWORD *)v99 = v98;
                  v102 = v99 + 4;
                  *(void *)(a2 + 88) = v102;
                  if (*(void *)(a2 + 80) - (void)v102 + *(int *)(a2 + 16) < v98)
                  {
                    fetchResultSetReallocCurrentRow(a2, v98);
                    v102 = *(void **)(a2 + 88);
                  }
                  memcpy(v102, [(_PFExternalReferenceData *)v96 bytes], v98);
                  *(void *)(a2 + 88) += v98;
                }

                uint64_t v9 = v110;
LABEL_100:
                ++v19;
                v20 += 6;
                if (v19 >= v119) {
                  goto LABEL_117;
                }
                break;
              default:
LABEL_75:
                uint64_t v83 = v9;
                int v84 = sqlite3_column_bytes(*(sqlite3_stmt **)(v4 + 80), *v20);
                int v85 = v84;
                v86 = *(unsigned char **)(a2 + 88);
                if ((v20[1] & 1) == 0) {
                  goto LABEL_91;
                }
                if (v84) {
                  BOOL v87 = 1;
                }
                else {
                  BOOL v87 = sqlite3_column_type(*(sqlite3_stmt **)(v4 + 80), *v20) != 5;
                }
                unsigned char *v86 = !v87;
                uint64_t v91 = *(void *)(a2 + 88) + 1;
                *(void *)(a2 + 88) = v91;
                if (!*v86)
                {
                  v86 = (unsigned char *)((v91 + v22) & v23);
LABEL_91:
                  *(_DWORD *)v86 = v85;
                  v92 = v86 + 4;
                  *(void *)(a2 + 88) = v92;
                  if (*(void *)(a2 + 80) - (void)v92 + *(int *)(a2 + 16) < v85)
                  {
                    fetchResultSetReallocCurrentRow(a2, v85);
                    v92 = *(void **)(a2 + 88);
                  }
                  v93 = sqlite3_column_blob(*(sqlite3_stmt **)(v4 + 80), *v20);
                  memcpy(v92, v93, v85);
                  *(void *)(a2 + 88) += v85;
                }
                uint64_t v9 = v83;
                goto LABEL_100;
            }
          }
        }
      }
    }
LABEL_117:
    uint64_t v103 = *(int *)(a2 + 28);
    if (v103 != -1)
    {
      uint64_t v104 = *(void *)(*(void *)(a2 + 64) + 8 * v103);
      if (v104)
      {
        uint64_t v105 = *(void *)(a2 + 32);
        uint64_t v106 = v104 + *(void *)(a2 + 40);
        *(_DWORD *)(v106 + 4) = *(_DWORD *)(a2 + 24);
        *(void *)(v106 + 16) = v105;
      }
    }
    ++*(_DWORD *)(v4 + 88);
    uint64_t v9 = (v9 + 1);
    _execute(v4);
    int v10 = v118 + 1;
    LOBYTE(v8) = v113;
    if (v118 + 1 == v115) {
      break;
    }
  }
  if (v9 <= 0x40000000) {
    result = v9;
  }
  else {
    result = 0;
  }
LABEL_127:
  *(_DWORD *)(a2 + 4) = result;
  if ((*(unsigned char *)(v4 + 312) & 2) == 0) {
    *(_DWORD *)(a2 + 48) |= 1u;
  }
  return result;
}

- (void)setColumnsToFetch:(void *)result
{
  if (result)
  {
    v3 = result;
    uint64_t v4 = (void *)result[7];
    if (v4 != a2)
    {

      result = a2;
      v3[7] = result;
    }
  }
  return result;
}

- (void)bindTempTableForBindIntarray:(uint64_t)a1
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = *(NSObject **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    int v5 = [a2 index];
    v51 = 0;
    if (v5 >= (int)[*(id *)(a1 + 304) count])
    {
      int v8 = (void *)[a2 tableName];
      [v8 UTF8String];
      uint64_t v9 = sqlite3_intarray_create();
      if (v9)
      {
        uint64_t v43 = objc_msgSend(NSString, "stringWithFormat:", @"CoreData: SQLite: error: Failed to create intarray. SQLite error code: %d", v9);
        size_t v44 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v9), @"NSSQLiteErrorDomain");
        id v45 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134180, v43, v44);
        objc_exception_throw(v45);
      }
      if (+[NSSQLCore debugDefault] >= 1) {
        _NSCoreDataLog(4, @"Bound intarray %@", v10, v11, v12, v13, v14, v15, (uint64_t)v8);
      }
      v16 = objc_alloc_init(NSSQLiteIntarrayTable);
      uint64_t v18 = v16;
      if (v16)
      {
        objc_setProperty_nonatomic(v16, v17, v8, 16);
        v18->_intarrayTable = v51;
      }
      [*(id *)(a1 + 304) addObject:v18];
    }
    else
    {
      uint64_t v6 = [*(id *)(a1 + 304) objectAtIndex:v5];
      if (v6) {
        uint64_t v7 = *(sqlite3_intarray **)(v6 + 8);
      }
      else {
        uint64_t v7 = 0;
      }
      v51 = v7;
    }
    unint64_t v19 = (void *)[a2 value];
    v20 = sqlite3_malloc(8 * [v19 count]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v21 = [v19 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v21)
    {
      int v22 = 0;
      uint64_t v23 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v48 != v23) {
            objc_enumerationMutation(v19);
          }
          uint64_t v25 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          if ([v25 isNSNumber]) {
            uint64_t v26 = [v25 longLongValue];
          }
          else {
            uint64_t v26 = [v25 _referenceData64];
          }
          v20[(v22 + i)] = v26;
          if (+[NSSQLCore debugDefault] >= 3) {
            _NSCoreDataLog(7, @"Bound intarray value %lu at %d", v27, v28, v29, v30, v31, v32, v20[(v22 + i)]);
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v47 objects:v52 count:16];
        v22 += i;
      }
      while (v21);
    }
    uint64_t v33 = sqlite3_intarray_bind();
    if (v33)
    {
      uint64_t v40 = objc_msgSend(NSString, "stringWithFormat:", @"CoreData: SQLite: error: Can't bind intarray. SQLite error code: %d", v33);
      int v41 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v33), @"NSSQLiteErrorDomain");
      id v42 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134180, v40, v41);
      objc_exception_throw(v42);
    }
    if (+[NSSQLCore debugDefault] >= 1) {
      _NSCoreDataLog(4, @"Bound intarray values.", v34, v35, v36, v37, v38, v39, v46);
    }
  }
}

- (void)execute
{
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2(queue);
  }
  __sqliteConnectionFlags sqliteConnectionFlags = self->_sqliteConnectionFlags;
  if ((*(unsigned char *)&sqliteConnectionFlags & 1) == 0)
  {
    uint64_t v5 = sqlite3_reset(self->_vmstatement);
    sqlite3_clear_bindings(self->_vmstatement);
    __sqliteConnectionFlags sqliteConnectionFlags = self->_sqliteConnectionFlags;
    if (v5)
    {
      self->___sqliteConnectionFlags sqliteConnectionFlags = (__sqliteConnectionFlags)(*(_DWORD *)&sqliteConnectionFlags & 0xFFFFFFFD);
      -[NSSQLiteConnection releaseSQLStatement]((uint64_t)self);
      uint64_t v101 = [NSString stringWithUTF8String:sqlite3_errmsg(self->_db)];
      uint64_t v102 = *MEMORY[0x1E4F1C3B8];
      uint64_t v91 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v5), @"NSSQLiteErrorDomain");
      uint64_t v93 = v102;
      v92 = (__CFString *)v101;
LABEL_97:
      id v94 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v93, 134180, (uint64_t)v92, v91);
      objc_exception_throw(v94);
    }
  }
  self->___sqliteConnectionFlags sqliteConnectionFlags = (__sqliteConnectionFlags)(*(_DWORD *)&sqliteConnectionFlags & 0xFFFFFFFE);
  uint64_t v6 = objc_msgSend(-[NSSQLiteConnection sqlStatement](self, "sqlStatement"), "bindVariables");
  uint64_t v7 = [v6 count];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    int v111 = v6;
    while (1)
    {
      uint64_t v10 = (void *)[v6 objectAtIndex:v9];
      unsigned int v11 = [v10 sqlType];
      if ([v10 hasObjectValue])
      {
        uint64_t v12 = (void *)[v10 value];
        uint64_t v13 = v12;
        if (v12 && [v12 isNSString] && objc_msgSend(v10, "allowsCoercion")) {
          int v14 = [@"<null>" isEqualToString:v13];
        }
        else {
          int v14 = 0;
        }
        uint64_t v15 = 0;
      }
      else
      {
        uint64_t v15 = [v10 int64];
        int v14 = 0;
        uint64_t v13 = 0;
      }
      if (+[NSSQLCore debugDefault] < 2) {
        goto LABEL_26;
      }
      if (!v13)
      {
        if (v15)
        {
          unsigned int v110 = (void *)v15;
          _NSCoreDataLog(7, @"SQLite bind[%ld] = (int64)%qd", v16, v17, v18, v19, v20, v21, v9);
LABEL_27:
          if (v11 - 2 >= 2)
          {
            if (v11 != 1)
            {
LABEL_99:
              uint64_t v95 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v96 = *MEMORY[0x1E4F1C3B8];
              uint64_t v97 = objc_msgSend(NSString, "stringWithFormat:", @"binding not implemented for this SQLType %d", v11, v110);
              int v98 = v95;
              uint64_t v99 = v96;
              uint64_t v100 = 0;
              goto LABEL_100;
            }
            vmstatement = self->_vmstatement;
            int v41 = v9 + 1;
            int v42 = v15;
LABEL_32:
            uint64_t v39 = sqlite3_bind_int(vmstatement, v41, v42);
            goto LABEL_46;
          }
          uint64_t v36 = self->_vmstatement;
          int v37 = v9 + 1;
          sqlite3_int64 v38 = v15;
        }
        else
        {
          _NSCoreDataLog(7, @"SQLite bind[%ld] = nil", v16, v17, v18, v19, v20, v21, v9);
LABEL_43:
          uint64_t v36 = self->_vmstatement;
          int v37 = v9 + 1;
          if (v11 != 3)
          {
            uint64_t v39 = sqlite3_bind_null(v36, v37);
            goto LABEL_46;
          }
          sqlite3_int64 v38 = 0;
        }
LABEL_29:
        uint64_t v39 = sqlite3_bind_int64(v36, v37, v38);
        goto LABEL_46;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v110 = v13;
        _NSCoreDataLog(7, @"SQLite bind[%ld] = \"%@\"", v30, v31, v32, v33, v34, v35, v9);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v13 timeIntervalSinceReferenceDate];
          unsigned int v110 = v49;
          _NSCoreDataLog(7, @"SQLite bind[%ld] = (timestamp)%f", v50, v51, v52, v53, v54, v55, v9);
        }
        else
        {
          unsigned int v110 = v13;
          _NSCoreDataLog(7, @"SQLite bind[%ld] = %@", v43, v44, v45, v46, v47, v48, v9);
        }
      }
      if (v15) {
        goto LABEL_27;
      }
LABEL_38:
      if (!v13) {
        goto LABEL_43;
      }
      if (v11)
      {
        if (v14) {
          goto LABEL_41;
        }
      }
      else
      {
        unsigned int v60 = -[NSSQLiteAdapter sqlTypeForExpressionConstantValue:]((uint64_t)[(NSSQLiteConnection *)self adapter], v13);
        if (v60)
        {
          unsigned int v11 = v60;
          if (v14) {
            goto LABEL_41;
          }
        }
        else
        {
          uint64_t v13 = (void *)[v13 description];
          unsigned int v11 = 6;
          if (v14)
          {
LABEL_41:
            uint64_t v56 = self->_vmstatement;
            int v57 = v9 + 1;
            uint64_t v58 = "<null>";
LABEL_42:
            uint64_t v39 = sqlite3_bind_text(v56, v57, v58, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
            goto LABEL_46;
          }
        }
      }
      switch(v11)
      {
        case 1u:
          BOOL v65 = self->_vmstatement;
          int v42 = [v13 intValue];
          vmstatement = v65;
          uint64_t v6 = v111;
          int v41 = v9 + 1;
          goto LABEL_32;
        case 2u:
        case 3u:
          int v63 = self->_vmstatement;
          sqlite3_int64 v38 = [v13 longLongValue];
          uint64_t v36 = v63;
          uint64_t v6 = v111;
          int v37 = v9 + 1;
          goto LABEL_29;
        case 4u:
          uint64_t v61 = self->_vmstatement;
          int v62 = (void *)[v13 stringValue];
          goto LABEL_62;
        case 5u:
        case 6u:
        case 9u:
          uint64_t v61 = self->_vmstatement;
          int v62 = v13;
LABEL_62:
          uint64_t v58 = (const char *)[v62 UTF8String];
          uint64_t v56 = v61;
          uint64_t v6 = v111;
          int v57 = v9 + 1;
          goto LABEL_42;
        case 7u:
          v66 = self->_vmstatement;
          [v13 doubleValue];
          goto LABEL_65;
        case 8u:
          v66 = self->_vmstatement;
          [v13 timeIntervalSinceReferenceDate];
LABEL_65:
          size_t v68 = v66;
          uint64_t v6 = v111;
          uint64_t v39 = sqlite3_bind_double(v68, v9 + 1, v67);
          goto LABEL_46;
        case 0xAu:
        case 0x11u:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v84 = [v13 bytes];
            int v85 = self->_vmstatement;
            if (v84) {
              v86 = (const void *)v84;
            }
            else {
              v86 = v13;
            }
            int v79 = [v13 length];
            v80 = v85;
            uint64_t v6 = v111;
            int v81 = v9 + 1;
            uint64_t v82 = v86;
            uint64_t v83 = -1;
LABEL_86:
            uint64_t v39 = sqlite3_bind_blob(v80, v81, v82, v79, (void (__cdecl *)(void *))v83);
LABEL_46:
            uint64_t v59 = v39;
            if (v39) {
              goto LABEL_96;
            }
            goto LABEL_47;
          }
          if (v13) {
            -[_PFEvanescentData _openMapping]((uint64_t)v13);
          }
          [v13 length];
          uint64_t v64 = sqlite3_bind_blob_b();
LABEL_74:
          uint64_t v59 = v64;
LABEL_79:
          uint64_t v6 = v111;
          if (v59)
          {
LABEL_96:
            uint64_t v90 = *MEMORY[0x1E4F1C3B8];
            uint64_t v91 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v59), @"NSSQLiteErrorDomain");
            v92 = @"sqlite3_bind* failed";
            uint64_t v93 = v90;
            goto LABEL_97;
          }
LABEL_47:
          if (v8 == ++v9) {
            goto LABEL_88;
          }
          break;
        case 0xBu:
          id v69 = v13;
          if ([v13 isNSString]) {
            id v69 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v13];
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v103 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v104 = *MEMORY[0x1E4F1C3C8];
            uint64_t v105 = NSString;
            uint64_t v106 = (objc_class *)objc_opt_class();
            uint64_t v107 = [v105 stringWithFormat:@"Unexpected or improperly formatted UUID parameter with type %@, expected NSUUID or well-formed NSString", NSStringFromClass(v106), v110];
            goto LABEL_104;
          }
          uint64_t v70 = malloc_type_malloc(0x10uLL, 0x278E61BAuLL);
          [v69 getUUIDBytes:v70];
          uint64_t v64 = sqlite3_bind_blob(self->_vmstatement, v9 + 1, v70, 16, MEMORY[0x1E4F14838]);
          goto LABEL_74;
        case 0xCu:
          objc_opt_class();
          v71 = v13;
          if (objc_opt_isKindOfClass()) {
            v71 = (void *)[v13 absoluteString];
          }
          if (([v71 isNSString] & 1) == 0)
          {
            uint64_t v103 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v104 = *MEMORY[0x1E4F1C3C8];
            v108 = NSString;
            unsigned int v109 = (objc_class *)objc_opt_class();
            uint64_t v107 = [v108 stringWithFormat:@"Unexpected or improperly formatted URI parameter type %@, expected NSURL or well-formed NSString", NSStringFromClass(v109), v110];
LABEL_104:
            uint64_t v97 = v107;
            uint64_t v100 = MEMORY[0x1E4F1CC08];
            int v98 = v103;
            uint64_t v99 = v104;
LABEL_100:
            objc_exception_throw((id)[v98 exceptionWithName:v99 reason:v97 userInfo:v100]);
          }
          uint64_t v64 = sqlite3_bind_text(self->_vmstatement, v9 + 1, (const char *)[v71 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          goto LABEL_74;
        case 0xDu:
          id v72 = [NSString alloc];
          uint64_t v73 = [v13 rangeValue];
          [v13 rangeValue];
          unsigned int v110 = v74;
          uint64_t v75 = objc_msgSend(v72, "initWithFormat:", @"%lu/%lu", v73);
          uint64_t v59 = sqlite3_bind_text(self->_vmstatement, v9 + 1, (const char *)[v75 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

          goto LABEL_79;
        case 0xFu:
          v76 = (void *)[v10 tombstonedPropertyDescription];
          if (!v76) {
            v76 = (void *)[v10 propertyDescription];
          }
          id v77 = +[_PFRoutines retainedEncodeObjectValue:forTransformableAttribute:]((uint64_t)_PFRoutines, (uint64_t)v13, v76);
          uint64_t v59 = sqlite3_bind_blob(self->_vmstatement, v9 + 1, (const void *)[v77 bytes], objc_msgSend(v77, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

          [v10 setTombstonedPropertyDescription:0];
          goto LABEL_79;
        case 0x10u:
          uint64_t v78 = [v13 _bytesPtrForStore];
          int v79 = [v13 _bytesLengthForStore];
          v80 = self->_vmstatement;
          int v81 = v9 + 1;
          uint64_t v82 = (const void *)v78;
          uint64_t v6 = v111;
          uint64_t v83 = 0;
          goto LABEL_86;
        default:
          goto LABEL_99;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v23 = [NSString stringWithFormat:@"<FBF url=%@>", objc_getProperty(v13, v22, 16, 1), v110];
    }
    else {
      uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"<NSData len=%lu>", objc_msgSend(v13, "length"), v110);
    }
    unsigned int v110 = (void *)v23;
    _NSCoreDataLog(7, @"SQLite bind[%ld] = %@", v24, v25, v26, v27, v28, v29, v9);
    uint64_t v6 = v111;
LABEL_26:
    if (v15) {
      goto LABEL_27;
    }
    goto LABEL_38;
  }
LABEL_88:
  _execute((uint64_t)self);
  if ((*(unsigned char *)&self->_sqliteConnectionFlags & 2) != 0 && !self->_columnsToFetch)
  {
    uint64_t v87 = objc_msgSend(-[NSSQLiteConnection sqlStatement](self, "sqlStatement"), "entity");
    while (v87)
    {
      uint64_t v88 = v87;
      uint64_t v87 = *(void *)(v87 + 168);
      if (v87 == v88)
      {
        v89 = *(void **)(v88 + 72);
        goto LABEL_94;
      }
    }
    v89 = 0;
LABEL_94:
    -[NSSQLiteConnection setColumnsToFetch:](self, v89);
  }
}

- (id)sqlStatement
{
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2(queue);
  }
  return self->_sqlStatement;
}

- (void)performAndWait:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3052000000;
    unsigned int v11 = __Block_byref_object_copy__29;
    uint64_t v12 = __Block_byref_object_dispose__29;
    uint64_t v13 = 0;
    v3 = *(NSObject **)(a1 + 8);
    if (v3)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __37__NSSQLiteConnection_performAndWait___block_invoke;
      v7[3] = &unk_1E544B908;
      v7[4] = a2;
      v7[5] = &v8;
      dispatch_sync(v3, v7);
    }
    else
    {
      uint64_t v4 = (void *)MEMORY[0x18C127630]();
      (*(void (**)(uint64_t))(a2 + 16))(a2);
    }
    uint64_t v5 = (void *)v9[5];
    if (v5)
    {
      id v6 = v5;
      objc_exception_throw((id)v9[5]);
    }
    _Block_object_dispose(&v8, 8);
  }
}

- (uint64_t)addVMCachedStatement:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = [[_PFWeakReference alloc] initWithObject:a2];
    if (v4) {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v3 + 152), a2, v4);
    }
    return MEMORY[0x1F4181820]();
  }
  return result;
}

- (void)releaseSQLStatement
{
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    if (v2) {
      dispatch_assert_queue_V2(v2);
    }
    -[NSSQLiteConnection _finalizeStatement](a1);
    -[NSSQLiteStatement clearCaches:](*(void **)(a1 + 48), 0);

    *(void *)(a1 + 48) = 0;
  }
}

- (void)_finalizeStatement
{
  v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  uint64_t v3 = *(sqlite3_stmt **)(a1 + 80);
  if (v3)
  {
    uint64_t v4 = *(sqlite3_stmt **)(a1 + 48);
    if (v4) {
      uint64_t v4 = (sqlite3_stmt *)*((void *)v4 + 8);
    }
    if (v4 == v3)
    {
      sqlite3_reset(v3);
      sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 80));
    }
    else
    {
      sqlite3_finalize(v3);
    }
    *(void *)(a1 + 80) = 0;
  }
  -[NSSQLiteConnection clearTempTablesBindingsForStatement:](a1, *(void **)(a1 + 48));
  uint64_t v5 = *(void **)(a1 + 48);

  -[NSSQLiteStatement clearCaches:](v5, 0);
}

- (void)resetSQLStatement
{
  v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  uint64_t v3 = *(sqlite3_stmt **)(a1 + 80);
  if (v3)
  {
    sqlite3_reset(v3);
    sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 80));
    *(void *)(a1 + 80) = 0;
  }
  -[NSSQLiteConnection clearTempTablesBindingsForStatement:](a1, *(void **)(a1 + 48));

  *(void *)(a1 + 48) = 0;
}

- (void)selectRowsWithStatement:(int)a3 cached:
{
  if (result)
  {
    uint64_t v5 = result;
    -[NSSQLiteConnection bindTempTablesForStatementIfNecessary:](result, a2);
    -[NSSQLiteConnection prepareSQLStatement:]((uint64_t)v5, a2);
    if (a3 && (!a2 || !a2[8])) {
      -[NSSQLiteConnection cacheCurrentDBStatementOn:]((uint64_t)v5, (sqlite3_stmt *)a2);
    }
    return (void *)[v5 execute];
  }
  return result;
}

- (void)prepareSQLStatement:(uint64_t)a1
{
  v76[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = *(NSObject **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    uint64_t v5 = *(void **)(a1 + 48);
    if (v5)
    {
      if ([v5 description]) {
        uint64_t v19 = [*(id *)(a1 + 48) description];
      }
      else {
        uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
      }
      uint64_t v26 = v19;
      _NSCoreDataLog(1, @"SQL statement is still active / leaked.  sql:'%@'", v20, v21, v22, v23, v24, v25, v19);
      uint64_t v27 = *MEMORY[0x1E4F1C3B8];
      uint64_t v75 = @"Statement";
      v76[0] = v26;
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v27, @"statement is still active", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v76, &v75, 1)));
    }
    *(void *)(a1 + 48) = a2;
    pzTail = 0;
    unsigned int v73 = 0;
    -[NSSQLiteConnection _ensureDatabaseOpen]((void *)a1);
    -[NSSQLiteConnection _ensureNoFetchInProgress](a1);
    uint64_t v7 = (void *)(a1 + 80);
    uint64_t v6 = *(void *)(a1 + 80);
    *(_DWORD *)(a1 + 88) = 0;
    if (!v6)
    {
      if (+[NSSQLCore debugDefault] >= 1)
      {
        int v8 = *(unsigned __int8 *)(a1 + 42);
        uint64_t v9 = [a2 sqlString];
        if (v8) {
          uint64_t v16 = @"\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m";
        }
        else {
          uint64_t v16 = @"%@";
        }
        _NSCoreDataLog(6, (uint64_t)v16, v10, v11, v12, v13, v14, v15, v9);
      }
      if (a2)
      {
        uint64_t v17 = a2[8];
        *uint64_t v7 = v17;
        if (v17)
        {
          unsigned int v18 = *(_DWORD *)(a1 + 312) & 0xFFFFFFFE;
LABEL_47:
          *(_DWORD *)(a1 + 312) = v18;
          return;
        }
      }
      else
      {
        *uint64_t v7 = 0;
      }
      uint64_t v28 = (const char *)objc_msgSend((id)objc_msgSend(a2, "sqlString"), "UTF8String");
      unsigned int v71 = 0;
      unsigned int v29 = 0;
      int v30 = 0;
      double v31 = 0.0;
LABEL_20:
      int v32 = 3 * v29 - 29999;
      while (1)
      {
        uint64_t v33 = sqlite3_prepare_v3(*(sqlite3 **)(a1 + 72), v28, -1, 1u, (sqlite3_stmt **)(a1 + 80), (const char **)&pzTail);
        uint64_t v34 = v33;
        switch((char)v33)
        {
          case 0:
            unsigned int v18 = *(_DWORD *)(a1 + 312) | 1;
            goto LABEL_47;
          case 1:
          case 7:
          case 10:
          case 17:
          case 21:
            goto LABEL_49;
          case 5:
            if (*(double *)(a1 + 232) > 0.0 && v31 == 0.0) {
              double v31 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
            }
            if (v29 < 0x2711) {
              goto LABEL_41;
            }
            if (v29 - 10000 >= 0xB) {
              useconds_t v35 = v29 - 8899;
            }
            else {
              useconds_t v35 = v32;
            }
            goto LABEL_40;
          case 6:
            if (*(double *)(a1 + 232) > 0.0 && v31 == 0.0) {
              double v31 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
            }
            goto LABEL_37;
          case 11:
          case 26:
            goto LABEL_54;
          case 14:
            if (v30 > 2)
            {
LABEL_49:
              int v37 = v33;
              uint64_t v38 = [NSString stringWithUTF8String:sqlite3_errmsg(*(sqlite3 **)(a1 + 72))];
              if (v37 == 10 && (sqlite3_file_control(*(sqlite3 **)(a1 + 72), 0, 4, &v73), v73)) {
                uint64_t v39 = [NSString stringWithFormat:@"I/O error for database at %@.  SQLite error code:%d, '%@' errno:%d", *(void *)(a1 + 32), v34, v38, v73];
              }
              else {
                uint64_t v39 = [NSString stringWithFormat:@"I/O error for database at %@.  SQLite error code:%d, '%@'", *(void *)(a1 + 32), v34, v38, v70];
              }
              uint64_t v40 = (void *)v39;
              if (v39)
              {
                -[NSSQLiteConnection _forceDisconnectOnError](a1);
                id v72 = 0;
                uint64_t v41 = 256;
              }
              else
              {
LABEL_54:
                uint64_t v40 = (void *)[NSString stringWithFormat:@"Fatal error.  The database at %@ is corrupted.  SQLite error code:%d, '%s'", *(void *)(a1 + 32), v34, sqlite3_errmsg(*(sqlite3 **)(a1 + 72))];
                uint64_t v41 = (int)v34;
                id v72 = @"NSSQLiteErrorDomain";
                -[NSSQLiteConnection _forceDisconnectOnError](a1);
                if (!v40)
                {
LABEL_59:
                  uint64_t v48 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
                  uint64_t v40 = 0;
                  int v49 = 1;
LABEL_60:
                  if (*(unsigned char *)(a1 + 42)) {
                    uint64_t v50 = @"\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %s\x1B[0m";
                  }
                  else {
                    uint64_t v50 = @"(%d) %s";
                  }
                  _NSCoreDataLog(1, (uint64_t)v50, v42, v43, v44, v45, v46, v47, v34);
                  if (v49)
                  {
                    uint64_t v40 = objc_msgSend(NSString, "stringWithFormat:", @"error during prepareSQL for SQL string '%s' : %s", v28, v48);
                    uint64_t v41 = 256;
                  }
                  *(_DWORD *)(a1 + 312) &= ~2u;
                  -[NSSQLiteConnection releaseSQLStatement](a1);
                  uint64_t v51 = *MEMORY[0x1E4F1C3B8];
                  uint64_t v52 = (void *)MEMORY[0x1E4F1C9E8];
                  uint64_t v53 = *(void *)(a1 + 32);
                  uint64_t v54 = *MEMORY[0x1E4F28328];
                  uint64_t v55 = [NSNumber numberWithInt:v34];
                  if (v73) {
                    uint64_t v56 = objc_msgSend(NSNumber, "numberWithInteger:");
                  }
                  else {
                    uint64_t v56 = 0;
                  }
                  id v57 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v51, v41, (uint64_t)v40, objc_msgSend(v52, "dictionaryWithObjectsAndKeys:", v53, v54, v55, @"NSSQLiteErrorDomain", v56, *MEMORY[0x1E4F28798], 0));
                  uint64_t v58 = v57;
                  if (v72) {
                    -[_NSCoreDataException _setDomain:]((uint64_t)v57, v72);
                  }
                  objc_exception_throw(v58);
                }
              }
              uint64_t v48 = (const char *)[v40 UTF8String];
              int v49 = 0;
              goto LABEL_60;
            }
            if (*(double *)(a1 + 232) > 0.0 && v31 == 0.0) {
              double v31 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
            }
            ++v30;
LABEL_37:
            if (v29 <= 0xA) {
              useconds_t v35 = 3 * v29 + 1;
            }
            else {
              useconds_t v35 = v29 + 1101;
            }
LABEL_40:
            usleep(v35);
LABEL_41:
            if (v31 != 0.0)
            {
              double Current = CFAbsoluteTimeGetCurrent();
              if (Current > v31)
              {
                if (v71 > 7)
                {
                  uint64_t v59 = [NSString stringWithFormat:@"The database operation timed out after %.2f seconds.", Current - v31 + *(double *)(a1 + 232)];
                  if (+[NSSQLCore debugDefault] >= 1)
                  {
                    if (*(unsigned char *)(a1 + 42)) {
                      v66 = @"\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %@\x1B[0m";
                    }
                    else {
                      v66 = @"(%d) %@";
                    }
                    uint64_t v69 = v59;
                    _NSCoreDataLog(1, (uint64_t)v66, v60, v61, v62, v63, v64, v65, v34);
                  }
                  uint64_t v67 = [NSString stringWithFormat:@"error during SQL execution : %@", v59, v69];
                  *(_DWORD *)(a1 + 312) &= ~2u;
                  -[NSSQLiteConnection releaseSQLStatement](a1);
                  id v68 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134090, v67, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v34), @"NSSQLiteErrorDomain"));
                  objc_exception_throw(v68);
                }
                ++v29;
                double v31 = Current + *(double *)(a1 + 240);
                ++v71;
                goto LABEL_20;
              }
            }
            v32 += 3;
            ++v29;
            break;
          default:
            id v72 = 0;
            uint64_t v41 = 0;
            goto LABEL_59;
        }
      }
    }
  }
}

- (void)_ensureDatabaseOpen
{
  v2 = a1[1];
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  if (!a1[9])
  {
    id v3 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134060, @"Attempted to perform an operation without an open database", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a1[4], *MEMORY[0x1E4F28328], 0));
    objc_exception_throw(v3);
  }
}

- (void)_ensureNoFetchInProgress
{
  v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  if ((*(unsigned char *)(a1 + 312) & 2) != 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Attempted to perform another operation with a fetch already in progress" userInfo:0]);
  }
}

- (void)bindTempTablesForStatementIfNecessary:(void *)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    uint64_t v4 = result[1];
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    result = (void *)[a2 bindIntarrays];
    if (result)
    {
      uint64_t v5 = result;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      result = (void *)[result countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (result)
      {
        uint64_t v6 = result;
        uint64_t v7 = *(void *)v10;
        do
        {
          int v8 = 0;
          do
          {
            if (*(void *)v10 != v7) {
              objc_enumerationMutation(v5);
            }
            -[NSSQLiteConnection bindTempTableForBindIntarray:](v3, *(void **)(*((void *)&v9 + 1) + 8 * (void)v8));
            int v8 = (void *)((char *)v8 + 1);
          }
          while (v6 != v8);
          result = (void *)[v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
          uint64_t v6 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (void)clearTempTablesBindingsForStatement:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(NSObject **)(a1 + 8);
  if (v4) {
    dispatch_assert_queue_V2(v4);
  }
  result = (void *)[a2 bindIntarrays];
  if (result)
  {
    uint64_t v6 = result;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    result = (void *)[result countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (result)
    {
      uint64_t v7 = result;
      uint64_t v8 = *(void *)v26;
      do
      {
        long long v9 = 0;
        do
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v6);
          }
          long long v10 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v9);
          long long v11 = *(NSObject **)(a1 + 8);
          if (v11) {
            dispatch_assert_queue_V2(v11);
          }
          int v12 = [v10 index];
          if (v12 < (int)[*(id *)(a1 + 304) count])
          {
            [*(id *)(a1 + 304) objectAtIndex:v12];
            uint64_t v13 = sqlite3_intarray_bind();
            if (v13)
            {
              uint64_t v20 = *MEMORY[0x1E4F1C3B8];
              uint64_t v21 = v13;
              uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"CoreData: SQLite: error: Failed to clear contents of intarray. SQLite error code: %d", v13);
              id v23 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v20, 134180, v22, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v21), @"NSSQLiteErrorDomain"));
              objc_exception_throw(v23);
            }
            if (+[NSSQLCore debugDefault] >= 1) {
              _NSCoreDataLog(4, @"Bound intarray values.", v14, v15, v16, v17, v18, v19, v24);
            }
          }
          long long v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        result = (void *)[v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
        uint64_t v7 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)endFetchAndRecycleStatement:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v3 = *(NSObject **)(a1 + 8);
    if (v3) {
      dispatch_assert_queue_V2(v3);
    }
    context = (void *)MEMORY[0x18C127630]();
    if (*(void *)(a1 + 80))
    {
      uint64_t v4 = *(void *)(a1 + 16);
      if (v4)
      {
        if (*(unsigned char *)(v4 + 202))
        {
          uint64_t v5 = (void *)[(id)a1 sqlStatement];
          uint64_t v6 = *(NSObject **)(a1 + 8);
          if (v6) {
            dispatch_assert_queue_V2(v6);
          }
          id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v8 = (void *)MEMORY[0x18C127630]();
          [(id)objc_msgSend(NSString stringWithFormat:@"EXPLAIN QUERY PLAN %@", objc_msgSend(v5, "sqlString")), "UTF8String"];
          uint64_t v27 = MEMORY[0x1E4F143A8];
          uint64_t v28 = 3221225472;
          unsigned int v29 = __45__NSSQLiteConnection_indexesUsedByStatement___block_invoke;
          uint64_t v30 = &unk_1E544E060;
          id v31 = v7;
          sqlite3_exec_b();
          id v9 = v7;
          int v10 = sqlite3_stmt_status(*(sqlite3_stmt **)(a1 + 80), 4, 1);
          uint64_t v11 = *(int *)(a1 + 88);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          uint64_t v12 = [v9 countByEnumeratingWithState:&v23 objects:v32 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = v10;
            uint64_t v15 = *(void *)v24;
            do
            {
              uint64_t v16 = 0;
              do
              {
                if (*(void *)v24 != v15) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * v16);
                uint64_t v18 = (void *)MEMORY[0x18C127630]();
                uint64_t v19 = (NSSQLiteIndexStatistics *)[*(id *)(a1 + 344) objectForKeyedSubscript:v17];
                if (v19
                  || (uint64_t v19 = -[NSSQLiteIndexStatistics initWithName:storeID:]([NSSQLiteIndexStatistics alloc], "initWithName:storeID:", v17, [*(id *)(a1 + 16) identifier]), objc_msgSend(*(id *)(a1 + 344), "setObject:forKeyedSubscript:", v19, v17), v19, v19))
                {
                  int64_t v20 = v19->_instructionCount + v14;
                  ++v19->_executionCount;
                  v19->_instructionCount = v20;
                  v19->_rowCount += v11;
                }
                ++v16;
              }
              while (v13 != v16);
              uint64_t v13 = [v9 countByEnumeratingWithState:&v23 objects:v32 count:16];
            }
            while (v13);
          }
        }
      }
    }
    if ((*(unsigned char *)(a1 + 312) & 2) != 0)
    {
      -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0);
      *(_DWORD *)(a1 + 312) &= ~2u;
      *(void *)(a1 + 100) = 0;
      *(void *)(a1 + 92) = 0;
      *(_DWORD *)(a1 + 108) = 0;
    }
    if (a2) {
      -[NSSQLiteConnection resetSQLStatement](a1);
    }
    else {
      -[NSSQLiteConnection releaseSQLStatement](a1);
    }
  }
}

- (NSSQLiteStatementCache)statementCacheForEntity:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = *(NSObject **)(a1 + 8);
  if (v4) {
    dispatch_assert_queue_V2(v4);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v5 = (NSSQLiteStatementCache *)[*(id *)(a1 + 200) objectForKey:a2];
  if (!v5)
  {
    uint64_t v5 = [[NSSQLiteStatementCache alloc] initWithEntity:a2];
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 200), a2, v5);
  }
  return v5;
}

- (uint64_t)updateRow:(uint64_t)a3 forRequestContext:
{
  uint64_t v171 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(NSObject **)(result + 8);
    if (v5) {
      dispatch_assert_queue_V2(v5);
    }
    if (!a2 || (*(unsigned char *)(a2 + 16) & 1) != 0) {
      key = 0;
    }
    else {
      key = (unsigned int *)[*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
    }
    uint64_t v6 = (const void *)[(id)a2 objectID];
    id v7 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:](a3, v6);
    if (a3) {
      uint64_t v8 = *(void **)(a3 + 32);
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = (void *)[v8 objectRegisteredForID:v6];
    int v10 = v9;
    BOOL v11 = 0;
    if (v9 && v7)
    {
      if ([v9 _versionReference]) {
        BOOL v11 = *(_DWORD *)(*(void *)&v7[10]._os_unfair_lock_opaque + 12) != [v10 _versionReference];
      }
      else {
        BOOL v11 = 0;
      }
    }
    uint64_t v139 = (uint64_t)v7;
    if (!v7 || v11)
    {
      uint64_t v103 = v6;
      if ((int)-[NSSQLStoreRequestContext debugLogLevel](a3) <= 1)
      {
        if ((int)-[NSSQLStoreRequestContext debugLogLevel](a3) >= 1) {
          _NSCoreDataLog(4, @"Optimistic locking failure for %@. During updateRow.  Original row = %p context version match = %d", v123, v124, v125, v126, v127, v128, (uint64_t)v6);
        }
      }
      else
      {
        _NSCoreDataLog(4, @"Optimistic locking failure for %@.  During updateRow.  Original row = %@ New Row = %@ context version match = %d", v104, v105, v106, v107, v108, v109, (uint64_t)v6);
      }
      v129 = &unk_1ED7E2AD0;
      if (v11)
      {
        unsigned int v130 = [v10 _versionReference];
        unint64_t v131 = v139;
        if (v139) {
          unint64_t v131 = *(unsigned int *)(*(void *)(v139 + 40) + 12);
        }
        if (v131 >= v130) {
          v129 = &unk_1ED7E2AE8;
        }
      }
      v164 = v103;
      v165[0] = @"_NSCoreDataOptimisticLockingFailureConflictsKey";
      uint64_t v132 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v164 count:1];
      v165[1] = @"_NSCoreDataOptimisticLockingFailureMismatchWithObject";
      v166[0] = v132;
      v166[1] = v129;
      uint64_t v133 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v166 forKeys:v165 count:2];
      objc_exception_throw(+[_NSCoreDataOptimisticLockingException exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"optimistic locking failure" userInfo:v133]);
    }
    uint64_t v137 = a3;
    uint64_t v135 = (uint64_t)v6;
    if (a2) {
      CFBitVectorRef v12 = -[NSSQLRow newColumnMaskFrom:columnInclusionOptions:]((CFBitVectorRef)a2, (uint64_t)v7, 30);
    }
    else {
      CFBitVectorRef v12 = 0;
    }
    uint64_t v13 = *(NSObject **)(v4 + 8);
    if (v13) {
      dispatch_assert_queue_V2(v13);
    }
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(v4 + 216), key);
    uint64_t v138 = v4;
    if (Value
      && (uint64_t v15 = (void *)CFDictionaryGetValue(Value, v12)) != 0
      && (uint64_t v16 = v15, (v136 = *((void *)v15 + 8)) != 0))
    {
      if (+[NSSQLCore debugDefault] >= 1)
      {
        int v17 = *(unsigned __int8 *)(v4 + 42);
        uint64_t v18 = [v16 sqlString];
        if (v17) {
          long long v25 = @"\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m";
        }
        else {
          long long v25 = @"%@";
        }
        _NSCoreDataLog(6, (uint64_t)v25, v19, v20, v21, v22, v23, v24, v18);
      }
      *(void *)(v4 + 48) = v16;
      long long v26 = *(NSObject **)(v4 + 8);
      if (v26) {
        dispatch_assert_queue_V2(v26);
      }
      context = (void *)MEMORY[0x18C127630]();
      if (!a2 || (*(unsigned char *)(a2 + 16) & 1) != 0) {
        uint64_t v27 = 0;
      }
      else {
        uint64_t v27 = (void *)[*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
      }
      unsigned int v29 = (void *)[v27 foreignKeyColumns];
      id obj = (id)[v27 foreignEntityKeyColumns];
      id v142 = (id)[v27 foreignOrderKeyColumns];
      id v141 = (id)[v27 attributeColumns];
      CFArrayRef v30 = (const __CFArray *)[*(id *)(v4 + 48) bindVariables];
      long long v157 = 0u;
      long long v158 = 0u;
      long long v159 = 0u;
      long long v160 = 0u;
      uint64_t v31 = [v29 countByEnumeratingWithState:&v157 objects:v170 count:16];
      if (v31)
      {
        int v32 = 0;
        unsigned int v33 = 0;
        uint64_t v34 = *(void *)v158;
        do
        {
          uint64_t v35 = 0;
          int v36 = v32;
          do
          {
            if (*(void *)v158 != v34) {
              objc_enumerationMutation(v29);
            }
            int v37 = *(void **)(*((void *)&v157 + 1) + 8 * v35);
            if (CFBitVectorGetBitAtIndex(v12, (v36 + v35)))
            {
              uint64_t v38 = -[NSSQLRow foreignKeyForSlot:](a2, [v37 slot]);
              objc_msgSend((id)CFArrayGetValueAtIndex(v30, v33++), "setInt64:", v38);
            }
            ++v35;
          }
          while (v31 != v35);
          uint64_t v31 = [v29 countByEnumeratingWithState:&v157 objects:v170 count:16];
          int v32 = v36 + v35;
        }
        while (v31);
        int v39 = v36 + v35;
      }
      else
      {
        int v39 = 0;
        unsigned int v33 = 0;
      }
      long long v155 = 0u;
      long long v156 = 0u;
      long long v153 = 0u;
      long long v154 = 0u;
      uint64_t v40 = [obj countByEnumeratingWithState:&v153 objects:v169 count:16];
      if (v40)
      {
        uint64_t v41 = *(void *)v154;
        do
        {
          uint64_t v42 = 0;
          int v43 = v39;
          do
          {
            if (*(void *)v154 != v41) {
              objc_enumerationMutation(obj);
            }
            uint64_t v44 = *(void **)(*((void *)&v153 + 1) + 8 * v42);
            if (CFBitVectorGetBitAtIndex(v12, (v43 + v42)))
            {
              unsigned int v45 = [v44 slot];
              if (a2) {
                uint64_t v46 = *(unsigned __int16 *)(a2
              }
                                          + _NSSQLRowInstanceSize
                                          + ((2 * *(_DWORD *)(a2 + 16)) & 0x1FFF8)
                                          + (((unint64_t)*(unsigned int *)(a2 + 16) >> 14) & 0xFFFC)
                                          + 2 * v45);
              else {
                uint64_t v46 = 0;
              }
              objc_msgSend((id)CFArrayGetValueAtIndex(v30, v33++), "setUnsignedInt:", v46);
            }
            ++v42;
          }
          while (v40 != v42);
          uint64_t v47 = [obj countByEnumeratingWithState:&v153 objects:v169 count:16];
          uint64_t v40 = v47;
          int v39 = v43 + v42;
        }
        while (v47);
        int v39 = v43 + v42;
      }
      long long v151 = 0u;
      long long v152 = 0u;
      long long v149 = 0u;
      long long v150 = 0u;
      uint64_t v48 = [v142 countByEnumeratingWithState:&v149 objects:v168 count:16];
      if (v48)
      {
        uint64_t v49 = *(void *)v150;
        do
        {
          uint64_t v50 = 0;
          int v51 = v39;
          do
          {
            if (*(void *)v150 != v49) {
              objc_enumerationMutation(v142);
            }
            uint64_t v52 = *(void **)(*((void *)&v149 + 1) + 8 * v50);
            if (CFBitVectorGetBitAtIndex(v12, (v51 + v50)))
            {
              unsigned int v53 = [v52 slot];
              if (a2) {
                uint64_t v54 = *(unsigned int *)(a2 + _NSSQLRowInstanceSize + ((2 * *(_DWORD *)(a2 + 16)) & 0x1FFF8) + 4 * v53);
              }
              else {
                uint64_t v54 = 0;
              }
              objc_msgSend((id)CFArrayGetValueAtIndex(v30, v33++), "setUnsignedInt:", v54);
            }
            ++v50;
          }
          while (v48 != v50);
          uint64_t v55 = [v142 countByEnumeratingWithState:&v149 objects:v168 count:16];
          uint64_t v48 = v55;
          int v39 = v51 + v50;
        }
        while (v55);
        int v39 = v51 + v50;
      }
      long long v147 = 0u;
      long long v148 = 0u;
      long long v145 = 0u;
      long long v146 = 0u;
      uint64_t v56 = [v141 countByEnumeratingWithState:&v145 objects:v167 count:16];
      if (v56)
      {
        uint64_t v57 = *(void *)v146;
        do
        {
          uint64_t v58 = 0;
          do
          {
            if (*(void *)v146 != v57) {
              objc_enumerationMutation(v141);
            }
            uint64_t v59 = *(void **)(*((void *)&v145 + 1) + 8 * v58);
            if (CFBitVectorGetBitAtIndex(v12, (v39 + v58)))
            {
              if ([v59 isConstrained])
              {
                CFDateRef v60 = 0;
              }
              else
              {
                uint64_t v61 = (void *)[v59 attributeDescription];
                if (v61) {
                  BOOL v62 = [v61 superCompositeAttribute] != 0;
                }
                else {
                  BOOL v62 = 0;
                }
                CFDateRef v60 = -[NSSQLRow attributeValueForSlot:]((CFDateRef)a2, [v59 slot]);
                if (v62) {
                  CFDateRef v60 = (CFDateRef)-[__CFDate valueForKeyPath:](v60, "valueForKeyPath:", -[NSPropertyDescription _elementPath]((__CFString *)[v59 propertyDescription]));
                }
              }
              objc_msgSend((id)CFArrayGetValueAtIndex(v30, v33++), "setValue:", v60);
            }
            ++v58;
          }
          while (v56 != v58);
          uint64_t v63 = [v141 countByEnumeratingWithState:&v145 objects:v167 count:16];
          uint64_t v56 = v63;
          v39 += v58;
        }
        while (v63);
      }
      if (v139) {
        uint64_t v64 = *(unsigned int *)(*(void *)(v139 + 40) + 12) + 1;
      }
      else {
        uint64_t v64 = 1;
      }
      [(id)a2 setOptLock:v64];
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(v30, v33);
      if (a2)
      {
        uint64_t v66 = a2;
        uint64_t v67 = *(unsigned int *)(*(void *)(a2 + 40) + 12);
      }
      else
      {
        uint64_t v67 = 0;
        uint64_t v66 = 0;
      }
      BOOL v68 = v66 == 0;
      [ValueAtIndex setInt64:v67];
      uint64_t v69 = (void *)CFArrayGetValueAtIndex(v30, v33 + 1);
      if (v68) {
        uint64_t v70 = 0;
      }
      else {
        uint64_t v70 = [*(id *)(*(void *)(a2 + 40) + 16) _referenceData64];
      }
      [v69 setInt64:v70];
      unsigned int v71 = (void *)CFArrayGetValueAtIndex(v30, v33 + 2);
      if (v139) {
        uint64_t v72 = *(unsigned int *)(*(void *)(v139 + 40) + 12);
      }
      else {
        uint64_t v72 = 0;
      }
      [v71 setInt64:v72];
      uint64_t v4 = v138;
      *(void *)(v138 + 80) = v136;
      id v73 = *(id *)(v138 + 48);
    }
    else
    {
      uint64_t v28 = (void *)-[NSSQLiteAdapter newUpdateStatementWithRow:originalRow:withMask:]((void *)[(id)v4 adapter], a2, (uint64_t)v7, v12);
      -[NSSQLiteConnection prepareSQLStatement:](v4, v28);
      -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:](*(sqlite3_stmt **)(v4 + 48), *(sqlite3_stmt **)(v4 + 80), v4);
      -[NSSQLiteConnection cacheUpdateStatement:forEntity:andDeltasMask:](v4, *(const void **)(v4 + 48), key, v12);

      -[NSSQLiteConnection addVMCachedStatement:](v4, *(const void **)(v4 + 48));
    }
    [(id)v4 execute];
    if (!*(void *)(v4 + 80)) {
      -[NSSQLiteConnection cacheUpdateStatement:forEntity:andDeltasMask:](v4, 0, key, v12);
    }
    uint64_t v74 = *(void **)(v4 + 48);
    uint64_t v75 = *(NSObject **)(v4 + 8);
    if (v75) {
      dispatch_assert_queue_V2(v75);
    }
    v76 = (void *)[v74 entity];
    id v77 = (void *)[v76 foreignKeyColumns];
    uint64_t v78 = (void *)[v76 foreignEntityKeyColumns];
    int v79 = (void *)[v76 foreignOrderKeyColumns];
    v80 = (void *)[v76 attributeColumns];
    CFArrayRef v81 = (const __CFArray *)[*(id *)(v4 + 48) bindVariables];
    long long v157 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    unsigned int v82 = 0;
    unsigned int v83 = 0;
    uint64_t v84 = [v77 countByEnumeratingWithState:&v157 objects:v170 count:16];
    if (v84)
    {
      uint64_t v85 = *(void *)v158;
      while (1)
      {
        if (*(void *)v158 != v85) {
          objc_enumerationMutation(v77);
        }
        if (CFBitVectorGetBitAtIndex(v12, v83++)) {
          ++v82;
        }
        if (!--v84)
        {
          uint64_t v84 = [v77 countByEnumeratingWithState:&v157 objects:v170 count:16];
          if (!v84) {
            break;
          }
        }
      }
    }
    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    uint64_t v87 = [v78 countByEnumeratingWithState:&v153 objects:v169 count:16];
    if (v87)
    {
      uint64_t v88 = *(void *)v154;
      while (1)
      {
        if (*(void *)v154 != v88) {
          objc_enumerationMutation(v78);
        }
        if (CFBitVectorGetBitAtIndex(v12, v83++)) {
          ++v82;
        }
        if (!--v87)
        {
          uint64_t v87 = [v78 countByEnumeratingWithState:&v153 objects:v169 count:16];
          if (!v87) {
            break;
          }
        }
      }
    }
    long long v151 = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    uint64_t v90 = [v79 countByEnumeratingWithState:&v149 objects:v168 count:16];
    if (v90)
    {
      uint64_t v91 = *(void *)v150;
      while (1)
      {
        if (*(void *)v150 != v91) {
          objc_enumerationMutation(v79);
        }
        if (CFBitVectorGetBitAtIndex(v12, v83++)) {
          ++v82;
        }
        if (!--v90)
        {
          uint64_t v90 = [v79 countByEnumeratingWithState:&v149 objects:v168 count:16];
          if (!v90) {
            break;
          }
        }
      }
    }
    long long v147 = 0u;
    long long v148 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    uint64_t v93 = [v80 countByEnumeratingWithState:&v145 objects:v167 count:16];
    if (v93)
    {
      uint64_t v94 = *(void *)v146;
      while (1)
      {
        if (*(void *)v146 != v94) {
          objc_enumerationMutation(v80);
        }
        if (CFBitVectorGetBitAtIndex(v12, v83)) {
          objc_msgSend((id)CFArrayGetValueAtIndex(v81, v82++), "setValue:", 0);
        }
        ++v83;
        if (!--v93)
        {
          uint64_t v93 = [v80 countByEnumeratingWithState:&v145 objects:v167 count:16];
          if (!v93) {
            break;
          }
        }
      }
    }
    -[NSSQLiteConnection resetSQLStatement](v138);
    uint64_t v95 = *(void *)(v138 + 16);
    if (v95 && (*(unsigned char *)(v95 + 201) & 4) != 0)
    {
      if (a2) {
        CFBitVectorRef v96 = -[NSSQLRow newColumnMaskFrom:columnInclusionOptions:]((CFBitVectorRef)a2, v139, 30);
      }
      else {
        CFBitVectorRef v96 = 0;
      }
      uint64_t v97 = key;
      int v98 = +[_NSPersistentHistoryChange _dataMaskForEntity:andDeltaMask:]((uint64_t)_NSPersistentHistoryChange, key, v96);
      if (v98)
      {
        id v99 = [NSString alloc];
        if (key) {
          uint64_t v97 = (unsigned int *)key[46];
        }
        if (a2) {
          uint64_t v100 = [*(id *)(*(void *)(a2 + 40) + 16) _referenceData64];
        }
        else {
          uint64_t v100 = 0;
        }
        uint64_t v101 = objc_msgSend(v99, "initWithFormat:", @"%u-%lld", v97, v100);
        -[NSSQLSaveChangesRequestContext addDataMask:forEntityKey:](v137, v98, (uint64_t)v101);
      }
      if (v96) {
        CFRelease(v96);
      }
    }
    if (v12) {
      CFRelease(v12);
    }
    uint64_t v102 = *(sqlite3 **)(v138 + 72);
    if (v102)
    {
      result = sqlite3_changes(v102);
      *(_DWORD *)(v138 + 88) = result;
      if (result == 1) {
        return result;
      }
    }
    else
    {
      *(_DWORD *)(v138 + 88) = 0;
    }
    if ((int)-[NSSQLStoreRequestContext debugLogLevel](v137) <= 1)
    {
      if ((int)-[NSSQLStoreRequestContext debugLogLevel](v137) >= 1) {
        _NSCoreDataLog(4, @"Optimistic locking failure for %@.  During updateRow, rows processed = %d.", v116, v117, v118, v119, v120, v121, v135);
      }
    }
    else
    {
      _NSCoreDataLog(4, @"Optimistic locking failure for %@.  During updateRow, rows processed = %d.  Original row = %@ New row = %@", v110, v111, v112, v113, v114, v115, v135);
    }
    uint64_t v161 = v135;
    v162 = @"_NSCoreDataOptimisticLockingFailureConflictsKey";
    v163[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v161 count:1];
    uint64_t v122 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v163 forKeys:&v162 count:1];
    objc_exception_throw(+[_NSCoreDataOptimisticLockingException exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"optimistic locking failure" userInfo:v122]);
  }
  return result;
}

- (void)cacheCurrentDBStatementOn:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(NSObject **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    uint64_t v5 = *(sqlite3_stmt **)(a1 + 80);
    if (v5)
    {
      -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:](a2, v5, a1);
      -[NSSQLiteConnection addVMCachedStatement:](a1, a2);
    }
  }
}

- (void)cacheUpdateStatement:(void *)key forEntity:(const void *)a4 andDeltasMask:
{
  uint64_t v8 = *(NSObject **)(a1 + 8);
  if (v8) {
    dispatch_assert_queue_V2(v8);
  }
  CFDictionaryRef Value = (__CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 216), key);
  if (!Value)
  {
    if (!a2) {
      return;
    }
    v11.version = *MEMORY[0x1E4F1D530];
    *(_OWORD *)&v11.retain = *(_OWORD *)(MEMORY[0x1E4F1D530] + 8);
    v11.copyDescription = *(CFDictionaryCopyDescriptionCallBack *)(MEMORY[0x1E4F1D530] + 24);
    v11.equal = (CFDictionaryEqualCallBack)PFVectorEqual;
    v11.hash = (CFDictionaryHashCallBack)PFVectorHash;
    CFMutableDictionaryRef v10 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &v11, MEMORY[0x1E4F1D540]);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 216), key, v10);

    goto LABEL_10;
  }
  CFMutableDictionaryRef v10 = Value;
  if (a2)
  {
LABEL_10:
    CFDictionarySetValue(v10, a4, a2);
    return;
  }

  CFDictionaryRemoveValue(Value, a4);
}

- (void)prepareInsertStatementForAncillaryEntity:(uint64_t)a1
{
  uint64_t v4 = -[NSSQLiteConnection statementCacheForEntity:](a1, a2);
  uint64_t v5 = v4;
  if (v4)
  {
    insertStatementCache = v4->_insertStatementCache;
    if (insertStatementCache)
    {
      cachedSQLiteStatement = insertStatementCache->_cachedSQLiteStatement;
      if (cachedSQLiteStatement)
      {
        uint64_t v24 = v5->_insertStatementCache;
        if (+[NSSQLCore debugDefault] >= 1)
        {
          int v8 = *(unsigned __int8 *)(a1 + 42);
          uint64_t v9 = [(NSSQLiteStatement *)v24 sqlString];
          if (v8) {
            uint64_t v16 = @"\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m";
          }
          else {
            uint64_t v16 = @"%@";
          }
          _NSCoreDataLog(6, (uint64_t)v16, v10, v11, v12, v13, v14, v15, v9);
        }
        *(void *)(a1 + 48) = v24;
        *(void *)(a1 + 80) = cachedSQLiteStatement;
        int v17 = v24;
        return;
      }
    }
  }
  uint64_t v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "adapter"), "sqlCore"), "objectIDFactoryForPersistentHistoryEntity:", a2), "alloc"), "initWithPK64:", 1);
  id v25 = (id)objc_msgSend(+[NSSQLRow allocForSQLEntity:]((uint64_t)NSSQLRow, a2), "initWithSQLEntity:objectID:", a2, v18);
  uint64_t v19 = (void *)-[NSSQLiteAdapter newStatementWithEntity:]([(id)a1 adapter], (uint64_t)a2);
  uint64_t v20 = -[NSSQLiteAdapter newGeneratorWithStatement:]((void *)[(id)a1 adapter], (uint64_t)v19);
  uint64_t v21 = (__CFString *)[a2 name];
  if (v20)
  {
    -[_NSSQLGenerator prepareInsertStatementWithRow:includeConstraints:includeOnConflict:onConflictKeys:]((uint64_t)v20, (uint64_t)v25, v21 == @"TRANSACTIONSTRING", 0, (void *)NSArray_EmptyArray);
    uint64_t v22 = (void *)v20[3];
    if (v19) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v22 = 0;
    if (v19)
    {
LABEL_14:
      uint64_t v23 = (void *)v19[4];
      if (v23 != v22)
      {

        v19[4] = [v22 copy];
      }
    }
  }
  -[NSSQLiteConnection prepareSQLStatement:](a1, v19);
  -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:](*(sqlite3_stmt **)(a1 + 48), *(sqlite3_stmt **)(a1 + 80), a1);
  -[NSSQLiteStatementCache cacheInsertStatement:](v5, *(void **)(a1 + 48));
  -[NSSQLiteConnection addVMCachedStatement:](a1, *(const void **)(a1 + 48));
}

- (id)adapter
{
  return [(NSSQLCore *)self->_sqlCore adapter];
}

void __37__NSSQLiteConnection_performAndWait___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x18C127630]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)connect
{
  v198[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    if (v2) {
      dispatch_assert_queue_V2(v2);
    }
    if (!*(void *)(a1 + 24))
    {
      *(void *)(a1 + 24) = (id)[*(id *)(a1 + 16) URL];
    }
    id v3 = *(id *)(a1 + 32);
    if (!v3)
    {
      id v3 = (id)[*(id *)(a1 + 24) path];
      *(void *)(a1 + 32) = v3;
    }
    v170 = (sqlite3 **)(a1 + 72);
    if (!*(void *)(a1 + 72) && (*(unsigned char *)(a1 + 312) & 0x80) == 0)
    {
      v169 = *(void **)(a1 + 368);
      uint64_t v4 = (const char *)[v3 fileSystemRepresentation];
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)(a1 + 16);
      if (!v6 || (*(unsigned char *)(v6 + 201) & 0x40) == 0) {
        goto LABEL_12;
      }
      if (!strcmp(v4, "/dev/null"))
      {
        int v7 = 1;
        uint64_t v5 = ":memory:";
      }
      else
      {
        int v8 = (void *)[*(id *)(a1 + 32) stringByReplacingOccurrencesOfString:@"/dev/null/" withString:&stru_1ED787880];
        if (!v8 || (uint64_t v9 = (uint64_t)v8, ![v8 length]))
        {
LABEL_12:
          int v7 = 0;
          goto LABEL_18;
        }
        uint64_t v167 = v9;
        uint64_t v5 = (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"file:%@?mode=memory&cache=shared", "fileSystemRepresentation"];
        int v7 = 1;
      }
LABEL_18:
      if (+[NSSQLCore debugDefault]) {
        _NSCoreDataLog(4, @"Connecting to sqlite database file at \"%@\"", v10, v11, v12, v13, v14, v15, *(void *)(a1 + 32));
      }
      v180 = (char *)v5;
      if (v7)
      {
        uint64_t v16 = 0;
      }
      else
      {
        memset(&v194, 0, 144);
        int v17 = stat(v5, (stat *)&v194);
        uint64_t v16 = *(void *)&v194.f_mntonname[8];
        if (v17) {
          uint64_t v16 = 0;
        }
      }
      if (v16) {
        char v18 = v7;
      }
      else {
        char v18 = 1;
      }
      char v178 = v18;
      if ([*(id *)(a1 + 16) isReadOnly]) {
        int v19 = 1;
      }
      else {
        int v19 = 6;
      }
      int v177 = v19;
      uint64_t v20 = objc_msgSend(v169, "objectForKey:");
      if (v20)
      {
        uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v20, "count"));
        long long v184 = 0u;
        long long v185 = 0u;
        long long v182 = 0u;
        long long v183 = 0u;
        uint64_t v22 = [v20 countByEnumeratingWithState:&v182 objects:v195 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v183;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v183 != v23) {
                objc_enumerationMutation(v20);
              }
              id v25 = *(void **)(*((void *)&v182 + 1) + 8 * i);
              if (v25 != NSKeyValueCoding_NullValue) {
                objc_msgSend(v21, "setObject:forKey:", objc_msgSend(v20, "objectForKey:", *(void *)(*((void *)&v182 + 1) + 8 * i)), objc_msgSend(v25, "lowercaseString"));
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v182 objects:v195 count:16];
          }
          while (v22);
        }
        [*(id *)(a1 + 160) setDictionary:v21];
      }
      [*(id *)(a1 + 160) removeObjectForKey:@"recursive_triggers"];
      if (v7)
      {
        unsigned int v26 = *(_DWORD *)(a1 + 312) & 0xFFFFFFF3;
      }
      else
      {
        memset(&v194, 0, 512);
        if (!statfs(v180, &v194))
        {
          char f_flags = v194.f_flags;
          if ((v194.f_flags & 0x1000) != 0)
          {
            unsigned int v139 = *(_DWORD *)(a1 + 312) & 0xFFFFFFF3 | 4;
          }
          else
          {
            BOOL v137 = *(_DWORD *)v194.f_fstypename == 1684170103 && *(_DWORD *)&v194.f_fstypename[3] == 7758180;
            int v138 = *(_DWORD *)(a1 + 312);
            if (v137) {
              unsigned int v139 = v138 | 0xC;
            }
            else {
              unsigned int v139 = v138 & 0xFFFFFFF3 | 8;
            }
          }
          *(_DWORD *)(a1 + 312) = v139;
          if (f_flags) {
            int v140 = 1;
          }
          else {
            int v140 = v177;
          }
          int v177 = v140;
LABEL_46:
          uint64_t v27 = [*(id *)(a1 + 160) objectForKey:@"lock_proxy_file"];
          if (v27 == [MEMORY[0x1E4F1CA98] null])
          {
            int v28 = *(_DWORD *)(a1 + 312);
          }
          else
          {
            int v28 = *(_DWORD *)(a1 + 312);
            if (v27 || BYTE1(z9dsptsiQ80etb9782fsrs98bfdle88))
            {
              v177 |= 0x20u;
              v28 |= 0x10u;
              *(_DWORD *)(a1 + 312) = v28;
            }
          }
          *(_DWORD *)(a1 + 312) = v28 & 0xFFFFFFBF;
          uint64_t v29 = [*(id *)(a1 + 160) objectForKey:@"journal_mode"];
          if ((_BYTE)dword_1EB270AB0) {
            CFArrayRef v30 = @"wal";
          }
          else {
            CFArrayRef v30 = 0;
          }
          if (v29) {
            CFArrayRef v30 = (__CFString *)v29;
          }
          int v31 = *(_DWORD *)(a1 + 312);
          if ((v31 & 8) != 0) {
            int v32 = @"delete";
          }
          else {
            int v32 = v30;
          }
          if ((v31 & 0x10) != 0) {
            unsigned int v33 = v30;
          }
          else {
            unsigned int v33 = v32;
          }
          if ([*(id *)(a1 + 368) objectForKey:@"NSPersistentStoreUbiquitousContentNameKey"]) {
            uint64_t v34 = @"delete";
          }
          else {
            uint64_t v34 = v33;
          }
          if (v7) {
            uint64_t v35 = @"memory";
          }
          else {
            uint64_t v35 = v34;
          }
          if (v35 && v35 != (__CFString *)[MEMORY[0x1E4F1CA98] null])
          {
            [*(id *)(a1 + 160) setObject:v35 forKey:@"journal_mode"];
            *(_DWORD *)(a1 + 312) = *(_DWORD *)(a1 + 312) & 0xFFFFFFBF | (([(__CFString *)v35 compare:@"wal" options:1] == 0) << 6);
          }
          if ((v7 & 1) == 0)
          {
            unint64_t v36 = *(void *)(a1 + 16);
            if (v36)
            {
              unint64_t v36 = (((unint64_t)*(unsigned int *)(v36 + 200) >> 2) & 7) - 1;
              if (v36 > 6) {
                LODWORD(v36) = 0;
              }
              else {
                LODWORD(v36) = dword_18AE5441C[v36];
              }
            }
            v177 |= v36;
          }
          if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 24), "query"), "length"))
          {
            int v37 = *(void **)(a1 + 24);
            self;
            v180 = (char *)objc_msgSend((id)objc_msgSend(v37, "absoluteString"), "fileSystemRepresentation");
          }
          uint64_t v38 = *(void *)(a1 + 16);
          if (v38) {
            int v39 = *(void **)(v38 + 248);
          }
          else {
            int v39 = 0;
          }
          uint64_t v40 = +[NSSQLiteConnection openAtPath:withKey:handle:flags:module:checkpointOnClose:]((uint64_t)NSSQLiteConnection, v180, v39, v170, v177, 0);
          if (v40)
          {
            uint64_t v42 = *v170;
            if (*v170)
            {
LABEL_267:
              v144 = sqlite3_errmsg(v42);
LABEL_268:
              if (+[NSSQLCore debugDefault] >= 1)
              {
                if (*(unsigned char *)(a1 + 42)) {
                  long long v151 = @"\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %s\x1B[0m";
                }
                else {
                  long long v151 = @"(%d) %s";
                }
                _NSCoreDataLog(1, (uint64_t)v151, v145, v146, v147, v148, v149, v150, v40);
              }
              if (*v170)
              {
                sqlite3_close_v2(*v170);
                *v170 = 0;
              }
              if (v40 == 26)
              {
                uint64_t v152 = [NSString stringWithFormat:@"File at path does not appear to be a SQLite database: %@", *(void *)(a1 + 32)];
                long long v153 = (void *)MEMORY[0x1E4F1C9E8];
                uint64_t v154 = *(void *)(a1 + 32);
                uint64_t v155 = [NSNumber numberWithInteger:26];
                long long v156 = objc_msgSend(v153, "dictionaryWithObjectsAndKeys:", v154, *MEMORY[0x1E4F28328], v155, @"NSSQLiteErrorDomain", 0);
                id v157 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 259, v152, v156);
                objc_exception_throw(v157);
              }
              uint64_t v161 = [NSString stringWithUTF8String:v144];
              v162 = (void *)MEMORY[0x1E4F1C9E8];
              uint64_t v163 = *(void *)(a1 + 32);
              uint64_t v164 = [NSNumber numberWithInt:v40];
              v165 = objc_msgSend(v162, "dictionaryWithObjectsAndKeys:", v163, *MEMORY[0x1E4F28328], v164, @"NSSQLiteErrorDomain", 0);
              id v166 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 256, v161, v165);
              objc_exception_throw(v166);
            }
          }
          else
          {
            if ((*(unsigned char *)(a1 + 313) & 8) != 0)
            {
              uint64_t v167 = 0;
              sqlite3_db_config(*v170, 1001);
            }
            if ((v7 & 1) != 0 || (uint64_t v41 = *(void *)(a1 + 16)) != 0 && *(void *)(v41 + 248))
            {
              uint64_t v40 = 0;
            }
            else if (readMagicWordFromDBHandle(*v170))
            {
              uint64_t v40 = 26;
            }
            else
            {
              uint64_t v40 = 0;
            }
            uint64_t v42 = *v170;
            if (*v170 && !v40)
            {
              if (*(void *)(a1 + 328))
              {
                uint64_t v167 = 1;
                uint64_t v43 = sqlite3_db_config(v42, 1006);
                if (v43) {
                  _NSCoreDataLog(1, @"sqlite3_db_config for SQLITE_DBCONFIG_NO_CKPT_ON_CLOSE failed (_qGTC): %d", v44, v45, v46, v47, v48, v49, v43);
                }
              }
              if (objc_msgSend((id)objc_msgSend(v169, "objectForKey:", @"NSPersistentStoreServiceConfigurationOptionKey"), "intValue"))
              {
                uint64_t v167 = 0;
                uint64_t v50 = sqlite3_db_config(*v170, 1001);
                if (v50) {
                  _NSCoreDataLog(1, @"sqlite3_db_config for SQLITE_DBCONFIG_LOOKASIDE failed: %d", v51, v52, v53, v54, v55, v56, v50);
                }
                -[NSSQLiteConnection _executeSQLString:](a1, @"pragma cache_spill = 64");
              }
              *(void *)(a1 + 304) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              *(_DWORD *)(a1 + 312) &= ~2u;
              uint64_t v57 = *(NSObject **)(a1 + 8);
              if (v57) {
                dispatch_assert_queue_V2(v57);
              }
              if (NSSQLiteRegisterFunctions(*(sqlite3 **)(a1 + 72), (void **)a1)) {
                objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"An internal error occurred while configuring functions in the SQLite database." userInfo:0]);
              }
              sqlite3_extended_result_codes(*(sqlite3 **)(a1 + 72), 1);
              -[NSSQLiteConnection _restoreBusyTimeOutSettings](a1);
              *(_DWORD *)(a1 + 312) |= 0x80u;
              if ((v177 & 1) == 0) {
                [*(id *)(a1 + 160) objectForKey:@"synchronous"];
              }
              if (v178) {
                int v58 = 1;
              }
              else {
                int v58 = -[NSSQLiteConnection _hasTableWithName:isTemp:](a1, @"Z_METADATA", 0) ^ 1;
              }
              uint64_t v59 = (void *)[*(id *)(a1 + 160) objectForKey:@"integrity_check"];
              if ([v59 isNSString])
              {
                if (([v59 isEqualToString:@"1"] & 1) != 0
                  || ![v59 caseInsensitiveCompare:@"YES"])
                {
                  goto LABEL_108;
                }
              }
              else if (v59 == (void *)[MEMORY[0x1E4F1CA98] null])
              {
LABEL_108:
                objc_msgSend(*(id *)(a1 + 160), "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"integrity_check");
                goto LABEL_111;
              }
              [*(id *)(a1 + 160) removeObjectForKey:@"integrity_check"];
LABEL_111:
              if (!v58)
              {
                objc_msgSend(*(id *)(a1 + 160), "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"auto_vacuum");
                goto LABEL_158;
              }
              if (v177)
              {
                uint64_t v158 = [NSString stringWithFormat:@"Cannot create a new database file with the read only option at path: %@", *(void *)(a1 + 32)];
                long long v159 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *(void *)(a1 + 32), *MEMORY[0x1E4F28328], 0);
                id v160 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 257, v158, v159);
                objc_exception_throw(v160);
              }
              CFDateRef v60 = *(NSObject **)(a1 + 8);
              if (v60) {
                dispatch_assert_queue_V2(v60);
              }
              if (+[NSSQLCore debugDefault] >= 1) {
                _NSCoreDataLog(4, @"creating schema.", v61, v62, v63, v64, v65, v66, v167);
              }
              uint64_t v67 = (void *)[*(id *)(a1 + 16) model];
              uint64_t v68 = *(void *)(a1 + 16);
              if (v68) {
                [*(id *)(v68 + 216) lock];
              }
              uint64_t v69 = (void *)[*(id *)(a1 + 160) objectForKey:@"lock_proxy_file"];
              if (v69
                && v69 != (void *)[MEMORY[0x1E4F1CA98] null]
                && ([v69 isEqual:@":auto:"] & 1) == 0)
              {
                uint64_t v70 = [(id)a1 adapter];
                unsigned int v71 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:](v70, [NSString stringWithFormat:@"pragma lock_proxy_file='%@'", v69]);
                -[NSSQLiteConnection prepareAndExecuteSQLStatement:](a1, v71);
              }
              uint64_t v72 = *(void **)(a1 + 368);
              uint64_t v73 = objc_msgSend((id)objc_msgSend(v72, "objectForKey:", 0x1ED7969C0), "intValue");
              if (!v73)
              {
                uint64_t v73 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v72, "objectForKey:", @"NSSQLitePragmasOption"), "objectForKey:", @"page_size"), "intValue");
                if (!v73)
                {
                  if ((*(_DWORD *)(a1 + 312) & 0xC) == 8) {
                    uint64_t v73 = 0x2000;
                  }
                  else {
                    uint64_t v73 = 4096;
                  }
                }
              }
              uint64_t v74 = [(id)a1 adapter];
              uint64_t v75 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:](v74, objc_msgSend(NSString, "stringWithFormat:", @"pragma page_size=%d", v73));
              -[NSSQLiteConnection prepareAndExecuteSQLStatement:](a1, v75);

              v76 = (__CFString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 368), "objectForKey:", @"NSSQLitePragmasOption"), "objectForKey:", @"auto_vacuum"), "lowercaseString");
              if (!v76 || v76 == (__CFString *)[MEMORY[0x1E4F1CA98] null]) {
                v76 = @"2";
              }
              id v77 = (void *)[[NSString alloc] initWithFormat:@"pragma auto_vacuum=%@"];
              uint64_t v78 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([(id)a1 adapter], (uint64_t)v77);

              -[NSSQLiteConnection prepareAndExecuteSQLStatement:](a1, v78);
              if ([(__CFString *)v76 isEqualToString:@"2"])
              {
                uint64_t v79 = 0;
              }
              else
              {
                int v80 = [(__CFString *)v76 isEqualToString:@"incremental"];
                uint64_t v79 = 0x7FFFFFFFFFFFFFFFLL;
                if (v80) {
                  uint64_t v79 = 0;
                }
              }
              *(void *)(a1 + 296) = v79;
              *(_DWORD *)(a1 + 312) &= ~0x20u;
              v197 = @"_NSAutoVacuumLevel";
              v198[0] = v76;
              -[NSSQLCore _updateAutoVacuumMetadataWithValues:](*(unsigned __int8 **)(a1 + 16), (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v198 forKeys:&v197 count:1]);
              -[NSSQLiteConnection beginTransaction](a1);
              if (-[NSSQLiteConnection _hasTableWithName:isTemp:](a1, @"Z_METADATA", 0))
              {
                -[NSSQLiteConnection commitTransaction](a1);
                -[NSSQLiteConnection didCreateSchema]((unsigned char *)a1);
                uint64_t v81 = *(void *)(a1 + 16);
                if (!v81) {
                  goto LABEL_157;
                }
              }
              else
              {
                if (v67) {
                  unsigned int v82 = (void *)v67[4];
                }
                else {
                  unsigned int v82 = 0;
                }
                -[NSSQLiteConnection createTablesForEntities:](a1, v82);
                unsigned int v83 = *(NSObject **)(a1 + 8);
                if (v83) {
                  dispatch_assert_queue_V2(v83);
                }
                if (+[NSSQLCore debugDefault] >= 1) {
                  _NSCoreDataLog(4, @"Creating primary key table.", v84, v85, v86, v87, v88, v89, (uint64_t)v76);
                }
                uint64_t v90 = (NSSQLiteStatement *)[(id)a1 adapter];
                PrimaryKeyTable = -[NSSQLiteAdapter newCreatePrimaryKeyTableStatement](v90);
                -[NSSQLiteConnection prepareAndExecuteSQLStatement:](a1, PrimaryKeyTable);

                if (v67) {
                  v92 = (void *)v67[4];
                }
                else {
                  v92 = 0;
                }
                uint64_t v93 = [v92 count];
                if (v93)
                {
                  for (uint64_t j = 0; j != v93; ++j)
                  {
                    uint64_t v95 = (void *)MEMORY[0x18C127630]();
                    CFBitVectorRef v96 = -[NSSQLiteAdapter newPrimaryKeyInitializeStatementForEntity:withInitialMaxPK:](v90, [v92 objectAtIndex:j], 0);
                    -[NSSQLiteConnection prepareAndExecuteSQLStatement:](a1, v96);
                  }
                }
                -[NSSQLiteConnection createMetadata]((void *)a1);
                -[NSSQLiteConnection saveMetadata:]((void *)a1, (__CFString *)objc_msgSend(*(id *)(a1 + 16), "_updatedMetadataWithSeed:includeVersioning:", objc_msgSend(*(id *)(a1 + 16), "metadata"), 1));
                uint64_t v97 = -[NSSQLiteConnection saveCachedModel:](a1, [v67 managedObjectModel]);
                uint64_t v98 = *(void *)(a1 + 16);
                if (v98 && (*(unsigned char *)(v98 + 201) & 4) != 0)
                {
                  id v99 = (void *)MEMORY[0x18C127630](v97);
                  uint64_t v100 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey");
                  if (v100) {
                    uint64_t v101 = *(void **)(v100 + 32);
                  }
                  else {
                    uint64_t v101 = 0;
                  }
                  -[NSSQLiteConnection createTablesForEntities:](a1, v101);
                }
                -[NSSQLiteConnection commitTransaction](a1);
                -[NSSQLiteConnection didCreateSchema]((unsigned char *)a1);
                uint64_t v81 = *(void *)(a1 + 16);
                if (!v81) {
                  goto LABEL_157;
                }
              }
              [*(id *)(v81 + 216) unlock];
LABEL_157:
              -[NSSQLiteConnection endFetchAndRecycleStatement:](a1, 0);
LABEL_158:
              uint64_t v102 = [*(id *)(a1 + 160) objectForKey:@"page_size"];
              if (v102)
              {
                if (v102 == [MEMORY[0x1E4F1CA98] null]) {
                  uint64_t v103 = (void *)[NSString stringWithFormat:@"pragma %@", @"page_size"];
                }
                else {
                  uint64_t v103 = (void *)[NSString stringWithFormat:@"pragma %@=%@", @"page_size", v102];
                }
                -[NSSQLiteConnection _executeSQLString:](a1, v103);
              }
              if ((v177 & 1) == 0) {
                -[NSSQLiteConnection _executeSQLString:](a1, (void *)[NSString stringWithFormat:@"pragma recursive_triggers=1"]);
              }
              BOOL v171 = (v58 & 1) == 0
                  && [*(id *)(a1 + 368) objectForKey:@"NSSQLiteManualVacuumOption"] != 0;
              long long v188 = 0u;
              long long v189 = 0u;
              long long v186 = 0u;
              long long v187 = 0u;
              id obj = *(id *)(a1 + 160);
              uint64_t v104 = [obj countByEnumeratingWithState:&v186 objects:v196 count:16];
              if (v104)
              {
                uint64_t v176 = *(void *)v187;
                *(void *)&long long v105 = 138412290;
                long long v168 = v105;
                do
                {
                  uint64_t v179 = v104;
                  for (uint64_t k = 0; k != v179; ++k)
                  {
                    if (*(void *)v187 != v176) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v107 = *(void **)(*((void *)&v186 + 1) + 8 * k);
                    uint64_t v108 = [*(id *)(a1 + 160) objectForKey:v107];
                    if (((v177 & 1) == 0
                       || ([v107 isEqualToString:@"journal_mode"] & 1) == 0
                       && ([v107 isEqualToString:@"synchronous"] & 1) == 0)
                      && ([v107 isEqualToString:@"page_size"] & 1) == 0
                      && (!v171 || ([v107 isEqualToString:@"journal_mode"] & 1) == 0)
                      && (+[NSSQLCore debugDefault]
                       || v108 != [MEMORY[0x1E4F1CA98] null]
                       || ([v107 isEqualToString:@"journal_mode"] & 1) == 0))
                    {
                      if ([v107 isEqualToString:@"integrity_check"])
                      {
                        uint64_t v109 = *(NSObject **)(a1 + 8);
                        if (v109) {
                          dispatch_assert_queue_V2(v109);
                        }
                        v174 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([(id)a1 adapter], @"pragma integrity_check");
                        v173 = [[NSSQLColumn alloc] initWithColumnName:@"*" sqlType:6];
                        v172 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v173, 0);
                        -[NSSQLiteConnection prepareSQLStatement:](a1, v174);
                        [(id)a1 execute];
                        -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v172);
                        int v110 = 0;
                        char v181 = 1;
LABEL_184:
                        uint64_t v111 = -[NSSQLiteConnection newFetchedArray](a1);
                        uint64_t v112 = v111;
                        if (!v111)
                        {
LABEL_208:

                          -[NSSQLiteConnection releaseSQLStatement](a1);
                          -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0);
                          *(_DWORD *)(a1 + 312) &= ~2u;
                          *(void *)(a1 + 92) = 0;
                          *(void *)(a1 + 100) = 0;
                          *(_DWORD *)(a1 + 108) = 0;

                          if ((v181 & 1) == 0)
                          {
                            uint64_t v141 = [NSString stringWithFormat:@"Database failed integrity check.  Corrupted SQLite database at path: %@", *(void *)(a1 + 32)];
                            id v142 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *(void *)(a1 + 32), *MEMORY[0x1E4F28328], v141, @"message", 0, v168);
                            id v143 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 259, v141, v142);
                            objc_exception_throw(v143);
                          }
                          continue;
                        }
                        uint64_t v113 = (void *)[v111 objectAtIndex:0];
                        uint64_t v114 = v113;
                        if (v110 || ([v113 isEqualToString:@"ok"] & 1) == 0)
                        {
                          char v181 = 0;
                        }
                        else if (v181)
                        {
LABEL_201:

                          ++v110;
                          goto LABEL_184;
                        }
                        if (!+[NSSQLCore debugDefault]) {
                          goto LABEL_208;
                        }
                        uint64_t v115 = (void *)[v114 componentsSeparatedByString:@"\n"];
                        long long v192 = 0u;
                        long long v193 = 0u;
                        long long v190 = 0u;
                        long long v191 = 0u;
                        uint64_t v122 = [v115 countByEnumeratingWithState:&v190 objects:&v194 count:16];
                        if (v122)
                        {
                          uint64_t v123 = *(void *)v191;
                          do
                          {
                            for (uint64_t m = 0; m != v122; ++m)
                            {
                              if (*(void *)v191 != v123) {
                                objc_enumerationMutation(v115);
                              }
                              if (*(unsigned char *)(a1 + 42)) {
                                uint64_t v125 = @"\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m %@\x1B[0m";
                              }
                              else {
                                uint64_t v125 = @"%@";
                              }
                              _NSCoreDataLog(1, (uint64_t)v125, v116, v117, v118, v119, v120, v121, *(void *)(*((void *)&v190 + 1) + 8 * m));
                            }
                            uint64_t v122 = [v115 countByEnumeratingWithState:&v190 objects:&v194 count:16];
                          }
                          while (v122);
                        }
                        goto LABEL_201;
                      }
                      if ([v107 isEqualToString:@"lock_proxy_file"])
                      {
                        uint64_t v126 = [MEMORY[0x1E4F1CA98] null];
                        uint64_t v127 = NSString;
                        if (v108 != v126)
                        {
                          uint64_t v128 = @"pragma %@='%@'";
                          goto LABEL_215;
                        }
                        unint64_t v131 = @"pragma %@=''";
LABEL_224:
                        unsigned int v130 = objc_msgSend(v127, "stringWithFormat:", v131, v107);
                        goto LABEL_225;
                      }
                      if (![v107 isEqualToString:@"auto_vacuum"])
                      {
                        uint64_t v129 = [MEMORY[0x1E4F1CA98] null];
                        uint64_t v127 = NSString;
                        if (v108 == v129)
                        {
                          unint64_t v131 = @"pragma %@";
                          goto LABEL_224;
                        }
                        uint64_t v128 = @"pragma %@=%@";
LABEL_215:
                        unsigned int v130 = objc_msgSend(v127, "stringWithFormat:", v128, v107, v108);
LABEL_225:
                        -[NSSQLiteConnection _executeSQLString:](a1, v130);
                        continue;
                      }
                      if ([*(id *)(a1 + 16) isReadOnly])
                      {
LABEL_212:
                        *(void *)(a1 + 296) = 0x7FFFFFFFFFFFFFFFLL;
                        continue;
                      }
                      uint64_t v132 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "metadata"), "objectForKey:", @"_NSAutoVacuumLevel");
                      if (v132)
                      {
                        uint64_t v133 = (void *)[*(id *)(a1 + 160) objectForKey:@"auto_vacuum"];
                        if ((void *)[MEMORY[0x1E4F1CA98] null] == v133
                          || (v134 = (void *)[v133 lowercaseString]) == 0)
                        {
                          if (([@"2" isEqualToString:v132] & 1) == 0)
                          {
LABEL_230:
                            if (![@"incremental" isEqualToString:v132]) {
                              goto LABEL_212;
                            }
                          }
LABEL_231:
                          *(void *)(a1 + 296) = 0;
                          continue;
                        }
                        if ([v134 isEqualToString:v132])
                        {
                          if (([@"2" isEqualToString:v132] & 1) == 0) {
                            goto LABEL_230;
                          }
                          goto LABEL_231;
                        }
                      }
                      *(_DWORD *)(a1 + 312) |= 0x20u;
                      continue;
                    }
                  }
                  uint64_t v104 = [obj countByEnumeratingWithState:&v186 objects:v196 count:16];
                }
                while (v104);
              }
              if (v177) {
                goto LABEL_256;
              }
              -[NSSQLiteConnection configureUbiquityMetadataTable](a1);
              if ((v58 & 1) == 0)
              {
                if ([v169 objectForKey:@"NSSQLiteAnalyzeOption"]) {
                  -[NSSQLiteConnection _executeSQLString:](a1, @"ANALYZE");
                }
                if ([v169 objectForKey:@"NSSQLiteManualVacuumOption"]) {
                  -[NSSQLiteConnection _executeSQLString:](a1, @"VACUUM");
                }
              }
              if ((*(unsigned char *)(a1 + 312) & 0x40) == 0) {
                goto LABEL_256;
              }
              v194.f_bsize = 0;
              uint64_t v135 = (void *)[v169 objectForKey:@"NSSQLitePersistWALOption"];
              if (v135)
              {
                if ([v135 intValue] != 1) {
                  goto LABEL_255;
                }
              }
              else if (!(_BYTE)dword_1EB270AB0)
              {
LABEL_256:
                *(_DWORD *)(a1 + 312) &= ~0x80u;
                return;
              }
              v194.f_bsize = 1;
LABEL_255:
              sqlite3_file_control(*v170, 0, 10, &v194);
              goto LABEL_256;
            }
            if (v42) {
              goto LABEL_267;
            }
          }
          v144 = "unknown";
          goto LABEL_268;
        }
        unsigned int v26 = *(_DWORD *)(a1 + 312) | 0xC;
      }
      *(_DWORD *)(a1 + 312) = v26;
      goto LABEL_46;
    }
  }
}

- (void)currentStats
{
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  if (a1)
  {
    *(void *)pHiwtr = 0;
    if (sqlite3_db_status(*(sqlite3 **)(a1 + 72), 8, pHiwtr, &pHiwtr[1], 0))
    {
      uint64_t v4 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
      _NSCoreDataLog(1, @"Unable to get SQLITE_DBSTATUS_CACHE_MISS: %s (%d)\n", v5, v6, v7, v8, v9, v10, (uint64_t)v4);
    }
    else
    {
      *(void *)a2 = pHiwtr[0];
    }
    *(void *)pCur = 0;
    if (sqlite3_db_status(*(sqlite3 **)(a1 + 72), 7, pCur, &pCur[1], 0))
    {
      uint64_t v11 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
      _NSCoreDataLog(1, @"Unable to get SQLITE_DBSTATUS_CACHE_HIT: %s (%d)\n", v12, v13, v14, v15, v16, v17, (uint64_t)v11);
    }
    else
    {
      *(void *)(a2 + 8) = pCur[0];
    }
    *(void *)int v39 = 0;
    if (sqlite3_db_status(*(sqlite3 **)(a1 + 72), 12, v39, &v39[1], 0))
    {
      char v18 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
      _NSCoreDataLog(1, @"Unable to get SQLITE_DBSTATUS_CACHE_SPILL: %s (%d)\n", v19, v20, v21, v22, v23, v24, (uint64_t)v18);
    }
    else
    {
      *(void *)(a2 + 16) = v39[0];
    }
    uint64_t v25 = *(void *)(a1 + 352);
    if (!v25)
    {
      unsigned int v26 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([(id)a1 adapter], @"pragma page_size");
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      int v28 = [[NSSQLColumn alloc] initWithColumnName:@"page_size" sqlType:2];
      [v27 addObject:v28];

      -[NSSQLiteConnection prepareSQLStatement:](a1, v26);
      -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v27);
      [(id)a1 execute];
      uint64_t v25 = 0;
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      while (1)
      {
        CFArrayRef v30 = -[NSSQLiteConnection newFetchedArray](a1);
        if (!v30) {
          break;
        }
        int v31 = v30;
        if ([v30 count] == 1)
        {
          uint64_t v32 = objc_msgSend((id)objc_msgSend(v31, "objectAtIndex:", 0), "longLongValue");
          if (+[NSSQLCore debugDefault] >= 1) {
            _NSCoreDataLog(4, @"Fetched page size: %lld", v33, v34, v35, v36, v37, v38, v32);
          }
        }
        else
        {
          uint64_t v32 = v25;
        }
        uint64_t v25 = v32;
      }
      -[NSSQLiteConnection releaseSQLStatement](a1);
      -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0);
      *(_DWORD *)(a1 + 312) &= ~2u;
      *(void *)(a1 + 100) = 0;
      *(void *)(a1 + 92) = 0;
      *(_DWORD *)(a1 + 108) = 0;

      *(void *)(a1 + 352) = v25;
    }
    *(void *)(a2 + 24) = v25;
  }
}

- (uint64_t)_adoptQueryGenerationWithSnapshot:(uint64_t)a1
{
  uint64_t v4 = *(NSObject **)(a1 + 8);
  if (v4) {
    dispatch_assert_queue_V2(v4);
  }
  if (a2)
  {
    if (!*(void *)(a1 + 72)) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"database connection must not be nil here" userInfo:0]);
    }
    uint64_t v5 = [(id)a2 bytes];
    if (v5)
    {
      uint64_t v6 = (sqlite3_snapshot *)v5;
      if (+[NSSQLCore debugDefault] >= 1)
      {
        [MEMORY[0x1E4F1C9B8] dataWithBytes:v6 length:48];
        _NSCoreDataLog(4, @"connection %p adopting snapshot:\n\tss value: %@\n\tpointer value:%@\n\tpointer: %p", v7, v8, v9, v10, v11, v12, a1);
      }
      a2 = sqlite3_snapshot_open(*(sqlite3 **)(a1 + 72), "main", v6);
      BOOL v19 = a2 == 0;
      if (a2 != 517 && (_BYTE)a2)
      {
        if (a2 != 5)
        {
LABEL_18:
          _NSCoreDataLog(1, @"sqlite3_snapshot_open failed with %ld", v13, v14, v15, v16, v17, v18, a2);
          return a2;
        }
        while (1)
        {
          usleep(0x64u);
          a2 = sqlite3_snapshot_open(*(sqlite3 **)(a1 + 72), "main", v6);
          BOOL v19 = a2 == 0;
          if (a2 == 517 || a2 == 0) {
            break;
          }
          if (a2 != 5) {
            goto LABEL_18;
          }
        }
      }
      if (!v19) {
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v21 = [NSString stringWithUTF8String:"sqlite3_snapshot data was unexpectedly NULL"];
      _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, v30);
      int v28 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18AB82000, v28, OS_LOG_TYPE_FAULT, "CoreData: sqlite3_snapshot data was unexpectedly NULL", buf, 2u);
      }
      return 7;
    }
  }
  return a2;
}

- (uint64_t)adoptQueryGenerationWithIdentifier:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(NSObject **)(result + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    if ((*(unsigned char *)(v3 + 313) & 2) == 0)
    {
      uint64_t v5 = sqlite3_snapshot_recover(*(sqlite3 **)(v3 + 72), "main");
      if (v5 && (uint64_t v6 = v5, readFileSizeFromJournalHandle(*(sqlite3 **)(v3 + 72)) >= 1)) {
        _NSCoreDataLog(1, @"sqlite3_snapshot_recover failed with %d", v7, v8, v9, v10, v11, v12, v6);
      }
      else {
        *(_DWORD *)(v3 + 312) |= 0x200u;
      }
    }
    return -[NSSQLiteConnection _adoptQueryGenerationWithSnapshot:](v3, a2);
  }
  return result;
}

- (void)beginTransaction
{
  if (a1)
  {
    v2 = (void *)MEMORY[0x18C127630]();
    -[NSSQLiteConnection connect](a1);
    -[NSSQLiteConnection _ensureNoTransactionOpen](a1);
    -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
    uint64_t v3 = *(NSSQLiteStatement **)(a1 + 128);
    if (!v3)
    {
      if (*(void *)(a1 + 72))
      {
        if (+[NSPersistentStoreCoordinator _shouldDebugAllTaskAssertions]())
        {
          int v15 = 0;
          if (!sqlite3_file_control(*(sqlite3 **)(a1 + 72), 0, 103, &v15) && v15 >= 2)
          {
            self;
            uint64_t v4 = [NSString stringWithUTF8String:"A task assertion should be active when this database is locked"];
            _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, v14);
            uint64_t v11 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              LOWORD(v14) = 0;
              _os_log_fault_impl(&dword_18AB82000, v11, OS_LOG_TYPE_FAULT, "CoreData: A task assertion should be active when this database is locked", (uint8_t *)&v14, 2u);
            }
          }
        }
      }
      uint64_t v3 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:@"BEGIN EXCLUSIVE"];
      *(void *)(a1 + 128) = v3;
    }
    -[NSSQLiteConnection prepareSQLStatement:](a1, v3);
    uint64_t v12 = *(sqlite3_stmt **)(a1 + 128);
    if (v12) {
      uint64_t v13 = *((void *)v12 + 8);
    }
    else {
      uint64_t v13 = 0;
    }
    if (*(void *)(a1 + 80) != v13) {
      -[NSSQLiteConnection cacheCurrentDBStatementOn:](a1, v12);
    }
    _execute(a1);
    -[NSSQLiteConnection resetSQLStatement](a1);
    *(unsigned char *)(a1 + 41) = 0;
    if (!*(unsigned char *)(a1 + 40))
    {
      *(unsigned char *)(a1 + 40) = 1;
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"NSSQLConnectionBeginTransactionNotification", a1);
    }
  }
}

- (void)beginReadTransaction
{
  if (a1)
  {
    v2 = (void *)MEMORY[0x18C127630]();
    -[NSSQLiteConnection connect](a1);
    -[NSSQLiteConnection _ensureNoTransactionOpen](a1);
    -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
    uint64_t v3 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:@"BEGIN TRANSACTION"];
    -[NSSQLiteConnection prepareSQLStatement:](a1, v3);
    _execute(a1);
    -[NSSQLiteConnection releaseSQLStatement](a1);
    *(unsigned char *)(a1 + 41) = 1;

    if (!*(unsigned char *)(a1 + 40))
    {
      *(unsigned char *)(a1 + 40) = 1;
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"NSSQLConnectionBeginTransactionNotification", a1);
    }
  }
}

- (void)_ensureNoTransactionOpen
{
  v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  if (*(unsigned char *)(a1 + 40)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Nested transactions are not supported" userInfo:0]);
  }
}

- (void)commitTransaction
{
  v28[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  v2 = (void *)MEMORY[0x18C127630]();
  if ((*(unsigned char *)(a1 + 312) & 2) != 0)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F1C3B8];
    uint64_t v5 = NSStringFromSelector(sel_commitTransaction);
    uint64_t v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    uint64_t v26 = (uint64_t)v5;
    [v3 raise:v4 format:@"%@ -- %@ %p: attempted to commit a transaction while a fetch was in progress"];
  }
  if (!*(unsigned char *)(a1 + 41) && (*(unsigned char *)(a1 + 312) & 0x20) != 0)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 368), "objectForKey:", @"NSSQLitePragmasOption"), "objectForKey:", @"auto_vacuum");
    if (!v7 || (uint64_t v8 = (__CFString *)v7, [MEMORY[0x1E4F1CA98] null] == v7))
    {
      uint64_t v8 = @"2";
    }
    else if ([(__CFString *)v8 isNSString])
    {
      uint64_t v8 = (__CFString *)[(__CFString *)v8 lowercaseString];
    }
    CFArrayRef v9 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](a1, @"pragma auto_vacuum");
    if (v9)
    {
      CFArrayRef v10 = v9;
      if (CFArrayGetCount(v9) && *(void *)CFArrayGetValueAtIndex(v10, 0))
      {
        uint64_t v11 = *(void *)CFArrayGetValueAtIndex(v10, 1);
        CFRelease(v10);
        if (v11)
        {
          uint64_t v26 = (uint64_t)v8;
          CFMutableArrayRef v12 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](a1, (void *)[NSString stringWithFormat:@"pragma auto_vacuum=%@"]);
          if (v12) {
            CFRelease(v12);
          }
          if ([@"2" isEqualToString:v8])
          {
            uint64_t v13 = 0;
          }
          else
          {
            int v25 = [@"incremental" isEqualToString:v8];
            uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
            if (v25) {
              uint64_t v13 = 0;
            }
          }
          goto LABEL_21;
        }
      }
      else
      {
        CFRelease(v10);
      }
    }
    uint64_t v8 = @"0";
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_21:
    *(void *)(a1 + 296) = v13;
    *(void *)buf = @"_NSAutoVacuumLevel";
    v28[0] = v8;
    -[NSSQLCore _updateAutoVacuumMetadataWithValues:](*(unsigned __int8 **)(a1 + 16), (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:buf count:1]);
    *(_DWORD *)(a1 + 312) &= ~0x20u;
  }
  -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
  uint64_t v14 = *(NSSQLiteStatement **)(a1 + 136);
  if (!v14)
  {
    if (*(void *)(a1 + 72))
    {
      if (+[NSPersistentStoreCoordinator _shouldDebugAllTaskAssertions]())
      {
        LODWORD(v28[0]) = 0;
        if (!sqlite3_file_control(*(sqlite3 **)(a1 + 72), 0, 103, v28) && SLODWORD(v28[0]) >= 2)
        {
          self;
          uint64_t v15 = [NSString stringWithUTF8String:"A task assertion should be active when this database is locked"];
          _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, v26);
          uint64_t v22 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_18AB82000, v22, OS_LOG_TYPE_FAULT, "CoreData: A task assertion should be active when this database is locked", buf, 2u);
          }
        }
      }
    }
    uint64_t v14 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:@"COMMIT"];
    *(void *)(a1 + 136) = v14;
  }
  -[NSSQLiteConnection prepareSQLStatement:](a1, v14);
  uint64_t v23 = *(sqlite3_stmt **)(a1 + 136);
  if (v23) {
    uint64_t v24 = *((void *)v23 + 8);
  }
  else {
    uint64_t v24 = 0;
  }
  if (*(void *)(a1 + 80) != v24) {
    -[NSSQLiteConnection cacheCurrentDBStatementOn:](a1, v23);
  }
  _execute(a1);
  -[NSSQLiteConnection resetSQLStatement](a1);
  *(unsigned char *)(a1 + 41) = 0;
  -[NSSQLiteConnection _clearTransactionCaches](a1);
  if (*(unsigned char *)(a1 + 40))
  {
    *(unsigned char *)(a1 + 40) = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"NSSQLConnectionCommitTransactionNotification", a1);
  }
}

- (void)_ensureNoStatementPrepared
{
  v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  if (*(void *)(a1 + 80)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Attempted to perform another operation with a statement prepared" userInfo:0]);
  }
}

- (void)_clearTransactionCaches
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v3 = *(void **)(a1 + 216);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v3);
        }
        CFDictionaryRef Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 216), *(const void **)(*((void *)&v32 + 1) + 8 * i));
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v9 = [Value countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v29;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v29 != v11) {
                objc_enumerationMutation(Value);
              }
              uint64_t v13 = (void *)CFDictionaryGetValue((CFDictionaryRef)Value, *(const void **)(*((void *)&v28 + 1) + 8 * j));
              -[NSSQLiteStatement clearCaches:](v13, 0);
              uint64_t v14 = *(__CFDictionary **)(a1 + 152);
              if (v13) {
                BOOL v15 = v14 == 0;
              }
              else {
                BOOL v15 = 1;
              }
              if (!v15) {
                CFDictionaryRemoveValue(v14, v13);
              }
            }
            uint64_t v10 = [Value countByEnumeratingWithState:&v28 objects:v37 count:16];
          }
          while (v10);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v5);
  }
  CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 216));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v16 = *(void **)(a1 + 224);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 224), *(const void **)(*((void *)&v24 + 1) + 8 * k));
        -[NSSQLiteStatement clearCaches:](v21, 0);
        uint64_t v22 = *(__CFDictionary **)(a1 + 152);
        if (v21) {
          BOOL v23 = v22 == 0;
        }
        else {
          BOOL v23 = 1;
        }
        if (!v23) {
          CFDictionaryRemoveValue(v22, v21);
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v18);
  }
  CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 224));
}

- (void)_executeSQLString:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(NSObject **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    context = (void *)MEMORY[0x18C127630]();
    ppStmt = 0;
    pzTail = 0;
    unsigned int v70 = 0;
    -[NSSQLiteConnection _ensureDatabaseOpen]((void *)a1);
    -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
    -[NSSQLiteConnection _ensureNoFetchInProgress](a1);
    if (+[NSSQLCore debugDefault] >= 1)
    {
      if (*(unsigned char *)(a1 + 42)) {
        uint64_t v11 = @"\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m";
      }
      else {
        uint64_t v11 = @"%@";
      }
      _NSCoreDataLog(6, (uint64_t)v11, v5, v6, v7, v8, v9, v10, (uint64_t)a2);
    }
    CFMutableArrayRef v12 = (const char *)[a2 UTF8String];
    unsigned int v13 = 0;
    unsigned int v14 = 0;
    int v15 = 0;
    double v16 = 0.0;
    while (2)
    {
      int v17 = 3 * v14 - 29999;
LABEL_11:
      int v18 = strlen(v12);
      uint64_t v19 = sqlite3_prepare_v2(*(sqlite3 **)(a1 + 72), v12, v18, &ppStmt, (const char **)&pzTail);
      uint64_t v20 = v19;
      switch((char)v19)
      {
        case 0:
          unsigned int v23 = 0;
          unsigned int v24 = 0;
          int v25 = 0;
          double v16 = 0.0;
LABEL_37:
          int v26 = 3 * v24 - 29999;
          break;
        case 1:
        case 7:
        case 10:
        case 17:
        case 21:
          goto LABEL_66;
        case 5:
          if (*(double *)(a1 + 232) > 0.0 && v16 == 0.0) {
            double v16 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
          }
          if (v14 < 0x2711) {
            goto LABEL_31;
          }
          if (v14 - 10000 >= 0xB) {
            useconds_t v21 = v14 - 8899;
          }
          else {
            useconds_t v21 = v17;
          }
          goto LABEL_30;
        case 6:
          if (*(double *)(a1 + 232) > 0.0 && v16 == 0.0) {
            double v16 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
          }
          goto LABEL_27;
        case 11:
        case 26:
          goto LABEL_72;
        case 14:
          if (v15 > 2)
          {
LABEL_66:
            int v29 = v19;
            uint64_t v30 = [NSString stringWithUTF8String:sqlite3_errmsg(*(sqlite3 **)(a1 + 72))];
            if (v29 == 10) {
              sqlite3_file_control(*(sqlite3 **)(a1 + 72), 0, 4, &v70);
            }
            uint64_t v31 = *(void *)(a1 + 32);
            if (v70) {
              uint64_t v32 = [NSString stringWithFormat:@"I/O error for database at %@.  SQLite error code:%d, '%@' errno:%d", v31, v20, v30, v70];
            }
            else {
              uint64_t v32 = [NSString stringWithFormat:@"I/O error for database at %@.  SQLite error code:%d, '%@'", v31, v20, v30, v67];
            }
            long long v33 = (void *)v32;
            if (v32)
            {
              contexta = 0;
              uint64_t v34 = 256;
            }
            else
            {
LABEL_72:
              long long v33 = (void *)[NSString stringWithFormat:@"Fatal error.  The database at %@ is corrupted.  SQLite error code:%d, '%s'", *(void *)(a1 + 32), v20, sqlite3_errmsg(*(sqlite3 **)(a1 + 72))];
              uint64_t v34 = (int)v20;
              contexta = @"NSSQLiteErrorDomain";
            }
            sqlite3_finalize(ppStmt);
            ppStmt = 0;
            -[NSSQLiteConnection _forceDisconnectOnError](a1);
            if (v33)
            {
              uint64_t v41 = (const char *)[v33 UTF8String];
              int v42 = 0;
            }
            else
            {
LABEL_75:
              uint64_t v41 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
              long long v33 = 0;
              int v42 = 1;
            }
            if (*(unsigned char *)(a1 + 42)) {
              uint64_t v43 = @"\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %s\x1B[0m";
            }
            else {
              uint64_t v43 = @"(%d) %s";
            }
LABEL_97:
            _NSCoreDataLog(1, (uint64_t)v43, v35, v36, v37, v38, v39, v40, v20);
            if (v42)
            {
              long long v33 = objc_msgSend(NSString, "stringWithFormat:", @"error during execution of SQL string '%s' : %s", v12, v41);
              uint64_t v34 = 256;
            }
            if (ppStmt) {
              sqlite3_finalize(ppStmt);
            }
            uint64_t v48 = *MEMORY[0x1E4F1C3B8];
            uint64_t v49 = (void *)MEMORY[0x1E4F1C9E8];
            uint64_t v50 = *(void *)(a1 + 32);
            uint64_t v51 = *MEMORY[0x1E4F28328];
            uint64_t v52 = [NSNumber numberWithInt:v20];
            if (v70) {
              uint64_t v53 = objc_msgSend(NSNumber, "numberWithInteger:");
            }
            else {
              uint64_t v53 = 0;
            }
            id v54 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v48, v34, (uint64_t)v33, objc_msgSend(v49, "dictionaryWithObjectsAndKeys:", v50, v51, v52, @"NSSQLiteErrorDomain", v53, *MEMORY[0x1E4F28798], 0));
            uint64_t v55 = v54;
            if (contexta) {
              -[_NSCoreDataException _setDomain:]((uint64_t)v54, contexta);
            }
            objc_exception_throw(v55);
          }
          if (*(double *)(a1 + 232) > 0.0 && v16 == 0.0) {
            double v16 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
          }
          ++v15;
LABEL_27:
          if (v14 <= 0xA) {
            useconds_t v21 = 3 * v14 + 1;
          }
          else {
            useconds_t v21 = v14 + 1101;
          }
LABEL_30:
          usleep(v21);
LABEL_31:
          if (v16 != 0.0)
          {
            double Current = CFAbsoluteTimeGetCurrent();
            if (Current > v16)
            {
              if (v13 > 7)
              {
LABEL_107:
                uint64_t v56 = [NSString stringWithFormat:@"The database operation timed out after %.2f seconds.", Current - v16 + *(double *)(a1 + 232)];
                if (+[NSSQLCore debugDefault] >= 1)
                {
                  if (*(unsigned char *)(a1 + 42)) {
                    uint64_t v63 = @"\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %@\x1B[0m";
                  }
                  else {
                    uint64_t v63 = @"(%d) %@";
                  }
                  uint64_t v66 = v56;
                  _NSCoreDataLog(1, (uint64_t)v63, v57, v58, v59, v60, v61, v62, v20);
                }
                if (ppStmt) {
                  sqlite3_finalize(ppStmt);
                }
                uint64_t v64 = [NSString stringWithFormat:@"error during SQL execution : %@", v56, v66];
                id v65 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134090, v64, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v20), @"NSSQLiteErrorDomain"));
                objc_exception_throw(v65);
              }
              ++v14;
              double v16 = Current + *(double *)(a1 + 240);
              ++v13;
              continue;
            }
          }
          v17 += 3;
          ++v14;
          goto LABEL_11;
        default:
          contexta = 0;
          uint64_t v34 = 0;
          goto LABEL_75;
      }
      break;
    }
    while (2)
    {
      uint64_t v27 = sqlite3_step(ppStmt);
      uint64_t v20 = v27;
      switch((char)v27)
      {
        case 5:
          sqlite3_reset(ppStmt);
          if (*(double *)(a1 + 232) > 0.0 && v16 == 0.0) {
            double v16 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
          }
          if (v24 < 0x2711) {
            goto LABEL_58;
          }
          if (v24 - 10000 >= 0xB) {
            useconds_t v28 = v24 - 8899;
          }
          else {
            useconds_t v28 = v26;
          }
          goto LABEL_57;
        case 6:
          sqlite3_reset(ppStmt);
          if (*(double *)(a1 + 232) > 0.0 && v16 == 0.0) {
            double v16 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
          }
          goto LABEL_54;
        case 7:
        case 10:
        case 17:
        case 21:
          goto LABEL_82;
        case 8:
        case 9:
        case 12:
        case 13:
        case 15:
        case 16:
        case 18:
        case 19:
        case 20:
        case 22:
        case 23:
        case 24:
        case 25:
          goto LABEL_92;
        case 11:
        case 26:
          goto LABEL_88;
        case 14:
          if (v25 > 2) {
            goto LABEL_82;
          }
          if (*(double *)(a1 + 232) > 0.0 && v16 == 0.0) {
            double v16 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
          }
          ++v25;
LABEL_54:
          if (v24 <= 0xA) {
            useconds_t v28 = 3 * v24 + 1;
          }
          else {
            useconds_t v28 = v24 + 1101;
          }
LABEL_57:
          usleep(v28);
LABEL_58:
          if (v16 == 0.0 || (double Current = CFAbsoluteTimeGetCurrent(), Current <= v16))
          {
            v26 += 3;
            ++v24;
            continue;
          }
          if (v23 <= 7)
          {
            ++v24;
            double v16 = Current + *(double *)(a1 + 240);
            ++v23;
            goto LABEL_37;
          }
          goto LABEL_107;
        default:
          if (v27 - 100 < 2)
          {
            sqlite3_finalize(ppStmt);
            return;
          }
          if (v27 == 1)
          {
LABEL_82:
            int v44 = v27;
            uint64_t v45 = [NSString stringWithUTF8String:sqlite3_errmsg(*(sqlite3 **)(a1 + 72))];
            if (v44 == 10) {
              sqlite3_file_control(*(sqlite3 **)(a1 + 72), 0, 4, &v70);
            }
            uint64_t v46 = *(void *)(a1 + 32);
            if (v70) {
              uint64_t v47 = [NSString stringWithFormat:@"I/O error for database at %@.  SQLite error code:%d, '%@' errno:%d", v46, v20, v45, v70];
            }
            else {
              uint64_t v47 = [NSString stringWithFormat:@"I/O error for database at %@.  SQLite error code:%d, '%@'", v46, v20, v45, v67];
            }
            long long v33 = (void *)v47;
            if (v47)
            {
              contexta = 0;
              uint64_t v34 = 256;
            }
            else
            {
LABEL_88:
              long long v33 = (void *)[NSString stringWithFormat:@"Fatal error.  The database at %@ is corrupted.  SQLite error code:%d, '%s'", *(void *)(a1 + 32), v20, sqlite3_errmsg(*(sqlite3 **)(a1 + 72))];
              uint64_t v34 = (int)v20;
              contexta = @"NSSQLiteErrorDomain";
            }
            sqlite3_finalize(ppStmt);
            ppStmt = 0;
            -[NSSQLiteConnection _forceDisconnectOnError](a1);
            if (v33)
            {
              uint64_t v41 = (const char *)[v33 UTF8String];
              int v42 = 0;
              goto LABEL_94;
            }
          }
          else
          {
LABEL_92:
            contexta = 0;
            uint64_t v34 = 0;
          }
          uint64_t v41 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
          long long v33 = 0;
          int v42 = 1;
LABEL_94:
          if (*(unsigned char *)(a1 + 42)) {
            uint64_t v43 = @"\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %s\x1B[0m";
          }
          else {
            uint64_t v43 = @"(%d) %s";
          }
          goto LABEL_97;
      }
    }
  }
}

+ (uint64_t)openAtPath:(uint64_t)a1 withKey:(const char *)a2 handle:(void *)a3 flags:(sqlite3 *)a4 module:(int)a5 checkpointOnClose:(char)a6
{
  self;
  ppDb = 0;
  uint64_t v11 = sqlite3_open_v2(a2, &ppDb, a5, 0);
  if (ppDb)
  {
    if ((a6 & 1) == 0)
    {
      uint64_t v26 = 1;
      uint64_t v12 = sqlite3_db_config(ppDb, 1006);
      if (v12)
      {
        if (!v11) {
          _NSCoreDataLog(1, @"sqlite3_db_config for SQLITE_DBCONFIG_NO_CKPT_ON_CLOSE failed: %d", v13, v14, v15, v16, v17, v18, v12);
        }
      }
    }
  }
  if (a3)
  {
    if (!v11)
    {
      [a3 bytes];
      [a3 length];
      uint64_t v11 = sqlite3_key_v2();
      if (v11 == 21) {
        _NSCoreDataLog(1, @"Failed to activate SQLite encryption extension", v19, v20, v21, v22, v23, v24, v26);
      }
    }
  }
  *a4 = ppDb;
  return v11;
}

- (void)configureUbiquityMetadataTable
{
  if (a1
    && ([*(id *)(a1 + 16) isReadOnly] & 1) == 0
    && [*(id *)(a1 + 368) objectForKey:@"NSPersistentStoreUbiquitousContentNameKey"])
  {
    -[NSSQLiteConnection _executeSQLString:](a1, @"CREATE TABLE IF NOT EXISTS Y_UBMETA (Y_PK INTEGER PRIMARY KEY ASC, YPEERID VARCHAR UNIQUE, YTRANSACTIONNUMBER INTEGER)");
    -[NSSQLiteConnection _executeSQLString:](a1, @"CREATE TABLE IF NOT EXISTS Y_UBRANGE (Y_PK INTEGER PRIMARY_KEY ASC, YPEERID VARCHAR, YENTITYNAME VARCHAR, YRANGESTART INTEGER, YRANGEEND INTEGER, YPEERSTART INTEGER, YPEEREND INTEGER)");
    -[NSSQLiteConnection _executeSQLString:](a1, @"CREATE TABLE IF NOT EXISTS Y_UBKVS (Y_PK INTEGER PRIMARY KEY ASC, YKEY VARCHAR UNIQUE, YVALUE VARCHAR)");
  }
}

- (uint64_t)_restoreBusyTimeOutSettings
{
  double v1 = *(double *)(a1 + 232) * 0.125;
  double v2 = 30.0;
  if (v1 >= 30.0)
  {
    int v3 = 30000;
  }
  else
  {
    double v2 = 2.0;
    if (v1 >= 2.0)
    {
      double v2 = ceil(v1);
      int v3 = 1000 * vcvtpd_s64_f64(v1);
    }
    else
    {
      int v3 = 2000;
    }
  }
  *(double *)(a1 + 240) = v2;
  return sqlite3_busy_timeout(*(sqlite3 **)(a1 + 72), v3);
}

- (_PFSQLiteSnapshotWrapper)currentQueryGenerationIdentifier
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v1 = (uint64_t)result;
  s = result->_s;
  if (s) {
    dispatch_assert_queue_V2(s);
  }
  if (![*(id *)(v1 + 328) count])
  {
    uint64_t v38 = 0;
    int v4 = 5;
    do
    {
      -[NSSQLiteConnection connect](v1);
      if (-[NSSQLiteConnection _ensureWalFileExists](v1) < 0)
      {
        uint64_t v18 = 14;
      }
      else
      {
        -[NSSQLiteConnection beginReadTransaction](v1);
        uint64_t v38 = 0;
        int v3 = -[NSSQLiteConnection _currentQueryGenerationSnapshot:]((_PFSQLiteSnapshotWrapper *)v1, &v38);
        if (v3)
        {
          uint64_t v11 = -[NSSQLiteConnection _adoptQueryGenerationWithSnapshot:](v1, (uint64_t)v3);
          uint64_t v18 = v11;
          if (!v11)
          {
            [*(id *)(v1 + 328) addObject:v3];

            goto LABEL_21;
          }
          _NSCoreDataLog(1, @"currentQueryGenerationIdentifier failed to adopt currentQueryGeneration: %d", v12, v13, v14, v15, v16, v17, v11);
        }
        else
        {
          _NSCoreDataLog(1, @"Failed to get a currentQueryGeneration: %@", v5, v6, v7, v8, v9, v10, v38);
          uint64_t v18 = 0;
        }
        -[NSSQLiteConnection rollbackTransaction](v1);
      }
      --v4;
    }
    while (v4);
    if (v38)
    {
      uint64_t v19 = [NSString stringWithUTF8String:"currentQueryGenerationIdentifier failed with NSError: %@"];
      _NSCoreDataLog(17, v19, v20, v21, v22, v23, v24, v25, v38);
      uint64_t v26 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v40 = v38;
        uint64_t v27 = "CoreData: currentQueryGenerationIdentifier failed with NSError: %@";
        useconds_t v28 = v26;
        uint32_t v29 = 12;
LABEL_26:
        _os_log_fault_impl(&dword_18AB82000, v28, OS_LOG_TYPE_FAULT, v27, buf, v29);
      }
    }
    else
    {
      uint64_t v30 = [NSString stringWithUTF8String:"currentQueryGenerationIdentifier failed with sqlite error: %d"];
      _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, v18);
      uint64_t v37 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v40) = v18;
        uint64_t v27 = "CoreData: currentQueryGenerationIdentifier failed with sqlite error: %d";
        useconds_t v28 = v37;
        uint32_t v29 = 8;
        goto LABEL_26;
      }
    }
    int v3 = 0;
    goto LABEL_21;
  }
  int v3 = (_PFSQLiteSnapshotWrapper *)[*(id *)(v1 + 328) lastObject];
LABEL_21:
  if (v3) {
    atomic_fetch_add_explicit(&v3->_externalReferences, 1u, memory_order_relaxed);
  }
  return v3;
}

- (uint64_t)_registerNewQueryGenerationSnapshot:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  int v4 = *(NSObject **)(a1 + 8);
  if (v4) {
    dispatch_assert_queue_V2(v4);
  }
  if ([*(id *)(a1 + 328) count])
  {
    uint64_t v5 = [*(id *)(a1 + 328) count];
    uint64_t v6 = v5;
    if (!v5) {
      return 0;
    }
    uint64_t v7 = 0;
    uint64_t v8 = v5 - 1;
    while (1)
    {
      int v9 = objc_msgSend(a2, "compare:", objc_msgSend(*(id *)(a1 + 328), "objectAtIndex:", v7));
      if (v9 < 0) {
        break;
      }
      if (v9)
      {
        if (v8 == v7) {
          [*(id *)(a1 + 328) addObject:a2];
        }
        if (v6 != ++v7) {
          continue;
        }
      }
      return 0;
    }
    [*(id *)(a1 + 328) insertObject:a2 atIndex:v7];
    if (v7) {
      return 0;
    }
    uint64_t v10 = -[NSSQLiteConnection _adoptQueryGenerationWithSnapshot:](a1, (uint64_t)a2);
    uint64_t v17 = v10;
    if (!v10) {
      return v17;
    }
    goto LABEL_14;
  }
  -[NSSQLiteConnection beginReadTransaction](a1);
  [*(id *)(a1 + 328) addObject:a2];
  uint64_t v10 = -[NSSQLiteConnection _adoptQueryGenerationWithSnapshot:](a1, (uint64_t)a2);
  uint64_t v17 = v10;
  if (v10) {
LABEL_14:
  }
    _NSCoreDataLog(1, @"_registerNewQueryGenerationSnapshot failed to adopt query generation with error %d", v11, v12, v13, v14, v15, v16, v10);
  return v17;
}

- (BOOL)hasHistoryTransactionWithNumber:(id *)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1[2], "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey"), "entityNamed:", @"TRANSACTION");
  uint64_t v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (void *)[*(id *)(v4 + 40) objectForKey:@"_pk"];
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"SELECT COUNT(Z_PK) FROM %@ WHERE %@ = %@", objc_msgSend(v5, "tableName"), objc_msgSend(v6, "columnName"), a2];
  uint64_t v8 = [[NSSQLiteStatement alloc] initWithEntity:v5 sqlString:v7];
  -[NSSQLiteConnection prepareSQLStatement:]((uint64_t)a1, v8);
  [a1 execute];
  int v9 = -[NSSQLiteConnection newFetchedArray]((uint64_t)a1);
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 objectAtIndex:0];
    if (v11 == NSKeyValueCoding_NullValue) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = (void *)[v10 objectAtIndex:0];
    }
    BOOL v13 = [v12 integerValue] > 0;
  }
  else
  {
    BOOL v13 = 0;
  }
  -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)a1, 0);

  return v13;
}

- (uint64_t)_insertTransactionStringsForRequestContext:(uint64_t)a1
{
  if (a2 && (uint64_t v4 = *(unsigned char **)(a2 + 32)) != 0 && (v4[43] & 1) != 0)
  {
    uint64_t v5 = -[NSPersistentStoreCoordinator _xpcBundleIdentifier]((os_unfair_lock_s *)[v4 persistentStoreCoordinator]);
    uint64_t v11 = -[NSPersistentStoreCoordinator _xpcProcessName]((os_unfair_lock_s *)[*(id *)(a2 + 32) persistentStoreCoordinator]);
    uint64_t v7 = (uint64_t)v11;
    BOOL v8 = v11 != 0;
    if (v5 == 0 && v8) {
      uint64_t v5 = v11;
    }
  }
  else
  {
    uint64_t v5 = (os_unfair_lock_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
    uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName");
    uint64_t v7 = v6;
    BOOL v8 = v6 != 0;
    if (v5 == 0 && v8) {
      uint64_t v5 = (os_unfair_lock_s *)v6;
    }
    if (!a2)
    {
      uint64_t v9 = [0 name];
      uint64_t v10 = 0;
      goto LABEL_11;
    }
  }
  uint64_t v9 = [*(id *)(a2 + 32) name];
  uint64_t v10 = *(void **)(a2 + 32);
LABEL_11:
  uint64_t v12 = [v10 transactionAuthor];
  BOOL v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
  uint64_t v14 = v13;
  if (v5) {
    [v13 setValue:v5 forKey:@"BUNDLEIDTS"];
  }
  if (v8) {
    [v14 setValue:v7 forKey:@"PROCESSIDTS"];
  }
  if (v9) {
    [v14 setValue:v9 forKey:@"CONTEXTNAMETS"];
  }
  if (v12) {
    [v14 setValue:v12 forKey:@"AUTHORTS"];
  }
  uint64_t v15 = -[NSSQLiteConnection _transactionsStringAndPKsForStrings:](a1, v14);

  return v15;
}

- (id)initForSQLCore:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)NSSQLiteConnection;
  uint64_t v4 = [(NSSQLiteConnection *)&v21 init];
  if (v4)
  {
    if (objc_msgSend((id)objc_msgSend(a3, "URL"), "isFileURL")
      && (uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "URL"), "path")) != 0)
    {
      uint64_t v6 = (__CFString *)[v5 lastPathComponent];
    }
    else
    {
      uint64_t v6 = @"nil";
    }
    uint64_t v7 = (void *)[NSString stringWithFormat:@"SQLQueue %p for %@", v4, v6];
    uint64_t v8 = [a3 _persistentStoreCoordinator];
    if (v8 && (unsigned int v9 = *(unsigned __int16 *)(v8 + 24), (v9 >> 2))) {
      uint64_t v10 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)(v9 >> 2), 0);
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = dispatch_queue_create((const char *)[v7 fileSystemRepresentation], v10);
    v4->_queue = (OS_dispatch_queue *)v11;
    dispatch_set_context(v11, v4);
    v4->_sqlCore = (NSSQLCore *)a3;
    v4->_useSyntaxColoredLogging = +[NSSQLCore coloredLoggingDefault];
    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    BOOL v13 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
    v4->_vmCachedStatements = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D540]);
    v4->_pragmaSettings = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    keyCallBacks.version = *MEMORY[0x1E4F1D530];
    *(_OWORD *)&keyCallBacks.retain = *(_OWORD *)(MEMORY[0x1E4F1D530] + 8);
    uint64_t v14 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E4F1D530] + 24);
    keyCallBacks.equal = 0;
    keyCallBacks.hash = 0;
    keyCallBacks.copyDescription = v14;
    v4->_cachedEntityUpdateStatements = CFDictionaryCreateMutable(v12, 0, &keyCallBacks, v13);
    v4->_cachedEntityConstrainedValuesUpdateStatements = CFDictionaryCreateMutable(v12, 0, &keyCallBacks, v13);
    v4->_statementCachesByEntity = CFDictionaryCreateMutable(v12, 0, &keyCallBacks, v13);
    v4->_mObjectIDsUpdatedByTriggers = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v4->_mObjectIDsInsertedByDATriggers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4->_mObjectIDsUpdatededByDATriggers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v15 = [(NSPersistentStore *)v4->_sqlCore options];
    v4->_sqlCoreOptions = v15;
    v4->_timeOutOption = 0.0;
    id v16 = [(NSDictionary *)v15 objectForKey:@"NSPersistentStoreTimeoutOption"];
    if (v16)
    {
      [v16 doubleValue];
    }
    else
    {
      if (!BYTE1(z9dsptsiQ80etb9782fsrs98bfdle88)) {
        goto LABEL_15;
      }
      uint64_t v17 = 0x406E000000000000;
    }
    *(void *)&v4->_timeOutOption = v17;
LABEL_15:
    for (uint64_t i = 0; i != 5; ++i)
      v4->_extraBuffersForRegisteredFunctions[i] = PF_CALLOC_OBJECT_ARRAY(4);
    v4->_dbPathRegisteredWithBackupd = 0;
    *(_DWORD *)&v4->_sqliteConnectionFlags |= 0x100u;
    v4->_transactionStringName = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_usedIndexes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v4;
}

- (uint64_t)freeQueryGenerationWithIdentifier:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = *(NSObject **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    uint64_t v5 = *(void **)(a1 + 328);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    void v28[2] = __56__NSSQLiteConnection_freeQueryGenerationWithIdentifier___block_invoke;
    v28[3] = &unk_1E544E128;
    v28[4] = a2;
    unint64_t v6 = [v5 indexOfObjectPassingTest:v28];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = (atomic_uint *)(id)[*(id *)(a1 + 328) objectAtIndex:v6];
      uint64_t v8 = v7;
      if (!v7 || (int)atomic_fetch_add_explicit(v7 + 4, 0xFFFFFFFF, memory_order_relaxed) <= 1)
      {
        unsigned int v9 = *(void **)(a1 + 328);
        if (!v6)
        {
          if ((unint64_t)[v9 count] < 2)
          {
            [*(id *)(a1 + 328) removeObject:v8];
            uint64_t v16 = *(void *)(a1 + 16);
            if (v16) {
              -[NSGenerationalRowCache removeRowCacheForGenerationWithIdentifier:](*(void *)(v16 + 136), (uint64_t)v8);
            }
            BOOL v11 = 1;
          }
          else
          {
            for (unint64_t i = 1; i < [*(id *)(a1 + 328) count]; ++i)
            {
              uint64_t v15 = [*(id *)(a1 + 328) objectAtIndex:i];
              if (v15)
              {
                if (*(int *)(v15 + 16) > 0) {
                  break;
                }
              }
            }
            uint64_t v17 = objc_msgSend(*(id *)(a1 + 328), "subarrayWithRange:", 0, i);
            uint64_t v18 = (void *)[*(id *)(a1 + 328) copy];
            objc_msgSend(*(id *)(a1 + 328), "removeObjectsInRange:", 0, i);
            if ([*(id *)(a1 + 328) count]
              && -[NSSQLiteConnection _adoptQueryGenerationWithSnapshot:](a1, [*(id *)(a1 + 328) firstObject]))
            {
              BOOL v11 = 0;
              [*(id *)(a1 + 328) setArray:v18];
            }
            else
            {
              long long v26 = 0u;
              long long v27 = 0u;
              long long v24 = 0u;
              long long v25 = 0u;
              uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v29 count:16];
              if (v19)
              {
                uint64_t v20 = *(void *)v25;
                do
                {
                  for (uint64_t j = 0; j != v19; ++j)
                  {
                    if (*(void *)v25 != v20) {
                      objc_enumerationMutation(v17);
                    }
                    uint64_t v22 = *(void *)(a1 + 16);
                    if (v22) {
                      -[NSGenerationalRowCache removeRowCacheForGenerationWithIdentifier:](*(void *)(v22 + 136), *(void *)(*((void *)&v24 + 1) + 8 * j));
                    }
                  }
                  uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v29 count:16];
                }
                while (v19);
              }
              BOOL v11 = [*(id *)(a1 + 328) count] == 0;
            }
          }
          goto LABEL_13;
        }
        if (v6 < [v9 count] - 1) {
          [*(id *)(a1 + 328) removeObject:v8];
        }
        uint64_t v10 = *(void *)(a1 + 16);
        if (v10) {
          -[NSGenerationalRowCache removeRowCacheForGenerationWithIdentifier:](*(void *)(v10 + 136), (uint64_t)v8);
        }
      }
      BOOL v11 = 0;
LABEL_13:

      if (v11)
      {
        uint64_t v23 = 0;
        CFAllocatorRef v12 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, @"CoreData: WAL checkpoint", &v23);
        -[NSSQLiteConnection rollbackTransaction](a1);
        -[NSSQLiteConnection _performPostSaveTasks:andForceFullVacuum:](a1, 0, 0);
        -[NSSQLiteConnection _ensureWalFileExists](a1);
        +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v23, v12);
      }
    }
  }
  return 0;
}

- (void)rollbackTransaction
{
  if (a1)
  {
    if (*(void *)(a1 + 72))
    {
      if ((*(unsigned char *)(a1 + 312) & 2) != 0)
      {
        double v2 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v3 = *MEMORY[0x1E4F1C3B8];
        uint64_t v4 = NSStringFromSelector(sel_rollbackTransaction);
        uint64_t v5 = (objc_class *)objc_opt_class();
        [v2 raise:v3, @"%@ -- %@ %p: attempted to rollback a transaction while a fetch was in progress", v4, NSStringFromClass(v5), a1 format];
      }
      -[NSSQLiteConnection resetSQLStatement](a1);
      unint64_t v6 = *(NSSQLiteStatement **)(a1 + 144);
      if (!v6)
      {
        unint64_t v6 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:@"ROLLBACK"];
        *(void *)(a1 + 144) = v6;
      }
      -[NSSQLiteConnection prepareSQLStatement:](a1, v6);
      uint64_t v7 = *(sqlite3_stmt **)(a1 + 144);
      if (v7) {
        uint64_t v8 = *((void *)v7 + 8);
      }
      else {
        uint64_t v8 = 0;
      }
      if (*(void *)(a1 + 80) != v8) {
        -[NSSQLiteConnection cacheCurrentDBStatementOn:](a1, v7);
      }
      _execute(a1);
      -[NSSQLiteConnection resetSQLStatement](a1);
      *(unsigned char *)(a1 + 41) = 0;
      -[NSSQLiteConnection _clearTransactionCaches](a1);
    }
    if (*(unsigned char *)(a1 + 40))
    {
      *(unsigned char *)(a1 + 40) = 0;
      unsigned int v9 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 postNotificationName:@"NSSQLConnectionRollbackTransactionNotification" object:a1];
    }
  }
}

- (uint64_t)_hasHistoryTransactionStringTable
{
  if (result)
  {
    uint64_t v1 = result;
    if ((*(_DWORD *)(result + 312) & 0x400) != 0)
    {
      int v2 = *(_DWORD *)(result + 312) & 0x400;
    }
    else
    {
      if (-[NSSQLiteConnection _hasTableWithName:isTemp:](result, @"ATRANSACTIONSTRING", 0))int v2 = 1024; {
      else
      }
        int v2 = 0;
      *(_DWORD *)(v1 + 312) = *(_DWORD *)(v1 + 312) & 0xFFFFFBFF | v2;
    }
    return v2 != 0;
  }
  return result;
}

- (uint64_t)_transactionsStringAndPKsForStrings:(uint64_t)a1
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (![a2 count]) {
    return 0;
  }
  uint64_t v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a2, "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v39 = a2;
  id obj = (id)[a2 allKeys];
  uint64_t v40 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v40)
  {
    uint64_t v38 = *(void *)v43;
    uint64_t v34 = *MEMORY[0x1E4F1C3B8];
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v43 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = *(void *)(*((void *)&v42 + 1) + 8 * v4);
        uint64_t v5 = objc_msgSend(v39, "objectForKey:");
        uint64_t v6 = [*(id *)(a1 + 336) objectForKey:v5];
        if (v6)
        {
          [v37 setValue:v6 forKey:v41];
        }
        else
        {
          id v36 = objc_alloc_init(MEMORY[0x1E4F28B28]);
          uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey"), "entityNamed:", @"TRANSACTIONSTRING");
          sqlite3_int64 v8 = -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](a1, (uint64_t)v7, 1u);
          if (!v8)
          {
            id v30 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v34, 134030, @"unable to generate primary keys for transaction", 0);
            objc_exception_throw(v30);
          }
          -[NSSQLiteConnection prepareInsertStatementForAncillaryEntity:](a1, v7);
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          unsigned int v9 = (void *)[*(id *)(a1 + 48) bindVariables];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v47;
            do
            {
              for (uint64_t i = 0; i != v10; ++i)
              {
                if (*(void *)v47 != v11) {
                  objc_enumerationMutation(v9);
                }
                BOOL v13 = *(void **)(*((void *)&v46 + 1) + 8 * i);
                int v14 = [v13 index];
                if (v14)
                {
                  if (v14 == 3) {
                    [v13 setValue:v5];
                  }
                }
                else
                {
                  [v13 setInt64:v8];
                }
              }
              uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
            }
            while (v10);
          }
          [(id)a1 execute];
          uint64_t v15 = *(sqlite3 **)(a1 + 72);
          if (v15 && sqlite3_changes(v15) >= 1) {
            uint64_t v16 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_last_insert_rowid(*(sqlite3 **)(a1 + 72))), "copy");
          }
          else {
            uint64_t v16 = 0;
          }
          if (!*(void *)(a1 + 80))
          {
            uint64_t v17 = -[NSSQLiteConnection statementCacheForEntity:](a1, v7);
            -[NSSQLiteStatementCache cacheInsertStatement:](v17, 0);
          }
          -[NSSQLiteConnection _clearBindVariablesForInsertedRow](a1);
          -[NSSQLiteConnection resetSQLStatement](a1);
          [v36 drain];
          id v18 = 0;
          if (v16) {
            goto LABEL_40;
          }
          uint64_t v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey"), "entityNamed:", @"TRANSACTIONSTRING");
          uint64_t v20 = (void *)v19;
          objc_super v21 = v19 ? (void *)[*(id *)(v19 + 40) objectForKey:@"NAME"] : 0;
          uint64_t v22 = (void *)[[NSString alloc] initWithFormat:@"SELECT Z_PK FROM %@ WHERE %@ = ?", objc_msgSend(v20, "tableName"), objc_msgSend(v21, "columnName")];
          uint64_t v23 = [[NSSQLiteStatement alloc] initWithEntity:v20 sqlString:v22];
          long long v24 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", v5, 5, [v21 attributeDescription]);
          -[NSSQLiteStatement addBindVariable:]((uint64_t)v23, v24);

          -[NSSQLiteConnection prepareSQLStatement:](a1, v23);
          [(id)a1 execute];
          long long v25 = -[NSSQLiteConnection newFetchedArray](a1);
          long long v26 = v25;
          if (v25)
          {
            if ([v25 count])
            {
              uint64_t v27 = [v26 objectAtIndex:0];
              useconds_t v28 = v27 == NSKeyValueCoding_NullValue ? 0 : (void *)[v26 objectAtIndex:0];
              id v29 = v28;
            }
            else
            {
              id v29 = 0;
            }
          }
          else
          {
            id v29 = 0;
          }
          -[NSSQLiteConnection endFetchAndRecycleStatement:](a1, 0);

          uint64_t v16 = (void *)[v29 copy];
          if (v16)
          {
LABEL_40:
            [*(id *)(a1 + 336) setValue:v16 forKey:v5];
            [v37 setValue:v16 forKey:v41];
          }
        }
        ++v4;
      }
      while (v4 != v40);
      uint64_t v31 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
      uint64_t v40 = v31;
    }
    while (v31);
  }
  uint64_t v32 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v37];

  return v32;
}

- (sqlite3_int64)generatePrimaryKeysForEntity:(unsigned int)a3 batch:
{
  if (!a1) {
    return 0;
  }
  uint64_t v6 = *(NSObject **)(a1 + 8);
  if (v6) {
    dispatch_assert_queue_V2(v6);
  }
  if (!*(unsigned char *)(a1 + 40)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"primary keys must be generated within a transaction" userInfo:0]);
  }
  if (a2) {
    uint64_t v7 = *(unsigned int *)(a2 + 184);
  }
  else {
    uint64_t v7 = 0;
  }
  unsigned int v9 = (sqlite3_stmt **)(a1 + 112);
  sqlite3_int64 v8 = *(sqlite3_stmt **)(a1 + 112);
  p_cache = _PFLock.cache;
  if (!v8)
  {
    uint64_t v11 = (void *)[[NSString alloc] initWithFormat:@"SELECT %@ FROM %@ WHERE %@ = ?", @"Z_MAX", @"Z_PRIMARYKEY", @"Z_ENT"];
    if (+[NSSQLCore debugDefault] >= 1)
    {
      if (*(unsigned char *)(a1 + 42)) {
        id v18 = @"\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m";
      }
      else {
        id v18 = @"%@";
      }
      _NSCoreDataLog(6, (uint64_t)v18, v12, v13, v14, v15, v16, v17, (uint64_t)v11);
    }
    pzTail = 0;
    uint64_t v19 = (const char *)[v11 UTF8String];
    id v20 = v11;
    -[NSSQLiteConnection _ensureDatabaseOpen]((void *)a1);
    uint64_t v21 = sqlite3_prepare_v3(*(sqlite3 **)(a1 + 72), v19, -1, 1u, (sqlite3_stmt **)(a1 + 112), (const char **)&pzTail);
    if (v21)
    {
      uint64_t v71 = v21;
      uint64_t v72 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
      if (+[NSSQLCore debugDefault] >= 1)
      {
        if (*(unsigned char *)(a1 + 42)) {
          uint64_t v79 = @"\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %s\x1B[0m";
        }
        else {
          uint64_t v79 = @"(%d) %s";
        }
        _NSCoreDataLog(1, (uint64_t)v79, v73, v74, v75, v76, v77, v78, v71);
      }
      *unsigned int v9 = 0;
      uint64_t v65 = [NSString stringWithUTF8String:v72];
      uint64_t v66 = *MEMORY[0x1E4F1C3B8];
      int v80 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v81 = NSNumber;
      uint64_t v82 = v71;
      goto LABEL_55;
    }
    sqlite3_int64 v8 = *v9;
  }
  sqlite3_bind_int(v8, 1, v7);
  if (+[NSSQLCore debugDefault] >= 2) {
    _NSCoreDataLog(4, @"getting max pk for entityID = %u", v22, v23, v24, v25, v26, v27, v7);
  }
  uint64_t v28 = sqlite3_step(*v9);
  if (v28 == 100)
  {
    sqlite3_int64 v30 = sqlite3_column_int64(*v9, 0);
  }
  else
  {
    uint64_t v29 = v28;
    if (v28 != 101)
    {
      sqlite3_reset(*v9);
      sqlite3_clear_bindings(*v9);
      uint64_t v70 = *MEMORY[0x1E4F1C3B8];
      uint64_t v62 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v29), @"NSSQLiteErrorDomain");
      uint64_t v64 = @"Fetching maximum primary key failed";
      uint64_t v63 = v70;
      goto LABEL_57;
    }
    sqlite3_int64 v30 = -[NSSQLiteConnection fetchMaxPrimaryKeyForEntity:](a1, (void *)a2);
    uint64_t v31 = NSString;
    uint64_t v32 = [(id)a2 name];
    if (a2)
    {
      uint64_t v33 = *(void *)(a2 + 160);
      if (v33) {
        uint64_t v33 = *(unsigned int *)(v33 + 184);
      }
    }
    else
    {
      uint64_t v33 = 0;
    }
    -[NSSQLiteConnection _executeSQLString:](a1, (void *)[v31 stringWithFormat:@"INSERT INTO %@(%@, %@, %@, %@) VALUES(%u, '%@', %u, %qd)", @"Z_PRIMARYKEY", @"Z_ENT", @"Z_NAME", @"Z_SUPER", @"Z_MAX", v7, v32, v33, v30]);
    p_cache = (void **)(_PFLock + 16);
  }
  uint64_t v34 = sqlite3_reset(*v9);
  sqlite3_clear_bindings(*v9);
  if (v34)
  {
    uint64_t v58 = NSString;
LABEL_54:
    uint64_t v65 = [v58 stringWithUTF8String:sqlite3_errmsg(*(sqlite3 **)(a1 + 72))];
    uint64_t v66 = *MEMORY[0x1E4F1C3B8];
    int v80 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v81 = NSNumber;
    uint64_t v82 = v34;
LABEL_55:
    uint64_t v68 = [v81 numberWithInt:v82];
    uint64_t v69 = v80;
    goto LABEL_56;
  }
  uint64_t v35 = (sqlite3_stmt **)(a1 + 120);
  if (!*(void *)(a1 + 120))
  {
    id v36 = (void *)[[NSString alloc] initWithFormat:@"UPDATE OR FAIL %@ SET %@ = ? WHERE %@ = ? AND %@ = ?", @"Z_PRIMARYKEY", @"Z_MAX", @"Z_ENT", @"Z_MAX"];
    if ((int)[p_cache + 273 debugDefault] >= 1)
    {
      if (*(unsigned char *)(a1 + 42)) {
        long long v43 = @"\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m";
      }
      else {
        long long v43 = @"%@";
      }
      _NSCoreDataLog(6, (uint64_t)v43, v37, v38, v39, v40, v41, v42, (uint64_t)v36);
    }
    pzTail = 0;
    long long v44 = (const char *)[v36 UTF8String];
    id v45 = v36;
    -[NSSQLiteConnection _ensureDatabaseOpen]((void *)a1);
    uint64_t v46 = sqlite3_prepare_v3(*(sqlite3 **)(a1 + 72), v44, -1, 1u, (sqlite3_stmt **)(a1 + 120), (const char **)&pzTail);
    if (v46)
    {
      uint64_t v34 = v46;
      *(void *)(a1 + 120) = 0;
      uint64_t v58 = NSString;
      goto LABEL_54;
    }
  }
  sqlite3_int64 v47 = v30;
  if (v30 == -1) {
    sqlite3_int64 v47 = -[NSSQLiteConnection fetchMaxPrimaryKeyForEntity:](a1, (void *)a2);
  }
  sqlite3_int64 v48 = v47 + a3;
  sqlite3_bind_int64(*v35, 1, v48);
  sqlite3_bind_int(*v35, 2, v7);
  sqlite3_bind_int64(*v35, 3, v30);
  if ((int)[p_cache + 273 debugDefault] >= 2) {
    _NSCoreDataLog(4, @"updating max pk for entityID = %u with old = %qd and new = %qd", v49, v50, v51, v52, v53, v54, v7);
  }
  uint64_t v55 = sqlite3_step(*v35);
  uint64_t v56 = sqlite3_reset(*v35);
  sqlite3_clear_bindings(*v35);
  if (v55 != 101)
  {
    uint64_t v59 = [NSString stringWithUTF8String:sqlite3_errmsg(*(sqlite3 **)(a1 + 72))];
    uint64_t v60 = *MEMORY[0x1E4F1C3B8];
    uint64_t v61 = [NSString stringWithFormat:@"Updating max pk failed: %@", v59];
    uint64_t v62 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v55), @"NSSQLiteErrorDomain");
    uint64_t v63 = v60;
    uint64_t v64 = (__CFString *)v61;
    goto LABEL_57;
  }
  if (v56)
  {
    uint64_t v65 = [NSString stringWithUTF8String:sqlite3_errmsg(*(sqlite3 **)(a1 + 72))];
    uint64_t v66 = *MEMORY[0x1E4F1C3B8];
    uint64_t v67 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v68 = [NSNumber numberWithInt:v56];
    uint64_t v69 = v67;
LABEL_56:
    uint64_t v62 = (void *)[v69 dictionaryWithObject:v68 forKey:@"NSSQLiteErrorDomain"];
    uint64_t v63 = v66;
    uint64_t v64 = (__CFString *)v65;
LABEL_57:
    id v83 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v63, 134030, (uint64_t)v64, v62);
    objc_exception_throw(v83);
  }
  return v48;
}

- (uint64_t)_hasPersistentHistoryTables
{
  if (!a1) {
    return 0;
  }
  int v2 = (void *)MEMORY[0x18C127630]();
  uint64_t v3 = 0;
  if (-[NSSQLiteConnection _hasTableWithName:isTemp:](a1, @"ACHANGE", 0)) {
    uint64_t v3 = -[NSSQLiteConnection _hasTableWithName:isTemp:](a1, @"ATRANSACTION", 0);
  }
  return v3;
}

- (void)fetchMetadata
{
  if (!a1) {
    return 0;
  }
  int v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  uint64_t v4 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([(id)a1 adapter], objc_msgSend(NSString, "stringWithFormat:", @"SELECT %@, %@, %@ FROM %@", @"Z_VERSION", @"Z_UUID", @"Z_PLIST", @"Z_METADATA"));
  -[NSSQLiteConnection prepareSQLStatement:](a1, v4);
  [(id)a1 execute];
  uint64_t v5 = *(void **)(a1 + 64);
  if (!v5)
  {
    uint64_t v6 = [[NSSQLColumn alloc] initWithColumnName:@"Z_VERSION" sqlType:1];
    uint64_t v7 = [[NSSQLColumn alloc] initWithColumnName:@"Z_UUID" sqlType:6];
    sqlite3_int64 v8 = [[NSSQLColumn alloc] initWithColumnName:@"Z_PLIST" sqlType:10];
    *(void *)(a1 + 64) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v6, v7, v8, 0);

    uint64_t v5 = *(void **)(a1 + 64);
  }
  -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v5);
  unsigned int v9 = -[NSSQLiteConnection newFetchedArray](a1);
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 objectAtIndex:2];
    if (v11 != NSKeyValueCoding_NullValue)
    {
      uint64_t v12 = (void *)[v10 objectAtIndex:2];
      uint64_t v13 = (uint64_t)v12;
      if (v12)
      {
        if ([v12 length])
        {
          uint64_t v28 = 0;
          uint64_t v14 = (void *)[MEMORY[0x1E4F28F98] propertyListWithData:v13 options:0 format:0 error:&v28];
          uint64_t v21 = v14;
          if (!v14 || ([v14 isNSDictionary] & 1) == 0)
          {
            _NSCoreDataLog(1, @"failure reading metadata plist with data bytes: %@", v15, v16, v17, v18, v19, v20, v13);
            uint64_t v25 = v28;
            if (!v28) {
              uint64_t v25 = @"<null>";
            }
            uint64_t v26 = [NSString stringWithFormat:@"An error %@ occurred converting the metadata plist data: %@", v25, v13];
            id v27 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 259, v26, 0);
            objc_exception_throw(v27);
          }
          [v3 setDictionary:v21];
        }
      }
    }
    uint64_t v22 = [v10 objectAtIndex:1];
    if (!v22)
    {
      id v24 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 259, @"Metadata table is missing database UUID.", 0);
      objc_exception_throw(v24);
    }
    [v3 setObject:v22 forKey:@"NSStoreUUID"];
  }

  -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0);
  *(_DWORD *)(a1 + 312) &= ~2u;
  *(void *)(a1 + 100) = 0;
  *(void *)(a1 + 92) = 0;
  *(_DWORD *)(a1 + 108) = 0;
  -[NSSQLiteConnection releaseSQLStatement](a1);

  return v3;
}

- (uint64_t)_hasTableWithName:(int)a3 isTemp:
{
  if (a1)
  {
    uint64_t v5 = *(NSObject **)(a1 + 8);
    if (v5) {
      dispatch_assert_queue_V2(v5);
    }
    context = (void *)MEMORY[0x18C127630]();
    char v6 = 0;
    char v17 = 0;
    if ((*(unsigned char *)(a1 + 312) & 0x80) != 0) {
      int v7 = 1;
    }
    else {
      int v7 = 3;
    }
    if (a3) {
      sqlite3_int64 v8 = @"SQLITE_TEMP_MASTER";
    }
    else {
      sqlite3_int64 v8 = @"SQLITE_MASTER";
    }
    uint64_t v18 = v8;
    while ((v6 & 1) == 0 && (v7 & 0x80000000) == 0)
    {
      -[NSSQLiteConnection connect](a1);
      unsigned int v9 = (void *)[[NSString alloc] initWithFormat:@"SELECT TBL_NAME FROM %@ WHERE TBL_NAME = '%@'", v18, a2];
      uint64_t v10 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([(id)a1 adapter], (uint64_t)v9);

      uint64_t v11 = [[NSSQLColumn alloc] initWithColumnName:@"TBL_NAME" sqlType:6];
      uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v11, 0);

      -[NSSQLiteConnection prepareSQLStatement:](a1, v10);
      [(id)a1 execute];
      -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v12);

      uint64_t v13 = -[NSSQLiteConnection newFetchedArray](a1);
      if (v13)
      {
        char v17 = 1;

        uint64_t v14 = v10;
        char v6 = 1;
      }
      else
      {
        char v6 = 1;
        uint64_t v14 = v10;
      }
      -[NSSQLiteConnection releaseSQLStatement](a1);
      -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0);
      *(_DWORD *)(a1 + 312) &= ~2u;
      *(void *)(a1 + 92) = 0;
      *(void *)(a1 + 100) = 0;
      *(_DWORD *)(a1 + 108) = 0;

      --v7;
    }
  }
  else
  {
    char v17 = 0;
  }
  return v17 & 1;
}

- (void)newFetchedArray
{
  if (!a1) {
    return 0;
  }
  int v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  uint64_t v3 = (void *)MEMORY[0x18C127630]();
  uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  if ((*(unsigned char *)(a1 + 312) & 2) != 0)
  {
    char v6 = (_PFExternalReferenceData *)v4;
    uint64_t v64 = v3;
    uint64_t v66 = *(void **)(a1 + 56);
    uint64_t v7 = [v66 count];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
    if (!v7)
    {
LABEL_61:
      ++*(_DWORD *)(a1 + 88);
      _execute(a1);
      uint64_t v3 = v64;
      goto LABEL_62;
    }
    uint64_t v8 = 0;
    uint64_t v65 = v6;
    while (1)
    {
      unsigned int v9 = v6;
      if (sqlite3_column_type(*(sqlite3_stmt **)(a1 + 80), v8) != 5) {
        break;
      }
LABEL_38:
      [v5 addObject:v9];

      if (v7 == ++v8) {
        goto LABEL_61;
      }
    }
    uint64_t v10 = (unsigned __int8 *)[v66 objectAtIndex:v8];
    uint64_t v11 = *(sqlite3_stmt **)(a1 + 80);
    uint64_t v12 = *(NSObject **)(a1 + 8);
    if (v12) {
      dispatch_assert_queue_V2(v12);
    }
    int v13 = [v10 sqlType];
    sqlite3_int64 v68 = 0;
    uint64_t v14 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v15 = [*(id *)(a1 + 368) objectForKey:@"NSPersistentStoreUbiquitousContentNameKey"];
    unsigned int v9 = 0;
    if (sqlite3_column_type(v11, v8) != 5)
    {
      switch(v13)
      {
        case 0:
          if (v10)
          {
            int v42 = v10[24];
            if (v42 == 7 || v42 == 4) {
              goto LABEL_33;
            }
          }
          goto LABEL_65;
        case 1:
          LODWORD(valuePtr) = sqlite3_column_int(v11, v8);
          p_double valuePtr = (sqlite3_int64 *)&valuePtr;
          CFNumberType v41 = kCFNumberIntType;
          goto LABEL_35;
        case 2:
        case 3:
LABEL_33:
          sqlite3_int64 v68 = sqlite3_column_int64(v11, v8);
          p_double valuePtr = &v68;
          CFNumberType v41 = kCFNumberLongLongType;
          goto LABEL_35;
        case 4:
          uint64_t v38 = objc_msgSend([NSString alloc], "initWithUTF8String:", sqlite3_column_text(v11, v8));
          uint64_t v39 = (_PFExternalReferenceData *)[objc_alloc(MEMORY[0x1E4F28C28]) initWithString:v38];
          goto LABEL_28;
        case 5:
        case 6:
        case 9:
          uint64_t v16 = sqlite3_column_text(v11, v8);
          char v17 = (_NSDataFileBackedFuture *)CFStringCreateWithCString(0, (const char *)v16, 0x8000100u);
          goto LABEL_36;
        case 7:
          double valuePtr = sqlite3_column_double(v11, v8);
          p_double valuePtr = (sqlite3_int64 *)&valuePtr;
          CFNumberType v41 = kCFNumberDoubleType;
LABEL_35:
          char v17 = (_NSDataFileBackedFuture *)CFNumberCreate(0, v41, p_valuePtr);
          goto LABEL_36;
        case 8:
          double v43 = sqlite3_column_double(v11, v8);
          char v17 = (_NSDataFileBackedFuture *)CFDateCreate(0, v43);
          goto LABEL_36;
        case 10:
        case 17:
          id v18 = objc_alloc(MEMORY[0x1E4F1C9B8]);
          uint64_t v19 = sqlite3_column_blob(v11, v8);
          char v17 = (_NSDataFileBackedFuture *)objc_msgSend(v18, "initWithBytes:length:", v19, sqlite3_column_bytes(v11, v8));
          goto LABEL_36;
        case 11:
          if (sqlite3_column_bytes(v11, v8) != 16) {
            goto LABEL_41;
          }
          char v17 = (_NSDataFileBackedFuture *)objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", sqlite3_column_blob(v11, v8));
          goto LABEL_36;
        case 12:
          uint64_t v20 = sqlite3_column_text(v11, v8);
          CFStringRef v21 = CFStringCreateWithCString(0, (const char *)v20, 0x8000100u);
          unsigned int v9 = (_PFExternalReferenceData *)(id)[MEMORY[0x1E4F1CB10] URLWithString:v21];
          uint64_t v22 = v21;
          goto LABEL_19;
        case 13:
          uint64_t v23 = sqlite3_column_text(v11, v8);
          CFStringRef v24 = CFStringCreateWithCString(0, (const char *)v23, 0x8000100u);
          CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, v24, @"/");
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 0);
          IntCFDictionaryRef Value = CFStringGetIntValue(ValueAtIndex);
          CFStringRef v28 = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 1);
          unsigned int v9 = (_PFExternalReferenceData *)(id)objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", IntValue, CFStringGetIntValue(v28));
          CFRelease(v24);
          uint64_t v22 = ArrayBySeparatingStrings;
LABEL_19:
          CFRelease(v22);
          break;
        case 15:
          id v36 = objc_alloc(MEMORY[0x1E4F1C9B8]);
          uint64_t v37 = sqlite3_column_blob(v11, v8);
          uint64_t v38 = objc_msgSend(v36, "initWithBytes:length:", v37, sqlite3_column_bytes(v11, v8));
          uint64_t v39 = (_PFExternalReferenceData *)+[_PFRoutines retainedDecodeValue:forTransformableAttribute:]((uint64_t)_PFRoutines, (uint64_t)v38, (void *)[v10 propertyDescription]);
LABEL_28:
          unsigned int v9 = v39;

          break;
        case 16:
          uint64_t v29 = (unsigned __int8 *)sqlite3_column_blob(v11, v8);
          int v30 = sqlite3_column_bytes(v11, v8);
          if (v30 >= 1)
          {
            unsigned int v31 = v30;
            int v32 = *v29;
            if (v32 == 3)
            {
              uint64_t v44 = [*(id *)(a1 + 16) fileBackedFuturesDirectory];
              uint64_t v45 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v29 length:v31];
              uint64_t v46 = [_NSDataFileBackedFuture alloc];
              char v17 = -[_NSDataFileBackedFuture initWithStoreMetadata:directory:](v46, "initWithStoreMetadata:directory:", v45, [MEMORY[0x1E4F1CB10] fileURLWithPath:v44 isDirectory:1]);
LABEL_36:
              unsigned int v9 = (_PFExternalReferenceData *)v17;
              break;
            }
            if (v32 == 1)
            {
              uint64_t v33 = [_PFExternalReferenceData alloc];
              uint64_t v34 = *(void *)(a1 + 16);
              if (v34) {
                uint64_t v35 = (*(_DWORD *)(v34 + 200) >> 2) & 7;
              }
              else {
                uint64_t v35 = 0;
              }
              char v17 = [(_PFExternalReferenceData *)v33 initWithStoreBytes:v29 length:v31 externalLocation:0 safeguardLocation:0 protectionLevel:v35];
              goto LABEL_36;
            }
            uint64_t v63 = objc_msgSend(v14, "stringWithFileSystemRepresentation:length:", v29 + 1, strnlen((const char *)v29 + 1, (v30 - 1)));
            sqlite3_int64 v47 = (void *)[*(id *)(a1 + 16) externalDataReferencesDirectory];
            sqlite3_int64 v48 = *(unint64_t **)(a1 + 16);
            if (v48)
            {
              if (!atomic_load(v48 + 21)) {
                [*(id *)(a1 + 16) externalDataReferencesDirectory];
              }
              sqlite3_int64 v48 = (unint64_t *)atomic_load(v48 + 22);
            }
            uint64_t v50 = [v47 stringByAppendingPathComponent:v63];
            uint64_t v51 = [v48 stringByAppendingPathComponent:v63];
            uint64_t v61 = v51;
            if (v15 && ![v14 fileExistsAtPath:v50])
            {
              unsigned int v9 = 0;
            }
            else
            {
              uint64_t v52 = [_PFExternalReferenceData alloc];
              uint64_t v53 = *(void *)(a1 + 16);
              if (v53) {
                uint64_t v54 = (*(_DWORD *)(v53 + 200) >> 2) & 7;
              }
              else {
                uint64_t v54 = 0;
              }
              unsigned int v9 = -[_PFExternalReferenceData initWithStoreBytes:length:externalLocation:safeguardLocation:protectionLevel:](v52, "initWithStoreBytes:length:externalLocation:safeguardLocation:protectionLevel:", v29, v31, v50, v51, v54, v51);
              if (!v15) {
                break;
              }
            }
            if ((objc_msgSend(v14, "fileExistsAtPath:", v50, v61) & 1) == 0)
            {

              id v55 = +[PFUbiquitySwitchboard ubiquitousExternalReferenceLocationForUUID:inStore:]((uint64_t)PFUbiquitySwitchboard, v63, *(void **)(a1 + 16));
              uint64_t v56 = [_PFExternalReferenceData alloc];
              uint64_t v57 = *(void *)(a1 + 16);
              if (v57) {
                uint64_t v58 = (*(_DWORD *)(v57 + 200) >> 2) & 7;
              }
              else {
                uint64_t v58 = 0;
              }
              char v17 = [(_PFExternalReferenceData *)v56 initWithStoreBytes:v29 length:v31 externalLocation:v50 safeguardLocation:v62 protectionLevel:v58 ubiquitousLocation:v55];
              goto LABEL_36;
            }
            break;
          }
LABEL_41:
          unsigned int v9 = 0;
          break;
        default:
LABEL_65:
          id v60 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 256, @"fetching not implemented for this value type", 0);
          objc_exception_throw(v60);
      }
    }
    char v6 = v65;
    goto LABEL_38;
  }
  uint64_t v5 = 0;
LABEL_62:
  return v5;
}

- (uint64_t)selectCountWithStatement:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = (void *)result;
    if (a2 && a2[40])
    {
      return 0;
    }
    else
    {
      -[NSSQLiteConnection bindTempTablesForStatementIfNecessary:]((void *)result, a2);
      -[NSSQLiteConnection prepareSQLStatement:]((uint64_t)v3, a2);
      [v3 execute];
      return 1;
    }
  }
  return result;
}

- (NSSQLitePrefetchRequestCache)prefetchRequestCache
{
  if (result)
  {
    uint64_t v1 = result;
    result = (NSSQLitePrefetchRequestCache *)result[6]._length;
    if (!result)
    {
      result = [[NSSQLitePrefetchRequestCache alloc] initWithSQLCore:v1->_length];
      v1[6]._length = (unint64_t)result;
    }
  }
  return result;
}

- (void)processSaveRequest:(uint64_t)a1
{
  uint64_t v203 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if (!a2)
  {
    id obj = (id)-[NSSQLSavePlan newInsertedRows](0);
    goto LABEL_244;
  }
  int v2 = *(id **)(a2 + 96);
  id obj = (id)-[NSSQLSavePlan newInsertedRows]((uint64_t)v2);
  if (!v2)
  {
LABEL_244:
    id v127 = 0;
    id v128 = 0;
    id v147 = 0;
    goto LABEL_5;
  }
  id v147 = (id)[v2[6] mutableCopy];
  id v127 = (id)[v2[7] mutableCopy];
  id v128 = v2[5];
LABEL_5:
  uint64_t v123 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  if (![obj count]) {
    goto LABEL_28;
  }
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(obj, "count"));
  long long v162 = 0u;
  long long v163 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  uint64_t v4 = [obj countByEnumeratingWithState:&v160 objects:v191 count:16];
  if (!v4) {
    goto LABEL_25;
  }
  uint64_t v5 = *(void *)v161;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v161 != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void *)(*((void *)&v160 + 1) + 8 * i);
      uint64_t v8 = *(void *)(a1 + 16);
      if (v8) {
        unsigned int v9 = (void *)[*(id *)(v8 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"];
      }
      else {
        unsigned int v9 = 0;
      }
      if ([v9 count])
      {
        uint64_t v10 = *(void *)(a1 + 16);
        if (v10)
        {
          uint64_t v11 = (void *)[*(id *)(v10 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"];
          if (v7) {
            goto LABEL_16;
          }
LABEL_20:
          uint64_t v12 = 0;
        }
        else
        {
          uint64_t v11 = 0;
          if (!v7) {
            goto LABEL_20;
          }
LABEL_16:
          if (*(unsigned char *)(v7 + 16)) {
            goto LABEL_20;
          }
          uint64_t v12 = (void *)[*(id *)(*(void *)(v7 + 40) + 16) _storeInfo1];
        }
        if (objc_msgSend(v11, "containsObject:", objc_msgSend(v12, "name"))) {
          continue;
        }
      }
      [v3 addObject:v7];
    }
    uint64_t v4 = [obj countByEnumeratingWithState:&v160 objects:v191 count:16];
  }
  while (v4);
LABEL_25:
  if ([v3 count]) {
    [v123 setValue:v3 forKey:@"inserted"];
  }

LABEL_28:
  if ([v147 count])
  {
    uint64_t v125 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v147, "count"));
    id v143 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v140 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (a2) {
      uint64_t v13 = *(void *)(a2 + 96);
    }
    else {
      uint64_t v13 = 0;
    }
    id v129 = (id)-[NSSQLSavePlan newCorrelationTableUpdates](v13);
    long long v186 = 0u;
    long long v187 = 0u;
    long long v184 = 0u;
    long long v185 = 0u;
    uint64_t v14 = [v129 countByEnumeratingWithState:&v184 objects:v202 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v185;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v185 != v15) {
            objc_enumerationMutation(v129);
          }
          char v17 = *(void **)(*((void *)&v184 + 1) + 8 * j);
          id v18 = (void *)MEMORY[0x18C127630]();
          if (v17)
          {
            if (v17[2])
            {
              v183[0] = MEMORY[0x1E4F143A8];
              v183[1] = 3221225472;
              v183[2] = __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke;
              v183[3] = &unk_1E544E088;
              v183[4] = a1;
              v183[5] = v143;
              v183[6] = v17;
              -[NSSQLCorrelationTableUpdateTracker enumerateInsertsOIDsUsingBlock:]((uint64_t)v17, (uint64_t)v183);
            }
            if (v17[5])
            {
              v182[0] = MEMORY[0x1E4F143A8];
              v182[1] = 3221225472;
              v182[2] = __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke_2;
              v182[3] = &unk_1E544E0B0;
              v182[4] = a1;
              v182[5] = v143;
              v182[6] = v17;
              v182[7] = v140;
              -[NSSQLCorrelationTableUpdateTracker enumerateReordersOIDsUsingBlock:]((uint64_t)v17, (uint64_t)v182);
            }
            if (v17[4])
            {
              v181[0] = MEMORY[0x1E4F143A8];
              v181[1] = 3221225472;
              v181[2] = __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke_3;
              v181[3] = &unk_1E544E0B0;
              v181[4] = a1;
              v181[5] = v143;
              v181[6] = v17;
              v181[7] = v140;
              -[NSSQLCorrelationTableUpdateTracker enumerateMasterReordersOIDsUsingBlock:]((uint64_t)v17, (uint64_t)v181);
            }
            if (v17[3])
            {
              v180[0] = MEMORY[0x1E4F143A8];
              v180[1] = 3221225472;
              v180[2] = __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke_4;
              v180[3] = &unk_1E544E088;
              v180[4] = a1;
              v180[5] = v143;
              v180[6] = v17;
              -[NSSQLCorrelationTableUpdateTracker enumerateDeletesOIDsUsingBlock:]((uint64_t)v17, (uint64_t)v180);
            }
          }
        }
        uint64_t v14 = [v129 countByEnumeratingWithState:&v184 objects:v202 count:16];
      }
      while (v14);
    }
    long long v178 = 0u;
    long long v179 = 0u;
    long long v176 = 0u;
    long long v177 = 0u;
    if (a2 && (uint64_t v19 = *(void *)(a2 + 96)) != 0) {
      uint64_t v20 = *(void **)(v19 + 128);
    }
    else {
      uint64_t v20 = 0;
    }
    uint64_t v21 = [v20 countByEnumeratingWithState:&v176 objects:v201 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v177;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v177 != v22) {
            objc_enumerationMutation(v20);
          }
          uint64_t v24 = *(void *)(*((void *)&v176 + 1) + 8 * v23);
          uint64_t v25 = (void *)MEMORY[0x18C127630]();
          uint64_t v26 = (void *)[v143 objectForKey:v24];
          if (a2 && (uint64_t v27 = *(void *)(a2 + 96)) != 0) {
            CFStringRef v28 = *(void **)(v27 + 128);
          }
          else {
            CFStringRef v28 = 0;
          }
          uint64_t v29 = [v28 objectForKey:v24];
          if (v26) {
            [v26 unionSet:v29];
          }
          else {
            [v143 setValue:v29 forKey:v24];
          }
          ++v23;
        }
        while (v21 != v23);
        uint64_t v30 = [v20 countByEnumeratingWithState:&v176 objects:v201 count:16];
        uint64_t v21 = v30;
      }
      while (v30);
    }
    long long v174 = 0u;
    long long v175 = 0u;
    long long v172 = 0u;
    long long v173 = 0u;
    uint64_t v31 = [v143 countByEnumeratingWithState:&v172 objects:&v197 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v173;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v173 != v32) {
            objc_enumerationMutation(v143);
          }
          uint64_t v34 = *(void **)(*((void *)&v172 + 1) + 8 * k);
          uint64_t v35 = (void *)MEMORY[0x18C127630]();
          id v36 = (void *)_sqlEntityForEntityID([*(id *)(a1 + 16) model], objc_msgSend((id)objc_msgSend((id)objc_msgSend(v34, "componentsSeparatedByString:", @"-"), "firstObject"), "longLongValue"));
          uint64_t v37 = +[_NSPersistentHistoryChange _propertyDataForEntity:withSetOfPropertyNames:]((uint64_t)_NSPersistentHistoryChange, v36, (void *)[v143 objectForKey:v34]);
          -[NSSQLSaveChangesRequestContext addDataMask:forEntityKey:](a2, v37, (uint64_t)v34);
        }
        uint64_t v31 = [v143 countByEnumeratingWithState:&v172 objects:&v197 count:16];
      }
      while (v31);
    }
    if ([v140 count])
    {
      uint64_t v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v140, "count"));
      long long v170 = 0u;
      long long v171 = 0u;
      long long v168 = 0u;
      long long v169 = 0u;
      uint64_t v39 = [v140 countByEnumeratingWithState:&v168 objects:&v193 count:16];
      if (!v39) {
        goto LABEL_103;
      }
      uint64_t v134 = v39;
      uint64_t v124 = v38;
      uint64_t v131 = *(void *)v169;
      while (1)
      {
        for (uint64_t m = 0; m != (void *)v134; uint64_t m = (char *)m + 1)
        {
          if (*(void *)v169 != v131) {
            objc_enumerationMutation(v140);
          }
          uint64_t v40 = *(void **)(*((void *)&v168 + 1) + 8 * (void)m);
          context = (void *)MEMORY[0x18C127630]();
          CFNumberType v41 = (void *)[v40 componentsSeparatedByString:@"-"];
          int v42 = _sqlEntityForEntityID([*(id *)(a1 + 16) model], objc_msgSend((id)objc_msgSend(v41, "firstObject"), "longLongValue"));
          double v43 = (void *)[v140 objectForKey:v40];
          if (a2 && [*(id *)(a2 + 144) objectForKey:v40])
          {
            double v43 = (void *)[MEMORY[0x1E4F1CA80] setWithSet:v43];
            objc_msgSend(v43, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v143, "objectForKey:", v40), "allObjects"));
          }
          uint64_t v44 = +[_NSPersistentHistoryChange _propertyDataForEntity:withSetOfPropertyNames:]((uint64_t)_NSPersistentHistoryChange, v42, v43);
          -[NSSQLSaveChangesRequestContext addDataMask:forEntityKey:](a2, v44, (uint64_t)v40);

          long long v166 = 0u;
          long long v167 = 0u;
          long long v164 = 0u;
          long long v165 = 0u;
          uint64_t v45 = [v147 countByEnumeratingWithState:&v164 objects:v192 count:16];
          if (!v45) {
            goto LABEL_97;
          }
          uint64_t v46 = *(void *)v165;
          do
          {
            uint64_t v47 = 0;
            do
            {
              if (*(void *)v165 != v46) {
                objc_enumerationMutation(v147);
              }
              sqlite3_int64 v48 = *(void **)(*((void *)&v164 + 1) + 8 * v47);
              if (v48 && (uint64_t v49 = [*(id *)(v48[5] + 16) _storeInfo1]) != 0)
              {
                int v50 = *(_DWORD *)(v49 + 184);
                if (!v42) {
                  goto LABEL_95;
                }
              }
              else
              {
                int v50 = 0;
                if (!v42)
                {
LABEL_95:
                  int v51 = 0;
                  goto LABEL_90;
                }
              }
              int v51 = v42[46];
LABEL_90:
              if (v50 == v51)
              {
                uint64_t v52 = objc_msgSend((id)objc_msgSend(v48, "objectID"), "_referenceData64");
                if (v52 == objc_msgSend((id)objc_msgSend(v41, "lastObject"), "longLongValue")) {
                  goto LABEL_98;
                }
              }
              ++v47;
            }
            while (v45 != v47);
            uint64_t v53 = [v147 countByEnumeratingWithState:&v164 objects:v192 count:16];
            uint64_t v45 = v53;
          }
          while (v53);
LABEL_97:
          [v124 setValue:v43 forKey:v40];
LABEL_98:
        }
        uint64_t v134 = [v140 countByEnumeratingWithState:&v168 objects:&v193 count:16];
        if (!v134)
        {
          uint64_t v38 = v124;
          goto LABEL_103;
        }
      }
    }
    uint64_t v38 = 0;
LABEL_103:

    if (![v38 count])
    {

      uint64_t v38 = 0;
    }
    id v144 = v38;
    long long v156 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    uint64_t v54 = [v147 countByEnumeratingWithState:&v156 objects:v190 count:16];
    if (v54)
    {
      uint64_t v55 = *(void *)v157;
      do
      {
        uint64_t v56 = 0;
        do
        {
          if (*(void *)v157 != v55) {
            objc_enumerationMutation(v147);
          }
          uint64_t v57 = *(void *)(*((void *)&v156 + 1) + 8 * v56);
          uint64_t v58 = (void *)MEMORY[0x18C127630]();
          uint64_t v59 = *(void *)(a1 + 16);
          if (v59) {
            id v60 = (void *)[*(id *)(v59 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"];
          }
          else {
            id v60 = 0;
          }
          if ([v60 count])
          {
            uint64_t v61 = *(void *)(a1 + 16);
            if (v61)
            {
              uint64_t v62 = (void *)[*(id *)(v61 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"];
              if (v57) {
                goto LABEL_115;
              }
LABEL_119:
              uint64_t v63 = 0;
            }
            else
            {
              uint64_t v62 = 0;
              if (!v57) {
                goto LABEL_119;
              }
LABEL_115:
              if (*(unsigned char *)(v57 + 16)) {
                goto LABEL_119;
              }
              uint64_t v63 = (void *)[*(id *)(*(void *)(v57 + 40) + 16) _storeInfo1];
            }
            if (objc_msgSend(v62, "containsObject:", objc_msgSend(v63, "name"))) {
              goto LABEL_128;
            }
          }
          uint64_t v64 = NSString;
          if (v57)
          {
            uint64_t v65 = [*(id *)(*(void *)(v57 + 40) + 16) _storeInfo1];
            if (v65) {
              uint64_t v66 = *(unsigned int *)(v65 + 184);
            }
            else {
              uint64_t v66 = 0;
            }
            uint64_t v67 = [*(id *)(*(void *)(v57 + 40) + 16) _referenceData64];
          }
          else
          {
            uint64_t v66 = 0;
            uint64_t v67 = 0;
          }
          uint64_t v68 = objc_msgSend(v64, "stringWithFormat:", @"%u-%lld", v66, v67);
          if (a2 && [*(id *)(a2 + 144) objectForKey:v68]) {
            [v125 addObject:v57];
          }
LABEL_128:
          ++v56;
        }
        while (v54 != v56);
        uint64_t v69 = [v147 countByEnumeratingWithState:&v156 objects:v190 count:16];
        uint64_t v54 = v69;
      }
      while (v69);
    }
    if ([v125 count]) {
      [v123 setValue:v125 forKey:@"updated"];
    }
  }
  else
  {
    id v144 = 0;
  }
  if (![v127 count]) {
    goto LABEL_170;
  }
  id v141 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v127, "count"));
  long long v154 = 0u;
  long long v155 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  uint64_t v70 = [v127 countByEnumeratingWithState:&v152 objects:v189 count:16];
  if (!v70) {
    goto LABEL_165;
  }
  uint64_t v71 = *(void *)v153;
  while (2)
  {
    uint64_t v72 = 0;
    while (2)
    {
      if (*(void *)v153 != v71) {
        objc_enumerationMutation(v127);
      }
      uint64_t v73 = *(void *)(*((void *)&v152 + 1) + 8 * v72);
      uint64_t v74 = (void *)MEMORY[0x18C127630]();
      uint64_t v75 = *(void *)(a1 + 16);
      if (v75) {
        uint64_t v76 = (void *)[*(id *)(v75 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"];
      }
      else {
        uint64_t v76 = 0;
      }
      if (![v76 count]) {
        goto LABEL_153;
      }
      uint64_t v77 = *(void *)(a1 + 16);
      if (v77)
      {
        uint64_t v78 = (void *)[*(id *)(v77 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"];
        if (v73) {
          goto LABEL_147;
        }
LABEL_151:
        uint64_t v79 = 0;
      }
      else
      {
        uint64_t v78 = 0;
        if (!v73) {
          goto LABEL_151;
        }
LABEL_147:
        if (*(unsigned char *)(v73 + 16)) {
          goto LABEL_151;
        }
        uint64_t v79 = (void *)[*(id *)(*(void *)(v73 + 40) + 16) _storeInfo1];
      }
      if ((objc_msgSend(v78, "containsObject:", objc_msgSend(v79, "name")) & 1) == 0)
      {
LABEL_153:
        int v80 = NSString;
        if (v73)
        {
          uint64_t v81 = [*(id *)(*(void *)(v73 + 40) + 16) _storeInfo1];
          if (v81) {
            uint64_t v82 = *(unsigned int *)(v81 + 184);
          }
          else {
            uint64_t v82 = 0;
          }
          uint64_t v83 = [*(id *)(*(void *)(v73 + 40) + 16) _referenceData64];
        }
        else
        {
          uint64_t v82 = 0;
          uint64_t v83 = 0;
        }
        uint64_t v84 = objc_msgSend(v80, "stringWithFormat:", @"%u-%lld", v82, v83);
        if (a2)
        {
          uint64_t v85 = v84;
          if ([*(id *)(a2 + 144) objectForKey:v84])
          {
            [v141 addObject:v73];
            [v144 removeObjectForKey:v85];
          }
        }
      }
      if (v70 != ++v72) {
        continue;
      }
      break;
    }
    uint64_t v86 = [v127 countByEnumeratingWithState:&v152 objects:v189 count:16];
    uint64_t v70 = v86;
    if (v86) {
      continue;
    }
    break;
  }
LABEL_165:
  if ([v141 count])
  {
    uint64_t v87 = (void *)[v123 objectForKey:@"updated"];
    if (v87) {
      objc_msgSend(v87, "addObjectsFromArray:", objc_msgSend(v141, "allObjects"));
    }
    else {
      [v123 setValue:v141 forKey:@"updated"];
    }
  }

LABEL_170:
  if (![v128 count]) {
    goto LABEL_193;
  }
  uint64_t v88 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v128, "count"));
  long long v150 = 0u;
  long long v151 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  uint64_t v89 = [v128 countByEnumeratingWithState:&v148 objects:v188 count:16];
  if (!v89) {
    goto LABEL_190;
  }
  uint64_t v90 = *(void *)v149;
  while (2)
  {
    uint64_t v91 = 0;
    while (2)
    {
      if (*(void *)v149 != v90) {
        objc_enumerationMutation(v128);
      }
      uint64_t v92 = *(void *)(*((void *)&v148 + 1) + 8 * v91);
      uint64_t v93 = *(void *)(a1 + 16);
      if (v93) {
        uint64_t v94 = (void *)[*(id *)(v93 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"];
      }
      else {
        uint64_t v94 = 0;
      }
      if (![v94 count]) {
        goto LABEL_187;
      }
      uint64_t v95 = *(void *)(a1 + 16);
      if (v95)
      {
        CFBitVectorRef v96 = (void *)[*(id *)(v95 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"];
        if (v92) {
          goto LABEL_181;
        }
LABEL_185:
        uint64_t v97 = 0;
      }
      else
      {
        CFBitVectorRef v96 = 0;
        if (!v92) {
          goto LABEL_185;
        }
LABEL_181:
        if (*(unsigned char *)(v92 + 16)) {
          goto LABEL_185;
        }
        uint64_t v97 = (void *)[*(id *)(*(void *)(v92 + 40) + 16) _storeInfo1];
      }
      if ((objc_msgSend(v96, "containsObject:", objc_msgSend(v97, "name")) & 1) == 0) {
LABEL_187:
      }
        [v88 addObject:v92];
      if (v89 != ++v91) {
        continue;
      }
      break;
    }
    uint64_t v89 = [v128 countByEnumeratingWithState:&v148 objects:v188 count:16];
    if (v89) {
      continue;
    }
    break;
  }
LABEL_190:
  if ([v88 count]) {
    [v123 setValue:v88 forKey:@"deleted"];
  }

LABEL_193:
  if ([v123 count])
  {
    id v130 = (id)-[NSSQLiteConnection _insertTransactionStringsForRequestContext:](a1, a2);
    sqlite3_int64 v98 = -[NSSQLiteConnection _insertTransactionForRequestContext:andStrings:](a1, a2, v130);
    if ([v123 objectForKey:@"inserted"]) {
      -[NSSQLiteConnection insertChanges:type:transactionID:context:](a1, (void *)[v123 objectForKey:@"inserted"], 0, v98, a2);
    }
    if ([v123 objectForKey:@"updated"]) {
      -[NSSQLiteConnection insertChanges:type:transactionID:context:](a1, (void *)[v123 objectForKey:@"updated"], 1, v98, a2);
    }
    if ([v123 objectForKey:@"deleted"]) {
      -[NSSQLiteConnection insertChanges:type:transactionID:context:](a1, (void *)[v123 objectForKey:@"deleted"], 2, v98, a2);
    }
    if ([v144 count])
    {
      id v99 = *(NSObject **)(a1 + 8);
      if (v99) {
        dispatch_assert_queue_V2(v99);
      }
      if ([v144 count])
      {
        id v126 = objc_alloc_init(MEMORY[0x1E4F28B28]);
        contexta = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey"), "entityNamed:", @"CHANGE");
        sqlite3_int64 v100 = -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](a1, (uint64_t)contexta, [v144 count]);
        if (!v100)
        {
          id v120 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134030, @"unable to generate primary keys", 0);
          objc_exception_throw(v120);
        }
        uint64_t v101 = [v144 count];
        long long v200 = 0u;
        long long v199 = 0u;
        long long v198 = 0u;
        long long v197 = 0u;
        uint64_t v102 = [v144 countByEnumeratingWithState:&v197 objects:v202 count:16];
        if (v102)
        {
          uint64_t v135 = v102;
          sqlite3_int64 v103 = v100 - v101;
          uint64_t v132 = *(void *)v198;
          do
          {
            for (id n = 0; n != (id)v135; id n = (char *)n + 1)
            {
              if (*(void *)v198 != v132) {
                objc_enumerationMutation(v144);
              }
              uint64_t v104 = *(void **)(*((void *)&v197 + 1) + 8 * (void)n);
              unsigned int v139 = (void *)MEMORY[0x18C127630]();
              long long v105 = (void *)[v104 componentsSeparatedByString:@"-"];
              -[NSSQLiteConnection prepareInsertStatementForAncillaryEntity:](a1, contexta);
              long long v196 = 0u;
              long long v195 = 0u;
              long long v194 = 0u;
              long long v193 = 0u;
              uint64_t v106 = (void *)[*(id *)(a1 + 48) bindVariables];
              uint64_t v107 = [v106 countByEnumeratingWithState:&v193 objects:v201 count:16];
              ++v103;
              if (v107)
              {
                uint64_t v108 = *(void *)v194;
                do
                {
                  uint64_t v109 = 0;
                  do
                  {
                    if (*(void *)v194 != v108) {
                      objc_enumerationMutation(v106);
                    }
                    int v110 = *(void **)(*((void *)&v193 + 1) + 8 * v109);
                    uint64_t v111 = (void *)MEMORY[0x18C127630]();
                    if (![v110 index])
                    {
                      int v112 = [v110 sqlType];
                      sqlite3_int64 v113 = v103;
                      if (v112 == 2)
                      {
LABEL_221:
                        [v110 setInt64:v113];
                        goto LABEL_229;
                      }
                    }
                    if ([v110 index] != 1
                      && [v110 index] != 2)
                    {
                      if ([v110 index] == 3)
                      {
                        int v114 = [v110 sqlType];
                        sqlite3_int64 v113 = v98;
                        if (v114 == 2) {
                          goto LABEL_221;
                        }
                      }
                      if (objc_msgSend(v110, "index", v113) == 4)
                      {
                        uint64_t v115 = [NSNumber numberWithUnsignedInteger:1];
LABEL_224:
                        [v110 setValue:v115];
                        goto LABEL_229;
                      }
                      if ([v110 index] == 5)
                      {
                        if (a2) {
                          uint64_t v116 = [*(id *)(a2 + 144) objectForKey:v104];
                        }
                        else {
                          uint64_t v116 = 0;
                        }
                        [v110 setValue:v116];
                      }
                      else
                      {
                        if ([v110 index] == 6)
                        {
                          uint64_t v115 = [v105 firstObject];
                          goto LABEL_224;
                        }
                        if ([v110 index] == 7)
                        {
                          uint64_t v115 = [v105 lastObject];
                          goto LABEL_224;
                        }
                      }
                    }
LABEL_229:
                    ++v109;
                  }
                  while (v107 != v109);
                  uint64_t v117 = [v106 countByEnumeratingWithState:&v193 objects:v201 count:16];
                  uint64_t v107 = v117;
                }
                while (v117);
              }
              [(id)a1 execute];
              if (!*(void *)(a1 + 80))
              {
                uint64_t v118 = -[NSSQLiteConnection statementCacheForEntity:](a1, contexta);
                -[NSSQLiteStatementCache cacheInsertStatement:](v118, 0);
              }
              -[NSSQLiteConnection _clearBindVariablesForInsertedRow](a1);
              -[NSSQLiteConnection resetSQLStatement](a1);
            }
            uint64_t v135 = [v144 countByEnumeratingWithState:&v197 objects:v202 count:16];
          }
          while (v135);
        }
        [v126 drain];
        id v121 = 0;
      }
    }
    uint64_t v122 = [NSNumber numberWithLongLong:v98];
    if (a2) {
      *(void *)(a2 + 72) = v122;
    }
    uint64_t v119 = v130;
  }
  else
  {
    uint64_t v119 = 0;
  }
}

- (uint64_t)_insertTransactionForRequestContext:(void *)a3 andStrings:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey"), "entityNamed:", @"TRANSACTION");
  sqlite3_int64 v8 = -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](a1, (uint64_t)v7, 1u);
  if (!v8)
  {
    id v29 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134030, @"unable to generate primary keys for transaction", 0);
    objc_exception_throw(v29);
  }
  sqlite3_int64 v9 = v8;
  uint64_t v31 = v6;
  uint64_t v32 = a1;
  -[NSSQLiteConnection prepareInsertStatementForAncillaryEntity:](a1, v7);
  if (a2) {
    uint64_t v10 = *(void **)(a2 + 32);
  }
  else {
    uint64_t v10 = 0;
  }
  if (objc_msgSend((id)objc_msgSend(v10, "_queryGenerationToken"), "_isEnabled")
    && (!a2 ? (uint64_t v11 = 0) : (uint64_t v11 = *(void **)(a2 + 32)),
        (uint64_t v12 = -[_NSQueryGenerationToken _generationalComponentForStore:]([v11 _queryGenerationToken], *(id *)(a1 + 16))) == 0? (v13 = 0): (v13 = *((void *)v12 + 3)), objc_opt_class(), (objc_opt_isKindOfClass() & (v13 != 0)) == 1))
  {
    uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:*(void *)(v13 + 8) length:48];
  }
  else
  {
    uint64_t v14 = 0;
  }
  uint64_t v15 = [a3 valueForKey:@"AUTHORTS"];
  uint64_t v34 = [a3 valueForKey:@"BUNDLEIDTS"];
  uint64_t v33 = [a3 valueForKey:@"CONTEXTNAMETS"];
  uint64_t v16 = [a3 valueForKey:@"PROCESSIDTS"];
  uint64_t v30 = v7;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  char v17 = (void *)[*(id *)(a1 + 48) bindVariables];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        [v21 index];
        uint64_t v22 = (void *)v15;
        uint64_t v23 = v9;
        switch((int)v15)
        {
          case 0:
            goto LABEL_25;
          case 3:
            goto LABEL_24;
          case 4:
            uint64_t v22 = (void *)v34;
            goto LABEL_24;
          case 5:
            uint64_t v22 = (void *)v33;
            goto LABEL_24;
          case 6:
            uint64_t v22 = (void *)v16;
LABEL_24:
            uint64_t v23 = objc_msgSend(v22, "longLongValue", v9);
LABEL_25:
            [v21 setInt64:v23];
            break;
          case 11:
            if (v14) {
              [v21 setValue:v14];
            }
            break;
          case 12:
            uint64_t v24 = NSNumber;
            objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", v9);
            objc_msgSend(v21, "setValue:", objc_msgSend(v24, "numberWithDouble:"));
            break;
          default:
            continue;
        }
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v18);
  }
  [(id)v32 execute];
  if (!*(void *)(v32 + 80))
  {
    uint64_t v25 = -[NSSQLiteConnection statementCacheForEntity:](v32, v30);
    -[NSSQLiteStatementCache cacheInsertStatement:](v25, 0);
  }
  uint64_t v26 = (int)objc_msgSend((id)objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_last_insert_rowid(*(sqlite3 **)(v32 + 72))), "intValue");
  -[NSSQLiteConnection _clearBindVariablesForInsertedRow](v32);
  -[NSSQLiteConnection resetSQLStatement](v32);
  [v31 drain];
  id v27 = 0;
  return v26;
}

- (void)insertChanges:(uint64_t)a3 type:(sqlite3_int64)a4 transactionID:(uint64_t)a5 context:
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = *(NSObject **)(a1 + 8);
  if (v6) {
    dispatch_assert_queue_V2(v6);
  }
  if (a3 == 2) {
    id v51 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  else {
    id v51 = 0;
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "options"), "valueForKey:", @"NSPersistentHistoryTrackingKey");
  if ([v7 isNSDictionary]) {
    int v55 = objc_msgSend((id)objc_msgSend(v7, "valueForKey:", @"NSPersistentHistoryUseContextObjectsForDeletes"), "BOOLValue");
  }
  else {
    int v55 = 0;
  }
  id v48 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v56 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey"), "entityNamed:", @"CHANGE");
  sqlite3_int64 v8 = -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](a1, (uint64_t)v56, [a2 count]);
  if (!v8)
  {
    id v46 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134030, @"unable to generate primary keys", 0);
    objc_exception_throw(v46);
  }
  uint64_t v9 = [a2 count];
  if (a5) {
    uint64_t v49 = *(void **)(a5 + 32);
  }
  else {
    uint64_t v49 = 0;
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v10 = [a2 countByEnumeratingWithState:&v72 objects:v77 count:16];
  if (v10)
  {
    sqlite3_int64 v11 = v8 - v9;
    uint64_t v52 = *(void *)v73;
    uint64_t v53 = v10;
    uint64_t v63 = a5;
    do
    {
      uint64_t v60 = 0;
      do
      {
        if (*(void *)v73 != v52) {
          objc_enumerationMutation(a2);
        }
        uint64_t v64 = *(void *)(*((void *)&v72 + 1) + 8 * v60);
        context = (void *)MEMORY[0x18C127630]();
        if (!v64 || (*(unsigned char *)(v64 + 16) & 1) != 0)
        {
          uint64_t v13 = 0;
        }
        else
        {
          uint64_t v12 = [*(id *)(*(void *)(v64 + 40) + 16) _storeInfo1];
          uint64_t v13 = v12;
          if (v12)
          {
            char v58 = 0;
            uint64_t v65 = *(unsigned int *)(v12 + 184);
            goto LABEL_23;
          }
        }
        uint64_t v65 = 0;
        char v58 = 1;
LABEL_23:
        if (a3 == 2)
        {
          id v62 = (id)objc_msgSend(v51, "objectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v65));
          if (!v62)
          {
            id v62 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]((uint64_t)_PFPersistentHistoryModel, (void *)v13);
            if (v58) {
              uint64_t v14 = 0;
            }
            else {
              uint64_t v14 = *(unsigned int *)(v13 + 184);
            }
            objc_msgSend(v51, "setObject:forKey:", v62, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v14));
          }
          if ([v62 count]) {
            int v15 = v55;
          }
          else {
            int v15 = 0;
          }
          if (v15 == 1)
          {
            uint64_t v16 = objc_msgSend(v49, "objectRegisteredForID:", objc_msgSend((id)v64, "objectID"));
            if ([v16 isDeleted]) {
              char v17 = v16;
            }
            else {
              char v17 = 0;
            }
            goto LABEL_37;
          }
        }
        else
        {
          id v62 = 0;
        }
        char v17 = 0;
LABEL_37:
        -[NSSQLiteConnection prepareInsertStatementForAncillaryEntity:](a1, v56);
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        uint64_t v18 = (void *)[*(id *)(a1 + 48) bindVariables];
        uint64_t v19 = [v18 countByEnumeratingWithState:&v68 objects:v76 count:16];
        uint64_t v57 = v13;
        ++v11;
        if (!v19) {
          goto LABEL_87;
        }
        uint64_t v20 = *(void *)v69;
        uint64_t v21 = (void *)v64;
        if (v55) {
          uint64_t v21 = v17;
        }
        uint64_t v54 = v21;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v69 != v20) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void **)(*((void *)&v68 + 1) + 8 * v22);
            uint64_t v24 = (void *)MEMORY[0x18C127630]();
            if (![v23 index])
            {
              int v25 = [v23 sqlType];
              sqlite3_int64 v26 = v11;
              if (v25 == 2)
              {
LABEL_50:
                [v23 setInt64:v26];
                goto LABEL_54;
              }
            }
            if ([v23 index] != 1 && objc_msgSend(v23, "index") != 2)
            {
              if ([v23 index] == 3)
              {
                int v27 = [v23 sqlType];
                sqlite3_int64 v26 = a4;
                if (v27 == 2) {
                  goto LABEL_50;
                }
              }
              if (objc_msgSend(v23, "index", v26) == 4)
              {
                uint64_t v28 = [NSNumber numberWithUnsignedInteger:a3];
LABEL_53:
                [v23 setValue:v28];
                goto LABEL_54;
              }
              if ([v23 index] == 5)
              {
                if (a3 == 1)
                {
                  uint64_t v29 = v63;
                  id v30 = [NSString alloc];
                  if (v64) {
                    uint64_t v31 = [*(id *)(*(void *)(v64 + 40) + 16) _referenceData64];
                  }
                  else {
                    uint64_t v31 = 0;
                  }
                  uint64_t v32 = objc_msgSend(v30, "initWithFormat:", @"%u-%lld", v65, v31);
                  if (v63) {
                    uint64_t v29 = [*(id *)(v63 + 144) objectForKey:v32];
                  }

                  [v23 setValue:v29];
                }
              }
              else
              {
                if ([v23 index] == 6)
                {
                  uint64_t v28 = [NSNumber numberWithUnsignedInt:v65];
                  goto LABEL_53;
                }
                if ([v23 index] == 7)
                {
                  uint64_t v33 = NSNumber;
                  if (v64) {
                    uint64_t v34 = [*(id *)(*(void *)(v64 + 40) + 16) _referenceData64];
                  }
                  else {
                    uint64_t v34 = 0;
                  }
                  uint64_t v28 = [v33 numberWithLongLong:v34];
                  goto LABEL_53;
                }
                uint64_t v35 = objc_msgSend((id)objc_msgSend(v23, "propertyDescription"), "name");
                if (a3 == 2)
                {
                  long long v36 = (void *)v35;
                  if ([v62 count])
                  {
                    if ([v36 containsString:@"TOMBSTONE"])
                    {
                      int v37 = objc_msgSend((id)objc_msgSend(v36, "stringByReplacingOccurrencesOfString:withString:", @"TOMBSTONE", &stru_1ED787880), "intValue");
                      if (v37 < (int)[v62 count])
                      {
                        long long v38 = (void *)[v62 objectAtIndexedSubscript:v37];
                        if (v58) {
                          uint64_t v39 = 0;
                        }
                        else {
                          uint64_t v39 = (void *)[*(id *)(v57 + 40) objectForKey:v38];
                        }
                        objc_msgSend(v23, "setSQLType:", objc_msgSend(v39, "sqlType"));
                        if ([v39 sqlType] == 15) {
                          objc_msgSend(v23, "setTombstonedPropertyDescription:", objc_msgSend(v39, "propertyDescription"));
                        }
                        uint64_t v40 = (void *)[v54 valueForKey:v38];
                        if (v40)
                        {
                          if (objc_msgSend((id)objc_msgSend(v39, "propertyDescription"), "superCompositeAttribute"))
                          {
                            CFNumberType v41 = (void *)[v38 componentsSeparatedByString:@"."];
                            for (unint64_t i = 1; [v41 count] > i; ++i)
                              uint64_t v40 = objc_msgSend(v40, "objectForKey:", objc_msgSend(v41, "objectAtIndex:", i));
                          }
                          [v23 setValue:v40];
                        }
                      }
                    }
                  }
                }
              }
            }
LABEL_54:
            ++v22;
          }
          while (v22 != v19);
          uint64_t v43 = [v18 countByEnumeratingWithState:&v68 objects:v76 count:16];
          uint64_t v19 = v43;
        }
        while (v43);
LABEL_87:
        [(id)a1 execute];
        if (!*(void *)(a1 + 80))
        {
          uint64_t v44 = -[NSSQLiteConnection statementCacheForEntity:](a1, v56);
          -[NSSQLiteStatementCache cacheInsertStatement:](v44, 0);
        }
        -[NSSQLiteConnection _clearBindVariablesForInsertedRow](a1);
        -[NSSQLiteConnection resetSQLStatement](a1);
        ++v60;
      }
      while (v60 != v53);
      uint64_t v45 = [a2 countByEnumeratingWithState:&v72 objects:v77 count:16];
      uint64_t v53 = v45;
    }
    while (v45);
  }
  [v48 drain];
  id v47 = 0;
}

- (uint64_t)_clearBindVariablesForInsertedRow
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  uint64_t v3 = (void *)[*(id *)(a1 + 48) entity];
  uint64_t v4 = (void *)[v3 attributeColumns];
  CFArrayRef v5 = (const __CFArray *)[*(id *)(a1 + 48) bindVariables];
  int v6 = objc_msgSend((id)objc_msgSend(v3, "foreignEntityKeyColumns"), "count");
  long long v21 = 0u;
  long long v22 = 0u;
  unsigned int v7 = v6 + objc_msgSend((id)objc_msgSend(v3, "foreignOrderKeyColumns"), "count") + 3;
  long long v23 = 0u;
  long long v24 = 0u;
  sqlite3_int64 v8 = (void *)[v3 foreignKeyColumns];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v7 += objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v12++), "toOneRelationship"), "isConstrained") ^ 1;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v10);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t result = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (result)
  {
    uint64_t v14 = result;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v4);
        }
        if (([*(id *)(*((void *)&v17 + 1) + 8 * v16) isConstrained] & 1) == 0) {
          objc_msgSend((id)CFArrayGetValueAtIndex(v5, v7++), "setValue:", 0);
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t result = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
      uint64_t v14 = result;
    }
    while (result);
  }
  return result;
}

- (uint64_t)fetchBufferResultSet:(uint64_t)a3 usingFetchPlan:
{
  uint64_t v193 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v4 = result;
    CFArrayRef v5 = *(NSObject **)(result + 8);
    if (v5) {
      dispatch_assert_queue_V2(v5);
    }
    int v6 = *(_DWORD *)(a3 + 16);
    if (!v6) {
      int v6 = 0x7FFFFFFF;
    }
    int v176 = v6;
    int v174 = *(_DWORD *)(a3 + 72);
    uint64_t v171 = [*(id *)(a3 + 40) model];
    uint64_t v7 = *(void *)(a3 + 48);
    if (v7) {
      int v175 = *(unsigned char *)(v7 + 43) & 1;
    }
    else {
      int v175 = 0;
    }
    uint64_t v8 = *(void *)(a3 + 40);
    if (v8) {
      uint64_t v9 = *(void **)(v8 + 240);
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v185 = [v9 length];
    uint64_t v10 = *(void *)(a3 + 40);
    if (v10) {
      unsigned int v11 = *(_DWORD *)(v10 + 184);
    }
    else {
      unsigned int v11 = 0;
    }
    uint64_t v186 = v4;
    uint64_t v170 = a3;
    v180 = *(uint64_t (**)(uint64_t, char *, sqlite3_int64))(a3 + 64);
    uint64_t v173 = *(void *)(a3 + 40);
    plan_for_entity = (int *)_sql_read_only_fetch_plan_for_entity((unint64_t *)v10);
    uint64_t v13 = (objc_class *)objc_opt_class();
    size_t InstanceSize = class_getInstanceSize(v13);
    if (((InstanceSize + 7) & 0xFFFFFFFFFFFFFFF8) + 8 * v185 + *plan_for_entity <= 0x800) {
      size_t v15 = 2048;
    }
    else {
      size_t v15 = ((InstanceSize + 7) & 0xFFFFFFFFFFFFFFF8) + 8 * v185 + *plan_for_entity;
    }
    uint64_t v191 = v15;
    uint64_t v16 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      uint64_t v16 = malloc_default_zone();
    }
    long long v189 = malloc_type_zone_calloc(v16, 1uLL, v15, 0xEE3CFF3DuLL);
    if (v176 >= 1)
    {
      unsigned int v177 = 0;
      int v17 = 0;
      unint64_t v18 = v11;
      uint64_t v172 = 2 * v185;
      while (1)
      {
        if ((*(unsigned char *)(v186 + 312) & 2) == 0) {
          goto LABEL_167;
        }
        if (v174)
        {
          unsigned int v19 = sqlite3_column_int(*(sqlite3_stmt **)(v186 + 80), 0);
          unsigned int v20 = v19;
          if (!v19) {
            -[NSSQLiteConnection handleCorruptedDB:](v186, @"The database appears corrupt.  (invalid entity key)");
          }
          unint64_t v18 = v19;
          if (v19 != *(_DWORD *)(v186 + 92))
          {
            uint64_t v173 = (*(uint64_t (**)(uint64_t, char *, void))(v170 + 64))(v171, sel_entityForID_, v19);
            *(void *)(v186 + 104) = v173;
            *(_DWORD *)(v186 + 92) = v20;
            plan_for_entity = (int *)_sql_read_only_fetch_plan_for_entity((unint64_t *)v173);
          }
        }
        int v178 = v17;
        long long v190 = plan_for_entity;
        int v21 = plan_for_entity[1];
        bzero(v189 + 2, v191 - 8);
        v189[5] = 0;
        unint64_t v179 = v18;
        *((void *)v189 + 3) = v18;
        *((void *)v189 + 4) = 0;
        bzero(v189 + 10, v172 * 4);
        long long v22 = (char *)&v189[v172 + 10];
        unsigned int v183 = v21;
        if (v21) {
          break;
        }
        int v187 = 0;
LABEL_161:
        v189[5] = v187;
        bufferResultSetIngestRow(a2, v189, ((unint64_t)(v22 + 7) & 0xFFFFFFFFFFFFFFF8) - (void)v189);
        uint64_t v138 = v186;
        ++*(_DWORD *)(v186 + 88);
        int v139 = v178;
        ++v177;
        unint64_t v18 = v179;
        plan_for_entity = v190;
LABEL_162:
        _execute(v138);
        int v17 = v139 + 1;
        if (v17 == v176) {
          goto LABEL_167;
        }
      }
      uint64_t v23 = 0;
      int v187 = 0;
      long long v24 = 0;
      sqlite3_int64 v182 = 0;
      unsigned __int8 v184 = 0;
      unsigned int v25 = 0;
      sqlite3_int64 v26 = (char *)&v189[v172 + 10];
      uint64_t v27 = v26;
      while (1)
      {
        long long v22 = (char *)((unint64_t)(v27 + 7) & 0xFFFFFFFFFFFFFFF8);
        int v28 = LOBYTE(v190[6 * v25 + 5]);
        if (v22 - v27 >= 1) {
          *(void *)&v26[8 * (v23 - v185) - 8] += v22 - v27;
        }
        uint64_t v29 = (char *)v189;
        if ((unint64_t)((char *)v189 - v22 + v191) > 0xF)
        {
          long long v188 = v26;
        }
        else
        {
          v191 += 16;
          id v30 = (char *)bufferResultSetRealloc(v189, (unint64_t *)&v191);
          long long v188 = &v30[v26 - (char *)v189];
          long long v189 = v30;
          long long v22 = (char *)((unint64_t)&v30[v27 - v29 + 7] & 0xFFFFFFFFFFFFFFF8);
        }
        if (v25 >= 7 && (v184 & 1) != 0)
        {
          uint64_t v31 = v24;
          if (!v24) {
            uint64_t v31 = (void *)v180([*(id *)(v186 + 16) model], sel_entityForID_, v182);
          }
          long long v24 = v31;
          id v32 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]((uint64_t)_PFPersistentHistoryModel, v31);
          int v33 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)&v190[6 * v25 + 6], "propertyDescription"), "name"), "stringByReplacingOccurrencesOfString:withString:", @"TOMBSTONE", &stru_1ED787880), "intValue");
          if (v33 < (int)[v32 count])
          {
            uint64_t v34 = [v32 objectAtIndexedSubscript:v33];
            if (v24) {
              uint64_t v35 = (void *)[(id)v24[5] objectForKey:v34];
            }
            else {
              uint64_t v35 = 0;
            }
            int v28 = [v35 sqlType];
          }
        }
        switch(v28)
        {
          case 1:
            uint64_t v66 = &v190[6 * v25];
            int v68 = v66[3];
            uint64_t v67 = v66 + 3;
            int v69 = sqlite3_column_int(*(sqlite3_stmt **)(v186 + 80), v68);
            int v70 = v69;
            long long v71 = &v190[6 * v25];
            int v72 = *((unsigned __int8 *)v71 + 21);
            int v73 = v71[4];
            if (v72 != 4)
            {
              sqlite3_int64 v26 = v188;
              if (v73)
              {
                if (v69)
                {
                  *(_DWORD *)long long v22 = 0;
                }
                else
                {
                  int v116 = sqlite3_column_type(*(sqlite3_stmt **)(v186 + 80), *v67);
                  *(_DWORD *)long long v22 = v116 == 5;
                  if (v116 == 5) {
                    goto LABEL_118;
                  }
                }
              }
              *(_DWORD *)long long v22 = v70;
              if (v173) {
                int v117 = *(_DWORD *)(v173 + 184);
              }
              else {
                int v117 = 0;
              }
              BOOL v120 = v25 == 3 && v117 == 16001 && v70 == 2;
              v184 |= v120;
              ++v187;
              uint64_t v52 = v22 + 4;
              goto LABEL_117;
            }
            sqlite3_int64 v26 = v188;
            if (v73)
            {
              if (v69)
              {
                *(_DWORD *)long long v22 = 0;
              }
              else
              {
                int v110 = sqlite3_column_type(*(sqlite3_stmt **)(v186 + 80), *v67);
                *(_DWORD *)long long v22 = v110 == 5;
                if (v110 == 5)
                {
                  ++v25;
                  uint64_t v52 = v22;
                  goto LABEL_117;
                }
              }
            }
            *(void *)long long v22 = v70;
            uint64_t v52 = v22 + 8;
            uint64_t v111 = &v190[6 * ++v25];
            int v113 = v111[3];
            int v112 = v111 + 3;
            sqlite3_int64 v114 = sqlite3_column_int64(*(sqlite3_stmt **)(v186 + 80), v113);
            sqlite3_int64 v115 = v114;
            if (v190[6 * v25 + 4])
            {
              if (v114)
              {
                *(void *)uint64_t v52 = 0;
              }
              else
              {
                int v121 = sqlite3_column_type(*(sqlite3_stmt **)(v186 + 80), *v112);
                *(void *)uint64_t v52 = v121 == 5;
                if (v121 == 5)
                {
                  _NSCoreDataLog(1, @"BufferAllocations found a bad Object ID", v122, v123, v124, v125, v126, v127, v165);
                  goto LABEL_117;
                }
              }
            }
            *((void *)v22 + 1) = v115;
            uint64_t v52 = v22 + 16;
            goto LABEL_116;
          case 2:
          case 3:
            uint64_t v56 = &v190[6 * v25];
            int v58 = v56[3];
            uint64_t v57 = v56 + 3;
            sqlite3_int64 v59 = sqlite3_column_int64(*(sqlite3_stmt **)(v186 + 80), v58);
            sqlite3_int64 v60 = v59;
            if ((v190[6 * v25 + 4] & 1) == 0) {
              goto LABEL_101;
            }
            if (v59)
            {
              *(_DWORD *)long long v22 = 0;
            }
            else
            {
              int v99 = sqlite3_column_type(*(sqlite3_stmt **)(v186 + 80), *v57);
              *(_DWORD *)long long v22 = v99 == 5;
              if (v99 == 5) {
                goto LABEL_45;
              }
            }
LABEL_101:
            sqlite3_int64 v100 = (sqlite3_int64 *)v22;
            if (BYTE1(v190[6 * v25 + 5]) == 3)
            {
              uint64_t v101 = objc_msgSend((id)objc_msgSend(*(id *)&v190[6 * v25 + 6], "toOneRelationship"), "destinationEntity");
              if (v101) {
                uint64_t v102 = *(unsigned int *)(v101 + 184);
              }
              else {
                uint64_t v102 = 0;
              }
              *(void *)long long v22 = v102;
              sqlite3_int64 v100 = (sqlite3_int64 *)(v22 + 8);
            }
            *sqlite3_int64 v100 = v60;
            uint64_t v52 = (char *)(v100 + 1);
            sqlite3_int64 v103 = v182;
            if ((v184 & (v25 == 5)) != 0) {
              sqlite3_int64 v103 = v60;
            }
            sqlite3_int64 v182 = v103;
            ++v187;
            sqlite3_int64 v26 = v188;
            goto LABEL_117;
          case 4:
          case 5:
          case 6:
          case 9:
          case 12:
          case 13:
          case 14:
            plan_for_entity = v190;
            long long v36 = &v190[6 * v25];
            int v38 = v36[3];
            int v37 = v36 + 3;
            uint64_t v39 = sqlite3_column_text(*(sqlite3_stmt **)(v186 + 80), v38);
            uint64_t v40 = v39;
            if ((v190[6 * v25 + 4] & 1) == 0) {
              goto LABEL_46;
            }
            if (v39 && *v39)
            {
              *(_DWORD *)long long v22 = 0;
              goto LABEL_47;
            }
            int v41 = sqlite3_column_type(*(sqlite3_stmt **)(v186 + 80), *v37);
            *(_DWORD *)long long v22 = v41 == 5;
            if (v41 != 5)
            {
LABEL_46:
              if (!v40)
              {
                unint64_t v18 = v179;
                v140 = [NSString stringWithFormat:@"Row (puint64_t k = %ld) for entity '%@' is missing mandatory text data for property '%@'", 0, objc_msgSend((id)objc_msgSend((id)_sqlEntityForEntityID(v171, v179), "entityDescription"), "name"), objc_msgSend((id)objc_msgSend(*(id *)&v190[6 * v25 + 6], "propertyDescription"), "name")];
                _NSCoreDataLog(1, @"%@\n", v141, v142, v143, v144, v145, v146, v140);
                int v139 = v178;
                uint64_t v138 = v186;
                goto LABEL_162;
              }
LABEL_47:
              self;
              LOBYTE(v42) = *v40;
              if (*v40)
              {
                char v43 = 0;
                uint64_t v44 = 0;
                do
                {
                  if ((v42 & 0x80u) != 0) {
                    char v43 = 1;
                  }
                  uint64_t v45 = v44 + 1;
                  int v42 = v40[++v44];
                }
                while (v42);
              }
              else
              {
                char v43 = 0;
                uint64_t v45 = 0;
              }
              id v46 = off_1E544B1D8;
              if (v43) {
                id v46 = &off_1E544B1E0;
              }
              uint64_t v47 = [(__objc2_class *)*v46 bufferOffset];
              unint64_t v48 = v47 + (((v45 << 32) + 0x100000000) >> 32);
              if (v191 - (v22 - (char *)v189) < v48)
              {
                uint64_t v49 = (objc_class *)objc_opt_class();
                int v50 = class_getInstanceSize(v49);
                v191 += (int)(((v50 + 7) & 0xFFFFFFF8) + v48);
                id v51 = (char *)bufferResultSetRealloc(v189, (unint64_t *)&v191);
                long long v22 = &v51[v22 - (char *)v189];
                long long v188 = &v51[v188 - (char *)v189];
                long long v189 = v51;
              }
              if (v43 || (int)v45 > 7)
              {
                if (v43) {
                  uint64_t v53 = -1;
                }
                else {
                  uint64_t v53 = 0;
                }
                *(void *)long long v22 = v53;
                *((_DWORD *)v22 + 4) = v45;
                uint64_t v54 = &v22[v47];
                memcpy(v54, v40, (int)v45);
                int v55 = &v54[(int)v45];
              }
              else
              {
                if ((*(unsigned char *)(a2 + 40) & 2) == 0)
                {
                  *(void *)buf = 0;
                  __memmove_chk();
                  sqlite3_int64 v26 = v188;
                  if ((*(void *)buf & 0x8080808080808080) != 0)
                  {
                    uint64_t v52 = v22;
                  }
                  else
                  {
                    unint64_t v97 = (8 * (int)v45) | (*(void *)buf << 7) | 0x8000000000000002;
                    unint64_t v98 = *MEMORY[0x1E4FBA8E0] ^ v97;
                    if ((~v98 & 0xC000000000000007) == 0
                      || (uint64_t v52 = v22,
                          (unint64_t v97 = v98 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v98 & 7))) != 0))
                    {
                      *(void *)long long v22 = v97;
                      uint64_t v52 = v22 + 8;
                    }
                  }
LABEL_116:
                  ++v187;
LABEL_117:
                  *(void *)&v26[8 * (v23 - v185)] = v52 - v22;
                  long long v22 = v52;
                  goto LABEL_118;
                }
                memcpy(v22, v40, (int)v45);
                int v55 = &v22[(int)v45];
              }
              *int v55 = 0;
              uint64_t v52 = v55 + 1;
              sqlite3_int64 v26 = v188;
              goto LABEL_116;
            }
LABEL_45:
            sqlite3_int64 v26 = v188;
LABEL_118:
            ++v25;
            ++v23;
            uint64_t v27 = v22;
            if (v25 >= v183) {
              goto LABEL_161;
            }
            break;
          case 7:
          case 8:
            uint64_t v61 = &v190[6 * v25];
            int v63 = v61[3];
            id v62 = v61 + 3;
            double v64 = sqlite3_column_double(*(sqlite3_stmt **)(v186 + 80), v63);
            double v65 = v64;
            sqlite3_int64 v26 = v188;
            if ((v190[6 * v25 + 4] & 1) == 0) {
              goto LABEL_109;
            }
            if (v64 == 0.0)
            {
              int v104 = sqlite3_column_type(*(sqlite3_stmt **)(v186 + 80), *v62);
              *(_DWORD *)long long v22 = v104 == 5;
              if (v104 == 5) {
                goto LABEL_118;
              }
            }
            else
            {
              *(_DWORD *)long long v22 = 0;
            }
LABEL_109:
            *(double *)long long v22 = v65;
            uint64_t v52 = v22 + 8;
            goto LABEL_116;
          case 16:
            if (!v175) {
              goto LABEL_91;
            }
            if (objc_msgSend((id)objc_msgSend(*(id *)&v190[6 * v25 + 6], "propertyDescription"), "_isFileBackedFuture"))goto LABEL_91; {
            long long v74 = &v190[6 * v25];
            }
            int v76 = v74[3];
            long long v75 = v74 + 3;
            uint64_t v77 = (const char *)sqlite3_column_blob(*(sqlite3_stmt **)(v186 + 80), v76);
            int v78 = sqlite3_column_bytes(*(sqlite3_stmt **)(v186 + 80), *v75);
            size_t v79 = (v78 - 1);
            if (v78 < 1) {
              goto LABEL_91;
            }
            long long v168 = v75;
            unsigned int v169 = v78;
            int v80 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
            int v81 = *(unsigned __int8 *)v77;
            if (v81 == 1)
            {
              id v128 = [_PFExternalReferenceData alloc];
              uint64_t v129 = *(void *)(v186 + 16);
              if (v129) {
                uint64_t v130 = (*(_DWORD *)(v129 + 200) >> 2) & 7;
              }
              else {
                uint64_t v130 = 0;
              }
              uint64_t v91 = [(_PFExternalReferenceData *)v128 initWithStoreBytes:v77 length:v169 externalLocation:0 safeguardLocation:0 protectionLevel:v130];
            }
            else
            {
              if (v81 == 3) {
                __break(1u);
              }
              long long v166 = v77;
              uint64_t v167 = objc_msgSend(v80, "stringWithFileSystemRepresentation:length:", v77 + 1, strnlen(v77 + 1, v79));
              uint64_t v82 = (void *)[*(id *)(v186 + 16) externalDataReferencesDirectory];
              uint64_t v83 = *(void *)(v186 + 16);
              if (v83)
              {
                if (!atomic_load((unint64_t *)(v83 + 168))) {
                  [*(id *)(v186 + 16) externalDataReferencesDirectory];
                }
                uint64_t v85 = (void *)atomic_load((unint64_t *)(v83 + 176));
              }
              else
              {
                uint64_t v85 = 0;
              }
              uint64_t v86 = [v82 stringByAppendingPathComponent:v167];
              uint64_t v87 = [v85 stringByAppendingPathComponent:v167];
              uint64_t v88 = [_PFExternalReferenceData alloc];
              uint64_t v89 = *(void *)(v186 + 16);
              if (v89) {
                uint64_t v90 = (*(_DWORD *)(v89 + 200) >> 2) & 7;
              }
              else {
                uint64_t v90 = 0;
              }
              uint64_t v91 = [(_PFExternalReferenceData *)v88 initWithStoreBytes:v166 length:v169 externalLocation:v86 safeguardLocation:v87 protectionLevel:v90];
            }
            uint64_t v131 = v91;
            int v132 = [(_PFExternalReferenceData *)v91 length];
            int v133 = v132;
            sqlite3_int64 v26 = v188;
            if ((v190[6 * v25 + 4] & 1) == 0) {
              goto LABEL_149;
            }
            if (v132)
            {
              *(_DWORD *)long long v22 = 0;
            }
            else
            {
              int v134 = sqlite3_column_type(*(sqlite3_stmt **)(v186 + 80), *v168);
              *(_DWORD *)long long v22 = v134 == 5;
              if (v134 == 5)
              {

                goto LABEL_118;
              }
            }
LABEL_149:
            uint64_t v135 = (objc_class *)objc_opt_class();
            unint64_t v136 = ((class_getInstanceSize(v135) + 7) & 0xFFFFFFF8) + v133;
            if (v191 - (v22 - (char *)v189) >= v136)
            {
              sqlite3_int64 v26 = v188;
            }
            else
            {
              v191 += v136;
              BOOL v137 = (char *)bufferResultSetRealloc(v189, (unint64_t *)&v191);
              long long v22 = &v137[v22 - (char *)v189];
              sqlite3_int64 v26 = &v137[v188 - (char *)v189];
              long long v189 = v137;
            }
            if (!v22)
            {
              uint64_t v156 = [NSString stringWithUTF8String:"bufferResultSetRealloc failed to realloc buffer to %ld bytes"];
              _NSCoreDataLog(17, v156, v157, v158, v159, v160, v161, v162, v191);
              long long v163 = __pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 134217984;
                *(void *)&uint8_t buf[4] = v191;
                _os_log_fault_impl(&dword_18AB82000, v163, OS_LOG_TYPE_FAULT, "CoreData: bufferResultSetRealloc failed to realloc buffer to %ld bytes", buf, 0xCu);
              }
              id v164 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C4A0], 134183, @"realloc failed", 0);
              objc_exception_throw(v164);
            }
            *(void *)long long v22 = 0;
            *((_DWORD *)v22 + 3) = v133;
            memcpy(v22 + 24, [(_PFExternalReferenceData *)v131 bytes], v133);

            ++v187;
            uint64_t v52 = &v22[v133 + 24];
            goto LABEL_117;
          default:
LABEL_91:
            uint64_t v92 = &v190[6 * v25];
            int v94 = v92[3];
            uint64_t v93 = v92 + 3;
            int v95 = sqlite3_column_bytes(*(sqlite3_stmt **)(v186 + 80), v94);
            int v96 = v95;
            sqlite3_int64 v26 = v188;
            if ((v190[6 * v25 + 4] & 1) == 0) {
              goto LABEL_111;
            }
            if (v95)
            {
              *(_DWORD *)long long v22 = 0;
            }
            else
            {
              int v105 = sqlite3_column_type(*(sqlite3_stmt **)(v186 + 80), *v93);
              *(_DWORD *)long long v22 = v105 == 5;
              if (v105 == 5) {
                goto LABEL_118;
              }
            }
LABEL_111:
            uint64_t v106 = (objc_class *)objc_opt_class();
            unint64_t v107 = ((class_getInstanceSize(v106) + 7) & 0xFFFFFFF8) + v96;
            if (v191 - (v22 - (char *)v189) >= v107)
            {
              sqlite3_int64 v26 = v188;
            }
            else
            {
              v191 += v107;
              uint64_t v108 = (char *)bufferResultSetRealloc(v189, (unint64_t *)&v191);
              long long v22 = &v108[v22 - (char *)v189];
              sqlite3_int64 v26 = &v108[v188 - (char *)v189];
              long long v189 = v108;
            }
            if (!v22)
            {
              uint64_t v147 = [NSString stringWithUTF8String:"bufferResultSetRealloc failed to realloc buffer to %ld bytes"];
              _NSCoreDataLog(17, v147, v148, v149, v150, v151, v152, v153, v191);
              long long v154 = __pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 134217984;
                *(void *)&uint8_t buf[4] = v191;
                _os_log_fault_impl(&dword_18AB82000, v154, OS_LOG_TYPE_FAULT, "CoreData: bufferResultSetRealloc failed to realloc buffer to %ld bytes", buf, 0xCu);
              }
              id v155 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C4A0], 134183, @"realloc failed", 0);
              objc_exception_throw(v155);
            }
            *(void *)long long v22 = 0;
            *((_DWORD *)v22 + 3) = v96;
            uint64_t v109 = sqlite3_column_blob(*(sqlite3_stmt **)(v186 + 80), *v93);
            memcpy(v22 + 24, v109, v96);
            uint64_t v52 = &v22[v96 + 24];
            goto LABEL_116;
        }
      }
    }
    unsigned int v177 = 0;
LABEL_167:
    PF_FREE_OBJECT_ARRAY(v189);
    if (v177 <= 0x40000000) {
      uint64_t result = v177;
    }
    else {
      uint64_t result = 0;
    }
    if ((*(unsigned char *)(v186 + 312) & 2) == 0) {
      *(_DWORD *)(a2 + 40) |= 1u;
    }
  }
  return result;
}

- (void)prepareAndExecuteSQLStatement:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(NSObject **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    if (a2)
    {
      CFArrayRef v5 = (void *)MEMORY[0x18C127630]();
      -[NSSQLiteConnection bindTempTablesForStatementIfNecessary:]((void *)a1, a2);
      -[NSSQLiteConnection prepareSQLStatement:](a1, a2);
      if (*(void *)(a1 + 72))
      {
        if (+[NSPersistentStoreCoordinator _shouldDebugAllTaskAssertions]())
        {
          int v15 = 0;
          if (!sqlite3_file_control(*(sqlite3 **)(a1 + 72), 0, 103, &v15) && v15 >= 2)
          {
            self;
            uint64_t v6 = [NSString stringWithUTF8String:"A task assertion should be active when this database is locked"];
            _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, v14);
            uint64_t v13 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              LOWORD(v14) = 0;
              _os_log_fault_impl(&dword_18AB82000, v13, OS_LOG_TYPE_FAULT, "CoreData: A task assertion should be active when this database is locked", (uint8_t *)&v14, 2u);
            }
          }
        }
      }
      [(id)a1 execute];
      -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0);
      *(_DWORD *)(a1 + 312) &= ~2u;
      *(void *)(a1 + 100) = 0;
      *(void *)(a1 + 92) = 0;
      *(_DWORD *)(a1 + 108) = 0;
      -[NSSQLiteConnection releaseSQLStatement](a1);
    }
  }
}

- (uint64_t)_ensureWalFileExists
{
  if (!a1) {
    return 0;
  }
  int v2 = *(sqlite3 **)(a1 + 72);
  if (!v2) {
    return -1;
  }
  unint64_t FileSizeFromJournalHandle = readFileSizeFromJournalHandle(v2);
  if (FileSizeFromJournalHandle <= 0x3FF)
  {
    if (*(void *)(a1 + 72))
    {
      if (+[NSPersistentStoreCoordinator _shouldDebugAllTaskAssertions]())
      {
        int v14 = 0;
        if (!sqlite3_file_control(*(sqlite3 **)(a1 + 72), 0, 103, &v14) && v14 >= 2)
        {
          self;
          uint64_t v4 = [NSString stringWithUTF8String:"A task assertion should be active when this database is locked"];
          _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, v13);
          uint64_t v11 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v13) = 0;
            _os_log_fault_impl(&dword_18AB82000, v11, OS_LOG_TYPE_FAULT, "CoreData: A task assertion should be active when this database is locked", (uint8_t *)&v13, 2u);
          }
        }
      }
    }
    -[NSSQLiteConnection _executeSQLString:](a1, @"BEGIN EXCLUSIVE");
    -[NSSQLiteConnection _executeSQLString:](a1, @"INSERT INTO Z_METADATA (Z_VERSION) VALUES (999)");
    -[NSSQLiteConnection _executeSQLString:](a1, @"DELETE FROM Z_METADATA where Z_VERSION = 999");
    -[NSSQLiteConnection _executeSQLString:](a1, @"COMMIT");
  }
  return FileSizeFromJournalHandle;
}

- (void)_performPostSaveTasks:(int)a3 andForceFullVacuum:
{
  if (a1)
  {
    uint64_t v6 = *(NSObject **)(a1 + 8);
    if (v6) {
      dispatch_assert_queue_V2(v6);
    }
    if (*(void *)(a1 + 72) && ([*(id *)(a1 + 16) isReadOnly] & 1) == 0)
    {
      uint64_t FileSizeFromJournalHandle = readFileSizeFromJournalHandle(*(sqlite3 **)(a1 + 72));
      if (FileSizeFromJournalHandle <= 0x800000)
      {
        int v14 = 0;
        if (a2) {
          goto LABEL_16;
        }
      }
      else
      {
        _NSCoreDataLog(9, @"PostSaveMaintenance: fileSize %lld greater than prune threshold", v8, v9, v10, v11, v12, v13, FileSizeFromJournalHandle);
        if (*(void *)(a1 + 296) != 0x7FFFFFFFFFFFFFFFLL) {
          *(void *)(a1 + 296) = 0;
        }
        int v14 = 1;
        if (a2) {
          goto LABEL_16;
        }
      }
      if (!a3)
      {
        uint64_t v15 = *(void *)(a1 + 296);
        if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_45;
        }
        uint64_t v16 = (uint64_t *)(a1 + 296);
        if (v15)
        {
          uint64_t v17 = v15 - 1;
LABEL_44:
          uint64_t *v16 = v17;
          goto LABEL_45;
        }
LABEL_20:
        if (a3)
        {
          _NSCoreDataLog(2, @"PostSaveMaintenance: Full Vacuum", v8, v9, v10, v11, v12, v13, v33);
          CFMutableArrayRef v19 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](a1, @"vacuum");
          if (v19) {
            CFRelease(v19);
          }
          goto LABEL_43;
        }
        CFArrayRef v20 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](a1, @"pragma page_count");
        CFArrayRef v21 = v20;
        if (v20)
        {
          if (CFArrayGetCount(v20))
          {
            uint64_t v22 = *(void *)CFArrayGetValueAtIndex(v21, 0);
            if (!v22)
            {
              uint64_t *v16 = 10;
              CFRelease(v21);
              CFArrayRef v21 = 0;
            }
            uint64_t v23 = *(void *)CFArrayGetValueAtIndex(v21, 1);
            if (v21) {
              CFRelease(v21);
            }
            if (v22)
            {
              CFArrayRef v24 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](a1, @"pragma freelist_count");
              CFArrayRef v25 = v24;
              if (v24)
              {
                if (CFArrayGetCount(v24))
                {
                  uint64_t v26 = *(void *)CFArrayGetValueAtIndex(v25, 0);
                  if (!v26)
                  {
                    uint64_t *v16 = 10;
                    CFRelease(v25);
                    CFArrayRef v25 = 0;
                  }
                  uint64_t v27 = *(void *)CFArrayGetValueAtIndex(v25, 1);
                  if (v25) {
                    CFRelease(v25);
                  }
                  uint64_t *v16 = 10;
                  if (v27)
                  {
                    if (a2)
                    {
                      _NSCoreDataLog(4, @"PostSaveMaintenance: forced incremental_vacuum - %ld", v8, v9, v10, v11, v12, v13, v27);
                      uint64_t v33 = v27;
                      int v28 = (void *)[[NSString alloc] initWithFormat:@"pragma incremental_vacuum(%d)"];
                      CFMutableArrayRef v29 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](a1, v28);

                      if (!v29) {
                        goto LABEL_45;
                      }
                      goto LABEL_39;
                    }
                    if (v26)
                    {
                      double v30 = (double)(v23 - v27) / (double)v23;
                      if (v27 > 1023 || v30 <= 0.85)
                      {
                        uint64_t v31 = v30 >= 0.4 ? v27 / 5 : v27 - (v23 - v27);
                        _NSCoreDataLog(9, @"PostSaveMaintenance: incremental_vacuum with freelist_count - %ld and pages_to_free %lld", v8, v9, v10, v11, v12, v13, v27);
                        uint64_t v33 = v31;
                        id v32 = (void *)[[NSString alloc] initWithFormat:@"pragma incremental_vacuum(%d)"];
                        CFMutableArrayRef v29 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](a1, v32);

                        if (v29) {
LABEL_39:
                        }
                          CFRelease(v29);
                      }
                    }
                  }
LABEL_45:
                  if (!v14) {
                    return;
                  }
                  goto LABEL_46;
                }
                uint64_t *v16 = 10;
                CFRelease(v25);
LABEL_43:
                uint64_t v17 = 10;
                goto LABEL_44;
              }
            }
          }
          else
          {
            uint64_t *v16 = 10;
            CFRelease(v21);
          }
        }
        else
        {
          uint64_t *v16 = 10;
        }
        uint64_t *v16 = 10;
        goto LABEL_43;
      }
LABEL_16:
      unint64_t v18 = @"forceVacuum";
      if (a2) {
        unint64_t v18 = @"forceWalCheckpoint";
      }
      _NSCoreDataLog(4, @"PostSaveMaintenance: %@ override", v8, v9, v10, v11, v12, v13, (uint64_t)v18);
      if (*(void *)(a1 + 296) == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_46:
        _NSCoreDataLog(4, @"PostSaveMaintenance: wal_checkpoint(TRUNCATE) ", v8, v9, v10, v11, v12, v13, v33);
        if (-[NSSQLiteConnection _walCheckpoint](a1) - 5 <= 1 && *(void *)(a1 + 8))
        {
          -[NSSQLiteConnection scheduleWALCheckpointAfter:retry:](a1, 1, 0.1);
        }
        return;
      }
      uint64_t v16 = (uint64_t *)(a1 + 296);
      *(void *)(a1 + 296) = 0;
      int v14 = 1;
      goto LABEL_20;
    }
  }
}

- (id)_setSaveRequest:(id *)result
{
  if (result)
  {
    uint64_t v3 = result;

    uint64_t result = a2;
    v3[24] = result;
  }
  return result;
}

- (uint64_t)_clearSaveGeneratedCachedStatements
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    int v2 = *(NSObject **)(result + 8);
    if (v2) {
      dispatch_assert_queue_V2(v2);
    }
    uint64_t result = -[NSSQLiteConnection _countOfVMCachedStatements](v1);
    uint64_t v3 = *(void **)(v1 + 200);
    if (v3)
    {
      long long v9 = 0u;
      long long v10 = 0u;
      long long v7 = 0u;
      long long v8 = 0u;
      uint64_t result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (result)
      {
        uint64_t v4 = result;
        uint64_t v5 = *(void *)v8;
        do
        {
          uint64_t v6 = 0;
          do
          {
            if (*(void *)v8 != v5) {
              objc_enumerationMutation(v3);
            }
            -[NSSQLiteStatementCache _clearSaveGeneratedCachedStatements]([*(id *)(v1 + 200) objectForKey:*(void *)(*((void *)&v7 + 1) + 8 * v6++)]);
          }
          while (v4 != v6);
          uint64_t result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
          uint64_t v4 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (uint64_t)_countOfVMCachedStatements
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 152);
  if (!v2) {
    return 0;
  }
  unint64_t Count = CFDictionaryGetCount(v2);
  unint64_t v4 = Count;
  if (Count <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = Count;
  }
  if (Count >= 0x201) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v5;
  }
  long long v7 = (const void **)((char *)v14 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (Count >= 0x201)
  {
    long long v7 = (const void **)NSAllocateScannedUncollectable();
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 152), v7, 0);
  }
  else
  {
    bzero((char *)v14 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v5);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 152), v7, 0);
    if (!v4) {
      return 0;
    }
  }
  uint64_t v9 = 0;
  uint64_t v8 = 0;
  do
  {
    long long v10 = v7[v9];
    CFDictionaryRef Value = (id *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 152), v10);
    if (Value && (id WeakRetained = objc_loadWeakRetained(Value + 1)) != 0)
    {
      ++v8;
    }
    else
    {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 152), v10);
    }
    ++v9;
  }
  while (v4 != v9);
  if (v4 >= 0x201) {
    NSZoneFree(0, v7);
  }
  return v8;
}

- (uint64_t)insertRow:(uint64_t)result
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v62 = result;
    uint64_t v3 = *(NSObject **)(result + 8);
    if (v3) {
      dispatch_assert_queue_V2(v3);
    }
    if (!a2 || (*(unsigned char *)(a2 + 16) & 1) != 0) {
      unint64_t v4 = 0;
    }
    else {
      unint64_t v4 = (const void *)[*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
    }
    uint64_t v5 = -[NSSQLiteConnection statementCacheForEntity:](v62, v4);
    sqlite3_int64 v60 = v5;
    if (v5
      && (insertStatementCache = v5->_insertStatementCache) != 0
      && (cachedSQLiteStatement = insertStatementCache->_cachedSQLiteStatement) != 0)
    {
      if (+[NSSQLCore debugDefault] >= 1)
      {
        int v7 = *(unsigned __int8 *)(v62 + 42);
        uint64_t v8 = [(NSSQLiteStatement *)insertStatementCache sqlString];
        if (v7) {
          uint64_t v15 = @"\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m";
        }
        else {
          uint64_t v15 = @"%@";
        }
        _NSCoreDataLog(6, (uint64_t)v15, v9, v10, v11, v12, v13, v14, v8);
      }
      *(void *)(v62 + 48) = insertStatementCache;
      uint64_t v16 = *(NSObject **)(v62 + 8);
      if (v16) {
        dispatch_assert_queue_V2(v16);
      }
      context = (void *)MEMORY[0x18C127630]();
      if (!a2 || (*(unsigned char *)(a2 + 16) & 1) != 0) {
        uint64_t v17 = 0;
      }
      else {
        uint64_t v17 = (void *)[*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
      }
      CFArrayRef v21 = (void *)[v17 foreignKeyColumns];
      uint64_t v22 = (void *)[v17 foreignEntityKeyColumns];
      id obj = (id)[v17 foreignOrderKeyColumns];
      id v63 = (id)[v17 attributeColumns];
      CFArrayRef v23 = (const __CFArray *)[*(id *)(v62 + 48) bindVariables];
      CFStringRef ValueAtIndex = (void *)CFArrayGetValueAtIndex(v23, 0);
      if (a2) {
        uint64_t v25 = [*(id *)(*(void *)(a2 + 40) + 16) _referenceData64];
      }
      else {
        uint64_t v25 = 0;
      }
      [ValueAtIndex setInt64:v25];
      uint64_t v26 = (void *)CFArrayGetValueAtIndex(v23, 1);
      if (a2 && (uint64_t v27 = [*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1]) != 0) {
        uint64_t v28 = *(unsigned int *)(v27 + 184);
      }
      else {
        uint64_t v28 = 0;
      }
      [v26 setUnsignedInt:v28];
      CFMutableArrayRef v29 = (void *)CFArrayGetValueAtIndex(v23, 2);
      if (a2) {
        uint64_t v30 = *(unsigned int *)(*(void *)(a2 + 40) + 12);
      }
      else {
        uint64_t v30 = 0;
      }
      [v29 setInt64:v30];
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      uint64_t v31 = [v21 countByEnumeratingWithState:&v77 objects:v84 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v78;
        unsigned int v33 = 3;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v78 != v32) {
              objc_enumerationMutation(v21);
            }
            uint64_t v35 = *(void **)(*((void *)&v77 + 1) + 8 * i);
            if ((objc_msgSend((id)objc_msgSend(v35, "toOneRelationship"), "isConstrained") & 1) == 0)
            {
              uint64_t v36 = -[NSSQLRow foreignKeyForSlot:](a2, [v35 slot]);
              objc_msgSend((id)CFArrayGetValueAtIndex(v23, v33++), "setInt64:", v36);
            }
          }
          uint64_t v31 = [v21 countByEnumeratingWithState:&v77 objects:v84 count:16];
        }
        while (v31);
      }
      else
      {
        unsigned int v33 = 3;
      }
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      uint64_t v37 = [v22 countByEnumeratingWithState:&v73 objects:v83 count:16];
      if (v37)
      {
        uint64_t v38 = *(void *)v74;
        do
        {
          uint64_t v39 = 0;
          unsigned int v40 = v33;
          do
          {
            if (*(void *)v74 != v38) {
              objc_enumerationMutation(v22);
            }
            unsigned int v41 = [*(id *)(*((void *)&v73 + 1) + 8 * v39) slot];
            if (a2) {
              uint64_t v42 = *(unsigned __int16 *)(a2
            }
                                        + _NSSQLRowInstanceSize
                                        + ((2 * *(_DWORD *)(a2 + 16)) & 0x1FFF8)
                                        + (((unint64_t)*(unsigned int *)(a2 + 16) >> 14) & 0xFFFC)
                                        + 2 * v41);
            else {
              uint64_t v42 = 0;
            }
            objc_msgSend((id)CFArrayGetValueAtIndex(v23, v33 + v39++), "setUnsignedInt:", v42);
          }
          while (v37 != v39);
          uint64_t v43 = [v22 countByEnumeratingWithState:&v73 objects:v83 count:16];
          uint64_t v37 = v43;
          v33 += v39;
        }
        while (v43);
        unsigned int v33 = v40 + v39;
      }
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      uint64_t v44 = [obj countByEnumeratingWithState:&v69 objects:v82 count:16];
      if (v44)
      {
        uint64_t v45 = *(void *)v70;
        do
        {
          uint64_t v46 = 0;
          unsigned int v47 = v33;
          do
          {
            if (*(void *)v70 != v45) {
              objc_enumerationMutation(obj);
            }
            unsigned int v48 = [*(id *)(*((void *)&v69 + 1) + 8 * v46) slot];
            if (a2) {
              uint64_t v49 = *(unsigned int *)(a2 + _NSSQLRowInstanceSize + ((2 * *(_DWORD *)(a2 + 16)) & 0x1FFF8) + 4 * v48);
            }
            else {
              uint64_t v49 = 0;
            }
            objc_msgSend((id)CFArrayGetValueAtIndex(v23, v33 + v46++), "setUnsignedInt:", v49);
          }
          while (v44 != v46);
          uint64_t v50 = [obj countByEnumeratingWithState:&v69 objects:v82 count:16];
          uint64_t v44 = v50;
          v33 += v46;
        }
        while (v50);
        unsigned int v33 = v47 + v46;
      }
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      uint64_t v51 = [v63 countByEnumeratingWithState:&v65 objects:v81 count:16];
      if (v51)
      {
        uint64_t v52 = *(void *)v66;
        do
        {
          for (uint64_t j = 0; j != v51; ++j)
          {
            if (*(void *)v66 != v52) {
              objc_enumerationMutation(v63);
            }
            uint64_t v54 = *(void **)(*((void *)&v65 + 1) + 8 * j);
            if (([v54 isConstrained] & 1) == 0)
            {
              int v55 = (void *)[v54 attributeDescription];
              if (v55 && [v55 superCompositeAttribute])
              {
                uint64_t v56 = -[NSPropertyDescription _elementPath]((__CFString *)[v54 propertyDescription]);
                CFDateRef v57 = (CFDateRef)-[__CFDate valueForKeyPath:](-[NSSQLRow attributeValueForSlot:]((CFDateRef)a2, [v54 slot]), "valueForKeyPath:", v56);
              }
              else
              {
                CFDateRef v57 = -[NSSQLRow attributeValueForSlot:]((CFDateRef)a2, [v54 slot]);
              }
              objc_msgSend((id)CFArrayGetValueAtIndex(v23, v33++), "setValue:", v57);
            }
          }
          uint64_t v51 = [v63 countByEnumeratingWithState:&v65 objects:v81 count:16];
        }
        while (v51);
      }
      uint64_t v18 = v62;
      *(void *)(v62 + 80) = cachedSQLiteStatement;
      id v58 = *(id *)(v62 + 48);
    }
    else
    {
      uint64_t v18 = v62;
      CFMutableArrayRef v19 = v5;
      CFArrayRef v20 = (void *)-[NSSQLiteAdapter newInsertStatementWithRow:]((void *)[(id)v62 adapter], a2);
      -[NSSQLiteConnection prepareSQLStatement:](v62, v20);
      -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:](*(sqlite3_stmt **)(v18 + 48), *(sqlite3_stmt **)(v18 + 80), v18);
      -[NSSQLiteStatementCache cacheInsertStatement:](v19, *(void **)(v62 + 48));

      -[NSSQLiteConnection addVMCachedStatement:](v18, *(const void **)(v18 + 48));
    }
    [(id)v18 execute];
    if (!*(void *)(v18 + 80)) {
      -[NSSQLiteStatementCache cacheInsertStatement:](v60, 0);
    }
    -[NSSQLiteConnection _clearBindVariablesForInsertedRow](v18);
    -[NSSQLiteConnection resetSQLStatement](v18);
    uint64_t result = *(void *)(v18 + 72);
    if (result) {
      uint64_t result = sqlite3_changes((sqlite3 *)result);
    }
    *(_DWORD *)(v18 + 88) = result;
  }
  return result;
}

- (uint64_t)updateConstrainedValuesForRow:(uint64_t)result
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    unint64_t v4 = *(NSObject **)(result + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    if (!a2 || (*(unsigned char *)(a2 + 16) & 1) != 0) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = (const void *)[*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
    }
    uint64_t v68 = [(id)a2 objectID];
    uint64_t v6 = *(NSObject **)(v3 + 8);
    if (v6) {
      dispatch_assert_queue_V2(v6);
    }
    CFDictionaryRef Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(v3 + 224), v5);
    key = (void *)v5;
    if (Value && (uint64_t v8 = Value, (v71 = *((void *)Value + 8)) != 0))
    {
      if (+[NSSQLCore debugDefault] >= 1)
      {
        int v9 = *(unsigned __int8 *)(v3 + 42);
        uint64_t v10 = [v8 sqlString];
        if (v9) {
          uint64_t v17 = @"\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m";
        }
        else {
          uint64_t v17 = @"%@";
        }
        _NSCoreDataLog(6, (uint64_t)v17, v11, v12, v13, v14, v15, v16, v10);
      }
      *(void *)(v3 + 48) = v8;
      uint64_t v18 = *(NSObject **)(v3 + 8);
      if (v18) {
        dispatch_assert_queue_V2(v18);
      }
      context = (void *)MEMORY[0x18C127630]();
      if (!a2 || (*(unsigned char *)(a2 + 16) & 1) != 0) {
        CFMutableArrayRef v19 = 0;
      }
      else {
        CFMutableArrayRef v19 = (void *)[*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
      }
      uint64_t v22 = (void *)[v19 attributeColumns];
      CFArrayRef v23 = (void *)[v19 foreignKeyColumns];
      uint64_t v69 = v3;
      CFArrayRef v24 = (const __CFArray *)[*(id *)(v3 + 48) bindVariables];
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      unsigned int v25 = 0;
      uint64_t v26 = [v23 countByEnumeratingWithState:&v77 objects:v85 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v78;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v78 != v27) {
              objc_enumerationMutation(v23);
            }
            CFMutableArrayRef v29 = *(void **)(*((void *)&v77 + 1) + 8 * i);
            if (objc_msgSend((id)objc_msgSend(v29, "toOneRelationship"), "isConstrained"))
            {
              CFStringRef ValueAtIndex = (void *)CFArrayGetValueAtIndex(v24, v25);
              objc_msgSend(ValueAtIndex, "setInt64:", -[NSSQLRow foreignKeyForSlot:](a2, objc_msgSend(v29, "slot")));
              ++v25;
            }
          }
          uint64_t v26 = [v23 countByEnumeratingWithState:&v77 objects:v85 count:16];
        }
        while (v26);
      }
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      uint64_t v31 = [v22 countByEnumeratingWithState:&v73 objects:v84 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v74;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v74 != v32) {
              objc_enumerationMutation(v22);
            }
            uint64_t v34 = *(void **)(*((void *)&v73 + 1) + 8 * j);
            if ([v34 isConstrained])
            {
              CFDateRef v35 = -[NSSQLRow attributeValueForSlot:]((CFDateRef)a2, [v34 slot]);
              objc_msgSend((id)CFArrayGetValueAtIndex(v24, v25++), "setValue:", v35);
            }
          }
          uint64_t v31 = [v22 countByEnumeratingWithState:&v73 objects:v84 count:16];
        }
        while (v31);
      }
      uint64_t v36 = (void *)CFArrayGetValueAtIndex(v24, v25);
      if (a2) {
        uint64_t v37 = [*(id *)(*(void *)(a2 + 40) + 16) _referenceData64];
      }
      else {
        uint64_t v37 = 0;
      }
      [v36 setInt64:v37];
      uint64_t v3 = v69;
      *(void *)(v69 + 80) = v71;
      id v38 = *(id *)(v69 + 48);
    }
    else
    {
      CFArrayRef v20 = (void *)v5;
      CFArrayRef v21 = (void *)-[NSSQLiteAdapter newConstrainedValuesUpdateStatementWithRow:]((void *)[(id)v3 adapter], a2);
      -[NSSQLiteConnection prepareSQLStatement:](v3, v21);
      -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:](*(sqlite3_stmt **)(v3 + 48), *(sqlite3_stmt **)(v3 + 80), v3);
      -[NSSQLiteConnection cacheUpdateConstrainedValuesStatement:forEntity:](v3, *(void **)(v3 + 48), v20);

      -[NSSQLiteConnection addVMCachedStatement:](v3, *(const void **)(v3 + 48));
    }
    [(id)v3 execute];
    uint64_t v39 = key;
    if (!*(void *)(v3 + 80)) {
      -[NSSQLiteConnection cacheUpdateConstrainedValuesStatement:forEntity:](v3, 0, key);
    }
    unsigned int v40 = *(NSObject **)(v3 + 8);
    if (v40) {
      dispatch_assert_queue_V2(v40);
    }
    unsigned int v41 = objc_msgSend(*(id *)(v3 + 48), "entity", v39);
    uint64_t v42 = v3;
    CFArrayRef v43 = (const __CFArray *)[*(id *)(v3 + 48) bindVariables];
    uint64_t v44 = (void *)[v41 foreignKeyColumns];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    unsigned int v45 = 0;
    uint64_t v46 = [v44 countByEnumeratingWithState:&v77 objects:v85 count:16];
    if (v46)
    {
      uint64_t v47 = *(void *)v78;
      do
      {
        for (uint64_t k = 0; k != v46; ++k)
        {
          if (*(void *)v78 != v47) {
            objc_enumerationMutation(v44);
          }
          if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v77 + 1) + 8 * k), "toOneRelationship"), "isConstrained"))objc_msgSend((id)CFArrayGetValueAtIndex(v43, v45++), "setInt64:", 0); {
        }
          }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v77 objects:v85 count:16];
      }
      while (v46);
    }
    uint64_t v49 = (void *)[v41 attributeColumns];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v73 objects:v84 count:16];
    if (v50)
    {
      uint64_t v51 = *(void *)v74;
      do
      {
        for (uint64_t m = 0; m != v50; ++m)
        {
          if (*(void *)v74 != v51) {
            objc_enumerationMutation(v49);
          }
          if ([*(id *)(*((void *)&v73 + 1) + 8 * m) isConstrained]) {
            objc_msgSend((id)CFArrayGetValueAtIndex(v43, v45++), "setValue:", 0);
          }
        }
        uint64_t v50 = [v49 countByEnumeratingWithState:&v73 objects:v84 count:16];
      }
      while (v50);
    }
    objc_msgSend((id)CFArrayGetValueAtIndex(v43, v45), "setInt64:", 0);
    -[NSSQLiteConnection resetSQLStatement](v42);
    uint64_t v53 = *(sqlite3 **)(v42 + 72);
    if (v53)
    {
      uint64_t result = sqlite3_changes(v53);
      *(_DWORD *)(v42 + 88) = result;
      if (result == 1) {
        return result;
      }
    }
    else
    {
      *(_DWORD *)(v42 + 88) = 0;
    }
    uint64_t v54 = objc_opt_class();
    if (+[NSSQLCore debugDefault] <= 1)
    {
      if (+[NSSQLCore debugDefault] >= 1) {
        _NSCoreDataLog(4, @"Optimistic locking failure for %@.  During updateConstrainedValuesForRow, rows processed = %d.  Row was updated.", v61, v62, v63, v64, v65, v66, v68);
      }
    }
    else
    {
      _NSCoreDataLog(4, @"Optimistic locking failure for %@.  During updateConstrainedValuesForRow, rows processed = %d.  New Row = %@", v55, v56, v57, v58, v59, v60, v68);
    }
    uint64_t v82 = @"_NSCoreDataOptimisticLockingFailureConflictsKey";
    uint64_t v81 = [(id)a2 objectID];
    uint64_t v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
    uint64_t v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    objc_exception_throw((id)[v54 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"optimistic locking failure" userInfo:v67]);
  }
  return result;
}

- (void)cacheUpdateConstrainedValuesStatement:(void *)key forEntity:
{
  uint64_t v6 = *(NSObject **)(a1 + 8);
  if (v6) {
    dispatch_assert_queue_V2(v6);
  }
  int v7 = *(__CFDictionary **)(a1 + 224);
  if (value)
  {
    CFDictionarySetValue(v7, key, value);
  }
  else
  {
    CFDictionaryRemoveValue(v7, key);
  }
}

- (int)registerCurrentQueryGenerationWithStore:(id)a3
{
  return -[NSSQLiteConnection registerCurrentQueryGenerationWithStore:retries:]((_PFSQLiteSnapshotWrapper *)self, (uint64_t)a3, 1);
}

BOOL __56__NSSQLiteConnection_freeQueryGenerationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 compare:*(void *)(a1 + 32)] == 0;
}

- (void)_performBlock:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = *(NSObject **)(a1 + 8);
    if (v3)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__NSSQLiteConnection__performBlock___block_invoke;
      block[3] = &unk_1E544DF48;
      block[4] = a2;
      dispatch_async(v3, block);
    }
    else
    {
      unint64_t v4 = (void *)MEMORY[0x18C127630]();
      (*(void (**)(uint64_t))(a2 + 16))(a2);
      id v5 = 0;
    }
  }
}

- (uint64_t)canConnect
{
  if (result)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 24))
    {
      *(void *)(result + 24) = (id)[*(id *)(result + 16) URL];
    }
    if (!*(void *)(v1 + 32)) {
      *(void *)(v1 + 32) = (id)[*(id *)(v1 + 24) path];
    }
    if (*(void *)(v1 + 72)) {
      return 1;
    }
    uint64_t v2 = *(void *)(v1 + 16);
    if (v2 && (*(unsigned char *)(v2 + 201) & 0x40) != 0)
    {
      return 1;
    }
    else
    {
      uint64_t v3 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v4 = *(void *)(v1 + 32);
      return [v3 fileExistsAtPath:v4];
    }
  }
  return result;
}

- (void)disconnect
{
  if (a1)
  {
    uint64_t v2 = *(NSObject **)(a1 + 8);
    if (v2) {
      dispatch_assert_queue_V2(v2);
    }
    uint64_t v36 = 0;
    [*(id *)(a1 + 328) removeAllObjects];
    uint64_t v3 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, @"CoreData: SQLite disconnection", &v36);
    -[NSSQLiteConnection _finalizeStatement](a1);
    if (*(unsigned char *)(a1 + 40)) {
      -[NSSQLiteConnection rollbackTransaction](a1);
    }
    -[NSSQLiteConnection _clearTransactionCaches](a1);
    -[NSSQLiteConnection _clearCachedStatements]((NSObject **)a1);
    if (!*(void *)(a1 + 72)) {
      goto LABEL_15;
    }
    if (+[NSSQLCore debugDefault]) {
      _NSCoreDataLog(4, @"Disconnecting from sqlite database.", v4, v5, v6, v7, v8, v9, v35);
    }
    if ([*(id *)(a1 + 16) _persistentStoreCoordinator]
      && !objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "options"), "objectForKey:", @"NSReadOnlyPersistentStoreOption"))
    {
      uint64_t v25 = *(void *)(a1 + 16);
      if (v25)
      {
        unint64_t v26 = atomic_load((unint64_t *)(v25 + 208));
        uint64_t v27 = *(sqlite3 **)(a1 + 72);
        if (v26)
        {
          uint64_t FileSizeFromJournalHandle = readFileSizeFromJournalHandle(v27);
          if (FileSizeFromJournalHandle >= 41943041)
          {
            _NSCoreDataLog(4, @"Marking -wal eligible for checkpointing in -disconnect due to its large size (%lld)", v29, v30, v31, v32, v33, v34, FileSizeFromJournalHandle);
            sqlite3_db_config(*(sqlite3 **)(a1 + 72), 1006, 0, 0);
          }
          goto LABEL_11;
        }
      }
      else
      {
        uint64_t v27 = *(sqlite3 **)(a1 + 72);
      }
      sqlite3_db_config(v27, 1006, 0, 0);
    }
LABEL_11:
    if (sqlite3_close_v2(*(sqlite3 **)(a1 + 72)))
    {
      uint64_t v10 = [NSString stringWithFormat:@"Disconnected from database with pending transactions: %@", objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_errmsg(*(sqlite3 **)(a1 + 72)))];
      _NSCoreDataLog(1, @"%@\n", v11, v12, v13, v14, v15, v16, v10);
      stmt = 0;
      while (1)
      {
        stmt = sqlite3_next_stmt(*(sqlite3 **)(a1 + 72), stmt);
        if (!stmt) {
          break;
        }
        uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"Un-finalized statement: %p", stmt);
        _NSCoreDataLog(1, @"%@\n", v19, v20, v21, v22, v23, v24, v18);
      }
    }
LABEL_15:

    *(void *)(a1 + 304) = 0;
    *(_DWORD *)(a1 + 312) &= ~2u;
    *(void *)(a1 + 72) = 0;
    *(void *)(a1 + 80) = 0;

    *(void *)(a1 + 24) = 0;
    *(void *)(a1 + 32) = 0;
    +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v36, v3);
  }
}

- (NSObject)_clearCachedStatements
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  uint64_t v2 = result[1];
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  CFDictionaryRef v3 = (const __CFDictionary *)v1[19];
  if (v3)
  {
    unint64_t Count = CFDictionaryGetCount(v3);
    unint64_t v5 = Count;
    if (Count <= 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = Count;
    }
    if (Count >= 0x201) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v6;
    }
    uint64_t v8 = (const void **)((char *)&v19 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (Count >= 0x201)
    {
      uint64_t v8 = (const void **)NSAllocateScannedUncollectable();
      CFDictionaryGetKeysAndValues((CFDictionaryRef)v1[19], v8, 0);
    }
    else
    {
      bzero((char *)&v19 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v6);
      CFDictionaryGetKeysAndValues((CFDictionaryRef)v1[19], v8, 0);
      if (!v5) {
        goto LABEL_23;
      }
    }
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = v8[v9];
      CFDictionaryRef Value = (id *)CFDictionaryGetValue((CFDictionaryRef)v1[19], v10);
      if (Value && (id WeakRetained = objc_loadWeakRetained(Value + 1)) != 0)
      {
        uint64_t v13 = WeakRetained;
        -[NSSQLiteStatement clearCaches:](WeakRetained, 0);
      }
      else
      {
        CFDictionaryRemoveValue((CFMutableDictionaryRef)v1[19], v10);
      }
      ++v9;
    }
    while (v5 != v9);
    if (v5 >= 0x201) {
      NSZoneFree(0, v8);
    }
  }
LABEL_23:
  uint64_t v14 = v1[25];
  if (v14)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v20 = 0u;
    long long v19 = 0u;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          -[NSSQLiteStatementCache clearCachedStatements]([v1[25] objectForKey:*(void *)(*((void *)&v19 + 1) + 8 * i)]);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }
  }
  return -[NSSQLiteConnection _clearOtherStatements](v1);
}

- (NSObject)_clearOtherStatements
{
  if (result)
  {
    uint64_t v1 = (sqlite3_stmt *)result;
    uint64_t v2 = result[1];
    if (v2) {
      dispatch_assert_queue_V2(v2);
    }
    CFDictionaryRef v3 = (sqlite3_stmt *)*((void *)v1 + 14);
    if (v3) {
      sqlite3_finalize(v3);
    }
    *((void *)v1 + 14) = 0;
    uint64_t result = (NSObject **)*((void *)v1 + 15);
    if (result) {
      uint64_t result = (NSObject **)sqlite3_finalize((sqlite3_stmt *)result);
    }
    *((void *)v1 + 15) = 0;
  }
  return result;
}

- (BOOL)databaseIsEmpty
{
  if (result)
  {
    uint64_t v1 = *(void **)(result + 32);
    memset(&v3.st_size, 0, 48);
    return stat((const char *)objc_msgSend(v1, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), &v3)|| v3.st_size == 0;
  }
  return result;
}

- (sqlite3_int64)fetchMaxPrimaryKeyForEntity:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v4 = *(NSObject **)(a1 + 8);
  if (v4) {
    dispatch_assert_queue_V2(v4);
  }
  if ([*(id *)(a1 + 368) objectForKey:@"NSPersistentStoreUbiquitousContentNameKey"])
  {
    id v5 = -[NSSQLiteConnection fetchTableNames]((id)a1);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          if (![*(id *)(*((void *)&v16 + 1) + 8 * v9) caseInsensitiveCompare:@"Y_UBRANGE"])
          {
            uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", a2, 0);
            uint64_t v12 = -[NSSQLiteConnection createMapOfEntityNameToPKMaxForEntities:](a1, v11);

            uint64_t v13 = objc_msgSend(v12, "objectForKey:", objc_msgSend(a2, "name"));
            if (v13) {
              sqlite3_int64 v14 = [v13 longLongValue];
            }
            else {
              sqlite3_int64 v14 = -[NSSQLiteConnection _fetchMaxPrimaryKeyForEntity:](a1, a2);
            }
            sqlite3_int64 v10 = v14;

            return v10;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  return -[NSSQLiteConnection _fetchMaxPrimaryKeyForEntity:](a1, a2);
}

- (sqlite3_int64)_fetchMaxPrimaryKeyForEntity:(uint64_t)a1
{
  uint64_t v4 = *(NSObject **)(a1 + 8);
  if (v4) {
    dispatch_assert_queue_V2(v4);
  }
  id v5 = (void *)[[NSString alloc] initWithFormat:@"SELECT MAX(%@) FROM %@", @"Z_PK", objc_msgSend(a2, "tableName")];
  if (+[NSSQLCore debugDefault] >= 1)
  {
    if (*(unsigned char *)(a1 + 42)) {
      uint64_t v12 = @"\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m";
    }
    else {
      uint64_t v12 = @"%@";
    }
    _NSCoreDataLog(6, (uint64_t)v12, v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  }
  ppStmt = 0;
  pzTail = 0;
  uint64_t v13 = (const char *)[v5 UTF8String];
  id v14 = v5;
  -[NSSQLiteConnection _ensureDatabaseOpen]((void *)a1);
  -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
  -[NSSQLiteConnection _ensureNoFetchInProgress](a1);
  int v15 = strlen(v13);
  uint64_t v16 = sqlite3_prepare_v2(*(sqlite3 **)(a1 + 72), v13, v15, &ppStmt, (const char **)&pzTail);
  if (v16)
  {
    unsigned int v17 = 0;
    int v18 = 1;
    while (v16 - 5 <= 1)
    {
      if (v17 >= 0xB) {
        useconds_t v19 = v17 + 1101;
      }
      else {
        useconds_t v19 = v18;
      }
      usleep(v19);
      int v20 = strlen(v13);
      uint64_t v16 = sqlite3_prepare_v2(*(sqlite3 **)(a1 + 72), v13, v20, &ppStmt, (const char **)&pzTail);
      v18 += 3;
      ++v17;
      if (!v16) {
        goto LABEL_15;
      }
    }
    uint64_t v30 = *(sqlite3 **)(a1 + 72);
    uint64_t v31 = v16;
    uint64_t v32 = [NSString stringWithUTF8String:sqlite3_errmsg(v30)];
    uint64_t v33 = *MEMORY[0x1E4F1C3B8];
    uint64_t v34 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v31), @"NSSQLiteErrorDomain");
    uint64_t v35 = v33;
    uint64_t v36 = (__CFString *)v32;
LABEL_28:
    id v38 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v35, 256, (uint64_t)v36, v34);
    objc_exception_throw(v38);
  }
LABEL_15:
  uint64_t v21 = ppStmt;
  if (ppStmt)
  {
    int v22 = sqlite3_step(ppStmt);
    if (v22 != 100)
    {
      LOBYTE(v23) = v22;
      unsigned int v24 = 0;
      int v25 = 1;
      while (v23 - 5 <= 1)
      {
        if (v24 >= 0xB) {
          useconds_t v26 = v24 + 1101;
        }
        else {
          useconds_t v26 = v25;
        }
        usleep(v26);
        int v23 = sqlite3_step(ppStmt);
        v25 += 3;
        ++v24;
        if (v23 == 100) {
          goto LABEL_23;
        }
      }
      uint64_t v37 = *MEMORY[0x1E4F1C3B8];
      uint64_t v34 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:"), @"NSSQLiteErrorDomain");
      uint64_t v36 = @"Fetching maximum primary key for entity failed";
      uint64_t v35 = v37;
      goto LABEL_28;
    }
LABEL_23:
    uint64_t v21 = ppStmt;
  }
  sqlite3_int64 v27 = sqlite3_column_int64(v21, 0);
  uint64_t v28 = sqlite3_finalize(ppStmt);
  ppStmt = 0;
  if (v28)
  {
    uint64_t v39 = v28;
    uint64_t v40 = [NSString stringWithUTF8String:sqlite3_errmsg(*(sqlite3 **)(a1 + 72))];
    uint64_t v41 = *MEMORY[0x1E4F1C3B8];
    uint64_t v34 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v39), @"NSSQLiteErrorDomain");
    uint64_t v35 = v41;
    uint64_t v36 = (__CFString *)v40;
    goto LABEL_28;
  }
  return v27;
}

void __36__NSSQLiteConnection__performBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x18C127630]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CFMutableArrayRef)copyRawIntegerRowsForSQL:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(NSObject **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    CFArrayCallBacks callBacks = *(CFArrayCallBacks *)byte_1ED787338;
    CFMutableArrayRef theArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &callBacks);
    context = (void *)MEMORY[0x18C127630]();
    ppStmt = 0;
    pzTail = 0;
    unsigned int v136 = 0;
    -[NSSQLiteConnection connect](a1);
    -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
    -[NSSQLiteConnection _ensureNoFetchInProgress](a1);
    double v5 = 0.0;
    double Current = 0.0;
    if (+[NSSQLCore debugDefault] >= 1)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (*(unsigned char *)(a1 + 42)) {
        uint64_t v13 = @"\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m";
      }
      else {
        uint64_t v13 = @"%@";
      }
      _NSCoreDataLog(6, (uint64_t)v13, v7, v8, v9, v10, v11, v12, (uint64_t)a2);
    }
    id v14 = (const char *)[a2 UTF8String];
    unsigned int v15 = 0;
    unsigned int v16 = 0;
    int v17 = 0;
    while (2)
    {
      int v18 = 3 * v16 - 29999;
LABEL_11:
      int v19 = strlen(v14);
      uint64_t v20 = sqlite3_prepare_v2(*(sqlite3 **)(a1 + 72), v14, v19, &ppStmt, (const char **)&pzTail);
      uint64_t v21 = v20;
      switch((char)v20)
      {
        case 0:
          if (*(void *)(a1 + 72))
          {
            if (+[NSPersistentStoreCoordinator _shouldDebugAllTaskAssertions]())
            {
              int v135 = 0;
              if (!sqlite3_file_control(*(sqlite3 **)(a1 + 72), 0, 103, &v135) && v135 >= 2)
              {
                self;
                uint64_t v24 = [NSString stringWithUTF8String:"A task assertion should be active when this database is locked"];
                _NSCoreDataLog(17, v24, v25, v26, v27, v28, v29, v30, v125);
                uint64_t v31 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl(&dword_18AB82000, v31, OS_LOG_TYPE_FAULT, "CoreData: A task assertion should be active when this database is locked", buf, 2u);
                }
              }
            }
          }
          int v32 = 0;
          int v132 = 0;
          int v33 = 0;
          int v34 = 0;
          uint64_t v35 = 0;
          uint64_t v36 = 0;
          while (2)
          {
            uint64_t v130 = v35;
            double v37 = 0.0;
LABEL_44:
            int v38 = 3 * v33 - 29999;
            while (2)
            {
              uint64_t v39 = sqlite3_step(ppStmt);
              uint64_t v21 = v39;
              if (v39 <= 0x63u)
              {
                switch((char)v39)
                {
                  case 5:
                    if (!v32) {
                      sqlite3_reset(ppStmt);
                    }
                    if (*(double *)(a1 + 232) > 0.0 && v37 == 0.0) {
                      double v37 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
                    }
                    if (v33 < 10001) {
                      goto LABEL_70;
                    }
                    if ((v33 - 10000) >= 0xB) {
                      useconds_t v40 = v33 - 8899;
                    }
                    else {
                      useconds_t v40 = v38;
                    }
                    goto LABEL_69;
                  case 6:
                    if (!v32) {
                      sqlite3_reset(ppStmt);
                    }
                    if (*(double *)(a1 + 232) > 0.0 && v37 == 0.0) {
                      double v37 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
                    }
                    goto LABEL_66;
                  case 7:
                  case 10:
                  case 17:
                  case 21:
                    goto LABEL_121;
                  case 8:
                  case 9:
                  case 12:
                  case 13:
                  case 15:
                  case 16:
                  case 18:
                  case 19:
                  case 20:
                  case 22:
                  case 23:
                  case 24:
                  case 25:
                    goto LABEL_131;
                  case 11:
                  case 26:
                    goto LABEL_127;
                  case 14:
                    if (v34 > 2) {
                      goto LABEL_121;
                    }
                    if (*(double *)(a1 + 232) > 0.0 && v37 == 0.0) {
                      double v37 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
                    }
                    ++v34;
LABEL_66:
                    if (v33 > 10) {
                      useconds_t v40 = v33 + 1101;
                    }
                    else {
                      useconds_t v40 = 3 * (v33 % 11) + 1;
                    }
LABEL_69:
                    usleep(v40);
LABEL_70:
                    if (v37 == 0.0 || (double v41 = CFAbsoluteTimeGetCurrent(), v41 <= v37))
                    {
                      v38 += 3;
                      ++v33;
                      continue;
                    }
                    if (v132 <= 7)
                    {
                      ++v33;
                      double v37 = v41 + *(double *)(a1 + 240);
                      ++v132;
                      goto LABEL_44;
                    }
                    uint64_t v116 = [NSString stringWithFormat:@"The database operation timed out after %.2f seconds.", v41 - v37 + *(double *)(a1 + 232)];
                    if (+[NSSQLCore debugDefault] >= 1)
                    {
                      if (*(unsigned char *)(a1 + 42)) {
                        uint64_t v123 = @"\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %@\x1B[0m";
                      }
                      else {
                        uint64_t v123 = @"(%d) %@";
                      }
                      uint64_t v126 = v116;
                      _NSCoreDataLog(1, (uint64_t)v123, v117, v118, v119, v120, v121, v122, v21);
                    }
                    if (theArray) {
                      CFRelease(theArray);
                    }
                    if (ppStmt) {
                      sqlite3_finalize(ppStmt);
                    }
                    uint64_t v115 = [NSString stringWithFormat:@"error during SQL execution : %@", v116, v126];
                    break;
                  default:
                    if (v39 != 1) {
                      goto LABEL_131;
                    }
LABEL_121:
                    int v84 = v39;
                    uint64_t v85 = [NSString stringWithUTF8String:sqlite3_errmsg(*(sqlite3 **)(a1 + 72))];
                    if (v84 == 10) {
                      sqlite3_file_control(*(sqlite3 **)(a1 + 72), 0, 4, &v136);
                    }
                    uint64_t v86 = *(void *)(a1 + 32);
                    if (v136) {
                      uint64_t v87 = [NSString stringWithFormat:@"I/O error for database at %@.  SQLite error code:%d, '%@' errno:%d", v86, v21, v85, v136];
                    }
                    else {
                      uint64_t v87 = [NSString stringWithFormat:@"I/O error for database at %@.  SQLite error code:%d, '%@'", v86, v21, v85, v127];
                    }
                    uint64_t v88 = (void *)v87;
                    if (v87)
                    {
                      int v133 = 0;
                      uint64_t v89 = 256;
                    }
                    else
                    {
LABEL_127:
                      uint64_t v88 = (void *)[NSString stringWithFormat:@"Fatal error.  The database at %@ is corrupted.  SQLite error code:%d, '%s'", *(void *)(a1 + 32), v21, sqlite3_errmsg(*(sqlite3 **)(a1 + 72))];
                      uint64_t v89 = (int)v21;
                      int v133 = @"NSSQLiteErrorDomain";
                    }
                    sqlite3_finalize(ppStmt);
                    ppStmt = 0;
                    -[NSSQLiteConnection _forceDisconnectOnError](a1);
                    if (!v88) {
                      goto LABEL_132;
                    }
                    int v96 = (const char *)[v88 UTF8String];
                    int v97 = 0;
                    goto LABEL_133;
                }
                goto LABEL_168;
              }
              break;
            }
            if (v39 == 100)
            {
              uint64_t v35 = v130;
              if (!v36)
              {
                uint64_t v35 = sqlite3_column_count(ppStmt);
                uint64_t v42 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
                if (!_PF_Private_Malloc_Zone) {
                  uint64_t v42 = malloc_default_zone();
                }
                uint64_t v36 = malloc_type_zone_malloc(v42, 8uLL, 0x100004000313F17uLL);
                void *v36 = (int)v35;
                CFArrayAppendValue(theArray, v36);
                int v32 = 1;
              }
              if ((int)v35 >= 1)
              {
                CFArrayRef v43 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
                if (!_PF_Private_Malloc_Zone) {
                  CFArrayRef v43 = malloc_default_zone();
                }
                uint64_t v44 = v35;
                uint64_t v131 = v35;
                uint64_t v36 = malloc_type_zone_malloc(v43, 8 * v35, 0x100004000313F17uLL);
                for (uint64_t i = 0; i != v44; ++i)
                  v36[i] = sqlite3_column_int64(ppStmt, i);
                CFArrayAppendValue(theArray, v36);
                uint64_t v35 = v131;
              }
              continue;
            }
            break;
          }
          if (v39 != 101)
          {
LABEL_131:
            int v133 = 0;
            uint64_t v89 = 0;
LABEL_132:
            int v96 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
            uint64_t v88 = 0;
            int v97 = 1;
LABEL_133:
            if (*(unsigned char *)(a1 + 42)) {
              unint64_t v98 = @"\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %s\x1B[0m";
            }
            else {
              unint64_t v98 = @"(%d) %s";
            }
            _NSCoreDataLog(1, (uint64_t)v98, v90, v91, v92, v93, v94, v95, v21);
            if (v97)
            {
              uint64_t v88 = objc_msgSend(NSString, "stringWithFormat:", @"error during execution of SQL string '%s' : %s", v14, v96);
              uint64_t v89 = 256;
            }
            if (theArray) {
              CFRelease(theArray);
            }
            if (ppStmt) {
              sqlite3_finalize(ppStmt);
            }
            uint64_t v99 = *MEMORY[0x1E4F1C3B8];
            sqlite3_int64 v100 = (void *)MEMORY[0x1E4F1C9E8];
            uint64_t v101 = *(void *)(a1 + 32);
            uint64_t v102 = *MEMORY[0x1E4F28328];
            uint64_t v103 = [NSNumber numberWithInt:v21];
            if (v136) {
              uint64_t v104 = objc_msgSend(NSNumber, "numberWithInteger:");
            }
            else {
              uint64_t v104 = 0;
            }
            long long v80 = objc_msgSend(v100, "dictionaryWithObjectsAndKeys:", v101, v102, v103, @"NSSQLiteErrorDomain", v104, *MEMORY[0x1E4F28798], 0, context);
            uint64_t v81 = v99;
            uint64_t v82 = v89;
            uint64_t v83 = (uint64_t)v88;
            goto LABEL_146;
          }
          CFMutableArrayRef v46 = theArray;
          if (!CFArrayGetCount(theArray))
          {
            uint64_t v47 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
            if (!_PF_Private_Malloc_Zone) {
              uint64_t v47 = malloc_default_zone();
            }
            unsigned int v48 = malloc_type_zone_malloc(v47, 8uLL, 0x100004000313F17uLL);
            *unsigned int v48 = 0;
            CFArrayAppendValue(theArray, v48);
          }
          if (+[NSSQLCore debugDefault] >= 1)
          {
            int v49 = *(unsigned __int8 *)(a1 + 42);
            double v56 = CFAbsoluteTimeGetCurrent() - Current;
            if (v49) {
              uint64_t v57 = @"sql execution time: \x1B[31m%.4f\x1B[0ms";
            }
            else {
              uint64_t v57 = @"sql execution time: %.4fs";
            }
            _NSCoreDataLog(4, (uint64_t)v57, v50, v51, v52, v53, v54, v55, *(uint64_t *)&v56);
          }
          sqlite3_finalize(ppStmt);
          return v46;
        case 1:
        case 7:
        case 10:
        case 17:
        case 21:
          goto LABEL_98;
        case 5:
          if (*(double *)(a1 + 232) > 0.0 && v5 == 0.0) {
            double v5 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
          }
          if (v16 < 0x2711) {
            goto LABEL_31;
          }
          if (v16 - 10000 >= 0xB) {
            useconds_t v22 = v16 - 8899;
          }
          else {
            useconds_t v22 = v18;
          }
          goto LABEL_30;
        case 6:
          if (*(double *)(a1 + 232) > 0.0 && v5 == 0.0) {
            double v5 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
          }
          goto LABEL_27;
        case 11:
        case 26:
          goto LABEL_104;
        case 14:
          if (v17 > 2)
          {
LABEL_98:
            int v59 = v20;
            uint64_t v60 = [NSString stringWithUTF8String:sqlite3_errmsg(*(sqlite3 **)(a1 + 72))];
            if (v59 == 10) {
              sqlite3_file_control(*(sqlite3 **)(a1 + 72), 0, 4, &v136);
            }
            uint64_t v61 = *(void *)(a1 + 32);
            if (v136) {
              uint64_t v62 = [NSString stringWithFormat:@"I/O error for database at %@.  SQLite error code:%d, '%@' errno:%d", v61, v21, v60, v136];
            }
            else {
              uint64_t v62 = [NSString stringWithFormat:@"I/O error for database at %@.  SQLite error code:%d, '%@'", v61, v21, v60, v127];
            }
            uint64_t v63 = (void *)v62;
            if (v62)
            {
              int v133 = 0;
              uint64_t v64 = 256;
            }
            else
            {
LABEL_104:
              uint64_t v63 = (void *)[NSString stringWithFormat:@"Fatal error.  The database at %@ is corrupted.  SQLite error code:%d, '%s'", *(void *)(a1 + 32), v21, sqlite3_errmsg(*(sqlite3 **)(a1 + 72))];
              uint64_t v64 = (int)v21;
              int v133 = @"NSSQLiteErrorDomain";
            }
            sqlite3_finalize(ppStmt);
            ppStmt = 0;
            -[NSSQLiteConnection _forceDisconnectOnError](a1);
            if (v63)
            {
              uint64_t v71 = (const char *)[v63 UTF8String];
              int v72 = 0;
            }
            else
            {
LABEL_107:
              uint64_t v71 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
              uint64_t v63 = 0;
              int v72 = 1;
            }
            if (*(unsigned char *)(a1 + 42)) {
              long long v73 = @"\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %s\x1B[0m";
            }
            else {
              long long v73 = @"(%d) %s";
            }
            _NSCoreDataLog(1, (uint64_t)v73, v65, v66, v67, v68, v69, v70, v21);
            if (v72)
            {
              uint64_t v63 = objc_msgSend(NSString, "stringWithFormat:", @"error during execution of SQL string '%s' : %s", v14, v71);
              uint64_t v64 = 256;
            }
            if (ppStmt) {
              sqlite3_finalize(ppStmt);
            }
            uint64_t v74 = *MEMORY[0x1E4F1C3B8];
            long long v75 = (void *)MEMORY[0x1E4F1C9E8];
            uint64_t v76 = *(void *)(a1 + 32);
            uint64_t v77 = *MEMORY[0x1E4F28328];
            uint64_t v78 = [NSNumber numberWithInt:v21];
            if (v136) {
              uint64_t v79 = objc_msgSend(NSNumber, "numberWithInteger:");
            }
            else {
              uint64_t v79 = 0;
            }
            long long v80 = objc_msgSend(v75, "dictionaryWithObjectsAndKeys:", v76, v77, v78, @"NSSQLiteErrorDomain", v79, *MEMORY[0x1E4F28798], 0, context);
            uint64_t v81 = v74;
            uint64_t v82 = v64;
            uint64_t v83 = (uint64_t)v63;
LABEL_146:
            id v105 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v81, v82, v83, v80);
            uint64_t v106 = v105;
            if (v133) {
              -[_NSCoreDataException _setDomain:]((uint64_t)v105, v133);
            }
            objc_exception_throw(v106);
          }
          if (*(double *)(a1 + 232) > 0.0 && v5 == 0.0) {
            double v5 = CFAbsoluteTimeGetCurrent() + *(double *)(a1 + 232);
          }
          ++v17;
LABEL_27:
          if (v16 <= 0xA) {
            useconds_t v22 = 3 * v16 + 1;
          }
          else {
            useconds_t v22 = v16 + 1101;
          }
LABEL_30:
          usleep(v22);
LABEL_31:
          if (v5 != 0.0)
          {
            double v23 = CFAbsoluteTimeGetCurrent();
            if (v23 > v5)
            {
              if (v15 <= 7)
              {
                ++v16;
                double v5 = v23 + *(double *)(a1 + 240);
                ++v15;
                continue;
              }
              uint64_t v107 = [NSString stringWithFormat:@"The database operation timed out after %.2f seconds.", v23 - v5 + *(double *)(a1 + 232)];
              if (+[NSSQLCore debugDefault] >= 1)
              {
                if (*(unsigned char *)(a1 + 42)) {
                  sqlite3_int64 v114 = @"\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m (%d) %@\x1B[0m";
                }
                else {
                  sqlite3_int64 v114 = @"(%d) %@";
                }
                uint64_t v126 = v107;
                _NSCoreDataLog(1, (uint64_t)v114, v108, v109, v110, v111, v112, v113, v21);
              }
              if (ppStmt) {
                sqlite3_finalize(ppStmt);
              }
              uint64_t v115 = [NSString stringWithFormat:@"error during SQL execution : %@", v107, v126];
LABEL_168:
              id v124 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134090, v115, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v21), @"NSSQLiteErrorDomain"));
              objc_exception_throw(v124);
            }
          }
          v18 += 3;
          ++v16;
          goto LABEL_11;
        default:
          int v133 = 0;
          uint64_t v64 = 0;
          goto LABEL_107;
      }
    }
  }
  return 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    self;
    objc_opt_class();
  }
}

- (void)dealloc
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__NSSQLiteConnection_dealloc__block_invoke;
  block[3] = &unk_1E544B868;
  block[4] = self;
  current_queue = dispatch_get_current_queue();
  if (dispatch_get_context(current_queue) == self) {
    __29__NSSQLiteConnection_dealloc__block_invoke((uint64_t)block);
  }
  else {
    dispatch_sync((dispatch_queue_t)self->_queue, block);
  }
  dispatch_release((dispatch_object_t)self->_queue);
  self->_queue = 0;
  v4.receiver = self;
  v4.super_class = (Class)NSSQLiteConnection;
  [(NSSQLiteConnection *)&v4 dealloc];
}

+ (uint64_t)readMagicWordFromPath:(void *)a3 options:
{
  self;
  id v14 = 0;
  memset(&v13, 0, sizeof(v13));
  int v5 = stat(a2, &v13);
  uint64_t MagicWordFromDBHandle = 0;
  if (v5) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v13.st_size == 0;
  }
  char v8 = v7;
  if (v5 != 2 && (v8 & 1) == 0)
  {
    if (!strncmp("/dev/null", a2, 9uLL))
    {
      return 0;
    }
    else
    {
      id v9 = +[NSSQLCore databaseKeyFromOptionsDictionary:]((uint64_t)NSSQLCore, a3);
      int v10 = +[NSSQLiteConnection openAtPath:withKey:handle:flags:module:checkpointOnClose:]((uint64_t)NSSQLiteConnection, a2, v9, &v14, 1, 0);
      uint64_t v11 = v14;
      if (v10 == 26)
      {
        uint64_t MagicWordFromDBHandle = 92;
        if (!v14) {
          return MagicWordFromDBHandle;
        }
        goto LABEL_19;
      }
      if (v14)
      {
        if (v10) {
          uint64_t MagicWordFromDBHandle = 92;
        }
        else {
          uint64_t MagicWordFromDBHandle = readMagicWordFromDBHandle(v14);
        }
LABEL_19:
        sqlite3_close_v2(v11);
        return MagicWordFromDBHandle;
      }
      return 0xFFFFFFFFLL;
    }
  }
  return MagicWordFromDBHandle;
}

void __29__NSSQLiteConnection_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x18C127630]();
  uint64_t v3 = *(void *)(a1 + 32);
  objc_super v4 = *(NSObject **)(v3 + 8);
  if (v4)
  {
    dispatch_assert_queue_V2(v4);
    uint64_t v3 = *(void *)(a1 + 32);
  }
  *(void *)(v3 + 16) = 0;

  *(void *)(*(void *)(a1 + 32) + 368) = 0;
  -[NSSQLiteConnection releaseSQLStatement](*(void *)(a1 + 32));

  *(void *)(*(void *)(a1 + 32) + 56) = 0;
  *(void *)(*(void *)(a1 + 32) + 64) = 0;
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 72)) {
    -[NSSQLiteConnection disconnect](v5);
  }
  for (uint64_t i = 0; i != 5; ++i)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8 * i + 248);
    if (v7)
    {
      for (uint64_t j = 0; j != 32; j += 8)
      {
        id v9 = *(void **)(v7 + j);
        if (v9)
        {
          if ((i & 0x7FFFFFFB) == 0) {

          }
          *(void *)(v7 + j) = 0;
        }
      }
      PF_FREE_OBJECT_ARRAY(*(void **)(*(void *)(a1 + 32) + 8 * i + 248));
      *(void *)(*(void *)(a1 + 32) + 8 * i + 248) = 0;
    }
  }
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 200);
  if (v11)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          -[NSSQLiteStatementCache clearCachedStatements]([*(id *)(*(void *)(a1 + 32) + 200) objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * v15++)]);
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }
    CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 200));
    uint64_t v10 = *(void *)(a1 + 32);
  }

  *(void *)(*(void *)(a1 + 32) + 208) = 0;
  *(void *)(*(void *)(a1 + 32) + 128) = 0;
  *(void *)(*(void *)(a1 + 32) + 136) = 0;
  *(void *)(*(void *)(a1 + 32) + 144) = 0;
  uint64_t v16 = *(void *)(a1 + 32);
  int v17 = *(const void **)(v16 + 152);
  if (v17)
  {
    CFRelease(v17);
    uint64_t v16 = *(void *)(a1 + 32);
  }
  *(void *)(v16 + 152) = 0;

  *(void *)(*(void *)(a1 + 32) + 160) = 0;
  *(void *)(*(void *)(a1 + 32) + 304) = 0;

  *(void *)(*(void *)(a1 + 32) + 216) = 0;
  *(void *)(*(void *)(a1 + 32) + 224) = 0;
  uint64_t v18 = *(void *)(a1 + 32);
  int v19 = *(const void **)(v18 + 288);
  if (v19)
  {
    CFRelease(v19);
    *(void *)(*(void *)(a1 + 32) + 288) = 0;
    uint64_t v18 = *(void *)(a1 + 32);
  }

  *(void *)(*(void *)(a1 + 32) + 176) = 0;
  *(void *)(*(void *)(a1 + 32) + 184) = 0;

  *(void *)(*(void *)(a1 + 32) + 168) = 0;
  *(void *)(*(void *)(a1 + 32) + 328) = 0;

  *(void *)(*(void *)(a1 + 32) + 336) = 0;
  *(void *)(*(void *)(a1 + 32) + 344) = 0;
  uint64_t v20 = *(void **)(*(void *)(a1 + 32) + 360);
  if (v20)
  {
    dispatch_block_cancel(v20);
    _Block_release(*(const void **)(*(void *)(a1 + 32) + 360));
    *(void *)(*(void *)(a1 + 32) + 360) = 0;
  }
}

- (uint64_t)registerCurrentQueryGenerationWithStore:(uint64_t)a3 retries:
{
  if (!a1) {
    return 0;
  }
  -[NSSQLiteConnection connect]((uint64_t)a1);
  if (-[NSSQLiteConnection _ensureWalFileExists]((uint64_t)a1) < 0) {
    return 14;
  }
  -[NSSQLiteConnection beginReadTransaction]((uint64_t)a1);
  id v10 = 0;
  uint64_t v6 = -[NSSQLiteConnection _currentQueryGenerationSnapshot:](a1, (uint64_t *)&v10);
  if (v6) {
    uint64_t v7 = -[NSSQLCore _registerNewQueryGenerationSnapshot:](a2, (uint64_t)v6);
  }
  else {
    uint64_t v7 = 0;
  }
  -[NSSQLiteConnection rollbackTransaction]((uint64_t)a1);
  if (!v6)
  {
    if (v10)
    {
      uint64_t v8 = [v10 code];
      if (a3)
      {
        if (v8 == 134181) {
          uint64_t v7 = -[NSSQLiteConnection registerCurrentQueryGenerationWithStore:retries:](a1, a2, 0);
        }
      }
    }
  }

  return v7;
}

- (_PFSQLiteSnapshotWrapper)_currentQueryGenerationSnapshot:(_PFSQLiteSnapshotWrapper *)result
{
  if (!result) {
    return result;
  }
  uint64_t v3 = (uint64_t)result;
  s = result->_s;
  if (s) {
    dispatch_assert_queue_V2(s);
  }
  uint64_t v5 = *(sqlite3 **)(v3 + 72);
  if (!v5) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"database connection must not be nil here" userInfo:0]);
  }
  ppSnapshot = 0;
  int v6 = sqlite3_snapshot_get(v5, "main", &ppSnapshot);
  BOOL v7 = v6 == 0;
  if (v6 != 517 && v6 != 0)
  {
    if (v6 != 5) {
      goto LABEL_18;
    }
    while (1)
    {
      usleep(0x64u);
      int v6 = sqlite3_snapshot_get(*(sqlite3 **)(v3 + 72), "main", &ppSnapshot);
      BOOL v7 = v6 == 0;
      if (v6 == 517 || v6 == 0) {
        break;
      }
      if (v6 != 5) {
        goto LABEL_18;
      }
    }
  }
  if (!v7)
  {
LABEL_18:
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NSSQLiteErrorDomain" code:v6 userInfo:0];
    goto LABEL_19;
  }
  uint64_t v9 = 0;
LABEL_19:
  if (+[NSSQLCore debugDefault] >= 1)
  {
    [MEMORY[0x1E4F1C9B8] dataWithBytes:ppSnapshot length:48];
    [MEMORY[0x1E4F29238] valueWithPointer:ppSnapshot];
    _NSCoreDataLog(4, @"connection %p created snapshot:\n\tss %@ value: \n\tpointer value:%@\n\tpointer: %p", v11, v12, v13, v14, v15, v16, v3);
  }
  if (readFileSizeFromJournalHandle(*(sqlite3 **)(v3 + 72)))
  {
    if (ppSnapshot)
    {
      uint64_t result = [_PFSQLiteSnapshotWrapper alloc];
      if (result)
      {
        int v17 = ppSnapshot;
        v19.receiver = result;
        v19.super_class = (Class)_PFSQLiteSnapshotWrapper;
        uint64_t result = (_PFSQLiteSnapshotWrapper *)[(_PFSQLiteSnapshotWrapper *)&v19 init];
        if (result)
        {
          result->_s = v17;
          result->_flags = 1;
        }
      }
    }
    else
    {
      uint64_t result = 0;
      if (a2 && v9)
      {
        uint64_t result = 0;
        *a2 = v9;
      }
    }
  }
  else
  {
    if (a2) {
      *a2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134181 userInfo:0];
    }
    sqlite3_snapshot_free(ppSnapshot);
    return 0;
  }
  return result;
}

- (uint64_t)deleteRow:(uint64_t)a3 forRequestContext:
{
  v51[2] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    int v6 = *(NSObject **)(result + 8);
    if (v6) {
      dispatch_assert_queue_V2(v6);
    }
    if (!a2 || (*(unsigned char *)(a2 + 16) & 1) != 0) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = (const void *)[*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
    }
    uint64_t v8 = [(id)a2 objectID];
    uint64_t v9 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:](a3, (const void *)[(id)a2 objectID]);
    if (a3) {
      id v10 = *(void **)(a3 + 32);
    }
    else {
      id v10 = 0;
    }
    uint64_t v11 = objc_msgSend(v10, "objectRegisteredForID:", objc_msgSend((id)a2, "objectID"));
    if (v11)
    {
      if (v9)
      {
        uint64_t v12 = v11;
        if ([v11 _versionReference])
        {
          if (*(_DWORD *)(*(void *)&v9[10]._os_unfair_lock_opaque + 12) != [v12 _versionReference])
          {
            if ((int)-[NSSQLStoreRequestContext debugLogLevel](a3) <= 1)
            {
              if ((int)-[NSSQLStoreRequestContext debugLogLevel](a3) >= 1) {
                _NSCoreDataLog(4, @"Optimistic locking failure for %@. During deleteRow. version match = %d", v41, v42, v43, v44, v45, v46, v8);
              }
            }
            else
            {
              _NSCoreDataLog(4, @"Optimistic locking failure for %@.  During deleteRow.  Original row = %@ New Row = %@ context version match = %d", v35, v36, v37, v38, v39, v40, v8);
            }
            uint64_t v47 = *MEMORY[0x1E4F1C3B8];
            uint64_t v49 = v8;
            v50[0] = @"_NSCoreDataOptimisticLockingFailureConflictsKey";
            uint64_t v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
            v50[1] = @"_NSCoreDataOptimisticLockingFailureMismatchWithObject";
            v51[0] = v48;
            v51[1] = &unk_1ED7E2AE8;
            objc_exception_throw(+[_NSCoreDataOptimisticLockingException exceptionWithName:reason:userInfo:](_NSCoreDataOptimisticLockingException, "exceptionWithName:reason:userInfo:", v47, @"optimistic locking failure", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2]));
          }
        }
      }
    }
    uint64_t v13 = -[NSSQLiteConnection statementCacheForEntity:](v5, v7);
    uint64_t v14 = v13;
    if (v13
      && (deletionStatementCache = v13->_deletionStatementCache) != 0
      && (cachedSQLiteStatement = deletionStatementCache->_cachedSQLiteStatement) != 0)
    {
      if (+[NSSQLCore debugDefault] >= 1)
      {
        int v17 = *(unsigned __int8 *)(v5 + 42);
        uint64_t v18 = [(NSSQLiteStatement *)deletionStatementCache sqlString];
        if (v17) {
          uint64_t v25 = @"\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m";
        }
        else {
          uint64_t v25 = @"%@";
        }
        _NSCoreDataLog(6, (uint64_t)v25, v19, v20, v21, v22, v23, v24, v18);
      }
      *(void *)(v5 + 48) = deletionStatementCache;
      uint64_t v26 = *(NSObject **)(v5 + 8);
      if (v26)
      {
        dispatch_assert_queue_V2(v26);
        deletionStatementCache = *(NSSQLiteStatement **)(v5 + 48);
      }
      id v27 = [(NSSQLiteStatement *)deletionStatementCache bindVariables];
      uint64_t v28 = (void *)[v27 objectAtIndex:0];
      if (a2) {
        uint64_t v29 = [*(id *)(*(void *)(a2 + 40) + 16) _referenceData64];
      }
      else {
        uint64_t v29 = 0;
      }
      [v28 setInt64:v29];
      uint64_t v30 = (void *)[v27 objectAtIndex:1];
      if (a2) {
        uint64_t v31 = *(unsigned int *)(*(void *)(a2 + 40) + 12);
      }
      else {
        uint64_t v31 = 0;
      }
      [v30 setInt64:v31];
      *(void *)(v5 + 80) = cachedSQLiteStatement;
      id v32 = *(id *)(v5 + 48);
    }
    else
    {
      int v33 = (void *)-[NSSQLiteAdapter newDeleteStatementWithRow:]((void *)[(id)v5 adapter], a2);
      -[NSSQLiteConnection prepareSQLStatement:](v5, v33);
      -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:](*(sqlite3_stmt **)(v5 + 48), *(sqlite3_stmt **)(v5 + 80), v5);
      -[NSSQLiteStatementCache cacheDeletionStatement:](v14, *(void **)(v5 + 48));

      -[NSSQLiteConnection addVMCachedStatement:](v5, *(const void **)(v5 + 48));
    }
    [(id)v5 execute];
    if (!*(void *)(v5 + 80)) {
      -[NSSQLiteStatementCache cacheDeletionStatement:](v14, 0);
    }
    -[NSSQLiteConnection resetSQLStatement](v5);
    int v34 = *(sqlite3 **)(v5 + 72);
    if (v34) {
      LODWORD(v34) = sqlite3_changes(v34);
    }
    *(_DWORD *)(v5 + 88) = v34;
    return v34 == 1;
  }
  return result;
}

- (void)processDeleteRequest:(uint64_t)a1
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = a1;
    uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey"), "entityNamed:", @"CHANGE");
    uint64_t v4 = -[NSSQLEntity tempTableName](v3);
    if (-[NSSQLiteConnection _hasTableWithName:isTemp:](v2, v4, 1))
    {
      uint64_t v5 = -[NSSQLEntity tempTableName](v3);
      if (-[NSSQLiteConnection _tableHasRows:](v2, v5))
      {
        id v54 = (id)-[NSSQLiteConnection _insertTransactionStringsForRequestContext:](v2, a2);
        uint64_t v56 = -[NSSQLiteConnection _insertTransactionForRequestContext:andStrings:](v2, a2, v54);
        int v6 = *(NSObject **)(v2 + 8);
        if (v6) {
          dispatch_assert_queue_V2(v6);
        }
        id v55 = objc_alloc_init(MEMORY[0x1E4F28B28]);
        uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey"), "entityNamed:", @"CHANGE");
        uint64_t v8 = -[NSSQLEntity tempTableName](v7);
        if (-[NSSQLiteConnection _tableHasRows:](v2, v8))
        {
          if (v7) {
            uint64_t v9 = [*(id *)(v7 + 40) objectForKey:@"ENTITY"];
          }
          else {
            uint64_t v9 = 0;
          }
          uint64_t v10 = *(void *)(v2 + 16);
          if (v10) {
            uint64_t v11 = (void *)[*(id *)(v10 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"];
          }
          else {
            uint64_t v11 = 0;
          }
          uint64_t v12 = &OBJC_METACLASS____PFEncodedString;
          uint64_t v60 = v2;
          if ([v11 count])
          {
            uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @"(");
            uint64_t v52 = (void *)v9;
            uint64_t v53 = v7;
            long long v75 = 0u;
            long long v76 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            uint64_t v14 = *(void *)(v2 + 16);
            if (v14)
            {
              id obj = (id)[*(id *)(v14 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"];
              uint64_t v15 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
            }
            else
            {
              id obj = 0;
              uint64_t v15 = [0 countByEnumeratingWithState:&v73 objects:v80 count:16];
            }
            uint64_t v16 = v15;
            if (v15)
            {
              int v17 = 0;
              uint64_t v18 = *(void *)v74;
              do
              {
                uint64_t v19 = 0;
                do
                {
                  if (*(void *)v74 != v18) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v20 = *(void *)(*((void *)&v73 + 1) + 8 * v19);
                  uint64_t v21 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "model"), "entityNamed:", v20);
                  if (!v21)
                  {
                    long long v71 = 0u;
                    long long v72 = 0u;
                    long long v69 = 0u;
                    long long v70 = 0u;
                    uint64_t v2 = v60;
                    uint64_t v23 = objc_msgSend((id)objc_msgSend(*(id *)(v60 + 16), "ancillarySQLModels"), "allValues");
                    uint64_t v24 = [v23 countByEnumeratingWithState:&v69 objects:v79 count:16];
                    if (!v24) {
                      goto LABEL_24;
                    }
                    uint64_t v25 = *(void *)v70;
LABEL_28:
                    uint64_t v26 = 0;
                    while (1)
                    {
                      if (*(void *)v70 != v25) {
                        objc_enumerationMutation(v23);
                      }
                      uint64_t v21 = [*(id *)(*((void *)&v69 + 1) + 8 * v26) entityNamed:v20];
                      if (v21) {
                        break;
                      }
                      if (v24 == ++v26)
                      {
                        uint64_t v24 = [v23 countByEnumeratingWithState:&v69 objects:v79 count:16];
                        if (v24) {
                          goto LABEL_28;
                        }
                        goto LABEL_23;
                      }
                    }
                  }
                  uint64_t v22 = *(unsigned int *)(v21 + 184);
                  if (v17) {
                    [v13 appendFormat:@","];
                  }
                  objc_msgSend(v13, "appendFormat:", @"%lld", v22);
                  ++v17;
LABEL_23:
                  uint64_t v2 = v60;
LABEL_24:
                  ++v19;
                }
                while (v19 != v16);
                uint64_t v27 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
                uint64_t v16 = v27;
              }
              while (v27);
            }
            [v13 appendFormat:@""]);
            uint64_t v7 = v53;
            uint64_t v12 = &OBJC_METACLASS____PFEncodedString;
            uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"DELETE FROM %@ WHERE %@ IN %@", -[NSSQLEntity tempTableName](v53), objc_msgSend(v52, "columnName"), v13];
            uint64_t v29 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v28];
            -[NSSQLiteConnection prepareAndExecuteSQLStatement:](v2, v29);
          }
          uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"UPDATE %@ SET Z%@ = %lld", -[NSSQLEntity tempTableName](v7), @"TRANSACTIONID", v56];
          uint64_t v31 = (void *)[objc_alloc(&v12[95]) initWithEntity:0 sqlString:v30];
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:](v2, v31);

          uint64_t v32 = -[NSSQLEntity tempTableName](v7);
          int v33 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"SELECT count(*) FROM "];
          [v33 appendString:v32];
          CFArrayRef v34 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](v2, v33);
          CFArrayRef v35 = v34;
          if (v34)
          {
            if (CFArrayGetCount(v34) >= 1 && *(void *)CFArrayGetValueAtIndex(v35, 0)) {
              uint64_t v36 = *(void *)CFArrayGetValueAtIndex(v35, 1);
            }
            else {
              LODWORD(v36) = -1;
            }
            unsigned int obja = v36;
            CFRelease(v35);
          }
          else
          {
            unsigned int obja = -1;
          }

          id v37 = objc_alloc(MEMORY[0x1E4F28E78]);
          if (v7) {
            uint64_t v38 = *(void **)(v7 + 136);
          }
          else {
            uint64_t v38 = 0;
          }
          uint64_t v39 = (void *)[v37 initWithFormat:@"%@", objc_msgSend(v38, "columnName")];
          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          uint64_t v40 = (void *)[(id)v7 attributeColumns];
          uint64_t v41 = [v40 countByEnumeratingWithState:&v65 objects:v78 count:16];
          if (v41)
          {
            uint64_t v42 = *(void *)v66;
            do
            {
              for (uint64_t i = 0; i != v41; ++i)
              {
                if (*(void *)v66 != v42) {
                  objc_enumerationMutation(v40);
                }
                [v39 appendFormat:@",%@", objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * i), "columnName")];
              }
              uint64_t v41 = [v40 countByEnumeratingWithState:&v65 objects:v78 count:16];
            }
            while (v41);
          }
          long long v63 = 0u;
          long long v64 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          uint64_t v44 = (void *)[(id)v7 foreignKeyColumns];
          uint64_t v45 = [v44 countByEnumeratingWithState:&v61 objects:v77 count:16];
          if (v45)
          {
            uint64_t v46 = *(void *)v62;
            do
            {
              for (uint64_t j = 0; j != v45; ++j)
              {
                if (*(void *)v62 != v46) {
                  objc_enumerationMutation(v44);
                }
                [v39 appendFormat:@",%@", objc_msgSend(*(id *)(*((void *)&v61 + 1) + 8 * j), "columnName")];
              }
              uint64_t v45 = [v44 countByEnumeratingWithState:&v61 objects:v77 count:16];
            }
            while (v45);
          }
          uint64_t v48 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"INSERT INTO %@ (%@) SELECT %@ FROM %@", objc_msgSend((id)v7, "tableName"), v39, v39, -[NSSQLEntity tempTableName](v7)];
          uint64_t v49 = (void *)[objc_alloc(&v12[95]) initWithEntity:0 sqlString:v48];
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:](v2, v49);

          -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](v2, v7, obja);
        }
        [v55 drain];
        id v50 = 0;
        uint64_t v51 = [NSNumber numberWithLongLong:v56];
        if (a2) {
          *(void *)(a2 + 72) = v51;
        }
      }
    }
  }
}

- (BOOL)_tableHasRows:(BOOL)result
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"SELECT count(*) FROM (SELECT 0 FROM %@ LIMIT 1)", a2];
    CFArrayRef v4 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](v2, v3);
    CFArrayRef v5 = v4;
    if (v4)
    {
      if (CFArrayGetCount(v4) >= 1 && *(void *)CFArrayGetValueAtIndex(v5, 0)) {
        uint64_t v6 = *(void *)CFArrayGetValueAtIndex(v5, 1);
      }
      else {
        uint64_t v6 = -1;
      }
      CFRelease(v5);
    }
    else
    {
      uint64_t v6 = -1;
    }

    return v6 > 0;
  }
  return result;
}

- (id)initAsQueryGenerationTrackingConnectionForSQLCore:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v3 = [(NSSQLiteConnection *)self initForSQLCore:a3];
  CFArrayRef v4 = v3;
  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__NSSQLiteConnection_initAsQueryGenerationTrackingConnectionForSQLCore___block_invoke;
    v6[3] = &unk_1E544B4A8;
    v6[4] = v3;
    v6[5] = &v7;
    -[NSSQLiteConnection performAndWait:]((uint64_t)v3, (uint64_t)v6);
    if (!*((unsigned char *)v8 + 24))
    {

      CFArrayRef v4 = 0;
    }
  }
  if (!*((unsigned char *)v8 + 24)) {
    CFArrayRef v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __72__NSSQLiteConnection_initAsQueryGenerationTrackingConnectionForSQLCore___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)(*(void *)(a1 + 32) + 312) |= 0x800u;
  *(void *)(*(void *)(a1 + 32) + 328) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v23 = 0;
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  -[NSSQLiteConnection connect](*(void *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    -[NSSQLiteConnection _hasTableWithName:isTemp:](v3, @"Z_METADATA", 0);
    uint64_t v3 = *(void *)(a1 + 32);
  }
  uint64_t v4 = -[NSSQLiteConnection _ensureWalFileExists](v3);
  uint64_t v11 = v4;
  if (v4 < 41943041)
  {
    if (v4 < 0)
    {
      id v21 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 14, @"failed to open journal file", 0);
      -[_NSCoreDataException _setDomain:]((uint64_t)v21, @"NSSQLiteErrorDomain");
      objc_exception_throw(v21);
    }
    uint64_t v12 = sqlite3_snapshot_recover(*(sqlite3 **)(*(void *)(a1 + 32) + 72), "main");
    if (v12) {
      BOOL v19 = v11 == 0;
    }
    else {
      BOOL v19 = 1;
    }
    if (!v19)
    {
      _NSCoreDataLog(1, @"sqlite3_snapshot_recover failed with %d", v13, v14, v15, v16, v17, v18, v12);
      goto LABEL_12;
    }
  }
  else
  {
    _NSCoreDataLog(2, @"Force checkpointing -wal while initializing query generations due to its large size (%lld)", v5, v6, v7, v8, v9, v10, v4);
    -[NSSQLiteConnection _performPostSaveTasks:andForceFullVacuum:](*(void *)(a1 + 32), 1, 0);
    -[NSSQLiteConnection _ensureWalFileExists](*(void *)(a1 + 32));
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 312) |= 0x200u;
LABEL_12:
  -[NSSQLiteConnection _executeSQLString:](*(void *)(a1 + 32), @"pragma cache_size = 10");
  -[NSSQLiteConnection beginReadTransaction](*(void *)(a1 + 32));
  uint64_t v20 = -[NSSQLiteConnection _currentQueryGenerationSnapshot:](*(_PFSQLiteSnapshotWrapper **)(a1 + 32), &v23);
  -[NSSQLiteConnection rollbackTransaction](*(void *)(a1 + 32));
  if (v20)
  {

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  [v2 drain];
  id v22 = 0;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    -[NSSQLiteConnection disconnect](*(void *)(a1 + 32));
  }
}

- (void)_forceDisconnectOnError
{
  if (a1)
  {
    id v2 = *(NSObject **)(a1 + 8);
    if (v2) {
      dispatch_assert_queue_V2(v2);
    }
    uint64_t v11 = 0;
    [*(id *)(a1 + 328) removeAllObjects];
    uint64_t v3 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, @"CoreData: SQLite disconnection (forced error)", &v11);
    *(unsigned char *)(a1 + 40) = 0;
    -[NSSQLiteConnection releaseSQLStatement](a1);
    -[NSSQLiteConnection _clearTransactionCaches](a1);
    -[NSSQLiteConnection _clearCachedStatements]((NSObject **)a1);
    if (*(void *)(a1 + 72))
    {
      if (+[NSSQLCore debugDefault]) {
        _NSCoreDataLog(4, @"Disconnecting from sqlite database due to an error.", v4, v5, v6, v7, v8, v9, v10);
      }
      sqlite3_close_v2(*(sqlite3 **)(a1 + 72));
    }

    *(void *)(a1 + 304) = 0;
    *(_DWORD *)(a1 + 312) &= ~2u;
    *(void *)(a1 + 72) = 0;
    *(void *)(a1 + 80) = 0;
    +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v11, v3);
  }
}

- (id)fetchTableNames
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    id v2 = *((void *)result + 1);
    if (v2) {
      dispatch_assert_queue_V2(v2);
    }
    uint64_t v3 = 0;
    char v4 = 0;
    for (int i = 3; (v4 & 1) == 0 && (i & 0x80000000) == 0; --i)
    {
      -[NSSQLiteConnection connect](v1);
      uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:8];
      uint64_t v6 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([(id)v1 adapter], @"SELECT TBL_NAME FROM SQLITE_MASTER WHERE TYPE = \"table\" ORDER BY TBL_NAME");
      uint64_t v7 = [[NSSQLColumn alloc] initWithColumnName:@"TBL_NAME" sqlType:6];
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v7, 0);
      -[NSSQLiteConnection prepareSQLStatement:](v1, v6);
      [(id)v1 execute];
      -[NSSQLiteConnection setColumnsToFetch:]((void *)v1, v8);
      while (1)
      {
        uint64_t v9 = -[NSSQLiteConnection newFetchedArray](v1);
        uint64_t v10 = v9;
        if (!v9) {
          break;
        }
        objc_msgSend(v5, "addObject:", objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 0), "uppercaseString"));
      }
      char v4 = 1;
      -[NSSQLiteConnection releaseSQLStatement](v1);
      -[NSSQLiteConnection setColumnsToFetch:]((void *)v1, 0);
      *(_DWORD *)(v1 + 312) &= ~2u;
      *(void *)(v1 + 92) = 0;
      *(void *)(v1 + 100) = 0;
      *(_DWORD *)(v1 + 108) = 0;

      uint64_t v3 = v5;
    }
    return v3;
  }
  return result;
}

- (void)createMapOfEntityNameToPKMaxForEntities:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a1 || ![a2 count]) {
    return 0;
  }
  id v3 = -[NSSQLiteConnection createMapOfEntityNameToPKMaxForEntitiesFromPKTable:](a1, a2);
  id v4 = -[NSSQLiteConnection createMapOfEntityNameToPKMaxForEntitiesFromUBRangeTable:](a1, a2);
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a2, "count"));
  uint64_t v6 = (void *)[objc_alloc(NSNumber) initWithInt:0];
  uint64_t v24 = (void *)v5;
  uint64_t v25 = v3;
  uint64_t v26 = v4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = a2;
  uint64_t v7 = [a2 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v7) {
    goto LABEL_27;
  }
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v29;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v29 != v9) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      uint64_t v12 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", -[NSSQLiteConnection _fetchMaxPrimaryKeyForEntity:](a1, v11));
      uint64_t v13 = objc_msgSend(v26, "objectForKey:", objc_msgSend(v11, "name"));
      uint64_t v14 = objc_msgSend(v25, "objectForKey:", objc_msgSend(v11, "name"));
      if (v13) {
        uint64_t v15 = (void *)v13;
      }
      else {
        uint64_t v15 = v6;
      }
      if (v14) {
        uint64_t v16 = (void *)v14;
      }
      else {
        uint64_t v16 = v6;
      }
      unint64_t v17 = [v12 compare:v15];
      if (v17 == -1) {
        uint64_t v18 = v15;
      }
      else {
        uint64_t v18 = v8;
      }
      if (v17 >= 2) {
        uint64_t v8 = v18;
      }
      else {
        uint64_t v8 = v12;
      }
      unint64_t v19 = [v8 compare:v16];
      if (v19 >= 2)
      {
        if (v19 != -1) {
          goto LABEL_25;
        }
        uint64_t v20 = [v11 name];
      }
      else
      {
        uint64_t v20 = [v11 name];
        uint64_t v16 = v8;
      }
      [v24 setObject:v16 forKey:v20];
LABEL_25:
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  }
  while (v7);
LABEL_27:
  id v21 = v24;

  return v21;
}

- (void)createTableForEntity:(void *)a1
{
  if (a1 && a2 && !a2[20])
  {
    id v3 = -[NSSQLiteAdapter newCreateTableStatementForEntity:]((__CFString *)[a1 adapter], a2);
    -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v3);
  }
}

- (void)createManyToManyTablesForEntity:(void *)a1
{
  if (a1)
  {
    id v4 = (void *)[a2 manyToManyRelationships];
    uint64_t v5 = [v4 count];
    if (v5)
    {
      uint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = (__CFString *)[v4 objectAtIndex:i];
        if (v8)
        {
          uint64_t v9 = v8;
          if (v8[2].isa)
          {
            if ((void *)[(__CFString *)v8 entity] == a2)
            {
              uint64_t v10 = -[NSSQLiteAdapter newCreateTableStatementForManyToMany:]((NSSQLiteStatement *)[a1 adapter], v9);
              -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v10);
            }
          }
        }
      }
    }
  }
}

- (uint64_t)_createIndexesForEntities:(void *)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(a2);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        -[NSSQLiteConnection createIndexesForEntity:](a1, v8);
        if (v8)
        {
          if (![*(id *)(v8 + 152) count]) {
            goto LABEL_10;
          }
          uint64_t v9 = *(void *)(v8 + 152);
LABEL_9:
          -[NSSQLiteConnection _createIndexesForEntities:](a1, v9);
          goto LABEL_10;
        }
        uint64_t v10 = [0 count];
        uint64_t v9 = 0;
        if (v10) {
          goto LABEL_9;
        }
LABEL_10:
        ++v7;
      }
      while (v5 != v7);
      uint64_t result = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

- (void)createIndexesForEntity:(void *)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    BOOL v4 = +[NSSQLCore debugDefault] > 0
      || +[NSMappingModel migrationDebugLevel] > 0;
    uint64_t v5 = [a1 adapter];
    if (v5) {
      id v6 = -[NSSQLiteAdapter newCreateIndexStatementsForEntity:defaultIndicesOnly:](v5, a2, 0);
    }
    else {
      id v6 = 0;
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v13 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v6);
          }
          uint64_t v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (v4) {
            _NSCoreDataLog(4, @"  Execute create index statement: %@", v7, v8, v9, v10, v11, v12, *(void *)(*((void *)&v17 + 1) + 8 * i));
          }
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v16);
        }
        uint64_t v13 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
  }
}

- (uint64_t)createTriggersForEntities:(uint64_t)result
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    id v2 = (void *)result;
    BOOL v3 = +[NSSQLCore debugDefault] > 0
      || +[NSMappingModel migrationDebugLevel] > 0;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t result = [a2 countByEnumeratingWithState:&v45 objects:v53 count:16];
    uint64_t v35 = result;
    if (result)
    {
      uint64_t v34 = *(void *)v46;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v46 != v34)
          {
            uint64_t v5 = v4;
            objc_enumerationMutation(a2);
            uint64_t v4 = v5;
          }
          uint64_t v36 = v4;
          id v6 = *(NSSQLEntity_DerivedAttributesExtension **)(*((void *)&v45 + 1) + 8 * v4);
          uint64_t v7 = -[NSSQLEntity derivedAttributesExtension](v6);
          uint64_t v8 = v7;
          if (!v7
            || (-[NSSQLEntity_DerivedAttributesExtension _generateTriggerSQL]((uint64_t)v7),
                (triggerSQL = v8->_triggerSQL) == 0))
          {
            long long v31 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v51 = @"entity";
            uint64_t v52 = [(NSSQLEntity_DerivedAttributesExtension *)v6 entityDescription];
            uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
            objc_exception_throw((id)[v31 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Unsupported derivedAttribute" userInfo:v32]);
          }
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          uint64_t v16 = [(NSMutableArray *)triggerSQL countByEnumeratingWithState:&v41 objects:v50 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v42;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v42 != v17) {
                  objc_enumerationMutation(triggerSQL);
                }
                long long v19 = *(void **)(*((void *)&v41 + 1) + 8 * i);
                if (v3) {
                  _NSCoreDataLog(4, @"  Execute DA trigger creation statement: %@", v10, v11, v12, v13, v14, v15, *(void *)(*((void *)&v41 + 1) + 8 * i));
                }
                -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v2, v19);
              }
              uint64_t v16 = [(NSMutableArray *)triggerSQL countByEnumeratingWithState:&v41 objects:v50 count:16];
            }
            while (v16);
          }
          id v20 = -[NSSQLiteAdapter newCreateTriggersForEntity:existingRtreeTables:]([v2 adapter], (id *)&v6->super.isa, 0);
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          uint64_t v27 = [v20 countByEnumeratingWithState:&v37 objects:v49 count:16];
          if (v27)
          {
            uint64_t v28 = *(void *)v38;
            do
            {
              for (uint64_t j = 0; j != v27; ++j)
              {
                if (*(void *)v38 != v28) {
                  objc_enumerationMutation(v20);
                }
                long long v30 = *(void **)(*((void *)&v37 + 1) + 8 * j);
                if (v3) {
                  _NSCoreDataLog(4, @"  Execute trigger creation statement: %@", v21, v22, v23, v24, v25, v26, *(void *)(*((void *)&v37 + 1) + 8 * j));
                }
                -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v2, v30);
              }
              uint64_t v27 = [v20 countByEnumeratingWithState:&v37 objects:v49 count:16];
            }
            while (v27);
          }

          uint64_t v4 = v36 + 1;
        }
        while (v36 + 1 != v35);
        uint64_t result = [a2 countByEnumeratingWithState:&v45 objects:v53 count:16];
        uint64_t v35 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)createTablesForEntities:(uint64_t)result
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    BOOL v3 = (void *)result;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v4 = [a2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(a2);
          }
          uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          -[NSSQLiteConnection createTableForEntity:](v3, v8);
          -[NSSQLiteConnection createManyToManyTablesForEntity:](v3, v8);
        }
        uint64_t v5 = [a2 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v5);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v9 = [a2 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(a2);
          }
          -[NSSQLiteConnection createIndexesForEntity:](v3, *(void *)(*((void *)&v13 + 1) + 8 * j));
        }
        uint64_t v10 = [a2 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }
      while (v10);
    }
    return -[NSSQLiteConnection createTriggersForEntities:]((uint64_t)v3, a2);
  }
  return result;
}

- (void)createMetadata
{
  id v2 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([a1 adapter], objc_msgSend(NSString, "stringWithFormat:", @"CREATE TABLE %@ (%@ INTEGER PRIMARY KEY, %@ VARCHAR(255), %@ BLOB)", @"Z_METADATA", @"Z_VERSION", @"Z_UUID", @"Z_PLIST"));
  -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v2);
}

- (void)createMissingHistoryTables
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = (void *)MEMORY[0x18C127630]();
    BOOL v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey");
    uint64_t v4 = v3;
    if (v3) {
      BOOL v3 = (void *)v3[3];
    }
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    if (v4) {
      uint64_t v4 = (void *)v4[4];
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ((-[NSSQLiteConnection _hasTableWithName:isTemp:](a1, objc_msgSend(v10, "tableName", (void)v11), 0) & 1) == 0) {
            [v5 addObject:v10];
          }
        }
        uint64_t v7 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    if (objc_msgSend(v5, "count", (void)v11)) {
      -[NSSQLiteConnection createTablesForEntities:](a1, v5);
    }
  }
}

+ (uint64_t)_replacePersistentStoreAtURL:(void *)a3 destinationOptions:(void *)a4 withPersistentStoreFromURL:(void *)a5 sourceOptions:(uint64_t *)a6 error:
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  self;
  long long v11 = (void *)[a4 path];
  long long v12 = (void *)[a2 path];
  long long v13 = (const char *)[v11 fileSystemRepresentation];
  uint64_t v14 = [v12 fileSystemRepresentation];
  if (+[_PFRoutines _isInMemoryStoreURL:]((uint64_t)_PFRoutines, a4))
  {
    if (a6)
    {
      long long v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F281F8];
      long long v17 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v18 = [a4 path];
      uint64_t v19 = objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v18, *MEMORY[0x1E4F28328], 0);
      long long v20 = v15;
      uint64_t v21 = v16;
      uint64_t v22 = 258;
LABEL_68:
      uint64_t v68 = [v20 errorWithDomain:v21 code:v22 userInfo:v19];
      uint64_t result = 0;
      *a6 = v68;
      return result;
    }
    return 0;
  }
  if (+[_PFRoutines _isInMemoryStoreURL:]((uint64_t)_PFRoutines, a2))
  {
    if (a6)
    {
      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F281F8];
      uint64_t v25 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v26 = [a2 path];
      uint64_t v19 = objc_msgSend(v25, "dictionaryWithObjectsAndKeys:", v26, *MEMORY[0x1E4F28328], 0);
      long long v20 = v23;
      uint64_t v21 = v24;
      uint64_t v22 = 514;
      goto LABEL_68;
    }
    return 0;
  }
  uint64_t v95 = (const char *)v14;
  uint64_t v27 = _NSSQLiteConnectionLockProxyValueFromPragmas(objc_msgSend(a5, "objectForKey:"));
  if (v27) {
    int v28 = 34;
  }
  else {
    int v28 = 2;
  }
  int v97 = a5;
  uint64_t v29 = objc_msgSend(a5, "valueForKey:");
  if (v29)
  {
    uint64_t v30 = v29;
    if ([(id)*MEMORY[0x1E4F28378] isEqualToString:v29])
    {
      v28 |= 0x400000u;
    }
    else if ([(id)*MEMORY[0x1E4F28358] isEqualToString:v30])
    {
      v28 |= 0x300000u;
    }
    else if ([(id)*MEMORY[0x1E4F28348] isEqualToString:v30])
    {
      v28 |= 0x200000u;
    }
    else if ([(id)*MEMORY[0x1E4F28340] isEqualToString:v30])
    {
      v28 |= 0x100000u;
    }
    else if ([(id)*MEMORY[0x1E4F28368] isEqualToString:v30])
    {
      v28 |= 0x700000u;
    }
    else
    {
      _NSCoreDataLog(1, @"Unrecognized value '%@' passed into options for NSPersistentStoreFileProtectionKey", v31, v32, v33, v34, v35, v36, v30);
    }
  }
  uint64_t v99 = 0;
  if (objc_msgSend((id)objc_msgSend(a4, "query"), "length"))
  {
    self;
    long long v13 = (const char *)objc_msgSend((id)objc_msgSend(a4, "absoluteString"), "fileSystemRepresentation");
  }
  id v37 = +[NSSQLCore databaseKeyFromOptionsDictionary:]((uint64_t)NSSQLCore, v97);
  int v38 = +[NSSQLiteConnection openAtPath:withKey:handle:flags:module:checkpointOnClose:]((uint64_t)NSSQLiteConnection, v13, v37, &v99, v28, 0);
  if (v38)
  {
    long long v39 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v40 = v38;
    uint64_t v41 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Failed to open source database", @"reason", v11, *MEMORY[0x1E4F28328], 0);
    long long v42 = v39;
LABEL_26:
    uint64_t v96 = [v42 errorWithDomain:@"NSSQLiteErrorDomain" code:v40 userInfo:v41];
    int v43 = 0;
    goto LABEL_32;
  }
  long long v44 = v99;
  sqlite3_busy_timeout(v99, 120000);
  if (v27)
  {
    if (([(__CFString *)v27 isEqualToString:@":auto:"] & 1) == 0)
    {
      int v45 = sqlite3_exec(v44, (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"pragma lock_proxy_file='%@'", v27), "UTF8String"], 0, 0, 0);
      if (v45)
      {
        LODWORD(v40) = v45;
        sqlite3_close_v2(v44);
        uint64_t v99 = 0;
        long long v46 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v40 = (int)v40;
        uint64_t v41 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Failed to set file locking on source database", @"reason", v27, @"lock_proxy_file", 0);
        long long v42 = v46;
        goto LABEL_26;
      }
    }
  }
  uint64_t v96 = 0;
  int v43 = 1;
LABEL_32:
  long long v47 = _NSSQLiteConnectionLockProxyValueFromPragmas((void *)[a3 objectForKey:@"NSSQLitePragmasOption"]);
  if (v47) {
    int v48 = 38;
  }
  else {
    int v48 = 6;
  }
  uint64_t v49 = [a3 valueForKey:@"NSPersistentStoreFileProtectionKey"];
  if (v49)
  {
    uint64_t v50 = v49;
    if ([(id)*MEMORY[0x1E4F28378] isEqualToString:v49])
    {
      v48 |= 0x400000u;
    }
    else if ([(id)*MEMORY[0x1E4F28358] isEqualToString:v50])
    {
      v48 |= 0x300000u;
    }
    else if ([(id)*MEMORY[0x1E4F28348] isEqualToString:v50])
    {
      v48 |= 0x200000u;
    }
    else if ([(id)*MEMORY[0x1E4F28340] isEqualToString:v50])
    {
      v48 |= 0x100000u;
    }
    else if ([(id)*MEMORY[0x1E4F28368] isEqualToString:v50])
    {
      v48 |= 0x700000u;
    }
    else
    {
      _NSCoreDataLog(1, @"Unrecognized value '%@' passed into options for NSPersistentStoreFileProtectionKey", v51, v52, v53, v54, v55, v56, v50);
    }
  }
  unint64_t v98 = 0;
  memset(&v101, 0, 512);
  memset(&v100, 0, 512);
  if (!v43)
  {
    uint64_t v59 = v96;
    goto LABEL_60;
  }
  if (statfs((const char *)[v11 UTF8String], &v101)
    || statfs((const char *)objc_msgSend((id)objc_msgSend(v12, "stringByDeletingLastPathComponent"), "UTF8String"), &v100)|| strcmp(v101.f_mntonname, v100.f_mntonname)|| (v101.f_flags & 0x1001) != 0x1000|| (uint64_t v57 = v99, objc_msgSend(v12, "UTF8String"), _sqlite3_db_clone()))
  {
    if (objc_msgSend((id)objc_msgSend(a2, "query"), "length"))
    {
      self;
      uint64_t v58 = (const char *)objc_msgSend((id)objc_msgSend(a2, "absoluteString"), "fileSystemRepresentation");
    }
    else
    {
      uint64_t v58 = v95;
    }
    id v60 = +[NSSQLCore databaseKeyFromOptionsDictionary:]((uint64_t)NSSQLCore, a3);
    int v61 = +[NSSQLiteConnection openAtPath:withKey:handle:flags:module:checkpointOnClose:]((uint64_t)NSSQLiteConnection, v58, v60, &v98, v48, 1);
    if (v61)
    {
      long long v62 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v63 = v61;
      uint64_t v64 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Failed to open destination database", @"reason", v12, *MEMORY[0x1E4F28328], 0);
      long long v65 = v62;
      uint64_t v66 = v63;
LABEL_59:
      uint64_t v59 = [v65 errorWithDomain:@"NSSQLiteErrorDomain" code:v66 userInfo:v64];
LABEL_60:
      if (v99) {
        sqlite3_close_v2(v99);
      }
      if (v98) {
        sqlite3_close_v2(v98);
      }
      if (a6)
      {
        if (v59)
        {
          uint64_t result = 0;
          *a6 = v59;
          return result;
        }
        long long v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v21 = *MEMORY[0x1E4F281F8];
        uint64_t v22 = 255;
        uint64_t v19 = 0;
        goto LABEL_68;
      }
      return 0;
    }
    long long v69 = v98;
    sqlite3_busy_timeout(v98, 120000);
    if (v47)
    {
      if (([(__CFString *)v47 isEqualToString:@":auto:"] & 1) == 0)
      {
        int v70 = sqlite3_exec(v69, (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"pragma lock_proxy_file='%@'", v47), "UTF8String"], 0, 0, 0);
        if (v70)
        {
          int v71 = v70;
          sqlite3_close_v2(v69);
          unint64_t v98 = 0;
          long long v72 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v64 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Failed to set file locking on destination database", @"reason", v47, @"lock_proxy_file", 0);
          long long v65 = v72;
          uint64_t v66 = v71;
          goto LABEL_59;
        }
      }
    }
    uint64_t v57 = v99;
    int v73 = sqlite3_file_control(v69, 0, 102, v99);
    if (v73)
    {
      uint64_t v74 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"NSSQLiteErrorDomain", v73, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Failed to replace destination database", @"reason", v12, *MEMORY[0x1E4F28328], v11, @"Source database Path", 0));
      char v75 = 0;
      long long v76 = v97;
      goto LABEL_77;
    }
  }
  else
  {
    long long v69 = 0;
  }
  char v75 = 1;
  long long v76 = v97;
  uint64_t v74 = v96;
LABEL_77:
  if (sqlite3_close_v2(v69))
  {
    uint64_t v77 = NSStringFromSelector(sel__replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_error_);
    _NSCoreDataLog(1, @"%@ failed to close destination database %@", v78, v79, v80, v81, v82, v83, (uint64_t)v77);
  }
  if (sqlite3_close_v2(v57))
  {
    int v84 = NSStringFromSelector(sel__replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_error_);
    _NSCoreDataLog(1, @"%@ failed to close source database %@", v85, v86, v87, v88, v89, v90, (uint64_t)v84);
  }
  if ((v75 & 1) == 0)
  {
    if (a6)
    {
      uint64_t result = 0;
      *a6 = v74;
      return result;
    }
    return 0;
  }
  uint64_t v91 = (void *)[v76 objectForKey:@"NSPersistentStoreUnlinkDestroyOption"];
  if (v91) {
    int v92 = [v91 BOOLValue] ^ 1;
  }
  else {
    int v92 = 1;
  }
  uint64_t v93 = (void *)[v76 objectForKey:@"NSPersistentStoreForceDestroyOption"];
  if (v93) {
    int v94 = [v93 BOOLValue] ^ 1;
  }
  else {
    int v94 = 1;
  }
  if (v92 & v94) {
    return 1;
  }
  else {
    return +[NSSQLiteConnection _destroyPersistentStoreAtURL:options:error:]((uint64_t)NSSQLiteConnection, a4, v76, a6);
  }
}

+ (uint64_t)_destroyPersistentStoreAtURL:(void *)a3 options:(uint64_t *)a4 error:
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v7 = (void *)[a2 path];
  uint64_t v8 = (const char *)[v7 fileSystemRepresentation];
  if (+[_PFRoutines _isInMemoryStoreURL:]((uint64_t)_PFRoutines, a2)) {
    return 1;
  }
  long long v11 = (const char *)objc_msgSend((id)objc_msgSend(v7, "stringByAppendingString:", @"-journal"), "fileSystemRepresentation");
  long long v12 = (const char *)objc_msgSend((id)objc_msgSend(v7, "stringByAppendingString:", @"-wal"), "fileSystemRepresentation");
  memset(&v106, 0, sizeof(v106));
  if (stat(v8, &v106)) {
    off_t st_size = *__error() != 2;
  }
  else {
    off_t st_size = v106.st_size;
  }
  memset(&v109, 0, 512);
  int v14 = statfs(v8, &v109);
  BOOL v15 = (v14 | v109.f_flags & 0x1000) == 0;
  statfs v100 = (char *)v11;
  if (stat(v11, &v106)) {
    off_t v16 = *__error() != 2;
  }
  else {
    off_t v16 = v106.st_size;
  }
  statfs v101 = (char *)v12;
  uint64_t v102 = a4;
  uint64_t v103 = a2;
  if (stat(v12, &v106)) {
    off_t v17 = *__error() != 2;
  }
  else {
    off_t v17 = v106.st_size;
  }
  int v105 = 0;
  uint64_t v18 = (void *)[a3 objectForKey:@"NSSQLitePragmasOption"];
  uint64_t v19 = v18;
  if (v18) {
    long long v20 = _NSSQLiteConnectionLockProxyValueFromPragmas(v18);
  }
  else {
    long long v20 = 0;
  }
  uint64_t v21 = (void *)[v19 objectForKey:@"journal_mode"];
  if (v21 == NSKeyValueCoding_NullValue) {
    uint64_t v21 = 0;
  }
  if (v20) {
    BOOL v15 = 0;
  }
  if (v15) {
    goto LABEL_24;
  }
  if (!v21)
  {
    if (!(_BYTE)dword_1EB270AB0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  if (objc_msgSend(@"wal", "isEqualToString:", objc_msgSend(v21, "lowercaseString"))) {
LABEL_23:
  }
    v105 |= 1u;
LABEL_24:
  if (!st_size && !v16 && !v17 && (v105 & 1) == 0) {
    return 1;
  }
  int v22 = 6;
  if (v19)
  {
    if (v20) {
      int v22 = 38;
    }
    else {
      int v22 = 6;
    }
    uint64_t v23 = (void *)[v19 objectForKey:@"page_size"];
    if (v23)
    {
      uint64_t v24 = (uint64_t)v23;
      HIDWORD(v31) = [v23 intValue];
      LODWORD(v31) = HIDWORD(v31) - 1024;
      switch((v31 >> 10))
      {
        case 0u:
          int v32 = v105 | 0x10;
          goto LABEL_40;
        case 1u:
          int v32 = v105 | 0x20;
          goto LABEL_40;
        case 3u:
          int v32 = v105 | 0x30;
          goto LABEL_40;
        case 7u:
          int v32 = v105 | 0x40;
LABEL_40:
          int v105 = v32;
          break;
        default:
          _NSCoreDataLog(5, @"ignoring unsupported page_size specified as truncate option: %@", v25, v26, v27, v28, v29, v30, v24);
          break;
      }
    }
    uint64_t v33 = (void *)[v19 objectForKey:@"auto_vacuum"];
    if (!v33)
    {
      int v37 = v105 | 0xC;
LABEL_54:
      int v105 = v37;
      goto LABEL_55;
    }
    uint64_t v34 = v33;
    if ([v33 isNSString])
    {
      uint64_t v35 = [v34 lowercaseString];
      if (([@"incremental" isEqualToString:v35] & 1) != 0
        || ([@"2" isEqualToString:v35] & 1) != 0)
      {
        unsigned int v36 = 2;
LABEL_53:
        int v37 = v105 | dword_18AE54410[v36];
        goto LABEL_54;
      }
      if (([@"full" isEqualToString:v35] & 1) != 0
        || ([@"1" isEqualToString:v35] & 1) != 0)
      {
        unsigned int v36 = 1;
        goto LABEL_53;
      }
      if (([@"off" isEqualToString:v35] & 1) != 0
        || ([@"0" isEqualToString:v35] & 1) != 0)
      {
        unsigned int v36 = 0;
        goto LABEL_53;
      }
    }
    else
    {
      unsigned int v36 = [v34 intValue];
      if (v36 <= 2) {
        goto LABEL_53;
      }
    }
    _NSCoreDataLog(5, @"unsupported auto_vacuum setting specified as truncate option: %@", v38, v39, v40, v41, v42, v43, (uint64_t)v34);
  }
LABEL_55:
  uint64_t v44 = [a3 valueForKey:@"NSPersistentStoreFileProtectionKey"];
  uint64_t v99 = v20;
  if (v44)
  {
    uint64_t v45 = v44;
    if ([(id)*MEMORY[0x1E4F28378] isEqualToString:v44])
    {
      long long v46 = v7;
      v22 |= 0x400000u;
    }
    else if ([(id)*MEMORY[0x1E4F28358] isEqualToString:v45])
    {
      long long v46 = v7;
      v22 |= 0x300000u;
    }
    else
    {
      long long v46 = v7;
      if ([(id)*MEMORY[0x1E4F28348] isEqualToString:v45])
      {
        v22 |= 0x200000u;
      }
      else if ([(id)*MEMORY[0x1E4F28340] isEqualToString:v45])
      {
        v22 |= 0x100000u;
      }
      else if ([(id)*MEMORY[0x1E4F28368] isEqualToString:v45])
      {
        v22 |= 0x700000u;
      }
      else
      {
        _NSCoreDataLog(1, @"Unrecognized value '%@' passed into options for NSPersistentStoreFileProtectionKey", v47, v48, v49, v50, v51, v52, v45);
      }
    }
  }
  else
  {
    long long v46 = v7;
  }
  uint64_t v104 = 0;
  if (objc_msgSend((id)objc_msgSend(v103, "query"), "length"))
  {
    self;
    uint64_t v8 = (const char *)objc_msgSend((id)objc_msgSend(v103, "absoluteString"), "fileSystemRepresentation");
  }
  int v53 = -6;
  do
  {
    id v54 = +[NSSQLCore databaseKeyFromOptionsDictionary:]((uint64_t)NSSQLCore, a3);
    int v55 = +[NSSQLiteConnection openAtPath:withKey:handle:flags:module:checkpointOnClose:]((uint64_t)NSSQLiteConnection, v8, v54, &v104, v22, 1);
    if (v55 != 14) {
      break;
    }
    if (v104)
    {
      sqlite3_close_v2(v104);
      uint64_t v104 = 0;
    }
    usleep(0x4E20u);
  }
  while (!__CFADD__(v53++, 1));
  uint64_t v57 = (void *)[a3 objectForKey:@"NSPersistentStoreForceDestroyOption"];
  if (v57) {
    int v58 = [v57 BOOLValue];
  }
  else {
    int v58 = 1;
  }
  int v59 = v15 | v58;
  id v60 = v104;
  int v61 = v46;
  if (!v55)
  {
    sqlite3_busy_timeout(v104, 120000);
    uint64_t v108 = 0;
    int v62 = sqlite3_file_control(v60, 0, 7, &v108);
    if (!v108 || v62)
    {
LABEL_105:
      if (v99 && ([(__CFString *)v99 isEqualToString:@":auto:"] & 1) == 0) {
        sqlite3_exec(v60, (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"pragma lock_proxy_file='%@'", v99), "UTF8String"], 0, 0, 0);
      }
      if (v59) {
        v105 |= 0x80u;
      }
      int v68 = -6;
      while (1)
      {
        int v69 = sqlite3_file_control(v60, 0, 101, &v105);
        if ((v69 & 0x7F) != 5)
        {
          int v55 = v69;
          if ((v69 & 0x7F) != 6) {
            goto LABEL_115;
          }
          usleep(0x4E20u);
        }
        int v55 = 5;
LABEL_115:
        if (v68)
        {
          ++v68;
          if (v55 == 5) {
            continue;
          }
        }
        goto LABEL_117;
      }
    }
    if (*(void *)v108)
    {
      int v63 = (*(uint64_t (**)(void))(*(void *)v108 + 16))();
      if (!v63)
      {
        if (v110[0] != 0x66206574694C5153 || *(void *)((char *)v110 + 7) != 0x332074616D726F66) {
          goto LABEL_105;
        }
        int v66 = v111 == 2 && v112 == 2;
LABEL_103:
        if (v66 == 1) {
          v105 |= 1u;
        }
        goto LABEL_105;
      }
    }
    else
    {
      int v63 = 1;
    }
    int v107 = 0;
    int v67 = sqlite3_file_control(v60, 0, 4, &v107);
    if (v107)
    {
      int v66 = -1;
    }
    else if (v63 == 522)
    {
      int v66 = 0;
    }
    else if (v67)
    {
      int v66 = v67;
    }
    else
    {
      int v66 = -1;
    }
    goto LABEL_103;
  }
LABEL_117:
  if (v60) {
    sqlite3_close_v2(v60);
  }
  int v70 = (void *)[a3 objectForKey:@"NSPersistentStoreUnlinkDestroyOption"];
  if (v70) {
    LODWORD(v70) = [v70 BOOLValue];
  }
  int v71 = v102;
  BOOL v9 = v55 == 0;
  if (v55) {
    int v72 = v59;
  }
  else {
    int v72 = 1;
  }
  if ((v15 | v70) != 1 || !v72)
  {
    if (!v55) {
      return v9;
    }
    long long v76 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v77 = @"NSSQLiteErrorDomain";
    uint64_t v78 = v55;
    uint64_t v79 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Failed to truncate database", @"reason", v61, *MEMORY[0x1E4F28328], 0);
    uint64_t v80 = v76;
    goto LABEL_157;
  }
  if ((unlink(v8) & 0x80000000) == 0)
  {
    int v73 = 0;
    uint64_t v74 = 0;
    char v75 = v100;
    goto LABEL_135;
  }
  char v75 = v100;
  if (*__error() == 2)
  {
    int v73 = 0;
  }
  else
  {
    int v73 = *__error();
    if (v73)
    {
      uint64_t v74 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28798], v73, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v46, *MEMORY[0x1E4F28328], 0));
      goto LABEL_135;
    }
  }
  uint64_t v74 = 0;
LABEL_135:
  if ((unlink(v75) & 0x80000000) == 0)
  {
    if (!v73) {
      goto LABEL_141;
    }
LABEL_137:
    if (!v74)
    {
      uint64_t v81 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v82 = *MEMORY[0x1E4F28798];
      uint64_t v83 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v84 = [NSString stringWithUTF8String:v75];
      uint64_t v85 = v83;
      int v71 = v102;
      uint64_t v74 = objc_msgSend(v81, "errorWithDomain:code:userInfo:", v82, v73, objc_msgSend(v85, "dictionaryWithObjectsAndKeys:", v84, *MEMORY[0x1E4F28328], 0));
    }
    goto LABEL_141;
  }
  if (*__error() == 2)
  {
    int v73 = 0;
    goto LABEL_141;
  }
  int v73 = *__error();
  if (v73) {
    goto LABEL_137;
  }
LABEL_141:
  if ((unlink(v101) & 0x80000000) == 0)
  {
    if (!v73) {
      goto LABEL_147;
    }
LABEL_143:
    if (!v74)
    {
      uint64_t v86 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v87 = *MEMORY[0x1E4F28798];
      uint64_t v88 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v89 = [NSString stringWithUTF8String:v101];
      uint64_t v74 = objc_msgSend(v86, "errorWithDomain:code:userInfo:", v87, v73, objc_msgSend(v88, "dictionaryWithObjectsAndKeys:", v89, *MEMORY[0x1E4F28328], 0));
    }
    goto LABEL_147;
  }
  if (*__error() == 2)
  {
    int v73 = 0;
    goto LABEL_147;
  }
  int v73 = *__error();
  if (v73) {
    goto LABEL_143;
  }
LABEL_147:
  uint64_t v90 = (const char *)objc_msgSend((id)objc_msgSend(v46, "stringByAppendingString:", @"-shm"), "fileSystemRepresentation");
  if ((unlink(v90) & 0x80000000) == 0)
  {
    if (!v73) {
      goto LABEL_153;
    }
LABEL_149:
    if (!v74)
    {
      uint64_t v91 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v92 = *MEMORY[0x1E4F28798];
      uint64_t v93 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v94 = [NSString stringWithUTF8String:v90];
      uint64_t v74 = objc_msgSend(v91, "errorWithDomain:code:userInfo:", v92, v73, objc_msgSend(v93, "dictionaryWithObjectsAndKeys:", v94, *MEMORY[0x1E4F28328], 0));
    }
    goto LABEL_153;
  }
  if (*__error() == 2)
  {
    int v73 = 0;
    goto LABEL_153;
  }
  int v73 = *__error();
  if (v73) {
    goto LABEL_149;
  }
LABEL_153:
  uint64_t v95 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v46, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(@".", "stringByAppendingString:", objc_msgSend(v103, "lastPathComponent")), "stringByAppendingString:", @"-conch")), "fileSystemRepresentation");
  if (unlink(v95) < 0)
  {
    if (*__error() == 2) {
      goto LABEL_158;
    }
    int v73 = *__error();
    if (!v73) {
      goto LABEL_158;
    }
  }
  else if (!v73)
  {
    goto LABEL_158;
  }
  if (!v74)
  {
    uint64_t v96 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v77 = (__CFString *)*MEMORY[0x1E4F28798];
    uint64_t v78 = v73;
    int v97 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v98 = [NSString stringWithUTF8String:v95];
    uint64_t v79 = objc_msgSend(v97, "dictionaryWithObjectsAndKeys:", v98, *MEMORY[0x1E4F28328], 0);
    uint64_t v80 = v96;
LABEL_157:
    uint64_t v74 = [v80 errorWithDomain:v77 code:v78 userInfo:v79];
  }
LABEL_158:
  if (v71 && v74) {
    uint64_t *v71 = v74;
  }
  return v9;
}

+ (BOOL)_rekeyPersistentStoreAtURL:(void *)a3 options:(void *)a4 withKey:(uint64_t *)a5 error:
{
  self;
  BOOL v9 = (const char *)objc_msgSend((id)objc_msgSend(a2, "path"), "fileSystemRepresentation");
  if (+[_PFRoutines _isInMemoryStoreURL:]((uint64_t)_PFRoutines, a2))
  {
    if (a5)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F281F8];
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"In-memory stores do not support rekeying", *MEMORY[0x1E4F28568], 0);
LABEL_14:
      uint64_t v17 = [v10 errorWithDomain:v11 code:134060 userInfo:v12];
      BOOL result = 0;
      *a5 = v17;
      return result;
    }
    return 0;
  }
  if (![a4 length])
  {
    if (a5)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F281F8];
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"New key value must not be empty", *MEMORY[0x1E4F28568], 0);
      goto LABEL_14;
    }
    return 0;
  }
  long long v13 = (void *)[a3 objectForKey:@"NSSQLitePragmasOption"];
  int v14 = 6;
  if (v13)
  {
    if (_NSSQLiteConnectionLockProxyValueFromPragmas(v13)) {
      int v14 = 38;
    }
    else {
      int v14 = 6;
    }
  }
  uint64_t v15 = [a3 valueForKey:@"NSPersistentStoreFileProtectionKey"];
  if (v15)
  {
    uint64_t v16 = v15;
    if ([(id)*MEMORY[0x1E4F28378] isEqualToString:v15])
    {
      v14 |= 0x400000u;
    }
    else if ([(id)*MEMORY[0x1E4F28358] isEqualToString:v16])
    {
      v14 |= 0x300000u;
    }
    else if ([(id)*MEMORY[0x1E4F28348] isEqualToString:v16])
    {
      v14 |= 0x200000u;
    }
    else if ([(id)*MEMORY[0x1E4F28340] isEqualToString:v16])
    {
      v14 |= 0x100000u;
    }
    else if ([(id)*MEMORY[0x1E4F28368] isEqualToString:v16])
    {
      v14 |= 0x700000u;
    }
    else
    {
      _NSCoreDataLog(1, @"Unrecognized value '%@' passed into options for NSPersistentStoreFileProtectionKey", v19, v20, v21, v22, v23, v24, v16);
    }
  }
  uint64_t v35 = 0;
  if (objc_msgSend((id)objc_msgSend(a2, "query"), "length"))
  {
    self;
    BOOL v9 = (const char *)objc_msgSend((id)objc_msgSend(a2, "absoluteString"), "fileSystemRepresentation");
  }
  id v25 = +[NSSQLCore databaseKeyFromOptionsDictionary:]((uint64_t)NSSQLCore, a3);
  int v26 = +[NSSQLiteConnection openAtPath:withKey:handle:flags:module:checkpointOnClose:]((uint64_t)NSSQLiteConnection, v9, v25, &v35, v14, 1);
  if (v26 == 14)
  {
    int v27 = -6;
    while (1)
    {
      uint64_t v28 = v35;
      if (v35)
      {
        uint64_t v29 = [NSString stringWithUTF8String:sqlite3_errmsg(v35)];
        sqlite3_close_v2(v28);
        uint64_t v35 = 0;
      }
      else
      {
        uint64_t v29 = [NSString stringWithUTF8String:sqlite3_errstr(14)];
      }
      usleep(0x4E20u);
      if (__CFADD__(v27++, 1)) {
        break;
      }
      id v31 = +[NSSQLCore databaseKeyFromOptionsDictionary:]((uint64_t)NSSQLCore, a3);
      int v32 = +[NSSQLiteConnection openAtPath:withKey:handle:flags:module:checkpointOnClose:]((uint64_t)NSSQLiteConnection, v9, v31, &v35, v14, 1);
      if (v32 != 14)
      {
        int v33 = v32;
        goto LABEL_36;
      }
    }
    uint64_t v34 = 0;
    int v33 = 14;
  }
  else
  {
    int v33 = v26;
    uint64_t v29 = 0;
LABEL_36:
    uint64_t v34 = v35;
    if (!v33)
    {
      [a4 bytes];
      [a4 length];
      int v33 = sqlite3_rekey_v2();
      if (v33) {
        uint64_t v29 = [NSString stringWithUTF8String:sqlite3_errmsg(v34)];
      }
    }
  }
  sqlite3_close_v2(v34);
  if (a5)
  {
    if (v33) {
      *a5 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134180, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v29, *MEMORY[0x1E4F28568], 0));
    }
  }
  return v33 == 0;
}

- (void)writeCorrelationInsertsFromTracker:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(NSObject **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    if (a2 && *(void *)(a2 + 16))
    {
      uint64_t v5 = *(__CFString **)(a2 + 8);
      uint64_t v6 = -[NSSQLiteConnection statementCacheForEntity:](a1, (const void *)[(__CFString *)v5 sourceEntity]);
      uint64_t v7 = (__CFDictionary *)v6;
      if (v6
        && (CFDictionaryRef correlationInsertCache = v6->_correlationInsertCache) != 0
        && (CFDictionaryRef Value = (NSSQLiteStatement *)CFDictionaryGetValue(correlationInsertCache, v5)) != 0
        && (uint64_t v10 = Value, (cachedSQLiteStatement = Value->_cachedSQLiteStatement) != 0))
      {
        int v12 = 0;
        *(void *)(a1 + 80) = cachedSQLiteStatement;
      }
      else
      {
        uint64_t v10 = -[NSSQLiteAdapter newCorrelationInsertStatementForRelationship:]((void *)[(id)a1 adapter], v5);
        -[NSSQLiteConnection prepareSQLStatement:](a1, v10);
        -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:]((sqlite3_stmt *)v10, *(sqlite3_stmt **)(a1 + 80), a1);
        -[NSSQLiteStatementCache cacheCorrelationInsertStatement:forRelationship:](v7, v10, v5);

        int v12 = 1;
      }
      uint64_t v20 = 0;
      uint64_t v21 = &v20;
      uint64_t v22 = 0x2020000000;
      char v23 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = &v14;
      uint64_t v16 = 0x3052000000;
      uint64_t v17 = __Block_byref_object_copy__29;
      uint64_t v18 = __Block_byref_object_dispose__29;
      uint64_t v19 = 0;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __57__NSSQLiteConnection_writeCorrelationInsertsFromTracker___block_invoke;
      v13[3] = &unk_1E544DF70;
      v13[4] = a1;
      v13[5] = &v20;
      v13[6] = &v14;
      -[NSSQLCorrelationTableUpdateTracker enumerateInsertsUsingBlock:](a2, (uint64_t)v13);
      if (v12) {
        -[NSSQLiteConnection addVMCachedStatement:](a1, v10);
      }
      if (*((unsigned char *)v21 + 24)) {
        objc_exception_throw((id)v15[5]);
      }
      -[NSSQLiteConnection resetSQLStatement](a1);
      _Block_object_dispose(&v14, 8);
      _Block_object_dispose(&v20, 8);
    }
  }
}

uint64_t __57__NSSQLiteConnection_writeCorrelationInsertsFromTracker___block_invoke(uint64_t a1, uint64_t a2, sqlite3_int64 a3, sqlite3_int64 a4, sqlite3_int64 a5)
{
  if (+[NSSQLCore debugDefault] >= 3) {
    _NSCoreDataLog(7, @"correlation bindings: %qu, %qu, %qu, %qu", v10, v11, v12, v13, v14, v15, a2);
  }
  return -[NSSQLiteConnection executeCorrelationChangesForValue1:value2:value3:value4:](*(void *)(a1 + 32), a2, a3, a4, a5);
}

- (uint64_t)executeCorrelationChangesForValue1:(sqlite3_int64)a3 value2:(sqlite3_int64)a4 value3:(sqlite3_int64)a5 value4:
{
  if (!result) {
    return result;
  }
  uint64_t v9 = result;
  uint64_t v10 = *(NSObject **)(result + 8);
  if (v10) {
    dispatch_assert_queue_V2(v10);
  }
  int v11 = *(_DWORD *)(v9 + 312);
  if ((v11 & 1) == 0)
  {
    uint64_t v12 = sqlite3_reset(*(sqlite3_stmt **)(v9 + 80));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(v9 + 80));
    int v11 = *(_DWORD *)(v9 + 312);
    if (v12)
    {
      *(_DWORD *)(v9 + 312) = v11 & 0xFFFFFFFD;
      -[NSSQLiteConnection releaseSQLStatement](v9);
      uint64_t v19 = [NSString stringWithUTF8String:sqlite3_errmsg(*(sqlite3 **)(v9 + 72))];
      uint64_t v20 = *MEMORY[0x1E4F1C3B8];
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v12), @"NSSQLiteErrorDomain");
      uint64_t v17 = v20;
      uint64_t v16 = (__CFString *)v19;
LABEL_16:
      id v18 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v17, 134180, (uint64_t)v16, v15);
      objc_exception_throw(v18);
    }
  }
  *(_DWORD *)(v9 + 312) = v11 & 0xFFFFFFFE;
  uint64_t v13 = sqlite3_bind_int64(*(sqlite3_stmt **)(v9 + 80), 1, a2);
  if (v13
    || (uint64_t v13 = sqlite3_bind_int64(*(sqlite3_stmt **)(v9 + 80), 2, a3), v13)
    || a4 && (uint64_t v13 = sqlite3_bind_int64(*(sqlite3_stmt **)(v9 + 80), 3, a4), v13)
    || a5 && (uint64_t v13 = sqlite3_bind_int64(*(sqlite3_stmt **)(v9 + 80), 4, a5), v13))
  {
    uint64_t v14 = *MEMORY[0x1E4F1C3B8];
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v13), @"NSSQLiteErrorDomain");
    uint64_t v16 = @"sqlite3_bind* failed";
    uint64_t v17 = v14;
    goto LABEL_16;
  }

  return _execute(v9);
}

- (void)writeCorrelationDeletesFromTracker:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(NSObject **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    if (a2 && *(void *)(a2 + 24))
    {
      uint64_t v5 = *(__CFString **)(a2 + 8);
      uint64_t v6 = -[NSSQLiteConnection statementCacheForEntity:](a1, (const void *)[(__CFString *)v5 sourceEntity]);
      uint64_t v7 = (__CFDictionary *)v6;
      if (v6
        && (CFDictionaryRef correlationDeleteCache = v6->_correlationDeleteCache) != 0
        && (CFDictionaryRef Value = (NSSQLiteStatement *)CFDictionaryGetValue(correlationDeleteCache, v5)) != 0
        && (uint64_t v10 = Value, (cachedSQLiteStatement = Value->_cachedSQLiteStatement) != 0))
      {
        int v12 = 0;
        *(void *)(a1 + 80) = cachedSQLiteStatement;
      }
      else
      {
        uint64_t v10 = -[NSSQLiteAdapter newCorrelationDeleteStatementForRelationship:]((void *)[(id)a1 adapter], v5);
        -[NSSQLiteConnection prepareSQLStatement:](a1, v10);
        -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:]((sqlite3_stmt *)v10, *(sqlite3_stmt **)(a1 + 80), a1);
        -[NSSQLiteStatementCache cacheCorrelationDeleteStatement:forRelationship:](v7, v10, v5);

        int v12 = 1;
      }
      uint64_t v20 = 0;
      uint64_t v21 = &v20;
      uint64_t v22 = 0x2020000000;
      char v23 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = &v14;
      uint64_t v16 = 0x3052000000;
      uint64_t v17 = __Block_byref_object_copy__29;
      id v18 = __Block_byref_object_dispose__29;
      uint64_t v19 = 0;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __57__NSSQLiteConnection_writeCorrelationDeletesFromTracker___block_invoke;
      v13[3] = &unk_1E544DF98;
      v13[4] = a1;
      v13[5] = &v20;
      v13[6] = &v14;
      -[NSSQLCorrelationTableUpdateTracker enumerateDeletesUsingBlock:](a2, (uint64_t)v13);
      if (v12) {
        -[NSSQLiteConnection addVMCachedStatement:](a1, v10);
      }
      if (*((unsigned char *)v21 + 24)) {
        objc_exception_throw((id)v15[5]);
      }
      -[NSSQLiteConnection resetSQLStatement](a1);
      _Block_object_dispose(&v14, 8);
      _Block_object_dispose(&v20, 8);
    }
  }
}

uint64_t __57__NSSQLiteConnection_writeCorrelationDeletesFromTracker___block_invoke(uint64_t a1, uint64_t a2, sqlite3_int64 a3)
{
  if (+[NSSQLCore debugDefault] >= 3) {
    _NSCoreDataLog(7, @"correlation bindings:  %qu, %qu", v6, v7, v8, v9, v10, v11, a2);
  }
  return -[NSSQLiteConnection executeCorrelationChangesForValue1:value2:value3:value4:](*(void *)(a1 + 32), a2, a3, 0, 0);
}

- (void)writeCorrelationMasterReordersFromTracker:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(NSObject **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    if (a2 && *(void *)(a2 + 32))
    {
      uint64_t v5 = *(__CFString **)(a2 + 8);
      uint64_t v6 = v5 ? (void *)[*(id *)(a2 + 8) propertyDescription] : 0;
      if ([v6 isOrdered])
      {
        uint64_t v7 = -[NSSQLiteConnection statementCacheForEntity:](a1, (const void *)[(__CFString *)v5 sourceEntity]);
        uint64_t v8 = v7;
        if (v7
          && (CFDictionaryRef correlationMasterReorderCache = v7->_correlationMasterReorderCache) != 0
          && (CFDictionaryRef Value = (NSSQLiteStatement *)CFDictionaryGetValue(correlationMasterReorderCache, v5)) != 0
          && (uint64_t v11 = Value, (cachedSQLiteStatement = Value->_cachedSQLiteStatement) != 0))
        {
          int v13 = 0;
          *(void *)(a1 + 80) = cachedSQLiteStatement;
        }
        else
        {
          uint64_t v11 = -[NSSQLiteAdapter newCorrelationMasterReorderStatementForRelationship:]((void *)[(id)a1 adapter], v5);
          -[NSSQLiteConnection prepareSQLStatement:](a1, v11);
          -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:]((sqlite3_stmt *)v11, *(sqlite3_stmt **)(a1 + 80), a1);
          -[NSSQLiteStatementCache cacheCorrelationMasterReorderStatement:forRelationship:]((__CFDictionary *)v8, v11, v5);

          int v13 = 1;
        }
        uint64_t v27 = 0;
        uint64_t v28 = &v27;
        uint64_t v29 = 0x2020000000;
        char v30 = 0;
        uint64_t v21 = 0;
        uint64_t v22 = &v21;
        uint64_t v23 = 0x3052000000;
        uint64_t v24 = __Block_byref_object_copy__29;
        id v25 = __Block_byref_object_dispose__29;
        uint64_t v26 = 0;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __64__NSSQLiteConnection_writeCorrelationMasterReordersFromTracker___block_invoke;
        v20[3] = &unk_1E544DFC0;
        v20[4] = a1;
        v20[5] = &v27;
        v20[6] = &v21;
        -[NSSQLCorrelationTableUpdateTracker enumerateMasterReordersUsingBlock:](a2, (uint64_t)v20);
        if (!*((unsigned char *)v28 + 24))
        {
          if (v13) {
            -[NSSQLiteConnection addVMCachedStatement:](a1, v11);
          }
          -[NSSQLiteConnection resetSQLStatement](a1);
          if (!v5
            || (__CFString *)v5[1].length != v5
            || !objc_msgSend((id)-[__CFString propertyDescription](v5, "propertyDescription"), "isOrdered"))
          {
            goto LABEL_31;
          }
          if (v8
            && (CFDictionaryRef correlationMasterReorderCachePart2 = v8->_correlationMasterReorderCachePart2) != 0
            && (uint64_t v15 = (NSSQLiteStatement *)CFDictionaryGetValue(correlationMasterReorderCachePart2, v5),
                (uint64_t v16 = v15) != 0)
            && (uint64_t v17 = v15->_cachedSQLiteStatement) != 0)
          {
            int v18 = 0;
            *(void *)(a1 + 80) = v17;
          }
          else
          {
            uint64_t v16 = -[NSSQLiteAdapter newCorrelationMasterReorderStatementPart2ForRelationship:]((void *)[(id)a1 adapter], v5);
            -[NSSQLiteConnection prepareSQLStatement:](a1, v16);
            -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:]((sqlite3_stmt *)v16, *(sqlite3_stmt **)(a1 + 80), a1);
            -[NSSQLiteStatementCache cacheCorrelationMasterReorderStatement:forRelationship:]((__CFDictionary *)v8, v16, v5);

            int v18 = 1;
          }
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __64__NSSQLiteConnection_writeCorrelationMasterReordersFromTracker___block_invoke_2;
          v19[3] = &unk_1E544DFC0;
          v19[4] = a1;
          v19[5] = &v27;
          v19[6] = &v21;
          -[NSSQLCorrelationTableUpdateTracker enumerateMasterReordersPart2UsingBlock:](a2, (uint64_t)v19);
          if (!*((unsigned char *)v28 + 24))
          {
            if (v18) {
              -[NSSQLiteConnection addVMCachedStatement:](a1, v16);
            }
            -[NSSQLiteConnection resetSQLStatement](a1);
LABEL_31:
            _Block_object_dispose(&v21, 8);
            _Block_object_dispose(&v27, 8);
            return;
          }
        }
        objc_exception_throw((id)v22[5]);
      }
    }
  }
}

uint64_t __64__NSSQLiteConnection_writeCorrelationMasterReordersFromTracker___block_invoke(uint64_t a1, uint64_t a2, sqlite3_int64 a3, sqlite3_int64 a4)
{
  if (+[NSSQLCore debugDefault] >= 3) {
    _NSCoreDataLog(7, @"correlation bindings: %qu, %qu, %qu", v8, v9, v10, v11, v12, v13, a2);
  }
  return -[NSSQLiteConnection executeCorrelationChangesForValue1:value2:value3:value4:](*(void *)(a1 + 32), a2, a3, a4, 0);
}

uint64_t __64__NSSQLiteConnection_writeCorrelationMasterReordersFromTracker___block_invoke_2(uint64_t a1, uint64_t a2, sqlite3_int64 a3, sqlite3_int64 a4)
{
  if (+[NSSQLCore debugDefault] >= 3) {
    _NSCoreDataLog(7, @"correlation bindings: %qu, %qu, %qu", v8, v9, v10, v11, v12, v13, a2);
  }
  return -[NSSQLiteConnection executeCorrelationChangesForValue1:value2:value3:value4:](*(void *)(a1 + 32), a2, a3, a4, 0);
}

- (void)writeCorrelationReordersFromTracker:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(NSObject **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    if (a2 && *(void *)(a2 + 40))
    {
      uint64_t v5 = *(__CFString **)(a2 + 8);
      uint64_t v6 = v5 ? (void *)[*(id *)(a2 + 8) propertyDescription] : 0;
      if (objc_msgSend((id)objc_msgSend(v6, "inverseRelationship"), "isOrdered"))
      {
        uint64_t v7 = -[NSSQLiteConnection statementCacheForEntity:](a1, (const void *)[(__CFString *)v5 sourceEntity]);
        uint64_t v8 = (__CFDictionary *)v7;
        if (v7
          && (CFDictionaryRef correlationReorderCache = v7->_correlationReorderCache) != 0
          && (CFDictionaryRef Value = (NSSQLiteStatement *)CFDictionaryGetValue(correlationReorderCache, v5)) != 0
          && (uint64_t v11 = Value, (cachedSQLiteStatement = Value->_cachedSQLiteStatement) != 0))
        {
          int v13 = 0;
          *(void *)(a1 + 80) = cachedSQLiteStatement;
        }
        else
        {
          uint64_t v11 = -[NSSQLiteAdapter newCorrelationReorderStatementForRelationship:]((void *)[(id)a1 adapter], v5);
          -[NSSQLiteConnection prepareSQLStatement:](a1, v11);
          -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:]((sqlite3_stmt *)v11, *(sqlite3_stmt **)(a1 + 80), a1);
          -[NSSQLiteStatementCache cacheCorrelationReorderStatement:forRelationship:](v8, v11, v5);

          int v13 = 1;
        }
        uint64_t v21 = 0;
        uint64_t v22 = &v21;
        uint64_t v23 = 0x2020000000;
        char v24 = 0;
        uint64_t v15 = 0;
        uint64_t v16 = &v15;
        uint64_t v17 = 0x3052000000;
        int v18 = __Block_byref_object_copy__29;
        uint64_t v19 = __Block_byref_object_dispose__29;
        uint64_t v20 = 0;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        void v14[2] = __58__NSSQLiteConnection_writeCorrelationReordersFromTracker___block_invoke;
        v14[3] = &unk_1E544DFC0;
        v14[4] = a1;
        v14[5] = &v21;
        v14[6] = &v15;
        -[NSSQLCorrelationTableUpdateTracker enumerateReordersUsingBlock:](a2, (uint64_t)v14);
        if (v13) {
          -[NSSQLiteConnection addVMCachedStatement:](a1, v11);
        }
        if (*((unsigned char *)v22 + 24)) {
          objc_exception_throw((id)v16[5]);
        }
        -[NSSQLiteConnection resetSQLStatement](a1);
        _Block_object_dispose(&v15, 8);
        _Block_object_dispose(&v21, 8);
      }
    }
  }
}

uint64_t __58__NSSQLiteConnection_writeCorrelationReordersFromTracker___block_invoke(uint64_t a1, sqlite3_int64 a2, sqlite3_int64 a3, uint64_t a4)
{
  if (+[NSSQLCore debugDefault] >= 3) {
    _NSCoreDataLog(7, @"correlation bindings: %qu, %qu, %qu", v8, v9, v10, v11, v12, v13, a4);
  }
  return -[NSSQLiteConnection executeCorrelationChangesForValue1:value2:value3:value4:](*(void *)(a1 + 32), a4, a2, a3, 0);
}

- (void)writeCorrelationChangesFromTracker:(uint64_t)a1
{
  if (a1)
  {
    -[NSSQLiteConnection writeCorrelationInsertsFromTracker:](a1, a2);
    -[NSSQLiteConnection writeCorrelationDeletesFromTracker:](a1, a2);
    -[NSSQLiteConnection writeCorrelationMasterReordersFromTracker:](a1, a2);
    -[NSSQLiteConnection writeCorrelationReordersFromTracker:](a1, a2);
  }
}

- (void)_endFetch
{
  if (result)
  {
    uint64_t v1 = result;
    BOOL result = -[NSSQLiteConnection setColumnsToFetch:](result, 0);
    *((_DWORD *)v1 + 78) &= ~2u;
    *(void *)((char *)v1 + 100) = 0;
    *(void *)((char *)v1 + 92) = 0;
    *((_DWORD *)v1 + 27) = 0;
  }
  return result;
}

uint64_t __29__NSSQLiteConnection_execute__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)handleCorruptedDB:(uint64_t)a1
{
  -[NSSQLiteConnection _forceDisconnectOnError](a1);
  if (+[NSSQLCore debugDefault] >= 1)
  {
    if (*(unsigned char *)(a1 + 42)) {
      uint64_t v10 = @"\x1B[31m\x1B[47mERROR:\x1B[0m\x1B[31m %@\x1B[0m";
    }
    else {
      uint64_t v10 = @"%@";
    }
    _NSCoreDataLog(1, (uint64_t)v10, v4, v5, v6, v7, v8, v9, a2);
  }
  id v11 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 259, a2, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *(void *)(a1 + 32), *MEMORY[0x1E4F28328], 0));
  objc_exception_throw(v11);
}

- (void)setSecureDeleteMode:(uint64_t)a1
{
  if (a1)
  {
    if (a2) {
      id v2 = @"pragma secure_delete=1";
    }
    else {
      id v2 = @"pragma secure_delete=0";
    }
    -[NSSQLiteConnection _executeSQLString:](a1, v2);
  }
}

- (void)setExclusiveLockingMode:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = @"pragma locking_mode=EXCLUSIVE";
  }
  else {
    uint64_t v4 = @"pragma locking_mode=NORMAL";
  }
  -[NSSQLiteConnection _executeSQLString:]((uint64_t)self, v4);
  -[NSSQLiteConnection beginTransaction]((uint64_t)self);
  -[NSSQLiteConnection commitTransaction]((uint64_t)self);
  -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)self, 0);
}

- (id)fetchCreationSQLForType:(void *)a3 containing:
{
  uint64_t v4 = *(NSObject **)(a1 + 8);
  if (v4) {
    dispatch_assert_queue_V2(v4);
  }
  uint64_t v5 = 0;
  char v6 = 0;
  for (int i = 3; (v6 & 1) == 0 && (i & 0x80000000) == 0; --i)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:8];
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"SELECT TBL_NAME, SQL FROM SQLITE_MASTER WHERE TYPE = \"%@\"", a2];
    if ([a3 length]) {
      [v8 appendFormat:@" AND SQL LIKE \"%%%@%%\"", a3];
    }
    [v8 appendString:@" ORDER BY TBL_NAME"];
    uint64_t v9 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([(id)a1 adapter], (uint64_t)v8);
    uint64_t v10 = [[NSSQLColumn alloc] initWithColumnName:@"TBL_NAME" sqlType:6];
    id v11 = [[NSSQLColumn alloc] initWithColumnName:@"SQL" sqlType:6];
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v10, v11, 0);

    -[NSSQLiteConnection connect](a1);
    -[NSSQLiteConnection prepareSQLStatement:](a1, v9);
    [(id)a1 execute];
    -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v12);
    while (1)
    {
      uint64_t v13 = -[NSSQLiteConnection newFetchedArray](a1);
      uint64_t v14 = v13;
      if (!v13) {
        break;
      }
      if ([v13 count] == 2)
      {
        uint64_t v15 = (void *)[v14 objectAtIndex:0];
        uint64_t v16 = (void *)[v14 objectAtIndex:1];
        if ([v15 isNSString])
        {
          if ([v16 isNSString])
          {
            uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", objc_msgSend(v15, "uppercaseString"), objc_msgSend(v16, "uppercaseString"), 0);
            [v7 addObject:v17];
          }
        }
      }
    }
    char v6 = 1;
    -[NSSQLiteConnection releaseSQLStatement](a1);
    -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0);
    *(_DWORD *)(a1 + 312) &= ~2u;
    *(void *)(a1 + 92) = 0;
    *(void *)(a1 + 100) = 0;
    *(_DWORD *)(a1 + 108) = 0;

    uint64_t v5 = v7;
  }

  return v5;
}

- (id)fetchTableCreationSQL
{
  if (result) {
    return -[NSSQLiteConnection fetchCreationSQLForType:containing:]((uint64_t)result, @"table", 0);
  }
  return result;
}

- (id)fetchTableCreationSQLContaining:(id)result
{
  if (result) {
    return -[NSSQLiteConnection fetchCreationSQLForType:containing:]((uint64_t)result, @"table", a2);
  }
  return result;
}

- (id)newFetchUUIDSForSubentitiesRootedAt:(uint64_t)a1
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v4 = *(NSObject **)(a1 + 8);
  if (v4) {
    dispatch_assert_queue_V2(v4);
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "model"), "entityNamed:", objc_msgSend(a2, "name"));
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v7 = v5;
  while (v7)
  {
    uint64_t v8 = v7;
    uint64_t v7 = (void *)v7[21];
    if (v7 == v8)
    {
      uint64_t v9 = (void *)v8[9];
      goto LABEL_8;
    }
  }
  uint64_t v9 = 0;
LABEL_8:
  uint64_t v10 = [v9 countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v61 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        if ([v13 sqlType] == 16)
        {
          uint64_t v14 = -[NSSQLColumn initWithColumnName:sqlType:]([NSSQLColumn alloc], "initWithColumnName:sqlType:", [v13 columnName], 10);
          [v6 addObject:v14];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v60 objects:v68 count:16];
    }
    while (v10);
  }
  if (![v6 count]) {
    return v6;
  }
  uint64_t v15 = (void *)[@"SELECT " mutableCopy];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v16 = [v6 countByEnumeratingWithState:&v56 objects:v67 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v57;
    char v18 = 1;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v57 != v17) {
          objc_enumerationMutation(v6);
        }
        uint64_t v20 = *(void **)(*((void *)&v56 + 1) + 8 * j);
        if ((v18 & 1) == 0) {
          [v15 appendString:@" ,"];
        }
        objc_msgSend(v15, "appendString:", objc_msgSend(v20, "columnName"));
        char v18 = 0;
      }
      uint64_t v16 = [v6 countByEnumeratingWithState:&v56 objects:v67 count:16];
      char v18 = 0;
    }
    while (v16);
  }
  objc_msgSend(v15, "appendFormat:", @" FROM %@ WHERE ("), objc_msgSend(v5, "tableName");
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v21 = [v6 countByEnumeratingWithState:&v52 objects:v66 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v53;
    char v23 = 1;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v53 != v22) {
          objc_enumerationMutation(v6);
        }
        id v25 = *(void **)(*((void *)&v52 + 1) + 8 * k);
        if ((v23 & 1) == 0) {
          [v15 appendString:@" OR "];
        }
        [v15 appendFormat:@"(%@ >= ?)", objc_msgSend(v25, "columnName")];
        char v23 = 0;
      }
      uint64_t v21 = [v6 countByEnumeratingWithState:&v52 objects:v66 count:16];
      char v23 = 0;
    }
    while (v21);
  }
  [v15 appendString:@""]);
  uint64_t v42 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([(id)a1 adapter], (uint64_t)v15);

  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  char v51 = 2;
  [v26 appendBytes:&v51 length:1];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v27 = [v6 countByEnumeratingWithState:&v47 objects:v65 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v48;
    while (1)
    {
      if (*(void *)v48 != v28) {
        objc_enumerationMutation(v6);
      }
      uint64_t v29 = [[NSSQLBindVariable alloc] initWithValue:v26 sqlType:10 propertyDescription:0];
      -[NSSQLiteStatement addBindVariable:]((uint64_t)v42, v29);

      if (!--v27)
      {
        uint64_t v27 = [v6 countByEnumeratingWithState:&v47 objects:v65 count:16];
        if (!v27) {
          break;
        }
      }
    }
  }

  char v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v41 = a1;
  -[NSSQLiteConnection prepareSQLStatement:](a1, v42);
  [(id)a1 execute];
  -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v6);
  while (1)
  {
    int v32 = -[NSSQLiteConnection newFetchedArray](v41);
    int v33 = v32;
    if (!v32) {
      break;
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v34 = [v32 countByEnumeratingWithState:&v43 objects:v64 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v44;
      do
      {
        for (uint64_t m = 0; m != v34; ++m)
        {
          if (*(void *)v44 != v35) {
            objc_enumerationMutation(v33);
          }
          int v37 = *(void **)(*((void *)&v43 + 1) + 8 * m);
          if ((void *)v31 != v37)
          {
            uint64_t v38 = [*(id *)(*((void *)&v43 + 1) + 8 * m) bytes];
            if ((unint64_t)[v37 length] >= 2)
            {
              uint64_t v39 = (void *)[[NSString alloc] initWithUTF8String:v38 + 1];
              if (v39)
              {
                [v30 addObject:v39];
              }
            }
          }
        }
        uint64_t v34 = [v33 countByEnumeratingWithState:&v43 objects:v64 count:16];
      }
      while (v34);
    }
  }
  -[NSSQLiteConnection releaseSQLStatement](v41);
  -[NSSQLiteConnection setColumnsToFetch:]((void *)v41, 0);
  *(_DWORD *)(v41 + 312) &= ~2u;
  *(void *)(v41 + 100) = 0;
  *(void *)(v41 + 92) = 0;
  *(_DWORD *)(v41 + 108) = 0;

  return v30;
}

- (void)_createInsertStatementsForEntities:(void *)a1
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v42 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a2, "count"));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = a2;
  uint64_t v40 = [a2 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v47;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v47 != v39)
        {
          uint64_t v4 = v3;
          objc_enumerationMutation(obj);
          uint64_t v3 = v4;
        }
        uint64_t v43 = v3;
        uint64_t v45 = *(void *)(*((void *)&v46 + 1) + 8 * v3);
        id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v7 = v45;
        if (v45)
        {
          while (v7)
          {
            uint64_t v8 = v7;
            uint64_t v7 = *(void *)(v7 + 168);
            if (v7 == v8)
            {
              uint64_t v9 = *(void **)(v8 + 72);
              goto LABEL_10;
            }
          }
        }
        uint64_t v9 = 0;
LABEL_10:
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        uint64_t v10 = (void *)[v9 sortedArrayUsingFunction:sortColumnsByType context:0];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v54 objects:v60 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v55;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v55 != v12) {
                objc_enumerationMutation(v10);
              }
              uint64_t v14 = *(void **)(*((void *)&v54 + 1) + 8 * i);
              objc_msgSend(v5, "addObject:", objc_msgSend(v14, "columnName"));
              objc_msgSend(v6, "addObject:", objc_msgSend(v14, "columnName"));
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v54 objects:v60 count:16];
          }
          while (v11);
        }
        uint64_t v15 = [v5 componentsJoinedByString:@","];
        uint64_t v16 = [(id)v45 tableName];
        uint64_t v17 = (void *)[NSString stringWithFormat:@"_DEFERRED_TEMP__%@", v16];
        if (v45 && (*(void *)(v45 + 160) || (uint64_t v28 = *(void **)(v45 + 152)) != 0 && [v28 count]))
        {
          char v18 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@" WHERE "];
          [v18 appendString:v17];
          [v18 appendString:@"."];
          [v18 appendString:@"Z_ENT"];
          [v18 appendString:@" = "];
          uint64_t v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v45, "entityDescription"), "userInfo"), "objectForKey:", @"NSEntityRenamingShouldRebaseKey");
          if (!v19) {
            goto LABEL_35;
          }
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          uint64_t v20 = *(void **)(v45 + 152);
          uint64_t v21 = [v20 countByEnumeratingWithState:&v50 objects:v59 count:16];
          if (!v21) {
            goto LABEL_35;
          }
          int v37 = v17;
          uint64_t v38 = v15;
          uint64_t v22 = 0;
          uint64_t v23 = *(void *)v51;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v51 != v23) {
                objc_enumerationMutation(v20);
              }
              if (!v22)
              {
                id v25 = *(unsigned int **)(*((void *)&v50 + 1) + 8 * j);
                int v26 = objc_msgSend((id)objc_msgSend(v25, "name"), "isEqualToString:", v19);
                if (v25) {
                  int v27 = v26;
                }
                else {
                  int v27 = 0;
                }
                if (v27 == 1) {
                  uint64_t v22 = v25[46];
                }
                else {
                  uint64_t v22 = 0;
                }
              }
            }
            uint64_t v21 = [v20 countByEnumeratingWithState:&v50 objects:v59 count:16];
          }
          while (v21);
          uint64_t v17 = v37;
          uint64_t v15 = v38;
          if (!v22) {
LABEL_35:
          }
            uint64_t v22 = *(unsigned int *)(v45 + 184);
          objc_msgSend(v18, "appendFormat:", @"%d", v22);
        }
        else
        {
          char v18 = 0;
        }
        uint64_t v29 = [v6 componentsJoinedByString:@","];
        id v30 = v17;
        uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"INSERT INTO "];
        objc_msgSend(v31, "appendString:", objc_msgSend((id)v45, "tableName"));
        objc_msgSend(v31, "appendString:", @" (");
        [v31 appendString:v15];
        [v31 appendString:@" SELECT "]);
        [v31 appendString:v29];
        [v31 appendString:@" FROM "];
        [v31 appendString:v30];
        if (v18)
        {
          [v31 appendString:v18];
        }
        int v32 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([a1 adapter], (uint64_t)v31);
        -[NSSQLiteAdapter _useModel:]((uint64_t)v32, v44);

        [v42 addObject:v32];
        if (v45)
        {
          if (![*(id *)(v45 + 152) count]) {
            goto LABEL_46;
          }
          uint64_t v33 = *(void *)(v45 + 152);
          goto LABEL_45;
        }
        if ([0 count])
        {
          uint64_t v33 = 0;
LABEL_45:
          objc_msgSend(v42, "addObjectsFromArray:", -[NSSQLiteConnection _createInsertStatementsForEntities:](a1, v33));
        }
LABEL_46:
        uint64_t v3 = v43 + 1;
      }
      while (v43 + 1 != v40);
      uint64_t v34 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
      uint64_t v40 = v34;
    }
    while (v34);
  }
  return v42;
}

- (BOOL)finishDeferredLightweightMigration:(uint64_t)a1
{
  uint64_t v373 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v3 = *(NSObject **)(a1 + 8);
    if (v3) {
      dispatch_assert_queue_V2(v3);
    }
    v300 = (void *)a1;
    if (+[NSSQLCore debugDefault] < 1)
    {
      int v11 = +[NSMappingModel migrationDebugLevel];
      uint64_t v12 = getprogname();
      uint64_t v10 = v12;
      if (v11 < 1)
      {
        int v299 = 0;
        if (!v12) {
          goto LABEL_12;
        }
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v10 = getprogname();
    }
    uint64_t v13 = @"without";
    if (a2) {
      uint64_t v13 = @"with";
    }
    _NSCoreDataLog(4, @"Deferred Lightweight Migration %@ all tasks", v4, v5, v6, v7, v8, v9, (uint64_t)v13);
    int v299 = 1;
    if (!v10) {
      goto LABEL_12;
    }
LABEL_10:
    if (!strncmp("assetsd", v10, 7uLL) || !strncmp("photolibraryd", v10, 0xDuLL))
    {
      char v290 = 1;
      goto LABEL_14;
    }
LABEL_12:
    char v290 = 0;
LABEL_14:
    int v14 = 3;
    while (1)
    {
      BOOL v292 = v14 >= 0;
      if (v14 < 0) {
        return v292;
      }
      int v294 = v14;
      context = (void *)MEMORY[0x18C127630]();
      -[NSSQLiteConnection connect]((uint64_t)v300);
      if (v300[9]) {
        break;
      }
      char v286 = 0;
LABEL_179:
      -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v300, 0);
      int v14 = v294 - 1;
      if (v286) {
        return v292;
      }
    }
    uint64_t v15 = (void *)[MEMORY[0x1E4F1CA80] set];
    id v16 = -[NSSQLiteConnection fetchCreationSQLForType:containing:]((uint64_t)v300, @"table", 0);
    id obj = (id)[MEMORY[0x1E4F1CA48] array];
    long long v331 = 0u;
    long long v332 = 0u;
    long long v329 = 0u;
    long long v330 = 0u;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v329 objects:v369 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v330;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v330 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void **)(*((void *)&v329 + 1) + 8 * i);
          if ([v20 count] == 2
            && objc_msgSend((id)objc_msgSend(v20, "lastObject"), "containsString:", @"_DEFERRED_"))
          {
            objc_msgSend(obj, "addObject:", objc_msgSend(v20, "firstObject"));
          }
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v329 objects:v369 count:16];
      }
      while (v17);
    }
    long long v327 = 0u;
    long long v328 = 0u;
    long long v325 = 0u;
    long long v326 = 0u;
    uint64_t v21 = [obj countByEnumeratingWithState:&v325 objects:v368 count:16];
    if (v21)
    {
      uint64_t v295 = *(void *)v326;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v326 != v295) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void *)(*((void *)&v325 + 1) + 8 * v22);
          long long v321 = 0u;
          long long v322 = 0u;
          long long v323 = 0u;
          long long v324 = 0u;
          uint64_t v24 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v300, "adapter"), "sqlCore"), "model");
          if (v24) {
            id v25 = *(void **)(v24 + 32);
          }
          else {
            id v25 = 0;
          }
          uint64_t v26 = [v25 countByEnumeratingWithState:&v321 objects:v367 count:16];
          if (v26)
          {
            uint64_t v27 = *(void *)v322;
            do
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v322 != v27) {
                  objc_enumerationMutation(v25);
                }
                uint64_t v29 = *(void *)(*((void *)&v321 + 1) + 8 * j);
                if (v29
                  && !*(void *)(v29 + 160)
                  && objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v321 + 1) + 8 * j), "tableName"), "isEqualToString:", v23))
                {
                  [v15 addObject:v29];
                }
              }
              uint64_t v26 = [v25 countByEnumeratingWithState:&v321 objects:v367 count:16];
            }
            while (v26);
          }
          ++v22;
        }
        while (v22 != v21);
        uint64_t v30 = [obj countByEnumeratingWithState:&v325 objects:v368 count:16];
        uint64_t v21 = v30;
      }
      while (v30);
    }
    uint64_t v31 = (void *)[v15 allObjects];
    if (![v31 count])
    {
LABEL_177:
      char v286 = 1;
      goto LABEL_179;
    }
    int v32 = v31;
    if ((a2 & 1) == 0) {
      int v32 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", objc_msgSend(v31, "firstObject"));
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v34 = v33;
    id obja = (id)[MEMORY[0x1E4F1CA60] dictionary];
    if (v299)
    {
      _NSCoreDataLog(4, @"Beginning lightweight migration on connection", v35, v36, v37, v38, v39, v40, v288);
      if ((v290 & 1) == 0)
      {
LABEL_58:
        _NSCoreDataLog(4, @"Beginning creation of deferred schema migration statements", v41, v42, v43, v44, v45, v46, v288);
LABEL_59:
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v54 = v53;
        if (v299) {
          _NSCoreDataLog(4, @"Create alter table migration statements", v47, v48, v49, v50, v51, v52, v288);
        }
        v296 = v31;
        long long v55 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v32, "count"));
        long long v335 = 0u;
        long long v336 = 0u;
        long long v333 = 0u;
        long long v334 = 0u;
        uint64_t v56 = [v32 countByEnumeratingWithState:&v333 objects:v370 count:16];
        if (v56)
        {
          uint64_t v57 = *(void *)v334;
          do
          {
            for (uint64_t k = 0; k != v56; ++k)
            {
              if (*(void *)v334 != v57) {
                objc_enumerationMutation(v32);
              }
              long long v59 = *(void **)(*((void *)&v333 + 1) + 8 * k);
              uint64_t v288 = [v59 tableName];
              long long v60 = -[NSSQLiteAdapter newRenameTableStatementFrom:to:]((NSSQLiteStatement *)[v300 adapter], objc_msgSend(v59, "tableName"), objc_msgSend(NSString, "stringWithFormat:", @"_DEFERRED_TEMP__%@"));
              [v55 addObject:v60];
            }
            uint64_t v56 = [v32 countByEnumeratingWithState:&v333 objects:v370 count:16];
          }
          while (v56);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        v366[0] = @"Creation of alter table migration statements";
        v366[1] = [NSNumber numberWithDouble:v61 - v54];
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v366, 2), @"1.1");
        if (v299) {
          _NSCoreDataLog(4, @"Create create table migration statements", v62, v63, v64, v65, v66, v67, v288);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v69 = v68;
        int v70 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v32, "count"));
        long long v339 = 0u;
        long long v340 = 0u;
        long long v337 = 0u;
        long long v338 = 0u;
        uint64_t v71 = [v32 countByEnumeratingWithState:&v337 objects:v371 count:16];
        if (v71)
        {
          uint64_t v72 = *(void *)v338;
          do
          {
            for (uint64_t m = 0; m != v71; ++m)
            {
              if (*(void *)v338 != v72) {
                objc_enumerationMutation(v32);
              }
              uint64_t v74 = -[NSSQLiteAdapter newCreateTableStatementForEntity:]((__CFString *)[v300 adapter], *(void **)(*((void *)&v337 + 1) + 8 * m));
              [v70 addObject:v74];
            }
            uint64_t v71 = [v32 countByEnumeratingWithState:&v337 objects:v371 count:16];
          }
          while (v71);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        v365[0] = @"Creation of create table migration statements";
        v365[1] = [NSNumber numberWithDouble:v75 - v69];
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v365, 2), @"1.2");
        if (v299) {
          _NSCoreDataLog(4, @"Create insert migration statements", v76, v77, v78, v79, v80, v81, v288);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v83 = v82;
        uint64_t v84 = -[NSSQLiteConnection _createInsertStatementsForEntities:](v300, v32);
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        v364[0] = @"Creation of insert migration statements";
        v364[1] = [NSNumber numberWithDouble:v85 - v83];
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v364, 2), @"1.3");
        if (v299) {
          _NSCoreDataLog(4, @"Create drop table migration statements", v86, v87, v88, v89, v90, v91, v288);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v93 = v92;
        uint64_t v94 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v32, "count"));
        long long v343 = 0u;
        long long v344 = 0u;
        long long v341 = 0u;
        long long v342 = 0u;
        uint64_t v95 = [v32 countByEnumeratingWithState:&v341 objects:v372 count:16];
        if (v95)
        {
          uint64_t v96 = *(void *)v342;
          do
          {
            for (uint64_t n = 0; n != v95; ++n)
            {
              if (*(void *)v342 != v96) {
                objc_enumerationMutation(v32);
              }
              uint64_t v288 = [*(id *)(*((void *)&v341 + 1) + 8 * n) tableName];
              uint64_t v98 = -[NSSQLiteAdapter newDropTableStatementForTableNamed:]((NSSQLiteStatement *)[v300 adapter], objc_msgSend(NSString, "stringWithFormat:", @"_DEFERRED_TEMP__%@"));
              [v94 addObject:v98];
            }
            uint64_t v95 = [v32 countByEnumeratingWithState:&v341 objects:v372 count:16];
          }
          while (v95);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        v363[0] = @"Creation of drop table migration statements";
        v363[1] = [NSNumber numberWithDouble:v99 - v93];
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v363, 2), @"1.4");
        if (v299) {
          _NSCoreDataLog(4, @"Finished creating deferred schema migration statements", v100, v101, v102, v103, v104, v105, v288);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        v362[0] = @"Total preparation time for schema migration statements";
        v362[1] = [NSNumber numberWithDouble:v106 - v54];
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v362, 2), @"1.0");
        if (v299) {
          _NSCoreDataLog(4, @"Beginning formal transaction", v107, v108, v109, v110, v111, v112, v288);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v114 = v113;
        uint64_t v115 = v300[2];
        if (v115) {
          [*(id *)(v115 + 216) lock];
        }
        -[NSSQLiteConnection beginTransaction]((uint64_t)v300);
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v117 = v116;
        v361[0] = @"Beginning formal transaction";
        v361[1] = [NSNumber numberWithDouble:v116 - v114];
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v361, 2), @"2.1");
        if (v299) {
          _NSCoreDataLog(4, @"Execute alter table statements", v118, v119, v120, v121, v122, v123, v288);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v125 = v124;
        long long v319 = 0u;
        long long v320 = 0u;
        long long v317 = 0u;
        long long v318 = 0u;
        uint64_t v132 = [v55 countByEnumeratingWithState:&v317 objects:v360 count:16];
        if (v132)
        {
          uint64_t v133 = *(void *)v318;
          do
          {
            for (iuint64_t i = 0; ii != v132; ++ii)
            {
              if (*(void *)v318 != v133) {
                objc_enumerationMutation(v55);
              }
              int v135 = *(void **)(*((void *)&v317 + 1) + 8 * ii);
              if (v299) {
                _NSCoreDataLog(4, @"  Execute alter table statement: %@", v126, v127, v128, v129, v130, v131, *(void *)(*((void *)&v317 + 1) + 8 * ii));
              }
              -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v300, v135);
            }
            uint64_t v132 = [v55 countByEnumeratingWithState:&v317 objects:v360 count:16];
          }
          while (v132);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        v359[0] = @"Execute alter table statements";
        v359[1] = [NSNumber numberWithDouble:v136 - v125];
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v359, 2), @"2.2");
        if (v299) {
          _NSCoreDataLog(4, @"Execute create table statements", v137, v138, v139, v140, v141, v142, v288);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v144 = v143;
        long long v315 = 0u;
        long long v316 = 0u;
        long long v313 = 0u;
        long long v314 = 0u;
        uint64_t v151 = [v70 countByEnumeratingWithState:&v313 objects:v358 count:16];
        if (v151)
        {
          uint64_t v152 = *(void *)v314;
          do
          {
            for (juint64_t j = 0; jj != v151; ++jj)
            {
              if (*(void *)v314 != v152) {
                objc_enumerationMutation(v70);
              }
              long long v154 = *(void **)(*((void *)&v313 + 1) + 8 * jj);
              if (v299) {
                _NSCoreDataLog(4, @"  Execute create table statement: %@", v145, v146, v147, v148, v149, v150, *(void *)(*((void *)&v313 + 1) + 8 * jj));
              }
              -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v300, v154);
            }
            uint64_t v151 = [v70 countByEnumeratingWithState:&v313 objects:v358 count:16];
          }
          while (v151);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        v357[0] = @"Execute create table statements";
        v357[1] = [NSNumber numberWithDouble:v155 - v144];
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v357, 2), @"2.3");
        if (v299) {
          _NSCoreDataLog(4, @"Execute insert statements", v156, v157, v158, v159, v160, v161, v288);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v163 = v162;
        long long v311 = 0u;
        long long v312 = 0u;
        long long v309 = 0u;
        long long v310 = 0u;
        uint64_t v170 = [v84 countByEnumeratingWithState:&v309 objects:v356 count:16];
        if (v170)
        {
          uint64_t v171 = *(void *)v310;
          do
          {
            for (kuint64_t k = 0; kk != v170; ++kk)
            {
              if (*(void *)v310 != v171) {
                objc_enumerationMutation(v84);
              }
              uint64_t v173 = *(void **)(*((void *)&v309 + 1) + 8 * kk);
              if (v299) {
                _NSCoreDataLog(4, @"  Execute insert statement: %@", v164, v165, v166, v167, v168, v169, *(void *)(*((void *)&v309 + 1) + 8 * kk));
              }
              -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v300, v173);
            }
            uint64_t v170 = [v84 countByEnumeratingWithState:&v309 objects:v356 count:16];
          }
          while (v170);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        v355[0] = @"Execute insert statements";
        v355[1] = [NSNumber numberWithDouble:v174 - v163];
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v355, 2), @"2.4");
        if (v299) {
          _NSCoreDataLog(4, @"Execute drop table statements", v175, v176, v177, v178, v179, v180, v288);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v182 = v181;
        long long v307 = 0u;
        long long v308 = 0u;
        long long v305 = 0u;
        long long v306 = 0u;
        uint64_t v189 = [v94 countByEnumeratingWithState:&v305 objects:v354 count:16];
        if (v189)
        {
          uint64_t v190 = *(void *)v306;
          do
          {
            for (muint64_t m = 0; mm != v189; ++mm)
            {
              if (*(void *)v306 != v190) {
                objc_enumerationMutation(v94);
              }
              long long v192 = *(void **)(*((void *)&v305 + 1) + 8 * mm);
              if (v299) {
                _NSCoreDataLog(4, @"  Execute drop table statement: %@", v183, v184, v185, v186, v187, v188, *(void *)(*((void *)&v305 + 1) + 8 * mm));
              }
              -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v300, v192);
            }
            uint64_t v189 = [v94 countByEnumeratingWithState:&v305 objects:v354 count:16];
          }
          while (v189);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        v353[0] = @"Execute drop table statements";
        v353[1] = [NSNumber numberWithDouble:v193 - v182];
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v353, 2), @"2.5");
        if (v299) {
          _NSCoreDataLog(4, @"Execute create indexes statements", v194, v195, v196, v197, v198, v199, v288);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v201 = v200;
        -[NSSQLiteConnection _createIndexesForEntities:](v300, v32);
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        v352[0] = @"Execute create indexes statements";
        v352[1] = [NSNumber numberWithDouble:v202 - v201];
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v352, 2), @"2.6");
        if (v299) {
          _NSCoreDataLog(4, @"Execute create trigger statements", v203, v204, v205, v206, v207, v208, v288);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v210 = v209;
        uint64_t v211 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v300, "adapter"), "sqlCore"), "model");
        if (v211) {
          v212 = *(void **)(v211 + 32);
        }
        else {
          v212 = 0;
        }
        -[NSSQLiteConnection createTriggersForEntities:]((uint64_t)v300, v212);
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        v351[0] = @"Execute create trigger statements";
        v351[1] = [NSNumber numberWithDouble:v213 - v210];
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v351, 2), @"2.7");
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v221 = v220;
        if (v299) {
          _NSCoreDataLog(4, @"Updating metadata", v214, v215, v216, v217, v218, v219, v288);
        }
        v222 = (__CFString *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:-[NSSQLiteConnection fetchMetadata]((uint64_t)v300)];
        if ((a2 & 1) != 0 || (unint64_t)[v296 count] < 2) {
          [(__CFString *)v222 removeObjectForKey:@"NSPersistentStoreDeferredLightweightMigrationOptionKey"];
        }
        else {
          [(__CFString *)v222 setValue:MEMORY[0x1E4F1CC38] forKey:@"NSPersistentStoreDeferredLightweightMigrationOptionKey"];
        }
        -[NSSQLiteConnection saveMetadata:](v300, v222);
        if (v299) {
          _NSCoreDataLog(4, @"Finished updating metadata", v223, v224, v225, v226, v227, v228, v288);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v230 = v229;
        v350[0] = @"Update store metadata";
        v350[1] = [NSNumber numberWithDouble:v229 - v221];
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v350, 2), @"2.15");
        if (v299) {
          _NSCoreDataLog(4, @"Committing formal transaction", v231, v232, v233, v234, v235, v236, v288);
        }
        -[NSSQLiteConnection commitTransaction]((uint64_t)v300);
        if (v299) {
          _NSCoreDataLog(4, @"Finished committing formal transaction", v237, v238, v239, v240, v241, v242, v288);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v244 = v243;
        v349[0] = @"Time for COMMIT";
        v349[1] = [NSNumber numberWithDouble:v243 - v230];
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v349, 2), @"2.16");
        v348[0] = @"Total formal transaction time";
        v348[1] = [NSNumber numberWithDouble:v244 - v117];
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v348, 2), @"2.0");
        if (v299) {
          _NSCoreDataLog(4, @"Checkpointing WAL journal", v245, v246, v247, v248, v249, v250, v288);
        }
        CFMutableArrayRef v251 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:]((uint64_t)v300, @"pragma wal_checkpoint(FULL)");
        if (v251) {
          CFRelease(v251);
        }
        uint64_t v258 = v300[2];
        if (v258) {
          [*(id *)(v258 + 216) unlock];
        }
        if (v299)
        {
          _NSCoreDataLog(4, @"Finished checkpointing WAL journal", v252, v253, v254, v255, v256, v257, v288);
          _NSCoreDataLog(4, @"Successfully completed deferred lightweight migration on connection", v259, v260, v261, v262, v263, v264, v289);
          if (v290)
          {
            _NSCoreDataLog(4, @"Reset SQLite cache size", v265, v266, v267, v268, v269, v270, v288);
LABEL_166:
            -[NSSQLiteConnection _executeSQLString:]((uint64_t)v300, @"pragma cache_size = 512");
          }
        }
        else if (v290)
        {
          goto LABEL_166;
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v272 = v271;
        v347[0] = @"Checkpoint time";
        v347[1] = [NSNumber numberWithDouble:v271 - v244];
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v347, 2), @"3.0");
        v346[0] = @"Total migration time (on connection)";
        v346[1] = [NSNumber numberWithDouble:v272 - v34];
        objc_msgSend(obja, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v346, 2), @"0.0");
        if (v299)
        {
          v273 = objc_msgSend((id)objc_msgSend(obja, "allKeys"), "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
          long long v303 = 0u;
          long long v304 = 0u;
          long long v301 = 0u;
          long long v302 = 0u;
          uint64_t v274 = [v273 countByEnumeratingWithState:&v301 objects:v345 count:16];
          if (v274)
          {
            uint64_t v275 = *(void *)v302;
            do
            {
              for (nuint64_t n = 0; nn != v274; ++nn)
              {
                if (*(void *)v302 != v275) {
                  objc_enumerationMutation(v273);
                }
                uint64_t v277 = *(void *)(*((void *)&v301 + 1) + 8 * nn);
                v278 = (void *)[obja objectForKey:v277];
                [v278 firstObject];
                objc_msgSend((id)objc_msgSend(v278, "lastObject"), "doubleValue");
                if (v285 > 0.01) {
                  _NSCoreDataLog(4, @"    Deferred Migration step %@ '%@' took %2.2f seconds", v279, v280, v281, v282, v283, v284, v277);
                }
              }
              uint64_t v274 = [v273 countByEnumeratingWithState:&v301 objects:v345 count:16];
            }
            while (v274);
          }
        }
        goto LABEL_177;
      }
      _NSCoreDataLog(4, @"Increasing SQLite cache size to 148MB", v41, v42, v43, v44, v45, v46, v288);
    }
    else if ((v290 & 1) == 0)
    {
      goto LABEL_59;
    }
    -[NSSQLiteConnection _executeSQLString:]((uint64_t)v300, @"pragma cache_size = 38000");
    if (!v299) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }
  return 0;
}

- (void)saveMetadata:(void *)a1
{
  if (!a1) {
    return;
  }
  uint64_t v4 = a1[1];
  if (v4) {
    dispatch_assert_queue_V2(v4);
  }
  if ((-[NSSQLiteConnection _hasTableWithName:isTemp:]((uint64_t)a1, @"Z_METADATA", 0) & 1) == 0) {
    -[NSSQLiteConnection createMetadata](a1);
  }
  if (([(__CFString *)a2 isNSDictionary] & 1) == 0)
  {
    if (a2) {
      uint64_t v27 = a2;
    }
    else {
      uint64_t v27 = @"<null>";
    }
    _NSCoreDataLog(1, @"metadata is not a dictionary: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v27);
    uint64_t v28 = *MEMORY[0x1E4F1C3C8];
    uint64_t v29 = [NSString stringWithFormat:@"The metadata is not a dictionary: %@", v27, v38];
    goto LABEL_21;
  }
  int v11 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([a1 adapter], objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM %@ WHERE %@ = ?", @"Z_METADATA", @"Z_VERSION"));
  uint64_t v12 = [NSSQLBindVariable alloc];
  uint64_t v13 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:](v12, "initWithValue:sqlType:propertyDescription:", [NSNumber numberWithInt:1], 1, 0);
  -[NSSQLiteStatement addBindVariable:]((uint64_t)v11, v13);
  -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v11);

  uint64_t v14 = [(__CFString *)a2 objectForKey:@"NSStoreUUID"];
  uint64_t v15 = (void *)[(__CFString *)a2 mutableCopy];
  [v15 removeObjectForKey:@"NSStoreUUID"];
  uint64_t v39 = 0;
  id v16 = (__CFString *)[MEMORY[0x1E4F28F98] dataWithPropertyList:v15 format:200 options:0 error:&v39];

  if (!v16)
  {
    id v16 = @"<null>";
    goto LABEL_18;
  }
  if (([(__CFString *)v16 isNSData] & 1) == 0)
  {
LABEL_18:

    _NSCoreDataLog(1, @"failure writing metadata plist with data bytes: %@", v30, v31, v32, v33, v34, v35, (uint64_t)v16);
    uint64_t v28 = *MEMORY[0x1E4F1C3C8];
    uint64_t v36 = v39;
    if (!v39) {
      uint64_t v36 = @"<null>";
    }
    uint64_t v29 = [NSString stringWithFormat:@"An error %@ occurred converting the metadata plist data: %@", v36, v16];
LABEL_21:
    id v37 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v28, 134030, v29, 0);
    objc_exception_throw(v37);
  }
  uint64_t v17 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([a1 adapter], objc_msgSend(NSString, "stringWithFormat:", @"INSERT INTO %@ (%@, %@, %@) VALUES (?, ?, ?)", @"Z_METADATA", @"Z_VERSION", @"Z_UUID", @"Z_PLIST"));
  uint64_t v18 = [[NSSQLBindVariable alloc] initWithValue:v14 sqlType:6 propertyDescription:0];
  uint64_t v19 = [[NSSQLBindVariable alloc] initWithValue:v16 sqlType:10 propertyDescription:0];
  -[NSSQLiteStatement addBindVariable:]((uint64_t)v17, v13);
  -[NSSQLiteStatement addBindVariable:]((uint64_t)v17, v18);
  -[NSSQLiteStatement addBindVariable:]((uint64_t)v17, v19);
  -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v17);
  if (+[NSSQLCore debugDefault] >= 2)
  {
    uint64_t v20 = [(NSSQLBindVariable *)v13 value];
    _NSCoreDataLog(4, @"Saving new meta data; versiouint64_t n = %@ ; UUID = %@",
      v21,
      v22,
      v23,
      v24,
      v25,
      v26,
      v20);
  }
}

- (uint64_t)_dropTableWithName:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(NSObject **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    char v5 = 0;
    for (int i = 3; (v5 & 1) == 0 && (i & 0x80000000) == 0; --i)
    {
      -[NSSQLiteConnection connect](a1);
      if (*(void *)(a1 + 72))
      {
        -[NSSQLiteConnection beginTransaction](a1);
        -[NSSQLiteConnection _executeSQLString:](a1, (void *)[NSString stringWithFormat:@"DROP TABLE IF EXISTS %@", a2]);
        -[NSSQLiteConnection commitTransaction](a1);
        char v5 = 1;
      }
      else
      {
        char v5 = 0;
      }
      -[NSSQLiteConnection endFetchAndRecycleStatement:](a1, 0);
    }
  }
  return 0;
}

- (id)fetchCachedModel
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v1 = (uint64_t)result;
  id v2 = *((void *)result + 1);
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  uint64_t v3 = [NSString stringWithFormat:@"SELECT %@ FROM %@", @"Z_CONTENT", @"Z_MODELCACHE"];
  if (!-[NSSQLiteConnection _hasTableWithName:isTemp:](v1, @"Z_MODELCACHE", 0)) {
    return 0;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  char v5 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([(id)v1 adapter], v3);
  -[NSSQLiteConnection prepareSQLStatement:](v1, v5);
  [(id)v1 execute];
  uint64_t v20 = [[NSSQLColumn alloc] initWithColumnName:@"Z_CONTENT" sqlType:10];
  -[NSSQLiteConnection setColumnsToFetch:]((void *)v1, (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1]);
  uint64_t v6 = -[NSSQLiteConnection newFetchedArray](v1);
  uint64_t v7 = v6;
  if (!v6 || ![v6 count])
  {
    id v15 = 0;
    goto LABEL_23;
  }
  uint64_t v8 = [v7 objectAtIndex:0];
  if (v8 == NSKeyValueCoding_NullValue || (uint64_t v9 = (void *)[v7 objectAtIndex:0], (v10 = v9) == 0))
  {
LABEL_21:
    int v11 = 0;
    goto LABEL_22;
  }
  int v11 = (void *)[v9 length];
  if (!v11) {
    goto LABEL_22;
  }
  memset(&stream, 0, sizeof(stream));
  if (compression_stream_init(&stream, COMPRESSION_STREAM_DECODE, COMPRESSION_ZLIB))
  {
    uint64_t v17 = @"Could not initialize compression decoder.";
LABEL_26:
    id v18 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134060, (uint64_t)v17, 0);
    objc_exception_throw(v18);
  }
  uint64_t v12 = (void *)[MEMORY[0x1E4F1CA58] data];
  stream.src_ptr = (const uint8_t *)[v10 bytes];
  stream.src_size = [v10 length];
  do
  {
    stream.dst_ptr = v21;
    stream.doff_t st_size = 1024;
    compression_status v13 = compression_stream_process(&stream, 1);
    if (v13 > COMPRESSION_STATUS_END)
    {
      compression_stream_destroy(&stream);
      uint64_t v17 = @"Failed to decompress model cache.";
      goto LABEL_26;
    }
    if (stream.dst_size != 1024) {
      [v12 appendBytes:v21 length:1024 - stream.dst_size];
    }
  }
  while (v13 == COMPRESSION_STATUS_OK);
  compression_stream_destroy(&stream);
  if (!v12) {
    goto LABEL_21;
  }
  int v11 = (void *)[v12 length];
  if (v11)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    int v11 = (void *)+[_PFRoutines unarchiveCylicGraphObjectOfClasses:fromData:error:]((uint64_t)_PFRoutines, v14, (uint64_t)v12, 0);
  }
LABEL_22:
  id v15 = v11;
LABEL_23:

  -[NSSQLiteConnection releaseSQLStatement](v1);
  -[NSSQLiteConnection setColumnsToFetch:]((void *)v1, 0);
  *(_DWORD *)(v1 + 312) &= ~2u;
  *(void *)(v1 + 100) = 0;
  *(void *)(v1 + 92) = 0;
  *(_DWORD *)(v1 + 108) = 0;

  [v4 drain];
  id v16 = 0;
  return v15;
}

- (uint64_t)saveCachedModel:(uint64_t)result
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = (void *)result;
    id v4 = *(NSObject **)(result + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    if (-[NSSQLiteConnection _hasTableWithName:isTemp:]((uint64_t)v3, @"Z_MODELCACHE", 0)) {
      uint64_t v6 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([v3 adapter], objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM %@", @"Z_MODELCACHE"));
    }
    else {
      uint64_t v6 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([v3 adapter], objc_msgSend(NSString, "stringWithFormat:", @"CREATE TABLE %@ (%@ BLOB)", @"Z_MODELCACHE", @"Z_CONTENT"));
    }
    -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v3, v6);

    id v7 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    uint64_t v8 = (void *)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a2 requiringSecureCoding:1 error:0];
    uint64_t v9 = v8;
    if (v8 && [v8 length])
    {
      memset(&stream, 0, sizeof(stream));
      if (compression_stream_init(&stream, COMPRESSION_STREAM_ENCODE, COMPRESSION_ZLIB))
      {
        uint64_t v22 = @"Could not initialize compression encoder.";
      }
      else
      {
        uint64_t v10 = (void *)[MEMORY[0x1E4F1CA58] data];
        stream.src_ptr = (const uint8_t *)[v9 bytes];
        stream.src_size = [v9 length];
        while (1)
        {
          stream.dst_ptr = v25;
          stream.doff_t st_size = 1024;
          compression_status v11 = compression_stream_process(&stream, 1);
          if (v11 > COMPRESSION_STATUS_END) {
            break;
          }
          if (stream.dst_size != 1024) {
            [v10 appendBytes:v25 length:1024 - stream.dst_size];
          }
          if (v11)
          {
            compression_stream_destroy(&stream);
            goto LABEL_17;
          }
        }
        compression_stream_destroy(&stream);
        uint64_t v22 = @"Failed to decompress model cache.";
      }
      id v23 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134060, (uint64_t)v22, 0);
      objc_exception_throw(v23);
    }
    uint64_t v10 = 0;
LABEL_17:
    id v12 = v10;
    [v7 drain];
    id v13 = v10;
    if (v13)
    {
      uint64_t v14 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([v3 adapter], objc_msgSend(NSString, "stringWithFormat:", @"INSERT INTO %@ (%@) VALUES (?)"));
      id v15 = [[NSSQLBindVariable alloc] initWithValue:v13 sqlType:10 propertyDescription:0];
      -[NSSQLiteStatement addBindVariable:]((uint64_t)v14, v15);
      -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v3, v14);
      if (+[NSSQLCore debugDefault] >= 2) {
        _NSCoreDataLog(4, @"Saving new model cache", v16, v17, v18, v19, v20, v21, @"Z_MODELCACHE");
      }
    }
    return [v5 drain];
  }
  return result;
}

- (void)didCreateSchema
{
  if ((a1[312] & 0x40) != 0)
  {
    id v2 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([a1 adapter], @"pragma journal_mode=wal");
    -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v2);
  }
}

- (uint64_t)recreateIndices
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = (id *)result;
    id v2 = *(NSObject **)(result + 8);
    if (v2) {
      dispatch_assert_queue_V2(v2);
    }
    if (+[NSSQLCore debugDefault] >= 1) {
      _NSCoreDataLog(4, @"re-adding all missing indices", v3, v4, v5, v6, v7, v8, v22);
    }
    uint64_t v9 = (void *)[v1[2] model];
    id v10 = -[NSSQLiteConnection fetchCreationSQLForType:containing:]((uint64_t)v1, @"index", 0);
    compression_status v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __37__NSSQLiteConnection_recreateIndices__block_invoke;
    v35[3] = &unk_1E544E010;
    v35[4] = v11;
    [v10 enumerateObjectsUsingBlock:v35];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    if (v9) {
      uint64_t v9 = (void *)v9[4];
    }
    uint64_t v12 = [v9 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v12)
    {
      id obj = v9;
      uint64_t v24 = *(void *)v32;
      do
      {
        uint64_t v13 = 0;
        uint64_t v25 = v12;
        do
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * v13);
          uint64_t v15 = [v1 adapter];
          if (v15) {
            id v16 = -[NSSQLiteAdapter newCreateIndexStatementsForEntity:defaultIndicesOnly:](v15, v14, 0);
          }
          else {
            id v16 = 0;
          }
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v36 count:16];
          uint64_t v26 = v13;
          if (v17)
          {
            uint64_t v18 = *(void *)v28;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v28 != v18) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
                if ((objc_msgSend(v11, "containsObject:", objc_msgSend((id)objc_msgSend(v20, "sqlString"), "stringByReplacingOccurrencesOfString:withString:", @"IF NOT EXISTS ", &stru_1ED787880)) & 1) == 0)
                {
                  -[NSSQLiteConnection beginTransaction]((uint64_t)v1);
                  -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v1, v20);
                  -[NSSQLiteConnection commitTransaction]((uint64_t)v1);
                }
              }
              uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v36 count:16];
            }
            while (v17);
          }

          uint64_t v13 = v26 + 1;
        }
        while (v26 + 1 != v25);
        uint64_t v21 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
        uint64_t v12 = v21;
      }
      while (v21);
    }
    -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v1, 0);

    if (v12) {
      objc_exception_rethrow();
    }
    return 1;
  }
  return result;
}

uint64_t __37__NSSQLiteConnection_recreateIndices__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 count];
  if (result == 2)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = [a2 objectAtIndexedSubscript:1];
    return [v5 addObject:v6];
  }
  return result;
}

- (uint64_t)_walCheckpoint
{
  if (!a1) {
    return 0;
  }
  id v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_assert_queue_V2(v2);
  }
  uint64_t v3 = *(sqlite3 **)(a1 + 72);
  if (v3)
  {
    int pnLog = 0;
    int pnCkpt = 0;
    sqlite3_busy_timeout(v3, 1);
    uint64_t v4 = sqlite3_wal_checkpoint_v2(*(sqlite3 **)(a1 + 72), "main", 3, &pnLog, &pnCkpt);
    uint64_t v11 = v4;
    if (v4 == 6)
    {
      uint64_t v12 = @"WAL checkpoint: Database locked";
    }
    else
    {
      if (v4 != 5)
      {
        if (v4)
        {
          uint64_t v13 = sqlite3_errmsg(*(sqlite3 **)(a1 + 72));
          _NSCoreDataLog(1, @"WAL checkpoint: Failed: %s", v14, v15, v16, v17, v18, v19, (uint64_t)v13);
          return v11;
        }
        _NSCoreDataLog(9, @"WAL checkpoint: Database did checkpoint. Log size: %d checkpointed: %d", v5, v6, v7, v8, v9, v10, pnLog);
        goto LABEL_13;
      }
      uint64_t v12 = @"WAL checkpoint: Database busy";
    }
    _NSCoreDataLog(9, (uint64_t)v12, v5, v6, v7, v8, v9, v10, v21);
LABEL_13:
    -[NSSQLiteConnection _restoreBusyTimeOutSettings](a1);
    return v11;
  }
  return 26;
}

- (void)scheduleWALCheckpointAfter:(double)a3 retry:
{
  if (a1)
  {
    uint64_t v6 = *(NSObject **)(a1 + 8);
    if (v6) {
      dispatch_assert_queue_V2(v6);
    }
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x3052000000;
    v9[3] = __Block_byref_object_copy__29;
    v9[4] = __Block_byref_object_dispose__29;
    v9[5] = a1;
    if (!*(void *)(a1 + 360))
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__NSSQLiteConnection_scheduleWALCheckpointAfter_retry___block_invoke;
      block[3] = &unk_1E544E038;
      block[4] = v9;
      void block[5] = a2;
      *(double *)&block[6] = a3;
      *(void *)(a1 + 360) = dispatch_block_create((dispatch_block_flags_t)0, block);
      dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      dispatch_after(v7, *(dispatch_queue_t *)(a1 + 8), *(dispatch_block_t *)(a1 + 360));
    }
    _Block_object_dispose(v9, 8);
  }
}

void __55__NSSQLiteConnection_scheduleWALCheckpointAfter_retry___block_invoke(uint64_t a1)
{
  _Block_release(*(const void **)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 360));
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 360) = 0;
  uint64_t v4 = 0;
  id v2 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, @"CoreData: WAL checkpoint", &v4);
  if (readFileSizeFromJournalHandle(*(sqlite3 **)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 72)) > 0x800000
    && -[NSSQLiteConnection _walCheckpoint](*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
     - 5 <= 1)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      -[NSSQLiteConnection scheduleWALCheckpointAfter:retry:](*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v3 - 1, *(double *)(a1 + 48));
    }
  }
  +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v4, v2);
}

- (uint64_t)logQueryPlanForStatement:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    ppStmt = 0;
    uint64_t v5 = (const char *)objc_msgSend((id)objc_msgSend(a2, "sqlString"), "UTF8String");
    if (v5)
    {
      uint64_t v6 = sqlite3_mprintf("EXPLAIN QUERY PLAN %s", v5);
      if (v6)
      {
        dispatch_time_t v7 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"SQLite: %s", v6);
        uint64_t v2 = sqlite3_prepare_v2(*(sqlite3 **)(v2 + 72), v6, -1, &ppStmt, 0);
        sqlite3_free(v6);
        if (!v2)
        {
          while (sqlite3_step(ppStmt) == 100)
          {
            [v7 appendString:@"\n     "];
            uint64_t v14 = sqlite3_column_int(ppStmt, 0);
            uint64_t v15 = sqlite3_column_int(ppStmt, 1);
            uint64_t v16 = sqlite3_column_int(ppStmt, 2);
            objc_msgSend(v7, "appendFormat:", @"%d %d %d %s", v14, v15, v16, sqlite3_column_text(ppStmt, 3));
          }
          _NSCoreDataLog(7, @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
          sqlite3_reset(ppStmt);
          uint64_t v2 = sqlite3_finalize(ppStmt);
        }
      }
      else
      {
        uint64_t v2 = 7;
      }
    }
    else
    {
      uint64_t v2 = 1;
    }
    [v4 drain];
    id v17 = 0;
  }
  return v2;
}

uint64_t __45__NSSQLiteConnection_indexesUsedByStatement___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (char *)sqlite3_column_text(a2, 3);
  id v4 = strstr(v3, " INDEX ");
  if (v4 && sscanf(v4 + 7, "%1023s", v6)) {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(NSString, "stringWithUTF8String:", v6));
  }
  return 0;
}

- (uint64_t)hasIndexTrackingTable
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = NSString;
    uint64_t v3 = (objc_class *)objc_opt_class();
    uint64_t v4 = [v2 stringWithFormat:@"A%@", -[NSString uppercaseString](NSStringFromClass(v3), "uppercaseString")];
    return -[NSSQLiteConnection _hasTableWithName:isTemp:](v1, v4, 0);
  }
  return result;
}

- (void)dropIndexTrackingTable
{
  if (a1)
  {
    uint64_t v2 = (NSSQLiteStatement *)[a1 adapter];
    uint64_t v3 = NSString;
    uint64_t v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = [v3 stringWithFormat:@"A%@", -[NSString uppercaseString](NSStringFromClass(v4), "uppercaseString")];
    uint64_t v6 = -[NSSQLiteAdapter newDropTableStatementForTableNamed:](v2, v5);
    -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v6);
  }
}

- (uint64_t)setUpIndexTracking
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!a1 || ![a1[2] _persistentStoreCoordinator]) {
    return 0;
  }
  if ([a1[2] isReadOnly])
  {
    _NSCoreDataLog(2, @"index tracking enabled on read-only store", v2, v3, v4, v5, v6, v7, v30);
    return 0;
  }
  uint64_t v9 = a1[2];
  if (v9 && (v9[202] & 1) != 0 && (-[NSSQLiteConnection hasIndexTrackingTable]((uint64_t)a1) & 1) == 0)
  {
    -[NSSQLiteConnection beginTransaction]((uint64_t)a1);
    if (!-[NSSQLiteConnection hasIndexTrackingTable]((uint64_t)a1))
    {
      uint64_t v11 = objc_msgSend((id)objc_msgSend(a1[2], "ancillarySQLModels"), "objectForKey:", @"NSPersistentStoreTrackIndexUseOptionKey");
      uint64_t v12 = v11;
      if (v11) {
        uint64_t v13 = *(void **)(v11 + 24);
      }
      else {
        uint64_t v13 = 0;
      }
      uint64_t v14 = (objc_class *)objc_opt_class();
      long long v32 = (void *)[v13 objectForKeyedSubscript:NSStringFromClass(v14)];
      if (v12) {
        uint64_t v15 = *(void **)(v12 + 32);
      }
      else {
        uint64_t v15 = 0;
      }
      -[NSSQLiteConnection createTablesForEntities:]((uint64_t)a1, v15);
      id v16 = -[NSSQLiteConnection fetchCreationSQLForType:containing:]((uint64_t)a1, @"index", 0);
      sqlite3_int64 v17 = -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:]((uint64_t)a1, (uint64_t)v32, [v16 count]);
      BOOL v18 = v17 != 0;
      uint64_t v19 = [v16 count];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id obj = v16;
      uint64_t v20 = [v16 countByEnumeratingWithState:&v38 objects:v44 count:16];
      if (v20)
      {
        uint64_t v21 = v17 - v19 + 1;
        uint64_t v33 = *(void *)v39;
LABEL_19:
        uint64_t v22 = 0;
        while (1)
        {
          if (*(void *)v39 != v33) {
            objc_enumerationMutation(obj);
          }
          if (!v18) {
            break;
          }
          id v23 = strstr((char *)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * v22), "objectAtIndexedSubscript:", 1), "UTF8String"), " INDEX ");
          if (sscanf(v23 + 7, "%1023s", v43))
          {
            -[NSSQLiteConnection prepareInsertStatementForAncillaryEntity:]((uint64_t)a1, v32);
            long long v36 = 0u;
            long long v37 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            uint64_t v24 = (void *)[a1[6] bindVariables];
            uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v42 count:16];
            if (v25)
            {
              uint64_t v26 = *(void *)v35;
              do
              {
                for (uint64_t i = 0; i != v25; ++i)
                {
                  if (*(void *)v35 != v26) {
                    objc_enumerationMutation(v24);
                  }
                  long long v28 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                  int v29 = [v28 index];
                  if (v29)
                  {
                    if (v29 == 4) {
                      objc_msgSend(v28, "setValue:", objc_msgSend((id)objc_msgSend(NSString, "stringWithUTF8String:", v43), "uppercaseString"));
                    }
                  }
                  else
                  {
                    [v28 setInt64:v21++];
                  }
                }
                uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v42 count:16];
              }
              while (v25);
            }
            [a1 execute];
            BOOL v18 = 1;
            -[NSSQLiteConnection _clearBindVariablesForInsertedRow]((uint64_t)a1);
            -[NSSQLiteConnection releaseSQLStatement]((uint64_t)a1);
          }
          else
          {
            BOOL v18 = 1;
          }
          if (++v22 == v20)
          {
            uint64_t v20 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
            if (v20) {
              goto LABEL_19;
            }
            goto LABEL_39;
          }
        }
      }
      else
      {
LABEL_39:
        if (v18)
        {
          uint64_t v8 = 1;
          -[NSSQLiteConnection commitTransaction]((uint64_t)a1);
          return v8;
        }
      }
      uint64_t v8 = 0;
      -[NSSQLiteConnection rollbackTransaction]((uint64_t)a1);
      return v8;
    }
    -[NSSQLiteConnection rollbackTransaction]((uint64_t)a1);
  }
  return 1;
}

- (void)harvestUsedIndexes
{
  if (result)
  {
    uint64_t v1 = (void *)result[43];
    result[43] = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    return v1;
  }
  return result;
}

- (uint64_t)fetchUbiquityKnowledgeVector
{
  if (result)
  {
    uint64_t v1 = result;
    char v2 = 0;
    uint64_t v15 = result + 92;
    uint64_t v16 = 0;
    for (int i = 3; (v2 & 1) == 0 && (i & 0x80000000) == 0; --i)
    {
      -[NSSQLiteConnection connect](v1);
      uint64_t v3 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([(id)v1 adapter], @"select YPEERID, YTRANSACTIONNUMBER, Y_PK from Y_UBMETA");
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      sqlite3_int64 v17 = v3;
      uint64_t v4 = [[NSSQLColumn alloc] initWithColumnName:@"YPEERID" sqlType:6];
      [v19 addObject:v4];

      uint64_t v5 = [[NSSQLColumn alloc] initWithColumnName:@"YTRANSACTIONNUMBER" sqlType:2];
      [v19 addObject:v5];

      uint64_t v6 = [[NSSQLColumn alloc] initWithColumnName:@"Y_PK" sqlType:2];
      [v19 addObject:v6];

      if (!*(void *)(v1 + 72))
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Database not open: %@", "-[NSSQLiteConnection fetchUbiquityKnowledgeVector]", 8505, v1);
        }
        -[NSSQLiteConnection connect](v1);
      }
      -[NSSQLiteConnection _ensureDatabaseOpen]((void *)v1);
      -[NSSQLiteConnection _ensureNoStatementPrepared](v1);
      -[NSSQLiteConnection _ensureNoTransactionOpen](v1);
      -[NSSQLiteConnection _ensureNoFetchInProgress](v1);
      -[NSSQLiteConnection prepareSQLStatement:](v1, v3);
      -[NSSQLiteConnection setColumnsToFetch:]((void *)v1, v19);
      [(id)v1 execute];
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      while (1)
      {
        uint64_t v8 = -[NSSQLiteConnection newFetchedArray](v1);
        if (!v8) {
          break;
        }
        uint64_t v9 = v8;
        if ([v8 count] == 3)
        {
          uint64_t v10 = [v9 objectAtIndex:0];
          uint64_t v11 = [v9 objectAtIndex:1];
          uint64_t v12 = [v9 objectAtIndex:2];
          uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v10, @"YPEERID", v11, @"YTRANSACTIONNUMBER", v12, @"Y_PK", 0);
          [v7 setObject:v13 forKey:v10];
        }
        else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
        {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  CoreData: Ubiquity: Had trouble fetching ubiquity knowledge vector from store: %@", "-[NSSQLiteConnection fetchUbiquityKnowledgeVector]", 8530, v1);
        }
      }
      char v2 = 1;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v7];

      uint64_t v16 = v14;
      -[NSSQLiteConnection releaseSQLStatement](v1);
      -[NSSQLiteConnection setColumnsToFetch:]((void *)v1, 0);
      *(_DWORD *)(v1 + 312) &= ~2u;
      *(void *)uint64_t v15 = 0;
      *(void *)(v15 + 8) = 0;
      *(_DWORD *)(v15 + 16) = 0;
    }
    return v16;
  }
  return result;
}

- (void)updateUbiquityKnowledgeVector:(void *)result
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = (uint64_t)result;
    uint64_t result = (void *)[a2 allKeys];
    id obj = result;
    char v3 = 0;
    uint64_t v17 = *MEMORY[0x1E4F1C3B8];
    int v18 = 3;
    while ((v3 & 1) == 0 && (v18 & 0x80000000) == 0)
    {
      -[NSSQLiteConnection connect](v2);
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v4)
      {
        uint64_t v5 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v4; ++i)
          {
            if (*(void *)v22 != v5) {
              objc_enumerationMutation(obj);
            }
            id v7 = *(__CFString **)(*((void *)&v21 + 1) + 8 * i);
            uint64_t v8 = (void *)[a2 objectForKey:v7];
            uint64_t v9 = [v8 objectForKey:@"YTRANSACTIONNUMBER"];
            uint64_t v10 = [v8 objectForKey:@"Y_PK"];
            uint64_t v11 = [v8 objectForKey:@"OLDYTRANSACTIONNUMBER"];
            if (v10) {
              uint64_t v12 = (void *)[[NSString alloc] initWithFormat:@"UPDATE OR FAIL Y_UBMETA set YPEERID=\"%@\", YTRANSACTIONNUMBER=%@ where YTRANSACTIONNUMBER=%@ AND Y_PK=%@", v7, v9, v11, v10];
            }
            else {
              uint64_t v12 = (void *)[[NSString alloc] initWithFormat:@"INSERT INTO Y_UBMETA(YPEERID, YTRANSACTIONNUMBER) VALUES(\"%@\", %@)", v7, v9];
            }
            uint64_t v13 = v12;
            -[NSSQLiteConnection _executeSQLString:](v2, v12);
            uint64_t v14 = *(sqlite3 **)(v2 + 72);
            if (!v14 || !sqlite3_changes(v14))
            {
              if (v7) {
                uint64_t v15 = v7;
              }
              else {
                uint64_t v15 = @"<null>";
              }
              id v16 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v17, 134304, 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v15, @"offendingPeerID", @"import", @"offendingOperation", 0));
              objc_exception_throw(v16);
            }

            char v3 = 1;
          }
          uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v4);
      }
      else
      {
        char v3 = 0;
      }

      -[NSSQLiteConnection releaseSQLStatement](v2);
      uint64_t result = -[NSSQLiteConnection setColumnsToFetch:]((void *)v2, 0);
      --v18;
      *(_DWORD *)(v2 + 312) &= ~2u;
      *(void *)(v2 + 92) = 0;
      *(void *)(v2 + 100) = 0;
      *(_DWORD *)(v2 + 108) = 0;
    }
  }
  return result;
}

- (void)replaceUbiquityKnowledgeVector:(void *)result
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    uint64_t result = (void *)[a2 allKeys];
    id obj = result;
    char v4 = 0;
    uint64_t v16 = *MEMORY[0x1E4F1C3B8];
    int v17 = 3;
    while ((v4 & 1) == 0 && (v17 & 0x80000000) == 0)
    {
      -[NSSQLiteConnection connect](v3);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v5)
      {
        uint64_t v6 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v20 != v6) {
              objc_enumerationMutation(obj);
            }
            uint64_t v8 = *(__CFString **)(*((void *)&v19 + 1) + 8 * i);
            uint64_t v9 = (void *)[[NSString alloc] initWithFormat:@"DELETE FROM Y_UBMETA WHERE YPEERID = \"%@\"", v8];
            -[NSSQLiteConnection _executeSQLString:](v3, v9);
            uint64_t v10 = *(sqlite3 **)(v3 + 72);
            if (v10) {
              sqlite3_changes(v10);
            }

            uint64_t v11 = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", v8), "objectForKey:", @"YTRANSACTIONNUMBER");
            uint64_t v12 = (void *)[[NSString alloc] initWithFormat:@"INSERT INTO Y_UBMETA(YPEERID, YTRANSACTIONNUMBER) VALUES(\"%@\", %@)", v8, v11];
            -[NSSQLiteConnection _executeSQLString:](v3, v12);
            uint64_t v13 = *(sqlite3 **)(v3 + 72);
            if (!v13 || !sqlite3_changes(v13))
            {
              if (v8) {
                uint64_t v14 = v8;
              }
              else {
                uint64_t v14 = @"<null>";
              }
              id v15 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v16, 134304, 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v14, @"offendingPeerID", @"import", @"offendingOperation", 0));
              objc_exception_throw(v15);
            }

            char v4 = 1;
          }
          uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v5);
      }
      else
      {
        char v4 = 0;
      }

      -[NSSQLiteConnection releaseSQLStatement](v3);
      uint64_t result = -[NSSQLiteConnection setColumnsToFetch:]((void *)v3, 0);
      --v17;
      *(_DWORD *)(v3 + 312) &= ~2u;
      *(void *)(v3 + 92) = 0;
      *(void *)(v3 + 100) = 0;
      *(_DWORD *)(v3 + 108) = 0;
    }
  }
  return result;
}

- (void)updateUbiquityKnowledgeForPeerWithID:(void *)a3 andTransactionNumber:
{
  if (result)
  {
    uint64_t v5 = (uint64_t)result;
    char v6 = 0;
    id v7 = @"<null>";
    if (a2) {
      id v7 = a2;
    }
    int v17 = v7;
    uint64_t v16 = *MEMORY[0x1E4F1C3B8];
    uint64_t v8 = (char *)result + 92;
    for (int i = 3; (v6 & 1) == 0 && (i & 0x80000000) == 0; --i)
    {
      -[NSSQLiteConnection connect](v5);
      if ([a3 unsignedIntegerValue]) {
        uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"UPDATE OR FAIL Y_UBMETA set YPEERID=\"%@\", YTRANSACTIONNUMBER=%@ WHERE YPEERID=\"%@\"", a2, a3, a2];
      }
      else {
        uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"INSERT INTO Y_UBMETA(YPEERID, YTRANSACTIONNUMBER) VALUES(\"%@\", %@)", a2, a3];
      }
      uint64_t v11 = v10;
      -[NSSQLiteConnection _executeSQLString:](v5, v10);
      uint64_t v12 = *(sqlite3 **)(v5 + 72);
      if (!v12 || !sqlite3_changes(v12))
      {
        uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v14 = (uint64_t)v11;
        if (!v11) {
          uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
        }
        id v15 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v16, 134304, 0, objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v17, @"offendingPeerID", @"export", @"offendingOperation", v14, @"sqlString", 0));
        objc_exception_throw(v15);
      }
      char v6 = 1;

      -[NSSQLiteConnection releaseSQLStatement](v5);
      uint64_t result = -[NSSQLiteConnection setColumnsToFetch:]((void *)v5, 0);
      *(_DWORD *)(v5 + 312) &= ~2u;
      *(void *)uint64_t v8 = 0;
      *((void *)v8 + 1) = 0;
      *((_DWORD *)v8 + 4) = 0;
    }
  }
  return result;
}

- (void)addPeerRange:(void *)result
{
  if (result)
  {
    if (a2)
    {
      uint64_t v3 = a2[1];
      uint64_t v4 = a2[2];
      uint64_t v5 = a2[3];
      uint64_t v6 = a2[4];
      uint64_t v7 = a2[5];
      uint64_t v8 = a2[6];
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v5 = 0;
      uint64_t v3 = 0;
      uint64_t v4 = 0;
      uint64_t v6 = 0;
      uint64_t v8 = 0;
    }
    return -[NSSQLiteConnection addPeerRangeForPeerID:entityName:rangeStart:rangeEnd:peerRangeStart:peerRangeEnd:](result, v3, v4, v5, v6, v7, v8);
  }
  return result;
}

- (void)addPeerRangeForPeerID:(uint64_t)a3 entityName:(uint64_t)a4 rangeStart:(uint64_t)a5 rangeEnd:(uint64_t)a6 peerRangeStart:(uint64_t)a7 peerRangeEnd:
{
  if (result)
  {
    uint64_t v10 = (uint64_t)result;
    char v11 = 0;
    uint64_t v12 = (char *)result + 92;
    for (int i = 3; (v11 & 1) == 0 && (i & 0x80000000) == 0; --i)
    {
      -[NSSQLiteConnection connect](v10);
      uint64_t v14 = (void *)[[NSString alloc] initWithFormat:@"INSERT INTO Y_UBRANGE(YPEERID, YENTITYNAME, YRANGESTART, YRANGEEND, YPEERSTART, YPEEREND) VALUES(\"%@\", \"%@\", %@, %@, %@, %@)", a2, a3, a4, a5, a6, a7];
      -[NSSQLiteConnection _executeSQLString:](v10, v14);
      char v11 = 1;

      -[NSSQLiteConnection releaseSQLStatement](v10);
      uint64_t result = -[NSSQLiteConnection setColumnsToFetch:]((void *)v10, 0);
      *(_DWORD *)(v10 + 312) &= ~2u;
      *(void *)uint64_t v12 = 0;
      *((void *)v12 + 1) = 0;
      *((_DWORD *)v12 + 4) = 0;
    }
  }
  return result;
}

- allPeerRanges
{
  _DWORD *v1;
  char v2;
  void *v3;
  NSSQLColumn *v4;
  NSSQLColumn *v5;
  NSSQLColumn *v6;
  NSSQLColumn *v7;
  NSSQLColumn *v8;
  NSSQLColumn *v9;
  id v10;
  void *v11;
  void *v12;
  PFUbiquitySQLCorePeerRange *v13;
  uint64_t v14;
  _DWORD *v15;
  uint64_t v16;
  int i;
  id v18;

  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = 0;
    id v15 = result + 23;
    uint64_t v16 = 0;
    for (int i = 3; (v2 & 1) == 0 && (i & 0x80000000) == 0; --i)
    {
      -[NSSQLiteConnection connect]((uint64_t)v1);
      uint64_t v3 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([v1 adapter], @"SELECT YPEERID, YENTITYNAME, YRANGESTART, YRANGEEND, YPEERSTART, YPEEREND FROM Y_UBRANGE");
      int v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v4 = [[NSSQLColumn alloc] initWithColumnName:@"YPEERID" sqlType:6];
      [v18 addObject:v4];

      uint64_t v5 = [[NSSQLColumn alloc] initWithColumnName:@"YENTITYNAME" sqlType:6];
      [v18 addObject:v5];

      uint64_t v6 = [[NSSQLColumn alloc] initWithColumnName:@"YRANGESTART" sqlType:2];
      [v18 addObject:v6];

      uint64_t v7 = [[NSSQLColumn alloc] initWithColumnName:@"YRANGEEND" sqlType:2];
      [v18 addObject:v7];

      uint64_t v8 = [[NSSQLColumn alloc] initWithColumnName:@"YPEERSTART" sqlType:2];
      [v18 addObject:v8];

      uint64_t v9 = [[NSSQLColumn alloc] initWithColumnName:@"YPEEREND" sqlType:2];
      [v18 addObject:v9];

      -[NSSQLiteConnection _ensureDatabaseOpen](v1);
      -[NSSQLiteConnection _ensureNoStatementPrepared]((uint64_t)v1);
      -[NSSQLiteConnection _ensureNoTransactionOpen]((uint64_t)v1);
      -[NSSQLiteConnection _ensureNoFetchInProgress]((uint64_t)v1);
      -[NSSQLiteConnection prepareSQLStatement:]((uint64_t)v1, v3);
      -[NSSQLiteConnection setColumnsToFetch:](v1, v18);
      [v1 execute];
      uint64_t v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      while (1)
      {
        char v11 = -[NSSQLiteConnection newFetchedArray]((uint64_t)v1);
        if (!v11) {
          break;
        }
        uint64_t v12 = v11;
        if ([v11 count] == 6)
        {
          uint64_t v13 = -[PFUbiquitySQLCorePeerRange initWithOwningPeerID:entityName:rangeStart:rangeEnd:peerStart:peerEnd:]([PFUbiquitySQLCorePeerRange alloc], "initWithOwningPeerID:entityName:rangeStart:rangeEnd:peerStart:peerEnd:", [v12 objectAtIndex:0], objc_msgSend(v12, "objectAtIndex:", 1), objc_msgSend(v12, "objectAtIndex:", 2), objc_msgSend(v12, "objectAtIndex:", 3), objc_msgSend(v12, "objectAtIndex:", 4), objc_msgSend(v12, "objectAtIndex:", 5));
          [v10 addObject:v13];
        }
        else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
        {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  CoreData: Ubiquity: Had trouble fetching ubiquity knowledge vector from store: %@", "-[NSSQLiteConnection allPeerRanges]", 8807, v1);
        }
      }
      uint64_t v2 = 1;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithArray:v10];

      uint64_t v16 = v14;
      -[NSSQLiteConnection releaseSQLStatement]((uint64_t)v1);
      -[NSSQLiteConnection setColumnsToFetch:](v1, 0);
      v1[78] &= ~2u;
      *(void *)id v15 = 0;
      *((void *)v15 + 1) = 0;
      v15[4] = 0;
    }
    return (_DWORD *)v16;
  }
  return result;
}

- (id)createMapOfEntityNameToPKMaxForEntitiesFromPKTable:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!a1 || ![a2 count]) {
    return 0;
  }
  id v26 = 0;
  char v4 = 0;
  uint64_t v24 = *MEMORY[0x1E4F1C3B8];
  for (int i = 3; (v4 & 1) == 0 && (i & 0x80000000) == 0; --i)
  {
    -[NSSQLiteConnection connect](a1);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = [[NSSQLColumn alloc] initWithColumnName:@"Z_NAME" sqlType:6];
    [v5 addObject:v6];

    uint64_t v7 = [[NSSQLColumn alloc] initWithColumnName:@"MAX" sqlType:2];
    [v5 addObject:v7];

    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @"SELECT Z_NAME, Z_MAX FROM Z_PRIMARYKEY WHERE Z_NAME IN (");
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v9 = [a2 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v9)
    {
      char v10 = 0;
      uint64_t v11 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v9; ++j)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(a2);
          }
          uint64_t v13 = [*(id *)(*((void *)&v27 + 1) + 8 * j) name];
          if (v10) {
            uint64_t v14 = @", '%@'";
          }
          else {
            uint64_t v14 = @"'%@'";
          }
          objc_msgSend(v8, "appendFormat:", v14, v13);
          char v10 = 1;
        }
        uint64_t v9 = [a2 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v9);
    }
    [v8 appendString:@" GROUP BY Z_NAME"]);
    id v15 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([(id)a1 adapter], (uint64_t)v8);
    -[NSSQLiteConnection _ensureDatabaseOpen]((void *)a1);
    -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
    -[NSSQLiteConnection _ensureNoFetchInProgress](a1);
    -[NSSQLiteConnection prepareSQLStatement:](a1, v15);
    -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v5);
    [(id)a1 execute];
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v16 = v15;
    while (1)
    {
      int v17 = -[NSSQLiteConnection newFetchedArray](a1);
      int v18 = v17;
      if (!v17) {
        break;
      }
      uint64_t v19 = [v17 count];
      if (v19 != [v5 count]) {
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v24, @"Got the wrong number of rows back for the range max query", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "count")), @"fetchResultRows")));
      }
      uint64_t v20 = [v18 objectAtIndex:0];
      uint64_t v21 = [v18 objectAtIndex:1];
      if (v20 == [MEMORY[0x1E4F1CA98] null] || v21 == objc_msgSend(MEMORY[0x1E4F1CA98], "null"))
      {
      }
      else
      {
        [v26 setObject:v21 forKey:v20];
      }
    }
    long long v22 = v16;
    char v4 = 1;
    -[NSSQLiteConnection releaseSQLStatement](a1);
    -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0);
    *(_DWORD *)(a1 + 312) &= ~2u;
    *(void *)(a1 + 92) = 0;
    *(void *)(a1 + 100) = 0;
    *(_DWORD *)(a1 + 108) = 0;
  }
  return v26;
}

- (id)createMapOfEntityNameToPKMaxForEntitiesFromUBRangeTable:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!a1 || ![a2 count]) {
    return 0;
  }
  id v26 = 0;
  char v4 = 0;
  uint64_t v24 = *MEMORY[0x1E4F1C3B8];
  for (int i = 3; (v4 & 1) == 0 && (i & 0x80000000) == 0; --i)
  {
    -[NSSQLiteConnection connect](a1);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = [[NSSQLColumn alloc] initWithColumnName:@"YENTITYNAME" sqlType:6];
    [v5 addObject:v6];

    uint64_t v7 = [[NSSQLColumn alloc] initWithColumnName:@"MAX" sqlType:2];
    [v5 addObject:v7];

    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @"SELECT YENTITYNAME, MAX(YRANGEEND) FROM Y_UBRANGE WHERE YENTITYNAME IN (");
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v9 = [a2 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v9)
    {
      char v10 = 0;
      uint64_t v11 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v9; ++j)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(a2);
          }
          uint64_t v13 = [*(id *)(*((void *)&v27 + 1) + 8 * j) name];
          if (v10) {
            uint64_t v14 = @", '%@'";
          }
          else {
            uint64_t v14 = @"'%@'";
          }
          objc_msgSend(v8, "appendFormat:", v14, v13);
          char v10 = 1;
        }
        uint64_t v9 = [a2 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v9);
    }
    [v8 appendString:@" GROUP BY YENTITYNAME"]);
    id v15 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([(id)a1 adapter], (uint64_t)v8);
    -[NSSQLiteConnection _ensureDatabaseOpen]((void *)a1);
    -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
    -[NSSQLiteConnection _ensureNoFetchInProgress](a1);
    -[NSSQLiteConnection prepareSQLStatement:](a1, v15);
    -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v5);
    [(id)a1 execute];
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v16 = v15;
    while (1)
    {
      int v17 = -[NSSQLiteConnection newFetchedArray](a1);
      int v18 = v17;
      if (!v17) {
        break;
      }
      uint64_t v19 = [v17 count];
      if (v19 != [v5 count]) {
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v24, @"Got the wrong number of rows back for the range max query", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "count")), @"fetchResultRows")));
      }
      uint64_t v20 = [v18 objectAtIndex:0];
      uint64_t v21 = [v18 objectAtIndex:1];
      if (v20 == [MEMORY[0x1E4F1CA98] null] || v21 == objc_msgSend(MEMORY[0x1E4F1CA98], "null"))
      {
      }
      else
      {
        [v26 setObject:v21 forKey:v20];
      }
    }
    long long v22 = v16;
    char v4 = 1;
    -[NSSQLiteConnection releaseSQLStatement](a1);
    -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0);
    *(_DWORD *)(a1 + 312) &= ~2u;
    *(void *)(a1 + 92) = 0;
    *(void *)(a1 + 100) = 0;
    *(_DWORD *)(a1 + 108) = 0;
  }
  return v26;
}

- (void)setUbiquityTableValue:(uint64_t)a3 forKey:
{
  if (result)
  {
    uint64_t v5 = (uint64_t)result;
    char v6 = 0;
    uint64_t v7 = (char *)result + 92;
    for (int i = 3; (v6 & 1) == 0 && (i & 0x80000000) == 0; --i)
    {
      -[NSSQLiteConnection connect](v5);
      uint64_t v9 = (void *)[[NSString alloc] initWithFormat:@"REPLACE INTO Y_UBKVS(YKEY, YVALUE) VALUES(\"%@\", \"%@\")", a3, a2];
      -[NSSQLiteConnection _executeSQLString:](v5, v9);
      char v6 = 1;

      -[NSSQLiteConnection releaseSQLStatement](v5);
      uint64_t result = -[NSSQLiteConnection setColumnsToFetch:]((void *)v5, 0);
      *(_DWORD *)(v5 + 312) &= ~2u;
      *(void *)uint64_t v7 = 0;
      *((void *)v7 + 1) = 0;
      *((_DWORD *)v7 + 4) = 0;
    }
  }
  return result;
}

- (id)ubiquityTableValueForKey:(uint64_t)a1
{
  if (!a1 || ![a2 length]) {
    return 0;
  }
  id v4 = 0;
  for (int i = 3; !v4 && (i & 0x80000000) == 0; --i)
  {
    -[NSSQLiteConnection connect](a1);
    if (*(void *)(a1 + 72))
    {
      char v6 = (void *)[[NSString alloc] initWithFormat:@"select YVALUE from Y_UBKVS where YKEY = \"%@\"", a2];
      uint64_t v7 = -[NSSQLiteAdapter newStatementWithSQLString:]([(id)a1 adapter], (uint64_t)v6);
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v9 = (void *)v7;
      char v10 = [[NSSQLColumn alloc] initWithColumnName:@"YVALUE" sqlType:6];
      [v8 addObject:v10];

      -[NSSQLiteConnection _ensureDatabaseOpen]((void *)a1);
      -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
      -[NSSQLiteConnection _ensureNoTransactionOpen](a1);
      -[NSSQLiteConnection _ensureNoFetchInProgress](a1);
      -[NSSQLiteConnection prepareSQLStatement:](a1, v9);
      -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v8);
      [(id)a1 execute];
      id v4 = 0;
      while (1)
      {
        uint64_t v11 = -[NSSQLiteConnection newFetchedArray](a1);
        uint64_t v12 = v11;
        if (!v11) {
          break;
        }
        if ([v11 count] == 1)
        {
          id v4 = (id)[v12 objectAtIndex:0];
        }
        else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
        {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  CoreData: Ubiquity: Had trouble fetching ubiquity knowledge vector from store: %@", "-[NSSQLiteConnection ubiquityTableValueForKey:]", 9265, a1);
        }
      }
      -[NSSQLiteConnection releaseSQLStatement](a1);
      -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0);
      *(_DWORD *)(a1 + 312) &= ~2u;
      *(void *)(a1 + 92) = 0;
      *(void *)(a1 + 100) = 0;
      *(_DWORD *)(a1 + 108) = 0;
    }
    else
    {
      char v6 = 0;
      id v8 = 0;
      uint64_t v9 = 0;
      id v4 = 0;
    }
  }

  return v4;
}

- (void)dropUbiquityTables
{
  if (a1)
  {
    char v2 = 0;
    for (int i = 3; (v2 & 1) == 0 && (i & 0x80000000) == 0; --i)
    {
      -[NSSQLiteConnection connect](a1);
      if (*(void *)(a1 + 72))
      {
        -[NSSQLiteConnection beginTransaction](a1);
        -[NSSQLiteConnection _executeSQLString:](a1, @"DROP TABLE IF EXISTS Y_UBMETA");
        -[NSSQLiteConnection _executeSQLString:](a1, @"DROP TABLE IF EXISTS Y_UBRANGE");
        -[NSSQLiteConnection _executeSQLString:](a1, @"DROP TABLE IF EXISTS Y_KVS");
        -[NSSQLiteConnection commitTransaction](a1);
        char v2 = 1;
      }
      else
      {
        char v2 = 0;
      }
      -[NSSQLiteConnection endFetchAndRecycleStatement:](a1, 0);
    }
  }
}

- (BOOL)hasHistoryRows
{
  if (result) {
    return -[NSSQLiteConnection _tableHasRows:](result, @"ATRANSACTION");
  }
  return result;
}

- (uint64_t)_dropKnownHistoryTrackingTables
{
  v16[3] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = (void *)result;
    v16[0] = @"CHANGE";
    v16[1] = @"TRANSACTION";
    v16[2] = @"TRANSACTIONSTRING";
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id obj = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
    uint64_t result = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (result)
    {
      uint64_t v2 = result;
      uint64_t v3 = *(void *)v12;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v12 != v3) {
            objc_enumerationMutation(obj);
          }
          uint64_t v5 = *(void *)(*((void *)&v11 + 1) + 8 * v4);
          char v6 = (NSSQLiteStatement *)[v1 adapter];
          uint64_t v7 = -[NSSQLiteAdapter newDropTableStatementForTableNamed:](v6, [NSString stringWithFormat:@"A%@", v5]);
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v1, v7);

          id v8 = (void *)[[NSString alloc] initWithFormat:@"UPDATE OR FAIL %@ set %@=0 where %@ = '%@'", @"Z_PRIMARYKEY", @"Z_MAX", @"Z_NAME", v5];
          uint64_t v9 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([v1 adapter], (uint64_t)v8);

          -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v1, v9);
          ++v4;
        }
        while (v2 != v4);
        uint64_t result = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
        uint64_t v2 = result;
      }
      while (result);
    }
  }
  return result;
}

void __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  char v6 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v7 = (void *)[a2 entity];
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v9 = [NSString alloc];
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = _sqlCoreLookupSQLEntityForEntityDescription(v6, v7);
    id v11 = [NSString alloc];
    id v9 = v11;
    if (v10) {
      uint64_t v10 = *(unsigned int *)(v10 + 184);
    }
  }
  long long v12 = objc_msgSend(v9, "initWithFormat:", @"%u-%lld", v10, objc_msgSend(a2, "_referenceData64"));
  uint64_t v13 = [*(id *)(a1 + 40) objectForKey:v12];
  if (v13)
  {
    long long v14 = (void *)v13;
    uint64_t v15 = *(void *)(a1 + 48);
    if (v15) {
      uint64_t v16 = *(void **)(v15 + 8);
    }
    else {
      uint64_t v16 = 0;
    }
    objc_msgSend(v14, "addObject:", objc_msgSend(v16, "name"));
  }
  else
  {
    id v17 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v18 = *(void *)(a1 + 48);
    if (v18) {
      uint64_t v19 = *(void **)(v18 + 8);
    }
    else {
      uint64_t v19 = 0;
    }
    uint64_t v20 = objc_msgSend(v17, "initWithObjects:", objc_msgSend(v19, "name"), 0);
    [*(id *)(a1 + 40) setValue:v20 forKey:v12];
  }
  uint64_t v21 = *(void **)(*(void *)(a1 + 32) + 16);
  long long v22 = (void *)[a3 entity];
  if (v21 && v22)
  {
    uint64_t v23 = _sqlCoreLookupSQLEntityForEntityDescription(v21, v22);
    id v24 = [NSString alloc];
    if (v23) {
      uint64_t v23 = *(unsigned int *)(v23 + 184);
    }
  }
  else
  {
    id v24 = [NSString alloc];
    uint64_t v23 = 0;
  }
  id v35 = (id)objc_msgSend(v24, "initWithFormat:", @"%u-%lld", v23, objc_msgSend(a3, "_referenceData64"));
  uint64_t v25 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:");
  if (v25)
  {
    id v26 = (void *)v25;
    uint64_t v27 = *(void *)(a1 + 48);
    if (v27 && (uint64_t v28 = *(void *)(v27 + 8)) != 0) {
      long long v29 = *(void **)(v28 + 56);
    }
    else {
      long long v29 = 0;
    }
    objc_msgSend(v26, "addObject:", objc_msgSend(v29, "name"));
  }
  else
  {
    id v30 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v31 = *(void *)(a1 + 48);
    if (v31 && (uint64_t v32 = *(void *)(v31 + 8)) != 0) {
      uint64_t v33 = *(void **)(v32 + 56);
    }
    else {
      uint64_t v33 = 0;
    }
    long long v34 = objc_msgSend(v30, "initWithObjects:", objc_msgSend(v33, "name"), 0);
    [*(id *)(a1 + 40) setValue:v34 forKey:v35];
  }
}

void __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  char v6 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v7 = (void *)[a2 entity];
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v9 = [NSString alloc];
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = _sqlCoreLookupSQLEntityForEntityDescription(v6, v7);
    id v11 = [NSString alloc];
    id v9 = v11;
    if (v10) {
      uint64_t v10 = *(unsigned int *)(v10 + 184);
    }
  }
  long long v12 = objc_msgSend(v9, "initWithFormat:", @"%u-%lld", v10, objc_msgSend(a2, "_referenceData64"));
  uint64_t v13 = [*(id *)(a1 + 40) objectForKey:v12];
  if (v13)
  {
    long long v14 = (void *)v13;
    uint64_t v15 = *(void *)(a1 + 48);
    if (v15) {
      uint64_t v16 = *(void **)(v15 + 8);
    }
    else {
      uint64_t v16 = 0;
    }
    objc_msgSend(v14, "addObject:", objc_msgSend(v16, "name"));
  }
  else
  {
    id v17 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v18 = *(void *)(a1 + 48);
    if (v18) {
      uint64_t v19 = *(void **)(v18 + 8);
    }
    else {
      uint64_t v19 = 0;
    }
    uint64_t v20 = objc_msgSend(v17, "initWithObjects:", objc_msgSend(v19, "name"), 0);
    [*(id *)(a1 + 56) setValue:v20 forKey:v12];
  }
  uint64_t v21 = *(void **)(*(void *)(a1 + 32) + 16);
  long long v22 = (void *)[a3 entity];
  if (v21 && v22)
  {
    uint64_t v23 = _sqlCoreLookupSQLEntityForEntityDescription(v21, v22);
    id v24 = [NSString alloc];
    if (v23) {
      uint64_t v23 = *(unsigned int *)(v23 + 184);
    }
  }
  else
  {
    id v24 = [NSString alloc];
    uint64_t v23 = 0;
  }
  id v35 = (id)objc_msgSend(v24, "initWithFormat:", @"%u-%lld", v23, objc_msgSend(a3, "_referenceData64"));
  uint64_t v25 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:");
  if (v25)
  {
    id v26 = (void *)v25;
    uint64_t v27 = *(void *)(a1 + 48);
    if (v27 && (uint64_t v28 = *(void *)(v27 + 8)) != 0) {
      long long v29 = *(void **)(v28 + 56);
    }
    else {
      long long v29 = 0;
    }
    objc_msgSend(v26, "addObject:", objc_msgSend(v29, "name"));
  }
  else
  {
    id v30 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v31 = *(void *)(a1 + 48);
    if (v31 && (uint64_t v32 = *(void *)(v31 + 8)) != 0) {
      uint64_t v33 = *(void **)(v32 + 56);
    }
    else {
      uint64_t v33 = 0;
    }
    long long v34 = objc_msgSend(v30, "initWithObjects:", objc_msgSend(v33, "name"), 0);
    [*(id *)(a1 + 56) setValue:v34 forKey:v35];
  }
}

void __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  char v6 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v7 = (void *)[a2 entity];
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v9 = [NSString alloc];
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = _sqlCoreLookupSQLEntityForEntityDescription(v6, v7);
    id v11 = [NSString alloc];
    id v9 = v11;
    if (v10) {
      uint64_t v10 = *(unsigned int *)(v10 + 184);
    }
  }
  long long v12 = objc_msgSend(v9, "initWithFormat:", @"%u-%lld", v10, objc_msgSend(a2, "_referenceData64"));
  uint64_t v13 = [*(id *)(a1 + 40) objectForKey:v12];
  if (v13)
  {
    long long v14 = (void *)v13;
    uint64_t v15 = *(void *)(a1 + 48);
    if (v15 && (uint64_t v16 = *(void *)(v15 + 8)) != 0) {
      id v17 = *(void **)(v16 + 56);
    }
    else {
      id v17 = 0;
    }
    objc_msgSend(v14, "addObject:", objc_msgSend(v17, "name"));
  }
  else
  {
    id v18 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v19 = *(void *)(a1 + 48);
    if (v19 && (uint64_t v20 = *(void *)(v19 + 8)) != 0) {
      uint64_t v21 = *(void **)(v20 + 56);
    }
    else {
      uint64_t v21 = 0;
    }
    long long v22 = objc_msgSend(v18, "initWithObjects:", objc_msgSend(v21, "name"), 0);
    [*(id *)(a1 + 56) setValue:v22 forKey:v12];
  }
  uint64_t v23 = *(void **)(*(void *)(a1 + 32) + 16);
  id v24 = (void *)[a3 entity];
  if (v23 && v24)
  {
    uint64_t v25 = _sqlCoreLookupSQLEntityForEntityDescription(v23, v24);
    id v26 = [NSString alloc];
    if (v25) {
      uint64_t v25 = *(unsigned int *)(v25 + 184);
    }
  }
  else
  {
    id v26 = [NSString alloc];
    uint64_t v25 = 0;
  }
  id v35 = (id)objc_msgSend(v26, "initWithFormat:", @"%u-%lld", v25, objc_msgSend(a3, "_referenceData64"));
  uint64_t v27 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:");
  if (v27)
  {
    uint64_t v28 = (void *)v27;
    uint64_t v29 = *(void *)(a1 + 48);
    if (v29) {
      id v30 = *(void **)(v29 + 8);
    }
    else {
      id v30 = 0;
    }
    objc_msgSend(v28, "addObject:", objc_msgSend(v30, "name"));
  }
  else
  {
    id v31 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v32 = *(void *)(a1 + 48);
    if (v32) {
      uint64_t v33 = *(void **)(v32 + 8);
    }
    else {
      uint64_t v33 = 0;
    }
    long long v34 = objc_msgSend(v31, "initWithObjects:", objc_msgSend(v33, "name"), 0);
    [*(id *)(a1 + 56) setValue:v34 forKey:v35];
  }
}

void __67__NSSQLiteConnection_processRelationshipUpdates_forRequestContext___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  char v6 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v7 = (void *)[a2 entity];
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v9 = [NSString alloc];
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = _sqlCoreLookupSQLEntityForEntityDescription(v6, v7);
    id v11 = [NSString alloc];
    id v9 = v11;
    if (v10) {
      uint64_t v10 = *(unsigned int *)(v10 + 184);
    }
  }
  long long v12 = objc_msgSend(v9, "initWithFormat:", @"%u-%lld", v10, objc_msgSend(a2, "_referenceData64"));
  uint64_t v13 = [*(id *)(a1 + 40) objectForKey:v12];
  if (v13)
  {
    long long v14 = (void *)v13;
    uint64_t v15 = *(void *)(a1 + 48);
    if (v15) {
      uint64_t v16 = *(void **)(v15 + 8);
    }
    else {
      uint64_t v16 = 0;
    }
    objc_msgSend(v14, "addObject:", objc_msgSend(v16, "name"));
  }
  else
  {
    id v17 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v18 = *(void *)(a1 + 48);
    if (v18) {
      uint64_t v19 = *(void **)(v18 + 8);
    }
    else {
      uint64_t v19 = 0;
    }
    uint64_t v20 = objc_msgSend(v17, "initWithObjects:", objc_msgSend(v19, "name"), 0);
    [*(id *)(a1 + 40) setValue:v20 forKey:v12];
  }
  uint64_t v21 = *(void **)(*(void *)(a1 + 32) + 16);
  long long v22 = (void *)[a3 entity];
  if (v21 && v22)
  {
    uint64_t v23 = _sqlCoreLookupSQLEntityForEntityDescription(v21, v22);
    id v24 = [NSString alloc];
    if (v23) {
      uint64_t v23 = *(unsigned int *)(v23 + 184);
    }
  }
  else
  {
    id v24 = [NSString alloc];
    uint64_t v23 = 0;
  }
  id v35 = (id)objc_msgSend(v24, "initWithFormat:", @"%u-%lld", v23, objc_msgSend(a3, "_referenceData64"));
  uint64_t v25 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:");
  if (v25)
  {
    id v26 = (void *)v25;
    uint64_t v27 = *(void *)(a1 + 48);
    if (v27 && (uint64_t v28 = *(void *)(v27 + 8)) != 0) {
      uint64_t v29 = *(void **)(v28 + 56);
    }
    else {
      uint64_t v29 = 0;
    }
    objc_msgSend(v26, "addObject:", objc_msgSend(v29, "name"));
  }
  else
  {
    id v30 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v31 = *(void *)(a1 + 48);
    if (v31 && (uint64_t v32 = *(void *)(v31 + 8)) != 0) {
      uint64_t v33 = *(void **)(v32 + 56);
    }
    else {
      uint64_t v33 = 0;
    }
    long long v34 = objc_msgSend(v30, "initWithObjects:", objc_msgSend(v33, "name"), 0);
    [*(id *)(a1 + 40) setValue:v34 forKey:v35];
  }
}

- (void)processInsertRequest:(uint64_t)a1
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 16);
    uint64_t v5 = v4
       ? (void *)[*(id *)(v4 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"]
       : 0;
    if (![v5 count]
      || ((uint64_t v6 = *(void *)(a1 + 16)) == 0
        ? (uint64_t v7 = 0)
        : (uint64_t v7 = (void *)[*(id *)(v6 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"]), (objc_msgSend(v7, "containsObject:", objc_msgSend((id)objc_msgSend(a2, "persistentStoreRequest"), "entityName")) & 1) == 0))
    {
      if (a2) {
        uint64_t v8 = a2[11];
      }
      else {
        uint64_t v8 = 0;
      }
      id v9 = (void *)-[NSSQLiteConnection gatherHistoryChangesFromTable:](a1, v8);
      uint64_t v10 = (void *)[v9 valueForKey:@"inserts"];
      id v11 = (void *)[v9 valueForKey:@"updates"];
      if ([v10 count] || objc_msgSend(v11, "count"))
      {
        if (![v10 count]
          && [v11 count]
          && (-[NSSQLiteConnection hasAttributeChanges:](v11) & 1) == 0)
        {
          uint64_t v51 = [a2 persistentStoreRequest];
          _NSCoreDataLog(9, @"Batch Insert resulted in updates with no updated properties - %@ - %@", v42, v43, v44, v45, v46, v47, v51);
          return;
        }
        long long v55 = a2;
        id v53 = (id)-[NSSQLiteConnection _insertTransactionStringsForRequestContext:](a1, (uint64_t)a2);
        uint64_t v18 = -[NSSQLiteConnection _insertTransactionForRequestContext:andStrings:](a1, (uint64_t)a2, v53);
        uint64_t v19 = a1;
        sqlite3_int64 v20 = v18;
        uint64_t v61 = v19;
        uint64_t v21 = *(NSObject **)(v19 + 8);
        if (v21) {
          dispatch_assert_queue_V2(v21);
        }
        double v54 = v11;
        if ([v10 count])
        {
          id obj = v10;
          id v52 = objc_alloc_init(MEMORY[0x1E4F28B28]);
          long long v59 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v61 + 16), "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey"), "entityNamed:", @"CHANGE");
          sqlite3_int64 v22 = -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](v61, (uint64_t)v59, [v10 count]);
          if (!v22)
          {
            id v48 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134030, @"unable to generate primary keys", 0);
            objc_exception_throw(v48);
          }
          uint64_t v23 = [v10 count];
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          uint64_t v24 = [v10 countByEnumeratingWithState:&v66 objects:v71 count:16];
          if (v24)
          {
            sqlite3_int64 v25 = v22 - v23;
            uint64_t v57 = *(void *)v67;
            do
            {
              uint64_t v26 = 0;
              uint64_t v58 = v24;
              do
              {
                if (*(void *)v67 != v57) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v27 = *(void **)(*((void *)&v66 + 1) + 8 * v26);
                uint64_t v28 = (void *)MEMORY[0x18C127630]();
                uint64_t v29 = _sqlCoreLookupSQLEntityForEntityDescription(*(void **)(v61 + 16), (void *)[v27 entity]);
                uint64_t v60 = v26;
                if (v29) {
                  uint64_t v30 = *(unsigned int *)(v29 + 184);
                }
                else {
                  uint64_t v30 = 0;
                }
                -[NSSQLiteConnection prepareInsertStatementForAncillaryEntity:](v61, v59);
                long long v64 = 0u;
                long long v65 = 0u;
                long long v62 = 0u;
                long long v63 = 0u;
                uint64_t v31 = (void *)[*(id *)(v61 + 48) bindVariables];
                uint64_t v32 = [v31 countByEnumeratingWithState:&v62 objects:v70 count:16];
                ++v25;
                if (v32)
                {
                  uint64_t v33 = *(void *)v63;
                  do
                  {
                    for (uint64_t i = 0; i != v32; ++i)
                    {
                      if (*(void *)v63 != v33) {
                        objc_enumerationMutation(v31);
                      }
                      id v35 = *(void **)(*((void *)&v62 + 1) + 8 * i);
                      if (![v35 index])
                      {
                        int v36 = [v35 sqlType];
                        sqlite3_int64 v37 = v25;
                        if (v36 == 2)
                        {
LABEL_35:
                          [v35 setInt64:v37];
                          continue;
                        }
                      }
                      if ([v35 index] != 1
                        && [v35 index] != 2)
                      {
                        if ([v35 index] == 3)
                        {
                          int v38 = [v35 sqlType];
                          sqlite3_int64 v37 = v20;
                          if (v38 == 2) {
                            goto LABEL_35;
                          }
                        }
                        if (objc_msgSend(v35, "index", v37) == 4)
                        {
                          uint64_t v39 = [NSNumber numberWithUnsignedInteger:0];
                        }
                        else if ([v35 index] == 6)
                        {
                          uint64_t v39 = [NSNumber numberWithUnsignedInt:v30];
                        }
                        else
                        {
                          if ([v35 index] != 7) {
                            continue;
                          }
                          uint64_t v39 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v27, "_referenceData64"));
                        }
                        [v35 setValue:v39];
                      }
                    }
                    uint64_t v32 = [v31 countByEnumeratingWithState:&v62 objects:v70 count:16];
                  }
                  while (v32);
                }
                [(id)v61 execute];
                if (!*(void *)(v61 + 80))
                {
                  long long v40 = -[NSSQLiteConnection statementCacheForEntity:](v61, v59);
                  -[NSSQLiteStatementCache cacheInsertStatement:](v40, 0);
                }
                -[NSSQLiteConnection _clearBindVariablesForInsertedRow](v61);
                -[NSSQLiteConnection resetSQLStatement](v61);
                uint64_t v26 = v60 + 1;
              }
              while (v60 + 1 != v58);
              uint64_t v41 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
              uint64_t v24 = v41;
            }
            while (v41);
          }

          id v49 = 0;
        }
        -[NSSQLiteConnection insertUpdates:transactionID:updatedAttributes:](v61, v54, v20, objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v55, "persistentStoreRequest"), "entity"), "attributesByName"), "allValues"));
        uint64_t v50 = [NSNumber numberWithLongLong:v20];
        if (v55) {
          v55[9] = v50;
        }
      }
      else
      {
        _NSCoreDataLog(9, @"Batch Insert resulted in no changes - %@ - %@", v12, v13, v14, v15, v16, v17, (uint64_t)v10);
      }
    }
  }
}

- (uint64_t)gatherHistoryChangesFromTable:(uint64_t)a1
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (-[NSSQLiteConnection _tableHasRows:](a1, a2))
  {
    uint64_t v3 = -[NSSQLiteAdapter newStatementWithSQLString:]([(id)a1 adapter], objc_msgSend(NSString, "stringWithFormat:", @"SELECT ENTITYID, PRIMEKEY, TYPE,  group_concat(ATTRIBUTENAME) FROM %@ GROUP BY ENTITYID, PRIMEKEY", a2));
    id v57 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v54 = (void *)v3;
    uint64_t v4 = [[NSSQLColumn alloc] initWithColumnName:@"ENTITYID" sqlType:2];
    [v57 addObject:v4];

    uint64_t v5 = [[NSSQLColumn alloc] initWithColumnName:@"PRIMEKEY" sqlType:2];
    [v57 addObject:v5];

    uint64_t v6 = [[NSSQLColumn alloc] initWithColumnName:@"TYPE" sqlType:2];
    [v57 addObject:v6];

    uint64_t v7 = [[NSSQLColumn alloc] initWithColumnName:@"ATTRIBUTENAME" sqlType:6];
    [v57 addObject:v7];

    -[NSSQLiteConnection prepareSQLStatement:](a1, v54);
    -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v57);
    [(id)a1 execute];
    id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v53 = @"inserts";
    uint64_t v58 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithObjectsAndKeys:v59];
    while (1)
    {
      uint64_t v8 = -[NSSQLiteConnection newFetchedArray](a1);
      if (!v8)
      {
        uint64_t v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v58];

        uint64_t v50 = v51;
        -[NSSQLiteConnection releaseSQLStatement](a1);
        -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0);
        *(_DWORD *)(a1 + 312) &= ~2u;
        *(void *)(a1 + 100) = 0;
        *(void *)(a1 + 92) = 0;
        *(_DWORD *)(a1 + 108) = 0;

        return v50;
      }
      id v9 = v8;
      uint64_t v10 = (void *)MEMORY[0x18C127630]();
      if ([v9 count] == 4) {
        break;
      }
      uint64_t v19 = [NSString stringWithUTF8String:"incorrect number of results"];
      _NSCoreDataLog(17, v19, v20, v21, v22, v23, v24, v25, (uint64_t)v53);
      uint64_t v26 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18AB82000, v26, OS_LOG_TYPE_FAULT, "CoreData: incorrect number of results", buf, 2u);
      }
LABEL_31:
    }
    uint64_t v60 = (void *)[v9 objectAtIndex:0];
    unint64_t v11 = [v60 unsignedLongValue];
    uint64_t v12 = (void *)[v9 objectAtIndex:1];
    uint64_t v13 = (void *)[v9 objectAtIndex:2];
    uint64_t v61 = [v9 objectAtIndex:3];
    if (v11 >> 7 < 0x7D)
    {
      uint64_t v18 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "model"), "entityForID:", v11);
    }
    else
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      uint64_t v14 = (void *)[*(id *)(a1 + 16) ancillarySQLModels];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v63 objects:v76 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v64;
LABEL_9:
        uint64_t v17 = 0;
        while (1)
        {
          if (*(void *)v64 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "objectForKeyedSubscript:", *(void *)(*((void *)&v63 + 1) + 8 * v17)), "entityForID:", v11);
          if (v18) {
            break;
          }
          if (v15 == ++v17)
          {
            uint64_t v15 = [v14 countByEnumeratingWithState:&v63 objects:v76 count:16];
            uint64_t v18 = 0;
            if (v15) {
              goto LABEL_9;
            }
            break;
          }
        }
      }
      else
      {
        uint64_t v18 = 0;
      }
    }
    uint64_t v27 = objc_msgSend(*(id *)(a1 + 16), "newObjectIDForEntity:pk:", v18, objc_msgSend(v12, "unsignedLongLongValue"));
    if (v27)
    {
      uint64_t v28 = [v13 longLongValue];
      uint64_t v29 = v59;
      if (v28)
      {
        if ([v13 longLongValue] == 1)
        {
          if (v61)
          {
            v75[0] = v27;
            v75[1] = v61;
            objc_msgSend(v55, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v75, 2));
LABEL_30:

            goto LABEL_31;
          }
          uint64_t v42 = [NSString stringWithUTF8String:"History Update for %@ without any updated columns."];
          _NSCoreDataLog(17, v42, v43, v44, v45, v46, v47, v48, (uint64_t)v27);
          uint64_t v49 = __pflogFaultLog;
          if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
            goto LABEL_30;
          }
          *(_DWORD *)buf = 138412290;
          long long v68 = v27;
          int v38 = v49;
          uint64_t v39 = "CoreData: History Update for %@ without any updated columns.";
          uint32_t v40 = 12;
LABEL_27:
          _os_log_fault_impl(&dword_18AB82000, v38, OS_LOG_TYPE_FAULT, v39, buf, v40);
          goto LABEL_30;
        }
        uint64_t v41 = [v13 longLongValue];
        uint64_t v29 = v56;
        if (v41 != 2) {
          goto LABEL_30;
        }
      }
      [v29 addObject:v27];
      goto LABEL_30;
    }
    uint64_t v30 = [NSString stringWithUTF8String:"Unable to construct objectID for History Change: %@-%@-%@-%@"];
    _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, (uint64_t)v60);
    uint64_t v37 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
      goto LABEL_30;
    }
    *(_DWORD *)buf = 138413058;
    long long v68 = v60;
    __int16 v69 = 2112;
    int v70 = v12;
    __int16 v71 = 2112;
    uint64_t v72 = v13;
    __int16 v73 = 2112;
    uint64_t v74 = v61;
    int v38 = v37;
    uint64_t v39 = "CoreData: Unable to construct objectID for History Change: %@-%@-%@-%@";
    uint32_t v40 = 42;
    goto LABEL_27;
  }
  return MEMORY[0x1E4F1CC08];
}

- (uint64_t)hasAttributeChanges:(void *)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t result = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(a1);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * v5);
        uint64_t v7 = (void *)MEMORY[0x18C127630]();
        uint64_t v8 = (void *)[v6 lastObject];
        if ([v8 isNSString] && objc_msgSend(v8, "length"))
        {
          return 1;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t result = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v3 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (void)insertUpdates:(sqlite3_int64)a3 transactionID:(void *)a4 updatedAttributes:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(NSObject **)(a1 + 8);
  if (v5) {
    dispatch_assert_queue_V2(v5);
  }
  if ([a2 count])
  {
    id v45 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v34 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    uint64_t v39 = objc_msgSend((id)objc_msgSend(a4, "valueForKey:", @"name"), "componentsJoinedByString:", @",");
    uint64_t v6 = [NSNumber numberWithUnsignedInteger:1];
    uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey"), "entityNamed:", @"CHANGE");
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v8 = [a2 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (!v8) {
      goto LABEL_48;
    }
    uint64_t v36 = v7;
    uint64_t v37 = *(void *)v52;
    while (1)
    {
      uint64_t v41 = 0;
      uint64_t v38 = v8;
      do
      {
        if (*(void *)v52 != v37) {
          objc_enumerationMutation(a2);
        }
        long long v9 = *(void **)(*((void *)&v51 + 1) + 8 * v41);
        context = (void *)MEMORY[0x18C127630]();
        uint64_t v43 = (void *)[v9 firstObject];
        long long v10 = (void *)[v9 lastObject];
        long long v11 = (void *)v39;
        if ([v10 isNSString])
        {
          long long v11 = v10;
          if (![v10 length]) {
            long long v11 = (void *)v39;
          }
        }
        sqlite3_int64 v12 = -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](a1, (uint64_t)v7, 1u);
        if (!v12)
        {
          id v32 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134030, @"unable to generate primary keys", 0);
          objc_exception_throw(v32);
        }
        uint64_t v13 = _sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 16), (void *)[v43 entity]);
        uint64_t v14 = (void *)v13;
        if (v13) {
          uint64_t v15 = *(unsigned int *)(v13 + 184);
        }
        else {
          uint64_t v15 = 0;
        }
        -[NSSQLiteConnection prepareInsertStatementForAncillaryEntity:](a1, v7);
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        uint64_t v16 = (void *)[*(id *)(a1 + 48) bindVariables];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v55 count:16];
        uint64_t v44 = v14;
        if (v17)
        {
          uint64_t v18 = *(void *)v48;
          do
          {
            uint64_t v19 = 0;
            do
            {
              if (*(void *)v48 != v18) {
                objc_enumerationMutation(v16);
              }
              uint64_t v20 = *(void **)(*((void *)&v47 + 1) + 8 * v19);
              if (![v20 index])
              {
                int v21 = [v20 sqlType];
                sqlite3_int64 v22 = v12;
                if (v21 == 2)
                {
LABEL_26:
                  [v20 setInt64:v22];
                  goto LABEL_38;
                }
              }
              if ([v20 index] != 1 && objc_msgSend(v20, "index") != 2)
              {
                if ([v20 index] == 3)
                {
                  int v23 = [v20 sqlType];
                  sqlite3_int64 v22 = a3;
                  if (v23 == 2) {
                    goto LABEL_26;
                  }
                }
                int v24 = objc_msgSend(v20, "index", v22);
                uint64_t v25 = v6;
                if (v24 == 4) {
                  goto LABEL_37;
                }
                if (objc_msgSend(v20, "index", v6) != 5 || !v11)
                {
                  if ([v20 index] == 6)
                  {
                    uint64_t v26 = [NSNumber numberWithUnsignedInt:v15];
                  }
                  else
                  {
                    if ([v20 index] != 7) {
                      goto LABEL_38;
                    }
                    uint64_t v26 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v43, "_referenceData64"));
                  }
                  uint64_t v25 = v26;
LABEL_37:
                  [v20 setValue:v25];
                  goto LABEL_38;
                }
                uint64_t v25 = [v45 objectForKey:objc_msgSend(NSString, "stringWithFormat:", @"%u-%@", v15, v11)];
                if (v25) {
                  goto LABEL_37;
                }
                uint64_t v27 = [v11 componentsSeparatedByString:@","];
                uint64_t v28 = +[_NSPersistentHistoryChange _propertyDataForEntity:withSetOfPropertyNames:]((uint64_t)_NSPersistentHistoryChange, v44, (void *)[MEMORY[0x1E4F1CAD0] setWithArray:v27]);
                objc_msgSend(v45, "setObject:forKey:", v28, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v15));
                [v20 setValue:v28];
              }
LABEL_38:
              ++v19;
            }
            while (v17 != v19);
            uint64_t v29 = [v16 countByEnumeratingWithState:&v47 objects:v55 count:16];
            uint64_t v17 = v29;
          }
          while (v29);
        }
        [(id)a1 execute];
        uint64_t v7 = v36;
        if (!*(void *)(a1 + 80))
        {
          uint64_t v30 = -[NSSQLiteConnection statementCacheForEntity:](a1, v36);
          -[NSSQLiteStatementCache cacheInsertStatement:](v30, 0);
        }
        -[NSSQLiteConnection _clearBindVariablesForInsertedRow](a1);
        -[NSSQLiteConnection resetSQLStatement](a1);
        ++v41;
      }
      while (v41 != v38);
      uint64_t v31 = [a2 countByEnumeratingWithState:&v51 objects:v56 count:16];
      uint64_t v8 = v31;
      if (!v31)
      {
LABEL_48:

        id v33 = 0;
        return;
      }
    }
  }
}

- (void)processUpdateRequest:(void *)a3 withOIDs:(void *)a4 forAttributes:
{
  if (a1)
  {
    uint64_t v8 = *(void *)(a1 + 16);
    long long v9 = v8
       ? (void *)[*(id *)(v8 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"]
       : 0;
    if (![v9 count]
      || ((uint64_t v10 = *(void *)(a1 + 16)) == 0
        ? (long long v11 = 0)
        : (long long v11 = (void *)[*(id *)(v10 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"]), (objc_msgSend(v11, "containsObject:", objc_msgSend((id)objc_msgSend(a2, "request"), "entityName")) & 1) == 0))
    {
      if (-[NSSQLiteConnection hasAttributeChanges:](a3))
      {
        id v21 = (id)-[NSSQLiteConnection _insertTransactionStringsForRequestContext:](a1, (uint64_t)a2);
        sqlite3_int64 v12 = -[NSSQLiteConnection _insertTransactionForRequestContext:andStrings:](a1, (uint64_t)a2, v21);
        -[NSSQLiteConnection insertUpdates:transactionID:updatedAttributes:](a1, a3, v12, a4);
        uint64_t v13 = [NSNumber numberWithLongLong:v12];
        if (a2) {
          a2[9] = v13;
        }
      }
      else
      {
        uint64_t v14 = [a2 persistentStoreRequest];
        _NSCoreDataLog(9, @"Batch Update resulted in updates with no updated properties - %@ - %@", v15, v16, v17, v18, v19, v20, v14);
      }
    }
  }
}

- (uint64_t)_hasOldHistoryTrackingTables
{
  if (result)
  {
    uint64_t v1 = result;
    if (-[NSSQLiteConnection _hasOldHistoryTrackingTablesV0](result))
    {
      return 1;
    }
    else
    {
      return -[NSSQLiteConnection _hasOldHistoryTrackingTablesV1](v1);
    }
  }
  return result;
}

- (uint64_t)_hasOldHistoryTrackingTablesV0
{
  if (result)
  {
    uint64_t v1 = result;
    if ((-[NSSQLiteConnection _hasTableWithName:isTemp:](result, @"ZCHANGETRACK", 0) & 1) != 0
      || (int v2 = -[NSSQLiteConnection _hasTableWithName:isTemp:](v1, @"ZCHANGETRACKHISTORY", 0),
          uint64_t result = 0,
          v2))
    {
      errmsg = 0;
      uint64_t v3 = objc_opt_new();
      if (sqlite3_exec(*(sqlite3 **)(v1 + 72), "select sql from sqlite_master where name = 'ZCHANGETRACK'", (int (__cdecl *)(void *, int, char **, char **))sqlite3Callback, v3, &errmsg)|| [v3 count] != 1)
      {
        _NSCoreDataLog(1, @"Unable to determine if old history table 1 Exists - %s", v4, v5, v6, v7, v8, v9, (uint64_t)errmsg);
      }
      else if objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @"ZCHANGETIMESTAMP FLOAT")&& objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @"ZBUNDLEID VARCHAR")&& (objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @"ZCONTEXTNAME VARCHAR"))
      {
        int v10 = objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @"ZPROCESSID VARCHAR");

        if (!v10)
        {
          int v17 = 0;
          return v17 != 0;
        }
        uint64_t v3 = objc_opt_new();
        if (sqlite3_exec(*(sqlite3 **)(v1 + 72), "select sql from sqlite_master where name = 'ZCHANGETRACKHISTORY'", (int (__cdecl *)(void *, int, char **, char **))sqlite3Callback, v3, &errmsg)|| [v3 count] != 1)
        {
          _NSCoreDataLog(1, @"Unable to determine if old history table 2 Exists - %s", v11, v12, v13, v14, v15, v16, (uint64_t)errmsg);
        }
        else if (objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @" ZCHANGETRACKHISTORYCHANGETYPE INTEGER")&& objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @"ZCHANGETRACKHISTORYENTITY INTEGER")&& objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @"ZCHANGETRACKHISTORYENTITYVERSION INTEGER")&& objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @"ZCHANGETRACKINGHISTORYTRANSACTIONID INTEGER")&& objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @"ZCHANGETRACKHISTORYTOMBSTONE BLOB"))
        {
          int v17 = objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @"ZCHANGETRACKEHISTORYNTITYCOLUMNS BLOB");
LABEL_20:

          return v17 != 0;
        }
      }
      int v17 = 0;
      goto LABEL_20;
    }
  }
  return result;
}

- (uint64_t)_hasOldHistoryTrackingTablesV1
{
  if (result)
  {
    uint64_t v1 = result;
    if ((-[NSSQLiteConnection _hasTableWithName:isTemp:](result, @"ZCHANGE", 0) & 1) != 0
      || (int v2 = -[NSSQLiteConnection _hasTableWithName:isTemp:](v1, @"ZTRANSACTION", 0), result = 0, v2))
    {
      errmsg = 0;
      uint64_t v3 = objc_opt_new();
      if (sqlite3_exec(*(sqlite3 **)(v1 + 72), "select sql from sqlite_master where name = 'ZCHANGE'", (int (__cdecl *)(void *, int, char **, char **))sqlite3Callback, v3, &errmsg)|| [v3 count] != 1)
      {
        _NSCoreDataLog(1, @"Unable to determine if old history table 1 Exists - %s", v4, v5, v6, v7, v8, v9, (uint64_t)errmsg);
      }
      else if objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @"ZENTITY INTEGER, ZENTITYPK INTEGER")&& objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @"ZCHANGETYPE INTEGER")&& (objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @"ZCOLUMNS BLOB"))
      {
        int v10 = objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @"ZTRANSACTIONID INTEGER");

        if (!v10)
        {
          int v17 = 0;
          return v17 != 0;
        }
        uint64_t v3 = objc_opt_new();
        if (sqlite3_exec(*(sqlite3 **)(v1 + 72), "select sql from sqlite_master where name = 'ZTRANSACTION'", (int (__cdecl *)(void *, int, char **, char **))sqlite3Callback, v3, &errmsg)|| [v3 count] != 1)
        {
          _NSCoreDataLog(1, @"Unable to determine if old history table 2 Exists - %s", v11, v12, v13, v14, v15, v16, (uint64_t)errmsg);
        }
        else if (objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @" ZBUNDLEID VARCHAR")&& objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @"ZCONTEXTNAME VARCHAR")&& objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @"ZPROCESSID VARCHAR"))
        {
          int v17 = objc_msgSend((id)objc_msgSend(v3, "firstObject"), "containsString:", @"ZTIMESTAMP FLOAT");
LABEL_18:

          return v17 != 0;
        }
      }
      int v17 = 0;
      goto LABEL_18;
    }
  }
  return result;
}

- (void)_dropOldHistoryTrackingTables
{
  if (a1)
  {
    if (-[NSSQLiteConnection _hasOldHistoryTrackingTablesV0](a1))
    {
      -[NSSQLiteConnection _executeSQLString:](a1, @"DROP TABLE ZCHANGETRACK");
      -[NSSQLiteConnection _executeSQLString:](a1, @"DROP TABLE ZCHANGETRACKHISTORY");
    }
    if (-[NSSQLiteConnection _hasOldHistoryTrackingTablesV1](a1))
    {
      -[NSSQLiteConnection _executeSQLString:](a1, @"DROP TABLE ZCHANGE");
      -[NSSQLiteConnection _executeSQLString:](a1, @"DROP TABLE ZTRANSACTION");
    }
  }
}

- (BOOL)addTombstoneColumnsForRange:(unint64_t)a3
{
  if (a1)
  {
    uint64_t v6 = (void *)[a1[2] model];
    [a1[2] options];
    id v19 = +[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]((uint64_t)_PFPersistentHistoryModel, v6);
    uint64_t v7 = [v19 entityNamed:@"CHANGE"];
    BOOL v20 = v7 != 0;
    if (v7) {
      BOOL v8 = a2 >= a3;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      uint64_t v9 = (void *)v7;
      do
      {
        int v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"ALTER TABLE %@ ADD Z%@%lu BLOB;",
                        [v9 tableName],
                        @"TOMBSTONE",
                        a2);
        uint64_t v11 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([a1 adapter], (uint64_t)v10);
        if (+[NSMappingModel migrationDebugLevel] >= 1) {
          _NSCoreDataLog(4, @"Executing new tombstone column statement: %@", v12, v13, v14, v15, v16, v17, (uint64_t)v11);
        }
        -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v11);

        ++a2;
      }
      while (a3 != a2);
    }
  }
  else
  {
    return 0;
  }
  return v20;
}

- (uint64_t)numberOfTombstones
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    int v2 = (void *)[*(id *)(result + 16) model];
    [*(id *)(v1 + 16) options];
    id v3 = +[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]((uint64_t)_PFPersistentHistoryModel, v2);
    uint64_t v4 = (void *)[v3 entityNamed:@"CHANGE"];
    int v5 = 0;
    if (!-[NSSQLiteConnection _hasTableWithName:isTemp:](v1, [v4 tableName], 0))
    {
LABEL_16:

      return v5;
    }
    errmsg = 0;
    uint64_t v6 = objc_opt_new();
    if (sqlite3_exec(*(sqlite3 **)(v1 + 72), (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"select sql from sqlite_master where name = '%@'", objc_msgSend(v4, "tableName")), "UTF8String"], (int (__cdecl *)(void *, int, char **, char **))sqlite3Callback, v6, &errmsg)|| objc_msgSend(v6, "count") != 1)
    {
      _NSCoreDataLog(1, @"Unable to determine if tombstones for change table - %s", v7, v8, v9, v10, v11, v12, (uint64_t)errmsg);
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v13 = objc_msgSend((id)objc_msgSend(v6, "firstObject"), "componentsSeparatedByString:", @" ");
      uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        int v5 = 0;
        uint64_t v16 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(v13);
            }
            v5 += [*(id *)(*((void *)&v18 + 1) + 8 * i) containsString:@"TOMBSTONE"];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v15);
        goto LABEL_15;
      }
    }
    int v5 = 0;
LABEL_15:

    goto LABEL_16;
  }
  return result;
}

- (uint64_t)hasTransactionStringColumnsInTransactionTable
{
  v25[4] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    int v2 = (void *)[*(id *)(result + 16) model];
    [*(id *)(v1 + 16) options];
    id v3 = +[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]((uint64_t)_PFPersistentHistoryModel, v2);
    uint64_t v4 = (void *)[v3 entityNamed:@"TRANSACTION"];
    int v5 = 0;
    if (!-[NSSQLiteConnection _hasTableWithName:isTemp:](v1, [v4 tableName], 0))
    {
LABEL_16:

      return v5 == 4;
    }
    errmsg = 0;
    uint64_t v6 = objc_opt_new();
    if (sqlite3_exec(*(sqlite3 **)(v1 + 72), (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"select sql from sqlite_master where name = '%@'", objc_msgSend(v4, "tableName")), "UTF8String"], (int (__cdecl *)(void *, int, char **, char **))sqlite3Callback, v6, &errmsg)|| objc_msgSend(v6, "count") != 1)
    {
      _NSCoreDataLog(1, @"Unable to determine if tombstones for change table - %s", v7, v8, v9, v10, v11, v12, (uint64_t)errmsg);
    }
    else
    {
      v25[0] = @"AUTHORTS";
      v25[1] = @"BUNDLEIDTS";
      v25[2] = @"CONTEXTNAMETS";
      v25[3] = @"PROCESSIDTS";
      uint64_t v13 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v14 = objc_msgSend((id)objc_msgSend(v6, "firstObject"), "componentsSeparatedByString:", @" ");
      uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        int v5 = 0;
        uint64_t v17 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v20 != v17) {
              objc_enumerationMutation(v14);
            }
            v5 += objc_msgSend(v13, "containsObject:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "stringByReplacingCharactersInRange:withString:", 0, 1, &stru_1ED787880));
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v16);
        goto LABEL_15;
      }
    }
    int v5 = 0;
LABEL_15:

    goto LABEL_16;
  }
  return result;
}

- (BOOL)addTransactionStringColumnsToTransactionTable
{
  v20[4] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    int v2 = (void *)[a1[2] model];
    [a1[2] options];
    id v13 = +[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]((uint64_t)_PFPersistentHistoryModel, v2);
    uint64_t v3 = [v13 entityNamed:@"TRANSACTION"];
    BOOL v14 = v3 != 0;
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      v20[0] = @"AUTHORTS";
      v20[1] = @"BUNDLEIDTS";
      v20[2] = @"CONTEXTNAMETS";
      v20[3] = @"PROCESSIDTS";
      int v5 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v16;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v16 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"ALTER TABLE %@ ADD Z%@ INTEGER;",
                            [v4 tableName],
                            *(void *)(*((void *)&v15 + 1) + 8 * v9));
            uint64_t v11 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([a1 adapter], (uint64_t)v10);
            -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v11);

            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v7);
      }
    }
  }
  else
  {
    return 0;
  }
  return v14;
}

- (void)dropHistoryTrackingTables
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    int v2 = (void *)MEMORY[0x18C127630]();
    uint64_t v3 = objc_msgSend((id)objc_msgSend(a1[2], "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey");
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    if (v3) {
      uint64_t v4 = *(void **)(v3 + 32);
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
          uint64_t v10 = (void *)MEMORY[0x18C127630](v5);
          uint64_t v11 = -[NSSQLiteAdapter newDropTableStatementForTableNamed:]((NSSQLiteStatement *)objc_msgSend(a1, "adapter", (void)v12), objc_msgSend(v9, "tableName"));
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v11);

          ++v8;
        }
        while (v6 != v8);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        uint64_t v6 = v5;
      }
      while (v5);
    }
  }
}

- (id)hasAncillaryEntitiesInHistory
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(result[2], "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey"), "entityNamed:", @"CHANGE");
    uint64_t v3 = (id *)v2;
    if (v2)
    {
      uint64_t v4 = (void *)[*(id *)(v2 + 40) objectForKey:@"ENTITY"];
      uint64_t v5 = (void *)[v3[5] objectForKey:@"TRANSACTIONID"];
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v5 = 0;
    }
    uint64_t v6 = (void *)[[NSString alloc] initWithFormat:@"SELECT MAX(%@) FROM %@ WHERE %@ >= 16000", objc_msgSend(v5, "columnName"), objc_msgSend(v3, "tableName"), objc_msgSend(v4, "columnName")];
    uint64_t v7 = [[NSSQLiteStatement alloc] initWithEntity:v3 sqlString:v6];
    -[NSSQLiteConnection prepareSQLStatement:]((uint64_t)v1, v7);
    [v1 execute];
    uint64_t v8 = -[NSSQLiteConnection newFetchedArray]((uint64_t)v1);
    uint64_t v9 = v8;
    if (v8)
    {
      if ([v8 count])
      {
        uint64_t v10 = [v9 objectAtIndex:0];
        if (v10 == NSKeyValueCoding_NullValue) {
          uint64_t v11 = 0;
        }
        else {
          uint64_t v11 = (void *)[v9 objectAtIndex:0];
        }
        id v12 = v11;
      }
      else
      {
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
    -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v1, 0);

    return (id *)v12;
  }
  return result;
}

- (void)dropHistoryBeforeTransactionID:(id *)a1
{
  if (a1)
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1[2], "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey"), "entityNamed:", @"TRANSACTION");
    uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1[2], "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey"), "entityNamed:", @"CHANGE");
    uint64_t v6 = (void *)v5;
    if (v5) {
      uint64_t v7 = (void *)[*(id *)(v5 + 40) objectForKey:@"TRANSACTIONID"];
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"DELETE FROM %@ WHERE Z_PK <= %@", objc_msgSend(v4, "tableName"), a2];
    uint64_t v9 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([a1 adapter], (uint64_t)v8);
    id v11 = (id)[[NSString alloc] initWithFormat:@"DELETE FROM %@ WHERE %@ <= %@", objc_msgSend(v6, "tableName"), objc_msgSend(v7, "columnName"), a2];
    uint64_t v10 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([a1 adapter], (uint64_t)v11);
    -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v9);
    -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a1, v10);
  }
}

- (void)processMigrationRequestForHash:(uint64_t)a3 stageLabel:
{
  if (a1)
  {
    uint64_t v6 = (void *)MEMORY[0x18C127630]();
    uint64_t v7 = NSString;
    if (a3) {
      uint64_t v8 = (__CFString *)[NSString stringWithFormat:@" (stage: %@)", a3];
    }
    else {
      uint64_t v8 = &stru_1ED787880;
    }
    uint64_t v9 = [v7 stringWithFormat:@"com.apple.coredata.schemamigrator: lightweight migration from model with digest { %@ }%@", a2, v8];
    uint64_t v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
    uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName");
    uint64_t v12 = v11;
    if (v11) {
      BOOL v13 = v10 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13) {
      uint64_t v14 = v11;
    }
    else {
      uint64_t v14 = v10;
    }
    long long v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    long long v16 = v15;
    if (v14) {
      [v15 setValue:v14 forKey:@"BUNDLEIDTS"];
    }
    if (v12) {
      [v16 setValue:v12 forKey:@"PROCESSIDTS"];
    }
    if (v9) {
      [v16 setValue:v9 forKey:@"AUTHORTS"];
    }
    uint64_t v17 = (void *)-[NSSQLiteConnection _transactionsStringAndPKsForStrings:](a1, v16);

    -[NSSQLiteConnection _insertTransactionForRequestContext:andStrings:](a1, 0, v17);
  }
}

- (void)processExternalDataReferenceFilesDeletedByRequest:(uint64_t)a1
{
  v28[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a2)
    {
      if ((-[NSSQLiteConnection _hasTableWithName:isTemp:](a1, a2[11], 1) & 1) == 0
        || !-[NSSQLiteConnection _tableHasRows:](a1, a2[11]))
      {
        return;
      }
      uint64_t v4 = (void *)a2[16];
    }
    else
    {
      if ((-[NSSQLiteConnection _hasTableWithName:isTemp:](a1, 0, 1) & 1) == 0) {
        return;
      }
      BOOL v9 = -[NSSQLiteConnection _tableHasRows:](a1, 0);
      uint64_t v4 = 0;
      if (!v9) {
        return;
      }
    }
    -[NSSQLiteConnection prepareSQLStatement:](a1, objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 2), "objectAtIndexedSubscript:", 0));
    [(id)a1 execute];
    uint64_t v5 = [[NSSQLColumn alloc] initWithColumnName:@"externalRef" sqlType:16];
    v28[0] = v5;
    -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1]);

    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    while (1)
    {
      uint64_t v7 = -[NSSQLiteConnection newFetchedArray](a1);
      uint64_t v8 = v7;
      if (!v7) {
        break;
      }
      objc_msgSend(v6, "addObject:", objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
    }
    -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0);
    *(_DWORD *)(a1 + 312) &= ~2u;
    *(void *)(a1 + 100) = 0;
    *(void *)(a1 + 92) = 0;
    *(_DWORD *)(a1 + 108) = 0;
    -[NSSQLiteConnection releaseSQLStatement](a1);
    if (v6)
    {
      if ([v6 count])
      {
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v12 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v24 != v13) {
                objc_enumerationMutation(v6);
              }
              long long v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              self;
              char isKindOfClass = objc_opt_isKindOfClass();
              uint64_t v17 = v11;
              if (isKindOfClass)
              {
                uint64_t v18 = [v15 UUID];
                uint64_t v17 = v10;
                if (!v18) {
                  continue;
                }
              }
              [v17 addObject:v15];
            }
            uint64_t v12 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v12);
        }
        uint64_t v19 = [v10 count];
        if (a2 && v19) {
          objc_setProperty_nonatomic(a2, v20, v10, 136);
        }
        uint64_t v21 = [v11 count];
        if (a2)
        {
          if (v21) {
            objc_setProperty_nonatomic(a2, v22, v11, 144);
          }
        }
      }
    }
  }
}

- (void)prepareInsertStatementForEntity:(uint64_t)a1 includeConstraints:(void *)a2 includeOnConflict:(int)a3 onConflictKeys:(void *)a4
{
  uint64_t v8 = -[NSSQLiteConnection statementCacheForEntity:](a1, a2);
  BOOL v9 = v8;
  if (v8)
  {
    batchInsertStatementCache = v8->_batchInsertStatementCache;
    if (batchInsertStatementCache)
    {
      cachedSQLiteStatement = batchInsertStatementCache->_cachedSQLiteStatement;
      if (cachedSQLiteStatement)
      {
        uint64_t v27 = v9->_batchInsertStatementCache;
        if (+[NSSQLCore debugDefault] >= 1)
        {
          int v12 = *(unsigned __int8 *)(a1 + 42);
          uint64_t v13 = [(NSSQLiteStatement *)v27 sqlString];
          if (v12) {
            long long v20 = @"\x1B[32msql: \x1B[34m\x1B[47m%@\x1B[0m";
          }
          else {
            long long v20 = @"%@";
          }
          _NSCoreDataLog(6, (uint64_t)v20, v14, v15, v16, v17, v18, v19, v13);
        }
        *(void *)(a1 + 48) = v27;
        *(void *)(a1 + 80) = cachedSQLiteStatement;
        uint64_t v21 = v27;
        return;
      }
    }
  }
  long long v22 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "adapter"), "sqlCore"), "objectIDFactoryForSQLEntity:", a2), "alloc"), "initWithPK64:", 1);
  id v28 = (id)objc_msgSend(+[NSSQLRow allocForSQLEntity:]((uint64_t)NSSQLRow, a2), "initWithSQLEntity:objectID:", a2, v22);
  long long v23 = (void *)-[NSSQLiteAdapter newStatementWithEntity:]([(id)a1 adapter], (uint64_t)a2);
  long long v24 = -[NSSQLiteAdapter newGeneratorWithStatement:]((void *)[(id)a1 adapter], (uint64_t)v23);
  -[_NSSQLGenerator prepareInsertStatementWithRow:includeConstraints:includeOnConflict:onConflictKeys:]((uint64_t)v24, (uint64_t)v28, 1, a3, a4);
  if (v24)
  {
    long long v25 = (void *)v24[3];
    if (v23) {
      goto LABEL_14;
    }
  }
  else
  {
    long long v25 = 0;
    if (v23)
    {
LABEL_14:
      long long v26 = (void *)v23[4];
      if (v26 != v25)
      {

        v23[4] = [v25 copy];
      }
    }
  }
  -[NSSQLiteConnection prepareSQLStatement:](a1, v23);
  -[NSSQLiteStatement setCachedSQLiteStatement:forConnection:](*(sqlite3_stmt **)(a1 + 48), *(sqlite3_stmt **)(a1 + 80), a1);
  if ((a3 & 1) == 0) {
    -[NSSQLiteStatementCache cacheBatchInsertStatement:](v9, *(void **)(a1 + 48));
  }
  -[NSSQLiteConnection addVMCachedStatement:](a1, *(const void **)(a1 + 48));
}

- (uint64_t)insertArray:(uint64_t)a3 forEntity:(char)a4 includeOnConflict:
{
  if (!a1) {
    return 0;
  }
  uint64_t v8 = *(NSObject **)(a1 + 8);
  if (v8) {
    dispatch_assert_queue_V2(v8);
  }
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__NSSQLiteConnection_insertArray_forEntity_includeOnConflict___block_invoke;
  v11[3] = &unk_1E544E100;
  v11[5] = a3;
  v11[6] = &v13;
  v11[4] = a1;
  char v12 = a4;
  [a2 enumerateObjectsUsingBlock:v11];
  uint64_t v9 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v9;
}

void __62__NSSQLiteConnection_insertArray_forEntity_includeOnConflict___block_invoke(uint64_t a1, uint64_t a2)
{
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x2020000000;
  char v4 = 0;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __62__NSSQLiteConnection_insertArray_forEntity_includeOnConflict___block_invoke_2;
  v2[3] = &unk_1E544E0D8;
  v2[4] = a2;
  v2[5] = v3;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += -[NSSQLiteConnection insertDictionaryBlock:forEntity:includeOnConflict:](*(void *)(a1 + 32), (uint64_t)v2, *(id **)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  _Block_object_dispose(v3, 8);
}

BOOL __62__NSSQLiteConnection_insertArray_forEntity_includeOnConflict___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  int v3 = *(unsigned __int8 *)(v2 + 24);
  if (!*(unsigned char *)(v2 + 24))
  {
    [a2 addEntriesFromDictionary:*(void *)(a1 + 32)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return v3 != 0;
}

- (uint64_t)insertDictionaryBlock:(id *)a3 forEntity:(int)a4 includeOnConflict:
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  char v4 = *(NSObject **)(a1 + 8);
  if (v4) {
    dispatch_assert_queue_V2(v4);
  }
  id v40 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v48, "count"));
  uint64_t v42 = 0;
  for (char i = 0; ; char i = v46)
  {
    char v43 = i;
    if (i) {
      break;
    }
    long long v47 = (void *)MEMORY[0x18C127630]();
    [v48 removeAllObjects];
    [obj removeAllObjects];
    char v46 = (*(uint64_t (**)(uint64_t, id))(a2 + 16))(a2, v48);
    if ((v46 & 1) == 0)
    {
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v48];
      while ([v6 count])
      {
        context = (void *)MEMORY[0x18C127630]();
        uint64_t v7 = +[_PFRoutines anyObjectFromCollection:]((uint64_t)_PFRoutines, v6);
        uint64_t v8 = (void *)[v6 objectForKey:v7];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v62 = 0u;
          long long v63 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v60 objects:v66 count:16];
          if (v9)
          {
            uint64_t v10 = *(void *)v61;
            do
            {
              for (uint64_t j = 0; j != v9; ++j)
              {
                if (*(void *)v61 != v10) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v12 = *(void *)(*((void *)&v60 + 1) + 8 * j);
                uint64_t v13 = (void *)MEMORY[0x18C127630]();
                uint64_t v14 = [v8 objectForKey:v12];
                [v6 setObject:v14, objc_msgSend(NSString, "stringWithFormat:", @"%@.%@", v7, v12) forKey];
              }
              uint64_t v9 = [v8 countByEnumeratingWithState:&v60 objects:v66 count:16];
            }
            while (v9);
          }
        }
        else
        {
          [obj setObject:v8 forKey:v7];
        }
        [v6 removeObjectForKey:v7];
      }

      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      uint64_t v15 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v57;
        do
        {
          for (uint64_t k = 0; k != v15; ++k)
          {
            if (*(void *)v57 != v16) {
              objc_enumerationMutation(obj);
            }
            if ((_BYTE)dword_1EB270AB8)
            {
              uint64_t v18 = *(void *)(*((void *)&v56 + 1) + 8 * k);
              if (!a3 || ![a3[5] objectForKey:*(void *)(*((void *)&v56 + 1) + 8 * k)])
              {
                id v32 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", objc_msgSend(a3, "name"), @"NSValidationErrorObject", v18, @"NSValidationErrorKey", 0);
                id v33 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 1605, @"property not found for entity", v32);
                objc_exception_throw(v33);
              }
            }
          }
          uint64_t v15 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
        }
        while (v15);
      }
      sqlite3_int64 v19 = -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](a1, [a3 rootEntity], 1u);
      if (!v19)
      {
        id v37 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134030, @"unable to generate primary keys for batch insert", 0);
        objc_exception_throw(v37);
      }
      -[NSSQLiteConnection prepareInsertStatementForEntity:includeConstraints:includeOnConflict:onConflictKeys:](a1, a3, a4, (void *)[obj allKeys]);
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v20 = (void *)[*(id *)(a1 + 48) bindVariables];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v52 objects:v64 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v53;
        do
        {
          for (uint64_t m = 0; m != v21; ++m)
          {
            if (*(void *)v53 != v22) {
              objc_enumerationMutation(v20);
            }
            long long v24 = *(void **)(*((void *)&v52 + 1) + 8 * m);
            if ([v24 index])
            {
              if ([v24 index] == 2)
              {
                [v24 setUnsignedInt:1];
              }
              else
              {
                long long v25 = (void *)[v24 propertyDescription];
                long long v26 = v25;
                if (v25)
                {
                  uint64_t v27 = objc_msgSend(obj, "objectForKey:", objc_msgSend(v25, "_qualifiedName"));
                  if (!v27 || (uint64_t v28 = objc_opt_class(), v28 == objc_opt_class()))
                  {
                    if ([v26 defaultValue])
                    {
                      if ([v26 _propertyType] == 7) {
                        uint64_t v29 = [v26 _buildDefaultValue];
                      }
                      else {
                        uint64_t v29 = [v26 defaultValue];
                      }
                      uint64_t v30 = v29;
                    }
                    else
                    {
                      if (([v26 isOptional] & 1) == 0)
                      {
                        id v34 = (void *)MEMORY[0x1E4F1CA60];
                        uint64_t v35 = [a3 entityDescription];
                        uint64_t v36 = [v26 name];
                        -[NSSQLiteConnection _batchInsertThrowWithErrorCode:andMessage:forKey:andValue:additionalDetail:](1570, @"mandatory property not set", v26, (uint64_t)v27, objc_msgSend(v34, "dictionaryWithObjectsAndKeys:", v35, @"NSValidationErrorObject", v36, @"NSValidationErrorKey", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"NSValidationErrorValue", 0));
                      }
                      uint64_t v30 = 0;
                    }
                    [v24 setValue:v30];
                  }
                  else
                  {
                    -[NSSQLiteConnection _validateProperty:withValue:](v26, v27);
                    [v24 setValue:v27];
                  }
                }
              }
            }
            else
            {
              [v24 setInt64:v19];
            }
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v52 objects:v64 count:16];
        }
        while (v21);
      }
      [(id)a1 execute];
      v42 += sqlite3_changes(*(sqlite3 **)(a1 + 72));
      if (!*(void *)(a1 + 80))
      {
        uint64_t v31 = -[NSSQLiteConnection statementCacheForEntity:](a1, a3);
        -[NSSQLiteStatementCache cacheBatchInsertStatement:](v31, 0);
      }
      -[NSSQLiteConnection _clearBindVariablesForInsertedRow](a1);
      -[NSSQLiteConnection resetSQLStatement](a1);
    }
  }

  [v40 drain];
  id v38 = 0;
  if ((v43 & 1) == 0) {
    objc_exception_rethrow();
  }
  return v42;
}

- (void)_batchInsertThrowWithErrorCode:(int)a1 andMessage:(void *)a2 forKey:(void *)a3 andValue:(uint64_t)a4 additionalDetail:(uint64_t)a5
{
  uint64_t v10 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v11 = [a3 entity];
  uint64_t v12 = [a3 name];
  if (!a4) {
    a4 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v13 = objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, @"NSValidationErrorObject", v12, @"NSValidationErrorKey", a4, @"NSValidationErrorValue", 0);
  if ([a2 length]) {
    [v13 setValue:a2 forKey:@"reason"];
  }
  uint64_t v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], a1, 0), "localizedDescription");
  uint64_t v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "entity"), "managedObjectModel"), "_localizationPolicy");
  uint64_t v16 = objc_msgSend(v15, "localizedEntityNameForEntity:", objc_msgSend(a3, "entity"));
  uint64_t v17 = [v15 localizedPropertyNameForProperty:a3];
  if (v16 | v17)
  {
    uint64_t v18 = v17;
    sqlite3_int64 v19 = (void *)[v14 mutableCopyWithZone:0];
    long long v20 = v19;
    if (v16) {
      objc_msgSend(v19, "replaceOccurrencesOfString:withString:options:range:", @"%{ENTITY}@", v16, 2, 0, objc_msgSend(v19, "length"));
    }
    if (v18) {
      objc_msgSend(v20, "replaceOccurrencesOfString:withString:options:range:", @"%{PROPERTY}@", v18, 2, 0, objc_msgSend(v20, "length"));
    }
    id v21 = v20;
    [v13 setObject:v20 forKey:*MEMORY[0x1E4F28568]];
  }
  [v13 addEntriesFromDictionary:a5];
  id v22 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], a1, (uint64_t)a2, v13);
  objc_exception_throw(v22);
}

- (uint64_t)_validateProperty:(void *)a1 withValue:(void *)a2
{
  id v34 = a2;
  if ([a1 _propertyType] != 2)
  {
    uint64_t v26 = [a1 _propertyType];
    uint64_t v27 = NSString;
    if (v26 != 6)
    {
      uint64_t v30 = (objc_class *)objc_opt_class();
      uint64_t v31 = (void *)[v27 stringWithFormat:@"Property (%@) is not supported with NSBatchInsertRequest", NSStringFromClass(v30)];
      -[NSSQLiteConnection _batchInsertThrowWithErrorCode:andMessage:forKey:andValue:additionalDetail:](3328, v31, a1, (uint64_t)a2, 0);
    }
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Cannot set value for derived attribute: property = \"%@\"; entity = \"%@\"; value = %@",
                   [a1 name],
                   objc_msgSend((id)objc_msgSend(a1, "entity"), "name"),
                   a2,
                   v32);
    goto LABEL_58;
  }
  uint64_t v4 = [a1 attributeType];
  if (v4 > 599)
  {
    if (v4 <= 799)
    {
      if (v4 != 600)
      {
        if (v4 == 700 && ([a2 isNSString] & 1) != 0) {
          goto LABEL_33;
        }
        goto LABEL_21;
      }
    }
    else if (v4 != 800)
    {
      if (v4 == 900)
      {
        if ([a2 isNSDate]) {
          goto LABEL_33;
        }
      }
      else if (v4 == 1000)
      {
        if ([a1 isFileBackedFuture])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_33;
          }
        }
        else if ([a2 isNSData])
        {
          goto LABEL_33;
        }
      }
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (v4 > 299)
  {
    if (v4 != 300 && v4 != 500) {
      goto LABEL_21;
    }
LABEL_20:
    if ([a2 isNSNumber]) {
      goto LABEL_33;
    }
    goto LABEL_21;
  }
  if (v4 == 100 || v4 == 200) {
    goto LABEL_20;
  }
LABEL_21:
  if ([a1 isFileBackedFuture])
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Unacceptable type of value for attribute: property = \"%@\"; desired type = %@; given type = %@; value = %@.",
                   [a1 name],
                   @"A class implementing the NSFileBackedFuture protocol",
                   objc_opt_class(),
                   a2);
    goto LABEL_58;
  }
  uint64_t v5 = [a1 _attributeValueClass];
  if (v5)
  {
    id v6 = (void *)v5;
    if (objc_opt_isKindOfClass()) {
      goto LABEL_33;
    }
    if ([a2 isNSNumber]
      && [v6 isSubclassOfClass:objc_opt_class()])
    {
      id v34 = objc_msgSend(MEMORY[0x1E4F28C28], "decimalNumberWithString:", objc_msgSend(a2, "stringValue"));
      goto LABEL_33;
    }
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Unacceptable type of value for attribute: property = \"%@\"; desired type = %@; given type = %@; value = %@.",
                   [a1 name],
                   [a1 attributeValueClassName],
                   objc_opt_class(),
                   a2);
LABEL_58:
    -[NSSQLiteConnection _batchInsertThrowWithErrorCode:andMessage:forKey:andValue:additionalDetail:](1550, v7, a1, (uint64_t)a2, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(a1, "name"), @"key", a2, @"value", 0));
  }
  if (([a1 isTransient] & 1) == 0 && objc_msgSend(a1, "attributeType") != 1800)
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Cannot set value for attribute with undefined type: property = \"%@\"; entity = \"%@\"; value = %@",
                   [a1 name],
                   [a1 entity],
                   a2,
                   v32);
    goto LABEL_58;
  }
LABEL_33:
  id v33 = 0;
  if ((objc_msgSend(a1, "_nonPredicateValidateValue:forKey:inObject:error:", &v34, objc_msgSend(a1, "name"), 0, &v33) & 1) == 0)
  {
    int v28 = [v33 code];
    uint64_t v29 = (void *)[v33 localizedDescription];
    -[NSSQLiteConnection _batchInsertThrowWithErrorCode:andMessage:forKey:andValue:additionalDetail:](v28, v29, a1, (uint64_t)v34, [v33 userInfo]);
  }
  uint64_t v8 = (void *)[a1 _rawValidationPredicates];
  uint64_t v9 = (void *)[a1 _rawValidationWarnings];
  uint64_t result = [v8 count];
  if (result)
  {
    uint64_t v11 = result;
    for (uint64_t i = 0; v11 != i; ++i)
    {
      uint64_t v13 = (void *)[v8 objectAtIndex:i];
      uint64_t result = [v13 evaluateWithObject:v34];
      if ((result & 1) == 0)
      {
        uint64_t v14 = (void *)[v9 objectAtIndex:i];
        uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(v8, "objectAtIndex:", i), @"NSValidationErrorPredicate", 0);
        if (!v14)
        {
          uint64_t v16 = (uint64_t)v34;
          int v17 = 1550;
          goto LABEL_49;
        }
        if ([v14 isNSString])
        {
          uint64_t v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "entity"), "managedObjectModel"), "_localizationPolicy"), "localizedModelStringForKey:", v14);
          if (v18) {
            sqlite3_int64 v19 = (void *)v18;
          }
          else {
            sqlite3_int64 v19 = v14;
          }
          uint64_t v16 = (uint64_t)v34;
          int v17 = 1550;
          goto LABEL_50;
        }
        if ([v14 isNSNumber])
        {
          int v17 = [v14 intValue];
          uint64_t v16 = (uint64_t)v34;
LABEL_49:
          sqlite3_int64 v19 = 0;
LABEL_50:
          -[NSSQLiteConnection _batchInsertThrowWithErrorCode:andMessage:forKey:andValue:additionalDetail:](v17, v19, a1, v16, v15);
        }
        objc_opt_class();
        uint64_t result = objc_opt_isKindOfClass();
        if ((result & 1) == 0)
        {
          int v20 = [v14 intValue];
          id v21 = objc_msgSend(NSString, "stringWithFormat:", @"Illegal validation warning: property = \"%@\"; predicate/warning index = %lu; warning = %@.",
                          [a1 name],
                          i,
                          v14);
          uint64_t v22 = (uint64_t)v34;
          long long v23 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v24 = [a1 name];
          uint64_t v25 = [NSNumber numberWithUnsignedLong:i];
          -[NSSQLiteConnection _batchInsertThrowWithErrorCode:andMessage:forKey:andValue:additionalDetail:](v20, v21, a1, v22, objc_msgSend(v23, "dictionaryWithObjectsAndKeys:", v24, @"NSValidationErrorKey", v25, @"index", v14, @"warning", v34, @"NSValidationErrorValue", 0));
        }
      }
    }
  }
  return result;
}

- (uint64_t)insertManagedObjectBlock:(void *)a3 forEntity:(int)a4 includeOnConflict:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v5 = *(NSObject **)(a1 + 8);
  if (v5) {
    dispatch_assert_queue_V2(v5);
  }
  id v29 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v33 = 0;
  uint64_t v30 = a3;
  while (1)
  {
    id v6 = -[NSManagedObject initWithEntity:insertIntoManagedObjectContext:]([NSManagedObject alloc], "initWithEntity:insertIntoManagedObjectContext:", [a3 entityDescription], 0);
    uint64_t v35 = v6;
    uint64_t v7 = v6
       ? -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:](v6, __const__newAllPropertiesWithRelationshipFaultsIntact___simple, __const__newAllPropertiesWithRelationshipFaultsIntact___complex, 1): 0;
    -[NSManagedObject _setOriginalSnapshot__:](v35, v7);

    if ((*(uint64_t (**)(uint64_t, NSManagedObject *))(a2 + 16))(a2, v35)) {
      break;
    }
    sqlite3_int64 v36 = -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](a1, [a3 rootEntity], 1u);
    if (!v36)
    {
      id v26 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134030, @"unable to generate primary keys for batch insert", 0);
      objc_exception_throw(v26);
    }
    -[NSSQLiteConnection prepareInsertStatementForEntity:includeConstraints:includeOnConflict:onConflictKeys:](a1, a3, a4, [(NSDictionary *)[(NSManagedObject *)v35 changedValues] allKeys]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v8 = (void *)[*(id *)(a1 + 48) bindVariables];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v39;
      id obj = v8;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v39 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if ([v12 index])
          {
            if ([v12 index] == 2)
            {
              [v12 setUnsignedInt:1];
            }
            else
            {
              uint64_t v13 = (void *)[v12 propertyDescription];
              uint64_t v14 = v13;
              if (v13)
              {
                uint64_t v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "_qualifiedName"), "componentsSeparatedByString:", @"."), "mutableCopy");
                id v16 = -[NSManagedObject valueForKey:](v35, "valueForKey:", [v15 firstObject]);
                [v15 removeObjectAtIndex:0];
                for (unint64_t j = 0; j < [v15 count]; ++j)
                {
                  uint64_t v18 = [v15 objectAtIndex:j];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    id v16 = (id)[v16 objectForKey:v18];
                  }
                }

                if (!v16 || (uint64_t v19 = objc_opt_class(), v19 == objc_opt_class()))
                {
                  if ([v14 defaultValue])
                  {
                    if ([v14 _propertyType] == 7) {
                      uint64_t v20 = [v14 _buildDefaultValue];
                    }
                    else {
                      uint64_t v20 = [v14 defaultValue];
                    }
                    uint64_t v21 = v20;
                  }
                  else
                  {
                    if (([v14 isOptional] & 1) == 0)
                    {
                      long long v23 = (void *)MEMORY[0x1E4F1CA60];
                      uint64_t v24 = [v30 entityDescription];
                      uint64_t v25 = [v14 name];
                      -[NSSQLiteConnection _batchInsertThrowWithErrorCode:andMessage:forKey:andValue:additionalDetail:](1570, @"mandatory property not set", v14, (uint64_t)v16, objc_msgSend(v23, "dictionaryWithObjectsAndKeys:", v24, @"NSValidationErrorObject", v25, @"NSValidationErrorKey", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"NSValidationErrorValue", 0));
                    }
                    uint64_t v21 = 0;
                  }
                  [v12 setValue:v21];
                }
                else
                {
                  -[NSSQLiteConnection _validateProperty:withValue:](v14, v16);
                  [v12 setValue:v16];
                }
              }
            }
          }
          else
          {
            [v12 setInt64:v36];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v9);
    }
    [(id)a1 execute];
    a3 = v30;
    v33 += sqlite3_changes(*(sqlite3 **)(a1 + 72));
    if (!*(void *)(a1 + 80))
    {
      uint64_t v22 = -[NSSQLiteConnection statementCacheForEntity:](a1, v30);
      -[NSSQLiteStatementCache cacheBatchInsertStatement:](v22, 0);
    }
    -[NSSQLiteConnection _clearBindVariablesForInsertedRow](a1);
    -[NSSQLiteConnection resetSQLStatement](a1);
  }
  [v29 drain];
  id v27 = 0;
  return v33;
}

- (uint64_t)gatherObjectIDsFromTable:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!-[NSSQLiteConnection _tableHasRows:](a1, a2)) {
    return MEMORY[0x1E4F1CBF0];
  }
  uint64_t v4 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([(id)a1 adapter], objc_msgSend(NSString, "stringWithFormat:", @"SELECT DISTINCT ENTITYID, PRIMEKEY FROM %@", a2));
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v21 = v4;
  uint64_t v5 = [[NSSQLColumn alloc] initWithColumnName:@"ENTITYID" sqlType:2];
  [v22 addObject:v5];

  id v6 = [[NSSQLColumn alloc] initWithColumnName:@"PRIMEKEY" sqlType:2];
  [v22 addObject:v6];

  -[NSSQLiteConnection prepareSQLStatement:](a1, v4);
  -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v22);
  [(id)a1 execute];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  while (1)
  {
    uint64_t v8 = -[NSSQLiteConnection newFetchedArray](a1);
    if (!v8) {
      break;
    }
    uint64_t v9 = v8;
    if ([v8 count] == 2)
    {
      uint64_t v10 = (void *)[v9 objectAtIndex:0];
      uint64_t v11 = (void *)[v9 objectAtIndex:1];
      if ((unint64_t)[v10 unsignedLongValue] >> 7 < 0x7D)
      {
        uint64_t v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "model"), "entityForID:", objc_msgSend(v10, "unsignedLongValue"));
      }
      else
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v12 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "ancillarySQLModels"), "allValues");
        uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v24;
LABEL_9:
          uint64_t v15 = 0;
          while (1)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v15), "entityForID:", objc_msgSend(v10, "unsignedLongValue"));
            if (v16) {
              break;
            }
            if (v13 == ++v15)
            {
              uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
              uint64_t v16 = 0;
              if (v13) {
                goto LABEL_9;
              }
              break;
            }
          }
        }
        else
        {
          uint64_t v16 = 0;
        }
      }
      int v17 = objc_msgSend(*(id *)(a1 + 16), "newObjectIDForEntity:pk:", v16, objc_msgSend(v11, "unsignedLongLongValue"));
      [v7 addObject:v17];
    }
  }
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithArray:v7];

  uint64_t v18 = v19;
  -[NSSQLiteConnection releaseSQLStatement](a1);
  -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0);
  *(_DWORD *)(a1 + 312) &= ~2u;
  *(void *)(a1 + 100) = 0;
  *(void *)(a1 + 92) = 0;
  *(_DWORD *)(a1 + 108) = 0;

  return v18;
}

- (uint64_t)_int64ResultForSQL:(uint64_t)a1
{
  CFArrayRef v2 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](a1, a2);
  if (!v2) {
    return 0;
  }
  CFArrayRef v3 = v2;
  if (CFArrayGetCount(v2) && *(void *)CFArrayGetValueAtIndex(v3, 0)) {
    uint64_t v4 = *(void *)CFArrayGetValueAtIndex(v3, 1);
  }
  else {
    uint64_t v4 = 0;
  }
  CFRelease(v3);
  return v4;
}

- (uint64_t)percentageUsedByPersistentHistory
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = -[NSSQLiteConnection _int64ResultForSQL:](result, @"PRAGMA page_count");
    uint64_t v3 = -[NSSQLiteConnection _int64ResultForSQL:](v1, @"PRAGMA freelist_count");
    uint64_t v4 = v2 - v3;
    if (v2 - v3 < 1)
    {
      uint64_t v16 = [NSString stringWithUTF8String:"Percentage History calculation error. Total Pages - %lld  Free Pages - %lld"];
      _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, v2);
      long long v23 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v40 = v2;
        __int16 v41 = 2048;
        uint64_t v42 = v3;
        _os_log_fault_impl(&dword_18AB82000, v23, OS_LOG_TYPE_FAULT, "CoreData: Percentage History calculation error. Total Pages - %lld  Free Pages - %lld", buf, 0x16u);
      }
      return 0;
    }
    else
    {
      uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 16), "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey");
      if (v5) {
        uint64_t v5 = (void *)v5[4];
      }
      id v6 = (void *)[v5 valueForKey:@"tableName"];
      uint64_t v7 = [v6 count];
      unint64_t v8 = 0x1E4F28000uLL;
      if (v7)
      {
        uint64_t v33 = v2 - v3;
        uint64_t v34 = v2;
        uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"(");
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        uint64_t v10 = [v6 countByEnumeratingWithState:&v35 objects:buf count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v36;
          char v13 = 1;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v36 != v12) {
                objc_enumerationMutation(v6);
              }
              uint64_t v15 = *(void *)(*((void *)&v35 + 1) + 8 * i);
              if ((v13 & 1) == 0) {
                [v9 appendString:@", "];
              }
              [v9 appendFormat:@"'%@'", v15];
              char v13 = 0;
            }
            uint64_t v11 = [v6 countByEnumeratingWithState:&v35 objects:buf count:16];
            char v13 = 0;
          }
          while (v11);
        }
        [v9 appendString:@""]);
        uint64_t v2 = v34;
        uint64_t v4 = v33;
        unint64_t v8 = 0x1E4F28000;
      }
      else
      {
        uint64_t v9 = 0;
      }
      long long v24 = (void *)[objc_alloc(*(Class *)(v8 + 3704)) initWithFormat:@"SELECT sum(pageno) FROM dbstat d, sqlite_master m WHERE d.name = m.name AND d.aggregate = TRUE"];
      long long v25 = v24;
      if (v9) {
        [v24 appendFormat:@" AND m.tbl_name IN %@", v9];
      }
      uint64_t v26 = -[NSSQLiteConnection _int64ResultForSQL:](v1, v25);

      _NSCoreDataLog(4, @"Percentage History: total pages - %lld, free pages - %lld, historyPages - %lld", v27, v28, v29, v30, v31, v32, v2);
      return 100 * v26 / v4;
    }
  }
  return result;
}

- (BOOL)registerMigrationUpdateFunctionWithMigrator:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(NSObject **)(a1 + 8);
    if (v4) {
      dispatch_assert_queue_V2(v4);
    }
    if (NSSQLiteRegisterMigrationFunctions(*(sqlite3 **)(a1 + 72), pApp)) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"An internal error occurred while configuring migration functions in the SQLite database." userInfo:0]);
    }
  }
  return a1 != 0;
}

- (void)executeAttributeUniquenessCheckSQLStatement:(void *)a3 returningColumns:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  -[NSSQLiteConnection prepareSQLStatement:](a1, a2);
  [(id)a1 execute];
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (v11 && *(unsigned char *)(v11 + 24) == 7)
        {
          [v7 addObject:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          if (*(void *)(v11 + 72)) {
            objc_msgSend(v7, "addObject:");
          }
        }
        else
        {
          [v7 addObject:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        }
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v7);
  while (1)
  {
    uint64_t v12 = -[NSSQLiteConnection newFetchedArray](a1);
    if (!v12) {
      break;
    }
    [v6 addObject:v12];
  }
  -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0);
  *(_DWORD *)(a1 + 312) &= ~2u;
  *(void *)(a1 + 100) = 0;
  *(void *)(a1 + 92) = 0;
  *(_DWORD *)(a1 + 108) = 0;
  -[NSSQLiteConnection _finalizeStatement](a1);
  -[NSSQLiteConnection resetSQLStatement](a1);
  return v6;
}

- (void)executeMulticolumnUniquenessCheckSQLStatement:(void *)a3 returningColumns:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  -[NSSQLiteConnection prepareSQLStatement:](a1, a2);
  [(id)a1 execute];
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (v11 && *(unsigned char *)(v11 + 24) == 7)
        {
          [v7 addObject:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          if (*(void *)(v11 + 72)) {
            objc_msgSend(v7, "addObject:");
          }
        }
        else
        {
          [v7 addObject:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        }
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v7);
  while (1)
  {
    uint64_t v12 = -[NSSQLiteConnection newFetchedArray](a1);
    if (!v12) {
      break;
    }
    [v6 addObject:v12];
  }
  -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0);
  *(_DWORD *)(a1 + 312) &= ~2u;
  *(void *)(a1 + 100) = 0;
  *(void *)(a1 + 92) = 0;
  *(_DWORD *)(a1 + 108) = 0;
  -[NSSQLiteConnection _finalizeStatement](a1);
  -[NSSQLiteConnection resetSQLStatement](a1);
  return v6;
}

- (void)reopenQueryGenerationWithIdentifier:(void *)a3 error:
{
  if (!a1) {
    return 0;
  }
  id v6 = *(NSObject **)(a1 + 8);
  if (v6) {
    dispatch_assert_queue_V2(v6);
  }
  if (!a2) {
    return a2;
  }
  if (!*(void *)(a1 + 72)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"database connection must not be nil here" userInfo:0]);
  }
  int v7 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v8 = (sqlite3_snapshot *)[a2 bytes];
  if (!v8) {
    return 0;
  }
  if (+[NSSQLCore debugDefault] >= 1) {
    NSLog((NSString *)@"connection %p attempting to reopen snapshot: %p", a1, v8);
  }
  if (!v7) {
    -[NSSQLiteConnection beginReadTransaction](a1);
  }
  if ((*(unsigned char *)(a1 + 313) & 2) == 0)
  {
    uint64_t v9 = sqlite3_snapshot_recover(*(sqlite3 **)(a1 + 72), "main");
    if (v9 && readFileSizeFromJournalHandle(*(sqlite3 **)(a1 + 72)) >= 1) {
      _NSCoreDataLog(1, @"sqlite3_snapshot_recover failed with %d", v10, v11, v12, v13, v14, v15, v9);
    }
    else {
      *(_DWORD *)(a1 + 312) |= 0x200u;
    }
  }
  while (1)
  {
    uint64_t v16 = sqlite3_snapshot_open(*(sqlite3 **)(a1 + 72), "main", v8);
    uint64_t v23 = v16;
    if (v16 == 517 || v16 == 0) {
      break;
    }
    if (v16 != 5) {
      goto LABEL_24;
    }
    usleep(0x64u);
  }
  if ((_BYTE)v16)
  {
LABEL_24:
    _NSCoreDataLog(1, @"Attempt to reopen sqlite3_snapshot_open failed %d", v17, v18, v19, v20, v21, v22, v16);
    if (a3)
    {
      long long v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInt:", v23), @"NSSQLiteErrorDomain", 0);
      a2 = 0;
      *a3 = [v25 errorWithDomain:*MEMORY[0x1E4F281F8] code:134180 userInfo:v26];
      if (v7) {
        return a2;
      }
    }
    else
    {
      a2 = 0;
      if (v7) {
        return a2;
      }
    }
    goto LABEL_32;
  }
  if ((int)-[NSSQLCore _registerNewQueryGenerationSnapshot:](*(void *)(a1 + 16), (uint64_t)a2) < 0) {
    a2 = 0;
  }
  if (!v7) {
LABEL_32:
  }
    -[NSSQLiteConnection rollbackTransaction](a1);
  return a2;
}

- (id)_activeGenerations
{
  if (result)
  {
    uint64_t v1 = (void *)[result[41] copy];
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __40__NSSQLiteConnection__activeGenerations__block_invoke;
    void v3[3] = &unk_1E544E150;
    v3[4] = v2;
    [v1 enumerateObjectsUsingBlock:v3];

    return (id *)v2;
  }
  return result;
}

uint64_t __40__NSSQLiteConnection__activeGenerations__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (uint64_t)_dropAllTriggers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    id v2 = -[NSSQLiteConnection fetchCreationSQLForType:containing:](result, @"trigger", 0);
    uint64_t result = [v2 count];
    if (result)
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long v8 = 0u;
      long long v9 = 0u;
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (result)
      {
        uint64_t v3 = result;
        uint64_t v4 = *(void *)v9;
        do
        {
          uint64_t v5 = 0;
          do
          {
            if (*(void *)v9 != v4) {
              objc_enumerationMutation(v2);
            }
            id v6 = *(void **)(*((void *)&v8 + 1) + 8 * v5);
            if ([v6 count] == 2)
            {
              int v7 = objc_msgSend((id)objc_msgSend(v6, "lastObject"), "componentsSeparatedByString:", @" ");
              if ((unint64_t)[v7 count] >= 4)
              {
                if (objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 2), "hasPrefix:", @"Z"))-[NSSQLiteConnection _executeSQLString:](v1, objc_msgSend(NSString, "stringWithFormat:", @"DROP TRIGGER %@", objc_msgSend(v7, "objectAtIndexedSubscript:", 2))); {
              }
                }
            }
            ++v5;
          }
          while (v3 != v5);
          uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
          uint64_t v3 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (uint64_t)_dropAllDATriggers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    id v2 = -[NSSQLiteConnection fetchCreationSQLForType:containing:](result, @"trigger", 0);
    uint64_t result = [v2 count];
    if (result)
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (result)
      {
        uint64_t v3 = result;
        uint64_t v4 = *(void *)v10;
        do
        {
          uint64_t v5 = 0;
          do
          {
            if (*(void *)v10 != v4) {
              objc_enumerationMutation(v2);
            }
            id v6 = *(void **)(*((void *)&v9 + 1) + 8 * v5);
            if ([v6 count] == 2)
            {
              int v7 = objc_msgSend((id)objc_msgSend(v6, "lastObject"), "componentsSeparatedByString:", @" ");
              if ((unint64_t)[v7 count] >= 4)
              {
                long long v8 = (void *)[v7 objectAtIndexedSubscript:2];
                if (([v8 hasPrefix:@"Z_DA_"] & 1) != 0
                  || [v8 hasPrefix:@"Z"]
                  && ([v8 hasPrefix:@"Z_RT_"] & 1) == 0
                  && ([v8 hasPrefix:@"ZT_"] & 1) == 0
                  && (([v8 hasSuffix:@"INSERT"] & 1) != 0
                   || ([v8 hasSuffix:@"UPDATE"] & 1) != 0
                   || ([v8 hasSuffix:@"DELETE"] & 1) != 0
                   || ([v8 hasSuffix:@"SET"] & 1) != 0
                   || [v8 hasSuffix:@"UNSET"]))
                {
                  -[NSSQLiteConnection _executeSQLString:](v1, (void *)[NSString stringWithFormat:@"DROP TRIGGER %@", v8]);
                }
              }
            }
            ++v5;
          }
          while (v3 != v5);
          uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
          uint64_t v3 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (void)triggerUpdatedRowInTable:(uint64_t)a3 withEntityID:(uint64_t)a4 primaryKey:columnName:newValue:
{
  if (a1)
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "model"), "entityForID:", a3);
    if (v6)
    {
      id v7 = (id)[*(id *)(a1 + 16) newObjectIDForEntity:v6 pk:a4];
      [*(id *)(a1 + 168) addObject:v7];
    }
  }
}

- (void)derivedAttributeUpdatedInsertedRowInTable:(uint64_t)a3 withEntityID:(uint64_t)a4 primaryKey:(uint64_t)a5 columnName:(uint64_t)a6 newValue:
{
  v13[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "model"), "entityForID:", a3);
    if (v10)
    {
      long long v11 = (void *)[*(id *)(a1 + 16) newObjectIDForEntity:v10 pk:a4];
      long long v12 = *(void **)(a1 + 176);
      v13[0] = v11;
      v13[1] = objc_msgSend(NSString, "stringWithFormat:", @"%s", a5);
      if (!a6) {
        a6 = [MEMORY[0x1E4F1CA98] null];
      }
      v13[2] = a6;
      objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v13, 3));
    }
  }
}

- (void)derivedAttributeUpdatedRowInTable:(uint64_t)a3 withEntityID:(uint64_t)a4 primaryKey:(uint64_t)a5 columnName:(uint64_t)a6 newValue:
{
  v13[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "model"), "entityForID:", a3);
    if (v10)
    {
      long long v11 = (void *)[*(id *)(a1 + 16) newObjectIDForEntity:v10 pk:a4];
      long long v12 = *(void **)(a1 + 184);
      v13[0] = v11;
      v13[1] = objc_msgSend(NSString, "stringWithFormat:", @"%s", a5);
      if (!a6) {
        a6 = [MEMORY[0x1E4F1CA98] null];
      }
      v13[2] = a6;
      objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v13, 3));
    }
  }
}

- (id)createArrayOfPrimaryKeysAndEntityIDsForRowsWithoutRecordMetadataWithEntity:(id *)a3 metadataEntity:
{
  v35[2] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  -[NSSQLiteConnection connect](a1);
  if (a2)
  {
    uint64_t v6 = (void *)a2[16];
    id v7 = (void *)a2[17];
    if (a3) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v6 = 0;
    id v7 = 0;
    if (a3)
    {
LABEL_4:
      long long v8 = (void *)[a3[5] objectForKey:@"entityPK"];
      long long v9 = (void *)[a3[5] objectForKey:@"entityId"];
      if (!v6) {
        goto LABEL_22;
      }
      goto LABEL_5;
    }
  }
  long long v8 = 0;
  long long v9 = 0;
  if (!v6) {
    goto LABEL_22;
  }
LABEL_5:
  if (!v7 || !v8 || !v9) {
LABEL_22:
  }
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Missing one or more columns to query record metadata for missing rows" userInfo:0]);
  uint64_t v31 = objc_msgSend((id)objc_msgSend(a2, "tableName"), "stringByAppendingFormat:", @".%@", objc_msgSend(v6, "columnName"));
  uint64_t v30 = objc_msgSend((id)objc_msgSend(a2, "tableName"), "stringByAppendingFormat:", @".%@", objc_msgSend(v7, "columnName"));
  uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "tableName"), "stringByAppendingFormat:", @".%@", objc_msgSend(v8, "columnName"));
  uint64_t v11 = objc_msgSend((id)objc_msgSend(a3, "tableName"), "stringByAppendingFormat:", @".%@", objc_msgSend(v9, "columnName"));
  uint64_t v12 = [NSString stringWithFormat:@"SELECT %@, %@, %@, %@ FROM %@ LEFT JOIN %@ ON %@ = %@ AND %@ = %@", v31, v30, v10, v11, objc_msgSend(a2, "tableName"), objc_msgSend(a3, "tableName"), v31, v10, v30, v11];
  uint64_t v13 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([(id)a1 adapter], objc_msgSend(NSString, "stringWithFormat:", @"SELECT %@, %@ FROM (%@) WHERE %@ IS NULL AND %@ IS NULL", objc_msgSend(v6, "columnName"), objc_msgSend(v7, "columnName"), v12, objc_msgSend(v8, "columnName"), objc_msgSend(v9, "columnName")));
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v15 = [[NSSQLColumn alloc] initWithColumnName:v31 sqlType:2];
  [v14 addObject:v15];

  uint64_t v16 = [[NSSQLColumn alloc] initWithColumnName:v30 sqlType:2];
  [v14 addObject:v16];

  -[NSSQLiteConnection _ensureDatabaseOpen]((void *)a1);
  -[NSSQLiteConnection _ensureNoStatementPrepared](a1);
  -[NSSQLiteConnection _ensureNoTransactionOpen](a1);
  -[NSSQLiteConnection _ensureNoFetchInProgress](a1);
  -[NSSQLiteConnection beginReadTransaction](a1);
  -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, v14);
  -[NSSQLiteConnection prepareSQLStatement:](a1, v13);
  if (+[NSSQLCore debugDefault] >= 4) {
    -[NSSQLiteConnection logQueryPlanForStatement:](a1, v13);
  }
  [(id)a1 execute];
  while (1)
  {
    uint64_t v17 = -[NSSQLiteConnection newFetchedArray](a1);
    uint64_t v18 = v17;
    if (!v17) {
      break;
    }
    if ([v17 count] == 2)
    {
      uint64_t v19 = [v18 objectAtIndexedSubscript:0];
      uint64_t v20 = [v18 objectAtIndexedSubscript:1];
      v35[0] = v19;
      v35[1] = v20;
      objc_msgSend(v32, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v35, 2));
    }
    else
    {
      uint64_t v21 = [NSString stringWithUTF8String:"Missing metadata query got an unexpected number of columns in the result: %@"];
      _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)v18);
      uint64_t v28 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = v18;
        _os_log_fault_impl(&dword_18AB82000, v28, OS_LOG_TYPE_FAULT, "CoreData: Missing metadata query got an unexpected number of columns in the result: %@", buf, 0xCu);
      }
    }
  }
  -[NSSQLiteConnection releaseSQLStatement](a1);
  -[NSSQLiteConnection setColumnsToFetch:]((void *)a1, 0);
  *(_DWORD *)(a1 + 312) &= ~2u;
  *(void *)(a1 + 100) = 0;
  *(void *)(a1 + 92) = 0;
  *(_DWORD *)(a1 + 108) = 0;
  -[NSSQLiteConnection rollbackTransaction](a1);

  return v32;
}

- (uint64_t)dedupeRowsForUniqueConstraintsInCloudKitMetadataEntity:(uint64_t)result
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    if (a2)
    {
      if ([*(id *)(a2 + 208) count])
      {
LABEL_8:
        uint64_t v13 = *(void **)(a2 + 216);
LABEL_9:
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __77__NSSQLiteConnection_dedupeRowsForUniqueConstraintsInCloudKitMetadataEntity___block_invoke;
        v15[3] = &unk_1E544B688;
        v15[4] = v3;
        v15[5] = a2;
        return [v13 enumerateObjectsUsingBlock:v15];
      }
      uint64_t v4 = *(void **)(a2 + 216);
    }
    else
    {
      uint64_t v14 = [0 count];
      uint64_t v4 = 0;
      uint64_t v13 = 0;
      if (v14) {
        goto LABEL_9;
      }
    }
    if (![v4 count]
      && (v5 = [NSString stringWithUTF8String:"Entity marked as needing unique constraint coalescing but does not appear to be uniqued: %@"], _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, a2), uint64_t v12 = __pflogFaultLog, os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = a2;
      _os_log_fault_impl(&dword_18AB82000, v12, OS_LOG_TYPE_FAULT, "CoreData: Entity marked as needing unique constraint coalescing but does not appear to be uniqued: %@", buf, 0xCu);
      if (a2) {
        goto LABEL_8;
      }
    }
    else if (a2)
    {
      goto LABEL_8;
    }
    uint64_t v13 = 0;
    goto LABEL_9;
  }
  return result;
}

void __77__NSSQLiteConnection_dedupeRowsForUniqueConstraintsInCloudKitMetadataEntity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = *(id **)(a1 + 40);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = v5;
    if (v4) {
      id v7 = v4[16];
    }
    else {
      id v7 = 0;
    }
    [v5 addObject:v7];
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"SELECT %@, ", objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", 0), "columnName")];
    id v9 = objc_alloc(MEMORY[0x1E4F28E78]);
    if (v4)
    {
      uint64_t v10 = [v4[16] columnName];
      uint64_t v11 = [v4[16] columnName];
      id v12 = v4[16];
    }
    else
    {
      uint64_t v10 = [0 columnName];
      uint64_t v11 = [0 columnName];
      id v12 = 0;
    }
    uint64_t v13 = (void *)[v9 initWithFormat:@"SELECT COUNT(DISTINCT(%@)) AS COUNT, MIN(%@) AS %@, ", v10, v11, objc_msgSend(v12, "columnName")];
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"GROUP BY "];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __77__NSSQLiteConnection_dedupeRowsForUniqueConstraint_inCloudKitMetadataEntity___block_invoke;
    v19[3] = &unk_1E544E178;
    v19[4] = v6;
    v19[5] = v13;
    v19[6] = v14;
    void v19[7] = v8;
    [a2 enumerateObjectsUsingBlock:v19];
    [v13 appendFormat:@" FROM %@ %@ ORDER BY COUNT DESC", objc_msgSend(v4, "tableName"), v14];
    [v8 appendFormat:@" FROM (%@) WHERE COUNT > 1;", v13];
    uint64_t v15 = [[NSSQLiteStatement alloc] initWithEntity:v4 sqlString:v8];
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    -[NSSQLiteConnection prepareSQLStatement:](v2, v15);
    [(id)v2 execute];
    -[NSSQLiteConnection setColumnsToFetch:]((void *)v2, v6);
    while (1)
    {
      uint64_t v17 = -[NSSQLiteConnection newFetchedArray](v2);
      if (!v17) {
        break;
      }
      [v16 addObject:v17];
    }
    -[NSSQLiteConnection setColumnsToFetch:]((void *)v2, 0);
    *(_DWORD *)(v2 + 312) &= ~2u;
    *(void *)(v2 + 100) = 0;
    *(void *)(v2 + 92) = 0;
    *(_DWORD *)(v2 + 108) = 0;
    -[NSSQLiteConnection _finalizeStatement](v2);
    -[NSSQLiteConnection resetSQLStatement](v2);

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __77__NSSQLiteConnection_dedupeRowsForUniqueConstraint_inCloudKitMetadataEntity___block_invoke_2;
    v18[3] = &unk_1E544E1A0;
    v18[4] = v4;
    v18[5] = v6;
    v18[6] = v2;
    [v16 enumerateObjectsUsingBlock:v18];
  }
}

uint64_t __77__NSSQLiteConnection_dedupeRowsForUniqueConstraint_inCloudKitMetadataEntity___block_invoke(id *a1, void *a2, uint64_t a3)
{
  [a1[4] addObject:a2];
  if (a3)
  {
    [a1[5] appendString:@", "];
    [a1[6] appendString:@", "];
    [a1[7] appendString:@", "];
  }
  objc_msgSend(a1[5], "appendString:", objc_msgSend(a2, "columnName"));
  objc_msgSend(a1[6], "appendString:", objc_msgSend(a2, "columnName"));
  id v6 = a1[7];
  uint64_t v7 = [a2 columnName];

  return [v6 appendString:v7];
}

void __77__NSSQLiteConnection_dedupeRowsForUniqueConstraint_inCloudKitMetadataEntity___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"DELETE FROM %@ WHERE ", objc_msgSend(*(id *)(a1 + 32), "tableName")];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__NSSQLiteConnection_dedupeRowsForUniqueConstraint_inCloudKitMetadataEntity___block_invoke_3;
  v6[3] = &unk_1E544B688;
  v6[4] = *(void *)(a1 + 40);
  v6[5] = v4;
  [a2 enumerateObjectsUsingBlock:v6];
  id v5 = [[NSSQLiteStatement alloc] initWithEntity:*(void *)(a1 + 32) sqlString:v4];
  -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(void *)(a1 + 48), v5);
}

void __77__NSSQLiteConnection_dedupeRowsForUniqueConstraint_inCloudKitMetadataEntity___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  if (a3) {
    [*(id *)(a1 + 40) appendString:@" AND "];
  }
  if ([a2 isNSString])
  {
    [*(id *)(a1 + 40) appendFormat:@"%@ = '%@'", objc_msgSend(v6, "columnName"), a2];
  }
  else if ([a2 isNSNumber])
  {
    [*(id *)(a1 + 40) appendFormat:@"%@ = %@", objc_msgSend(v6, "columnName"), a2];
  }
  else
  {
    uint64_t v7 = [NSString stringWithUTF8String:"CloudKit: Deduping for metadata entity doesn't know how to handle this type of object yet: %@ - %@"];
    _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    uint64_t v14 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      uint64_t v18 = a2;
      _os_log_fault_impl(&dword_18AB82000, v14, OS_LOG_TYPE_FAULT, "CoreData: CloudKit: Deduping for metadata entity doesn't know how to handle this type of object yet: %@ - %@", buf, 0x16u);
    }
  }
}

@end