@interface PFUbiquityStoreMetadataMedic
- (PFUbiquityStoreMetadataMedic)initWithStore:(id)a3 localPeerID:(id)a4 andUbiquityRootLocation:(id)a5;
- (uint64_t)recoverMetadataWithError:(void *)a1;
- (void)dealloc;
@end

@implementation PFUbiquityStoreMetadataMedic

- (PFUbiquityStoreMetadataMedic)initWithStore:(id)a3 localPeerID:(id)a4 andUbiquityRootLocation:(id)a5
{
  v8 = [(PFUbiquityStoreMetadataMedic *)self init];
  if (v8)
  {
    v8->_storeName = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKey:", @"NSPersistentStoreUbiquitousContentNameKey");
    v8->_ubiquityRootLocation = (PFUbiquityLocation *)a5;
    v8->_store = (NSPersistentStore *)a3;
    v8->_localPeerID = (NSString *)a4;
  }
  return v8;
}

- (void)dealloc
{
  self->_localPeerID = 0;
  self->_storeName = 0;

  self->_store = 0;
  self->_ubiquityRootLocation = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityStoreMetadataMedic;
  [(PFUbiquityStoreMetadataMedic *)&v3 dealloc];
}

- (uint64_t)recoverMetadataWithError:(void *)a1
{
  uint64_t v213 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    char v151 = 0;
    return v151 & 1;
  }
  id v187 = 0;
  if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Beginning metadata recovery for store: %@", "-[PFUbiquityStoreMetadataMedic recoverMetadataWithError:]", 90, a1[4]);
  }
  v168 = a2;
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Metadata recovery for store: %@\nCreating new store metadata.", "-[PFUbiquityStoreMetadataMedic recoverMetadataWithError:]", 105, a1[4]);
  }
  self;
  v173 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, a1[1], a1[3], a1[2], &v187);
  if (!v173 || ![v173[1] persistentStoreCoordinator])
  {
    int v62 = 0;
    v170 = 0;
    v63 = 0;
    self = 0;
    char v188 = 0;
    goto LABEL_259;
  }
  if (!-[_PFUbiquityStack purgeAndInitializeMetadataStoreFileWithError:]((uint64_t)v173, &v187))
  {
    v170 = 0;
LABEL_99:
    id v165 = 0;
    self = 0;
    goto LABEL_254;
  }
  self;
  v170 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)a1[3], (uint64_t)a1[1]);
  if (v170)
  {
    uint64_t v3 = v170[11];
    if (v3 && (uint64_t v4 = *(void *)(v3 + 88)) != 0) {
      uint64_t v5 = *(void *)(v4 + 56);
    }
    else {
      uint64_t v5 = 0;
    }
    if (!-[PFUbiquityTransactionHistoryCache purgeCacheAndWritePendingEntries:error:](v5, 0)) {
      goto LABEL_99;
    }
  }
  v6 = [[PFUbiquityStoreMetadata alloc] initWithUbiquityName:a1[3] andUbiquityRootLocation:a1[2] insertIntoManagedObjectContext:v173[1]];
  -[PFUbiquityStoreMetadata updateWithStore:andRootLocation:](v6, a1[4], (uint64_t)a1[2]);

  if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nMetadata recovery for store: %@\nCreated new store metadata: %@\nMoving on to recreating the peer ranges.", "-[PFUbiquityStoreMetadataMedic recoverMetadataWithError:]", 125, a1, a1[4], v6);
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nMetadata recovery for store: %@\nFinished creating new peer ranges, moving to knowledge vector, peer states, and transaction entries.", "-[PFUbiquityStoreMetadataMedic recoverMetadataWithError:]", 127, a1, a1[4]);
  }
  id v7 = (id)[a1[4] persistentStoreCoordinator];
  uint64_t v181 = 0;
  v182 = &v181;
  uint64_t v183 = 0x3052000000;
  v184 = __Block_byref_object_copy__62;
  v185 = __Block_byref_object_dispose__62;
  uint64_t v186 = 0;
  v180[0] = MEMORY[0x1E4F143A8];
  v180[1] = 3221225472;
  v180[2] = __57__PFUbiquityStoreMetadataMedic_recoverMetadataWithError___block_invoke;
  v180[3] = &unk_1E544B9B0;
  v180[5] = &v181;
  v180[4] = a1;
  id v165 = v7;
  [v7 performBlockAndWait:v180];
  id v8 = (id)v182[5];
  if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nMetadata recovery for store: %@\nFetched knowledge vector: %@", "-[PFUbiquityStoreMetadataMedic recoverMetadataWithError:]", 137, a1, a1[4], v182[5]);
  }
  v9 = [PFUbiquityKnowledgeVector alloc];
  v10 = [(PFUbiquityKnowledgeVector *)v9 initWithStoreKnowledgeVectorDictionary:v182[5]];
  -[PFUbiquityStoreMetadata updatePeerStatesToMatchKnowledgeVector:](v6, (uint64_t)v10);
  self = [[PFUbiquityImportContext alloc] initWithStack:v173 andStoreMetadata:v6];
  v12 = [[PFUbiquitySwitchboardCacheWrapper alloc] initWithStoreName:a1[3] privateStore:a1[4] forLocalPeerID:a1[1] andUbiquityRootLocation:a1[2]];
  if (self)
  {
    objc_setProperty_nonatomic(self, v11, v12, 88);
    objc_setProperty_nonatomic(self, v13, v10, 32);
  }

  if (self && (cacheWrapper = self->_cacheWrapper) != 0) {
    uint64_t peerRangeCache = (uint64_t)cacheWrapper->_peerRangeCache;
  }
  else {
    uint64_t peerRangeCache = 0;
  }
  if (!-[PFUbiquityPeerRangeCache cachePeerRanges:](peerRangeCache))
  {
LABEL_253:
    _Block_object_dispose(&v181, 8);
    goto LABEL_254;
  }
  id v202 = 0;
  v16 = -[PFUbiquityBaseline initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:]([PFUbiquityBaseline alloc], "initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:", a1[1], a1[2], a1[3], objc_msgSend((id)objc_msgSend(a1[4], "persistentStoreCoordinator"), "managedObjectModel"));
  v17 = v16;
  if (!v16
    || (v18 = -[PFUbiquityBaseline _createPersistentStoreCoordinatorForCurrentBaseline:error:](v16, 1, &v202)) == 0)
  {
    BOOL v53 = v202 == 0;
    goto LABEL_103;
  }
  v19 = v18;
  v20 = [[NSManagedObjectContext alloc] initWithConcurrencyType:3];
  [(NSManagedObjectContext *)v20 setPersistentStoreCoordinator:v19];
  [(NSManagedObjectContext *)v20 setUndoManager:0];
  [(NSManagedObjectContext *)v20 _setDelegate:a1];
  [(NSManagedObjectContext *)v20 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v199 = 0u;
  long long v200 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  v164 = v20;
  v22 = [(NSManagedObjectModel *)[(NSPersistentStoreCoordinator *)v19 managedObjectModel] entities];
  uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v197 objects:v205 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v198;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v198 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = *(void *)(*((void *)&v197 + 1) + 8 * v25);
        if (v26)
        {
          if ((*(unsigned char *)(v26 + 120) & 4) != 0)
          {
            uint64_t v27 = *(void *)(v26 + 72);
          }
          else
          {
            do
            {
              uint64_t v27 = v26;
              uint64_t v26 = [(id)v26 superentity];
            }
            while (v26);
          }
        }
        else
        {
          uint64_t v27 = 0;
        }
        [v21 addObject:v27];
        ++v25;
      }
      while (v25 != v23);
      uint64_t v28 = [(NSArray *)v22 countByEnumeratingWithState:&v197 objects:v205 count:16];
      uint64_t v23 = v28;
    }
    while (v28);
  }

  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  uint64_t v29 = [v21 countByEnumeratingWithState:&v193 objects:v204 count:16];
  if (!v29)
  {
    BOOL v53 = 1;
    goto LABEL_102;
  }
  v163 = v17;
  uint64_t v167 = *(void *)v194;
  do
  {
    uint64_t v171 = 0;
    uint64_t v166 = v29;
    do
    {
      if (*(void *)v194 != v167) {
        objc_enumerationMutation(v21);
      }
      v30 = -[NSFetchRequest initWithEntityName:]([NSFetchRequest alloc], "initWithEntityName:", [*(id *)(*((void *)&v193 + 1) + 8 * v171) name]);
      [(NSFetchRequest *)v30 setResultType:1];
      [(NSFetchRequest *)v30 setIncludesPropertyValues:0];
      v31 = [(NSManagedObjectContext *)v20 executeFetchRequest:v30 error:&v202];
      v169 = v30;
      if (!v31)
      {
        BOOL v53 = 0;
        goto LABEL_87;
      }
      if (self)
      {
        v32 = self->_cacheWrapper;
        if (v32) {
          uint64_t v33 = (uint64_t)v32->_peerRangeCache;
        }
        else {
          uint64_t v33 = 0;
        }
        stack = self->_stack;
        if (stack)
        {
          metadataMOC = stack->_metadataMOC;
          goto LABEL_53;
        }
      }
      else
      {
        uint64_t v33 = 0;
      }
      metadataMOC = 0;
LABEL_53:
      if (![(NSManagedObjectContext *)metadataMOC persistentStoreCoordinator])
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  addTransactionHistoryEntriesForObjectIDs: lost its stack", "-[PFUbiquityStoreMetadataMedic addTransactionHistoryEntriesForObjectIDs:withImportContext:error:]", 310);
        }
        v174 = 0;
        id v176 = 0;
        id v38 = 0;
LABEL_83:
        uint64_t v54 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v54, v55, v56, v57, v58, v59, v60, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityStoreMetadataMedic.m");
        v61 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v210 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityStoreMetadataMedic.m";
          __int16 v211 = 1024;
          int v212 = 315;
          _os_log_fault_impl(&dword_18AB82000, v61, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
        BOOL v53 = 0;
        goto LABEL_86;
      }
      if (self) {
        uint64_t kv = (uint64_t)self->_kv;
      }
      else {
        uint64_t kv = 0;
      }
      id v176 = -[PFUbiquityKnowledgeVector createKnowledgeVectorString](kv);
      v174 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:0.0];
      long long v191 = 0u;
      long long v192 = 0u;
      long long v189 = 0u;
      long long v190 = 0u;
      uint64_t v37 = [(NSArray *)v31 countByEnumeratingWithState:&v189 objects:v203 count:16];
      if (v37)
      {
        id v38 = 0;
        uint64_t v39 = *(void *)v190;
LABEL_58:
        uint64_t v40 = 0;
        v41 = v38;
        while (1)
        {
          if (*(void *)v190 != v39) {
            objc_enumerationMutation(v31);
          }
          v42 = *(void **)(*((void *)&v189 + 1) + 8 * v40);
          if (v41) {
            [v41 drain];
          }
          id v38 = objc_alloc_init(MEMORY[0x1E4F28B28]);
          v43 = (void *)-[PFUbiquityPeerRangeCache createGlobalObjectIDForManagedObjectID:](v33, v42);
          if (!v43) {
            break;
          }
          v44 = [PFUbiquityTransactionEntry alloc];
          if (self && (v45 = self->_stack) != 0) {
            v46 = v45->_metadataMOC;
          }
          else {
            v46 = 0;
          }
          id v47 = [(PFUbiquityTransactionEntry *)v44 initAndInsertIntoManagedObjectContext:v46];
          v48 = v47;
          if (self) {
            storeMetadata = self->_storeMetadata;
          }
          else {
            storeMetadata = 0;
          }
          [v47 setStoreMetadata:storeMetadata];
          [v48 setTransactionDate:v174];
          -[PFUbiquityTransactionEntry setTransactionType:](v48, 3);
          [v48 setKnowledgeVectorString:v176];
          v50 = (void *)[v42 _retainedURIString];
          [v48 setLocalIDStr:v50];

          id v51 = -[PFUbiquityGlobalObjectID createGlobalIDString](v43);
          [v48 setGlobalIDStr:v51];

          ++v40;
          v41 = v38;
          if (v37 == v40)
          {
            uint64_t v52 = [(NSArray *)v31 countByEnumeratingWithState:&v189 objects:v203 count:16];
            uint64_t v37 = v52;
            BOOL v53 = 1;
            if (!v52)
            {
              v20 = v164;
              goto LABEL_86;
            }
            goto LABEL_58;
          }
        }
        v20 = v164;
        if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nNo global ID for managed object ID: %@", "-[PFUbiquityStoreMetadataMedic addTransactionHistoryEntriesForObjectIDs:withImportContext:error:]", 302, a1, v42);
        }
        goto LABEL_83;
      }
      id v38 = 0;
      BOOL v53 = 1;
LABEL_86:

      [v38 drain];
LABEL_87:

      if (!v53) {
        goto LABEL_96;
      }
      ++v171;
    }
    while (v171 != v166);
    uint64_t v29 = [v21 countByEnumeratingWithState:&v193 objects:v204 count:16];
  }
  while (v29);
  BOOL v53 = 1;
LABEL_96:
  v17 = v163;
LABEL_102:

LABEL_103:
  if (v53)
  {
    int v64 = 1;
  }
  else if (v202)
  {
    int v64 = 0;
    id v187 = v202;
  }
  else
  {
    uint64_t v65 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v65, v66, v67, v68, v69, v70, v71, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityStoreMetadataMedic.m");
    v72 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v210 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityStoreMetadataMedic.m";
      __int16 v211 = 1024;
      int v212 = 247;
      _os_log_fault_impl(&dword_18AB82000, v72, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    int v64 = 0;
  }

  if (!v64) {
    goto LABEL_253;
  }
  id v201 = 0;
  v73 = +[PFUbiquityLocation createPeerRootLocationForPeerID:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, (uint64_t)a1[1], a1[2]);
  int v74 = +[PFUbiquityTransactionLog pruneTemporaryLogDirectoryForPeerRootLocation:error:]((uint64_t)PFUbiquityTransactionLog, (uint64_t)v73, &v201);
  v175 = (void *)[objc_alloc(NSNumber) initWithInt:0];
  if (!v74)
  {
    id v76 = 0;
    goto LABEL_269;
  }
  id v75 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, (uint64_t)a1[2], (uint64_t)&v201);
  id v76 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v75)
  {
LABEL_269:
    id v177 = 0;
    id v87 = 0;
    v98 = 0;
    char v90 = 0;
    goto LABEL_273;
  }
  v172 = v73;
  long long v199 = 0u;
  long long v200 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  uint64_t v77 = [v75 countByEnumeratingWithState:&v197 objects:v205 count:16];
  if (v77)
  {
    uint64_t v78 = *(void *)v198;
    do
    {
      uint64_t v79 = 0;
      do
      {
        if (*(void *)v198 != v78) {
          objc_enumerationMutation(v75);
        }
        uint64_t v80 = *(void *)(*((void *)&v197 + 1) + 8 * v79);
        if (v80)
        {
          unsigned int v81 = *(_DWORD *)(v80 + 24);
          BOOL v82 = v81 > 0x1A;
          int v83 = (1 << v81) & 0x4600000;
          BOOL v84 = v82 || v83 == 0;
          if (!v84 && [*(id *)(v80 + 40) isEqualToString:a1[3]])
          {
            v85 = self ? self->_storeMetadata : 0;
            if (objc_msgSend(*(id *)(v80 + 48), "isEqualToString:", -[PFUbiquityStoreMetadata modelVersionHashString](v85, "modelVersionHashString")))objc_msgSend(v76, "addObject:", v80); {
          }
            }
        }
        ++v79;
      }
      while (v77 != v79);
      uint64_t v86 = [v75 countByEnumeratingWithState:&v197 objects:v205 count:16];
      uint64_t v77 = v86;
    }
    while (v86);
  }

  id v177 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  id v87 = 0;
  uint64_t v88 = [v76 countByEnumeratingWithState:&v193 objects:v204 count:16];
  if (!v88)
  {
    v98 = 0;
    char v90 = 1;
    goto LABEL_273;
  }
  uint64_t v89 = *(void *)v194;
  char v90 = 1;
  while (2)
  {
    uint64_t v91 = 0;
LABEL_135:
    if (*(void *)v194 != v89) {
      objc_enumerationMutation(v76);
    }
    uint64_t v92 = *(void *)(*((void *)&v193 + 1) + 8 * v91);
    if (v87) {
      [v87 drain];
    }
    id v87 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    if (!v92
      || ((v93 = *(_DWORD *)(v92 + 24), BOOL v82 = v93 > 0x1A, v94 = (1 << v93) & 0x4600000, !v82)
        ? (BOOL v95 = v94 == 0)
        : (BOOL v95 = 1),
          v95))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ skipping non-transaction log location returned from sub locations: %@", "-[PFUbiquityStoreMetadataMedic recoverTransactionLogMetadataWithImportContext:error:]", 383, a1, v92);
      }
LABEL_227:
      if (v88 == ++v91)
      {
        uint64_t v140 = [v76 countByEnumeratingWithState:&v193 objects:v204 count:16];
        uint64_t v88 = v140;
        if (!v140)
        {
          v98 = 0;
          goto LABEL_271;
        }
        continue;
      }
      goto LABEL_135;
    }
    break;
  }
  if (self && (v96 = self->_cacheWrapper) != 0) {
    uint64_t transactionLogCache = (uint64_t)v96->_transactionLogCache;
  }
  else {
    uint64_t transactionLogCache = 0;
  }
  v98 = -[PFUbiquityTransactionLogCache retainedCachedLogForLocation:loadWithRetry:error:](transactionLogCache, v92, 1, &v201);
  if (!-[PFUbiquityTransactionLog loadImportMetadataWithError:]((uint64_t)v98, &v201))
  {
    char v90 = 0;
    goto LABEL_224;
  }
  if (v98) {
    p_isa = (id *)&v98->_knowledgeVector->super.isa;
  }
  else {
    p_isa = 0;
  }
  if (self) {
    uint64_t v101 = (uint64_t)self->_kv;
  }
  else {
    uint64_t v101 = 0;
  }
  char v90 = 1;
  if ((-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](p_isa, v101) & 1) == 0)
  {
    v102 = v98 ? v98->_knowledgeVector : 0;
    v103 = self ? self->_kv : 0;
    if (![(PFUbiquityKnowledgeVector *)v102 isEqual:v103])
    {
LABEL_224:
      if (self)
      {
        objc_setProperty_nonatomic(self, v99, 0, 56);
        objc_setProperty_nonatomic(self, v138, 0, 64);
      }

      goto LABEL_227;
    }
  }
  if (self) {
    objc_setProperty_nonatomic(self, v99, v98, 56);
  }
  if (v98 && (saveSnapshot = v98->_saveSnapshot) != 0) {
    v105 = (void *)[(NSMutableDictionary *)saveSnapshot->_storeNameToStoreSaveSnapshots objectForKey:a1[3]];
  }
  else {
    v105 = 0;
  }
  if (self) {
    objc_setProperty_nonatomic(self, v99, v105, 64);
  }
  v106 = (void *)[v177 objectForKey:*(void *)(v92 + 32)];
  if (!v106)
  {
    if (self && (v107 = self->_stack) != 0) {
      v108 = v107->_metadataMOC;
    }
    else {
      v108 = 0;
    }
    v106 = (void *)+[PFUbiquityPeer peerForPeerID:inManagedObjectContext:createIfMissing:]((uint64_t)PFUbiquityPeer, *(void **)(v92 + 32), v108, 1);
    [v177 setObject:v106 forKey:*(void *)(v92 + 32)];
  }
  -[PFUbiquityImportContext setActingPeer:](self, v106);
  if (self && (v109 = self->_cacheWrapper) != 0) {
    uint64_t v110 = (uint64_t)v109->_peerRangeCache;
  }
  else {
    uint64_t v110 = 0;
  }
  if (-[PFUbiquityPeerRangeCache cachePeerRanges:](v110))
  {
    if (self)
    {
      if (v110)
      {
        storeSaveSnapshot = self->_storeSaveSnapshot;
        if (storeSaveSnapshot) {
          globalObjectIDs = storeSaveSnapshot->_globalObjectIDs;
        }
        else {
          globalObjectIDs = 0;
        }
        goto LABEL_178;
      }
      globalObjectIDs = 0;
LABEL_242:
      BOOL v115 = 1;
    }
    else
    {
      globalObjectIDs = 0;
      if (!v110) {
        goto LABEL_242;
      }
LABEL_178:
      v113 = (NSMutableArray *)-[PFUbiquityPeerRangeCache createMapOfManagedObjectIDsForGlobalIDs:count:error:](v110, (uint64_t)globalObjectIDs, 0, &v201);
      globalObjectIDs = v113;
      BOOL v115 = v113 == 0;
      if (self && v113)
      {
        objc_setProperty_nonatomic(self, v114, v113, 72);
        BOOL v115 = 0;
      }
    }

    if (!v115)
    {
      if (self)
      {
        v123 = self->_kv;
        uint64_t v124 = v123 ? (uint64_t)[(NSDictionary *)v123->_kv objectForKey:*(void *)(v92 + 32)] : 0;
        v125 = v124 ? (void *)v124 : v175;
        transactionLog = self->_transactionLog;
        if (transactionLog && (knowledgeVector = transactionLog->_knowledgeVector) != 0) {
          uint64_t v128 = [(NSDictionary *)knowledgeVector->_kv objectForKey:*(void *)(v92 + 32)];
        }
        else {
          uint64_t v128 = 0;
        }
      }
      else
      {
        uint64_t v128 = 0;
        v125 = v175;
      }
      if ([v125 compare:v128] == -1)
      {
        if (self)
        {
          objc_setProperty_nonatomic(self, v129, 0, 56);
          objc_setProperty_nonatomic(self, v139, 0, 64);
        }

        char v90 = 1;
        goto LABEL_227;
      }
    }
  }
  id v202 = 0;
  if (-[PFUbiquityTransactionLog loadInsertedObjectsDataWithError:]((uint64_t)v98, &v202))
  {
    if (self && (v116 = self->_storeSaveSnapshot) != 0) {
      insertedObjects = v116->_insertedObjects;
    }
    else {
      insertedObjects = 0;
    }

    if (-[PFUbiquityTransactionLog loadUpdatedObjectsDataWithError:]((uint64_t)v98, &v202))
    {
      if (self && (v118 = self->_storeSaveSnapshot) != 0) {
        updatedObjects = v118->_updatedObjects;
      }
      else {
        updatedObjects = 0;
      }

      if (-[PFUbiquityTransactionLog loadDeletedObjectsDataWithError:]((uint64_t)v98, &v202))
      {
        if (self && (v120 = self->_storeSaveSnapshot) != 0) {
          deletedObjects = v120->_deletedObjects;
        }
        else {
          deletedObjects = 0;
        }

        int v122 = 1;
        goto LABEL_220;
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nHad trouble loading the deleted objects for a the transaction log: %@\nError: %@\nuserInfo: %@\nFailing now.", "-[PFUbiquityStoreMetadataMedic cacheMetadataForTransactionLog:withImportContext:error:]", 515, a1, v98, v202, [v202 userInfo]);
      }
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nHad trouble loading the updated objects for a the transaction log: %@\nError: %@\nuserInfo: %@\nFailing now.", "-[PFUbiquityStoreMetadataMedic cacheMetadataForTransactionLog:withImportContext:error:]", 518, a1, v98, v202, [v202 userInfo]);
    }
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nHad trouble loading the inserted objects for a the transaction log: %@\nError: %@\nuserInfo: %@\nFailing now.", "-[PFUbiquityStoreMetadataMedic cacheMetadataForTransactionLog:withImportContext:error:]", 521, a1, v98, v202, [v202 userInfo]);
  }
  if (v202)
  {
    int v122 = 0;
    id v201 = v202;
  }
  else
  {
    uint64_t v130 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v130, v131, v132, v133, v134, v135, v136, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityStoreMetadataMedic.m");
    v137 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v210 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityStoreMetadataMedic.m";
      __int16 v211 = 1024;
      int v212 = 525;
      _os_log_fault_impl(&dword_18AB82000, v137, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    int v122 = 0;
  }
LABEL_220:

  if (v122)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Successfully rebuilt metadata for log: %@", "-[PFUbiquityStoreMetadataMedic recoverTransactionLogMetadataWithImportContext:error:]", 435, v98);
    }
    char v90 = 1;
    goto LABEL_224;
  }
  char v90 = 0;
LABEL_271:
  v73 = v172;
LABEL_273:
  if ((v90 & 1) == 0 && v201) {
    id v153 = v201;
  }
  [v87 drain];
  if ((v90 & 1) == 0)
  {
    id v154 = v201;
    if (v201)
    {
      id v187 = v201;
    }
    else
    {
      uint64_t v155 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v155, v156, v157, v158, v159, v160, v161, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityStoreMetadataMedic.m");
      v162 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v210 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityStoreMetadataMedic.m";
        __int16 v211 = 1024;
        int v212 = 466;
        _os_log_fault_impl(&dword_18AB82000, v162, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  _Block_object_dispose(&v181, 8);
  if ((v90 & 1) == 0)
  {
LABEL_254:
    char v141 = 0;
    goto LABEL_255;
  }
  char v141 = [v173[1] save:&v187];
LABEL_255:
  if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nMetadata recovery for store: %@\nFinished.", "-[PFUbiquityStoreMetadataMedic recoverMetadataWithError:]", 166, a1, a1[4]);
  }
  int v62 = 1;
  v63 = v165;
  if ((v141 & 1) == 0)
  {
LABEL_259:
    if (v187)
    {
      if (v168)
      {
        char v142 = 0;
        void *v168 = v187;
        goto LABEL_265;
      }
    }
    else
    {
      uint64_t v143 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v143, v144, v145, v146, v147, v148, v149, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityStoreMetadataMedic.m");
      v150 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v205 = 136315394;
        v206 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityStoreMetadataMedic.m";
        __int16 v207 = 1024;
        int v208 = 169;
        _os_log_fault_impl(&dword_18AB82000, v150, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v205, 0x12u);
      }
    }
    char v142 = 0;
    goto LABEL_265;
  }
  char v142 = 1;
LABEL_265:

  char v151 = v188;
  if (v62) {
    char v151 = v142;
  }
  return v151 & 1;
}

id __57__PFUbiquityStoreMetadataMedic_recoverMetadataWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 32);
  }
  else {
    uint64_t v3 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = -[NSSQLCore fetchUbiquityKnowledgeVector](v3);
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return v4;
}

@end