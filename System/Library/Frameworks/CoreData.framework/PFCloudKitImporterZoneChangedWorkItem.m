@interface PFCloudKitImporterZoneChangedWorkItem
- (BOOL)commitMetadataChangesWithContext:(id)a3 forStore:(id)a4 error:(id *)a5;
- (BOOL)updateMetadataForAccumulatedChangesInContext:(id)a3 inStore:(id)a4 error:(id *)a5;
- (PFCloudKitImporterZoneChangedWorkItem)initWithChangedRecordZoneIDs:(id)a3 options:(id)a4 request:(id)a5;
- (id)description;
- (void)dealloc;
- (void)executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:(id)a3 completion:(id)a4;
@end

@implementation PFCloudKitImporterZoneChangedWorkItem

- (PFCloudKitImporterZoneChangedWorkItem)initWithChangedRecordZoneIDs:(id)a3 options:(id)a4 request:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)PFCloudKitImporterZoneChangedWorkItem;
  v6 = [(PFCloudKitImportRecordsWorkItem *)&v8 initWithOptions:a4 request:a5];
  if (v6)
  {
    v6->_changedRecordZoneIDs = (NSArray *)a3;
    v6->_fetchedZoneIDToChangeToken = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v6->_fetchedZoneIDToMoreComing = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v6;
}

- (void)dealloc
{
  self->_changedRecordZoneIDs = 0;
  self->_fetchedZoneIDToChangeToken = 0;

  self->_fetchedZoneIDToMoreComing = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitImporterZoneChangedWorkItem;
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
  [v7 appendFormat:@" {\n%@\n}", self->_changedRecordZoneIDs];

  return v7;
}

- (void)executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:(id)a3 completion:(id)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  if (self) {
    options = self->super.super._options;
  }
  else {
    options = 0;
  }
  objc_super v8 = options;
  v9 = (uint64_t *)v8;
  if (v8)
  {
    v48 = v8->_database;
    uint64_t v10 = v9[2];
    if (v10)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v10 + 32));
      uint64_t v11 = v9[2];
      goto LABEL_6;
    }
  }
  else
  {
    v48 = 0;
  }
  id WeakRetained = 0;
  uint64_t v11 = 0;
LABEL_6:
  v45 = v9;
  v49 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](v11);
  if (v49)
  {
    v41 = (void (**)(id, void *))a4;
    id v47 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v81 = 0;
    v82 = &v81;
    uint64_t v83 = 0x2020000000;
    char v84 = 1;
    uint64_t v75 = 0;
    v76 = &v75;
    uint64_t v77 = 0x3052000000;
    v78 = __Block_byref_object_copy__41;
    v79 = __Block_byref_object_dispose__41;
    uint64_t v80 = 0;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v42 = self;
    obj = self->_changedRecordZoneIDs;
    uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v71 objects:v88 count:16];
    if (v12)
    {
      uint64_t v44 = *(void *)v72;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v72 != v44) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v71 + 1) + 8 * v13);
          id location = 0;
          p_id location = &location;
          uint64_t v67 = 0x3052000000;
          v68 = __Block_byref_object_copy__41;
          v69 = __Block_byref_object_dispose__41;
          uint64_t v70 = 0;
          v64[0] = MEMORY[0x1E4F143A8];
          v64[1] = 3221225472;
          v64[2] = __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke;
          v64[3] = &unk_1E544EA40;
          v64[4] = v14;
          v64[5] = v48;
          v64[6] = v49;
          v64[7] = a3;
          v64[8] = &location;
          v64[9] = &v81;
          v64[10] = &v75;
          [a3 performBlockAndWait:v64];
          if (!*((unsigned char *)v82 + 24))
          {
            _Block_object_dispose(&location, 8);
            goto LABEL_37;
          }
          id v15 = objc_alloc_init(getCloudKitCKFetchRecordZoneChangesConfigurationClass());
          [v15 setPreviousServerChangeToken:p_location[5]];

          p_location[5] = 0;
          uint64_t v16 = [v49 configurationName];
          v17 = (void *)[WeakRetained managedObjectModel];
          if (v9) {
            v18 = (void *)v9[3];
          }
          else {
            v18 = 0;
          }
          id v19 = +[PFCloudKitSerializer newSetOfRecordKeysForEntitiesInConfiguration:inManagedObjectModel:includeCKAssetsForFileBackedFutures:]((uint64_t)PFCloudKitSerializer, v16, v17, [v18 automaticallyDownloadFileBackedFutures]);
          v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v19, "count"));
          long long v62 = 0u;
          long long v63 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          uint64_t v21 = [v19 countByEnumeratingWithState:&v60 objects:v87 count:16];
          if (v21)
          {
            uint64_t v22 = *(void *)v61;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v61 != v22) {
                  objc_enumerationMutation(v19);
                }
                [v20 addObject:*(void *)(*((void *)&v60 + 1) + 8 * i)];
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v60 objects:v87 count:16];
            }
            while (v21);
          }
          v9 = v45;
          [v15 setDesiredKeys:v20];
          [v47 setObject:v15 forKey:v14];

          _Block_object_dispose(&location, 8);
          ++v13;
        }
        while (v13 != v12);
        uint64_t v24 = [(NSArray *)obj countByEnumeratingWithState:&v71 objects:v88 count:16];
        uint64_t v12 = v24;
      }
      while (v24);
    }
LABEL_37:
    if (*((unsigned char *)v82 + 24))
    {
      v35 = (void *)[objc_alloc(getCloudKitCKFetchRecordZoneChangesOperationClass()) initWithRecordZoneIDs:v42->_changedRecordZoneIDs configurationsByRecordZoneID:v47];
      if ([(NSCloudKitMirroringRequest *)v42->super.super._request options]) {
        -[NSCloudKitMirroringRequestOptions applyToOperation:]((uint64_t)[(NSCloudKitMirroringRequest *)v42->super.super._request options], v35);
      }
      objc_initWeak(&location, v42);
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_2;
      v58[3] = &unk_1E544BBA0;
      objc_copyWeak(&v59, &location);
      [v35 setRecordWasChangedBlock:v58];
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_3;
      v56[3] = &unk_1E544EA68;
      objc_copyWeak(&v57, &location);
      [v35 setRecordWithIDWasDeletedBlock:v56];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_4;
      v54[3] = &unk_1E544EA90;
      objc_copyWeak(&v55, &location);
      [v35 setRecordZoneChangeTokensUpdatedBlock:v54];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_5;
      v52[3] = &unk_1E544EAB8;
      objc_copyWeak(&v53, &location);
      [v35 setRecordZoneFetchCompletionBlock:v52];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_6;
      v50[3] = &unk_1E544EAE0;
      objc_copyWeak(&v51, &location);
      v50[4] = v41;
      [v35 setFetchRecordZoneChangesCompletionBlock:v50];
      [(CKDatabase *)v48 addOperation:v35];
      objc_destroyWeak(&v51);
      objc_destroyWeak(&v53);
      objc_destroyWeak(&v55);
      objc_destroyWeak(&v57);
      objc_destroyWeak(&v59);
      objc_destroyWeak(&location);
      v34 = v35;
      goto LABEL_48;
    }
    if (!v41)
    {
LABEL_47:
      v34 = 0;
LABEL_48:

      v76[5] = 0;
      _Block_object_dispose(&v75, 8);
      _Block_object_dispose(&v81, 8);
      goto LABEL_49;
    }
    v36 = [NSCloudKitMirroringResult alloc];
    if (v42)
    {
      request = v42->super.super._request;
      if (!v9) {
        goto LABEL_57;
      }
    }
    else
    {
      request = 0;
      if (!v9) {
        goto LABEL_57;
      }
    }
    uint64_t v38 = v9[2];
    if (v38)
    {
      uint64_t v39 = *(void *)(v38 + 48);
LABEL_46:
      v40 = [(NSCloudKitMirroringResult *)v36 initWithRequest:request storeIdentifier:v39 success:0 madeChanges:0 error:v76[5]];
      v41[2](v41, v40);

      goto LABEL_47;
    }
LABEL_57:
    uint64_t v39 = 0;
    goto LABEL_46;
  }
  if (a4)
  {
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v85 = *MEMORY[0x1E4F28588];
    if (self) {
      v26 = self->super.super._request;
    }
    else {
      v26 = 0;
    }
    uint64_t v86 = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", -[NSCloudKitMirroringRequest requestIdentifier](v26, "requestIdentifier")];
    uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
    uint64_t v28 = [v25 errorWithDomain:*MEMORY[0x1E4F281F8] code:134407 userInfo:v27];
    v29 = [NSCloudKitMirroringResult alloc];
    if (self)
    {
      v30 = self->super.super._request;
      if (!v9) {
        goto LABEL_55;
      }
    }
    else
    {
      v30 = 0;
      if (!v9) {
        goto LABEL_55;
      }
    }
    uint64_t v31 = v9[2];
    if (v31)
    {
      uint64_t v32 = *(void *)(v31 + 48);
LABEL_34:
      v33 = [(NSCloudKitMirroringResult *)v29 initWithRequest:v30 storeIdentifier:v32 success:0 madeChanges:0 error:v28];
      (*((void (**)(id, NSCloudKitMirroringResult *))a4 + 2))(a4, v33);

      goto LABEL_35;
    }
LABEL_55:
    uint64_t v32 = 0;
    goto LABEL_34;
  }
LABEL_35:
  v34 = 0;
  id v47 = 0;
LABEL_49:
}

id __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke(uint64_t a1)
{
  v5[5] = *(id *)MEMORY[0x1E4F143B8];
  v5[0] = 0;
  v2 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, *(void **)(a1 + 32), [*(id *)(a1 + 40) databaseScope], *(void *)(a1 + 48), *(void **)(a1 + 56), (uint64_t)v5);
  if (v2)
  {
    id result = (id)[(NSManagedObject *)v2 currentChangeToken];
    uint64_t v4 = *(void *)(a1 + 64);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    id result = v5[0];
    uint64_t v4 = *(void *)(a1 + 80);
  }
  *(void *)(*(void *)(v4 + 8) + 40) = result;
  return result;
}

uint64_t __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_2(uint64_t result, uint64_t a2, void *a3)
{
  if (a3)
  {
    uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(result + 32));
    uint64_t v5 = WeakRetained;
    if (WeakRetained)
    {
      v6 = (void *)WeakRetained;
      uint64_t WeakRetained = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "recordID"), "recordName"), "hasPrefix:", @"CD_FAKE_");
      uint64_t v5 = (uint64_t)v6;
      if ((WeakRetained & 1) == 0)
      {
        uint64_t WeakRetained = [v6 addUpdatedRecord:a3];
        uint64_t v5 = (uint64_t)v6;
      }
    }
    return MEMORY[0x1F41817F8](WeakRetained, v5);
  }
  return result;
}

void __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    -[PFCloudKitImportRecordsWorkItem addDeletedRecordID:ofType:]((uint64_t)WeakRetained, a2, a3);
    id WeakRetained = v6;
  }
}

void __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (a3 && WeakRetained)
  {
    id v6 = WeakRetained;
    [WeakRetained[20] setObject:a3 forKey:a2];
    -[PFCloudKitImportRecordsWorkItem checkAndApplyChangesIfNeeded:]((uint64_t)v6, a3);
    id WeakRetained = v6;
  }
}

void __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v11 = WeakRetained;
    if (a6)
    {
      [WeakRetained[11] addObject:a6];
    }
    else
    {
      if (a3)
      {
        [WeakRetained[20] setObject:a3 forKey:a2];
        id WeakRetained = v11;
      }
      objc_msgSend(WeakRetained[21], "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", a5), a2);
    }
    id WeakRetained = v11;
  }
}

void __120__PFCloudKitImporterZoneChangedWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    -[PFCloudKitImportRecordsWorkItem fetchOperationFinishedWithError:completion:]((uint64_t)WeakRetained, a2, *(void *)(a1 + 32));
    id WeakRetained = v5;
  }
}

- (BOOL)updateMetadataForAccumulatedChangesInContext:(id)a3 inStore:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v43 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  fetchedZoneIDToChangeToken = self->_fetchedZoneIDToChangeToken;
  uint64_t v9 = [(NSMutableDictionary *)fetchedZoneIDToChangeToken countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v40;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(fetchedZoneIDToChangeToken);
        }
        uint64_t v13 = *(void **)(*((void *)&v39 + 1) + 8 * v12);
        options = self->super.super._options;
        if (options) {
          database = options->_database;
        }
        else {
          database = 0;
        }
        uint64_t v16 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v13, [(CKDatabase *)database databaseScope], (uint64_t)a4, a3, (uint64_t)&v43);
        if (v43)
        {
          id v19 = (void *)MEMORY[0x18C127630](v16);
          BOOL v20 = __ckLoggingOverride != 0;
          uint64_t v21 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Unable to fetch zone metadata for zone: %@\n%@"];
          _NSCoreDataLog(v20, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"-[PFCloudKitImporterZoneChangedWorkItem updateMetadataForAccumulatedChangesInContext:inStore:error:]");
          goto LABEL_16;
        }
        [(NSManagedObject *)v16 setCurrentChangeToken:[(NSMutableDictionary *)self->_fetchedZoneIDToChangeToken objectForKey:v13]];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v17 = [(NSMutableDictionary *)fetchedZoneIDToChangeToken countByEnumeratingWithState:&v39 objects:v48 count:16];
      uint64_t v10 = v17;
    }
    while (v17);
  }
  v38.receiver = self;
  v38.super_class = (Class)PFCloudKitImporterZoneChangedWorkItem;
  if (![(PFCloudKitImportRecordsWorkItem *)&v38 updateMetadataForAccumulatedChangesInContext:a3 inStore:a4 error:&v43])
  {
LABEL_16:
    if (v43)
    {
      if (a5)
      {
        LOBYTE(v18) = 0;
        *a5 = v43;
        return v18;
      }
    }
    else
    {
      uint64_t v28 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v28, v29, v30, v31, v32, v33, v34, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImporterZoneChangedWorkItem.m");
      v35 = __pflogFaultLog;
      BOOL v18 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v18) {
        return v18;
      }
      *(_DWORD *)buf = 136315394;
      v45 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImporterZoneChangedWorkItem.m";
      __int16 v46 = 1024;
      int v47 = 284;
      _os_log_fault_impl(&dword_18AB82000, v35, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    LOBYTE(v18) = 0;
    return v18;
  }
  LOBYTE(v18) = 1;
  return v18;
}

- (BOOL)commitMetadataChangesWithContext:(id)a3 forStore:(id)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v44 = 0;
  objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithArray:", -[NSMutableDictionary allKeys](self->_fetchedZoneIDToChangeToken, "allKeys"));
  id obj = v8;
  objc_msgSend(v8, "addObjectsFromArray:", -[NSMutableDictionary allKeys](self->_fetchedZoneIDToMoreComing, "allKeys"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v41;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(obj);
        }
        options = self->super.super._options;
        if (options) {
          database = options->_database;
        }
        else {
          database = 0;
        }
        uint64_t v14 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
        id v15 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v14, [(CKDatabase *)database databaseScope], (uint64_t)a4, a3, (uint64_t)&v44);
        if (v44)
        {
          id v19 = (void *)MEMORY[0x18C127630](v15);
          uint64_t v20 = __ckLoggingOverride;
          objc_super v8 = obj;
          uint64_t v21 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Unable to fetch zone metadata for zone: %@\n%@"];
          _NSCoreDataLog(v20 != 0, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"-[PFCloudKitImporterZoneChangedWorkItem commitMetadataChangesWithContext:forStore:error:]");
          BOOL v18 = 0;
          goto LABEL_15;
        }
        uint64_t v16 = v15;
        [(NSManagedObject *)v15 setCurrentChangeToken:[(NSMutableDictionary *)self->_fetchedZoneIDToChangeToken objectForKey:v14]];
        -[NSManagedObject setNeedsImport:](v16, "setNeedsImport:", objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_fetchedZoneIDToMoreComing, "objectForKey:", v14), "BOOLValue"));
        -[NSManagedObject setLastFetchDate:](v16, "setLastFetchDate:", [MEMORY[0x1E4F1C9C8] date]);
        ++v11;
      }
      while (v9 != v11);
      objc_super v8 = obj;
      uint64_t v17 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
      uint64_t v9 = v17;
    }
    while (v17);
  }
  v39.receiver = self;
  v39.super_class = (Class)PFCloudKitImporterZoneChangedWorkItem;
  BOOL v18 = [(PFCloudKitImportRecordsWorkItem *)&v39 commitMetadataChangesWithContext:a3 forStore:a4 error:&v44];
LABEL_15:

  if (!v18)
  {
    if (v44)
    {
      if (a5) {
        *a5 = v44;
      }
    }
    else
    {
      uint64_t v28 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v28, v29, v30, v31, v32, v33, v34, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImporterZoneChangedWorkItem.m");
      v35 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v46 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImporterZoneChangedWorkItem.m";
        __int16 v47 = 1024;
        int v48 = 329;
        _os_log_fault_impl(&dword_18AB82000, v35, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v18;
}

@end