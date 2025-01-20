@interface _PFUbiquityRecordImportOperation
- (NSString)description;
- (_PFUbiquityRecordImportOperation)init;
- (_PFUbiquityRecordImportOperationDelegate)delegate;
- (id)copy;
- (id)retainedDelegate;
- (int64_t)context:(id)a3 shouldHandleInaccessibleFault:(id)a4 forObjectID:(id)a5 andTrigger:(id)a6;
- (uint64_t)applyChangesFromStoreSaveSnapshot:(void *)a3 withImportContext:(void *)a4 withError:;
- (uint64_t)initWithTransactionLog:(uint64_t)a3 persistentStore:(uint64_t)a4 andLocalPeerID:;
- (uint64_t)processObjects:(uint64_t)a3 withState:(void *)a4 andImportContext:(void *)a5 outError:;
- (void)cancel;
- (void)dealloc;
- (void)main;
- (void)notifyDelegateOfError:(void *)a1;
- (void)respondToStoreTransactionStateChangeNotification:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _PFUbiquityRecordImportOperation

- (_PFUbiquityRecordImportOperation)init
{
  v5.receiver = self;
  v5.super_class = (Class)_PFUbiquityRecordImportOperation;
  v2 = [(PFUbiquityImportOperation *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_moc = 0;
    v2->_psc = 0;
    v2->_insertedObjectIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v3->_updatedObjectIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v3->_deletedObjectIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v3->_resolvedConflicts = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_relationshipsToObjectIDsToCheck = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_lockedExistingCoord = 0;
    v3->_logScore = 0;
    v3->_initialStoreKnowledgeVector = 0;
    v3->_importContext = 0;
    v3->_updatedStoreKnowledgeVector = 0;
    v3->_transactionDidRollback = 0;
    v3->_operationError = 0;
    v3->_wroteKV = 0;
    v3->_success = 0;
  }
  return v3;
}

- (uint64_t)initWithTransactionLog:(uint64_t)a3 persistentStore:(uint64_t)a4 andLocalPeerID:
{
  if (!a1) {
    return 0;
  }
  if (a2)
  {
    uint64_t v5 = a2[3];
    if (v5 && *(_DWORD *)(v5 + 24) != 1) {
      uint64_t v5 = *(void *)(v5 + 8);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [a1 initWithPersistentStore:a3 localPeerID:a4 andUbiquityRootLocation:v5];
  if (v6) {
    *(void *)(v6 + 320) = a2;
  }
  return v6;
}

- (void)dealloc
{
  [(_PFUbiquityRecordImportOperation *)self setDelegate:0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);

  self->_transactionLog = 0;
  self->_insertedObjectIDs = 0;

  self->_updatedObjectIDs = 0;
  self->_deletedObjectIDs = 0;

  self->_resolvedConflicts = 0;
  self->_relationshipsToObjectIDsToCheck = 0;

  self->_importContext = 0;
  self->_operationError = 0;
  objc_setProperty_nonatomic(self, v3, 0, 360);
  v4.receiver = self;
  v4.super_class = (Class)_PFUbiquityRecordImportOperation;
  [(PFUbiquityImportOperation *)&v4 dealloc];
}

- (id)copy
{
  SEL v3 = [_PFUbiquityRecordImportOperation alloc];
  transactionLog = self->_transactionLog;
  store = self->super._store;
  localPeerID = self->super._localPeerID;

  return (id)-[_PFUbiquityRecordImportOperation initWithTransactionLog:persistentStore:andLocalPeerID:](v3, transactionLog, (uint64_t)store, (uint64_t)localPeerID);
}

- (void)cancel
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)_PFUbiquityRecordImportOperation;
  [(PFUbiquityImportOperation *)&v10 cancel];
  transactionLog = self->_transactionLog;
  if (transactionLog && transactionLog->_transactionLogLocation)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1C978]);
    uint64_t v5 = self->_transactionLog;
    if (v5) {
      transactionLogLocation = v5->_transactionLogLocation;
    }
    else {
      transactionLogLocation = 0;
    }
    v7 = objc_msgSend(v4, "initWithObjects:", transactionLogLocation, 0);
    v8 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    ubiquityRootLocation = self->super._ubiquityRootLocation;
    v11 = @"PFLogLocationsKey";
    v12[0] = v7;
    objc_msgSend(v8, "postNotificationName:object:userInfo:", @"PFUbiquityLocationImportCancelledNotification", ubiquityRootLocation, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
  }
}

- (void)setDelegate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_PFUbiquityRecordImportOperation;
  [(PFUbiquityImportOperation *)&v3 setDelegate:a3];
}

- (_PFUbiquityRecordImportOperationDelegate)delegate
{
  v3.receiver = self;
  v3.super_class = (Class)_PFUbiquityRecordImportOperation;
  return (_PFUbiquityRecordImportOperationDelegate *)[(PFUbiquityImportOperation *)&v3 delegate];
}

- (id)retainedDelegate
{
  v3.receiver = self;
  v3.super_class = (Class)_PFUbiquityRecordImportOperation;
  return [(PFUbiquityImportOperation *)&v3 retainedDelegate];
}

- (void)notifyDelegateOfError:(void *)a1
{
  if (a1)
  {
    id v4 = (void *)[a1 retainedDelegate];
    if (v4)
    {
      id v5 = v4;
      [v4 operation:a1 failedWithError:a2];
      id v4 = v5;
    }
  }
}

- (uint64_t)applyChangesFromStoreSaveSnapshot:(void *)a3 withImportContext:(void *)a4 withError:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v29 = 0;
  if (a3 && (uint64_t v8 = a3[11]) != 0) {
    uint64_t v9 = *(void *)(v8 + 40);
  }
  else {
    uint64_t v9 = 0;
  }
  int v10 = 1;
  if (!-[PFUbiquityPeerRangeCache cachePeerRanges:](v9)) {
    goto LABEL_19;
  }
  if (!*(void *)(a1 + 304))
  {
    *(void *)(a1 + 304) = [[NSManagedObjectContext alloc] initWithConcurrencyType:3];
    [*(id *)(a1 + 304) setMergePolicy:NSMergeByPropertyStoreTrumpMergePolicy];
    [*(id *)(a1 + 304) setPersistentStoreCoordinator:*(void *)(a1 + 312)];
    uint64_t v11 = *(void *)(a1 + 304);
    if (v11)
    {
      *(_DWORD *)(v11 + 40) &= ~0x20000u;
      v12 = *(void **)(a1 + 304);
    }
    else
    {
      v12 = 0;
    }
    [v12 _setDelegate:a1];
    [*(id *)(a1 + 304) setUndoManager:0];
  }
  if (v9)
  {
    if (a2) {
      uint64_t v13 = a2[3];
    }
    else {
      uint64_t v13 = 0;
    }
    v15 = (void *)-[PFUbiquityPeerRangeCache createMapOfManagedObjectIDsForGlobalIDs:count:error:](v9, v13, 0, &v29);
    if (v15)
    {
      if (a3) {
        objc_setProperty_nonatomic(a3, v14, v15, 72);
      }
      if (-[PFUbiquityImportContext prefetchManagedObjectsInContext:error:]((uint64_t)a3, *(void **)(a1 + 304), &v29))
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSuccessfully prefetched managed objects.", "-[_PFUbiquityRecordImportOperation applyChangesFromStoreSaveSnapshot:withImportContext:withError:]", 201, a1);
        }
      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:1])
      {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\n Error pre-fetching managed objects: %@\n User Info: %@\nThe operation will attempt to continue, but may fail if it cannot talk to the database.", "-[_PFUbiquityRecordImportOperation applyChangesFromStoreSaveSnapshot:withImportContext:withError:]", 203, a1, v29, [v29 userInfo]);
      }
    }
    else
    {
      int v10 = 0;
    }
  }
  else
  {
LABEL_19:
    int v10 = 0;
    v15 = 0;
  }

  if (v10
    && ([(id)a1 isCancelled] & 1) == 0
    && -[PFUbiquityTransactionLog loadInsertedObjectsDataWithError:](*(void *)(a1 + 320), &v29)
    && ([(id)a1 isCancelled] & 1) == 0)
  {
    v16 = a2 ? (void *)a2[11] : 0;
    if (-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:](a1, v16, 0, a3, &v29)&& ([(id)a1 isCancelled] & 1) == 0&& -[PFUbiquityTransactionLog loadUpdatedObjectsDataWithError:](*(void *)(a1 + 320), &v29)&& (objc_msgSend((id)a1, "isCancelled") & 1) == 0)
    {
      v17 = a2 ? (void *)a2[12] : 0;
      if (-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:](a1, v17, 1, a3, &v29)&& ([(id)a1 isCancelled] & 1) == 0&& -[PFUbiquityTransactionLog loadDeletedObjectsDataWithError:](*(void *)(a1 + 320), &v29)&& (objc_msgSend((id)a1, "isCancelled") & 1) == 0)
      {
        if (a2) {
          v18 = (void *)a2[13];
        }
        else {
          v18 = 0;
        }
        -[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:](a1, v18, 2, a3, &v29);
      }
    }
  }
  if (!-[PFUbiquityTransactionLog releaseContents:](*(void *)(a1 + 320)))
  {
    if (v29)
    {
      if (a4)
      {
        uint64_t v19 = 0;
        *a4 = v29;
        goto LABEL_50;
      }
    }
    else
    {
      uint64_t v20 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordImportOperation.m");
      v27 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v31 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordImportOperation.m";
        __int16 v32 = 1024;
        int v33 = 241;
        _os_log_fault_impl(&dword_18AB82000, v27, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    uint64_t v19 = 0;
    goto LABEL_50;
  }
  uint64_t v19 = 1;
LABEL_50:

  return v19;
}

- (uint64_t)processObjects:(uint64_t)a3 withState:(void *)a4 andImportContext:(void *)a5 outError:
{
  uint64_t v218 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (!a2 || ![a2 count])
  {

    char v129 = 1;
    return v129 & 1;
  }
  id v193 = 0;
  id v168 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = *(void *)(a1 + 320);
  v151 = a2;
  if (v8)
  {
    uint64_t v9 = *(void *)(v8 + 72);
    uint64_t v10 = *(void *)(v8 + 24);
    if (v10)
    {
      uint64_t v11 = *(void *)(v10 + 40);
      if (v9)
      {
LABEL_6:
        uint64_t v158 = [*(id *)(v9 + 40) objectForKey:v11];
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v11 = 0;
      if (v9) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v158 = 0;
LABEL_7:
  long long v191 = 0u;
  long long v192 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  obuint64_t j = (id)[a2 allKeys];
  uint64_t v156 = [obj countByEnumeratingWithState:&v189 objects:v212 count:16];
  if (!v156) {
    goto LABEL_199;
  }
  uint64_t v154 = *(void *)v190;
LABEL_9:
  uint64_t v164 = 0;
LABEL_10:
  if (*(void *)v190 != v154) {
    objc_enumerationMutation(obj);
  }
  v12 = *(void **)(*((void *)&v189 + 1) + 8 * v164);
  uint64_t v13 = -[PFUbiquityStoreSaveSnapshot globalObjectIDFromCompressedObjectID:](v158, v12);
  v14 = (void *)v13;
  if (!v13 || (v15 = *(void **)(v13 + 48)) == 0)
  {
    if (a4) {
      v16 = (void *)a4[9];
    }
    else {
      v16 = 0;
    }
    v17 = (void *)[v16 objectForKey:v14];
    if (!v17)
    {
      uint64_t v146 = [NSString stringWithFormat:@"CoreData: Ubiquity: Could not find local URI for global ID index: %@", v12];
      v147 = (void *)MEMORY[0x1E4F1CA00];
      v210 = @"PFUbiquitySetupDoFork";
      uint64_t v211 = MEMORY[0x1E4F1CC38];
      uint64_t v148 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v211 forKeys:&v210 count:1];
      objc_exception_throw((id)[v147 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v146 userInfo:v148]);
    }
    v15 = objc_msgSend(*(id *)(a1 + 312), "managedObjectIDFromUTF8String:length:", objc_msgSend(v17, "UTF8String"), objc_msgSend(v17, "lengthOfBytesUsingEncoding:", 4));
    if (v14) {
      objc_setProperty_nonatomic(v14, v18, v15, 48);
    }
  }
  if (a4 && (uint64_t v19 = a4[11]) != 0) {
    uint64_t v20 = *(void *)(v19 + 56);
  }
  else {
    uint64_t v20 = 0;
  }
  uint64_t v21 = (void *)-[PFUbiquityTransactionHistoryCache cachedTransactionHistoryForGlobalID:](v20, (uint64_t)v14);
  if (+[PFUbiquityLogging canLogMessageAtLevel:3])
  {
    uint64_t v22 = *(void *)(a1 + 400);
    if (v22) {
      uint64_t v22 = *(void *)(v22 + 32);
    }
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nGot transaction history: %@\nFor object: %@\nObject ID: %@\nInitial KV: %@\nImport Context: %@", "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 825, a1, v21, v14, v15, *(void *)(a1 + 384), v22);
  }
  newValue = v14;
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v21 copyItems:0];
  [v23 sortUsingComparator:&__block_literal_global_26];
  v188[0] = MEMORY[0x1E4F143A8];
  v188[1] = 3221225472;
  v188[2] = __87___PFUbiquityRecordImportOperation_processObjects_withState_andImportContext_outError___block_invoke_2;
  v188[3] = &unk_1E544E8E0;
  v188[4] = a4;
  objc_msgSend(v23, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", v188));
  uint64_t v24 = [v23 count];
  LODWORD(v25) = a3;
  if (v24)
  {
    uint64_t v26 = [v23 lastObject];
    buf[0] = 0;
    uint64_t v25 = +[PFUbiquityRecordImportConflict resolvedTypeForConflictingLogType:andLatestTransactionEntry:skipObject:]((uint64_t)PFUbiquityRecordImportConflict, a3, v26, buf);
    if (buf[0])
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSkipping object: %@\nResolved type: %d / %d", "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 843, a1, v26, v25, a3);
      }

      goto LABEL_31;
    }
  }

  if (v25)
  {
    if (v25 > 2)
    {
      v171 = 0;
    }
    else
    {
      if (a4) {
        v27 = (void *)a4[10];
      }
      else {
        v27 = 0;
      }
      v171 = (NSManagedObject *)[v27 objectForKey:newValue];
      if (!v171)
      {
        v171 = (NSManagedObject *)[*(id *)(a1 + 304) existingObjectWithID:v15 error:&v193];
        if (!v171)
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Transaction log: %@\n Unable to locate updated or deleted object with ID: %@, translated from global ID: %@, error: %@\n User Info: %@", "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 883, *(void *)(a1 + 320), newValue, v12, v193, [v193 userInfo]);
          }
          if (v25 == 2)
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:3])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nObject (%@): %@ was resolved to a delete and will not be processed.", "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 887, a1, obj, newValue);
            }
          }
          else if (+[PFUbiquityLogging canLogMessageAtLevel:2])
          {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Transaction log: %@ appears an updated object: %@ was deleted.", "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 889, a1, newValue);
          }
          v171 = 0;
          LODWORD(v25) = 2;
        }
      }
    }
  }
  else
  {
    if (newValue) {
      uint64_t v28 = newValue[2];
    }
    else {
      uint64_t v28 = 0;
    }
    uint64_t v29 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 312), "managedObjectModel"), "entitiesByName"), "objectForKey:", v28);
    if (!v29)
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Transaction log: %@\n Can't find entity for name: %@ in model: %@", "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 856, *(void *)(a1 + 320), v28, [*(id *)(a1 + 312) managedObjectModel]);
      }
      goto LABEL_31;
    }
    v171 = (NSManagedObject *)[*(id *)(a1 + 304) objectRegisteredForID:v15];
    if (v171)
    {
      objc_msgSend(*(id *)(a1 + 304), "insertObject:");
    }
    else
    {
      v171 = [[NSManagedObject alloc] initWithEntity:v29 insertIntoManagedObjectContext:*(void *)(a1 + 304)];
      uint64_t v30 = *(void *)(a1 + 304);
      v31 = (void *)[MEMORY[0x1E4F1C978] arrayWithObject:v171];
    }
    LODWORD(v25) = 0;
  }
  if (![(id)a1 isCancelled])
  {
    id v153 = v15;
    __int16 v32 = objc_alloc_init(PFUbiquityTransactionEntryLight);
    uint64_t v34 = v32;
    uint64_t v35 = *(void *)(a1 + 320);
    if (v35 && (uint64_t v36 = *(void *)(v35 + 24)) != 0)
    {
      v37 = *(void **)(v36 + 32);
      if (!v32) {
        goto LABEL_60;
      }
    }
    else
    {
      v37 = 0;
      if (!v32) {
        goto LABEL_60;
      }
    }
    objc_setProperty_nonatomic(v32, v33, v37, 24);
    objc_setProperty_nonatomic(v34, v38, newValue, 8);
    globalID = v34->_globalID;
    if (globalID) {
      objc_setProperty_nonatomic(globalID, v33, v153, 48);
    }
LABEL_60:
    uint64_t v40 = *(void *)(a1 + 320);
    if (v40)
    {
      v41 = *(void **)(v40 + 24);
      if (!v34)
      {
LABEL_63:
        if (a4 && (uint64_t v42 = a4[8]) != 0) {
          uint64_t v43 = *(void *)(v42 + 120);
        }
        else {
          uint64_t v43 = 0;
        }
        [(PFUbiquityTransactionEntryLight *)v34 setTransactionNumber:v43];
        if (a4)
        {
          v45 = (void *)a4[4];
          if (!v34)
          {
LABEL_69:
            uint64_t v46 = *(void *)(a1 + 320);
            if (v46 && (uint64_t v47 = *(void *)(v46 + 72)) != 0) {
              uint64_t v48 = *(void *)(v47 + 8);
            }
            else {
              uint64_t v48 = 0;
            }
            [(PFUbiquityTransactionEntryLight *)v34 setTransactionDate:v48];
            uint64_t v50 = *(void *)(a1 + 320);
            if (v50 && (uint64_t v51 = *(void *)(v50 + 24)) != 0)
            {
              v52 = *(void **)(v51 + 40);
              if (!v34) {
                goto LABEL_76;
              }
            }
            else
            {
              v52 = 0;
              if (!v34)
              {
LABEL_76:
                if (a4 && (uint64_t v53 = a4[11]) != 0) {
                  uint64_t v54 = *(void *)(v53 + 56);
                }
                else {
                  uint64_t v54 = 0;
                }
                -[PFUbiquityTransactionHistoryCache addTransactionEntryLight:needsWrite:error:](v54, v34, 1);

                if (!v171)
                {
                  if (v25 == 2)
                  {
                    if (+[PFUbiquityLogging canLogMessageAtLevel:2])
                    {
                      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Object (%d): %@ which resolved to a delete but appears to already have been deleted from the local store.", "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 917, v24 != 0, newValue);
                    }
                    goto LABEL_31;
                  }
                  if (+[PFUbiquityLogging canLogMessageAtLevel:0])
                  {
                    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  CoreData: Ubiquity: Transaction log: %@\n Error creating object to work with (with state: %d), skipping %@, globalID: %@", "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 921, *(void *)(a1 + 320), a3, newValue, v12);
                  }
                  if (v193)
                  {
                    if (a5) {
                      *a5 = v193;
                    }
                  }
                  else
                  {
                    uint64_t v130 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
                    _NSCoreDataLog(17, v130, v131, v132, v133, v134, v135, v136, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordImportOperation.m");
                    v137 = __pflogFaultLog;
                    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 136315394;
                      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquit"
                                           "y/_PFUbiquityRecordImportOperation.m";
                      __int16 v216 = 1024;
                      int v217 = 922;
                      _os_log_fault_impl(&dword_18AB82000, v137, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
                    }
                  }
LABEL_274:
                  char v194 = 0;
                  if (v193)
                  {
                    if (a5)
                    {
                      char v127 = 0;
                      int v128 = 0;
                      *a5 = v193;
                      goto LABEL_283;
                    }
                  }
                  else
                  {
                    uint64_t v138 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
                    _NSCoreDataLog(17, v138, v139, v140, v141, v142, v143, v144, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordImportOperation.m");
                    v145 = __pflogFaultLog;
                    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 136315394;
                      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquit"
                                           "y/_PFUbiquityRecordImportOperation.m";
                      __int16 v216 = 1024;
                      int v217 = 1075;
                      _os_log_fault_impl(&dword_18AB82000, v145, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
                    }
                  }
                  char v127 = 0;
                  int v128 = 0;
                  goto LABEL_283;
                }
                if (v25 > 1)
                {
                  if (v25 == 2)
                  {
                    if ((objc_msgSend(*(id *)(a1 + 352), "containsObject:", -[NSManagedObject objectID](v171, "objectID")) & 1) == 0)objc_msgSend(*(id *)(a1 + 352), "addObject:", -[NSManagedObject objectID](v171, "objectID")); {
                    [*(id *)(a1 + 304) deleteObject:v171];
                    }
                  }
                  goto LABEL_31;
                }
                v173 = (void *)[v151 objectForKey:v12];
                if (!v173
                  && +[PFUbiquityLogging canLogMessageAtLevel:1])
                {
                  NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nGot nil content for comprssed globalID Index: %@", "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 934, a1, v12);
                }
                if (v24)
                {
                  v55 = objc_alloc_init(PFUbiquityRecordImportConflict);
                  uint64_t v57 = (uint64_t)v55;
                  uint64_t v58 = *(void *)(a1 + 320);
                  if (v58 && (uint64_t v59 = *(void *)(v58 + 72)) != 0)
                  {
                    v60 = *(void **)(v59 + 8);
                    if (v55) {
                      goto LABEL_88;
                    }
                  }
                  else
                  {
                    v60 = 0;
                    if (v55)
                    {
LABEL_88:
                      objc_setProperty_nonatomic(v55, v56, v60, 56);
                      objc_setProperty_nonatomic((id)v57, v61, v171, 16);
                      *(_DWORD *)(v57 + 48) = a3;
                    }
                  }
                  if (a4)
                  {
                    v62 = (void *)a4[4];
                    if (v57) {
                      goto LABEL_91;
                    }
                  }
                  else
                  {
                    v62 = 0;
                    if (v57) {
LABEL_91:
                    }
                      objc_setProperty_nonatomic((id)v57, v56, v62, 32);
                  }
                  if (a4)
                  {
                    v63 = (void *)a4[5];
                    if (v57) {
                      goto LABEL_94;
                    }
                  }
                  else
                  {
                    v63 = 0;
                    if (v57) {
LABEL_94:
                    }
                      objc_setProperty_nonatomic((id)v57, v56, v63, 40);
                  }
                  v64 = -[PFUbiquityTransactionLog transactionNumber](*(void **)(a1 + 320));
                  if (v57)
                  {
                    objc_setProperty_nonatomic((id)v57, v65, v64, 64);
                    objc_setProperty_nonatomic((id)v57, v66, v21, 72);
                  }
                  if (a4)
                  {
                    v67 = (void *)a4[9];
                    if (v57) {
                      goto LABEL_99;
                    }
                  }
                  else
                  {
                    v67 = 0;
                    if (v57)
                    {
LABEL_99:
                      objc_setProperty_nonatomic((id)v57, v65, v67, 80);
                      objc_setProperty_nonatomic((id)v57, v68, a4, 88);
                    }
                  }
                  id v70 = -[PFUbiquityRecordImportConflict createSnapshotFromLogContent:withTransactionLog:](v57, v173, *(void *)(a1 + 320));
                  if (v57) {
                    objc_setProperty_nonatomic((id)v57, v69, v70, 24);
                  }

                  *(void *)buf = 0;
                  if (-[PFUbiquityRecordImportConflict resolveConflict:](v57, buf))
                  {
                    if (v57) {
                      uint64_t v71 = *(void *)(v57 + 96);
                    }
                    else {
                      uint64_t v71 = 0;
                    }
                    [*(id *)(a1 + 424) addEntriesFromDictionary:v71];

                    goto LABEL_106;
                  }
                  if (+[PFUbiquityLogging canLogMessageAtLevel:1])
                  {
                    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error encountered trying to resolve conflict: %@, error: %@\n User Info: %@", "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 959, v57, *(void *)buf, [*(id *)buf userInfo]);
                  }
                  id v193 = *(id *)buf;

                  goto LABEL_274;
                }
                long long v203 = 0u;
                long long v204 = 0u;
                long long v205 = 0u;
                long long v206 = 0u;
                v73 = [(NSDictionary *)[(NSEntityDescription *)[(NSManagedObject *)v171 entity] attributesByName] allValues];
                uint64_t v74 = [(NSArray *)v73 countByEnumeratingWithState:&v203 objects:buf count:16];
                if (!v74) {
                  goto LABEL_137;
                }
                uint64_t v75 = *(void *)v204;
                while (1)
                {
                  for (uint64_t i = 0; i != v74; ++i)
                  {
                    if (*(void *)v204 != v75) {
                      objc_enumerationMutation(v73);
                    }
                    v77 = *(void **)(*((void *)&v203 + 1) + 8 * i);
                    uint64_t v78 = [v77 name];
                    v79 = (void *)[v173 valueForKey:v78];
                    id v80 = v79;
                    if (v79)
                    {
                      if ([v77 attributeType] == 1800)
                      {

                        id v80 = +[_PFRoutines retainedDecodeValue:forTransformableAttribute:]((uint64_t)_PFRoutines, (uint64_t)v79, v77);
                      }
                      if ([v77 attributeType] == 1000
                        && [v77 allowsExternalBinaryDataStorage]
                        && (uint64_t v81 = [(NSManagedObjectID *)[(NSManagedObject *)v171 objectID] persistentStore], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {

                        id v82 = [[_PFExternalReferenceData alloc] initForUbiquityDictionary:v79 store:v81];
                        id v80 = v82;
                      }
                      else
                      {
                        id v82 = v80;
                      }
                    }
                    else
                    {
                      if ([v77 isTransient]) {
                        goto LABEL_135;
                      }
                      id v82 = 0;
                    }
                    [(NSManagedObject *)v171 setValue:v82 forKey:v78];
LABEL_135:
                  }
                  uint64_t v74 = [(NSArray *)v73 countByEnumeratingWithState:&v203 objects:buf count:16];
                  if (!v74)
                  {
LABEL_137:
                    long long v201 = 0u;
                    long long v202 = 0u;
                    long long v199 = 0u;
                    long long v200 = 0u;
                    v83 = [(NSDictionary *)[(NSEntityDescription *)[(NSManagedObject *)v171 entity] relationshipsByName] allValues];
                    uint64_t v84 = [(NSArray *)v83 countByEnumeratingWithState:&v199 objects:v214 count:16];
                    if (v84)
                    {
                      uint64_t v169 = *(void *)v200;
                      v166 = v83;
                      do
                      {
                        for (uint64_t j = 0; j != v84; ++j)
                        {
                          if (*(void *)v200 != v169) {
                            objc_enumerationMutation(v166);
                          }
                          v86 = *(void **)(*((void *)&v199 + 1) + 8 * j);
                          uint64_t v87 = [v86 name];
                          v88 = (void *)[v173 valueForKey:v87];
                          if (v88)
                          {
                            id v89 = (id)[v168 objectForKey:newValue];
                            if (!v89)
                            {
                              id v89 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                              [v168 setObject:v89 forKey:newValue];
                            }
                            id v90 = (id)[v89 objectForKey:v87];
                            if (!v90)
                            {
                              id v90 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                              [v89 setObject:v90 forKey:v87];
                            }
                            if ([v86 isToMany]) {
                              id v91 = v88;
                            }
                            else {
                              id v91 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v88, 0);
                            }
                            v92 = v91;
                            long long v197 = 0u;
                            long long v198 = 0u;
                            long long v195 = 0u;
                            long long v196 = 0u;
                            uint64_t v93 = [v91 countByEnumeratingWithState:&v195 objects:v213 count:16];
                            if (v93)
                            {
                              uint64_t v94 = *(void *)v196;
                              do
                              {
                                uint64_t v95 = 0;
                                do
                                {
                                  if (*(void *)v196 != v94) {
                                    objc_enumerationMutation(v92);
                                  }
                                  if (a4) {
                                    uint64_t v96 = a4[8];
                                  }
                                  else {
                                    uint64_t v96 = 0;
                                  }
                                  objc_msgSend(v90, "addObject:", -[PFUbiquityStoreSaveSnapshot globalObjectIDFromCompressedObjectID:](v96, *(void **)(*((void *)&v195 + 1) + 8 * v95++)));
                                }
                                while (v93 != v95);
                                uint64_t v97 = [v92 countByEnumeratingWithState:&v195 objects:v213 count:16];
                                uint64_t v93 = v97;
                              }
                              while (v97);
                            }
                          }
                          else if (([v86 isTransient] & 1) == 0)
                          {
                            [(NSManagedObject *)v171 setValue:0 forKey:v87];
                          }
                        }
                        uint64_t v84 = [(NSArray *)v166 countByEnumeratingWithState:&v199 objects:v214 count:16];
                      }
                      while (v84);
                    }
                    if (+[PFUbiquityLogging canLogMessageAtLevel:3])
                    {
                      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ successfully applied changes for object with global id: %@\nObject ID: %@", "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 970, a1, newValue, v153);
                    }
LABEL_106:
                    if (a3 == 1)
                    {
                      if ((objc_msgSend(*(id *)(a1 + 344), "containsObject:", -[NSManagedObject objectID](v171, "objectID")) & 1) == 0)objc_msgSend(*(id *)(a1 + 344), "addObject:", -[NSManagedObject objectID](v171, "objectID")); {
                    }
                      }
                    else if (!a3 {
                           && (objc_msgSend(*(id *)(a1 + 336), "containsObject:", -[NSManagedObject objectID](v171, "objectID")) & 1) == 0)
                    }
                    {
                      objc_msgSend(*(id *)(a1 + 336), "addObject:", -[NSManagedObject objectID](v171, "objectID"));
                      if (a4) {
                        v72 = (void *)a4[10];
                      }
                      else {
                        v72 = 0;
                      }
                      [v72 setObject:v171 forKey:newValue];
                    }
LABEL_31:
                    if (++v164 == v156)
                    {
                      uint64_t v98 = [obj countByEnumeratingWithState:&v189 objects:v212 count:16];
                      uint64_t v156 = v98;
                      if (!v98)
                      {
LABEL_199:
                        long long v186 = 0u;
                        long long v187 = 0u;
                        long long v184 = 0u;
                        long long v185 = 0u;
                        uint64_t v99 = [v168 countByEnumeratingWithState:&v184 objects:v209 count:16];
                        if (!v99)
                        {
                          char v127 = 1;
                          int v128 = 1;
                          goto LABEL_283;
                        }
                        uint64_t v155 = v99;
                        uint64_t v157 = *(void *)v185;
                        while (2)
                        {
                          uint64_t v159 = 0;
LABEL_202:
                          if (*(void *)v185 != v157) {
                            objc_enumerationMutation(v168);
                          }
                          if (a4) {
                            v100 = (void *)a4[10];
                          }
                          else {
                            v100 = 0;
                          }
                          uint64_t v101 = *(void *)(*((void *)&v184 + 1) + 8 * v159);
                          v102 = (void *)[v100 objectForKey:v101];
                          if (v102)
                          {
LABEL_207:
                            v103 = (void *)[v168 objectForKey:v101];
                            long long v182 = 0u;
                            long long v183 = 0u;
                            long long v180 = 0u;
                            long long v181 = 0u;
                            uint64_t v104 = [v103 countByEnumeratingWithState:&v180 objects:v208 count:16];
                            if (v104)
                            {
                              id v105 = *(id *)v181;
                              v163 = v103;
                              v165 = v102;
                              id newValuea = *(id *)v181;
                              do
                              {
                                uint64_t v172 = 0;
                                id v167 = (id)v104;
                                do
                                {
                                  if (*(id *)v181 != v105) {
                                    objc_enumerationMutation(v103);
                                  }
                                  uint64_t v174 = *(void *)(*((void *)&v180 + 1) + 8 * v172);
                                  v106 = objc_msgSend(v103, "valueForKey:");
                                  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v102, "entity"), "relationshipsByName"), "objectForKey:", v174), "isToMany"))
                                  {
                                    v170 = (void *)[v102 valueForKey:v174];
                                    v107 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v106, "count"));
                                    long long v178 = 0u;
                                    long long v179 = 0u;
                                    long long v176 = 0u;
                                    long long v177 = 0u;
                                    uint64_t v108 = [v106 countByEnumeratingWithState:&v176 objects:v207 count:16];
                                    if (v108)
                                    {
                                      uint64_t v109 = *(void *)v177;
                                      do
                                      {
                                        uint64_t v110 = 0;
                                        do
                                        {
                                          if (*(void *)v177 != v109) {
                                            objc_enumerationMutation(v106);
                                          }
                                          if (a4) {
                                            v111 = (void *)a4[10];
                                          }
                                          else {
                                            v111 = 0;
                                          }
                                          uint64_t v112 = *(void *)(*((void *)&v176 + 1) + 8 * v110);
                                          uint64_t v113 = [v111 objectForKey:v112];
                                          if (v113)
                                          {
                                            [v107 addObject:v113];
                                          }
                                          else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:"))
                                          {
                                            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\n Unable to find relationship destination object: %@", "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 1038, a1, v112);
                                          }
                                          ++v110;
                                        }
                                        while (v108 != v110);
                                        uint64_t v114 = [v106 countByEnumeratingWithState:&v176 objects:v207 count:16];
                                        uint64_t v108 = v114;
                                      }
                                      while (v114);
                                    }
                                    v102 = v165;
                                    -[NSManagedObject _updateToManyRelationship:from:to:with:](v165, v174, v170, v107, v170);
                                    id v105 = newValuea;
                                    v103 = v163;
                                    uint64_t v104 = (uint64_t)v167;
                                  }
                                  else
                                  {
                                    uint64_t v115 = [v106 lastObject];
                                    if (a4) {
                                      v116 = (void *)a4[10];
                                    }
                                    else {
                                      v116 = 0;
                                    }
                                    uint64_t v117 = [v116 objectForKey:v115];
                                    if (!v117)
                                    {
                                      if (a4 && (uint64_t v118 = a4[11]) != 0) {
                                        uint64_t v119 = *(void *)(v118 + 56);
                                      }
                                      else {
                                        uint64_t v119 = 0;
                                      }
                                      uint64_t v120 = objc_msgSend((id)-[PFUbiquityTransactionHistoryCache cachedTransactionHistoryForGlobalID:](v119, v115), "lastObject");
                                      if (v120)
                                      {
                                        if (*(_DWORD *)(v120 + 16) == 2)
                                        {
                                          v121 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v102, "entity"), "relationshipsByName"), "objectForKey:", v174);
                                          if (objc_msgSend((id)objc_msgSend(v121, "inverseRelationship"), "deleteRule") == 2
                                            || ([v121 isOptional] & 1) == 0)
                                          {
                                            [*(id *)(a1 + 304) deleteObject:v102];
                                          }
                                        }
                                      }
                                    }
                                    [v102 setValue:v117 forKey:v174];
                                  }
                                  ++v172;
                                }
                                while (v172 != v104);
                                uint64_t v122 = [v103 countByEnumeratingWithState:&v180 objects:v208 count:16];
                                uint64_t v104 = v122;
                              }
                              while (v122);
                            }
                          }
                          else
                          {
                            if (a4) {
                              v123 = (void *)a4[9];
                            }
                            else {
                              v123 = 0;
                            }
                            v124 = (void *)[v123 objectForKey:v101];
                            if (v124)
                            {
                              uint64_t v125 = objc_msgSend(*(id *)(a1 + 312), "managedObjectIDFromUTF8String:length:", objc_msgSend(v124, "UTF8String"), objc_msgSend(v124, "lengthOfBytesUsingEncoding:", 4));
                              *(void *)buf = 0;
                              v102 = (void *)[*(id *)(a1 + 304) existingObjectWithID:v125 error:buf];
                              if (v102) {
                                goto LABEL_207;
                              }
                              if (+[PFUbiquityLogging canLogMessageAtLevel:0])
                              {
                                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Transaction log: %@\n Couldn't find missing object for objectID: %@", "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 1012, *(void *)(a1 + 320), v125);
                              }
                            }
                            else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
                            {
                              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Transaction log: %@\n Couldn't find missing object for objectID string: %@", "-[_PFUbiquityRecordImportOperation processObjects:withState:andImportContext:outError:]", 1004, *(void *)(a1 + 320), 0);
                            }
                          }
                          if (++v159 == v155)
                          {
                            uint64_t v126 = [v168 countByEnumeratingWithState:&v184 objects:v209 count:16];
                            char v127 = 1;
                            int v128 = 1;
                            uint64_t v155 = v126;
                            if (!v126) {
                              goto LABEL_283;
                            }
                            continue;
                          }
                          goto LABEL_202;
                        }
                      }
                      goto LABEL_9;
                    }
                    goto LABEL_10;
                  }
                }
              }
            }
            objc_setProperty_nonatomic(v34, v49, v52, 32);
            v34->_transactionType = v25;
            goto LABEL_76;
          }
        }
        else
        {
          v45 = 0;
          if (!v34) {
            goto LABEL_69;
          }
        }
        objc_setProperty_nonatomic(v34, v44, v45, 56);
        goto LABEL_69;
      }
    }
    else
    {
      v41 = 0;
      if (!v34) {
        goto LABEL_63;
      }
    }
    objc_setProperty_nonatomic(v34, v33, v41, 48);
    goto LABEL_63;
  }
  int v128 = 0;
  char v127 = 1;
  char v194 = 1;
LABEL_283:

  char v129 = v194;
  if (v128) {
    char v129 = v127;
  }
  return v129 & 1;
}

- (void)main
{
  uint64_t v241 = *MEMORY[0x1E4F143B8];
  id v203 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  self->_success = 1;
  id v234 = 0;
  if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@: Beginning parse of log file: %@", "-[_PFUbiquityRecordImportOperation main]", 257, self, self->_transactionLog);
  }
  if ([(_PFUbiquityRecordImportOperation *)self isCancelled])
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Aborting cancelled operation: %@", "-[_PFUbiquityRecordImportOperation main]", 259, self);
    }
    return;
  }
  self;
  transactionLog = self->_transactionLog;
  if (transactionLog && (transactionLogLocation = transactionLog->_transactionLogLocation) != 0) {
    uint64_t storeName = (uint64_t)transactionLogLocation->_storeName;
  }
  else {
    uint64_t storeName = 0;
  }
  uint64_t v6 = (PFUbiquitySwitchboardEntry *)-[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, storeName, (uint64_t)self->super._localPeerID);
  self->_entry = v6;
  if (!v6)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\n Cancelling due to missing switchboard entry", "-[_PFUbiquityRecordImportOperation main]", 275, self);
    }
    [(_PFUbiquityRecordImportOperation *)self cancel];
    long long v205 = 0;
    goto LABEL_304;
  }
  if ([(_PFUbiquityRecordImportOperation *)self isCancelled])
  {
    long long v205 = 0;
    goto LABEL_304;
  }
  self->_psc = [(NSPersistentStore *)self->super._store persistentStoreCoordinator];
  char v7 = -[PFUbiquityTransactionLog loadComparisonMetadataWithError:]((uint64_t)self->_transactionLog, &v234);
  self->_success = v7;
  if (v7)
  {
    long long v205 = (void *)[objc_alloc(NSNumber) initWithInt:0];
    self;
    uint64_t v8 = self->_transactionLog;
    if (v8)
    {
      uint64_t v9 = v8->_transactionLogLocation;
      if (v9)
      {
        uint64_t v10 = v9->_storeName;
        if (v9->_ubiquityLocationType != 1) {
          uint64_t v9 = v9->_ubiquityRootLocation;
        }
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v9 = 0;
    }
    uint64_t v11 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, self->super._localPeerID, v10, v9, &v234);
    v12 = self->_transactionLog;
    if (v12 && (uint64_t v13 = v12->_transactionLogLocation) != 0)
    {
      v14 = v13->_storeName;
      if (v11)
      {
LABEL_23:
        id v15 = v11[1];
        goto LABEL_24;
      }
    }
    else
    {
      v14 = 0;
      if (v11) {
        goto LABEL_23;
      }
    }
    id v15 = 0;
LABEL_24:
    id newValue = (id)+[PFUbiquityStoreMetadata metadataForStoreWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, v14, v15);
    importContext = self->_importContext;
    if (importContext)
    {
      objc_setProperty_nonatomic(importContext, v16, v11, 8);
      uint64_t v19 = self->_importContext;
      if (v19) {
        objc_setProperty_nonatomic(v19, v18, newValue, 16);
      }
LABEL_40:

      selfa = self->_importContext;
      uint64_t v28 = self->_transactionLog;
      if (v28 && (uint64_t v29 = v28->_transactionLogLocation) != 0) {
        exportingPeerID = v29->_exportingPeerID;
      }
      else {
        exportingPeerID = 0;
      }
      -[PFUbiquityImportContext setExportingPeerID:](selfa, exportingPeerID);
      __int16 v32 = self->_transactionLog;
      if (selfa)
      {
        objc_setProperty_nonatomic(selfa, v31, v32, 56);
        __int16 v32 = self->_transactionLog;
      }
      if (v32)
      {
        int v33 = v32->_transactionLogLocation;
        if (v33) {
          int v33 = (PFUbiquityLocation *)v33->_storeName;
        }
        saveSnapshot = v32->_saveSnapshot;
        if (saveSnapshot) {
          __int16 v32 = (PFUbiquityTransactionLog *)[(NSMutableDictionary *)saveSnapshot->_storeNameToStoreSaveSnapshots objectForKey:v33];
        }
        else {
          __int16 v32 = 0;
        }
      }
      if (selfa)
      {
        objc_setProperty_nonatomic(selfa, v31, v32, 64);
        storeSaveSnapshot = selfa->_storeSaveSnapshot;
      }
      else
      {
        storeSaveSnapshot = 0;
      }
      if (([(_PFUbiquityRecordImportOperation *)self isCancelled] & 1) == 0)
      {
        if (selfa && (cacheWrapper = selfa->_cacheWrapper) != 0) {
          uint64_t transactionHistoryCache = (uint64_t)cacheWrapper->_transactionHistoryCache;
        }
        else {
          uint64_t transactionHistoryCache = 0;
        }
        int v37 = -[PFUbiquityTransactionHistoryCache cacheTransactionHistory:](transactionHistoryCache, &v234);
        self->_success = v37;
        if (v37)
        {
          self->_success = -[PFUbiquityTransactionLog loadImportMetadataWithError:]((uint64_t)self->_transactionLog, &v234);
          v39 = self->_transactionLog;
          uint64_t v40 = v39 ? v39->_knowledgeVector : 0;
          v41 = self->_importContext;
          if (v41) {
            objc_setProperty_nonatomic(v41, v38, v40, 32);
          }
        }
      }
      goto LABEL_61;
    }
    uint64_t v20 = [[PFUbiquityImportContext alloc] initWithStack:v11 andStoreMetadata:newValue];
    self->_importContext = v20;
    entry = self->_entry;
    if (entry && (uint64_t v23 = entry->_metadata) != 0)
    {
      baselineHeuristics = v23->_baselineHeuristics;
      if (!v20)
      {
LABEL_35:
        if (entry && (metadata = entry->_metadata) != 0) {
          uint64_t v26 = metadata->_cacheWrapper;
        }
        else {
          uint64_t v26 = 0;
        }
        v27 = self->_importContext;
        if (v27) {
          objc_setProperty_nonatomic(v27, v21, v26, 88);
        }
        goto LABEL_40;
      }
    }
    else
    {
      baselineHeuristics = 0;
      if (!v20) {
        goto LABEL_35;
      }
    }
    objc_setProperty_nonatomic(v20, v21, baselineHeuristics, 96);
    entry = self->_entry;
    goto LABEL_35;
  }
  long long v205 = 0;
  selfa = 0;
  if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error loading comparison metadata for transaction log: %@", "-[_PFUbiquityRecordImportOperation main]", 291, self->_transactionLog);
  }
  id newValue = 0;
  uint64_t v11 = 0;
  storeSaveSnapshot = 0;
LABEL_61:
  if ([(_PFUbiquityRecordImportOperation *)self isCancelled]) {
    goto LABEL_304;
  }
  if (!self->_success) {
    goto LABEL_229;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    psc = self->_psc;
    v233[0] = MEMORY[0x1E4F143A8];
    v233[1] = 3221225472;
    v233[2] = __40___PFUbiquityRecordImportOperation_main__block_invoke;
    v233[3] = &unk_1E544B868;
    v233[4] = self;
    [(NSPersistentStoreCoordinator *)psc performBlockAndWait:v233];
    initialStoreKnowledgeVector = self->_initialStoreKnowledgeVector;
    v45 = self->_transactionLog;
    if (v45 && (uint64_t v46 = v45->_transactionLogLocation) != 0)
    {
      uint64_t v47 = v46->_exportingPeerID;
      if (!initialStoreKnowledgeVector) {
        goto LABEL_82;
      }
    }
    else
    {
      uint64_t v47 = 0;
      if (!initialStoreKnowledgeVector) {
        goto LABEL_82;
      }
    }
    id v48 = [(NSDictionary *)initialStoreKnowledgeVector->_kv objectForKey:v47];
    if (v48
      && [v48 compare:-[PFUbiquityTransactionLog transactionNumber](&self->_transactionLog->super.isa)] != -1)
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Ignoring log: %@\nThe local database has already seen this transaction log: %@", "-[_PFUbiquityRecordImportOperation main]", 370, self->_transactionLog, self->_initialStoreKnowledgeVector);
      }
      id v49 = [(_PFUbiquityRecordImportOperation *)self retainedDelegate];
      uint64_t v50 = v49;
      if (v49) {
        [v49 operationDidFinish:self];
      }

      goto LABEL_304;
    }
LABEL_82:
    if (selfa) {
      objc_setProperty_nonatomic(selfa, v43, self->_initialStoreKnowledgeVector, 40);
    }
    uint64_t v51 = (PFUbiquityKnowledgeVector *)[(PFUbiquityKnowledgeVector *)self->_initialStoreKnowledgeVector copy];
    self->_updatedStoreKnowledgeVector = v51;
    v52 = self->_transactionLog;
    if (v52) {
      uint64_t knowledgeVector = (uint64_t)v52->_knowledgeVector;
    }
    else {
      uint64_t knowledgeVector = 0;
    }
    -[PFUbiquityKnowledgeVector updateWithKnowledgeVector:]((uint64_t)v51, knowledgeVector);
    uint64_t v54 = self->_importContext;
    if (v54)
    {
      v55 = v54->_cacheWrapper;
      if (v55)
      {
        v56 = v55->_transactionHistoryCache;
        char v57 = 0;
        if (v56) {
          cacheKV = v56->_cacheKV;
        }
        else {
          cacheKV = 0;
        }
LABEL_90:
        int v60 = [(PFUbiquityKnowledgeVector *)cacheKV isEqual:self->_initialStoreKnowledgeVector];
        if ((v57 & 1) != 0 || (SEL v61 = v55->_transactionHistoryCache) == 0) {
          minCacheKV = 0;
        }
        else {
          minCacheKV = v61->_minCacheKV;
        }
        v63 = self->_importContext;
        if (v63 && (v64 = v63->_cacheWrapper) != 0)
        {
          id Property = objc_getProperty(v64, v59, 72, 1);
          SEL v66 = Property;
          BOOL v67 = Property == 0;
          if (v60 && Property && (-[PFUbiquityKnowledgeVector isZeroVector]((uint64_t)Property) & 1) == 0) {
            int v60 = [v66 isEqual:minCacheKV];
          }
          if (v60) {
            goto LABEL_100;
          }
        }
        else
        {
          if (v60)
          {
LABEL_100:
            if (+[PFUbiquityLogging canLogMessageAtLevel:3])
            {
              if (v57)
              {
                SEL v68 = 0;
              }
              else
              {
                SEL v68 = v55->_transactionHistoryCache;
                if (v68) {
                  SEL v68 = (PFUbiquityTransactionHistoryCache *)v68->_cacheKV;
                }
              }
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ - Cache KV: %@ matches initial KV: %@", "-[_PFUbiquityRecordImportOperation main]", 402, self, v68, self->_initialStoreKnowledgeVector);
            }
            goto LABEL_105;
          }
          SEL v66 = 0;
          BOOL v67 = 1;
        }
        if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ - Knowledge Vector mismatch, reloading cache", "-[_PFUbiquityRecordImportOperation main]", 404, self);
        }
        if (v57) {
          uint64_t v84 = 0;
        }
        else {
          uint64_t v84 = (uint64_t)v55->_transactionHistoryCache;
        }
        -[PFUbiquityTransactionHistoryCache purgeCacheAndWritePendingEntries:error:](v84, 0);
        v85 = -[_PFUbiquityStack createMetadataStoreKnowledgeVector:]((uint64_t)v11, (uint64_t *)&v234);
        v86 = -[_PFUbiquityStack createMinMetadataStoreKnowledgeVector:]((uint64_t)v11, (uint64_t *)&v234);
        if (v85)
        {
          unsigned int v87 = -[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:]((id *)&v85->super.isa, (uint64_t)self->_initialStoreKnowledgeVector);
          if ((v87 | v67) & 1) != 0 || (-[PFUbiquityKnowledgeVector isZeroVector]((uint64_t)v66))
          {
            if (!v87) {
              goto LABEL_173;
            }
          }
          else if ([v66 isEqual:v86])
          {
            goto LABEL_173;
          }
        }
        if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nMetadata store doesn't match local store: (%@:%@)\n", "-[_PFUbiquityRecordImportOperation main]", 426, self, v85, self->_initialStoreKnowledgeVector);
        }
        if (selfa)
        {
          objc_setProperty_nonatomic(selfa, v88, 0, 8);
          objc_setProperty_nonatomic(selfa, v89, 0, 16);
        }
        id v90 = [[PFUbiquityStoreMetadataMedic alloc] initWithStore:self->super._store localPeerID:self->super._localPeerID andUbiquityRootLocation:self->super._ubiquityRootLocation];
        self->_success = -[PFUbiquityStoreMetadataMedic recoverMetadataWithError:]((void **)&v90->super.isa, &v234);

        if (!self->_success)
        {
LABEL_173:

          if (v57) {
            uint64_t v101 = 0;
          }
          else {
            uint64_t v101 = (uint64_t)v55->_transactionHistoryCache;
          }
          int v102 = -[PFUbiquityTransactionHistoryCache cacheTransactionHistory:](v101, &v234);
          self->_success = v102;
          if (v102) {
            goto LABEL_106;
          }
LABEL_176:
          if (self->_success && ([(_PFUbiquityRecordImportOperation *)self isCancelled] & 1) == 0)
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:2])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Changes applied for transaction log content, managed object context changes: \n\tinserted: %@\n\tupdated: %@\n\tdeleted: %@.", "-[_PFUbiquityRecordImportOperation main]", 491, [(NSManagedObjectContext *)self->_moc insertedObjects], [(NSManagedObjectContext *)self->_moc updatedObjects], [(NSManagedObjectContext *)self->_moc deletedObjects]);
            }
            v103 = self->_transactionLog;
            if (v103 && (uint64_t v104 = v103->_transactionLogLocation) != 0) {
              id v105 = v104->_exportingPeerID;
            }
            else {
              id v105 = 0;
            }
            if (selfa && (stacuint64_t k = selfa->_stack) != 0) {
              metadataMOC = stack->_metadataMOC;
            }
            else {
              metadataMOC = 0;
            }
            uint64_t v108 = +[PFUbiquityPeerState peerStateForStoreName:andPeerID:inManagedObjectContext:createIfMissing:]((uint64_t)PFUbiquityPeerState, self->super._storeName, v105, metadataMOC, 1);
            uint64_t v109 = v108;
            if (v108)
            {
              if (storeSaveSnapshot) {
                transactionNumber = storeSaveSnapshot->_transactionNumber;
              }
              else {
                transactionNumber = 0;
              }
              [(PFUbiquityPeerState *)v108 setTransactionNumber:transactionNumber];
              v111 = self->_transactionLog;
              if (v111) {
                uint64_t v112 = (uint64_t)v111->_transactionLogLocation;
              }
              else {
                uint64_t v112 = 0;
              }
              uint64_t v113 = (void *)-[PFUbiquityLocation createFullURL](v112);
              -[PFUbiquityPeerState setLastProcessedTransactionLogURL:](v109, "setLastProcessedTransactionLogURL:", [v113 absoluteString]);

              uint64_t v114 = (void *)[(PFUbiquityPeerState *)v109 peer];
              uint64_t v115 = (void *)MEMORY[0x1E4F1CA48];
              updatedStoreKnowledgeVector = self->_updatedStoreKnowledgeVector;
              if (updatedStoreKnowledgeVector) {
                uint64_t v117 = [(NSDictionary *)updatedStoreKnowledgeVector->_kv allKeys];
              }
              else {
                uint64_t v117 = 0;
              }
              uint64_t v118 = (void *)[v115 arrayWithArray:v117];
              long long v223 = 0u;
              long long v224 = 0u;
              long long v221 = 0u;
              long long v222 = 0u;
              uint64_t v119 = (void *)[v114 remoteStates];
              uint64_t v120 = [v119 countByEnumeratingWithState:&v221 objects:v238 count:16];
              if (v120)
              {
                uint64_t v121 = *(void *)v222;
                do
                {
                  uint64_t v122 = 0;
                  do
                  {
                    if (*(void *)v222 != v121) {
                      objc_enumerationMutation(v119);
                    }
                    v123 = *(void **)(*((void *)&v221 + 1) + 8 * v122);
                    objc_msgSend(v118, "removeObject:", objc_msgSend(v123, "peerID"));
                    v124 = self->_updatedStoreKnowledgeVector;
                    uint64_t v125 = [v114 peerKey];
                    if (!v124 || (uint64_t v126 = [(NSDictionary *)v124->_kv objectForKey:v125]) == 0)
                    {
                      if (storeSaveSnapshot) {
                        uint64_t v126 = (uint64_t)storeSaveSnapshot->_transactionNumber;
                      }
                      else {
                        uint64_t v126 = 0;
                      }
                    }
                    [v123 setTransactionNumber:v126];
                    ++v122;
                  }
                  while (v120 != v122);
                  uint64_t v127 = [v119 countByEnumeratingWithState:&v221 objects:v238 count:16];
                  uint64_t v120 = v127;
                }
                while (v127);
              }
              long long v219 = 0u;
              long long v220 = 0u;
              long long v217 = 0u;
              long long v218 = 0u;
              uint64_t v128 = [v118 countByEnumeratingWithState:&v217 objects:v237 count:16];
              if (v128)
              {
                uint64_t v129 = *(void *)v218;
                do
                {
                  uint64_t v130 = 0;
                  do
                  {
                    if (*(void *)v218 != v129) {
                      objc_enumerationMutation(v118);
                    }
                    uint64_t v131 = self->_transactionLog;
                    if (v131 && (uint64_t v132 = v131->_transactionLogLocation) != 0) {
                      uint64_t v133 = v132->_exportingPeerID;
                    }
                    else {
                      uint64_t v133 = 0;
                    }
                    uint64_t v134 = *(void **)(*((void *)&v217 + 1) + 8 * v130);
                    if (([v134 isEqualToString:v133] & 1) == 0)
                    {
                      uint64_t v135 = self->_updatedStoreKnowledgeVector;
                      if (v135) {
                        uint64_t v136 = [(NSDictionary *)v135->_kv objectForKey:v134];
                      }
                      else {
                        uint64_t v136 = 0;
                      }
                      v137 = [PFUbiquityRemotePeerState alloc];
                      uint64_t v138 = [newValue ubiquityName];
                      if (selfa && (uint64_t v139 = selfa->_stack) != 0) {
                        uint64_t v140 = v139->_metadataMOC;
                      }
                      else {
                        uint64_t v140 = 0;
                      }
                      uint64_t v141 = [(PFUbiquityRemotePeerState *)v137 initWithStoreName:v138 andRemotePeerID:v134 insertIntoManagedObjectContext:v140];
                      [(PFUbiquityRemotePeerState *)v141 setTransactionNumber:v136];
                      [(PFUbiquityRemotePeerState *)v141 setPeer:v114];
                      -[PFUbiquityRemotePeerState setStoreName:](v141, "setStoreName:", [newValue ubiquityName]);
                    }
                    ++v130;
                  }
                  while (v128 != v130);
                  uint64_t v142 = [v118 countByEnumeratingWithState:&v217 objects:v237 count:16];
                  uint64_t v128 = v142;
                }
                while (v142);
              }
            }
            else
            {
              self->_success = 0;
              uint64_t v143 = [NSString stringWithFormat:@"Error encountered while importing transaction log at URL: %@, an error occurred saving changes to the persistent store mutated during the import process.", self->_transactionLog];
              id v144 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v145 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v143, @"reason", 0);
              id v234 = (id)[v144 initWithDomain:*MEMORY[0x1E4F281F8] code:134302 userInfo:v145];
            }
          }
          goto LABEL_229;
        }
        self;
        id v91 = self->_transactionLog;
        if (v91)
        {
          v92 = v91->_transactionLogLocation;
          if (v92)
          {
            uint64_t v93 = v92->_storeName;
            if (v92->_ubiquityLocationType != 1) {
              v92 = v92->_ubiquityRootLocation;
            }
          }
          else
          {
            uint64_t v93 = 0;
          }
        }
        else
        {
          uint64_t v93 = 0;
          v92 = 0;
        }
        uint64_t v94 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, self->super._localPeerID, v93, v92, &v234);
        uint64_t v95 = self->_transactionLog;
        if (v95 && (uint64_t v96 = v95->_transactionLogLocation) != 0)
        {
          uint64_t v97 = v96->_storeName;
          if (v94)
          {
LABEL_169:
            id v98 = v94[1];
LABEL_170:
            id newValue = (id)+[PFUbiquityStoreMetadata metadataForStoreWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, v97, v98);
            if (selfa)
            {
              objc_setProperty_nonatomic(selfa, v99, v94, 8);
              objc_setProperty_nonatomic(selfa, v100, newValue, 16);
            }

            goto LABEL_173;
          }
        }
        else
        {
          uint64_t v97 = 0;
          if (v94) {
            goto LABEL_169;
          }
        }
        id v98 = 0;
        goto LABEL_170;
      }
    }
    else
    {
      v55 = 0;
    }
    cacheKV = 0;
    char v57 = 1;
    goto LABEL_90;
  }
LABEL_105:
  if (!self->_success) {
    goto LABEL_176;
  }
LABEL_106:
  if (([(_PFUbiquityRecordImportOperation *)self isCancelled] & 1) != 0
    || (!selfa || (v69 = selfa->_stack) == 0 ? (id v70 = 0) : (id v70 = v69->_metadataMOC),
        [(NSManagedObjectContext *)v70 persistentStoreCoordinator]))
  {
    if (!self->_success) {
      goto LABEL_229;
    }
    if ([(_PFUbiquityRecordImportOperation *)self isCancelled]) {
      goto LABEL_176;
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  About to apply changes from log contents.", "-[_PFUbiquityRecordImportOperation main]", 467);
    }
    int v71 = -[_PFUbiquityRecordImportOperation applyChangesFromStoreSaveSnapshot:withImportContext:withError:]((uint64_t)self, storeSaveSnapshot, selfa, &v234);
    self->_success = v71;
    if (v71)
    {
      long long v231 = 0u;
      long long v232 = 0u;
      long long v229 = 0u;
      long long v230 = 0u;
      v72 = (void *)[(NSMutableDictionary *)self->_relationshipsToObjectIDsToCheck allKeys];
      uint64_t v73 = [v72 countByEnumeratingWithState:&v229 objects:v240 count:16];
      if (v73)
      {
        obuint64_t j = v72;
        uint64_t v199 = *(void *)v230;
        do
        {
          uint64_t v74 = 0;
          uint64_t v200 = v73;
          do
          {
            if (*(void *)v230 != v199) {
              objc_enumerationMutation(obj);
            }
            uint64_t v75 = *(void *)(*((void *)&v229 + 1) + 8 * v74);
            v76 = (void *)[(NSMutableDictionary *)self->_relationshipsToObjectIDsToCheck objectForKey:v75];
            uint64_t v202 = v74;
            long long v227 = 0u;
            long long v228 = 0u;
            long long v225 = 0u;
            long long v226 = 0u;
            uint64_t v77 = [v76 countByEnumeratingWithState:&v225 objects:v239 count:16];
            if (v77)
            {
              uint64_t v78 = *(void *)v226;
              do
              {
                for (uint64_t i = 0; i != v77; ++i)
                {
                  if (*(void *)v226 != v78) {
                    objc_enumerationMutation(v76);
                  }
                  id v80 = [(NSManagedObjectContext *)self->_moc objectRegisteredForID:*(void *)(*((void *)&v225 + 1) + 8 * i)];
                  uint64_t v81 = v80;
                  if (v80
                    && ![(NSManagedObject *)v80 isDeleted]
                    && ![(NSManagedObject *)v81 valueForKey:v75])
                  {
                    if (+[PFUbiquityLogging canLogMessageAtLevel:2])
                    {
                      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nDeleting conflict loser because it was orphaned (%@): %@", "-[_PFUbiquityRecordImportOperation main]", 481, self, v75, v81);
                    }
                    [(NSManagedObjectContext *)self->_moc deleteObject:v81];
                  }
                }
                uint64_t v77 = [v76 countByEnumeratingWithState:&v225 objects:v239 count:16];
              }
              while (v77);
            }
            uint64_t v74 = v202 + 1;
          }
          while (v202 + 1 != v200);
          uint64_t v73 = [obj countByEnumeratingWithState:&v229 objects:v240 count:16];
        }
        while (v73);
      }
      goto LABEL_176;
    }
  }
  else
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  import operation's context lost its stack's managedobjectcontext", "-[_PFUbiquityRecordImportOperation main]", 460);
    }
    id v82 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"import operation's context lost its stack" forKey:@"reason"];
    id v234 = (id)[v82 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v83];
    self->_success = 0;
  }
LABEL_229:
  if (([(_PFUbiquityRecordImportOperation *)self isCancelled] & 1) == 0)
  {
    if (!self->_success) {
      goto LABEL_240;
    }
    if (![(NSArray *)[(NSPersistentStoreCoordinator *)[(NSManagedObjectContext *)self->_moc persistentStoreCoordinator] persistentStores] count])
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  import operation's context lost its stack's managedobjectcontext", "-[_PFUbiquityRecordImportOperation main]", 553);
      }
      goto LABEL_239;
    }
    if (!self->_success) {
      goto LABEL_240;
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", self, sel_respondToStoreTransactionStateChangeNotification_, @"_NSSQLCoreTransactionStateChangeNotification", self->super._store);
    if (([(_PFUbiquityRecordImportOperation *)self isCancelled] & 1) == 0)
    {
      id v216 = 0;
      BOOL v146 = [(NSManagedObjectContext *)self->_moc save:&v216];
      self->_success = v146;
      if (v146)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSuccessfully wrote changes.", "-[_PFUbiquityRecordImportOperation main]", 574, self);
        }
      }
      else if ([v216 code] == 134304)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Import operation: %@\nWas beat to the database, rolling back and retrying later.", "-[_PFUbiquityRecordImportOperation main]", 577, self);
        }
        id v234 = v216;
        self->_transactionDidRollbacuint64_t k = 1;
      }
      else
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error saving managed object context changes for transaction log: %@\nError: %@\n User Info: %@\n Managed Object Context Changes, inserted: %@\nupdated: %@\ndeleted: %@", "-[_PFUbiquityRecordImportOperation main]", 581, self->_transactionLog, v216, [v216 userInfo], -[NSManagedObjectContext insertedObjects](self->_moc, "insertedObjects"), -[NSManagedObjectContext updatedObjects](self->_moc, "updatedObjects"), -[NSManagedObjectContext deletedObjects](self->_moc, "deletedObjects"));
        }
        uint64_t v172 = [NSString stringWithFormat:@"Error encountered while importing transaction log at URL: %@, an error occurred saving changes to the persistent store mutated during the import process.", self->_transactionLog];
        if ([v216 code] == 19
          && (v173 = (void *)[v216 domain],
              ([v173 isEqualToString:*MEMORY[0x1E4F281F8]] & 1) != 0)
          || [v216 code] == 1555
          && (uint64_t v174 = (void *)[v216 domain],
              [v174 isEqualToString:*MEMORY[0x1E4F281F8]]))
        {
          v175 = [(NSPersistentStore *)self->super._store persistentStoreCoordinator];
          v215[0] = MEMORY[0x1E4F143A8];
          v215[1] = 3221225472;
          v215[2] = __40___PFUbiquityRecordImportOperation_main__block_invoke_2;
          v215[3] = &unk_1E544B868;
          v215[4] = self;
          [(NSPersistentStoreCoordinator *)v175 performBlockAndWait:v215];
        }
        if (v216)
        {
          id v176 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v177 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v216, *MEMORY[0x1E4F28A50], v172, @"reason", 0);
        }
        else
        {
          id v176 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v177 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v172, @"reason", 0);
        }
        id v234 = (id)[v176 initWithDomain:*MEMORY[0x1E4F281F8] code:134302 userInfo:v177];
      }
      if (!self->_success) {
        goto LABEL_240;
      }
      if (selfa && (long long v181 = selfa->_stack) != 0) {
        long long v182 = v181->_metadataMOC;
      }
      else {
        long long v182 = 0;
      }
      if ([(NSArray *)[(NSPersistentStoreCoordinator *)[(NSManagedObjectContext *)v182 persistentStoreCoordinator] persistentStores] count])
      {
        if (self->_success)
        {
          id v216 = 0;
          if (+[PFUbiquityLogging canLogMessageAtLevel:2])
          {
            if (selfa && (long long v183 = selfa->_stack) != 0) {
              long long v184 = v183->_metadataMOC;
            }
            else {
              long long v184 = 0;
            }
            uint64_t v185 = [(NSManagedObjectContext *)v184 insertedObjects];
            if (selfa && (long long v186 = selfa->_stack) != 0) {
              long long v187 = v186->_metadataMOC;
            }
            else {
              long long v187 = 0;
            }
            uint64_t v188 = [(NSManagedObjectContext *)v187 updatedObjects];
            if (selfa && (long long v189 = selfa->_stack) != 0) {
              long long v190 = v189->_metadataMOC;
            }
            else {
              long long v190 = 0;
            }
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  About to save stack updates, metadata moc changes: \n\tinserted: %@\n\tupdated: %@\n\tdeleted: %@.", "-[_PFUbiquityRecordImportOperation main]", 620, v185, v188, [(NSManagedObjectContext *)v190 deletedObjects]);
          }
          if (selfa && (long long v191 = selfa->_stack) != 0) {
            long long v192 = v191->_metadataMOC;
          }
          else {
            long long v192 = 0;
          }
          BOOL v193 = [(NSManagedObjectContext *)v192 save:&v216];
          self->_success = v193;
          if (v193)
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:3])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSuccessfully wrote metadata changes.", "-[_PFUbiquityRecordImportOperation main]", 623, self);
            }
            if (selfa && (char v194 = selfa->_cacheWrapper) != 0) {
              uint64_t v195 = (uint64_t)v194->_transactionHistoryCache;
            }
            else {
              uint64_t v195 = 0;
            }
            if (!-[PFUbiquityTransactionHistoryCache writePendingEntries:](v195, &v216)
              && +[PFUbiquityLogging canLogMessageAtLevel:1])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError writing pending entries: %@", "-[_PFUbiquityRecordImportOperation main]", 628, self, v216);
            }
          }
          else
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:0])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error updating peer metadata during import of log file: %@ error: %@\n User Info: %@\n", "-[_PFUbiquityRecordImportOperation main]", 632, self->_transactionLog, v216, [v216 userInfo]);
            }
            long long v196 = (void *)MEMORY[0x1E4F28C58];
            if (v216) {
              uint64_t v197 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F28A50], 0);
            }
            else {
              uint64_t v197 = 0;
            }
            id v234 = (id)[v196 errorWithDomain:*MEMORY[0x1E4F281F8] code:134321 userInfo:v197];
          }
LABEL_247:
          if (self->_success)
          {
            v151 = self->_transactionLog;
            if (v151 && (v152 = v151->_transactionLogLocation) != 0) {
              id v153 = v152->_exportingPeerID;
            }
            else {
              id v153 = 0;
            }
            if ([(NSString *)v153 isEqualToString:self->super._localPeerID])
            {
              id v154 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              id v155 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              long long v213 = 0u;
              long long v214 = 0u;
              long long v211 = 0u;
              long long v212 = 0u;
              insertedObjectIDs = self->_insertedObjectIDs;
              uint64_t v157 = [(NSMutableSet *)insertedObjectIDs countByEnumeratingWithState:&v211 objects:v236 count:16];
              if (v157)
              {
                uint64_t v158 = *(void *)v212;
                do
                {
                  for (uint64_t j = 0; j != v157; ++j)
                  {
                    if (*(void *)v212 != v158) {
                      objc_enumerationMutation(insertedObjectIDs);
                    }
                    v160 = *(void **)(*((void *)&v211 + 1) + 8 * j);
                    uint64_t v161 = [v160 entity];
                    if (([v154 containsObject:v161] & 1) == 0) {
                      [v154 addObject:v161];
                    }
                    uint64_t v162 = [v160 persistentStore];
                    if (([v155 containsObject:v162] & 1) == 0) {
                      [v155 addObject:v162];
                    }
                  }
                  uint64_t v157 = [(NSMutableSet *)insertedObjectIDs countByEnumeratingWithState:&v211 objects:v236 count:16];
                }
                while (v157);
              }
              long long v209 = 0u;
              long long v210 = 0u;
              long long v207 = 0u;
              long long v208 = 0u;
              uint64_t v163 = [v155 countByEnumeratingWithState:&v207 objects:v235 count:16];
              if (v163)
              {
                uint64_t v164 = *(void *)v208;
                do
                {
                  for (uint64_t k = 0; k != v163; ++k)
                  {
                    if (*(void *)v208 != v164) {
                      objc_enumerationMutation(v155);
                    }
                    v166 = *(void **)(*((void *)&v207 + 1) + 8 * k);
                    if (objc_msgSend((id)objc_msgSend(v166, "type"), "isEqualToString:", @"SQLite"))
                    {
                      if (+[PFUbiquityLogging canLogMessageAtLevel:3])
                      {
                        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Executing SQL hack to fix primary key issue in SQLite database in import operation: %@", "-[_PFUbiquityRecordImportOperation main]", 667, self);
                      }
                      if (+[PFUbiquityLogging canLogMessageAtLevel:3])
                      {
                        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  About to issue update command to primary key table for store: %@", "-[_PFUbiquityRecordImportOperation main]", 668, v166);
                      }
                      -[NSSQLCore recomputePrimaryKeyMaxForEntities:](v166, v154);
                    }
                  }
                  uint64_t v163 = [v155 countByEnumeratingWithState:&v207 objects:v235 count:16];
                }
                while (v163);
              }
            }
          }
          if (([(_PFUbiquityRecordImportOperation *)self isCancelled] & 1) == 0)
          {
            if (self->_success)
            {
              id v167 = self->_entry;
              if (v167 && (id v168 = v167->_metadata) != 0) {
                uint64_t importer = (uint64_t)v168->_importer;
              }
              else {
                uint64_t importer = 0;
              }
              -[_PFUbiquityRecordsImporter requestBaselineRollForStore:](importer, (uint64_t)self->super._store);
            }
            if (([(_PFUbiquityRecordImportOperation *)self isCancelled] & 1) == 0)
            {
              id v170 = [(_PFUbiquityRecordImportOperation *)self retainedDelegate];
              v171 = v170;
              if (v170)
              {
                if (self->_success)
                {
                  [v170 operationDidFinish:self];
                }
                else if (self->_transactionDidRollback)
                {
                  [v170 operationWasInterruptedDuringImport:self];
                }
                else
                {
                  -[_PFUbiquityRecordImportOperation notifyDelegateOfError:](self, (uint64_t)v234);
                }
              }
            }
          }
          goto LABEL_304;
        }
LABEL_240:
        if (self->_transactionDidRollback
          && +[PFUbiquityLogging canLogMessageAtLevel:1])
        {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Rolling back metadata changes due to rolled back transaction: %@", "-[_PFUbiquityRecordImportOperation main]", 637, self);
        }
        if (selfa && (v149 = selfa->_stack) != 0) {
          v150 = v149->_metadataMOC;
        }
        else {
          v150 = 0;
        }
        [(NSManagedObjectContext *)v150 rollback];
        goto LABEL_247;
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  import operation's context lost its stack's managedobjectcontext", "-[_PFUbiquityRecordImportOperation main]", 610);
      }
LABEL_239:
      v147 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v148 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"import operation's context lost its stack" forKey:@"reason"];
      id v234 = (id)[v147 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v148];
      self->_success = 0;
      goto LABEL_240;
    }
  }
LABEL_304:
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);

  self->_entry = 0;
  self->_transactionDidRollbacuint64_t k = 0;

  self->_initialStoreKnowledgeVector = 0;
  self->_updatedStoreKnowledgeVector = 0;

  self->_psc = 0;
  self->_moc = 0;

  self->_importContext = 0;
  id v178 = v234;
  [v203 drain];
  id v179 = v234;
  id v180 = 0;
  if (!self->_success) {
    self->_operationError = (NSError *)v234;
  }
}

- (void)respondToStoreTransactionStateChangeNotification:(id)a3
{
  uint64_t v5 = [a3 object];
  if (self) {
    moc = self->_moc;
  }
  else {
    moc = 0;
  }
  if (!-[NSManagedObjectContext isEqual:](moc, "isEqual:", objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"_NSSQLCoreActiveSavingContext")))return; {
  switch(objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"_NSSQLCoreTransactionType"), "intValue"))
  }
  {
    case 2u:
      if (self) {
        updatedStoreKnowledgeVector = self->_updatedStoreKnowledgeVector;
      }
      else {
        updatedStoreKnowledgeVector = 0;
      }
      uint64_t v8 = -[PFUbiquityKnowledgeVector createStoreKnowledgeVectorDictionary]((uint64_t)updatedStoreKnowledgeVector);
      -[NSSQLCore updateUbiquityKnowledgeVector:](v5, (uint64_t)v8);

      importContext = self->_importContext;
      if (!importContext) {
        goto LABEL_13;
      }
      uint64_t v11 = self->_updatedStoreKnowledgeVector;
      cacheWrapper = importContext->_cacheWrapper;
      if (!cacheWrapper) {
        goto LABEL_11;
      }
      objc_setProperty_atomic(cacheWrapper, v9, v11, 64);
      importContext = self->_importContext;
      if (importContext)
      {
        uint64_t v11 = self->_updatedStoreKnowledgeVector;
LABEL_11:
        heuristics = importContext->_heuristics;
        if (heuristics) {
          objc_setProperty_nonatomic(heuristics, v9, v11, 88);
        }
      }
LABEL_13:
      uint64_t v14 = 410;
      goto LABEL_30;
    case 3u:
      id v15 = [PFUbiquityPeerReceipt alloc];
      if (!self)
      {
        localPeerID = 0;
        modelVersionHash = 0;
        v17 = 0;
LABEL_50:
        uint64_t storeName = 0;
        transactionLogLocation = 0;
        goto LABEL_19;
      }
      localPeerID = self->super._localPeerID;
      v17 = self->_updatedStoreKnowledgeVector;
      transactionLog = self->_transactionLog;
      if (!transactionLog)
      {
        modelVersionHash = 0;
        goto LABEL_50;
      }
      transactionLogLocation = transactionLog->_transactionLogLocation;
      if (transactionLogLocation)
      {
        uint64_t storeName = transactionLogLocation->_storeName;
        modelVersionHash = transactionLogLocation->_modelVersionHash;
        if (transactionLogLocation->_ubiquityLocationType != 1) {
          transactionLogLocation = transactionLogLocation->_ubiquityRootLocation;
        }
      }
      else
      {
        modelVersionHash = 0;
        uint64_t storeName = 0;
      }
LABEL_19:
      uint64_t v22 = [(PFUbiquityPeerReceipt *)v15 initWithLocalPeerID:localPeerID andKnowledgeVector:v17 forPeerID:localPeerID storeName:storeName modelVersionHash:modelVersionHash andUbiquityRootLocation:transactionLogLocation];
      uint64_t v23 = self->_importContext;
      if (v23) {
        uint64_t v24 = (uint64_t)v23->_cacheWrapper;
      }
      else {
        uint64_t v24 = 0;
      }
      uint64_t v43 = v22;
      -[PFUbiquitySwitchboardCacheWrapper scheduleReceiptFileWrite:](v24, v22);
      if (v43) {
        kv = v43->_kv;
      }
      else {
        kv = 0;
      }
      v27 = self->_importContext;
      if (v27)
      {
        uint64_t v28 = v27->_heuristics;
        if (v28) {
          objc_setProperty_nonatomic(v28, v25, kv, 88);
        }
      }

      return;
    case 4u:
      uint64_t v14 = 409;
LABEL_30:
      *((unsigned char *)&self->super.super.super.isa + v14) = 1;
      return;
    case 5u:
      if (self->_wroteKV) {
        return;
      }
      uint64_t v29 = -[PFUbiquityKnowledgeVector createStoreKnowledgeVectorDictionary]((uint64_t)self->_updatedStoreKnowledgeVector);
      -[NSSQLCore updateUbiquityKnowledgeVector:](v5, (uint64_t)v29);

      uint64_t v30 = [PFUbiquityPeerReceipt alloc];
      v31 = self->_transactionLog;
      if (v31)
      {
        __int16 v32 = v31->_transactionLogLocation;
        if (v32)
        {
          int v33 = v32->_storeName;
          uint64_t v34 = v32->_modelVersionHash;
          if (v32->_ubiquityLocationType != 1) {
            __int16 v32 = v32->_ubiquityRootLocation;
          }
        }
        else
        {
          int v33 = 0;
          uint64_t v34 = 0;
        }
      }
      else
      {
        int v33 = 0;
        uint64_t v34 = 0;
        __int16 v32 = 0;
      }
      uint64_t v35 = [(PFUbiquityPeerReceipt *)v30 initWithLocalPeerID:self->super._localPeerID andKnowledgeVector:self->_updatedStoreKnowledgeVector forPeerID:self->super._localPeerID storeName:v33 modelVersionHash:v34 andUbiquityRootLocation:v32];
      uint64_t v36 = self->_importContext;
      if (v36) {
        uint64_t v37 = (uint64_t)v36->_cacheWrapper;
      }
      else {
        uint64_t v37 = 0;
      }
      -[PFUbiquitySwitchboardCacheWrapper scheduleReceiptFileWrite:](v37, v35);
      v39 = self->_importContext;
      if (!v39) {
        goto LABEL_44;
      }
      uint64_t v40 = self->_updatedStoreKnowledgeVector;
      v41 = v39->_cacheWrapper;
      if (!v41) {
        goto LABEL_42;
      }
      objc_setProperty_atomic(v41, v38, v40, 64);
      v39 = self->_importContext;
      if (v39)
      {
        uint64_t v40 = self->_updatedStoreKnowledgeVector;
LABEL_42:
        uint64_t v42 = v39->_heuristics;
        if (v42) {
          objc_setProperty_nonatomic(v42, v38, v40, 88);
        }
      }
LABEL_44:

      self->_wroteKV = 1;
      return;
    default:
      return;
  }
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)_PFUbiquityRecordImportOperation;
  id v3 = [(PFUbiquityImportOperation *)&v8 description];
  if (self)
  {
    localPeerID = self->super._localPeerID;
    logScore = self->_logScore;
    transactionLog = self->_transactionLog;
  }
  else
  {
    localPeerID = 0;
    logScore = 0;
    transactionLog = 0;
  }
  return (NSString *)[NSString stringWithFormat:@"%@:\n\tlocalPeerID: %@\n\tlogScore: %@\n\ttransactionLog: %@\n", v3, localPeerID, logScore, transactionLog];
}

- (int64_t)context:(id)a3 shouldHandleInaccessibleFault:(id)a4 forObjectID:(id)a5 andTrigger:(id)a6
{
  return 2;
}

@end