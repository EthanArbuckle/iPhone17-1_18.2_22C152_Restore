@interface _DKKnowledgeStorage
+ (_DKKnowledgeStorage)storageWithDirectory:(id)a3 readOnly:(BOOL)a4;
+ (_DKKnowledgeStorage)storageWithDirectory:(id)a3 readOnly:(BOOL)a4 localOnly:(BOOL)a5;
+ (_DKKnowledgeStorage)storageWithShallowCopyFromStorage:(id)a3 clientIdentifier:(id)a4;
+ (id)sourceDeviceIdentityFromDeviceID:(uint64_t)a1;
+ (id)sourceDeviceIdentityFromObject:(id)a3;
- (BOOL)_deleteObjects:(void *)a3 error:;
- (BOOL)biomeStreamContainsEntries:(uint64_t)a1;
- (BOOL)copyValueToManagedObject:(uint64_t)a1;
- (BOOL)coreDataStorage:(id)a3 didAutoMigratePersistentStore:(id)a4 toManagedObjectModel:(id)a5 havingVersion:(unint64_t)a6 error:(id *)a7;
- (BOOL)coreDataStorage:(id)a3 shouldCallDelegateAfterAutoMigrationToManagedObjectModelHavingVersion:(unint64_t)a4;
- (BOOL)coreDataStorage:(id)a3 shouldCallDelegateBeforeAutoMigrationFromManagedObjectModelHavingVersion:(unint64_t)a4;
- (BOOL)coreDataStorage:(id)a3 willAutoMigrateStoreAtURL:(id)a4 fromManagedObjectModel:(id)a5 havingVersion:(unint64_t)a6 error:(id *)a7;
- (BOOL)deleteKnowledgeStream:(void *)a3 context:(uint64_t)a4 expectedEventCount:;
- (BOOL)deleteObjects:(id)a3 error:(id *)a4;
- (BOOL)deleteStorage;
- (BOOL)deleteSyncStorage;
- (BOOL)enableBiomeMigrationDeletion;
- (BOOL)localOnly;
- (BOOL)migrateDataToBiomeWithManagedObjectContext:(id)a3;
- (BOOL)migrateEventBatchToBiomeStream:(void *)a3 fetchRequest:(void *)a4 managedObjectContex:(void *)a5 converter:(void *)a6 eventCount:(void *)a7 offset:;
- (BOOL)saveChangeSetsForSync:(id)a3 error:(id *)a4;
- (BOOL)saveObjects:(id)a3 error:(id *)a4;
- (BOOL)saveSyncPeer:(id)a3 error:(id *)a4;
- (BOOL)updateDataBeforeAutoMigrationFromVersion:(void *)a3 inStoreAtURL:(void *)a4 error:;
- (BOOL)verifyBiomeMigration:(uint64_t)a3 expectedEventCount:;
- (NSUUID)deviceUUID;
- (_DKCoreDataStorage)storage;
- (_DKCoreDataStorage)syncStorage;
- (_DKTombstonePolicy)tombstonePolicy;
- (dispatch_queue_t)_deleteAllEventsMatchingPredicate:(void *)a3 error:;
- (dispatch_queue_t)_executeQuery:(void *)a3 error:;
- (dispatch_queue_t)_tombstoneObjectsMatchingPredicate:(uint64_t)a3 batchSize:(void *)a4 error:;
- (id)_requestForChangeSinceDate:(uint64_t)a1;
- (id)coreDataStorage:(id)a3 needsManagedObjectModelNameForVersion:(unint64_t)a4;
- (id)errorForException:(uint64_t)a1;
- (id)eventCountPerStreamName;
- (id)eventCountsForStreams:(id)a3;
- (id)executeQuery:(id)a3 error:(id *)a4;
- (id)fetchLocalChangesSinceDate:(id)a3 error:(id *)a4;
- (id)fetchSyncChangesSinceDate:(id)a3 error:(id *)a4;
- (id)initWithDirectory:(uint64_t)a3 readOnly:(int)a4 localOnly:;
- (id)initWithShallowCopyFromStorage:(void *)a3 clientIdentifier:;
- (id)keyValueObjectForKey:(void *)a3 domain:;
- (id)keyValueStoreForDomain:(id)a3;
- (id)lastChangeSetWithEntityName:(id)a3 error:(id *)a4;
- (id)migrationStreamsWithMOC:(uint64_t)a1;
- (id)nilArrayError;
- (id)removeBadObjects:(uint64_t)a1;
- (id)sourceDeviceIdentity;
- (id)syncPeersWithError:(id *)a3;
- (id)syncStorageAssertion;
- (id)syncStorageIfAvailable;
- (id)versionsRequiringManualSetup;
- (uint64_t)_saveObjects:(void *)a3 error:;
- (uint64_t)executionQueue;
- (uint64_t)finalMigrationVersion;
- (uint64_t)migrateStream:(void *)a3 context:;
- (uint64_t)updateDataAfterAutoMigrationToVersion:(void *)a3 inPersistentStore:(void *)a4 error:;
- (unint64_t)deleteAllEventsInEventStream:(id)a3 error:(id *)a4;
- (unint64_t)deleteAllEventsMatchingPredicate:(id)a3 error:(id *)a4;
- (unint64_t)deleteEventsMatchingPredicate:(id)a3 limit:(unint64_t)a4;
- (unint64_t)deleteEventsStartingEarlierThanDate:(id)a3 limit:(unint64_t)a4;
- (unint64_t)deleteHistogram:(id)a3;
- (unint64_t)deleteObjectsInEventStream:(id)a3 ifNeededToLimitEventCount:(unint64_t)a4 batchLimit:(unint64_t)a5;
- (unint64_t)deleteObjectsInEventStreams:(id)a3 olderThanDate:(id)a4 limit:(unint64_t)a5;
- (unint64_t)deleteObjectsOlderThanDate:(id)a3 excludingPredicate:(id)a4 limit:(unint64_t)a5;
- (unint64_t)deleteOldObjectsIfNeededToLimitTotalNumber:(unint64_t)a3 excludingPredicate:(id)a4 limit:(unint64_t)a5;
- (unint64_t)deleteOrphanedEntities;
- (unint64_t)eventCount;
- (unint64_t)lastSequenceNumberForChangeSetWithEntityName:(id)a3 error:(id *)a4;
- (unint64_t)totalEventCountForStreams:(id)a3;
- (void)_databaseChangedWithNotification:(id)a3;
- (void)_sendEventsNotificationName:(void *)a3 withObjects:;
- (void)_sendInsertEventsNotificationWithObjects:(uint64_t)a1;
- (void)_sendTombstoneNotificationsWithStreamNameCounts:(uint64_t)a1;
- (void)_tombstoneObjects:(void *)a3 error:;
- (void)addKnowledgeStorageEventNotificationDelegate:(id)a3;
- (void)closeStorage;
- (void)closeSyncStorage;
- (void)configureDeviceUUID;
- (void)dealloc;
- (void)decrementInsertsAndDeletesObserverCount;
- (void)deleteAllEventsInEventStream:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5;
- (void)deleteAllEventsMatchingPredicate:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5;
- (void)deleteObjects:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5;
- (void)executeQuery:(id)a3 responseQueue:(id)a4;
- (void)executeQuery:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5;
- (void)incrementInsertsAndDeletesObserverCount;
- (void)removeKeyValueObjectForKey:(void *)a3 domain:;
- (void)removeKnowledgeStorageEventNotificationDelegate:(id)a3;
- (void)removeSyncPeer:(id)a3;
- (void)saveHistogram:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5;
- (void)saveObjects:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5;
- (void)saveObjects:(id)a3 tracker:(id)a4 responseQueue:(id)a5 withCompletion:(id)a6;
- (void)setEnableBiomeMigrationDeletion:(BOOL)a3;
- (void)setKeyValueObject:(void *)a3 forKey:(void *)a4 domain:;
- (void)setTombstonePolicy:(id)a3;
- (void)startSyncDownFromCloudWithResponseQueue:(id)a3 withCompletion:(id)a4;
- (void)startSyncUpToCloudWithResponseQueue:(id)a3 withCompletion:(id)a4;
- (void)syncStorageIfAvailable;
- (void)updateToFinalMetadata:(uint64_t)a1;
- (void)versionsRequiringManualMigration;
@end

@implementation _DKKnowledgeStorage

- (uint64_t)_saveObjects:(void *)a3 error:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
    if (v5)
    {
      v6 = -[_DKKnowledgeStorage removeBadObjects:](a1, v5);
      uint64_t v7 = [v6 count];
      if (v7 != [v5 count])
      {
        v8 = (void *)[v5 mutableCopy];
        [v8 removeObjectsInArray:v6];
        v9 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[_DKKnowledgeStorage _saveObjects:error:]();
        }
      }
      if (![v6 count])
      {
        if (a3) {
          *a3 = 0;
        }
        a1 = 1;
        goto LABEL_31;
      }
      uint64_t v43 = 0;
      v44 = &v43;
      uint64_t v45 = 0x2020000000;
      char v46 = 1;
      uint64_t v37 = 0;
      v38 = &v37;
      uint64_t v39 = 0x3032000000;
      v40 = __Block_byref_object_copy__13;
      v41 = __Block_byref_object_dispose__13;
      id v42 = 0;
      [v5 count];
      [v6 count];
      kdebug_trace();
      v30 = (void *)[v5 count];
      id v10 = v5;
      v11 = [v10 lastObject];
      if (v11)
      {
        v12 = [v10 lastObject];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v20 = @"unknown";
LABEL_23:

          goto LABEL_24;
        }
        v13 = [v10 lastObject];
        v14 = [v13 stream];
        v15 = [v14 name];
        BOOL v16 = v15 == 0;

        if (!v16)
        {
          v17 = [v10 lastObject];
          v18 = [v17 stream];
          v11 = [v18 name];

          if ((unint64_t)[v10 count] < 2)
          {
            v19 = v11;
          }
          else
          {
            v19 = [NSString stringWithFormat:@"%@ +more...", v11];
          }
          v20 = v19;
          goto LABEL_23;
        }
      }
      v20 = @"unknown";
LABEL_24:

      _cdknowledge_signpost_save_begin(v30, v20);
      v21 = [[_CDMemoryUsageInterval alloc] initWithName:@"saveObjects" client:0];
      [(_CDMemoryUsageInterval *)v21 begin];
      v22 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = [v10 count];
        *(_DWORD *)buf = 134217984;
        *(void *)v48 = v23;
        _os_log_impl(&dword_18ECEB000, v22, OS_LOG_TYPE_INFO, "[Storage] Starting saveObjects with %lu objects.", buf, 0xCu);
      }

      v24 = [*(id *)(a1 + 96) managedObjectContextFor:*MEMORY[0x1E4F28358] identifier:*(void *)(a1 + 72)];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __42___DKKnowledgeStorage__saveObjects_error___block_invoke;
      v31[3] = &unk_1E560F1E0;
      id v32 = v6;
      id v25 = v24;
      v35 = &v37;
      v36 = &v43;
      id v33 = v25;
      uint64_t v34 = a1;
      [v25 performWithOptions:4 andBlock:v31];
      v26 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        int v27 = *((unsigned __int8 *)v44 + 24);
        uint64_t v28 = v38[5];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v48 = v27;
        *(_WORD *)&v48[4] = 2112;
        *(void *)&v48[6] = v28;
        _os_log_impl(&dword_18ECEB000, v26, OS_LOG_TYPE_INFO, "[Storage] Completed saveObjects with success=%d. Error: %@.", buf, 0x12u);
      }

      [(_CDMemoryUsageInterval *)v21 end];
      if (a3) {
        *a3 = (id) v38[5];
      }
      a1 = *((unsigned char *)v44 + 24) != 0;

      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(&v43, 8);
LABEL_31:

      goto LABEL_32;
    }
    if (a3)
    {
      -[_DKKnowledgeStorage nilArrayError]((void *)a1);
      a1 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
  }
LABEL_32:

  return a1;
}

- (void)_sendEventsNotificationName:(void *)a3 withObjects:
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v38 = a1;
  if (a1)
  {
    uint64_t v7 = objc_opt_new();
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v37 = v6;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v50 objects:v61 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v51 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = v12;
            v14 = [v13 stream];
            v15 = [v14 name];

            if (v15) {
              [v7 addObject:v15];
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v50 objects:v61 count:16];
      }
      while (v9);
    }

    if ([v7 count])
    {
      id v36 = *(id *)(v38 + 56);
      objc_sync_enter(v36);
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      obuint64_t j = *(id *)(v38 + 56);
      uint64_t v16 = [obj countByEnumeratingWithState:&v46 objects:v60 count:16];
      if (!v16) {
        goto LABEL_31;
      }
      uint64_t v17 = *(void *)v47;
      while (1)
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v47 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v46 + 1) + 8 * j);
          if (objc_msgSend(v5, "isEqualToString:", @"_DKKnowledgeStorageDidInsertEventsNotification", v36))
          {
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              continue;
            }
            v20 = *(void **)(v38 + 32);
            v44[0] = MEMORY[0x1E4F143A8];
            v44[1] = 3221225472;
            v44[2] = __63___DKKnowledgeStorage__sendEventsNotificationName_withObjects___block_invoke;
            v44[3] = &unk_1E560DB80;
            v44[4] = v19;
            v44[5] = v38;
            id v45 = v7;
            v21 = v44;
            v22 = v20;
            uint64_t v23 = (void *)os_transaction_create();
            uint64_t block = MEMORY[0x1E4F143A8];
            uint64_t v55 = 3221225472;
            v56 = __cd_dispatch_async_capture_tx_block_invoke_6;
            v57 = &unk_1E560D978;
            id v58 = v23;
            id v59 = v21;
            id v24 = v23;
            dispatch_async(v22, &block);

            id v25 = &v45;
            goto LABEL_28;
          }
          if ([v5 isEqualToString:@"_DKKnowledgeStorageDidInsertLocalEventsNotification"])
          {
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              continue;
            }
            v26 = *(void **)(v38 + 32);
            v42[0] = MEMORY[0x1E4F143A8];
            v42[1] = 3221225472;
            v42[2] = __63___DKKnowledgeStorage__sendEventsNotificationName_withObjects___block_invoke_2;
            v42[3] = &unk_1E560DB80;
            v42[4] = v19;
            v42[5] = v38;
            id v43 = v7;
            int v27 = v42;
            uint64_t v28 = v26;
            v29 = (void *)os_transaction_create();
            uint64_t block = MEMORY[0x1E4F143A8];
            uint64_t v55 = 3221225472;
            v56 = __cd_dispatch_async_capture_tx_block_invoke_6;
            v57 = &unk_1E560D978;
            id v58 = v29;
            id v59 = v27;
            id v30 = v29;
            dispatch_async(v28, &block);

            id v25 = &v43;
            goto LABEL_28;
          }
          if [v5 isEqualToString:@"_DKKnowledgeStorageDidDeleteEventsNotification"]&& (objc_opt_respondsToSelector())
          {
            v31 = *(void **)(v38 + 32);
            v40[0] = MEMORY[0x1E4F143A8];
            v40[1] = 3221225472;
            v40[2] = __63___DKKnowledgeStorage__sendEventsNotificationName_withObjects___block_invoke_3;
            v40[3] = &unk_1E560DB80;
            v40[4] = v19;
            v40[5] = v38;
            id v41 = v7;
            id v32 = v40;
            id v33 = v31;
            uint64_t v34 = (void *)os_transaction_create();
            uint64_t block = MEMORY[0x1E4F143A8];
            uint64_t v55 = 3221225472;
            v56 = __cd_dispatch_async_capture_tx_block_invoke_6;
            v57 = &unk_1E560D978;
            id v58 = v34;
            id v59 = v32;
            id v35 = v34;
            dispatch_async(v33, &block);

            id v25 = &v41;
LABEL_28:

            continue;
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v46 objects:v60 count:16];
        if (!v16)
        {
LABEL_31:

          objc_sync_exit(v36);
          break;
        }
      }
    }

    id v6 = v37;
  }
}

- (id)removeBadObjects:(uint64_t)a1
{
  if (a1)
  {
    id v2 = a2;
    v3 = [v2 indexesOfObjectsPassingTest:&__block_literal_global_45];
    v4 = (void *)[v2 mutableCopy];

    [v4 removeObjectsAtIndexes:v3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_sendInsertEventsNotificationWithObjects:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[_DKKnowledgeStorage _sendEventsNotificationName:withObjects:](a1, @"_DKKnowledgeStorageDidInsertEventsNotification", v3);
    id v5 = +[_DKQuery predicateForEventsWithNullSourceDeviceID];
    v4 = [v3 filteredArrayUsingPredicate:v5];

    -[_DKKnowledgeStorage _sendEventsNotificationName:withObjects:](a1, @"_DKKnowledgeStorageDidInsertLocalEventsNotification", v4);
  }
}

- (unint64_t)deleteEventsStartingEarlierThanDate:(id)a3 limit:(unint64_t)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F29008];
  id v7 = a3;
  id v8 = [v6 sortDescriptorWithKey:@"startDate" ascending:1];
  uint64_t v9 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358] identifier:self->_clientID];
  uint64_t v10 = +[_DKEvent entityName];
  v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"startDate < %@", v7];

  v16[0] = v8;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  LOBYTE(v15) = 0;
  unint64_t v13 = +[_DKCoreDataStorage deleteObjectsInContext:v9 entityName:v10 predicate:v11 sortDescriptors:v12 fetchLimit:a4 includeSubentities:0 includePendingChanges:v15];

  return v13;
}

- (unint64_t)deleteOldObjectsIfNeededToLimitTotalNumber:(unint64_t)a3 excludingPredicate:(id)a4 limit:(unint64_t)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  if (v8)
  {
    uint64_t v10 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v8];

    uint64_t v9 = (void *)v10;
  }
  v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v12 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358] identifier:self->_clientID];
  unint64_t v13 = +[_DKEvent entityName];
  v18[0] = v11;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  LOWORD(v17) = 0;
  unint64_t v15 = +[_DKCoreDataStorage deleteObjectsIfNeededToLimitTotal:context:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsIfNeededToLimitTotal:context:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", a3, v12, v13, v9, v14, a5, v17);

  return v15;
}

- (unint64_t)deleteAllEventsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__13;
  uint64_t v19 = __Block_byref_object_dispose__13;
  id v20 = 0;
  executionQueue = self->_executionQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62___DKKnowledgeStorage_deleteAllEventsMatchingPredicate_error___block_invoke;
  v11[3] = &unk_1E560F1B8;
  unint64_t v13 = &v21;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  v14 = &v15;
  dispatch_sync(executionQueue, v11);
  if (a4) {
    *a4 = (id) v16[5];
  }
  unint64_t v9 = v22[3];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (id)eventCountPerStreamName
{
  id v2 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358] identifier:self->_clientID];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__13;
  unint64_t v13 = __Block_byref_object_dispose__13;
  id v14 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46___DKKnowledgeStorage_eventCountPerStreamName__block_invoke;
  v6[3] = &unk_1E560EBD8;
  id v3 = v2;
  id v7 = v3;
  id v8 = &v9;
  [v3 performWithOptions:4 andBlock:v6];
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

+ (_DKKnowledgeStorage)storageWithDirectory:(id)a3 readOnly:(BOOL)a4
{
  return (_DKKnowledgeStorage *)[a1 storageWithDirectory:a3 readOnly:a4 localOnly:a4];
}

+ (_DKKnowledgeStorage)storageWithDirectory:(id)a3 readOnly:(BOOL)a4 localOnly:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = -[_DKKnowledgeStorage initWithDirectory:readOnly:localOnly:]((id *)objc_alloc((Class)a1), v8, v6, v5);

  return (_DKKnowledgeStorage *)v9;
}

- (id)initWithDirectory:(uint64_t)a3 readOnly:(int)a4 localOnly:
{
  id v8 = a2;
  if (a1)
  {
    v32.receiver = a1;
    v32.super_class = (Class)_DKKnowledgeStorage;
    a1 = (id *)objc_msgSendSuper2(&v32, sel_init);
    if (a1)
    {
      uint64_t v9 = [[_CDMemoryUsageInterval alloc] initWithName:@"init" client:0];
      [(_CDMemoryUsageInterval *)v9 begin];
      uint64_t v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v11 = [v10 pathForResource:@"_DKDataModel" ofType:@"momd"];

      id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
      if (a3)
      {
        unint64_t v13 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v31[0] = 0;
          _os_log_impl(&dword_18ECEB000, v13, OS_LOG_TYPE_INFO, "readOnly is true, forcing localOnly", (uint8_t *)v31, 2u);
        }
      }
      else if (!a4)
      {
        uint64_t v15 = [[_DKCoreDataStorage alloc] initWithDirectory:v8 databaseName:@"knowledge" modelURL:v12 sync:0];
        char v14 = 0;
        goto LABEL_10;
      }
      char v14 = 1;
      uint64_t v15 = [[_DKCoreDataStorage alloc] initWithDirectory:v8 databaseName:@"knowledge" modelURL:v12 readOnly:a3 localOnly:1];
LABEL_10:
      id v16 = a1[12];
      a1[12] = v15;

      [a1[12] setDelegate:a1];
      [a1[12] setRequiresManualMigration:1];
      *((unsigned char *)a1 + 9) = v14;
      objc_storeStrong(a1 + 5, a2);
      id v17 = a1[6];
      a1[6] = v12;
      id v18 = v12;

      uint64_t v19 = +[_DKTombstonePolicy defaultPolicy];
      id v20 = a1[10];
      a1[10] = (id)v19;

      uint64_t v21 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v22 = a1[7];
      a1[7] = (id)v21;

      uint64_t v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      uint64_t v24 = dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_UTILITY, 0);

      dispatch_queue_t v25 = dispatch_queue_create((const char *)[@"com.apple.coreduet.knowledgestorage.execution" UTF8String], v24);
      id v26 = a1[11];
      a1[11] = v25;

      dispatch_queue_t v27 = dispatch_queue_create("com.apple.coreduet.knowledgestorage.response", v24);
      id v28 = a1[4];
      a1[4] = v27;

      v29 = +[_DKKnowledgeStorageLogging sharedInstance]();

      [a1 addKnowledgeStorageEventNotificationDelegate:v29];
      *((unsigned char *)a1 + 8) = 1;
      [(_CDMemoryUsageInterval *)v9 end];
    }
  }

  return a1;
}

- (void)addKnowledgeStorageEventNotificationDelegate:(id)a3
{
  id v5 = a3;
  id v4 = self->_knowledgeStorageEventNotificationDelegates;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_knowledgeStorageEventNotificationDelegates addObject:v5];
  objc_sync_exit(v4);
}

- (dispatch_queue_t)_deleteAllEventsMatchingPredicate:(void *)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[11]);
    if (_os_feature_enabled_impl()
      && !+[_DKBiomeQuery shimDisabled])
    {
      id v7 = [[_DKBiomeQuery alloc] initWithDeletionPredicate:v5];
      id v8 = v7;
      if (v7)
      {
        id v14 = 0;
        uint64_t v6 = [(_DKBiomeQuery *)v7 executeDeletionQuery:&v14];
        id v9 = v14;
        uint64_t v10 = v9;
        if (a3 && v9) {
          *a3 = v9;
        }
      }
      else
      {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    uint64_t v11 = -[_DKKnowledgeStorage _tombstoneObjectsMatchingPredicate:batchSize:error:](a1, v5, 256, a3);
    id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF IN %@", v11];
    a1 = (dispatch_queue_t *)([(dispatch_queue_t *)a1 deleteEventsMatchingPredicate:v12 limit:0]+ v6);
  }
  return a1;
}

- (unint64_t)deleteEventsMatchingPredicate:(id)a3 limit:(unint64_t)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1E4F29008];
  id v7 = a3;
  id v8 = [v6 sortDescriptorWithKey:@"startDate" ascending:1];
  id v9 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358] identifier:self->_clientID];
  uint64_t v10 = +[_DKEvent entityName];
  v15[0] = v8;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  LOBYTE(v14) = 0;
  unint64_t v12 = +[_DKCoreDataStorage deleteObjectsInContext:v9 entityName:v10 predicate:v7 sortDescriptors:v11 fetchLimit:a4 includeSubentities:0 includePendingChanges:v14];

  return v12;
}

- (dispatch_queue_t)_tombstoneObjectsMatchingPredicate:(uint64_t)a3 batchSize:(void *)a4 error:
{
  v77[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[11]);
    if (v6)
    {
      uint64_t v36 = a3;
      uint64_t v34 = a1;
      uint64_t v70 = 0;
      v71 = &v70;
      uint64_t v72 = 0x3032000000;
      v73 = __Block_byref_object_copy__13;
      v74 = __Block_byref_object_dispose__13;
      id v75 = 0;
      uint64_t v66 = 0;
      v67 = &v66;
      uint64_t v68 = 0x2020000000;
      uint64_t v69 = 0;
      id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
      v77[0] = v7;
      objc_super v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:1];

      id v8 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v9 = [(dispatch_queue_t *)v34 storage];
      id v30 = [v9 managedObjectContextFor:*MEMORY[0x1E4F28358] identifier:v34[9]];

      uint64_t v10 = 0;
      while (1)
      {
        context = (void *)MEMORY[0x192FB2F20]();
        uint64_t v60 = 0;
        v61 = &v60;
        uint64_t v62 = 0x3032000000;
        v63 = __Block_byref_object_copy__13;
        v64 = __Block_byref_object_dispose__13;
        id v65 = 0;
        uint64_t v54 = 0;
        uint64_t v55 = &v54;
        uint64_t v56 = 0x3032000000;
        v57 = __Block_byref_object_copy__13;
        id v58 = __Block_byref_object_dispose__13;
        id v59 = 0;
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __74___DKKnowledgeStorage__tombstoneObjectsMatchingPredicate_batchSize_error___block_invoke;
        v42[3] = &unk_1E560F208;
        id v43 = v6;
        uint64_t v52 = v10;
        uint64_t v53 = v36;
        id v28 = v32;
        id v44 = v28;
        id v45 = v34;
        id v11 = v30;
        id v46 = v11;
        long long v48 = &v70;
        id v33 = v31;
        id v47 = v33;
        long long v49 = &v60;
        long long v50 = &v54;
        long long v51 = &v66;
        v29 = v11;
        [v11 performWithOptions:4 andBlock:v42];
        if ([(id)v61[5] count])
        {
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v12 = (id)v61[5];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v76 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v39;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v39 != v14) {
                  objc_enumerationMutation(v12);
                }
                id v16 = [*(id *)(*((void *)&v38 + 1) + 8 * i) metadata];
                id v17 = +[_DKTombstoneMetadataKey eventStreamName];
                id v18 = [v16 objectForKeyedSubscript:v17];

                if (v18) {
                  [v8 addObject:v18];
                }
              }
              uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v76 count:16];
            }
            while (v13);
          }

          uint64_t v19 = (void *)v61[5];
          id v20 = (id *)(v71 + 5);
          obuint64_t j = (id)v71[5];
          -[_DKKnowledgeStorage _saveObjects:error:]((uint64_t)v34, v19, &obj);
          objc_storeStrong(v20, obj);
        }
        uint64_t v21 = (void *)v55[5];
        if (v21 && [v21 count])
        {
          id v22 = [(id)v55[5] allObjects];
          [v27 addObjectsFromArray:v22];
        }
        _Block_object_dispose(&v54, 8);

        _Block_object_dispose(&v60, 8);
        uint64_t v23 = v71[5];
        if (v67[3] != v36) {
          break;
        }
        v10 += v36;
        if (v23) {
          goto LABEL_23;
        }
      }
      if (v23)
      {
LABEL_23:
        uint64_t v24 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[_DKKnowledgeStorage _tombstoneObjectsMatchingPredicate:batchSize:error:]();
        }
        goto LABEL_27;
      }
      -[_DKKnowledgeStorage _sendTombstoneNotificationsWithStreamNameCounts:]((uint64_t)v34, v8);
      if (![v27 count]) {
        goto LABEL_28;
      }
      uint64_t v24 = [v27 copy];
      +[_DKTombstoneNotifier sendDistributedNotificationsForTombstoneRequirementIdentifiers:v24 queue:v34[11]];
LABEL_27:

LABEL_28:
      if (a4) {
        *a4 = (id) v71[5];
      }
      a1 = (dispatch_queue_t *)[v33 copy];

      _Block_object_dispose(&v66, 8);
      _Block_object_dispose(&v70, 8);
    }
    else
    {
      a1 = (dispatch_queue_t *)MEMORY[0x1E4F1CBF0];
    }
  }

  return a1;
}

- (_DKCoreDataStorage)storage
{
  return self->_storage;
}

- (void)_sendTombstoneNotificationsWithStreamNameCounts:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1 && v3 && [v3 count])
  {
    id v14 = *(id *)(a1 + 56);
    objc_sync_enter(v14);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    obuint64_t j = *(id *)(a1 + 56);
    uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            id v9 = *(void **)(a1 + 32);
            v16[0] = MEMORY[0x1E4F143A8];
            v16[1] = 3221225472;
            void v16[2] = __71___DKKnowledgeStorage__sendTombstoneNotificationsWithStreamNameCounts___block_invoke;
            v16[3] = &unk_1E560DB80;
            v16[4] = v8;
            v16[5] = a1;
            id v17 = v4;
            uint64_t v10 = v16;
            id v11 = v9;
            id v12 = (void *)os_transaction_create();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
            block[3] = &unk_1E560D978;
            id v23 = v12;
            id v24 = v10;
            id v13 = v12;
            dispatch_async(v11, block);
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v25 count:16];
      }
      while (v5);
    }

    objc_sync_exit(v14);
  }
}

- (void)dealloc
{
  id v3 = +[_DKBiomeStreamCache sharedCache];
  [v3 removeAllObjects];

  v4.receiver = self;
  v4.super_class = (Class)_DKKnowledgeStorage;
  [(_DKKnowledgeStorage *)&v4 dealloc];
}

- (_DKTombstonePolicy)tombstonePolicy
{
  return (_DKTombstonePolicy *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_tombstonePolicy, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_knowledgeStorageEventNotificationDelegates, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_defaultResponseQueue, 0);
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_syncStorage, 0);
}

- (void)saveObjects:(id)a3 tracker:(id)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = (void *)os_transaction_create();
  uint64_t v15 = (void *)MEMORY[0x192FB31A0](v13);

  executionQueue = self->_executionQueue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __72___DKKnowledgeStorage_saveObjects_tracker_responseQueue_withCompletion___block_invoke;
  v22[3] = &unk_1E560F190;
  v22[4] = self;
  id v23 = v10;
  id v26 = v15;
  id v27 = v12;
  id v24 = v11;
  id v25 = v14;
  id v17 = v14;
  id v18 = v11;
  id v19 = v12;
  id v20 = v10;
  id v21 = v15;
  dispatch_async(executionQueue, v22);
}

- (dispatch_queue_t)_executeQuery:(void *)a3 error:
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    if (([v5 executeConcurrently] & 1) == 0) {
      dispatch_assert_queue_V2(a1[11]);
    }
    id v7 = +[_DKQuery executableQueryForQuery:v6];
    if (v7)
    {
      v29[0] = 0;
      v29[1] = v29;
      v29[2] = 0x3032000000;
      v29[3] = __Block_byref_object_copy__13;
      v29[4] = __Block_byref_object_dispose__13;
      id v30 = 0;
      uint64_t v23 = 0;
      id v24 = &v23;
      uint64_t v25 = 0x3032000000;
      id v26 = __Block_byref_object_copy__13;
      id v27 = __Block_byref_object_dispose__13;
      id v28 = 0;
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      uint64_t v15 = __43___DKKnowledgeStorage__executeQuery_error___block_invoke;
      id v16 = &unk_1E560F2C8;
      id v8 = v6;
      id v17 = v8;
      id v18 = v7;
      id v19 = a1;
      id v20 = &v23;
      id v21 = v29;
      id v22 = a3;
      id v9 = (void (**)(void))MEMORY[0x192FB31A0](&v13);
      id v10 = objc_msgSend(v8, "tracker", v13, v14, v15, v16);

      if (v10)
      {
        id v11 = [v8 tracker];
        ((void (**)(void, void (**)(void)))v11)[2](v11, v9);
      }
      else
      {
        v9[2](v9);
      }
      a1 = (dispatch_queue_t *)(id)v24[5];

      _Block_object_dispose(&v23, 8);
      _Block_object_dispose(v29, 8);
    }
    else if (a3)
    {
      +[_DKQuery queryNotExecutableError];
      a1 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

- (id)executeQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__13;
  id v31 = __Block_byref_object_dispose__13;
  id v32 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__13;
  uint64_t v25 = __Block_byref_object_dispose__13;
  id v26 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42___DKKnowledgeStorage_executeQuery_error___block_invoke;
  v12[3] = &unk_1E560F2A0;
  uint64_t v14 = &v17;
  uint64_t v15 = &v21;
  v12[4] = self;
  id v7 = v6;
  id v13 = v7;
  id v16 = &v27;
  id v8 = (void (**)(void))MEMORY[0x192FB31A0](v12);
  p_executionQueue = &self->_executionQueue;
  if (dispatch_get_specific(p_executionQueue) == p_executionQueue
    || [v7 executeConcurrently])
  {
    *((unsigned char *)v18 + 24) = 0;
    v8[2](v8);
    if (!a4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((unsigned char *)v18 + 24) = 1;
  dispatch_sync((dispatch_queue_t)*p_executionQueue, v8);
  if (a4) {
LABEL_4:
  }
    *a4 = (id) v28[5];
LABEL_5:
  id v10 = (id)v22[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v10;
}

- (void)setKeyValueObject:(void *)a3 forKey:(void *)a4 domain:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    [MEMORY[0x1E4F28FF0] allowedTopLevelClasses];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      while (2)
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          if (objc_opt_isKindOfClass())
          {

            id v16 = -[_DKKnowledgeStorage executionQueue](a1);
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __73___DKKnowledgeStorage__DKKeyValueStore__setKeyValueObject_forKey_domain___block_invoke;
            v17[3] = &unk_1E560EBB0;
            v17[4] = a1;
            id v18 = v9;
            id v19 = v8;
            id v20 = v7;
            dispatch_sync(v16, v17);

            goto LABEL_14;
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    uint64_t v15 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[_DKKnowledgeStorage setKeyValueObject:forKey:domain:]((uint64_t)v7, (uint64_t)v10, v15);
    }

LABEL_14:
  }
}

- (void)_tombstoneObjects:(void *)a3 error:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[11]);
    id v6 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_614];
    id v7 = [v5 filteredArrayUsingPredicate:v6];
    id v8 = [(dispatch_queue_t *)a1 tombstonePolicy];
    id v33 = 0;
    id v9 = [v8 tombstonesForEvents:v7 resultingFromRequirementsWithIdentifiers:&v33];
    id v27 = v33;

    id v10 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    if (![v9 count]) {
      goto LABEL_17;
    }
    long long v23 = v7;
    long long v24 = v6;
    uint64_t v25 = a3;
    id v26 = v5;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = [*(id *)(*((void *)&v29 + 1) + 8 * i) metadata];
          uint64_t v17 = +[_DKTombstoneMetadataKey eventStreamName];
          id v18 = [v16 objectForKeyedSubscript:v17];

          if (v18) {
            [v10 addObject:v18];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v13);
    }

    id v28 = 0;
    -[_DKKnowledgeStorage _saveObjects:error:]((uint64_t)a1, v11, &v28);
    id v19 = v28;
    a3 = v25;
    id v5 = v26;
    id v7 = v23;
    id v6 = v24;
    if (v19)
    {
      id v20 = v19;
      long long v21 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[_DKKnowledgeStorage _tombstoneObjects:error:](v11, (uint64_t)v20, v21);
      }

      long long v22 = v27;
      if (!v25) {
        goto LABEL_21;
      }
    }
    else
    {
LABEL_17:
      -[_DKKnowledgeStorage _sendTombstoneNotificationsWithStreamNameCounts:]((uint64_t)a1, v10);
      long long v22 = v27;
      if ([v27 count]) {
        +[_DKTombstoneNotifier sendDistributedNotificationsForTombstoneRequirementIdentifiers:v27 queue:a1[11]];
      }
      id v20 = 0;
      if (!a3) {
        goto LABEL_21;
      }
    }
    *a3 = v20;
LABEL_21:
  }
}

- (id)migrationStreamsWithMOC:(uint64_t)a1
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    objc_super v4 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Event"];
    id v5 = [MEMORY[0x1E4F1C0A8] entityForName:@"Event" inManagedObjectContext:v3];
    [v4 setResultType:2];
    id v6 = [v5 propertiesByName];
    id v7 = [v6 objectForKey:@"streamName"];
    v22[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    [v4 setPropertiesToFetch:v8];

    [v4 setReturnsDistinctResults:1];
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    id v19 = __Block_byref_object_copy__13;
    id v20 = __Block_byref_object_dispose__13;
    id v21 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47___DKKnowledgeStorage_migrationStreamsWithMOC___block_invoke;
    v12[3] = &unk_1E560D380;
    uint64_t v15 = &v16;
    id v13 = v3;
    id v9 = v4;
    id v14 = v9;
    [v13 performBlockAndWait:v12];
    id v10 = objc_msgSend((id)v17[5], "_pas_mappedArrayWithTransform:", &__block_literal_global_664);

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)eventCountsForStreams:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        id v11 = NSNumber;
        uint64_t v20 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = v20;
        uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
        id v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", -[_DKKnowledgeStorage totalEventCountForStreams:](self, "totalEventCountForStreams:", v12));
        [v5 setObject:v13 forKeyedSubscript:v10];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)initWithShallowCopyFromStorage:(void *)a3 clientIdentifier:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)_DKKnowledgeStorage;
    a1 = (id *)objc_msgSendSuper2(&v20, sel_init);
    if (a1)
    {
      uint64_t v7 = [v5 storage];
      id v8 = a1[12];
      a1[12] = (id)v7;

      *((unsigned char *)a1 + 9) = 1;
      if (v5)
      {
        objc_storeStrong(a1 + 5, v5[5]);
        id v9 = v5[6];
      }
      else
      {
        id v19 = a1[5];
        a1[5] = 0;

        id v9 = 0;
      }
      objc_storeStrong(a1 + 6, v9);
      uint64_t v10 = [v5 tombstonePolicy];
      id v11 = a1[10];
      a1[10] = (id)v10;

      if (v5) {
        id v12 = v5[4];
      }
      else {
        id v12 = 0;
      }
      objc_storeStrong(a1 + 4, v12);
      id v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_UTILITY, 0);

      dispatch_queue_t v15 = dispatch_queue_create((const char *)[@"com.apple.coreduet.knowledgestorage.execution" UTF8String], v14);
      id v16 = a1[11];
      a1[11] = v15;

      if (v5) {
        id v17 = v5[7];
      }
      else {
        id v17 = 0;
      }
      objc_storeStrong(a1 + 7, v17);
      objc_storeStrong(a1 + 9, a3);
      *((unsigned char *)a1 + 8) = 1;
    }
  }

  return a1;
}

+ (_DKKnowledgeStorage)storageWithShallowCopyFromStorage:(id)a3 clientIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[_DKKnowledgeStorage initWithShallowCopyFromStorage:clientIdentifier:]((id *)objc_alloc((Class)a1), v7, v6);

  return (_DKKnowledgeStorage *)v8;
}

- (id)syncStorageIfAvailable
{
  if (a1)
  {
    id v2 = a1;
    if (a1[12])
    {
      if (*((unsigned char *)a1 + 9)) {
        goto LABEL_4;
      }
      if (+[_DKCloudUtilities isSyncAvailableAndEnabled])
      {
        if (v2[2])
        {
          if (!+[_DKKnowledgeSyncStorageAssertion assertionCount]()) {
            [v2 closeSyncStorage];
          }
        }
        else
        {
          uint64_t v5 = [v2 syncStorage];
          id v6 = v2[2];
          v2[2] = (id)v5;
        }
        a1 = (id *)v2[2];
        goto LABEL_9;
      }
      if (*((unsigned char *)v2 + 9))
      {
LABEL_4:
        id v3 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
          -[_DKKnowledgeStorage syncStorageIfAvailable]();
        }
      }
      else
      {
        id v3 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
          -[_DKKnowledgeStorage syncStorageIfAvailable]();
        }
      }
    }
    else
    {
      id v3 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        -[_DKKnowledgeStorage syncStorageIfAvailable]();
      }
    }

    a1 = 0;
LABEL_9:
    uint64_t v1 = vars8;
  }
  return a1;
}

- (_DKCoreDataStorage)syncStorage
{
  id v3 = self->_syncStorage;
  if (!v3)
  {
    id v3 = [[_DKCoreDataStorage alloc] initWithDirectory:self->_directory databaseName:@"knowledge-sync" modelURL:self->_modelURL sync:1];
    [(_DKCoreDataStorage *)v3 setDelegate:self];
  }
  return v3;
}

- (BOOL)deleteStorage
{
  BOOL v3 = [(_DKCoreDataStorage *)self->_storage deleteStorageFor:*MEMORY[0x1E4F28358]];
  return [(_DKKnowledgeStorage *)self deleteSyncStorage] && v3;
}

- (BOOL)deleteSyncStorage
{
  id v2 = [(_DKKnowledgeStorage *)self syncStorage];
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 deleteStorageFor:*MEMORY[0x1E4F28358]];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)removeKnowledgeStorageEventNotificationDelegate:(id)a3
{
  id v5 = a3;
  char v4 = self->_knowledgeStorageEventNotificationDelegates;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_knowledgeStorageEventNotificationDelegates removeObject:v5];
  objc_sync_exit(v4);
}

- (id)nilArrayError
{
  if (a1)
  {
    a1 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduet.knowledge" code:3 userInfo:MEMORY[0x1E4F1CC08]];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)errorForException:(uint64_t)a1
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    uint64_t v3 = [a2 reason];
    char v4 = (void *)v3;
    id v5 = @"Exception Caught";
    if (v3) {
      id v5 = (__CFString *)v3;
    }
    v10[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v7 = [v2 errorWithDomain:@"com.apple.coreduet.DKKnowledgeStorage" code:0 userInfo:v6];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (uint64_t)executionQueue
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

- (void)saveObjects:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)os_transaction_create();
  executionQueue = self->_executionQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __64___DKKnowledgeStorage_saveObjects_responseQueue_withCompletion___block_invoke;
  v18[3] = &unk_1E560F168;
  v18[4] = self;
  id v19 = v8;
  id v22 = v10;
  id v20 = v9;
  id v21 = v11;
  id v13 = v21;
  id v14 = v18;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
  block[3] = &unk_1E560D978;
  id v24 = v13;
  id v25 = v14;
  id v15 = v9;
  id v16 = v10;
  id v17 = v8;
  dispatch_async(executionQueue, block);
}

- (BOOL)saveObjects:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__13;
  long long v23 = __Block_byref_object_dispose__13;
  id v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  executionQueue = self->_executionQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41___DKKnowledgeStorage_saveObjects_error___block_invoke;
  v11[3] = &unk_1E560F1B8;
  id v13 = &v15;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v14 = &v19;
  dispatch_sync(executionQueue, v11);
  if (a4) {
    *a4 = (id) v20[5];
  }
  char v9 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

- (void)deleteObjects:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)os_transaction_create();
  executionQueue = self->_executionQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __66___DKKnowledgeStorage_deleteObjects_responseQueue_withCompletion___block_invoke;
  v18[3] = &unk_1E560F168;
  v18[4] = self;
  id v19 = v8;
  id v22 = v10;
  id v20 = v9;
  id v21 = v11;
  id v13 = v21;
  id v14 = v18;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
  block[3] = &unk_1E560D978;
  id v24 = v13;
  id v25 = v14;
  id v15 = v9;
  id v16 = v10;
  id v17 = v8;
  dispatch_async(executionQueue, block);
}

- (BOOL)_deleteObjects:(void *)a3 error:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_27;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
  if (!v5)
  {
    if (a3)
    {
      -[_DKKnowledgeStorage nilArrayError]((void *)a1);
      BOOL v27 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    }
LABEL_27:
    BOOL v27 = 0;
    goto LABEL_45;
  }
  long long v40 = a3;
  id v6 = -[_DKKnowledgeStorage removeBadObjects:](a1, v5);
  uint64_t v7 = [v6 count];
  if (v7 != [v5 count])
  {
    id v8 = (void *)[v5 mutableCopy];
    [v8 removeObjectsInArray:v6];
    id v9 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_DKKnowledgeStorage _deleteObjects:error:]();
    }
  }
  if ([v6 count])
  {
    id v10 = [v6 valueForKey:@"UUID"];
    id v11 = (void *)[v10 mutableCopy];

    uint64_t v12 = [*(id *)(a1 + 96) managedObjectContextFor:*MEMORY[0x1E4F28358] identifier:*(void *)(a1 + 72)];
    id v13 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v44 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = [*(id *)(*((void *)&v43 + 1) + 8 * i) UUIDString];
          [v13 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v16);
    }

    long long v39 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v13];
    id v20 = [[_CDMemoryUsageInterval alloc] initWithName:@"deleteObjects" client:0];
    [(_CDMemoryUsageInterval *)v20 begin];
    id v21 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = [v5 count];
      *(_DWORD *)buf = 134217984;
      v48[0] = v22;
      _os_log_impl(&dword_18ECEB000, v21, OS_LOG_TYPE_INFO, "[Storage] Starting deleteObjects with %lu objects.", buf, 0xCu);
    }

    if (_os_feature_enabled_impl())
    {
      long long v23 = [[_DKBiomeQuery alloc] initWithDeletionArray:v6];
      id v24 = v23;
      if (v23)
      {
        id v42 = 0;
        unint64_t v38 = [(_DKBiomeQuery *)v23 executeDeletionQuery:&v42];
        id v25 = v42;
        id v26 = v25;
        if (v40 && v25) {
          *long long v40 = v25;
        }
      }
      else
      {
        unint64_t v38 = 0;
      }
    }
    else
    {
      unint64_t v38 = 0;
    }
    id v28 = (void *)MEMORY[0x192FB2F20]();
    long long v29 = +[_DKObject entityName];
    LOBYTE(v36) = 1;
    id v37 = (void *)v12;
    unint64_t v30 = +[_DKCoreDataStorage deleteObjectsInContext:v12 entityName:v29 predicate:v39 sortDescriptors:0 fetchLimit:0x7FFFFFFFFFFFFFFFLL includeSubentities:1 includePendingChanges:v36];

    BOOL v27 = v30 >= [v14 count];
    if (v30 > [v14 count])
    {
      long long v31 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        -[_DKKnowledgeStorage _deleteObjects:error:](v14);
      }
    }
    long long v32 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      BOOL v33 = v30 >= [v14 count];
      *(_DWORD *)buf = 67109376;
      LODWORD(v48[0]) = v33;
      WORD2(v48[0]) = 2048;
      *(void *)((char *)v48 + 6) = v30;
      _os_log_impl(&dword_18ECEB000, v32, OS_LOG_TYPE_INFO, "[Storage] Completed deleteObjects with success=%d. Deleted: %lu.", buf, 0x12u);
    }

    if (v30 + v38)
    {
      id v41 = 0;
      -[_DKKnowledgeStorage _tombstoneObjects:error:]((dispatch_queue_t *)a1, v6, &v41);
      id v34 = v41;
      -[_DKKnowledgeStorage _sendEventsNotificationName:withObjects:](a1, @"_DKKnowledgeStorageDidDeleteEventsNotification", v6);
    }
    else
    {
      id v34 = 0;
    }
    [(_CDMemoryUsageInterval *)v20 end];
    if (v40) {
      *long long v40 = v34;
    }
    if (_os_feature_enabled_impl()) {
      BOOL v27 = v38 >= [v14 count];
    }
  }
  else
  {
    BOOL v27 = 1;
  }

LABEL_45:
  return v27;
}

- (BOOL)deleteObjects:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__13;
  long long v23 = __Block_byref_object_dispose__13;
  id v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  executionQueue = self->_executionQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43___DKKnowledgeStorage_deleteObjects_error___block_invoke;
  v11[3] = &unk_1E560F1B8;
  id v13 = &v15;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v14 = &v19;
  dispatch_sync(executionQueue, v11);
  if (a4) {
    *a4 = (id) v20[5];
  }
  char v9 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

- (void)deleteAllEventsInEventStream:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v11 = [a3 name];
  id v10 = +[_DKQuery predicateForEventsWithStreamName:v11];
  [(_DKKnowledgeStorage *)self deleteAllEventsMatchingPredicate:v10 responseQueue:v9 withCompletion:v8];
}

- (unint64_t)deleteAllEventsInEventStream:(id)a3 error:(id *)a4
{
  id v6 = [a3 name];
  uint64_t v7 = +[_DKQuery predicateForEventsWithStreamName:v6];
  unint64_t v8 = [(_DKKnowledgeStorage *)self deleteAllEventsMatchingPredicate:v7 error:a4];

  return v8;
}

- (void)deleteAllEventsMatchingPredicate:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)os_transaction_create();
  executionQueue = self->_executionQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __85___DKKnowledgeStorage_deleteAllEventsMatchingPredicate_responseQueue_withCompletion___block_invoke;
  v18[3] = &unk_1E560F168;
  v18[4] = self;
  id v19 = v8;
  id v22 = v10;
  id v20 = v9;
  id v21 = v11;
  id v13 = v21;
  id v14 = v18;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
  block[3] = &unk_1E560D978;
  id v24 = v13;
  id v25 = v14;
  id v15 = v9;
  id v16 = v10;
  id v17 = v8;
  dispatch_async(executionQueue, block);
}

- (void)executeQuery:(id)a3 responseQueue:(id)a4
{
}

- (void)executeQuery:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)os_transaction_create();
  executionQueue = self->_executionQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __65___DKKnowledgeStorage_executeQuery_responseQueue_withCompletion___block_invoke;
  v18[3] = &unk_1E560F168;
  v18[4] = self;
  id v19 = v8;
  id v22 = v10;
  id v20 = v9;
  id v21 = v11;
  id v13 = v21;
  id v14 = v18;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
  block[3] = &unk_1E560D978;
  id v24 = v13;
  id v25 = v14;
  id v15 = v9;
  id v16 = v10;
  id v17 = v8;
  dispatch_async(executionQueue, block);
}

- (unint64_t)deleteObjectsOlderThanDate:(id)a3 excludingPredicate:(id)a4 limit:(unint64_t)a5
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"creationDate < %@", a3];
  if (v8)
  {
    id v10 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v8];

    id v11 = (void *)MEMORY[0x1E4F28BA0];
    v22[0] = v9;
    v22[1] = v10;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    uint64_t v13 = [v11 andPredicateWithSubpredicates:v12];

    id v9 = (void *)v13;
  }
  else
  {
    id v10 = 0;
  }
  id v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  id v15 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358] identifier:self->_clientID];
  id v16 = +[_DKEvent entityName];
  id v21 = v14;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  LOBYTE(v20) = 0;
  unint64_t v18 = +[_DKCoreDataStorage deleteObjectsInContext:v15 entityName:v16 predicate:v9 sortDescriptors:v17 fetchLimit:a5 includeSubentities:0 includePendingChanges:v20];

  return v18;
}

- (unint64_t)deleteOrphanedEntities
{
  id v2 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358] identifier:self->_clientID];
  unint64_t v3 = +[_DKCoreDataStorage deleteOrphanedEntitiesInContext:v2];

  return v3;
}

- (unint64_t)eventCount
{
  id v2 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358] identifier:self->_clientID];
  unint64_t v3 = +[_DKEvent entityName];
  char v4 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  unint64_t v5 = +[_DKCoreDataStorage countObjectsInContext:v2 entityName:v3 predicate:v4 includeSubentities:0 includePendingChanges:0];

  return v5;
}

- (unint64_t)totalEventCountForStreams:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", *(void *)(*((void *)&v18 + 1) + 8 * v10), (void)v18);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  id v12 = [v5 allObjects];
  uint64_t v13 = +[_DKEventQuery eventQueryWithPredicate:0 eventStreams:v12 offset:0 limit:0 sortDescriptors:0];

  [v13 setResultType:1];
  id v14 = [(_DKKnowledgeStorage *)self executeQuery:v13 error:0];
  id v15 = [v14 firstObject];

  unint64_t v16 = [v15 unsignedIntegerValue];
  return v16;
}

- (unint64_t)deleteObjectsInEventStreams:(id)a3 olderThanDate:(id)a4 limit:(unint64_t)a5
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8 && ([v8 isEqual:MEMORY[0x1E4F1CBF0]] & 1) == 0)
  {
    id v11 = +[_DKQuery predicateForEventsWithStreamNames:v8];
    id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"creationDate < %@ OR startDate < %@", v9, v9];
    uint64_t v13 = (void *)MEMORY[0x1E4F28BA0];
    id v26 = v11;
    v34[0] = v11;
    v34[1] = v12;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    id v15 = [v13 andPredicateWithSubpredicates:v14];

    unint64_t v16 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v25 = [v11 predicateFormat];
      id v22 = [v12 predicateFormat];
      [v15 predicateFormat];
      *(_DWORD *)buf = 138412802;
      long long v29 = v25;
      __int16 v30 = 2112;
      long long v31 = v22;
      v33 = __int16 v32 = 2112;
      uint64_t v23 = (void *)v33;
      _os_log_debug_impl(&dword_18ECEB000, v16, OS_LOG_TYPE_DEBUG, "deleteObjectsInEventStreams:olderThanDate:\n namePredicate = %@\n agePredicate = %@\n andPred = %@\n", buf, 0x20u);
    }
    id v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    long long v18 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358] identifier:self->_clientID];
    long long v19 = +[_DKEvent entityName];
    BOOL v27 = v17;
    long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    LOBYTE(v24) = 0;
    unint64_t v10 = +[_DKCoreDataStorage deleteObjectsInContext:v18 entityName:v19 predicate:v15 sortDescriptors:v20 fetchLimit:a5 includeSubentities:0 includePendingChanges:v24];
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (unint64_t)deleteObjectsInEventStream:(id)a3 ifNeededToLimitEventCount:(unint64_t)a4 batchLimit:(unint64_t)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = +[_DKQuery predicateForEventsWithStreamName:a3];
  id v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  unint64_t v10 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358] identifier:self->_clientID];
  id v11 = +[_DKEvent entityName];
  v16[0] = v9;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  LOWORD(v15) = 0;
  unint64_t v13 = +[_DKCoreDataStorage deleteObjectsIfNeededToLimitTotal:context:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsIfNeededToLimitTotal:context:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", a4, v10, v11, v8, v12, a5, v15);

  return v13;
}

- (void)closeStorage
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Closing knowledge storage connection", v2, v3, v4, v5, v6);
}

- (void)closeSyncStorage
{
  syncStorage = self->_syncStorage;
  if (syncStorage) {
    [(_DKCoreDataStorage *)syncStorage closeStorageForProtectionClass:*MEMORY[0x1E4F28358]];
  }
}

- (BOOL)migrateEventBatchToBiomeStream:(void *)a3 fetchRequest:(void *)a4 managedObjectContex:(void *)a5 converter:(void *)a6 eventCount:(void *)a7 offset:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  long long v31 = v14;
  __int16 v32 = v15;
  if (a1)
  {
    uint64_t v49 = 0;
    uint64_t v50 = &v49;
    uint64_t v51 = 0x3032000000;
    uint64_t v52 = __Block_byref_object_copy__13;
    uint64_t v53 = __Block_byref_object_dispose__13;
    id v54 = 0;
    uint64_t v43 = 0;
    long long v44 = &v43;
    uint64_t v45 = 0x3032000000;
    long long v46 = __Block_byref_object_copy__13;
    id v47 = __Block_byref_object_dispose__13;
    id v48 = 0;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __115___DKKnowledgeStorage_migrateEventBatchToBiomeStream_fetchRequest_managedObjectContex_converter_eventCount_offset___block_invoke;
    v37[3] = &unk_1E560F1E0;
    id v38 = v15;
    id v17 = v14;
    id v39 = v17;
    id v41 = &v49;
    id v42 = &v43;
    id v40 = v16;
    [v38 performBlockAndWait:v37];
    *a6 = [(id)v44[5] count];
    *a7 += [v17 fetchLimit];
    uint64_t v18 = v50[5];
    BOOL v30 = v18 == 0;
    if (v18)
    {
      long long v19 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        long long v20 = [v13 identifier];
        -[_DKKnowledgeStorage migrateEventBatchToBiomeStream:fetchRequest:managedObjectContex:converter:eventCount:offset:](v20, (uint64_t)v56, v19);
      }
    }
    else
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v19 = (id)v44[5];
      uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v55 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v34;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v34 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void **)(*((void *)&v33 + 1) + 8 * v23);
            id v25 = (void *)MEMORY[0x192FB2F20]();
            id v26 = [getBMDKEventClass() eventWithDKEvent:v24];
            BOOL v27 = [v24 creationDate];
            id v28 = [v13 source];
            [v27 timeIntervalSinceReferenceDate];
            objc_msgSend(v28, "sendEvent:timestamp:", v26);

            ++v23;
          }
          while (v21 != v23);
          uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v55 count:16];
        }
        while (v21);
      }
    }

    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v49, 8);
  }
  else
  {
    BOOL v30 = 0;
  }

  return v30;
}

- (BOOL)verifyBiomeMigration:(uint64_t)a3 expectedEventCount:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint8_t v6 = v5;
  if (a1)
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    uint64_t v7 = [v5 publisherFromStartTime:0.0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __63___DKKnowledgeStorage_verifyBiomeMigration_expectedEventCount___block_invoke_2;
    v15[3] = &unk_1E560F310;
    v15[4] = &v16;
    id v8 = (id)[v7 sinkWithCompletion:&__block_literal_global_667 receiveInput:v15];

    uint64_t v9 = v17[3];
    a1 = v9 == a3;
    if (v9 != a3)
    {
      unint64_t v10 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v12 = [v6 identifier];
        uint64_t v13 = [v12 UTF8String];
        uint64_t v14 = v17[3];
        *(_DWORD *)buf = 136446722;
        uint64_t v21 = v13;
        __int16 v22 = 2048;
        uint64_t v23 = v14;
        __int16 v24 = 2048;
        uint64_t v25 = a3;
        _os_log_error_impl(&dword_18ECEB000, v10, OS_LOG_TYPE_ERROR, "Unexpected mismatch in Biome stream event count encountered during migration of stream %{public}s Biome count: %lu CD count: %lu", buf, 0x20u);
      }
    }
    _Block_object_dispose(&v16, 8);
  }

  return a1;
}

- (BOOL)deleteKnowledgeStream:(void *)a3 context:(uint64_t)a4 expectedEventCount:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (a1)
  {
    id v8 = a3;
    uint64_t v9 = [v7 name];
    unint64_t v10 = +[_DKQuery predicateForEventsWithStreamName:v9];

    id v11 = +[_DKEvent entityName];
    LOBYTE(v16) = 1;
    unint64_t v12 = +[_DKCoreDataStorage deleteObjectsInContext:v8 entityName:v11 predicate:v10 sortDescriptors:0 fetchLimit:0x7FFFFFFFFFFFFFFFLL includeSubentities:0 includePendingChanges:v16];

    a1 = v12 == a4;
    if (v12 != a4)
    {
      uint64_t v13 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [v7 name];
        *(_DWORD *)buf = 136446722;
        uint64_t v18 = [v14 UTF8String];
        __int16 v19 = 2048;
        uint64_t v20 = a4;
        __int16 v21 = 2048;
        unint64_t v22 = v12;
        _os_log_impl(&dword_18ECEB000, v13, OS_LOG_TYPE_DEFAULT, "Unexpected number of events deleted after Biome migration of stream: %{public}s expected: %lu deleted: %lu", buf, 0x20u);
      }
    }
  }
  return a1;
}

- (BOOL)biomeStreamContainsEntries:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    id v5 = [v3 publisherWithStartTime:0 endTime:0 maxEvents:&unk_1EDE1DCD0 reversed:0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50___DKKnowledgeStorage_biomeStreamContainsEntries___block_invoke_2;
    v9[3] = &unk_1E560F310;
    v9[4] = &v10;
    id v6 = (id)[v5 sinkWithCompletion:&__block_literal_global_672 receiveInput:v9];
    BOOL v7 = *((unsigned char *)v11 + 24) != 0;

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (uint64_t)migrateStream:(void *)a3 context:
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v53 = a3;
  if (a1)
  {
    id v6 = [v5 name];
    BOOL v7 = (void *)[objc_alloc((Class)getBMDKEventStreamClass()) initWithDKStreamIdentifier:v6 contentProtection:*MEMORY[0x1E4F28358]];
    if (v7)
    {
      if (-[_DKKnowledgeStorage biomeStreamContainsEntries:](a1, v7))
      {
        id v8 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = [v5 name];
          *(_DWORD *)buf = 138543362;
          uint64_t v61 = (uint64_t)v9;
          _os_log_impl(&dword_18ECEB000, v8, OS_LOG_TYPE_DEFAULT, "Skipping migration of Biome stream since entries already exist, stream %{public}@", buf, 0xCu);
        }
        uint64_t v10 = 1;
      }
      else
      {
        id v11 = +[_CDEventStreams eventStreamPropertiesForEventStream:v5];
        uint64_t v12 = v11;
        double v13 = 2419200.0;
        id v48 = v6;
        if (v11)
        {
          [v11 timeToLive];
          if (v14 > 0.0)
          {
            [v12 timeToLive];
            double v13 = v15;
          }
        }
        id v47 = v12;
        uint64_t v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-v13];
        uint64_t v50 = [MEMORY[0x1E4F1C9C8] distantFuture];
        id v17 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = [v5 name];
          *(_DWORD *)buf = 138543618;
          uint64_t v61 = (uint64_t)v18;
          __int16 v62 = 2114;
          uint64_t v63 = v16;
          _os_log_impl(&dword_18ECEB000, v17, OS_LOG_TYPE_DEFAULT, "Migrating events to Biome from stream %{public}@ since %{public}@", buf, 0x16u);
        }
        uint64_t v49 = v5;
        __int16 v19 = [v5 name];
        id v59 = v19;
        int v20 = 1;
        __int16 v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
        uint64_t v22 = +[_DKQuery predicateForEventsWithStreamNames:v21];

        long long v46 = (void *)v16;
        uint64_t v23 = +[_DKQuery predicateForEventsBetweenStartDate:v16 endDate:v50];
        __int16 v24 = (void *)MEMORY[0x1E4F28BA0];
        long long v44 = (void *)v23;
        uint64_t v45 = (void *)v22;
        v58[0] = v22;
        v58[1] = v23;
        uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
        uint64_t v52 = [v24 andPredicateWithSubpredicates:v25];

        uint64_t v26 = +[_DKQuery creationDateSortDescriptorAscending:1];
        uint64_t v57 = v26;
        uint64_t v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];

        uint64_t v27 = 0;
        uint64_t v55 = 0;
        uint64_t v56 = 0;
        do
        {
          context = (void *)MEMORY[0x192FB2F20]();
          id v28 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
          long long v29 = (void *)MEMORY[0x1E4F1C0A8];
          BOOL v30 = +[_DKEvent entityName];
          long long v31 = [v29 entityForName:v30 inManagedObjectContext:v53];
          [v28 setEntity:v31];

          [v28 setFetchLimit:500];
          [v28 setFetchOffset:v56];
          [v28 setPredicate:v52];
          [v28 setSortDescriptors:v51];
          __int16 v32 = objc_alloc_init(_DKObjectMOConverter);
          [(_DKObjectMOConverter *)v32 setReadMetadata:1];
          [(_DKObjectMOConverter *)v32 setDeduplicateValues:1];
          uint64_t v33 = a1;
          uint64_t v34 = a1;
          long long v35 = v7;
          BOOL v36 = -[_DKKnowledgeStorage migrateEventBatchToBiomeStream:fetchRequest:managedObjectContex:converter:eventCount:offset:](v34, v7, v28, v53, v32, &v55, &v56);
          uint64_t v37 = v55;
          if (!v36)
          {
            id v38 = +[_CDLogging knowledgeChannel];
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              id v40 = [v49 name];
              *(_DWORD *)buf = 138543618;
              uint64_t v61 = (uint64_t)v40;
              __int16 v62 = 2048;
              uint64_t v63 = (uint64_t)v56;
              _os_log_error_impl(&dword_18ECEB000, v38, OS_LOG_TYPE_ERROR, "Error migrating event batch for stream: %{public}@ offset: %lu", buf, 0x16u);
            }
          }
          v27 += v37;
          v20 &= v36;

          BOOL v39 = v37 == 500;
          BOOL v7 = v35;
          a1 = v33;
        }
        while (v39);
        id v41 = +[_CDLogging knowledgeChannel];
        id v5 = v49;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          id v42 = [v49 name];
          *(_DWORD *)buf = 134218242;
          uint64_t v61 = v27;
          __int16 v62 = 2114;
          uint64_t v63 = (uint64_t)v42;
          _os_log_impl(&dword_18ECEB000, v41, OS_LOG_TYPE_DEFAULT, "Migrated %lu events to Biome from stream %{public}@", buf, 0x16u);
        }
        uint64_t v10 = v20 & -[_DKKnowledgeStorage verifyBiomeMigration:expectedEventCount:](v33, v7, v27);
        id v8 = v47;
        id v6 = v48;
        if (*(unsigned char *)(v33 + 8)) {
          uint64_t v10 = v10 & -[_DKKnowledgeStorage deleteKnowledgeStream:context:expectedEventCount:](v33, v49, v53, v27);
        }
      }
    }
    else
    {
      id v8 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[_DKKnowledgeStorage migrateStream:context:](v5, v8);
      }
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)migrateDataToBiomeWithManagedObjectContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = -[_DKKnowledgeStorage migrationStreamsWithMOC:]((uint64_t)self, v4);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      int v9 = 1;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v9 &= -[_DKKnowledgeStorage migrateStream:context:]((uint64_t)self, *(void **)(*((void *)&v12 + 1) + 8 * i), v4);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }
  else
  {
    id v5 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[_DKKnowledgeStorage migrateDataToBiomeWithManagedObjectContext:]();
    }
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)coreDataStorage:(id)a3 shouldCallDelegateBeforeAutoMigrationFromManagedObjectModelHavingVersion:(unint64_t)a4
{
  id v5 = -[_DKKnowledgeStorage versionsRequiringManualSetup]((uint64_t)self);
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a4];
  char v7 = [v5 containsObject:v6];

  return v7;
}

- (BOOL)coreDataStorage:(id)a3 shouldCallDelegateAfterAutoMigrationToManagedObjectModelHavingVersion:(unint64_t)a4
{
  id v5 = -[_DKKnowledgeStorage versionsRequiringManualMigration]((uint64_t)self);
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a4];
  char v7 = [v5 containsObject:v6];

  return v7;
}

- (id)coreDataStorage:(id)a3 needsManagedObjectModelNameForVersion:(unint64_t)a4
{
  id v5 = a3;
  if (a4 == 1)
  {
    uint64_t v6 = @"_DKDataModel";
  }
  else if (a4 == 2)
  {
    uint64_t v6 = @"_DKDataModel 2";
  }
  else
  {
    char v7 = [NSNumber numberWithUnsignedInteger:a4];
    uint64_t v8 = [v7 stringValue];

    uint64_t v6 = [@"_DKDataModelVERSION-NUMBER" stringByReplacingOccurrencesOfString:@"VERSION-NUMBER" withString:v8];
  }
  return v6;
}

- (BOOL)coreDataStorage:(id)a3 willAutoMigrateStoreAtURL:(id)a4 fromManagedObjectModel:(id)a5 havingVersion:(unint64_t)a6 error:(id *)a7
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  if (-[_DKKnowledgeStorage finalMigrationVersion]((uint64_t)self) > a6)
  {
    id v16 = 0;
    BOOL v11 = -[_DKKnowledgeStorage updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:]((uint64_t)self, a6, v10, &v16);
    id v12 = v16;
    if (!a7) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[_DKKnowledgeStorage coreDataStorage:willAutoMigrateStoreAtURL:fromManagedObjectModel:havingVersion:error:](a6, (uint64_t)self);
  }
  long long v13 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v17 = *MEMORY[0x1E4F28568];
  v18[0] = @"Unexpected model version number";
  long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  id v12 = [v13 errorWithDomain:@"com.apple.coreduet.DKKnowledgeStorage" code:1 userInfo:v14];

  BOOL v11 = 0;
  if (a7) {
LABEL_7:
  }
    *a7 = v12;
LABEL_8:

  return v11;
}

- (BOOL)coreDataStorage:(id)a3 didAutoMigratePersistentStore:(id)a4 toManagedObjectModel:(id)a5 havingVersion:(unint64_t)a6 error:(id *)a7
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  if (-[_DKKnowledgeStorage finalMigrationVersion]((uint64_t)self) >= a6)
  {
    id v16 = 0;
    char v14 = -[_DKKnowledgeStorage updateDataAfterAutoMigrationToVersion:inPersistentStore:error:](self, a6, v10, &v16);
    id v13 = v16;
    if (!a7) {
      goto LABEL_8;
    }
LABEL_7:
    *a7 = v13;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[_DKKnowledgeStorage coreDataStorage:didAutoMigratePersistentStore:toManagedObjectModel:havingVersion:error:](a6, (uint64_t)self);
  }
  BOOL v11 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v17 = *MEMORY[0x1E4F28568];
  v18[0] = @"Unexpected model version number";
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  id v13 = [v11 errorWithDomain:@"com.apple.coreduet.DKKnowledgeStorage" code:1 userInfo:v12];

  char v14 = 0;
  if (a7) {
    goto LABEL_7;
  }
LABEL_8:

  return v14;
}

- (void)saveHistogram:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  executionQueue = self->_executionQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66___DKKnowledgeStorage_saveHistogram_responseQueue_withCompletion___block_invoke;
  v19[3] = &unk_1E560F338;
  v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v12 = v19;
  id v13 = executionQueue;
  id v14 = v9;
  id v15 = v10;
  id v16 = v8;
  uint64_t v17 = (void *)os_transaction_create();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
  block[3] = &unk_1E560D978;
  id v24 = v17;
  id v25 = v12;
  id v18 = v17;
  dispatch_async(v13, block);
}

- (unint64_t)deleteHistogram:(id)a3
{
  storage = self->_storage;
  uint64_t v4 = *MEMORY[0x1E4F28358];
  clientID = self->_clientID;
  id v6 = a3;
  char v7 = [(_DKCoreDataStorage *)storage managedObjectContextFor:v4 identifier:clientID];
  id v8 = +[_DKHistogram entityName];
  id v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = [v6 identifier];

  BOOL v11 = [v9 predicateWithFormat:@"identifier == %@", v10];
  LOBYTE(v14) = 1;
  unint64_t v12 = +[_DKCoreDataStorage deleteObjectsInContext:v7 entityName:v8 predicate:v11 sortDescriptors:0 fetchLimit:0x7FFFFFFFFFFFFFFFLL includeSubentities:1 includePendingChanges:v14];

  return v12;
}

- (id)_requestForChangeSinceDate:(uint64_t)a1
{
  if (a1)
  {
    id v2 = a2;
    id v3 = [NSClassFromString(&cfstr_Nspersistenthi.isa) performSelector:sel_fetchHistoryAfterDate_ withObject:v2];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)fetchLocalChangesSinceDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  BOOL v36 = __Block_byref_object_copy__13;
  uint64_t v37 = __Block_byref_object_dispose__13;
  id v38 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  BOOL v30 = __Block_byref_object_copy__13;
  long long v31 = __Block_byref_object_dispose__13;
  id v32 = 0;
  if (fetchLocalChangesSinceDate_error__syncCounterInitialized != -1) {
    dispatch_once(&fetchLocalChangesSinceDate_error__syncCounterInitialized, &__block_literal_global_697);
  }
  char v7 = [MEMORY[0x1E4F1C9C8] date];
  id v8 = -[_DKKnowledgeStorage _requestForChangeSinceDate:]((uint64_t)self, v6);
  id v9 = [(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358] identifier:self->_clientID];
  if (v9)
  {
    id v10 = [[_CDMemoryUsageInterval alloc] initWithName:@"fetchLocalChanges" client:0];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    __int16 v19 = __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_715;
    id v20 = &unk_1E560F360;
    BOOL v11 = v10;
    id v21 = v11;
    id v22 = v9;
    id v23 = v8;
    id v25 = &v27;
    id v24 = v6;
    uint64_t v26 = &v33;
    [v22 performWithOptions:4 andBlock:&v17];
    [(_CDMemoryUsageInterval *)v11 end];
    if (a4) {
      *a4 = (id) v28[5];
    }
    if (!v28[5])
    {
      uint64_t v12 = fetchLocalChangesSinceDate_error__fetchLocalChangesTimerCounter;
      id v13 = [MEMORY[0x1E4F1C9C8] date];
      -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v12, (uint64_t)v7, v13);
    }
    id v14 = (id)v34[5];
  }
  else
  {
    id v15 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[_DKKnowledgeStorage fetchLocalChangesSinceDate:error:]();
    }

    if (a4)
    {
      +[_DKSyncErrors failedToFetchChanges];
      id v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v14 = 0;
    }
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v14;
}

- (id)fetchSyncChangesSinceDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  BOOL v39 = __Block_byref_object_copy__13;
  id v40 = __Block_byref_object_dispose__13;
  id v41 = 0;
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__13;
  uint64_t v34 = __Block_byref_object_dispose__13;
  id v35 = 0;
  if (fetchSyncChangesSinceDate_error__syncCounterInitialized != -1) {
    dispatch_once(&fetchSyncChangesSinceDate_error__syncCounterInitialized, &__block_literal_global_727_0);
  }
  char v7 = [MEMORY[0x1E4F1C9C8] date];
  id v8 = -[_DKKnowledgeStorage _requestForChangeSinceDate:]((uint64_t)self, v6);
  id v9 = -[_DKKnowledgeStorage syncStorageIfAvailable]((id *)&self->super.isa);
  id v10 = v9;
  if (v9)
  {
    BOOL v11 = [v9 managedObjectContextFor:*MEMORY[0x1E4F28358] identifier:self->_clientID];
    if (v11)
    {
      uint64_t v12 = [[_CDMemoryUsageInterval alloc] initWithName:@"fetchSyncChanges" client:0];
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      id v21 = __55___DKKnowledgeStorage_fetchSyncChangesSinceDate_error___block_invoke_740;
      id v22 = &unk_1E560E988;
      id v13 = v12;
      id v23 = v13;
      id v24 = v11;
      id v25 = v8;
      id v28 = &v30;
      id v26 = v6;
      uint64_t v27 = self;
      uint64_t v29 = &v36;
      [v24 performWithOptions:4 andBlock:&v19];
      [(_CDMemoryUsageInterval *)v13 end];
      if (a4) {
        *a4 = (id) v31[5];
      }
      if (!v31[5])
      {
        uint64_t v14 = fetchSyncChangesSinceDate_error__fetchSyncChangesTimerCounter;
        id v15 = [MEMORY[0x1E4F1C9C8] date];
        -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v14, (uint64_t)v7, v15);
      }
      id v16 = (id)v37[5];
    }
    else
    {
      uint64_t v17 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[_DKKnowledgeStorage fetchLocalChangesSinceDate:error:]();
      }

      if (a4)
      {
        +[_DKSyncErrors unavailableForCurrentUser];
        id v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v16 = 0;
      }
    }
  }
  else if (a4)
  {
    +[_DKSyncErrors unavailableForCurrentUser];
    id v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v16 = 0;
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v16;
}

- (BOOL)saveChangeSetsForSync:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__13;
  uint64_t v18 = __Block_byref_object_dispose__13;
  id v19 = 0;
  executionQueue = self->_executionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51___DKKnowledgeStorage_saveChangeSetsForSync_error___block_invoke;
  block[3] = &unk_1E560E960;
  void block[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v13 = &v14;
  dispatch_sync(executionQueue, block);
  if (a4) {
    *a4 = (id) v15[5];
  }
  BOOL v9 = v15[5] == 0;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (unint64_t)lastSequenceNumberForChangeSetWithEntityName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  long long v31 = __Block_byref_object_copy__13;
  uint64_t v32 = __Block_byref_object_dispose__13;
  id v33 = 0;
  char v7 = +[_DKChangeSet additionChangeSetEntityName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = +[_DKChangeSetMO fetchAdditionChangeSetRequest]();
  }
  else
  {
    id v10 = +[_DKChangeSet deletionChangeSetEntityName];
    int v11 = [v6 isEqualToString:v10];

    if (!v11)
    {
      uint64_t v20 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[_DKKnowledgeStorage lastSequenceNumberForChangeSetWithEntityName:error:]();
      }

      goto LABEL_10;
    }
    uint64_t v9 = +[_DKChangeSetMO fetchDeletionChangeSetRequest]();
  }
  id v12 = (void *)v9;
  if (v9)
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"sequenceNumber" ascending:0];
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v13, 0);
    [v12 setSortDescriptors:v14];
    id v15 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v16 = [(_DKKnowledgeStorage *)self deviceUUID];
    uint64_t v17 = [v15 predicateWithFormat:@"deviceIdentifier == %@", v16];
    [v12 setPredicate:v17];

    [v12 setFetchLimit:1];
    executionQueue = self->_executionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74___DKKnowledgeStorage_lastSequenceNumberForChangeSetWithEntityName_error___block_invoke;
    block[3] = &unk_1E560F3B0;
    void block[4] = self;
    id v19 = v12;
    id v25 = v19;
    id v26 = &v34;
    uint64_t v27 = &v28;
    dispatch_sync(executionQueue, block);

    goto LABEL_11;
  }
LABEL_10:
  uint64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduet.knowledge" code:3 userInfo:MEMORY[0x1E4F1CC08]];
  id v19 = 0;
  id v13 = (void *)v29[5];
  void v29[5] = v21;
LABEL_11:

  if (a4) {
    *a4 = (id) v29[5];
  }
  unint64_t v22 = v35[3];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v22;
}

- (void)startSyncDownFromCloudWithResponseQueue:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  long long v31 = __Block_byref_object_copy__13;
  uint64_t v32 = __Block_byref_object_dispose__13;
  id v33 = 0;
  int v8 = [[_CDMemoryUsageInterval alloc] initWithName:@"startSyncDown" client:0];
  executionQueue = self->_executionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke;
  block[3] = &unk_1E560F428;
  id v10 = v8;
  id v23 = v10;
  id v24 = self;
  id v11 = v7;
  id v26 = v11;
  id v12 = v6;
  id v25 = v12;
  uint64_t v27 = &v28;
  dispatch_sync(executionQueue, block);
  [(_CDMemoryUsageInterval *)v10 end];
  if (v29[5])
  {
    id v13 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_DKKnowledgeStorage startSyncDownFromCloudWithResponseQueue:withCompletion:]();
    }

    if (v11)
    {
      defaultResponseQueue = (OS_dispatch_queue *)v12;
      if (!v12) {
        defaultResponseQueue = self->_defaultResponseQueue;
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_761;
      v19[3] = &unk_1E560F450;
      id v20 = v11;
      uint64_t v21 = &v28;
      id v15 = v19;
      uint64_t v16 = defaultResponseQueue;
      uint64_t v17 = (void *)os_transaction_create();
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
      void v34[3] = &unk_1E560D978;
      id v35 = v17;
      id v36 = v15;
      id v18 = v17;
      dispatch_async(v16, v34);
    }
  }

  _Block_object_dispose(&v28, 8);
}

- (void)startSyncUpToCloudWithResponseQueue:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  long long v31 = __Block_byref_object_copy__13;
  uint64_t v32 = __Block_byref_object_dispose__13;
  id v33 = 0;
  int v8 = [[_CDMemoryUsageInterval alloc] initWithName:@"startSyncUp" client:0];
  executionQueue = self->_executionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke;
  block[3] = &unk_1E560F428;
  id v10 = v8;
  id v23 = v10;
  id v24 = self;
  id v11 = v7;
  id v26 = v11;
  id v12 = v6;
  id v25 = v12;
  uint64_t v27 = &v28;
  dispatch_sync(executionQueue, block);
  [(_CDMemoryUsageInterval *)v10 end];
  if (v29[5])
  {
    id v13 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_DKKnowledgeStorage startSyncUpToCloudWithResponseQueue:withCompletion:]();
    }

    if (v11)
    {
      defaultResponseQueue = (OS_dispatch_queue *)v12;
      if (!v12) {
        defaultResponseQueue = self->_defaultResponseQueue;
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_768;
      v19[3] = &unk_1E560F450;
      id v20 = v11;
      uint64_t v21 = &v28;
      id v15 = v19;
      uint64_t v16 = defaultResponseQueue;
      uint64_t v17 = (void *)os_transaction_create();
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
      void v34[3] = &unk_1E560D978;
      id v35 = v17;
      id v36 = v15;
      id v18 = v17;
      dispatch_async(v16, v34);
    }
  }

  _Block_object_dispose(&v28, 8);
}

- (id)lastChangeSetWithEntityName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy__13;
  uint64_t v38 = __Block_byref_object_dispose__13;
  id v39 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  long long v31 = __Block_byref_object_copy__13;
  uint64_t v32 = __Block_byref_object_dispose__13;
  id v33 = 0;
  id v7 = +[_DKChangeSet additionChangeSetEntityName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = +[_DKChangeSetMO fetchAdditionChangeSetRequest]();
  }
  else
  {
    id v10 = +[_DKChangeSet deletionChangeSetEntityName];
    int v11 = [v6 isEqualToString:v10];

    if (!v11)
    {
      id v20 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[_DKKnowledgeStorage lastSequenceNumberForChangeSetWithEntityName:error:]();
      }

      goto LABEL_10;
    }
    uint64_t v9 = +[_DKChangeSetMO fetchDeletionChangeSetRequest]();
  }
  id v12 = (void *)v9;
  if (v9)
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"sequenceNumber" ascending:0];
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v13, 0);
    [v12 setSortDescriptors:v14];
    id v15 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v16 = [(_DKKnowledgeStorage *)self deviceUUID];
    uint64_t v17 = [v15 predicateWithFormat:@"deviceIdentifier == %@", v16];
    [v12 setPredicate:v17];

    [v12 setFetchLimit:1];
    executionQueue = self->_executionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57___DKKnowledgeStorage_lastChangeSetWithEntityName_error___block_invoke;
    block[3] = &unk_1E560F3B0;
    void block[4] = self;
    id v19 = v12;
    id v25 = v19;
    id v26 = &v34;
    uint64_t v27 = &v28;
    dispatch_sync(executionQueue, block);

    goto LABEL_11;
  }
LABEL_10:
  uint64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduet.knowledge" code:3 userInfo:MEMORY[0x1E4F1CC08]];
  id v19 = 0;
  id v13 = (void *)v29[5];
  void v29[5] = v21;
LABEL_11:

  if (a4) {
    *a4 = (id) v29[5];
  }
  id v22 = (id)v35[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v22;
}

- (void)_databaseChangedWithNotification:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_databaseChangedWithNotification__syncCounterInitialized != -1) {
    dispatch_once(&_databaseChangedWithNotification__syncCounterInitialized, &__block_literal_global_770);
  }
  id v5 = [v4 object];
  if ([(_DKCoreDataStorage *)self->_storage isManagedObjectContextFor:*MEMORY[0x1E4F28358] equalToManagedObjectContext:v5])
  {
    id v22 = v5;
    id v23 = v4;
    id v6 = objc_opt_new();
    id v7 = objc_opt_new();
    obuint64_t j = self->_knowledgeStorageEventNotificationDelegates;
    objc_sync_enter(obj);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    int v8 = self->_knowledgeStorageEventNotificationDelegates;
    uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v50 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v6 addObject:v12];
          }
          if (objc_opt_respondsToSelector()) {
            [v7 addObject:v12];
          }
        }
        uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v9);
    }

    id v5 = v22;
    id v4 = v23;
    objc_sync_exit(obj);

    uint64_t v43 = 0;
    long long v44 = &v43;
    uint64_t v45 = 0x3032000000;
    long long v46 = __Block_byref_object_copy__13;
    id v47 = __Block_byref_object_dispose__13;
    id v48 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = &v37;
    uint64_t v39 = 0x3032000000;
    id v40 = __Block_byref_object_copy__13;
    id v41 = __Block_byref_object_dispose__13;
    id v42 = 0;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_2;
    v31[3] = &unk_1E560F478;
    id v32 = v23;
    id v13 = v6;
    id v33 = v13;
    id v35 = &v43;
    id v14 = v7;
    id v34 = v14;
    uint64_t v36 = &v37;
    [v22 performWithOptions:4 andBlock:v31];
    uint64_t v15 = [(id)v44[5] count];
    uint64_t v16 = [(id)v38[5] count] + v15;
    if (v16)
    {
      executionQueue = self->_executionQueue;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_781;
      v25[3] = &unk_1E560F4C8;
      v25[4] = self;
      uint64_t v30 = v16;
      id v26 = v13;
      uint64_t v28 = &v43;
      id v27 = v14;
      uint64_t v29 = &v37;
      id v18 = v25;
      id v19 = executionQueue;
      id v20 = (void *)os_transaction_create();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
      block[3] = &unk_1E560D978;
      id v54 = v20;
      id v55 = v18;
      id v21 = v20;
      dispatch_async(v19, block);
    }
    _Block_object_dispose(&v37, 8);

    _Block_object_dispose(&v43, 8);
  }
}

- (void)incrementInsertsAndDeletesObserverCount
{
  executionQueue = self->_executionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62___DKKnowledgeStorage_incrementInsertsAndDeletesObserverCount__block_invoke;
  block[3] = &unk_1E560D578;
  void block[4] = self;
  dispatch_sync(executionQueue, block);
}

- (void)decrementInsertsAndDeletesObserverCount
{
  executionQueue = self->_executionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62___DKKnowledgeStorage_decrementInsertsAndDeletesObserverCount__block_invoke;
  block[3] = &unk_1E560D578;
  void block[4] = self;
  dispatch_sync(executionQueue, block);
}

- (NSUUID)deviceUUID
{
  id v2 = self;
  uint64_t v3 = objc_sync_enter(v2);
  if (!v2->_deviceUUID)
  {
    id v4 = (void *)MEMORY[0x192FB2F20](v3);
    -[_DKKnowledgeStorage configureDeviceUUID](v2);
  }
  objc_sync_exit(v2);

  deviceUUID = v2->_deviceUUID;
  return deviceUUID;
}

- (void)configureDeviceUUID
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Unable to fetch device id", v2, v3, v4, v5, v6);
}

+ (id)sourceDeviceIdentityFromDeviceID:(uint64_t)a1
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v2];

  if (v3)
  {
    v13[0] = 0;
    v13[1] = 0;
    [v3 getUUIDBytes:v13];
    BYTE4(v12) = 0;
    LODWORD(v12) = 0;
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithBytes:length:", v13, 16, v12);
    objc_msgSend(v4, "replaceBytesInRange:withBytes:", 11, 5, &v12);
    id v5 = objc_alloc(MEMORY[0x1E4F29128]);
    id v6 = v4;
    id v7 = objc_msgSend(v5, "initWithUUIDBytes:", objc_msgSend(v6, "bytes"));
    int v8 = [v7 UUIDString];
    uint64_t v9 = (void *)[v8 mutableCopy];

    objc_msgSend(v9, "deleteCharactersInRange:", objc_msgSend(v9, "length") - 10, 10);
    uint64_t v10 = (void *)[v9 copy];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)sourceDeviceIdentityFromObject:(id)a3
{
  uint64_t v3 = [a3 source];
  uint64_t v4 = [v3 syncDeviceID];

  return v4;
}

- (id)sourceDeviceIdentity
{
  id v2 = [(_DKKnowledgeStorage *)self deviceUUID];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 UUIDString];
    id v5 = +[_DKKnowledgeStorage sourceDeviceIdentityFromDeviceID:]((uint64_t)_DKKnowledgeStorage, v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)syncStorageAssertion
{
  id v2 = objc_alloc_init(_DKKnowledgeSyncStorageAssertion);
  return v2;
}

- (void)setTombstonePolicy:(id)a3
{
}

- (BOOL)enableBiomeMigrationDeletion
{
  return self->_enableBiomeMigrationDeletion;
}

- (void)setEnableBiomeMigrationDeletion:(BOOL)a3
{
  self->_enableBiomeMigrationDeletion = a3;
}

- (BOOL)localOnly
{
  return self->_localOnly;
}

- (id)syncPeersWithError:(id *)a3
{
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__15;
  uint64_t v28 = __Block_byref_object_dispose__15;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__15;
  id v22 = __Block_byref_object_dispose__15;
  id v23 = 0;
  id v5 = +[_DKSyncPeerMO fetchRequest];
  id v6 = -[_DKKnowledgeStorage executionQueue]((uint64_t)self);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __55___DKKnowledgeStorage__DKSyncPeer__syncPeersWithError___block_invoke;
  id v13 = &unk_1E560F3B0;
  id v14 = self;
  id v7 = v5;
  id v15 = v7;
  uint64_t v16 = &v24;
  uint64_t v17 = &v18;
  dispatch_sync(v6, &v10);

  if (a3) {
    *a3 = (id) v19[5];
  }
  int v8 = objc_msgSend((id)v25[5], "copy", v10, v11, v12, v13, v14);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v8;
}

- (BOOL)saveSyncPeer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__15;
  uint64_t v18 = __Block_byref_object_dispose__15;
  id v19 = 0;
  id v7 = -[_DKKnowledgeStorage executionQueue]((uint64_t)self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___DKKnowledgeStorage__DKSyncPeer__saveSyncPeer_error___block_invoke;
  block[3] = &unk_1E560E960;
  void block[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v13 = &v14;
  dispatch_sync(v7, block);

  if (a4) {
    *a4 = (id) v15[5];
  }
  BOOL v9 = v15[5] == 0;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)removeSyncPeer:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [v4 uuid];
  id v7 = [v5 predicateWithFormat:@"uuid == %@", v6];

  id v8 = -[_DKKnowledgeStorage executionQueue]((uint64_t)self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51___DKKnowledgeStorage__DKSyncPeer__removeSyncPeer___block_invoke;
  block[3] = &unk_1E560DB80;
  void block[4] = self;
  id v12 = v7;
  id v13 = v4;
  id v9 = v4;
  id v10 = v7;
  dispatch_sync(v8, block);
}

- (id)keyValueStoreForDomain:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = -[_DKKnowledgeStorageSimpleKeyValueStore initWithStorage:domain:]((id *)[_DKKnowledgeStorageSimpleKeyValueStore alloc], self, v4);

    id v6 = [[_DKKeyValueStore alloc] initWithSimpleKeyValueStore:v5];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)keyValueObjectForKey:(void *)a3 domain:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy__22;
    id v21 = __Block_byref_object_dispose__22;
    id v22 = 0;
    id v7 = +[_DKKeyValueMO fetchRequest];
    id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"domain == %@ && key == %@", v6, v5];
    [v7 setPredicate:v8];

    [v7 setFetchLimit:1];
    id v9 = -[_DKKnowledgeStorage executionQueue]((uint64_t)a1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69___DKKnowledgeStorage__DKKeyValueStore__keyValueObjectForKey_domain___block_invoke;
    block[3] = &unk_1E56103A0;
    void block[4] = a1;
    id v13 = v7;
    uint64_t v16 = &v17;
    id v14 = v5;
    id v15 = v6;
    id v10 = v7;
    dispatch_sync(v9, block);

    a1 = (id)v18[5];
    _Block_object_dispose(&v17, 8);
  }
  return a1;
}

- (void)removeKeyValueObjectForKey:(void *)a3 domain:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"domain == %@ && key == %@", v6, v5];
    id v8 = -[_DKKnowledgeStorage executionQueue](a1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75___DKKnowledgeStorage__DKKeyValueStore__removeKeyValueObjectForKey_domain___block_invoke;
    block[3] = &unk_1E560EBB0;
    void block[4] = a1;
    id v11 = v7;
    id v12 = v5;
    id v13 = v6;
    id v9 = v7;
    dispatch_sync(v8, block);
  }
}

- (void)updateToFinalMetadata:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    if (updateToFinalMetadata__onceToken != -1) {
      dispatch_once(&updateToFinalMetadata__onceToken, &__block_literal_global_74);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = (id)updateToFinalMetadata__metadataTranslation;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          id v10 = objc_msgSend(v3, "objectForKeyedSubscript:", v9, (void)v13);

          if (v10)
          {
            id v11 = [v3 objectForKeyedSubscript:v9];
            id v12 = [(id)updateToFinalMetadata__metadataTranslation objectForKeyedSubscript:v9];
            [v3 setObject:v11 forKeyedSubscript:v12];

            [v3 removeObjectForKey:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }

    [v3 removeObjectsForKeys:updateToFinalMetadata__metadataRemoval];
  }
}

- (uint64_t)finalMigrationVersion
{
  if (a1) {
    return 35;
  }
  else {
    return 0;
  }
}

- (id)versionsRequiringManualSetup
{
  if (a1)
  {
    uint64_t v1 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:28];
    uint64_t v2 = 0;
    do
    {
      id v3 = [NSNumber numberWithInt:v2];
      [v1 addObject:v3];

      uint64_t v2 = (v2 + 1);
    }
    while (v2 != 28);
    id v4 = (void *)[v1 copy];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)versionsRequiringManualMigration
{
  if (a1) {
    return &unk_1EDE1E890;
  }
  else {
    return 0;
  }
}

- (BOOL)updateDataBeforeAutoMigrationFromVersion:(void *)a3 inStoreAtURL:(void *)a4 error:
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a1)
  {
    id v8 = -[_DKKnowledgeStorage versionsRequiringManualSetup](a1);
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:a2];
    char v10 = [v8 containsObject:v9];

    if (v10)
    {
      uint64_t v51 = 0;
      long long v52 = &v51;
      uint64_t v53 = 0x3032000000;
      id v54 = __Block_byref_object_copy__25;
      id v55 = __Block_byref_object_dispose__25;
      id v56 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        -[_DKKnowledgeStorage updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:].cold.6();
      }
      id v11 = (id *)(v52 + 5);
      obuint64_t j = (id)v52[5];
      char v12 = [MEMORY[0x1E4F1C188] removePersistentHistoryFromPersistentStoreAtURL:v7 options:0 error:&obj];
      objc_storeStrong(v11, obj);
      if (v52[5]) {
        char v13 = 0;
      }
      else {
        char v13 = v12;
      }
      if (v13)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
          -[_DKKnowledgeStorage updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:].cold.4();
        }
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[_DKKnowledgeStorage updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:].cold.5();
        }
        long long v15 = (void *)v52[5];
        v52[5] = 0;
      }
      id v16 = objc_alloc(MEMORY[0x1E4F1C188]);
      uint64_t v17 = (id *)(v52 + 5);
      id v49 = (id)v52[5];
      uint64_t v18 = [MEMORY[0x1E4F1C180] cachedModelForPersistentStoreWithURL:v7 options:0 error:&v49];
      objc_storeStrong(v17, v49);
      uint64_t v19 = (void *)[v16 initWithManagedObjectModel:v18];

      if (v19 && (uint64_t v20 = (id *)(v52 + 5), !v52[5]))
      {
        uint64_t v22 = *MEMORY[0x1E4F1BF70];
        id v48 = 0;
        id v23 = (id)[v19 addPersistentStoreWithType:v22 configuration:0 URL:v7 options:0 error:&v48];
        objc_storeStrong(v20, v48);
        if (!v52[5])
        {
          uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
          [v24 setPersistentStoreCoordinator:v19];
          [v24 setMergePolicy:*MEMORY[0x1E4F1BE40]];
          [v24 setUndoManager:0];
          uint64_t v43 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Object"];
          id v25 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
          [v25 setName:@"SELF"];
          uint64_t v26 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
          [v25 setExpression:v26];

          [v25 setExpressionResultType:2000];
          v59[0] = v25;
          id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:1];
          [v43 setPropertiesToFetch:v27];

          [v43 setPropertiesToGroupBy:&unk_1EDE1E8A8];
          [v43 setResultType:2];
          id v42 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Object"];
          uint64_t v28 = (void *)MEMORY[0x1E4F1C0E0];
          id v29 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v43];
          uint64_t v30 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v24];
          id v41 = [v28 expressionForFetch:v29 context:v30 countOnly:0];

          long long v31 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT SELF IN %@", v41];
          [v42 setPredicate:v31];

          id v32 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v42];
          [v32 setResultType:2];
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __98___DKKnowledgeStorage_DataMigration__updateDataBeforeAutoMigrationFromVersion_inStoreAtURL_error___block_invoke;
          v44[3] = &unk_1E5610688;
          id v33 = v24;
          id v45 = v33;
          id v34 = v32;
          id v46 = v34;
          id v47 = &v51;
          id v35 = [v33 performBlockWithResult:v44];
          uint64_t v36 = v52[5];
          BOOL v14 = v36 == 0;
          if (v36)
          {
            uint64_t v37 = +[_CDLogging knowledgeChannel];
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              -[_DKKnowledgeStorage updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:]();
            }
          }
          uint64_t v38 = +[_CDLogging knowledgeChannel];
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v39 = [v35 result];
            *(_DWORD *)buf = 138412290;
            id v58 = v39;
            _os_log_impl(&dword_18ECEB000, v38, OS_LOG_TYPE_DEFAULT, "Deleted %@ objects with duplicate UUIDs.", buf, 0xCu);
          }
          if (a4) {
            *a4 = (id) v52[5];
          }

          goto LABEL_36;
        }
        id v21 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[_DKKnowledgeStorage updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:]();
        }
      }
      else
      {
        id v21 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[_DKKnowledgeStorage updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:]();
        }
      }

      BOOL v14 = 0;
      if (a4) {
        *a4 = (id) v52[5];
      }
LABEL_36:

      _Block_object_dispose(&v51, 8);
      goto LABEL_37;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_DKKnowledgeStorage updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:].cold.7(a2);
    }
  }
  BOOL v14 = 0;
LABEL_37:

  return v14;
}

- (uint64_t)updateDataAfterAutoMigrationToVersion:(void *)a3 inPersistentStore:(void *)a4 error:
{
  v46[3] = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  if (!a1)
  {
LABEL_10:
    uint64_t v25 = 0;
    goto LABEL_13;
  }
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a2];
  char v7 = [&unk_1EDE1E890 containsObject:v6];

  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_DKKnowledgeStorage updateDataAfterAutoMigrationToVersion:inPersistentStore:error:](a2);
    }
    goto LABEL_10;
  }
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  id v8 = objc_alloc_init(_DKObjectFromMOCache);
  uint64_t v9 = objc_alloc_init(_DKObject);
  id v32 = [v34 persistentStoreCoordinator];
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
  [v10 setPersistentStoreCoordinator:v32];
  [v10 setMergePolicy:*MEMORY[0x1E4F1BE40]];
  [v10 setUndoManager:0];
  long long v31 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"metadata != NULL"];
  uint64_t v30 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"value != NULL AND valueTypeCode == NULL"];
  uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY objectAttributeValue != NULL"];
  char v12 = (void *)MEMORY[0x1E4F28BA0];
  v46[0] = v31;
  v46[1] = v30;
  id v29 = (void *)v11;
  v46[2] = v11;
  char v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
  BOOL v14 = [v12 orPredicateWithSubpredicates:v13];

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __100___DKKnowledgeStorage_DataMigration__updateDataAfterAutoMigrationToVersion_inPersistentStore_error___block_invoke;
  v35[3] = &unk_1E56106B0;
  uint64_t v39 = &v40;
  long long v15 = v9;
  uint64_t v36 = v15;
  uint64_t v28 = v8;
  uint64_t v37 = v28;
  uint64_t v38 = a1;
  id v16 = (void *)MEMORY[0x192FB31A0](v35);
  LOBYTE(v27) = 1;
  unint64_t v17 = +[_DKCoreDataStorage updateObjectsInContext:v10 entityName:@"Object" predicate:v14 sortDescriptors:0 batchFetchLimit:1024 totalFetchLimit:0 includeSubentities:v27 updateBlock:v16];
  unint64_t v18 = v17;
  if (a4)
  {
    uint64_t v19 = v41[3];
    if (v17 != v19)
    {
      uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v44 = *MEMORY[0x1E4F28568];
      id v21 = objc_msgSend(NSString, "stringWithFormat:", @"Only able to convert %lu/%lu objects during v%lu migration.", v17, v19, a2);
      id v45 = v21;
      uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      id v23 = [v20 errorWithDomain:@"com.apple.coreduet.DKKnowledgeStorage" code:1 userInfo:v22];

      id v24 = v23;
      *a4 = v24;
    }
  }
  if (a2 == 34) {
    uint64_t v25 = [a1 migrateDataToBiomeWithManagedObjectContext:v10];
  }
  else {
    uint64_t v25 = v18 == v41[3];
  }

  _Block_object_dispose(&v40, 8);
LABEL_13:

  return v25;
}

- (BOOL)copyValueToManagedObject:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      uint64_t v5 = [v4 valueForKey:@"value"];
      if (v5)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v4 setValueClass:1];
          id v6 = v5;
          char v7 = [v6 string];
          [v4 setValueString:v7];

          uint64_t v8 = [v6 identifierType];
          uint64_t v9 = v4;
          uint64_t v10 = v8;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v4 setValueClass:2];
            uint64_t v11 = [v5 categoryType];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              [v4 setValueClass:0];
              goto LABEL_12;
            }
            [v4 setValueClass:3];
            uint64_t v11 = [v5 quantityType];
          }
          uint64_t v10 = v11;
          uint64_t v9 = v4;
        }
        [v9 setValueTypeCode:v10];
      }
LABEL_12:
    }
  }

  return a1 != 0;
}

- (void)syncStorageIfAvailable
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Unable to sync, local only store", v2, v3, v4, v5, v6);
}

- (void)_saveObjects:error:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8(&dword_18ECEB000, v0, v1, "%s: found foreign objects: %@", v2, v3, v4, v5, 2u);
}

- (void)_deleteObjects:(void *)a1 error:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "Duplicate objects detected during deletion: %lu deleted vs. %lu requested.", v3, v4, v5, v6, 0);
}

- (void)_deleteObjects:error:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8(&dword_18ECEB000, v0, v1, "%s: found foreign objects: %@", v2, v3, v4, v5, 2u);
}

- (void)_tombstoneObjects:(NSObject *)a3 error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_1();
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_ERROR, "Error saving %lu tombstones: %@", v5, 0x16u);
}

- (void)_tombstoneObjectsMatchingPredicate:batchSize:error:.cold.1()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Error saving tombstones matching predicate: %@", v2, v3, v4, v5, 2u);
}

- (void)migrateEventBatchToBiomeStream:(NSObject *)a3 fetchRequest:managedObjectContex:converter:eventCount:offset:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5_6(&dword_18ECEB000, a3, (uint64_t)a3, "Query error encountered while attempting to migrate stream %{public}@ to Biome", (uint8_t *)a2);
}

- (void)migrateStream:(void *)a1 context:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 name];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_6(&dword_18ECEB000, a2, v4, "Unexpected nil Biome stream encountered during migration of stream %{public}@", v5);
}

- (void)migrateDataToBiomeWithManagedObjectContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Encountered nil managed object context while attempting to update to Biome storage", v2, v3, v4, v5, v6);
}

- (void)coreDataStorage:(uint64_t)a1 willAutoMigrateStoreAtURL:(uint64_t)a2 fromManagedObjectModel:havingVersion:error:.cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a1];
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:-[_DKKnowledgeStorage finalMigrationVersion](a2)];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8(&dword_18ECEB000, MEMORY[0x1E4F14500], v5, "Unexpected model version number: %@ >= %@", v6, v7, v8, v9, 2u);
}

- (void)coreDataStorage:(uint64_t)a1 didAutoMigratePersistentStore:(uint64_t)a2 toManagedObjectModel:havingVersion:error:.cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a1];
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:-[_DKKnowledgeStorage finalMigrationVersion](a2)];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8(&dword_18ECEB000, MEMORY[0x1E4F14500], v5, "Unexpected model version number: %@ is not %@", v6, v7, v8, v9, 2u);
}

- (void)fetchLocalChangesSinceDate:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Missing context", v2, v3, v4, v5, v6);
}

- (void)lastSequenceNumberForChangeSetWithEntityName:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Illegal change set entity name: %@", v2, v3, v4, v5, v6);
}

- (void)startSyncDownFromCloudWithResponseQueue:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Failed to sync down from the cloud: %@", v2, v3, v4, v5, 2u);
}

- (void)startSyncUpToCloudWithResponseQueue:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Failed to sync up to the cloud: %@", v2, v3, v4, v5, 2u);
}

- (void)setKeyValueObject:(uint64_t)a1 forKey:(uint64_t)a2 domain:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 138412546;
  uint64_t v6 = objc_opt_class();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_fault_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_FAULT, "Attempt to set value of class %@ in key-value store is unsupported. Supported classes: %@", (uint8_t *)&v5, 0x16u);
}

- (void)updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:.cold.1()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Failed to create persistent store coordinator: %@", v2, v3, v4, v5, v6);
}

- (void)updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:.cold.2()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Failed to delete duplicate events: %@", v2, v3, v4, v5, v6);
}

- (void)updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:.cold.4()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Finished removing persistent history from store.", v0, 2u);
}

- (void)updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:.cold.5()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, MEMORY[0x1E4F14500], v0, "Failed to remove persistent history from store: %@", v1, v2, v3, v4, v5);
}

- (void)updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:.cold.6()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Attempting to remove persistent history from store: %@", v0, 0xCu);
}

- (void)updateDataBeforeAutoMigrationFromVersion:(uint64_t)a1 inStoreAtURL:error:.cold.7(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, MEMORY[0x1E4F14500], v2, "Pre-migration update called at unexpected version: %@", v3, v4, v5, v6, v7);
}

- (void)updateDataAfterAutoMigrationToVersion:(uint64_t)a1 inPersistentStore:error:.cold.1(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, MEMORY[0x1E4F14500], v2, "Migration called at unexpected version: %@", v3, v4, v5, v6, v7);
}

@end