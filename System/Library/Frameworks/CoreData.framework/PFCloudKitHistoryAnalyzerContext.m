@interface PFCloudKitHistoryAnalyzerContext
- (BOOL)_flushPendingAnalyzerStates:(uint64_t)a1;
- (BOOL)finishProcessing:(id *)a3;
- (BOOL)processChange:(id)a3 error:(id *)a4;
- (BOOL)reset:(id *)a3;
- (BOOL)resetStateForObjectID:(id)a3 error:(id *)a4;
- (PFCloudKitHistoryAnalyzerContext)initWithOptions:(id)a3 managedObjectContext:(id)a4 store:(id)a5;
- (id)fetchSortedStates:(id *)a3;
- (id)newAnalyzerStateForChange:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation PFCloudKitHistoryAnalyzerContext

- (PFCloudKitHistoryAnalyzerContext)initWithOptions:(id)a3 managedObjectContext:(id)a4 store:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = [NSString stringWithUTF8String:"Attempt to initialize PFCloudKitHistoryAnalyzerContext with options that aren't PFCloudKitHistoryAnalyzerOptions: %@"];
    _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)a3);
    v16 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = a3;
      _os_log_fault_impl(&dword_18AB82000, v16, OS_LOG_TYPE_FAULT, "CoreData: Attempt to initialize PFCloudKitHistoryAnalyzerContext with options that aren't PFCloudKitHistoryAnalyzerOptions: %@", buf, 0xCu);
    }
  }
  v30.receiver = self;
  v30.super_class = (Class)PFCloudKitHistoryAnalyzerContext;
  v17 = [(PFHistoryAnalyzerContext *)&v30 initWithOptions:a3];
  if (v17)
  {
    v17->_managedObjectContext = (NSManagedObjectContext *)a4;
    v17->_resetChangedObjectIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v17->_entityIDToChangedPrimaryKeySet = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v18 = (void *)MEMORY[0x18C127630]();
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "persistentStoreCoordinator"), "managedObjectModel"), "entitiesForConfiguration:", objc_msgSend(a5, "configurationName"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v27;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v27 != v23) {
            objc_enumerationMutation(v20);
          }
          objc_msgSend(v19, "addObject:", objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v24++), "name"));
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v22);
    }
    v17->_configuredEntityNames = (NSSet *)[v19 copy];

    v17->_store = (NSSQLCore *)a5;
  }
  return v17;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitHistoryAnalyzerContext;
  [(PFHistoryAnalyzerContext *)&v3 dealloc];
}

- (BOOL)processChange:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!-[NSSet containsObject:](self->_configuredEntityNames, "containsObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "changedObjectID"), "entity"), "name")))
  {
    uint64_t v10 = (void *)MEMORY[0x18C127630]();
    if ((unint64_t)__ckLoggingOverride >= 9) {
      uint64_t v11 = 9;
    }
    else {
      uint64_t v11 = __ckLoggingOverride;
    }
    uint64_t v12 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Skipping change because its entity is not in the configured set of entities for this store: %@"];
    [a3 changedObjectID];
    _NSCoreDataLog(v11, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[PFCloudKitHistoryAnalyzerContext processChange:error:]");
    return (unint64_t)[(NSMutableDictionary *)self->super._objectIDToState count] < 0x3E8
        || -[PFCloudKitHistoryAnalyzerContext _flushPendingAnalyzerStates:]((uint64_t)self, a4);
  }
  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "transaction"), "author"), "isEqualToString:", @"NSCloudKitMirroringDelegate.import") & 1) != 0|| (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "transaction"), "contextName"), "isEqualToString:", @"NSCloudKitMirroringDelegate.import") & 1) != 0|| objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "transaction"), "author"), "isEqualToString:", @"NSCloudKitMirroringDelegate.reset"))
  {
    options = self->super._options;
    if (!options || !BYTE1(options[1].super.isa))
    {
      if ([a3 changeType] == 2
        && !-[PFCloudKitHistoryAnalyzerContext resetStateForObjectID:error:](self, "resetStateForObjectID:error:", [a3 changedObjectID], a4))
      {
        return 0;
      }
      return (unint64_t)[(NSMutableDictionary *)self->super._objectIDToState count] < 0x3E8
          || -[PFCloudKitHistoryAnalyzerContext _flushPendingAnalyzerStates:]((uint64_t)self, a4);
    }
  }
  else if ([a3 changeType] != 2 && objc_msgSend((id)objc_msgSend(a3, "updatedProperties"), "count"))
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v19 = (void *)[a3 updatedProperties];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (!v20) {
      return (unint64_t)[(NSMutableDictionary *)self->super._objectIDToState count] < 0x3E8
    }
          || -[PFCloudKitHistoryAnalyzerContext _flushPendingAnalyzerStates:]((uint64_t)self, a4);
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
LABEL_25:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v26 != v22) {
        objc_enumerationMutation(v19);
      }
      if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v23), "userInfo"), "objectForKey:", @"NSCloudKitMirroringDelegateIgnoredPropertyKey"), "BOOLValue"))break; {
      if (v21 == ++v23)
      }
      {
        uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v21) {
          goto LABEL_25;
        }
        if (self) {
          return (unint64_t)[(NSMutableDictionary *)self->super._objectIDToState count] < 0x3E8
        }
              || -[PFCloudKitHistoryAnalyzerContext _flushPendingAnalyzerStates:]((uint64_t)self, a4);
        return 0;
      }
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)PFCloudKitHistoryAnalyzerContext;
  unsigned __int8 v8 = [(PFHistoryAnalyzerContext *)&v24 processChange:a3 error:a4];
  BOOL result = 0;
  if (self && (v8 & 1) != 0) {
    return (unint64_t)[(NSMutableDictionary *)self->super._objectIDToState count] < 0x3E8
  }
        || -[PFCloudKitHistoryAnalyzerContext _flushPendingAnalyzerStates:]((uint64_t)self, a4);
  return result;
}

- (BOOL)_flushPendingAnalyzerStates:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3052000000;
  objc_super v24 = __Block_byref_object_copy__56;
  long long v25 = __Block_byref_object_dispose__56;
  uint64_t v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v4 = *(void **)(a1 + 56);
  char v20 = 1;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__PFCloudKitHistoryAnalyzerContext__flushPendingAnalyzerStates___block_invoke;
  v16[3] = &unk_1E544CF38;
  v16[4] = a1;
  v16[5] = &v17;
  v16[6] = &v21;
  [v4 performBlockAndWait:v16];
  if (!*((unsigned char *)v18 + 24)
    || ([*(id *)(a1 + 24) removeAllObjects],
        [*(id *)(a1 + 40) removeAllObjects],
        [*(id *)(a1 + 72) removeAllObjects],
        [*(id *)(a1 + 80) removeAllObjects],
        !*((unsigned char *)v18 + 24)))
  {
    id v5 = (id)v22[5];
    if (v5)
    {
      if (a2) {
        *a2 = v5;
      }
    }
    else
    {
      uint64_t v6 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m");
      uint64_t v13 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        long long v28 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m";
        __int16 v29 = 1024;
        int v30 = 198;
        _os_log_fault_impl(&dword_18AB82000, v13, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v22[5] = 0;
  BOOL v14 = *((unsigned char *)v18 + 24) != 0;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v14;
}

uint64_t __64__PFCloudKitHistoryAnalyzerContext__flushPendingAnalyzerStates___block_invoke(uint64_t result)
{
  v1 = (void *)result;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v2 = *(void *)(result + 32);
    objc_super v3 = v2 ? *(void **)(v2 + 24) : 0;
    BOOL result = [v3 count];
    if (result)
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id obj = *(id *)(v1[4] + 80);
      BOOL result = [obj countByEnumeratingWithState:&v58 objects:v66 count:16];
      uint64_t v47 = result;
      if (result)
      {
        uint64_t v46 = *(void *)v59;
        while (2)
        {
          uint64_t v4 = 0;
          do
          {
            if (*(void *)v59 != v46) {
              objc_enumerationMutation(obj);
            }
            uint64_t v5 = *(void *)(*((void *)&v58 + 1) + 8 * v4);
            uint64_t v6 = [*(id *)(v1[4] + 80) objectForKey:v5];
            uint64_t v7 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKHistoryAnalyzerState entityPath]);
            -[NSFetchRequest setPredicate:](v7, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"entityId = %@ AND entityPK in %@", v5, v6]);
            uint64_t v8 = (void *)[*(id *)(v1[4] + 56) executeFetchRequest:v7 error:*(void *)(v1[6] + 8) + 40];
            if (!v8)
            {
              *(unsigned char *)(*(void *)(v1[5] + 8) + 24) = 0;
              BOOL result = (uint64_t)*(id *)(*(void *)(v1[6] + 8) + 40);
              goto LABEL_35;
            }
            uint64_t v9 = v8;
            uint64_t v48 = v4;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            uint64_t v10 = [v8 countByEnumeratingWithState:&v54 objects:v65 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v55;
              do
              {
                uint64_t v13 = 0;
                do
                {
                  if (*(void *)v55 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  BOOL v14 = *(void **)(*((void *)&v54 + 1) + 8 * v13);
                  uint64_t v15 = [v14 analyzedObjectID];
                  uint64_t v16 = v1[4];
                  if (v16) {
                    uint64_t v17 = *(void **)(v16 + 24);
                  }
                  else {
                    uint64_t v17 = 0;
                  }
                  id v18 = (id)[v17 objectForKey:v15];
                  if (v18)
                  {
                    [v14 mergeWithState:v18];
                    uint64_t v19 = v1[4];
                    if (v19) {
                      char v20 = *(void **)(v19 + 24);
                    }
                    else {
                      char v20 = 0;
                    }
                    [v20 removeObjectForKey:v15];
                  }
                  else if ([*(id *)(v1[4] + 72) containsObject:v15])
                  {
                    [*(id *)(v1[4] + 56) deleteObject:v14];
                  }
                  else
                  {
                    uint64_t v21 = [NSString stringWithUTF8String:"History parsing corruption detected. An existing analyzer state was fetched from the database for '%@' but it's corresponding in-memory copy is no longer present in the in-memory cache."];
                    _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, v15);
                    long long v28 = __pflogFaultLog;
                    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      uint64_t v64 = v15;
                      _os_log_fault_impl(&dword_18AB82000, v28, OS_LOG_TYPE_FAULT, "CoreData: History parsing corruption detected. An existing analyzer state was fetched from the database for '%@' but it's corresponding in-memory copy is no longer present in the in-memory cache.", buf, 0xCu);
                    }
                  }

                  ++v13;
                }
                while (v11 != v13);
                uint64_t v29 = [v9 countByEnumeratingWithState:&v54 objects:v65 count:16];
                uint64_t v11 = v29;
              }
              while (v29);
            }
            uint64_t v4 = v48 + 1;
          }
          while (v48 + 1 != v47);
          BOOL result = [obj countByEnumeratingWithState:&v58 objects:v66 count:16];
          uint64_t v47 = result;
          if (result) {
            continue;
          }
          break;
        }
      }
    }
  }
LABEL_35:
  if (*(unsigned char *)(*(void *)(v1[5] + 8) + 24))
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v30 = v1[4];
    uint64_t v31 = v30 ? *(void **)(v30 + 24) : 0;
    BOOL result = [v31 countByEnumeratingWithState:&v50 objects:v62 count:16];
    if (result)
    {
      uint64_t v32 = result;
      uint64_t v33 = *(void *)v51;
      v49 = v31;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v51 != v33) {
            objc_enumerationMutation(v49);
          }
          v35 = *(void **)(*((void *)&v50 + 1) + 8 * v34);
          uint64_t v36 = v1[4];
          if (v36) {
            v37 = *(void **)(v36 + 24);
          }
          else {
            v37 = 0;
          }
          id v38 = (id)[v37 objectForKey:*(void *)(*((void *)&v50 + 1) + 8 * v34)];
          v39 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKHistoryAnalyzerState entityPath], *(void *)(v1[4] + 56));
          -[NSManagedObject setValue:forKey:](v39, "setValue:forKey:", [v38 originalTransactionNumber], @"originalTransactionNumber");
          -[NSManagedObject setOriginalChangeTypeNum:](v39, "setOriginalChangeTypeNum:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v38, "originalChangeType")));
          -[NSManagedObject setValue:forKey:](v39, "setValue:forKey:", [v38 finalTransactionNumber], @"finalTransactionNumber");
          -[NSManagedObject setValue:forKey:](v39, "setValue:forKey:", [v38 finalChangeAuthor], @"finalChangeAuthor");
          -[NSManagedObject setFinalChangeTypeNum:](v39, "setFinalChangeTypeNum:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v38, "finalChangeType")));
          uint64_t v40 = _sqlEntityForEntityDescription([*(id *)(v1[4] + 88) model], objc_msgSend(v35, "entity"));
          if (v40) {
            uint64_t v41 = *(unsigned int *)(v40 + 184);
          }
          else {
            uint64_t v41 = 0;
          }
          -[NSManagedObject setEntityId:](v39, "setEntityId:", [NSNumber numberWithUnsignedInt:v41]);
          -[NSManagedObject setEntityPK:](v39, "setEntityPK:", objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v35, "_referenceData64")));
          [*(id *)(v1[4] + 56) assignObject:v39 toPersistentStore:*(void *)(v1[4] + 88)];

          ++v34;
        }
        while (v32 != v34);
        BOOL result = [v49 countByEnumeratingWithState:&v50 objects:v62 count:16];
        uint64_t v32 = result;
      }
      while (result);
    }
  }
  uint64_t v42 = v1[5];
  if (*(unsigned char *)(*(void *)(v42 + 8) + 24))
  {
    uint64_t v43 = v1[4];
    if (v43)
    {
      uint64_t v44 = *(void *)(v43 + 48);
      if (v44)
      {
        BOOL result = +[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:transformedValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, @"NSCloudKitMirroringDelegateLastHistoryTokenKey", v44, *(void *)(v43 + 88), *(void **)(v43 + 56), (void *)(*(void *)(v1[6] + 8) + 40));
        uint64_t v42 = v1[5];
        if (!result)
        {
          *(unsigned char *)(*(void *)(v42 + 8) + 24) = 0;
          BOOL result = (uint64_t)*(id *)(*(void *)(v1[6] + 8) + 40);
          uint64_t v42 = v1[5];
        }
      }
    }
  }
  if (*(unsigned char *)(*(void *)(v42 + 8) + 24))
  {
    BOOL result = [*(id *)(v1[4] + 56) save:*(void *)(v1[6] + 8) + 40];
    if ((result & 1) == 0) {
      return (uint64_t)*(id *)(*(void *)(v1[6] + 8) + 40);
    }
  }
  return result;
}

- (BOOL)resetStateForObjectID:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)PFCloudKitHistoryAnalyzerContext;
  id v18 = 0;
  BOOL v7 = [(PFHistoryAnalyzerContext *)&v17 resetStateForObjectID:a3 error:&v18];
  if (v7)
  {
    [(NSMutableSet *)self->_resetChangedObjectIDs addObject:a3];
  }
  else if (v18)
  {
    if (a4) {
      *a4 = v18;
    }
  }
  else
  {
    uint64_t v8 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m");
    uint64_t v15 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      char v20 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m";
      __int16 v21 = 1024;
      int v22 = 220;
      _os_log_fault_impl(&dword_18AB82000, v15, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }
  return v7;
}

- (BOOL)reset:(id *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)PFCloudKitHistoryAnalyzerContext;
  id v18 = 0;
  if (![(PFHistoryAnalyzerContext *)&v17 reset:&v18]
    || ([(NSMutableDictionary *)self->_entityIDToChangedPrimaryKeySet removeAllObjects],
        [(NSMutableSet *)self->_resetChangedObjectIDs removeAllObjects],
        uint64_t v5 = -[NSBatchDeleteRequest initWithFetchRequest:]([NSBatchDeleteRequest alloc], "initWithFetchRequest:", +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKHistoryAnalyzerState entityPath](NSCKHistoryAnalyzerState, "entityPath"))), -[NSBatchDeleteRequest setResultType:](v5, "setResultType:", 0), v6 = objc_msgSend((id)-[NSPersistentStoreResult result](-[NSManagedObjectContext executeRequest:error:](self->_managedObjectContext, "executeRequest:error:", v5, &v18), "result"), "BOOLValue"), v5, !v6))
  {
    if (v18)
    {
      if (a3)
      {
        LOBYTE(v7) = 0;
        *a3 = v18;
        return v7;
      }
    }
    else
    {
      uint64_t v8 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m");
      uint64_t v15 = __pflogFaultLog;
      BOOL v7 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v7) {
        return v7;
      }
      *(_DWORD *)buf = 136315394;
      char v20 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m";
      __int16 v21 = 1024;
      int v22 = 243;
      _os_log_fault_impl(&dword_18AB82000, v15, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    LOBYTE(v7) = 0;
    return v7;
  }
  [(NSManagedObjectContext *)self->_managedObjectContext reset];
  LOBYTE(v7) = 1;
  return v7;
}

- (BOOL)finishProcessing:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)PFCloudKitHistoryAnalyzerContext;
  char v20 = 0;
  if (![(PFHistoryAnalyzerContext *)&v19 finishProcessing:&v20]
    || !-[PFCloudKitHistoryAnalyzerContext _flushPendingAnalyzerStates:]((uint64_t)self, &v20)
    || self
    && (options = self->super._options) != 0
    && options->_automaticallyPruneTransientRecords
    && (v6 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKHistoryAnalyzerState entityPath](NSCKHistoryAnalyzerState, "entityPath")), -[NSFetchRequest setPredicate:](v6, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"originalChangeTypeNum = %@ AND finalChangeTypeNum = %@", &unk_1ED7E2C20, &unk_1ED7E2C38]), v7 = -[NSBatchDeleteRequest initWithFetchRequest:]([NSBatchDeleteRequest alloc], "initWithFetchRequest:", v6), -[NSBatchDeleteRequest setResultType:](v7, "setResultType:", 0), char v8 = objc_msgSend((id)-[NSPersistentStoreResult result](
                     [(NSManagedObjectContext *)self->_managedObjectContext executeRequest:v7 error:&v20], "result"), "BOOLValue"), v7, (v8 & 1) == 0))
  {
    if (v20)
    {
      if (a3)
      {
        LOBYTE(v9) = 0;
        *a3 = v20;
        return v9;
      }
    }
    else
    {
      uint64_t v10 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m");
      objc_super v17 = __pflogFaultLog;
      BOOL v9 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v9) {
        return v9;
      }
      *(_DWORD *)buf = 136315394;
      int v22 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzerContext.m";
      __int16 v23 = 1024;
      int v24 = 268;
      _os_log_fault_impl(&dword_18AB82000, v17, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    LOBYTE(v9) = 0;
    return v9;
  }
  LOBYTE(v9) = 1;
  return v9;
}

- (id)fetchSortedStates:(id *)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKHistoryAnalyzerState entityPath]);
  v7[0] = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"finalTransactionNumber" ascending:1];
  -[NSFetchRequest setSortDescriptors:](v5, "setSortDescriptors:", [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1]);
  [(NSFetchRequest *)v5 setFetchBatchSize:200];
  return [(NSManagedObjectContext *)self->_managedObjectContext executeFetchRequest:v5 error:a3];
}

- (id)newAnalyzerStateForChange:(id)a3 error:(id *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)PFCloudKitHistoryAnalyzerContext;
  id v5 = [(PFHistoryAnalyzerContext *)&v12 newAnalyzerStateForChange:a3 error:a4];
  if (v5)
  {
    uint64_t v6 = _sqlEntityForEntityDescription((uint64_t)-[NSSQLCore model](self->_store, "model"), objc_msgSend((id)objc_msgSend(v5, "analyzedObjectID"), "entity"));
    if (v6) {
      uint64_t v7 = *(unsigned int *)(v6 + 184);
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = (id)-[NSMutableDictionary objectForKey:](self->_entityIDToChangedPrimaryKeySet, "objectForKey:", [NSNumber numberWithUnsignedInt:v7]);
    if (!v8)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      entityIDToChangedPrimaryKeySet = self->_entityIDToChangedPrimaryKeySet;
      if (v6) {
        uint64_t v10 = *(unsigned int *)(v6 + 184);
      }
      else {
        uint64_t v10 = 0;
      }
      -[NSMutableDictionary setObject:forKey:](entityIDToChangedPrimaryKeySet, "setObject:forKey:", v8, [NSNumber numberWithUnsignedInt:v10]);
    }
    objc_msgSend(v8, "addObject:", objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend((id)objc_msgSend(v5, "analyzedObjectID"), "_referenceData64")));
  }
  return v5;
}

@end