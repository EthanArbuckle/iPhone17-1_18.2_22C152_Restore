@interface PFUbiquityBaselineRecoveryOperation
- (BOOL)isEqual:(id)a3;
- (BOOL)resolveConflictsForBaseline:(void *)a3 withError:;
- (PFUbiquityBaselineRecoveryOperationDelegate)delegate;
- (PFUbiquityStoreMetadata)replaceLocalStoreWithBaseline:(uint64_t *)a3 error:;
- (id)retainedDelegate;
- (uint64_t)shouldReplaceLocalStoreWithBaseline:(uint64_t)a1;
- (void)main;
- (void)setDelegate:(id)a3;
@end

@implementation PFUbiquityBaselineRecoveryOperation

- (PFUbiquityBaselineRecoveryOperationDelegate)delegate
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineRecoveryOperation;
  return (PFUbiquityBaselineRecoveryOperationDelegate *)[(PFUbiquityImportOperation *)&v3 delegate];
}

- (void)setDelegate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineRecoveryOperation;
  [(PFUbiquityImportOperation *)&v3 setDelegate:a3];
}

- (id)retainedDelegate
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineRecoveryOperation;
  return [(PFUbiquityImportOperation *)&v3 retainedDelegate];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)PFUbiquityBaselineRecoveryOperation;
  return [(PFUbiquityBaselineRecoveryOperation *)&v6 isEqual:a3];
}

uint64_t __87__PFUbiquityBaselineRecoveryOperation_electBaselineURLFromVersions_withBaseline_error___block_invoke(void *a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
  uint64_t result = -[_PFZipFileArchive initWithPath:options:error:]([_PFZipFileArchive alloc], (void *)[a2 path], 0, *(void *)(a1[6] + 8) + 40);
  *(void *)(*(void *)(a1[5] + 8) + 40) = result;
  return result;
}

uint64_t __87__PFUbiquityBaselineRecoveryOperation_electBaselineURLFromVersions_withBaseline_error___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  uint64_t result = [*(id *)(a1 + 32) replaceItemAtURL:*(void *)(a1 + 40) options:0 error:*(void *)(*(void *)(a1 + 64) + 8) + 40];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result != 0;
  return result;
}

- (BOOL)resolveConflictsForBaseline:(void *)a3 withError:
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2020000000;
  char v70 = 1;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3052000000;
  v64 = __Block_byref_object_copy__59;
  v65 = __Block_byref_object_dispose__59;
  uint64_t v66 = 0;
  if (a2) {
    uint64_t v4 = *(void *)(a2 + 8);
  }
  else {
    uint64_t v4 = 0;
  }
  v51 = (void *)-[PFUbiquityLocation createFullURL](v4);
  obuint64_t j = (id)objc_msgSend(MEMORY[0x1E4F28CE8], "unresolvedConflictVersionsOfItemAtURL:");
  if ([obj count])
  {
    uint64_t v88 = 0;
    v89 = &v88;
    uint64_t v90 = 0x2020000000;
    char v91 = 1;
    id v87 = 0;
    uint64_t v81 = 0;
    v82 = &v81;
    uint64_t v83 = 0x3052000000;
    v84 = __Block_byref_object_copy__59;
    v85 = __Block_byref_object_dispose__59;
    uint64_t v86 = 0;
    v47 = v62;
    v55 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, *(void *)(a1 + 272), *(void *)(a1 + 248));
    uint64_t v77 = 0;
    v78 = &v77;
    uint64_t v79 = 0x2020000000;
    char v80 = 0;
    *(void *)v97 = 0;
    *(void *)&v97[8] = v97;
    *(void *)&v97[16] = 0x3052000000;
    v98 = __Block_byref_object_copy__59;
    v99 = __Block_byref_object_dispose__59;
    uint64_t v100 = 0;
    if (a2)
    {
      v5 = *(void **)(a2 + 96);
      if (v5) {
        v5 = (void *)v5[6];
      }
    }
    else
    {
      v5 = 0;
    }
    v53 = v5;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    uint64_t v6 = [obj countByEnumeratingWithState:&v73 objects:buf count:16];
    if (!v6) {
      goto LABEL_29;
    }
    uint64_t v7 = *(void *)v74;
    v49 = 0;
    char v50 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v74 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        id v10 = objc_alloc_init(MEMORY[0x1E4F28B28]);
        uint64_t v11 = [v9 URL];
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = __87__PFUbiquityBaselineRecoveryOperation_electBaselineURLFromVersions_withBaseline_error___block_invoke;
        v72[3] = &unk_1E544F7C8;
        v72[4] = &v77;
        v72[5] = &v81;
        v72[6] = v97;
        [v55 coordinateReadingItemAtURL:v11 options:1 error:&v87 byAccessor:v72];
        uint64_t v12 = v82[5];
        if (v12)
        {
          uint64_t v13 = +[PFUbiquityBaseline metadataFromBaselineArchive:]((uint64_t)PFUbiquityBaseline, v12);
          if (v13)
          {
            v14 = *(void **)(v13 + 48);
            if (v14)
            {
              if ((-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:]((id *)v53, (uint64_t)v14) & 1) == 0
                && ([v53 isEqual:v14] & 1) == 0
                && -[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:]((id *)v14, (uint64_t)v53))
              {

                v49 = v9;
                char v50 = 0;
                v53 = v14;
              }
            }
          }
        }
        else
        {
          *((unsigned char *)v89 + 24) = 0;
          if (*((unsigned char *)v78 + 24)) {
            id v87 = *(id *)(*(void *)&v97[8] + 40);
          }
        }
        if (!*((unsigned char *)v89 + 24)) {
          id v15 = v87;
        }
        [v10 drain];
        if (!*((unsigned char *)v89 + 24)) {
          id v16 = v87;
        }

        v82[5] = 0;
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v73 objects:buf count:16];
    }
    while (v6);
    if (!((*((unsigned char *)v89 + 24) == 0) | v50 & 1))
    {
      if (a2) {
        uint64_t v18 = *(void *)(a2 + 8);
      }
      else {
        uint64_t v18 = 0;
      }
      uint64_t v19 = -[PFUbiquityLocation createFullURL](v18);
      *((unsigned char *)v78 + 24) = 0;
      uint64_t v20 = *(void *)&v97[8];
      *(void *)(*(void *)&v97[8] + 40) = 0;
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __87__PFUbiquityBaselineRecoveryOperation_electBaselineURLFromVersions_withBaseline_error___block_invoke_2;
      v71[3] = &unk_1E544FA48;
      v71[6] = &v77;
      v71[7] = &v88;
      v71[4] = v49;
      v71[5] = v19;
      v71[8] = v97;
      [v55 coordinateWritingItemAtURL:v19 options:8 error:v20 + 40 byAccessor:v71];
      if (!*((unsigned char *)v89 + 24) && *((unsigned char *)v78 + 24)) {
        id v87 = *(id *)(*(void *)&v97[8] + 40);
      }
      v17 = (void *)v19;
    }
    else
    {
LABEL_29:
      v17 = 0;
    }

    _Block_object_dispose(v97, 8);
    _Block_object_dispose(&v77, 8);
    if (!*((unsigned char *)v89 + 24))
    {
      if (v87)
      {
        v47[5] = (uint64_t)v87;
      }
      else
      {
        uint64_t v21 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaselineRecoveryOperation.m");
        v28 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v97 = 136315394;
          *(void *)&v97[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/P"
                               "FUbiquityBaselineRecoveryOperation.m";
          *(_WORD *)&v97[12] = 1024;
          *(_DWORD *)&v97[14] = 258;
          _os_log_fault_impl(&dword_18AB82000, v28, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v97, 0x12u);
        }
      }
    }

    int v29 = *((unsigned __int8 *)v89 + 24);
    _Block_object_dispose(&v81, 8);
    _Block_object_dispose(&v88, 8);
    *((unsigned char *)v68 + 24) = v29;
    if (v29)
    {
      v30 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, *(void *)(a1 + 272), *(void *)(a1 + 248));
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      uint64_t v31 = [obj countByEnumeratingWithState:&v57 objects:v92 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v58;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v58 != v32) {
              objc_enumerationMutation(obj);
            }
            v34 = *(void **)(*((void *)&v57 + 1) + 8 * j);
            [v34 setResolved:1];
            v35 = v62;
            v62[5] = 0;
            v56[0] = MEMORY[0x1E4F143A8];
            v56[1] = 3221225472;
            v56[2] = __77__PFUbiquityBaselineRecoveryOperation_resolveConflictsForBaseline_withError___block_invoke;
            v56[3] = &unk_1E544FA70;
            v56[4] = v34;
            v56[5] = a1;
            v56[6] = &v61;
            v56[7] = &v67;
            [v30 coordinateWritingItemAtURL:v51 options:0 error:v35 + 5 byAccessor:v56];
          }
          uint64_t v31 = [obj countByEnumeratingWithState:&v57 objects:v92 count:16];
        }
        while (v31);
      }
    }
  }

  if (!*((unsigned char *)v68 + 24))
  {
    uint64_t v38 = v62[5];
    if (v38)
    {
      if (a3) {
        *a3 = v38;
      }
    }
    else
    {
      uint64_t v39 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v39, v40, v41, v42, v43, v44, v45, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaselineRecoveryOperation.m");
      v46 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v94 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline"
              "RecoveryOperation.m";
        __int16 v95 = 1024;
        int v96 = 306;
        _os_log_fault_impl(&dword_18AB82000, v46, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  BOOL v36 = *((unsigned char *)v68 + 24) != 0;
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v67, 8);
  return v36;
}

void __77__PFUbiquityBaselineRecoveryOperation_resolveConflictsForBaseline_withError___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) removeAndReturnError:*(void *)(*(void *)(a1 + 48) + 8) + 40] & 1) == 0)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError removing version: %@\nError: %@\nuserInfo: %@\n", "-[PFUbiquityBaselineRecoveryOperation resolveConflictsForBaseline:withError:]_block_invoke", 293, *(void *)(a1 + 40), *(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) userInfo]);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

- (uint64_t)shouldReplaceLocalStoreWithBaseline:(uint64_t)a1
{
  uint64_t v2 = a1;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return v2;
  }
  self;
  uint64_t v4 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, *(void **)(v2 + 248), *(void **)(v2 + 256), *(void **)(v2 + 272), 0);
  if (!a2)
  {
    v5 = 0;
    if (v4) {
      goto LABEL_4;
    }
LABEL_34:
    id v6 = 0;
    goto LABEL_5;
  }
  v5 = *(void **)(a2 + 120);
  if (!v4) {
    goto LABEL_34;
  }
LABEL_4:
  id v6 = v4[1];
LABEL_5:
  if (!+[PFUbiquityStoreMetadata metadataForStoreWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, v5, v6))
  {

    return 1;
  }
  uint64_t v7 = -[_PFUbiquityStack createMetadataStoreKnowledgeVector:]((uint64_t)v4, 0);
  if (a2 && (uint64_t v8 = *(void *)(a2 + 96)) != 0) {
    uint64_t v9 = *(void *)(v8 + 48);
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = (id *)-[PFUbiquityKnowledgeVector newKnowledgeVectorBySubtractingVector:](v9, (uint64_t)v7);
  uint64_t v11 = (void *)[objc_alloc(NSNumber) initWithInteger:0];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  if (v10) {
    uint64_t v12 = (void *)[v10[1] allKeys];
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v13)
  {
    uint64_t v2 = 1;
    goto LABEL_31;
  }
  uint64_t v14 = v13;
  uint64_t v21 = v7;
  uint64_t v22 = v4;
  uint64_t v15 = *(void *)v24;
LABEL_13:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v24 != v15) {
      objc_enumerationMutation(v12);
    }
    v17 = *(void **)(*((void *)&v23 + 1) + 8 * v16);
    if (v10) {
      uint64_t v18 = (void *)[v10[1] objectForKey:*(void *)(*((void *)&v23 + 1) + 8 * v16)];
    }
    else {
      uint64_t v18 = 0;
    }
    if (objc_msgSend(v17, "isEqualToString:", *(void *)(v2 + 248), v21, v22, (void)v23))
    {
      if (([v18 isEqualToNumber:v11] & 1) == 0) {
        break;
      }
      goto LABEL_22;
    }
    if ([v11 compare:v18] == 1) {
      break;
    }
LABEL_22:
    if (v14 == ++v16)
    {
      uint64_t v19 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      uint64_t v14 = v19;
      if (!v19)
      {
        uint64_t v2 = 1;
        goto LABEL_28;
      }
      goto LABEL_13;
    }
  }
  uint64_t v2 = 0;
LABEL_28:
  uint64_t v7 = v21;
  uint64_t v4 = v22;
LABEL_31:

  return v2;
}

- (PFUbiquityStoreMetadata)replaceLocalStoreWithBaseline:(uint64_t *)a3 error:
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  self;
  id v6 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, *(void *)(a1 + 256), *(void *)(a1 + 248));
  id v7 = -[PFUbiquitySwitchboardEntry createSetOfPersistentStoreCoordinatorsRegisteredForStoreName:]((uint64_t)v6, *(void *)(a1 + 256));

  if ([v7 count])
  {
    uint64_t v8 = (NSPersistentStoreCoordinator *)(id)[v7 anyObject];
    goto LABEL_6;
  }
  id v9 = -[PFUbiquityBaseline createManagedObjectModel](a2);
  if (v9)
  {
    id v10 = v9;
    uint64_t v8 = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:v9];

LABEL_6:
    self;
    uint64_t v11 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, *(void **)(a1 + 248), *(void **)(a1 + 256), *(void **)(a1 + 272), 0);
    if (v11) {
      id v12 = v11[1];
    }
    else {
      id v12 = 0;
    }
    uint64_t v13 = +[PFUbiquityStoreMetadata metadataForStoreWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, *(void **)(a1 + 256), v12);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v14 = [(NSPersistentStoreCoordinator *)v8 persistentStores];
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      id v44 = v7;
      uint64_t v45 = v8;
      uint64_t v42 = a2;
      uint64_t v43 = a3;
      v17 = 0;
      uint64_t v18 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v47 != v18) {
            objc_enumerationMutation(v14);
          }
          uint64_t v20 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "options"), "objectForKey:", @"NSPersistentStoreUbiquitousContentNameKey"), "isEqualToString:", *(void *)(a1 + 256)))v17 = v20; {
        }
          }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v46 objects:v50 count:16];
      }
      while (v16);
      if (!v17)
      {
        long long v24 = 0;
        id v7 = v44;
        uint64_t v8 = v45;
LABEL_41:

        return v24;
      }
      id v7 = v44;
      uint64_t v8 = v45;
      if (!v13)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\n Got nil store metadata for store named: %@", "-[PFUbiquityBaselineRecoveryOperation replaceLocalStoreWithBaseline:error:]", 400, a1, *(void *)(a1 + 256));
        }
        id v21 = v11 ? v11[1] : 0;
        if ([v21 persistentStoreCoordinator])
        {
          uint64_t v22 = [PFUbiquityStoreMetadata alloc];
          id v23 = v11 ? v11[1] : 0;
          long long v24 = [(PFUbiquityStoreMetadata *)v22 initWithUbiquityName:*(void *)(a1 + 256) andUbiquityRootLocation:*(void *)(a1 + 272) insertIntoManagedObjectContext:v23];
        }
        else
        {
          long long v24 = 0;
        }
        -[PFUbiquityStoreMetadata updateWithStore:andRootLocation:](v24, v17, *(void *)(a1 + 272));

        if (!v24) {
          goto LABEL_41;
        }
      }
      uint64_t v37 = [v17 URL];
      uint64_t v38 = [v17 type];
      uint64_t v39 = [v17 options];
      uint64_t v40 = v38;
      uint64_t v8 = v45;
      if (-[PFUbiquityBaseline replaceLocalPersistentStoreAtURL:ofType:withOptions:usingPersistentStoreCoordinator:error:](v42, v37, v40, v39, v45, v43))
      {
        long long v24 = (PFUbiquityStoreMetadata *)+[PFUbiquityBaseline removePeerSpecificIdentifiersFromStore:withLocalPeerID:]((uint64_t)PFUbiquityBaseline, v17, *(void *)(a1 + 248));
        goto LABEL_41;
      }
    }
    long long v24 = 0;
    goto LABEL_41;
  }

  long long v25 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v26 = *MEMORY[0x1E4F281F8];
  uint64_t v27 = (void *)MEMORY[0x1E4F1C9E8];
  if (!a2) {
    a2 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v28 = objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 134308, objc_msgSend(v27, "dictionaryWithObject:forKey:", a2, @"offendingBaseline"));
  if (!v28)
  {
    uint64_t v29 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v29, v30, v31, v32, v33, v34, v35, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaselineRecoveryOperation.m");
    BOOL v36 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaselineRe"
            "coveryOperation.m";
      __int16 v53 = 1024;
      int v54 = 378;
      _os_log_fault_impl(&dword_18AB82000, v36, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    return 0;
  }
  if (!a3) {
    return 0;
  }
  long long v24 = 0;
  *a3 = v28;
  return v24;
}

- (void)main
{
  if (([(PFUbiquityBaselineRecoveryOperation *)self isCancelled] & 1) == 0)
  {
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
    id v55 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)storeName, (uint64_t)localPeerID);
    if (!v55)
    {
      int v54 = 0;
      uint64_t v18 = 0;
LABEL_32:

      return;
    }
    v5 = [PFUbiquityBaseline alloc];
    if (self)
    {
      id v6 = self->super.super._localPeerID;
      ubiquityRootLocation = self->super.super._ubiquityRootLocation;
      uint64_t v8 = self->super.super._storeName;
      model = self->super._model;
    }
    else
    {
      uint64_t v8 = 0;
      id v6 = 0;
      ubiquityRootLocation = 0;
      model = 0;
    }
    int v54 = [(PFUbiquityBaseline *)v5 initWithLocalPeerID:v6 ubiquityRootLocation:ubiquityRootLocation forStoreWithName:v8 andManagedObjectModel:model];
    int v53 = -[PFUbiquitySafeSaveFile existsInCloud](v54);
    if (self)
    {
      id v10 = +[PFUbiquityLocation createCurrentBaselineLocation:forStoreName:peerID:andModelVersionHash:forFileNamed:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 7, (uint64_t)self->super.super._storeName, (uint64_t)self->super.super._localPeerID, (uint64_t)self->super._modelVersionHash, @"baseline.meta", self->super.super._ubiquityRootLocation);
      uint64_t v11 = -[PFUbiquityLocation createFullPath]((uint64_t)v10);
      id v12 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
      if ([v12 fileExistsAtPath:v11])
      {
        uint64_t v13 = +[PFUbiquityLocation createCurrentBaselineLocation:forStoreName:peerID:andModelVersionHash:forFileNamed:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 7, (uint64_t)self->super.super._storeName, (uint64_t)self->super.super._localPeerID, (uint64_t)self->super._modelVersionHash, @"baseline.meta", self->super.super._ubiquityRootLocation);
        uint64_t v14 = -[PFUbiquityLocation createFullPath]((uint64_t)v13);
        if ([v12 fileExistsAtPath:v14])
        {
          uint64_t v15 = +[PFUbiquityLocation createCurrentBaselineLocation:forStoreName:peerID:andModelVersionHash:forFileNamed:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 7, (uint64_t)self->super.super._storeName, (uint64_t)self->super.super._localPeerID, (uint64_t)self->super._modelVersionHash, @"baseline.meta", self->super.super._ubiquityRootLocation);
          uint64_t v16 = -[PFUbiquityLocation createFullPath]((uint64_t)v15);
          int v17 = [v12 fileExistsAtPath:v16];
        }
        else
        {
          int v17 = 0;
        }
      }
      else
      {
        int v17 = 0;
      }
    }
    else
    {
      int v17 = 0;
    }
    id v56 = 0;
    if (!v53)
    {
LABEL_31:
      uint64_t v18 = v55;
      goto LABEL_32;
    }
    int v19 = -[PFUbiquitySafeSaveFile downloadLatestVersion:error:]((uint64_t)v54, 1, (uint64_t *)&v56);
    if (v54) {
      int v20 = v19;
    }
    else {
      int v20 = 0;
    }
    if (v20 != 1 || ![v54 loadFileFromLocation:v54[3] error:&v56])
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError trying to load the baseline archive: %@\nuserInfo: %@", "-[PFUbiquityBaselineRecoveryOperation main]", 454, self, v56, [v56 userInfo]);
      }
      goto LABEL_31;
    }
    if (self)
    {
      id v21 = (void *)-[PFUbiquityLocation createFullURL](v54[1]);
      uint64_t v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CE8], "unresolvedConflictVersionsOfItemAtURL:", v21), "count");

      if (v22)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Found conflicts for baseline: %@", "-[PFUbiquityBaselineRecoveryOperation main]", 461, v54);
        }
        if (-[PFUbiquityBaselineRecoveryOperation resolveConflictsForBaseline:withError:]((uint64_t)self, (uint64_t)v54, &v56))
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Successfully resolved conflicts for baseline: %@", "-[PFUbiquityBaselineRecoveryOperation main]", 463, v54);
          }
        }
        else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
        {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Unable to resolve conflicts for baseline: %@, the baseline will not be adopted.\n%@", "-[PFUbiquityBaselineRecoveryOperation main]", 465, v54, v56);
        }
        goto LABEL_31;
      }
      if (v17)
      {
LABEL_35:
        if ([(PFUbiquityBaselineRecoveryOperation *)self isCancelled]) {
          goto LABEL_31;
        }
        if (self)
        {
          id v23 = &OBJC_IVAR___NSSQLCore__historyTrackingOptions;
          long long v24 = self->super.super._localPeerID;
        }
        else
        {
          long long v24 = 0;
          id v23 = &OBJC_IVAR___NSSQLCore__historyTrackingOptions;
        }
        uint64_t v25 = v54[1];
        if (v25 && *(_DWORD *)(v25 + 24) != 1) {
          uint64_t v25 = *(void *)(v25 + 8);
        }
        uint64_t v26 = (void *)+[PFUbiquityBaseline metadataFromCurrentBaselineForStoreWithName:peerID:modelVersionHash:andUbiquityRootLocation:withError:]((uint64_t)PFUbiquityBaseline, v54[15], (uint64_t)v24, v54[16], (void *)v25);
        if (!v26)
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nCurrent baseline directory exists however an error was encountered while trying to read the current metadata: %@\nuserInfo: %@\nWill attempt to adopt the existing baseline.", "-[PFUbiquityBaselineRecoveryOperation main]", 476, self, v56, [v56 userInfo]);
          }
          if (-[PFUbiquityBaseline makeCurrentBaselineWithError:]((uint64_t)v54, &v56))
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:2])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nAdopted older baseline: %@\n", "-[PFUbiquityBaselineRecoveryOperation main]", 480, self, v54);
            }
          }
          else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
          {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to adopt older baseline: %@\nError: %@\nuserInfo: %@\n", "-[PFUbiquityBaselineRecoveryOperation main]", 482, self, v54, v56, [v56 userInfo]);
          }
        }
        uint64_t v27 = v23;
        uint64_t v28 = v54[12];
        if ([v26 isEqual:v28]) {
          goto LABEL_31;
        }
        if (v26)
        {
          uint64_t v29 = (id *)v26[6];
          if (v28)
          {
LABEL_45:
            uint64_t v30 = *(id **)(v28 + 48);
            goto LABEL_46;
          }
        }
        else
        {
          uint64_t v29 = 0;
          if (v28) {
            goto LABEL_45;
          }
        }
        uint64_t v30 = 0;
LABEL_46:
        if (-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](v29, (uint64_t)v30))
        {
          if (-[PFUbiquityBaselineRecoveryOperation shouldReplaceLocalStoreWithBaseline:]((uint64_t)self, (uint64_t)v54))
          {
            if (-[PFUbiquityBaselineRecoveryOperation replaceLocalStoreWithBaseline:error:]((uint64_t)self, (uint64_t)v54, (uint64_t *)&v56))
            {
              if (self)
              {
                store = self->super.super._store;
                uint64_t v32 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v27[1011]);
              }
              else
              {
                store = 0;
                uint64_t v32 = 0;
              }
              +[PFUbiquityBaseline removePeerSpecificIdentifiersFromStore:withLocalPeerID:]((uint64_t)PFUbiquityBaseline, store, v32);
              id v33 = [(PFUbiquityBaselineRecoveryOperation *)self retainedDelegate];
              uint64_t v34 = v33;
              if (v33) {
                [v33 recoveryOperation:self didReplaceLocalStoreFileWithBaseline:v54];
              }
            }
            else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nEncountered an error trying to replace the local store file with a baseline: %@\nError: %@\nuserInfo: %@", "-[PFUbiquityBaselineRecoveryOperation main]", 506, self, v54, v56, [v56 userInfo]);
            }
          }
          if (-[PFUbiquityBaseline makeCurrentBaselineWithError:]((uint64_t)v54, &v56))
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:2])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nAdopted older baseline: %@\n", "-[PFUbiquityBaselineRecoveryOperation main]", 512, self, v54);
            }
          }
          else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
          {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to adopt older baseline: %@\nError: %@\nuserInfo: %@\n", "-[PFUbiquityBaselineRecoveryOperation main]", 514, self, v54, v56, [v56 userInfo]);
          }
        }
        else if (-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](v30, (uint64_t)v29))
        {
          if (self) {
            uint64_t v43 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v27[1011]);
          }
          else {
            uint64_t v43 = 0;
          }
          id v44 = +[PFUbiquityLocation createPeerBaselineFileLocationForLocalPeerID:andBaselineFileLocation:]((uint64_t)PFUbiquityLocation, v43, (void *)v54[1]);
          uint64_t v45 = [PFUbiquityBaseline alloc];
          if (self) {
            uint64_t v46 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v27[1011]);
          }
          else {
            uint64_t v46 = 0;
          }
          uint64_t v47 = [(PFUbiquityBaseline *)v45 initWithBaselineLocation:v44 andLocalPeerID:v46];
          long long v48 = (void *)v47;
          if (v47
            && -[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:](*(void *)(v47 + 16), *(void *)(v47 + 32), 0))
          {
            if ([v48 loadFileFromLocation:v48[2] error:&v56])
            {
              uint64_t v49 = v48[12];
              if (v49) {
                char v50 = *(void **)(v49 + 48);
              }
              else {
                char v50 = 0;
              }
              if ([v50 isEqual:v29]
                && (-[PFUbiquitySafeSaveFile safeSaveFile:moveToPermanentLocation:error:]((uint64_t)v48, 0, 1, &v56) & 1) == 0
                && +[PFUbiquityLogging canLogMessageAtLevel:2])
              {
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Unable to safe save peer baseline file: %@\nError: %@\nuserInfo: %@", "-[PFUbiquityBaselineRecoveryOperation main]", 525, v48, v56, [v56 userInfo]);
              }
            }
            else if (+[PFUbiquityLogging canLogMessageAtLevel:2])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error trying to read peer baseline file: %@", "-[PFUbiquityBaselineRecoveryOperation main]", 529, v48);
            }
          }
          else if (-[PFUbiquitySafeSaveFile downloadLatestVersion:error:]((uint64_t)v54, 1, (uint64_t *)&v56)&& [v54 loadFileFromLocation:v54[3] error:&v56])
          {
            uint64_t v51 = v54[12];
            v52 = v51 ? *(void **)(v51 + 48) : 0;
            if (([v52 isEqual:v29] & 1) == 0)
            {
              if (-[PFUbiquityBaseline makeCurrentBaselineWithError:]((uint64_t)v54, &v56))
              {
                if (+[PFUbiquityLogging canLogMessageAtLevel:2])
                {
                  NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nAdopted older baseline: %@\n", "-[PFUbiquityBaselineRecoveryOperation main]", 541, self, v54);
                }
              }
              else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
              {
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to adopt older baseline: %@\nError: %@\nuserInfo: %@\n", "-[PFUbiquityBaselineRecoveryOperation main]", 543, self, v54, v56, [v56 userInfo]);
              }
            }
          }
        }
        goto LABEL_31;
      }
      uint64_t v35 = v54;
      uint64_t v36 = v54[15];
      uint64_t v37 = self->super.super._localPeerID;
    }
    else
    {
      if (v17) {
        goto LABEL_35;
      }
      uint64_t v37 = 0;
      uint64_t v35 = v54;
      uint64_t v36 = v54[15];
    }
    uint64_t v38 = v35[1];
    if (v38 && *(_DWORD *)(v38 + 24) != 1) {
      uint64_t v38 = *(void *)(v38 + 8);
    }
    uint64_t v39 = +[PFUbiquityBaseline metadataFromCurrentBaselineForStoreWithName:peerID:modelVersionHash:andUbiquityRootLocation:withError:]((uint64_t)PFUbiquityBaseline, v36, (uint64_t)v37, v35[16], (void *)v38);
    if (v39)
    {
      uint64_t v40 = *(void *)(v39 + 48);
      uint64_t v41 = v54[12];
      if (v41) {
        uint64_t v42 = *(id **)(v41 + 48);
      }
      else {
        uint64_t v42 = 0;
      }
      if (-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](v42, v40))
      {
        if (-[PFUbiquityBaseline makeCurrentBaselineWithError:]((uint64_t)v54, &v56))
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nAdopted older baseline: %@\n", "-[PFUbiquityBaselineRecoveryOperation main]", 573, self, v54);
          }
        }
        else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
        {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to adopt older baseline: %@\nError: %@\nuserInfo: %@\n", "-[PFUbiquityBaselineRecoveryOperation main]", 575, self, v54, v56, [v56 userInfo]);
        }
      }
    }
    else
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nGot nil for current baseline metadata, %@\nuserInfo: %@", "-[PFUbiquityBaselineRecoveryOperation main]", 557, self, v56, [v56 userInfo]);
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nWill attempt to adopt existing baseline: %@.", "-[PFUbiquityBaselineRecoveryOperation main]", 558, self, v54);
      }
      id v56 = 0;
      if (-[PFUbiquityBaseline makeCurrentBaselineWithError:]((uint64_t)v54, &v56))
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nAdopted older baseline: %@\n", "-[PFUbiquityBaselineRecoveryOperation main]", 563, self, v54);
        }
      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
      {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to adopt older baseline: %@\nError: %@\nuserInfo: %@\n", "-[PFUbiquityBaselineRecoveryOperation main]", 565, self, v54, v56, [v56 userInfo]);
      }
    }
    goto LABEL_31;
  }
}

@end