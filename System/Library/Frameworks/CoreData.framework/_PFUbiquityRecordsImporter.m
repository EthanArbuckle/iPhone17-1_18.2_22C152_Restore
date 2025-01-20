@interface _PFUbiquityRecordsImporter
+ (NSPersistentStoreCoordinator)createPrivateCoordinatorAndStoreForStore:(uint64_t)a3 atURL:(void *)a4 error:;
+ (NSPersistentStoreCoordinator)createPrivateCoordinatorForStore:(uint64_t)a1 error:(void *)a2;
+ (uint64_t)addPrivateStore:(void *)a3 toCoordinator:(uint64_t)a4 atURL:(uint64_t *)a5 error:;
+ (void)afterDelay:(uint64_t)a3 executeBlockOnRootQueue:;
+ (void)executeBlockOnRootQueue:(uint64_t)a1;
+ (void)initialize;
- (BOOL)discoverAndImportAllAvailableLogs:(id *)a3 error:;
- (BOOL)scheduleBaselineRecoveryOperationWithActiveBaselineOperation:(BOOL)result;
- (NSString)description;
- (_PFUbiquityRecordsImporter)init;
- (_PFUbiquityRecordsImporter)initWithLocalPeerID:(id)a3 andUbiquityRootLocation:(id)a4;
- (id)createSortedOperationsArrayWithMetadata:(id)a3 isFirstImport:(BOOL)a4;
- (id)postImportNotificationForStoreName:(uint64_t)a3 andLocalPeerID:(void *)a4 withUserInfo:;
- (int64_t)context:(id)a3 shouldHandleInaccessibleFault:(id)a4 forObjectID:(id)a5 andTrigger:(id)a6;
- (uint64_t)createNewSetOfObjectIDsForCoordinator:(void *)a3 fromObjectIDs:;
- (uint64_t)schedulePendingLogs:(void *)a3 error:;
- (uint64_t)tearDown;
- (void)baselineRollOperationEncounteredAnInconsistentBaselineState:(id)a3;
- (void)baselineRollOperationWasUnableToLockPersistentStore:(id)a3;
- (void)dealloc;
- (void)initWithLocalPeerID:(uint64_t)a3 ubiquityRootLocation:(void *)a4 storeName:(void *)a5 andPrivateStore:;
- (void)metadataInconsistencyDetectedForStore:(uint64_t)a1;
- (void)operation:(id)a3 failedWithError:(id)a4;
- (void)operationDidFinish:(id)a3;
- (void)operationWasInterruptedDuringImport:(id)a3;
- (void)recoveryOperation:(id)a3 didReplaceLocalStoreFileWithBaseline:(id)a4;
- (void)recoveryOperation:(id)a3 encounteredAnError:(id)a4 duringRecoveryOfBaseline:(id)a5;
- (void)requestBaselineRollForStore:(uint64_t)a1;
- (void)rollResponseOperation:(id)a3 encounteredAnError:(id)a4 whileTryingToAdoptBaseline:(id)a5;
- (void)rollResponseOperation:(id)a3 successfullyAdoptedBaseline:(id)a4;
- (void)scheduleBaselineRollResponseOperationForBaselineAtLocation:(uint64_t)a1;
- (void)scheduleRecoveryTimer;
@end

@implementation _PFUbiquityRecordsImporter

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _ubiquityRootQueue = (uint64_t)dispatch_queue_create("com.apple.coredata.ubiquity.monitorqueue.root", 0);
    _registeredCoords = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
}

- (_PFUbiquityRecordsImporter)init
{
  return 0;
}

- (_PFUbiquityRecordsImporter)initWithLocalPeerID:(id)a3 andUbiquityRootLocation:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_PFUbiquityRecordsImporter;
  v6 = [(_PFUbiquityRecordsImporter *)&v8 init];
  if (v6)
  {
    v6->_localPeerID = (NSString *)[a3 copy];
    v6->_importQueue = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    [(NSOperationQueue *)v6->_importQueue setMaxConcurrentOperationCount:1];
    v6->_privateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coredata.ubiquity.importer.privateQueue", 0);
    v6->_isMonitoring = 0;
    v6->_ubiquityRootLocation = (PFUbiquityLocation *)a4;
    v6->_logRestartTimer = 0;
    v6->_schedulingLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    *(_WORD *)&v6->_importOnlyActiveStores = 1;
    v6->_numPendingNotifications = 0;
    v6->_allowBaselineRoll = 0;
    v6->_schedulingContext = objc_alloc_init(PFUbiquityRecordsImporterSchedulingContext);
    v6->_sideLoadCacheWrapper = 0;
  }
  return v6;
}

- (void)initWithLocalPeerID:(uint64_t)a3 ubiquityRootLocation:(void *)a4 storeName:(void *)a5 andPrivateStore:
{
  if (!a1) {
    return 0;
  }
  v7 = (void *)[a1 initWithLocalPeerID:a2 andUbiquityRootLocation:a3];
  if (v7)
  {
    v7[6] = a4;
    v7[9] = a5;
    id v8 = (id)[a5 persistentStoreCoordinator];
    v7[8] = v8;
    v7[7] = +[PFUbiquityLocation createVersionHashStringForModel:]((uint64_t)PFUbiquityLocation, (void *)[v8 managedObjectModel]);
  }
  return v7;
}

- (void)dealloc
{
  -[_PFUbiquityRecordsImporter tearDown]((uint64_t)self);

  self->_ubiquityRootLocation = 0;
  [(NSOperationQueue *)self->_importQueue cancelAllOperations];
  [(NSOperationQueue *)self->_importQueue setSuspended:0];
  dispatch_release((dispatch_object_t)self->_privateQueue);
  self->_privateQueue = 0;

  self->_importQueue = 0;
  self->_localPeerID = 0;

  self->_schedulingLock = 0;
  logRestartTimer = self->_logRestartTimer;
  if (logRestartTimer)
  {
    dispatch_source_cancel(logRestartTimer);
    self->_logRestartTimer = 0;
  }
  self->_privateStore = 0;

  self->_privatePSC = 0;
  self->_storeName = 0;

  self->_modelVersionHash = 0;
  self->_schedulingContext = 0;

  self->_sideLoadCacheWrapper = 0;
  v4.receiver = self;
  v4.super_class = (Class)_PFUbiquityRecordsImporter;
  [(_PFUbiquityRecordsImporter *)&v4 dealloc];
}

- (uint64_t)tearDown
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 24))
    {
      *(unsigned char *)(result + 24) = 0;
      *(unsigned char *)(result + 128) = 0;
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", result);
      [*(id *)(v1 + 8) setSuspended:1];
      v2 = *(void **)(v1 + 8);
      return [v2 cancelAllOperations];
    }
  }
  return result;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_PFUbiquityRecordsImporter;
  objc_super v4 = [(_PFUbiquityRecordsImporter *)&v8 description];
  if (self)
  {
    localPeerID = self->_localPeerID;
    ubiquityRootLocation = self->_ubiquityRootLocation;
  }
  else
  {
    ubiquityRootLocation = 0;
    localPeerID = 0;
  }
  return (NSString *)[v3 stringWithFormat:@"%@:\n\tubiquityRootLocation: %@\n\tlocalPeerID: %@\n", v4, ubiquityRootLocation, localPeerID];
}

- (id)createSortedOperationsArrayWithMetadata:(id)a3 isFirstImport:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v72 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(0, "count"));
  v70 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(0, "count"));
  v90 = 0;
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  schedulingContext = self->_schedulingContext;
  if (schedulingContext) {
    pendingLogLocations = schedulingContext->_pendingLogLocations;
  }
  else {
    pendingLogLocations = 0;
  }
  id obj = (id)[v7 initWithSet:pendingLogLocations copyItems:0];
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Log locations: %@", "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 199, obj);
  }
  sideLoadCacheWrapper = self->_sideLoadCacheWrapper;
  if (!sideLoadCacheWrapper)
  {
    if (a3) {
      sideLoadCacheWrapper = (PFUbiquitySwitchboardCacheWrapper *)*((void *)a3 + 11);
    }
    else {
      sideLoadCacheWrapper = 0;
    }
  }
  Property = sideLoadCacheWrapper;
  v68 = Property;
  if (Property) {
    Property = (PFUbiquitySwitchboardCacheWrapper *)objc_getProperty(Property, v12, 64, 1);
  }
  v69 = Property;
  if (!v69)
  {
    uint64_t v97 = 0;
    v98 = &v97;
    uint64_t v99 = 0x3052000000;
    v100 = __Block_byref_object_copy__38;
    v101 = __Block_byref_object_dispose__38;
    uint64_t v102 = 0;
    privatePSC = self->_privatePSC;
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __84___PFUbiquityRecordsImporter_createSortedOperationsArrayWithMetadata_isFirstImport___block_invoke;
    v89[3] = &unk_1E544B9B0;
    v89[4] = self;
    v89[5] = &v97;
    [(NSPersistentStoreCoordinator *)privatePSC performBlockAndWait:v89];
    v14 = [PFUbiquityKnowledgeVector alloc];
    uint64_t v15 = [(PFUbiquityKnowledgeVector *)v14 initWithStoreKnowledgeVectorDictionary:v98[5]];

    v69 = (id *)v15;
    _Block_object_dispose(&v97, 8);
  }
  transactionLogCache = v68;
  if (v68) {
    transactionLogCache = v68->_transactionLogCache;
  }
  v17 = transactionLogCache;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  uint64_t v18 = [obj countByEnumeratingWithState:&v85 objects:v96 count:16];
  if (!v18)
  {
    v76 = v17;
    goto LABEL_76;
  }
  uint64_t v19 = *(void *)v86;
  uint64_t v78 = *MEMORY[0x1E4F281F8];
  v76 = v17;
  do
  {
    uint64_t v20 = 0;
    do
    {
      if (*(void *)v86 != v19) {
        objc_enumerationMutation(obj);
      }
      uint64_t v21 = *(void *)(*((void *)&v85 + 1) + 8 * v20);
      if (!v21 || !*(void *)(v21 + 40))
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Skipping (storeName): %@", "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 226, v21);
        }
        goto LABEL_68;
      }
      if (([*(id *)(v21 + 48) isEqualToString:self->_modelVersionHash] & 1) == 0)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Skipping (model version hash): %@", "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 231, v21);
        }
        goto LABEL_68;
      }
      if (v76)
      {
        if (v4) {
          goto LABEL_24;
        }
      }
      else
      {
        v76 = [[PFUbiquityTransactionLogCache alloc] initWithLocalPeerID:self->_localPeerID andGlobalIDCache:0];
        if (v4)
        {
LABEL_24:
          char v22 = [*(id *)(v21 + 32) isEqualToString:self->_localPeerID];
          goto LABEL_31;
        }
      }
      char v22 = 0;
LABEL_31:
      v23 = -[PFUbiquityTransactionLogCache retainedCachedLogForLocation:loadWithRetry:error:]((uint64_t)v76, v21, v22, &v90);
      v24 = v23;
      if (v23)
      {
        if (!v23->_transactionLogType)
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSkipping log because it is of unknown type: %@", "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 261, self, v21);
          }
          goto LABEL_61;
        }
        transactionLogLocation = v23->_transactionLogLocation;
        if (transactionLogLocation) {
          exportingPeerID = transactionLogLocation->_exportingPeerID;
        }
        else {
          exportingPeerID = 0;
        }
        if (v69)
        {
          uint64_t v27 = [v69[1] objectForKey:exportingPeerID];
          transactionLogLocation = v24->_transactionLogLocation;
        }
        else
        {
          uint64_t v27 = 0;
        }
        if (v27) {
          v28 = (void *)v27;
        }
        else {
          v28 = &unk_1ED7E2B48;
        }
        if (transactionLogLocation) {
          storeName = transactionLogLocation->_storeName;
        }
        else {
          storeName = 0;
        }
        saveSnapshot = v24->_saveSnapshot;
        if (!saveSnapshot
          || (uint64_t v31 = [(NSMutableDictionary *)saveSnapshot->_storeNameToStoreSaveSnapshots objectForKey:storeName]) == 0|| !*(void *)(v31 + 120))
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Couldn't find transaction number in log at URL: %@\nLog Contents: %@", "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 286, v21, v24);
          }
          goto LABEL_61;
        }
        if (objc_msgSend(v28, "compare:") != -1)
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSkipping log because it has already been imported into the local store: %@\nstoreKV: %@\nlogKV: %@\n", "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 277, self, v21, v69, v24->_knowledgeVector);
          }
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"PFUbiquityLocationWasImportedNotification", v24->_transactionLogLocation);
LABEL_61:
          -[PFUbiquityRecordsImporterSchedulingContext transactionLogAtLocationWasIgnored:]((uint64_t)self->_schedulingContext, v21);

          goto LABEL_68;
        }
        v32 = (void *)-[_PFUbiquityRecordImportOperation initWithTransactionLog:persistentStore:andLocalPeerID:]([_PFUbiquityRecordImportOperation alloc], v24, (uint64_t)self->_privateStore, (uint64_t)self->_localPeerID);
        id v34 = -[PFUbiquityKnowledgeVector newKnowledgeVectorBySubtractingVector:]((uint64_t)v24->_knowledgeVector, (uint64_t)v69);
        if (v32) {
          objc_setProperty_nonatomic(v32, v33, v34, 360);
        }

        [v32 setDelegate:self];
        [v72 addObject:v32];
      }
      else if (v90)
      {
        if ([v90 code] == 4
          && objc_msgSend((id)objc_msgSend(v90, "domain"), "isEqualToString:", v78))
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Transaction log went missing: %@", "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 247, 0);
          }
        }
        else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
        {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error loading comparison metadata for transaction log: %@\nError: %@\n User Info: %@", "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 249, 0, v90, [v90 userInfo]);
        }
        -[PFUbiquityRecordsImporterSchedulingContext transactionLogAtLocation:failedToOpenWithError:]((uint64_t)self->_schedulingContext, v21, v90);
      }
      else
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Transaction log was ignored because it could not be opened, there was no error, so this probably means it was unreadable by the local peer (a different type than this peer accepts). %@", "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 255, v21);
        }
        -[PFUbiquityRecordsImporterSchedulingContext transactionLogAtLocationWasIgnored:]((uint64_t)self->_schedulingContext, v21);
      }
LABEL_68:
      ++v20;
    }
    while (v18 != v20);
    uint64_t v35 = [obj countByEnumeratingWithState:&v85 objects:v96 count:16];
    uint64_t v18 = v35;
  }
  while (v35);
LABEL_76:
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Created operations: %@", "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 304, v72);
  }
  [v72 sortUsingComparator:&__block_literal_global_28];
  if (self) {
    importQueue = self->_importQueue;
  }
  else {
    importQueue = 0;
  }
  uint64_t v37 = [(NSArray *)[(NSOperationQueue *)importQueue operations] count];
  uint64_t v38 = (uint64_t)v69;
  uint64_t v39 = (uint64_t)v69;
  if (v37)
  {
    if (self) {
      v40 = self->_importQueue;
    }
    else {
      v40 = 0;
    }
    v41 = [(NSArray *)[(NSOperationQueue *)v40 operations] reverseObjectEnumerator];
    while (1)
    {
      uint64_t v42 = [(NSEnumerator *)v41 nextObject];
      if (!v42)
      {
        uint64_t v38 = (uint64_t)v69;
        uint64_t v39 = (uint64_t)v69;
        goto LABEL_96;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v43 = *(void *)(v42 + 320);
        if (v43 && (uint64_t v44 = *(void *)(v43 + 24)) != 0) {
          v45 = *(void **)(v44 + 40);
        }
        else {
          v45 = 0;
        }
        if ([v45 isEqualToString:self->_storeName]) {
          break;
        }
      }
    }
    uint64_t v46 = *(void *)(v42 + 320);
    if (v46) {
      uint64_t v39 = *(void *)(v46 + 64);
    }
    else {
      uint64_t v39 = 0;
    }
    uint64_t v38 = (uint64_t)v69;
  }
LABEL_96:
  v80 = (id *)-[PFUbiquityKnowledgeVector newKnowledgeVectorBySubtractingVector:](v39, v38);
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  uint64_t v47 = [v72 countByEnumeratingWithState:&v81 objects:v95 count:16];
  if (!v47) {
    goto LABEL_143;
  }
  v74 = self;
  uint64_t v75 = *(void *)v82;
  while (2)
  {
    uint64_t v48 = 0;
    uint64_t v73 = v47;
    while (2)
    {
      if (*(void *)v82 != v75) {
        objc_enumerationMutation(v72);
      }
      uint64_t v49 = *(void *)(*((void *)&v81 + 1) + 8 * v48);
      if (!v49)
      {
        if (self)
        {
          uint64_t v50 = 0;
          v51 = 0;
          long long v93 = 0u;
          long long v94 = 0u;
          char v52 = 1;
          long long v91 = 0u;
          long long v92 = 0u;
          goto LABEL_105;
        }
        goto LABEL_133;
      }
      if (!self)
      {
LABEL_133:
        if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSkipping incompatible operation (%@): %@\n", "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 345, self, v80, v49);
        }
        goto LABEL_135;
      }
      uint64_t v50 = *(void *)(v49 + 360);
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      if (v50)
      {
        v51 = (void *)[*(id *)(v50 + 8) allKeys];
        char v52 = 0;
      }
      else
      {
        v51 = 0;
        char v52 = 1;
      }
LABEL_105:
      uint64_t v53 = [v51 countByEnumeratingWithState:&v91 objects:&v97 count:16];
      if (v53)
      {
        unsigned __int8 v54 = 0;
        uint64_t v55 = *(void *)v92;
        uint64_t v77 = v49;
        uint64_t v79 = v48;
        while (2)
        {
          uint64_t v56 = 0;
          do
          {
            if (*(void *)v92 != v55) {
              objc_enumerationMutation(v51);
            }
            uint64_t v57 = *(void *)(*((void *)&v91 + 1) + 8 * v56);
            if (v52) {
              v58 = 0;
            }
            else {
              v58 = (void *)[*(id *)(v50 + 8) objectForKey:*(void *)(*((void *)&v91 + 1) + 8 * v56)];
            }
            uint64_t v59 = [v58 integerValue];
            if (v80)
            {
              v60 = (void *)[v80[1] objectForKey:v57];
              if (([v60 integerValue] & 0x8000000000000000) == 0)
              {
                uint64_t v61 = [v58 integerValue];
                uint64_t v59 = v61 - [v60 integerValue];
              }
            }
            if (v59 >= 2)
            {
              uint64_t v47 = v73;
              self = v74;
              uint64_t v49 = v77;
              uint64_t v48 = v79;
              if (+[PFUbiquityLogging canLogMessageAtLevel:3])
              {
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nCan't process log with score: %@ after log with score: %@\n It is ahead of the local peer.", "-[_PFUbiquityRecordsImporter canProcessTransactionLogWithScore:afterLogWithScore:]", 431, v74, v50, v80);
              }
              goto LABEL_133;
            }
            if (((v59 == 1) & v54) == 1)
            {
              uint64_t v47 = v73;
              self = v74;
              uint64_t v49 = v77;
              uint64_t v48 = v79;
              if (+[PFUbiquityLogging canLogMessageAtLevel:2])
              {
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nCannot process log with score: %@ after log with score: %@\nIt will attempt to increment two peers simultaneously.", "-[_PFUbiquityRecordsImporter canProcessTransactionLogWithScore:afterLogWithScore:]", 438, v74, v50, v80);
              }
              goto LABEL_133;
            }
            v54 |= v59 == 1;
            ++v56;
          }
          while (v53 != v56);
          uint64_t v62 = [v51 countByEnumeratingWithState:&v91 objects:&v97 count:16];
          uint64_t v53 = v62;
          uint64_t v47 = v73;
          uint64_t v49 = v77;
          uint64_t v48 = v79;
          if (v62) {
            continue;
          }
          break;
        }
      }
      self = v74;
      if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ will process operation: %@", "-[_PFUbiquityRecordsImporter createSortedOperationsArrayWithMetadata:isFirstImport:]", 336, v74, v49);
      }
      [v70 addObject:v49];
      if (v49) {
        uint64_t v63 = *(void *)(v49 + 360);
      }
      else {
        uint64_t v63 = 0;
      }
      -[PFUbiquityKnowledgeVector updateWithKnowledgeVector:]((uint64_t)v80, v63);
      if (v49 && (uint64_t v64 = *(void *)(v49 + 320)) != 0) {
        uint64_t v65 = *(void *)(v64 + 24);
      }
      else {
        uint64_t v65 = 0;
      }
      -[PFUbiquityRecordsImporterSchedulingContext transactionLogAtLocationWasScheduled:]((uint64_t)v74->_schedulingContext, v65);
LABEL_135:
      if (++v48 != v47) {
        continue;
      }
      break;
    }
    uint64_t v66 = [v72 countByEnumeratingWithState:&v81 objects:v95 count:16];
    uint64_t v47 = v66;
    if (v66) {
      continue;
    }
    break;
  }
LABEL_143:

  if (v47) {
    objc_exception_rethrow();
  }
  return v70;
}

- (uint64_t)schedulePendingLogs:(void *)a3 error:
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 80);
  if (v4) {
    v5 = *(void **)(v4 + 16);
  }
  else {
    v5 = 0;
  }
  if ([v5 count])
  {
    v98 = a3;
    self;
    v6 = (id *)-[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, *(void *)(a1 + 48), *(void *)(a1 + 32));
    if (!v6)
    {
      uint64_t v43 = 0;
      v100 = 0;
      id v101 = 0;
      int v45 = 0;
      uint64_t v44 = 1;
LABEL_163:
      id v87 = v43;

      id v88 = v43;
      if ((v44 & 1) == 0)
      {
        if (v43)
        {
          if (v98) {
            void *v98 = v43;
          }
        }
        else
        {
          uint64_t v89 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v89, v90, v91, v92, v93, v94, v95, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m");
          v96 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            v116 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m";
            __int16 v117 = 1024;
            int v118 = 734;
            _os_log_fault_impl(&dword_18AB82000, v96, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
        }
      }

      if ((v45 | 2) != 2) {
        return v107;
      }
      return v44;
    }
    v100 = v6;
    id v101 = v6[11];
    [*(id *)(a1 + 104) lock];
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id v7 = (void *)[*(id *)(a1 + 8) operations];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v103 objects:v114 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v104;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v104 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v103 + 1) + 8 * v10);
          if (([v11 isCancelled] & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (+[PFUbiquityLogging canLogMessageAtLevel:3])
              {
                if (v11)
                {
                  uint64_t v12 = v11[40];
                  if (v12) {
                    uint64_t v12 = *(void *)(v12 + 24);
                  }
                }
                else
                {
                  uint64_t v12 = 0;
                }
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Ignoring pending log (exisitng op): %@", "-[_PFUbiquityRecordsImporter schedulePendingLogs:error:]", 636, v12);
              }
              if (v11 && (uint64_t v13 = v11[40]) != 0) {
                uint64_t v14 = *(void *)(v13 + 24);
              }
              else {
                uint64_t v14 = 0;
              }
              -[PFUbiquityRecordsImporterSchedulingContext transactionLogAtLocationWasScheduled:](*(void *)(a1 + 80), v14);
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v15 = [v7 countByEnumeratingWithState:&v103 objects:v114 count:16];
        uint64_t v8 = v15;
      }
      while (v15);
    }
    uint64_t v16 = *(void *)(a1 + 80);
    if (v16) {
      v17 = *(void **)(v16 + 16);
    }
    else {
      v17 = 0;
    }
    if (![v17 count])
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nNo more logs to schedule", "-[_PFUbiquityRecordsImporter schedulePendingLogs:error:]", 643, a1);
      }
      uint64_t v43 = 0;
      uint64_t v44 = 1;
      unsigned __int8 v107 = 1;
      int v45 = 1;
LABEL_162:
      [*(id *)(a1 + 104) unlock];
      goto LABEL_163;
    }
    uint64_t v18 = (void *)[(id)a1 createSortedOperationsArrayWithMetadata:v101 isFirstImport:a2];
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nCreated sorted operations (%d): %@", "-[_PFUbiquityRecordsImporter schedulePendingLogs:error:]", 647, a1, a2, v18);
    }
    if (!a2) {
      goto LABEL_97;
    }
    uint64_t v19 = *(void *)(a1 + 80);
    uint64_t v20 = v19 ? *(void **)(v19 + 24) : 0;
    if (![v20 count]) {
      goto LABEL_97;
    }
    uint64_t v21 = *(void *)(a1 + 80);
    memset(v125, 0, sizeof(v125));
    long long v126 = 0u;
    long long v127 = 0u;
    if (v21) {
      char v22 = *(void **)(v21 + 40);
    }
    else {
      char v22 = 0;
    }
    v23 = (void *)[v22 allKeys];
    uint64_t v24 = [v23 countByEnumeratingWithState:v125 objects:v128 count:16];
    if (v24)
    {
      uint64_t v25 = **(void **)&v125[16];
      uint64_t v26 = *MEMORY[0x1E4F281F8];
      while (2)
      {
        uint64_t v27 = 0;
        do
        {
          if (**(void **)&v125[16] != v25) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*(void *)&v125[8] + 8 * v27);
          if (v28) {
            v29 = *(void **)(v28 + 32);
          }
          else {
            v29 = 0;
          }
          if ([v29 isEqualToString:*(void *)(a1 + 32)])
          {
            v30 = v21 ? *(void **)(v21 + 40) : 0;
            uint64_t v31 = (void *)[v30 objectForKey:v28];
            if (([v31 code] != 4
               || (objc_msgSend((id)objc_msgSend(v31, "domain"), "isEqualToString:", v26) & 1) == 0)
              && [v31 code] != 134320
              && [v31 code] != 134323
              && [v31 code] != 134324)
            {
              if (v21) {
                uint64_t v46 = *(void **)(v21 + 40);
              }
              else {
                uint64_t v46 = 0;
              }
              uint64_t v43 = (void *)[v46 objectForKey:v28];
              v36 = v18;
              char v38 = 0;
              goto LABEL_95;
            }
          }
          ++v27;
        }
        while (v24 != v27);
        uint64_t v32 = [v23 countByEnumeratingWithState:v125 objects:v128 count:16];
        uint64_t v24 = v32;
        if (v32) {
          continue;
        }
        break;
      }
    }
    if (v21) {
      v33 = *(void **)(v21 + 16);
    }
    else {
      v33 = 0;
    }
    if ([v33 count])
    {
      long long v110 = 0u;
      long long v111 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      if (v21) {
        id v34 = *(void **)(v21 + 16);
      }
      else {
        id v34 = 0;
      }
      uint64_t v35 = [v34 countByEnumeratingWithState:&v108 objects:&v121 count:16];
      v36 = v18;
      if (v35)
      {
        uint64_t v37 = *(void *)v109;
        char v38 = 1;
        while (2)
        {
          uint64_t v39 = 0;
          do
          {
            if (*(void *)v109 != v37) {
              objc_enumerationMutation(v34);
            }
            uint64_t v40 = *(void *)(*((void *)&v108 + 1) + 8 * v39);
            if (v40) {
              v41 = *(void **)(v40 + 32);
            }
            else {
              v41 = 0;
            }
            if ([v41 isEqualToString:*(void *)(a1 + 32)])
            {
              uint64_t v47 = [NSString stringWithFormat:@"%@\nUnable to import logs because of failed requisit foreign peer logs.", a1];
              uint64_t v48 = (void *)MEMORY[0x1E4F28C58];
              v119[0] = *MEMORY[0x1E4F28568];
              v119[1] = @"schedulingContext";
              v120[0] = v47;
              if (!v21) {
                uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
              }
              v120[1] = v21;
              uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v120 forKeys:v119 count:2];
              uint64_t v43 = (void *)[v48 errorWithDomain:*MEMORY[0x1E4F281F8] code:134302 userInfo:v49];
              char v38 = 0;
              goto LABEL_95;
            }
            ++v39;
          }
          while (v35 != v39);
          uint64_t v42 = [v34 countByEnumeratingWithState:&v108 objects:&v121 count:16];
          uint64_t v35 = v42;
          uint64_t v43 = 0;
          if (v42) {
            continue;
          }
          goto LABEL_95;
        }
      }
    }
    else
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:2])
      {
        if (v21) {
          uint64_t v50 = *(void *)(v21 + 40);
        }
        else {
          uint64_t v50 = 0;
        }
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nEncountered errors trying to download logs, but can continue import: %@", "-[_PFUbiquityRecordsImporter checkSchedulingContextForMissingLocalPeerOperations:error:]", 487, a1, v50);
      }
      v36 = v18;
    }
    uint64_t v43 = 0;
    char v38 = 1;
LABEL_95:
    if ((v38 & 1) == 0)
    {
      uint64_t v18 = v36;
      if (!v43)
      {
        uint64_t v67 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v67, v68, v69, v70, v71, v72, v73, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m");
        v74 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v116 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m";
          __int16 v117 = 1024;
          int v118 = 503;
          _os_log_fault_impl(&dword_18AB82000, v74, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      uint64_t v44 = 0;
LABEL_142:
      if (v43) {
        id v80 = v43;
      }

      if (v43) {
        id v81 = v43;
      }
      BOOL v86 = 0;
      if (v44)
      {
        uint64_t v82 = *(void *)(a1 + 80);
        long long v83 = v82 ? *(void **)(v82 + 16) : 0;
        if ([v83 count]
          || ((uint64_t v84 = *(void *)(a1 + 80)) == 0 ? (v85 = 0) : (v85 = *(void **)(v84 + 24)), [v85 count]))
        {
          BOOL v86 = 1;
        }
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nFinished scheduling logs with context: %@", "-[_PFUbiquityRecordsImporter schedulePendingLogs:error:]", 679, a1, *(void *)(a1 + 80));
      }
      if (v86)
      {
        [*(id *)(a1 + 104) unlock];
        if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nWill reschedule pending logs: %@", "-[_PFUbiquityRecordsImporter schedulePendingLogs:error:]", 687, a1, *(void *)(a1 + 80));
        }
        int v45 = 0;
        goto LABEL_163;
      }
      int v45 = 0;
      goto LABEL_162;
    }
    uint64_t v18 = v36;
LABEL_97:
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nScheduling operations (%d): %@", "-[_PFUbiquityRecordsImporter schedulePendingLogs:error:]", 653, a1, a2, v18);
    }
    [v18 makeObjectsPerformSelector:sel_setDelegate_ withObject:a1];
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ importing operations: \n%@\n", "-[_PFUbiquityRecordsImporter scheduleTransactionLogOperations:synchronous:error:]", 515, a1, v18);
    }
    if ([v18 count])
    {
      [*(id *)(a1 + 104) lock];
      *(void *)(a1 + 136) += [v18 count];
      [*(id *)(a1 + 104) unlock];
      if (a2)
      {
        [*(id *)(a1 + 8) setSuspended:1];
        long long v123 = 0u;
        long long v124 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        uint64_t v51 = [v18 countByEnumeratingWithState:&v121 objects:v128 count:16];
        if (v51)
        {
          uint64_t v52 = *(void *)v122;
          while (2)
          {
            for (uint64_t i = 0; i != v51; ++i)
            {
              if (*(void *)v122 != v52) {
                objc_enumerationMutation(v18);
              }
              uint64_t v54 = *(void *)(*((void *)&v121 + 1) + 8 * i);
              [(id)v54 setDelegate:0];
              if (*(void *)(a1 + 88))
              {
                uint64_t v55 = objc_alloc_init(PFUbiquityImportContext);
                uint64_t v57 = v55;
                if (v55) {
                  objc_setProperty_nonatomic(v55, v56, *(id *)(a1 + 88), 88);
                }
                if (v54) {
                  objc_setProperty_nonatomic((id)v54, v56, v57, 400);
                }
              }
              [(id)v54 start];
              if (!v54) {
                goto LABEL_122;
              }
              if (!*(unsigned char *)(v54 + 408))
              {
                uint64_t v43 = *(void **)(v54 + 416);
                if (!v43)
                {
LABEL_122:
                  uint64_t v58 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
                  _NSCoreDataLog(17, v58, v59, v60, v61, v62, v63, v64, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m");
                  uint64_t v65 = __pflogFaultLog;
                  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)v125 = 136315394;
                    *(void *)&v125[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity"
                                          "/_PFUbiquityRecordsImporter.m";
                    *(_WORD *)&v125[12] = 1024;
                    *(_DWORD *)&v125[14] = 550;
                    _os_log_fault_impl(&dword_18AB82000, v65, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v125, 0x12u);
                  }
                  uint64_t v43 = 0;
                }
                if (+[PFUbiquityLogging canLogMessageAtLevel:0])
                {
                  if (v54) {
                    uint64_t v66 = *(void **)(v54 + 416);
                  }
                  else {
                    uint64_t v66 = 0;
                  }
                  NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Import operation failed while synchronously restoring logs, aborting: %@\nError: %@\n User Info: %@\nOperations: %@", "-[_PFUbiquityRecordsImporter scheduleTransactionLogOperations:synchronous:error:]", 551, v54, v66, [v66 userInfo], v18);
                }
                uint64_t v44 = 0;
                goto LABEL_135;
              }
            }
            uint64_t v51 = [v18 countByEnumeratingWithState:&v121 objects:v128 count:16];
            if (v51) {
              continue;
            }
            break;
          }
          uint64_t v43 = 0;
          uint64_t v44 = 1;
        }
        else
        {
          uint64_t v43 = 0;
          uint64_t v44 = 1;
        }
LABEL_135:
        [*(id *)(a1 + 8) setSuspended:0];
      }
      else
      {
        uint64_t v43 = 0;
        [*(id *)(a1 + 8) addOperations:v18 waitUntilFinished:0];
        uint64_t v44 = 1;
      }
    }
    else
    {
      uint64_t v43 = 0;
      uint64_t v44 = 1;
    }
    uint64_t v75 = *(void *)(a1 + 80);
    if (v75) {
      v76 = *(void **)(v75 + 8);
    }
    else {
      v76 = 0;
    }
    if ([v76 count])
    {
      uint64_t v77 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v78 = *(void *)(a1 + 40);
      v112 = @"PFLogLocationsKey";
      uint64_t v79 = *(void *)(a1 + 80);
      if (v79) {
        uint64_t v79 = *(void *)(v79 + 8);
      }
      uint64_t v113 = v79;
      objc_msgSend(v77, "postNotificationName:object:userInfo:", @"PFUbiquityLocationsWereScheduledNotification", v78, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1));
    }
    goto LABEL_142;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nAsked to schedule but nothing to schedule in the context: %@", "-[_PFUbiquityRecordsImporter schedulePendingLogs:error:]", 609, a1, *(void *)(a1 + 80));
  }
  return 1;
}

- (BOOL)discoverAndImportAllAvailableLogs:(id *)a3 error:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Starting scan of location: %@", "-[_PFUbiquityRecordsImporter discoverAndImportAllAvailableLogs:error:]", 747, a1[5]);
  }
  id v45 = 0;
  id v7 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, a1[5], a1[4]);
  uint64_t v8 = v7;
  if (v7)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v50 = 0;
    uint64_t v9 = a1[5];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __70___PFUbiquityRecordsImporter_discoverAndImportAllAvailableLogs_error___block_invoke;
    v44[3] = &unk_1E544E958;
    v44[4] = buf;
    -[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:](v7, v9, 1, 1, &v45, (uint64_t)v44);
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      id v10 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, a1[5], (uint64_t)&v45);
      v11 = v10;
      if (v10)
      {
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v41 != v13) {
                objc_enumerationMutation(v11);
              }
              uint64_t v15 = *(void *)(*((void *)&v40 + 1) + 8 * i);
              if (v15
                && *(_DWORD *)(v15 + 24) == 22
                && [*(id *)(v15 + 40) isEqualToString:a1[6]]
                && [*(id *)(v15 + 48) isEqualToString:a1[7]])
              {
                -[PFUbiquityRecordsImporterSchedulingContext addPendingLogLocation:](a1[10], v15);
              }
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v40 objects:v48 count:16];
          }
          while (v12);
        }
        uint64_t v16 = a1[10];
        if (v16) {
          v17 = *(void **)(v16 + 16);
        }
        else {
          v17 = 0;
        }
        int v18 = 1;
        if ([v17 count])
        {
          id v19 = objc_alloc(MEMORY[0x1E4F1CAD0]);
          uint64_t v20 = a1[10];
          if (v20) {
            uint64_t v21 = *(void *)(v20 + 16);
          }
          else {
            uint64_t v21 = 0;
          }
          char v22 = (void *)[v19 initWithSet:v21 copyItems:0];
          global_queue = dispatch_get_global_queue(0, 0);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __70___PFUbiquityRecordsImporter_discoverAndImportAllAvailableLogs_error___block_invoke_2;
          block[3] = &unk_1E544B778;
          block[4] = v22;
          block[5] = a1;
          dispatch_async(global_queue, block);

          int v18 = -[_PFUbiquityRecordsImporter schedulePendingLogs:error:]((uint64_t)a1, a2, &v45);
        }
      }
      else
      {
        int v18 = 0;
      }
    }
    else
    {
      int v18 = 0;
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v46 = *MEMORY[0x1E4F28588];
    uint64_t v47 = @"Importer aborted scanning for logs because it failed to acquire a file coordinator.";
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    int v18 = 0;
    id v45 = (id)[v24 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v25];
  }
  BOOL v26 = v18 != 0;
  id v27 = v45;
  [v6 drain];
  id v28 = v45;
  id v29 = 0;
  if (!v18)
  {
    if (v45)
    {
      if (a3) {
        *a3 = v45;
      }
    }
    else
    {
      uint64_t v30 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m");
      uint64_t v37 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityR"
                             "ecordsImporter.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 815;
        _os_log_fault_impl(&dword_18AB82000, v37, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  return v26;
}

- (uint64_t)createNewSetOfObjectIDsForCoordinator:(void *)a3 fromObjectIDs:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(a3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(a3);
        }
        v11 = *(NSTemporaryObjectID **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = -[NSPersistentStoreCoordinator managedObjectIDForURIRepresentation:error:](a2, (CFURLRef)[(NSTemporaryObjectID *)v11 URIRepresentation], 0);
        if (v12)
        {
          uint64_t v13 = (void *)v6;
        }
        else
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:")) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nDidn't get an object ID back for the application's coordinator: %@\n%@", "-[_PFUbiquityRecordsImporter createNewSetOfObjectIDsForCoordinator:fromObjectIDs:]", 904, a1, a2, v11);
          }
          uint64_t v13 = (void *)v6;
          uint64_t v12 = v11;
        }
        [v13 addObject:v12];
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  return v6;
}

- (id)postImportNotificationForStoreName:(uint64_t)a3 andLocalPeerID:(void *)a4 withUserInfo:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v7 = (uint64_t)result;
    id v22 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:a4];
    self;
    id v9 = -[PFUbiquitySwitchboard createSetOfCoordinatorsForPersistentStoreName:andLocalPeerID:atUbiquityRootLocation:](_sharedSwitchboard, a2, a3);
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nGot set of persistent store coordinators for store named: %@\nCoordinators: %@", "-[_PFUbiquityRecordsImporter postImportNotificationForStoreName:andLocalPeerID:withUserInfo:]", 928, v7, a2, v9);
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v9;
    uint64_t v25 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    id v10 = 0;
    if (v25)
    {
      uint64_t v24 = *(void *)v28;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * v11);
          id v13 = (id)[a4 objectForKey:@"inserted"];
          uint64_t v14 = (void *)-[_PFUbiquityRecordsImporter createNewSetOfObjectIDsForCoordinator:fromObjectIDs:](v7, v12, v13);
          [v8 setObject:v14 forKey:@"inserted"];

          id v15 = (id)[a4 objectForKey:@"updated"];
          long long v16 = (void *)-[_PFUbiquityRecordsImporter createNewSetOfObjectIDsForCoordinator:fromObjectIDs:](v7, v12, v15);
          [v8 setObject:v16 forKey:@"updated"];

          id v17 = (id)[a4 objectForKey:@"deleted"];
          long long v18 = (void *)-[_PFUbiquityRecordsImporter createNewSetOfObjectIDsForCoordinator:fromObjectIDs:](v7, v12, v17);
          [v8 setObject:v18 forKey:@"deleted"];

          id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28EA0]) initWithName:@"com.apple.coredata.ubiquity.importer.didfinishimport" object:v12 userInfo:v8];
          if (!(_BYTE)dword_1EB270AB0
            && (NSClassFromString((NSString *)@"NSApplication")
             || NSClassFromString((NSString *)@"UIApplication"))
            && !(_BYTE)dword_1EB270AB0)
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __93___PFUbiquityRecordsImporter_postImportNotificationForStoreName_andLocalPeerID_withUserInfo___block_invoke;
            block[3] = &unk_1E544C720;
            block[4] = v10;
            block[5] = v12;
            dispatch_async(MEMORY[0x1E4F14428], block);
          }
          else
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:3])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Posting import notification: %@\nFor coordinator: %p\n", "-[_PFUbiquityRecordsImporter postImportNotificationForStoreName:andLocalPeerID:withUserInfo:]", 968, v10, v12);
            }
            objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v10);
          }
          uint64_t v8 = 0;
          ++v11;
        }
        while (v25 != v11);
        uint64_t v19 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        uint64_t v8 = 0;
        uint64_t v25 = v19;
      }
      while (v19);
      uint64_t v20 = obj;
      uint64_t v21 = 0;
    }
    else
    {
      uint64_t v20 = obj;
      uint64_t v21 = v8;
    }

    [v22 drain];
    return 0;
  }
  return result;
}

- (void)operationDidFinish:(id)a3
{
  self->_numPendingNotifications = 0;
  if (a3 && (uint64_t v5 = *((void *)a3 + 40)) != 0 && *(void *)(v5 + 24))
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v7 = *((void *)a3 + 40);
    if (v7) {
      uint64_t v8 = *(void *)(v7 + 24);
    }
    else {
      uint64_t v8 = 0;
    }
    [v6 postNotificationName:@"PFUbiquityLocationWasImportedNotification" object:v8];
    id v9 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  }
  else
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nOperation missing transaction log location: %@", "-[_PFUbiquityRecordsImporter operationDidFinish:]", 1002, self, a3);
    }
    id v9 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    if (!a3)
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      goto LABEL_20;
    }
  }
  uint64_t v10 = *((void *)a3 + 42);
  if (v10) {
    [v9 setObject:v10 forKey:@"inserted"];
  }
  uint64_t v11 = *((void *)a3 + 43);
  if (v11) {
    [v9 setObject:v11 forKey:@"updated"];
  }
  uint64_t v12 = *((void *)a3 + 44);
  if (v12) {
    [v9 setObject:v12 forKey:@"deleted"];
  }
  uint64_t v13 = *((void *)a3 + 40);
  if (v13 && (uint64_t v14 = *(void *)(v13 + 24)) != 0) {
    uint64_t v15 = *(void *)(v14 + 40);
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = *((void *)a3 + 31);
LABEL_20:
  -[_PFUbiquityRecordsImporter postImportNotificationForStoreName:andLocalPeerID:withUserInfo:](self, v15, v16, v9);
  [(NSRecursiveLock *)self->_schedulingLock lock];
  unint64_t pendingImportOperationsCount = self->_pendingImportOperationsCount;
  if (pendingImportOperationsCount)
  {
    unint64_t v18 = pendingImportOperationsCount - 1;
    self->_unint64_t pendingImportOperationsCount = v18;
    if (v18)
    {
      uint64_t v19 = 0;
      goto LABEL_37;
    }
  }
  self;
  id v20 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)self->_storeName, (uint64_t)self->_localPeerID);
  uint64_t v19 = v20;
  if (v20 && (uint64_t v21 = *((void *)v20 + 11)) != 0)
  {
    uint64_t v22 = *(void *)(v21 + 88);
    if (v22)
    {
      char v23 = 0;
      uint64_t v24 = *(void *)(v22 + 48);
      if (!a3) {
        goto LABEL_40;
      }
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v22 = 0;
  }
  uint64_t v24 = 0;
  char v23 = 1;
  if (!a3) {
    goto LABEL_40;
  }
LABEL_27:
  uint64_t v25 = *((void *)a3 + 40);
  if (v25)
  {
    uint64_t v26 = *(void *)(v25 + 24);
    if (v26)
    {
      uint64_t v27 = *(void *)(v26 + 40);
      goto LABEL_30;
    }
  }
LABEL_40:
  uint64_t v27 = 0;
LABEL_30:
  -[PFUbiquityTransactionLogCache removeLogsCachedForStoreNamed:withUbiquityRootLocation:](v24, v27, (uint64_t)self->_ubiquityRootLocation);
  if (v23) {
    uint64_t v28 = 0;
  }
  else {
    uint64_t v28 = *(void *)(v22 + 56);
  }
  if (-[PFUbiquityTransactionHistoryCache purgeCacheAndWritePendingEntries:error:](v28, 1))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nWrote pending entries to disk after imports finished.", "-[_PFUbiquityRecordsImporter operationDidFinish:]", 1043, self);
    }
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:1])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError attempting to write pending transaction history to disk: %@\nUser Info: %@", "-[_PFUbiquityRecordsImporter operationDidFinish:]", 1045, self, 0, [0 userInfo]);
  }
LABEL_37:

  [(NSRecursiveLock *)self->_schedulingLock unlock];
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a4 code];
  if (v7 <= 134304)
  {
    if (v7 == 134302)
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:0])
      {
        uint64_t v11 = [a4 userInfo];
        if (a3) {
          uint64_t v12 = *((void *)a3 + 40);
        }
        else {
          uint64_t v12 = 0;
        }
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Import operation encountered had trouble importing log file, %@\n User Info: %@\n The log file is at: %@.\nOperation: %@", "-[_PFUbiquityRecordsImporter operation:failedWithError:]", 1064, a4, v11, v12, a3);
      }
    }
    else
    {
      if (v7 != 134304)
      {
LABEL_22:
        if (+[PFUbiquityLogging canLogMessageAtLevel:0])
        {
          uint64_t v13 = [a4 userInfo];
          if (a3) {
            uint64_t v14 = *((void *)a3 + 40);
          }
          else {
            uint64_t v14 = 0;
          }
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Import operation encountered an error: %@\nuserInfo: %@. While trying to import the log file at the URL: %@", "-[_PFUbiquityRecordsImporter operation:failedWithError:]", 1084, a4, v13, v14);
        }
        goto LABEL_26;
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Import operation was beat into the data store: %@", "-[_PFUbiquityRecordsImporter operation:failedWithError:]", 1068, self);
      }
    }
  }
  else
  {
    if (v7 != 134305)
    {
      if (v7 == 134321)
      {
        if (a3) {
          uint64_t v10 = *((void *)a3 + 33);
        }
        else {
          uint64_t v10 = 0;
        }
        -[_PFUbiquityRecordsImporter metadataInconsistencyDetectedForStore:]((uint64_t)self, v10);
        goto LABEL_26;
      }
      if (v7 == 134327)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:0])
        {
          uint64_t v8 = [a4 userInfo];
          if (a3) {
            uint64_t v9 = *((void *)a3 + 40);
          }
          else {
            uint64_t v9 = 0;
          }
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Import operation had trouble with the fileystem, %@\n User Info: %@\n The log file is at: %@.\nOperation: %@", "-[_PFUbiquityRecordsImporter operation:failedWithError:]", 1072, a4, v8, v9, a3);
        }
        goto LABEL_26;
      }
      goto LABEL_22;
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Import operation had trouble with conflict resolution: %@\nuserInfo: %@\n It appears that the operation was beat to the database.", "-[_PFUbiquityRecordsImporter operation:failedWithError:]", 1076, a4, [a4 userInfo]);
    }
  }
LABEL_26:
  if (a3)
  {
    uint64_t v15 = *((void *)a3 + 40);
    if (v15)
    {
      uint64_t v16 = *(void *)(v15 + 24);
      if (v16)
      {
        id v17 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
        ubiquityRootLocation = self->_ubiquityRootLocation;
        uint64_t v19 = v16;
        id v20 = @"PFLogLocationsKey";
        v21[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
        objc_msgSend(v17, "postNotificationName:object:userInfo:", @"PFUbiquityLocationImportCancelledNotification", ubiquityRootLocation, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1));
      }
    }
  }
  [(_PFUbiquityRecordsImporter *)self scheduleRecoveryTimer];
}

- (void)metadataInconsistencyDetectedForStore:(uint64_t)a1
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 24))
    {
      [*(id *)(a1 + 8) setSuspended:1];
      [*(id *)(a1 + 8) cancelAllOperations];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __68___PFUbiquityRecordsImporter_metadataInconsistencyDetectedForStore___block_invoke;
      v5[3] = &unk_1E544B778;
      v5[4] = a2;
      v5[5] = a1;
      uint64_t v4 = *(NSObject **)(a1 + 16);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57___PFUbiquityRecordsImporter_executeBlockOnPrivateQueue___block_invoke;
      block[3] = &unk_1E544DF48;
      block[4] = v5;
      dispatch_async(v4, block);
    }
  }
}

- (void)operationWasInterruptedDuringImport:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Operation was interrutped by import: %@", "-[_PFUbiquityRecordsImporter operationWasInterruptedDuringImport:]", 1098, a3);
  }
  if (a3)
  {
    uint64_t v5 = *((void *)a3 + 40);
    if (v5)
    {
      uint64_t v6 = *(void *)(v5 + 24);
      if (v6)
      {
        uint64_t v7 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
        ubiquityRootLocation = self->_ubiquityRootLocation;
        uint64_t v9 = v6;
        uint64_t v10 = @"PFLogLocationsKey";
        v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
        objc_msgSend(v7, "postNotificationName:object:userInfo:", @"PFUbiquityLocationImportCancelledNotification", ubiquityRootLocation, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1));
      }
    }
  }
  [(_PFUbiquityRecordsImporter *)self scheduleRecoveryTimer];
}

- (void)scheduleRecoveryTimer
{
  if (self)
  {
    [(NSOperationQueue *)self->_importQueue cancelAllOperations];
    importQueue = self->_importQueue;
  }
  else
  {
    [0 cancelAllOperations];
    importQueue = 0;
  }
  [(NSOperationQueue *)importQueue setSuspended:1];
  if (!self->_logRestartTimer)
  {
    dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)_ubiquityRootQueue);
    if (v4)
    {
      uint64_t v5 = v4;
      objc_initWeak(&location, self);
      dispatch_time_t v6 = dispatch_walltime(0, 30000000000);
      dispatch_source_set_timer(v5, v6, 0, 0x3B9ACA00uLL);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __51___PFUbiquityRecordsImporter_scheduleRecoveryTimer__block_invoke;
      handler[3] = &unk_1E544C3A0;
      objc_copyWeak(&v9, &location);
      dispatch_source_set_event_handler(v5, handler);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __51___PFUbiquityRecordsImporter_scheduleRecoveryTimer__block_invoke_2;
      v7[3] = &unk_1E544B868;
      v7[4] = v5;
      dispatch_source_set_cancel_handler(v5, v7);
      self->_logRestartTimer = (OS_dispatch_source *)v5;
      dispatch_resume(v5);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

- (int64_t)context:(id)a3 shouldHandleInaccessibleFault:(id)a4 forObjectID:(id)a5 andTrigger:(id)a6
{
  return 2;
}

- (void)requestBaselineRollForStore:(uint64_t)a1
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 128))
    {
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __58___PFUbiquityRecordsImporter_requestBaselineRollForStore___block_invoke;
      v3[3] = &unk_1E544B778;
      v3[4] = a1;
      v3[5] = a2;
      v2 = *(NSObject **)(a1 + 16);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57___PFUbiquityRecordsImporter_executeBlockOnPrivateQueue___block_invoke;
      block[3] = &unk_1E544DF48;
      block[4] = v3;
      dispatch_async(v2, block);
    }
  }
}

- (void)scheduleBaselineRollResponseOperationForBaselineAtLocation:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Scheduling response to baseline: %@\n", "-[_PFUbiquityRecordsImporter scheduleBaselineRollResponseOperationForBaselineAtLocation:]", 1220, a2);
    }
    if (*(unsigned char *)(a1 + 128))
    {
      self;
      id v4 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, *(void *)(a1 + 48), *(void *)(a1 + 32));
      active = (void *)-[PFUbiquitySwitchboardEntry createSetOfActiveStoreNames]((uint64_t)v4);
      dispatch_time_t v6 = active;
      if (*(unsigned char *)(a1 + 24))
      {
        if (a2) {
          uint64_t v7 = *(void *)(a2 + 40);
        }
        else {
          uint64_t v7 = 0;
        }
        if ([active containsObject:v7])
        {
          if (a2) {
            uint64_t v8 = *(void *)(a2 + 40);
          }
          else {
            uint64_t v8 = 0;
          }
          id v9 = -[PFUbiquitySwitchboardEntry createSetOfPersistentStoreCoordinatorsRegisteredForStoreName:]((uint64_t)v4, v8);
          id v22 = v4;
          char v23 = v6;
          id v21 = v9;
          uint64_t v10 = (void *)[v9 anyObject];
          if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Registered coordinators: %@", "-[_PFUbiquityRecordsImporter scheduleBaselineRollResponseOperationForBaselineAtLocation:]", 1232, v9);
          }
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v11 = (void *)[v10 persistentStores];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v25;
LABEL_15:
            uint64_t v14 = 0;
            while (1)
            {
              if (*(void *)v25 != v13) {
                objc_enumerationMutation(v11);
              }
              uint64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * v14);
              if (+[PFUbiquityLogging canLogMessageAtLevel:2])
              {
                if (a2) {
                  uint64_t v16 = *(void *)(a2 + 40);
                }
                else {
                  uint64_t v16 = 0;
                }
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  store name: %@ - %@\n%@", "-[_PFUbiquityRecordsImporter scheduleBaselineRollResponseOperationForBaselineAtLocation:]", 1237, v16, [v15 options], v15);
              }
              id v17 = a2 ? *(void **)(a2 + 40) : 0;
              if (objc_msgSend(v17, "isEqualToString:", objc_msgSend((id)objc_msgSend(v15, "options"), "objectForKey:", @"NSPersistentStoreUbiquitousContentNameKey")))break; {
              if (v12 == ++v14)
              }
              {
                uint64_t v18 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
                uint64_t v12 = v18;
                if (v18) {
                  goto LABEL_15;
                }
                goto LABEL_30;
              }
            }
          }
          else
          {
LABEL_30:
            uint64_t v15 = 0;
          }
          id v4 = v22;
          dispatch_time_t v6 = v23;
          uint64_t v19 = v21;
          if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Store: %@", "-[_PFUbiquityRecordsImporter scheduleBaselineRollResponseOperationForBaselineAtLocation:]", 1244, v15);
          }
          if (v15)
          {
            [*(id *)(a1 + 104) lock];
            if (+[PFUbiquityLogging canLogMessageAtLevel:2])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Adding operation", "-[_PFUbiquityRecordsImporter scheduleBaselineRollResponseOperationForBaselineAtLocation:]", 1253);
            }
            id v20 = [(PFUbiquityBaselineOperation *)[PFUbiquityBaselineRollResponseOperation alloc] initWithPersistentStore:v15 localPeerID:*(void *)(a1 + 32) andUbiquityRootLocation:*(void *)(a1 + 40)];
            [(PFUbiquityBaselineRollResponseOperation *)v20 setDelegate:a1];
            [*(id *)(a1 + 8) addOperation:v20];
            [*(id *)(a1 + 104) unlock];
          }
          else
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:2])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to schedule baseline roll response operation for location (store active but not found): %@", "-[_PFUbiquityRecordsImporter scheduleBaselineRollResponseOperationForBaselineAtLocation:]", 1246, a1, a2);
            }
            id v20 = 0;
          }
          goto LABEL_43;
        }
        if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to schedule roll response operation for location (store not active): %@", "-[_PFUbiquityRecordsImporter scheduleBaselineRollResponseOperationForBaselineAtLocation:]", 1261, a1, a2);
        }
      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:2])
      {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to schedule roll response operation for location (monitoring): %@", "-[_PFUbiquityRecordsImporter scheduleBaselineRollResponseOperationForBaselineAtLocation:]", 1264, a1, a2);
      }
      id v20 = 0;
      uint64_t v19 = 0;
    }
    else
    {
      id v20 = 0;
      uint64_t v19 = 0;
      dispatch_time_t v6 = 0;
      id v4 = 0;
    }
LABEL_43:
  }
}

- (BOOL)scheduleBaselineRecoveryOperationWithActiveBaselineOperation:(BOOL)result
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nScheduling baseline recovery operation on behalf of: %@", "-[_PFUbiquityRecordsImporter scheduleBaselineRecoveryOperationWithActiveBaselineOperation:]", 1280, v3, a2);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = (void *)[*(id *)(v3 + 8) operations];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (v9 != a2) {
            [v9 cancel];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
    uint64_t v10 = [PFUbiquityBaselineRecoveryOperation alloc];
    if (a2)
    {
      uint64_t v11 = a2[33];
      uint64_t v12 = a2[31];
      uint64_t v13 = a2[34];
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v11 = 0;
      uint64_t v13 = 0;
    }
    uint64_t v14 = [(PFUbiquityBaselineOperation *)v10 initWithPersistentStore:v11 localPeerID:v12 andUbiquityRootLocation:v13];
    [(PFUbiquityBaselineRecoveryOperation *)v14 setDelegate:v3];
    [*(id *)(v3 + 8) addOperation:v14];

    return -[_PFUbiquityRecordsImporter discoverAndImportAllAvailableLogs:error:]((uint64_t *)v3, 0, 0);
  }
  return result;
}

- (void)baselineRollOperationEncounteredAnInconsistentBaselineState:(id)a3
{
}

- (void)baselineRollOperationWasUnableToLockPersistentStore:(id)a3
{
  if (a3) {
    uint64_t v3 = *((void *)a3 + 33);
  }
  else {
    uint64_t v3 = 0;
  }
  -[_PFUbiquityRecordsImporter requestBaselineRollForStore:]((uint64_t)self, v3);
}

- (void)recoveryOperation:(id)a3 didReplaceLocalStoreFileWithBaseline:(id)a4
{
  self;
  id v6 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)self->_storeName, (uint64_t)self->_localPeerID);
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = *((void *)v6 + 11);
    if (v8)
    {
      uint64_t v9 = *(void *)(v8 + 88);
      if (v9)
      {
        if (-[PFUbiquityPeerRangeCache refreshPeerRangeCache:](*(void *)(v9 + 40)))
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nRefreshed peer range cache after baseline roll.", "-[_PFUbiquityRecordsImporter recoveryOperation:didReplaceLocalStoreFileWithBaseline:]", 1316, self);
          }
        }
        else if (+[PFUbiquityLogging canLogMessageAtLevel:1])
        {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError attempting to refresh peer range cache: %@", "-[_PFUbiquityRecordsImporter recoveryOperation:didReplaceLocalStoreFileWithBaseline:]", 1318, self, 0);
        }
      }
    }
    -[_PFUbiquityRecordsImporter discoverAndImportAllAvailableLogs:error:]((uint64_t *)self, 0, 0);
  }

  if (a3)
  {
    uint64_t v10 = *((void *)a3 + 32);
    a3 = (id)*((void *)a3 + 31);
  }
  else
  {
    uint64_t v10 = 0;
  }
  -[_PFUbiquityRecordsImporter postImportNotificationForStoreName:andLocalPeerID:withUserInfo:](self, v10, (uint64_t)a3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CAD0], "set"), @"invalidatedAll"));
}

- (void)rollResponseOperation:(id)a3 successfullyAdoptedBaseline:(id)a4
{
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSuccessfully adopted baseline: %@", "-[_PFUbiquityRecordsImporter rollResponseOperation:successfullyAdoptedBaseline:]", 1333, a3, a4);
  }
  [(NSOperationQueue *)self->_importQueue cancelAllOperations];
  self;
  id v7 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)self->_storeName, (uint64_t)self->_localPeerID);
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = *((void *)v7 + 11);
    if (v9)
    {
      uint64_t v10 = *(void *)(v9 + 88);
      if (v10)
      {
        if (-[PFUbiquityPeerRangeCache refreshPeerRangeCache:](*(void *)(v10 + 40)))
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Refreshed peer range cache", "-[_PFUbiquityRecordsImporter rollResponseOperation:successfullyAdoptedBaseline:]", 1345);
          }
          if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nRefreshed peer range cache after baseline roll.", "-[_PFUbiquityRecordsImporter rollResponseOperation:successfullyAdoptedBaseline:]", 1346, self, v11);
          }
        }
        else if (+[PFUbiquityLogging canLogMessageAtLevel:1])
        {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError attempting to refresh peer range cache: %@", "-[_PFUbiquityRecordsImporter rollResponseOperation:successfullyAdoptedBaseline:]", 1348, self, 0);
        }
      }
    }
    if (self->_isMonitoring) {
      -[_PFUbiquityRecordsImporter discoverAndImportAllAvailableLogs:error:]((uint64_t *)self, 0, 0);
    }
  }
}

- (void)rollResponseOperation:(id)a3 encounteredAnError:(id)a4 whileTryingToAdoptBaseline:(id)a5
{
  if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nEncountered an error while trying to respond to the roll of baseline: %@\nError: %@\nuserInfo: %@", "-[_PFUbiquityRecordsImporter rollResponseOperation:encounteredAnError:whileTryingToAdoptBaseline:]", 1363, a3, a5, a4, [a4 userInfo]);
  }

  -[_PFUbiquityRecordsImporter scheduleBaselineRecoveryOperationWithActiveBaselineOperation:]((BOOL)self, a3);
}

- (void)recoveryOperation:(id)a3 encounteredAnError:(id)a4 duringRecoveryOfBaseline:(id)a5
{
}

+ (NSPersistentStoreCoordinator)createPrivateCoordinatorForStore:(uint64_t)a1 error:(void *)a2
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "persistentStoreCoordinator"), "managedObjectModel"), "mutableCopy");
  id v4 = [NSString alloc];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = (void *)[v4 initWithUTF8String:class_getName(v5)];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = (void *)[v3 entities];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * i) setManagedObjectClassName:v6];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v8);
  }

  if (v3)
  {
    uint64_t v11 = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:v3];
  }
  else
  {
    uint64_t v12 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m");
    uint64_t v19 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v26 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m";
      __int16 v27 = 1024;
      int v28 = 1464;
      _os_log_fault_impl(&dword_18AB82000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    return 0;
  }
  return v11;
}

+ (uint64_t)addPrivateStore:(void *)a3 toCoordinator:(uint64_t)a4 atURL:(uint64_t *)a5 error:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v21 = 0;
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a2, "options"), "mutableCopy");
  uint64_t v10 = (void *)[objc_alloc(NSNumber) initWithBool:1];
  [v9 setObject:v10 forKey:@"NSUbiquityImporterPrivateStoreKey"];

  if (a4 || (a4 = [a2 URL]) != 0)
  {
    uint64_t v11 = objc_msgSend(a3, "addPersistentStoreWithType:configuration:URL:options:error:", objc_msgSend(a2, "type"), objc_msgSend(a2, "configurationName"), a4, v9, &v21);
  }
  else
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error while trying to create the import coordinator as store URL is nil.", "+[_PFUbiquityRecordsImporter addPrivateStore:toCoordinator:atURL:error:]", 1501);
    }
    uint64_t v11 = 0;
  }

  if (!v11)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error while trying to create the import coordinator: %@", "+[_PFUbiquityRecordsImporter addPrivateStore:toCoordinator:atURL:error:]", 1506, v21);
    }
    if (v21)
    {
      if (a5) {
        *a5 = v21;
      }
    }
    else
    {
      uint64_t v12 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m");
      uint64_t v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        long long v23 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m";
        __int16 v24 = 1024;
        int v25 = 1510;
        _os_log_fault_impl(&dword_18AB82000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v11;
}

+ (NSPersistentStoreCoordinator)createPrivateCoordinatorAndStoreForStore:(uint64_t)a3 atURL:(void *)a4 error:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v17 = 0;
  id v7 = +[_PFUbiquityRecordsImporter createPrivateCoordinatorForStore:error:]((uint64_t)_PFUbiquityRecordsImporter, a2);
  if (!v7) {
    goto LABEL_6;
  }
  if (!+[_PFUbiquityRecordsImporter addPrivateStore:toCoordinator:atURL:error:]((uint64_t)_PFUbiquityRecordsImporter, a2, v7, a3, &v17))
  {
    if (v17)
    {
      if (a4) {
        *a4 = v17;
      }
LABEL_8:

      return 0;
    }
LABEL_6:
    uint64_t v8 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m");
    uint64_t v15 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityRecordsImporter.m";
      __int16 v20 = 1024;
      int v21 = 1543;
      _os_log_fault_impl(&dword_18AB82000, v15, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    goto LABEL_8;
  }
  return v7;
}

+ (void)executeBlockOnRootQueue:(uint64_t)a1
{
  self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54___PFUbiquityRecordsImporter_executeBlockOnRootQueue___block_invoke;
  block[3] = &unk_1E544DF48;
  block[4] = a2;
  dispatch_async((dispatch_queue_t)_ubiquityRootQueue, block);
}

+ (void)afterDelay:(uint64_t)a3 executeBlockOnRootQueue:
{
  self;
  dispatch_time_t v5 = dispatch_time(0, 1000000000 * (uint64_t)a1);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65___PFUbiquityRecordsImporter_afterDelay_executeBlockOnRootQueue___block_invoke;
  block[3] = &unk_1E544DF48;
  block[4] = a3;
  dispatch_after(v5, (dispatch_queue_t)_ubiquityRootQueue, block);
}

@end