@interface PFCloudKitImporterFetchRecordsWorkItem
- (PFCloudKitImporterFetchRecordsWorkItem)initWithOptions:(id)a3 request:(id)a4;
- (id)createMirroringResultForRequest:(id)a3 storeIdentifier:(id)a4 success:(BOOL)a5 madeChanges:(BOOL)a6 error:(id)a7;
- (id)description;
- (id)entityNameToAttributesToUpdate;
- (id)entityNameToRelationshipsToUpdate;
- (void)dealloc;
- (void)executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:(id)a3 completion:(id)a4;
@end

@implementation PFCloudKitImporterFetchRecordsWorkItem

- (PFCloudKitImporterFetchRecordsWorkItem)initWithOptions:(id)a3 request:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PFCloudKitImporterFetchRecordsWorkItem;
  v4 = [(PFCloudKitImportRecordsWorkItem *)&v6 initWithOptions:a3 request:a4];
  if (v4)
  {
    v4->_updatedObjectIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4->_failedObjectIDsToError = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_recordIDToObjectID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_operationsToExecute = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v4;
}

- (void)dealloc
{
  self->_updatedObjectIDs = 0;
  self->_failedObjectIDsToError = 0;

  self->_recordIDToObjectID = 0;
  self->_operationsToExecute = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitImporterFetchRecordsWorkItem;
  [(PFCloudKitImportRecordsWorkItem *)&v3 dealloc];
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self) {
    request = self->super.super._request;
  }
  else {
    request = 0;
  }
  v7 = (void *)[v3 initWithFormat:@"<%@: %p - %@>", v5, self, request];
  [v7 appendFormat:@" { %@ %@ %@ %@ }", self->_updatedObjectIDs, self->_failedObjectIDsToError, self->_recordIDToObjectID, self->_operationsToExecute];

  return v7;
}

- (void)executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:(id)a3 completion:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (self) {
    options = self->super.super._options;
  }
  else {
    options = 0;
  }
  objc_super v6 = options;
  v41 = v6;
  if (v6) {
    database = v6->_database;
  }
  else {
    database = 0;
  }
  v40 = database;
  p_isa = &self->super.super.super.isa;
  if (self)
  {
    p_isa = &self->super.super._options->super.isa;
    request = self->super.super._request;
    if (p_isa) {
      p_isa = (void *)p_isa[2];
    }
  }
  else
  {
    request = 0;
  }
  v42 = p_isa;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  char v69 = 1;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3052000000;
  v63 = __Block_byref_object_copy__30;
  v64 = __Block_byref_object_dispose__30;
  uint64_t v65 = 0;
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke;
  v59[3] = &unk_1E544E218;
  v59[4] = v42;
  v59[5] = request;
  id v47 = v10;
  v59[6] = v10;
  v59[7] = a3;
  v59[8] = self;
  v59[9] = v43;
  v59[10] = &v60;
  v59[11] = &v66;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v42, (uint64_t)v59);
  if (*((unsigned char *)v67 + 24))
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    if (self)
    {
      v11 = self->super.super._request;
      if (v11) {
        unint64_t requestCompletionBlock = (unint64_t)v11[1].super._requestCompletionBlock;
      }
      else {
        unint64_t requestCompletionBlock = 0;
      }
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ([v43 count] <= requestCompletionBlock)
      {
        if ([v43 count]) {
          [v13 addObject:v43];
        }
      }
      else
      {
        uint64_t v14 = 0;
        uint64_t v15 = 0;
        do
        {
          unint64_t v16 = [v43 count];
          unint64_t v17 = v15 + requestCompletionBlock;
          unint64_t v18 = requestCompletionBlock;
          if (v15 + requestCompletionBlock > v16) {
            unint64_t v18 = v14 + [v43 count];
          }
          objc_msgSend(v13, "addObject:", objc_msgSend(v43, "subarrayWithRange:", v15, v18));
          v14 -= requestCompletionBlock;
          v15 += requestCompletionBlock;
        }
        while (v17 < [v43 count]);
      }
      id obj = v13;
      uint64_t v22 = [obj countByEnumeratingWithState:&v55 objects:v70 count:16];
    }
    else
    {
      id obj = 0;
      uint64_t v22 = [0 countByEnumeratingWithState:&v55 objects:v70 count:16];
    }
    uint64_t v23 = v22;
    if (v22)
    {
      uint64_t v45 = *(void *)v56;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v56 != v45) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void *)(*((void *)&v55 + 1) + 8 * v24);
          id v26 = objc_alloc_init(getCloudKitCKFetchRecordsOperationClass());
          uint64_t v27 = [v26 operationID];
          if ([(NSCloudKitMirroringRequest *)request options]) {
            -[NSCloudKitMirroringRequestOptions applyToOperation:]((uint64_t)[(NSCloudKitMirroringRequest *)request options], v26);
          }
          [v26 setRecordIDs:v25];
          [v26 setDesiredKeys:v47];
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_5;
          v54[3] = &unk_1E544E240;
          v54[4] = request;
          [v26 setPerRecordProgressBlock:v54];
          objc_initWeak(&location, self);
          v51[0] = MEMORY[0x1E4F143A8];
          v51[1] = 3221225472;
          v51[2] = __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_6;
          v51[3] = &unk_1E544E268;
          objc_copyWeak(&v52, &location);
          [v26 setPerRecordCompletionBlock:v51];
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_7;
          v49[3] = &unk_1E544E290;
          objc_copyWeak(&v50, &location);
          v49[4] = v27;
          v49[5] = a4;
          [v26 setFetchRecordsCompletionBlock:v49];
          [(NSMutableDictionary *)self->_operationsToExecute setObject:v26 forKey:v27];

          objc_destroyWeak(&v50);
          objc_destroyWeak(&v52);
          objc_destroyWeak(&location);
          ++v24;
        }
        while (v23 != v24);
        uint64_t v23 = [obj countByEnumeratingWithState:&v55 objects:v70 count:16];
      }
      while (v23);
    }
    if ([(NSMutableDictionary *)self->_operationsToExecute count])
    {
      if (v41) {
        v28 = v41->_database;
      }
      else {
        v28 = 0;
      }
      -[CKDatabase addOperation:](v28, "addOperation:", objc_msgSend((id)-[NSMutableDictionary allValues](self->_operationsToExecute, "allValues"), "objectAtIndexedSubscript:", 0));
    }
    else if (a4)
    {
      v29 = (void *)MEMORY[0x18C127630]();
      if ((unint64_t)__ckLoggingOverride >= 9) {
        uint64_t v30 = 9;
      }
      else {
        uint64_t v30 = __ckLoggingOverride;
      }
      uint64_t v31 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Fetch records request did not match any records in the store: %@\n%@"];
      [(NSCloudKitMirroringImportRequest *)request objectIDsToFetch];
      _NSCoreDataLog(v30, v31, v32, v33, v34, v35, v36, v37, (uint64_t)"-[PFCloudKitImporterFetchRecordsWorkItem executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:completion:]");
      if (v42) {
        uint64_t v38 = v42[6];
      }
      else {
        uint64_t v38 = 0;
      }
      id v39 = [(PFCloudKitImporterFetchRecordsWorkItem *)self createMirroringResultForRequest:self->super.super._request storeIdentifier:v38 success:1 madeChanges:0 error:0];
      (*((void (**)(id, id))a4 + 2))(a4, v39);
    }
  }
  else if (a4)
  {
    if (self) {
      v19 = self->super.super._request;
    }
    else {
      v19 = 0;
    }
    if (v42) {
      uint64_t v20 = v42[6];
    }
    else {
      uint64_t v20 = 0;
    }
    id v21 = [(PFCloudKitImporterFetchRecordsWorkItem *)self createMirroringResultForRequest:v19 storeIdentifier:v20 success:0 madeChanges:0 error:v61[5]];
    (*((void (**)(id, id))a4 + 2))(a4, v21);
  }
  v61[5] = 0;

  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v66, 8);
}

void __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 32));
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v4 = 0;
    id WeakRetained = 0;
  }
  v5 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](v4);
  if (v5)
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "entityNameToAttributesToFetch"), "count"))
    {
      objc_super v6 = (void *)[*(id *)(a1 + 40) entityNameToAttributesToFetch];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_2;
      v15[3] = &unk_1E544C920;
      v15[4] = *(void *)(a1 + 48);
      [v6 enumerateKeysAndObjectsUsingBlock:v15];
    }
    else
    {
      id v9 = +[PFCloudKitSerializer newSetOfRecordKeysForEntitiesInConfiguration:inManagedObjectModel:includeCKAssetsForFileBackedFutures:]((uint64_t)PFCloudKitSerializer, [v5 configurationName], objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectModel"), 1);
      objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", objc_msgSend(v9, "allObjects"));
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_4;
    v11[3] = &unk_1E544E1F0;
    v11[4] = *(void *)(a1 + 40);
    v11[5] = v5;
    long long v10 = *(_OWORD *)(a1 + 72);
    long long v12 = *(_OWORD *)(a1 + 56);
    long long v13 = v10;
    uint64_t v14 = *(void *)(a1 + 88);
    [(id)v12 performBlockAndWait:v11];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
    id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = *MEMORY[0x1E4F28588];
    v17[0] = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(*(id *)(a1 + 40), "requestIdentifier")];
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = [v7 initWithDomain:*MEMORY[0x1E4F281F8] code:134407 userInfo:v8];
  }
}

uint64_t __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_3;
  v4[3] = &unk_1E544E1C8;
  v4[4] = *(void *)(a1 + 32);
  return [a3 enumerateObjectsUsingBlock:v4];
}

void __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = +[PFCloudKitSerializer newSetOfRecordKeysForAttribute:includeCKAssetsForFileBackedFutures:]((uint64_t)PFCloudKitSerializer, a2, 1);
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", objc_msgSend(v3, "allObjects"));
}

id __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = +[NSCKRecordMetadata metadataForObjectIDs:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, [*(id *)(a1 + 32) objectIDsToFetch], *(void *)(a1 + 40), *(void **)(a1 + 48), (void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  id v3 = v2;
  if (v2)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id result = (id)[v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    id v5 = result;
    if (result)
    {
      uint64_t v6 = *(void *)v12;
      do
      {
        id v7 = 0;
        do
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v7);
          id v9 = (void *)-[NSCKRecordMetadata createRecordID](v8);
          long long v10 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v8);
          [*(id *)(*(void *)(a1 + 56) + 168) setObject:v10 forKey:v9];
          [*(id *)(a1 + 64) addObject:v9];

          id v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id result = (id)[v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        id v5 = result;
      }
      while (result);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    return *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  }
  return result;
}

void __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_5(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x18C127630]();
  if ((unint64_t)__ckLoggingOverride >= 0x10) {
    uint64_t v3 = 16;
  }
  else {
    uint64_t v3 = __ckLoggingOverride;
  }
  uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ '%@': %@ %f"];
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  [*(id *)(a1 + 32) requestIdentifier];
  _NSCoreDataLog(v3, v4, v6, v7, v8, v9, v10, v11, (uint64_t)"-[PFCloudKitImporterFetchRecordsWorkItem executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:completion:]_block_invoke_5");
}

uint64_t __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v37 = (id *)WeakRetained;
    if (a4)
    {
      uint64_t v9 = (void *)MEMORY[0x18C127630]();
      BOOL v10 = __ckLoggingOverride != 0;
      uint64_t v11 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ encountered error while fetching record %@\n%@"];
      _NSCoreDataLog(v10, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[PFCloudKitImporterFetchRecordsWorkItem fetchFinishedForRecord:withID:error:]");
      uint64_t v8 = (uint64_t)v37;
      if (!a3) {
        goto LABEL_15;
      }
      uint64_t v18 = [v37[21] objectForKey:a3];
      if (v18)
      {
        uint64_t WeakRetained = [v37[20] setObject:a4 forKey:v18];
      }
      else
      {
        uint64_t v20 = [NSString stringWithUTF8String:"Fetch operation was notified about a recordID that finished with an error that doesn't have an objectID: %@ - %@"];
        _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, a3);
        uint64_t v27 = __pflogFaultLog;
        uint64_t WeakRetained = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
        uint64_t v8 = (uint64_t)v37;
        if (!WeakRetained) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v39 = a3;
        __int16 v40 = 2112;
        uint64_t v41 = a4;
        _os_log_fault_impl(&dword_18AB82000, v27, OS_LOG_TYPE_FAULT, "CoreData: Fetch operation was notified about a recordID that finished with an error that doesn't have an objectID: %@ - %@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t WeakRetained = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "recordID"), "recordName"), "hasPrefix:", @"CD_FAKE_");
      uint64_t v8 = (uint64_t)v37;
      if (WeakRetained) {
        goto LABEL_15;
      }
      uint64_t v19 = [v37[21] objectForKey:a3];
      if (v19)
      {
        [v37[19] addObject:v19];
      }
      else
      {
        uint64_t v28 = [NSString stringWithUTF8String:"Fetch operation was notified about an updated recordID that finished that doesn't have an objectID: %@"];
        _NSCoreDataLog(17, v28, v29, v30, v31, v32, v33, v34, a3);
        uint64_t v35 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v39 = a3;
          _os_log_fault_impl(&dword_18AB82000, v35, OS_LOG_TYPE_FAULT, "CoreData: Fetch operation was notified about an updated recordID that finished that doesn't have an objectID: %@", buf, 0xCu);
        }
      }
      uint64_t WeakRetained = [v37 addUpdatedRecord:a2];
    }
    uint64_t v8 = (uint64_t)v37;
  }
LABEL_15:

  return MEMORY[0x1F41817F8](WeakRetained, v8);
}

void __121__PFCloudKitImporterFetchRecordsWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v30 = WeakRetained;
    uint64_t v8 = (void *)MEMORY[0x18C127630]();
    uint64_t v9 = &OBJC_IVAR___NSExpressionDescription__reservedtype2_2;
    [v30[22] removeObjectForKey:v7];
    if (a3)
    {
      BOOL v10 = (void *)[a3 domain];
      if ([v10 isEqualToString:getCloudKitCKErrorDomain[0]()]
        && [a3 code] == 2)
      {
        uint64_t v29 = v8;
        uint64_t v11 = (void *)[a3 userInfo];
        uint64_t v12 = (void *)[v11 objectForKey:getCloudKitCKPartialErrorsByItemIDKey()];
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v32 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8 * i);
              uint64_t v18 = [v30[21] objectForKey:v17];
              if (v18)
              {
                objc_msgSend(v30[20], "setObject:forKey:", objc_msgSend(v12, "objectForKey:", v17), v18);
              }
              else
              {
                uint64_t v19 = [NSString stringWithUTF8String:"Fetch operation was notified via partial failure about a recordID that doesn't have an objectID: %@ - %@"];
                _NSCoreDataLog(17, v19, v20, v21, v22, v23, v24, v25, v17);
                uint64_t v26 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v36 = v17;
                  __int16 v37 = 2112;
                  uint64_t v38 = a3;
                  _os_log_fault_impl(&dword_18AB82000, v26, OS_LOG_TYPE_FAULT, "CoreData: Fetch operation was notified via partial failure about a recordID that doesn't have an objectID: %@ - %@", buf, 0x16u);
                }
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v14);
        }
        -[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:]((uint64_t)v30, 0);
        uint64_t v8 = v29;
        uint64_t v9 = &OBJC_IVAR___NSExpressionDescription__reservedtype2_2;
      }
      else
      {
        [v30[11] addObject:a3];
      }
    }
    else
    {
      -[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:]((uint64_t)v30, 0);
    }
    if ([*(id *)((char *)v30 + v9[108]) count])
    {
      uint64_t v27 = v30[1];
      if (v27) {
        uint64_t v28 = (void *)v27[1];
      }
      else {
        uint64_t v28 = 0;
      }
      objc_msgSend(v28, "addOperation:", objc_msgSend((id)objc_msgSend(*(id *)((char *)v30 + v9[108]), "allValues"), "objectAtIndexedSubscript:", 0));
    }
    else
    {
      -[PFCloudKitImportRecordsWorkItem fetchOperationFinishedWithError:completion:]((uint64_t)v30, 0, v6);
    }
    uint64_t WeakRetained = v30;
  }
}

- (id)createMirroringResultForRequest:(id)a3 storeIdentifier:(id)a4 success:(BOOL)a5 madeChanges:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  if (a5)
  {
    uint64_t v13 = [(NSMutableDictionary *)self->_failedObjectIDsToError count];
    uint64_t v14 = [NSCloudKitMirroringFetchRecordsResult alloc];
    if (v13) {
      return -[NSCloudKitMirroringFetchRecordsResult initWithRequest:storeIdentifier:success:madeChanges:updatedObjectIDs:failedObjectIDToError:error:](v14, "initWithRequest:storeIdentifier:success:madeChanges:updatedObjectIDs:failedObjectIDToError:error:", a3, a4, 0, v8, self->_updatedObjectIDs, self->_failedObjectIDsToError, [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134418 userInfo:0]);
    }
  }
  else
  {
    uint64_t v14 = [NSCloudKitMirroringFetchRecordsResult alloc];
    if (!self)
    {
      updatedObjectIDs = 0;
      failedObjectIDsToError = 0;
      return [(NSCloudKitMirroringFetchRecordsResult *)v14 initWithRequest:a3 storeIdentifier:a4 success:v9 madeChanges:v8 updatedObjectIDs:updatedObjectIDs failedObjectIDToError:failedObjectIDsToError error:a7];
    }
  }
  updatedObjectIDs = self->_updatedObjectIDs;
  failedObjectIDsToError = self->_failedObjectIDsToError;
  return [(NSCloudKitMirroringFetchRecordsResult *)v14 initWithRequest:a3 storeIdentifier:a4 success:v9 madeChanges:v8 updatedObjectIDs:updatedObjectIDs failedObjectIDToError:failedObjectIDsToError error:a7];
}

- (id)entityNameToAttributesToUpdate
{
  id v2 = self;
  if (self) {
    self = (PFCloudKitImporterFetchRecordsWorkItem *)self->super.super._request;
  }
  id result = (id)objc_msgSend((id)-[PFCloudKitImporterFetchRecordsWorkItem entityNameToAttributesToFetch](self, "entityNameToAttributesToFetch"), "count");
  if (result)
  {
    if (v2) {
      request = v2->super.super._request;
    }
    else {
      request = 0;
    }
    return (id)[(NSCloudKitMirroringImportRequest *)request entityNameToAttributesToFetch];
  }
  return result;
}

- (id)entityNameToRelationshipsToUpdate
{
  return (id)MEMORY[0x1E4F1CC08];
}

@end