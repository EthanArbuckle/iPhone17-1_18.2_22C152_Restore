@interface PFUbiquityBaselineRollResponseOperation
- (PFUbiquityBaselineRollResponseOperationDelegate)delegate;
- (id)retainedDelegate;
- (void)main;
- (void)setDelegate:(id)a3;
@end

@implementation PFUbiquityBaselineRollResponseOperation

- (void)setDelegate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineRollResponseOperation;
  [(PFUbiquityBaselineRollOperation *)&v3 setDelegate:a3];
}

- (PFUbiquityBaselineRollResponseOperationDelegate)delegate
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineRollResponseOperation;
  return [(PFUbiquityBaselineRollOperation *)&v3 delegate];
}

- (id)retainedDelegate
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineRollResponseOperation;
  return [(PFUbiquityBaselineRollOperation *)&v3 retainedDelegate];
}

id __106__PFUbiquityBaselineRollResponseOperation_canAdoptBaseline_byReplacingLocalStoreFile_withStack_withError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    objc_super v3 = *(void **)(v2 + 264);
  }
  else {
    objc_super v3 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = -[NSSQLCore fetchUbiquityKnowledgeVector](v3);
  v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return v4;
}

- (void)main
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  uint64_t v91 = 0;
  id v92 = 0;
  uint64_t v86 = 0;
  v87 = &v86;
  uint64_t v88 = 0x3052000000;
  v89 = __Block_byref_object_copy__64;
  v90 = __Block_byref_object_dispose__64;
  if ([(PFUbiquityBaselineRollResponseOperation *)self isCancelled])
  {
    id v3 = 0;
LABEL_15:
    v13 = 0;
    v16 = 0;
    v17 = 0;
    v14 = 0;
    goto LABEL_95;
  }
  self;
  if (self)
  {
    storeName = self->super.super.super._storeName;
    localPeerID = self->super.super.super._localPeerID;
  }
  else
  {
    storeName = 0;
    localPeerID = 0;
  }
  id v3 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)storeName, (uint64_t)localPeerID);
  if (!v3) {
    goto LABEL_15;
  }
  v6 = [PFUbiquityBaseline alloc];
  if (self)
  {
    v7 = self->super.super.super._localPeerID;
    ubiquityRootLocation = self->super.super.super._ubiquityRootLocation;
    v9 = self->super.super.super._storeName;
    model = self->super.super._model;
  }
  else
  {
    v9 = 0;
    v7 = 0;
    ubiquityRootLocation = 0;
    model = 0;
  }
  uint64_t v11 = [(PFUbiquityBaseline *)v6 initWithLocalPeerID:v7 ubiquityRootLocation:ubiquityRootLocation forStoreWithName:v9 andManagedObjectModel:model];
  if (self) {
    store = self->super.super.super._store;
  }
  else {
    store = 0;
  }
  v13 = (void *)v11;
  v14 = [(NSPersistentStore *)store persistentStoreCoordinator];
  if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Responding to baseline: %@", "-[PFUbiquityBaselineRollResponseOperation main]", 128, v13);
  }
  if (-[PFUbiquitySafeSaveFile downloadLatestVersion:error:]((uint64_t)v13, 1, (uint64_t *)&v92))
  {
    if (v13)
    {
      int v15 = [v13 loadFileFromLocation:v13[3] error:&v92];
      goto LABEL_19;
    }
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:2])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Didn't get latest version: %@", "-[PFUbiquityBaselineRollResponseOperation main]", 134, v92);
  }
  int v15 = 0;
LABEL_19:
  if ([(PFUbiquityBaselineRollResponseOperation *)self isCancelled])
  {
    v16 = 0;
LABEL_94:
    v17 = 0;
    goto LABEL_95;
  }
  if (!v15)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError while attempting to load the baseline in response to a baseline roll: %@\nuserInfo: %@\n", "-[PFUbiquityBaselineRollResponseOperation main]", 213, self, v92, [v92 userInfo]);
    }
    goto LABEL_90;
  }
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __47__PFUbiquityBaselineRollResponseOperation_main__block_invoke;
  v85[3] = &unk_1E544B9B0;
  v85[4] = self;
  v85[5] = &v86;
  [(NSPersistentStoreCoordinator *)v14 performBlockAndWait:v85];
  id v18 = (id)v87[5];
  v19 = [PFUbiquityKnowledgeVector alloc];
  v17 = [(PFUbiquityKnowledgeVector *)v19 initWithStoreKnowledgeVectorDictionary:v87[5]];
  if (v13 && (uint64_t v20 = v13[12]) != 0) {
    v21 = *(id **)(v20 + 48);
  }
  else {
    v21 = 0;
  }
  if ((-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](v21, (uint64_t)v17) & 1) != 0
    || (!v13 || (uint64_t v22 = v13[12]) == 0 ? (v23 = 0) : (v23 = *(void **)(v22 + 48)),
        [v23 isEqual:v87[5]]))
  {
    if (self)
    {
      v24 = self->super.super.super._storeName;
      v25 = self->super.super.super._localPeerID;
      if (v13) {
        goto LABEL_32;
      }
    }
    else
    {
      v24 = 0;
      v25 = 0;
      if (v13)
      {
LABEL_32:
        uint64_t v26 = v13[16];
        if (self)
        {
LABEL_33:
          v27 = self->super.super.super._ubiquityRootLocation;
LABEL_34:
          v28 = (void *)+[PFUbiquityBaseline metadataFromCurrentBaselineForStoreWithName:peerID:modelVersionHash:andUbiquityRootLocation:withError:]((uint64_t)PFUbiquityBaseline, (uint64_t)v24, (uint64_t)v25, v26, v27);
          if (!v28)
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:0])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError trying to load the current metadata: %@\nuserInfo: %@", "-[PFUbiquityBaselineRollResponseOperation main]", 157, self, v92, [v92 userInfo]);
            }
            goto LABEL_51;
          }
          if (v13) {
            uint64_t v29 = v13[12];
          }
          else {
            uint64_t v29 = 0;
          }
          if ([v28 isEqual:v29])
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:2])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nCurrent baseline matches the baseline archive, returning.", "-[PFUbiquityBaselineRollResponseOperation main]", 161, self);
            }
LABEL_51:
            v16 = 0;
            goto LABEL_95;
          }
          goto LABEL_42;
        }
LABEL_119:
        v27 = 0;
        goto LABEL_34;
      }
    }
    uint64_t v26 = 0;
    if (self) {
      goto LABEL_33;
    }
    goto LABEL_119;
  }
LABEL_42:

  if (self)
  {
    v84 = [(NSPersistentStore *)self->super.super.super._store persistentStoreCoordinator];
    if (v13 && (uint64_t v30 = v13[12]) != 0) {
      uint64_t v31 = *(void *)(v30 + 48);
    }
    else {
      uint64_t v31 = 0;
    }
    v82 = (void *)[objc_alloc(NSNumber) initWithInt:0];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000;
    v95 = __Block_byref_object_copy__64;
    v96 = __Block_byref_object_dispose__64;
    uint64_t v97 = 0;
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __106__PFUbiquityBaselineRollResponseOperation_canAdoptBaseline_byReplacingLocalStoreFile_withStack_withError___block_invoke;
    v93[3] = &unk_1E544B9B0;
    v93[4] = self;
    v93[5] = buf;
    [(NSPersistentStoreCoordinator *)v84 performBlockAndWait:v93];
    id v32 = *(id *)(*(void *)&buf[8] + 40);
    v33 = [PFUbiquityKnowledgeVector alloc];
    v34 = [(PFUbiquityKnowledgeVector *)v33 initWithStoreKnowledgeVectorDictionary:*(void *)(*(void *)&buf[8] + 40)];
    uint64_t v83 = -[PFUbiquityBaseline canReplaceStoreAtKnowledgeVector:](v13, v34);
    if ((v83 & 1) != 0
      || (-[PFUbiquityKnowledgeVector isDescendantOfKnowledgeVector:](v34, v31) & 1) != 0)
    {
      v35 = 0;
      uint64_t v36 = 1;
    }
    else
    {
      v81 = (void *)MEMORY[0x1E4F28C58];
      v37 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v38 = (uint64_t)v34;
      if (!v34)
      {
        v79 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
        v37 = v79;
      }
      uint64_t v39 = (uint64_t)v13;
      if (!v13)
      {
        v80 = v37;
        uint64_t v39 = [MEMORY[0x1E4F1CA98] null];
        v37 = v80;
      }
      uint64_t v40 = objc_msgSend(v37, "dictionaryWithObjectsAndKeys:", v38, @"localStoreKV", v39, @"baseline", 0);
      uint64_t v36 = 0;
      v35 = (void *)[v81 errorWithDomain:*MEMORY[0x1E4F281F8] code:134310 userInfo:v40];
    }
    _Block_object_dispose(buf, 8);

    if ((v36 & 1) == 0)
    {
      if (v35)
      {
        id v92 = v35;
      }
      else
      {
        uint64_t v41 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v41, v42, v43, v44, v45, v46, v47, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaselineRollResponseOperation.m");
        v48 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/P"
                               "FUbiquityBaselineRollResponseOperation.m";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 96;
          _os_log_fault_impl(&dword_18AB82000, v48, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
    }
  }
  else
  {
    uint64_t v83 = 0;
    uint64_t v36 = 0;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:2])
  {
    if (v13)
    {
      uint64_t v49 = v13[12];
      if (v49) {
        uint64_t v49 = *(void *)(v49 + 48);
      }
    }
    else
    {
      uint64_t v49 = 0;
    }
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Can adopt: %d replace: %d\nkv: %@", "-[PFUbiquityBaselineRollResponseOperation main]", 170, v36, v83, v49);
  }
  if (!v36)
  {
LABEL_90:
    int v72 = 0;
    goto LABEL_91;
  }
  self;
  if (self)
  {
    v50 = self->super.super.super._localPeerID;
    v51 = self->super.super.super._storeName;
    v52 = self->super.super.super._ubiquityRootLocation;
  }
  else
  {
    v51 = 0;
    v50 = 0;
    v52 = 0;
  }
  v53 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, v50, v51, v52, 0);
  if (v83)
  {
    if (self) {
      v54 = self->super.super.super._store;
    }
    else {
      v54 = 0;
    }
    uint64_t v55 = [(NSPersistentStore *)v54 URL];
    if (self) {
      v56 = self->super.super.super._store;
    }
    else {
      v56 = 0;
    }
    uint64_t v57 = [(NSPersistentStore *)v56 type];
    if (self) {
      v58 = self->super.super.super._store;
    }
    else {
      v58 = 0;
    }
    uint64_t v59 = [(NSPersistentStore *)v58 options];
    if (self) {
      v60 = self->super.super.super._localPeerID;
    }
    else {
      v60 = 0;
    }
    if (!-[PFUbiquityBaseline importBaselineForStoreAtURL:ofType:options:withLocalPeerID:stack:andPersistentStoreCoordinator:error:]((uint64_t)v13, v55, v57, v59, (uint64_t)v60, (uint64_t)v53, v14, &v92))goto LABEL_97; {
    if (self)
    }
    {
      v61 = self->super.super.super._store;
      v62 = self->super.super.super._localPeerID;
    }
    else
    {
      v61 = 0;
      v62 = 0;
    }
    if (!+[PFUbiquityBaseline removePeerSpecificIdentifiersFromStore:withLocalPeerID:]((uint64_t)PFUbiquityBaseline, v61, (uint64_t)v62))goto LABEL_97; {
    v63 = [PFUbiquityStoreMetadataMedic alloc];
    }
    if (self)
    {
      v64 = self->super.super.super._store;
      v65 = self->super.super.super._localPeerID;
      v66 = self->super.super.super._ubiquityRootLocation;
    }
    else
    {
      v65 = 0;
      v64 = 0;
      v66 = 0;
    }
    v67 = [(PFUbiquityStoreMetadataMedic *)v63 initWithStore:v64 localPeerID:v65 andUbiquityRootLocation:v66];
    int v68 = -[PFUbiquityStoreMetadataMedic recoverMetadataWithError:](v67, &v92);

    if (v68)
    {
      id v69 = [(PFUbiquityBaselineRollResponseOperation *)self retainedDelegate];
      v70 = v69;
      if (v69) {
        [v69 rollResponseOperation:self successfullyAdoptedBaseline:v13];
      }

      BOOL v71 = 1;
    }
    else
    {
LABEL_97:
      BOOL v71 = 0;
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Adopted: %d", "-[PFUbiquityBaselineRollResponseOperation main]", 195, v71);
    }
  }
  else
  {
    unsigned int v74 = -[PFUbiquityBaseline makeCurrentBaselineWithError:]((uint64_t)v13, &v92);
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Made current w/o replace: %d", "-[PFUbiquityBaselineRollResponseOperation main]", 199, v74);
    }
    if (!v74) {
      goto LABEL_111;
    }
    if (self) {
      v75 = self->super.super.super._store;
    }
    else {
      v75 = 0;
    }
    BOOL v71 = -[PFUbiquityBaseline updateCurrentStoreIdentifier:error:](v13, (uint64_t)[(NSPersistentStore *)v75 identifier]);
  }
  if (!v71)
  {
LABEL_111:
    int v72 = 0;
    goto LABEL_112;
  }
  if (!v13)
  {
    uint64_t v76 = 0;
    if (self) {
      goto LABEL_109;
    }
LABEL_131:
    v77 = 0;
    v78 = 0;
    goto LABEL_110;
  }
  uint64_t v76 = v13[12];
  if (!self) {
    goto LABEL_131;
  }
LABEL_109:
  v77 = self->super.super.super._localPeerID;
  v78 = self->super.super.super._ubiquityRootLocation;
LABEL_110:
  +[PFUbiquityTransactionLog truncateLogFilesBeforeBaselineMetadata:withLocalPeerID:andUbiquityRootLocation:]((uint64_t)PFUbiquityTransactionLog, v76, v77, v78);
  int v72 = 1;
LABEL_112:

LABEL_91:
  id v73 = [(PFUbiquityBaselineRollResponseOperation *)self retainedDelegate];
  v16 = v73;
  if (!v73) {
    goto LABEL_94;
  }
  v17 = 0;
  if (v72) {
    [v73 rollResponseOperation:self successfullyAdoptedBaseline:v13];
  }
  else {
    [v73 rollResponseOperation:self encounteredAnError:v92 whileTryingToAdoptBaseline:v13];
  }
LABEL_95:
  _Block_object_dispose(&v86, 8);
}

id __47__PFUbiquityBaselineRollResponseOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 264);
  }
  else {
    id v3 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = -[NSSQLCore fetchUbiquityKnowledgeVector](v3);
  v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return v4;
}

@end