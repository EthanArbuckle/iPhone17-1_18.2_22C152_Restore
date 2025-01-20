@interface PFCloudKitCKQueryBackedImportWorkItem
- (BOOL)applyAccumulatedChangesToStore:(id)a3 inManagedObjectContext:(id)a4 withStoreMonitor:(id)a5 madeChanges:(BOOL *)a6 error:(id *)a7;
- (BOOL)commitMetadataChangesWithContext:(id)a3 forStore:(id)a4 error:(id *)a5;
- (BOOL)updateMetadataForAccumulatedChangesInContext:(id)a3 inStore:(id)a4 error:(id *)a5;
- (id)description;
- (id)initForRecordType:(id)a3 withOptions:(id)a4 request:(id)a5;
- (void)addUpdatedRecord:(id)a3;
- (void)dealloc;
- (void)executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:(id)a3 completion:(id)a4;
@end

@implementation PFCloudKitCKQueryBackedImportWorkItem

- (id)initForRecordType:(id)a3 withOptions:(id)a4 request:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)PFCloudKitCKQueryBackedImportWorkItem;
  v7 = [(PFCloudKitImportRecordsWorkItem *)&v10 initWithOptions:a4 request:a5];
  if (v7)
  {
    v7->_recordType = (NSString *)a3;
    if (a4) {
      v8 = (void *)*((void *)a4 + 3);
    }
    else {
      v8 = 0;
    }
    v7->_zoneIDToQuery = (CKRecordZoneID *)+[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:](PFCloudKitSerializer, "defaultRecordZoneIDForDatabaseScope:", [v8 databaseScope]);
  }
  return v7;
}

- (void)dealloc
{
  self->_maxModificationDate = 0;
  self->_queryCursor = 0;

  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitCKQueryBackedImportWorkItem;
  [(PFCloudKitImportRecordsWorkItem *)&v3 dealloc];
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PFCloudKitCKQueryBackedImportWorkItem;
  objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", -[PFCloudKitImportRecordsWorkItem description](&v7, sel_description));
  v4 = v3;
  maxModificationDate = self->_maxModificationDate;
  if (!maxModificationDate) {
    maxModificationDate = (NSDate *)@"nil";
  }
  [v3 appendFormat:@" { %@:%@:%@ }", self->_zoneIDToQuery, self->_recordType, maxModificationDate];
  return v4;
}

- (void)executeImportOperationsAndAccumulateRecordsWithManagedObjectContext:(id)a3 completion:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (!self)
  {
    v20 = [NSCloudKitMirroringResult alloc];
    request = 0;
    id v8 = 0;
    goto LABEL_22;
  }
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3052000000;
  v44 = __Block_byref_object_copy__6;
  v45 = __Block_byref_object_dispose__6;
  uint64_t v46 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 1;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3052000000;
  v34 = __Block_byref_object_copy__6;
  v35 = __Block_byref_object_dispose__6;
  uint64_t v36 = 0;
  options = self->super.super._options;
  if (options) {
    monitor = options->_monitor;
  }
  else {
    monitor = 0;
  }
  location[0] = (id)MEMORY[0x1E4F143A8];
  location[1] = (id)3221225472;
  location[2] = __101__PFCloudKitCKQueryBackedImportWorkItem_newCKQueryOperationFromMetadataInManagedObjectContext_error___block_invoke;
  location[3] = &unk_1E544BBF0;
  location[4] = monitor;
  location[5] = a3;
  location[6] = self;
  location[7] = &v31;
  location[8] = &v37;
  location[9] = &v41;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)monitor, (uint64_t)location);
  if (*((unsigned char *)v38 + 24))
  {
    id v8 = 0;
  }
  else
  {
    id v8 = (id)v42[5];
    if (!v8)
    {
      uint64_t v9 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitCKQueryBackedImportWorkItem.m");
      v16 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v48 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitCKQueryBackedImportWorkItem.m";
        __int16 v49 = 1024;
        int v50 = 190;
        _os_log_fault_impl(&dword_18AB82000, v16, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }

    v32[5] = 0;
  }

  v42[5] = 0;
  v17 = (void *)v32[5];
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  if (!v17)
  {
    v20 = [NSCloudKitMirroringResult alloc];
    v22 = self->super.super._options;
    request = self->super.super._request;
    if (v22)
    {
      v23 = v22->_monitor;
      if (v23)
      {
        storeIdentifier = v23->_storeIdentifier;
LABEL_19:
        v25 = [(NSCloudKitMirroringResult *)v20 initWithRequest:request storeIdentifier:storeIdentifier success:0 madeChanges:0 error:v8];
        (*((void (**)(id, NSCloudKitMirroringResult *))a4 + 2))(a4, v25);

        v17 = 0;
        goto LABEL_20;
      }
    }
LABEL_22:
    storeIdentifier = 0;
    goto LABEL_19;
  }
  objc_initWeak(location, self);
  if ([(NSCloudKitMirroringRequest *)self->super.super._request options]) {
    -[NSCloudKitMirroringRequestOptions applyToOperation:]((uint64_t)[(NSCloudKitMirroringRequest *)self->super.super._request options], v17);
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __120__PFCloudKitCKQueryBackedImportWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke;
  v28[3] = &unk_1E544BBA0;
  objc_copyWeak(&v29, location);
  [v17 setRecordMatchedBlock:v28];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __120__PFCloudKitCKQueryBackedImportWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_2;
  v26[3] = &unk_1E544BBC8;
  objc_copyWeak(&v27, location);
  v26[4] = a4;
  [v17 setQueryCompletionBlock:v26];
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(location);
  v18 = self->super.super._options;
  if (v18) {
    database = v18->_database;
  }
  else {
    database = 0;
  }
  [(CKDatabase *)database addOperation:v17];
LABEL_20:
}

void __120__PFCloudKitCKQueryBackedImportWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      id v5 = WeakRetained;
      [WeakRetained addUpdatedRecord:a3];
      id WeakRetained = v5;
    }
  }
}

void __120__PFCloudKitCKQueryBackedImportWorkItem_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v27 = WeakRetained;
    id v8 = (void *)MEMORY[0x18C127630]();
    if ((unint64_t)__ckLoggingOverride >= 0x10) {
      uint64_t v9 = 16;
    }
    else {
      uint64_t v9 = __ckLoggingOverride;
    }
    uint64_t v10 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Finished with cursor: %@\n%@"];
    _NSCoreDataLog(v9, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[PFCloudKitCKQueryBackedImportWorkItem queryOperationFinishedWithCursor:error:completion:]");
    if (a3)
    {
      v17 = (void *)[a3 domain];
      if (![v17 isEqualToString:getCloudKitCKErrorDomain[0]()]
        || [a3 code] != 11)
      {
        goto LABEL_12;
      }
      v18 = (void *)MEMORY[0x18C127630]();
      BOOL v19 = __ckLoggingOverride != 0;
      uint64_t v20 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Failed due to querying for an unknown record type (not fatal, schema needs to be initialized): %@"];
      _NSCoreDataLog(v19, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"-[PFCloudKitCKQueryBackedImportWorkItem queryOperationFinishedWithCursor:error:completion:]");
    }
    else if (a2)
    {
      a3 = 0;
      v27[21] = a2;
LABEL_12:
      -[PFCloudKitImportRecordsWorkItem fetchOperationFinishedWithError:completion:]((uint64_t)v27, (uint64_t)a3, v7);
      id WeakRetained = v27;
      goto LABEL_13;
    }
    a3 = 0;
    goto LABEL_12;
  }
LABEL_13:
}

void __101__PFCloudKitCKQueryBackedImportWorkItem_newCKQueryOperationFromMetadataInManagedObjectContext_error___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      id WeakRetained = objc_loadWeakRetained((id *)(v3 + 32));
    }
    else {
      id WeakRetained = 0;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __101__PFCloudKitCKQueryBackedImportWorkItem_newCKQueryOperationFromMetadataInManagedObjectContext_error___block_invoke_2;
    v10[3] = &unk_1E544BBF0;
    id v5 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 48);
    v10[5] = v2;
    v10[6] = v5;
    long long v11 = *(_OWORD *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 72);
    [v5 performBlockAndWait:v10];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v7 = *MEMORY[0x1E4F281F8];
    uint64_t v13 = *MEMORY[0x1E4F28588];
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      uint64_t v9 = *(void **)(v8 + 16);
    }
    else {
      uint64_t v9 = 0;
    }
    v14[0] = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(v9, "requestIdentifier")];
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = objc_msgSend(v6, "initWithDomain:code:userInfo:", v7, 134407, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1));
  }
}

void __101__PFCloudKitCKQueryBackedImportWorkItem_newCKQueryOperationFromMetadataInManagedObjectContext_error___block_invoke_2(uint64_t a1)
{
  v11[5] = *(id *)MEMORY[0x1E4F143B8];
  v11[0] = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 8);
  if (v3) {
    v4 = *(void **)(v3 + 8);
  }
  else {
    v4 = 0;
  }
  id v5 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, *(void **)(v2 + 176), objc_msgSend(v4, "databaseScope", v11[0]), *(void *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)v11);
  if (v5
    && ((v6 = *(void *)(a1 + 32)) == 0 ? (uint64_t v7 = 0) : (uint64_t v7 = *(void *)(v6 + 152)),
        uint64_t v8 = +[NSCKRecordZoneQuery zoneQueryForRecordType:inZone:inStore:managedObjectContext:error:]((uint64_t)NSCKRecordZoneQuery, v7, v5, *(void *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)v11), (v9 = v8) != 0))
  {
    uint64_t v10 = -[NSCKRecordZoneQuery createQueryForUpdatingRecords](v8);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [objc_alloc(getCloudKitCKQueryOperationClass()) initWithQuery:v10];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setZoneID:*(void *)(*(void *)(a1 + 32) + 176)];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setCursor:", -[NSManagedObject queryCursor](v9, "queryCursor"));
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = v11[0];
  }
}

- (void)addUpdatedRecord:(id)a3
{
  v4 = self;
  if (self) {
    self = (PFCloudKitCKQueryBackedImportWorkItem *)self->super._encounteredErrors;
  }
  if (![(PFCloudKitCKQueryBackedImportWorkItem *)self count])
  {
    maxModificationDate = v4->_maxModificationDate;
    if (!maxModificationDate)
    {
      uint64_t v6 = 0;
      goto LABEL_8;
    }
    if (-[NSDate compare:](maxModificationDate, "compare:", [a3 modificationDate]) == NSOrderedAscending)
    {
      uint64_t v6 = v4->_maxModificationDate;
LABEL_8:

      v4->_maxModificationDate = (NSDate *)(id)[a3 modificationDate];
    }
  }
  v7.receiver = v4;
  v7.super_class = (Class)PFCloudKitCKQueryBackedImportWorkItem;
  [(PFCloudKitImportRecordsWorkItem *)&v7 addUpdatedRecord:a3];
}

- (BOOL)applyAccumulatedChangesToStore:(id)a3 inManagedObjectContext:(id)a4 withStoreMonitor:(id)a5 madeChanges:(BOOL *)a6 error:(id *)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3052000000;
  uint64_t v33 = __Block_byref_object_copy__6;
  v34 = __Block_byref_object_dispose__6;
  uint64_t v35 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  unsigned __int8 v29 = 0;
  v25.receiver = self;
  v25.super_class = (Class)PFCloudKitCKQueryBackedImportWorkItem;
  unsigned __int8 v29 = [(PFCloudKitImportRecordsWorkItem *)&v25 applyAccumulatedChangesToStore:a3 inManagedObjectContext:a4 withStoreMonitor:a5 madeChanges:a6 error:&v35];
  if (*((unsigned char *)v27 + 24))
  {
    if (!a5 || !*((unsigned char *)a5 + 21))
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __130__PFCloudKitCKQueryBackedImportWorkItem_applyAccumulatedChangesToStore_inManagedObjectContext_withStoreMonitor_madeChanges_error___block_invoke;
      v24[3] = &unk_1E544BA50;
      v24[4] = self;
      v24[5] = a3;
      v24[6] = a4;
      v24[7] = &v30;
      v24[8] = &v26;
      [a4 performBlockAndWait:v24];
    }
  }
  else
  {
    id v12 = (id)v31[5];
  }
  if (!*((unsigned char *)v27 + 24))
  {
    id v15 = (id)v31[5];
    if (v15)
    {
      if (a7) {
        *a7 = v15;
      }
    }
    else
    {
      uint64_t v16 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitCKQueryBackedImportWorkItem.m");
      uint64_t v23 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitCKQueryBackedImportWorkItem.m";
        __int16 v38 = 1024;
        int v39 = 268;
        _os_log_fault_impl(&dword_18AB82000, v23, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v31[5] = 0;
  char v13 = *((unsigned char *)v27 + 24);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  return v13;
}

id __130__PFCloudKitCKQueryBackedImportWorkItem_applyAccumulatedChangesToStore_inManagedObjectContext_withStoreMonitor_madeChanges_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 8);
  if (v3) {
    v4 = *(void **)(v3 + 8);
  }
  else {
    v4 = 0;
  }
  id v5 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, *(void **)(v2 + 176), [v4 databaseScope], *(void *)(a1 + 40), *(void **)(a1 + 48), *(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    return *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    uint64_t v7 = *(void *)(v6 + 152);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = +[NSCKRecordZoneQuery zoneQueryForRecordType:inZone:inStore:managedObjectContext:error:]((uint64_t)NSCKRecordZoneQuery, v7, v5, *(void *)(a1 + 40), *(void **)(a1 + 48), *(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v8)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    return *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    uint64_t v10 = *(void *)(v9 + 160);
  }
  else {
    uint64_t v10 = 0;
  }
  [(NSManagedObject *)v8 setMostRecentRecordModificationDate:v10];
  id result = (id)[*(id *)(a1 + 48) save:*(void *)(*(void *)(a1 + 56) + 8) + 40];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (_BYTE)result;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    return *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
  return result;
}

- (BOOL)updateMetadataForAccumulatedChangesInContext:(id)a3 inStore:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v27 = 0;
  zoneIDToQuery = self->_zoneIDToQuery;
  options = self->super.super._options;
  if (options) {
    database = options->_database;
  }
  else {
    database = 0;
  }
  id v12 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, zoneIDToQuery, [(CKDatabase *)database databaseScope], (uint64_t)a4, a3, (uint64_t)&v27);
  if (!v12
    || (char v13 = v12,
        (uint64_t v14 = +[NSCKRecordZoneQuery zoneQueryForRecordType:inZone:inStore:managedObjectContext:error:]((uint64_t)NSCKRecordZoneQuery, (uint64_t)self->_recordType, v12, (uint64_t)a4, a3, (uint64_t)&v27)) == 0)|| (v15 = v14, -[NSManagedObject setQueryCursor:](v14, "setQueryCursor:", self->_queryCursor), -[NSManagedObject setLastFetchDate:](v15, "setLastFetchDate:", -[NSManagedObject lastFetchDate](v13, "lastFetchDate")), v26.receiver = self, v26.super_class = (Class)PFCloudKitCKQueryBackedImportWorkItem, !-[PFCloudKitImportRecordsWorkItem updateMetadataForAccumulatedChangesInContext:inStore:error:](&v26, sel_updateMetadataForAccumulatedChangesInContext_inStore_error_, a3, a4,
           a5)))
  {
    if (v27)
    {
      if (a5)
      {
        LOBYTE(v16) = 0;
        *a5 = v27;
        return v16;
      }
    }
    else
    {
      uint64_t v17 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitCKQueryBackedImportWorkItem.m");
      uint64_t v24 = __pflogFaultLog;
      BOOL v16 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v16) {
        return v16;
      }
      *(_DWORD *)buf = 136315394;
      unsigned __int8 v29 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitCKQueryBackedImportWorkItem.m";
      __int16 v30 = 1024;
      int v31 = 307;
      _os_log_fault_impl(&dword_18AB82000, v24, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    LOBYTE(v16) = 0;
    return v16;
  }
  LOBYTE(v16) = 1;
  return v16;
}

- (BOOL)commitMetadataChangesWithContext:(id)a3 forStore:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v36 = 0;
  zoneIDToQuery = self->_zoneIDToQuery;
  options = self->super.super._options;
  if (options) {
    database = options->_database;
  }
  else {
    database = 0;
  }
  id v12 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, zoneIDToQuery, [(CKDatabase *)database databaseScope], (uint64_t)a4, a3, (uint64_t)&v36);
  if (!v12) {
    goto LABEL_17;
  }
  char v13 = v12;
  -[NSManagedObject setLastFetchDate:](v12, "setLastFetchDate:", [MEMORY[0x1E4F1C9C8] date]);
  uint64_t v14 = +[NSCKRecordZoneQuery zoneQueryForRecordType:inZone:inStore:managedObjectContext:error:]((uint64_t)NSCKRecordZoneQuery, (uint64_t)self->_recordType, v13, (uint64_t)a4, a3, (uint64_t)&v36);
  if (!v14) {
    goto LABEL_17;
  }
  id v15 = v14;
  [(NSManagedObject *)v14 setQueryCursor:self->_queryCursor];
  -[NSManagedObject setLastFetchDate:](v15, "setLastFetchDate:", [MEMORY[0x1E4F1C9C8] date]);
  [(NSManagedObject *)v13 setNeedsImport:0];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  BOOL v16 = (void *)[(NSManagedObject *)v13 queries];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        if ([*(id *)(*((void *)&v32 + 1) + 8 * i) queryCursor])
        {
          [(NSManagedObject *)v13 setNeedsImport:1];
          goto LABEL_15;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
LABEL_15:
  v31.receiver = self;
  v31.super_class = (Class)PFCloudKitCKQueryBackedImportWorkItem;
  if (![(PFCloudKitImportRecordsWorkItem *)&v31 commitMetadataChangesWithContext:a3 forStore:a4 error:&v36])
  {
LABEL_17:
    if (v36)
    {
      if (a5)
      {
        LOBYTE(v21) = 0;
        *a5 = v36;
        return v21;
      }
    }
    else
    {
      uint64_t v22 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v22, v23, v24, v25, v26, v27, v28, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitCKQueryBackedImportWorkItem.m");
      unsigned __int8 v29 = __pflogFaultLog;
      BOOL v21 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v21) {
        return v21;
      }
      *(_DWORD *)buf = 136315394;
      __int16 v38 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitCKQueryBackedImportWorkItem.m";
      __int16 v39 = 1024;
      int v40 = 355;
      _os_log_fault_impl(&dword_18AB82000, v29, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    LOBYTE(v21) = 0;
    return v21;
  }
  LOBYTE(v21) = 1;
  return v21;
}

@end