@interface PFUbiquityTransactionHistoryCache
- (BOOL)addTransactionEntry:(id)a3 error:(id *)a4;
- (BOOL)addTransactionEntryLight:(uint64_t)a1 needsWrite:(void *)a2 error:(int)a3;
- (BOOL)purgeCacheAndWritePendingEntries:(uint64_t)a1 error:(int)a2;
- (BOOL)writePendingEntries:(uint64_t)a1;
- (PFUbiquityTransactionHistoryCache)init;
- (id)description;
- (uint64_t)addTransactionEntryLights:(uint64_t)a1 error:(void *)a2;
- (uint64_t)cacheTransactionHistory:(uint64_t)a1;
- (uint64_t)cachedTransactionHistoryForGlobalID:(uint64_t)a1;
- (void)dealloc;
- (void)initWithLocalPeerID:(void *)a3 storeName:(void *)a4 privateStore:(void *)a5 andUbiquityRootLocation:;
@end

@implementation PFUbiquityTransactionHistoryCache

- (PFUbiquityTransactionHistoryCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)PFUbiquityTransactionHistoryCache;
  v2 = [(PFUbiquityTransactionHistoryCache *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_peerIDToHistoryArray = 0;
    v4 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    v3->_globalIDToHistoryArray = 0;
    v3->_peerIDToHistoryArrayLock = v4;
    *(_OWORD *)&v3->_localPeerID = 0u;
    *(_OWORD *)&v3->_storeName = 0u;
    v3->_privatePSC = 0;
    v3->_entriesToWrite = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->_cacheKV = [[PFUbiquityKnowledgeVector alloc] initWithKnowledgeVectorString:&stru_1ED787880];
    v3->_minCacheKV = [[PFUbiquityKnowledgeVector alloc] initWithKnowledgeVectorString:&stru_1ED787880];
    v3->_globalIDCache = 0;
    v3->_hasScheduledWriteBlock = 0;
  }
  return v3;
}

- (void)initWithLocalPeerID:(void *)a3 storeName:(void *)a4 privateStore:(void *)a5 andUbiquityRootLocation:
{
  if (!a1) {
    return 0;
  }
  v9 = (void *)[a1 init];
  if (v9)
  {
    v9[1] = a2;
    v9[2] = a5;
    v9[3] = a3;
    id v10 = (id)[a4 persistentStoreCoordinator];
    v9[4] = a4;
    v9[5] = v10;
  }
  return v9;
}

- (void)dealloc
{
  self->_globalIDCache = 0;
  self->_peerIDToHistoryArray = 0;

  self->_peerIDToHistoryArrayLock = 0;
  self->_localPeerID = 0;

  self->_rootLocation = 0;
  self->_storeName = 0;

  self->_privateStore = 0;
  self->_privatePSC = 0;

  self->_globalIDToHistoryArray = 0;
  self->_entriesToWrite = 0;

  self->_cacheKV = 0;
  self->_minCacheKV = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityTransactionHistoryCache;
  [(PFUbiquityTransactionHistoryCache *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityTransactionHistoryCache;
  return (id)[NSString stringWithFormat:@"%@\n\tlocalPeerID: %@\n\tstoreName: %@\n\tcacheKV: %@\n\tminCacheKV: %@\n", -[PFUbiquityTransactionHistoryCache description](&v3, sel_description), self->_localPeerID, self->_storeName, self->_cacheKV, self->_minCacheKV];
}

- (uint64_t)cacheTransactionHistory:(uint64_t)a1
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    char v33 = 0;
    return v33 & 1;
  }
  id v39 = 0;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  [*(id *)(a1 + 64) lock];
  if (*(void *)(a1 + 48))
  {
    v5 = 0;
    objc_super v6 = 0;
    int v7 = 0;
    char v8 = 1;
    char v40 = 1;
    goto LABEL_27;
  }
  *(void *)(a1 + 48) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  *(void *)(a1 + 56) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([*(id *)(a1 + 72) count] && !-[PFUbiquityTransactionHistoryCache writePendingEntries:](a1, &v39)) {
    goto LABEL_25;
  }
  self;
  v9 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, *(void **)(a1 + 8), *(void **)(a1 + 24), *(void **)(a1 + 16), &v39);
  if (!v9)
  {
    if (v39)
    {
      if (a2)
      {
        v5 = 0;
        objc_super v6 = 0;
        char v8 = 0;
        *a2 = v39;
LABEL_26:
        int v7 = 1;
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v15 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityTransactionHistoryCache.m");
      v22 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityTransact"
              "ionHistoryCache.m";
        __int16 v44 = 1024;
        int v45 = 135;
        _os_log_fault_impl(&dword_18AB82000, v22, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
LABEL_25:
    v5 = 0;
    objc_super v6 = 0;
    char v8 = 0;
    goto LABEL_26;
  }
  v5 = [[NSFetchRequest alloc] initWithEntityName:@"PFUbiquityTransactionEntry"];
  id v10 = (void *)[v9[1] executeFetchRequest:v5 error:&v39];
  v11 = v10;
  if (v10)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (!v12)
    {
      int v7 = 1;
LABEL_22:
      objc_super v6 = v9;
      char v8 = 1;
      goto LABEL_27;
    }
    uint64_t v13 = *(void *)v36;
LABEL_10:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v36 != v13) {
        objc_enumerationMutation(v11);
      }
      if (([(id)a1 addTransactionEntry:*(void *)(*((void *)&v35 + 1) + 8 * v14) error:&v39] & 1) == 0) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v41 count:16];
        int v7 = 1;
        if (v12) {
          goto LABEL_10;
        }
        goto LABEL_22;
      }
    }
  }
  char v8 = 0;
  int v7 = 1;
  objc_super v6 = v9;
LABEL_27:
  [*(id *)(a1 + 64) unlock];
  if (v39) {
    id v23 = v39;
  }

  [v4 drain];
  if ((v8 & 1) == 0)
  {
    id v24 = v39;
    if (v39)
    {
      if (a2) {
        *a2 = v39;
      }
    }
    else
    {
      uint64_t v25 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v25, v26, v27, v28, v29, v30, v31, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityTransactionHistoryCache.m");
      v32 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityTransact"
              "ionHistoryCache.m";
        __int16 v44 = 1024;
        int v45 = 178;
        _os_log_fault_impl(&dword_18AB82000, v32, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  char v33 = v40;
  if (v7) {
    char v33 = v8;
  }
  return v33 & 1;
}

- (BOOL)writePendingEntries:(uint64_t)a1
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x2020000000;
  char v75 = 1;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3052000000;
  v69 = __Block_byref_object_copy__69;
  v70 = __Block_byref_object_dispose__69;
  uint64_t v71 = 0;
  [*(id *)(a1 + 64) lock];
  id v3 = *(id *)(a1 + 72);

  id obj = v3;
  *(void *)(a1 + 72) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  *(unsigned char *)(a1 + 104) = 0;
  [*(id *)(a1 + 64) unlock];
  self;
  id v4 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, *(void **)(a1 + 8), *(void **)(a1 + 24), *(void **)(a1 + 16), v67 + 5);
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v60 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v6 = [v3 countByEnumeratingWithState:&v62 objects:v76 count:16];
    if (v6)
    {
      uint64_t v59 = *(void *)v63;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v63 != v59) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v62 + 1) + 8 * v7);
          if (v8) {
            uint64_t v9 = *(void *)(v8 + 32);
          }
          else {
            uint64_t v9 = 0;
          }
          id v10 = (void *)[v5 objectForKey:v9];
          if (!v10)
          {
            if (v8) {
              v11 = *(void **)(v8 + 32);
            }
            else {
              v11 = 0;
            }
            id v10 = (void *)+[PFUbiquityStoreMetadata metadataForStoreWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, v11, v4[1]);
            if (!v10)
            {
              uint64_t v12 = [PFUbiquityStoreMetadata alloc];
              if (v8)
              {
                uint64_t v13 = *(void *)(v8 + 32);
                uint64_t v14 = *(void *)(v8 + 48);
                if (v14 && *(_DWORD *)(v14 + 24) != 1) {
                  uint64_t v14 = *(void *)(v14 + 8);
                }
              }
              else
              {
                uint64_t v13 = 0;
                uint64_t v14 = 0;
              }
              uint64_t v15 = [(PFUbiquityStoreMetadata *)v12 initWithUbiquityName:v13 andUbiquityRootLocation:v14 insertIntoManagedObjectContext:v4[1]];
              id v10 = v15;
              if (v8 && (uint64_t v16 = *(void *)(v8 + 48)) != 0) {
                uint64_t v17 = *(void *)(v16 + 48);
              }
              else {
                uint64_t v17 = 0;
              }
              [(PFUbiquityStoreMetadata *)v15 setModelVersionHashString:v17];
            }
            if (v8) {
              uint64_t v18 = *(void *)(v8 + 32);
            }
            else {
              uint64_t v18 = 0;
            }
            [v5 setObject:v10 forKey:v18];
          }
          if (v8) {
            uint64_t v19 = *(void *)(v8 + 24);
          }
          else {
            uint64_t v19 = 0;
          }
          uint64_t v20 = [v60 objectForKey:v19];
          if (!v20)
          {
            if (v8) {
              uint64_t v21 = *(void **)(v8 + 24);
            }
            else {
              uint64_t v21 = 0;
            }
            uint64_t v20 = +[PFUbiquityPeer peerForPeerID:inManagedObjectContext:createIfMissing:]((uint64_t)PFUbiquityPeer, v21, v4[1], 1);
            if (v8) {
              uint64_t v22 = *(void *)(v8 + 24);
            }
            else {
              uint64_t v22 = 0;
            }
            [v60 setObject:v20 forKey:v22];
          }
          id v23 = [[PFUbiquityTransactionEntry alloc] initAndInsertIntoManagedObjectContext:v4[1]];
          [v23 setActingPeer:v20];
          [v23 setStoreMetadata:v10];
          if (v8) {
            id v24 = *(void **)(v8 + 8);
          }
          else {
            id v24 = 0;
          }
          id v25 = -[PFUbiquityGlobalObjectID createGlobalIDString](v24);
          [v23 setGlobalIDStr:v25];

          if (v8) {
            uint64_t v26 = *(unsigned int *)(v8 + 16);
          }
          else {
            uint64_t v26 = 0;
          }
          -[PFUbiquityTransactionEntry setTransactionType:](v23, v26);
          if (v8 && (uint64_t v27 = *(void *)(v8 + 48)) != 0) {
            uint64_t v28 = *(void *)(v27 + 56);
          }
          else {
            uint64_t v28 = 0;
          }
          [v23 setTransactionLogFilename:v28];
          objc_msgSend(v23, "setTransactionDate:", objc_msgSend((id)v8, "transactionDate"));
          objc_msgSend(v23, "setTransactionNumber:", objc_msgSend((id)v8, "transactionNumber"));
          if (v8 && (uint64_t v29 = *(void *)(v8 + 8)) != 0) {
            uint64_t v30 = *(void **)(v29 + 48);
          }
          else {
            uint64_t v30 = 0;
          }
          objc_msgSend(v23, "setLocalIDStr:", objc_msgSend((id)objc_msgSend(v30, "URIRepresentation"), "absoluteString"));
          if (v8) {
            uint64_t v31 = *(void *)(v8 + 56);
          }
          else {
            uint64_t v31 = 0;
          }
          id v32 = -[PFUbiquityKnowledgeVector createKnowledgeVectorString](v31);
          [v23 setKnowledgeVectorString:v32];

          ++v7;
        }
        while (v6 != v7);
        uint64_t v33 = [v3 countByEnumeratingWithState:&v62 objects:v76 count:16];
        uint64_t v6 = v33;
      }
      while (v33);
    }
    id v34 = (id)[v4[1] persistentStoreCoordinator];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __57__PFUbiquityTransactionHistoryCache_writePendingEntries___block_invoke;
    v61[3] = &unk_1E544C9B0;
    v61[4] = v34;
    v61[5] = v4;
    v61[7] = &v72;
    v61[8] = &v66;
    v61[6] = a1;
    [v34 performBlockAndWait:v61];
    id v35 = (id)v67[5];

    goto LABEL_68;
  }
  *((unsigned char *)v73 + 24) = 0;
  uint64_t v36 = v67[5];
  if (!v36)
  {
    uint64_t v37 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v37, v38, v39, v40, v41, v42, v43, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityTransactionHistoryCache.m");
    __int16 v44 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v78 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityTransactionHistoryCache.m";
      __int16 v79 = 1024;
      int v80 = 319;
      _os_log_fault_impl(&dword_18AB82000, v44, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    goto LABEL_67;
  }
  if (!a2)
  {
LABEL_67:
    id v5 = 0;
    id v60 = 0;
    id v4 = 0;
    goto LABEL_68;
  }
  id v5 = 0;
  id v60 = 0;
  id v4 = 0;
  *a2 = v36;
LABEL_68:

  if (!*((unsigned char *)v73 + 24))
  {
    uint64_t v47 = v67[5];
    if (v47)
    {
      if (a2) {
        *a2 = v47;
      }
    }
    else
    {
      uint64_t v48 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v48, v49, v50, v51, v52, v53, v54, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityTransactionHistoryCache.m");
      v55 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v78 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityTransact"
              "ionHistoryCache.m";
        __int16 v79 = 1024;
        int v80 = 405;
        _os_log_fault_impl(&dword_18AB82000, v55, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  if (!*((unsigned char *)v73 + 24))
  {
    [*(id *)(a1 + 64) lock];
    [*(id *)(a1 + 72) addObjectsFromArray:obj];
    [*(id *)(a1 + 64) unlock];
  }

  BOOL v45 = *((unsigned char *)v73 + 24) != 0;
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v72, 8);
  return v45;
}

- (BOOL)addTransactionEntry:(id)a3 error:(id *)a4
{
  id v5 = [[PFUbiquityTransactionEntryLight alloc] initWithTransactionEntry:a3 ubiquityRootLocation:self->_rootLocation andGlobalIDCache:self->_globalIDCache];
  LOBYTE(self) = -[PFUbiquityTransactionHistoryCache addTransactionEntryLight:needsWrite:error:]((uint64_t)self, v5, 0);

  return (char)self;
}

- (BOOL)addTransactionEntryLight:(uint64_t)a1 needsWrite:(void *)a2 error:(int)a3
{
  if (a1)
  {
    [*(id *)(a1 + 64) lock];
    if (a2) {
      uint64_t v6 = a2[1];
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = (id)[*(id *)(a1 + 56) objectForKey:v6];
    if (!v7)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (a2) {
        uint64_t v8 = a2[1];
      }
      else {
        uint64_t v8 = 0;
      }
      [*(id *)(a1 + 56) setObject:v7 forKey:v8];
    }
    [v7 addObject:a2];
    if (a2) {
      uint64_t v9 = (__CFString *)a2[3];
    }
    else {
      uint64_t v9 = 0;
    }
    if (v9) {
      id v10 = v9;
    }
    else {
      id v10 = @"baseline";
    }
    id v11 = (id)[*(id *)(a1 + 48) objectForKey:v10];
    if (!v11)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:");
    }
    unint64_t v12 = objc_msgSend((id)objc_msgSend(a2, "transactionNumber"), "unsignedIntegerValue");
    if (v12 >= [v11 count])
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v11 addObject:v13];
    }
    else
    {
      id v13 = (id)objc_msgSend(v11, "objectAtIndex:", objc_msgSend((id)objc_msgSend(a2, "transactionNumber"), "unsignedIntegerValue"));
    }
    if (a2) {
      uint64_t v14 = a2[1];
    }
    else {
      uint64_t v14 = 0;
    }
    [v13 setObject:a2 forKey:v14];
    if (a2) {
      uint64_t v15 = a2[7];
    }
    else {
      uint64_t v15 = 0;
    }
    -[PFUbiquityKnowledgeVector updateWithKnowledgeVector:](*(void *)(a1 + 80), v15);
    if (a2) {
      uint64_t v16 = a2[7];
    }
    else {
      uint64_t v16 = 0;
    }
    -[PFUbiquityKnowledgeVector decrementToMinimumWithKnowledgeVector:](*(void *)(a1 + 88), v16);
    if (a2)
    {
      uint64_t v18 = a2[1];
      if (v18)
      {
        uint64_t v19 = *(void **)(v18 + 48);
        if (v19)
        {
          if ([v19 persistentStore] != *(void *)(a1 + 32))
          {
            uint64_t v20 = a2[1];
            uint64_t v21 = v20 ? *(void **)(v20 + 48) : 0;
            uint64_t v17 = -[NSPersistentStoreCoordinator managedObjectIDForURIRepresentation:error:](*(void **)(a1 + 40), (CFURLRef)[v21 URIRepresentation], 0);
            id v23 = (void *)a2[1];
            if (v23) {
              objc_setProperty_nonatomic(v23, v22, v17, 48);
            }
          }
        }
      }
    }
    if (a3) {
      [*(id *)(a1 + 72) addObject:a2];
    }
    objc_msgSend(*(id *)(a1 + 64), "unlock", v17);
  }
  return a1 != 0;
}

- (uint64_t)addTransactionEntryLights:(uint64_t)a1 error:(void *)a2
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  [*(id *)(a1 + 64) lock];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [a2 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(a2);
        }
        if (!-[PFUbiquityTransactionHistoryCache addTransactionEntryLight:needsWrite:error:](a1, *(void **)(*((void *)&v17 + 1) + 8 * i), 1))
        {
          uint64_t v7 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v4 = [a2 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v7 = 1;
LABEL_12:
  [*(id *)(a1 + 64) unlock];
  if ((v7 & 1) == 0)
  {
    uint64_t v8 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityTransactionHistoryCache.m");
    uint64_t v15 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityTransactionHistoryCache.m";
      __int16 v23 = 1024;
      int v24 = 284;
      _os_log_fault_impl(&dword_18AB82000, v15, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }
  return v7;
}

id __57__PFUbiquityTransactionHistoryCache_writePendingEntries___block_invoke(uint64_t a1)
{
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "persistentStores"), "count"))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2) {
      id v3 = *(void **)(v2 + 8);
    }
    else {
      id v3 = 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v3 save:*(void *)(*(void *)(a1 + 64) + 8) + 40];
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      if (v4) {
        uint64_t v5 = *(void **)(v4 + 8);
      }
      else {
        uint64_t v5 = 0;
      }
      [v5 reset];
      -[PFUbiquityTransactionHistoryCache purgeCacheAndWritePendingEntries:error:](*(void *)(a1 + 48), 0);
      -[_PFUbiquityStack purgeAndInitializeMetadataStoreFileWithError:](*(void *)(a1 + 40), (void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);

  return v6;
}

- (BOOL)purgeCacheAndWritePendingEntries:(uint64_t)a1 error:(int)a2
{
  if (a1)
  {
    [*(id *)(a1 + 64) lock];

    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 48) = 0;

    *(void *)(a1 + 80) = [[PFUbiquityKnowledgeVector alloc] initWithKnowledgeVectorString:&stru_1ED787880];
    *(void *)(a1 + 88) = [[PFUbiquityKnowledgeVector alloc] initWithKnowledgeVectorString:&stru_1ED787880];
    uint64_t v4 = *(void **)(a1 + 72);
    if (a2)
    {
      if ([v4 count]) {
        BOOL v5 = *(unsigned char *)(a1 + 104) == 0;
      }
      else {
        BOOL v5 = 0;
      }
    }
    else
    {

      BOOL v5 = 0;
      *(void *)(a1 + 72) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    [*(id *)(a1 + 64) unlock];
    if (v5)
    {
      self;
      id v6 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, *(void *)(a1 + 24), *(void *)(a1 + 8));
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __76__PFUbiquityTransactionHistoryCache_purgeCacheAndWritePendingEntries_error___block_invoke;
      v8[3] = &unk_1E544B868;
      v8[4] = a1;
      -[PFUbiquitySwitchboardEntry executeBlockOnPrivateQueue:]((uint64_t)v6, (uint64_t)v8);
    }
    else
    {
      id v6 = 0;
    }
  }
  return a1 != 0;
}

void __76__PFUbiquityTransactionHistoryCache_purgeCacheAndWritePendingEntries_error___block_invoke(uint64_t a1)
{
  id v2 = 0;
  if (!-[PFUbiquityTransactionHistoryCache writePendingEntries:](*(void *)(a1 + 32), &v2))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError while writing pending transaction history entries to disk: %@\nuserInfo: %@", "-[PFUbiquityTransactionHistoryCache purgeCacheAndWritePendingEntries:error:]_block_invoke", 460, *(void *)(a1 + 32), v2, [v2 userInfo]);
    }
  }
}

- (uint64_t)cachedTransactionHistoryForGlobalID:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  [*(id *)(a1 + 64) lock];
  uint64_t v4 = [*(id *)(a1 + 56) objectForKey:a2];
  [*(id *)(a1 + 64) unlock];
  return v4;
}

@end