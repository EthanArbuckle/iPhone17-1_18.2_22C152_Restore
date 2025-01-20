@interface PFUbiquityBaselineRollOperation
- (BOOL)isEqual:(id)a3;
- (PFUbiquityBaselineRollOperation)init;
- (PFUbiquityBaselineRollOperationDelegate)delegate;
- (id)retainedDelegate;
- (uint64_t)rollBaselineWithError:(uint64_t)a1;
- (void)dealloc;
- (void)main;
- (void)setDelegate:(id)a3;
@end

@implementation PFUbiquityBaselineRollOperation

- (PFUbiquityBaselineRollOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineRollOperation;
  result = [(PFUbiquityImportOperation *)&v3 init];
  if (result) {
    result->_heuristics = 0;
  }
  return result;
}

- (void)dealloc
{
  self->_heuristics = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineRollOperation;
  [(PFUbiquityBaselineOperation *)&v3 dealloc];
}

- (void)setDelegate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineRollOperation;
  [(PFUbiquityImportOperation *)&v3 setDelegate:a3];
}

- (PFUbiquityBaselineRollOperationDelegate)delegate
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineRollOperation;
  return (PFUbiquityBaselineRollOperationDelegate *)[(PFUbiquityImportOperation *)&v3 delegate];
}

- (id)retainedDelegate
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineRollOperation;
  return [(PFUbiquityImportOperation *)&v3 retainedDelegate];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)PFUbiquityBaselineRollOperation;
    LOBYTE(v6) = [(PFUbiquityBaselineRollOperation *)&v17 isEqual:a3];
    return v6;
  }
  if (a3)
  {
    v5 = (void *)*((void *)a3 + 31);
    if (self)
    {
LABEL_4:
      int v6 = [v5 isEqualToString:self->super.super._localPeerID];
      if (!v6) {
        return v6;
      }
      storeName = self->super.super._storeName;
      goto LABEL_6;
    }
  }
  else
  {
    v5 = 0;
    if (self) {
      goto LABEL_4;
    }
  }
  char v15 = [v5 isEqualToString:0];
  storeName = 0;
  if ((v15 & 1) == 0)
  {
    LOBYTE(v6) = 0;
    return v6;
  }
LABEL_6:
  if (a3) {
    uint64_t v8 = *((void *)a3 + 32);
  }
  else {
    uint64_t v8 = 0;
  }
  int v6 = [(NSString *)storeName isEqual:v8];
  if (!v6) {
    return v6;
  }
  if (self)
  {
    ubiquityRootLocation = self->super.super._ubiquityRootLocation;
    if (a3)
    {
LABEL_11:
      uint64_t v10 = *((void *)a3 + 34);
      goto LABEL_12;
    }
  }
  else
  {
    ubiquityRootLocation = 0;
    if (a3) {
      goto LABEL_11;
    }
  }
  uint64_t v10 = 0;
LABEL_12:
  int v6 = [(PFUbiquityLocation *)ubiquityRootLocation isEqual:v10];
  if (!v6) {
    return v6;
  }
  if (self)
  {
    model = self->super._model;
    if (a3)
    {
LABEL_15:
      uint64_t v12 = *((void *)a3 + 39);
      goto LABEL_16;
    }
  }
  else
  {
    model = 0;
    if (a3) {
      goto LABEL_15;
    }
  }
  uint64_t v12 = 0;
LABEL_16:
  int v6 = [(NSManagedObjectModel *)model isEqual:v12];
  if (!v6) {
    return v6;
  }
  if (!self)
  {
    store = 0;
    if (a3) {
      goto LABEL_19;
    }
LABEL_34:
    uint64_t v14 = 0;
    goto LABEL_20;
  }
  store = self->super.super._store;
  if (!a3) {
    goto LABEL_34;
  }
LABEL_19:
  uint64_t v14 = *((void *)a3 + 33);
LABEL_20:

  LOBYTE(v6) = [(NSPersistentStore *)store isEqual:v14];
  return v6;
}

- (uint64_t)rollBaselineWithError:(uint64_t)a1
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    char v4 = 0;
    return v4 & 1;
  }
  id v54 = 0;
  if ([(id)a1 isCancelled])
  {
    char v4 = 1;
    return v4 & 1;
  }
  v39 = a2;
  if (!-[PFUbiquityBaselineHeuristics canRollBaseline:](*(uint64_t **)(a1 + 320), &v54))
  {
    id obj = 0;
    int v6 = 0;
    BOOL v7 = v54 == 0;
    goto LABEL_10;
  }
  if (!v54) {
    goto LABEL_50;
  }
  if ([v54 code] == 134325)
  {
    v5 = (void *)[v54 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      id obj = (id)objc_msgSend((id)objc_msgSend(v54, "userInfo"), "objectForKey:", @"offendingPeers");
      id v54 = 0;
      goto LABEL_51;
    }
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:0])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nGot an unknown error back from canRollBaseline: %@", "-[PFUbiquityBaselineRollOperation rollBaselineWithError:]", 164, a1, v54);
    id obj = 0;
  }
  else
  {
LABEL_50:
    id obj = 0;
  }
LABEL_51:
  int v6 = [[PFUbiquityBaseline alloc] initWithLocalPeerID:*(void *)(a1 + 248) ubiquityRootLocation:*(void *)(a1 + 272) forStoreWithName:*(void *)(a1 + 256) andManagedObjectModel:*(void *)(a1 + 312)];
  BOOL v7 = -[PFUbiquityBaseline prepareForBaselineRollOfPersistentStore:andLocalPeerID:error:]((BOOL)v6, *(void **)(a1 + 264), *(void *)(a1 + 248), &v54);
  uint64_t v23 = +[PFUbiquityBaseline metadataFromCurrentBaselineForStoreWithName:peerID:modelVersionHash:andUbiquityRootLocation:withError:]((uint64_t)PFUbiquityBaseline, *(void *)(a1 + 256), *(void *)(a1 + 248), *(void *)(a1 + 304), *(void **)(a1 + 272));
  if (v6) {
    p_isa = (id *)&v6->_metadata->super.isa;
  }
  else {
    p_isa = 0;
  }
  -[PFUbiquityBaselineMetadata setPreviousKnowledgeVectorFromCurrentMetadata:](p_isa, v23);
  if (([(id)a1 isCancelled] & 1) == 0)
  {
    if (!v7) {
      goto LABEL_67;
    }
    BOOL v7 = 1;
    if (!-[PFUbiquityBaseline gatherContentsAndConstructArchiveWithError:]((uint64_t)v6, &v54))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ Error encountered trying to roll baseline: %@\nError: %@\nuserInfo: %@", "-[PFUbiquityBaselineRollOperation rollBaselineWithError:]", 212, a1, *(void *)(a1 + 320), v54, [v54 userInfo]);
      }
      goto LABEL_11;
    }
    if (!-[PFUbiquitySafeSaveFile safeSaveFile:moveToPermanentLocation:error:]((uint64_t)v6, 0, 1, &v54))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ encountered an error trying to write the baseline archive to disk: %@\nuserInfo: %@", "-[PFUbiquityBaselineRollOperation rollBaselineWithError:]", 209, a1, v54, [v54 userInfo]);
      }
      goto LABEL_11;
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ successfully rolled baseline: %@", "-[PFUbiquityBaselineRollOperation rollBaselineWithError:]", 184, a1, v6);
    }
    if (-[PFUbiquityBaseline makeCurrentBaselineWithError:]((uint64_t)v6, &v54))
    {
      if (v6 && (metadata = v6->_metadata) != 0) {
        kv = metadata->_kv;
      }
      else {
        kv = 0;
      }
      v28 = *(void **)(a1 + 320);
      if (v28) {
        objc_setProperty_nonatomic(v28, v25, kv, 80);
      }
      BOOL v7 = -[PFUbiquityBaseline updateCurrentStoreIdentifier:error:](v6, objc_msgSend(*(id *)(a1 + 264), "identifier", kv));
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ successfully rolled baseline but encountered an error trying to make it the current baseline: %@\nuserInfo: %@", "-[PFUbiquityBaselineRollOperation rollBaselineWithError:]", 191, a1, v54, [v54 userInfo]);
    }
    if (([(id)a1 isCancelled] & 1) == 0)
    {
      if (v6) {
        uint64_t v38 = (uint64_t)v6->_metadata;
      }
      else {
        uint64_t v38 = 0;
      }
      +[PFUbiquityTransactionLog truncateLogFilesBeforeBaselineMetadata:withLocalPeerID:andUbiquityRootLocation:]((uint64_t)PFUbiquityTransactionLog, v38, *(void **)(a1 + 248), *(void **)(a1 + 272));
      if (-[PFUbiquityBaseline removeUnusedExternalDataReferences:]((uint64_t)v6, &v54))
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nRemoved unused external data references", "-[PFUbiquityBaselineRollOperation rollBaselineWithError:]", 202, a1);
        }
      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
      {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError removing unused external data references: %@", "-[PFUbiquityBaselineRollOperation rollBaselineWithError:]", 204, a1, v54);
      }
    }
LABEL_10:
    if (v7)
    {
LABEL_11:
      if ([obj count])
      {
        if (v6)
        {
          uint64_t v8 = v6->_metadata;
          if (v8) {
            uint64_t v8 = (PFUbiquityBaselineMetadata *)v8->_kv;
          }
        }
        else
        {
          uint64_t v8 = 0;
        }
        v9 = v8;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        uint64_t v10 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
        if (v10)
        {
          p_cache = PFUbiquityMetadataFactory.cache;
          uint64_t v41 = *(void *)v51;
          do
          {
            uint64_t v12 = 0;
            uint64_t v42 = v10;
            do
            {
              if (*(void *)v51 != v41) {
                objc_enumerationMutation(obj);
              }
              uint64_t v44 = v12;
              uint64_t v45 = *(void *)(*((void *)&v50 + 1) + 8 * v12);
              v43 = +[PFUbiquityLocation createPeerStoreVersionLocationForPeerID:storeName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)(p_cache + 248), v45, *(void *)(a1 + 256), *(void *)(a1 + 304), *(void **)(a1 + 272));
              id v13 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)(p_cache + 248), (uint64_t)v43, (uint64_t)&v54);
              uint64_t v14 = v13;
              if (v13)
              {
                long long v48 = 0u;
                long long v49 = 0u;
                long long v46 = 0u;
                long long v47 = 0u;
                uint64_t v15 = [v13 countByEnumeratingWithState:&v46 objects:v60 count:16];
                if (v15)
                {
                  uint64_t v16 = *(void *)v47;
                  do
                  {
                    uint64_t v17 = 0;
                    do
                    {
                      if (*(void *)v47 != v16) {
                        objc_enumerationMutation(v14);
                      }
                      uint64_t v18 = *(void *)(*((void *)&v46 + 1) + 8 * v17);
                      if (v18
                        && *(_DWORD *)(v18 + 24) == 22
                        && -[PFUbiquityLocation fileAtLocationIsDownloaded:](*(void *)(*((void *)&v46 + 1) + 8 * v17), (uint64_t)&v54))
                      {
                        v19 = [[PFUbiquityTransactionLog alloc] initWithTransactionLogLocation:v18 andLocalPeerID:*(void *)(a1 + 248)];
                        if (-[PFUbiquityTransactionLog loadComparisonMetadataWithError:]((uint64_t)v19, &v54))
                        {
                          v20 = v19 ? (id *)v19->_knowledgeVector : 0;
                          if (-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](v20, (uint64_t)v9)
                            && !-[PFUbiquityLocation removeFileAtLocation:error:](v18, *(void *)(a1 + 248), &v54)
                            && +[PFUbiquityLogging canLogMessageAtLevel:0])
                          {
                            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Unable to delete transaction log for peer: %@\n%@", "-[PFUbiquityBaselineRollOperation rollBaselineWithError:]", 239, v45, v54);
                          }
                        }
                      }
                      ++v17;
                    }
                    while (v15 != v17);
                    uint64_t v21 = [v14 countByEnumeratingWithState:&v46 objects:v60 count:16];
                    uint64_t v15 = v21;
                  }
                  while (v21);
                }
              }
              else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
              {
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to remove logs from peer: %@\n%@", "-[PFUbiquityBaselineRollOperation rollBaselineWithError:]", 253, a1, v45, v54);
              }

              uint64_t v12 = v44 + 1;
              p_cache = (void **)(PFUbiquityMetadataFactory + 16);
            }
            while (v44 + 1 != v42);
            uint64_t v10 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
          }
          while (v10);
        }
      }
      LOBYTE(v7) = 1;
      int v22 = 1;
      goto LABEL_68;
    }
LABEL_67:
    int v22 = 1;
    goto LABEL_68;
  }
  int v22 = 0;
  BOOL v55 = v7;
LABEL_68:

  if (!v7)
  {
    if (v54)
    {
      if (v39) {
        void *v39 = v54;
      }
    }
    else
    {
      uint64_t v29 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v29, v30, v31, v32, v33, v34, v35, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaselineRollOperation.m");
      v36 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v57 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaselineRollOperation.m";
        __int16 v58 = 1024;
        int v59 = 266;
        _os_log_fault_impl(&dword_18AB82000, v36, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  char v4 = v55;
  if (v22) {
    char v4 = v7;
  }
  return v4 & 1;
}

- (void)main
{
  uint64_t v22 = 0;
  if (([(PFUbiquityBaselineRollOperation *)self isCancelled] & 1) == 0)
  {
    if ([(PFUbiquityBaselineRollOperation *)self isCancelled])
    {
      objc_super v3 = 0;
      char v4 = 0;
LABEL_11:
      uint64_t v8 = 0;
LABEL_21:

      return;
    }
    if (self) {
      store = self->super.super._store;
    }
    else {
      store = 0;
    }
    objc_super v3 = [(NSPersistentStore *)store persistentStoreCoordinator];
    if (!v3)
    {
      [(PFUbiquityImportOperation *)self cancel];
      char v4 = 0;
      uint64_t v8 = 0;
      goto LABEL_21;
    }
    self;
    if (self)
    {
      storeName = self->super.super._storeName;
      localPeerID = self->super.super._localPeerID;
    }
    else
    {
      storeName = 0;
      localPeerID = 0;
    }
    char v4 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)storeName, (uint64_t)localPeerID);
    if (!v4) {
      goto LABEL_20;
    }
    if ([(PFUbiquityBaselineRollOperation *)self isCancelled]) {
      goto LABEL_11;
    }
    v9 = (void *)v4[11];
    if (v9) {
      v9 = (void *)v9[15];
    }
    uint64_t v10 = v9;
    self->_heuristics = v10;
    if (!v10)
    {
LABEL_20:
      [(PFUbiquityImportOperation *)self cancel];
      uint64_t v8 = 0;
      goto LABEL_21;
    }
    -[PFUbiquityBaselineHeuristics updateHeuristics]((uint64_t *)v10);
    id v23 = 0;
    v11 = [[PFUbiquityBaseline alloc] initWithLocalPeerID:self->super.super._localPeerID ubiquityRootLocation:self->super.super._ubiquityRootLocation forStoreWithName:self->super.super._storeName andManagedObjectModel:self->super._model];
    if (-[PFUbiquitySafeSaveFile existsInCloud](v11))
    {
      if ([(PFUbiquityBaselineRollOperation *)self isCancelled])
      {
LABEL_19:
        char v12 = 0;
        char v24 = 0;
        int v13 = 1;
        goto LABEL_44;
      }
      if (-[PFUbiquitySafeSaveFile downloadLatestVersion:error:]((uint64_t)v11, 0, (uint64_t *)&v23))
      {
        if (v11
          && [(PFUbiquityBaseline *)v11 loadFileFromLocation:v11->super._currentLocation error:&v23])
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Successfully initialized baseline: %@", "-[PFUbiquityBaselineRollOperation haveConsistentStateForBaselineRoll]", 98, v11);
          }
          if ([(PFUbiquityBaselineRollOperation *)self isCancelled]) {
            goto LABEL_19;
          }
          uint64_t v14 = +[PFUbiquityBaseline metadataFromCurrentBaselineForStoreWithName:peerID:modelVersionHash:andUbiquityRootLocation:withError:]((uint64_t)PFUbiquityBaseline, (uint64_t)self->super.super._storeName, (uint64_t)self->super.super._localPeerID, (uint64_t)self->super._modelVersionHash, self->super.super._ubiquityRootLocation);
          if (v14)
          {
            metadata = v11->_metadata;
            uint64_t v16 = *(void **)(v14 + 48);
            if (metadata) {
              kv = metadata->_kv;
            }
            else {
              kv = 0;
            }
            char v12 = [v16 isEqual:kv];
          }
          else
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:1])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Got nil metadata for current baseline in operation: %@", "-[PFUbiquityBaselineRollOperation haveConsistentStateForBaselineRoll]", 117, self);
            }
            char v12 = 0;
          }
          int v13 = 0;
LABEL_44:

          if (v13) {
            char v18 = v24;
          }
          else {
            char v18 = v12;
          }
          if (v18)
          {
            if (([(PFUbiquityBaselineRollOperation *)self isCancelled] & 1) == 0)
            {
              if (-[PFUbiquityBaselineRollOperation rollBaselineWithError:]((uint64_t)self, &v22))
              {
                v19 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
                v20 = (void *)[objc_alloc(MEMORY[0x1E4F28EA0]) initWithName:@"com.apple.coredata.ubiquity.baseline.roll" object:self->super.super._store userInfo:0];
                [v19 postNotification:v20];
              }
            }
          }
          else if (([(PFUbiquityBaselineRollOperation *)self isCancelled] & 1) == 0)
          {
            id v21 = [(PFUbiquityBaselineRollOperation *)self retainedDelegate];
            uint64_t v8 = v21;
            if (v21) {
              [v21 baselineRollOperationEncounteredAnInconsistentBaselineState:self];
            }
            goto LABEL_21;
          }
          goto LABEL_11;
        }
        if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error attempting to initialize baseline: %@\nError: %@\nuserInfo: %@", "-[PFUbiquityBaselineRollOperation haveConsistentStateForBaselineRoll]", 100, v11, v23, [v23 userInfo]);
        }
      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:2])
      {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Didn't download latest version: %@", "-[PFUbiquityBaselineRollOperation haveConsistentStateForBaselineRoll]", 103, v23);
      }
    }
    int v13 = 0;
    char v12 = 1;
    goto LABEL_44;
  }
}

@end