@interface PFCloudKitImportRecordsWorkItem
- (BOOL)applyAccumulatedChangesToStore:(id)a3 inManagedObjectContext:(id)a4 withStoreMonitor:(id)a5 madeChanges:(BOOL *)a6 error:(id *)a7;
- (BOOL)checkForActiveImportOperationInStore:(void *)a3 inManagedObjectContext:(uint64_t *)a4 error:;
- (BOOL)commitMetadataChangesWithContext:(id)a3 forStore:(id)a4 error:(id *)a5;
- (BOOL)updateMetadataForAccumulatedChangesInContext:(id)a3 inStore:(id)a4 error:(id *)a5;
- (NSString)description;
- (PFCloudKitImportRecordsWorkItem)initWithOptions:(id)a3 request:(id)a4;
- (id)cloudKitSerializer:(id)a3 safeSaveURLForAsset:(id)a4;
- (id)createMirroringResultForRequest:(id)a3 storeIdentifier:(id)a4 success:(BOOL)a5 madeChanges:(BOOL)a6 error:(id)a7;
- (id)entityNameToAttributesToUpdate;
- (id)entityNameToRelationshipsToUpdate;
- (void)addDeletedRecordID:(uint64_t)a3 ofType:;
- (void)addUpdatedRecord:(id)a3;
- (void)checkAndApplyChangesIfNeeded:(uint64_t)a1;
- (void)cloudKitSerializer:(id)a3 failedToUpdateRelationship:(id)a4 withError:(id)a5;
- (void)dealloc;
- (void)doWorkForStore:(id)a3 inMonitor:(id)a4 completion:(id)a5;
- (void)executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:(id)a3 completion:(id)a4;
- (void)fetchOperationFinishedWithError:(uint64_t)a3 completion:;
- (void)removeDownloadedAssetFiles;
@end

@implementation PFCloudKitImportRecordsWorkItem

- (PFCloudKitImportRecordsWorkItem)initWithOptions:(id)a3 request:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PFCloudKitImportRecordsWorkItem;
  v5 = [(PFCloudKitImporterWorkItem *)&v11 initWithOptions:a3 request:a4];
  if (v5)
  {
    v5->_importOperationIdentifier = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    v5->_assetPathToSafeSaveURL = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5->_updatedRecords = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5->_recordTypeToDeletedRecordID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5->_allRecordIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5->_totalOperationBytes = 0;
    v5->_currentOperationBytes = 0;
    v5->_countUpdatedRecords = 0;
    v5->_countDeletedRecords = 0;
    v5->_encounteredErrors = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5->_failedRelationships = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6 = [PFCloudKitFetchedRecordBytesMetric alloc];
    if (a3) {
      v7 = (void *)*((void *)a3 + 3);
    }
    else {
      v7 = 0;
    }
    v5->_fetchedRecordBytesMetric = -[PFCloudKitSizeMetric initWithContainerIdentifier:](v6, "initWithContainerIdentifier:", [v7 containerIdentifier]);
    v8 = [PFCloudKitFetchedAssetBytesMetric alloc];
    if (a3) {
      v9 = (void *)*((void *)a3 + 3);
    }
    else {
      v9 = 0;
    }
    v5->_fetchedAssetBytesMetric = -[PFCloudKitSizeMetric initWithContainerIdentifier:](v8, "initWithContainerIdentifier:", [v9 containerIdentifier]);
    v5->_incrementalResults = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5->_unknownItemRecordIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5->_updatedShares = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v5;
}

- (void)dealloc
{
  self->_importOperationIdentifier = 0;
  self->_assetPathToSafeSaveURL = 0;

  self->_updatedRecords = 0;
  self->_recordTypeToDeletedRecordID = 0;

  self->_allRecordIDs = 0;
  self->_encounteredErrors = 0;

  self->_failedRelationships = 0;
  self->_fetchedRecordBytesMetric = 0;

  self->_fetchedAssetBytesMetric = 0;
  self->_incrementalResults = 0;

  self->_unknownItemRecordIDs = 0;
  self->_updatedShares = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitImportRecordsWorkItem;
  [(PFCloudKitImporterWorkItem *)&v3 dealloc];
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self) {
    request = self->super._request;
  }
  else {
    request = 0;
  }
  v7 = (void *)[v3 initWithFormat:@"<%@: %p - %@>", v5, self, request];

  return (NSString *)v7;
}

- (void)doWorkForStore:(id)a3 inMonitor:(id)a4 completion:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v8 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator]((uint64_t)a4);
  if (self
    && (request = self->super._request) != 0
    && (([(CKSchedulerActivity *)request->super._schedulerActivity shouldDefer] & 1) != 0
     || request->super._deferredByBackgroundTimeout))
  {
    if (a5)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F28588];
      v15[0] = @"The request was aborted because it was deferred by the system.";
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      id v12 = -[PFCloudKitImportRecordsWorkItem createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:](self, "createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:", self->super._request, [a3 identifier], 0, 0, objc_msgSend(v10, "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134419, v11));
      (*((void (**)(id, id))a5 + 2))(a5, v12);
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__PFCloudKitImportRecordsWorkItem_doWorkForStore_inMonitor_completion___block_invoke;
    v13[3] = &unk_1E544BB28;
    v13[4] = v8;
    v13[5] = self;
    v13[6] = a3;
    [(NSManagedObjectContext *)v8 performBlockAndWait:v13];
    [(PFCloudKitImportRecordsWorkItem *)self executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:v8 completion:a5];
  }
}

void __71__PFCloudKitImportRecordsWorkItem_doWorkForStore_inMonitor_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  v2 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKImportOperation entityPath](), *(void *)(a1 + 32));
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    uint64_t v5 = *(void *)(v4 + 32);
  }
  else {
    uint64_t v5 = 0;
  }
  [(NSManagedObject *)v2 setOperationUUID:v5];
  -[NSManagedObject setImportDate:](v3, "setImportDate:", [MEMORY[0x1E4F1C9C8] date]);
  [*(id *)(a1 + 32) assignObject:v3 toPersistentStore:*(void *)(a1 + 48)];
  if (([*(id *)(a1 + 32) save:&v14] & 1) == 0)
  {
    uint64_t v6 = [NSString stringWithUTF8String:"Failed to save import operation: %@"];
    _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, v14);
    v13 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v14;
      _os_log_fault_impl(&dword_18AB82000, v13, OS_LOG_TYPE_FAULT, "CoreData: Failed to save import operation: %@", buf, 0xCu);
    }
  }
}

- (void)executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:(id)a3 completion:(id)a4
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

void __81__PFCloudKitImportRecordsWorkItem_newMirroringResultByApplyingAccumulatedChanges__block_invoke(uint64_t a1)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3052000000;
  v58 = __Block_byref_object_copy__44;
  v59 = __Block_byref_object_dispose__44;
  uint64_t v60 = 0;
  unsigned __int8 v54 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 1;
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v3 + 32));
      uint64_t v5 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v5 = 0;
      id WeakRetained = 0;
    }
    uint64_t v6 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v5);
    [(NSManagedObjectContext *)v6 setTransactionAuthor:@"NSCloudKitMirroringDelegate.import"];
    int v7 = [*(id *)(a1 + 40) applyAccumulatedChangesToStore:v2 inManagedObjectContext:v6 withStoreMonitor:*(void *)(a1 + 32) madeChanges:&v54 error:v56 + 5];
    *((unsigned char *)v51 + 24) = v7;
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      if (v8 && *(unsigned char *)(v8 + 21))
      {
        uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v63 = *MEMORY[0x1E4F28588];
        uint64_t v10 = *(void *)(a1 + 40);
        if (v10) {
          uint64_t v11 = *(void **)(v10 + 16);
        }
        else {
          uint64_t v11 = 0;
        }
        uint64_t v64 = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(v11, "requestIdentifier")];
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
        uint64_t v13 = [v9 errorWithDomain:*MEMORY[0x1E4F281F8] code:134407 userInfo:v12];
        uint64_t v14 = *(void **)(a1 + 40);
        if (v14) {
          uint64_t v15 = v14[2];
        }
        else {
          uint64_t v15 = 0;
        }
        uint64_t v16 = objc_msgSend(v14, "createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:", v15, objc_msgSend(v2, "identifier"), 0, 0, v13);
      }
      else
      {
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __81__PFCloudKitImportRecordsWorkItem_newMirroringResultByApplyingAccumulatedChanges__block_invoke_2;
        v49[3] = &unk_1E544BA50;
        v49[4] = v2;
        v49[5] = v6;
        v49[6] = *(void *)(a1 + 40);
        v49[7] = &v55;
        v49[8] = &v50;
        uint64_t v28 = [(NSManagedObjectContext *)v6 performBlockAndWait:v49];
        if (*((unsigned char *)v51 + 24))
        {
          v29 = (void *)MEMORY[0x18C127630](v28);
          if ((unint64_t)__ckLoggingOverride >= 3) {
            uint64_t v30 = 3;
          }
          else {
            uint64_t v30 = __ckLoggingOverride;
          }
          uint64_t v31 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Finished importing changes for request: %@"];
          _NSCoreDataLog(v30, v31, v32, v33, v34, v35, v36, v37, (uint64_t)"-[PFCloudKitImportRecordsWorkItem newMirroringResultByApplyingAccumulatedChanges]_block_invoke");
        }
        if (!v54)
        {
          if ([*(id *)(*(void *)(a1 + 40) + 104) count])
          {
            long long v47 = 0u;
            long long v48 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            v41 = *(void **)(*(void *)(a1 + 40) + 104);
            uint64_t v42 = [v41 countByEnumeratingWithState:&v45 objects:v65 count:16];
            if (v42)
            {
              uint64_t v43 = *(void *)v46;
              while (2)
              {
                for (uint64_t i = 0; i != v42; ++i)
                {
                  if (*(void *)v46 != v43) {
                    objc_enumerationMutation(v41);
                  }
                  if ([*(id *)(*((void *)&v45 + 1) + 8 * i) madeChanges])
                  {
                    unsigned __int8 v54 = 1;
                    goto LABEL_26;
                  }
                }
                uint64_t v42 = [v41 countByEnumeratingWithState:&v45 objects:v65 count:16];
                if (v42) {
                  continue;
                }
                break;
              }
            }
          }
        }
LABEL_26:
        v38 = *(void **)(a1 + 40);
        if (v38) {
          uint64_t v39 = v38[2];
        }
        else {
          uint64_t v39 = 0;
        }
        uint64_t v40 = [v2 identifier];
        uint64_t v16 = [v38 createMirroringResultForRequest:v39 storeIdentifier:v40 success:*((unsigned __int8 *)v51 + 24) madeChanges:v54 error:v56[5]];
      }
    }
    else
    {
      id v24 = (id)v56[5];
      v25 = *(void **)(a1 + 40);
      if (v25) {
        uint64_t v26 = v25[2];
      }
      else {
        uint64_t v26 = 0;
      }
      uint64_t v27 = [v2 identifier];
      uint64_t v16 = [v25 createMirroringResultForRequest:v26 storeIdentifier:v27 success:0 madeChanges:0 error:v56[5]];
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v16;
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v61 = *MEMORY[0x1E4F28588];
    uint64_t v18 = *(void *)(a1 + 40);
    if (v18) {
      v19 = *(void **)(v18 + 16);
    }
    else {
      v19 = 0;
    }
    v62[0] = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(v19, "requestIdentifier")];
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:&v61 count:1];
    uint64_t v21 = [v17 errorWithDomain:*MEMORY[0x1E4F281F8] code:134407 userInfo:v20];
    v22 = *(void **)(a1 + 40);
    if (v22) {
      uint64_t v23 = v22[2];
    }
    else {
      uint64_t v23 = 0;
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(v22, "createMirroringResultForRequest:storeIdentifier:success:madeChanges:error:", v23, objc_msgSend(0, "identifier"), 0, 0, v21);
  }

  v56[5] = 0;
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v55, 8);
}

void __81__PFCloudKitImportRecordsWorkItem_newMirroringResultByApplyingAccumulatedChanges__block_invoke_2(uint64_t a1)
{
  v30[5] = *MEMORY[0x1E4F143B8];
  if (!+[_PFRoutines _isInMemoryStore:]((uint64_t)_PFRoutines, *(unsigned __int8 **)(a1 + 32)))
  {
    v30[0] = 0;
    if ((objc_msgSend(*(id *)(a1 + 40), "setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), v30) & 1) == 0)
    {
      v2 = (void *)MEMORY[0x18C127630]();
      uint64_t v3 = __ckLoggingOverride;
      uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Unable to set query generation on moc: %@"];
      _NSCoreDataLog(v3 != 0, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[PFCloudKitImportRecordsWorkItem newMirroringResultByApplyingAccumulatedChanges]_block_invoke_2");
    }
  }
  if (!-[PFCloudKitImportRecordsWorkItem checkForActiveImportOperationInStore:inManagedObjectContext:error:](*(void *)(a1 + 48), *(void *)(a1 + 32), *(void **)(a1 + 40), (uint64_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    uint64_t v11 = (void *)MEMORY[0x18C127630]();
    uint64_t v12 = __ckLoggingOverride;
    uint64_t v13 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to fetch import operation with identifier '%@': %@"];
    _NSCoreDataLog(v12 != 0, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[PFCloudKitImportRecordsWorkItem newMirroringResultByApplyingAccumulatedChanges]_block_invoke_2");
LABEL_10:
    id v20 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    return;
  }
  if (![*(id *)(a1 + 48) commitMetadataChangesWithContext:*(void *)(a1 + 40) forStore:*(void *)(a1 + 32) error:*(void *)(*(void *)(a1 + 56) + 8) + 40])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    goto LABEL_10;
  }
  if ([*(id *)(a1 + 40) save:*(void *)(*(void *)(a1 + 56) + 8) + 40])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  else if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    uint64_t v21 = (void *)MEMORY[0x18C127630](*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    uint64_t v22 = __ckLoggingOverride;
    uint64_t v23 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to save changes from import: %@"];
    _NSCoreDataLog(v22 != 0, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[PFCloudKitImportRecordsWorkItem newMirroringResultByApplyingAccumulatedChanges]_block_invoke_2");
  }
}

- (BOOL)checkForActiveImportOperationInStore:(void *)a3 inManagedObjectContext:(uint64_t *)a4 error:
{
  v26[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v20 = 0;
  unint64_t v6 = (unint64_t)+[NSCKImportOperation fetchOperationWithIdentifier:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKImportOperation, *(void *)(a1 + 32), a2, a3, (uint64_t)&v20);
  uint64_t v7 = v20;
  BOOL v8 = v6 != 0;
  if (v6 | v20)
  {
    if (v6) {
      return v8;
    }
    if (v20) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F281F8];
    uint64_t v25 = *MEMORY[0x1E4F28588];
    v26[0] = [NSString stringWithFormat:@"The request '%@' was cancelled because it conflicted with another active import operation.", *(void *)(a1 + 16)];
    uint64_t v7 = objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 134407, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1));
    uint64_t v20 = v7;
    if (v7)
    {
LABEL_5:
      if (a4) {
        *a4 = v7;
      }
      return v8;
    }
  }
  uint64_t v11 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
  _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportRecordsWorkItem.m");
  uint64_t v18 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportRecordsWorkItem.m";
    __int16 v23 = 1024;
    int v24 = 866;
    _os_log_fault_impl(&dword_18AB82000, v18, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
  }
  return v8;
}

- (BOOL)applyAccumulatedChangesToStore:(id)a3 inManagedObjectContext:(id)a4 withStoreMonitor:(id)a5 madeChanges:(BOOL *)a6 error:(id *)a7
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v49 = 0;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 1;
  uint64_t v45 = 0;
  long long v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3052000000;
  uint64_t v42 = __Block_byref_object_copy__44;
  uint64_t v43 = __Block_byref_object_dispose__44;
  uint64_t v44 = 0;
  if ([(NSMutableArray *)self->_updatedRecords count]
    || [(NSMutableDictionary *)self->_recordTypeToDeletedRecordID count]
    || [(NSMutableArray *)self->_unknownItemRecordIDs count]
    || [(NSMutableDictionary *)self->_updatedShares count])
  {
    if (a5 && *((unsigned char *)a5 + 21))
    {
      *((unsigned char *)v50 + 24) = 0;
      id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v53 = *MEMORY[0x1E4F28588];
      uint64_t v54 = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", -[NSCloudKitMirroringRequest requestIdentifier](self->super._request, "requestIdentifier")];
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      uint64_t v15 = [v13 initWithDomain:*MEMORY[0x1E4F281F8] code:134407 userInfo:v14];
      v40[5] = v15;
    }
    else
    {
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __124__PFCloudKitImportRecordsWorkItem_applyAccumulatedChangesToStore_inManagedObjectContext_withStoreMonitor_madeChanges_error___block_invoke;
      v38[3] = &unk_1E544BBF0;
      v38[4] = a3;
      v38[5] = a4;
      v38[6] = self;
      v38[7] = &v39;
      v38[8] = &v45;
      v38[9] = &v49;
      uint64_t v16 = [a4 performBlockAndWait:v38];
      if (*((unsigned char *)v50 + 24))
      {
        uint64_t v17 = (void *)MEMORY[0x18C127630](v16);
        unint64_t v18 = __ckLoggingOverride;
        uint64_t v19 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Finished importing applying changes for request: %@"];
        if (v18 >= 3) {
          uint64_t v26 = 3;
        }
        else {
          uint64_t v26 = v18;
        }
        _NSCoreDataLog(v26, v19, v20, v21, v22, v23, v24, v25, (uint64_t)"-[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonitor:madeChanges:error:]");
      }
    }
  }
  else
  {
    *((unsigned char *)v50 + 24) = 1;
    *((unsigned char *)v46 + 24) = 0;
  }
  *a6 = *((unsigned char *)v46 + 24);
  if (!*((unsigned char *)v50 + 24))
  {
    id v29 = (id)v40[5];
    if (v29)
    {
      if (a7) {
        *a7 = v29;
      }
    }
    else
    {
      uint64_t v30 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportRecordsWorkItem.m");
      uint64_t v37 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v56 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportRecordsWorkItem.m";
        __int16 v57 = 1024;
        int v58 = 536;
        _os_log_fault_impl(&dword_18AB82000, v37, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v40[5] = 0;
  char v27 = *((unsigned char *)v50 + 24);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  return v27;
}

void __124__PFCloudKitImportRecordsWorkItem_applyAccumulatedChangesToStore_inManagedObjectContext_withStoreMonitor_madeChanges_error___block_invoke(uint64_t a1)
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  if (!+[_PFRoutines _isInMemoryStore:]((uint64_t)_PFRoutines, *(unsigned __int8 **)(a1 + 32)))
  {
    *(void *)buf = 0;
    if ((objc_msgSend(*(id *)(a1 + 40), "setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), buf) & 1) == 0)
    {
      v2 = (void *)MEMORY[0x18C127630]();
      uint64_t v3 = __ckLoggingOverride;
      uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Unable to set query generation on managedObjectContext: %@"];
      _NSCoreDataLog(v3 != 0, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonitor:madeChanges:error:]_block_invoke");
    }
  }
  if (!-[PFCloudKitImportRecordsWorkItem checkForActiveImportOperationInStore:inManagedObjectContext:error:](*(void *)(a1 + 48), *(void *)(a1 + 32), *(void **)(a1 + 40), (uint64_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    v131 = 0;
    v133 = 0;
    id v63 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    goto LABEL_49;
  }
  v133 = objc_alloc_init(PFCloudKitMetadataCache);
  uint64_t v11 = [PFCloudKitSerializer alloc];
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12 && (uint64_t v13 = *(void *)(v12 + 8)) != 0) {
    uint64_t v14 = *(void *)(v13 + 24);
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = [(PFCloudKitSerializer *)v11 initWithMirroringOptions:v14 metadataCache:v133 recordNamePrefix:0];
  v131 = (void *)v15;
  if (v15) {
    objc_storeWeak((id *)(v15 + 32), *(id *)(a1 + 48));
  }
  uint64_t v16 = *(void *)(a1 + 48);
  uint64_t v17 = *(void *)(v16 + 80);
  uint64_t v18 = *(void *)(v16 + 8);
  if (v18) {
    uint64_t v19 = *(void *)(v18 + 24);
  }
  else {
    uint64_t v19 = 0;
  }
  if (!-[PFCloudKitMetadataCache cacheMetadataForObjectsWithIDs:andRecordsWithIDs:inStore:withManagedObjectContext:mirroringOptions:error:]((id *)&v133->super.isa, MEMORY[0x1E4F1CBF0], v17, *(void **)(a1 + 32), *(void **)(a1 + 40), v19, (void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)))goto LABEL_48; {
  long long v144 = 0u;
  }
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  uint64_t v20 = *(void **)(*(void *)(a1 + 48) + 112);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v142 objects:v153 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v143;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v143 != v22) {
          objc_enumerationMutation(v20);
        }
        uint64_t v24 = *(void *)(*((void *)&v142 + 1) + 8 * i);
        uint64_t v25 = (void *)MEMORY[0x18C127630]();
        uint64_t v26 = (void *)-[PFCloudKitMetadataCache recordMetadataForRecordID:]((uint64_t)v133, v24);
        if (v26)
        {
          uint64_t v27 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "model"), "entityForID:", objc_msgSend((id)objc_msgSend(v26, "entityId"), "unsignedLongValue")), "entityDescription");
          if (v27)
          {
            uint64_t v28 = +[PFCloudKitSerializer recordTypeForEntity:]((uint64_t)PFCloudKitSerializer, v27);
            id v29 = (id)[*(id *)(*(void *)(a1 + 48) + 72) objectForKey:v28];
            if (!v29)
            {
              id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [*(id *)(*(void *)(a1 + 48) + 72) setObject:v29 forKey:v28];
            }
            [v29 addObject:v24];
          }
          else
          {
            uint64_t v30 = [NSString stringWithUTF8String:"CloudKit Import: Failed to find entity for unknown item recordID: %@ - %@"];
            _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, v24);
            uint64_t v37 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v24;
              __int16 v151 = 2112;
              v152 = v26;
              _os_log_fault_impl(&dword_18AB82000, v37, OS_LOG_TYPE_FAULT, "CoreData: CloudKit Import: Failed to find entity for unknown item recordID: %@ - %@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v142 objects:v153 count:16];
    }
    while (v21);
  }
  v38 = (void *)MEMORY[0x18C127630]();
  unint64_t v39 = __ckLoggingOverride;
  uint64_t v40 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Importing updated records:\n%@\nDeleted RecordIDs:\n%@"];
  uint64_t v47 = v39 >= 9 ? 9 : v39;
  uint64_t v130 = *(void *)(*(void *)(a1 + 48) + 72);
  _NSCoreDataLog(v47, v40, v41, v42, v43, v44, v45, v46, (uint64_t)"-[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonitor:madeChanges:error:]_block_invoke");
  if (!-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]((uint64_t)v131, *(void *)(*(void *)(a1 + 48) + 40), *(void *)(*(void *)(a1 + 48) + 72), *(void *)(a1 + 32), *(void **)(a1 + 40), [*(id *)(a1 + 48) entityNameToAttributesToUpdate], objc_msgSend(*(id *)(a1 + 48), "entityNameToRelationshipsToUpdate"), *(void *)(*(void *)(a1 + 64) + 8) + 24, (void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)))
  {
LABEL_48:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    id v64 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    goto LABEL_49;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 48) updateMetadataForAccumulatedChangesInContext:*(void *)(a1 + 40) inStore:*(void *)(a1 + 32) error:*(void *)(*(void *)(a1 + 56) + 8) + 40];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 40) hasChanges];
    }
    if (!+[_PFRoutines _isInMemoryStore:]((uint64_t)_PFRoutines, *(unsigned __int8 **)(a1 + 32)))
    {
      *(void *)buf = 0;
      if ((objc_msgSend(*(id *)(a1 + 40), "setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), buf) & 1) == 0)
      {
        char v48 = (void *)MEMORY[0x18C127630]();
        uint64_t v49 = __ckLoggingOverride;
        uint64_t v50 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Unable to set query generation on managedObjectContext: %@"];
        _NSCoreDataLog(v49 != 0, v50, v51, v52, v53, v54, v55, v56, (uint64_t)"-[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonitor:madeChanges:error:]_block_invoke");
      }
    }
    __int16 v57 = +[NSCKImportOperation fetchOperationWithIdentifier:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKImportOperation, *(void *)(*(void *)(a1 + 48) + 32), *(void *)(a1 + 32), *(void **)(a1 + 40), *(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v57)
    {
      long long v140 = 0u;
      long long v141 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      int v58 = *(void **)(*(void *)(a1 + 48) + 96);
      uint64_t v59 = [v58 countByEnumeratingWithState:&v138 objects:v149 count:16];
      if (v59)
      {
        uint64_t v60 = *(void *)v139;
        do
        {
          for (uint64_t j = 0; j != v59; ++j)
          {
            if (*(void *)v139 != v60) {
              objc_enumerationMutation(v58);
            }
            +[NSCKImportPendingRelationship insertPendingRelationshipForFailedRelationship:forOperation:inStore:withManagedObjectContext:]((uint64_t)NSCKImportPendingRelationship, *(void *)(*((void *)&v138 + 1) + 8 * j), (uint64_t)v57, *(void *)(a1 + 32), *(void **)(a1 + 40));
          }
          uint64_t v59 = [v58 countByEnumeratingWithState:&v138 objects:v149 count:16];
        }
        while (v59);
      }
      if (([*(id *)(a1 + 40) save:*(void *)(*(void *)(a1 + 56) + 8) + 40] & 1) == 0)
      {
        if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
          v115 = (void *)MEMORY[0x18C127630](*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
          uint64_t v116 = __ckLoggingOverride;
          uint64_t v117 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to save applied changes from import: %@"];
          _NSCoreDataLog(v116 != 0, v117, v118, v119, v120, v121, v122, v123, (uint64_t)"-[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonitor:madeChanges:error:]_block_invoke");
        }
        goto LABEL_89;
      }
      char v62 = 1;
    }
    else
    {
      v104 = (void *)MEMORY[0x18C127630]();
      uint64_t v105 = __ckLoggingOverride;
      uint64_t v106 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to fetch import operation with identifier '%@': %@"];
      uint64_t v128 = *(void *)(*(void *)(a1 + 48) + 32);
      uint64_t v129 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      _NSCoreDataLog(v105 != 0, v106, v107, v108, v109, v110, v111, v112, (uint64_t)"-[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonitor:madeChanges:error:]_block_invoke");
      v113 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if (v113)
      {
        id v114 = v113;
        char v62 = 0;
      }
      else
      {
        id v124 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v147 = *MEMORY[0x1E4F28588];
        uint64_t v125 = *(void *)(a1 + 48);
        if (v125) {
          uint64_t v125 = *(void *)(v125 + 16);
        }
        uint64_t v148 = [NSString stringWithFormat:@"The request '%@' was cancelled because it conflicted with another active import operation.", v125, 425, v128, v129, v130];
        uint64_t v126 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v148 forKeys:&v147 count:1];
        uint64_t v127 = [v124 initWithDomain:*MEMORY[0x1E4F281F8] code:134407 userInfo:v126];
        char v62 = 0;
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = v127;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v62;
  }
  else
  {
    id v103 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
LABEL_89:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
    *(void *)(*(void *)(a1 + 48) + 128) = 0;
  }
LABEL_49:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    long long v136 = 0u;
    long long v137 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    obuint64_t j = *(id *)(*(void *)(a1 + 48) + 120);
    uint64_t v65 = [obj countByEnumeratingWithState:&v134 objects:v146 count:16];
    if (v65)
    {
      uint64_t v66 = *(void *)v135;
LABEL_52:
      uint64_t v67 = 0;
      while (1)
      {
        if (*(void *)v135 != v66) {
          objc_enumerationMutation(obj);
        }
        v68 = *(void **)(*((void *)&v134 + 1) + 8 * v67);
        v69 = (void *)MEMORY[0x18C127630]();
        uint64_t v70 = *(void *)(a1 + 48);
        if (v70 && (uint64_t v71 = *(void *)(v70 + 8)) != 0) {
          v72 = *(void **)(v71 + 24);
        }
        else {
          v72 = 0;
        }
        v73 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v68, [v72 databaseScope], *(void *)(a1 + 32), *(void **)(a1 + 40), *(void *)(*(void *)(a1 + 56) + 8) + 40);
        if (v73)
        {
          uint64_t v74 = [*(id *)(*(void *)(a1 + 48) + 120) objectForKey:v68];
          v75 = (void *)MEMORY[0x18C127630]();
          unint64_t v76 = __ckLoggingOverride;
          uint64_t v77 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Importing updated share: %@"];
          uint64_t v84 = v76 >= 0x10 ? 16 : v76;
          _NSCoreDataLog(v84, v77, v78, v79, v80, v81, v82, v83, (uint64_t)"-[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonitor:madeChanges:error:]_block_invoke");
          uint64_t v85 = *(void *)(a1 + 48);
          if (v85
            && (uint64_t v86 = *(void *)(v85 + 8)) != 0
            && (uint64_t v87 = *(void *)(v86 + 24)) != 0
            && (uint64_t v88 = *(void *)(v87 + 136)) != 0
            && (id v89 = -[PFCloudKitArchivingUtilities encodeRecord:error:](v88, v74, (void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))) != 0)
          {
            [(NSManagedObject *)v73 setEncodedShareData:v89];
            [(NSManagedObject *)v73 setNeedsShareUpdate:0];
          }
          else
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
            v91 = (void *)MEMORY[0x18C127630](*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
            uint64_t v92 = __ckLoggingOverride;
            uint64_t v93 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to encode an updated share: %@\n%@\n%@\n%@"];
            _NSCoreDataLog(v92 != 0, v93, v94, v95, v96, v97, v98, v99, (uint64_t)"-[PFCloudKitImportRecordsWorkItem applyAccumulatedChangesToStore:inManagedObjectContext:withStoreMonitor:madeChanges:error:]_block_invoke");
            id v89 = 0;
          }
        }
        else
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
          id v90 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        }
        int v100 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        if (!v100) {
          break;
        }
        if (v65 == ++v67)
        {
          uint64_t v101 = [obj countByEnumeratingWithState:&v134 objects:v146 count:16];
          uint64_t v65 = v101;
          if (v101) {
            goto LABEL_52;
          }
          break;
        }
      }
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
      && ([*(id *)(a1 + 40) save:*(void *)(*(void *)(a1 + 56) + 8) + 40] & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      id v102 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
  }
  -[PFCloudKitImportRecordsWorkItem removeDownloadedAssetFiles](*(void *)(a1 + 48));
}

- (void)removeDownloadedAssetFiles
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v22 = 0;
    id v2 = (id)[MEMORY[0x1E4F28CB8] defaultManager];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v3 = (void *)[*(id *)(a1 + 24) allValues];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v19;
      uint64_t v7 = *MEMORY[0x1E4F281F8];
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v3);
          }
          if (([v2 removeItemAtURL:*(void *)(*((void *)&v18 + 1) + 8 * i) error:&v22] & 1) == 0
            && (!objc_msgSend((id)objc_msgSend(v22, "domain"), "isEqualToString:", v7)
             || [v22 code] != 4))
          {
            uint64_t v9 = (void *)MEMORY[0x18C127630]();
            BOOL v10 = __ckLoggingOverride != 0;
            uint64_t v11 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Unable to delete processed asset file: %@\n%@"];
            _NSCoreDataLog(v10, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[PFCloudKitImportRecordsWorkItem removeDownloadedAssetFiles]");
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v5);
    }
  }
}

- (BOOL)updateMetadataForAccumulatedChangesInContext:(id)a3 inStore:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)commitMetadataChangesWithContext:(id)a3 forStore:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v27 = 0;
  if (!+[NSCKImportOperation purgeFinishedImportOperationsInStore:withManagedObjectContext:error:]((uint64_t)NSCKImportOperation, (uint64_t)a4, a3, (uint64_t)&v27))
  {
    uint64_t v9 = (void *)MEMORY[0x18C127630]();
    BOOL v10 = __ckLoggingOverride != 0;
    uint64_t v11 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to purge mirrored relationships during import: %@"];
LABEL_6:
    _NSCoreDataLog(v10, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[PFCloudKitImportRecordsWorkItem commitMetadataChangesWithContext:forStore:error:]");
    if (v27)
    {
      if (a5)
      {
        LOBYTE(v8) = 0;
        *a5 = v27;
        return v8;
      }
    }
    else
    {
      uint64_t v18 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportRecordsWorkItem.m");
      uint64_t v25 = __pflogFaultLog;
      BOOL v8 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v8) {
        return v8;
      }
      *(_DWORD *)buf = 136315394;
      id v29 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportRecordsWorkItem.m";
      __int16 v30 = 1024;
      int v31 = 568;
      _os_log_fault_impl(&dword_18AB82000, v25, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    LOBYTE(v8) = 0;
    return v8;
  }
  char v7 = [a3 save:&v27];
  LOBYTE(v8) = 1;
  if ((v7 & 1) == 0 && v27)
  {
    uint64_t v9 = (void *)MEMORY[0x18C127630](1);
    BOOL v10 = __ckLoggingOverride != 0;
    uint64_t v11 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to save changes from import: %@"];
    goto LABEL_6;
  }
  return v8;
}

- (void)addUpdatedRecord:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->_encounteredErrors count])
  {
    uint64_t v5 = self->super._options;
    id v6 = (id)[MEMORY[0x1E4F28CB8] defaultManager];
    char v7 = (void *)[a3 recordType];
    if ([v7 isEqualToString:getCloudKitCKRecordTypeShare()])
    {
      -[NSMutableDictionary setObject:forKey:](self->_updatedShares, "setObject:forKey:", a3, objc_msgSend((id)objc_msgSend(a3, "recordID"), "zoneID"));
    }
    else
    {
      [(NSMutableArray *)self->_updatedRecords addObject:a3];
      -[NSMutableArray addObject:](self->_allRecordIDs, "addObject:", [a3 recordID]);
    }
    self->_totalOperationBytes += [a3 size];
    self->_currentOperationBytes += [a3 size];
    ++self->_countUpdatedRecords;
    -[PFCloudKitSizeMetric addByteSize:]((uint64_t)self->_fetchedRecordBytesMetric, [a3 size]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    obuint64_t j = +[PFCloudKitSerializer assetsOnRecord:withOptions:]((uint64_t)PFCloudKitSerializer, a3);
    uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v40;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v39 + 1) + 8 * v11);
          if (v5) {
            assetStorageURL = v5->_assetStorageURL;
          }
          else {
            assetStorageURL = 0;
          }
          uint64_t v14 = -[NSURL URLByAppendingPathComponent:isDirectory:](assetStorageURL, "URLByAppendingPathComponent:isDirectory:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"), 0);
          uint64_t v38 = 0;
          if (objc_msgSend(v6, "moveItemAtURL:toURL:error:", objc_msgSend(v12, "fileURL"), v14, &v38))
          {
            -[NSMutableDictionary setObject:forKey:](self->_assetPathToSafeSaveURL, "setObject:forKey:", v14, objc_msgSend((id)objc_msgSend(v12, "fileURL"), "path"));
            uint64_t v15 = objc_msgSend(v6, "attributesOfItemAtPath:error:", -[NSURL path](v14, "path"), &v38);
            if (v15)
            {
              uint64_t v16 = v15;
              self->_totalOperationBytes += [v15 fileSize];
              self->_currentOperationBytes += [v16 fileSize];
              -[PFCloudKitSizeMetric addByteSize:]((uint64_t)self->_fetchedAssetBytesMetric, [v16 fileSize]);
              goto LABEL_18;
            }
            uint64_t v27 = MEMORY[0x18C127630]();
            BOOL v28 = __ckLoggingOverride != 0;
            uint64_t v29 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to read attributes of asset file at URL: %@\n%@\n%@\n%@"];
            _NSCoreDataLog(v28, v29, v30, v31, v32, v33, v34, v35, (uint64_t)"-[PFCloudKitImportRecordsWorkItem addUpdatedRecord:]");
            uint64_t v26 = (void *)v27;
          }
          else
          {
            uint64_t v17 = MEMORY[0x18C127630]();
            BOOL v18 = __ckLoggingOverride != 0;
            uint64_t v19 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to copy asset to URL: %@\n%@\n%@\n%@"];
            _NSCoreDataLog(v18, v19, v20, v21, v22, v23, v24, v25, (uint64_t)"-[PFCloudKitImportRecordsWorkItem addUpdatedRecord:]");
            uint64_t v26 = (void *)v17;
          }
          [(NSMutableArray *)self->_encounteredErrors addObject:v38];
LABEL_18:
          ++v11;
        }
        while (v9 != v11);
        uint64_t v36 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
        uint64_t v9 = v36;
      }
      while (v36);
    }

    -[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:]((uint64_t)self, 0);
  }
}

- (void)checkAndApplyChangesIfNeeded:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 8);
    uint64_t v5 = v4 ? *(void **)(v4 + 24) : 0;
    if (objc_msgSend((id)objc_msgSend(v5, "operationMemoryThresholdBytes"), "unsignedIntegerValue")
      && ((uint64_t v7 = *(void *)(a1 + 8)) == 0 ? (v8 = 0) : (v8 = *(void **)(v7 + 24)),
          unint64_t v6 = *(void *)(a1 + 128),
          v6 >= objc_msgSend((id)objc_msgSend(v8, "operationMemoryThresholdBytes"), "unsignedIntegerValue"))
      || *(void *)(a1 + 128) > 0xA00000uLL
      || (unint64_t v9 = [*(id *)(a1 + 80) count], a2)
      || v9 >= 0x1F5)
    {
      uint64_t v10 = *(void *)(a1 + 8);
      if (v10) {
        uint64_t v11 = *(NSObject **)(v10 + 32);
      }
      else {
        uint64_t v11 = 0;
      }
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke;
      v12[3] = &unk_1E544B778;
      v12[4] = a1;
      v12[5] = a2;
      dispatch_sync(v11, v12);
    }
  }
}

- (void)addDeletedRecordID:(uint64_t)a3 ofType:
{
  if (a1 && ![*(id *)(a1 + 88) count])
  {
    id v6 = (id)[*(id *)(a1 + 72) objectForKey:a3];
    if (!v6)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [*(id *)(a1 + 72) setObject:v6 forKey:a3];
    }
    [v6 addObject:a2];

    [*(id *)(a1 + 80) addObject:a2];
    ++*(void *)(a1 + 144);
    -[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:](a1, 0);
  }
}

- (void)fetchOperationFinishedWithError:(uint64_t)a3 completion:
{
  if (a1)
  {
    isa = *(NSObject **)(a1 + 8);
    if (isa) {
      isa = isa[4].isa;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__PFCloudKitImportRecordsWorkItem_fetchOperationFinishedWithError_completion___block_invoke;
    block[3] = &unk_1E544D4F8;
    block[4] = a1;
    block[5] = a2;
    block[6] = a3;
    dispatch_async(isa, block);
  }
}

id __78__PFCloudKitImportRecordsWorkItem_fetchOperationFinishedWithError_completion___block_invoke(uint64_t *a1)
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v3 = (void *)a1[4];
  if (v3) {
    uint64_t v3 = (void *)v3[1];
  }
  uint64_t v4 = v3;
  uint64_t v6 = a1[4];
  uint64_t v5 = (void *)a1[5];
  if (!v5)
  {
    if (![*(id *)(v6 + 88) count])
    {
      if (v4) {
        uint64_t v13 = (void *)v4[3];
      }
      else {
        uint64_t v13 = 0;
      }
      if ([v13 operationMemoryThresholdBytes])
      {
        uint64_t v14 = v4 ? (void *)v4[3] : 0;
        if ((unint64_t)objc_msgSend((id)objc_msgSend(v14, "operationMemoryThresholdBytes"), "unsignedLongLongValue") < *(void *)(a1[4] + 128))
        {
          uint64_t v15 = [NSString stringWithUTF8String:"Importer didn't obey operation memory threshold, finished operation with more than the threshold worth of work to do (%@ bytes): %@"];
          uint64_t v16 = [NSNumber numberWithUnsignedInteger:*(void *)(a1[4] + 128)];
          _NSCoreDataLog(17, v15, v17, v18, v19, v20, v21, v22, v16);
          uint64_t v23 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            uint64_t v24 = [NSNumber numberWithUnsignedInteger:*(void *)(a1[4] + 128)];
            if (v4) {
              uint64_t v25 = v4[3];
            }
            else {
              uint64_t v25 = 0;
            }
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v24;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v25;
            _os_log_fault_impl(&dword_18AB82000, v23, OS_LOG_TYPE_FAULT, "CoreData: Importer didn't obey operation memory threshold, finished operation with more than the threshold worth of work to do (%@ bytes): %@", buf, 0x16u);
          }
        }
      }
      goto LABEL_9;
    }
    if ([*(id *)(a1[4] + 88) count] == 1)
    {
      uint64_t v12 = [*(id *)(a1[4] + 88) lastObject];
    }
    else
    {
      uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v78 = @"NSDetailedErrors";
      uint64_t v79 = *(void *)(a1[4] + 88);
      uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
      uint64_t v12 = [v26 errorWithDomain:*MEMORY[0x1E4F281F8] code:134404 userInfo:v27];
    }
    uint64_t v5 = (void *)v12;
LABEL_26:
    int v11 = 0;
    goto LABEL_27;
  }
  if (!v6) {
    goto LABEL_26;
  }
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  LOBYTE(v74) = 0;
  uint64_t v7 = (void *)[v5 domain];
  if ([v7 isEqualToString:getCloudKitCKErrorDomain[0]()]
    && [v5 code] == 2)
  {
    uint64_t v8 = (void *)[v5 userInfo];
    unint64_t v9 = (void *)[v8 objectForKey:getCloudKitCKPartialErrorsByItemIDKey()];
    *((unsigned char *)v72 + 24) = 1;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __53__PFCloudKitImportRecordsWorkItem_handleImportError___block_invoke;
    uint64_t v81 = &unk_1E544F138;
    uint64_t v82 = (void *)v6;
    uint64_t v83 = &v71;
    [v9 enumerateKeysAndObjectsUsingBlock:buf];
  }
  int v10 = *((unsigned __int8 *)v72 + 24);
  _Block_object_dispose(&v71, 8);
  if (!v10)
  {
    int v11 = 0;
    uint64_t v5 = (void *)a1[5];
    goto LABEL_27;
  }
LABEL_9:
  uint64_t v5 = 0;
  int v11 = 1;
LABEL_27:
  if (v4 && (uint64_t v28 = v4[3]) != 0) {
    uint64_t v29 = *(void *)(v28 + 72);
  }
  else {
    uint64_t v29 = 0;
  }
  -[PFCloudKitMetricsClient logMetric:](v29, *(void **)(a1[4] + 64));
  if (v4 && (uint64_t v30 = v4[3]) != 0) {
    uint64_t v31 = *(void *)(v30 + 72);
  }
  else {
    uint64_t v31 = 0;
  }
  -[PFCloudKitMetricsClient logMetric:](v31, *(void **)(a1[4] + 56));
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v32 = *(void **)(a1[4] + 104);
  uint64_t v33 = [v32 countByEnumeratingWithState:&v67 objects:v77 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v68;
LABEL_35:
    uint64_t v35 = 0;
    while (1)
    {
      if (*(void *)v68 != v34) {
        objc_enumerationMutation(v32);
      }
      if ([*(id *)(*((void *)&v67 + 1) + 8 * v35) madeChanges]) {
        break;
      }
      if (v33 == ++v35)
      {
        uint64_t v33 = [v32 countByEnumeratingWithState:&v67 objects:v77 count:16];
        if (v33) {
          goto LABEL_35;
        }
        goto LABEL_41;
      }
    }
    uint64_t v36 = 1;
    if (!v11) {
      goto LABEL_42;
    }
LABEL_49:
    uint64_t v51 = (uint64_t *)a1[4];
    if (v51)
    {
      uint64_t v71 = 0;
      v72 = &v71;
      uint64_t v73 = 0x3052000000;
      uint64_t v74 = __Block_byref_object_copy__44;
      v75 = __Block_byref_object_dispose__44;
      uint64_t v76 = 0;
      uint64_t v52 = (void *)v51[1];
      if (v52) {
        uint64_t v52 = (void *)v52[2];
      }
      uint64_t v53 = v52;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __81__PFCloudKitImportRecordsWorkItem_newMirroringResultByApplyingAccumulatedChanges__block_invoke;
      uint64_t v81 = &unk_1E544B500;
      uint64_t v82 = v53;
      uint64_t v83 = v51;
      uint64_t v84 = &v71;
      -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v53, (uint64_t)buf);

      uint64_t v54 = (void *)v72[5];
      _Block_object_dispose(&v71, 8);
      if (v54)
      {
        if (![v54 success]
          || (([v54 madeChanges] | v36 ^ 1) & 1) != 0)
        {
          goto LABEL_66;
        }

        uint64_t v55 = (void *)a1[4];
        if (v55)
        {
          uint64_t v56 = v55[2];
          if (!v4) {
            goto LABEL_80;
          }
        }
        else
        {
          uint64_t v56 = 0;
          if (!v4) {
            goto LABEL_80;
          }
        }
        uint64_t v57 = v4[2];
        if (v57)
        {
          uint64_t v58 = *(void *)(v57 + 48);
LABEL_59:
          uint64_t v59 = [v55 createMirroringResultForRequest:v56 storeIdentifier:v58 success:1 madeChanges:1 error:0];
LABEL_65:
          uint64_t v54 = (void *)v59;
LABEL_66:
          uint64_t v65 = a1[6];
          if (v65) {
            (*(void (**)(uint64_t, void *))(v65 + 16))(v65, v54);
          }

          goto LABEL_69;
        }
LABEL_80:
        uint64_t v58 = 0;
        goto LABEL_59;
      }
      uint64_t v60 = (void *)a1[4];
      if (v60)
      {
        uint64_t v62 = v60[1];
        uint64_t v61 = v60[2];
        if (v62)
        {
          uint64_t v63 = *(void *)(v62 + 16);
          if (v63)
          {
            uint64_t v64 = *(void *)(v63 + 48);
LABEL_64:
            uint64_t v59 = [v60 createMirroringResultForRequest:v61 storeIdentifier:v64 success:0 madeChanges:v36 error:v5];
            goto LABEL_65;
          }
        }
      }
      else
      {
        uint64_t v61 = 0;
      }
    }
    else
    {
      uint64_t v61 = 0;
      uint64_t v60 = 0;
    }
    uint64_t v64 = 0;
    goto LABEL_64;
  }
LABEL_41:
  uint64_t v36 = 0;
  if (v11) {
    goto LABEL_49;
  }
LABEL_42:
  uint64_t v37 = (void *)MEMORY[0x18C127630]();
  uint64_t v38 = __ckLoggingOverride;
  uint64_t v39 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Fetch finished with error:\n%@"];
  _NSCoreDataLog(v38 != 0, v39, v40, v41, v42, v43, v44, v45, (uint64_t)"-[PFCloudKitImportRecordsWorkItem fetchOperationFinishedWithError:completion:]_block_invoke");
  if (!a1[6])
  {
LABEL_69:
    uint64_t v50 = 0;
    goto LABEL_70;
  }
  uint64_t v46 = (void *)a1[4];
  if (v46)
  {
    uint64_t v47 = v46[2];
    if (!v4)
    {
LABEL_76:
      uint64_t v49 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    uint64_t v47 = 0;
    if (!v4) {
      goto LABEL_76;
    }
  }
  uint64_t v48 = v4[2];
  if (!v48) {
    goto LABEL_76;
  }
  uint64_t v49 = *(void *)(v48 + 48);
LABEL_47:
  uint64_t v50 = (void *)[v46 createMirroringResultForRequest:v47 storeIdentifier:v49 success:0 madeChanges:v36 error:v5];
  (*(void (**)(void))(a1[6] + 16))();
LABEL_70:
  -[PFCloudKitImportRecordsWorkItem removeDownloadedAssetFiles](a1[4]);

  [v2 drain];
  return 0;
}

uint64_t __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke_2;
  v2[3] = &unk_1E544B778;
  long long v3 = *(_OWORD *)(a1 + 32);
  return +[_PFRoutines wrapBlockInGuardedAutoreleasePool:v2];
}

id __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x18C127630]();
  if ((unint64_t)__ckLoggingOverride >= 0x10) {
    uint64_t v3 = 16;
  }
  else {
    uint64_t v3 = __ckLoggingOverride;
  }
  uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Applying accumulated changes at change token: %@"];
  _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:]_block_invoke_2");
  int v11 = *(void **)(a1 + 32);
  if (v11)
  {
    int v11 = (void *)v11[1];
    if (v11) {
      int v11 = (void *)v11[2];
    }
  }
  uint64_t v12 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke_3;
  v15[3] = &unk_1E544B778;
  uint64_t v13 = *(void *)(a1 + 32);
  v15[4] = v12;
  v15[5] = v13;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v12, (uint64_t)v15);

  *(void *)(*(void *)(a1 + 32) + 80) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  *(void *)(*(void *)(a1 + 32) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);

  *(void *)(*(void *)(a1 + 32) + 72) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  *(void *)(*(void *)(a1 + 32) + 24) = objc_alloc_init(MEMORY[0x1E4F1CA60]);

  *(void *)(*(void *)(a1 + 32) + 96) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  *(void *)(*(void *)(a1 + 32) + 112) = 0;

  id result = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  *(void *)(*(void *)(a1 + 32) + 120) = result;
  return result;
}

void __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke_3(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v49 = 0;
  id v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v3 + 32));
      uint64_t v5 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v5 = 0;
      id WeakRetained = 0;
    }
    uint64_t v6 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v5);
    [(NSManagedObjectContext *)v6 setTransactionAuthor:@"NSCloudKitMirroringDelegate.import"];
    unsigned __int8 v48 = 0;
    if ([*(id *)(a1 + 40) applyAccumulatedChangesToStore:v2 inManagedObjectContext:v6 withStoreMonitor:*(void *)(a1 + 32) madeChanges:&v48 error:&v49])
    {
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke_4;
      v47[3] = &unk_1E544B778;
      uint64_t v7 = *(void *)(a1 + 40);
      v47[4] = v6;
      v47[5] = v7;
      uint64_t v8 = (void *)MEMORY[0x18C127630]([(NSManagedObjectContext *)v6 performBlockAndWait:v47]);
      if ((unint64_t)__ckLoggingOverride >= 0x10) {
        uint64_t v9 = 16;
      }
      else {
        uint64_t v9 = __ckLoggingOverride;
      }
      uint64_t v10 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Successfully applied incremental changes during request: %@"];
      _NSCoreDataLog(v9, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:]_block_invoke");
      uint64_t v17 = *(void **)(a1 + 40);
      if (v17) {
        uint64_t v18 = v17[2];
      }
      else {
        uint64_t v18 = 0;
      }
      uint64_t v19 = *(void *)(a1 + 32);
      if (v19) {
        uint64_t v20 = *(void *)(v19 + 48);
      }
      else {
        uint64_t v20 = 0;
      }
      uint64_t v21 = (void *)[v17 createMirroringResultForRequest:v18 storeIdentifier:v20 success:1 madeChanges:v48 error:0];
      [*(id *)(*(void *)(a1 + 40) + 104) addObject:v21];
      if (([v21 success] & 1) == 0)
      {
        uint64_t v22 = [NSString stringWithUTF8String:"Should tear down here and stop subsequent attempts to import from happening."];
        _NSCoreDataLog(17, v22, v23, v24, v25, v26, v27, v28, v46);
        uint64_t v29 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_18AB82000, v29, OS_LOG_TYPE_FAULT, "CoreData: Should tear down here and stop subsequent attempts to import from happening.", buf, 2u);
        }
      }
    }
    else
    {
      uint64_t v36 = (void *)MEMORY[0x18C127630]();
      BOOL v37 = __ckLoggingOverride != 0;
      uint64_t v38 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Failed to incrementally apply changes during request: %@\n%@"];
      _NSCoreDataLog(v37, v38, v39, v40, v41, v42, v43, v44, (uint64_t)"-[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:]_block_invoke");
      uint64_t v45 = *(void *)(a1 + 40);
      if (v45) {
        [*(id *)(v45 + 88) addObject:v49];
      }
      uint64_t v21 = 0;
    }
  }
  else
  {
    uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v50 = *MEMORY[0x1E4F28588];
    uint64_t v31 = *(void *)(a1 + 40);
    if (v31) {
      uint64_t v32 = *(void **)(v31 + 16);
    }
    else {
      uint64_t v32 = 0;
    }
    uint64_t v51 = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(v32, "requestIdentifier")];
    uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    uint64_t v34 = [v30 errorWithDomain:*MEMORY[0x1E4F281F8] code:134407 userInfo:v33];
    uint64_t v49 = v34;
    uint64_t v35 = *(void *)(a1 + 40);
    if (v35) {
      [*(id *)(v35 + 88) addObject:v34];
    }
  }
}

void __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke_4(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) hasChanges])
  {
    uint64_t v2 = [NSString stringWithUTF8String:"Incremental import left uncommitted changes in the managed object context: %@"];
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      uint64_t v9 = *(void *)(v9 + 16);
    }
    _NSCoreDataLog(17, v2, v3, v4, v5, v6, v7, v8, v9);
    uint64_t v10 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      if (v11) {
        uint64_t v11 = *(void *)(v11 + 16);
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v11;
      _os_log_fault_impl(&dword_18AB82000, v10, OS_LOG_TYPE_FAULT, "CoreData: Incremental import left uncommitted changes in the managed object context: %@", buf, 0xCu);
    }
  }
}

- (id)createMirroringResultForRequest:(id)a3 storeIdentifier:(id)a4 success:(BOOL)a5 madeChanges:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v12 = [NSCloudKitMirroringResult alloc];

  return [(NSCloudKitMirroringResult *)v12 initWithRequest:a3 storeIdentifier:a4 success:v9 madeChanges:v8 error:a7];
}

void __53__PFCloudKitImportRecordsWorkItem_handleImportError___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  getCloudKitCKRecordIDClass[0]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    getCloudKitCKRecordZoneIDClass[0]();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v10 = [NSString stringWithUTF8String:"CloudKit Import: Failed to handle item error for unknown itemID type: %@ - %@"];
      _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, a2);
      uint64_t v17 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v19 = a2;
        __int16 v20 = 2112;
        uint64_t v21 = a3;
        _os_log_fault_impl(&dword_18AB82000, v17, OS_LOG_TYPE_FAULT, "CoreData: CloudKit Import: Failed to handle item error for unknown itemID type: %@ - %@", buf, 0x16u);
      }
    }
    goto LABEL_10;
  }
  BOOL v8 = (void *)[a3 domain];
  if (![v8 isEqualToString:getCloudKitCKErrorDomain[0]()]
    || [a3 code] != 11)
  {
LABEL_10:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
    return;
  }
  [*(id *)(*(void *)(a1 + 32) + 112) addObject:a2];
  BOOL v9 = *(void **)(*(void *)(a1 + 32) + 80);

  [v9 addObject:a2];
}

- (void)cloudKitSerializer:(id)a3 failedToUpdateRelationship:(id)a4 withError:(id)a5
{
}

- (id)cloudKitSerializer:(id)a3 safeSaveURLForAsset:(id)a4
{
  assetPathToSafeSaveURL = self->_assetPathToSafeSaveURL;
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a4, "fileURL", a3), "path");

  return (id)[(NSMutableDictionary *)assetPathToSafeSaveURL objectForKey:v5];
}

- (id)entityNameToAttributesToUpdate
{
  return 0;
}

- (id)entityNameToRelationshipsToUpdate
{
  return 0;
}

@end